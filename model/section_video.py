#!/usr/bin/env python
# coding=utf-8
#
# Copyright 2013 mifan.tv

from lib.query import Query

class Section_videoModel(Query):
    def __init__(self, db):
        self.db = db
        self.table_name = "section_video"
        super(Section_videoModel, self).__init__()

    def add_new_section_video(self, section_video_info):
        return self.data(section_info).add()

    def delete_section_video_by_id(self, section_video_id):
        where = "section_video.id = %s " % section_video_id
        return self.where(where).delete()