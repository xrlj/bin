/*
 Navicat Premium Data Transfer

 Source Server         : xrlj-dev-master
 Source Server Type    : MySQL
 Source Server Version : 80013
 Source Host           : 192.168.0.3:3910
 Source Schema         : service_usercentral

 Target Server Type    : MySQL
 Target Server Version : 80013
 File Encoding         : 65001

 Date: 03/09/2021 17:54:23
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
INSERT INTO `department` VALUES (510026444403900416, 'BROWSER', '0a9cbbbb4f130988', '2021-07-29 20:00:16', b'0', '2021-07-29 20:00:16', 0, '1', 384564355968008192, '科技集团', 1, NULL);
INSERT INTO `department` VALUES (510026587622604800, 'BROWSER', '0a9cbbbb4f130988', '2021-07-29 20:00:50', b'0', '2021-07-29 20:00:50', 0, '2', 384564355968008192, '地产集团', 1, NULL);

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
INSERT INTO `enterprise` VALUES (480609425531338752, 'BROWSER', '0a9cbbbb4f130988', '2021-05-09 15:47:32', b'0', '2021-05-09 15:47:32', 0, NULL, NULL, NULL, '13543495275', '张木天', NULL, NULL, NULL, 'QY002', '燧石保理（深圳）有限公司', 0, NULL, NULL, NULL, NULL, NULL, NULL, '小草', NULL, '205875649', '91441900077914230X', NULL, NULL, NULL, NULL);
INSERT INTO `enterprise` VALUES (481389268183285760, 'BROWSER', '2e5a0de806a58450', '2021-05-11 19:26:21', b'0', '2021-05-11 19:26:21', 0, NULL, NULL, NULL, '15017819432', '杨文杰', NULL, NULL, NULL, 'QY003', '碧桂园地产集团有限公司', 0, NULL, NULL, NULL, NULL, NULL, NULL, '小草', NULL, '205875649', '91440606338202486K', NULL, NULL, NULL, NULL);
INSERT INTO `enterprise` VALUES (481393288339783680, 'BROWSER', '2e5a0de806a58450', '2021-05-11 19:42:19', b'0', '2021-05-11 19:42:19', 0, NULL, NULL, NULL, '13543495275', '张华', NULL, NULL, NULL, 'QY004', '士大夫但是', 0, NULL, NULL, NULL, NULL, NULL, NULL, '小草', NULL, '205875649', '9144190007791423033', NULL, NULL, NULL, NULL);
INSERT INTO `enterprise` VALUES (481423625765781504, 'BROWSER', '2e5a0de806a58450', '2021-05-11 21:42:53', b'0', '2021-05-11 21:42:53', 0, NULL, NULL, NULL, '13545685697', '执照都', NULL, NULL, NULL, 'QY005', '祁东碧桂园房地产开发有限公司', 0, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, '205875649', '91430426MA4L14CJ13', NULL, NULL, NULL, NULL);
INSERT INTO `enterprise` VALUES (481423958302785536, 'BROWSER', '2e5a0de806a58450', '2021-05-11 21:44:12', b'0', '2021-05-11 21:44:12', 0, NULL, NULL, NULL, '17773130731', '王捷', NULL, NULL, NULL, 'QY006', '湖南湘锦金属制品有限公司', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '13676060723', '91430102060137658M', NULL, NULL, NULL, NULL);
INSERT INTO `enterprise` VALUES (481424147411369984, 'BROWSER', '2e5a0de806a58450', '2021-05-11 21:44:57', b'0', '2021-05-11 21:44:57', 0, NULL, NULL, NULL, '13658967896', 'mt zhang', NULL, NULL, NULL, 'QY007', '华泰资管', 0, '', NULL, NULL, NULL, NULL, NULL, '小草', NULL, '205875649', '91441900077914230A', NULL, NULL, NULL, NULL);
INSERT INTO `enterprise` VALUES (481424582490718208, 'BROWSER', '2e5a0de806a58450', '2021-05-11 21:46:41', b'0', '2021-05-11 21:46:41', 0, NULL, NULL, NULL, '13569878965', '小李子', NULL, NULL, NULL, 'QY008', '江苏万可建设有限公司', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '12365896', '91321291MA1Y1N673G', NULL, NULL, NULL, NULL);

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
INSERT INTO `enterprise_relation` VALUES (481389268711768064, 'BROWSER', '2e5a0de806a58450', '2021-05-11 19:26:21', b'0', '2021-05-11 19:26:21', 0, 480609425531338752, 481389268183285760, 2);
INSERT INTO `enterprise_relation` VALUES (481393288440446976, 'BROWSER', '2e5a0de806a58450', '2021-05-11 19:42:19', b'0', '2021-05-11 19:42:19', 0, 480609425531338752, 481393288339783680, 2);
INSERT INTO `enterprise_relation` VALUES (481423626357178368, 'BROWSER', '2e5a0de806a58450', '2021-05-11 21:42:53', b'0', '2021-05-11 21:42:53', 0, 480609425531338752, 481423625765781504, 3);
INSERT INTO `enterprise_relation` VALUES (481423958361505792, 'BROWSER', '2e5a0de806a58450', '2021-05-11 21:44:12', b'0', '2021-05-11 21:44:12', 0, 480609425531338752, 481423958302785536, 4);
INSERT INTO `enterprise_relation` VALUES (481424147457507328, 'BROWSER', '2e5a0de806a58450', '2021-05-11 21:44:57', b'0', '2021-05-11 21:44:57', 0, 480609425531338752, 481424147411369984, 5);
INSERT INTO `enterprise_relation` VALUES (481424582541049856, 'BROWSER', '2e5a0de806a58450', '2021-05-11 21:46:41', b'0', '2021-05-11 21:46:41', 0, 480609425531338752, 481424582490718208, 4);

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
  `perms` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '授权(多个用逗号分隔，如：user:list,user:create)',
  `sort` smallint(3) NOT NULL DEFAULT 0 COMMENT '排序',
  `title_en` varchar(80) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '菜单英文名称',
  `title_zh` varchar(80) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '菜单中文名称',
  `type` smallint(1) NULL DEFAULT 0 COMMENT '类型   1：菜单   2：按钮',
  `parent_id` bigint(20) NULL DEFAULT NULL COMMENT '主键id',
  `user_type` tinyint(1) NULL DEFAULT NULL COMMENT '用户平台类型',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `FKgeupubdqncc1lpgf2cn4fqwbc`(`parent_id`) USING BTREE,
  CONSTRAINT `FKgeupubdqncc1lpgf2cn4fqwbc` FOREIGN KEY (`parent_id`) REFERENCES `menu` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '菜单。' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of menu
-- ----------------------------
INSERT INTO `menu` VALUES (384564356282580992, 'OTHERS', '0a9cbbbb4f130988', '2020-08-17 14:58:43', b'0', '2021-05-06 20:15:57', 3, 'home', b'0', '/pages', '', 1, NULL, '首页', 1, NULL, NULL);
INSERT INTO `menu` VALUES (384564356353884160, 'OTHERS', '0a9cbbbb4f130988', '2020-08-17 14:58:43', b'0', '2020-08-17 16:26:14', 2, 'setting', b'1', '', '', 25, NULL, '系统设置', 1, NULL, NULL);
INSERT INTO `menu` VALUES (384564356458741760, 'OTHERS', '0a9cbbbb4f130988', '2020-08-17 14:58:43', b'0', '2020-08-17 17:02:25', 2, 'bars', b'1', '/pages/setting/menu', '', 2, NULL, '菜单管理', 1, 384564356353884160, NULL);
INSERT INTO `menu` VALUES (384585685832564736, 'BROWSER', '0a9cbbbb4f130988', '2020-08-17 16:23:29', b'0', '2020-08-17 16:26:07', 2, 'safety-certificate', b'1', '', '', 20, NULL, '权限管理', 1, NULL, NULL);
INSERT INTO `menu` VALUES (384586680859885568, 'BROWSER', '0a9cbbbb4f130988', '2020-08-17 16:27:26', b'0', '2020-08-17 18:27:42', 1, 'sound', b'1', '', '', 30, NULL, '消息管理', 1, NULL, NULL);
INSERT INTO `menu` VALUES (384587773211836416, 'BROWSER', '0a9cbbbb4f130988', '2020-08-17 16:31:47', b'0', '2020-08-17 16:35:23', 1, 'bell', b'1', '', '', 35, NULL, '站内通知', 1, NULL, NULL);
INSERT INTO `menu` VALUES (384589424232497152, 'BROWSER', '0a9cbbbb4f130988', '2020-08-17 16:38:20', b'0', '2020-08-17 17:06:01', 2, 'container', b'1', '', '', 40, NULL, '日志管理', 1, NULL, NULL);
INSERT INTO `menu` VALUES (384590226917425152, 'BROWSER', '0a9cbbbb4f130988', '2020-08-17 16:41:32', b'0', '2020-08-17 17:53:28', 3, 'user', b'1', '/pages/setting/user', '', 1, NULL, '用户管理', 1, 384585685832564736, NULL);
INSERT INTO `menu` VALUES (384590896739385344, 'BROWSER', '0a9cbbbb4f130988', '2020-08-17 16:44:11', b'0', '2020-08-17 17:53:53', 1, 'apartment', b'1', '/pages/setting/department', '', 2, NULL, '部门管理', 1, 384585685832564736, NULL);
INSERT INTO `menu` VALUES (384591491382640640, 'BROWSER', '0a9cbbbb4f130988', '2020-08-17 16:46:33', b'0', '2020-08-17 16:59:48', 4, 'team', b'1', '/pages/setting/role', '', 3, NULL, '角色管理', 1, 384585685832564736, NULL);
INSERT INTO `menu` VALUES (384595237055496192, 'BROWSER', '0a9cbbbb4f130988', '2020-08-17 17:01:26', b'0', '2020-08-17 17:53:01', 1, 'appstore', b'1', '/pages/setting/app', '', 1, NULL, '应用管理', 1, 384564356353884160, NULL);
INSERT INTO `menu` VALUES (384596229272633344, 'BROWSER', '0a9cbbbb4f130988', '2020-08-17 17:05:23', b'0', '2020-08-17 17:15:50', 1, 'profile', b'1', '/pages/setting/parameter', '', 3, NULL, '参数管理', 1, 384564356353884160, NULL);
INSERT INTO `menu` VALUES (384599971527131136, 'BROWSER', '0a9cbbbb4f130988', '2020-08-17 17:20:15', b'0', '2020-08-17 17:20:15', 0, 'book', b'1', '/pages/setting/dictionary', NULL, 4, NULL, '字典管理', 1, 384564356353884160, NULL);
INSERT INTO `menu` VALUES (384600372414513152, 'BROWSER', '0a9cbbbb4f130988', '2020-08-17 17:21:51', b'0', '2020-08-17 17:21:51', 0, 'environment', b'1', '/pages/setting/zh-area', NULL, 5, NULL, '行政区域', 1, 384564356353884160, NULL);
INSERT INTO `menu` VALUES (384601336034885632, 'BROWSER', '0a9cbbbb4f130988', '2020-08-17 17:25:40', b'0', '2020-08-17 17:25:40', 0, 'upload', b'1', '/pages/setting/file', NULL, 6, NULL, '文件上传', 1, 384564356353884160, NULL);
INSERT INTO `menu` VALUES (384609205933309952, 'BROWSER', '0a9cbbbb4f130988', '2020-08-17 17:56:57', b'0', '2020-08-17 18:59:39', 1, 'message', b'1', '/pages/notify/sms', '', 1, NULL, '短信服务', 1, 384586680859885568, NULL);
INSERT INTO `menu` VALUES (384613188773085184, 'BROWSER', '0a9cbbbb4f130988', '2020-08-17 18:12:46', b'0', '2020-08-17 18:12:46', 0, 'history', b'1', '/pages/notify/sms-record', NULL, 2, NULL, '短信发送记录', 1, 384586680859885568, NULL);
INSERT INTO `menu` VALUES (384613517061259264, 'BROWSER', '0a9cbbbb4f130988', '2020-08-17 18:14:05', b'0', '2020-08-17 18:14:05', 0, 'mail', b'1', '/pages/notify/email', NULL, 3, NULL, '邮件服务', 1, 384586680859885568, NULL);
INSERT INTO `menu` VALUES (384614544376332288, 'BROWSER', '0a9cbbbb4f130988', '2020-08-17 18:18:10', b'0', '2020-08-17 18:18:10', 0, 'hdd', b'1', '/pages/notify/email-record', NULL, 4, NULL, '邮件发送记录', 1, 384586680859885568, NULL);
INSERT INTO `menu` VALUES (384617627336572928, 'BROWSER', '0a9cbbbb4f130988', '2020-08-17 18:30:25', b'0', '2020-08-17 18:30:25', 0, 'notification', b'1', '/pages/announcement/my', NULL, 1, NULL, '我的通知', 1, 384587773211836416, NULL);
INSERT INTO `menu` VALUES (384619429138268160, 'BROWSER', '0a9cbbbb4f130988', '2020-08-17 18:37:34', b'0', '2020-08-17 18:37:34', 0, 'bell', b'1', '/pages/announcement/manage', NULL, 2, NULL, '通知管理', 1, 384587773211836416, NULL);
INSERT INTO `menu` VALUES (384620989876535296, 'BROWSER', '0a9cbbbb4f130988', '2020-08-17 18:43:46', b'0', '2020-08-17 18:43:46', 0, 'file-done', b'1', '/pages/sys-log/login', NULL, 1, NULL, '登录日志', 1, 384589424232497152, NULL);
INSERT INTO `menu` VALUES (384621330957336576, 'BROWSER', '0a9cbbbb4f130988', '2020-08-17 18:45:08', b'0', '2020-08-17 18:45:37', 1, 'solution', b'1', '/pages/sys-log/operation', '', 2, NULL, '操作日志', 1, 384589424232497152, NULL);
INSERT INTO `menu` VALUES (384621781220065280, 'BROWSER', '0a9cbbbb4f130988', '2020-08-17 18:46:55', b'0', '2020-08-17 18:46:55', 0, 'exception', b'1', '/pages/sys-log/error', NULL, 3, NULL, '异常日志', 1, 384589424232497152, NULL);
INSERT INTO `menu` VALUES (384622492808904704, 'BROWSER', '0a9cbbbb4f130988', '2020-08-17 18:49:45', b'0', '2021-05-06 21:01:31', 2, 'team', b'1', '', '', 10, NULL, '客户管理', 1, NULL, NULL);
INSERT INTO `menu` VALUES (384623418722484224, 'BROWSER', '0a9cbbbb4f130988', '2020-08-17 18:53:26', b'0', '2020-08-17 18:53:26', 0, 'group', b'1', '/pages/customer/etp', NULL, 1, NULL, '企业管理', 1, 384622492808904704, NULL);
INSERT INTO `menu` VALUES (384623800752275456, 'BROWSER', '0a9cbbbb4f130988', '2020-08-17 18:54:57', b'0', '2020-08-17 18:54:57', 0, 'user-add', b'1', '/pages/customer/account', NULL, 2, NULL, '账号管理', 1, 384622492808904704, NULL);
INSERT INTO `menu` VALUES (387758497091026944, 'BROWSER', '2e5a0de806a58450', '2020-08-26 10:31:06', b'0', '2020-08-26 17:00:20', 2, 'team', b'1', '', '', 2, NULL, '客户管理', 1, NULL, 1);
INSERT INTO `menu` VALUES (387759034322649088, 'BROWSER', '2e5a0de806a58450', '2020-08-26 10:33:14', b'0', '2020-08-27 20:46:44', 3, 'setting', b'1', '', '', 10, NULL, '系统设置', 1, NULL, 1);
INSERT INTO `menu` VALUES (387759145178103808, 'BROWSER', '2e5a0de806a58450', '2020-08-26 10:33:40', b'0', '2020-12-24 16:02:18', 3, 'solution', b'1', '/pages/business/factor/customer/etp', '', 1, NULL, '企业客户管理', 1, 387758497091026944, 1);
INSERT INTO `menu` VALUES (387759210579886080, 'BROWSER', '2e5a0de806a58450', '2020-08-26 10:33:56', b'0', '2021-04-29 20:33:36', 3, 'user', b'1', '/pages/setting/user-manage', '', 1, NULL, '子账号管理', 1, 387759034322649088, 1);
INSERT INTO `menu` VALUES (387857677398573056, 'BROWSER', '2e5a0de806a58450', '2020-08-26 17:05:12', b'0', '2021-04-29 20:34:17', 1, 'control', b'1', '/pages/setting/role-manage', '', 3, NULL, '角色管理', 1, 387759034322649088, 1);
INSERT INTO `menu` VALUES (387857825612693504, 'BROWSER', '2e5a0de806a58450', '2020-08-26 17:05:47', b'0', '2021-04-29 20:34:02', 1, 'apartment', b'1', '/pages/setting/dpt-manage', '', 2, NULL, '部门管理', 1, 387759034322649088, 1);
INSERT INTO `menu` VALUES (387860778838917120, 'BROWSER', '2e5a0de806a58450', '2020-08-26 17:17:31', b'0', '2020-12-24 17:10:57', 1, 'user', b'1', '/pages/business/factor/customer/account', '', 2, NULL, '企业账号管理', 1, 387758497091026944, 1);
INSERT INTO `menu` VALUES (388184329198501888, 'BROWSER', '2e5a0de806a58450', '2020-08-27 14:43:12', b'0', '2021-04-28 21:39:33', 2, 'home', b'0', '/pages', '', 1, NULL, '首页', 1, NULL, 1);
INSERT INTO `menu` VALUES (388207116738887680, 'BROWSER', '2e5a0de806a58450', '2020-08-27 16:13:45', b'0', '2020-08-27 18:37:52', 1, 'profile', b'1', '', '', 3, NULL, '产品管理', 1, NULL, 1);
INSERT INTO `menu` VALUES (388207849974530048, 'BROWSER', '2e5a0de806a58450', '2020-08-27 16:16:40', b'0', '2020-12-24 17:57:20', 1, 'book', b'1', '/pages/business/factor/product-manage', '', 1, NULL, '产品列表', 1, 388207116738887680, 1);
INSERT INTO `menu` VALUES (388208396576227328, 'BROWSER', '2e5a0de806a58450', '2020-08-27 16:18:50', b'0', '2020-12-24 17:58:27', 1, 'audit', b'1', '/pages/business/factor/agreement-template', '', 2, NULL, '协议模板管理', 1, 388207116738887680, 1);
INSERT INTO `menu` VALUES (388222133173485568, 'BROWSER', '2e5a0de806a58450', '2020-08-27 17:13:25', b'0', '2021-04-29 20:22:01', 3, 'transaction', b'1', '', '', 5, NULL, '融资协同', 1, NULL, 1);
INSERT INTO `menu` VALUES (388222675786399744, 'BROWSER', '2e5a0de806a58450', '2020-08-27 17:15:34', b'0', '2020-12-24 17:03:17', 1, 'money-collect', b'1', '/pages/business/payment-bill', '', 1, NULL, '付款单管理', 1, 388222133173485568, 1);
INSERT INTO `menu` VALUES (388223384980291584, 'BROWSER', '2e5a0de806a58450', '2020-08-27 17:18:23', b'0', '2021-04-28 21:43:06', 3, 'wallet', b'1', '/pages/business/financing-bill', '', 2, NULL, '融资单管理', 1, 388222133173485568, 1);
INSERT INTO `menu` VALUES (388225348904419328, 'BROWSER', '2e5a0de806a58450', '2020-08-27 17:26:12', b'0', '2021-04-29 20:21:52', 2, 'account-book', b'1', '', '', 4, NULL, '合同制作', 1, NULL, 1);
INSERT INTO `menu` VALUES (388234665208578048, 'BROWSER', '2e5a0de806a58450', '2020-08-27 18:03:13', b'0', '2021-04-29 20:20:27', 1, 'file-zip', b'1', '/pages/business/factor/financing-package', '', 1, NULL, '融资打包', 1, 388225348904419328, 1);
INSERT INTO `menu` VALUES (388235161403129856, 'BROWSER', '2e5a0de806a58450', '2020-08-27 18:05:11', b'0', '2021-04-29 20:20:53', 1, 'file-add', b'1', '/pages/business/factor/first-contract-make', '', 2, NULL, '第一次合同制作', 1, 388225348904419328, 1);
INSERT INTO `menu` VALUES (388235322183385088, 'BROWSER', '2e5a0de806a58450', '2020-08-27 18:05:49', b'0', '2021-04-29 20:21:17', 1, 'file-add', b'1', '/pages/business/factor/second-contract-make', '', 3, NULL, '第二次合同制作', 1, 388225348904419328, 1);
INSERT INTO `menu` VALUES (388244378004488192, 'BROWSER', '2e5a0de806a58450', '2020-08-27 18:41:49', b'0', '2020-08-27 19:14:04', 1, 'flag', b'1', '', '', 7, NULL, '中登网登记', 1, NULL, 1);
INSERT INTO `menu` VALUES (388252008999550976, 'BROWSER', '2e5a0de806a58450', '2020-08-27 19:12:08', b'0', '2021-04-29 20:24:46', 1, 'property-safety', b'1', '/pages/business/factor/first-zdw-register', '', 1, NULL, '第一次转让登记', 1, 388244378004488192, 1);
INSERT INTO `menu` VALUES (388252318161698816, 'BROWSER', '2e5a0de806a58450', '2020-08-27 19:13:22', b'0', '2021-04-29 20:25:04', 1, 'pay-circle', b'1', '/pages/business/factor/second-zdw-register', '', 2, NULL, '第二次转让登记', 1, 388244378004488192, 1);
INSERT INTO `menu` VALUES (388253552423731200, 'BROWSER', '2e5a0de806a58450', '2020-08-27 19:18:16', b'0', '2020-08-27 19:18:16', 0, 'audit', b'1', NULL, NULL, 6, NULL, '签章管理', 1, NULL, 1);
INSERT INTO `menu` VALUES (388261965702627328, 'BROWSER', '2e5a0de806a58450', '2020-08-27 19:51:42', b'0', '2021-04-29 20:23:06', 1, 'file-add', b'1', '/pages/business/sign-wait-list', '', 1, NULL, '待签章文件', 1, 388253552423731200, 1);
INSERT INTO `menu` VALUES (388262068693762048, 'BROWSER', '2e5a0de806a58450', '2020-08-27 19:52:06', b'0', '2021-04-29 20:23:38', 2, 'file-done', b'1', '/pages/business/sign-complete-list', '', 2, NULL, '已签章文件', 1, 388253552423731200, 1);
INSERT INTO `menu` VALUES (388265075040845824, 'BROWSER', '2e5a0de806a58450', '2020-08-27 20:04:03', b'0', '2021-04-29 20:24:06', 1, 'trademark', b'1', '/pages/business/sign-all-list', '', 3, NULL, '签章任务列表', 1, 388253552423731200, 1);
INSERT INTO `menu` VALUES (388276336621256704, 'BROWSER', '2e5a0de806a58450', '2020-08-27 20:48:48', b'0', '2020-08-27 20:48:48', 0, 'trademark-circle', b'1', NULL, NULL, 8, NULL, '融后管理', 1, NULL, 1);
INSERT INTO `menu` VALUES (388276792311414784, 'BROWSER', '2e5a0de806a58450', '2020-08-27 20:50:37', b'0', '2021-04-29 20:25:45', 1, 'pay-circle', b'1', '/pages/business/factor/payment-write-off', '', 1, NULL, '付款与核销', 1, 388276336621256704, 1);
INSERT INTO `menu` VALUES (388277990322077696, 'BROWSER', '2e5a0de806a58450', '2020-08-27 20:55:22', b'0', '2021-04-29 20:26:41', 1, 'pound-circle', b'1', '/pages/business/factor/basic-ledger', '', 2, NULL, '基础资产台账', 1, 388276336621256704, 1);
INSERT INTO `menu` VALUES (388278663776305152, 'BROWSER', '2e5a0de806a58450', '2020-08-27 20:58:03', b'0', '2020-08-27 20:58:16', 1, 'apartment', b'1', '', '', 9, NULL, '企业中心', 1, NULL, 1);
INSERT INTO `menu` VALUES (388278931347734528, 'BROWSER', '2e5a0de806a58450', '2020-08-27 20:59:07', b'0', '2021-04-29 20:31:54', 1, 'contacts', b'1', '/pages/etp-centre/etp-info', '', 1, NULL, '企业信息', 1, 388278663776305152, 1);
INSERT INTO `menu` VALUES (388279090085363712, 'BROWSER', '2e5a0de806a58450', '2020-08-27 20:59:45', b'0', '2021-04-29 20:32:28', 2, 'bank', b'1', '/pages/etp-centre/etp-bank-card', '', 2, NULL, '银行账户管理', 1, 388278663776305152, 1);
INSERT INTO `menu` VALUES (405945198829371392, 'BROWSER', '0a9cbbbb4f130988', '2020-10-15 14:58:33', b'0', '2020-10-15 14:58:33', 0, NULL, b'1', NULL, NULL, 1, NULL, '新增', 2, 384620989876535296, NULL);
INSERT INTO `menu` VALUES (410663893027782656, 'BROWSER', '0a9cbbbb4f130988', '2020-10-28 15:28:58', b'0', '2020-10-28 20:44:25', 2, 'book', b'1', '', '', 50, NULL, '书籍管理', 1, NULL, NULL);
INSERT INTO `menu` VALUES (410664643070001152, 'BROWSER', '0a9cbbbb4f130988', '2020-10-28 15:31:56', b'0', '2020-10-30 14:02:35', 5, 'folder-add', b'1', '/pages/ebook/folder', '', 2, NULL, '分类维护', 1, 410663893027782656, NULL);
INSERT INTO `menu` VALUES (410666932606337024, 'BROWSER', '0a9cbbbb4f130988', '2020-10-28 15:41:02', b'0', '2020-10-28 21:06:50', 6, 'folder-open', b'1', '/pages/ebook/list', '', 1, NULL, '书籍列表', 1, 410663893027782656, NULL);
INSERT INTO `menu` VALUES (477055970535538688, 'BROWSER', '2e5a0de806a58450', '2021-04-29 20:27:22', b'0', '2021-04-29 20:30:13', 2, 'verified', b'1', '/pages/business/factor/creditor-inventory', '', 3, NULL, '合格债权清单', 1, 388276336621256704, 1);
INSERT INTO `menu` VALUES (479596149968207872, 'BROWSER', '2e5a0de806a58450', '2021-05-06 20:41:08', b'0', '2021-05-06 20:49:36', 1, 'transaction', b'1', '', '', 2, NULL, '融资协同', 1, NULL, 2);
INSERT INTO `menu` VALUES (479597892370169856, 'BROWSER', '2e5a0de806a58450', '2021-05-06 20:48:04', b'0', '2021-05-06 21:05:42', 3, 'audit', b'1', '', '', 3, NULL, '签章管理', 1, NULL, 2);
INSERT INTO `menu` VALUES (479602534214795264, 'BROWSER', '2e5a0de806a58450', '2021-05-06 21:06:30', b'0', '2021-05-06 21:06:30', 0, 'apartment', b'1', NULL, NULL, 4, NULL, '企业中心', 1, NULL, 2);
INSERT INTO `menu` VALUES (479607700464861184, 'BROWSER', '2e5a0de806a58450', '2021-05-06 21:27:02', b'0', '2021-05-06 21:27:02', 0, 'setting', b'1', NULL, NULL, 5, NULL, '系统设置', 1, NULL, 2);
INSERT INTO `menu` VALUES (479607886612267008, 'BROWSER', '2e5a0de806a58450', '2021-05-06 21:27:46', b'0', '2021-05-06 21:27:46', 0, 'money-collect', b'1', '/pages/business/payment-bill', NULL, 1, NULL, '付款单管理', 1, 479596149968207872, 2);
INSERT INTO `menu` VALUES (479809491802521600, 'BROWSER', '2e5a0de806a58450', '2021-05-07 10:48:53', b'0', '2021-05-07 10:48:53', 0, 'wallet', b'1', '/pages/business/financing-bill', NULL, 2, NULL, '融资单管理', 1, 479596149968207872, 2);
INSERT INTO `menu` VALUES (479809903381184512, 'BROWSER', '2e5a0de806a58450', '2021-05-07 10:50:31', b'0', '2021-05-07 10:50:31', 0, 'file-add', b'1', '/pages/business/sign-wait-list', NULL, 1, NULL, '待签章文件', 1, 479597892370169856, 2);
INSERT INTO `menu` VALUES (479810087418855424, 'BROWSER', '2e5a0de806a58450', '2021-05-07 10:51:15', b'0', '2021-05-07 10:51:15', 0, 'file-done', b'1', '/pages/business/sign-complete-list', NULL, 2, NULL, '已签章文件', 1, 479597892370169856, 2);
INSERT INTO `menu` VALUES (479810292889419776, 'BROWSER', '2e5a0de806a58450', '2021-05-07 10:52:04', b'0', '2021-05-07 10:52:04', 0, 'contacts', b'1', '/pages/etp-centre/etp-info', NULL, 1, NULL, '企业信息', 1, 479602534214795264, 2);
INSERT INTO `menu` VALUES (479810523244789760, 'BROWSER', '2e5a0de806a58450', '2021-05-07 10:52:59', b'0', '2021-05-07 10:52:59', 0, 'bank', b'1', '/pages/etp-centre/etp-bank-card', NULL, 2, NULL, '银行账户管理', 1, 479602534214795264, 2);
INSERT INTO `menu` VALUES (479811614569136128, 'BROWSER', '2e5a0de806a58450', '2021-05-07 10:57:19', b'0', '2021-05-07 10:57:19', 0, 'user', b'1', '/pages/setting/user-manage', NULL, 1, NULL, '子账号管理', 1, 479607700464861184, 2);
INSERT INTO `menu` VALUES (479811845440405504, 'BROWSER', '2e5a0de806a58450', '2021-05-07 10:58:14', b'0', '2021-05-07 10:58:14', 0, 'apartment', b'1', '/pages/setting/dpt-manage', NULL, 2, NULL, '部门管理', 1, 479607700464861184, 2);
INSERT INTO `menu` VALUES (479811990504603648, 'BROWSER', '2e5a0de806a58450', '2021-05-07 10:58:49', b'0', '2021-05-11 21:55:29', 2, 'control', b'1', '/pages/setting/role-manage', '', 2, NULL, '角色管理', 1, 479607700464861184, 2);
INSERT INTO `menu` VALUES (479812608573046784, 'BROWSER', '2e5a0de806a58450', '2021-05-07 11:01:16', b'0', '2021-05-07 11:23:46', 1, 'transaction', b'1', '', '', 5, NULL, '融资协同', 1, NULL, 3);
INSERT INTO `menu` VALUES (479818247114326016, 'BROWSER', '2e5a0de806a58450', '2021-05-07 11:23:40', b'0', '2021-05-07 11:23:40', 0, 'audit', b'1', NULL, NULL, 10, NULL, '签章管理', 1, NULL, 3);
INSERT INTO `menu` VALUES (479818399170428928, 'BROWSER', '2e5a0de806a58450', '2021-05-07 11:24:17', b'0', '2021-05-07 11:24:17', 0, 'apartment', b'1', NULL, NULL, 15, NULL, '企业中心', 1, NULL, 3);
INSERT INTO `menu` VALUES (479818511259009024, 'BROWSER', '2e5a0de806a58450', '2021-05-07 11:24:43', b'0', '2021-05-12 14:40:56', 4, 'setting', b'1', '', '', 20, NULL, '系统设置', 1, NULL, 3);
INSERT INTO `menu` VALUES (479819989289795584, 'BROWSER', '2e5a0de806a58450', '2021-05-07 11:30:36', b'0', '2021-05-07 11:30:36', 0, 'money-collect', b'1', '/pages/business/payment-bill', NULL, 1, NULL, '付款单管理', 1, 479812608573046784, 3);
INSERT INTO `menu` VALUES (479820160396427264, 'BROWSER', '2e5a0de806a58450', '2021-05-07 11:31:16', b'0', '2021-05-07 11:31:16', 0, 'wallet', b'1', '/pages/business/financing-bill', NULL, 2, NULL, '融资单管理', 1, 479812608573046784, 3);
INSERT INTO `menu` VALUES (479820367326609408, 'BROWSER', '2e5a0de806a58450', '2021-05-07 11:32:06', b'0', '2021-05-07 11:32:06', 0, 'file-add', b'1', '/pages/business/sign-wait-list', NULL, 1, NULL, '待签章文件', 1, 479818247114326016, 3);
INSERT INTO `menu` VALUES (479820565037711360, 'BROWSER', '2e5a0de806a58450', '2021-05-07 11:32:53', b'0', '2021-05-07 11:32:53', 0, 'file-done', b'1', '/pages/business/sign-complete-list', NULL, 2, NULL, '已签章文件', 1, 479818247114326016, 3);
INSERT INTO `menu` VALUES (479820707778265088, 'BROWSER', '2e5a0de806a58450', '2021-05-07 11:33:27', b'0', '2021-05-07 11:33:27', 0, 'contacts', b'1', '/pages/etp-centre/etp-info', NULL, 1, NULL, '企业信息', 1, 479818399170428928, 3);
INSERT INTO `menu` VALUES (479820847394062336, 'BROWSER', '2e5a0de806a58450', '2021-05-07 11:34:00', b'0', '2021-05-07 11:34:00', 0, 'bank', b'1', '/pages/etp-centre/etp-bank-card', NULL, 2, NULL, '银行账户管理', 1, 479818399170428928, 3);
INSERT INTO `menu` VALUES (479821083650818048, 'BROWSER', '2e5a0de806a58450', '2021-05-07 11:34:57', b'0', '2021-05-12 14:40:56', 4, 'user', b'1', '/pages/setting/user-manage', '', 1, NULL, '子账号管理', 1, 479818511259009024, 3);
INSERT INTO `menu` VALUES (479821216111132672, 'BROWSER', '2e5a0de806a58450', '2021-05-07 11:35:28', b'0', '2021-05-12 14:40:56', 4, 'apartment', b'1', '/pages/setting/dpt-manage', '', 2, NULL, '部门管理', 1, 479818511259009024, 3);
INSERT INTO `menu` VALUES (479821361020141568, 'BROWSER', '2e5a0de806a58450', '2021-05-07 11:36:03', b'0', '2021-05-12 14:40:56', 4, 'control', b'1', '/pages/setting/role-manage', '', 3, NULL, '角色管理', 1, 479818511259009024, 3);
INSERT INTO `menu` VALUES (479822398317658112, 'BROWSER', '2e5a0de806a58450', '2021-05-07 11:40:10', b'0', '2021-05-07 11:40:10', 0, 'transaction', b'1', NULL, NULL, 5, NULL, '融资协同', 1, NULL, 4);
INSERT INTO `menu` VALUES (479822512855711744, 'BROWSER', '2e5a0de806a58450', '2021-05-07 11:40:37', b'0', '2021-05-07 11:40:37', 0, 'audit', b'1', NULL, NULL, 10, NULL, '签章管理', 1, NULL, 4);
INSERT INTO `menu` VALUES (479822620091482112, 'BROWSER', '2e5a0de806a58450', '2021-05-07 11:41:03', b'0', '2021-05-07 11:41:03', 0, 'apartment', b'1', NULL, NULL, 15, NULL, '企业中心', 1, NULL, 4);
INSERT INTO `menu` VALUES (479822700521455616, 'BROWSER', '2e5a0de806a58450', '2021-05-07 11:41:22', b'0', '2021-05-12 11:50:22', 2, 'setting', b'1', '', '', 20, NULL, '系统设置', 1, NULL, 4);
INSERT INTO `menu` VALUES (479823921156194304, 'BROWSER', '2e5a0de806a58450', '2021-05-07 11:46:13', b'0', '2021-05-07 11:46:13', 0, 'money-collect', b'1', '/pages/business/payment-bill', NULL, 1, NULL, '付款单管理', 1, 479822398317658112, 4);
INSERT INTO `menu` VALUES (479824576017072128, 'BROWSER', '2e5a0de806a58450', '2021-05-07 11:48:49', b'0', '2021-05-07 11:48:49', 0, 'wallet', b'1', '/pages/business/financing-bill', NULL, 2, NULL, '融资单管理', 1, 479822398317658112, 4);
INSERT INTO `menu` VALUES (479824763963834368, 'BROWSER', '2e5a0de806a58450', '2021-05-07 11:49:34', b'0', '2021-05-07 11:49:34', 0, 'file-add', b'1', '/pages/business/sign-wait-list', NULL, 1, NULL, '待签章文件', 1, 479822512855711744, 4);
INSERT INTO `menu` VALUES (479824905504817152, 'BROWSER', '2e5a0de806a58450', '2021-05-07 11:50:08', b'0', '2021-05-07 11:50:08', 0, 'file-done', b'1', '/pages/business/sign-complete-list', NULL, 2, NULL, '已签章文件', 1, 479822512855711744, 4);
INSERT INTO `menu` VALUES (479825069736984576, 'BROWSER', '2e5a0de806a58450', '2021-05-07 11:50:47', b'0', '2021-05-07 11:50:47', 0, 'contacts', b'1', '/pages/etp-centre/etp-info', NULL, 1, NULL, '企业信息', 1, 479822620091482112, 4);
INSERT INTO `menu` VALUES (479825211194081280, 'BROWSER', '2e5a0de806a58450', '2021-05-07 11:51:21', b'0', '2021-05-07 11:51:21', 0, 'bank', b'1', '/pages/etp-centre/etp-bank-card', NULL, 2, NULL, '银行账户管理', 1, 479822620091482112, 4);
INSERT INTO `menu` VALUES (479825341007790080, 'BROWSER', '2e5a0de806a58450', '2021-05-07 11:51:52', b'0', '2021-05-12 16:08:20', 4, 'user', b'1', '/pages/setting/user-manage', '', 1, NULL, '子账号管理', 1, 479822700521455616, 4);
INSERT INTO `menu` VALUES (479825723977105408, 'BROWSER', '2e5a0de806a58450', '2021-05-07 11:53:23', b'0', '2021-05-07 11:53:23', 0, 'apartment', b'1', '/pages/setting/dpt-manage', NULL, 2, NULL, '部门管理', 1, 479822700521455616, 4);
INSERT INTO `menu` VALUES (479825852293447680, 'BROWSER', '2e5a0de806a58450', '2021-05-07 11:53:54', b'0', '2021-05-07 11:53:54', 0, 'control', b'1', '/pages/setting/role-manage', NULL, 3, NULL, '角色管理', 1, 479822700521455616, 4);
INSERT INTO `menu` VALUES (479871336219410432, 'BROWSER', '2e5a0de806a58450', '2021-05-07 14:54:38', b'0', '2021-05-07 14:54:38', 0, 'transaction', b'1', NULL, NULL, 1, NULL, '融资协同', 1, NULL, 5);
INSERT INTO `menu` VALUES (479872952548982784, 'BROWSER', '2e5a0de806a58450', '2021-05-07 15:01:03', b'0', '2021-05-07 15:01:03', 0, 'money-collect', b'1', '/pages/business/payment-bill', NULL, 1, NULL, '付款单列表', 1, 479871336219410432, 5);
INSERT INTO `menu` VALUES (479873643451514880, 'BROWSER', '2e5a0de806a58450', '2021-05-07 15:03:48', b'0', '2021-05-07 15:03:48', 0, 'wallet', b'1', '/pages/business/financing-bill', NULL, 2, NULL, '融资单列表', 1, 479871336219410432, 5);
INSERT INTO `menu` VALUES (509159539426197504, 'BROWSER', '0a9cbbbb4f130988', '2021-07-27 10:35:30', b'0', '2021-07-27 10:35:30', 0, 'mac-command', b'1', NULL, NULL, 60, NULL, '基础资料管理', 1, NULL, 0);
INSERT INTO `menu` VALUES (509161437843685376, 'BROWSER', '0a9cbbbb4f130988', '2021-07-27 10:43:02', b'0', '2021-08-02 11:23:03', 3, 'profile', b'1', '/pages/basic-info/abs-product-type', '', 1, NULL, '产品类别管理', 1, 509159539426197504, 0);
INSERT INTO `menu` VALUES (509174145959854080, 'BROWSER', '0a9cbbbb4f130988', '2021-07-27 11:33:32', b'0', '2021-08-02 11:23:49', 2, 'flag', b'1', '/pages/basic-info/abs-annex-type', '', 3, NULL, '附件类型管理', 1, 509159539426197504, 0);
INSERT INTO `menu` VALUES (510028671306694656, 'BROWSER', '0a9cbbbb4f130988', '2021-07-29 20:09:07', b'0', '2021-08-02 11:24:46', 1, 'profile', b'1', '/pages/basic-info/protocol-template-par', '', 8, NULL, '协议模板参数', 1, 509159539426197504, 0);
INSERT INTO `menu` VALUES (522667894459334656, 'BROWSER', '0a9cbbbb4f130988', '2021-09-02 17:12:52', b'0', '2021-09-02 17:12:52', 0, 'book', b'1', '/pages/basic-info/agr-type-big', NULL, 10, NULL, '合同大类管理', 1, 509159539426197504, 0);
INSERT INTO `menu` VALUES (522668108171706368, 'BROWSER', '0a9cbbbb4f130988', '2021-09-02 17:13:43', b'0', '2021-09-02 17:13:43', 0, 'book', b'1', '/pages/basic-info/agr-type', NULL, 20, NULL, '合同类别管理', 1, 509159539426197504, 0);
INSERT INTO `menu` VALUES (522668482806939648, 'BROWSER', '0a9cbbbb4f130988', '2021-09-02 17:15:13', b'0', '2021-09-02 17:15:13', 0, 'book', b'1', '/pages/basic-info/agr-type-specify', NULL, 30, NULL, '合同版别管理', 1, 509159539426197504, 0);

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
INSERT INTO `register_invitation_code` VALUES (480609425678139392, 'BROWSER', '0a9cbbbb4f130988', '2021-05-09 15:47:32', b'0', '2021-05-09 15:48:29', 1, 480609425531338752, 'QY002', 384564355850567680, b'1', 1);
INSERT INTO `register_invitation_code` VALUES (481389268812431360, 'BROWSER', '2e5a0de806a58450', '2021-05-11 19:26:21', b'0', '2021-05-11 21:53:39', 1, 481389268183285760, 'QY003', 480609663323209728, b'1', 2);
INSERT INTO `register_invitation_code` VALUES (481393288499167232, 'BROWSER', '2e5a0de806a58450', '2021-05-11 19:42:19', b'0', '2021-05-11 19:42:19', 0, 481393288339783680, 'QY004', 480609663323209728, b'0', 2);
INSERT INTO `register_invitation_code` VALUES (481423626483007488, 'BROWSER', '2e5a0de806a58450', '2021-05-11 21:42:53', b'0', '2021-05-11 21:42:53', 0, 481423625765781504, 'QY005', 480609663323209728, b'0', 3);
INSERT INTO `register_invitation_code` VALUES (481423958453780480, 'BROWSER', '2e5a0de806a58450', '2021-05-11 21:44:12', b'0', '2021-05-11 22:21:57', 1, 481423958302785536, 'QY006', 480609663323209728, b'1', 4);
INSERT INTO `register_invitation_code` VALUES (481424147495256064, 'BROWSER', '2e5a0de806a58450', '2021-05-11 21:44:57', b'0', '2021-05-11 21:44:57', 0, 481424147411369984, 'QY007', 480609663323209728, b'0', 5);
INSERT INTO `register_invitation_code` VALUES (481424582574604288, 'BROWSER', '2e5a0de806a58450', '2021-05-11 21:46:41', b'0', '2021-05-11 21:46:41', 0, 481424582490718208, 'QY008', 480609663323209728, b'0', 4);

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
INSERT INTO `role` VALUES (480609663323209730, 'BROWSER', '2e5a0de806a58450', '2021-05-09 15:48:29', b'0', '2021-05-09 15:48:29', 0, '注册自动添加，系统管理员角色', 480609425531338752, 480609663323209728, '管理员');
INSERT INTO `role` VALUES (481426337010024450, 'BROWSER', '2e5a0de806a58450', '2021-05-11 21:53:39', b'0', '2021-05-11 21:53:39', 0, '注册自动添加，系统管理员角色', 481389268183285760, 481426337010024448, '管理员');
INSERT INTO `role` VALUES (481433458044829698, 'BROWSER', '2e5a0de806a58450', '2021-05-11 22:21:57', b'0', '2021-05-11 22:21:57', 0, '注册自动添加，系统管理员角色', 481423958302785536, 481433458044829696, '管理员');

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
INSERT INTO `role_menu` VALUES (480609664086573056, 'BROWSER', '2e5a0de806a58450', '2021-05-09 15:48:29', b'0', '2021-05-09 15:48:29', 0, 388261965702627328, 480609663323209728, 480609663323209730);
INSERT INTO `role_menu` VALUES (480609664086573057, 'BROWSER', '2e5a0de806a58450', '2021-05-09 15:48:29', b'0', '2021-05-09 15:48:29', 0, 387759145178103808, 480609663323209728, 480609663323209730);
INSERT INTO `role_menu` VALUES (480609664086573058, 'BROWSER', '2e5a0de806a58450', '2021-05-09 15:48:29', b'0', '2021-05-09 15:48:29', 0, 387759210579886080, 480609663323209728, 480609663323209730);
INSERT INTO `role_menu` VALUES (480609664086573059, 'BROWSER', '2e5a0de806a58450', '2021-05-09 15:48:29', b'0', '2021-05-09 15:48:29', 0, 388252008999550976, 480609663323209728, 480609663323209730);
INSERT INTO `role_menu` VALUES (480609664086573060, 'BROWSER', '2e5a0de806a58450', '2021-05-09 15:48:29', b'0', '2021-05-09 15:48:29', 0, 388184329198501888, 480609663323209728, 480609663323209730);
INSERT INTO `role_menu` VALUES (480609664086573061, 'BROWSER', '2e5a0de806a58450', '2021-05-09 15:48:29', b'0', '2021-05-09 15:48:29', 0, 388278931347734528, 480609663323209728, 480609663323209730);
INSERT INTO `role_menu` VALUES (480609664086573062, 'BROWSER', '2e5a0de806a58450', '2021-05-09 15:48:29', b'0', '2021-05-09 15:48:29', 0, 388207849974530048, 480609663323209728, 480609663323209730);
INSERT INTO `role_menu` VALUES (480609664086573063, 'BROWSER', '2e5a0de806a58450', '2021-05-09 15:48:29', b'0', '2021-05-09 15:48:29', 0, 388234665208578048, 480609663323209728, 480609663323209730);
INSERT INTO `role_menu` VALUES (480609664086573064, 'BROWSER', '2e5a0de806a58450', '2021-05-09 15:48:29', b'0', '2021-05-09 15:48:29', 0, 388222675786399744, 480609663323209728, 480609663323209730);
INSERT INTO `role_menu` VALUES (480609664086573065, 'BROWSER', '2e5a0de806a58450', '2021-05-09 15:48:29', b'0', '2021-05-09 15:48:29', 0, 388276792311414784, 480609663323209728, 480609663323209730);
INSERT INTO `role_menu` VALUES (480609664086573066, 'BROWSER', '2e5a0de806a58450', '2021-05-09 15:48:29', b'0', '2021-05-09 15:48:29', 0, 388277990322077696, 480609663323209728, 480609663323209730);
INSERT INTO `role_menu` VALUES (480609664086573067, 'BROWSER', '2e5a0de806a58450', '2021-05-09 15:48:29', b'0', '2021-05-09 15:48:29', 0, 388252318161698816, 480609663323209728, 480609663323209730);
INSERT INTO `role_menu` VALUES (480609664086573068, 'BROWSER', '2e5a0de806a58450', '2021-05-09 15:48:29', b'0', '2021-05-09 15:48:29', 0, 388262068693762048, 480609663323209728, 480609663323209730);
INSERT INTO `role_menu` VALUES (480609664086573069, 'BROWSER', '2e5a0de806a58450', '2021-05-09 15:48:29', b'0', '2021-05-09 15:48:29', 0, 388235161403129856, 480609663323209728, 480609663323209730);
INSERT INTO `role_menu` VALUES (480609664086573070, 'BROWSER', '2e5a0de806a58450', '2021-05-09 15:48:29', b'0', '2021-05-09 15:48:29', 0, 388223384980291584, 480609663323209728, 480609663323209730);
INSERT INTO `role_menu` VALUES (480609664086573071, 'BROWSER', '2e5a0de806a58450', '2021-05-09 15:48:29', b'0', '2021-05-09 15:48:29', 0, 388208396576227328, 480609663323209728, 480609663323209730);
INSERT INTO `role_menu` VALUES (480609664086573072, 'BROWSER', '2e5a0de806a58450', '2021-05-09 15:48:29', b'0', '2021-05-09 15:48:29', 0, 387860778838917120, 480609663323209728, 480609663323209730);
INSERT INTO `role_menu` VALUES (480609664086573073, 'BROWSER', '2e5a0de806a58450', '2021-05-09 15:48:29', b'0', '2021-05-09 15:48:29', 0, 387857825612693504, 480609663323209728, 480609663323209730);
INSERT INTO `role_menu` VALUES (480609664086573074, 'BROWSER', '2e5a0de806a58450', '2021-05-09 15:48:29', b'0', '2021-05-09 15:48:29', 0, 388279090085363712, 480609663323209728, 480609663323209730);
INSERT INTO `role_menu` VALUES (480609664086573075, 'BROWSER', '2e5a0de806a58450', '2021-05-09 15:48:29', b'0', '2021-05-09 15:48:29', 0, 387758497091026944, 480609663323209728, 480609663323209730);
INSERT INTO `role_menu` VALUES (480609664086573076, 'BROWSER', '2e5a0de806a58450', '2021-05-09 15:48:29', b'0', '2021-05-09 15:48:29', 0, 477055970535538688, 480609663323209728, 480609663323209730);
INSERT INTO `role_menu` VALUES (480609664086573077, 'BROWSER', '2e5a0de806a58450', '2021-05-09 15:48:29', b'0', '2021-05-09 15:48:29', 0, 388265075040845824, 480609663323209728, 480609663323209730);
INSERT INTO `role_menu` VALUES (480609664086573078, 'BROWSER', '2e5a0de806a58450', '2021-05-09 15:48:29', b'0', '2021-05-09 15:48:29', 0, 388235322183385088, 480609663323209728, 480609663323209730);
INSERT INTO `role_menu` VALUES (480609664086573079, 'BROWSER', '2e5a0de806a58450', '2021-05-09 15:48:29', b'0', '2021-05-09 15:48:29', 0, 388207116738887680, 480609663323209728, 480609663323209730);
INSERT INTO `role_menu` VALUES (480609664086573080, 'BROWSER', '2e5a0de806a58450', '2021-05-09 15:48:29', b'0', '2021-05-09 15:48:29', 0, 387857677398573056, 480609663323209728, 480609663323209730);
INSERT INTO `role_menu` VALUES (480609664086573081, 'BROWSER', '2e5a0de806a58450', '2021-05-09 15:48:29', b'0', '2021-05-09 15:48:29', 0, 388225348904419328, 480609663323209728, 480609663323209730);
INSERT INTO `role_menu` VALUES (480609664086573082, 'BROWSER', '2e5a0de806a58450', '2021-05-09 15:48:29', b'0', '2021-05-09 15:48:29', 0, 388222133173485568, 480609663323209728, 480609663323209730);
INSERT INTO `role_menu` VALUES (480609664086573083, 'BROWSER', '2e5a0de806a58450', '2021-05-09 15:48:29', b'0', '2021-05-09 15:48:29', 0, 388253552423731200, 480609663323209728, 480609663323209730);
INSERT INTO `role_menu` VALUES (480609664086573084, 'BROWSER', '2e5a0de806a58450', '2021-05-09 15:48:29', b'0', '2021-05-09 15:48:29', 0, 388244378004488192, 480609663323209728, 480609663323209730);
INSERT INTO `role_menu` VALUES (480609664086573085, 'BROWSER', '2e5a0de806a58450', '2021-05-09 15:48:29', b'0', '2021-05-09 15:48:29', 0, 388276336621256704, 480609663323209728, 480609663323209730);
INSERT INTO `role_menu` VALUES (480609664086573086, 'BROWSER', '2e5a0de806a58450', '2021-05-09 15:48:29', b'0', '2021-05-09 15:48:29', 0, 388278663776305152, 480609663323209728, 480609663323209730);
INSERT INTO `role_menu` VALUES (480609664086573087, 'BROWSER', '2e5a0de806a58450', '2021-05-09 15:48:29', b'0', '2021-05-09 15:48:29', 0, 387759034322649088, 480609663323209728, 480609663323209730);
INSERT INTO `role_menu` VALUES (481426338096349184, 'BROWSER', '2e5a0de806a58450', '2021-05-11 21:53:39', b'0', '2021-05-11 21:53:39', 0, 479607886612267008, 481426337010024448, 481426337010024450);
INSERT INTO `role_menu` VALUES (481426338096349185, 'BROWSER', '2e5a0de806a58450', '2021-05-11 21:53:39', b'0', '2021-05-11 21:53:39', 0, 479809903381184512, 481426337010024448, 481426337010024450);
INSERT INTO `role_menu` VALUES (481426338096349186, 'BROWSER', '2e5a0de806a58450', '2021-05-11 21:53:39', b'0', '2021-05-11 21:53:39', 0, 479810292889419776, 481426337010024448, 481426337010024450);
INSERT INTO `role_menu` VALUES (481426338096349187, 'BROWSER', '2e5a0de806a58450', '2021-05-11 21:53:39', b'0', '2021-05-11 21:53:39', 0, 479811614569136128, 481426337010024448, 481426337010024450);
INSERT INTO `role_menu` VALUES (481426338096349188, 'BROWSER', '2e5a0de806a58450', '2021-05-11 21:53:39', b'0', '2021-05-11 21:53:39', 0, 479596149968207872, 481426337010024448, 481426337010024450);
INSERT INTO `role_menu` VALUES (481426338096349189, 'BROWSER', '2e5a0de806a58450', '2021-05-11 21:53:39', b'0', '2021-05-11 21:53:39', 0, 479809491802521600, 481426337010024448, 481426337010024450);
INSERT INTO `role_menu` VALUES (481426338096349190, 'BROWSER', '2e5a0de806a58450', '2021-05-11 21:53:39', b'0', '2021-05-11 21:53:39', 0, 479810087418855424, 481426337010024448, 481426337010024450);
INSERT INTO `role_menu` VALUES (481426338096349191, 'BROWSER', '2e5a0de806a58450', '2021-05-11 21:53:39', b'0', '2021-05-11 21:53:39', 0, 479810523244789760, 481426337010024448, 481426337010024450);
INSERT INTO `role_menu` VALUES (481426338096349192, 'BROWSER', '2e5a0de806a58450', '2021-05-11 21:53:39', b'0', '2021-05-11 21:53:39', 0, 479811845440405504, 481426337010024448, 481426337010024450);
INSERT INTO `role_menu` VALUES (481426338096349193, 'BROWSER', '2e5a0de806a58450', '2021-05-11 21:53:39', b'0', '2021-05-11 21:53:39', 0, 479811990504603648, 481426337010024448, 481426337010024450);
INSERT INTO `role_menu` VALUES (481426338096349194, 'BROWSER', '2e5a0de806a58450', '2021-05-11 21:53:39', b'0', '2021-05-11 21:53:39', 0, 479597892370169856, 481426337010024448, 481426337010024450);
INSERT INTO `role_menu` VALUES (481426338096349195, 'BROWSER', '2e5a0de806a58450', '2021-05-11 21:53:39', b'0', '2021-05-11 21:53:39', 0, 479602534214795264, 481426337010024448, 481426337010024450);
INSERT INTO `role_menu` VALUES (481426338096349196, 'BROWSER', '2e5a0de806a58450', '2021-05-11 21:53:39', b'0', '2021-05-11 21:53:39', 0, 479607700464861184, 481426337010024448, 481426337010024450);
INSERT INTO `role_menu` VALUES (481702695711801344, 'BROWSER', '2e5a0de806a58450', '2021-05-12 16:11:48', b'0', '2021-05-12 16:11:48', 0, 479822398317658112, 384564355850567680, 481433458044829698);
INSERT INTO `role_menu` VALUES (481702695799881728, 'BROWSER', '2e5a0de806a58450', '2021-05-12 16:11:48', b'0', '2021-05-12 16:11:48', 0, 479823921156194304, 384564355850567680, 481433458044829698);
INSERT INTO `role_menu` VALUES (481702695833436160, 'BROWSER', '2e5a0de806a58450', '2021-05-12 16:11:48', b'0', '2021-05-12 16:11:48', 0, 479824576017072128, 384564355850567680, 481433458044829698);
INSERT INTO `role_menu` VALUES (481702695887962112, 'BROWSER', '2e5a0de806a58450', '2021-05-12 16:11:48', b'0', '2021-05-12 16:11:48', 0, 479822512855711744, 384564355850567680, 481433458044829698);
INSERT INTO `role_menu` VALUES (481702695921516544, 'BROWSER', '2e5a0de806a58450', '2021-05-12 16:11:48', b'0', '2021-05-12 16:11:48', 0, 479824763963834368, 384564355850567680, 481433458044829698);
INSERT INTO `role_menu` VALUES (481702695950876672, 'BROWSER', '2e5a0de806a58450', '2021-05-12 16:11:48', b'0', '2021-05-12 16:11:48', 0, 479824905504817152, 384564355850567680, 481433458044829698);
INSERT INTO `role_menu` VALUES (481702695980236800, 'BROWSER', '2e5a0de806a58450', '2021-05-12 16:11:48', b'0', '2021-05-12 16:11:48', 0, 479822620091482112, 384564355850567680, 481433458044829698);
INSERT INTO `role_menu` VALUES (481702696009596928, 'BROWSER', '2e5a0de806a58450', '2021-05-12 16:11:48', b'0', '2021-05-12 16:11:48', 0, 479825069736984576, 384564355850567680, 481433458044829698);
INSERT INTO `role_menu` VALUES (481702696038957056, 'BROWSER', '2e5a0de806a58450', '2021-05-12 16:11:48', b'0', '2021-05-12 16:11:48', 0, 479825211194081280, 384564355850567680, 481433458044829698);
INSERT INTO `role_menu` VALUES (481702696072511488, 'BROWSER', '2e5a0de806a58450', '2021-05-12 16:11:48', b'0', '2021-05-12 16:11:48', 0, 479822700521455616, 384564355850567680, 481433458044829698);
INSERT INTO `role_menu` VALUES (481702696114454528, 'BROWSER', '2e5a0de806a58450', '2021-05-12 16:11:48', b'0', '2021-05-12 16:11:48', 0, 479825341007790080, 384564355850567680, 481433458044829698);
INSERT INTO `role_menu` VALUES (481702696139620352, 'BROWSER', '2e5a0de806a58450', '2021-05-12 16:11:48', b'0', '2021-05-12 16:11:48', 0, 479825723977105408, 384564355850567680, 481433458044829698);
INSERT INTO `role_menu` VALUES (481702696168980480, 'BROWSER', '2e5a0de806a58450', '2021-05-12 16:11:48', b'0', '2021-05-12 16:11:48', 0, 479825852293447680, 384564355850567680, 481433458044829698);
INSERT INTO `role_menu` VALUES (522668572237889536, 'BROWSER', '0a9cbbbb4f130988', '2021-09-02 17:15:34', b'0', '2021-09-02 17:15:34', 0, 384564356282580992, 384564355850567680, 384564356127391744);
INSERT INTO `role_menu` VALUES (522668572263055360, 'BROWSER', '0a9cbbbb4f130988', '2021-09-02 17:15:34', b'0', '2021-09-02 17:15:34', 0, 384622492808904704, 384564355850567680, 384564356127391744);
INSERT INTO `role_menu` VALUES (522668572284026880, 'BROWSER', '0a9cbbbb4f130988', '2021-09-02 17:15:34', b'0', '2021-09-02 17:15:34', 0, 384623418722484224, 384564355850567680, 384564356127391744);
INSERT INTO `role_menu` VALUES (522668572304998400, 'BROWSER', '0a9cbbbb4f130988', '2021-09-02 17:15:34', b'0', '2021-09-02 17:15:34', 0, 384623800752275456, 384564355850567680, 384564356127391744);
INSERT INTO `role_menu` VALUES (522668572325969920, 'BROWSER', '0a9cbbbb4f130988', '2021-09-02 17:15:34', b'0', '2021-09-02 17:15:34', 0, 384585685832564736, 384564355850567680, 384564356127391744);
INSERT INTO `role_menu` VALUES (522668572346941440, 'BROWSER', '0a9cbbbb4f130988', '2021-09-02 17:15:34', b'0', '2021-09-02 17:15:34', 0, 384590226917425152, 384564355850567680, 384564356127391744);
INSERT INTO `role_menu` VALUES (522668572367912960, 'BROWSER', '0a9cbbbb4f130988', '2021-09-02 17:15:34', b'0', '2021-09-02 17:15:34', 0, 384590896739385344, 384564355850567680, 384564356127391744);
INSERT INTO `role_menu` VALUES (522668572388884480, 'BROWSER', '0a9cbbbb4f130988', '2021-09-02 17:15:34', b'0', '2021-09-02 17:15:34', 0, 384591491382640640, 384564355850567680, 384564356127391744);
INSERT INTO `role_menu` VALUES (522668572409856000, 'BROWSER', '0a9cbbbb4f130988', '2021-09-02 17:15:34', b'0', '2021-09-02 17:15:34', 0, 384564356353884160, 384564355850567680, 384564356127391744);
INSERT INTO `role_menu` VALUES (522668572426633216, 'BROWSER', '0a9cbbbb4f130988', '2021-09-02 17:15:34', b'0', '2021-09-02 17:15:34', 0, 384595237055496192, 384564355850567680, 384564356127391744);
INSERT INTO `role_menu` VALUES (522668572447604736, 'BROWSER', '0a9cbbbb4f130988', '2021-09-02 17:15:34', b'0', '2021-09-02 17:15:34', 0, 384564356458741760, 384564355850567680, 384564356127391744);
INSERT INTO `role_menu` VALUES (522668572464381952, 'BROWSER', '0a9cbbbb4f130988', '2021-09-02 17:15:34', b'0', '2021-09-02 17:15:34', 0, 384596229272633344, 384564355850567680, 384564356127391744);
INSERT INTO `role_menu` VALUES (522668572489547776, 'BROWSER', '0a9cbbbb4f130988', '2021-09-02 17:15:34', b'0', '2021-09-02 17:15:34', 0, 384599971527131136, 384564355850567680, 384564356127391744);
INSERT INTO `role_menu` VALUES (522668572506324992, 'BROWSER', '0a9cbbbb4f130988', '2021-09-02 17:15:34', b'0', '2021-09-02 17:15:34', 0, 384600372414513152, 384564355850567680, 384564356127391744);
INSERT INTO `role_menu` VALUES (522668572527296512, 'BROWSER', '0a9cbbbb4f130988', '2021-09-02 17:15:34', b'0', '2021-09-02 17:15:34', 0, 384601336034885632, 384564355850567680, 384564356127391744);
INSERT INTO `role_menu` VALUES (522668572548268032, 'BROWSER', '0a9cbbbb4f130988', '2021-09-02 17:15:34', b'0', '2021-09-02 17:15:34', 0, 384586680859885568, 384564355850567680, 384564356127391744);
INSERT INTO `role_menu` VALUES (522668572569239552, 'BROWSER', '0a9cbbbb4f130988', '2021-09-02 17:15:34', b'0', '2021-09-02 17:15:34', 0, 384609205933309952, 384564355850567680, 384564356127391744);
INSERT INTO `role_menu` VALUES (522668572586016768, 'BROWSER', '0a9cbbbb4f130988', '2021-09-02 17:15:34', b'0', '2021-09-02 17:15:34', 0, 384613188773085184, 384564355850567680, 384564356127391744);
INSERT INTO `role_menu` VALUES (522668572606988288, 'BROWSER', '0a9cbbbb4f130988', '2021-09-02 17:15:34', b'0', '2021-09-02 17:15:34', 0, 384613517061259264, 384564355850567680, 384564356127391744);
INSERT INTO `role_menu` VALUES (522668572627959808, 'BROWSER', '0a9cbbbb4f130988', '2021-09-02 17:15:34', b'0', '2021-09-02 17:15:34', 0, 384614544376332288, 384564355850567680, 384564356127391744);
INSERT INTO `role_menu` VALUES (522668572644737024, 'BROWSER', '0a9cbbbb4f130988', '2021-09-02 17:15:34', b'0', '2021-09-02 17:15:34', 0, 384587773211836416, 384564355850567680, 384564356127391744);
INSERT INTO `role_menu` VALUES (522668572665708544, 'BROWSER', '0a9cbbbb4f130988', '2021-09-02 17:15:34', b'0', '2021-09-02 17:15:34', 0, 384617627336572928, 384564355850567680, 384564356127391744);
INSERT INTO `role_menu` VALUES (522668572686680064, 'BROWSER', '0a9cbbbb4f130988', '2021-09-02 17:15:34', b'0', '2021-09-02 17:15:34', 0, 384619429138268160, 384564355850567680, 384564356127391744);
INSERT INTO `role_menu` VALUES (522668572707651584, 'BROWSER', '0a9cbbbb4f130988', '2021-09-02 17:15:34', b'0', '2021-09-02 17:15:34', 0, 384589424232497152, 384564355850567680, 384564356127391744);
INSERT INTO `role_menu` VALUES (522668572724428800, 'BROWSER', '0a9cbbbb4f130988', '2021-09-02 17:15:34', b'0', '2021-09-02 17:15:34', 0, 384620989876535296, 384564355850567680, 384564356127391744);
INSERT INTO `role_menu` VALUES (522668572741206016, 'BROWSER', '0a9cbbbb4f130988', '2021-09-02 17:15:34', b'0', '2021-09-02 17:15:34', 0, 405945198829371392, 384564355850567680, 384564356127391744);
INSERT INTO `role_menu` VALUES (522668572762177536, 'BROWSER', '0a9cbbbb4f130988', '2021-09-02 17:15:34', b'0', '2021-09-02 17:15:34', 0, 384621330957336576, 384564355850567680, 384564356127391744);
INSERT INTO `role_menu` VALUES (522668572787343360, 'BROWSER', '0a9cbbbb4f130988', '2021-09-02 17:15:34', b'0', '2021-09-02 17:15:34', 0, 384621781220065280, 384564355850567680, 384564356127391744);
INSERT INTO `role_menu` VALUES (522668572804120576, 'BROWSER', '0a9cbbbb4f130988', '2021-09-02 17:15:34', b'0', '2021-09-02 17:15:34', 0, 410663893027782656, 384564355850567680, 384564356127391744);
INSERT INTO `role_menu` VALUES (522668572825092096, 'BROWSER', '0a9cbbbb4f130988', '2021-09-02 17:15:34', b'0', '2021-09-02 17:15:34', 0, 410666932606337024, 384564355850567680, 384564356127391744);
INSERT INTO `role_menu` VALUES (522668572846063616, 'BROWSER', '0a9cbbbb4f130988', '2021-09-02 17:15:34', b'0', '2021-09-02 17:15:34', 0, 410664643070001152, 384564355850567680, 384564356127391744);
INSERT INTO `role_menu` VALUES (522668572862840832, 'BROWSER', '0a9cbbbb4f130988', '2021-09-02 17:15:34', b'0', '2021-09-02 17:15:34', 0, 509159539426197504, 384564355850567680, 384564356127391744);
INSERT INTO `role_menu` VALUES (522668572883812352, 'BROWSER', '0a9cbbbb4f130988', '2021-09-02 17:15:34', b'0', '2021-09-02 17:15:34', 0, 509161437843685376, 384564355850567680, 384564356127391744);
INSERT INTO `role_menu` VALUES (522668572929949696, 'BROWSER', '0a9cbbbb4f130988', '2021-09-02 17:15:34', b'0', '2021-09-02 17:15:34', 0, 509174145959854080, 384564355850567680, 384564356127391744);
INSERT INTO `role_menu` VALUES (522668572946726912, 'BROWSER', '0a9cbbbb4f130988', '2021-09-02 17:15:34', b'0', '2021-09-02 17:15:34', 0, 510028671306694656, 384564355850567680, 384564356127391744);
INSERT INTO `role_menu` VALUES (522668572971892736, 'BROWSER', '0a9cbbbb4f130988', '2021-09-02 17:15:34', b'0', '2021-09-02 17:15:34', 0, 522667894459334656, 384564355850567680, 384564356127391744);
INSERT INTO `role_menu` VALUES (522668572988669952, 'BROWSER', '0a9cbbbb4f130988', '2021-09-02 17:15:34', b'0', '2021-09-02 17:15:34', 0, 522668108171706368, 384564355850567680, 384564356127391744);
INSERT INTO `role_menu` VALUES (522668573005447168, 'BROWSER', '0a9cbbbb4f130988', '2021-09-02 17:15:34', b'0', '2021-09-02 17:15:34', 0, 522668482806939648, 384564355850567680, 384564356127391744);

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
  `login_ip` varchar(150) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '1.1.1.1' COMMENT '最后登录ip',
  `login_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '最后登录时间',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `UKsb8bbouer5wak8vyiiy4pf2bx`(`username`) USING BTREE,
  INDEX `FK4k8a1qa0wofm01aijepmu0d4g`(`parent_id`) USING BTREE,
  CONSTRAINT `FK4k8a1qa0wofm01aijepmu0d4g` FOREIGN KEY (`parent_id`) REFERENCES `user` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '用户表。' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES (384564355850567680, 'OTHERS', '0a9cbbbb4f130988', '2020-08-17 14:58:43', b'0', '2020-08-17 14:58:43', 0, '172eee54aa664e9dd0536b063796e54e', 'admin', NULL, '1.1.1.1', '2021-08-11 02:19:12');
INSERT INTO `user` VALUES (480609663323209728, 'BROWSER', '2e5a0de806a58450', '2021-05-09 15:48:29', b'0', '2021-05-09 15:48:29', 0, 'f659042061cd48f82ece5cb5880678ec', 'bls001', NULL, '1.1.1.1', '2021-08-11 02:19:12');
INSERT INTO `user` VALUES (481426337010024448, 'BROWSER', '2e5a0de806a58450', '2021-05-11 21:53:39', b'0', '2021-05-11 21:53:39', 0, 'a4ddfe2af0d8207ee3a04f5e33d6087a', 'bgy001', NULL, '1.1.1.1', '2021-08-11 02:19:12');
INSERT INTO `user` VALUES (481433458044829696, 'BROWSER', '2e5a0de806a58450', '2021-05-11 22:21:57', b'0', '2021-05-11 22:21:57', 0, '6542e33c58280b8318abba5469abeab0', 'gys001', NULL, '1.1.1.1', '2021-08-11 02:19:12');

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
INSERT INTO `user_detail` VALUES (384564356047699968, 'OTHERS', '0a9cbbbb4f130988', '2020-08-17 14:58:43', b'0', '2021-08-27 16:28:41', 10, NULL, 510026444403900416, '1979597540@qq.com', 384564355968008192, '13888888888', '超级管理员', 0, 3, 384564355850567680, NULL, NULL, NULL, NULL);
INSERT INTO `user_detail` VALUES (480609663323209729, 'BROWSER', '2e5a0de806a58450', '2021-05-09 15:48:29', b'0', '2021-05-09 15:48:29', 0, NULL, NULL, '932852117@qq.com', 480609425531338752, '13543495276', NULL, 0, 0, 480609663323209728, NULL, NULL, NULL, NULL);
INSERT INTO `user_detail` VALUES (481426337010024449, 'BROWSER', '2e5a0de806a58450', '2021-05-11 21:53:39', b'0', '2021-05-11 21:53:39', 0, NULL, NULL, '932852117@qq.com', 481389268183285760, '13543495277', NULL, 0, 0, 481426337010024448, NULL, NULL, NULL, NULL);
INSERT INTO `user_detail` VALUES (481433458044829697, 'BROWSER', '2e5a0de806a58450', '2021-05-11 22:21:57', b'0', '2021-05-11 22:21:57', 0, NULL, NULL, '932852117@qq.com', 481423958302785536, '13543495275', NULL, 0, 0, 481433458044829696, NULL, NULL, NULL, NULL);

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
INSERT INTO `user_role` VALUES (480609663323209731, 'BROWSER', '2e5a0de806a58450', '2021-05-09 15:48:29', b'0', '2021-05-09 15:48:29', 0, 480609663323209728, 480609663323209730, 480609663323209728);
INSERT INTO `user_role` VALUES (481426337010024451, 'BROWSER', '2e5a0de806a58450', '2021-05-11 21:53:39', b'0', '2021-05-11 21:53:39', 0, 481426337010024448, 481426337010024450, 481426337010024448);
INSERT INTO `user_role` VALUES (481433458044829699, 'BROWSER', '2e5a0de806a58450', '2021-05-11 22:21:57', b'0', '2021-05-11 22:21:57', 0, 481433458044829696, 481433458044829698, 481433458044829696);

SET FOREIGN_KEY_CHECKS = 1;
