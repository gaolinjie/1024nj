
INSERT INTO `post_node` VALUES (1, 1, 1);

INSERT INTO `category` VALUES (1, '足球', 0);
INSERT INTO `category` VALUES (2, 'NBA', 0);

INSERT INTO `node` VALUES (1, "广州恒大", "", "", 1, 0, 0, "2015-08-27 00:00:00");
INSERT INTO `node` VALUES (2, "皇马", "", "", 1, 0, 0, "2015-08-27 00:00:00");
INSERT INTO `node` VALUES (3, "亚冠", "", "", 1, 0, 0, "2015-08-27 00:00:00");

INSERT INTO `node` VALUES (4, "亚锦赛", "", "", 2, 0, 0, "2015-08-27 00:00:00");
INSERT INTO `node` VALUES (5, "林书豪", "", "", 2, 0, 0, "2015-08-27 00:00:00");
INSERT INTO `node` VALUES (6, "勇士", "", "", 2, 0, 0, "2015-08-27 00:00:00");

INSERT INTO `nav` VALUES (1, "全部", NULL, "basketball", 1, NULL, 0);
INSERT INTO `nav` VALUES (2, "骑士", 1, "basketball", 2, NULL, 0);
INSERT INTO `nav` VALUES (3, "湖人", 1, "basketball", 3, NULL, 0);
INSERT INTO `nav` VALUES (4, "火箭", 1, "basketball", 4, NULL, 0);
INSERT INTO `nav` VALUES (5, "中国男篮", 1, "basketball", 5, NULL, 0);
INSERT INTO `nav` VALUES (6, "雷霆", 1, "basketball", 6, NULL, 0);
INSERT INTO `nav` VALUES (7, "快船", 1, "basketball", 7, NULL, 0);
INSERT INTO `nav` VALUES (8, "马刺", 1, "basketball", 8, NULL, 0);
INSERT INTO `nav` VALUES (9, "热火", 1, "basketball", 9, NULL, 0);
INSERT INTO `nav` VALUES (10, "公牛", 1, "basketball", 10, NULL, 0);
INSERT INTO `nav` VALUES (11, "小牛", 1, "basketball", 11, NULL, 0);
INSERT INTO `nav` VALUES (12, "勇士", 1, "basketball", 12, NULL, 0);
INSERT INTO `nav` VALUES (13, "老鹰", 1, "basketball", 13, NULL, 0);
INSERT INTO `nav` VALUES (14, "诸强", NULL, "basketball", 14, NULL, 0);
INSERT INTO `nav` VALUES (15, "其他", NULL, "basketball", 15, NULL, 0);

INSERT INTO `nav` VALUES (16, "推荐视频", NULL, "basketball", 1, 1, 1);
INSERT INTO `nav` VALUES (17, "最新视频", NULL, "basketball", 2, 1, 1);
INSERT INTO `nav` VALUES (18, "推荐新闻", NULL, "basketball", 3, 1, 1);
INSERT INTO `nav` VALUES (19, "最新新闻", NULL, "basketball", 4, 1, 1);

INSERT INTO `nav` VALUES (20, "詹姆斯", 1, "basketball", 1, 2, 1);
INSERT INTO `nav` VALUES (21, "欧文", 1, "basketball", 2, 2, 1);

INSERT INTO `nav` VALUES (22, "科比", 1, "basketball", 1, 3, 1);
INSERT INTO `nav` VALUES (23, "林书豪", 1, "basketball", 2, 3, 1);
INSERT INTO `nav` VALUES (24, "纳什", 1, "basketball", 3, 3, 1);
INSERT INTO `nav` VALUES (25, "奥尼尔", 1, "basketball", 4, 3, 1);



INSERT INTO `post_tag` VALUES (1, 1, 1);
INSERT INTO `post_tag` VALUES (2, 1, 2);
INSERT INTO `post_tag` VALUES (3, 1, 3);

