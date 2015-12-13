#!/usr/bin/env python
# coding=utf-8
#
# Copyright 2013 mifan.tv

from lib.query import Query

class ReplyModel(Query):
    def __init__(self, db):
        self.db = db
        self.table_name = "reply"
        super(ReplyModel, self).__init__()


    def add_new_reply(self, reply_info):
        return self.data(reply_info).add()

    def get_post_all_replys_sort_by_voted(self, post_id, user_id, num = 50, current_page = 1):
        where = "reply.post_id = %s" % post_id
        join = "LEFT JOIN user ON reply.author_id = user.uid \
                LEFT JOIN vote ON vote.author_id = %s AND reply.id = vote.obj_id AND vote.obj_type = 'reply'\
                LEFT JOIN thank ON thank.from_user = %s AND thank.to_user = reply.author_id AND thank.obj_id = reply.id AND thank.obj_type = 'reply' \
                LEFT JOIN report ON report.from_user = %s AND report.to_user = reply.author_id AND report.obj_id = reply.id AND report.obj_type = 'reply'" % (user_id, user_id, user_id)
        order = "reply.up_num DESC, reply.down_num ASC,  reply.created ASC"
        field = "reply.*, \
                user.username as author_username, \
                user.sign as author_sign, \
                user.avatar as author_avatar, \
                vote.up_down as vote_up_down, \
                thank.id as reply_thank_id, \
                report.id as reply_report_id"
        return self.where(where).order(order).join(join).field(field).pages(current_page = current_page, list_rows = num)

    def get_post_all_replys_sort_by_voted2(self, post_id, num = 50, current_page = 1):
        where = "reply.post_id = %s" % post_id
        join = "LEFT JOIN user ON reply.author_id = user.uid"
        order = "reply.up_num DESC, reply.down_num ASC, reply.created ASC"
        field = "reply.*, \
                user.username as author_username, \
                user.sign as author_sign, \
                user.avatar as author_avatar"
        return self.where(where).order(order).join(join).field(field).pages(current_page = current_page, list_rows = num)

    def get_post_all_replys_sort_by_created(self, post_id, user_id, num = 50, current_page = 1):
        where = "reply.post_id = %s" % post_id
        join = "LEFT JOIN user ON reply.author_id = user.uid \
                LEFT JOIN vote ON vote.author_id = %s AND reply.id = vote.reply_id \
                LEFT JOIN thank ON thank.from_user = %s AND thank.to_user = reply.author_id AND thank.obj_id = reply.id AND thank.obj_type = 'reply' \
                LEFT JOIN report ON report.from_user = %s AND report.to_user = reply.author_id AND report.obj_id = reply.id AND report.obj_type = 'reply'" % (user_id, user_id, user_id)
        order = "reply.created ASC, reply.id ASC"
        field = "reply.*, \
                user.username as author_username, \
                user.sign as author_sign, \
                user.avatar as author_avatar, \
                vote.up_down as vote_up_down, \
                thank.id as reply_thank_id, \
                report.id as reply_report_id"
        return self.where(where).order(order).join(join).field(field).pages(current_page = current_page, list_rows = num)

    def get_post_all_replys_sort_by_created2(self, post_id, num = 50, current_page = 1):
        where = "reply.post_id = %s" % post_id
        join = "LEFT JOIN user ON reply.author_id = user.uid"
        order = "reply.created ASC, reply.id ASC"
        field = "reply.*, \
                user.username as author_username, \
                user.sign as author_sign, \
                user.avatar as author_avatar"
        return self.where(where).order(order).join(join).field(field).pages(current_page = current_page, list_rows = num)

    def get_reply_by_id(self, reply_id):
        where = "reply.id = %s" % reply_id
        return self.where(where).find()

    def update_reply_by_id(self, reply_id, reply_info):
        where = "reply.id = %s" % reply_id
        return self.where(where).data(reply_info).save()


    def delete_reply_by_id(self, reply_id):
        where = "reply.id = %s " % reply_id
        return self.where(where).delete()

    def get_user_all_replys(self, author_id, num = 10, current_page = 1):
        where = "reply.author_id = %s" % author_id
        join = "LEFT JOIN post ON reply.post_id = post.id\
                LEFT JOIN user AS author_user ON reply.author_id = author_user.uid"
        order = "reply.created DESC, reply.id DESC"
        field = "reply.*, \
                author_user.username as author_username, \
                author_user.avatar as author_avatar, \
                post.title as post_title"
        return self.where(where).order(order).join(join).field(field).pages(current_page = current_page, list_rows = num)

    def get_user_all_replys_count(self, author_id):
        where = "reply.author_id = %s" % author_id
        return self.where(where).count()