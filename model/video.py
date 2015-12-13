#!/usr/bin/env python
# coding=utf-8
#
# Copyright 2013 mifan.tv

from lib.query import Query

class VideoModel(Query):
    def __init__(self, db):
        self.db = db
        self.table_name = "video"
        super(VideoModel, self).__init__()

    def add_new_video(self, video_info):
        return self.data(video_info).add()

    def delete_video_by_id(self, video_id):
        where = "video.id = %s " % video_id
        return self.where(where).delete()

    def delete_video_by_post_id(self, post_id):
        where = "video.post_id = %s " % post_id
        return self.where(where).delete()
