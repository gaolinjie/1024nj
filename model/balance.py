#!/usr/bin/env python
# coding=utf-8
#
# Copyright 2013 mifan.tv

from lib.query import Query

class BalanceModel(Query):
    def __init__(self, db):
        self.db = db
        self.table_name = "balance"
        super(BalanceModel, self).__init__()

    def add_new_balance(self, balance_info):
        return self.data(balance_info).add()

    def get_user_balances(self, author_id,  num = 10, current_page = 1):
        where = "balance.author_id = %s" % author_id
        join = "LEFT JOIN balance_type ON balance.balance_type = balance_type.id \
                LEFT JOIN post ON balance.post_id = post.id \
                LEFT JOIN reply ON balance.reply_id = reply.id \
                LEFT JOIN user  ON balance.user_id = user.uid "
        order = "balance.created DESC, balance.id DESC"
        field = "balance.*, \
                balance_type.type_name as type_name, \
                balance_type.balance_text1 as balance_text1, \
                balance_type.balance_text2 as balance_text2, \
                user.username as user_name, \
                post.title as post_title"
        return self.where(where).order(order).join(join).field(field).pages(current_page = current_page, list_rows = num)
