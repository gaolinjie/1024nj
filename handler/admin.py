#!/usr/bin/env python
# coding=utf-8
#
# Copyright 2013 meiritugua.com

import uuid
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
from lib.utils import getJsonKeyValue
from lib.reddit import hot
from lib.utils import pretty_date
from lib.dateencoder import DateEncoder

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
    self.session["password"] = user_info["password"]
    self.session.save()
    self.set_secure_cookie("user", str(user_id))

def do_logout(self):
    # destroy sessions
    self.session["uid"] = None
    self.session["username"] = None
    self.session["password"] = None
    self.session.save()

    # destroy cookies
    self.clear_cookie("user")

class SigninAdminHandler(BaseHandler):
    def get(self, template_variables = {}):
        do_logout(self)
        self.render("admin/login.html", **template_variables)

    def post(self, template_variables = {}):
        template_variables = {}

        # validate the fields

        form = SigninForm(self)

        user_info = self.user_model.get_user_by_username(form.username.data)
        if user_info == None:
            self.redirect("/?s=signin&e=1")
            return
        
        secure_password = hashlib.sha1(form.password.data).hexdigest()
        secure_password_md5 = hashlib.md5(form.password.data).hexdigest()
        user_info = self.user_model.get_user_by_username_and_password(form.username.data, secure_password)
        user_info = user_info or self.user_model.get_user_by_username_and_password(form.username.data, secure_password_md5)
        
        if(user_info):
            do_login(self, user_info["uid"])
            # update `last_login`
            updated = self.user_model.set_user_base_info_by_uid(user_info["uid"], {"last_login": time.strftime('%Y-%m-%d %H:%M:%S')})
            self.redirect("/admin")
            return
        else:
            self.redirect("/?s=signin&e=2")
            return

class SignoutAdminHandler(BaseHandler):
    def get(self):
        do_logout(self)
        # redirect
        self.redirect(self.get_argument("next", "/admin/signin"))

