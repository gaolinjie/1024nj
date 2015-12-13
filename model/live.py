#!/usr/bin/env python
# coding=utf-8
#
# Copyright 2013 mifan.tv

from lib.query import Query

class LiveModel(Query):
    def __init__(self, db):
        self.db = db
        self.table_name = "live"
        super(LiveModel, self).__init__()

    def add_new_live(self, live_info):
        return self.data(live_info).add()

    def delete_live_by_id(self, live_id):
        where = "live.id = %s " % live_id
        return self.where(where).delete()

    def delete_live_by_post_id(self, post_id):
        where = "live.post_id = %s " % post_id
        return self.where(where).delete()

    def get_index_lives(self, time1, time2):
        where = "live.date between '%s' and '%s'" % (time1, time2)
        order = "live.date ASC, live.id ASC"
        field = "live.*"
        return self.where(where).order(order).field(field).select()

    def get_index_lives_with_follow(self, user_id, time1, time2):
        where = "live.date between '%s' and '%s'" % (time1, time2)
        join = "LEFT JOIN follow ON live.id = follow.obj_id AND 'l' = follow.obj_type AND follow.author_id = %s" % user_id
        order = "live.date ASC, live.id ASC"
        field = "live.*, \
                follow.id as follow_id"
        return self.where(where).order(order).join(join).field(field).select()