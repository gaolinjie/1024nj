#!/usr/bin/env python
# coding=utf-8
#
# Copyright 2013 mifan.tv

from lib.query import Query

class Feed_typeModel(Query):
    def __init__(self, db):
        self.db = db
        self.table_name = "feed_type"
        super(Feed_typeModel, self).__init__()


