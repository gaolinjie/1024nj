#!/usr/bin/env python
# coding=utf-8
#
# Copyright 2013 mifan.tv

from lib.query import Query

class NavModel(Query):
    def __init__(self, db):
        self.db = db
        self.table_name = "nav"
        super(NavModel, self).__init__()

    def get_all_navs_by_type(self, nav_type):
        where = "nav.nav_type = '%s' AND is_sub = 0" % nav_type
        order = "nav.order_num ASC, nav.id ASC"
        return self.where(where).order(order).select()

    def get_all_subnavs_by_type(self, nav_type):
        where = "nav.nav_type = '%s' AND is_sub = 1" % nav_type
        order = "nav.order_num ASC, nav.id ASC"
        return self.where(where).order(order).select()

    def delete_nav_by_id(self, nav_id):
        where = "nav.id = %s " % nav_id
        return self.where(where).delete()

    def update_nav_by_id(self, nav_id, nav_info):
        where = "nav.id = %s" % nav_id
        return self.where(where).data(nav_info).save()

    def add_new_nav(self, nav_info):
        return self.data(nav_info).add()

    def get_nav_by_nav_id(self, nav_id):
        where = "nav.id = %s" % nav_id
        return self.where(where).find()