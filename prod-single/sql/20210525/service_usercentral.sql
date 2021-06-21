/*
 Navicat Premium Data Transfer

 Source Server         : xcjr-xrlj-prod
 Source Server Type    : MySQL
 Source Server Version : 80013
 Source Host           : localhost:3910
 Source Schema         : service_usercentral

 Target Server Type    : MySQL
 Target Server Version : 80013
 File Encoding         : 65001

 Date: 25/05/2021 18:03:45
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for app_info
-- ----------------------------
DROP TABLE IF EXISTS `app_info`;
CREATE TABLE `app_info`  (
  `id` bigint(20) NOT NULL COMMENT '主键id',
  `client_device_type` varchar(80) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '数据来源终端',
  `client_id` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '应用程序唯一标志，分配给应用的appid',
  `date_created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '数据创建时间',
  `del` bit(1) NOT NULL DEFAULT b'0' COMMENT '数据是否有效，用作逻辑删除',
  `last_updated` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '数据最后更新时间',
  `version` int(11) NOT NULL DEFAULT 0 COMMENT '乐观锁',
  `app_id` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '应用程序唯一标志',
  `app_name` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '应用名称',
  `app_secret` varchar(250) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '密钥，开发者密码',
  `app_type` tinyint(1) NOT NULL DEFAULT 0 COMMENT '应用程序类型：0-内部系统，1-对外开放系统',
  `check_status` tinyint(1) NOT NULL DEFAULT 0 COMMENT '审核状态：0-等待审核，1-审核通过/启用，2-审核不通过，3-禁用',
  `description` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '应用的描述',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `UK_q10vsw7um85bmdu3xfo6ng8i0`(`app_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '申请应用程序信息' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of app_info
-- ----------------------------
INSERT INTO `app_info` VALUES (384564355439525888, 'OTHERS', '0a9cbbbb4f130988', '2020-08-17 14:58:43', b'0', '2020-08-17 14:58:43', 0, '0a9cbbbb4f130988', '超级总后台', 'b80c3d956462a065814946b5cc7a5995', 0, 1, '系统管理总后台');
INSERT INTO `app_info` VALUES (384626468589666304, 'BROWSER', '0a9cbbbb4f130988', '2020-08-17 19:05:33', b'0', '2020-08-17 19:05:33', 0, '2e5a0de806a58450', '供应链融资平台', '1f1053a22a07ceeced6b0a15a5266547', 0, 1, '供应链各种模式下，融资。');
INSERT INTO `app_info` VALUES (405874973417144320, 'BROWSER', '0a9cbbbb4f130988', '2020-10-15 10:19:30', b'0', '2020-10-15 10:19:30', 0, '535c01762cde2136', '免费电子书管理平台-后台管理系统', 'aef313ac1623d51771320bde31bf73ae', 0, 1, '免费电子书管理平台-后台管理系统');
INSERT INTO `app_info` VALUES (405875312786669568, 'BROWSER', '0a9cbbbb4f130988', '2020-10-15 10:20:51', b'0', '2020-10-15 10:20:51', 0, '571f0d2a96948809', '免费电子书管理平台-WEB客户端', 'f57fc713bd8e409f95889d16028b884c', 0, 1, '免费电子书管理平台-WEB客户端');
INSERT INTO `app_info` VALUES (453469299533676544, 'BROWSER', '0a9cbbbb4f130988', '2021-02-23 18:22:21', b'0', '2021-02-23 18:22:21', 0, '9683dd09b8602058', '电子债权拆分转让系统', 'e3f59d3afffcfc205cf51dc4a4cc35fb', 0, 1, '联信星电子债权拆分转让系统');

-- ----------------------------
-- Table structure for bank_card
-- ----------------------------
DROP TABLE IF EXISTS `bank_card`;
CREATE TABLE `bank_card`  (
  `id` bigint(20) NOT NULL COMMENT '主键id',
  `client_device_type` varchar(80) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '数据来源终端',
  `client_id` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '应用程序唯一标志，分配给应用的appid',
  `date_created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '数据创建时间',
  `del` bit(1) NOT NULL DEFAULT b'0' COMMENT '数据是否有效，用作逻辑删除',
  `last_updated` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '数据最后更新时间',
  `version` int(11) NOT NULL DEFAULT 0 COMMENT '乐观锁',
  `bank_card_type` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '卡类型',
  `default_card` bit(1) NOT NULL DEFAULT b'0' COMMENT '是否为默认卡。',
  `etp_bank_card_name` varchar(80) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '银行卡名称',
  `etp_bank_card_num` varchar(80) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '银行卡卡号',
  `etp_bank_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '开户行名称',
  `etp_branch_name` varchar(80) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '支行全称',
  `holder_id` bigint(20) NOT NULL COMMENT '持有人id，企业或者个人',
  `permit_pic_file_id` bigint(20) NULL DEFAULT NULL COMMENT '开户许可证图片',
  `city` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '市名称',
  `province` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '省名称',
  `prcptcd` varchar(80) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '行号。大额行号',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '企业银行卡信息。' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of bank_card
-- ----------------------------
INSERT INTO `bank_card` VALUES (404832013967687680, 'BROWSER', '2e5a0de806a58450', '2020-10-12 13:15:09', b'0', '2020-12-15 11:46:00', 9, 'ENTERPRISE', b'1', '广州链金科技有限公司', '63545965321583564333', '中国建设银行', '中国建设银行股份有限公司广州番禺海伦堡支行', 387763042156281856, 428002393200787456, '广州市', '广东省', '105581018286');

-- ----------------------------
-- Table structure for department
-- ----------------------------
DROP TABLE IF EXISTS `department`;
CREATE TABLE `department`  (
  `id` bigint(20) NOT NULL COMMENT '主键id',
  `client_device_type` varchar(80) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '数据来源终端',
  `client_id` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '应用程序唯一标志，分配给应用的appid',
  `date_created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '数据创建时间',
  `del` bit(1) NOT NULL DEFAULT b'0' COMMENT '数据是否有效，用作逻辑删除',
  `last_updated` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '数据最后更新时间',
  `version` int(11) NOT NULL DEFAULT 0 COMMENT '乐观锁',
  `dept_key` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0' COMMENT '部门唯一key',
  `enterprise_id` bigint(20) NOT NULL COMMENT '所属企业',
  `name` varchar(80) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '部门名称',
  `sort` smallint(3) NOT NULL DEFAULT 0 COMMENT '排序',
  `parent_id` bigint(20) NULL DEFAULT NULL COMMENT '主键id',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `UKafcd9qxpini7ytahspcueu2f3`(`enterprise_id`, `name`) USING BTREE,
  UNIQUE INDEX `UK_njhgil76xre1al47kw73stlhe`(`dept_key`) USING BTREE,
  INDEX `FKmgsnnmudxrwqidn4f64q8rp4o`(`parent_id`) USING BTREE,
  CONSTRAINT `FKmgsnnmudxrwqidn4f64q8rp4o` FOREIGN KEY (`parent_id`) REFERENCES `department` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '企业部门表。' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of department
-- ----------------------------
INSERT INTO `department` VALUES (384955055540797440, 'BROWSER', '0a9cbbbb4f130988', '2020-08-18 16:51:14', b'0', '2020-08-18 16:51:14', 0, '1', 384564355968008192, '小睿链接科技', 1, NULL);
INSERT INTO `department` VALUES (384955178429710336, 'BROWSER', '0a9cbbbb4f130988', '2020-08-18 16:51:43', b'0', '2020-08-18 18:53:31', 1, '11', 384564355968008192, 'IT技术部', 3, 384955055540797440);
INSERT INTO `department` VALUES (384955266057109504, 'BROWSER', '0a9cbbbb4f130988', '2020-08-18 16:52:04', b'0', '2020-08-18 16:52:04', 0, '12', 384564355968008192, '财务部', 2, 384955055540797440);
INSERT INTO `department` VALUES (384955468423888896, 'BROWSER', '0a9cbbbb4f130988', '2020-08-18 16:52:52', b'0', '2020-08-18 16:52:52', 0, '111', 384564355968008192, '后台开发组', 1, 384955178429710336);
INSERT INTO `department` VALUES (384955559490617344, 'BROWSER', '0a9cbbbb4f130988', '2020-08-18 16:53:14', b'0', '2020-08-18 16:53:14', 0, '112', 384564355968008192, 'web前端开发组', 2, 384955178429710336);
INSERT INTO `department` VALUES (384985785557843968, 'BROWSER', '0a9cbbbb4f130988', '2020-08-18 18:53:20', b'0', '2020-08-18 18:53:53', 1, '13', 384564355968008192, '管理部', 4, 384955055540797440);

-- ----------------------------
-- Table structure for enterprise
-- ----------------------------
DROP TABLE IF EXISTS `enterprise`;
CREATE TABLE `enterprise`  (
  `id` bigint(20) NOT NULL COMMENT '主键id',
  `client_device_type` varchar(80) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '数据来源终端',
  `client_id` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '应用程序唯一标志，分配给应用的appid',
  `date_created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '数据创建时间',
  `del` bit(1) NOT NULL DEFAULT b'0' COMMENT '数据是否有效，用作逻辑删除',
  `last_updated` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '数据最后更新时间',
  `version` int(11) NOT NULL DEFAULT 0 COMMENT '乐观锁',
  `account_id` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '企业认证唯一证书信息，用来生成印章',
  `address` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '公司地址全称',
  `business_license` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '营业执照号码',
  `contact_mobile` varchar(11) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '联系人手机号码',
  `contact_name` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '联系人姓名',
  `contact_phone` varchar(11) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '联系人座机号码',
  `description` varchar(2000) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '企业简介',
  `email` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '企业邮箱',
  `etp_code` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '企业代码,唯一标志一个企业',
  `etp_name` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '企业名称',
  `etp_status` tinyint(1) NOT NULL DEFAULT 0 COMMENT '企业状态：0-待审核，1-审核通过，2-审核不通过，3-已实名认证，4-实名认证中，5-已禁用, 6-黑名单',
  `fax` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '公司传真',
  `legal_person` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '法人',
  `legal_person_id_no` varchar(18) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '法人身份证号码',
  `organization_code` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '组织机构代码',
  `organize_seal` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL COMMENT '企业印章图片base64',
  `ori_code` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '企业原始编码',
  `short_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '企业简称',
  `tax_code` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '税务登记证',
  `telephone` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '公司联系座机电话',
  `unify_code` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '统一社会信用代码',
  `web_site` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '企业官网',
  `registered_address` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '公司注册地址',
  `business_license_pic_file_id` bigint(20) NULL DEFAULT NULL COMMENT '营业执照图片信息',
  `legal_person_id_no_pic_file_id` bigint(20) NULL DEFAULT NULL COMMENT '法人身份证正反面图片',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `UK_60givf8bau3ryr8g8ngw3wuiw`(`etp_code`) USING BTREE,
  UNIQUE INDEX `UK_fqjctwvtxenxite6jg7ebrib1`(`unify_code`) USING BTREE,
  UNIQUE INDEX `UK_5tc722cht7c6dcle06s7hs46y`(`legal_person_id_no`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '企业信息表。' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of enterprise
-- ----------------------------
INSERT INTO `enterprise` VALUES (384564355968008192, 'OTHERS', '0a9cbbbb4f130988', '2020-08-17 14:58:43', b'0', '2020-08-17 14:58:43', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'QY001', '小睿链金科技有限公司', 4, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0755-32805729', 'abcd', NULL, NULL, NULL, NULL);
INSERT INTO `enterprise` VALUES (387763042156281856, 'BROWSER', '0a9cbbbb4f130988', '2020-08-26 10:49:09', b'0', '2020-12-16 15:19:58', 62, NULL, 'abc', NULL, '13543495275', '任春', NULL, NULL, '932852117@qq.com', 'QY002', '东莞市煜坤铁艺护栏有限公司', 4, '', '王菊妹', '360281197610267128', NULL, NULL, NULL, NULL, NULL, '02016535695', '91441900077914230X', NULL, 'bbb', 428418559459196928, 428418623686574080);

-- ----------------------------
-- Table structure for enterprise_check_result
-- ----------------------------
DROP TABLE IF EXISTS `enterprise_check_result`;
CREATE TABLE `enterprise_check_result`  (
  `id` bigint(20) NOT NULL COMMENT '主键id',
  `client_device_type` varchar(80) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '数据来源终端',
  `client_id` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '应用程序唯一标志，分配给应用的appid',
  `date_created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '数据创建时间',
  `del` bit(1) NOT NULL DEFAULT b'0' COMMENT '数据是否有效，用作逻辑删除',
  `last_updated` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '数据最后更新时间',
  `version` int(11) NOT NULL DEFAULT 0 COMMENT '乐观锁',
  `check_result` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '审核结果信息',
  `check_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '审核时间',
  `check_user` bigint(20) NOT NULL COMMENT '操作人userId',
  `enterprise_id` bigint(20) NOT NULL,
  `state` tinyint(1) NOT NULL COMMENT '0-不通过,1-通过',
  `service_id` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT 'esign实名认证流程serviceId',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '企业审核实名认证结果记录' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of enterprise_check_result
-- ----------------------------
INSERT INTO `enterprise_check_result` VALUES (428049899590778880, 'BROWSER', '0a9cbbbb4f130988', '2020-12-15 14:54:44', b'0', '2020-12-15 14:54:44', 0, NULL, '2020-12-15 14:54:44', 384564355850567680, 387763042156281856, 0, NULL);
INSERT INTO `enterprise_check_result` VALUES (428051197698506752, 'BROWSER', '0a9cbbbb4f130988', '2020-12-15 14:59:54', b'0', '2020-12-15 14:59:54', 0, 'sdf地方', '2020-12-15 14:59:54', 384564355850567680, 387763042156281856, 0, NULL);
INSERT INTO `enterprise_check_result` VALUES (428053936138616832, 'BROWSER', '0a9cbbbb4f130988', '2020-12-15 15:10:49', b'0', '2020-12-15 15:10:49', 0, '审核通过并对公打款成功', '2020-12-15 15:10:47', 384564355850567680, 387763042156281856, 1, '1564982844063814211');
INSERT INTO `enterprise_check_result` VALUES (428054781550919680, 'BROWSER', '2e5a0de806a58450', '2020-12-15 15:14:09', b'0', '2020-12-15 15:14:09', 0, '认证流程已关闭', '2020-12-15 15:14:08', 387767668792360960, 387763042156281856, 0, '1564982844063814211');
INSERT INTO `enterprise_check_result` VALUES (428058901850619904, 'BROWSER', '2e5a0de806a58450', '2020-12-15 15:30:31', b'0', '2020-12-15 15:30:31', 0, '认证流程已关闭', '2020-12-15 15:30:31', 387767668792360960, 387763042156281856, 0, '1564982844063814211');
INSERT INTO `enterprise_check_result` VALUES (428058927553314816, 'BROWSER', '2e5a0de806a58450', '2020-12-15 15:30:37', b'0', '2020-12-15 15:30:37', 0, '认证流程已关闭', '2020-12-15 15:30:37', 387767668792360960, 387763042156281856, 0, '1564982844063814211');
INSERT INTO `enterprise_check_result` VALUES (428068564608483328, 'BROWSER', '0a9cbbbb4f130988', '2020-12-15 16:08:55', b'0', '2020-12-15 16:08:55', 0, 'NOT_FOUND', '2020-12-15 16:08:55', 384564355850567680, 387763042156281856, 0, NULL);
INSERT INTO `enterprise_check_result` VALUES (428069009431199744, 'BROWSER', '0a9cbbbb4f130988', '2020-12-15 16:10:41', b'0', '2020-12-15 16:10:41', 0, 'NOT_FOUND', '2020-12-15 16:10:41', 384564355850567680, 387763042156281856, 0, NULL);
INSERT INTO `enterprise_check_result` VALUES (428069350944014336, 'BROWSER', '0a9cbbbb4f130988', '2020-12-15 16:12:02', b'0', '2020-12-15 16:12:02', 0, 'NOT_FOUND', '2020-12-15 16:12:02', 384564355850567680, 387763042156281856, 0, NULL);
INSERT INTO `enterprise_check_result` VALUES (428069720504139776, 'BROWSER', '0a9cbbbb4f130988', '2020-12-15 16:13:30', b'0', '2020-12-15 16:13:30', 0, 'NOT_FOUND', '2020-12-15 16:13:30', 384564355850567680, 387763042156281856, 0, NULL);
INSERT INTO `enterprise_check_result` VALUES (428070288983326720, 'BROWSER', '0a9cbbbb4f130988', '2020-12-15 16:15:46', b'0', '2020-12-15 16:15:46', 0, 'NOT_FOUND', '2020-12-15 16:15:46', 384564355850567680, 387763042156281856, 0, NULL);
INSERT INTO `enterprise_check_result` VALUES (428071195846377472, 'BROWSER', '0a9cbbbb4f130988', '2020-12-15 16:19:22', b'0', '2020-12-15 16:19:22', 0, 'NOT_FOUND', '2020-12-15 16:19:22', 384564355850567680, 387763042156281856, 0, NULL);
INSERT INTO `enterprise_check_result` VALUES (428071447898882048, 'BROWSER', '0a9cbbbb4f130988', '2020-12-15 16:21:06', b'0', '2020-12-15 16:21:06', 0, 'NOT_FOUND', '2020-12-15 16:20:22', 384564355850567680, 387763042156281856, 0, NULL);
INSERT INTO `enterprise_check_result` VALUES (428073969141153792, 'BROWSER', '0a9cbbbb4f130988', '2020-12-15 16:30:24', b'0', '2020-12-15 16:30:24', 0, 'NOT_FOUND', '2020-12-15 16:30:23', 384564355850567680, 387763042156281856, 0, NULL);
INSERT INTO `enterprise_check_result` VALUES (428074441403006976, 'BROWSER', '0a9cbbbb4f130988', '2020-12-15 16:32:17', b'0', '2020-12-15 16:32:17', 0, 'NOT_FOUND', '2020-12-15 16:32:16', 384564355850567680, 387763042156281856, 0, NULL);
INSERT INTO `enterprise_check_result` VALUES (428074845838770176, 'BROWSER', '0a9cbbbb4f130988', '2020-12-15 16:33:53', b'0', '2020-12-15 16:33:53', 0, '审核通过并对公打款成功', '2020-12-15 16:33:52', 384564355850567680, 387763042156281856, 1, '1565066479777419673');
INSERT INTO `enterprise_check_result` VALUES (428075273867493376, 'BROWSER', '2e5a0de806a58450', '2020-12-15 16:35:36', b'0', '2020-12-15 16:35:36', 0, '打款金额验证失败', '2020-12-15 16:35:34', 387767668792360960, 387763042156281856, 0, '1565066479777419673');
INSERT INTO `enterprise_check_result` VALUES (428075348853260288, 'BROWSER', '2e5a0de806a58450', '2020-12-15 16:35:52', b'0', '2020-12-15 16:35:52', 0, '认证流程已关闭', '2020-12-15 16:35:52', 387767668792360960, 387763042156281856, 0, '1565066479777419673');
INSERT INTO `enterprise_check_result` VALUES (428075381409447936, 'BROWSER', '2e5a0de806a58450', '2020-12-15 16:36:00', b'0', '2020-12-15 16:36:00', 0, '认证流程已关闭', '2020-12-15 16:36:00', 387767668792360960, 387763042156281856, 0, '1565066479777419673');
INSERT INTO `enterprise_check_result` VALUES (428075569834360832, 'BROWSER', '2e5a0de806a58450', '2020-12-15 16:36:45', b'0', '2020-12-15 16:36:45', 0, '认证流程已关闭', '2020-12-15 16:36:45', 387767668792360960, 387763042156281856, 0, '1565066479777419673');
INSERT INTO `enterprise_check_result` VALUES (428076282362724352, 'BROWSER', '2e5a0de806a58450', '2020-12-15 16:39:35', b'0', '2020-12-15 16:39:35', 0, '认证流程已关闭', '2020-12-15 16:39:35', 387767668792360960, 387763042156281856, 0, '1565066479777419673');
INSERT INTO `enterprise_check_result` VALUES (428076524801884160, 'BROWSER', '2e5a0de806a58450', '2020-12-15 16:40:33', b'0', '2020-12-15 16:40:33', 0, '认证流程已关闭', '2020-12-15 16:40:32', 387767668792360960, 387763042156281856, 0, '1565066479777419673');
INSERT INTO `enterprise_check_result` VALUES (428076977077878784, 'BROWSER', '2e5a0de806a58450', '2020-12-15 16:42:21', b'0', '2020-12-15 16:42:21', 0, '认证流程已关闭', '2020-12-15 16:42:20', 387767668792360960, 387763042156281856, 0, '1565066479777419673');
INSERT INTO `enterprise_check_result` VALUES (428077304690769920, 'BROWSER', '2e5a0de806a58450', '2020-12-15 16:43:39', b'0', '2020-12-15 16:43:39', 0, '认证流程已关闭', '2020-12-15 16:43:38', 387767668792360960, 387763042156281856, 0, '1565066479777419673');
INSERT INTO `enterprise_check_result` VALUES (428077536480591872, 'BROWSER', '2e5a0de806a58450', '2020-12-15 16:45:10', b'0', '2020-12-15 16:45:10', 0, '认证流程已关闭', '2020-12-15 16:44:34', 387767668792360960, 387763042156281856, 0, '1565066479777419673');
INSERT INTO `enterprise_check_result` VALUES (428082343295582208, 'BROWSER', '2e5a0de806a58450', '2020-12-15 17:04:25', b'0', '2020-12-15 17:04:25', 0, '认证流程已关闭', '2020-12-15 17:03:40', 387767668792360960, 387763042156281856, 0, '1565066479777419673');
INSERT INTO `enterprise_check_result` VALUES (428082602948165632, 'BROWSER', '2e5a0de806a58450', '2020-12-15 17:04:42', b'0', '2020-12-15 17:04:42', 0, '认证流程已关闭', '2020-12-15 17:04:42', 387767668792360960, 387763042156281856, 0, '1565066479777419673');
INSERT INTO `enterprise_check_result` VALUES (428083053462552576, 'BROWSER', '0a9cbbbb4f130988', '2020-12-15 17:06:30', b'0', '2020-12-15 17:06:30', 0, '审核通过并对公打款成功', '2020-12-15 17:06:29', 384564355850567680, 387763042156281856, 1, '1565099309299470851');
INSERT INTO `enterprise_check_result` VALUES (428083083913199616, 'BROWSER', '2e5a0de806a58450', '2020-12-15 17:06:38', b'0', '2020-12-15 17:06:38', 0, '打款金额验证失败', '2020-12-15 17:06:36', 387767668792360960, 387763042156281856, 0, '1565099309299470851');
INSERT INTO `enterprise_check_result` VALUES (428083157930082304, 'BROWSER', '2e5a0de806a58450', '2020-12-15 17:06:55', b'0', '2020-12-15 17:06:55', 0, '打款金额验证失败', '2020-12-15 17:06:54', 387767668792360960, 387763042156281856, 0, '1565099309299470851');
INSERT INTO `enterprise_check_result` VALUES (428083253178531840, 'BROWSER', '2e5a0de806a58450', '2020-12-15 17:07:18', b'0', '2020-12-15 17:07:18', 0, '打款金额验证失败', '2020-12-15 17:07:17', 387767668792360960, 387763042156281856, 0, '1565099309299470851');
INSERT INTO `enterprise_check_result` VALUES (428083338838802432, 'BROWSER', '2e5a0de806a58450', '2020-12-15 17:07:39', b'0', '2020-12-15 17:07:39', 0, '打款验证次数超过上限', '2020-12-15 17:07:37', 387767668792360960, 387763042156281856, 0, '1565099309299470851');
INSERT INTO `enterprise_check_result` VALUES (428083731773784064, 'BROWSER', '2e5a0de806a58450', '2020-12-15 17:09:11', b'0', '2020-12-15 17:09:11', 0, 'NOT_FOUND', '2020-12-15 17:09:11', 387767668792360960, 387763042156281856, 0, '');
INSERT INTO `enterprise_check_result` VALUES (428084542952177664, 'BROWSER', '0a9cbbbb4f130988', '2020-12-15 17:12:25', b'0', '2020-12-15 17:12:25', 0, '审核通过并对公打款成功', '2020-12-15 17:12:24', 384564355850567680, 387763042156281856, 1, '1565105266754654745');
INSERT INTO `enterprise_check_result` VALUES (428084634354450432, 'BROWSER', '2e5a0de806a58450', '2020-12-15 17:12:47', b'0', '2020-12-15 17:12:47', 0, '打款金额验证失败', '2020-12-15 17:12:46', 387767668792360960, 387763042156281856, 0, '1565105266754654745');
INSERT INTO `enterprise_check_result` VALUES (428087308747538432, 'BROWSER', '2e5a0de806a58450', '2020-12-15 17:23:25', b'0', '2020-12-15 17:23:25', 0, '打款金额验证失败', '2020-12-15 17:23:23', 387767668792360960, 387763042156281856, 0, '1565105266754654745');
INSERT INTO `enterprise_check_result` VALUES (428089198319239168, 'BROWSER', '2e5a0de806a58450', '2020-12-15 17:30:54', b'0', '2020-12-15 17:30:54', 0, '认证流程已关闭', '2020-12-15 17:30:54', 387767668792360960, 387763042156281856, 0, '1565105266754654745');
INSERT INTO `enterprise_check_result` VALUES (428089371384610816, 'BROWSER', '2e5a0de806a58450', '2020-12-15 17:31:35', b'0', '2020-12-15 17:31:35', 0, 'NOT_FOUND', '2020-12-15 17:31:35', 387767668792360960, 387763042156281856, 0, '');
INSERT INTO `enterprise_check_result` VALUES (428090364499329024, 'BROWSER', '0a9cbbbb4f130988', '2020-12-15 17:35:33', b'0', '2020-12-15 17:35:33', 0, '审核通过并对公打款成功', '2020-12-15 17:35:32', 384564355850567680, 387763042156281856, 1, '1565128555778609572');
INSERT INTO `enterprise_check_result` VALUES (428090442320445440, 'BROWSER', '2e5a0de806a58450', '2020-12-15 17:35:52', b'0', '2020-12-15 17:35:52', 0, '打款金额验证失败', '2020-12-15 17:35:51', 387767668792360960, 387763042156281856, 0, '1565128555778609572');
INSERT INTO `enterprise_check_result` VALUES (428090470925598720, 'BROWSER', '2e5a0de806a58450', '2020-12-15 17:35:58', b'0', '2020-12-15 17:35:58', 0, '认证流程已关闭', '2020-12-15 17:35:57', 387767668792360960, 387763042156281856, 0, '1565128555778609572');
INSERT INTO `enterprise_check_result` VALUES (428090533299093504, 'BROWSER', '2e5a0de806a58450', '2020-12-15 17:36:12', b'0', '2020-12-15 17:36:12', 0, 'NOT_FOUND', '2020-12-15 17:36:12', 387767668792360960, 387763042156281856, 0, '');
INSERT INTO `enterprise_check_result` VALUES (428092781290848256, 'BROWSER', '0a9cbbbb4f130988', '2020-12-15 17:45:09', b'0', '2020-12-15 17:45:09', 0, '审核通过并对公打款成功', '2020-12-15 17:45:08', 384564355850567680, 387763042156281856, 1, '1565138218901377590');
INSERT INTO `enterprise_check_result` VALUES (428092813687652352, 'BROWSER', '2e5a0de806a58450', '2020-12-15 17:45:18', b'0', '2020-12-15 17:45:18', 0, '打款金额验证失败', '2020-12-15 17:45:16', 387767668792360960, 387763042156281856, 0, '1565138218901377590');
INSERT INTO `enterprise_check_result` VALUES (428092847812509696, 'BROWSER', '2e5a0de806a58450', '2020-12-15 17:45:26', b'0', '2020-12-15 17:45:26', 0, '打款金额验证失败', '2020-12-15 17:45:24', 387767668792360960, 387763042156281856, 0, '1565138218901377590');
INSERT INTO `enterprise_check_result` VALUES (428092868310073344, 'BROWSER', '2e5a0de806a58450', '2020-12-15 17:45:30', b'0', '2020-12-15 17:45:30', 0, '打款金额验证失败', '2020-12-15 17:45:29', 387767668792360960, 387763042156281856, 0, '1565138218901377590');
INSERT INTO `enterprise_check_result` VALUES (428092896403521536, 'BROWSER', '2e5a0de806a58450', '2020-12-15 17:45:38', b'0', '2020-12-15 17:45:38', 0, '打款验证次数超过上限', '2020-12-15 17:45:36', 387767668792360960, 387763042156281856, 0, '1565138218901377590');
INSERT INTO `enterprise_check_result` VALUES (428093052398075904, 'BROWSER', '0a9cbbbb4f130988', '2020-12-15 17:46:14', b'0', '2020-12-15 17:46:14', 0, '审核通过并对公打款成功', '2020-12-15 17:46:13', 384564355850567680, 387763042156281856, 1, '1565139303112184285');
INSERT INTO `enterprise_check_result` VALUES (428093082244743168, 'BROWSER', '2e5a0de806a58450', '2020-12-15 17:46:21', b'0', '2020-12-15 17:46:21', 0, '打款金额验证失败', '2020-12-15 17:46:20', 387767668792360960, 387763042156281856, 0, '1565139303112184285');
INSERT INTO `enterprise_check_result` VALUES (428093106873696256, 'BROWSER', '2e5a0de806a58450', '2020-12-15 17:46:27', b'0', '2020-12-15 17:46:27', 0, '打款金额验证失败', '2020-12-15 17:46:26', 387767668792360960, 387763042156281856, 0, '1565139303112184285');
INSERT INTO `enterprise_check_result` VALUES (428093139559907328, 'BROWSER', '2e5a0de806a58450', '2020-12-15 17:46:36', b'0', '2020-12-15 17:46:36', 0, '打款金额验证失败', '2020-12-15 17:46:34', 387767668792360960, 387763042156281856, 0, '1565139303112184285');
INSERT INTO `enterprise_check_result` VALUES (428098992199434240, 'BROWSER', '2e5a0de806a58450', '2020-12-15 18:09:51', b'0', '2020-12-15 18:09:51', 0, '打款验证次数超过上限', '2020-12-15 18:09:49', 387767668792360960, 387763042156281856, 0, '1565139303112184285');
INSERT INTO `enterprise_check_result` VALUES (428099082989338624, 'BROWSER', '0a9cbbbb4f130988', '2020-12-15 18:10:11', b'0', '2020-12-15 18:10:11', 0, '审核通过并对公打款成功', '2020-12-15 18:10:11', 384564355850567680, 387763042156281856, 1, '1565163424990696035');
INSERT INTO `enterprise_check_result` VALUES (428099114752802816, 'BROWSER', '2e5a0de806a58450', '2020-12-15 18:10:18', b'0', '2020-12-15 18:10:18', 0, '认证流程已关闭', '2020-12-15 18:10:18', 387767668792360960, 387763042156281856, 0, '1565163424990696035');
INSERT INTO `enterprise_check_result` VALUES (428099235569729536, 'BROWSER', '0a9cbbbb4f130988', '2020-12-15 18:10:48', b'0', '2020-12-15 18:10:48', 0, '审核通过并对公打款成功', '2020-12-15 18:10:47', 384564355850567680, 387763042156281856, 1, '1565164035127710230');
INSERT INTO `enterprise_check_result` VALUES (428099321477464064, 'BROWSER', '2e5a0de806a58450', '2020-12-15 18:11:08', b'0', '2020-12-15 18:11:08', 0, '认证流程已关闭', '2020-12-15 18:11:08', 387767668792360960, 387763042156281856, 0, '1565164035127710230');
INSERT INTO `enterprise_check_result` VALUES (428103692844007424, 'BROWSER', '0a9cbbbb4f130988', '2020-12-15 18:28:31', b'0', '2020-12-15 18:28:31', 0, '审核通过并对公打款成功', '2020-12-15 18:28:30', 384564355850567680, 387763042156281856, 1, '1565181867865477546');
INSERT INTO `enterprise_check_result` VALUES (428103732018806784, 'BROWSER', '2e5a0de806a58450', '2020-12-15 18:29:20', b'0', '2020-12-15 18:29:20', 0, '打款金额验证失败', '2020-12-15 18:28:39', 387767668792360960, 387763042156281856, 0, '1565181867865477546');
INSERT INTO `enterprise_check_result` VALUES (428103959836622848, 'BROWSER', '2e5a0de806a58450', '2020-12-15 18:29:35', b'0', '2020-12-15 18:29:35', 0, '打款金额验证失败', '2020-12-15 18:29:33', 387767668792360960, 387763042156281856, 0, '1565181867865477546');
INSERT INTO `enterprise_check_result` VALUES (428103985874862080, 'BROWSER', '2e5a0de806a58450', '2020-12-15 18:29:41', b'0', '2020-12-15 18:29:41', 0, '打款金额验证失败', '2020-12-15 18:29:40', 387767668792360960, 387763042156281856, 0, '1565181867865477546');
INSERT INTO `enterprise_check_result` VALUES (428104031873794048, 'BROWSER', '2e5a0de806a58450', '2020-12-15 18:29:52', b'0', '2020-12-15 18:29:52', 0, '打款验证次数超过上限', '2020-12-15 18:29:51', 387767668792360960, 387763042156281856, 0, '1565181867865477546');
INSERT INTO `enterprise_check_result` VALUES (428104182130540544, 'BROWSER', '0a9cbbbb4f130988', '2020-12-15 18:30:27', b'0', '2020-12-15 18:30:27', 0, '审核通过并对公打款成功', '2020-12-15 18:30:26', 384564355850567680, 387763042156281856, 1, '1565183820364321282');
INSERT INTO `enterprise_check_result` VALUES (428104242998280192, 'BROWSER', '2e5a0de806a58450', '2020-12-15 18:30:50', b'0', '2020-12-15 18:30:50', 0, '打款金额验证失败', '2020-12-15 18:30:41', 387767668792360960, 387763042156281856, 0, '1565183820364321282');
INSERT INTO `enterprise_check_result` VALUES (428104400284680192, 'BROWSER', '2e5a0de806a58450', '2020-12-15 18:31:39', b'0', '2020-12-15 18:31:39', 0, '打款金额验证失败', '2020-12-15 18:31:18', 387767668792360960, 387763042156281856, 0, '1565183820364321282');
INSERT INTO `enterprise_check_result` VALUES (428104504299225088, 'BROWSER', '2e5a0de806a58450', '2020-12-15 18:31:56', b'0', '2020-12-15 18:31:56', 0, '打款金额验证失败', '2020-12-15 18:31:43', 387767668792360960, 387763042156281856, 0, '1565183820364321282');
INSERT INTO `enterprise_check_result` VALUES (428104864518635520, 'BROWSER', '0a9cbbbb4f130988', '2020-12-15 18:33:10', b'0', '2020-12-15 18:33:10', 0, '审核通过并对公打款成功', '2020-12-15 18:33:09', 384564355850567680, 387763042156281856, 1, '1565183820364321282');
INSERT INTO `enterprise_check_result` VALUES (428104886928801792, 'BROWSER', '2e5a0de806a58450', '2020-12-15 18:33:16', b'0', '2020-12-15 18:33:16', 0, '打款金额验证失败', '2020-12-15 18:33:14', 387767668792360960, 387763042156281856, 0, '1565183820364321282');
INSERT INTO `enterprise_check_result` VALUES (428105308972253184, 'BROWSER', '0a9cbbbb4f130988', '2020-12-15 18:34:56', b'0', '2020-12-15 18:34:56', 0, '审核通过并对公打款成功', '2020-12-15 18:34:55', 384564355850567680, 387763042156281856, 1, '1565188327949275520');
INSERT INTO `enterprise_check_result` VALUES (428105331701186560, 'BROWSER', '2e5a0de806a58450', '2020-12-15 18:35:02', b'0', '2020-12-15 18:35:02', 0, '打款金额验证失败', '2020-12-15 18:35:00', 387767668792360960, 387763042156281856, 0, '1565188327949275520');
INSERT INTO `enterprise_check_result` VALUES (428105357697482752, 'BROWSER', '2e5a0de806a58450', '2020-12-15 18:35:08', b'0', '2020-12-15 18:35:08', 0, '打款金额验证失败', '2020-12-15 18:35:07', 387767668792360960, 387763042156281856, 0, '1565188327949275520');
INSERT INTO `enterprise_check_result` VALUES (428105410700902400, 'BROWSER', '2e5a0de806a58450', '2020-12-15 18:35:21', b'0', '2020-12-15 18:35:21', 0, '打款金额验证失败', '2020-12-15 18:35:19', 387767668792360960, 387763042156281856, 0, '1565188327949275520');

-- ----------------------------
-- Table structure for enterprise_relation
-- ----------------------------
DROP TABLE IF EXISTS `enterprise_relation`;
CREATE TABLE `enterprise_relation`  (
  `id` bigint(20) NOT NULL COMMENT '主键id',
  `client_device_type` varchar(80) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '数据来源终端',
  `client_id` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '应用程序唯一标志，分配给应用的appid',
  `date_created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '数据创建时间',
  `del` bit(1) NOT NULL DEFAULT b'0' COMMENT '数据是否有效，用作逻辑删除',
  `last_updated` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '数据最后更新时间',
  `version` int(11) NOT NULL DEFAULT 0 COMMENT '乐观锁',
  `master_etp_id` bigint(20) NOT NULL COMMENT '拥有主企业id',
  `slave_etp_id` bigint(20) NOT NULL COMMENT '企业id',
  `user_type` tinyint(1) NOT NULL DEFAULT 0 COMMENT '类型',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `UKo54s5y2fhm6y08d6s5qnl961w`(`master_etp_id`, `slave_etp_id`, `user_type`) USING BTREE,
  INDEX `IDXpprvp8mb9m3t2mi5biaxmvdvu`(`master_etp_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '企业关系' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of enterprise_relation
-- ----------------------------

-- ----------------------------
-- Table structure for esign_to_pay_notify
-- ----------------------------
DROP TABLE IF EXISTS `esign_to_pay_notify`;
CREATE TABLE `esign_to_pay_notify`  (
  `id` bigint(20) NOT NULL COMMENT '主键id',
  `client_device_type` varchar(80) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '数据来源终端',
  `client_id` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '应用程序唯一标志，分配给应用的appid',
  `date_created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '数据创建时间',
  `del` bit(1) NOT NULL DEFAULT b'0' COMMENT '数据是否有效，用作逻辑删除',
  `last_updated` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '数据最后更新时间',
  `version` int(11) NOT NULL DEFAULT 0 COMMENT '乐观锁',
  `enterprise_id` bigint(20) NOT NULL COMMENT '关联表enterprise',
  `msg` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '银行打款失败时,银行返回的错误信息',
  `payed_time` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '打款完成时间，格式：yyyyMMddHHmmss,例:20160906143600',
  `piz_id` varchar(15) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '调用者业务ID',
  `project_id` varchar(80) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '项目ID',
  `result` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '打款成功SUCCESS,打款失败FAILURE',
  `service_id` varchar(150) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '服务ID',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '企业认证打款回调通知信息表。' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of esign_to_pay_notify
-- ----------------------------

-- ----------------------------
-- Table structure for menu
-- ----------------------------
DROP TABLE IF EXISTS `menu`;
CREATE TABLE `menu`  (
  `id` bigint(20) NOT NULL COMMENT '主键id',
  `client_device_type` varchar(80) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '数据来源终端',
  `client_id` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '应用程序唯一标志，分配给应用的appid',
  `date_created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '数据创建时间',
  `del` bit(1) NOT NULL DEFAULT b'0' COMMENT '数据是否有效，用作逻辑删除',
  `last_updated` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '数据最后更新时间',
  `version` int(11) NOT NULL DEFAULT 0 COMMENT '乐观锁',
  `icon` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '菜单中的图标默认为空',
  `is_show` bit(1) NULL DEFAULT b'1' COMMENT '是否显示 0-不显示 1-显示 默认显示',
  `link` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '菜单路径',
  `menu_key` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0' COMMENT '菜单键',
  `perms` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '授权(多个用逗号分隔，如：user:list,user:create)',
  `sort` smallint(3) NOT NULL DEFAULT 0 COMMENT '排序',
  `title_en` varchar(80) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '菜单英文名称',
  `title_zh` varchar(80) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '菜单中文名称',
  `type` smallint(1) NULL DEFAULT 0 COMMENT '类型   1：菜单   2：按钮',
  `parent_id` bigint(20) NULL DEFAULT NULL COMMENT '主键id',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `UK7rim7wbb96o22u2erfwjobvx9`(`client_id`, `title_zh`) USING BTREE,
  UNIQUE INDEX `UK_pkn5ux9gpua3vaysdtx9wwv7q`(`menu_key`) USING BTREE,
  INDEX `FKgeupubdqncc1lpgf2cn4fqwbc`(`parent_id`) USING BTREE,
  CONSTRAINT `FKgeupubdqncc1lpgf2cn4fqwbc` FOREIGN KEY (`parent_id`) REFERENCES `menu` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '菜单。' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of menu
-- ----------------------------
INSERT INTO `menu` VALUES (384564356282580992, 'OTHERS', '0a9cbbbb4f130988', '2020-08-17 14:58:43', b'0', '2020-08-18 12:54:13', 1, 'home', b'0', '/pages', '1', '', 1, NULL, '首页', 1, NULL);
INSERT INTO `menu` VALUES (384564356353884160, 'OTHERS', '0a9cbbbb4f130988', '2020-08-17 14:58:43', b'0', '2020-08-17 16:26:14', 2, 'setting', b'1', '', '2', '', 25, NULL, '系统设置', 1, NULL);
INSERT INTO `menu` VALUES (384564356458741760, 'OTHERS', '0a9cbbbb4f130988', '2020-08-17 14:58:43', b'0', '2020-08-17 17:02:25', 2, 'bars', b'1', '/pages/setting/menu', '22', '', 2, NULL, '菜单管理', 1, 384564356353884160);
INSERT INTO `menu` VALUES (384585685832564736, 'BROWSER', '0a9cbbbb4f130988', '2020-08-17 16:23:29', b'0', '2020-08-17 16:26:07', 2, 'safety-certificate', b'1', '', '3', '', 20, NULL, '权限管理', 1, NULL);
INSERT INTO `menu` VALUES (384586680859885568, 'BROWSER', '0a9cbbbb4f130988', '2020-08-17 16:27:26', b'0', '2020-08-17 18:27:42', 1, 'sound', b'1', '', '4', '', 30, NULL, '消息管理', 1, NULL);
INSERT INTO `menu` VALUES (384587773211836416, 'BROWSER', '0a9cbbbb4f130988', '2020-08-17 16:31:47', b'0', '2020-08-17 16:35:23', 1, 'bell', b'1', '', '5', '', 35, NULL, '站内通知', 1, NULL);
INSERT INTO `menu` VALUES (384589424232497152, 'BROWSER', '0a9cbbbb4f130988', '2020-08-17 16:38:20', b'0', '2020-08-17 17:06:01', 2, 'container', b'1', '', '6', '', 40, NULL, '日志管理', 1, NULL);
INSERT INTO `menu` VALUES (384590226917425152, 'BROWSER', '0a9cbbbb4f130988', '2020-08-17 16:41:32', b'0', '2020-08-17 17:53:28', 3, 'user', b'1', '/pages/setting/user', '31', '', 1, NULL, '用户管理', 1, 384585685832564736);
INSERT INTO `menu` VALUES (384590896739385344, 'BROWSER', '0a9cbbbb4f130988', '2020-08-17 16:44:11', b'0', '2020-08-17 17:53:53', 1, 'apartment', b'1', '/pages/setting/department', '32', '', 2, NULL, '部门管理', 1, 384585685832564736);
INSERT INTO `menu` VALUES (384591491382640640, 'BROWSER', '0a9cbbbb4f130988', '2020-08-17 16:46:33', b'0', '2020-08-17 16:59:48', 4, 'team', b'1', '/pages/setting/role', '33', '', 3, NULL, '角色管理', 1, 384585685832564736);
INSERT INTO `menu` VALUES (384595237055496192, 'BROWSER', '0a9cbbbb4f130988', '2020-08-17 17:01:26', b'0', '2020-08-17 17:53:01', 1, 'appstore', b'1', '/pages/setting/app', '23', '', 1, NULL, '应用管理', 1, 384564356353884160);
INSERT INTO `menu` VALUES (384596229272633344, 'BROWSER', '0a9cbbbb4f130988', '2020-08-17 17:05:23', b'0', '2020-08-17 17:15:50', 1, 'profile', b'1', '/pages/setting/parameter', '24', '', 3, NULL, '参数管理', 1, 384564356353884160);
INSERT INTO `menu` VALUES (384599971527131136, 'BROWSER', '0a9cbbbb4f130988', '2020-08-17 17:20:15', b'0', '2020-08-17 17:20:15', 0, 'book', b'1', '/pages/setting/dictionary', '25', NULL, 4, NULL, '字典管理', 1, 384564356353884160);
INSERT INTO `menu` VALUES (384600372414513152, 'BROWSER', '0a9cbbbb4f130988', '2020-08-17 17:21:51', b'0', '2020-08-17 17:21:51', 0, 'environment', b'1', '/pages/setting/zh-area', '26', NULL, 5, NULL, '行政区域', 1, 384564356353884160);
INSERT INTO `menu` VALUES (384601336034885632, 'BROWSER', '0a9cbbbb4f130988', '2020-08-17 17:25:40', b'0', '2020-08-17 17:25:40', 0, 'upload', b'1', '/pages/setting/file', '27', NULL, 6, NULL, '文件上传', 1, 384564356353884160);
INSERT INTO `menu` VALUES (384609205933309952, 'BROWSER', '0a9cbbbb4f130988', '2020-08-17 17:56:57', b'0', '2020-08-17 18:59:39', 1, 'message', b'1', '/pages/notify/sms', '41', '', 1, NULL, '短信服务', 1, 384586680859885568);
INSERT INTO `menu` VALUES (384613188773085184, 'BROWSER', '0a9cbbbb4f130988', '2020-08-17 18:12:46', b'0', '2020-08-17 18:12:46', 0, 'history', b'1', '/pages/notify/sms-record', '42', NULL, 2, NULL, '短信发送记录', 1, 384586680859885568);
INSERT INTO `menu` VALUES (384613517061259264, 'BROWSER', '0a9cbbbb4f130988', '2020-08-17 18:14:05', b'0', '2020-08-17 18:14:05', 0, 'mail', b'1', '/pages/notify/email', '43', NULL, 3, NULL, '邮件服务', 1, 384586680859885568);
INSERT INTO `menu` VALUES (384614544376332288, 'BROWSER', '0a9cbbbb4f130988', '2020-08-17 18:18:10', b'0', '2020-08-17 18:18:10', 0, 'hdd', b'1', '/pages/notify/email-record', '44', NULL, 4, NULL, '邮件发送记录', 1, 384586680859885568);
INSERT INTO `menu` VALUES (384617627336572928, 'BROWSER', '0a9cbbbb4f130988', '2020-08-17 18:30:25', b'0', '2020-08-17 18:30:25', 0, 'notification', b'1', '/pages/announcement/my', '51', NULL, 1, NULL, '我的通知', 1, 384587773211836416);
INSERT INTO `menu` VALUES (384619429138268160, 'BROWSER', '0a9cbbbb4f130988', '2020-08-17 18:37:34', b'0', '2020-08-17 18:37:34', 0, 'bell', b'1', '/pages/announcement/manage', '52', NULL, 2, NULL, '通知管理', 1, 384587773211836416);
INSERT INTO `menu` VALUES (384620989876535296, 'BROWSER', '0a9cbbbb4f130988', '2020-08-17 18:43:46', b'0', '2020-08-17 18:43:46', 0, 'file-done', b'1', '/pages/sys-log/login', '61', NULL, 1, NULL, '登录日志', 1, 384589424232497152);
INSERT INTO `menu` VALUES (384621330957336576, 'BROWSER', '0a9cbbbb4f130988', '2020-08-17 18:45:08', b'0', '2020-08-17 18:45:37', 1, 'solution', b'1', '/pages/sys-log/operation', '62', '', 2, NULL, '操作日志', 1, 384589424232497152);
INSERT INTO `menu` VALUES (384621781220065280, 'BROWSER', '0a9cbbbb4f130988', '2020-08-17 18:46:55', b'0', '2020-08-17 18:46:55', 0, 'exception', b'1', '/pages/sys-log/error', '63', NULL, 3, NULL, '异常日志', 1, 384589424232497152);
INSERT INTO `menu` VALUES (384622492808904704, 'BROWSER', '0a9cbbbb4f130988', '2020-08-17 18:49:45', b'0', '2020-08-17 18:49:45', 0, 'team', b'1', '', '7', NULL, 10, NULL, '客户管理', 1, NULL);
INSERT INTO `menu` VALUES (384623418722484224, 'BROWSER', '0a9cbbbb4f130988', '2020-08-17 18:53:26', b'0', '2020-08-17 18:53:26', 0, 'group', b'1', '/pages/customer/etp', '71', NULL, 1, NULL, '企业管理', 1, 384622492808904704);
INSERT INTO `menu` VALUES (384623800752275456, 'BROWSER', '0a9cbbbb4f130988', '2020-08-17 18:54:57', b'0', '2020-08-17 18:54:57', 0, 'user-add', b'1', '/pages/customer/account', '72', NULL, 2, NULL, '账号管理', 1, 384622492808904704);
INSERT INTO `menu` VALUES (387758497091026944, 'BROWSER', '2e5a0de806a58450', '2020-08-26 10:31:06', b'0', '2020-08-26 17:00:20', 2, 'team', b'1', '', '8', '', 2, NULL, '客户管理', 1, NULL);
INSERT INTO `menu` VALUES (387759034322649088, 'BROWSER', '2e5a0de806a58450', '2020-08-26 10:33:14', b'0', '2020-08-27 20:46:44', 3, 'setting', b'1', '', '9', '', 10, NULL, '系统设置', 1, NULL);
INSERT INTO `menu` VALUES (387759145178103808, 'BROWSER', '2e5a0de806a58450', '2020-08-26 10:33:40', b'0', '2020-12-24 16:02:18', 3, 'solution', b'1', '/pages/business/factor/customer/etp', '81', '', 1, NULL, '企业客户管理', 1, 387758497091026944);
INSERT INTO `menu` VALUES (387759210579886080, 'BROWSER', '2e5a0de806a58450', '2020-08-26 10:33:56', b'0', '2020-08-26 17:00:47', 2, 'user', b'1', '', '91', '', 1, NULL, '用户管理', 1, 387759034322649088);
INSERT INTO `menu` VALUES (387857677398573056, 'BROWSER', '2e5a0de806a58450', '2020-08-26 17:05:12', b'0', '2020-08-26 17:05:12', 0, 'control', b'1', NULL, '92', NULL, 3, NULL, '角色管理', 1, 387759034322649088);
INSERT INTO `menu` VALUES (387857825612693504, 'BROWSER', '2e5a0de806a58450', '2020-08-26 17:05:47', b'0', '2020-08-26 17:05:47', 0, 'apartment', b'1', NULL, '93', NULL, 2, NULL, '部门管理', 1, 387759034322649088);
INSERT INTO `menu` VALUES (387860778838917120, 'BROWSER', '2e5a0de806a58450', '2020-08-26 17:17:31', b'0', '2020-12-24 17:10:57', 1, 'user', b'1', '/pages/business/factor/customer/account', '82', '', 2, NULL, '企业账号管理', 1, 387758497091026944);
INSERT INTO `menu` VALUES (388184329198501888, 'BROWSER', '2e5a0de806a58450', '2020-08-27 14:43:12', b'0', '2020-08-27 14:43:12', 0, 'home', b'0', '/pages', '10', NULL, 1, NULL, '首页', 1, NULL);
INSERT INTO `menu` VALUES (388207116738887680, 'BROWSER', '2e5a0de806a58450', '2020-08-27 16:13:45', b'0', '2020-08-27 18:37:52', 1, 'profile', b'1', '', '11', '', 3, NULL, '产品管理', 1, NULL);
INSERT INTO `menu` VALUES (388207849974530048, 'BROWSER', '2e5a0de806a58450', '2020-08-27 16:16:40', b'0', '2020-12-24 17:57:20', 1, 'book', b'1', '/pages/business/factor/product-manage', '111', '', 1, NULL, '产品列表', 1, 388207116738887680);
INSERT INTO `menu` VALUES (388208396576227328, 'BROWSER', '2e5a0de806a58450', '2020-08-27 16:18:50', b'0', '2020-12-24 17:58:27', 1, 'audit', b'1', '/pages/business/factor/agreement-template', '112', '', 2, NULL, '协议模板管理', 1, 388207116738887680);
INSERT INTO `menu` VALUES (388222133173485568, 'BROWSER', '2e5a0de806a58450', '2020-08-27 17:13:25', b'0', '2020-08-27 18:38:15', 2, 'transaction', b'1', '', '12', '', 4, NULL, '融资协同', 1, NULL);
INSERT INTO `menu` VALUES (388222675786399744, 'BROWSER', '2e5a0de806a58450', '2020-08-27 17:15:34', b'0', '2020-12-24 17:03:17', 1, 'money-collect', b'1', '/pages/business/payment-bill', '121', '', 1, NULL, '付款单管理', 1, 388222133173485568);
INSERT INTO `menu` VALUES (388223384980291584, 'BROWSER', '2e5a0de806a58450', '2020-08-27 17:18:23', b'0', '2020-12-24 17:04:06', 1, 'wallet', b'1', '/pages/business/financing-bill', '122', '', 2, NULL, '融资单管理', 1, 388222133173485568);
INSERT INTO `menu` VALUES (388225348904419328, 'BROWSER', '2e5a0de806a58450', '2020-08-27 17:26:12', b'0', '2020-08-27 18:38:31', 1, 'account-book', b'1', '', '13', '', 5, NULL, '合同制作', 1, NULL);
INSERT INTO `menu` VALUES (388234665208578048, 'BROWSER', '2e5a0de806a58450', '2020-08-27 18:03:13', b'0', '2020-08-27 18:03:13', 0, 'file-zip', b'1', NULL, '131', NULL, 1, NULL, '融资打包', 1, 388225348904419328);
INSERT INTO `menu` VALUES (388235161403129856, 'BROWSER', '2e5a0de806a58450', '2020-08-27 18:05:11', b'0', '2020-08-27 18:05:11', 0, 'file-add', b'1', NULL, '132', NULL, 2, NULL, '第一次合同制作', 1, 388225348904419328);
INSERT INTO `menu` VALUES (388235322183385088, 'BROWSER', '2e5a0de806a58450', '2020-08-27 18:05:49', b'0', '2020-08-27 18:05:49', 0, 'file-add', b'1', NULL, '133', NULL, 3, NULL, '第二次合同制作', 1, 388225348904419328);
INSERT INTO `menu` VALUES (388244378004488192, 'BROWSER', '2e5a0de806a58450', '2020-08-27 18:41:49', b'0', '2020-08-27 19:14:04', 1, 'flag', b'1', '', '14', '', 7, NULL, '中登网登记', 1, NULL);
INSERT INTO `menu` VALUES (388252008999550976, 'BROWSER', '2e5a0de806a58450', '2020-08-27 19:12:08', b'0', '2020-08-27 19:12:08', 0, 'property-safety', b'1', NULL, '141', NULL, 1, NULL, '第一次转让登记', 1, 388244378004488192);
INSERT INTO `menu` VALUES (388252318161698816, 'BROWSER', '2e5a0de806a58450', '2020-08-27 19:13:22', b'0', '2020-08-27 19:13:22', 0, 'pay-circle', b'1', NULL, '142', NULL, 2, NULL, '第二次转让登记', 1, 388244378004488192);
INSERT INTO `menu` VALUES (388253552423731200, 'BROWSER', '2e5a0de806a58450', '2020-08-27 19:18:16', b'0', '2020-08-27 19:18:16', 0, 'audit', b'1', NULL, '15', NULL, 6, NULL, '签章管理', 1, NULL);
INSERT INTO `menu` VALUES (388261965702627328, 'BROWSER', '2e5a0de806a58450', '2020-08-27 19:51:42', b'0', '2020-08-27 19:51:42', 0, 'file-add', b'1', NULL, '151', NULL, 1, NULL, '待签章文件', 1, 388253552423731200);
INSERT INTO `menu` VALUES (388262068693762048, 'BROWSER', '2e5a0de806a58450', '2020-08-27 19:52:06', b'0', '2020-08-27 19:52:15', 1, 'file-done', b'1', '', '152', '', 2, NULL, '已签章文件', 1, 388253552423731200);
INSERT INTO `menu` VALUES (388265075040845824, 'BROWSER', '2e5a0de806a58450', '2020-08-27 20:04:03', b'0', '2020-08-27 20:04:03', 0, 'trademark', b'1', NULL, '153', NULL, 3, NULL, '签章任务列表', 1, 388253552423731200);
INSERT INTO `menu` VALUES (388276336621256704, 'BROWSER', '2e5a0de806a58450', '2020-08-27 20:48:48', b'0', '2020-08-27 20:48:48', 0, 'trademark-circle', b'1', NULL, '16', NULL, 8, NULL, '融后管理', 1, NULL);
INSERT INTO `menu` VALUES (388276792311414784, 'BROWSER', '2e5a0de806a58450', '2020-08-27 20:50:37', b'0', '2020-08-27 20:50:37', 0, 'pay-circle', b'1', NULL, '161', NULL, 1, NULL, '付款与核销', 1, 388276336621256704);
INSERT INTO `menu` VALUES (388277990322077696, 'BROWSER', '2e5a0de806a58450', '2020-08-27 20:55:22', b'0', '2020-08-27 20:55:22', 0, 'pound-circle', b'1', NULL, '162', NULL, 2, NULL, '基础资产台账', 1, 388276336621256704);
INSERT INTO `menu` VALUES (388278663776305152, 'BROWSER', '2e5a0de806a58450', '2020-08-27 20:58:03', b'0', '2020-08-27 20:58:16', 1, 'apartment', b'1', '', '17', '', 9, NULL, '企业中心', 1, NULL);
INSERT INTO `menu` VALUES (388278931347734528, 'BROWSER', '2e5a0de806a58450', '2020-08-27 20:59:07', b'0', '2020-08-27 20:59:07', 0, 'contacts', b'1', NULL, '171', NULL, 1, NULL, '企业信息', 1, 388278663776305152);
INSERT INTO `menu` VALUES (388279090085363712, 'BROWSER', '2e5a0de806a58450', '2020-08-27 20:59:45', b'0', '2020-08-27 20:59:58', 1, 'bank', b'1', '', '172', '', 2, NULL, '银行账户管理', 1, 388278663776305152);
INSERT INTO `menu` VALUES (405945198829371392, 'BROWSER', '0a9cbbbb4f130988', '2020-10-15 14:58:33', b'0', '2020-10-15 14:58:33', 0, NULL, b'1', NULL, '611', NULL, 1, NULL, '新增', 2, 384620989876535296);
INSERT INTO `menu` VALUES (410663893027782656, 'BROWSER', '0a9cbbbb4f130988', '2020-10-28 15:28:58', b'0', '2020-10-28 20:44:25', 2, 'book', b'1', '', '18', '', 50, NULL, '书籍管理', 1, NULL);
INSERT INTO `menu` VALUES (410664643070001152, 'BROWSER', '0a9cbbbb4f130988', '2020-10-28 15:31:56', b'0', '2020-10-30 14:02:35', 5, 'folder-add', b'1', '/pages/ebook/folder', '181', '', 2, NULL, '分类维护', 1, 410663893027782656);
INSERT INTO `menu` VALUES (410666932606337024, 'BROWSER', '0a9cbbbb4f130988', '2020-10-28 15:41:02', b'0', '2020-10-28 21:06:50', 6, 'folder-open', b'1', '/pages/ebook/list', '182', '', 1, NULL, '书籍列表', 1, 410663893027782656);

-- ----------------------------
-- Table structure for need_authorize_method
-- ----------------------------
DROP TABLE IF EXISTS `need_authorize_method`;
CREATE TABLE `need_authorize_method`  (
  `id` bigint(20) NOT NULL COMMENT '主键id',
  `client_device_type` varchar(80) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '数据来源终端',
  `client_id` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '应用程序唯一标志，分配给应用的appid',
  `date_created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '数据创建时间',
  `del` bit(1) NOT NULL DEFAULT b'0' COMMENT '数据是否有效，用作逻辑删除',
  `last_updated` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '数据最后更新时间',
  `version` int(11) NOT NULL DEFAULT 0 COMMENT '乐观锁',
  `url_path` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '接口名。(格式：/服务名/控制器名/方法名)',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `UK_f12djehmjf2oe4il16d7np0p`(`url_path`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '需要授权才能访问的接口。用于内部系统。' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of need_authorize_method
-- ----------------------------

-- ----------------------------
-- Table structure for permission
-- ----------------------------
DROP TABLE IF EXISTS `permission`;
CREATE TABLE `permission`  (
  `id` bigint(20) NOT NULL COMMENT '主键id',
  `client_device_type` varchar(80) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '数据来源终端',
  `client_id` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '应用程序唯一标志，分配给应用的appid',
  `date_created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '数据创建时间',
  `del` bit(1) NOT NULL DEFAULT b'0' COMMENT '数据是否有效，用作逻辑删除',
  `last_updated` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '数据最后更新时间',
  `version` int(11) NOT NULL DEFAULT 0 COMMENT '乐观锁',
  `description` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '权限用途描述',
  `operator_user_id` bigint(20) NOT NULL COMMENT '添加该权限用户',
  `permission_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '权限名称',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `UK_l3pmqryh8vgle52647itattb9`(`permission_name`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '权限表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of permission
-- ----------------------------
INSERT INTO `permission` VALUES (384564356714594304, 'OTHERS', '0a9cbbbb4f130988', '2020-08-17 14:58:44', b'0', '2020-08-17 14:58:44', 0, '表示所有接口权限', 384564355850567680, '**');

-- ----------------------------
-- Table structure for register_invitation_code
-- ----------------------------
DROP TABLE IF EXISTS `register_invitation_code`;
CREATE TABLE `register_invitation_code`  (
  `id` bigint(20) NOT NULL COMMENT '主键id',
  `client_device_type` varchar(80) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '数据来源终端',
  `client_id` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '应用程序唯一标志，分配给应用的appid',
  `date_created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '数据创建时间',
  `del` bit(1) NOT NULL DEFAULT b'0' COMMENT '数据是否有效，用作逻辑删除',
  `last_updated` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '数据最后更新时间',
  `version` int(11) NOT NULL DEFAULT 0 COMMENT '乐观锁',
  `enterprise_id` bigint(20) NOT NULL COMMENT '企业id',
  `invitation_code` varchar(80) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '邀请码(企业社会统一信用代码) ',
  `invitation_user_id` bigint(20) NOT NULL COMMENT '邀请人id',
  `use_state` bit(1) NOT NULL DEFAULT b'0' COMMENT '是否使用状态。0-未使用，1-已使用',
  `user_type` tinyint(1) NOT NULL DEFAULT 0 COMMENT '邀请注册用户类型',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `UK_r0vpxk2u94ci43iooobx4g6v3`(`invitation_code`) USING BTREE,
  UNIQUE INDEX `UK730e0a4ce00fv6y6608815pel`(`enterprise_id`, `user_type`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '企业注册邀请码。' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of register_invitation_code
-- ----------------------------
INSERT INTO `register_invitation_code` VALUES (387763042319859712, 'BROWSER', '0a9cbbbb4f130988', '2020-08-26 10:49:09', b'0', '2020-08-26 11:07:57', 1, 387763042156281856, '387763042349219840', 384564355850567680, b'1', 1);

-- ----------------------------
-- Table structure for role
-- ----------------------------
DROP TABLE IF EXISTS `role`;
CREATE TABLE `role`  (
  `id` bigint(20) NOT NULL COMMENT '主键id',
  `client_device_type` varchar(80) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '数据来源终端',
  `client_id` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '应用程序唯一标志，分配给应用的appid',
  `date_created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '数据创建时间',
  `del` bit(1) NOT NULL DEFAULT b'0' COMMENT '数据是否有效，用作逻辑删除',
  `last_updated` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '数据最后更新时间',
  `version` int(11) NOT NULL DEFAULT 0 COMMENT '乐观锁',
  `description` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '角色描述',
  `enterprise_id` bigint(20) NOT NULL COMMENT '所属企业',
  `operator_user_id` bigint(20) NOT NULL COMMENT '添加该角色用户',
  `role_name` varchar(150) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '角色名称',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `UKiwb2bhpxwbfly8j4yt76blmw0`(`role_name`, `enterprise_id`) USING BTREE,
  INDEX `IDXbgeqjb5opmijvwc14fbtaj4xx`(`role_name`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '角色表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of role
-- ----------------------------
INSERT INTO `role` VALUES (384564356127391744, 'OTHERS', '0a9cbbbb4f130988', '2020-08-17 14:58:43', b'0', '2020-08-17 14:58:43', 0, '系统自动创建', 384564355968008192, 384564355850567680, '超级管理员');
INSERT INTO `role` VALUES (384967779960225792, 'BROWSER', '0a9cbbbb4f130988', '2020-08-18 17:41:47', b'0', '2020-08-18 17:41:47', 0, '系统管理员', 384564355968008192, 384564355850567680, '管理员');
INSERT INTO `role` VALUES (387767669463449600, 'BROWSER', '2e5a0de806a58450', '2020-08-26 11:07:32', b'0', '2020-08-26 11:07:32', 0, '注册自动添加，系统管理员角色', 387763042156281856, 387767668792360960, '管理员');
INSERT INTO `role` VALUES (403878041270353921, 'BROWSER', '0a9cbbbb4f130988', '2020-10-09 22:04:24', b'0', '2020-10-09 22:04:24', 0, 'abc', 384564355968008192, 384564355850567680, '技术部');

-- ----------------------------
-- Table structure for role_department
-- ----------------------------
DROP TABLE IF EXISTS `role_department`;
CREATE TABLE `role_department`  (
  `id` bigint(20) NOT NULL COMMENT '主键id',
  `client_device_type` varchar(80) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '数据来源终端',
  `client_id` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '应用程序唯一标志，分配给应用的appid',
  `date_created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '数据创建时间',
  `del` bit(1) NOT NULL DEFAULT b'0' COMMENT '数据是否有效，用作逻辑删除',
  `last_updated` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '数据最后更新时间',
  `version` int(11) NOT NULL DEFAULT 0 COMMENT '乐观锁',
  `dept_id` bigint(20) NOT NULL COMMENT '部门',
  `operator_user_id` bigint(20) NOT NULL COMMENT '操作人',
  `role_id` bigint(20) NOT NULL COMMENT '角色',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `IDX40d31a6hr92gvv1idr6he3umx`(`role_id`) USING BTREE,
  INDEX `IDXqhbqr72muyv2yqffa5ya3pm0y`(`dept_id`) USING BTREE,
  INDEX `IDXjfl5hht48nttsl12gbu65kxop`(`operator_user_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '角色部门表，多对多关系' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of role_department
-- ----------------------------
INSERT INTO `role_department` VALUES (384987073767014400, 'BROWSER', '0a9cbbbb4f130988', '2020-08-18 18:58:27', b'0', '2020-08-18 18:58:27', 0, 384955178429710336, 384564355850567680, 384967779960225792);
INSERT INTO `role_department` VALUES (384987073796374528, 'BROWSER', '0a9cbbbb4f130988', '2020-08-18 18:58:27', b'0', '2020-08-18 18:58:27', 0, 384955055540797440, 384564355850567680, 384967779960225792);
INSERT INTO `role_department` VALUES (384987073825734656, 'BROWSER', '0a9cbbbb4f130988', '2020-08-18 18:58:27', b'0', '2020-08-18 18:58:27', 0, 384955468423888896, 384564355850567680, 384967779960225792);
INSERT INTO `role_department` VALUES (384987073855094784, 'BROWSER', '0a9cbbbb4f130988', '2020-08-18 18:58:27', b'0', '2020-08-18 18:58:27', 0, 384955559490617344, 384564355850567680, 384967779960225792);
INSERT INTO `role_department` VALUES (403878041920471040, 'BROWSER', '0a9cbbbb4f130988', '2020-10-09 22:04:25', b'0', '2020-10-09 22:04:25', 0, 384955178429710336, 384564355850567680, 403878041270353921);
INSERT INTO `role_department` VALUES (403878041949831168, 'BROWSER', '0a9cbbbb4f130988', '2020-10-09 22:04:25', b'0', '2020-10-09 22:04:25', 0, 384955055540797440, 384564355850567680, 403878041270353921);
INSERT INTO `role_department` VALUES (403878041979191296, 'BROWSER', '0a9cbbbb4f130988', '2020-10-09 22:04:25', b'0', '2020-10-09 22:04:25', 0, 384955468423888896, 384564355850567680, 403878041270353921);
INSERT INTO `role_department` VALUES (403878042004357120, 'BROWSER', '0a9cbbbb4f130988', '2020-10-09 22:04:25', b'0', '2020-10-09 22:04:25', 0, 384955559490617344, 384564355850567680, 403878041270353921);
INSERT INTO `role_department` VALUES (455645757911859200, 'BROWSER', '0a9cbbbb4f130988', '2021-03-01 18:30:49', b'0', '2021-03-01 18:30:49', 0, 384985785557843968, 384564355850567680, 384564356127391744);
INSERT INTO `role_department` VALUES (455645757920247808, 'BROWSER', '0a9cbbbb4f130988', '2021-03-01 18:30:49', b'0', '2021-03-01 18:30:49', 0, 384955055540797440, 384564355850567680, 384564356127391744);

-- ----------------------------
-- Table structure for role_menu
-- ----------------------------
DROP TABLE IF EXISTS `role_menu`;
CREATE TABLE `role_menu`  (
  `id` bigint(20) NOT NULL COMMENT '主键id',
  `client_device_type` varchar(80) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '数据来源终端',
  `client_id` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '应用程序唯一标志，分配给应用的appid',
  `date_created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '数据创建时间',
  `del` bit(1) NOT NULL DEFAULT b'0' COMMENT '数据是否有效，用作逻辑删除',
  `last_updated` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '数据最后更新时间',
  `version` int(11) NOT NULL DEFAULT 0 COMMENT '乐观锁',
  `menu_id` bigint(20) NOT NULL COMMENT '菜单',
  `operator_user_id` bigint(20) NOT NULL COMMENT '操作人',
  `role_id` bigint(20) NOT NULL COMMENT '角色',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `IDX6st33fi8ygdi9316ejbc33sky`(`role_id`) USING BTREE,
  INDEX `IDXhfpad1ibs80uw48y4q67j0wr2`(`operator_user_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '角色菜单表，多对多关系' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of role_menu
-- ----------------------------
INSERT INTO `role_menu` VALUES (384987073133674496, 'BROWSER', '0a9cbbbb4f130988', '2020-08-18 18:58:27', b'0', '2020-08-18 18:58:27', 0, 384622492808904704, 384564355850567680, 384967779960225792);
INSERT INTO `role_menu` VALUES (384987073184006144, 'BROWSER', '0a9cbbbb4f130988', '2020-08-18 18:58:27', b'0', '2020-08-18 18:58:27', 0, 384623418722484224, 384564355850567680, 384967779960225792);
INSERT INTO `role_menu` VALUES (384987073230143488, 'BROWSER', '0a9cbbbb4f130988', '2020-08-18 18:58:27', b'0', '2020-08-18 18:58:27', 0, 384623800752275456, 384564355850567680, 384967779960225792);
INSERT INTO `role_menu` VALUES (384987073276280832, 'BROWSER', '0a9cbbbb4f130988', '2020-08-18 18:58:27', b'0', '2020-08-18 18:58:27', 0, 384564356458741760, 384564355850567680, 384967779960225792);
INSERT INTO `role_menu` VALUES (384987073309835264, 'BROWSER', '0a9cbbbb4f130988', '2020-08-18 18:58:27', b'0', '2020-08-18 18:58:27', 0, 384564356353884160, 384564355850567680, 384967779960225792);
INSERT INTO `role_menu` VALUES (384987073339195392, 'BROWSER', '0a9cbbbb4f130988', '2020-08-18 18:58:27', b'0', '2020-08-18 18:58:27', 0, 384600372414513152, 384564355850567680, 384967779960225792);
INSERT INTO `role_menu` VALUES (384987073368555520, 'BROWSER', '0a9cbbbb4f130988', '2020-08-18 18:58:27', b'0', '2020-08-18 18:58:27', 0, 384601336034885632, 384564355850567680, 384967779960225792);
INSERT INTO `role_menu` VALUES (384987073397915648, 'BROWSER', '0a9cbbbb4f130988', '2020-08-18 18:58:27', b'0', '2020-08-18 18:58:27', 0, 384586680859885568, 384564355850567680, 384967779960225792);
INSERT INTO `role_menu` VALUES (384987073427275776, 'BROWSER', '0a9cbbbb4f130988', '2020-08-18 18:58:27', b'0', '2020-08-18 18:58:27', 0, 384609205933309952, 384564355850567680, 384967779960225792);
INSERT INTO `role_menu` VALUES (384987073452441600, 'BROWSER', '0a9cbbbb4f130988', '2020-08-18 18:58:27', b'0', '2020-08-18 18:58:27', 0, 384613188773085184, 384564355850567680, 384967779960225792);
INSERT INTO `role_menu` VALUES (384987073481801728, 'BROWSER', '0a9cbbbb4f130988', '2020-08-18 18:58:27', b'0', '2020-08-18 18:58:27', 0, 384613517061259264, 384564355850567680, 384967779960225792);
INSERT INTO `role_menu` VALUES (384987073511161856, 'BROWSER', '0a9cbbbb4f130988', '2020-08-18 18:58:27', b'0', '2020-08-18 18:58:27', 0, 384614544376332288, 384564355850567680, 384967779960225792);
INSERT INTO `role_menu` VALUES (384987073540521984, 'BROWSER', '0a9cbbbb4f130988', '2020-08-18 18:58:27', b'0', '2020-08-18 18:58:27', 0, 384587773211836416, 384564355850567680, 384967779960225792);
INSERT INTO `role_menu` VALUES (384987073569882112, 'BROWSER', '0a9cbbbb4f130988', '2020-08-18 18:58:27', b'0', '2020-08-18 18:58:27', 0, 384617627336572928, 384564355850567680, 384967779960225792);
INSERT INTO `role_menu` VALUES (384987073599242240, 'BROWSER', '0a9cbbbb4f130988', '2020-08-18 18:58:27', b'0', '2020-08-18 18:58:27', 0, 384619429138268160, 384564355850567680, 384967779960225792);
INSERT INTO `role_menu` VALUES (384987073628602368, 'BROWSER', '0a9cbbbb4f130988', '2020-08-18 18:58:27', b'0', '2020-08-18 18:58:27', 0, 384585685832564736, 384564355850567680, 384967779960225792);
INSERT INTO `role_menu` VALUES (384987073657962496, 'BROWSER', '0a9cbbbb4f130988', '2020-08-18 18:58:27', b'0', '2020-08-18 18:58:27', 0, 384590226917425152, 384564355850567680, 384967779960225792);
INSERT INTO `role_menu` VALUES (384987073687322624, 'BROWSER', '0a9cbbbb4f130988', '2020-08-18 18:58:27', b'0', '2020-08-18 18:58:27', 0, 384590896739385344, 384564355850567680, 384967779960225792);
INSERT INTO `role_menu` VALUES (384987073716682752, 'BROWSER', '0a9cbbbb4f130988', '2020-08-18 18:58:27', b'0', '2020-08-18 18:58:27', 0, 384591491382640640, 384564355850567680, 384967779960225792);
INSERT INTO `role_menu` VALUES (388279247136882688, 'BROWSER', '2e5a0de806a58450', '2020-08-27 21:00:22', b'0', '2020-08-27 21:00:22', 0, 388184329198501888, 384564355850567680, 387767669463449600);
INSERT INTO `role_menu` VALUES (388279247170437120, 'BROWSER', '2e5a0de806a58450', '2020-08-27 21:00:22', b'0', '2020-08-27 21:00:22', 0, 387758497091026944, 384564355850567680, 387767669463449600);
INSERT INTO `role_menu` VALUES (388279247195602944, 'BROWSER', '2e5a0de806a58450', '2020-08-27 21:00:22', b'0', '2020-08-27 21:00:22', 0, 387759145178103808, 384564355850567680, 387767669463449600);
INSERT INTO `role_menu` VALUES (388279247224963072, 'BROWSER', '2e5a0de806a58450', '2020-08-27 21:00:22', b'0', '2020-08-27 21:00:22', 0, 387860778838917120, 384564355850567680, 387767669463449600);
INSERT INTO `role_menu` VALUES (388279247254323200, 'BROWSER', '2e5a0de806a58450', '2020-08-27 21:00:22', b'0', '2020-08-27 21:00:22', 0, 388207116738887680, 384564355850567680, 387767669463449600);
INSERT INTO `role_menu` VALUES (388279247283683328, 'BROWSER', '2e5a0de806a58450', '2020-08-27 21:00:22', b'0', '2020-08-27 21:00:22', 0, 388207849974530048, 384564355850567680, 387767669463449600);
INSERT INTO `role_menu` VALUES (388279247308849152, 'BROWSER', '2e5a0de806a58450', '2020-08-27 21:00:22', b'0', '2020-08-27 21:00:22', 0, 388208396576227328, 384564355850567680, 387767669463449600);
INSERT INTO `role_menu` VALUES (388279247342403584, 'BROWSER', '2e5a0de806a58450', '2020-08-27 21:00:22', b'0', '2020-08-27 21:00:22', 0, 388222133173485568, 384564355850567680, 387767669463449600);
INSERT INTO `role_menu` VALUES (388279247371763712, 'BROWSER', '2e5a0de806a58450', '2020-08-27 21:00:22', b'0', '2020-08-27 21:00:22', 0, 388222675786399744, 384564355850567680, 387767669463449600);
INSERT INTO `role_menu` VALUES (388279247396929536, 'BROWSER', '2e5a0de806a58450', '2020-08-27 21:00:22', b'0', '2020-08-27 21:00:22', 0, 388223384980291584, 384564355850567680, 387767669463449600);
INSERT INTO `role_menu` VALUES (388279247426289664, 'BROWSER', '2e5a0de806a58450', '2020-08-27 21:00:22', b'0', '2020-08-27 21:00:22', 0, 388225348904419328, 384564355850567680, 387767669463449600);
INSERT INTO `role_menu` VALUES (388279247455649792, 'BROWSER', '2e5a0de806a58450', '2020-08-27 21:00:22', b'0', '2020-08-27 21:00:22', 0, 388234665208578048, 384564355850567680, 387767669463449600);
INSERT INTO `role_menu` VALUES (388279247480815616, 'BROWSER', '2e5a0de806a58450', '2020-08-27 21:00:22', b'0', '2020-08-27 21:00:22', 0, 388235161403129856, 384564355850567680, 387767669463449600);
INSERT INTO `role_menu` VALUES (388279247505981440, 'BROWSER', '2e5a0de806a58450', '2020-08-27 21:00:22', b'0', '2020-08-27 21:00:22', 0, 388235322183385088, 384564355850567680, 387767669463449600);
INSERT INTO `role_menu` VALUES (388279247535341568, 'BROWSER', '2e5a0de806a58450', '2020-08-27 21:00:22', b'0', '2020-08-27 21:00:22', 0, 388253552423731200, 384564355850567680, 387767669463449600);
INSERT INTO `role_menu` VALUES (388279247560507392, 'BROWSER', '2e5a0de806a58450', '2020-08-27 21:00:22', b'0', '2020-08-27 21:00:22', 0, 388261965702627328, 384564355850567680, 387767669463449600);
INSERT INTO `role_menu` VALUES (388279247589867520, 'BROWSER', '2e5a0de806a58450', '2020-08-27 21:00:22', b'0', '2020-08-27 21:00:22', 0, 388262068693762048, 384564355850567680, 387767669463449600);
INSERT INTO `role_menu` VALUES (388279247619227648, 'BROWSER', '2e5a0de806a58450', '2020-08-27 21:00:22', b'0', '2020-08-27 21:00:22', 0, 388265075040845824, 384564355850567680, 387767669463449600);
INSERT INTO `role_menu` VALUES (388279247644393472, 'BROWSER', '2e5a0de806a58450', '2020-08-27 21:00:22', b'0', '2020-08-27 21:00:22', 0, 388244378004488192, 384564355850567680, 387767669463449600);
INSERT INTO `role_menu` VALUES (388279247669559296, 'BROWSER', '2e5a0de806a58450', '2020-08-27 21:00:22', b'0', '2020-08-27 21:00:22', 0, 388252008999550976, 384564355850567680, 387767669463449600);
INSERT INTO `role_menu` VALUES (388279247694725120, 'BROWSER', '2e5a0de806a58450', '2020-08-27 21:00:22', b'0', '2020-08-27 21:00:22', 0, 388252318161698816, 384564355850567680, 387767669463449600);
INSERT INTO `role_menu` VALUES (388279247719890944, 'BROWSER', '2e5a0de806a58450', '2020-08-27 21:00:22', b'0', '2020-08-27 21:00:22', 0, 388276336621256704, 384564355850567680, 387767669463449600);
INSERT INTO `role_menu` VALUES (388279247749251072, 'BROWSER', '2e5a0de806a58450', '2020-08-27 21:00:22', b'0', '2020-08-27 21:00:22', 0, 388276792311414784, 384564355850567680, 387767669463449600);
INSERT INTO `role_menu` VALUES (388279247778611200, 'BROWSER', '2e5a0de806a58450', '2020-08-27 21:00:22', b'0', '2020-08-27 21:00:22', 0, 388277990322077696, 384564355850567680, 387767669463449600);
INSERT INTO `role_menu` VALUES (388279247803777024, 'BROWSER', '2e5a0de806a58450', '2020-08-27 21:00:22', b'0', '2020-08-27 21:00:22', 0, 387759034322649088, 384564355850567680, 387767669463449600);
INSERT INTO `role_menu` VALUES (388279247828942848, 'BROWSER', '2e5a0de806a58450', '2020-08-27 21:00:22', b'0', '2020-08-27 21:00:22', 0, 387759210579886080, 384564355850567680, 387767669463449600);
INSERT INTO `role_menu` VALUES (388279247854108672, 'BROWSER', '2e5a0de806a58450', '2020-08-27 21:00:22', b'0', '2020-08-27 21:00:22', 0, 387857825612693504, 384564355850567680, 387767669463449600);
INSERT INTO `role_menu` VALUES (388279247879274496, 'BROWSER', '2e5a0de806a58450', '2020-08-27 21:00:22', b'0', '2020-08-27 21:00:22', 0, 387857677398573056, 384564355850567680, 387767669463449600);
INSERT INTO `role_menu` VALUES (388279247908634624, 'BROWSER', '2e5a0de806a58450', '2020-08-27 21:00:22', b'0', '2020-08-27 21:00:22', 0, 388278663776305152, 384564355850567680, 387767669463449600);
INSERT INTO `role_menu` VALUES (388279247933800448, 'BROWSER', '2e5a0de806a58450', '2020-08-27 21:00:22', b'0', '2020-08-27 21:00:22', 0, 388278931347734528, 384564355850567680, 387767669463449600);
INSERT INTO `role_menu` VALUES (388279247954771968, 'BROWSER', '2e5a0de806a58450', '2020-08-27 21:00:22', b'0', '2020-08-27 21:00:22', 0, 388279090085363712, 384564355850567680, 387767669463449600);
INSERT INTO `role_menu` VALUES (403878041794641920, 'BROWSER', '0a9cbbbb4f130988', '2020-10-09 22:04:24', b'0', '2020-10-09 22:04:24', 0, 384622492808904704, 384564355850567680, 403878041270353921);
INSERT INTO `role_menu` VALUES (403878041832390656, 'BROWSER', '0a9cbbbb4f130988', '2020-10-09 22:04:24', b'0', '2020-10-09 22:04:24', 0, 384623418722484224, 384564355850567680, 403878041270353921);
INSERT INTO `role_menu` VALUES (403878041865945088, 'BROWSER', '0a9cbbbb4f130988', '2020-10-09 22:04:24', b'0', '2020-10-09 22:04:24', 0, 384623800752275456, 384564355850567680, 403878041270353921);
INSERT INTO `role_menu` VALUES (455645757354016768, 'BROWSER', '0a9cbbbb4f130988', '2021-03-01 18:30:49', b'0', '2021-03-01 18:30:49', 0, 384564356282580992, 384564355850567680, 384564356127391744);
INSERT INTO `role_menu` VALUES (455645757421125632, 'BROWSER', '0a9cbbbb4f130988', '2021-03-01 18:30:49', b'0', '2021-03-01 18:30:49', 0, 384622492808904704, 384564355850567680, 384564356127391744);
INSERT INTO `role_menu` VALUES (455645757442097152, 'BROWSER', '0a9cbbbb4f130988', '2021-03-01 18:30:49', b'0', '2021-03-01 18:30:49', 0, 384623418722484224, 384564355850567680, 384564356127391744);
INSERT INTO `role_menu` VALUES (455645757463068672, 'BROWSER', '0a9cbbbb4f130988', '2021-03-01 18:30:49', b'0', '2021-03-01 18:30:49', 0, 384623800752275456, 384564355850567680, 384564356127391744);
INSERT INTO `role_menu` VALUES (455645757479845888, 'BROWSER', '0a9cbbbb4f130988', '2021-03-01 18:30:49', b'0', '2021-03-01 18:30:49', 0, 384585685832564736, 384564355850567680, 384564356127391744);
INSERT INTO `role_menu` VALUES (455645757496623104, 'BROWSER', '0a9cbbbb4f130988', '2021-03-01 18:30:49', b'0', '2021-03-01 18:30:49', 0, 384590226917425152, 384564355850567680, 384564356127391744);
INSERT INTO `role_menu` VALUES (455645757513400320, 'BROWSER', '0a9cbbbb4f130988', '2021-03-01 18:30:49', b'0', '2021-03-01 18:30:49', 0, 384590896739385344, 384564355850567680, 384564356127391744);
INSERT INTO `role_menu` VALUES (455645757530177536, 'BROWSER', '0a9cbbbb4f130988', '2021-03-01 18:30:49', b'0', '2021-03-01 18:30:49', 0, 384591491382640640, 384564355850567680, 384564356127391744);
INSERT INTO `role_menu` VALUES (455645757546954752, 'BROWSER', '0a9cbbbb4f130988', '2021-03-01 18:30:49', b'0', '2021-03-01 18:30:49', 0, 384564356353884160, 384564355850567680, 384564356127391744);
INSERT INTO `role_menu` VALUES (455645757576314880, 'BROWSER', '0a9cbbbb4f130988', '2021-03-01 18:30:49', b'0', '2021-03-01 18:30:49', 0, 384595237055496192, 384564355850567680, 384564356127391744);
INSERT INTO `role_menu` VALUES (455645757597286400, 'BROWSER', '0a9cbbbb4f130988', '2021-03-01 18:30:49', b'0', '2021-03-01 18:30:49', 0, 384564356458741760, 384564355850567680, 384564356127391744);
INSERT INTO `role_menu` VALUES (455645757609869312, 'BROWSER', '0a9cbbbb4f130988', '2021-03-01 18:30:49', b'0', '2021-03-01 18:30:49', 0, 384596229272633344, 384564355850567680, 384564356127391744);
INSERT INTO `role_menu` VALUES (455645757626646528, 'BROWSER', '0a9cbbbb4f130988', '2021-03-01 18:30:49', b'0', '2021-03-01 18:30:49', 0, 384599971527131136, 384564355850567680, 384564356127391744);
INSERT INTO `role_menu` VALUES (455645757639229440, 'BROWSER', '0a9cbbbb4f130988', '2021-03-01 18:30:49', b'0', '2021-03-01 18:30:49', 0, 384600372414513152, 384564355850567680, 384564356127391744);
INSERT INTO `role_menu` VALUES (455645757651812352, 'BROWSER', '0a9cbbbb4f130988', '2021-03-01 18:30:49', b'0', '2021-03-01 18:30:49', 0, 384601336034885632, 384564355850567680, 384564356127391744);
INSERT INTO `role_menu` VALUES (455645757668589568, 'BROWSER', '0a9cbbbb4f130988', '2021-03-01 18:30:49', b'0', '2021-03-01 18:30:49', 0, 384586680859885568, 384564355850567680, 384564356127391744);
INSERT INTO `role_menu` VALUES (455645757681172480, 'BROWSER', '0a9cbbbb4f130988', '2021-03-01 18:30:49', b'0', '2021-03-01 18:30:49', 0, 384609205933309952, 384564355850567680, 384564356127391744);
INSERT INTO `role_menu` VALUES (455645757693755392, 'BROWSER', '0a9cbbbb4f130988', '2021-03-01 18:30:49', b'0', '2021-03-01 18:30:49', 0, 384613188773085184, 384564355850567680, 384564356127391744);
INSERT INTO `role_menu` VALUES (455645757706338304, 'BROWSER', '0a9cbbbb4f130988', '2021-03-01 18:30:49', b'0', '2021-03-01 18:30:49', 0, 384613517061259264, 384564355850567680, 384564356127391744);
INSERT INTO `role_menu` VALUES (455645757727309824, 'BROWSER', '0a9cbbbb4f130988', '2021-03-01 18:30:49', b'0', '2021-03-01 18:30:49', 0, 384614544376332288, 384564355850567680, 384564356127391744);
INSERT INTO `role_menu` VALUES (455645757739892736, 'BROWSER', '0a9cbbbb4f130988', '2021-03-01 18:30:49', b'0', '2021-03-01 18:30:49', 0, 384587773211836416, 384564355850567680, 384564356127391744);
INSERT INTO `role_menu` VALUES (455645757752475648, 'BROWSER', '0a9cbbbb4f130988', '2021-03-01 18:30:49', b'0', '2021-03-01 18:30:49', 0, 384617627336572928, 384564355850567680, 384564356127391744);
INSERT INTO `role_menu` VALUES (455645757765058560, 'BROWSER', '0a9cbbbb4f130988', '2021-03-01 18:30:49', b'0', '2021-03-01 18:30:49', 0, 384619429138268160, 384564355850567680, 384564356127391744);
INSERT INTO `role_menu` VALUES (455645757777641472, 'BROWSER', '0a9cbbbb4f130988', '2021-03-01 18:30:49', b'0', '2021-03-01 18:30:49', 0, 410663893027782656, 384564355850567680, 384564356127391744);
INSERT INTO `role_menu` VALUES (455645757790224384, 'BROWSER', '0a9cbbbb4f130988', '2021-03-01 18:30:49', b'0', '2021-03-01 18:30:49', 0, 410666932606337024, 384564355850567680, 384564356127391744);
INSERT INTO `role_menu` VALUES (455645757798612992, 'BROWSER', '0a9cbbbb4f130988', '2021-03-01 18:30:49', b'0', '2021-03-01 18:30:49', 0, 410664643070001152, 384564355850567680, 384564356127391744);
INSERT INTO `role_menu` VALUES (455645757807001600, 'BROWSER', '0a9cbbbb4f130988', '2021-03-01 18:30:49', b'0', '2021-03-01 18:30:49', 0, 384589424232497152, 384564355850567680, 384564356127391744);
INSERT INTO `role_menu` VALUES (455645757819584512, 'BROWSER', '0a9cbbbb4f130988', '2021-03-01 18:30:49', b'0', '2021-03-01 18:30:49', 0, 384620989876535296, 384564355850567680, 384564356127391744);
INSERT INTO `role_menu` VALUES (455645757832167424, 'BROWSER', '0a9cbbbb4f130988', '2021-03-01 18:30:49', b'0', '2021-03-01 18:30:49', 0, 405945198829371392, 384564355850567680, 384564356127391744);
INSERT INTO `role_menu` VALUES (455645757840556032, 'BROWSER', '0a9cbbbb4f130988', '2021-03-01 18:30:49', b'0', '2021-03-01 18:30:49', 0, 384621330957336576, 384564355850567680, 384564356127391744);
INSERT INTO `role_menu` VALUES (455645757853138944, 'BROWSER', '0a9cbbbb4f130988', '2021-03-01 18:30:49', b'0', '2021-03-01 18:30:49', 0, 384621781220065280, 384564355850567680, 384564356127391744);

-- ----------------------------
-- Table structure for role_permission
-- ----------------------------
DROP TABLE IF EXISTS `role_permission`;
CREATE TABLE `role_permission`  (
  `id` bigint(20) NOT NULL COMMENT '主键id',
  `client_device_type` varchar(80) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '数据来源终端',
  `client_id` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '应用程序唯一标志，分配给应用的appid',
  `date_created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '数据创建时间',
  `del` bit(1) NOT NULL DEFAULT b'0' COMMENT '数据是否有效，用作逻辑删除',
  `last_updated` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '数据最后更新时间',
  `version` int(11) NOT NULL DEFAULT 0 COMMENT '乐观锁',
  `operator_user_id` bigint(20) NOT NULL COMMENT '添加该权限用户',
  `permission_id` bigint(20) NOT NULL COMMENT '权限信息',
  `role_id` bigint(20) NOT NULL COMMENT '角色信息',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `UK3jsmum8pugug90p09061rnm1c`(`role_id`, `permission_id`) USING BTREE,
  INDEX `IDXfv36v7t1j8wkyv2hf9qlt9pdq`(`role_id`) USING BTREE,
  INDEX `IDXr9n3d4e7gtp6tyu35re8a848d`(`permission_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '角色权限表，多对多关系' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of role_permission
-- ----------------------------
INSERT INTO `role_permission` VALUES (384564356790091776, 'OTHERS', '0a9cbbbb4f130988', '2020-08-17 14:58:44', b'0', '2020-08-17 14:58:44', 0, 384564355850567680, 384564356714594304, 384564356127391744);

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user`  (
  `id` bigint(20) NOT NULL COMMENT '主键id',
  `client_device_type` varchar(80) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '数据来源终端',
  `client_id` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '应用程序唯一标志，分配给应用的appid',
  `date_created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '数据创建时间',
  `del` bit(1) NOT NULL DEFAULT b'0' COMMENT '数据是否有效，用作逻辑删除',
  `last_updated` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '数据最后更新时间',
  `version` int(11) NOT NULL DEFAULT 0 COMMENT '乐观锁',
  `password` varchar(150) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '用户密码',
  `username` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '注册用户名',
  `parent_id` bigint(20) NULL DEFAULT NULL COMMENT '主键id',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `UKsb8bbouer5wak8vyiiy4pf2bx`(`username`) USING BTREE,
  INDEX `FK4k8a1qa0wofm01aijepmu0d4g`(`parent_id`) USING BTREE,
  CONSTRAINT `FK4k8a1qa0wofm01aijepmu0d4g` FOREIGN KEY (`parent_id`) REFERENCES `user` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '用户表。' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES (384564355850567680, 'OTHERS', '0a9cbbbb4f130988', '2020-08-17 14:58:43', b'0', '2021-02-16 22:53:20', 1, '5e041ea957461bdbba889e29bfd18e78', 'admin', NULL);
INSERT INTO `user` VALUES (384976096988233728, 'BROWSER', '0a9cbbbb4f130988', '2020-08-18 18:14:50', b'0', '2021-02-14 20:12:36', 2, '7501ea9d4c4126d1ab1e1bf0575dbd5e', 'xinxiamu', 384564355850567680);
INSERT INTO `user` VALUES (387767668792360960, 'BROWSER', '2e5a0de806a58450', '2020-08-26 11:07:32', b'0', '2020-08-26 11:07:32', 0, 'b834737958f970b31403e957d7ad7add', 'blis01', NULL);

-- ----------------------------
-- Table structure for user_app
-- ----------------------------
DROP TABLE IF EXISTS `user_app`;
CREATE TABLE `user_app`  (
  `id` bigint(20) NOT NULL COMMENT '主键id',
  `client_device_type` varchar(80) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '数据来源终端',
  `client_id` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '应用程序唯一标志，分配给应用的appid',
  `date_created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '数据创建时间',
  `del` bit(1) NOT NULL DEFAULT b'0' COMMENT '数据是否有效，用作逻辑删除',
  `last_updated` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '数据最后更新时间',
  `version` int(11) NOT NULL DEFAULT 0 COMMENT '乐观锁',
  `app_info_id` bigint(20) NULL DEFAULT NULL COMMENT '应用程序id',
  `user_id` bigint(20) NULL DEFAULT NULL COMMENT '用户id',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `IDXle4o7r5fbhn5t1vpyyh8ctdjr`(`user_id`) USING BTREE,
  INDEX `IDXq1jm6p55gw04ql6jh7io145ix`(`app_info_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '用户申请的app，一个用户可以申请多个app' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of user_app
-- ----------------------------

-- ----------------------------
-- Table structure for user_category
-- ----------------------------
DROP TABLE IF EXISTS `user_category`;
CREATE TABLE `user_category`  (
  `id` bigint(20) NOT NULL COMMENT '主键id',
  `client_device_type` varchar(80) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '数据来源终端',
  `client_id` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '应用程序唯一标志，分配给应用的appid',
  `date_created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '数据创建时间',
  `del` bit(1) NOT NULL DEFAULT b'0' COMMENT '数据是否有效，用作逻辑删除',
  `last_updated` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '数据最后更新时间',
  `version` int(11) NOT NULL DEFAULT 0 COMMENT '乐观锁',
  `user_id` bigint(20) NOT NULL COMMENT '用户id',
  `user_type` tinyint(1) NOT NULL DEFAULT 0 COMMENT '用户类型',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `IDXf05838xgqm2k03ewv2ce11y69`(`user_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '用户注册类别。' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of user_category
-- ----------------------------

-- ----------------------------
-- Table structure for user_check_result
-- ----------------------------
DROP TABLE IF EXISTS `user_check_result`;
CREATE TABLE `user_check_result`  (
  `id` bigint(20) NOT NULL COMMENT '主键id',
  `client_device_type` varchar(80) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '数据来源终端',
  `client_id` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '应用程序唯一标志，分配给应用的appid',
  `date_created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '数据创建时间',
  `del` bit(1) NOT NULL DEFAULT b'0' COMMENT '数据是否有效，用作逻辑删除',
  `last_updated` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '数据最后更新时间',
  `version` int(11) NOT NULL DEFAULT 0 COMMENT '乐观锁',
  `check_result` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '审核结果信息',
  `check_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '审核时间',
  `check_user` bigint(20) NOT NULL COMMENT '操作人userId',
  `state` tinyint(1) NOT NULL COMMENT '0-不通过,1-通过',
  `user_id` bigint(20) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '企业审核实名认证结果记录' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of user_check_result
-- ----------------------------
INSERT INTO `user_check_result` VALUES (431264422808256512, 'BROWSER', '0a9cbbbb4f130988', '2020-12-24 11:48:08', b'0', '2020-12-24 11:48:08', 0, '用户实名认证成功', '2020-12-24 11:48:07', 384564355850567680, 1, 387767668792360960);

-- ----------------------------
-- Table structure for user_detail
-- ----------------------------
DROP TABLE IF EXISTS `user_detail`;
CREATE TABLE `user_detail`  (
  `id` bigint(20) NOT NULL COMMENT '主键id',
  `client_device_type` varchar(80) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '数据来源终端',
  `client_id` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '应用程序唯一标志，分配给应用的appid',
  `date_created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '数据创建时间',
  `del` bit(1) NOT NULL DEFAULT b'0' COMMENT '数据是否有效，用作逻辑删除',
  `last_updated` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '数据最后更新时间',
  `version` int(11) NOT NULL DEFAULT 0 COMMENT '乐观锁',
  `account_id` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '个人认证唯一证书信息，用来生成印章',
  `dept_id` bigint(20) NULL DEFAULT NULL COMMENT '部门信息,多对一',
  `email` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '电子邮箱',
  `enterprise_id` bigint(20) NULL DEFAULT NULL COMMENT '企业信息,多对一',
  `mobile` varchar(11) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '手机号码',
  `real_name` varchar(80) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '用户真实姓名',
  `sex_type` tinyint(1) NOT NULL DEFAULT 0 COMMENT '用户性别',
  `status` tinyint(1) NOT NULL DEFAULT 0 COMMENT '用户状态：0-待审核，1-审核通过/待实名认证，2-审核不通过，3-已实名认证(实名认证失败回到审核通过)，4-已禁用，5-黑名单',
  `user_id` bigint(20) NOT NULL COMMENT '主用户信息，一对一',
  `user_seal` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL COMMENT '个人印章图片base64',
  `id_no` varchar(18) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '身份证号码',
  `id_no_file_id` bigint(20) NULL DEFAULT NULL COMMENT '身份证正反面图片文件id',
  `power_of_attorney_file_id` bigint(20) NULL DEFAULT NULL COMMENT '授权书文件id',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `UK_irpjde408yqyneoi2c56apfak`(`mobile`) USING BTREE,
  UNIQUE INDEX `UK_dm7hrxg9mvrb92v1p3o6wg97u`(`user_id`) USING BTREE,
  UNIQUE INDEX `UK_ittml5ugvcjg6uo2rsqg026hx`(`account_id`) USING BTREE,
  UNIQUE INDEX `UK_14ntedgqfrf06v2g45tgq4hbp`(`id_no`) USING BTREE,
  INDEX `IDXaquj1ngainv310ii0sp6li8wu`(`enterprise_id`) USING BTREE,
  INDEX `IDXna1vy00unv6uq6pchbtf9fd7g`(`user_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '用户详情表。' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of user_detail
-- ----------------------------
INSERT INTO `user_detail` VALUES (384564356047699968, 'OTHERS', '0a9cbbbb4f130988', '2020-08-17 14:58:43', b'0', '2020-08-18 18:43:29', 9, NULL, 384955055540797440, '1979597540@qq.com', 384564355968008192, '13888888888', '超级管理员', 0, 3, 384564355850567680, NULL, NULL, NULL, NULL);
INSERT INTO `user_detail` VALUES (384976097080508416, 'BROWSER', '0a9cbbbb4f130988', '2020-08-18 18:14:50', b'0', '2020-12-23 13:28:05', 14, NULL, 384955178429710336, '932852117@qq.com', 384564355968008192, '13543495276', '张木天', 1, 3, 384976096988233728, NULL, NULL, NULL, NULL);
INSERT INTO `user_detail` VALUES (387767669262123008, 'BROWSER', '2e5a0de806a58450', '2020-08-26 11:07:32', b'0', '2020-12-24 11:48:08', 7, '1E96420A3EE84BF0A5B3F1DE689BEBBF', NULL, '932852117@qq.com', 387763042156281856, '13543495275', '张木天', 0, 3, 387767668792360960, 'iVBORw0KGgoAAAANSUhEUgAAAX4AAAF+CAMAAACyBIHOAAADAFBMVEX/////AAAAAP8AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAABLakbNAAAAAXRSTlMAQObYZgAABT9JREFUeNrt3du2oygQANCU8f9/ueayutd0TzRRoVDTez+dh0SwKBARcx4PAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAACgUQwuKoX8nPD/KEn8fzV9YTcTfraZvyX5Y9DQ9vNEUva/RqW6lSP65tP0VdEvjn90P/p8VqDyvk38DZfeKDpY3CbzB4b/9tPOlxPIO8XltZgsO3reJvgnjP13HPpjUOJ8Q/J3b9ooPPpcFOwcF/3bpn5B+H9WNnJYD4vbBr/7zCfe/nXPkf+/Wvev9lydiPeeckZxykxV0c9R0Y8hfSprDv6sTf6oH66jtqNFabs+S5M/Ro4PecPnadMJuV9+sf8jw/8ytTknHvlnhj++a84zxlwS/VyPfsZ9kr9+a0zZgnOcMxx0LOvHCn/cIftjY/R7J3/lethiSXmp8MfSSJO/Rz+GDT1l66i/zq96FjK11/HvTro194u3umVx5l9t7P98U1s87t99dhUFX874MAXKktpnTWCy8gIzFzRdDMr98ke8N5r377j3LdkkkMNGiLxG+GNT9AcNmll1/Cy9vpTvdChJ/tEvhZQ19Fyb/CUPGk+d7vTtZtNN6vmd0a8bfNaWnLMk+DmoiXuXMxflYFH0T77N6t6j5zvl/tn3uFffaPKpntk1+Dm4PQquZn3Cn0s3oFEa/dKb3Bg1l5gL0qIk+r818bBNRNXN/eyQILm09DVgW20MTP6izjZ1z4ZhO3y+IPoNt125XLX7/2jAQr8tO6lnaz3zsfR4ZUACxbjo1zV1y6U3HyNr+i5KedPod5n5xCVGiLLjRmEL9F1yy1G9oCj6sbK8HHGL8A+fNw8b9osaYCrKxCwNeYxJ/X9OIEvLnKsyPDdHMC8S/bUcWnpb8DrZH62Ztrtfx5jUfx2Arj3259aY/f9cz98stW2NLa4X/tj/wehU4qiredbFfx6bYR222G56W29vy+TG2/TIAb3u2Pfz+NHzSIHZdafR27vdsk2rtdnffz957P907sqATwX0zf+pMvn3nvrOETkKWiw+zqLjQuEffUP8S3QianrM0MNFbfY/HsUDdOcGXr0Z3LjAund5bq6O/uMC0e9+Acr12u2Lw5CJ57srcK8rWfbtzPn2FBbif6zkZ6fkf/ehd5HJLsXlh09GhxOKtwUc/HnSAZfeXK9Y1kS/8OHscmNEaQJv+G5+GiejdeBZ2Ga1nnLH9mS9X4VdO2bLY89pUO43R//3L35I79bo7/h0ND10nouTv1vwd0yy2l88yi0TiMj2udiQmU/f6O/6aOW0tsM8eO45wmyvZrb1tIzsHPvW+fPBAgvf7Vr/YD6aov9vr/+4vtrQwlmShX070NbqRlEt8/W5S8uDmG3TuM7RL3u5aPVjGdnW0h+efHcYcPLY8HOk5Gdt8nd5KzaWZ/tnLD32Xj15lla3y68uvDR0xb/JOT6UNp3cXNlXewwK0Xdgab3urg0/B6s2lfbV9kWYMdEvnd3UZv+7kT/bfnxrZRJf+gQ5hzbKVJn8jRs9V2+hTn1TI3t2iam4M3baGJDjt1QNGX6m4mzJkqBkVfLnoXM6Xp3niPq2hSX73q2vHyqP5V9LCJ7F2d8YmKxPgWMrFZ1+ry7avnTqXLDTj4Ie/FezXX7g+dLZv6EmN3+NOMb1V3olsn97f+bEU+6fm/2lrxpzp6svAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA/Jn+ArvwMzQlhEN7AAAAAElFTkSuQmCC', '440923198602067053', 428826611781992448, 428826621869293568);

-- ----------------------------
-- Table structure for user_role
-- ----------------------------
DROP TABLE IF EXISTS `user_role`;
CREATE TABLE `user_role`  (
  `id` bigint(20) NOT NULL COMMENT '主键id',
  `client_device_type` varchar(80) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '数据来源终端',
  `client_id` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '应用程序唯一标志，分配给应用的appid',
  `date_created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '数据创建时间',
  `del` bit(1) NOT NULL DEFAULT b'0' COMMENT '数据是否有效，用作逻辑删除',
  `last_updated` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '数据最后更新时间',
  `version` int(11) NOT NULL DEFAULT 0 COMMENT '乐观锁',
  `operate_user_id` bigint(20) NOT NULL COMMENT '分配角色操作会员id',
  `role_id` bigint(20) NOT NULL COMMENT '角色信息',
  `user_id` bigint(20) NOT NULL COMMENT '用户信息',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `IDXoj50qpdthexxxmvur61ggy2fb`(`user_id`) USING BTREE,
  INDEX `IDXkt76tbwgvgf7m5rhnrkxxvgyc`(`role_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '用户角色表，多对多关系' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of user_role
-- ----------------------------
INSERT INTO `user_role` VALUES (384564356207083520, 'OTHERS', '0a9cbbbb4f130988', '2020-08-17 14:58:43', b'0', '2020-08-17 14:58:43', 0, 384564355850567680, 384564356127391744, 384564355850567680);
INSERT INTO `user_role` VALUES (384987786131800064, 'BROWSER', '0a9cbbbb4f130988', '2020-08-18 19:01:17', b'0', '2020-08-18 19:01:17', 0, 384564355850567680, 384967779960225792, 384976096988233728);
INSERT INTO `user_role` VALUES (387767669509586944, 'BROWSER', '2e5a0de806a58450', '2020-08-26 11:07:32', b'0', '2020-08-26 11:07:32', 0, 387767668792360960, 387767669463449600, 387767668792360960);

SET FOREIGN_KEY_CHECKS = 1;
