#!/usr/bin/env python
# coding=utf-8
#
# Copyright 2013 mifan.tv

from lib.query import Query

class Object_videoModel(Query):
    def __init__(self, db):
        self.db = db
        self.table_name = "object_video"
        super(Object_videoModel, self).__init__()

    def add_new_object_video(self, object_video_info):
        return self.data(section_info).add()

    def delete_object_video_by_id(self, object_video_id):
        where = "object_video.id = %s " % object_video_id
        return self.where(where).delete()

    def get_post_videos(self, post_id):
        where = "object_video.obj_id = %s AND object_video.obj_type = 'post'" % post_id
        join = "LEFT JOIN video ON object_video.video_id = video.id\
        		LEFT JOIN section_video ON video.id = section_video.video_id AND object_video.obj_id = section_video.post_id\
        		LEFT JOIN section ON section_video.section_id = section.id"
        order = "object_video.order_num DESC, section.id ASC, video.created DESC, video.id DESC"
        field = "video.*, \
                section.section_name as section_name"
        return self.where(where).join(join).order(order).field(field).select()