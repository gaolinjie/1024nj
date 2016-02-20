#!/usr/bin/env python
# coding=utf-8
#
# Copyright 2013 meiritugua.com

import uuid
import hashlib
import Image
import StringIO
import time
import json
import re
import urllib2
import tornado.web
import lib.jsonp
import pprint
import math
import datetime 
import os
import requests

from base import *
from lib.variables import *
from form.user import *
from lib.variables import gen_random
from lib.xss import XssCleaner
from lib.utils import find_mentions
from lib.reddit import hot
from lib.utils import pretty_date

from lib.mobile import is_mobile_browser

import geetest

gt=geetest.geetest("b3def7f6a704f9649f2d907b1b661e70")

from qiniu import Auth
from qiniu import BucketManager
from qiniu import put_data

access_key = "DaQzr1UhFQD6im_kJJjZ8tQUKQW7ykiHo4ZWfC25"
secret_key = "Ge61JJtUSC5myXVrntdVOqAZ5L7WpXR_Taa9C8vb"
q = Auth(access_key, secret_key)
bucket = BucketManager(q)

DEBUG_FLAG = True

def do_login(self, user_id):
    user_info = self.user_model.get_user_by_uid(user_id)
    user_id = user_info["uid"]
    self.session["uid"] = user_id
    self.session["username"] = user_info["username"]
    self.session["email"] = user_info["email"]
    self.session["password"] = user_info["password"]
    self.session.save()
    self.set_secure_cookie("user", str(user_id))

def do_logout(self):
    # destroy sessions
    self.session["uid"] = None
    self.session["username"] = None
    self.session["email"] = None
    self.session["password"] = None
    self.session.save()

    # destroy cookies
    self.clear_cookie("user")

class SigninHandler(BaseHandler):
    def get(self, template_variables = {}):
        do_logout(self)
        self.redirect("/?s=signin&e=1")

    def post(self, template_variables = {}):
        template_variables = {}

        # validate the fields

        form = SigninForm(self)

        # user_info = self.user_model.get_user_by_email(form.email.data)
        # if user_info == None:
        #     self.redirect("/?s=signin&e=1")
        #     return
        
        secure_password = hashlib.sha1(form.password.data).hexdigest()
        secure_password_md5 = hashlib.md5(form.password.data).hexdigest()
        user_info = self.user_model.get_user_by_email_and_password(form.email.data, secure_password)
        user_info = user_info or self.user_model.get_user_by_email_and_password(form.email.data, secure_password_md5)
        user_info = user_info or self.user_model.get_user_by_username_and_password(form.email.data, secure_password)
        user_info = user_info or self.user_model.get_user_by_username_and_password(form.email.data, secure_password_md5)
        
        if(user_info):
            do_login(self, user_info["uid"])
            # update `last_login`
            updated = self.user_model.set_user_base_info_by_uid(user_info["uid"], {"last_login": time.strftime('%Y-%m-%d %H:%M:%S')})
            redirect_path = self.get_argument("r", "/")

            if redirect_path=='user':
                redirect_path = '/u/'+user_info.username
            if redirect_path=='follows':
                n = self.get_argument("n", "")
                if n:
                    redirect_path = '/follows/'+self.get_argument("n", "")
                else:
                    redirect_path = '/follows/'+user_info.username
                
            if redirect_path=='notifications':
                redirect_path = '/notifications'
            if redirect_path=='invitations':
                redirect_path = '/invitations'
            if redirect_path=='list':
                redirect_path = '/list'
            if redirect_path=='new':
                redirect_path = '/new'
            if redirect_path=='tags':
                redirect_path = '/tags'
            if redirect_path=='p':
                redirect_path = '/p/'+self.get_argument("n", "")
            if redirect_path=='u':
                redirect_path = '/u/'+self.get_argument("n", "")
            if redirect_path=='t':
                redirect_path = '/t/'+self.get_argument("n", "")
            self.redirect(redirect_path)
            return
        else:
            self.redirect("/?s=signin&e=2")
            return

