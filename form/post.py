#!/usr/bin/env python
# coding=utf-8
#
# Copyright 2013 meiritugua.com

from wtforms import TextField, HiddenField, validators
from lib.forms import Form


class NewForm(Form):
     title = TextField('Title', [
         validators.Required(message = "请填写帖子标题"),
         validators.Length(min = 3, message = "帖子标题长度过短（3-100个字符）"),
         validators.Length(max = 100, message = "帖子标题长度过长（3-100个字符）"),
     ])

     content = TextField('Content', [
         validators.Required(message = "请填写帖子简介"),
     ])
 
     node= TextField('Node', [
         validators.Required(message = "请填写帖子节点"),
     ])


class EditTagForm(Form):
     name = TextField('Name', [
         validators.Required(message = "请填写标签名称"),
         validators.Length(min = 3, message = "标签名称长度过短（3-100个字符）"),
         validators.Length(max = 100, message = "标签名称长度过长（3-100个字符）"),
     ])

     intro = TextField('Intro', [
         validators.Optional(),
     ])

     category = TextField('Category', [
         validators.Optional(),
     ])

     tag_type = TextField('Tag_type', [
         validators.Optional(),
     ])

     tag = TextField('Tag', [
         validators.Optional(),
     ])
    
