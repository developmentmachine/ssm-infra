/*
Navicat MySQL Data Transfer

Source Server         : localhost_3306
Source Server Version : 50549
Source Host           : localhost:3306
Source Database       : irs1

Target Server Type    : MYSQL
Target Server Version : 50549
File Encoding         : 65001

Date: 2018-08-21 10:36:05
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for tb_admin
-- ----------------------------
DROP TABLE IF EXISTS `tb_admin`;
CREATE TABLE `tb_admin` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '管理员id',
  `username` varchar(50) NOT NULL COMMENT '用户名',
  `password` varchar(50) NOT NULL COMMENT '密码',
  `salt` varchar(5) DEFAULT '',
  `fullname` varchar(50) NOT NULL COMMENT '全名',
  `e_mail` varchar(100) DEFAULT NULL,
  `sex` varchar(1) NOT NULL COMMENT '性别：0女，1男,2保密',
  `birthday` date NOT NULL,
  `address` varchar(100) NOT NULL COMMENT '地址',
  `phone` varchar(20) NOT NULL COMMENT '手机号',
  `role_id` bigint(20) DEFAULT NULL COMMENT '角色编号',
  PRIMARY KEY (`id`),
  KEY `role_id` (`role_id`),
  CONSTRAINT `tb_admin_ibfk_1` FOREIGN KEY (`role_id`) REFERENCES `tb_roles` (`role_id`) ON DELETE SET NULL ON UPDATE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tb_admin
-- ----------------------------
INSERT INTO `tb_admin` VALUES ('1', 'admin', 'e10adc3949ba59abbe56e057f20f883e', null, 'arthur', 'duxiaod@qq.com', '1', '1994-11-08', '陕西省西安市雁塔区', '17693109997', '1');
INSERT INTO `tb_admin` VALUES ('18', 'test', 'e10adc3949ba59abbe56e057f20f883e', null, 'test', 'test@test.com', '1', '2018-02-25', '甘肃省兰州市榆中县和平镇', '17601038192', '61');

-- ----------------------------
-- Table structure for tb_carousel
-- ----------------------------
DROP TABLE IF EXISTS `tb_carousel`;
CREATE TABLE `tb_carousel` (
  `id` tinyint(8) NOT NULL AUTO_INCREMENT,
  `imgUrl` varchar(100) NOT NULL,
  `imgLink` varchar(100) DEFAULT NULL,
  `remark` varchar(100) DEFAULT NULL,
  `sorting` int(10) NOT NULL,
  `status` int(1) NOT NULL,
  `create_time` datetime NOT NULL,
  `update_time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tb_carousel
-- ----------------------------
INSERT INTO `tb_carousel` VALUES ('8', 'fe3ecede0bec467b8be253684db5e28b3193.jpg', 'http://localhost:8080/irs/index.jsp', '百姓关心的环境问题 习近平给出最新答案', '200', '1', '2018-05-20 23:36:49', '2018-08-21 10:21:16');
INSERT INTO `tb_carousel` VALUES ('10', '1e4e799ccb41438ab4ece494f32d72c59900.jpg', 'http://localhost:8080/irs_maven/index.jsp', 'test', '19', '1', '2018-08-21 10:28:49', null);

-- ----------------------------
-- Table structure for tb_log
-- ----------------------------
DROP TABLE IF EXISTS `tb_log`;
CREATE TABLE `tb_log` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `username` varchar(50) NOT NULL,
  `operation` varchar(50) NOT NULL COMMENT '操作',
  `method` varchar(100) DEFAULT NULL COMMENT '执行方法',
  `params` varchar(500) DEFAULT NULL COMMENT '请求参数',
  `ip` varchar(64) DEFAULT NULL COMMENT 'ip',
  `create_time` datetime NOT NULL COMMENT '操作时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=690 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tb_log
-- ----------------------------
INSERT INTO `tb_log` VALUES ('371', 'admin', '添加角色信息', '/irs/sys/insRole', 'TbRoles [roleId=null, roleName=ettet, roleRemark=ete];1,1;', '0:0:0:0:0:0:0:1', '2018-06-29 15:09:56');
INSERT INTO `tb_log` VALUES ('372', 'admin', '添加角色信息', '/irs/sys/insRole', 'TbRoles [roleId=null, roleName=ewtet, roleRemark=wet];1,1;', '0:0:0:0:0:0:0:1', '2018-06-29 15:10:05');
INSERT INTO `tb_log` VALUES ('373', 'admin', '添加角色信息', '/irs/sys/insRole', 'TbRoles [roleId=null, roleName=wetewt, roleRemark=wetwet];1,1;', '0:0:0:0:0:0:0:1', '2018-06-29 15:10:12');
INSERT INTO `tb_log` VALUES ('374', 'admin', '添加角色信息', '/irs/sys/insRole', 'TbRoles [roleId=null, roleName=te, roleRemark=test];1,1;', '0:0:0:0:0:0:0:1', '2018-06-29 16:38:29');
INSERT INTO `tb_log` VALUES ('375', 'admin', '添加角色信息', '/irs/sys/insRole', 'TbRoles [roleId=null, roleName=fsadf, roleRemark=safd];1,1;', '0:0:0:0:0:0:0:1', '2018-06-29 16:39:50');
INSERT INTO `tb_log` VALUES ('376', 'admin', '添加角色信息', '/irs/sys/insRole', 'TbRoles [roleId=null, roleName=fsdf, roleRemark=sdf];1,1;', '0:0:0:0:0:0:0:1', '2018-06-29 16:41:08');
INSERT INTO `tb_log` VALUES ('377', 'admin', '添加角色信息', '/irs/sys/insRole', 'TbRoles [roleId=null, roleName=fsdf、, roleRemark=dfsf];1,1;', '0:0:0:0:0:0:0:1', '2018-06-29 16:42:00');
INSERT INTO `tb_log` VALUES ('378', 'admin', '批量删除指定角色信息', '/irs/sys/delRoles/54,55,56,57,58,59,60', '54,55,56,57,58,59,60;', '0:0:0:0:0:0:0:1', '2018-07-01 21:23:36');
INSERT INTO `tb_log` VALUES ('379', 'admin', '更新管理员信息', '/irs/sys/updAdmin', 'TbAdmin [id=18, username=test, password=null, salt=null, fullname=test, eMail=test@test.com, sex=1, birthday=2018-02-25, address=甘肃省兰州市榆中县和平镇, phone=17601038192, roleId=1, roleName=null];', '0:0:0:0:0:0:0:1', '2018-07-01 21:24:49');
INSERT INTO `tb_log` VALUES ('380', 'admin', '更新管理员信息', '/irs/sys/updAdmin', 'TbAdmin [id=18, username=test, password=null, salt=null, fullname=test, eMail=test@test.com, sex=1, birthday=2018-02-25, address=甘肃省兰州市榆中县和平镇, phone=17601038192, roleId=53, roleName=null];', '0:0:0:0:0:0:0:1', '2018-07-01 21:24:56');
INSERT INTO `tb_log` VALUES ('381', 'admin', '添加角色信息', '/irs/sys/insRole', 'TbRoles [roleId=null, roleName=etst, roleRemark=test];1,1;', '0:0:0:0:0:0:0:1', '2018-07-01 22:01:17');
INSERT INTO `tb_log` VALUES ('382', 'admin', '添加角色信息', '/irs/sys/insRole', 'TbRoles [roleId=null, roleName=te, roleRemark=tet];1,1;', '0:0:0:0:0:0:0:1', '2018-07-01 22:03:05');
INSERT INTO `tb_log` VALUES ('383', 'admin', '添加角色信息', '/irs/sys/insRole', 'TbRoles [roleId=null, roleName=tet, roleRemark=ewtwet];1,1;', '0:0:0:0:0:0:0:1', '2018-07-01 22:13:01');
INSERT INTO `tb_log` VALUES ('384', 'admin', '添加角色信息', '/irs/sys/insRole', 'TbRoles [roleId=null, roleName=tette, roleRemark=ewtte];1,1;', '0:0:0:0:0:0:0:1', '2018-07-01 22:16:39');
INSERT INTO `tb_log` VALUES ('385', 'admin', '批量删除指定角色信息', '/irs/sys/delRoles/61,62,63,64', '61,62,63,64;', '0:0:0:0:0:0:0:1', '2018-07-01 22:18:17');
INSERT INTO `tb_log` VALUES ('386', 'admin', '添加角色信息', '/irs/sys/insRole', 'TbRoles [roleId=null, roleName=te, roleRemark=ewt];1,1;', '0:0:0:0:0:0:0:1', '2018-07-01 22:20:18');
INSERT INTO `tb_log` VALUES ('387', 'admin', '批量删除指定角色信息', '/irs/sys/delRoles/65', '65;', '0:0:0:0:0:0:0:1', '2018-07-01 22:20:26');
INSERT INTO `tb_log` VALUES ('388', 'admin', '添加角色信息', '/irs/sys/insRole', 'TbRoles [roleId=null, roleName=tewt, roleRemark=ewte];1,1;', '0:0:0:0:0:0:0:1', '2018-07-01 22:22:26');
INSERT INTO `tb_log` VALUES ('389', 'admin', '批量删除指定角色信息', '/irs/sys/delRoles/66', '66;', '0:0:0:0:0:0:0:1', '2018-07-01 22:22:31');
INSERT INTO `tb_log` VALUES ('390', 'admin', '添加角色信息', '/irs/sys/insRole', 'TbRoles [roleId=null, roleName=tewt, roleRemark=ewtewt];1,1;', '0:0:0:0:0:0:0:1', '2018-07-01 22:25:02');
INSERT INTO `tb_log` VALUES ('391', 'admin', '批量删除指定角色信息', '/irs/sys/delRoles/67', '67;', '0:0:0:0:0:0:0:1', '2018-07-01 22:25:08');
INSERT INTO `tb_log` VALUES ('392', 'admin', '添加角色信息', '/irs/sys/insRole', 'TbRoles [roleId=null, roleName=sfdsf, roleRemark=sdf];1,1;', '0:0:0:0:0:0:0:1', '2018-07-01 22:28:51');
INSERT INTO `tb_log` VALUES ('393', 'admin', '添加角色信息', '/irs/sys/insRole', 'TbRoles [roleId=null, roleName=sdf, roleRemark=sfsd];1,1;', '0:0:0:0:0:0:0:1', '2018-07-01 22:28:58');
INSERT INTO `tb_log` VALUES ('394', 'admin', '批量删除指定角色信息', '/irs/sys/delRoles/68,69', '68,69;', '0:0:0:0:0:0:0:1', '2018-07-01 22:29:06');
INSERT INTO `tb_log` VALUES ('395', 'admin', '更新角色信息', '/irs/sys/updRole', 'TbRoles [roleId=53, roleName=test, roleRemark=test];1,1;', '0:0:0:0:0:0:0:1', '2018-07-05 09:34:33');
INSERT INTO `tb_log` VALUES ('396', 'admin', '更新角色信息', '/irs/sys/updRole', 'TbRoles [roleId=53, roleName=test, roleRemark=test];1,1,16,3,2,53,52,51;', '0:0:0:0:0:0:0:1', '2018-07-05 09:34:42');
INSERT INTO `tb_log` VALUES ('397', 'admin', '更新管理员信息', '/irs/sys/updAdmin', 'TbAdmin [id=18, username=test, password=null, salt=null, fullname=test, eMail=test@test.com, sex=1, birthday=2018-02-25, address=甘肃省兰州市榆中县和平镇, phone=17601038192, roleId=53, roleName=null];', '0:0:0:0:0:0:0:1', '2018-07-07 21:02:50');
INSERT INTO `tb_log` VALUES ('398', 'admin', '更新用户信息', '/irs/user/updUser', 'TbUsers [uid=27, eMail=isduxd@qq.com, nickname=test, sex=0, birthday=2018-03-25, address=北京通州科创十四街区, phone=17693109923, eCode=null, status=1, createTime=null];', '0:0:0:0:0:0:0:1', '2018-07-07 21:05:23');
INSERT INTO `tb_log` VALUES ('399', 'admin', '更新角色信息', '/irs/sys/updRole', 'TbRoles [roleId=53, roleName=test, roleRemark=test];1,1,16,3,2,53,52,51,59,58,57;', '0:0:0:0:0:0:0:1', '2018-07-14 12:57:22');
INSERT INTO `tb_log` VALUES ('400', 'admin', '更新角色信息', '/irs/sys/updRole', 'TbRoles [roleId=53, roleName=test, roleRemark=test];1,1,16,3,2,53,52,51,56,55,54,59,58,57;', '0:0:0:0:0:0:0:1', '2018-07-14 12:57:38');
INSERT INTO `tb_log` VALUES ('401', 'admin', '删除菜单信息', '/irs/sys/delMenuById/59', '59;', '0:0:0:0:0:0:0:1', '2018-07-14 12:58:09');
INSERT INTO `tb_log` VALUES ('402', 'admin', '删除菜单信息', '/irs/sys/delMenuById/58', '58;', '0:0:0:0:0:0:0:1', '2018-07-14 12:58:16');
INSERT INTO `tb_log` VALUES ('403', 'admin', '删除菜单信息', '/irs/sys/delMenuById/57', '57;', '0:0:0:0:0:0:0:1', '2018-07-14 12:58:24');
INSERT INTO `tb_log` VALUES ('404', 'admin', '更新管理员信息', '/irs/sys/updAdmin', 'TbAdmin [id=18, username=test, password=null, salt=null, fullname=test, eMail=test@test.com, sex=1, birthday=2018-02-25, address=甘肃省兰州市榆中县和平镇, phone=17601038192, roleId=1, roleName=null];', '0:0:0:0:0:0:0:1', '2018-07-14 12:58:34');
INSERT INTO `tb_log` VALUES ('405', 'admin', '更新管理员信息', '/irs/sys/updAdmin', 'TbAdmin [id=18, username=test, password=null, salt=null, fullname=test, eMail=test@test.com, sex=1, birthday=2018-02-25, address=甘肃省兰州市榆中县和平镇, phone=17601038192, roleId=53, roleName=null];', '0:0:0:0:0:0:0:1', '2018-07-14 12:58:42');
INSERT INTO `tb_log` VALUES ('406', 'admin', '添加角色信息', '/irs/sys/insRole', 'TbRoles [roleId=null, roleName=werw, roleRemark=werwer];1,1,45,44,43,62,61,60;', '0:0:0:0:0:0:0:1', '2018-07-14 12:59:57');
INSERT INTO `tb_log` VALUES ('407', 'admin', '更新角色信息', '/irs/sys/updRole', 'TbRoles [roleId=54, roleName=werw, roleRemark=werwer];1,1,45,44,43,53,52,51,62,61,60;', '0:0:0:0:0:0:0:1', '2018-07-14 13:00:11');
INSERT INTO `tb_log` VALUES ('408', 'admin', '更新角色信息', '/irs/sys/updRole', 'TbRoles [roleId=54, roleName=werw, roleRemark=werwer];1,1,45,44,43,62,61,60;', '0:0:0:0:0:0:0:1', '2018-07-14 13:00:19');
INSERT INTO `tb_log` VALUES ('409', 'admin', '添加角色信息', '/irs/sys/insRole', 'TbRoles [roleId=null, roleName=fsdf, roleRemark=sfdf];1,1,66,65,63,68,67,64;', '0:0:0:0:0:0:0:1', '2018-07-17 11:11:57');
INSERT INTO `tb_log` VALUES ('410', 'admin', '更新角色信息', '/irs/sys/updRole', 'TbRoles [roleId=55, roleName=fsdf, roleRemark=sfdf];1,1,66,65,63,68,67,64,69,67,64;', '0:0:0:0:0:0:0:1', '2018-07-17 11:12:09');
INSERT INTO `tb_log` VALUES ('411', 'admin', '更新角色信息', '/irs/sys/updRole', 'TbRoles [roleId=55, roleName=fsdf, roleRemark=sfdf];1,1,66,65,63,68,67,64,69,67,64,71,70,64;', '0:0:0:0:0:0:0:1', '2018-07-17 11:12:52');
INSERT INTO `tb_log` VALUES ('412', 'admin', '更新角色信息', '/irs/sys/updRole', 'TbRoles [roleId=55, roleName=fsdf, roleRemark=sfdf];1,1,66,65,63,68,67,64,69,67,64;', '0:0:0:0:0:0:0:1', '2018-07-17 11:12:59');
INSERT INTO `tb_log` VALUES ('413', 'admin', '更新角色信息', '/irs/sys/updRole', 'TbRoles [roleId=55, roleName=fsdf, roleRemark=sfdf];1,1,66,65,63,68,67,64,69,67,64,71,70,64;', '0:0:0:0:0:0:0:1', '2018-07-17 11:13:05');
INSERT INTO `tb_log` VALUES ('414', 'admin', '更新角色信息', '/irs/sys/updRole', 'TbRoles [roleId=55, roleName=fsdf, roleRemark=sfdf];1,1,66,65,63,68,67,64,69,67,64,71,70,64,75,74,64;', '0:0:0:0:0:0:0:1', '2018-07-17 11:14:09');
INSERT INTO `tb_log` VALUES ('415', 'admin', '更新角色信息', '/irs/sys/updRole', 'TbRoles [roleId=55, roleName=fsdf, roleRemark=sfdf];1,1,66,65,63,68,67,64,69,67,64,71,70,64,73,72,64;', '0:0:0:0:0:0:0:1', '2018-07-17 11:14:17');
INSERT INTO `tb_log` VALUES ('416', 'admin', '更新角色信息', '/irs/sys/updRole', 'TbRoles [roleId=55, roleName=fsdf, roleRemark=sfdf];1,1,37,11,9,66,65,63,68,67,64,69,67,64,71,70,64,73,72,64,75,74,64;', '0:0:0:0:0:0:0:1', '2018-07-17 11:14:32');
INSERT INTO `tb_log` VALUES ('417', 'admin', '添加角色信息', '/irs/sys/insRole', 'TbRoles [roleId=null, roleName=xdf, roleRemark=fdsf];1,1,71,70,64,73,72,64,77,76,64,81,80;', '0:0:0:0:0:0:0:1', '2018-07-17 11:17:44');
INSERT INTO `tb_log` VALUES ('418', 'admin', '更新角色信息', '/irs/sys/updRole', 'TbRoles [roleId=56, roleName=xdf, roleRemark=fdsf];1,1,71,70,64,73,72,64,77,76,64,82,64;', '0:0:0:0:0:0:0:1', '2018-07-17 11:17:54');
INSERT INTO `tb_log` VALUES ('419', 'admin', '更新角色信息', '/irs/sys/updRole', 'TbRoles [roleId=56, roleName=xdf, roleRemark=fdsf];1,1,71,70,64,73,72,64,77,76,64,81,80;', '0:0:0:0:0:0:0:1', '2018-07-17 11:18:01');
INSERT INTO `tb_log` VALUES ('420', 'admin', '更新角色信息', '/irs/sys/updRole', 'TbRoles [roleId=56, roleName=xdf, roleRemark=fdsf];1,1,71,70,64,73,72,64,77,76,64,85,84,83;', '0:0:0:0:0:0:0:1', '2018-07-17 11:22:21');
INSERT INTO `tb_log` VALUES ('421', 'admin', '更新角色信息', '/irs/sys/updRole', 'TbRoles [roleId=56, roleName=xdf, roleRemark=fdsf];1,1,71,70,64,73,72,64,77,76,64;', '0:0:0:0:0:0:0:1', '2018-07-17 11:22:29');
INSERT INTO `tb_log` VALUES ('422', 'admin', '更新角色信息', '/irs/sys/updRole', 'TbRoles [roleId=56, roleName=xdf, roleRemark=fdsf];1,1,71,70,64,73,72,64,77,76,64,81,80;', '0:0:0:0:0:0:0:1', '2018-07-17 11:22:37');
INSERT INTO `tb_log` VALUES ('423', 'admin', '更新角色信息', '/irs/sys/updRole', 'TbRoles [roleId=56, roleName=xdf, roleRemark=fdsf];1,1,71,70,64,73,72,64,77,76,64,85,84,83;', '0:0:0:0:0:0:0:1', '2018-07-17 11:22:47');
INSERT INTO `tb_log` VALUES ('424', 'admin', '更新角色信息', '/irs/sys/updRole', 'TbRoles [roleId=56, roleName=xdf, roleRemark=fdsf];1,1,71,70,64,73,72,64,77,76,64,86,81,80,85,84,83;', '0:0:0:0:0:0:0:1', '2018-07-17 11:28:56');
INSERT INTO `tb_log` VALUES ('425', 'admin', '更新角色信息', '/irs/sys/updRole', 'TbRoles [roleId=56, roleName=xdf, roleRemark=fdsf];1,1,71,70,64,73,72,64,77,76,64,82,64,86,81,80,85,84,83;', '0:0:0:0:0:0:0:1', '2018-07-17 11:29:08');
INSERT INTO `tb_log` VALUES ('426', 'admin', '更新角色信息', '/irs/sys/updRole', 'TbRoles [roleId=56, roleName=xdf, roleRemark=fdsf];1,1,71,70,64,73,72,64,77,76,64,87,82,64,86,81,80,85,84,83;', '0:0:0:0:0:0:0:1', '2018-07-17 11:29:48');
INSERT INTO `tb_log` VALUES ('427', 'admin', '更新角色信息', '/irs/sys/updRole', 'TbRoles [roleId=56, roleName=xdf, roleRemark=fdsf];1,1,71,70,64,73,72,64,77,76,64,87,82,64,89,88,64,86,81,80,85,84,83;', '0:0:0:0:0:0:0:1', '2018-07-17 11:32:22');
INSERT INTO `tb_log` VALUES ('428', 'admin', '更新角色信息', '/irs/sys/updRole', 'TbRoles [roleId=56, roleName=xdf, roleRemark=fdsf];1,1,16,3,2,17,3,2,18,3,2,19,3,2,20,4,2,21,4,2,22,4,2,23,4,2,47,46,2,48,46,2,49,46,2,50,46,2,33,10,9,34,11,9,35,11,9,36,11,9,37,11,9,42,15,14,45,44,43,53,52,51,56,55,54,62,61,60,66,65,63,68,67,64,69,67,64,71,70,64,73,72,64,75,74,64,77,76,64,79,78,64,87,82,64,89,88,64,86,81,80,85,84,83;', '0:0:0:0:0:0:0:1', '2018-07-17 11:32:37');
INSERT INTO `tb_log` VALUES ('429', 'admin', '更新角色信息', '/irs/sys/updRole', 'TbRoles [roleId=1, roleName=超级管理员, roleRemark=超级管理员];1,1,16,3,2,17,3,2,18,3,2,19,3,2,20,4,2,21,4,2,22,4,2,23,4,2,47,46,2,48,46,2,49,46,2,50,46,2,33,10,9,34,11,9,35,11,9,36,11,9,37,11,9,42,15,14,45,44,43,53,52,51,56,55,54,62,61,60,66,65,63,68,67,64,69,67,64,71,70,64,73,72,64,75,74,64,77,76,64,79,78,64,87,82,64,89,88,64,86,81,80,85,84,83;', '0:0:0:0:0:0:0:1', '2018-07-17 11:34:15');
INSERT INTO `tb_log` VALUES ('430', 'admin', '更新角色信息', '/irs/sys/updRole', 'TbRoles [roleId=56, roleName=xdf, roleRemark=fdsf];1,1,16,3,2,17,3,2,18,3,2,19,3,2,20,4,2,21,4,2,22,4,2,23,4,2,47,46,2,48,46,2,49,46,2,50,46,2,33,10,9,34,11,9,35,11,9,36,11,9,37,11,9,42,15,14,45,44,43,53,52,51,56,55,54,62,61,60,66,65,63,68,67,64,69,67,64,71,70,64,73,72,64,75,74,64,77,76,64,79,78,64,87,82,64,89,88,64,86,81,80,85,84,83,91,90;', '0:0:0:0:0:0:0:1', '2018-07-27 09:21:58');
INSERT INTO `tb_log` VALUES ('431', 'admin', '更新角色信息', '/irs/sys/updRole', 'TbRoles [roleId=56, roleName=xdf, roleRemark=fdsf];1,1,16,3,2,17,3,2,18,3,2,19,3,2,20,4,2,21,4,2,22,4,2,23,4,2,47,46,2,48,46,2,49,46,2,50,46,2,33,10,9,34,11,9,35,11,9,36,11,9,37,11,9,42,15,14,45,44,43,53,52,51,56,55,54,62,61,60,66,65,63,68,67,64,69,67,64,71,70,64,73,72,64,75,74,64,77,76,64,79,78,64,87,82,64,89,88,64,86,81,80,85,84,83;', '0:0:0:0:0:0:0:1', '2018-07-27 09:22:06');
INSERT INTO `tb_log` VALUES ('432', 'admin', '更新角色信息', '/irs/sys/updRole', 'TbRoles [roleId=56, roleName=xdf, roleRemark=fdsf];1,1,16,3,2,20,4,2,47,46,2,48,46,2,49,46,2,50,46,2,33,10,9,34,11,9,35,11,9,36,11,9,42,15,14,45,44,43,53,52,51,56,55,54,62,61,60,66,65,63,68,67,64,69,67,64,71,70,64,73,72,64,75,74,64,77,76,64,79,78,64,87,82,64,89,88,64,86,81,80,85,84,83;', '0:0:0:0:0:0:0:1', '2018-07-27 09:22:26');
INSERT INTO `tb_log` VALUES ('433', 'admin', '添加角色信息', '/irs/sys/insRole', 'TbRoles [roleId=null, roleName=123, roleRemark=3123];1,1,16,3,2,17,3,2,56,55,54,62,61,60,85,84,83,91,90;', '0:0:0:0:0:0:0:1', '2018-07-27 09:25:02');
INSERT INTO `tb_log` VALUES ('434', 'admin', '添加角色信息', '/irs/sys/insRole', 'TbRoles [roleId=null, roleName=213, roleRemark=333];1,1,18,3,2,19,3,2,87,82,64,91,90,92,92;', '0:0:0:0:0:0:0:1', '2018-07-27 09:25:42');
INSERT INTO `tb_log` VALUES ('435', 'admin', '更新角色信息', '/irs/sys/updRole', 'TbRoles [roleId=1, roleName=超级管理员, roleRemark=超级管理员];1,1,16,3,2,17,3,2,18,3,2,19,3,2,20,4,2,21,4,2,22,4,2,23,4,2,47,46,2,48,46,2,49,46,2,50,46,2,33,10,9,34,11,9,35,11,9,36,11,9,37,11,9,42,15,14,45,44,43,53,52,51,56,55,54,62,61,60,66,65,63,68,67,64,69,67,64,71,70,64,73,72,64,75,74,64,77,76,64,79,78,64,87,82,64,89,88,64,86,81,80,85,84,83,91,90,92,92;', '0:0:0:0:0:0:0:1', '2018-07-27 09:26:07');
INSERT INTO `tb_log` VALUES ('436', 'admin', '更新角色信息', '/irs/sys/updRole', 'TbRoles [roleId=58, roleName=213, roleRemark=333];1,1,18,3,2,19,3,2,87,82,64,85,84,83,91,90,92,92;', '0:0:0:0:0:0:0:1', '2018-07-27 09:33:07');
INSERT INTO `tb_log` VALUES ('437', 'admin', '添加角色信息', '/irs/sys/insRole', 'TbRoles [roleId=null, roleName=fdsf, roleRemark=fdf];1,1,16,3,2,17,3,2,33,10,9,34,11,9,69,67,64,79,78,64,87,82,64,89,88,64,86,81,80,85,84,83,91,90,92,92;', '0:0:0:0:0:0:0:1', '2018-07-27 09:34:00');
INSERT INTO `tb_log` VALUES ('438', 'admin', '更新角色信息', '/irs/sys/updRole', 'TbRoles [roleId=59, roleName=fdsf, roleRemark=fdf];1,1,16,3,2,17,3,2,33,10,9,34,11,9,69,67,64,79,78,64,87,82,64,89,88,64,86,81,80,85,84,83,91,90;', '0:0:0:0:0:0:0:1', '2018-07-27 09:34:10');
INSERT INTO `tb_log` VALUES ('439', 'admin', '更新角色信息', '/irs/sys/updRole', 'TbRoles [roleId=59, roleName=fdsf, roleRemark=fdf];1,1,16,3,2,17,3,2,33,10,9,34,11,9,69,67,64,79,78,64,87,82,64,89,88,64,86,81,80,85,84,83,91,90,92,92;', '0:0:0:0:0:0:0:1', '2018-07-27 09:44:45');
INSERT INTO `tb_log` VALUES ('440', 'admin', '批量删除指定角色信息', '/irs/sys/delRoles/54,55,56,57,58,59', '54,55,56,57,58,59;', '0:0:0:0:0:0:0:1', '2018-07-27 09:45:27');
INSERT INTO `tb_log` VALUES ('441', 'admin', '更新角色信息', '/irs/sys/updRole', 'TbRoles [roleId=53, roleName=test, roleRemark=test];1,1,16,3,2,17,3,2,18,3,2,19,3,2,20,4,2,21,4,2,22,4,2,23,4,2,47,46,2,48,46,2,49,46,2,50,46,2,33,10,9,34,11,9,35,11,9,36,11,9,37,11,9,42,15,14,45,44,43,53,52,51,56,55,54,62,61,60,66,65,63,68,67,64,69,67,64,71,70,64,73,72,64,75,74,64,77,76,64,79,78,64,87,82,64,89,88,64,86,81,80,85,84,83,91,90,92,92;', '0:0:0:0:0:0:0:1', '2018-07-27 09:45:40');
INSERT INTO `tb_log` VALUES ('442', 'admin', '添加用户', '/irs/user/insUser', 'TbUsers [uid=null, eMail=123@qq.com, nickname=fsd, sex=1, birthday=2018-07-27, address=123123, phone=17693109997, eCode=null, status=null, createTime=null];', '0:0:0:0:0:0:0:1', '2018-07-27 09:49:41');
INSERT INTO `tb_log` VALUES ('443', 'admin', '添加用户', '/irs/user/insUser', 'TbUsers [uid=null, eMail=123@qq.com, nickname=2113, sex=1, birthday=2018-07-26, address=123123, phone=17693109997, eCode=null, status=null, createTime=null];', '0:0:0:0:0:0:0:1', '2018-07-27 09:59:16');
INSERT INTO `tb_log` VALUES ('445', 'admin', '删除菜单信息', '/irs/sys/delMenuById/62', '62;', '0:0:0:0:0:0:0:1', '2018-07-27 14:13:32');
INSERT INTO `tb_log` VALUES ('446', 'admin', '删除菜单信息', '/irs/sys/delMenuById/61', '61;', '0:0:0:0:0:0:0:1', '2018-07-27 14:13:49');
INSERT INTO `tb_log` VALUES ('447', 'admin', '删除菜单信息', '/irs/sys/delMenuById/79', '79;', '0:0:0:0:0:0:0:1', '2018-07-27 14:13:57');
INSERT INTO `tb_log` VALUES ('448', 'admin', '删除菜单信息', '/irs/sys/delMenuById/89', '89;', '0:0:0:0:0:0:0:1', '2018-07-27 14:14:06');
INSERT INTO `tb_log` VALUES ('449', 'admin', '删除菜单信息', '/irs/sys/delMenuById/86', '86;', '0:0:0:0:0:0:0:1', '2018-07-27 14:14:16');
INSERT INTO `tb_log` VALUES ('450', 'admin', '删除菜单信息', '/irs/sys/delMenuById/87', '87;', '0:0:0:0:0:0:0:1', '2018-07-27 14:14:25');
INSERT INTO `tb_log` VALUES ('451', 'admin', '删除菜单信息', '/irs/sys/delMenuById/81', '81;', '0:0:0:0:0:0:0:1', '2018-07-27 14:14:34');
INSERT INTO `tb_log` VALUES ('452', 'admin', '删除菜单信息', '/irs/sys/delMenuById/82', '82;', '0:0:0:0:0:0:0:1', '2018-07-27 14:14:42');
INSERT INTO `tb_log` VALUES ('453', 'admin', '删除菜单信息', '/irs/sys/delMenuById/88', '88;', '0:0:0:0:0:0:0:1', '2018-07-27 14:14:50');
INSERT INTO `tb_log` VALUES ('454', 'admin', '删除菜单信息', '/irs/sys/delMenuById/78', '78;', '0:0:0:0:0:0:0:1', '2018-07-27 14:14:58');
INSERT INTO `tb_log` VALUES ('455', 'admin', '删除菜单信息', '/irs/sys/delMenuById/80', '80;', '0:0:0:0:0:0:0:1', '2018-07-27 14:15:07');
INSERT INTO `tb_log` VALUES ('456', 'admin', '删除菜单信息', '/irs/sys/delMenuById/85', '85;', '0:0:0:0:0:0:0:1', '2018-07-27 14:15:18');
INSERT INTO `tb_log` VALUES ('457', 'admin', '删除菜单信息', '/irs/sys/delMenuById/77', '77;', '0:0:0:0:0:0:0:1', '2018-07-27 14:15:26');
INSERT INTO `tb_log` VALUES ('458', 'admin', '删除菜单信息', '/irs/sys/delMenuById/75', '75;', '0:0:0:0:0:0:0:1', '2018-07-27 14:15:33');
INSERT INTO `tb_log` VALUES ('459', 'admin', '删除菜单信息', '/irs/sys/delMenuById/60', '60;', '0:0:0:0:0:0:0:1', '2018-07-27 14:15:47');
INSERT INTO `tb_log` VALUES ('460', 'admin', '删除菜单信息', '/irs/sys/delMenuById/71', '71;', '0:0:0:0:0:0:0:1', '2018-07-27 14:15:54');
INSERT INTO `tb_log` VALUES ('461', 'admin', '删除菜单信息', '/irs/sys/delMenuById/70', '70;', '0:0:0:0:0:0:0:1', '2018-07-27 14:16:01');
INSERT INTO `tb_log` VALUES ('462', 'admin', '删除菜单信息', '/irs/sys/delMenuById/76', '76;', '0:0:0:0:0:0:0:1', '2018-07-27 14:16:14');
INSERT INTO `tb_log` VALUES ('463', 'admin', '删除菜单信息', '/irs/sys/delMenuById/74', '74;', '0:0:0:0:0:0:0:1', '2018-07-27 14:16:22');
INSERT INTO `tb_log` VALUES ('464', 'admin', '删除菜单信息', '/irs/sys/delMenuById/73', '73;', '0:0:0:0:0:0:0:1', '2018-07-27 14:16:30');
INSERT INTO `tb_log` VALUES ('465', 'admin', '删除菜单信息', '/irs/sys/delMenuById/84', '84;', '0:0:0:0:0:0:0:1', '2018-07-27 14:16:39');
INSERT INTO `tb_log` VALUES ('466', 'admin', '删除菜单信息', '/irs/sys/delMenuById/56', '56;', '0:0:0:0:0:0:0:1', '2018-07-27 14:16:50');
INSERT INTO `tb_log` VALUES ('467', 'admin', '删除菜单信息', '/irs/sys/delMenuById/55', '55;', '0:0:0:0:0:0:0:1', '2018-07-27 14:16:58');
INSERT INTO `tb_log` VALUES ('468', 'admin', '删除菜单信息', '/irs/sys/delMenuById/72', '72;', '0:0:0:0:0:0:0:1', '2018-07-27 14:17:08');
INSERT INTO `tb_log` VALUES ('469', 'admin', '删除菜单信息', '/irs/sys/delMenuById/69', '69;', '0:0:0:0:0:0:0:1', '2018-07-27 14:17:16');
INSERT INTO `tb_log` VALUES ('470', 'admin', '删除菜单信息', '/irs/sys/delMenuById/83', '83;', '0:0:0:0:0:0:0:1', '2018-07-27 14:17:24');
INSERT INTO `tb_log` VALUES ('471', 'admin', '删除菜单信息', '/irs/sys/delMenuById/54', '54;', '0:0:0:0:0:0:0:1', '2018-07-27 14:17:33');
INSERT INTO `tb_log` VALUES ('472', 'admin', '删除菜单信息', '/irs/sys/delMenuById/68', '68;', '0:0:0:0:0:0:0:1', '2018-07-27 14:17:48');
INSERT INTO `tb_log` VALUES ('473', 'admin', '删除菜单信息', '/irs/sys/delMenuById/91', '91;', '0:0:0:0:0:0:0:1', '2018-07-27 14:18:11');
INSERT INTO `tb_log` VALUES ('474', 'admin', '删除菜单信息', '/irs/sys/delMenuById/90', '90;', '0:0:0:0:0:0:0:1', '2018-07-27 14:18:22');
INSERT INTO `tb_log` VALUES ('475', 'admin', '更新管理员信息', '/irs/sys/updAdmin', 'TbAdmin [id=18, username=test, password=null, salt=null, fullname=test, eMail=test@test.com, sex=1, birthday=2018-02-25, address=甘肃省兰州市榆中县和平镇, phone=17601038192, roleId=1, roleName=null];', '0:0:0:0:0:0:0:1', '2018-07-27 14:18:46');
INSERT INTO `tb_log` VALUES ('476', 'admin', '更新管理员信息', '/irs/sys/updAdmin', 'TbAdmin [id=18, username=test, password=null, salt=null, fullname=test, eMail=test@test.com, sex=1, birthday=2018-02-25, address=甘肃省兰州市榆中县和平镇, phone=17601038192, roleId=53, roleName=null];', '0:0:0:0:0:0:0:1', '2018-07-27 14:18:52');
INSERT INTO `tb_log` VALUES ('477', 'admin', '添加角色信息', '/irs/sys/insRole', 'TbRoles [roleId=null, roleName=rewr, roleRemark=rewr];1,1,48,46,2,49,46,2,33,10,9,37,11,9,67,64,92,92;', '0:0:0:0:0:0:0:1', '2018-07-27 14:19:19');
INSERT INTO `tb_log` VALUES ('478', 'admin', '批量删除指定角色信息', '/irs/sys/delRoles/60', '60;', '0:0:0:0:0:0:0:1', '2018-07-27 14:19:38');
INSERT INTO `tb_log` VALUES ('479', 'admin', '添加用户', '/irs/user/insUser', 'TbUsers [uid=null, eMail=sdf@163.com, nickname=123123, sex=1, birthday=2018-07-27, address=123123, phone=17111111111, eCode=null, status=null, createTime=null];', '0:0:0:0:0:0:0:1', '2018-07-27 14:23:55');
INSERT INTO `tb_log` VALUES ('480', 'admin', '更新用户信息', '/irs/user/updUser', 'TbUsers [uid=29, eMail=sdf@163.com, nickname=123123, sex=2, birthday=2018-07-27, address=123123, phone=17111111111, eCode=null, status=1, createTime=null];', '0:0:0:0:0:0:0:1', '2018-07-27 14:24:12');
INSERT INTO `tb_log` VALUES ('481', 'admin', '删除菜单信息', '/irs/sys/delMenuById/66', '66;', '0:0:0:0:0:0:0:1', '2018-07-27 14:30:18');
INSERT INTO `tb_log` VALUES ('482', 'admin', '更新角色信息', '/irs/sys/updRole', 'TbRoles [roleId=53, roleName=test, roleRemark=test];1,1,16,3,2,17,3,2,18,3,2,19,3,2,20,4,2,21,4,2,22,4,2,23,4,2,47,46,2,48,46,2,49,46,2,50,46,2,33,10,9,34,11,9,35,11,9,36,11,9,37,11,9,42,15,14,65,63,92,92;', '0:0:0:0:0:0:0:1', '2018-07-27 17:47:05');
INSERT INTO `tb_log` VALUES ('483', 'admin', '更新管理员信息', '/irs/sys/updAdmin', 'TbAdmin [id=1, username=admin, password=null, salt=null, fullname=arthur, eMail=admin@outaa.com, sex=1, birthday=1994-11-08, address=北京市通州区科创十四街, phone=17693109997, roleId=1, roleName=null];', '0:0:0:0:0:0:0:1', '2018-07-27 17:48:24');
INSERT INTO `tb_log` VALUES ('484', 'admin', '更新管理员信息', '/irs/sys/updAdmin', 'TbAdmin [id=1, username=admin, password=null, salt=null, fullname=arthur, eMail=isduxd@163.com, sex=1, birthday=1994-11-08, address=北京市通州区科创十四街, phone=17693109997, roleId=1, roleName=null];', '0:0:0:0:0:0:0:1', '2018-07-27 17:48:50');
INSERT INTO `tb_log` VALUES ('485', 'admin', '更新角色信息', '/irs/sys/updRole', 'TbRoles [roleId=1, roleName=超级管理员, roleRemark=超级管理员];1,1,16,3,2,20,4,2,21,4,2,22,4,2,23,4,2,47,46,2,48,46,2,49,46,2,50,46,2,33,10,9,34,11,9,35,11,9,36,11,9,37,11,9,42,15,14,45,44,43,53,52,51,65,63,67,64,92,92;', '0:0:0:0:0:0:0:1', '2018-07-27 17:49:34');
INSERT INTO `tb_log` VALUES ('486', 'admin', '批量删除指定角色信息', '/irs/sys/delRoles/53', '53;', '0:0:0:0:0:0:0:1', '2018-07-27 17:49:48');
INSERT INTO `tb_log` VALUES ('487', 'admin', '更新角色信息', '/irs/sys/updRole', 'TbRoles [roleId=1, roleName=超级管理员, roleRemark=超级管理员];1,1,16,3,2,17,3,2,18,3,2,19,3,2,20,4,2,21,4,2,22,4,2,23,4,2,47,46,2,48,46,2,49,46,2,50,46,2,33,10,9,34,11,9,35,11,9,36,11,9,37,11,9,42,15,14,45,44,43,53,52,51,65,63,67,64,92,92;', '0:0:0:0:0:0:0:1', '2018-07-27 17:50:28');
INSERT INTO `tb_log` VALUES ('488', 'admin', '更新管理员信息', '/irs/sys/updAdmin', 'TbAdmin [id=1, username=admin, password=null, salt=null, fullname=arthur, eMail=isduxd@163.com, sex=3, birthday=1994-11-08, address=北京市通州区科创十四街, phone=17693109997, roleId=1, roleName=null];', '0:0:0:0:0:0:0:1', '2018-07-27 17:52:16');
INSERT INTO `tb_log` VALUES ('489', 'admin', '维护菜单信息', '/irs/sys/menuForm', 'com.irs.pojo.TbMenus@1ee6e12;1;', '0:0:0:0:0:0:0:1', '2018-07-28 22:32:55');
INSERT INTO `tb_log` VALUES ('490', 'admin', '维护菜单信息', '/irs/sys/menuForm', 'com.irs.pojo.TbMenus@172b8bb;1;', '0:0:0:0:0:0:0:1', '2018-07-28 23:57:32');
INSERT INTO `tb_log` VALUES ('491', 'admin', '删除菜单信息', '/irs/sys/delMenuById/94', '94;', '0:0:0:0:0:0:0:1', '2018-07-28 23:57:41');
INSERT INTO `tb_log` VALUES ('492', '系统自动任务', '定时删除日志：1条', '', '', '', '2018-06-29 00:00:00');
INSERT INTO `tb_log` VALUES ('493', 'admin', '更新角色信息', '/irs/sys/updRole', 'TbRoles [roleId=1, roleName=超级管理员, roleRemark=超级管理员];93,93,1,1,16,3,2,17,3,2,18,3,2,19,3,2,20,4,2,21,4,2,22,4,2,23,4,2,47,46,2,48,46,2,49,46,2,50,46,2,33,10,9,34,11,9,35,11,9,36,11,9,37,11,9,42,15,14,45,44,43,53,52,51,65,63,67,64,92,92;', '0:0:0:0:0:0:0:1', '2018-07-29 00:10:55');
INSERT INTO `tb_log` VALUES ('494', 'admin', '维护菜单信息', '/irs/sys/menuForm', 'com.irs.pojo.TbMenus@1ffdbe8;;', '0:0:0:0:0:0:0:1', '2018-07-29 00:44:02');
INSERT INTO `tb_log` VALUES ('495', 'admin', '删除菜单信息', '/irs_maven/sys/delMenuById/93', '93;', '0:0:0:0:0:0:0:1', '2018-08-04 12:29:26');
INSERT INTO `tb_log` VALUES ('496', 'admin', '添加角色信息', '/irs_maven/sys/insRole', 'TbRoles [roleId=null, roleName=test, roleRemark=test];1,1,16,3,2,17,3,2,18,3,2,19,3,2,20,4,2,21,4,2,22,4,2,23,4,2,47,46,2,48,46,2,49,46,2,50,46,2,33,10,9,34,11,9,35,11,9,36,11,9,37,11,9,42,15,14,45,44,43,53,52,51,65,63,67,64,92,92;', '0:0:0:0:0:0:0:1', '2018-08-04 12:29:43');
INSERT INTO `tb_log` VALUES ('497', 'admin', '删除菜单信息', '/irs_maven/sys/delMenuById/92', '92;', '127.0.0.1', '2018-08-04 12:42:34');
INSERT INTO `tb_log` VALUES ('498', 'admin', '删除菜单信息', '/irs_maven/sys/delMenuById/67', '67;', '127.0.0.1', '2018-08-04 12:42:40');
INSERT INTO `tb_log` VALUES ('499', 'admin', '删除菜单信息', '/irs_maven/sys/delMenuById/64', '64;', '127.0.0.1', '2018-08-04 12:42:45');
INSERT INTO `tb_log` VALUES ('500', 'admin', '删除菜单信息', '/irs_maven/sys/delMenuById/65', '65;', '127.0.0.1', '2018-08-04 12:42:49');
INSERT INTO `tb_log` VALUES ('501', 'admin', '删除菜单信息', '/irs_maven/sys/delMenuById/63', '63;', '127.0.0.1', '2018-08-04 12:42:54');
INSERT INTO `tb_log` VALUES ('502', 'admin', '删除菜单信息', '/irs_maven/sys/delMenuById/53', '53;', '127.0.0.1', '2018-08-04 12:43:00');
INSERT INTO `tb_log` VALUES ('503', 'admin', '删除菜单信息', '/irs_maven/sys/delMenuById/52', '52;', '127.0.0.1', '2018-08-04 12:43:05');
INSERT INTO `tb_log` VALUES ('504', 'admin', '删除菜单信息', '/irs_maven/sys/delMenuById/51', '51;', '127.0.0.1', '2018-08-04 12:43:09');
INSERT INTO `tb_log` VALUES ('505', 'admin', '维护菜单信息', '/irs_maven/sys/menuForm', 'com.irs.pojo.TbMenus@17f031a;1;', '127.0.0.1', '2018-08-04 12:43:18');
INSERT INTO `tb_log` VALUES ('506', 'admin', '维护菜单信息', '/irs_maven/sys/menuForm', 'com.irs.pojo.TbMenus@8acdac;1;', '127.0.0.1', '2018-08-04 12:43:25');
INSERT INTO `tb_log` VALUES ('507', 'admin', '维护菜单信息', '/irs_maven/sys/menuForm', 'com.irs.pojo.TbMenus@cc5bd8;1;', '127.0.0.1', '2018-08-04 12:43:34');
INSERT INTO `tb_log` VALUES ('508', 'admin', '维护菜单信息', '/irs_maven/sys/menuForm', 'com.irs.pojo.TbMenus@1388c40;1;', '127.0.0.1', '2018-08-04 12:43:43');
INSERT INTO `tb_log` VALUES ('509', 'admin', '维护菜单信息', '/irs_maven/sys/menuForm', 'com.irs.pojo.TbMenus@1fc9671;1;', '127.0.0.1', '2018-08-04 12:43:52');
INSERT INTO `tb_log` VALUES ('510', 'admin', '维护菜单信息', '/irs_maven/sys/menuForm', 'com.irs.pojo.TbMenus@de1a5e;1;', '127.0.0.1', '2018-08-04 12:44:00');
INSERT INTO `tb_log` VALUES ('511', 'admin', '维护菜单信息', '/irs_maven/sys/menuForm', 'com.irs.pojo.TbMenus@a6f684;1;', '127.0.0.1', '2018-08-04 12:44:08');
INSERT INTO `tb_log` VALUES ('512', 'admin', '维护菜单信息', '/irs_maven/sys/menuForm', 'com.irs.pojo.TbMenus@1745bf3;1;', '127.0.0.1', '2018-08-04 12:44:17');
INSERT INTO `tb_log` VALUES ('513', 'admin', '维护菜单信息', '/irs_maven/sys/menuForm', 'com.irs.pojo.TbMenus@e6395e;1;', '127.0.0.1', '2018-08-04 12:44:25');
INSERT INTO `tb_log` VALUES ('514', 'admin', '维护菜单信息', '/irs_maven/sys/menuForm', 'com.irs.pojo.TbMenus@18d49;1;', '127.0.0.1', '2018-08-04 12:44:35');
INSERT INTO `tb_log` VALUES ('515', 'admin', '维护菜单信息', '/irs_maven/sys/menuForm', 'com.irs.pojo.TbMenus@17b789b;1;', '127.0.0.1', '2018-08-04 12:44:46');
INSERT INTO `tb_log` VALUES ('516', 'admin', '维护菜单信息', '/irs_maven/sys/menuForm', 'com.irs.pojo.TbMenus@76ccd2;1;', '127.0.0.1', '2018-08-04 12:44:55');
INSERT INTO `tb_log` VALUES ('517', 'admin', '维护菜单信息', '/irs_maven/sys/menuForm', 'com.irs.pojo.TbMenus@9dd611;1;', '127.0.0.1', '2018-08-04 12:45:03');
INSERT INTO `tb_log` VALUES ('518', 'admin', '维护菜单信息', '/irs_maven/sys/menuForm', 'com.irs.pojo.TbMenus@13067d9;1;', '127.0.0.1', '2018-08-04 12:45:11');
INSERT INTO `tb_log` VALUES ('519', 'admin', '维护菜单信息', '/irs_maven/sys/menuForm', 'com.irs.pojo.TbMenus@7927fa;1;', '127.0.0.1', '2018-08-04 12:45:25');
INSERT INTO `tb_log` VALUES ('520', 'admin', '维护菜单信息', '/irs_maven/sys/menuForm', 'com.irs.pojo.TbMenus@42fb10;1;', '127.0.0.1', '2018-08-04 12:45:34');
INSERT INTO `tb_log` VALUES ('521', 'admin', '维护菜单信息', '/irs_maven/sys/menuForm', 'com.irs.pojo.TbMenus@1c49860;1;', '127.0.0.1', '2018-08-04 12:45:42');
INSERT INTO `tb_log` VALUES ('522', 'admin', '维护菜单信息', '/irs_maven/sys/menuForm', 'com.irs.pojo.TbMenus@1e39400;1;', '127.0.0.1', '2018-08-04 12:45:50');
INSERT INTO `tb_log` VALUES ('523', 'admin', '维护菜单信息', '/irs_maven/sys/menuForm', 'com.irs.pojo.TbMenus@17a9696;1;', '127.0.0.1', '2018-08-04 12:45:59');
INSERT INTO `tb_log` VALUES ('524', 'admin', '维护菜单信息', '/irs_maven/sys/menuForm', 'com.irs.pojo.TbMenus@5aa912;1;', '127.0.0.1', '2018-08-04 12:46:13');
INSERT INTO `tb_log` VALUES ('525', 'admin', '维护菜单信息', '/irs_maven/sys/menuForm', 'com.irs.pojo.TbMenus@f5ea54;1;', '127.0.0.1', '2018-08-04 12:46:23');
INSERT INTO `tb_log` VALUES ('526', 'admin', '维护菜单信息', '/irs_maven/sys/menuForm', 'com.irs.pojo.TbMenus@1d88d8f;1;', '127.0.0.1', '2018-08-04 12:46:33');
INSERT INTO `tb_log` VALUES ('527', 'admin', '维护菜单信息', '/irs_maven/sys/menuForm', 'com.irs.pojo.TbMenus@1a929ea;1;', '127.0.0.1', '2018-08-04 12:46:44');
INSERT INTO `tb_log` VALUES ('528', 'admin', '维护菜单信息', '/irs_maven/sys/menuForm', 'com.irs.pojo.TbMenus@12df753;1;', '127.0.0.1', '2018-08-04 12:46:54');
INSERT INTO `tb_log` VALUES ('529', 'admin', '维护菜单信息', '/irs_maven/sys/menuForm', 'com.irs.pojo.TbMenus@1845fa;1;', '127.0.0.1', '2018-08-04 12:47:02');
INSERT INTO `tb_log` VALUES ('530', 'admin', '维护菜单信息', '/irs_maven/sys/menuForm', 'com.irs.pojo.TbMenus@1c1789b;1;', '127.0.0.1', '2018-08-04 12:47:09');
INSERT INTO `tb_log` VALUES ('531', 'admin', '维护菜单信息', '/irs_maven/sys/menuForm', 'com.irs.pojo.TbMenus@fb8afb;1;', '127.0.0.1', '2018-08-04 12:47:23');
INSERT INTO `tb_log` VALUES ('532', 'admin', '维护菜单信息', '/irs_maven/sys/menuForm', 'com.irs.pojo.TbMenus@e20882;1;', '127.0.0.1', '2018-08-04 12:47:31');
INSERT INTO `tb_log` VALUES ('533', 'admin', '维护菜单信息', '/irs_maven/sys/menuForm', 'com.irs.pojo.TbMenus@1bf4000;1;', '127.0.0.1', '2018-08-04 12:47:38');
INSERT INTO `tb_log` VALUES ('534', 'admin', '维护菜单信息', '/irs_maven/sys/menuForm', 'com.irs.pojo.TbMenus@1593ad3;1;', '127.0.0.1', '2018-08-04 12:47:46');
INSERT INTO `tb_log` VALUES ('535', 'admin', '维护菜单信息', '/irs_maven/sys/menuForm', 'com.irs.pojo.TbMenus@6e451f;1;', '127.0.0.1', '2018-08-04 12:48:16');
INSERT INTO `tb_log` VALUES ('536', 'admin', '维护菜单信息', '/irs_maven/sys/menuForm', 'com.irs.pojo.TbMenus@1780474;1;', '127.0.0.1', '2018-08-04 12:48:26');
INSERT INTO `tb_log` VALUES ('537', 'admin', '维护菜单信息', '/irs_maven/sys/menuForm', 'com.irs.pojo.TbMenus@169799d;1;', '127.0.0.1', '2018-08-04 12:49:03');
INSERT INTO `tb_log` VALUES ('538', 'admin', '维护菜单信息', '/irs_maven/sys/menuForm', 'com.irs.pojo.TbMenus@381f10;1;', '127.0.0.1', '2018-08-04 12:49:55');
INSERT INTO `tb_log` VALUES ('539', 'admin', '维护菜单信息', '/irs_maven/sys/menuForm', 'com.irs.pojo.TbMenus@1ff2858;1;', '127.0.0.1', '2018-08-04 12:50:12');
INSERT INTO `tb_log` VALUES ('540', 'admin', '维护菜单信息', '/irs_maven/sys/menuForm', 'com.irs.pojo.TbMenus@1fcf96f;1;', '127.0.0.1', '2018-08-04 12:50:48');
INSERT INTO `tb_log` VALUES ('541', 'admin', '维护菜单信息', '/irs_maven/sys/menuForm', 'com.irs.pojo.TbMenus@15ceaf8;1;', '127.0.0.1', '2018-08-04 12:51:02');
INSERT INTO `tb_log` VALUES ('542', 'admin', '维护菜单信息', '/irs_maven/sys/menuForm', 'com.irs.pojo.TbMenus@f7dfaa;1;', '127.0.0.1', '2018-08-04 12:51:28');
INSERT INTO `tb_log` VALUES ('543', 'admin', '维护菜单信息', '/irs_maven/sys/menuForm', 'com.irs.pojo.TbMenus@5b0e99;1;', '127.0.0.1', '2018-08-04 12:51:44');
INSERT INTO `tb_log` VALUES ('544', 'admin', '维护菜单信息', '/irs_maven/sys/menuForm', 'com.irs.pojo.TbMenus@ecdaa3;1;', '127.0.0.1', '2018-08-04 12:51:55');
INSERT INTO `tb_log` VALUES ('545', 'admin', '维护菜单信息', '/irs_maven/sys/menuForm', 'com.irs.pojo.TbMenus@5d20dd;1;', '127.0.0.1', '2018-08-04 12:52:08');
INSERT INTO `tb_log` VALUES ('546', 'admin', '维护菜单信息', '/irs_maven/sys/menuForm', 'com.irs.pojo.TbMenus@158e1f7;1;', '127.0.0.1', '2018-08-04 12:52:22');
INSERT INTO `tb_log` VALUES ('547', 'admin', '维护菜单信息', '/irs_maven/sys/menuForm', 'com.irs.pojo.TbMenus@152d873;1;', '127.0.0.1', '2018-08-04 12:52:34');
INSERT INTO `tb_log` VALUES ('548', 'admin', '更新角色信息', '/irs_maven/sys/updRole', 'TbRoles [roleId=1, roleName=超级管理员, roleRemark=超级管理员];1,1,16,3,2,17,3,2,18,3,2,19,3,2,20,4,2,21,4,2,22,4,2,23,4,2,47,46,2,48,46,2,49,46,2,50,46,2,33,10,9,34,11,9,35,11,9,36,11,9,37,11,9,42,15,14,45,44,43,97,96,95,98,96,95,100,99,95,101,99,95,103,102,95,104,102,95,106,105,95,107,105,95,112,109,108,113,109,108,114,110,108,115,110,108,116,111,108,117,111,108,123,119,118,124,119,118,125,120,118,126,120,118,127,121,118,128,121,118,129,122,118,130,122,118,131,131;', '127.0.0.1', '2018-08-04 12:53:52');
INSERT INTO `tb_log` VALUES ('549', 'admin', '删除菜单信息', '/irs_maven/sys/delMenuById/137', '137;', '127.0.0.1', '2018-08-04 12:58:03');
INSERT INTO `tb_log` VALUES ('550', 'admin', '删除菜单信息', '/irs_maven/sys/delMenuById/136', '136;', '127.0.0.1', '2018-08-04 12:58:09');
INSERT INTO `tb_log` VALUES ('551', 'admin', '删除菜单信息', '/irs_maven/sys/delMenuById/133', '133;', '127.0.0.1', '2018-08-04 12:58:13');
INSERT INTO `tb_log` VALUES ('552', 'admin', '删除菜单信息', '/irs_maven/sys/delMenuById/135', '135;', '127.0.0.1', '2018-08-04 12:58:20');
INSERT INTO `tb_log` VALUES ('553', 'admin', '删除菜单信息', '/irs_maven/sys/delMenuById/134', '134;', '127.0.0.1', '2018-08-04 12:58:25');
INSERT INTO `tb_log` VALUES ('554', 'admin', '删除菜单信息', '/irs_maven/sys/delMenuById/132', '132;', '127.0.0.1', '2018-08-04 12:58:30');
INSERT INTO `tb_log` VALUES ('555', 'admin', '删除菜单信息', '/irs_maven/sys/delMenuById/131', '131;', '127.0.0.1', '2018-08-04 12:58:35');
INSERT INTO `tb_log` VALUES ('556', 'admin', '删除菜单信息', '/irs_maven/sys/delMenuById/130', '130;', '127.0.0.1', '2018-08-04 12:58:43');
INSERT INTO `tb_log` VALUES ('557', 'admin', '删除菜单信息', '/irs_maven/sys/delMenuById/129', '129;', '127.0.0.1', '2018-08-04 12:58:48');
INSERT INTO `tb_log` VALUES ('558', 'admin', '删除菜单信息', '/irs_maven/sys/delMenuById/122', '122;', '127.0.0.1', '2018-08-04 12:58:53');
INSERT INTO `tb_log` VALUES ('559', 'admin', '删除菜单信息', '/irs_maven/sys/delMenuById/128', '128;', '127.0.0.1', '2018-08-04 12:58:59');
INSERT INTO `tb_log` VALUES ('560', 'admin', '删除菜单信息', '/irs_maven/sys/delMenuById/127', '127;', '127.0.0.1', '2018-08-04 12:59:04');
INSERT INTO `tb_log` VALUES ('561', 'admin', '删除菜单信息', '/irs_maven/sys/delMenuById/121', '121;', '127.0.0.1', '2018-08-04 12:59:09');
INSERT INTO `tb_log` VALUES ('562', 'admin', '删除菜单信息', '/irs_maven/sys/delMenuById/126', '126;', '127.0.0.1', '2018-08-04 12:59:16');
INSERT INTO `tb_log` VALUES ('563', 'admin', '删除菜单信息', '/irs_maven/sys/delMenuById/125', '125;', '127.0.0.1', '2018-08-04 12:59:22');
INSERT INTO `tb_log` VALUES ('564', 'admin', '删除菜单信息', '/irs_maven/sys/delMenuById/120', '120;', '127.0.0.1', '2018-08-04 12:59:27');
INSERT INTO `tb_log` VALUES ('565', 'admin', '删除菜单信息', '/irs_maven/sys/delMenuById/124', '124;', '127.0.0.1', '2018-08-04 12:59:32');
INSERT INTO `tb_log` VALUES ('566', 'admin', '删除菜单信息', '/irs_maven/sys/delMenuById/123', '123;', '127.0.0.1', '2018-08-04 12:59:37');
INSERT INTO `tb_log` VALUES ('567', 'admin', '删除菜单信息', '/irs_maven/sys/delMenuById/119', '119;', '127.0.0.1', '2018-08-04 12:59:41');
INSERT INTO `tb_log` VALUES ('568', 'admin', '删除菜单信息', '/irs_maven/sys/delMenuById/118', '118;', '127.0.0.1', '2018-08-04 12:59:45');
INSERT INTO `tb_log` VALUES ('569', 'admin', '维护菜单信息', '/irs_maven/sys/menuForm', 'com.irs.pojo.TbMenus@fd40ba;1;', '127.0.0.1', '2018-08-04 13:01:36');
INSERT INTO `tb_log` VALUES ('570', 'admin', '维护菜单信息', '/irs_maven/sys/menuForm', 'com.irs.pojo.TbMenus@1caae15;1;', '127.0.0.1', '2018-08-04 13:01:45');
INSERT INTO `tb_log` VALUES ('571', 'admin', '维护菜单信息', '/irs_maven/sys/menuForm', 'com.irs.pojo.TbMenus@106343b;1;', '127.0.0.1', '2018-08-04 13:01:54');
INSERT INTO `tb_log` VALUES ('572', 'admin', '维护菜单信息', '/irs_maven/sys/menuForm', 'com.irs.pojo.TbMenus@9ca972;1;', '127.0.0.1', '2018-08-04 13:02:05');
INSERT INTO `tb_log` VALUES ('573', 'admin', '维护菜单信息', '/irs_maven/sys/menuForm', 'com.irs.pojo.TbMenus@bb7c3f;1;', '127.0.0.1', '2018-08-04 13:02:15');
INSERT INTO `tb_log` VALUES ('574', 'admin', '维护菜单信息', '/irs_maven/sys/menuForm', 'com.irs.pojo.TbMenus@88f995;1;', '127.0.0.1', '2018-08-04 13:02:26');
INSERT INTO `tb_log` VALUES ('575', 'admin', '维护菜单信息', '/irs_maven/sys/menuForm', 'com.irs.pojo.TbMenus@51612;1;', '127.0.0.1', '2018-08-04 13:02:37');
INSERT INTO `tb_log` VALUES ('576', 'admin', '维护菜单信息', '/irs_maven/sys/menuForm', 'com.irs.pojo.TbMenus@e73f11;1;', '127.0.0.1', '2018-08-04 13:02:51');
INSERT INTO `tb_log` VALUES ('577', 'admin', '维护菜单信息', '/irs_maven/sys/menuForm', 'com.irs.pojo.TbMenus@1cfa62a;1;', '127.0.0.1', '2018-08-04 13:03:02');
INSERT INTO `tb_log` VALUES ('578', 'admin', '维护菜单信息', '/irs_maven/sys/menuForm', 'com.irs.pojo.TbMenus@16f951c;1;', '127.0.0.1', '2018-08-04 13:03:21');
INSERT INTO `tb_log` VALUES ('579', 'admin', '维护菜单信息', '/irs_maven/sys/menuForm', 'com.irs.pojo.TbMenus@11f0bb8;1;', '127.0.0.1', '2018-08-04 13:03:33');
INSERT INTO `tb_log` VALUES ('580', 'admin', '维护菜单信息', '/irs_maven/sys/menuForm', 'com.irs.pojo.TbMenus@1bf1939;1;', '127.0.0.1', '2018-08-04 13:03:47');
INSERT INTO `tb_log` VALUES ('581', 'admin', '维护菜单信息', '/irs_maven/sys/menuForm', 'com.irs.pojo.TbMenus@a6cf06;1;', '127.0.0.1', '2018-08-04 13:03:57');
INSERT INTO `tb_log` VALUES ('582', 'admin', '删除菜单信息', '/irs_maven/sys/delMenuById/138', '138;', '127.0.0.1', '2018-08-04 13:05:06');
INSERT INTO `tb_log` VALUES ('583', 'admin', '删除菜单信息', '/irs_maven/sys/delMenuById/144', '144;', '127.0.0.1', '2018-08-04 13:05:11');
INSERT INTO `tb_log` VALUES ('584', 'admin', '删除菜单信息', '/irs_maven/sys/delMenuById/145', '145;', '127.0.0.1', '2018-08-04 13:05:21');
INSERT INTO `tb_log` VALUES ('585', 'admin', '删除菜单信息', '/irs_maven/sys/delMenuById/143', '143;', '127.0.0.1', '2018-08-04 13:05:29');
INSERT INTO `tb_log` VALUES ('586', 'admin', '删除菜单信息', '/irs_maven/sys/delMenuById/139', '139;', '127.0.0.1', '2018-08-04 13:05:35');
INSERT INTO `tb_log` VALUES ('587', 'admin', '删除菜单信息', '/irs_maven/sys/delMenuById/140', '140;', '127.0.0.1', '2018-08-04 13:05:40');
INSERT INTO `tb_log` VALUES ('588', 'admin', '删除菜单信息', '/irs_maven/sys/delMenuById/146', '146;', '127.0.0.1', '2018-08-04 13:05:52');
INSERT INTO `tb_log` VALUES ('589', 'admin', '删除菜单信息', '/irs_maven/sys/delMenuById/140', '140;', '127.0.0.1', '2018-08-04 13:05:56');
INSERT INTO `tb_log` VALUES ('590', 'admin', '删除菜单信息', '/irs_maven/sys/delMenuById/147', '147;', '127.0.0.1', '2018-08-04 13:06:03');
INSERT INTO `tb_log` VALUES ('591', 'admin', '删除菜单信息', '/irs_maven/sys/delMenuById/148', '148;', '127.0.0.1', '2018-08-04 13:06:09');
INSERT INTO `tb_log` VALUES ('592', 'admin', '删除菜单信息', '/irs_maven/sys/delMenuById/141', '141;', '127.0.0.1', '2018-08-04 13:06:15');
INSERT INTO `tb_log` VALUES ('593', 'admin', '删除菜单信息', '/irs_maven/sys/delMenuById/149', '149;', '127.0.0.1', '2018-08-04 13:06:21');
INSERT INTO `tb_log` VALUES ('594', 'admin', '删除菜单信息', '/irs_maven/sys/delMenuById/150', '150;', '127.0.0.1', '2018-08-04 13:06:28');
INSERT INTO `tb_log` VALUES ('595', 'admin', '删除菜单信息', '/irs_maven/sys/delMenuById/142', '142;', '127.0.0.1', '2018-08-04 13:06:33');
INSERT INTO `tb_log` VALUES ('596', 'admin', '删除菜单信息', '/irs_maven/sys/delMenuById/138', '138;', '127.0.0.1', '2018-08-04 13:06:37');
INSERT INTO `tb_log` VALUES ('597', 'admin', '删除菜单信息', '/irs_maven/sys/delMenuById/117', '117;', '127.0.0.1', '2018-08-04 13:06:44');
INSERT INTO `tb_log` VALUES ('598', 'admin', '删除菜单信息', '/irs_maven/sys/delMenuById/116', '116;', '127.0.0.1', '2018-08-04 13:06:50');
INSERT INTO `tb_log` VALUES ('599', 'admin', '删除菜单信息', '/irs_maven/sys/delMenuById/111', '111;', '127.0.0.1', '2018-08-04 13:06:55');
INSERT INTO `tb_log` VALUES ('600', 'admin', '删除菜单信息', '/irs_maven/sys/delMenuById/114', '114;', '127.0.0.1', '2018-08-04 13:06:59');
INSERT INTO `tb_log` VALUES ('601', 'admin', '删除菜单信息', '/irs_maven/sys/delMenuById/115', '115;', '127.0.0.1', '2018-08-04 13:07:05');
INSERT INTO `tb_log` VALUES ('602', 'admin', '删除菜单信息', '/irs_maven/sys/delMenuById/110', '110;', '127.0.0.1', '2018-08-04 13:07:10');
INSERT INTO `tb_log` VALUES ('603', 'admin', '删除菜单信息', '/irs_maven/sys/delMenuById/113', '113;', '127.0.0.1', '2018-08-04 13:07:15');
INSERT INTO `tb_log` VALUES ('604', 'admin', '删除菜单信息', '/irs_maven/sys/delMenuById/112', '112;', '127.0.0.1', '2018-08-04 13:07:20');
INSERT INTO `tb_log` VALUES ('605', 'admin', '删除菜单信息', '/irs_maven/sys/delMenuById/109', '109;', '127.0.0.1', '2018-08-04 13:07:24');
INSERT INTO `tb_log` VALUES ('606', 'admin', '删除菜单信息', '/irs_maven/sys/delMenuById/108', '108;', '127.0.0.1', '2018-08-04 13:07:28');
INSERT INTO `tb_log` VALUES ('607', 'admin', '删除菜单信息', '/irs_maven/sys/delMenuById/107', '107;', '127.0.0.1', '2018-08-04 13:07:51');
INSERT INTO `tb_log` VALUES ('608', 'admin', '删除菜单信息', '/irs_maven/sys/delMenuById/106', '106;', '127.0.0.1', '2018-08-04 13:07:57');
INSERT INTO `tb_log` VALUES ('609', 'admin', '删除菜单信息', '/irs_maven/sys/delMenuById/105', '105;', '127.0.0.1', '2018-08-04 13:08:01');
INSERT INTO `tb_log` VALUES ('610', 'admin', '删除菜单信息', '/irs_maven/sys/delMenuById/104', '104;', '127.0.0.1', '2018-08-04 13:08:07');
INSERT INTO `tb_log` VALUES ('611', 'admin', '删除菜单信息', '/irs_maven/sys/delMenuById/103', '103;', '127.0.0.1', '2018-08-04 13:08:13');
INSERT INTO `tb_log` VALUES ('612', 'admin', '删除菜单信息', '/irs_maven/sys/delMenuById/102', '102;', '127.0.0.1', '2018-08-04 13:08:18');
INSERT INTO `tb_log` VALUES ('613', 'admin', '删除菜单信息', '/irs_maven/sys/delMenuById/101', '101;', '127.0.0.1', '2018-08-04 13:08:25');
INSERT INTO `tb_log` VALUES ('614', 'admin', '删除菜单信息', '/irs_maven/sys/delMenuById/100', '100;', '127.0.0.1', '2018-08-04 13:08:30');
INSERT INTO `tb_log` VALUES ('615', 'admin', '删除菜单信息', '/irs_maven/sys/delMenuById/99', '99;', '127.0.0.1', '2018-08-04 13:08:35');
INSERT INTO `tb_log` VALUES ('616', 'admin', '更新角色信息', '/irs_maven/sys/updRole', 'TbRoles [roleId=61, roleName=test, roleRemark=test];1,1,16,3,2,17,3,2,18,3,2,19,3,2,20,4,2,21,4,2,22,4,2,23,4,2,47,46,2,48,46,2,49,46,2,50,46,2,33,10,9,34,11,9,35,11,9,36,11,9,37,11,9,42,15,14,45,44,43,97,96,95,98,96,95,100,99,95;', '0:0:0:0:0:0:0:1', '2018-08-04 13:08:35');
INSERT INTO `tb_log` VALUES ('617', 'admin', '删除菜单信息', '/irs_maven/sys/delMenuById/98', '98;', '127.0.0.1', '2018-08-04 13:08:40');
INSERT INTO `tb_log` VALUES ('618', 'admin', '删除菜单信息', '/irs_maven/sys/delMenuById/97', '97;', '127.0.0.1', '2018-08-04 13:08:45');
INSERT INTO `tb_log` VALUES ('619', 'admin', '删除菜单信息', '/irs_maven/sys/delMenuById/96', '96;', '127.0.0.1', '2018-08-04 13:08:51');
INSERT INTO `tb_log` VALUES ('620', 'admin', '删除菜单信息', '/irs_maven/sys/delMenuById/95', '95;', '127.0.0.1', '2018-08-04 13:08:55');
INSERT INTO `tb_log` VALUES ('621', 'admin', '维护菜单信息', '/irs_maven/sys/menuForm', 'com.irs.pojo.TbMenus@18a183;1;', '127.0.0.1', '2018-08-04 13:09:08');
INSERT INTO `tb_log` VALUES ('622', 'admin', '维护菜单信息', '/irs_maven/sys/menuForm', 'com.irs.pojo.TbMenus@889851;1;', '127.0.0.1', '2018-08-04 13:09:15');
INSERT INTO `tb_log` VALUES ('623', 'admin', '维护菜单信息', '/irs_maven/sys/menuForm', 'com.irs.pojo.TbMenus@1e23b08;1;', '127.0.0.1', '2018-08-04 13:09:23');
INSERT INTO `tb_log` VALUES ('624', 'admin', '维护菜单信息', '/irs_maven/sys/menuForm', 'com.irs.pojo.TbMenus@1884390;1;', '127.0.0.1', '2018-08-04 13:09:31');
INSERT INTO `tb_log` VALUES ('625', 'admin', '维护菜单信息', '/irs_maven/sys/menuForm', 'com.irs.pojo.TbMenus@350c84;1;', '127.0.0.1', '2018-08-04 13:09:43');
INSERT INTO `tb_log` VALUES ('626', 'admin', '维护菜单信息', '/irs_maven/sys/menuForm', 'com.irs.pojo.TbMenus@27d502;1;', '127.0.0.1', '2018-08-04 13:09:52');
INSERT INTO `tb_log` VALUES ('627', 'admin', '维护菜单信息', '/irs_maven/sys/menuForm', 'com.irs.pojo.TbMenus@fbfa26;1;', '127.0.0.1', '2018-08-04 13:10:00');
INSERT INTO `tb_log` VALUES ('628', 'admin', '维护菜单信息', '/irs_maven/sys/menuForm', 'com.irs.pojo.TbMenus@49806a;1;', '127.0.0.1', '2018-08-04 13:10:07');
INSERT INTO `tb_log` VALUES ('629', 'admin', '维护菜单信息', '/irs_maven/sys/menuForm', 'com.irs.pojo.TbMenus@1ca845e;1;', '127.0.0.1', '2018-08-04 13:10:15');
INSERT INTO `tb_log` VALUES ('630', 'admin', '维护菜单信息', '/irs_maven/sys/menuForm', 'com.irs.pojo.TbMenus@13720d;1;', '127.0.0.1', '2018-08-04 13:10:24');
INSERT INTO `tb_log` VALUES ('631', 'admin', '维护菜单信息', '/irs_maven/sys/menuForm', 'com.irs.pojo.TbMenus@18b5d70;1;', '127.0.0.1', '2018-08-04 13:10:33');
INSERT INTO `tb_log` VALUES ('632', 'admin', '维护菜单信息', '/irs_maven/sys/menuForm', 'com.irs.pojo.TbMenus@a20b41;1;', '127.0.0.1', '2018-08-04 13:10:42');
INSERT INTO `tb_log` VALUES ('633', 'admin', '维护菜单信息', '/irs_maven/sys/menuForm', 'com.irs.pojo.TbMenus@13b501;1;', '127.0.0.1', '2018-08-04 13:10:50');
INSERT INTO `tb_log` VALUES ('634', 'admin', '更新角色信息', '/irs_maven/sys/updRole', 'TbRoles [roleId=61, roleName=test, roleRemark=test];1,1,16,3,2,17,3,2,18,3,2,19,3,2,20,4,2,21,4,2,22,4,2,23,4,2,47,46,2,48,46,2,49,46,2,50,46,2,33,10,9,34,11,9,35,11,9,36,11,9,37,11,9,42,15,14,45,44,43,151,151;', '0:0:0:0:0:0:0:1', '2018-08-04 13:11:45');
INSERT INTO `tb_log` VALUES ('635', 'admin', '更新角色信息', '/irs_maven/sys/updRole', 'TbRoles [roleId=61, roleName=test, roleRemark=test];1,1,16,3,2,17,3,2,18,3,2,19,3,2,20,4,2,21,4,2,22,4,2,23,4,2,47,46,2,48,46,2,49,46,2,50,46,2,33,10,9,34,11,9,35,11,9,36,11,9,37,11,9,42,15,14,45,44,43,151,151;', '0:0:0:0:0:0:0:1', '2018-08-04 13:12:02');
INSERT INTO `tb_log` VALUES ('636', 'admin', '添加角色信息', '/irs_maven/sys/insRole', 'TbRoles [roleId=null, roleName=2313, roleRemark=213123];1,1,16,3,2,17,3,2,18,3,2,19,3,2,20,4,2,21,4,2,22,4,2,23,4,2,47,46,2,48,46,2,49,46,2,50,46,2,33,10,9,34,11,9,35,11,9,36,11,9,37,11,9,42,15,14,45,44,43,151,151;', '0:0:0:0:0:0:0:1', '2018-08-04 13:13:13');
INSERT INTO `tb_log` VALUES ('637', 'admin', '删除菜单信息', '/irs_maven/sys/delMenuById/156', '156;', '0:0:0:0:0:0:0:1', '2018-08-04 20:20:28');
INSERT INTO `tb_log` VALUES ('638', 'admin', '删除菜单信息', '/irs_maven/sys/delMenuById/157', '157;', '0:0:0:0:0:0:0:1', '2018-08-04 20:20:35');
INSERT INTO `tb_log` VALUES ('639', 'admin', '删除菜单信息', '/irs_maven/sys/delMenuById/152', '152;', '0:0:0:0:0:0:0:1', '2018-08-04 20:20:40');
INSERT INTO `tb_log` VALUES ('640', 'admin', '删除菜单信息', '/irs_maven/sys/delMenuById/158', '158;', '0:0:0:0:0:0:0:1', '2018-08-04 20:20:45');
INSERT INTO `tb_log` VALUES ('641', 'admin', '删除菜单信息', '/irs_maven/sys/delMenuById/159', '159;', '0:0:0:0:0:0:0:1', '2018-08-04 20:20:51');
INSERT INTO `tb_log` VALUES ('642', 'admin', '删除菜单信息', '/irs_maven/sys/delMenuById/153', '153;', '0:0:0:0:0:0:0:1', '2018-08-04 20:20:58');
INSERT INTO `tb_log` VALUES ('643', 'admin', '删除菜单信息', '/irs_maven/sys/delMenuById/160', '160;', '0:0:0:0:0:0:0:1', '2018-08-04 20:21:05');
INSERT INTO `tb_log` VALUES ('644', 'admin', '删除菜单信息', '/irs_maven/sys/delMenuById/161', '161;', '0:0:0:0:0:0:0:1', '2018-08-04 20:21:11');
INSERT INTO `tb_log` VALUES ('645', 'admin', '删除菜单信息', '/irs_maven/sys/delMenuById/154', '154;', '0:0:0:0:0:0:0:1', '2018-08-04 20:21:16');
INSERT INTO `tb_log` VALUES ('646', 'admin', '删除菜单信息', '/irs_maven/sys/delMenuById/162', '162;', '0:0:0:0:0:0:0:1', '2018-08-04 20:21:21');
INSERT INTO `tb_log` VALUES ('647', 'admin', '删除菜单信息', '/irs_maven/sys/delMenuById/163', '163;', '0:0:0:0:0:0:0:1', '2018-08-04 20:21:27');
INSERT INTO `tb_log` VALUES ('648', 'admin', '删除菜单信息', '/irs_maven/sys/delMenuById/155', '155;', '0:0:0:0:0:0:0:1', '2018-08-04 20:21:33');
INSERT INTO `tb_log` VALUES ('649', 'admin', '删除菜单信息', '/irs_maven/sys/delMenuById/151', '151;', '0:0:0:0:0:0:0:1', '2018-08-04 20:21:38');
INSERT INTO `tb_log` VALUES ('650', 'admin', '更新角色信息', '/irs_maven/sys/updRole', 'TbRoles [roleId=62, roleName=2313, roleRemark=213123];1,1,16,3,2,17,3,2,18,3,2,19,3,2,20,4,2,21,4,2,22,4,2,23,4,2,47,46,2,48,46,2,49,46,2,50,46,2,33,10,9,34,11,9,35,11,9,36,11,9,37,11,9,42,15,14;', '0:0:0:0:0:0:0:1', '2018-08-04 20:21:57');
INSERT INTO `tb_log` VALUES ('651', 'admin', '更新角色信息', '/irs_maven/sys/updRole', 'TbRoles [roleId=62, roleName=2313, roleRemark=213123];1,1,16,3,2,17,3,2,18,3,2,19,3,2,20,4,2,21,4,2,22,4,2,23,4,2,47,46,2,48,46,2,49,46,2,50,46,2,33,10,9,34,11,9,35,11,9,36,11,9,37,11,9,42,15,14,45,44,43;', '0:0:0:0:0:0:0:1', '2018-08-04 20:22:06');
INSERT INTO `tb_log` VALUES ('652', 'admin', '维护菜单信息', '/irs_maven/sys/menuForm', 'com.irs.pojo.TbMenus@1c35b6c;;', '0:0:0:0:0:0:0:1', '2018-08-16 17:02:43');
INSERT INTO `tb_log` VALUES ('653', 'admin', '维护菜单信息', '/irs_maven/sys/menuForm', 'com.irs.pojo.TbMenus@14bed9c;;', '0:0:0:0:0:0:0:1', '2018-08-16 17:02:55');
INSERT INTO `tb_log` VALUES ('654', 'admin', '维护菜单信息', '/irs_maven/sys/menuForm', 'com.irs.pojo.TbMenus@134c0a6;;', '0:0:0:0:0:0:0:1', '2018-08-16 17:04:07');
INSERT INTO `tb_log` VALUES ('655', 'admin', '维护菜单信息', '/irs_maven/sys/menuForm', 'com.irs.pojo.TbMenus@785941;;', '0:0:0:0:0:0:0:1', '2018-08-16 17:04:16');
INSERT INTO `tb_log` VALUES ('656', 'admin', '维护菜单信息', '/irs_maven/sys/menuForm', 'com.irs.pojo.TbMenus@1ea1f08;;', '0:0:0:0:0:0:0:1', '2018-08-16 17:04:26');
INSERT INTO `tb_log` VALUES ('657', 'admin', '维护菜单信息', '/irs_maven/sys/menuForm', 'com.irs.pojo.TbMenus@da555d;;', '0:0:0:0:0:0:0:1', '2018-08-16 17:12:06');
INSERT INTO `tb_log` VALUES ('658', 'admin', '维护菜单信息', '/irs_maven/sys/menuForm', 'com.irs.pojo.TbMenus@1d54d80;;', '0:0:0:0:0:0:0:1', '2018-08-16 17:16:23');
INSERT INTO `tb_log` VALUES ('659', 'admin', '维护菜单信息', '/irs_maven/sys/menuForm', 'com.irs.pojo.TbMenus@373a13;;', '0:0:0:0:0:0:0:1', '2018-08-16 17:16:38');
INSERT INTO `tb_log` VALUES ('660', 'admin', '维护菜单信息', '/irs_maven/sys/menuForm', 'com.irs.pojo.TbMenus@6f6cdf;1;', '0:0:0:0:0:0:0:1', '2018-08-16 17:16:51');
INSERT INTO `tb_log` VALUES ('661', 'admin', '更新管理员信息', '/irs_maven/sys/updAdmin', 'TbAdmin [id=1, username=admin, password=null, salt=null, fullname=arthur, eMail=isduxd@163.com, sex=0, birthday=1994-11-08, address=北京市通州区科创十四街, phone=17693109997, roleId=1, roleName=null];', '0:0:0:0:0:0:0:1', '2018-08-19 19:24:56');
INSERT INTO `tb_log` VALUES ('662', 'admin', '更新用户信息', '/irs_maven/user/updUser', 'TbUsers [uid=29, eMail=sdf@163.com, nickname=123123, sex=2, birthday=2018-07-27, address=123123, phone=17111111111, eCode=null, status=1, createTime=null];', '0:0:0:0:0:0:0:1', '2018-08-19 19:25:12');
INSERT INTO `tb_log` VALUES ('663', 'admin', '删除指定角色信息', '/irs_maven/sys/delRole/62', '62;', '0:0:0:0:0:0:0:1', '2018-08-19 19:26:52');
INSERT INTO `tb_log` VALUES ('664', 'admin', '更新角色信息', '/irs_maven/sys/updRole', 'TbRoles [roleId=61, roleName=test, roleRemark=test];1,1,16,3,2,17,3,2,18,3,2,19,3,2,20,4,2,21,4,2,22,4,2,23,4,2,47,46,2,48,46,2,49,46,2,50,46,2,33,10,9,34,11,9,35,11,9,36,11,9,37,11,9,42,15,14,45,44,43;', '0:0:0:0:0:0:0:1', '2018-08-19 19:27:05');
INSERT INTO `tb_log` VALUES ('665', 'admin', '更新角色信息', '/irs_maven/sys/updRole', 'TbRoles [roleId=61, roleName=test, roleRemark=test];1,1,16,3,2,17,3,2,18,3,2,19,3,2,20,4,2,47,46,2,48,46,2,49,46,2,50,46,2,33,10,9,34,11,9,35,11,9,36,11,9,37,11,9,45,44,43,42,15,14;', '0:0:0:0:0:0:0:1', '2018-08-19 19:44:40');
INSERT INTO `tb_log` VALUES ('666', 'admin', '更新管理员信息', '/irs_maven/sys/updAdmin', 'TbAdmin [id=18, username=test, password=null, salt=null, fullname=test, eMail=test@test.com, sex=1, birthday=2018-02-25, address=甘肃省兰州市榆中县和平镇, phone=17601038192, roleId=61, roleName=null];', '0:0:0:0:0:0:0:1', '2018-08-19 19:46:07');
INSERT INTO `tb_log` VALUES ('667', 'test', '更新角色信息', '/irs_maven/sys/updRole', 'TbRoles [roleId=61, roleName=test, roleRemark=test];1,1,16,3,2,17,3,2,18,3,2,19,3,2,20,4,2,47,46,2,48,46,2,49,46,2,50,46,2,34,11,9,45,44,43,42,15,14;', '0:0:0:0:0:0:0:1', '2018-08-19 19:50:00');
INSERT INTO `tb_log` VALUES ('668', 'admin', '维护菜单信息', '/irs_maven/sys/menuForm', 'com.irs.pojo.TbMenus@db8c02;1;', '0:0:0:0:0:0:0:1', '2018-08-21 09:54:02');
INSERT INTO `tb_log` VALUES ('669', 'admin', '维护菜单信息', '/irs_maven/sys/menuForm', 'com.irs.pojo.TbMenus@60009;1;', '0:0:0:0:0:0:0:1', '2018-08-21 09:54:19');
INSERT INTO `tb_log` VALUES ('670', 'admin', '维护菜单信息', '/irs_maven/sys/menuForm', 'com.irs.pojo.TbMenus@1192510;;', '0:0:0:0:0:0:0:1', '2018-08-21 09:54:29');
INSERT INTO `tb_log` VALUES ('671', 'admin', '维护菜单信息', '/irs_maven/sys/menuForm', 'com.irs.pojo.TbMenus@1501b0b;;', '0:0:0:0:0:0:0:1', '2018-08-21 09:54:49');
INSERT INTO `tb_log` VALUES ('672', 'admin', '维护菜单信息', '/irs_maven/sys/menuForm', 'com.irs.pojo.TbMenus@187bc69;1;', '0:0:0:0:0:0:0:1', '2018-08-21 09:55:05');
INSERT INTO `tb_log` VALUES ('673', 'admin', '维护菜单信息', '/irs_maven/sys/menuForm', 'com.irs.pojo.TbMenus@41267b;;', '0:0:0:0:0:0:0:1', '2018-08-21 09:55:27');
INSERT INTO `tb_log` VALUES ('674', 'admin', '维护菜单信息', '/irs_maven/sys/menuForm', 'com.irs.pojo.TbMenus@13037e1;1;', '0:0:0:0:0:0:0:1', '2018-08-21 09:55:50');
INSERT INTO `tb_log` VALUES ('675', 'admin', '维护菜单信息', '/irs_maven/sys/menuForm', 'com.irs.pojo.TbMenus@1ea4188;1;', '0:0:0:0:0:0:0:1', '2018-08-21 09:56:23');
INSERT INTO `tb_log` VALUES ('676', 'admin', '维护菜单信息', '/irs_maven/sys/menuForm', 'com.irs.pojo.TbMenus@19d9a84;1;', '0:0:0:0:0:0:0:1', '2018-08-21 09:56:45');
INSERT INTO `tb_log` VALUES ('677', 'admin', '更新角色信息', '/irs_maven/sys/updRole', 'TbRoles [roleId=1, roleName=超级管理员, roleRemark=超级管理员];1,1,16,3,2,17,3,2,18,3,2,19,3,2,20,4,2,21,4,2,22,4,2,23,4,2,47,46,2,48,46,2,49,46,2,50,46,2,33,10,9,34,11,9,35,11,9,36,11,9,37,11,9,53,52,51,54,52,51,55,52,51,56,52,51,45,44,43,42,15,14;', '0:0:0:0:0:0:0:1', '2018-08-21 09:57:03');
INSERT INTO `tb_log` VALUES ('678', 'admin', '维护菜单信息', '/irs_maven/sys/menuForm', 'com.irs.pojo.TbMenus@10d4297;;', '0:0:0:0:0:0:0:1', '2018-08-21 09:58:48');
INSERT INTO `tb_log` VALUES ('679', 'admin', '更新角色信息', '/irs_maven/sys/updRole', 'TbRoles [roleId=1, roleName=超级管理员, roleRemark=超级管理员];1,1,16,3,2,17,3,2,18,3,2,19,3,2,20,4,2,21,4,2,22,4,2,23,4,2,47,46,2,48,46,2,49,46,2,50,46,2,33,10,9,34,11,9,35,11,9,36,11,9,37,11,9,53,52,51,54,52,51,55,52,51,56,52,51,45,44,43,42,15,14;', '0:0:0:0:0:0:0:1', '2018-08-21 09:59:30');
INSERT INTO `tb_log` VALUES ('680', 'admin', '维护菜单信息', '/irs_maven/sys/menuForm', 'com.irs.pojo.TbMenus@1cfa31;;', '0:0:0:0:0:0:0:1', '2018-08-21 10:00:08');
INSERT INTO `tb_log` VALUES ('681', 'admin', '更新轮播图状态', '/irs_maven/carousel/update/8/0', '8;0;', '0:0:0:0:0:0:0:1', '2018-08-21 10:02:03');
INSERT INTO `tb_log` VALUES ('682', 'admin', '更新轮播图状态', '/irs_maven/carousel/update/8/1', '8;1;', '0:0:0:0:0:0:0:1', '2018-08-21 10:02:05');
INSERT INTO `tb_log` VALUES ('683', 'admin', '更新轮播图状态', '/irs_maven/carousel/update/8/0', '8;0;', '0:0:0:0:0:0:0:1', '2018-08-21 10:02:06');
INSERT INTO `tb_log` VALUES ('684', 'admin', '更新轮播图状态', '/irs_maven/carousel/update/9/1', '9;1;', '0:0:0:0:0:0:0:1', '2018-08-21 10:16:48');
INSERT INTO `tb_log` VALUES ('685', 'admin', '更新轮播图状态', '/irs_maven/carousel/update/9/0', '9;0;', '0:0:0:0:0:0:0:1', '2018-08-21 10:16:49');
INSERT INTO `tb_log` VALUES ('686', 'admin', '删除指定的轮播图', '/irs_maven/carousel/delete', '9;', '0:0:0:0:0:0:0:1', '2018-08-21 10:20:57');
INSERT INTO `tb_log` VALUES ('687', 'admin', '批量删除轮播图', '/irs_maven/carousel/deletes', '7;', '0:0:0:0:0:0:0:1', '2018-08-21 10:21:05');
INSERT INTO `tb_log` VALUES ('688', 'admin', '更新轮播图', '/irs_maven/carousel/update', 'com.irs.pojo.TbCarousel@1edad01;', '0:0:0:0:0:0:0:1', '2018-08-21 10:21:16');
INSERT INTO `tb_log` VALUES ('689', 'admin', '添加轮播信息', '/irs_maven/carousel/save', 'com.irs.pojo.TbCarousel@bb57a4;', '0:0:0:0:0:0:0:1', '2018-08-21 10:28:49');

-- ----------------------------
-- Table structure for tb_menus
-- ----------------------------
DROP TABLE IF EXISTS `tb_menus`;
CREATE TABLE `tb_menus` (
  `menu_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `title` varchar(20) NOT NULL COMMENT '菜单名',
  `icon` varchar(20) DEFAULT NULL COMMENT '图标',
  `href` varchar(100) DEFAULT NULL COMMENT '资源地址',
  `perms` varchar(500) DEFAULT NULL COMMENT '权限',
  `spread` varchar(10) NOT NULL COMMENT 'true：展开，false：不展开',
  `parent_id` bigint(20) NOT NULL COMMENT '父节点',
  `sorting` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`menu_id`)
) ENGINE=InnoDB AUTO_INCREMENT=57 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tb_menus
-- ----------------------------
INSERT INTO `tb_menus` VALUES ('1', '后台首页', '', 'page/main.html', '', 'false', '0', '9999');
INSERT INTO `tb_menus` VALUES ('2', '管理员管理', '', '', '', 'false', '0', '998');
INSERT INTO `tb_menus` VALUES ('3', '角色管理', '&#xe613;', 'sys/roleList', null, 'false', '2', null);
INSERT INTO `tb_menus` VALUES ('4', '管理员列表', '&#xe613;', 'sys/adminList', null, 'false', '2', null);
INSERT INTO `tb_menus` VALUES ('9', '用户管理', '&#xe61d;', null, null, 'false', '0', '997');
INSERT INTO `tb_menus` VALUES ('10', '添加用户', '&#xe608;', 'user/addUser', null, 'false', '9', null);
INSERT INTO `tb_menus` VALUES ('11', '管理用户', '&#xe60e;', 'user/userList', null, 'false', '9', null);
INSERT INTO `tb_menus` VALUES ('14', '系统日志', '&#xe61d;', null, null, 'false', '0', '995');
INSERT INTO `tb_menus` VALUES ('15', '日志管理', '&#xe642;', 'log/logList', null, 'false', '14', null);
INSERT INTO `tb_menus` VALUES ('16', '查看', '', '', 'sys:role:list', 'false', '3', null);
INSERT INTO `tb_menus` VALUES ('17', '新增', null, null, 'sys:role:save', 'false', '3', null);
INSERT INTO `tb_menus` VALUES ('18', '修改', null, null, 'sys:role:update', 'false', '3', null);
INSERT INTO `tb_menus` VALUES ('19', '删除', null, null, 'sys:role:delete', 'false', '3', null);
INSERT INTO `tb_menus` VALUES ('20', '查看', null, null, 'sys:admin:list', 'false', '4', null);
INSERT INTO `tb_menus` VALUES ('21', '新增', null, null, 'sys:admin:save', 'false', '4', null);
INSERT INTO `tb_menus` VALUES ('22', '修改', null, null, 'sys:admin:update', 'false', '4', null);
INSERT INTO `tb_menus` VALUES ('23', '删除', null, null, 'sys:admin:delete', 'false', '4', null);
INSERT INTO `tb_menus` VALUES ('33', '新增', null, null, 'user:user:save', 'false', '10', null);
INSERT INTO `tb_menus` VALUES ('34', '查看', null, null, 'user:user:list', 'false', '11', null);
INSERT INTO `tb_menus` VALUES ('35', '新增', null, null, 'user:user:save', 'false', '11', null);
INSERT INTO `tb_menus` VALUES ('36', '修改', null, null, 'user:user:update', 'false', '11', null);
INSERT INTO `tb_menus` VALUES ('37', '删除', null, null, 'user:user:delete', 'false', '11', null);
INSERT INTO `tb_menus` VALUES ('42', '查看', '', '', 'log:log:list', 'false', '15', null);
INSERT INTO `tb_menus` VALUES ('43', 'SQL监控', '&#xe642;', null, null, 'false', '0', '996');
INSERT INTO `tb_menus` VALUES ('44', 'SQL监控', '&#xe642;', 'sys/druid', null, 'false', '43', null);
INSERT INTO `tb_menus` VALUES ('45', '查看', null, null, 'sys:druid:list', 'false', '44', null);
INSERT INTO `tb_menus` VALUES ('46', '菜单管理', '&#xe642;', 'sys/menuList', null, 'false', '2', null);
INSERT INTO `tb_menus` VALUES ('47', '查看', null, null, 'sys:menu:list', 'false', '46', null);
INSERT INTO `tb_menus` VALUES ('48', '新增', null, null, 'sys:menu:save', 'false', '46', null);
INSERT INTO `tb_menus` VALUES ('49', '修改', null, null, 'sys:menu:update', 'false', '46', null);
INSERT INTO `tb_menus` VALUES ('50', '删除', null, null, 'sys:menu:delete', 'false', '46', null);
INSERT INTO `tb_menus` VALUES ('51', '轮播管理', '', '', '', 'false', '0', '997');
INSERT INTO `tb_menus` VALUES ('52', '轮播管理', '', 'carousel/carouselList', '', 'false', '51', null);
INSERT INTO `tb_menus` VALUES ('53', '查看', '', '', 'carousel:carousel:list', 'false', '52', null);
INSERT INTO `tb_menus` VALUES ('54', '删除', '', '', 'carousel:carousel:delete', 'false', '52', null);
INSERT INTO `tb_menus` VALUES ('55', '修改', '', '', 'carousel:carousel:update', 'false', '52', null);
INSERT INTO `tb_menus` VALUES ('56', '新增', '', '', 'carousel:carousel:save', 'false', '52', null);

-- ----------------------------
-- Table structure for tb_roles
-- ----------------------------
DROP TABLE IF EXISTS `tb_roles`;
CREATE TABLE `tb_roles` (
  `role_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '角色编号',
  `role_name` varchar(50) DEFAULT NULL COMMENT '角色名',
  `role_remark` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`role_id`)
) ENGINE=InnoDB AUTO_INCREMENT=63 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tb_roles
-- ----------------------------
INSERT INTO `tb_roles` VALUES ('1', '超级管理员', '超级管理员');
INSERT INTO `tb_roles` VALUES ('61', 'test', 'test');

-- ----------------------------
-- Table structure for tb_roles_menus
-- ----------------------------
DROP TABLE IF EXISTS `tb_roles_menus`;
CREATE TABLE `tb_roles_menus` (
  `menu_id` bigint(20) NOT NULL,
  `role_id` bigint(20) NOT NULL,
  PRIMARY KEY (`menu_id`,`role_id`),
  KEY `role_id` (`role_id`),
  CONSTRAINT `tb_roles_menus_ibfk_1` FOREIGN KEY (`menu_id`) REFERENCES `tb_menus` (`menu_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `tb_roles_menus_ibfk_2` FOREIGN KEY (`role_id`) REFERENCES `tb_roles` (`role_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tb_roles_menus
-- ----------------------------
INSERT INTO `tb_roles_menus` VALUES ('1', '1');
INSERT INTO `tb_roles_menus` VALUES ('2', '1');
INSERT INTO `tb_roles_menus` VALUES ('3', '1');
INSERT INTO `tb_roles_menus` VALUES ('4', '1');
INSERT INTO `tb_roles_menus` VALUES ('9', '1');
INSERT INTO `tb_roles_menus` VALUES ('10', '1');
INSERT INTO `tb_roles_menus` VALUES ('11', '1');
INSERT INTO `tb_roles_menus` VALUES ('14', '1');
INSERT INTO `tb_roles_menus` VALUES ('15', '1');
INSERT INTO `tb_roles_menus` VALUES ('16', '1');
INSERT INTO `tb_roles_menus` VALUES ('17', '1');
INSERT INTO `tb_roles_menus` VALUES ('18', '1');
INSERT INTO `tb_roles_menus` VALUES ('19', '1');
INSERT INTO `tb_roles_menus` VALUES ('20', '1');
INSERT INTO `tb_roles_menus` VALUES ('21', '1');
INSERT INTO `tb_roles_menus` VALUES ('22', '1');
INSERT INTO `tb_roles_menus` VALUES ('23', '1');
INSERT INTO `tb_roles_menus` VALUES ('33', '1');
INSERT INTO `tb_roles_menus` VALUES ('34', '1');
INSERT INTO `tb_roles_menus` VALUES ('35', '1');
INSERT INTO `tb_roles_menus` VALUES ('36', '1');
INSERT INTO `tb_roles_menus` VALUES ('37', '1');
INSERT INTO `tb_roles_menus` VALUES ('42', '1');
INSERT INTO `tb_roles_menus` VALUES ('43', '1');
INSERT INTO `tb_roles_menus` VALUES ('44', '1');
INSERT INTO `tb_roles_menus` VALUES ('45', '1');
INSERT INTO `tb_roles_menus` VALUES ('46', '1');
INSERT INTO `tb_roles_menus` VALUES ('47', '1');
INSERT INTO `tb_roles_menus` VALUES ('48', '1');
INSERT INTO `tb_roles_menus` VALUES ('49', '1');
INSERT INTO `tb_roles_menus` VALUES ('50', '1');
INSERT INTO `tb_roles_menus` VALUES ('51', '1');
INSERT INTO `tb_roles_menus` VALUES ('52', '1');
INSERT INTO `tb_roles_menus` VALUES ('53', '1');
INSERT INTO `tb_roles_menus` VALUES ('54', '1');
INSERT INTO `tb_roles_menus` VALUES ('55', '1');
INSERT INTO `tb_roles_menus` VALUES ('56', '1');
INSERT INTO `tb_roles_menus` VALUES ('1', '61');
INSERT INTO `tb_roles_menus` VALUES ('2', '61');
INSERT INTO `tb_roles_menus` VALUES ('3', '61');
INSERT INTO `tb_roles_menus` VALUES ('4', '61');
INSERT INTO `tb_roles_menus` VALUES ('9', '61');
INSERT INTO `tb_roles_menus` VALUES ('11', '61');
INSERT INTO `tb_roles_menus` VALUES ('14', '61');
INSERT INTO `tb_roles_menus` VALUES ('15', '61');
INSERT INTO `tb_roles_menus` VALUES ('16', '61');
INSERT INTO `tb_roles_menus` VALUES ('17', '61');
INSERT INTO `tb_roles_menus` VALUES ('18', '61');
INSERT INTO `tb_roles_menus` VALUES ('19', '61');
INSERT INTO `tb_roles_menus` VALUES ('20', '61');
INSERT INTO `tb_roles_menus` VALUES ('34', '61');
INSERT INTO `tb_roles_menus` VALUES ('42', '61');
INSERT INTO `tb_roles_menus` VALUES ('43', '61');
INSERT INTO `tb_roles_menus` VALUES ('44', '61');
INSERT INTO `tb_roles_menus` VALUES ('45', '61');
INSERT INTO `tb_roles_menus` VALUES ('46', '61');
INSERT INTO `tb_roles_menus` VALUES ('47', '61');
INSERT INTO `tb_roles_menus` VALUES ('48', '61');
INSERT INTO `tb_roles_menus` VALUES ('49', '61');
INSERT INTO `tb_roles_menus` VALUES ('50', '61');

-- ----------------------------
-- Table structure for tb_test
-- ----------------------------
DROP TABLE IF EXISTS `tb_test`;
CREATE TABLE `tb_test` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `msg` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tb_test
-- ----------------------------

-- ----------------------------
-- Table structure for tb_users
-- ----------------------------
DROP TABLE IF EXISTS `tb_users`;
CREATE TABLE `tb_users` (
  `uid` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `e_mail` varchar(50) NOT NULL,
  `nickname` varchar(50) NOT NULL COMMENT '昵称：唯一',
  `password` varchar(50) NOT NULL,
  `sex` varchar(1) NOT NULL COMMENT '0:女，1:男，2：保密',
  `birthday` date NOT NULL,
  `address` varchar(100) NOT NULL,
  `phone` varchar(20) DEFAULT NULL,
  `e_code` varchar(50) NOT NULL,
  `status` varchar(1) DEFAULT NULL COMMENT '0:未激活，1，正常，2，禁用',
  `create_time` datetime NOT NULL,
  PRIMARY KEY (`uid`)
) ENGINE=InnoDB AUTO_INCREMENT=30 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tb_users
-- ----------------------------
INSERT INTO `tb_users` VALUES ('27', 'isduxd@qq.com', 'test', '96e79218965eb72c92a549dd5a330112', '0', '2018-03-25', '北京通州科创十四街区', '17693109923', 'b3f28566dac54f86bd4f4c2ce36e23d8019', '1', '2018-03-25 14:48:48');
INSERT INTO `tb_users` VALUES ('28', '123@qq.com', '2113', '96e79218965eb72c92a549dd5a330112', '1', '2018-07-26', '123123', '17693109997', 'c6411671821c43ca926c032e51ded16a897', '1', '2018-07-27 09:59:16');
INSERT INTO `tb_users` VALUES ('29', 'sdf@163.com', '123123', '96e79218965eb72c92a549dd5a330112', '2', '2018-07-27', '123123', '17111111111', '92197e8f8a5647ae8be96fe2db555575147', '1', '2018-07-27 14:23:55');
