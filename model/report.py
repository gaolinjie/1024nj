#!/usr/bin/env python
# coding=utf-8
#
# Copyright 2013 mifan.tv

from lib.query import Query

class ReportModel(Query):
    def __init__(self, db):
        self.db = db
        self.table_name = "report"
        super(ReportModel, self).__init__()

    def delete_report_by_id(self, report_id):
        where = "report.id = %s " % report_id
        return self.where(where).delete()

    def delete_report_by_post_id(self, post_id):
        where = "report.obj_id = %s AND report.obj_type = 'post'" % post_id
        return self.where(where).delete()

    def delete_report_by_reply_id(self, reply_id):
        where = "report.obj_id = %s AND report.obj_type = 'reply'" % reply_id
        return self.where(where).delete()

    def add_new_report(self, report_info):
        return self.data(report_info).add()

    def get_report(self, from_user, to_user, obj_id, obj_type):
        where = "from_user = %s AND to_user = %s AND obj_id = %s AND obj_type = '%s'" % (from_user, to_user, obj_id, obj_type)
        return self.where(where).find()



