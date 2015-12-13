#!/usr/bin/env python
# coding=utf-8
#
# Copyright 2013 mifan.tv

from lib.query import Query

class AvatarModel(Query):
    def __init__(self, db):
        self.db = db
        self.table_name = "avatar"
        super(AvatarModel, self).__init__()


    def get_rand_avatar(self, gender):
        where = "avatar.gender = '%s'" % gender
        order = "RAND()"
        limit = "1"
        return self.where(where).order(order).limit(limit).select()


