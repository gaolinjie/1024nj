#!/usr/bin/env python
# coding=utf-8
#
# Copyright 2013 mifan.tv

from lib.query import Query

class SectionModel(Query):
    def __init__(self, db):
        self.db = db
        self.table_name = "section"
        super(SectionModel, self).__init__()

    def add_new_section(self, section_info):
        return self.data(section_info).add()

    def delete_section_by_id(self, section_id):
        where = "section.id = %s " % section_id
        return self.where(where).delete()