class SignoutHandler(BaseHandler):
    def get(self):
        do_logout(self)
        # redirect
        self.redirect(self.get_argument("next", "/"))

class SignupHandler(BaseHandler):
    def get(self, template_variables = {}):
        do_logout(self)
        self.redirect("/?s=signup&e=1")

    def post(self, template_variables = {}):
        template_variables = {}

        # validate the fields

        form = SignupForm(self)

        if not form.validate():
            self.get({"errors": form.errors})
            return

        challenge=form.geetest_challenge.data
        validate=form.geetest_validate.data
        seccode=form.geetest_seccode.data
        print 'challenge'+challenge;print 'validate'+validate;print 'seccode'+seccode
        if not gt.geetest_validate(challenge,validate,seccode):
            return

        if form.gender.data=="on":
            form.gender.data="男"
        else:
            form.gender.data="女"

        if not DEBUG_FLAG:
            # validate invite code
            icode = self.icode_model.get_invite_code(form.invite.data)
            if not icode or icode.used==1:
                self.redirect("/?s=signup&e=2")
                return
        # validate duplicated
        duplicated_email = self.user_model.get_user_by_email(form.email.data)
        duplicated_username = self.user_model.get_user_by_username(form.username.data)

        if(duplicated_email or duplicated_username):
            if(duplicated_email):
                self.redirect("/?s=signup&e=3")
                return

            if(duplicated_username):
                self.redirect("/?s=signup&e=4")
                return

        # validate reserved

        if(form.username.data in self.settings.get("reserved")):
            template_variables["errors"] = {}
            template_variables["errors"]["reserved_username"] = [u"用户名被保留不可用"]
            self.get(template_variables)
            return

        # continue while validate succeed

        secure_password = hashlib.sha1(form.password.data).hexdigest()
        avatar = self.avatar_model.get_rand_avatar(form.gender.data)

        user_info = {
            "email": form.email.data,
            "password": secure_password,
            "username": form.username.data,
            "avatar": avatar[0].avatar,
            "intro": "",
            "gender": form.gender.data,
            "created": time.strftime('%Y-%m-%d %H:%M:%S')
        }

        if(self.current_user):
            return
        
        user_id = self.user_model.add_new_user(user_info)
        
        if(user_id):
            follow_info = {
                "author_id": user_id,
                "obj_id": user_id,
                "obj_type": "u",
                "created": time.strftime('%Y-%m-%d %H:%M:%S')
            }
            self.follow_model.add_new_follow(follow_info)

            do_login(self, user_id)

            if not DEBUG_FLAG:
                # set invite code used 
                self.icode_model.update_code_by_id(icode.id, {"used": 1, "user_used": user_id})
                user_created_invite = self.user_model.get_user_by_uid(icode.user_created)
                self.user_model.update_user_info_by_user_id(icode.user_created, {"income": user_created_invite.income+100})
                self.balance_model.add_new_balance({"author_id":  icode.user_created, "balance_type": 12, "amount": 100, "balance": user_created_invite.income-user_created_invite.expend+100, "created": time.strftime('%Y-%m-%d %H:%M:%S')})

            # send register success mail to user
            mail_content = self.render_string("mail/register-success.html", user_info=user_info)
            print "send mail"

            params = { "api_user": "postmaster@mmmai-invite.sendcloud.org", \
                "api_key" : "bRjboOZIVFUU9s0q",\
                "from" : "noreply@mmmai.com", \
                "to" : form.email.data, \
                "fromname" : "南京程序员第一社区", \
                "subject" : "欢迎加入南京程序员第一社区", \
                "html": mail_content \
            }

            url="https://sendcloud.sohu.com/webapi/mail.send.xml"
            r = requests.post(url, data=params)
            print r.text

        self.redirect(self.get_argument("next", "/"))

