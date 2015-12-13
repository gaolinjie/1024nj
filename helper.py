#!/usr/bin/env python
# coding=utf-8
#
# Copyright 2014 avati

import json
import re

from lib.variables import *
from lib.superjson import dumps
from jinja2 import evalcontextfilter, Markup, escape
from markdown import markdown

class Filters():
    def __init__(self, jinja2_env):
        self.jinja2 = jinja2_env

    def register(self):
        self.jinja2.filters["dump_errors"] = self.dump_errors
        self.jinja2.filters["pagination"] = self.pagination
        self.jinja2.filters["nl2br"] = self.nl2br
        self.jinja2.filters["build_uri"] = build_uri
        #self.jinja2.filters["tojson"] = json.JSONEncoder().encode
        self.jinja2.filters["tojson"] = dumps
        self.jinja2.filters["pretty_date"] = self.pretty_date
        self.jinja2.filters["get_weekday"] = self.get_weekday
        self.jinja2.filters["desktop_content_process"] = self.desktop_content_process
        self.jinja2.filters["mobile_content_process"] = self.mobile_content_process
        self.jinja2.filters["index_content_process"] = self.index_content_process
        self.jinja2.filters["mobile_index_process"] = self.mobile_index_process
        self.jinja2.filters["reply_process"] = self.reply_process
        self.jinja2.filters["markdown"] = self.markdown
        return self.jinja2

    def dump_errors(self, errors):
        t = self.jinja2.from_string("""
            {% if errors %}
            <ul class="errors alert alert-error">
                {% for error in errors %}
                    <li>{{ ','.join(errors[error]) }}</li>
                {% endfor %}
            </ul>
            {% endif %}
            """)

        return t.render(errors = errors)

    def pagination(self, page, uri, list_rows = 10):
        def gen_page_list(current_page = 1, total_page = 1, list_rows = 10):
            if(total_page <= list_rows):
                return range(1, total_page + 1)

            if(current_page + list_rows > total_page):
                return range(total_page - list_rows + 1, list_rows + 1)

            return range(current_page, list_rows + 1)

        t = self.jinja2.from_string("""
            {% if page and not page.pages == 1 %}
                
                    <li class="previous {% if page.current == page.prev %}disabled{% endif %}" >
                    {% if not page.current == page.prev %}
                                <a href="{{ uri|build_uri('p', page.prev) }}">&larr; 上一页</a>
                            {% else %}
                                <a href="javascript:;">&larr; 上一页</a>
                            {% endif %}
                    </li>

                    <li class="next {% if page.current == page.next %}disabled{% endif %}" >
                    {% if not page.current == page.next %}
                                <a href="{{ uri|build_uri('p', page.next) }}">下一页 &rarr;</a>
                            {% else %}
                                <a href="javascript:;">下一页 &rarr;</a>
                            {% endif %}
                    </li>
                
            {% endif %}
            """)

        return t.render(page = page, uri = uri, gen_page_list = gen_page_list, list_rows = list_rows)

    @evalcontextfilter
    def nl2br(self, eval_ctx, value):
        _paragraph_re = re.compile(r'(?:\r\n|\r|\n){2,}')
        result = u'\n\n'.join(u'<p>%s</p>' % p.replace('\n', '<br>\n') for p in _paragraph_re.split(escape(value)))
        if eval_ctx.autoescape:
            result = Markup(result)
        return result

    def pretty_date(self, time = False):
        """
        Get a datetime object or a int() Epoch timestamp and return a
        pretty string like 'an hour ago', 'Yesterday', '3 months ago',
        'just now', etc
        """
        if time == None:
            return time

        from datetime import datetime
        now = datetime.now()
        if type(time) is str or type(time) is unicode:
            time = datetime.strptime(time, '%Y-%m-%d %H:%M:%S')
        elif type(time) is int:
            diff = now - datetime.fromtimestamp(time)
        elif isinstance(time, datetime):
            diff = now - time 
        elif not time:
            diff = now - now
        second_diff = diff.seconds
        day_diff = diff.days

        if day_diff < 0:
            return ''

        if day_diff == 0:
            if second_diff < 10:
                return "刚刚"
            if second_diff < 60:
                return str(second_diff) + " 秒前"
            if second_diff < 120:
                return  "1 分钟前"
            if second_diff < 3600:
                return str(second_diff / 60) + " 分钟前"
            if second_diff < 7200:
                return "1 小时前"
            if second_diff < 86400:
                return str(second_diff / 3600) + " 小时前"
        if day_diff == 1:
            return "昨天"
        if day_diff < 7:
            return str(day_diff) + " 天前"
        if day_diff < 31:
            return str(day_diff / 7) + " 周前"
        if day_diff < 365:
            return str(day_diff / 30) + " 月前"
        return str(day_diff / 365) + " 天前"

    def get_weekday(self, time = False):
        if time == None:
            return time

        from datetime import datetime
        i = time.weekday()
        week = ''
        if i == 0:
            week = '星期一'
        if i == 1:
            week = '星期二'
        if i == 2:
            week = '星期三'
        if i == 3:
            week = '星期四'
        if i == 4:
            week = '星期五'
        if i == 5:
            week = '星期六'
        if i == 6:
            week = '星期日'
        
        return week

    def index_content_process(self, content):
        if None==content:
            return
        # render content included gist
        #content = re.sub(r'http(s)?:\/\/gist.github.com\/(\d+)(.js)?', r'<script src="http://gist.github.com/\2.js"></script>', content)
        # render sinaimg pictures
        content = re.sub(r'src="(http://mmm-cdn.qiniudn.com/\S+\.(png|gif|jpg|jpeg))(-post|)"', r'class="mmm-img" src="\1-index2"', content)
        #content = re.sub(r'<iframe(.*)src="//player.youku.com/embed/(\w+)"(.*)></iframe>', r'<a class="mmm-link video-link tipped_ajax_youku" data-tipped="/get/youku/\2" href="javascript:;" data-video="\2"></a>', content)
        content = re.sub(r'([a-zA-z]+://[^\s]*.taobao.com[^\s]*)(\s*)(\&nbsp;*)', r'<a class="mmm-link taobao-link" href="\1" target="_blank"></a>', content)
        content = re.sub(r'([a-zA-z]+://[^\s]*.tmall.com[^\s]*)(\s*)(\&nbsp;*)', r'<a class="mmm-link tmall-link" href="\1" target="_blank"></a>', content)
        content = re.sub(r'([a-zA-z]+://[^\s]*)(\s*)(\&nbsp;*)', r'<a class="mmm-link web-link" href="\1" target="_blank"></a>', content)
        # render @ mention links
        content = re.sub(ur'@(?!_)(?!.*?_$)(?!\d+)([a-zA-Z0-9_\u4e00-\u9fa5]+)(\s|)', r'<a href="/u/\1"  class="tipped_ajax_user" data-tipped="/get/user/\1">@\1</a> ', content)
        return content

    def mobile_index_process(self, content):
        if None==content:
            return
        # render content included gist
        #content = re.sub(r'http(s)?:\/\/gist.github.com\/(\d+)(.js)?', r'<script src="http://gist.github.com/\2.js"></script>', content)
        # render sinaimg pictures
        content = re.sub(r'src="(http://mmm-cdn.qiniudn.com/\S+\.(png|gif|jpg|jpeg))(-post|)"', r'class="mmm-img" src="\1-index"', content)
        content = re.sub(r'<iframe(.*)src="//player.youku.com/embed/(\w+)"(.*)></iframe>', r'<a class="mmm-link video-link tipped_ajax_youku" data-tipped="/get/youku/\2" href="javascript:;" data-video="\2"></a>', content)
        content = re.sub(r'([a-zA-z]+://[^\s]*.taobao.com[^\s]*)(\s*)(\&nbsp;*)', r'<a class="mmm-link taobao-link" href="\1" target="_blank"></a>', content)
        content = re.sub(r'([a-zA-z]+://[^\s]*.tmall.com[^\s]*)(\s*)(\&nbsp;*)', r'<a class="mmm-link tmall-link" href="\1" target="_blank"></a>', content)
        content = re.sub(r'([a-zA-z]+://[^\s]*)(\s*)(\&nbsp;*)', r'<a class="mmm-link web-link" href="\1" target="_blank"></a>', content)
        # render @ mention links
        content = re.sub(ur'@(?!_)(?!.*?_$)(?!\d+)([a-zA-Z0-9_\u4e00-\u9fa5]+)(\s|)', r'<a href="/u/\1"  class="tipped_ajax_user" data-tipped="/get/user/\1">@\1</a> ', content)
        return content

    def desktop_content_process(self, content):
        if None==content:
            return
        content = re.sub(r'src="(http://mmm-cdn.qiniudn.com/\S+\.(png|gif|jpg|jpeg))"', r'src="\1-post"', content)
        #content = re.sub(r'<iframe(.*)src="//player.youku.com/embed/(\w+)"(.*)></iframe>', r'<a class="mmm-link video-link tipped_ajax_youku" data-tipped="/get/youku/\2" href="javascript:;" data-video="\2"></a>', content)
        content = re.sub(r'([a-zA-z]+://[^\s]*.taobao.com[^\s]*)(\s*)(\&nbsp;*)', r'<a class="mmm-link taobao-link" href="\1" target="_blank"></a>', content)
        content = re.sub(r'([a-zA-z]+://[^\s]*.tmall.com[^\s]*)(\s*)(\&nbsp;*)', r'<a class="mmm-link tmall-link" href="\1" target="_blank"></a>', content)
        content = re.sub(r'([a-zA-z]+://[^\s]*)(\s*)(\&nbsp;*)', r'<a class="mmm-link web-link" href="\1" target="_blank"></a>', content)
        # render @ mention links
        content = re.sub(ur'@(?!_)(?!.*?_$)(?!\d+)([a-zA-Z0-9_\u4e00-\u9fa5]+)(\s|)', r'<a href="/u/\1"  class="tipped_ajax_user" data-tipped="/get/user/\1">@\1</a> ', content)
        return content

    def mobile_content_process(self, content):
        if None==content:
            return
        # render content included gist
        #content = re.sub(r'http(s)?:\/\/gist.github.com\/(\d+)(.js)?', r'<script src="http://gist.github.com/\2.js"></script>', content)
        # render sinaimg pictures
        # content = re.sub(r'(http:\/\/\w+.sinaimg.cn\/.*?\.(jpg|gif|png))', r'<img src="\1" />', content)
        # render all pictures
        #content = re.sub(r'(http(s)?:\/\/\w+.*\/.*?\.(jpg|gif|png))', r'<img src="\1" />', content)
        # render all links
        #content = re.sub(r'([a-zA-z]+://[^\s]*)', r'<a href="\1" target="_blank">\1</a>', content)
        # render @ mention links
        #content = re.sub(ur'@(?!_)(?!.*?_$)(?!\d+)([a-zA-Z0-9_\u4e00-\u9fa5]+)(\s|)', r'<a href="/u/\1">@\1</a> ', content)
        # render youku videos
        content = re.sub(r'src="(http:\/\/mrtgimg.qiniudn.com\/.\w+)"', r'src="\1-mobile"', content)
        content = re.sub(r'<embed(.*)src="http://player.youku.com/player.php/sid/(\w+)/v.swf"(.*)>', r'<iframe width="100%" height="" frameborder="0" src="http://player.youku.com/embed/\2" allowfullscreen=""></iframe>', content)
        return content

    def reply_process(self, content):
        if None==content:
            return
        # render content included gist
        content = re.sub(r'http(s)?:\/\/gist.github.com\/(\d+)(.js)?', r'<script src="http://gist.github.com/\2.js"></script>', content)
        # render all pictures
        content = re.sub(r'(http(s)?:\/\/\w+.*\/.*?\.(jpg|gif|png))', r'<img src="\1" />', content)
        # render all links
        content = re.sub(r'([a-zA-z]+://[^\s]*)', r'<a href="\1" target="_blank">\1</a>', content)
        # render @ mention links
        content = re.sub(ur'@(?!_)(?!.*?_$)(?!\d+)([a-zA-Z0-9_\u4e00-\u9fa5]+)(\s|)', r'<a href="/u/\1">@\1</a> ', content)
        # render youku videos
        #content = re.sub(r'http://v.youku.com/v_show/id_(\w+).html', r'<embed src="http://player.youku.com/player.php/sid/\1/v.swf" quality="high" width="593" height="375" align="middle" allowScriptAccess="sameDomain" allowFullscreen="true" type="application/x-shockwave-flash"></embed>', content)
        return content

    def markdown(self, content):
        if not content:
            return ""
        return markdown(content, extensions = ['codehilite', 'fenced_code', 'mathjax'], safe_mode = 'escape')


    
