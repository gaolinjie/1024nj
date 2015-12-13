#!/usr/bin/env python
# coding=utf-8
#
# Copyright 2013 meiritugua.com

import time
from lib.query import Query

class Post_nodeModel(Query):
    def __init__(self, db):
        self.db = db
        self.table_name = "post_node"
        super(Post_nodeModel, self).__init__()

    def add_new_post_node(self, post_node_info):
        return self.data(post_node_info).add()

    def get_bbs_posts_by_node(self, node_id, num = 10, current_page = 1):
        where = "post_node.node_id = %s" % node_id
        join = "LEFT JOIN post ON post_node.post_id = post.id\
        		LEFT JOIN user AS author_user ON post.author_id = author_user.uid\
                LEFT JOIN user AS last_reply_user ON post.last_reply = last_reply_user.uid\
                LEFT JOIN node ON post_node.node_id = node.id"
        order = "post.created DESC, post.id DESC"
        field = "post.*, \
                author_user.username as author_username, \
                author_user.avatar as author_avatar, \
                last_reply_user.username as last_reply_username, \
                node.name as node_name"
        return self.where(where).order(order).join(join).field(field).pages(current_page = current_page, list_rows = num)

    def get_bbs_posts_by_node_count(self, node_id):
        where = "post_node.node_id = %s" % node_id
        return self.where(where).count()

    def get_node_by_post_id(self, post_id):
        where = "post_node.post_id = %s" % post_id
        join = "LEFT JOIN node ON post_node.node_id = node.id"
        field = "node.*, \
        		post_node.id as post_node_id"
        return self.where(where).join(join).field(field).find()

    def update_post_node_by_post_node_id(self, post_node_id, post_node_info):
        where = "post_node.id = %s" % post_node_id
        return self.where(where).data(post_node_info).save()