/*
Navicat MySQL Data Transfer

Source Server         : xrlj-dev-master
Source Server Version : 80013
Source Host           : localhost:3910
Source Database       : service_usercentral

Target Server Type    : MYSQL
Target Server Version : 80013
File Encoding         : 65001

Date: 2020-04-28 22:47:34
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for app_info
-- ----------------------------
DROP TABLE IF EXISTS `app_info`;
CREATE TABLE `app_info` (
  `id` bigint(20) NOT NULL COMMENT '主键id',
  `client_device_type` varchar(80) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '数据来源终端',
  `client_id` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '应用程序唯一标志，分配给应用的appid',
  `date_created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '数据创建时间',
  `del` bit(1) NOT NULL DEFAULT b'0' COMMENT '数据是否有效，用作逻辑删除',
  `last_updated` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '数据最后更新时间',
  `version` int(11) NOT NULL DEFAULT '0' COMMENT '乐观锁',
  `app_id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '应用程序唯一标志',
  `app_name` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '应用名称',
  `app_secret` varchar(250) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '密钥，开发者密码',
  `app_type` tinyint(1) NOT NULL DEFAULT '0' COMMENT '应用程序类型：0-内部系统，1-对外开放系统',
  `check_status` tinyint(1) NOT NULL DEFAULT '0' COMMENT '审核状态：0-等待审核，1-审核通过/启用，2-审核不通过，3-禁用',
  `description` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '应用的描述',
  PRIMARY KEY (`id`),
  UNIQUE KEY `UK_q10vsw7um85bmdu3xfo6ng8i0` (`app_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='申请应用程序信息';

-- ----------------------------
-- Records of app_info
-- ----------------------------
INSERT INTO `app_info` VALUES ('311321109108621312', 'OTHERS', '0a9cbbbb4f130988', '2020-01-28 12:16:12', '\0', '2020-01-28 12:16:12', '0', '0a9cbbbb4f130988', '超级总后台', 'c1fbcdab7226a15f4cd2476f23f5ed99', '0', '1', '系统管理总后台');
INSERT INTO `app_info` VALUES ('319126613146992640', 'OTHERS', '0a9cbbbb4f130988', '2020-02-19 01:12:30', '\0', '2020-02-19 01:12:30', '0', '0d6d1b41086e960e', '应收账款管理服务平台', 'e25f58bb14f6558ee6fd8b386928e044', '0', '1', '保理金融平台WEB客户端。');
INSERT INTO `app_info` VALUES ('325875009320910849', 'OTHERS', '0a9cbbbb4f130988', '2020-03-09 21:26:40', '\0', '2020-03-09 21:26:40', '0', '7ade120648841015', 'SRM', '51b55046549af417b7832a35914ad5f4', '0', '1', '供应链协同系统');

-- ----------------------------
-- Table structure for department
-- ----------------------------
DROP TABLE IF EXISTS `department`;
CREATE TABLE `department` (
  `id` bigint(20) NOT NULL COMMENT '主键id',
  `client_device_type` varchar(80) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '数据来源终端',
  `client_id` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '应用程序唯一标志，分配给应用的appid',
  `date_created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '数据创建时间',
  `del` bit(1) NOT NULL DEFAULT b'0' COMMENT '数据是否有效，用作逻辑删除',
  `last_updated` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '数据最后更新时间',
  `version` int(11) NOT NULL DEFAULT '0' COMMENT '乐观锁',
  `dept_key` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0' COMMENT '部门唯一key',
  `enterprise_id` bigint(20) NOT NULL COMMENT '所属企业',
  `name` varchar(80) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '部门名称',
  `sort` smallint(3) NOT NULL DEFAULT '0' COMMENT '排序',
  `parent_id` bigint(20) DEFAULT NULL COMMENT '主键id',
  PRIMARY KEY (`id`),
  UNIQUE KEY `UKafcd9qxpini7ytahspcueu2f3` (`enterprise_id`,`name`),
  UNIQUE KEY `UK_njhgil76xre1al47kw73stlhe` (`dept_key`),
  KEY `FKmgsnnmudxrwqidn4f64q8rp4o` (`parent_id`),
  CONSTRAINT `FKmgsnnmudxrwqidn4f64q8rp4o` FOREIGN KEY (`parent_id`) REFERENCES `department` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='企业部门表。';

-- ----------------------------
-- Records of department
-- ----------------------------
INSERT INTO `department` VALUES ('311488568314822656', 'OTHERS', '0a9cbbbb4f130988', '2020-01-28 23:21:37', '\0', '2020-01-28 23:21:37', '0', '1', '311321109645492224', '链金科技', '1', null);
INSERT INTO `department` VALUES ('311488633896960000', 'OTHERS', '0a9cbbbb4f130988', '2020-01-28 23:21:59', '\0', '2020-01-28 23:21:59', '0', '11', '311321109645492224', '运营部', '2', '311488568314822656');
INSERT INTO `department` VALUES ('311488733415211008', 'OTHERS', '0a9cbbbb4f130988', '2020-01-28 23:22:17', '\0', '2020-01-28 23:22:17', '0', '12', '311321109645492224', 'IT技术部', '3', '311488568314822656');
INSERT INTO `department` VALUES ('311488831897468928', 'OTHERS', '0a9cbbbb4f130988', '2020-01-28 23:22:40', '\0', '2020-01-28 23:22:40', '0', '121', '311321109645492224', 'JAVA后台开发组', '1', '311488733415211008');
INSERT INTO `department` VALUES ('311488919973658624', 'OTHERS', '0a9cbbbb4f130988', '2020-01-28 23:23:01', '\0', '2020-01-28 23:23:01', '0', '122', '311321109645492224', 'WEB前端开发组', '2', '311488733415211008');

-- ----------------------------
-- Table structure for enterprise
-- ----------------------------
DROP TABLE IF EXISTS `enterprise`;
CREATE TABLE `enterprise` (
  `id` bigint(20) NOT NULL COMMENT '主键id',
  `client_device_type` varchar(80) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '数据来源终端',
  `client_id` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '应用程序唯一标志，分配给应用的appid',
  `date_created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '数据创建时间',
  `del` bit(1) NOT NULL DEFAULT b'0' COMMENT '数据是否有效，用作逻辑删除',
  `last_updated` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '数据最后更新时间',
  `version` int(11) NOT NULL DEFAULT '0' COMMENT '乐观锁',
  `account_id` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '企业认证唯一证书信息，用来生成印章',
  `address` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '公司地址全称',
  `business_license` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '营业执照号码',
  `contact_mobile` varchar(11) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '联系人手机号码',
  `contact_name` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '联系人姓名',
  `description` varchar(2000) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '企业简介',
  `email` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '企业邮箱',
  `etp_code` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '企业代码,唯一标志一个企业',
  `etp_name` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '企业名称',
  `fax` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '公司传真',
  `legal_person` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '法人',
  `legal_person_id_no` varchar(18) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '法人身份证号码',
  `unify_code` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '统一社会信用代码',
  `organization_code` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '组织机构代码',
  `organize_seal` text COLLATE utf8mb4_unicode_ci COMMENT '企业印章图片base64',
  `short_name` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '企业简称',
  `status` tinyint(1) NOT NULL DEFAULT '0' COMMENT '企业状态：0-待审核，1-审核通过，2-审核不通过，3-已实名认证，4-实名认证中，5-已禁用, 6-黑名单',
  `tax_code` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '税务登记证',
  `telephone` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '公司联系座机电话',
  `web_site` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '企业',
  `enterprise_type` tinyint(1) NOT NULL DEFAULT '0' COMMENT '企业类型',
  PRIMARY KEY (`id`),
  UNIQUE KEY `UK_60givf8bau3ryr8g8ngw3wuiw` (`etp_code`),
  UNIQUE KEY `UK_fqjctwvtxenxite6jg7ebrib1` (`unify_code`),
  UNIQUE KEY `UK_5tc722cht7c6dcle06s7hs46y` (`legal_person_id_no`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='企业信息表。';

-- ----------------------------
-- Records of enterprise
-- ----------------------------
INSERT INTO `enterprise` VALUES ('311321109645492224', 'OTHERS', '0a9cbbbb4f130988', '2020-01-28 12:16:12', '\0', '2020-01-28 12:16:12', '0', null, null, null, null, null, null, null, 'ETP-00001', '小睿链金科技有限公司', null, null, null, 'abcd', null, null, null, '1', null, null, null, '0');

-- ----------------------------
-- Table structure for menu
-- ----------------------------
DROP TABLE IF EXISTS `menu`;
CREATE TABLE `menu` (
  `id` bigint(20) NOT NULL COMMENT '主键id',
  `client_device_type` varchar(80) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '数据来源终端',
  `client_id` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '应用程序唯一标志，分配给应用的appid',
  `date_created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '数据创建时间',
  `del` bit(1) NOT NULL DEFAULT b'0' COMMENT '数据是否有效，用作逻辑删除',
  `last_updated` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '数据最后更新时间',
  `version` int(11) NOT NULL DEFAULT '0' COMMENT '乐观锁',
  `icon` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '菜单中的图标默认为空',
  `is_show` bit(1) DEFAULT b'1' COMMENT '是否显示 0-不显示 1-显示 默认显示',
  `link` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '菜单路径',
  `menu_key` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0' COMMENT '菜单键',
  `perms` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '授权(多个用逗号分隔，如：user:list,user:create)',
  `sort` smallint(3) NOT NULL DEFAULT '0' COMMENT '排序',
  `title_en` varchar(80) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '菜单英文名称',
  `title_zh` varchar(80) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '菜单中文名称',
  `type` smallint(1) DEFAULT '0' COMMENT '类型   1：菜单   2：按钮',
  `parent_id` bigint(20) DEFAULT NULL COMMENT '主键id',
  PRIMARY KEY (`id`),
  UNIQUE KEY `UK7rim7wbb96o22u2erfwjobvx9` (`client_id`,`title_zh`),
  UNIQUE KEY `UK_pkn5ux9gpua3vaysdtx9wwv7q` (`menu_key`),
  KEY `FKgeupubdqncc1lpgf2cn4fqwbc` (`parent_id`),
  CONSTRAINT `menu_ibfk_1` FOREIGN KEY (`parent_id`) REFERENCES `menu` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='菜单。';

-- ----------------------------
-- Records of menu
-- ----------------------------
INSERT INTO `menu` VALUES ('311321109863596032', 'OTHERS', '0a9cbbbb4f130988', '2020-01-28 12:16:12', '\0', '2020-01-28 12:16:12', '0', 'home', '', '/pages', '1', null, '1', null, '首页', '1', null);
INSERT INTO `menu` VALUES ('311321109913927680', 'OTHERS', '0a9cbbbb4f130988', '2020-01-28 12:16:12', '\0', '2020-03-25 01:44:40', '4', 'setting', '', '', '2', '', '3', null, '系统管理', '1', null);
INSERT INTO `menu` VALUES ('311321109943287808', 'OTHERS', '0a9cbbbb4f130988', '2020-01-28 12:16:12', '\0', '2020-01-28 22:25:38', '1', '', '', '/pages/setting/role', '21', '', '3', null, '角色管理', '1', '311321109913927680');
INSERT INTO `menu` VALUES ('311321109981036544', 'OTHERS', '0a9cbbbb4f130988', '2020-01-28 12:16:12', '\0', '2020-03-31 01:30:15', '7', '', '', '/pages/setting/menu', '52', '', '1', null, '菜单管理', '1', '329617413534384128');
INSERT INTO `menu` VALUES ('311370006229155840', 'OTHERS', '0a9cbbbb4f130988', '2020-01-28 15:30:30', '\0', '2020-03-25 01:44:54', '6', 'setting', '', '', '3', '', '5', null, '消息管理', '1', null);
INSERT INTO `menu` VALUES ('311468972128075776', 'OTHERS', '0a9cbbbb4f130988', '2020-01-28 22:03:45', '\0', '2020-04-02 00:07:24', '2', '', '', '/pages/notify/sms', '31', '', '1', null, '短信服务', '1', '311370006229155840');
INSERT INTO `menu` VALUES ('311469105863458816', 'OTHERS', '0a9cbbbb4f130988', '2020-01-28 22:04:17', '\0', '2020-04-02 00:09:49', '3', '', '', '/pages/notify/email', '33', '', '3', null, '邮件模板', '1', '311370006229155840');
INSERT INTO `menu` VALUES ('311473318760808448', 'OTHERS', '0a9cbbbb4f130988', '2020-01-28 22:21:02', '\0', '2020-01-28 22:21:02', '0', null, '', '/pages/setting/user', '23', null, '1', null, '用户管理', '1', '311321109913927680');
INSERT INTO `menu` VALUES ('311473496930648064', 'OTHERS', '0a9cbbbb4f130988', '2020-01-28 22:21:44', '\0', '2020-01-28 22:25:23', '1', '', '', '/pages/setting/department', '24', '', '2', null, '部门管理', '1', '311321109913927680');
INSERT INTO `menu` VALUES ('311473712228466688', 'OTHERS', '0a9cbbbb4f130988', '2020-01-28 22:22:36', '\0', '2020-03-31 01:30:27', '5', '', '', '/pages/setting/permission', '53', '', '2', null, '接口权限管理', '1', '329617413534384128');
INSERT INTO `menu` VALUES ('311473893632114688', 'OTHERS', '0a9cbbbb4f130988', '2020-01-28 22:23:19', '\0', '2020-03-31 01:30:03', '4', '', '', '/pages/setting/app', '51', '', '3', null, '应用列表', '1', '329617413534384128');
INSERT INTO `menu` VALUES ('319276351502680064', 'OTHERS', '0a9cbbbb4f130988', '2020-02-19 19:16:37', '\0', '2020-02-19 19:16:37', '0', 'user', '', null, '4', null, '2', null, '客户管理', '1', null);
INSERT INTO `menu` VALUES ('319357604616732672', 'OTHERS', '0a9cbbbb4f130988', '2020-02-20 00:14:39', '\0', '2020-03-19 01:07:39', '11', '', '', '/pages/customer/etp', '41', '', '1', null, '企业信息管理', '1', '319276351502680064');
INSERT INTO `menu` VALUES ('319357915070726144', 'OTHERS', '0a9cbbbb4f130988', '2020-02-20 00:15:48', '\0', '2020-03-11 15:52:25', '7', '', '', '/pages/customer/account', '42', '', '2', null, '企业账号管理', '1', '319276351502680064');
INSERT INTO `menu` VALUES ('329617413534384128', 'BROWSER', '0a9cbbbb4f130988', '2020-03-18 23:59:30', '\0', '2020-03-25 01:44:48', '3', 'user', '', '', '5', '', '4', null, '应用管理', '1', null);
INSERT INTO `menu` VALUES ('331247871925944320', 'BROWSER', '0a9cbbbb4f130988', '2020-03-24 23:38:59', '\0', '2020-03-25 13:27:33', '5', '', '', '/pages/setting/dictionary', '27', '', '5', null, '字典管理', '1', '311321109913927680');
INSERT INTO `menu` VALUES ('331248544696500224', 'BROWSER', '0a9cbbbb4f130988', '2020-03-24 23:41:27', '\0', '2020-03-25 13:27:08', '1', '', '', '/pages/setting/parameter', '26', '', '4', null, '参数管理', '1', '311321109913927680');
INSERT INTO `menu` VALUES ('331252312938905600', 'BROWSER', '0a9cbbbb4f130988', '2020-03-24 23:55:17', '\0', '2020-04-02 00:08:03', '1', '', '', '/pages/notify/sms-record', '32', '', '2', null, '短信发送记录', '1', '311370006229155840');
INSERT INTO `menu` VALUES ('331252540215656448', 'BROWSER', '0a9cbbbb4f130988', '2020-03-24 23:56:07', '\0', '2020-04-02 00:08:48', '1', '', '', '/pages/notify/email-record', '34', '', '4', null, '邮件发送记录', '1', '311370006229155840');
INSERT INTO `menu` VALUES ('331268805747539968', 'BROWSER', '0a9cbbbb4f130988', '2020-03-25 00:55:46', '\0', '2020-03-25 13:33:07', '3', '', '', '/pages/setting/file', '28', '', '6', null, '上传文件', '1', '311321109913927680');
INSERT INTO `menu` VALUES ('331281673024962560', 'BROWSER', '0a9cbbbb4f130988', '2020-03-25 01:42:58', '\0', '2020-03-25 13:33:24', '1', '', '', '/pages/setting/zh-area', '29', '', '7', null, '行政区域', '1', '311321109913927680');
INSERT INTO `menu` VALUES ('331282266367983616', 'BROWSER', '0a9cbbbb4f130988', '2020-03-25 01:45:09', '\0', '2020-03-31 01:30:45', '2', 'user', '', '', '6', '', '7', null, '日志管理', '1', null);
INSERT INTO `menu` VALUES ('331282481963597824', 'BROWSER', '0a9cbbbb4f130988', '2020-03-25 01:45:56', '\0', '2020-04-02 00:37:49', '1', '', '', '/pages/sys-log/login', '61', '', '1', null, '登录日志', '1', '331282266367983616');
INSERT INTO `menu` VALUES ('331282597470535680', 'BROWSER', '0a9cbbbb4f130988', '2020-03-25 01:46:21', '\0', '2020-04-02 00:38:11', '1', '', '', '/pages/sys-log/operation', '62', '', '2', null, '操作日志', '1', '331282266367983616');
INSERT INTO `menu` VALUES ('331282658166308864', 'BROWSER', '0a9cbbbb4f130988', '2020-03-25 01:46:35', '\0', '2020-04-02 00:38:25', '1', '', '', '/pages/sys-log/error', '63', '', '3', null, '异常日志', '1', '331282266367983616');
INSERT INTO `menu` VALUES ('332630488105615360', 'BROWSER', '0a9cbbbb4f130988', '2020-03-31 01:31:32', '\0', '2020-03-31 01:31:32', '0', 'user', '', '', '7', null, '6', null, '站内通知', '1', null);
INSERT INTO `menu` VALUES ('332631443018612736', 'BROWSER', '0a9cbbbb4f130988', '2020-03-31 01:35:02', '\0', '2020-03-31 01:47:40', '2', '', '', '/pages/announcement/my', '71', '', '1', null, '我的通知', '1', '332630488105615360');
INSERT INTO `menu` VALUES ('332631764805615616', 'BROWSER', '0a9cbbbb4f130988', '2020-03-31 01:36:13', '\0', '2020-03-31 01:36:13', '0', null, '', '/pages/announcement/manage', '72', null, '2', null, '通知管理', '1', '332630488105615360');

-- ----------------------------
-- Table structure for need_authorize_method
-- ----------------------------
DROP TABLE IF EXISTS `need_authorize_method`;
CREATE TABLE `need_authorize_method` (
  `id` bigint(20) NOT NULL COMMENT '主键id',
  `client_device_type` varchar(80) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '数据来源终端',
  `client_id` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '应用程序唯一标志，分配给应用的appid',
  `date_created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '数据创建时间',
  `del` bit(1) NOT NULL DEFAULT b'0' COMMENT '数据是否有效，用作逻辑删除',
  `last_updated` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '数据最后更新时间',
  `version` int(11) NOT NULL DEFAULT '0' COMMENT '乐观锁',
  `url_path` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '接口名。(格式：/服务名/控制器名/方法名)',
  PRIMARY KEY (`id`),
  UNIQUE KEY `UK_f12djehmjf2oe4il16d7np0p` (`url_path`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='需要授权才能访问的接口。用于内部系统。';

-- ----------------------------
-- Records of need_authorize_method
-- ----------------------------

-- ----------------------------
-- Table structure for permission
-- ----------------------------
DROP TABLE IF EXISTS `permission`;
CREATE TABLE `permission` (
  `id` bigint(20) NOT NULL COMMENT '主键id',
  `client_device_type` varchar(80) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '数据来源终端',
  `client_id` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '应用程序唯一标志，分配给应用的appid',
  `date_created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '数据创建时间',
  `del` bit(1) NOT NULL DEFAULT b'0' COMMENT '数据是否有效，用作逻辑删除',
  `last_updated` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '数据最后更新时间',
  `version` int(11) NOT NULL DEFAULT '0' COMMENT '乐观锁',
  `description` varchar(500) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '权限用途描述',
  `operator_user_id` bigint(20) NOT NULL COMMENT '添加该权限用户',
  `permission_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '权限名称',
  PRIMARY KEY (`id`),
  UNIQUE KEY `UK_l3pmqryh8vgle52647itattb9` (`permission_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='权限表';

-- ----------------------------
-- Records of permission
-- ----------------------------
INSERT INTO `permission` VALUES ('311321110123642880', 'OTHERS', '0a9cbbbb4f130988', '2020-01-28 12:16:12', '\0', '2020-01-28 12:16:12', '0', '表示所有接口权限', '311321109557411840', '**');

-- ----------------------------
-- Table structure for register_invitation_code
-- ----------------------------
DROP TABLE IF EXISTS `register_invitation_code`;
CREATE TABLE `register_invitation_code` (
  `id` bigint(20) NOT NULL COMMENT '主键id',
  `client_device_type` varchar(80) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '数据来源终端',
  `client_id` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '应用程序唯一标志，分配给应用的appid',
  `date_created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '数据创建时间',
  `del` bit(1) NOT NULL DEFAULT b'0' COMMENT '数据是否有效，用作逻辑删除',
  `last_updated` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '数据最后更新时间',
  `version` int(11) NOT NULL DEFAULT '0' COMMENT '乐观锁',
  `code` varchar(80) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '邀请码',
  `holder_id` bigint(20) NOT NULL COMMENT '企业id/用户id',
  `use_state` bit(1) NOT NULL DEFAULT b'0' COMMENT '是否使用状态。0-未使用，1-已使用',
  PRIMARY KEY (`id`),
  UNIQUE KEY `UK_16wmmakvptnmrfssq9yhu6ffb` (`code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='企业注册邀请码。';

-- ----------------------------
-- Records of register_invitation_code
-- ----------------------------

-- ----------------------------
-- Table structure for role
-- ----------------------------
DROP TABLE IF EXISTS `role`;
CREATE TABLE `role` (
  `id` bigint(20) NOT NULL COMMENT '主键id',
  `client_device_type` varchar(80) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '数据来源终端',
  `client_id` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '应用程序唯一标志，分配给应用的appid',
  `date_created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '数据创建时间',
  `del` bit(1) NOT NULL DEFAULT b'0' COMMENT '数据是否有效，用作逻辑删除',
  `last_updated` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '数据最后更新时间',
  `version` int(11) NOT NULL DEFAULT '0' COMMENT '乐观锁',
  `description` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '角色描述',
  `enterprise_id` bigint(20) NOT NULL COMMENT '所属企业',
  `operator_user_id` bigint(20) NOT NULL COMMENT '添加该角色用户',
  `role_name` varchar(150) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '角色名称',
  PRIMARY KEY (`id`),
  UNIQUE KEY `UKiwb2bhpxwbfly8j4yt76blmw0` (`role_name`,`enterprise_id`),
  KEY `IDXbgeqjb5opmijvwc14fbtaj4xx` (`role_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='角色表';

-- ----------------------------
-- Records of role
-- ----------------------------
INSERT INTO `role` VALUES ('311321109771321344', 'OTHERS', '0a9cbbbb4f130988', '2020-01-28 12:16:12', '\0', '2020-01-28 12:16:12', '0', '系统自动创建', '311321109645492224', '311321109557411840', '超级管理员');
INSERT INTO `role` VALUES ('311475412154712064', 'OTHERS', '0a9cbbbb4f130988', '2020-01-28 22:29:21', '\0', '2020-01-28 22:29:21', '0', '审核', '311321109645492224', '311321109557411840', '经纪人');

-- ----------------------------
-- Table structure for role_department
-- ----------------------------
DROP TABLE IF EXISTS `role_department`;
CREATE TABLE `role_department` (
  `id` bigint(20) NOT NULL COMMENT '主键id',
  `client_device_type` varchar(80) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '数据来源终端',
  `client_id` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '应用程序唯一标志，分配给应用的appid',
  `date_created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '数据创建时间',
  `del` bit(1) NOT NULL DEFAULT b'0' COMMENT '数据是否有效，用作逻辑删除',
  `last_updated` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '数据最后更新时间',
  `version` int(11) NOT NULL DEFAULT '0' COMMENT '乐观锁',
  `dept_id` bigint(20) NOT NULL COMMENT '部门',
  `operator_user_id` bigint(20) NOT NULL COMMENT '操作人',
  `role_id` bigint(20) NOT NULL COMMENT '角色',
  PRIMARY KEY (`id`),
  KEY `IDX40d31a6hr92gvv1idr6he3umx` (`role_id`),
  KEY `IDXqhbqr72muyv2yqffa5ya3pm0y` (`dept_id`),
  KEY `IDXjfl5hht48nttsl12gbu65kxop` (`operator_user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='角色部门表，多对多关系';

-- ----------------------------
-- Records of role_department
-- ----------------------------
INSERT INTO `role_department` VALUES ('332632803483058176', 'BROWSER', '0a9cbbbb4f130988', '2020-03-31 01:40:01', '\0', '2020-03-31 01:40:01', '0', '311488831897468928', '311321109557411840', '311321109771321344');
INSERT INTO `role_department` VALUES ('332632803562749952', 'BROWSER', '0a9cbbbb4f130988', '2020-03-31 01:40:01', '\0', '2020-03-31 01:40:01', '0', '311488733415211008', '311321109557411840', '311321109771321344');
INSERT INTO `role_department` VALUES ('332632803613081600', 'BROWSER', '0a9cbbbb4f130988', '2020-03-31 01:40:01', '\0', '2020-03-31 01:40:01', '0', '311488568314822656', '311321109557411840', '311321109771321344');

-- ----------------------------
-- Table structure for role_menu
-- ----------------------------
DROP TABLE IF EXISTS `role_menu`;
CREATE TABLE `role_menu` (
  `id` bigint(20) NOT NULL COMMENT '主键id',
  `client_device_type` varchar(80) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '数据来源终端',
  `client_id` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '应用程序唯一标志，分配给应用的appid',
  `date_created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '数据创建时间',
  `del` bit(1) NOT NULL DEFAULT b'0' COMMENT '数据是否有效，用作逻辑删除',
  `last_updated` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '数据最后更新时间',
  `version` int(11) NOT NULL DEFAULT '0' COMMENT '乐观锁',
  `menu_id` bigint(20) NOT NULL COMMENT '菜单',
  `operator_user_id` bigint(20) NOT NULL COMMENT '操作人',
  `role_id` bigint(20) NOT NULL COMMENT '角色',
  PRIMARY KEY (`id`),
  KEY `IDX6st33fi8ygdi9316ejbc33sky` (`role_id`),
  KEY `IDXhfpad1ibs80uw48y4q67j0wr2` (`operator_user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='角色菜单表，多对多关系';

-- ----------------------------
-- Records of role_menu
-- ----------------------------
INSERT INTO `role_menu` VALUES ('311475412238598144', 'OTHERS', '0a9cbbbb4f130988', '2020-01-28 22:29:21', '\0', '2020-01-28 22:29:21', '0', '311321109863596032', '311321109557411840', '311475412154712064');
INSERT INTO `role_menu` VALUES ('311475412263763968', 'OTHERS', '0a9cbbbb4f130988', '2020-01-28 22:29:21', '\0', '2020-01-28 22:29:21', '0', '311370006229155840', '311321109557411840', '311475412154712064');
INSERT INTO `role_menu` VALUES ('311475412293124096', 'OTHERS', '0a9cbbbb4f130988', '2020-01-28 22:29:21', '\0', '2020-01-28 22:29:21', '0', '311468972128075776', '311321109557411840', '311475412154712064');
INSERT INTO `role_menu` VALUES ('311475412322484224', 'OTHERS', '0a9cbbbb4f130988', '2020-01-28 22:29:21', '\0', '2020-01-28 22:29:21', '0', '311469105863458816', '311321109557411840', '311475412154712064');
INSERT INTO `role_menu` VALUES ('332632799880151040', 'BROWSER', '0a9cbbbb4f130988', '2020-03-31 01:40:01', '\0', '2020-03-31 01:40:01', '0', '311321109863596032', '311321109557411840', '311321109771321344');
INSERT INTO `role_menu` VALUES ('332632800026951680', 'BROWSER', '0a9cbbbb4f130988', '2020-03-31 01:40:01', '\0', '2020-03-31 01:40:01', '0', '319276351502680064', '311321109557411840', '311321109771321344');
INSERT INTO `role_menu` VALUES ('332632800098254848', 'BROWSER', '0a9cbbbb4f130988', '2020-03-31 01:40:01', '\0', '2020-03-31 01:40:01', '0', '319357604616732672', '311321109557411840', '311321109771321344');
INSERT INTO `role_menu` VALUES ('332632800249249792', 'BROWSER', '0a9cbbbb4f130988', '2020-03-31 01:40:01', '\0', '2020-03-31 01:40:01', '0', '319357915070726144', '311321109557411840', '311321109771321344');
INSERT INTO `role_menu` VALUES ('332632800324747264', 'BROWSER', '0a9cbbbb4f130988', '2020-03-31 01:40:01', '\0', '2020-03-31 01:40:01', '0', '311321109913927680', '311321109557411840', '311321109771321344');
INSERT INTO `role_menu` VALUES ('332632800626737152', 'BROWSER', '0a9cbbbb4f130988', '2020-03-31 01:40:01', '\0', '2020-03-31 01:40:01', '0', '311473318760808448', '311321109557411840', '311321109771321344');
INSERT INTO `role_menu` VALUES ('332632800710623232', 'BROWSER', '0a9cbbbb4f130988', '2020-03-31 01:40:01', '\0', '2020-03-31 01:40:01', '0', '311473496930648064', '311321109557411840', '311321109771321344');
INSERT INTO `role_menu` VALUES ('332632800773537792', 'BROWSER', '0a9cbbbb4f130988', '2020-03-31 01:40:01', '\0', '2020-03-31 01:40:01', '0', '311321109943287808', '311321109557411840', '311321109771321344');
INSERT INTO `role_menu` VALUES ('332632800840646656', 'BROWSER', '0a9cbbbb4f130988', '2020-03-31 01:40:01', '\0', '2020-03-31 01:40:01', '0', '331248544696500224', '311321109557411840', '311321109771321344');
INSERT INTO `role_menu` VALUES ('332632800916144128', 'BROWSER', '0a9cbbbb4f130988', '2020-03-31 01:40:01', '\0', '2020-03-31 01:40:01', '0', '331247871925944320', '311321109557411840', '311321109771321344');
INSERT INTO `role_menu` VALUES ('332632800995835904', 'BROWSER', '0a9cbbbb4f130988', '2020-03-31 01:40:01', '\0', '2020-03-31 01:40:01', '0', '331268805747539968', '311321109557411840', '311321109771321344');
INSERT INTO `role_menu` VALUES ('332632801209745408', 'BROWSER', '0a9cbbbb4f130988', '2020-03-31 01:40:01', '\0', '2020-03-31 01:40:01', '0', '331281673024962560', '311321109557411840', '311321109771321344');
INSERT INTO `role_menu` VALUES ('332632801381711872', 'BROWSER', '0a9cbbbb4f130988', '2020-03-31 01:40:01', '\0', '2020-03-31 01:40:01', '0', '329617413534384128', '311321109557411840', '311321109771321344');
INSERT INTO `role_menu` VALUES ('332632801469792256', 'BROWSER', '0a9cbbbb4f130988', '2020-03-31 01:40:01', '\0', '2020-03-31 01:40:01', '0', '311321109981036544', '311321109557411840', '311321109771321344');
INSERT INTO `role_menu` VALUES ('332632801591427072', 'BROWSER', '0a9cbbbb4f130988', '2020-03-31 01:40:01', '\0', '2020-03-31 01:40:01', '0', '311473712228466688', '311321109557411840', '311321109771321344');
INSERT INTO `role_menu` VALUES ('332632801746616320', 'BROWSER', '0a9cbbbb4f130988', '2020-03-31 01:40:01', '\0', '2020-03-31 01:40:01', '0', '311473893632114688', '311321109557411840', '311321109771321344');
INSERT INTO `role_menu` VALUES ('332632801926971392', 'BROWSER', '0a9cbbbb4f130988', '2020-03-31 01:40:01', '\0', '2020-03-31 01:40:01', '0', '311370006229155840', '311321109557411840', '311321109771321344');
INSERT INTO `role_menu` VALUES ('332632802094743552', 'BROWSER', '0a9cbbbb4f130988', '2020-03-31 01:40:01', '\0', '2020-03-31 01:40:01', '0', '311468972128075776', '311321109557411840', '311321109771321344');
INSERT INTO `role_menu` VALUES ('332632802157658112', 'BROWSER', '0a9cbbbb4f130988', '2020-03-31 01:40:01', '\0', '2020-03-31 01:40:01', '0', '331252312938905600', '311321109557411840', '311321109771321344');
INSERT INTO `role_menu` VALUES ('332632802275098624', 'BROWSER', '0a9cbbbb4f130988', '2020-03-31 01:40:01', '\0', '2020-03-31 01:40:01', '0', '311469105863458816', '311321109557411840', '311321109771321344');
INSERT INTO `role_menu` VALUES ('332632802333818880', 'BROWSER', '0a9cbbbb4f130988', '2020-03-31 01:40:01', '\0', '2020-03-31 01:40:01', '0', '331252540215656448', '311321109557411840', '311321109771321344');
INSERT INTO `role_menu` VALUES ('332632802430287872', 'BROWSER', '0a9cbbbb4f130988', '2020-03-31 01:40:01', '\0', '2020-03-31 01:40:01', '0', '331282266367983616', '311321109557411840', '311321109771321344');
INSERT INTO `role_menu` VALUES ('332632802715500544', 'BROWSER', '0a9cbbbb4f130988', '2020-03-31 01:40:01', '\0', '2020-03-31 01:40:01', '0', '331282481963597824', '311321109557411840', '311321109771321344');
INSERT INTO `role_menu` VALUES ('332632802774220800', 'BROWSER', '0a9cbbbb4f130988', '2020-03-31 01:40:01', '\0', '2020-03-31 01:40:01', '0', '331282597470535680', '311321109557411840', '311321109771321344');
INSERT INTO `role_menu` VALUES ('332632802845523968', 'BROWSER', '0a9cbbbb4f130988', '2020-03-31 01:40:01', '\0', '2020-03-31 01:40:01', '0', '331282658166308864', '311321109557411840', '311321109771321344');
INSERT INTO `role_menu` VALUES ('332632802908438528', 'BROWSER', '0a9cbbbb4f130988', '2020-03-31 01:40:01', '\0', '2020-03-31 01:40:01', '0', '332630488105615360', '311321109557411840', '311321109771321344');
INSERT INTO `role_menu` VALUES ('332632802958770176', 'BROWSER', '0a9cbbbb4f130988', '2020-03-31 01:40:01', '\0', '2020-03-31 01:40:01', '0', '332631443018612736', '311321109557411840', '311321109771321344');
INSERT INTO `role_menu` VALUES ('332632803017490432', 'BROWSER', '0a9cbbbb4f130988', '2020-03-31 01:40:01', '\0', '2020-03-31 01:40:01', '0', '332631764805615616', '311321109557411840', '311321109771321344');

-- ----------------------------
-- Table structure for role_permission
-- ----------------------------
DROP TABLE IF EXISTS `role_permission`;
CREATE TABLE `role_permission` (
  `id` bigint(20) NOT NULL COMMENT '主键id',
  `client_device_type` varchar(80) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '数据来源终端',
  `client_id` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '应用程序唯一标志，分配给应用的appid',
  `date_created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '数据创建时间',
  `del` bit(1) NOT NULL DEFAULT b'0' COMMENT '数据是否有效，用作逻辑删除',
  `last_updated` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '数据最后更新时间',
  `version` int(11) NOT NULL DEFAULT '0' COMMENT '乐观锁',
  `operator_user_id` bigint(20) NOT NULL COMMENT '添加该权限用户',
  `permission_id` bigint(20) NOT NULL COMMENT '权限信息',
  `role_id` bigint(20) NOT NULL COMMENT '角色信息',
  PRIMARY KEY (`id`),
  UNIQUE KEY `UK3jsmum8pugug90p09061rnm1c` (`role_id`,`permission_id`),
  KEY `IDXfv36v7t1j8wkyv2hf9qlt9pdq` (`role_id`),
  KEY `IDXr9n3d4e7gtp6tyu35re8a848d` (`permission_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='角色权限表，多对多关系';

-- ----------------------------
-- Records of role_permission
-- ----------------------------
INSERT INTO `role_permission` VALUES ('311321110165585920', 'OTHERS', '0a9cbbbb4f130988', '2020-01-28 12:16:12', '\0', '2020-01-28 12:16:12', '0', '311321109557411840', '311321110123642880', '311321109771321344');

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `id` bigint(20) NOT NULL COMMENT '主键id',
  `client_device_type` varchar(80) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '数据来源终端',
  `client_id` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '应用程序唯一标志，分配给应用的appid',
  `date_created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '数据创建时间',
  `del` bit(1) NOT NULL DEFAULT b'0' COMMENT '数据是否有效，用作逻辑删除',
  `last_updated` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '数据最后更新时间',
  `version` int(11) NOT NULL DEFAULT '0' COMMENT '乐观锁',
  `password` varchar(150) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '用户密码',
  `user_type_id` bigint(20) NOT NULL COMMENT '用户类型',
  `username` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '注册用户名',
  `parent_id` bigint(20) DEFAULT NULL COMMENT '主键id',
  PRIMARY KEY (`id`),
  UNIQUE KEY `UKsb8bbouer5wak8vyiiy4pf2bx` (`username`),
  KEY `IDXixp1g6eseclly25vpx1hhsfgs` (`user_type_id`),
  KEY `FK4k8a1qa0wofm01aijepmu0d4g` (`parent_id`),
  CONSTRAINT `FK4k8a1qa0wofm01aijepmu0d4g` FOREIGN KEY (`parent_id`) REFERENCES `user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='用户表。';

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES ('311321109557411840', 'OTHERS', '0a9cbbbb4f130988', '2020-01-28 12:16:12', '\0', '2020-03-31 00:53:55', '13', '172eee54aa664e9dd0536b063796e54e', '273597679752183808', 'admin', null);

-- ----------------------------
-- Table structure for user_app
-- ----------------------------
DROP TABLE IF EXISTS `user_app`;
CREATE TABLE `user_app` (
  `id` bigint(20) NOT NULL COMMENT '主键id',
  `client_device_type` varchar(80) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '数据来源终端',
  `client_id` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '应用程序唯一标志，分配给应用的appid',
  `date_created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '数据创建时间',
  `del` bit(1) NOT NULL DEFAULT b'0' COMMENT '数据是否有效，用作逻辑删除',
  `last_updated` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '数据最后更新时间',
  `version` int(11) NOT NULL DEFAULT '0' COMMENT '乐观锁',
  `app_info_id` bigint(20) DEFAULT NULL COMMENT '应用程序id',
  `user_id` bigint(20) DEFAULT NULL COMMENT '用户id',
  PRIMARY KEY (`id`),
  KEY `IDXle4o7r5fbhn5t1vpyyh8ctdjr` (`user_id`),
  KEY `IDXq1jm6p55gw04ql6jh7io145ix` (`app_info_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='用户申请的app，一个用户可以申请多个app';

-- ----------------------------
-- Records of user_app
-- ----------------------------

-- ----------------------------
-- Table structure for user_detail
-- ----------------------------
DROP TABLE IF EXISTS `user_detail`;
CREATE TABLE `user_detail` (
  `id` bigint(20) NOT NULL COMMENT '主键id',
  `client_device_type` varchar(80) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '数据来源终端',
  `client_id` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '应用程序唯一标志，分配给应用的appid',
  `date_created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '数据创建时间',
  `del` bit(1) NOT NULL DEFAULT b'0' COMMENT '数据是否有效，用作逻辑删除',
  `last_updated` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '数据最后更新时间',
  `version` int(11) NOT NULL DEFAULT '0' COMMENT '乐观锁',
  `account_id` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '个人认证唯一证书信息，用来生成印章',
  `dept_id` bigint(20) DEFAULT NULL COMMENT '部门信息,多对一',
  `email` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '电子邮箱',
  `enterprise_id` bigint(20) DEFAULT NULL COMMENT '企业信息,多对一',
  `idno` varchar(18) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '身份证号码',
  `mobile` varchar(11) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '手机号码',
  `real_name` varchar(80) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '用户真实姓名',
  `sex_type` tinyint(1) NOT NULL DEFAULT '0' COMMENT '用户性别',
  `status` tinyint(1) NOT NULL DEFAULT '0' COMMENT '用户状态：0-待审核，1-审核通过/待实名认证，2-审核不通过，3-已实名认证(实名认证失败回到审核通过)，4-已禁用，5-黑名单',
  `user_id` bigint(20) NOT NULL COMMENT '主用户信息，一对一',
  `user_seal` text COLLATE utf8mb4_unicode_ci COMMENT '个人印章图片base64',
  PRIMARY KEY (`id`),
  UNIQUE KEY `UK_irpjde408yqyneoi2c56apfak` (`mobile`),
  UNIQUE KEY `UK_dm7hrxg9mvrb92v1p3o6wg97u` (`user_id`),
  UNIQUE KEY `UK_snttwnpfdvrxcg3gv151p6r3a` (`account_id`),
  UNIQUE KEY `UK_6krque9ynchnw1cnyuvxe3nml` (`idno`),
  KEY `IDXaquj1ngainv310ii0sp6li8wu` (`enterprise_id`),
  KEY `IDXna1vy00unv6uq6pchbtf9fd7g` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='用户详情表。';

-- ----------------------------
-- Records of user_detail
-- ----------------------------
INSERT INTO `user_detail` VALUES ('311321109704212480', 'OTHERS', '0a9cbbbb4f130988', '2020-01-28 12:16:12', '\0', '2020-04-04 14:11:03', '13', null, '311488733415211008', '932852117@qq.com', '311321109645492224', null, '13543495275', '超级管理员', '0', '1', '311321109557411840', null);

-- ----------------------------
-- Table structure for user_role
-- ----------------------------
DROP TABLE IF EXISTS `user_role`;
CREATE TABLE `user_role` (
  `id` bigint(20) NOT NULL COMMENT '主键id',
  `client_device_type` varchar(80) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '数据来源终端',
  `client_id` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '应用程序唯一标志，分配给应用的appid',
  `date_created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '数据创建时间',
  `del` bit(1) NOT NULL DEFAULT b'0' COMMENT '数据是否有效，用作逻辑删除',
  `last_updated` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '数据最后更新时间',
  `version` int(11) NOT NULL DEFAULT '0' COMMENT '乐观锁',
  `operate_user_id` bigint(20) NOT NULL COMMENT '分配角色操作会员id',
  `role_id` bigint(20) NOT NULL COMMENT '角色信息',
  `user_id` bigint(20) NOT NULL COMMENT '用户信息',
  PRIMARY KEY (`id`),
  KEY `IDXoj50qpdthexxxmvur61ggy2fb` (`user_id`),
  KEY `IDXkt76tbwgvgf7m5rhnrkxxvgyc` (`role_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='用户角色表，多对多关系';

-- ----------------------------
-- Records of user_role
-- ----------------------------
INSERT INTO `user_role` VALUES ('311321109817458688', 'OTHERS', '0a9cbbbb4f130988', '2020-01-28 12:16:12', '\0', '2020-01-28 12:16:12', '0', '311321109557411840', '311321109771321344', '311321109557411840');

-- ----------------------------
-- Table structure for user_type
-- ----------------------------
DROP TABLE IF EXISTS `user_type`;
CREATE TABLE `user_type` (
  `id` bigint(20) NOT NULL COMMENT '主键id',
  `client_device_type` varchar(80) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '数据来源终端',
  `client_id` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '应用程序唯一标志，分配给应用的appid',
  `date_created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '数据创建时间',
  `del` bit(1) NOT NULL DEFAULT b'0' COMMENT '数据是否有效，用作逻辑删除',
  `last_updated` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '数据最后更新时间',
  `version` int(11) NOT NULL DEFAULT '0' COMMENT '乐观锁',
  `code` smallint(4) NOT NULL COMMENT '唯一编号',
  `description` varchar(150) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '描述说明',
  `name` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '名称',
  PRIMARY KEY (`id`),
  UNIQUE KEY `UK_h1cthdgbmec49l3eul4w20ols` (`code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='用户类型';

-- ----------------------------
-- Records of user_type
-- ----------------------------
INSERT INTO `user_type` VALUES ('273597679752183808', 'OTHERS', '0a9cbbbb4f130988', '2020-01-26 21:20:56', '\0', '2020-01-26 21:20:56', '0', '0', '系统总管理员，全系统权限', '超级管理员');
INSERT INTO `user_type` VALUES ('273603560082505728', 'OTHERS', '0a9cbbbb4f130988', '2020-01-26 21:20:57', '\0', '2020-01-26 21:20:57', '0', '1', '普通的注册会员', '普通会员');
INSERT INTO `user_type` VALUES ('273605128261468160', 'OTHERS', '0a9cbbbb4f130988', '2020-01-26 21:20:57', '\0', '2020-01-26 21:20:57', '0', '2', '核心企业注册会员', '核心企业会员');
INSERT INTO `user_type` VALUES ('273605466439811072', 'OTHERS', '0a9cbbbb4f130988', '2020-01-26 21:20:57', '\0', '2020-01-26 21:20:57', '0', '3', '供应商注册会员', '供应商会员');
