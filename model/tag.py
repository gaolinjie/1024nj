#!/usr/bin/env python
# coding=utf-8
#
# Copyright 2013 meiritugua.com

import time
from lib.query import Query

class TagModel(Query):
    def __init__(self, db):
        self.db = db
        self.table_name = "tag"
        super(TagModel, self).__init__()

    def get_all_tags(self):
        order = "tag.category DESC, tag.post_num DESC, tag.id DESC"
        return self.order(order).select()

    def get_all_tags2(self):
        order = "tag.post_num DESC, tag.id DESC"
        return self.order(order).select()

    def get_tag_by_tag_name(self, tag_name):
    	where = "name = '%s'" % tag_name
        return self.where(where).find()

    def get_tag_by_tag_id(self, tag_id):
        where = "id = '%s'" % tag_id
        return self.where(where).find()
    
    def add_new_tag(self, tag_info):
        return self.data(tag_info).add()

    def update_tag_by_tag_id(self, tag_id, tag_info):
        where = "tag.id = %s" % tag_id
        return self.where(where).data(tag_info).save()

    def get_tag_all_feeds(self, tag_id, author_id, num = 10, current_page = 1):
        where = "tag.id = %s" % tag_id
        join = "LEFT JOIN post_tag ON tag.id = post_tag.tag_id \
                RIGHT JOIN feed ON post_tag.post_id = feed.post_id AND feed.feed_type!=3 AND feed.feed_type!=5 AND feed.feed_type!=9 AND feed.feed_type!=11 \
                LEFT JOIN user AS author_user ON feed.user_id = author_user.uid \
                LEFT JOIN tag AS feed_tag ON feed.tag_id = tag.id \
                LEFT JOIN post ON feed.post_id = post.id \
                LEFT JOIN user AS post_user ON post.author_id = post_user.uid \
                LEFT JOIN reply ON feed.reply_id = reply.id \
                LEFT JOIN user AS reply_user ON reply.author_id = reply_user.uid\
                LEFT JOIN feed_type ON feed.feed_type = feed_type.id\
                LEFT JOIN follow AS post_follow ON post_follow.author_id = %s AND post.id = post_follow.obj_id AND (post_follow.obj_type='q' OR post_follow.obj_type='p')\
                LEFT JOIN thank AS post_thank ON post_thank.from_user = %s AND post_thank.to_user = post.author_id AND post_thank.obj_id = post.id AND post_thank.obj_type = 'post'\
                LEFT JOIN report AS post_report ON post_report.from_user = %s AND post_report.to_user = post.author_id AND post_report.obj_id = post.id AND post_report.obj_type = 'post'\
                LEFT JOIN thank AS reply_thank ON reply_thank.from_user = %s AND reply_thank.to_user = reply.author_id AND reply_thank.obj_id = reply.id AND reply_thank.obj_type = 'reply'\
                LEFT JOIN report AS reply_report ON reply_report.from_user = %s AND reply_report.to_user = reply.author_id AND reply_report.obj_id = reply.id AND reply_report.obj_type = 'reply'" % (author_id, author_id, author_id, author_id, author_id)
        order = "feed.created DESC, feed.id DESC"
        field = "feed.*, \
                author_user.username as author_username, \
                author_user.avatar as author_avatar, \
                feed_tag.name as tag_name, \
                feed_tag.thumb as tag_thumb, \
                post.id as post_id, \
                post.title as post_title, \
                post.content as post_content, \
                post.post_type as post_type, \
                post.thumb as post_thumb, \
                post.reply_num as post_reply_num, \
                post.created as post_created, \
                reply.id as reply_id, \
                reply.content as reply_content,\
                feed_type.feed_text as feed_text, \
                reply_user.username as reply_user_username, \
                reply_user.sign as reply_user_sign, \
                post_follow.id as post_follow_id,\
                post_thank.id as post_thank_id, \
                post_report.id as post_report_id, \
                reply_thank.id as reply_thank_id, \
                reply_report.id as reply_report_id"
        return self.where(where).order(order).join(join).field(field).pages(current_page = current_page, list_rows = num)

    def get_tag_all_feeds2(self, tag_id, num = 10, current_page = 1):
        where = "tag.id = %s" % tag_id
        join = "LEFT JOIN post_tag ON tag.id = post_tag.tag_id \
                RIGHT JOIN feed ON post_tag.post_id = feed.post_id AND feed.feed_type!=3 AND feed.feed_type!=5 AND feed.feed_type!=9 AND feed.feed_type!=11 \
                LEFT JOIN user AS author_user ON feed.user_id = author_user.uid \
                LEFT JOIN tag AS feed_tag ON feed.tag_id = tag.id \
                LEFT JOIN post ON feed.post_id = post.id \
                LEFT JOIN user AS post_user ON post.author_id = post_user.uid \
                LEFT JOIN reply ON feed.reply_id = reply.id \
                LEFT JOIN user AS reply_user ON reply.author_id = reply_user.uid\
                LEFT JOIN feed_type ON feed.feed_type = feed_type.id"
        order = "feed.created DESC, feed.id DESC"
        field = "feed.*, \
                author_user.username as author_username, \
                author_user.avatar as author_avatar, \
                feed_tag.name as tag_name, \
                feed_tag.thumb as tag_thumb, \
                post.id as post_id, \
                post.title as post_title, \
                post.content as post_content, \
                post.post_type as post_type, \
                post.thumb as post_thumb, \
                post.reply_num as post_reply_num, \
                post.created as post_created, \
                reply.id as reply_id, \
                reply.content as reply_content,\
                feed_type.feed_text as feed_text, \
                reply_user.username as reply_user_username, \
                reply_user.sign as reply_user_sign"
        return self.where(where).order(order).join(join).field(field).pages(current_page = current_page, list_rows = num)

    def get_tag_all_feeds_by_type(self, tag_id, author_id, feed_type, num = 10, current_page = 1):
        where = "tag.id = %s" % tag_id
        join = "LEFT JOIN post_tag ON tag.id = post_tag.tag_id \
                RIGHT JOIN feed ON post_tag.post_id = feed.post_id AND feed.feed_type= %s \
                LEFT JOIN user AS author_user ON feed.user_id = author_user.uid \
                LEFT JOIN tag AS feed_tag ON feed.tag_id = tag.id \
                LEFT JOIN post ON feed.post_id = post.id \
                LEFT JOIN user AS post_user ON post.author_id = post_user.uid \
                LEFT JOIN reply ON feed.reply_id = reply.id \
                LEFT JOIN user AS reply_user ON reply.author_id = reply_user.uid\
                LEFT JOIN feed_type ON feed.feed_type = feed_type.id\
                LEFT JOIN follow AS post_follow ON post_follow.author_id = %s AND post.id = post_follow.obj_id AND (post_follow.obj_type='q' OR post_follow.obj_type='p')\
                LEFT JOIN thank AS post_thank ON post_thank.from_user = %s AND post_thank.to_user = post.author_id AND post_thank.obj_id = post.id AND post_thank.obj_type = 'post'\
                LEFT JOIN report AS post_report ON post_report.from_user = %s AND post_report.to_user = post.author_id AND post_report.obj_id = post.id AND post_report.obj_type = 'post'\
                LEFT JOIN thank AS reply_thank ON reply_thank.from_user = %s AND reply_thank.to_user = reply.author_id AND reply_thank.obj_id = reply.id AND reply_thank.obj_type = 'reply'\
                LEFT JOIN report AS reply_report ON reply_report.from_user = %s AND reply_report.to_user = reply.author_id AND reply_report.obj_id = reply.id AND reply_report.obj_type = 'reply'" % (feed_type, author_id, author_id, author_id, author_id, author_id)
        order = "feed.created DESC, feed.id DESC"
        field = "feed.*, \
                author_user.username as author_username, \
                author_user.avatar as author_avatar, \
                feed_tag.name as tag_name, \
                feed_tag.thumb as tag_thumb, \
                post.id as post_id, \
                post.title as post_title, \
                post.content as post_content, \
                post.post_type as post_type, \
                post.thumb as post_thumb, \
                post.reply_num as post_reply_num, \
                post.created as post_created, \
                reply.id as reply_id, \
                reply.content as reply_content,\
                feed_type.feed_text as feed_text, \
                reply_user.username as reply_user_username, \
                reply_user.sign as reply_user_sign, \
                post_follow.id as post_follow_id, \
                post_thank.id as post_thank_id, \
                post_report.id as post_report_id, \
                reply_thank.id as reply_thank_id, \
                reply_report.id as reply_report_id"
        return self.where(where).order(order).join(join).field(field).pages(current_page = current_page, list_rows = num)

    def get_tag_all_feeds_by_type2(self, tag_id, feed_type, num = 10, current_page = 1):
        where = "tag.id = %s" % tag_id
        join = "LEFT JOIN post_tag ON tag.id = post_tag.tag_id \
                RIGHT JOIN feed ON post_tag.post_id = feed.post_id AND feed.feed_type= %s \
                LEFT JOIN user AS author_user ON feed.user_id = author_user.uid \
                LEFT JOIN tag AS feed_tag ON feed.tag_id = tag.id \
                LEFT JOIN post ON feed.post_id = post.id \
                LEFT JOIN user AS post_user ON post.author_id = post_user.uid \
                LEFT JOIN reply ON feed.reply_id = reply.id \
                LEFT JOIN user AS reply_user ON reply.author_id = reply_user.uid\
                LEFT JOIN feed_type ON feed.feed_type = feed_type.id" % (feed_type)
        order = "feed.created DESC, feed.id DESC"
        field = "feed.*, \
                author_user.username as author_username, \
                author_user.avatar as author_avatar, \
                feed_tag.name as tag_name, \
                feed_tag.thumb as tag_thumb, \
                post.id as post_id, \
                post.title as post_title, \
                post.content as post_content, \
                post.post_type as post_type, \
                post.thumb as post_thumb, \
                post.reply_num as post_reply_num, \
                post.created as post_created, \
                reply.id as reply_id, \
                reply.content as reply_content,\
                feed_type.feed_text as feed_text, \
                reply_user.username as reply_user_username, \
                reply_user.sign as reply_user_sign"
        return self.where(where).order(order).join(join).field(field).pages(current_page = current_page, list_rows = num)

    def get_tag_all_feeds_count_by_type(self, tag_id, feed_type):
        where = "tag.id = %s" % tag_id
        join = "LEFT JOIN post_tag ON tag.id = post_tag.tag_id \
                RIGHT JOIN feed ON post_tag.post_id = feed.post_id AND feed.feed_type= %s" % feed_type
        return self.where(where).join(join).count()