INSERT INTO `tag` VALUES (1, "广州恒大", "", "", 1, 1, 0, 0, 0, "2015-08-27 00:00:00");
INSERT INTO `tag` VALUES (2, "亚冠", "", "", 1, 1, 0, 0, 0, "2015-08-27 00:00:00");
INSERT INTO `tag` VALUES (3, "高拉特", "", "", 1, 1, 0, 0, 0, "2015-08-27 00:00:00");

INSERT INTO `section` VALUES (1, '全场集锦', 0, 'football');
INSERT INTO `section` VALUES (2, '个人集锦', 0, 'football');
INSERT INTO `section` VALUES (3, '进球视频', 0, 'football');
INSERT INTO `section` VALUES (4, '精彩花絮', 0, 'football');
INSERT INTO `section` VALUES (5, '全场集锦', 0, 'basketball');
INSERT INTO `section` VALUES (6, '个人集锦', 0, 'basketball');
INSERT INTO `section` VALUES (7, '精彩花絮', 0, 'basketball');

INSERT INTO `section` VALUES (8, '乐视视频', 0, 'football');
INSERT INTO `section` VALUES (9, 'QQ视频', 0, 'football');
INSERT INTO `section` VALUES (10, 'CNTV视频', 0, 'football');
INSERT INTO `section` VALUES (11, '新浪视频', 0, 'football');

INSERT INTO `section` VALUES (12, '乐视视频', 0, 'basketball');
INSERT INTO `section` VALUES (13, 'QQ视频', 0, 'basketball');
INSERT INTO `section` VALUES (14, 'CNTV视频', 0, 'basketball');
INSERT INTO `section` VALUES (15, '新浪视频', 0, 'basketball');

INSERT INTO `object_video` VALUES (1, 1, 1, 'post', 0);
INSERT INTO `object_video` VALUES (2, 2, 1, 'post', 0);
INSERT INTO `object_video` VALUES (3, 3, 1, 'post', 0);
INSERT INTO `object_video` VALUES (4, 4, 1, 'post', 0);
INSERT INTO `object_video` VALUES (5, 5, 1, 'post', 0);

INSERT INTO `section_video` VALUES (1, 1, 3, 1);
INSERT INTO `section_video` VALUES (2, 2, 3, 1);
INSERT INTO `section_video` VALUES (3, 3, 2, 1);
INSERT INTO `section_video` VALUES (4, 4, 1, 1);
INSERT INTO `section_video` VALUES (5, 5, 1, 1);

INSERT INTO `video` VALUES (1, '里皮看台观战恒大生死战 球迷翘首睹真容', '', '', '', 'http://p.you.video.sina.com.cn/swf/quotePlayer20130723_V4_4_42_4.swf?vid=138126657&as=0', 'sina', '', 0, 0, 0, NULL, '2015-06-11 00:50:24');
INSERT INTO `video` VALUES (2, '恒大开场收噩耗 张琳芃膝盖受伤无奈离场', '', '', '', 'http://p.you.video.sina.com.cn/swf/quotePlayer20130723_V4_4_42_4.swf?vid=138126983&as=0', 'sina', '', 0, 0, 0, NULL, '2015-06-11 00:50:24');
INSERT INTO `video` VALUES (3, '高拉特角球甩头破门 詹俊：犀牛望月', '', '', '', 'http://p.you.video.sina.com.cn/swf/quotePlayer20130723_V4_4_42_4.swf?vid=138127179&as=0', 'sina', '', 0, 0, 0, NULL, '2015-06-11 00:50:24');
INSERT INTO `video` VALUES (4, '亚冠-高拉特双响张琳芃伤退 恒大2-0城南进8强', '', '', '', 'http://img1.c0.letv.com/ptv/player/swfPlayer.swf?autoPlay=1&isPlayerAd=0&id=22845366', 'letv', '', 0, 0, 0, NULL, '2015-06-11 00:50:24');
INSERT INTO `video` VALUES (5, '亚冠-高拉特双响张琳芃伤退 恒大2-0城南进8强', '', '', '', 'http://player.cntv.cn/flashplayer/players/htmls/smallwindow.html?pid=654b7d1ed3e6433fa3e626e072c0c696', 'cntv', '', 0, 0, 0, NULL, '2015-06-11 00:50:24');


