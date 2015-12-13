#!/usr/bin/env python
# coding=utf-8
#
# Copyright 2013 mifan.tv

from lib.query import Query

class Like_itemModel(Query):
    def __init__(self, db):
        self.db = db
        self.table_name = "like_item"
        super(Like_itemModel, self).__init__()

    def get_like_by_author_and_item(self, author_id, item_id):
        where = "author_id = %s AND item_id = %s" % (author_id, item_id)
        return self.where(where).find()

    def add_new_like(self, like_info):
        return self.data(like_info).add()


