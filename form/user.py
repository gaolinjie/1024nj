#!/usr/bin/env python
# coding=utf-8
#
# Copyright 2013 mifan.tv

from wtforms import TextField, validators
from lib.forms import Form

class SignupForm(Form):
    username = TextField('Username', [
        validators.Required(message = "必须填写用户名"),
        validators.Length(min = 3, message = "用户名长度过短（3-16个字符）"),
        validators.Length(max = 16, message = "用户名长度过长（2-16个字符）"),
        validators.Regexp(u"^(?!_)(?!.*?_$)(?!\d+)[a-zA-Z0-9_\u4e00-\u9fa5]+$", message = "用户名格式错误（中英文，数字，'_'构成，'_'不可在首尾，也不能全为数字）"),
    ])

    email = TextField('Email', [
        validators.Required(message = "必须填写Email"),
        validators.Length(min = 4, message = "Email长度有误"),
        validators.Email(message = "Email地址无效"),
    ])

    password = TextField('Password', [
        validators.Required(message = "必须填写密码"),
        validators.Length(min = 6, message = "密码长度过短（6-64个字符）"),
        validators.Length(max = 64, message = "密码长度过长（6-64个字符）"),
        #validators.EqualTo('password_confirm', message='两次输入密码不一致'),
    ])

    password_confirm = TextField('Password_confirm')

    geetest_challenge = TextField('Geetest_challenge', [
        validators.Required(message = "验证码验证失败"),
    ])
    geetest_validate = TextField('Geetest_validate', [
        validators.Required(message = "验证码验证失败"),
    ])
    geetest_seccode = TextField('Geetest_seccode', [
        validators.Required(message = "验证码验证失败"),
    ])

    #invite = TextField('Invite', [
    #    validators.Required(message = "必须填写邀请码"),
    #])

    gender = TextField('Gender', [
        validators.Optional(),
    ])

class SigninForm(Form):
    email = TextField('Email', [
        validators.Required(message = "必须填写Email"),
        validators.Length(min = 4, message = "Email长度有误"),
        validators.Email(message = "Email地址无效"),
    ])

    password = TextField('Password', [
        validators.Required(message = "必须填写密码"),
        validators.Length(min = 6, message = "密码长度过短（6-64个字符）"),
        validators.Length(max = 64, message = "密码长度过长（6-64个字符）"),
    ])

class ForgotPasswordForm(Form):
    username = TextField('Username', [
        validators.Required(message = "必须填写用户名"),
        validators.Length(min = 3, message = "用户名长度过短（3-12个字符）"),
        validators.Length(max = 12, message = "用户名长度过长（3-12个字符）"),
        validators.Regexp("^[a-zA-Z][a-zA-Z0-9_]*$", message = "用户名格式错误（英文字母开头，数字，下划线构成）"),
    ])

    email = TextField('Email', [
        validators.Required(message = "必须填写Email"),
        validators.Length(min = 4, message = "Email长度有误"),
        validators.Email(message = "Email地址无效"),
    ])

class SettingPasswordForm(Form):
    password_old = TextField('Password_old', [
        validators.Required(message = "必须填写当前密码"),
        validators.Length(min = 6, message = "密码长度过短（6-64个字符）"),
        validators.Length(max = 64, message = "密码长度过长（6-64个字符）"),
    ])

    password = TextField('Password', [
        validators.Required(message = "必须填写新密码"),
        validators.Length(min = 6, message = "密码长度过短（6-64个字符）"),
        validators.Length(max = 64, message = "密码长度过长（6-64个字符）"),
        validators.EqualTo('password_confirm', message='两次输入密码不一致'),
    ])

    password_confirm = TextField('Password_confirm')

class SettingForm(Form):
    username = TextField('Username') # readonly
    email = TextField('Email') # readonly
    sign = TextField('Sign', [
        validators.Optional(),
    ])
    gender = TextField('Gender', [
        validators.Optional(),
    ])
    location = TextField('Location', [
        validators.Optional(),
    ])
    business = TextField('Business', [
        validators.Optional(),
    ])
    edu = TextField('Edu', [
        validators.Optional(),
    ])
    company = TextField('Company', [
        validators.Optional(),
    ])
    website = TextField('Website', [
        validators.Optional(),
        validators.Length(min = 4, message = "网址长度过短（4-30个字符）"),
        validators.Length(max = 30, message = "网址长度过长（4-30个字符）"),
    ])
    intro = TextField('Intro', [
        validators.Optional(),
    ])

class SocialForm(Form):
    weibo = TextField('Weibo', [
        validators.Optional(),
    ])
    qzone = TextField('Qzone', [
        validators.Optional(),
    ])
    douban = TextField('Douban', [
        validators.Optional(),
    ])
    renren = TextField('Renren', [
        validators.Optional(),
    ])