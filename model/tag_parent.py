#!/usr/bin/env python
# coding=utf-8
#
# Copyright 2013 mifan.tv

from lib.query import Query

class Tag_parentModel(Query):
    def __init__(self, db):
        self.db = db
        self.table_name = "tag_parent"
        super(Tag_parentModel, self).__init__()

    def add_new_tag_parent(self, tag_parent_info):
        return self.data(tag_parent_info).add()

    def get_parent_tags(self, tag_id, num = 10, current_page = 1):
        where = "tag_parent.tag_id = %s" % tag_id
        join = "LEFT JOIN tag AS parent_tag ON tag_parent.parent_id = parent_tag.id "
        order = "parent_tag.post_num DESC, parent_tag.id DESC"
        field = "parent_tag.name as tag_name, \
                 parent_tag.thumb as tag_thumb"
        return self.where(where).order(order).join(join).field(field).pages(current_page = current_page, list_rows = num)

    def get_child_tags(self, tag_id, num = 10, current_page = 1):
        where = "tag_parent.parent_id = %s" % tag_id
        join = "LEFT JOIN tag AS child_tag ON tag_parent.tag_id = child_tag.id "
        order = "child_tag.post_num DESC, child_tag.id DESC"
        field = "child_tag.name as tag_name, \
                 child_tag.thumb as tag_thumb"
        return self.where(where).order(order).join(join).field(field).pages(current_page = current_page, list_rows = num)

