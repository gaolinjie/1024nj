#!/usr/bin/env python
# coding=utf-8
#
# Copyright 2013 mifan.tv

from lib.query import Query

class PostModel(Query):
    def __init__(self, db):
        self.db = db
        self.table_name = "post"
        super(PostModel, self).__init__()

    def add_new_post(self, post_info):
        return self.data(post_info).add()

    def get_post_by_post_id2(self, post_id, user_id):
        where = "post.id = %s" % post_id
        join = "LEFT JOIN user AS author_user ON post.author_id = author_user.uid\
                LEFT JOIN post_node ON post.id = post_node.post_id\
                LEFT JOIN node ON post_node.node_id = node.id\
                LEFT JOIN vote ON vote.author_id = %s AND post.id = vote.obj_id AND vote.obj_type = 'post'" % user_id
        field = "post.*, \
                author_user.username as author_name, \
                author_user.avatar as author_avatar, \
                author_user.sign as author_sign, \
                node.name as node_name, \
                vote.up_down as vote_up_down"
        return self.where(where).join(join).field(field).find()

    def get_post_by_post_id(self, post_id):
        where = "post.id = %s" % post_id
        join = "LEFT JOIN user AS author_user ON post.author_id = author_user.uid"
        field = "post.*, \
                author_user.username as author_username, \
                author_user.avatar as author_avatar, \
                author_user.sign as author_sign"
        return self.where(where).join(join).field(field).find()

    def update_post_by_post_id(self, post_id, post_info):
        where = "post.id = %s" % post_id
        return self.where(where).data(post_info).save()

    def delete_post_by_post_id(self, post_id):
        where = "post.id = %s" % post_id
        return self.where(where).delete()

    def get_user_all_posts(self, author_id, num = 10, current_page = 1):
        where = "post.author_id = %s" % author_id
        join = "LEFT JOIN user AS author_user ON post.author_id = author_user.uid\
                LEFT JOIN user AS last_reply_user ON post.last_reply = last_reply_user.uid\
                LEFT JOIN post_node ON post.id = post_node.post_id\
                LEFT JOIN node ON post_node.node_id = node.id"
        order = "post.created DESC, post.id DESC"
        field = "post.*, \
                author_user.username as author_username, \
                author_user.avatar as author_avatar, \
                last_reply_user.username as last_reply_username, \
                node.name as node_name"
        return self.where(where).order(order).join(join).field(field).pages(current_page = current_page, list_rows = num)

    def get_user_all_posts_count(self, author_id):
        where = "post.author_id = %s" % author_id
        return self.where(where).count()

    def get_all_bbs_posts(self, num = 20, current_page = 1):
        where = "post.post_type = 'bbs'"
        join = "LEFT JOIN user AS author_user ON post.author_id = author_user.uid\
                LEFT JOIN user AS last_reply_user ON post.last_reply = last_reply_user.uid\
                LEFT JOIN post_node ON post.id = post_node.post_id\
                LEFT JOIN node ON post_node.node_id = node.id"
        order = "post.created DESC, post.id DESC"
        field = "post.*, \
                author_user.username as author_username, \
                author_user.avatar as author_avatar, \
                last_reply_user.username as last_reply_username, \
                node.name as node_name"
        return self.where(where).order(order).join(join).field(field).pages(current_page = current_page, list_rows = num)

    def get_all_hot_posts(self, num = 20, current_page = 1):
        where = "post.feed_type = 'hot'"
        join = "LEFT JOIN user AS author_user ON post.author_id = author_user.uid\
                LEFT JOIN user AS last_reply_user ON post.last_reply = last_reply_user.uid\
                LEFT JOIN post_node ON post.id = post_node.post_id\
                LEFT JOIN node ON post_node.node_id = node.id"
        order = "post.created DESC, post.id DESC"
        field = "post.*, \
                author_user.username as author_username, \
                author_user.avatar as author_avatar, \
                last_reply_user.username as last_reply_username, \
                node.name as node_name"
        return self.where(where).order(order).join(join).field(field).pages(current_page = current_page, list_rows = num)

    def get_hot_bbs_posts(self, num = 10, current_page = 1):
        where = "post.post_type = 'bbs'"
        join = "LEFT JOIN user AS author_user ON post.author_id = author_user.uid\
                LEFT JOIN user AS last_reply_user ON post.last_reply = last_reply_user.uid\
                LEFT JOIN post_node ON post.id = post_node.post_id\
                LEFT JOIN node ON post_node.node_id = node.id"
        order = "post.reply_num DESC, post.up_num DESC, post.created DESC, post.id DESC"
        field = "post.*, \
                author_user.username as author_username, \
                author_user.avatar as author_avatar, \
                last_reply_user.username as last_reply_username, \
                node.name as node_name"
        return self.where(where).order(order).join(join).field(field).pages(current_page = current_page, list_rows = num)