class UserHandler(BaseHandler):
    def get(self, username, template_variables = {}):
        user_info = self.current_user
        template_variables["user_info"] = user_info
        p = int(self.get_argument("p", "1"))
        active_tab = self.get_argument('tab', "post")
        template_variables["active_tab"] = active_tab

        view_user = self.user_model.get_user_by_username(username)
        template_variables["view_user"] = view_user
        template_variables["feeds1_len"] = self.post_model.get_user_all_posts_count(view_user.uid)
        template_variables["feeds2_len"] = self.reply_model.get_user_all_replys_count(view_user.uid)
        template_variables["followees_count"] = self.follow_model.get_user_followees_count(view_user.uid)
        template_variables["followers_count"] = self.follow_model.get_user_followers_count(view_user.uid)

        template_variables["ad"] = self.ads_model.get_rand_ad()
        
        gold_coins = (view_user.income - view_user.expend )/ 10000
        silver_coins = (view_user.income - view_user.expend )% 10000     
        bronze_coins = silver_coins  % 100
        silver_coins = silver_coins / 100
        template_variables["gold_coins"] = gold_coins
        template_variables["silver_coins"] = silver_coins
        template_variables["bronze_coins"] = bronze_coins

        template_variables["feeds1"] = self.post_model.get_user_all_posts(view_user.uid, current_page = p)
        template_variables["feeds2"] = self.reply_model.get_user_all_replys(view_user.uid, current_page = p)

        if(user_info):
            template_variables["follow"] = self.follow_model.get_follow(user_info.uid, view_user.uid, 'u')
        else:
            template_variables["link"] = "u"
            template_variables["link2"] = username
            template_variables["follow"] = None
        if is_mobile_browser(self):
            self.render("mobile/user.html", **template_variables)
        else:
            self.render("user.html", **template_variables)

class SettingHandler(BaseHandler):
    @tornado.web.authenticated
    def get(self, template_variables = {}):
        user_info = self.get_current_user()
        template_variables["user_info"] = user_info
        template_variables["gen_random"] = gen_random
        if user_info:
            if is_mobile_browser(self):
                self.render("mobile/user/setting.html", **template_variables)
            else:
                self.render("user/setting.html", **template_variables)
        else:
            self.render("404.html", **template_variables)

    @tornado.web.authenticated
    def post(self, template_variables = {}):
        template_variables = {}

        # validate the fields

        form = SettingForm(self)

        if not form.validate():
            self.get({"errors": form.errors})
            return

        # continue while validate succeed
        website = form.website.data.replace("http://", "")
        website = website.replace("https://", "")
        website = website.replace("www.", "")
        website = website.rstrip("/")
        user_info = self.current_user
        update_result = self.user_model.set_user_base_info_by_uid(user_info["uid"], {
            "sign": form.sign.data,
            "gender": form.gender.data,
            "location": form.location.data,
            "business": form.business.data,
            "edu": form.edu.data,
            "company": form.company.data,
            "website": website,
            "intro": form.intro.data,
            "updated": time.strftime('%Y-%m-%d %H:%M:%S')
        })

        self.redirect("/u/" + form.username.data)

