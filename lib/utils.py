#!/usr/bin/env python
# coding=utf-8
#
# Copyright 2014 1024nj

import re

def find_mentions(content):
    regex = re.compile(ur"@(?P<username>(?!_)(?!.*?_$)(?!\d+)([a-zA-Z0-9_\u4e00-\u9fa5]+))(\s|$)", re.I)
    return [m.group("username") for m in regex.finditer(content)]

def  r1(pattern, text):
    m = re.search(pattern, text)
    if m:
        return m.group(1)

def r1_of(patterns, text):
    for p in patterns:
        x = r1(p, text)
        if x:
            return x

def find_video_id_from_url(url):
    patterns = [r'^http://v.youku.com/v_show/id_([\w=]+).html',
                r'^http://player.youku.com/player.php/sid/([\w=]+)/v.swf',
                r'^loader\.swf\?VideoIDS=([\w=]+)',
                r'^([\w=]+)$']
    return r1_of(patterns, url)

def pretty_date(time):
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

def getJsonKeyValue(data, update, key):
    if data.has_key(key):
        key_value = data[key]
        update[key] = key_value
    return update