class SignupAdminHandler(BaseHandler):
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

        # validate duplicated
        duplicated_username = self.user_model.get_user_by_username(form.username.data)

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
        avatar = self.avatar_model.get_rand_avatar()

        user_info = {
            "username": form.username.data,
            "password": secure_password,
            "avatar": avatar[0].avatar,
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

        self.redirect(self.get_argument("next", "/"))

class IndexAdminHandler(BaseHandler):
    def get(self, template_variables = {}):
        user_info = self.current_user
        template_variables["side_menu"] = "dashboard"
        template_variables["user_info"] = user_info
        #template_variables["user_count"] = self.user_model.get_all_users_count()
        #template_variables["course_count"] = self.course_model.get_all_courses_count()
        if(user_info):  
            self.render("admin/index.html", **template_variables)
        else:
            self.redirect("/admin/signin")

class UsersAdminHandler(BaseHandler):
    def get(self, template_variables = {}):
        template_variables["side_menu"] = "users"
        user_info = self.current_user
        template_variables["user_info"] = user_info
        p = int(self.get_argument("p", "1"))

        if(user_info and user_info.admin == "admin"):  
            template_variables["all_users"] = self.user_model.get_all_users(current_page = p)
            self.render("admin/users.html", **template_variables)
        else:
            self.redirect("/admin/signin")

class UserNewAdminHandler(BaseHandler):
    def get(self, template_variables = {}):
        template_variables["side_menu"] = "users"
        user_info = self.current_user
        template_variables["user_info"] = user_info

        if(user_info and user_info.admin == "admin"):  
            self.render("admin/user_new.html", **template_variables)
        else:
            self.redirect("/admin/signin")

    def post(self, template_variables = {}):
        user_info = self.current_user

        if(user_info and user_info.admin == "admin"):  
            update_info = {}
            data = json.loads(self.request.body)
            
            update_info = getJsonKeyValue(data, update_info, "username")
            update_info = getJsonKeyValue(data, update_info, "nickname")
            update_info = getJsonKeyValue(data, update_info, "name")
            update_info = getJsonKeyValue(data, update_info, "gender")
            secure_password = hashlib.sha1("123456").hexdigest()
            update_info["password"] = secure_password
            update_info["created"] = time.strftime('%Y-%m-%d %H:%M:%S')

            update_result = self.user_model.add_new_user(update_info)

            # process courses
            courseStr = data["courses"]
            if courseStr:
                courseNames = courseStr.split(',') 
                for courseName in courseNames:  
                    course = self.course_model.get_course_by_title(courseName)
                    if course:
                        follow = self.follow_model.get_follow(user_id, course.id, "c")
                        if not follow:
                            self.follow_model.add_new_follow({
                                "author_id": user_id,
                                "obj_id": course.id,
                                "obj_type": "c"
                                })

                courseFollows = self.follow_model.get_user_follow_courses(user_id)
                for follow in courseFollows["list"]:
                    if not follow.course_title in courseNames:
                        self.follow_model.delete_follow_by_id(follow.id)

            if update_result > 0:
                success = 0
                message = "成功新建用户"
            else:
                success = -1
                message = "新建用户失败"

            self.write(lib.jsonp.print_JSON({
                    "success": success,
                    "message": message
            }))
        else:
            success = -1
            message = "新建用户失败"

            self.write(lib.jsonp.print_JSON({
                    "success": success,
                    "message": message
            }))     

class UserEditAdminHandler(BaseHandler):
    def get(self, user_id, template_variables = {}):
        user_info = self.current_user
        template_variables["user_info"] = user_info

        if(user_info and user_info.admin == "admin"):  
            view_user = self.user_model.get_user_by_uid(user_id)
            template_variables["view_user"] = view_user
            courses = self.follow_model.get_user_follow_courses(user_id)
            courseStr = ''
            i=0
            for course in courses["list"]:
                if i==0:
                    courseStr = course.course_title
                else:
                    courseStr = courseStr + ','+course.course_title
                i=i+1
            template_variables["courseStr"] = courseStr 
            self.render("admin/user_edit.html", **template_variables)
        else:
            self.redirect("/admin/signin")

class UserDeleteAdminHandler(BaseHandler):
    def get(self, user_id, template_variables = {}):
        user_info = self.current_user

        if(user_info and user_info.admin == "admin" and user_info.uid != long(user_id)):
            self.user_model.delete_user_by_id(user_id)
            success = 0
            message = "成功获取用户实名认证信息"
        else:
            success = -1
            message = "删除用户失败"

        self.write(lib.jsonp.print_JSON({
                    "success": success,
                    "message": message
            }))

class CoursesAdminHandler(BaseHandler):
    def get(self, template_variables = {}):
        template_variables["side_menu"] = "courses"
        user_info = self.current_user
        template_variables["user_info"] = user_info
        p = int(self.get_argument("p", "1"))

        if(user_info and user_info.admin == "admin"):  
            template_variables["all_courses"] = self.course_model.get_all_courses(current_page = p)
            self.render("admin/courses.html", **template_variables)
        else:
            self.redirect("/admin/signin")

class CourseEditAdminHandler(BaseHandler):
    def get(self, course_id, template_variables = {}):
        template_variables["side_menu"] = "courses"
        user_info = self.current_user
        template_variables["user_info"] = user_info

        if(user_info and user_info.admin == "admin"):  
            view_course = self.course_model.get_course_by_id(course_id)
            template_variables["view_course"] = view_course
            template_variables["all_chapters"] = self.chapter_model.get_chapters_by_course_id(course_id)
            self.render("admin/course_edit.html", **template_variables)
        else:
            self.redirect("/admin/signin")

    def post(self, course_id, template_variables = {}):
        user_info = self.current_user
        view_course = self.course_model.get_course_by_id(course_id)

        if(user_info and user_info.admin == "admin" and view_course):  
            update_info = {}
            data = json.loads(self.request.body)
            print data["intro"]
            
            update_info = getJsonKeyValue(data, update_info, "title")
            update_info = getJsonKeyValue(data, update_info, "intro")
            update_info = getJsonKeyValue(data, update_info, "state")
            update_info = getJsonKeyValue(data, update_info, "teacher")
            update_info = getJsonKeyValue(data, update_info, "time")
            update_info = getJsonKeyValue(data, update_info, "video_num")
            update_info = getJsonKeyValue(data, update_info, "follow_num")

            start_time = data["start_time"]
            if start_time!='':
                update_info = getJsonKeyValue(data, update_info, "start_time")
            end_time = data["end_time"]
            if end_time!='':
                update_info = getJsonKeyValue(data, update_info, "end_time")
            
            update_result = self.course_model.update_course_by_id(course_id, update_info)

            if update_result == 0:
                success = 0
                message = "成功保存课程信息"
            else:
                success = -1
                message = "保存课程信息失败"

            self.write(lib.jsonp.print_JSON({
                    "success": success,
                    "message": message
            }))
        else:
            success = -1
            message = "保存课程信息失败"

            self.write(lib.jsonp.print_JSON({
                    "success": success,
                    "message": message
            }))     

class CourseNewAdminHandler(BaseHandler):
    def get(self, template_variables = {}):
        template_variables["side_menu"] = "courses"
        user_info = self.current_user
        template_variables["user_info"] = user_info

        if(user_info and user_info.admin == "admin"):  
            self.render("admin/course_new.html", **template_variables)
        else:
            self.redirect("/admin/signin")

    def post(self, template_variables = {}):
        user_info = self.current_user

        if(user_info and user_info.admin == "admin"):  
            update_info = {}
            data = json.loads(self.request.body)
            
            update_info = getJsonKeyValue(data, update_info, "title")
            update_info = getJsonKeyValue(data, update_info, "intro")
            update_info = getJsonKeyValue(data, update_info, "state")
            update_info = getJsonKeyValue(data, update_info, "teacher")
            update_info = getJsonKeyValue(data, update_info, "time")

            start_time = data["start_time"]
            if start_time!='':
                update_info = getJsonKeyValue(data, update_info, "start_time")
            end_time = data["end_time"]
            if end_time!='':
                update_info = getJsonKeyValue(data, update_info, "end_time")

            update_result = self.course_model.add_new_course(update_info)

            if update_result > 0:
                success = 0
                message = "成功新建课程"
            else:
                success = -1
                message = "新建课程失败"

            self.write(lib.jsonp.print_JSON({
                    "success": success,
                    "message": message
            }))
        else:
            success = -1
            message = "新建课程失败"

            self.write(lib.jsonp.print_JSON({
                    "success": success,
                    "message": message
            }))     

class CourseDeleteAdminHandler(BaseHandler):
    def get(self, course_id, template_variables = {}):
        user_info = self.current_user

        if(user_info and user_info.admin == "admin"):
            self.course_model.delete_course_by_id(course_id)
            success = 0
            message = "成功删除课程"
        else:
            success = -1
            message = "删除课程失败"

        self.write(lib.jsonp.print_JSON({
                    "success": success,
                    "message": message
            }))

class ChapterNewAdminHandler(BaseHandler):
    def post(self, template_variables = {}):
        user_info = self.current_user

        if(user_info and user_info.admin == "admin"):  
            update_info = {}
            data = json.loads(self.request.body)
            
            update_info = getJsonKeyValue(data, update_info, "title")
            update_info = getJsonKeyValue(data, update_info, "intro")
            update_info = getJsonKeyValue(data, update_info, "time")
            update_info = getJsonKeyValue(data, update_info, "video_link")
            update_info = getJsonKeyValue(data, update_info, "order_num")
            update_info = getJsonKeyValue(data, update_info, "course_id")
            
            update_result = self.chapter_model.add_new_chapter(update_info)

            success = 0
            message = "成功保存课时信息"

            self.write(lib.jsonp.print_JSON({
                    "success": success,
                    "message": message
            }))
        else:
            success = -1
            message = "保存课时信息失败"

            self.write(lib.jsonp.print_JSON({
                    "success": success,
                    "message": message
            })) 

class ChapterEditAdminHandler(BaseHandler):
    def post(self, chapter_id, template_variables = {}):
        user_info = self.current_user

        if(user_info and user_info.admin == "admin"):  
            update_info = {}
            data = json.loads(self.request.body)
            
            update_info = getJsonKeyValue(data, update_info, "title")
            update_info = getJsonKeyValue(data, update_info, "intro")
            update_info = getJsonKeyValue(data, update_info, "time")
            update_info = getJsonKeyValue(data, update_info, "video_link")
            update_info = getJsonKeyValue(data, update_info, "order_num")
            
            update_result = self.chapter_model.update_chapter_by_id(chapter_id, update_info)

            success = 0
            message = "成功保存课时信息"

            self.write(lib.jsonp.print_JSON({
                    "success": success,
                    "message": message
            }))
        else:
            success = -1
            message = "保存课时信息失败"

            self.write(lib.jsonp.print_JSON({
                    "success": success,
                    "message": message
            }))  

class ChapterDeleteAdminHandler(BaseHandler):
    def get(self, chapter_id, template_variables = {}):
        user_info = self.current_user

        if(user_info and user_info.admin == "admin"):
            self.chapter_model.delete_chapter_by_id(chapter_id)
            success = 0
            message = "成功删除课时"
        else:
            success = -1
            message = "删除课时失败"

        self.write(lib.jsonp.print_JSON({
                    "success": success,
                    "message": message
            }))

class GetCoursesAdminHandler(BaseHandler):
    def get(self, template_variables = {}):
        user_info = self.current_user
        template_variables["user_info"] = user_info
        allCourses = self.course_model.get_all_courses2()
        allCourseJson = []
        for course in allCourses:
            allCourseJson.append(course.title)

        self.write(json.dumps(allCourseJson))