class SettingAvatarHandler(BaseHandler):
    @tornado.web.authenticated
    def get(self, template_variables = {}):
        user_info = self.get_current_user()
        template_variables["user_info"] = user_info
        template_variables["gen_random"] = gen_random
        if user_info:
            if is_mobile_browser(self):
                self.render("mobile/user/setting_avatar.html", **template_variables)
            else:
                self.render("user/setting_avatar.html", **template_variables)
        else:
            self.render("404.html", **template_variables)

    @tornado.web.authenticated
    def post(self, template_variables = {}):
        template_variables = {}

        if(not "avatar" in self.request.files):
            template_variables["errors"] = {}
            template_variables["errors"]["invalid_avatar"] = [u"请先选择要上传的头像"]
            self.get(template_variables)
            return

        user_info = self.current_user
        user_id = user_info.uid
        origin_avatar = user_info.avatar
        avatar_name = "%s" % uuid.uuid1()
        avatar_raw = self.request.files["avatar"][0]["body"]
        avatar_buffer = StringIO.StringIO(avatar_raw)
        avatar = Image.open(avatar_buffer)

        usr_home = os.path.expanduser('~')
        avatar.save(usr_home+"/www/1024nj/static/tmp/m_%s.png" % avatar_name, "PNG")

        uptoken = q.upload_token("mmm-avatar", "m_%s.png" % avatar_name)
        data=open(usr_home+"/www/1024nj/static/tmp/m_%s.png" % avatar_name)
        ret, info = put_data(uptoken, "m_%s.png" % avatar_name, data)

        os.remove(usr_home+"/www/1024nj/static/tmp/m_%s.png" % avatar_name)

        avatar_name = "http://mmm-avatar.qiniudn.com/m_"+avatar_name
        result = self.user_model.set_user_avatar_by_uid(user_id, "%s.png" % avatar_name)
        template_variables["success_message"] = [u"用户头像更新成功"]
        # update `updated`
        updated = self.user_model.set_user_base_info_by_uid(user_id, {"updated": time.strftime('%Y-%m-%d %H:%M:%S')})
        self.redirect("/setting/avatar")

        if origin_avatar:
            pattern = re.compile(r'm_.*.png') 
            match = pattern.search(origin_avatar) 
            if match: 
                print match.group()
                ret, info = bucket.delete("mmm-avatar", match.group())

class SettingCoverHandler(BaseHandler):
    @tornado.web.authenticated
    def get(self, template_variables = {}):
        user_info = self.get_current_user()
        template_variables["user_info"] = user_info
        template_variables["gen_random"] = gen_random
        if(not user_info):
            self.redirect("/?s=signin")
        if user_info:
            if is_mobile_browser(self):
                self.render("mobile/user/setting_cover.html", **template_variables)
            else:
                self.render("user/setting_cover.html", **template_variables)
        else:
            self.render("404.html", **template_variables)

    @tornado.web.authenticated
    def post(self, template_variables = {}):
        template_variables = {}

        if(not "cover" in self.request.files):
            template_variables["errors"] = {}
            template_variables["errors"]["invalid_cover"] = [u"请先选择要上传的封面"]
            self.get(template_variables)
            return

        user_info = self.current_user
        user_id = user_info["uid"]
        origin_cover = user_info.cover

        cover_name = "%s" % uuid.uuid1()
        cover_raw = self.request.files["cover"][0]["body"]
        cover_buffer = StringIO.StringIO(cover_raw)
        cover = Image.open(cover_buffer)
     
        usr_home = os.path.expanduser('~')
        cover.save(usr_home+"/www/1024nj/static/tmp/m_%s.png" % cover_name, "PNG")

        uptoken = q.upload_token("mmm-avatar", "m_%s.png" % cover_name)
        data=open(usr_home+"/www/1024nj/static/tmp/m_%s.png" % cover_name)
        ret, info = put_data(uptoken, "m_%s.png" % cover_name, data)

        os.remove(usr_home+"/www/1024nj/static/tmp/m_%s.png" % cover_name)

        cover_name = "http://mmm-avatar.qiniudn.com/m_"+cover_name
        result = self.user_model.set_user_cover_by_uid(user_id, "%s.png" % cover_name)
        template_variables["success_message"] = [u"频道头像更新成功"]
        # update `updated`
        updated = self.user_model.set_user_base_info_by_uid(user_id, {"updated": time.strftime('%Y-%m-%d %H:%M:%S')})

        self.redirect("/setting/cover")

        if origin_cover:
            pattern = re.compile(r'm_.*.png') 
            match = pattern.search(origin_cover) 
            if match: 
                print match.group()
                ret, info = bucket.delete("mmm-avatar", match.group())

