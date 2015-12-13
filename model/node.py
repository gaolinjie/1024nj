#!/usr/bin/env python
# coding=utf-8
#
# Copyright 2013 meiritugua.com

import time
from lib.query import Query

class NodeModel(Query):
    def __init__(self, db):
        self.db = db
        self.table_name = "node"
        super(NodeModel, self).__init__()

    def get_all_nodes(self):
        order = "node.post_num DESC, node.id DESC"
        return self.order(order).select()

    def get_node_by_node_name(self, node_name):
        where = "node.name = '%s'" % node_name
        return self.where(where).find()

    def get_nodes_by_category(self, category_id):
        where = "node.category = %s" % category_id
        order = "node.post_num DESC, node.id DESC"
        return self.where(where).order(order).select()