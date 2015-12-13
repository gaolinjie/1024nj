#!/usr/bin/env python
# coding=utf-8
#
# Copyright 2013 mifan.tv

from lib.query import Query

class FeedModel(Query):
    def __init__(self, db):
        self.db = db
        self.table_name = "feed"
        super(FeedModel, self).__init__()

    def add_new_feed(self, feed_info):
        return self.data(feed_info).add()

    def delete_feed_by_id(self, feed_id):
        where = "feed.id = %s " % feed_id
        return self.where(where).delete()

    def delete_feed_by_post_id(self, post_id):
        where = "feed.post_id = %s " % post_id
        return self.where(where).delete()

    def get_index_feeds(self, feed_type, post_type, time1, time2, num = 6, current_page = 1):
        where = "feed.feed_type = '%s' AND feed.post_type = '%s' AND (feed.updated between '%s' and '%s')" % (feed_type, post_type, time1, time2)
        order = "feed.updated DESC, feed.created DESC, feed.id DESC"
        field = "feed.*"
        return self.where(where).order(order).field(field).pages(current_page = current_page, list_rows = num)


