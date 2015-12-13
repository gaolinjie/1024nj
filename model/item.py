#!/usr/bin/env python
# coding=utf-8
#
# Copyright 2013 mifan.tv

from lib.query import Query

class ItemModel(Query):
    def __init__(self, db):
        self.db = db
        self.table_name = "item"
        super(ItemModel, self).__init__()

    def get_item_by_id(self, id):
        where = "id = %s" % id
        return self.where(where).find()

    def get_item_by_sku_and_vendor(self, sku, vendor):
        where = "sku = %s AND vendor = '%s'" % (sku, vendor)
        return self.where(where).find()

    def get_item_by_sku_and_vendor2(self, sku, vendor):
        where = "sku = '%s' AND vendor = '%s'" % (sku, vendor)
        return self.where(where).find()

    def delete_item_by_id(self, id):
        where = "id = %s " % id
        return self.where(where).delete()

    def update_item_by_id(self, id, item_info):
        where = "id = %s" % id
        return self.where(where).data(item_info).save()

    def add_new_item(self, item_info):
        return self.data(item_info).add()

    def get_rand_items(self):
        order = "RAND()"
        limit = "3"
        return self.order(order).limit(limit).select()