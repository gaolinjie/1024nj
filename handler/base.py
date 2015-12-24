#!/usr/bin/env python
# coding=utf-8
#
# Copyright 2014 1024nj

import tornado.web
import lib.session
import time
import helper

class BaseHandler(tornado.web.RequestHandler):
    def __init__(self, *argc, **argkw):
        super(BaseHandler, self).__init__(*argc, **argkw)
        self.session = lib.session.Session(self.application.session_manager, self)
        self.jinja2 = self.settings.get("jinja2")
        self.jinja2 = helper.Filters(self.jinja2).register()

    @property
    def db(self):
        return self.application.db

    @property
    def loader(self):
        return self.application.loader

    @property
    def mc(self):
        return self.application.mc

    def render(self, template_name, **template_vars):
        html = self.render_string(template_name, **template_vars)
        self.write(html)

    def render_string(self, template_name, **template_vars):
        template_vars["xsrf_form_html"] = self.xsrf_form_html
        template_vars["current_user"] = self.current_user
        template_vars["request"] = self.request
        template_vars["request_handler"] = self
        template = self.jinja2.get_template(template_name)
        return template.render(**template_vars)

    def render_from_string(self, template_string, **template_vars):
        template = self.jinja2.from_string(template_string)
        return template.render(**template_vars)

    def get_current_user(self):
        user_id = self.get_secure_cookie("user")
        if not user_id: return None
        return self.user_model.get_user_by_uid(int(user_id))

    @property
    def user_model(self):
        return self.application.user_model

    @property
    def reply_model(self):
        return self.application.reply_model

    @property
    def follow_model(self):
        return self.application.follow_model

    @property
    def post_model(self):
        return self.application.post_model

    @property
    def feed_model(self):
        return self.application.feed_model

    @property
    def feed_type_model(self):
        return self.application.feed_type_model

    @property
    def like_item_model(self):
        return self.application.like_item_model

    @property
    def vote_model(self):
        return self.application.vote_model

    @property
    def post_tag_model(self):
        return self.application.post_tag_model

    @property
    def tag_model(self):
        return self.application.tag_model

    @property
    def category_model(self):
        return self.application.category_model

    @property
    def thank_model(self):
        return self.application.thank_model

    @property
    def report_model(self):
        return self.application.report_model

    @property
    def notice_model(self):
        return self.application.notice_model

    @property
    def invite_model(self):
        return self.application.invite_model

    @property
    def tag_type_model(self):
        return self.application.tag_type_model

    @property
    def icode_model(self):
        return self.application.icode_model

    @property
    def avatar_model(self):
        return self.application.avatar_model

    @property
    def tag_parent_model(self):
        return self.application.tag_parent_model

    @property
    def balance_model(self):
        return self.application.balance_model

    @property
    def ads_model(self):
        return self.application.ads_model

    @property
    def balance_type_model(self):
        return self.application.balance_type_model

    @property
    def item_model(self):
        return self.application.item_model

    @property
    def live_model(self):
        return self.application.live_model

    @property
    def video_model(self):
        return self.application.video_model

    @property
    def section_model(self):
        return self.application.section_model

    @property
    def object_video_model(self):
        return self.application.object_video_model

    @property
    def section_video_model(self):
        return self.application.section_video_model

    @property
    def nav_model(self):
        return self.application.nav_model

    @property
    def post_node_model(self):
        return self.application.post_node_model

    @property
    def node_model(self):
        return self.application.node_model

'''
    @property
    def write_error(self, **kwargs):
        status_code = 404
        if status_code == 404:
            template_variables["error_text"] = "页面不存在或可能被删除了，"
            self.render('404.html')
        elif status_code == 500:
            template_variables["error_text"] = "页面不存在或可能被删除了，"
            self.render('404.html')
        else:
            super(RequestHandler, self).write_error(status_code, **kwargs)
'''