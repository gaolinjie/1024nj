#!/usr/bin/env python
# coding=utf-8
#
# Copyright 2013 mifan.tv

from lib.query import Query

class Tag_typeModel(Query):
    def __init__(self, db):
        self.db = db
        self.table_name = "tag_type"
        super(Tag_typeModel, self).__init__()

    def get_tag_types(self):
        order = "tag_type.id DESC"
        return self.order(order).select()

    def get_tag_type_by_name(self, type_name):
        where = "name = '%s'" % type_name
        return self.where(where).find()

    def get_tag_type_by_id(self, type_id):
        where = "id = '%s'" % type_id
        return self.where(where).find()

    def update_tag_type_by_id(self, type_id, type_info):
        where = "tag_type.id = %s" % type_id
        return self.where(where).data(type_info).save()


