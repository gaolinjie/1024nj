#!/usr/bin/env python
# coding=utf-8
#
# Copyright 2013 mifan.tv

from lib.query import Query

class AdsModel(Query):
    def __init__(self, db):
        self.db = db
        self.table_name = "ads"
        super(AdsModel, self).__init__()


    def get_ad_by_id(self, ad_id):
        where = "ads.id = '%s'" % ad_id
        return self.where(where).find()

    def get_rand_ad(self,):
        where = "ads.show = 1"
        order = "RAND()"
        limit = "1"
        return self.where(where).order(order).limit(limit).find()



