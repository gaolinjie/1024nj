#!/usr/bin/env python
# coding=utf-8
#
# Copyright 2013 mifan.tv

from lib.query import Query

class CategoryModel(Query):
    def __init__(self, db):
        self.db = db
        self.table_name = "category"
        super(CategoryModel, self).__init__()

    def get_tag_categorys(self):
        order = "category.id DESC"
        return self.order(order).select()

    def get_category_by_name(self, category_name):
        where = "name = '%s'" % category_name
        return self.where(where).find()

    def get_category_by_id(self, category_id):
        where = "id = '%s'" % category_id
        return self.where(where).find()

    def update_category_by_id(self, category_id, category_info):
        where = "category.id = %s" % category_id
        return self.where(where).data(category_info).save()

    def get_all_categorys(self):
        order = "category.order_num DESC, category.id DESC"
        return self.order(order).select()