class SettingPasswordHandler(BaseHandler):
    @tornado.web.authenticated
    def get(self, template_variables = {}):
        user_info = self.get_current_user()
        template_variables["user_info"] = user_info
        if is_mobile_browser(self):
            self.render("mobile/user/setting_password.html", **template_variables)
        else:
            self.render("user/setting_password.html", **template_variables)

    @tornado.web.authenticated
    def post(self, template_variables = {}):
        template_variables = {}

        # validate the fields

        form = SettingPasswordForm(self)

        if not form.validate():
            self.get({"errors": form.errors})
            return

        # validate the password

        user_info = self.current_user
        user_id = user_info["uid"]
        secure_password = hashlib.sha1(form.password_old.data).hexdigest()
        secure_new_password = hashlib.sha1(form.password.data).hexdigest()

        if(not user_info["password"] == secure_password):
            template_variables["errors"] = {}
            template_variables["errors"]["error_password"] = [u"当前密码输入有误"]
            self.get(template_variables)
            return

        # continue while validate succeed

        update_result = self.user_model.set_user_password_by_uid(user_id, secure_new_password)
        template_variables["success_message"] = [u"您的用户密码已更新"]
        # update `updated`
        updated = self.user_model.set_user_base_info_by_uid(user_id, {"updated": time.strftime('%Y-%m-%d %H:%M:%S')})
        self.redirect("/setting")

class ForgotPasswordHandler(BaseHandler):
    def get(self, template_variables = {}):
        do_logout(self)
        self.render("user/forgot_password.html", **template_variables)

    def post(self, template_variables = {}):
        template_variables = {}

        # validate the fields

        form = ForgotPasswordForm(self)

        if not form.validate():
            self.get({"errors": form.errors})
            return


        # validate the post value

        user_info = self.user_model.get_user_by_email_and_username(form.email.data, form.username.data)

        if(not user_info):
            template_variables["errors"] = {}
            template_variables["errors"]["invalid_email_or_username"] = [u"所填用户名和邮箱有误"]
            self.get(template_variables)
            return

        # continue while validate succeed
        # update password

        new_password = uuid.uuid1().hex
        new_secure_password = hashlib.sha1(new_password).hexdigest()
        update_result = self.user_model.set_user_password_by_uid(user_info["uid"], new_secure_password)

        # send password reset link to user

        mail_title = u"mifan.tv 找回密码"
        template_variables = {"email": form.email.data, "new_password": new_password};
        template_variables["success_message"] = [u"新密码已发送至您的注册邮箱"]
        mail_content = self.render_string("user/forgot_password_mail.html", **template_variables)
        send(mail_title, mail_content, form.email.data)

        self.get(template_variables)

class SignoutHandler(BaseHandler):
    def get(self):
        do_logout(self)
        # redirect
        self.redirect(self.get_argument("next", "/"))

class SocialHandler(BaseHandler):
    @tornado.web.authenticated
    def get(self, template_variables = {}):
        user_info = self.get_current_user()
        template_variables["user_info"] = user_info
        template_variables["gen_random"] = gen_random
        if user_info:
            if is_mobile_browser(self):
                self.render("mobile/user/social.html", **template_variables)
            else:
                self.render("user/social.html", **template_variables)
        else:
            self.render("404.html", **template_variables)


    @tornado.web.authenticated
    def post(self, template_variables = {}):
        template_variables = {}

        user_info = self.get_current_user()

        # validate the fields

        form = SocialForm(self)

        if not form.validate():
            self.get({"errors": form.errors})
            return

        # continue while validate succeed

        user_info = self.current_user
        update_result = self.user_model.set_user_base_info_by_uid(user_info["uid"], {
            "weibo": form.weibo.data,
            "qzone": form.qzone.data,
            "douban": form.douban.data,
            "renren": form.renren.data,
            "updated": time.strftime('%Y-%m-%d %H:%M:%S')
        })

        self.redirect("/u/" + user_info.username)