#!/usr/bin/env python
# coding=utf-8
#
# Copyright 2013 mifan.tv

from lib.query import Query

class VoteModel(Query):
    def __init__(self, db):
        self.db = db
        self.table_name = "vote"
        super(VoteModel, self).__init__()

    def get_vote_by_user_and_reply(self, author_id, reply_id):
        where = "vote.author_id = %s AND vote.obj_id = %s AND vote.obj_type = 'reply'" % (author_id, reply_id)
        return self.where(where).find()

    def get_vote_by_user_and_post(self, author_id, post_id):
        where = "vote.author_id = %s AND vote.post_id = %s AND vote.obj_type = 'post'" % (author_id, post_id)
        return self.where(where).find()

    def delete_vote_by_id(self, vote_id):
        where = "vote.id = %s " % vote_id
        return self.where(where).delete()

    def delete_vote_by_reply_id(self, reply_id):
        where = "vote.obj_id = %s AND vote.obj_type = 'reply'" % reply_id
        return self.where(where).delete()

    def update_vote_by_id(self, vote_id, vote_info):
        where = "vote.id = %s" % vote_id
        return self.where(where).data(vote_info).save()

    def add_new_vote(self, vote_info):
        return self.data(vote_info).add()
'''
    def get_reply_all_up_votes(self, reply_id, num = 3, current_page = 1):
        where = "vote.reply_id = %s AND vote.up_down = 'up'" % reply_id
        join = "LEFT JOIN user ON vote.author_id = user.uid"
        order = "vote.created DESC, vote.id DESC"
        field = "vote.*, \
                user.username as author_username, \
                user.sign as author_sign, \
                user.avatar as author_avatar"
        return self.where(where).order(order).join(join).field(field).pages(current_page = current_page, list_rows = num)
'''