INSERT INTO `feed` VALUES (1, '图-国青小将惊艳女友', 'basketball', 'new', 1, '2015-06-07 00:08:26', '2015-06-07 00:08:26');
INSERT INTO `feed` VALUES (2, '香波特轰4颗三分', 'basketball', 'new', 1, '2015-06-07 00:18:26', '2015-06-07 00:18:26');
INSERT INTO `feed` VALUES (3, '詹皇开启魔术师模式', 'basketball', 'new', 1, '2015-06-07 00:28:26', '2015-06-07 00:28:26');
INSERT INTO `feed` VALUES (4, '科比承认下季是湖人最后1年', 'basketball', 'new', 1, '2015-06-07 00:38:26', '2015-06-07 00:38:26');
INSERT INTO `feed` VALUES (5, 'LBJ追平杰里-韦斯特纪录', 'basketball', 'new', 1, '2015-06-07 00:48:26', '2015-06-07 00:48:26');
INSERT INTO `feed` VALUES (6, '图-晒肌肉狂魔内特', 'basketball', 'new', 1, '2015-06-07 00:58:26', '2015-06-07 00:58:26');
INSERT INTO `feed` VALUES (7, '2-0后詹皇没输过系列赛', 'basketball', 'new', 1, '2015-06-07 01:08:26', '2015-06-07 01:08:26');
INSERT INTO `feed` VALUES (8, '魔术师称赞詹姆斯', 'basketball', 'new', 1, '2015-06-07 01:18:26', '2015-06-07 01:18:26');
INSERT INTO `feed` VALUES (9, '詹皇30+9+11激活全队', 'basketball', 'new', 1, '2015-06-07 01:28:26', '2015-06-07 01:28:26');
INSERT INTO `feed` VALUES (10, '詹皇30+9+11骑士大胜2-0老鹰', 'basketball', 'new', 1, '2015-06-07 01:38:26', '2015-06-07 01:38:26');

INSERT INTO `feed` VALUES (11, '小皇帝高中封神', 'basketball', 'video', 1, '2015-06-07 00:08:26', '2015-06-07 00:08:26');
INSERT INTO `feed` VALUES (12, '科比09季后太猛', 'basketball', 'video', 1, '2015-06-07 00:08:26', '2015-06-07 00:08:26');
INSERT INTO `feed` VALUES (13, '威少前几赛季已无解', 'basketball', 'video', 1, '2015-06-07 00:08:26', '2015-06-07 00:08:26');
INSERT INTO `feed` VALUES (14, '青涩韦德无敌开挂', 'basketball', 'video', 1, '2015-06-07 00:08:26', '2015-06-07 00:08:26');
INSERT INTO `feed` VALUES (15, 'BA神奇逆天进球合辑', 'basketball', 'video', 1, '2015-06-07 00:08:26', '2015-06-07 00:08:26');
INSERT INTO `feed` VALUES (16, '科比发推特下季最后一季？', 'basketball', 'video', 1, '2015-06-07 00:08:26', '2015-06-07 00:08:26');
INSERT INTO `feed` VALUES (17, '小乔丹赛季凶残十佳球', 'basketball', 'video', 1, '2015-06-07 00:08:26', '2015-06-07 00:08:26');
INSERT INTO `feed` VALUES (18, '格里芬赛季十大劲爆扣篮', 'basketball', 'video', 1, '2015-06-07 00:08:26', '2015-06-07 00:08:26');
INSERT INTO `feed` VALUES (19, '欧文赛季疯狂进攻表演', 'basketball', 'video', 1, '2015-06-07 00:08:26', '2015-06-07 00:08:26');
INSERT INTO `feed` VALUES (20, '这球犯规了？汤普森迎面血帽', 'basketball', 'video', 1, '2015-06-07 00:08:26', '2015-06-07 00:08:26');
INSERT INTO `feed` VALUES (21, '搞笑！老詹活蹦乱跳砸板', 'basketball', 'video', 1, '2015-06-07 00:08:26', '2015-06-07 00:08:26');
INSERT INTO `feed` VALUES (22, '废人？安蒂奇推翻詹姆斯', 'basketball', 'video', 1, '2015-06-07 00:08:26', '2015-06-07 00:08:26');
INSERT INTO `feed` VALUES (23, '老鹰vs骑士2', 'basketball', 'video', 1, '2015-06-07 00:08:26', '2015-06-07 00:08:26');
INSERT INTO `feed` VALUES (24, '今日五佳球-JR惊艳超级拉杆', 'basketball', 'video', 1, '2015-06-07 00:08:26', '2015-06-07 00:08:26');
INSERT INTO `feed` VALUES (25, '第一竟是他！NBA历史十大360暴扣', 'basketball', 'video', 1, '2015-06-07 00:08:26', '2015-06-07 00:08:26');

