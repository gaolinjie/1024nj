#!/usr/bin/env python
# coding=utf-8
#
# Copyright 2013 mifan.tv

from lib.query import Query

class NoticeModel(Query):
    def __init__(self, db):
        self.db = db
        self.table_name = "notice"
        super(NoticeModel, self).__init__()

    def add_new_notice(self, notice_info):
        return self.data(notice_info).add()


    def get_user_all_notices(self, author_id, num = 10, current_page = 1):
        where = "notice.author_id = %s" % author_id
        join = "LEFT JOIN user ON notice.user_id = user.uid \
                LEFT JOIN post ON notice.post_id = post.id \
                LEFT JOIN reply ON notice.reply_id = reply.id \
                LEFT JOIN notice_type ON notice.notice_type = notice_type.id"
        order = "notice.created DESC, notice.id DESC"
        field = "notice.*, \
                user.username as username, \
                user.avatar as avatar, \
                post.id as post_id, \
                post.title as post_title, \
                post.content as post_content, \
                reply.id as reply_id, \
                reply.content as reply_content,\
                notice_type.notice_text as notice_text"
        return self.where(where).order(order).join(join).field(field).pages(current_page = current_page, list_rows = num)

    def get_user_unread_notice_count(self, author_id):
        where = "notice.readed = 0 AND notice.author_id = %s" % author_id
        return self.where(where).count()

    def get_user_all_notice_count(self, author_id):
        where = "notice.author_id = %s" % author_id
        return self.where(where).count()

    def set_user_notice_as_read(self, author_id):
        where = "notice.author_id = %s" % author_id
        return self.data({
            "readed": 1
        }).where(where).save()

    def delete_notice_by_reply_id(self, reply_id):
        where = "notice.reply_id = %s " % reply_id
        return self.where(where).delete()



