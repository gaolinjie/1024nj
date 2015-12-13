#!/usr/bin/env python
# coding=utf-8
#
# Copyright 2013 mifan.tv

from lib.query import Query

class InviteModel(Query):
    def __init__(self, db):
        self.db = db
        self.table_name = "invite"
        super(InviteModel, self).__init__()

    def delete_invite_by_id(self, invite_id):
        where = "invite.id = %s " % invite_id
        return self.where(where).delete()

    def delete_invite_by_post_id(self, post_id):
        where = "invite.post_id = %s" % post_id
        return self.where(where).delete()


    def add_new_invite(self, invite_info):
        return self.data(invite_info).add()

    def get_invite(self, from_user, to_user, post_id):
        where = "from_user = %s AND to_user = %s AND post_id = %s" % (from_user, to_user, post_id)
        return self.where(where).find()

    def get_user_invites(self, to_user, num = 10, current_page = 1):
        where = "invite.to_user = %s" % to_user
        join = "LEFT JOIN user AS author_user ON invite.from_user = author_user.uid \
                LEFT JOIN post ON invite.post_id = post.id"
        order = "invite.created DESC, invite.id DESC"
        field = "invite.*, \
                author_user.username as author_username, \
                author_user.avatar as author_avatar, \
                post.id as post_id, \
                post.title as post_title, \
                post.content as post_content"
        return self.where(where).order(order).join(join).field(field).pages(current_page = current_page, list_rows = num)


    def get_user_unread_invite_count(self, author_id):
        where = "invite.readed = 0 AND invite.to_user = %s" % author_id
        return self.where(where).count()

    def set_user_invite_as_read(self, author_id):
        where = "invite.to_user = %s" % author_id
        return self.data({
            "readed": 1
        }).where(where).save()