INSERT INTO `feed` VALUES (26, '图-哈维巴萨戎马岁月', 'football', 'new', 1, '2015-06-07 00:08:26', '2015-06-07 00:08:26');
INSERT INTO `feed` VALUES (27, '阿帅：巴萨世界最强队', 'football', 'new', 1, '2015-06-07 00:08:26', '2015-06-07 00:08:26');
INSERT INTO `feed` VALUES (28, '里皮飞抵广州助阵恒大', 'football', 'new', 1, '2015-06-07 00:08:26', '2015-06-07 00:08:26');
INSERT INTO `feed` VALUES (29, '卡西：当然希望德赫亚来', 'football', 'new', 1, '2015-06-07 00:08:26', '2015-06-07 00:08:26');
INSERT INTO `feed` VALUES (30, '法国队名单:博格巴领衔', 'football', 'new', 1, '2015-06-07 00:08:26', '2015-06-07 00:08:26');
INSERT INTO `feed` VALUES (31, '图-一代宗师哈维', 'football', 'new', 1, '2015-06-07 00:08:26', '2015-06-07 00:08:26');
INSERT INTO `feed` VALUES (32, '恩里克:维尔马伦将首秀', 'football', 'new', 1, '2015-06-07 00:08:26', '2015-06-07 00:08:26');
INSERT INTO `feed` VALUES (33, '范加尔相信德赫亚留队', 'football', 'new', 1, '2015-06-07 00:08:26', '2015-06-07 00:08:26');
INSERT INTO `feed` VALUES (34, '穆帅：不该说反切尔西运动', 'football', 'new', 1, '2015-06-07 00:08:26', '2015-06-07 00:08:26');
INSERT INTO `feed` VALUES (35, '安帅：我希望留在皇马', 'football', 'new', 1, '2015-06-07 00:08:26', '2015-06-07 00:08:26');

