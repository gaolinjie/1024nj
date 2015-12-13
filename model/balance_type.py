#!/usr/bin/env python
# coding=utf-8
#
# Copyright 2013 mifan.tv

from lib.query import Query

class Balance_typeModel(Query):
    def __init__(self, db):
        self.db = db
        self.table_name = "balance_type"
        super(Balance_typeModel, self).__init__()
