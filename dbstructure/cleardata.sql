use 1024nj;
truncate table node;
truncate table nav;
INSERT INTO `node` VALUES (1, "南京IT圈", "", "", 1, 0, 0, "2015-08-27 00:00:00");
INSERT INTO `node` VALUES (2, "灌水", "", "", 1, 0, 0, "2015-08-27 00:00:00");
INSERT INTO `node` VALUES (3, "软件外包", "", "", 1, 0, 0, "2015-08-27 00:00:00");
INSERT INTO `node` VALUES (4, "求职招聘", "", "", 2, 0, 0, "2015-08-27 00:00:00");


INSERT INTO `nav` VALUES (1, "南京IT圈", NULL, "itbbs", 1, NULL, 0);
INSERT INTO `nav` VALUES (2, "灌水", 1, "itbbs", 2, NULL, 0);
INSERT INTO `nav` VALUES (3, "软件外包", 1, "itbbs", 3, NULL, 0);
INSERT INTO `nav` VALUES (4, "求职招聘", 1, "itbbs", 3, NULL, 0);