INSERT INTO `feed` VALUES (36, '俄罗斯技术最屌的大神-莫斯托沃伊', 'football', 'video', 1, '2015-06-07 00:08:26', '2015-06-07 00:08:26');
INSERT INTO `feed` VALUES (37, '内维尔分析德佩加盟曼联前景', 'football', 'video', 1, '2015-06-07 00:08:26', '2015-06-07 00:08:26');
INSERT INTO `feed` VALUES (38, '戴帽狂人！C罗生涯至今32个帽子合集', 'football', 'video', 1, '2015-06-07 00:08:26', '2015-06-07 00:08:26');
INSERT INTO `feed` VALUES (39, '可否信服？当今足坛5大中卫', 'football', 'video', 1, '2015-06-07 00:08:26', '2015-06-07 00:08:26');
INSERT INTO `feed` VALUES (40, '石家庄永昌vs杭州绿城', 'football', 'video', 1, '2015-06-07 00:08:26', '2015-06-07 00:08:26');
INSERT INTO `feed` VALUES (41, '真死敌！博卡河床女足比赛暴力犯规', 'football', 'video', 1, '2015-06-07 00:08:26', '2015-06-07 00:08:26');
INSERT INTO `feed` VALUES (42, '头脑发热！七大最愚蠢红牌下场', 'football', 'video', 1, '2015-06-07 00:08:26', '2015-06-07 00:08:26');
INSERT INTO `feed` VALUES (43, '贵州人和vs上海上港 上港首败', 'football', 'video', 1, '2015-06-07 00:08:26', '2015-06-07 00:08:26');


INSERT INTO `live` VALUES (1, '足球友谊赛', '以色列vs白俄罗斯', 1, '2015-06-09 23:45:00');
INSERT INTO `live` VALUES (2, '女足世界杯', '法国vs英格兰', 1, '2015-06-10 01:00:00');




INSERT INTO `notice_type` VALUES (1, '回复了你的主题');
INSERT INTO `notice_type` VALUES (2, '收藏了你的主题');
INSERT INTO `notice_type` VALUES (3, '感谢了你的主题');
INSERT INTO `notice_type` VALUES (4, '赞同了你的回复');
INSERT INTO `notice_type` VALUES (5, '感谢了你的回复');
INSERT INTO `notice_type` VALUES (6, '在主题中提到了你');
INSERT INTO `notice_type` VALUES (7, '在回复中提到了你');
INSERT INTO `notice_type` VALUES (15, '关注了你');
INSERT INTO `notice_type` VALUES (16, '赞了你的主题');

INSERT INTO `tag_type` VALUES (1, '默认', '其它');
INSERT INTO `tag_type` VALUES (2, '文章类型', '关注的文章');
INSERT INTO `tag_type` VALUES (3, '问题类型', '感兴趣的问题');
INSERT INTO `tag_type` VALUES (4, '类目', '关注的类目');
INSERT INTO `tag_type` VALUES (5, '品牌', '喜欢的品牌');
INSERT INTO `tag_type` VALUES (6, '商品', '想买的东西');

INSERT INTO `avatar` VALUES (1, 'http://mmm-static.qiniudn.com/005z2Z7Jtw1ejp1co4egzj30wt0wtq5b.jpg', '男');
INSERT INTO `avatar` VALUES (2, 'http://mmm-static.qiniudn.com/005z2Z7Jtw1ejp1cozuyhj30wt0wtgny.jpg', '男');
INSERT INTO `avatar` VALUES (3, 'http://mmm-static.qiniudn.com/005z2Z7Jtw1ejp1cpp9e8j30wt0wtdhz.jpg', '男');
INSERT INTO `avatar` VALUES (4, 'http://mmm-static.qiniudn.com/005z2Z7Jtw1ejp1cqqws2j30wt0wt40r.jpg', '男');
INSERT INTO `avatar` VALUES (5, 'http://mmm-static.qiniudn.com/005z2Z7Jtw1ejp1crpp62j30wt0wtdi2.jpg', '男');
INSERT INTO `avatar` VALUES (6, 'http://mmm-static.qiniudn.com/005z2Z7Jtw1ejp1cs8hxcj30wt0wtjto.jpg', '男');
INSERT INTO `avatar` VALUES (7, 'http://mmm-static.qiniudn.com/005z2Z7Jtw1ejp1ctddfnj30wt0wtwgl.jpg', '男');
INSERT INTO `avatar` VALUES (8, 'http://mmm-static.qiniudn.com/005z2Z7Jtw1ejp1cu8cm4j30wt0wtabq.jpg', '男');
INSERT INTO `avatar` VALUES (9, 'http://mmm-static.qiniudn.com/005z2Z7Jtw1ejp1cvbmakj30wt0wtjtx.jpg', '男');

INSERT INTO `avatar` VALUES (10, 'http://mmm-static.qiniudn.com/005z2Z7Jtw1ejp1co4egzj30wt0wtq5b.jpg', '女');
INSERT INTO `avatar` VALUES (11, 'http://mmm-static.qiniudn.com/005z2Z7Jtw1ejp1cozuyhj30wt0wtgny.jpg', '女');
INSERT INTO `avatar` VALUES (12, 'http://mmm-static.qiniudn.com/005z2Z7Jtw1ejp1cpp9e8j30wt0wtdhz.jpg', '女');
INSERT INTO `avatar` VALUES (13, 'http://mmm-static.qiniudn.com/005z2Z7Jtw1ejp1cqqws2j30wt0wt40r.jpg', '女');
INSERT INTO `avatar` VALUES (14, 'http://mmm-static.qiniudn.com/005z2Z7Jtw1ejp1crpp62j30wt0wtdi2.jpg', '女');
INSERT INTO `avatar` VALUES (15, 'http://mmm-static.qiniudn.com/005z2Z7Jtw1ejp1cs8hxcj30wt0wtjto.jpg', '女');
INSERT INTO `avatar` VALUES (16, 'http://mmm-static.qiniudn.com/005z2Z7Jtw1ejp1ctddfnj30wt0wtwgl.jpg', '女');
INSERT INTO `avatar` VALUES (17, 'http://mmm-static.qiniudn.com/005z2Z7Jtw1ejp1cu8cm4j30wt0wtabq.jpg', '女');
INSERT INTO `avatar` VALUES (18, 'http://mmm-static.qiniudn.com/005z2Z7Jtw1ejp1cvbmakj30wt0wtjtx.jpg', '女');



INSERT INTO `permission` VALUES (1, 0, '普通用户');
INSERT INTO `permission` VALUES (2, 1, '高级用户');
INSERT INTO `permission` VALUES (3, 2, '超级用户');
INSERT INTO `permission` VALUES (4, 11, '普通管理员');
INSERT INTO `permission` VALUES (5, 22, '高级管理员');
INSERT INTO `permission` VALUES (6, 13, '超级管理员');
INSERT INTO `permission` VALUES (7, -1, '禁止提问');
INSERT INTO `permission` VALUES (8, -2, '禁止回答');


INSERT INTO `balance_type` VALUES (1, '初始资本', '获得初始资本', '2000 铜币');
INSERT INTO `balance_type` VALUES (2, '创建主题', '创建了', '主题');
INSERT INTO `balance_type` VALUES (3, '创建回复', '创建了', '回复');
INSERT INTO `balance_type` VALUES (4, '主题回复收益 ', '收到 ', '的回复');
INSERT INTO `balance_type` VALUES (5, '赞同别人', '发送对', '的赞同');
INSERT INTO `balance_type` VALUES (6, '收到赞同', '收到', '的赞同');
INSERT INTO `balance_type` VALUES (7, '撤销赞同', '撤销对', '的赞同');
INSERT INTO `balance_type` VALUES (8, '赞同被撤销', '赞同被', '撤销');
INSERT INTO `balance_type` VALUES (9, '发送谢意', '发送对', '的谢意');
INSERT INTO `balance_type` VALUES (10, '收到谢意', '收到', '的谢意');
INSERT INTO `balance_type` VALUES (11, '发送邀请', '发送', '邀请');
INSERT INTO `balance_type` VALUES (12, '邀请成功', '邀请', '成功');

INSERT INTO `ads` VALUES (1, 1, 1, 'mm', 'http://avati.qiniudn.com/mm.jpg', '/p/1');

INSERT INTO `post` VALUES (1, '亚冠-高拉特双响张琳芃伤退 恒大2-0城南进8强', '', 'video', '', 0, 0, 0, 0, 0, 1, NULL, NULL);