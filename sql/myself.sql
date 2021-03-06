/*
 Navicat Premium Data Transfer

 Source Server         : myTencent
 Source Server Type    : MySQL
 Source Server Version : 80026
 Source Host           : 1.117.223.86:3306
 Source Schema         : myself

 Target Server Type    : MySQL
 Target Server Version : 80026
 File Encoding         : 65001

 Date: 19/10/2021 10:48:15
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for QRTZ_BLOB_TRIGGERS
-- ----------------------------
DROP TABLE IF EXISTS `QRTZ_BLOB_TRIGGERS`;
CREATE TABLE `QRTZ_BLOB_TRIGGERS` (
  `sched_name` varchar(120) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `trigger_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `trigger_group` varchar(200) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `blob_data` blob,
  PRIMARY KEY (`sched_name`,`trigger_name`,`trigger_group`) USING BTREE,
  CONSTRAINT `QRTZ_BLOB_TRIGGERS_ibfk_1` FOREIGN KEY (`sched_name`, `trigger_name`, `trigger_group`) REFERENCES `QRTZ_TRIGGERS` (`sched_name`, `trigger_name`, `trigger_group`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8_bin;

-- ----------------------------
-- Records of QRTZ_BLOB_TRIGGERS
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for QRTZ_CALENDARS
-- ----------------------------
DROP TABLE IF EXISTS `QRTZ_CALENDARS`;
CREATE TABLE `QRTZ_CALENDARS` (
  `sched_name` varchar(120) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `calendar_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `calendar` blob NOT NULL,
  PRIMARY KEY (`sched_name`,`calendar_name`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8_bin;

-- ----------------------------
-- Records of QRTZ_CALENDARS
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for QRTZ_CRON_TRIGGERS
-- ----------------------------
DROP TABLE IF EXISTS `QRTZ_CRON_TRIGGERS`;
CREATE TABLE `QRTZ_CRON_TRIGGERS` (
  `sched_name` varchar(120) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `trigger_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `trigger_group` varchar(200) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `cron_expression` varchar(200) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `time_zone_id` varchar(80) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`sched_name`,`trigger_name`,`trigger_group`) USING BTREE,
  CONSTRAINT `QRTZ_CRON_TRIGGERS_ibfk_1` FOREIGN KEY (`sched_name`, `trigger_name`, `trigger_group`) REFERENCES `QRTZ_TRIGGERS` (`sched_name`, `trigger_name`, `trigger_group`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8_bin;

-- ----------------------------
-- Records of QRTZ_CRON_TRIGGERS
-- ----------------------------
BEGIN;
INSERT INTO `QRTZ_CRON_TRIGGERS` VALUES ('RuoyiScheduler', 'TASK_CLASS_NAME1', 'DEFAULT', '0/10 * * * * ?', 'Asia/Shanghai');
INSERT INTO `QRTZ_CRON_TRIGGERS` VALUES ('RuoyiScheduler', 'TASK_CLASS_NAME2', 'DEFAULT', '0/15 * * * * ?', 'Asia/Shanghai');
INSERT INTO `QRTZ_CRON_TRIGGERS` VALUES ('RuoyiScheduler', 'TASK_CLASS_NAME3', 'DEFAULT', '0/20 * * * * ?', 'Asia/Shanghai');
COMMIT;

-- ----------------------------
-- Table structure for QRTZ_FIRED_TRIGGERS
-- ----------------------------
DROP TABLE IF EXISTS `QRTZ_FIRED_TRIGGERS`;
CREATE TABLE `QRTZ_FIRED_TRIGGERS` (
  `sched_name` varchar(120) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `entry_id` varchar(95) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `trigger_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `trigger_group` varchar(200) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `instance_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `fired_time` bigint NOT NULL,
  `sched_time` bigint NOT NULL,
  `priority` int NOT NULL,
  `state` varchar(16) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `job_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `job_group` varchar(200) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `is_nonconcurrent` varchar(1) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `requests_recovery` varchar(1) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`sched_name`,`entry_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8_bin;

-- ----------------------------
-- Records of QRTZ_FIRED_TRIGGERS
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for QRTZ_JOB_DETAILS
-- ----------------------------
DROP TABLE IF EXISTS `QRTZ_JOB_DETAILS`;
CREATE TABLE `QRTZ_JOB_DETAILS` (
  `sched_name` varchar(120) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `job_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `job_group` varchar(200) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `description` varchar(250) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `job_class_name` varchar(250) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `is_durable` varchar(1) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `is_nonconcurrent` varchar(1) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `is_update_data` varchar(1) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `requests_recovery` varchar(1) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `job_data` blob,
  PRIMARY KEY (`sched_name`,`job_name`,`job_group`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8_bin;

-- ----------------------------
-- Records of QRTZ_JOB_DETAILS
-- ----------------------------
BEGIN;
INSERT INTO `QRTZ_JOB_DETAILS` VALUES ('RuoyiScheduler', 'TASK_CLASS_NAME1', 'DEFAULT', NULL, 'com.ruoyi.quartz.util.QuartzDisallowConcurrentExecution', '0', '1', '0', '0', 0xACED0005737200156F72672E71756172747A2E4A6F62446174614D61709FB083E8BFA9B0CB020000787200266F72672E71756172747A2E7574696C732E537472696E674B65794469727479466C61674D61708208E8C3FBC55D280200015A0013616C6C6F77735472616E7369656E74446174617872001D6F72672E71756172747A2E7574696C732E4469727479466C61674D617013E62EAD28760ACE0200025A000564697274794C00036D617074000F4C6A6176612F7574696C2F4D61703B787001737200116A6176612E7574696C2E486173684D61700507DAC1C31660D103000246000A6C6F6164466163746F724900097468726573686F6C6478703F4000000000000C7708000000100000000174000F5441534B5F50524F504552544945537372001E636F6D2E72756F79692E71756172747A2E646F6D61696E2E5379734A6F6200000000000000010200084C000A636F6E63757272656E747400124C6A6176612F6C616E672F537472696E673B4C000E63726F6E45787072657373696F6E71007E00094C000C696E766F6B6554617267657471007E00094C00086A6F6247726F757071007E00094C00056A6F6249647400104C6A6176612F6C616E672F4C6F6E673B4C00076A6F624E616D6571007E00094C000D6D697366697265506F6C69637971007E00094C000673746174757371007E000978720027636F6D2E72756F79692E636F6D6D6F6E2E636F72652E646F6D61696E2E42617365456E7469747900000000000000010200074C0008637265617465427971007E00094C000A63726561746554696D657400104C6A6176612F7574696C2F446174653B4C0006706172616D7371007E00034C000672656D61726B71007E00094C000B73656172636856616C756571007E00094C0008757064617465427971007E00094C000A75706461746554696D6571007E000C787074000561646D696E7372000E6A6176612E7574696C2E44617465686A81014B59741903000078707708000001795737911078707400007070707400013174000E302F3130202A202A202A202A203F74001172795461736B2E72794E6F506172616D7374000744454641554C547372000E6A6176612E6C616E672E4C6F6E673B8BE490CC8F23DF0200014A000576616C7565787200106A6176612E6C616E672E4E756D62657286AC951D0B94E08B02000078700000000000000001740018E7B3BBE7BB9FE9BB98E8AEA4EFBC88E697A0E58F82EFBC8974000133740001317800);
INSERT INTO `QRTZ_JOB_DETAILS` VALUES ('RuoyiScheduler', 'TASK_CLASS_NAME2', 'DEFAULT', NULL, 'com.ruoyi.quartz.util.QuartzDisallowConcurrentExecution', '0', '1', '0', '0', 0xACED0005737200156F72672E71756172747A2E4A6F62446174614D61709FB083E8BFA9B0CB020000787200266F72672E71756172747A2E7574696C732E537472696E674B65794469727479466C61674D61708208E8C3FBC55D280200015A0013616C6C6F77735472616E7369656E74446174617872001D6F72672E71756172747A2E7574696C732E4469727479466C61674D617013E62EAD28760ACE0200025A000564697274794C00036D617074000F4C6A6176612F7574696C2F4D61703B787001737200116A6176612E7574696C2E486173684D61700507DAC1C31660D103000246000A6C6F6164466163746F724900097468726573686F6C6478703F4000000000000C7708000000100000000174000F5441534B5F50524F504552544945537372001E636F6D2E72756F79692E71756172747A2E646F6D61696E2E5379734A6F6200000000000000010200084C000A636F6E63757272656E747400124C6A6176612F6C616E672F537472696E673B4C000E63726F6E45787072657373696F6E71007E00094C000C696E766F6B6554617267657471007E00094C00086A6F6247726F757071007E00094C00056A6F6249647400104C6A6176612F6C616E672F4C6F6E673B4C00076A6F624E616D6571007E00094C000D6D697366697265506F6C69637971007E00094C000673746174757371007E000978720027636F6D2E72756F79692E636F6D6D6F6E2E636F72652E646F6D61696E2E42617365456E7469747900000000000000010200074C0008637265617465427971007E00094C000A63726561746554696D657400104C6A6176612F7574696C2F446174653B4C0006706172616D7371007E00034C000672656D61726B71007E00094C000B73656172636856616C756571007E00094C0008757064617465427971007E00094C000A75706461746554696D6571007E000C787074000561646D696E7372000E6A6176612E7574696C2E44617465686A81014B59741903000078707708000001795737911078707400007070707400013174000E302F3135202A202A202A202A203F74001572795461736B2E7279506172616D7328277279272974000744454641554C547372000E6A6176612E6C616E672E4C6F6E673B8BE490CC8F23DF0200014A000576616C7565787200106A6176612E6C616E672E4E756D62657286AC951D0B94E08B02000078700000000000000002740018E7B3BBE7BB9FE9BB98E8AEA4EFBC88E69C89E58F82EFBC8974000133740001317800);
INSERT INTO `QRTZ_JOB_DETAILS` VALUES ('RuoyiScheduler', 'TASK_CLASS_NAME3', 'DEFAULT', NULL, 'com.ruoyi.quartz.util.QuartzDisallowConcurrentExecution', '0', '1', '0', '0', 0xACED0005737200156F72672E71756172747A2E4A6F62446174614D61709FB083E8BFA9B0CB020000787200266F72672E71756172747A2E7574696C732E537472696E674B65794469727479466C61674D61708208E8C3FBC55D280200015A0013616C6C6F77735472616E7369656E74446174617872001D6F72672E71756172747A2E7574696C732E4469727479466C61674D617013E62EAD28760ACE0200025A000564697274794C00036D617074000F4C6A6176612F7574696C2F4D61703B787001737200116A6176612E7574696C2E486173684D61700507DAC1C31660D103000246000A6C6F6164466163746F724900097468726573686F6C6478703F4000000000000C7708000000100000000174000F5441534B5F50524F504552544945537372001E636F6D2E72756F79692E71756172747A2E646F6D61696E2E5379734A6F6200000000000000010200084C000A636F6E63757272656E747400124C6A6176612F6C616E672F537472696E673B4C000E63726F6E45787072657373696F6E71007E00094C000C696E766F6B6554617267657471007E00094C00086A6F6247726F757071007E00094C00056A6F6249647400104C6A6176612F6C616E672F4C6F6E673B4C00076A6F624E616D6571007E00094C000D6D697366697265506F6C69637971007E00094C000673746174757371007E000978720027636F6D2E72756F79692E636F6D6D6F6E2E636F72652E646F6D61696E2E42617365456E7469747900000000000000010200074C0008637265617465427971007E00094C000A63726561746554696D657400104C6A6176612F7574696C2F446174653B4C0006706172616D7371007E00034C000672656D61726B71007E00094C000B73656172636856616C756571007E00094C0008757064617465427971007E00094C000A75706461746554696D6571007E000C787074000561646D696E7372000E6A6176612E7574696C2E44617465686A81014B59741903000078707708000001795737911078707400007070707400013174000E302F3230202A202A202A202A203F74003872795461736B2E72794D756C7469706C65506172616D7328277279272C20747275652C20323030304C2C203331362E3530442C203130302974000744454641554C547372000E6A6176612E6C616E672E4C6F6E673B8BE490CC8F23DF0200014A000576616C7565787200106A6176612E6C616E672E4E756D62657286AC951D0B94E08B02000078700000000000000003740018E7B3BBE7BB9FE9BB98E8AEA4EFBC88E5A49AE58F82EFBC8974000133740001317800);
COMMIT;

-- ----------------------------
-- Table structure for QRTZ_LOCKS
-- ----------------------------
DROP TABLE IF EXISTS `QRTZ_LOCKS`;
CREATE TABLE `QRTZ_LOCKS` (
  `sched_name` varchar(120) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `lock_name` varchar(40) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`sched_name`,`lock_name`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8_bin;

-- ----------------------------
-- Records of QRTZ_LOCKS
-- ----------------------------
BEGIN;
INSERT INTO `QRTZ_LOCKS` VALUES ('RuoyiScheduler', 'STATE_ACCESS');
INSERT INTO `QRTZ_LOCKS` VALUES ('RuoyiScheduler', 'TRIGGER_ACCESS');
COMMIT;

-- ----------------------------
-- Table structure for QRTZ_PAUSED_TRIGGER_GRPS
-- ----------------------------
DROP TABLE IF EXISTS `QRTZ_PAUSED_TRIGGER_GRPS`;
CREATE TABLE `QRTZ_PAUSED_TRIGGER_GRPS` (
  `sched_name` varchar(120) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `trigger_group` varchar(200) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`sched_name`,`trigger_group`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8_bin;

-- ----------------------------
-- Records of QRTZ_PAUSED_TRIGGER_GRPS
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for QRTZ_SCHEDULER_STATE
-- ----------------------------
DROP TABLE IF EXISTS `QRTZ_SCHEDULER_STATE`;
CREATE TABLE `QRTZ_SCHEDULER_STATE` (
  `sched_name` varchar(120) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `instance_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `last_checkin_time` bigint NOT NULL,
  `checkin_interval` bigint NOT NULL,
  PRIMARY KEY (`sched_name`,`instance_name`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8_bin;

-- ----------------------------
-- Records of QRTZ_SCHEDULER_STATE
-- ----------------------------
BEGIN;
INSERT INTO `QRTZ_SCHEDULER_STATE` VALUES ('RuoyiScheduler', 'fenggenyuandeMacBook-Pro.local1634611399768', 1634611692426, 15000);
COMMIT;

-- ----------------------------
-- Table structure for QRTZ_SIMPLE_TRIGGERS
-- ----------------------------
DROP TABLE IF EXISTS `QRTZ_SIMPLE_TRIGGERS`;
CREATE TABLE `QRTZ_SIMPLE_TRIGGERS` (
  `sched_name` varchar(120) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `trigger_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `trigger_group` varchar(200) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `repeat_count` bigint NOT NULL,
  `repeat_interval` bigint NOT NULL,
  `times_triggered` bigint NOT NULL,
  PRIMARY KEY (`sched_name`,`trigger_name`,`trigger_group`) USING BTREE,
  CONSTRAINT `QRTZ_SIMPLE_TRIGGERS_ibfk_1` FOREIGN KEY (`sched_name`, `trigger_name`, `trigger_group`) REFERENCES `QRTZ_TRIGGERS` (`sched_name`, `trigger_name`, `trigger_group`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8_bin;

-- ----------------------------
-- Records of QRTZ_SIMPLE_TRIGGERS
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for QRTZ_SIMPROP_TRIGGERS
-- ----------------------------
DROP TABLE IF EXISTS `QRTZ_SIMPROP_TRIGGERS`;
CREATE TABLE `QRTZ_SIMPROP_TRIGGERS` (
  `sched_name` varchar(120) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `trigger_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `trigger_group` varchar(200) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `str_prop_1` varchar(512) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `str_prop_2` varchar(512) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `str_prop_3` varchar(512) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `int_prop_1` int DEFAULT NULL,
  `int_prop_2` int DEFAULT NULL,
  `long_prop_1` bigint DEFAULT NULL,
  `long_prop_2` bigint DEFAULT NULL,
  `dec_prop_1` decimal(13,4) DEFAULT NULL,
  `dec_prop_2` decimal(13,4) DEFAULT NULL,
  `bool_prop_1` varchar(1) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `bool_prop_2` varchar(1) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`sched_name`,`trigger_name`,`trigger_group`) USING BTREE,
  CONSTRAINT `QRTZ_SIMPROP_TRIGGERS_ibfk_1` FOREIGN KEY (`sched_name`, `trigger_name`, `trigger_group`) REFERENCES `QRTZ_TRIGGERS` (`sched_name`, `trigger_name`, `trigger_group`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8_bin;

-- ----------------------------
-- Records of QRTZ_SIMPROP_TRIGGERS
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for QRTZ_TRIGGERS
-- ----------------------------
DROP TABLE IF EXISTS `QRTZ_TRIGGERS`;
CREATE TABLE `QRTZ_TRIGGERS` (
  `sched_name` varchar(120) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `trigger_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `trigger_group` varchar(200) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `job_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `job_group` varchar(200) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `description` varchar(250) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `next_fire_time` bigint DEFAULT NULL,
  `prev_fire_time` bigint DEFAULT NULL,
  `priority` int DEFAULT NULL,
  `trigger_state` varchar(16) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `trigger_type` varchar(8) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `start_time` bigint NOT NULL,
  `end_time` bigint DEFAULT NULL,
  `calendar_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `misfire_instr` smallint DEFAULT NULL,
  `job_data` blob,
  PRIMARY KEY (`sched_name`,`trigger_name`,`trigger_group`) USING BTREE,
  KEY `sched_name` (`sched_name`,`job_name`,`job_group`) USING BTREE,
  CONSTRAINT `QRTZ_TRIGGERS_ibfk_1` FOREIGN KEY (`sched_name`, `job_name`, `job_group`) REFERENCES `QRTZ_JOB_DETAILS` (`sched_name`, `job_name`, `job_group`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8_bin;

-- ----------------------------
-- Records of QRTZ_TRIGGERS
-- ----------------------------
BEGIN;
INSERT INTO `QRTZ_TRIGGERS` VALUES ('RuoyiScheduler', 'TASK_CLASS_NAME1', 'DEFAULT', 'TASK_CLASS_NAME1', 'DEFAULT', NULL, 1634611400000, -1, 5, 'PAUSED', 'CRON', 1634611400000, 0, NULL, 2, '');
INSERT INTO `QRTZ_TRIGGERS` VALUES ('RuoyiScheduler', 'TASK_CLASS_NAME2', 'DEFAULT', 'TASK_CLASS_NAME2', 'DEFAULT', NULL, 1634611410000, -1, 5, 'PAUSED', 'CRON', 1634611401000, 0, NULL, 2, '');
INSERT INTO `QRTZ_TRIGGERS` VALUES ('RuoyiScheduler', 'TASK_CLASS_NAME3', 'DEFAULT', 'TASK_CLASS_NAME3', 'DEFAULT', NULL, 1634611420000, -1, 5, 'PAUSED', 'CRON', 1634611401000, 0, NULL, 2, '');
COMMIT;

-- ----------------------------
-- Table structure for gen_table
-- ----------------------------
DROP TABLE IF EXISTS `gen_table`;
CREATE TABLE `gen_table` (
  `table_id` bigint NOT NULL AUTO_INCREMENT COMMENT '??????',
  `table_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT '' COMMENT '?????????',
  `table_comment` varchar(500) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT '' COMMENT '?????????',
  `sub_table_name` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '?????????????????????',
  `sub_table_fk_name` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '????????????????????????',
  `class_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT '' COMMENT '???????????????',
  `tpl_category` varchar(200) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT 'crud' COMMENT '??????????????????crud???????????? tree???????????? sub??????????????????',
  `package_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '???????????????',
  `module_name` varchar(30) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '???????????????',
  `business_name` varchar(30) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '???????????????',
  `function_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '???????????????',
  `function_author` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '??????????????????',
  `gen_type` char(1) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT '0' COMMENT '?????????????????????0zip????????? 1??????????????????',
  `gen_path` varchar(200) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT '/' COMMENT '??????????????????????????????????????????',
  `options` varchar(1000) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '??????????????????',
  `create_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT '' COMMENT '?????????',
  `create_time` datetime DEFAULT NULL COMMENT '????????????',
  `update_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT '' COMMENT '?????????',
  `update_time` datetime DEFAULT NULL COMMENT '????????????',
  `remark` varchar(500) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '??????',
  PRIMARY KEY (`table_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb3 COLLATE=utf8_bin COMMENT='?????????????????????';

-- ----------------------------
-- Records of gen_table
-- ----------------------------
BEGIN;
INSERT INTO `gen_table` VALUES (1, 'member', '', NULL, NULL, 'Member', 'crud', 'com.ruoyi.system', 'system', 'member', NULL, 'ruoyi', '0', '/', NULL, 'admin', '2021-05-11 05:35:53', '', NULL, NULL);
COMMIT;

-- ----------------------------
-- Table structure for gen_table_column
-- ----------------------------
DROP TABLE IF EXISTS `gen_table_column`;
CREATE TABLE `gen_table_column` (
  `column_id` bigint NOT NULL AUTO_INCREMENT COMMENT '??????',
  `table_id` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '???????????????',
  `column_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '?????????',
  `column_comment` varchar(500) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '?????????',
  `column_type` varchar(100) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '?????????',
  `java_type` varchar(500) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT 'JAVA??????',
  `java_field` varchar(200) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT 'JAVA?????????',
  `is_pk` char(1) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '???????????????1??????',
  `is_increment` char(1) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '???????????????1??????',
  `is_required` char(1) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '???????????????1??????',
  `is_insert` char(1) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '????????????????????????1??????',
  `is_edit` char(1) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '?????????????????????1??????',
  `is_list` char(1) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '?????????????????????1??????',
  `is_query` char(1) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '?????????????????????1??????',
  `query_type` varchar(200) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT 'EQ' COMMENT '???????????????????????????????????????????????????????????????',
  `html_type` varchar(200) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '??????????????????????????????????????????????????????????????????????????????????????????',
  `dict_type` varchar(200) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT '' COMMENT '????????????',
  `sort` int DEFAULT NULL COMMENT '??????',
  `create_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT '' COMMENT '?????????',
  `create_time` datetime DEFAULT NULL COMMENT '????????????',
  `update_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT '' COMMENT '?????????',
  `update_time` datetime DEFAULT NULL COMMENT '????????????',
  PRIMARY KEY (`column_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb3 COLLATE=utf8_bin COMMENT='???????????????????????????';

-- ----------------------------
-- Records of gen_table_column
-- ----------------------------
BEGIN;
INSERT INTO `gen_table_column` VALUES (1, '1', 'id', '??????', 'int(11)', 'Long', 'id', '1', '0', NULL, '1', NULL, NULL, NULL, 'EQ', 'input', '', 1, 'admin', '2021-05-11 05:35:53', '', NULL);
INSERT INTO `gen_table_column` VALUES (2, '1', 'name', '????????????', 'varchar(255)', 'String', 'name', '0', '0', NULL, '1', '1', '1', '1', 'LIKE', 'input', '', 2, 'admin', '2021-05-11 05:35:53', '', NULL);
INSERT INTO `gen_table_column` VALUES (3, '1', 'age', '??????', 'int(2)', 'Integer', 'age', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 3, 'admin', '2021-05-11 05:35:53', '', NULL);
INSERT INTO `gen_table_column` VALUES (4, '1', 'balance', '??????', 'float(12,2)', 'BigDecimal', 'balance', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 4, 'admin', '2021-05-11 05:35:53', '', NULL);
INSERT INTO `gen_table_column` VALUES (5, '1', 'total_money', '????????????', 'float(12,2)', 'BigDecimal', 'totalMoney', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 5, 'admin', '2021-05-11 05:35:53', '', NULL);
INSERT INTO `gen_table_column` VALUES (6, '1', 'create_time', '????????????', 'timestamp', 'Date', 'createTime', '0', '0', NULL, '1', NULL, NULL, NULL, 'EQ', 'datetime', '', 6, 'admin', '2021-05-11 05:35:54', '', NULL);
INSERT INTO `gen_table_column` VALUES (7, '1', 'update_time', '????????????', 'timestamp', 'Date', 'updateTime', '0', '0', NULL, '1', '1', NULL, NULL, 'EQ', 'datetime', '', 7, 'admin', '2021-05-11 05:35:54', '', NULL);
INSERT INTO `gen_table_column` VALUES (8, '1', 'state', '??????', 'int(11)', 'Long', 'state', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 8, 'admin', '2021-05-11 05:35:54', '', NULL);
COMMIT;

-- ----------------------------
-- Table structure for member
-- ----------------------------
DROP TABLE IF EXISTS `member`;
CREATE TABLE `member` (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '??????',
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '????????????',
  `age` int DEFAULT NULL COMMENT '??????',
  `balance` float(12,2) DEFAULT NULL COMMENT '??????',
  `total_money` float(12,2) DEFAULT NULL COMMENT '????????????',
  `create_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '????????????',
  `update_time` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '????????????',
  `state` int DEFAULT NULL COMMENT '??????',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb3 COLLATE=utf8_bin;

-- ----------------------------
-- Records of member
-- ----------------------------
BEGIN;
INSERT INTO `member` VALUES (3, 'FengRoot', 24, NULL, NULL, '2021-05-12 02:41:08', NULL, NULL);
COMMIT;

-- ----------------------------
-- Table structure for sys_config
-- ----------------------------
DROP TABLE IF EXISTS `sys_config`;
CREATE TABLE `sys_config` (
  `config_id` int NOT NULL AUTO_INCREMENT COMMENT '????????????',
  `config_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT '' COMMENT '????????????',
  `config_key` varchar(100) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT '' COMMENT '????????????',
  `config_value` varchar(500) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT '' COMMENT '????????????',
  `config_type` char(1) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT 'N' COMMENT '???????????????Y??? N??????',
  `create_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT '' COMMENT '?????????',
  `create_time` datetime DEFAULT NULL COMMENT '????????????',
  `update_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT '' COMMENT '?????????',
  `update_time` datetime DEFAULT NULL COMMENT '????????????',
  `remark` varchar(500) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '??????',
  PRIMARY KEY (`config_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb3 COLLATE=utf8_bin COMMENT='???????????????';

-- ----------------------------
-- Records of sys_config
-- ----------------------------
BEGIN;
INSERT INTO `sys_config` VALUES (1, '????????????-????????????????????????', 'sys.index.skinName', 'skin-blue', 'Y', 'admin', '2021-05-11 00:58:50', '', NULL, '?????? skin-blue????????? skin-green????????? skin-purple????????? skin-red????????? skin-yellow');
INSERT INTO `sys_config` VALUES (2, '????????????-??????????????????', 'sys.user.initPassword', '123456', 'Y', 'admin', '2021-05-11 00:58:50', '', NULL, '??????????????? 123456');
INSERT INTO `sys_config` VALUES (3, '????????????-???????????????', 'sys.index.sideTheme', 'theme-dark', 'Y', 'admin', '2021-05-11 00:58:50', '', NULL, '????????????theme-dark???????????????theme-light???????????????theme-blue');
INSERT INTO `sys_config` VALUES (4, '????????????-??????????????????????????????', 'sys.account.registerUser', 'false', 'Y', 'admin', '2021-05-11 00:58:50', '', NULL, '?????????????????????????????????true?????????false?????????');
INSERT INTO `sys_config` VALUES (5, '????????????-??????????????????', 'sys.account.chrtype', '0', 'Y', 'admin', '2021-05-11 00:58:50', '', NULL, '???????????????????????????0?????????????????????????????????????????????1????????????????????????0-9????????????2??????????????????????????????a-z???A-Z????????????3??????????????????????????????????????????????????????,4??????????????????????????????????????????????????????????????????~!@#$%^&*()-=_+???');
INSERT INTO `sys_config` VALUES (6, '????????????-????????????????????????', 'sys.account.initPasswordModify', '0', 'Y', 'admin', '2021-05-11 00:58:50', '', NULL, '0?????????????????????????????????????????????????????????1????????????????????????????????????????????????????????????????????????????????????????????????');
INSERT INTO `sys_config` VALUES (7, '????????????-????????????????????????', 'sys.account.passwordValidateDays', '0', 'Y', 'admin', '2021-05-11 00:58:50', '', NULL, '?????????????????????????????????????????????????????????0????????????????????????????????????0??????365????????????????????????????????????????????????????????????????????????????????????????????????????????????');
INSERT INTO `sys_config` VALUES (8, '????????????-????????????????????????', 'sys.index.menuStyle', 'default', 'Y', 'admin', '2021-05-11 00:58:50', '', NULL, '???????????????????????????default????????????????????????topnav????????????????????????');
INSERT INTO `sys_config` VALUES (9, '????????????-??????????????????', 'sys.index.ignoreFooter', 'true', 'Y', 'admin', '2021-05-11 00:58:50', '', NULL, '?????????????????????????????????true?????????false?????????');
COMMIT;

-- ----------------------------
-- Table structure for sys_dept
-- ----------------------------
DROP TABLE IF EXISTS `sys_dept`;
CREATE TABLE `sys_dept` (
  `dept_id` bigint NOT NULL AUTO_INCREMENT COMMENT '??????id',
  `parent_id` bigint DEFAULT '0' COMMENT '?????????id',
  `ancestors` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT '' COMMENT '????????????',
  `dept_name` varchar(30) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT '' COMMENT '????????????',
  `order_num` int DEFAULT '0' COMMENT '????????????',
  `leader` varchar(20) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '?????????',
  `phone` varchar(11) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '????????????',
  `email` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '??????',
  `status` char(1) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT '0' COMMENT '???????????????0?????? 1?????????',
  `del_flag` char(1) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT '0' COMMENT '???????????????0???????????? 2???????????????',
  `create_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT '' COMMENT '?????????',
  `create_time` datetime DEFAULT NULL COMMENT '????????????',
  `update_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT '' COMMENT '?????????',
  `update_time` datetime DEFAULT NULL COMMENT '????????????',
  PRIMARY KEY (`dept_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=110 DEFAULT CHARSET=utf8mb3 COLLATE=utf8_bin COMMENT='?????????';

-- ----------------------------
-- Records of sys_dept
-- ----------------------------
BEGIN;
INSERT INTO `sys_dept` VALUES (100, 0, '0', '????????????', 0, '??????', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2021-05-11 00:58:50', '', NULL);
INSERT INTO `sys_dept` VALUES (101, 100, '0,100', '???????????????', 1, '??????', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2021-05-11 00:58:50', '', NULL);
INSERT INTO `sys_dept` VALUES (102, 100, '0,100', '???????????????', 2, '??????', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2021-05-11 00:58:50', '', NULL);
INSERT INTO `sys_dept` VALUES (103, 101, '0,100,101', '????????????', 1, '??????', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2021-05-11 00:58:50', '', NULL);
INSERT INTO `sys_dept` VALUES (104, 101, '0,100,101', '????????????', 2, '??????', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2021-05-11 00:58:50', '', NULL);
INSERT INTO `sys_dept` VALUES (105, 101, '0,100,101', '????????????', 3, '??????', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2021-05-11 00:58:50', '', NULL);
INSERT INTO `sys_dept` VALUES (106, 101, '0,100,101', '????????????', 4, '??????', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2021-05-11 00:58:50', '', NULL);
INSERT INTO `sys_dept` VALUES (107, 101, '0,100,101', '????????????', 5, '??????', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2021-05-11 00:58:50', '', NULL);
INSERT INTO `sys_dept` VALUES (108, 102, '0,100,102', '????????????', 1, '??????', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2021-05-11 00:58:50', '', NULL);
INSERT INTO `sys_dept` VALUES (109, 102, '0,100,102', '????????????', 2, '??????', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2021-05-11 00:58:50', '', NULL);
COMMIT;

-- ----------------------------
-- Table structure for sys_dict_data
-- ----------------------------
DROP TABLE IF EXISTS `sys_dict_data`;
CREATE TABLE `sys_dict_data` (
  `dict_code` bigint NOT NULL AUTO_INCREMENT COMMENT '????????????',
  `dict_sort` int DEFAULT '0' COMMENT '????????????',
  `dict_label` varchar(100) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT '' COMMENT '????????????',
  `dict_value` varchar(100) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT '' COMMENT '????????????',
  `dict_type` varchar(100) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT '' COMMENT '????????????',
  `css_class` varchar(100) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '????????????????????????????????????',
  `list_class` varchar(100) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '??????????????????',
  `is_default` char(1) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT 'N' COMMENT '???????????????Y??? N??????',
  `status` char(1) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT '0' COMMENT '?????????0?????? 1?????????',
  `create_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT '' COMMENT '?????????',
  `create_time` datetime DEFAULT NULL COMMENT '????????????',
  `update_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT '' COMMENT '?????????',
  `update_time` datetime DEFAULT NULL COMMENT '????????????',
  `remark` varchar(500) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '??????',
  PRIMARY KEY (`dict_code`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=30 DEFAULT CHARSET=utf8mb3 COLLATE=utf8_bin COMMENT='???????????????';

-- ----------------------------
-- Records of sys_dict_data
-- ----------------------------
BEGIN;
INSERT INTO `sys_dict_data` VALUES (1, 1, '???', '0', 'sys_user_sex', '', '', 'Y', '0', 'admin', '2021-05-11 00:58:50', '', NULL, '?????????');
INSERT INTO `sys_dict_data` VALUES (2, 2, '???', '1', 'sys_user_sex', '', '', 'N', '0', 'admin', '2021-05-11 00:58:50', '', NULL, '?????????');
INSERT INTO `sys_dict_data` VALUES (3, 3, '??????', '2', 'sys_user_sex', '', '', 'N', '0', 'admin', '2021-05-11 00:58:50', '', NULL, '????????????');
INSERT INTO `sys_dict_data` VALUES (4, 1, '??????', '0', 'sys_show_hide', '', 'primary', 'Y', '0', 'admin', '2021-05-11 00:58:50', '', NULL, '????????????');
INSERT INTO `sys_dict_data` VALUES (5, 2, '??????', '1', 'sys_show_hide', '', 'danger', 'N', '0', 'admin', '2021-05-11 00:58:50', '', NULL, '????????????');
INSERT INTO `sys_dict_data` VALUES (6, 1, '??????', '0', 'sys_normal_disable', '', 'primary', 'Y', '0', 'admin', '2021-05-11 00:58:50', '', NULL, '????????????');
INSERT INTO `sys_dict_data` VALUES (7, 2, '??????', '1', 'sys_normal_disable', '', 'danger', 'N', '0', 'admin', '2021-05-11 00:58:50', '', NULL, '????????????');
INSERT INTO `sys_dict_data` VALUES (8, 1, '??????', '0', 'sys_job_status', '', 'primary', 'Y', '0', 'admin', '2021-05-11 00:58:50', '', NULL, '????????????');
INSERT INTO `sys_dict_data` VALUES (9, 2, '??????', '1', 'sys_job_status', '', 'danger', 'N', '0', 'admin', '2021-05-11 00:58:50', '', NULL, '????????????');
INSERT INTO `sys_dict_data` VALUES (10, 1, '??????', 'DEFAULT', 'sys_job_group', '', '', 'Y', '0', 'admin', '2021-05-11 00:58:50', '', NULL, '????????????');
INSERT INTO `sys_dict_data` VALUES (11, 2, '??????', 'SYSTEM', 'sys_job_group', '', '', 'N', '0', 'admin', '2021-05-11 00:58:50', '', NULL, '????????????');
INSERT INTO `sys_dict_data` VALUES (12, 1, '???', 'Y', 'sys_yes_no', '', 'primary', 'Y', '0', 'admin', '2021-05-11 00:58:50', '', NULL, '???????????????');
INSERT INTO `sys_dict_data` VALUES (13, 2, '???', 'N', 'sys_yes_no', '', 'danger', 'N', '0', 'admin', '2021-05-11 00:58:50', '', NULL, '???????????????');
INSERT INTO `sys_dict_data` VALUES (14, 1, '??????', '1', 'sys_notice_type', '', 'warning', 'Y', '0', 'admin', '2021-05-11 00:58:50', '', NULL, '??????');
INSERT INTO `sys_dict_data` VALUES (15, 2, '??????', '2', 'sys_notice_type', '', 'success', 'N', '0', 'admin', '2021-05-11 00:58:50', '', NULL, '??????');
INSERT INTO `sys_dict_data` VALUES (16, 1, '??????', '0', 'sys_notice_status', '', 'primary', 'Y', '0', 'admin', '2021-05-11 00:58:50', '', NULL, '????????????');
INSERT INTO `sys_dict_data` VALUES (17, 2, '??????', '1', 'sys_notice_status', '', 'danger', 'N', '0', 'admin', '2021-05-11 00:58:50', '', NULL, '????????????');
INSERT INTO `sys_dict_data` VALUES (18, 99, '??????', '0', 'sys_oper_type', '', 'info', 'N', '0', 'admin', '2021-05-11 00:58:50', '', NULL, '????????????');
INSERT INTO `sys_dict_data` VALUES (19, 1, '??????', '1', 'sys_oper_type', '', 'info', 'N', '0', 'admin', '2021-05-11 00:58:50', '', NULL, '????????????');
INSERT INTO `sys_dict_data` VALUES (20, 2, '??????', '2', 'sys_oper_type', '', 'info', 'N', '0', 'admin', '2021-05-11 00:58:50', '', NULL, '????????????');
INSERT INTO `sys_dict_data` VALUES (21, 3, '??????', '3', 'sys_oper_type', '', 'danger', 'N', '0', 'admin', '2021-05-11 00:58:50', '', NULL, '????????????');
INSERT INTO `sys_dict_data` VALUES (22, 4, '??????', '4', 'sys_oper_type', '', 'primary', 'N', '0', 'admin', '2021-05-11 00:58:50', '', NULL, '????????????');
INSERT INTO `sys_dict_data` VALUES (23, 5, '??????', '5', 'sys_oper_type', '', 'warning', 'N', '0', 'admin', '2021-05-11 00:58:50', '', NULL, '????????????');
INSERT INTO `sys_dict_data` VALUES (24, 6, '??????', '6', 'sys_oper_type', '', 'warning', 'N', '0', 'admin', '2021-05-11 00:58:50', '', NULL, '????????????');
INSERT INTO `sys_dict_data` VALUES (25, 7, '??????', '7', 'sys_oper_type', '', 'danger', 'N', '0', 'admin', '2021-05-11 00:58:50', '', NULL, '????????????');
INSERT INTO `sys_dict_data` VALUES (26, 8, '????????????', '8', 'sys_oper_type', '', 'warning', 'N', '0', 'admin', '2021-05-11 00:58:50', '', NULL, '????????????');
INSERT INTO `sys_dict_data` VALUES (27, 9, '????????????', '9', 'sys_oper_type', '', 'danger', 'N', '0', 'admin', '2021-05-11 00:58:50', '', NULL, '????????????');
INSERT INTO `sys_dict_data` VALUES (28, 1, '??????', '0', 'sys_common_status', '', 'primary', 'N', '0', 'admin', '2021-05-11 00:58:50', '', NULL, '????????????');
INSERT INTO `sys_dict_data` VALUES (29, 2, '??????', '1', 'sys_common_status', '', 'danger', 'N', '0', 'admin', '2021-05-11 00:58:50', '', NULL, '????????????');
COMMIT;

-- ----------------------------
-- Table structure for sys_dict_type
-- ----------------------------
DROP TABLE IF EXISTS `sys_dict_type`;
CREATE TABLE `sys_dict_type` (
  `dict_id` bigint NOT NULL AUTO_INCREMENT COMMENT '????????????',
  `dict_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT '' COMMENT '????????????',
  `dict_type` varchar(100) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT '' COMMENT '????????????',
  `status` char(1) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT '0' COMMENT '?????????0?????? 1?????????',
  `create_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT '' COMMENT '?????????',
  `create_time` datetime DEFAULT NULL COMMENT '????????????',
  `update_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT '' COMMENT '?????????',
  `update_time` datetime DEFAULT NULL COMMENT '????????????',
  `remark` varchar(500) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '??????',
  PRIMARY KEY (`dict_id`) USING BTREE,
  UNIQUE KEY `dict_type` (`dict_type`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb3 COLLATE=utf8_bin COMMENT='???????????????';

-- ----------------------------
-- Records of sys_dict_type
-- ----------------------------
BEGIN;
INSERT INTO `sys_dict_type` VALUES (1, '????????????', 'sys_user_sex', '0', 'admin', '2021-05-11 00:58:50', '', NULL, '??????????????????');
INSERT INTO `sys_dict_type` VALUES (2, '????????????', 'sys_show_hide', '0', 'admin', '2021-05-11 00:58:50', '', NULL, '??????????????????');
INSERT INTO `sys_dict_type` VALUES (3, '????????????', 'sys_normal_disable', '0', 'admin', '2021-05-11 00:58:50', '', NULL, '??????????????????');
INSERT INTO `sys_dict_type` VALUES (4, '????????????', 'sys_job_status', '0', 'admin', '2021-05-11 00:58:50', '', NULL, '??????????????????');
INSERT INTO `sys_dict_type` VALUES (5, '????????????', 'sys_job_group', '0', 'admin', '2021-05-11 00:58:50', '', NULL, '??????????????????');
INSERT INTO `sys_dict_type` VALUES (6, '????????????', 'sys_yes_no', '0', 'admin', '2021-05-11 00:58:50', '', NULL, '??????????????????');
INSERT INTO `sys_dict_type` VALUES (7, '????????????', 'sys_notice_type', '0', 'admin', '2021-05-11 00:58:50', '', NULL, '??????????????????');
INSERT INTO `sys_dict_type` VALUES (8, '????????????', 'sys_notice_status', '0', 'admin', '2021-05-11 00:58:50', '', NULL, '??????????????????');
INSERT INTO `sys_dict_type` VALUES (9, '????????????', 'sys_oper_type', '0', 'admin', '2021-05-11 00:58:50', '', NULL, '??????????????????');
INSERT INTO `sys_dict_type` VALUES (10, '????????????', 'sys_common_status', '0', 'admin', '2021-05-11 00:58:50', '', NULL, '??????????????????');
COMMIT;

-- ----------------------------
-- Table structure for sys_job
-- ----------------------------
DROP TABLE IF EXISTS `sys_job`;
CREATE TABLE `sys_job` (
  `job_id` bigint NOT NULL AUTO_INCREMENT COMMENT '??????ID',
  `job_name` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT '' COMMENT '????????????',
  `job_group` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT 'DEFAULT' COMMENT '????????????',
  `invoke_target` varchar(500) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '?????????????????????',
  `cron_expression` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT '' COMMENT 'cron???????????????',
  `misfire_policy` varchar(20) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT '3' COMMENT '???????????????????????????1???????????? 2???????????? 3???????????????',
  `concurrent` char(1) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT '1' COMMENT '?????????????????????0?????? 1?????????',
  `status` char(1) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT '0' COMMENT '?????????0?????? 1?????????',
  `create_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT '' COMMENT '?????????',
  `create_time` datetime DEFAULT NULL COMMENT '????????????',
  `update_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT '' COMMENT '?????????',
  `update_time` datetime DEFAULT NULL COMMENT '????????????',
  `remark` varchar(500) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT '' COMMENT '????????????',
  PRIMARY KEY (`job_id`,`job_name`,`job_group`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb3 COLLATE=utf8_bin COMMENT='?????????????????????';

-- ----------------------------
-- Records of sys_job
-- ----------------------------
BEGIN;
INSERT INTO `sys_job` VALUES (1, '????????????????????????', 'DEFAULT', 'ryTask.ryNoParams', '0/10 * * * * ?', '3', '1', '1', 'admin', '2021-05-11 00:58:50', '', NULL, '');
INSERT INTO `sys_job` VALUES (2, '????????????????????????', 'DEFAULT', 'ryTask.ryParams(\'ry\')', '0/15 * * * * ?', '3', '1', '1', 'admin', '2021-05-11 00:58:50', '', NULL, '');
INSERT INTO `sys_job` VALUES (3, '????????????????????????', 'DEFAULT', 'ryTask.ryMultipleParams(\'ry\', true, 2000L, 316.50D, 100)', '0/20 * * * * ?', '3', '1', '1', 'admin', '2021-05-11 00:58:50', '', NULL, '');
COMMIT;

-- ----------------------------
-- Table structure for sys_job_log
-- ----------------------------
DROP TABLE IF EXISTS `sys_job_log`;
CREATE TABLE `sys_job_log` (
  `job_log_id` bigint NOT NULL AUTO_INCREMENT COMMENT '????????????ID',
  `job_name` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '????????????',
  `job_group` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '????????????',
  `invoke_target` varchar(500) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '?????????????????????',
  `job_message` varchar(500) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '????????????',
  `status` char(1) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT '0' COMMENT '???????????????0?????? 1?????????',
  `exception_info` varchar(2000) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT '' COMMENT '????????????',
  `create_time` datetime DEFAULT NULL COMMENT '????????????',
  PRIMARY KEY (`job_log_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8_bin COMMENT='???????????????????????????';

-- ----------------------------
-- Records of sys_job_log
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for sys_logininfor
-- ----------------------------
DROP TABLE IF EXISTS `sys_logininfor`;
CREATE TABLE `sys_logininfor` (
  `info_id` bigint NOT NULL AUTO_INCREMENT COMMENT '??????ID',
  `login_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT '' COMMENT '????????????',
  `ipaddr` varchar(128) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT '' COMMENT '??????IP??????',
  `login_location` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT '' COMMENT '????????????',
  `browser` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT '' COMMENT '???????????????',
  `os` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT '' COMMENT '????????????',
  `status` char(1) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT '0' COMMENT '???????????????0?????? 1?????????',
  `msg` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT '' COMMENT '????????????',
  `login_time` datetime DEFAULT NULL COMMENT '????????????',
  PRIMARY KEY (`info_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=156 DEFAULT CHARSET=utf8mb3 COLLATE=utf8_bin COMMENT='??????????????????';

-- ----------------------------
-- Records of sys_logininfor
-- ----------------------------
BEGIN;
INSERT INTO `sys_logininfor` VALUES (100, 'admin', '127.0.0.1', '??????IP', 'Chrome 9', 'Mac OS X', '0', '????????????', '2021-05-11 05:23:06');
INSERT INTO `sys_logininfor` VALUES (101, 'admin', '127.0.0.1', '??????IP', 'Chrome 9', 'Mac OS X', '0', '????????????', '2021-05-11 05:35:40');
INSERT INTO `sys_logininfor` VALUES (102, 'admin', '127.0.0.1', '??????IP', 'Chrome 9', 'Mac OS X', '0', '????????????', '2021-05-11 05:42:57');
INSERT INTO `sys_logininfor` VALUES (103, 'admin', '127.0.0.1', '??????IP', 'Chrome 9', 'Mac OS X', '0', '????????????', '2021-05-11 05:46:58');
INSERT INTO `sys_logininfor` VALUES (104, 'admin', '127.0.0.1', '??????IP', 'Chrome 9', 'Mac OS X', '0', '????????????', '2021-05-11 05:48:27');
INSERT INTO `sys_logininfor` VALUES (105, 'admin', '127.0.0.1', '??????IP', 'Chrome 9', 'Mac OS X', '0', '????????????', '2021-05-11 06:25:49');
INSERT INTO `sys_logininfor` VALUES (106, 'admin', '127.0.0.1', '??????IP', 'Chrome 9', 'Mac OS X', '0', '????????????', '2021-05-11 06:27:21');
INSERT INTO `sys_logininfor` VALUES (107, 'admin', '127.0.0.1', '??????IP', 'Chrome 9', 'Mac OS X', '0', '????????????', '2021-05-11 06:43:32');
INSERT INTO `sys_logininfor` VALUES (108, 'admin', '127.0.0.1', '??????IP', 'Chrome 9', 'Mac OS X', '0', '????????????', '2021-05-11 06:46:18');
INSERT INTO `sys_logininfor` VALUES (109, 'admin', '127.0.0.1', '??????IP', 'Chrome 9', 'Mac OS X', '1', '???????????????', '2021-05-11 06:48:08');
INSERT INTO `sys_logininfor` VALUES (110, 'admin', '127.0.0.1', '??????IP', 'Chrome 9', 'Mac OS X', '0', '????????????', '2021-05-11 06:48:10');
INSERT INTO `sys_logininfor` VALUES (111, 'admin', '127.0.0.1', '??????IP', 'Chrome 9', 'Mac OS X', '0', '????????????', '2021-05-11 06:53:23');
INSERT INTO `sys_logininfor` VALUES (112, 'admin', '127.0.0.1', '??????IP', 'Chrome 9', 'Mac OS X', '0', '????????????', '2021-05-11 06:55:40');
INSERT INTO `sys_logininfor` VALUES (113, 'admin', '127.0.0.1', '??????IP', 'Chrome 9', 'Mac OS X', '0', '????????????', '2021-05-11 08:37:04');
INSERT INTO `sys_logininfor` VALUES (114, 'admin', '127.0.0.1', '??????IP', 'Chrome 9', 'Mac OS X', '0', '????????????', '2021-05-11 08:39:14');
INSERT INTO `sys_logininfor` VALUES (115, 'admin', '127.0.0.1', '??????IP', 'Chrome 9', 'Mac OS X', '0', '????????????', '2021-05-11 08:44:16');
INSERT INTO `sys_logininfor` VALUES (116, 'admin', '127.0.0.1', '??????IP', 'Chrome 9', 'Mac OS X', '0', '????????????', '2021-05-11 08:48:39');
INSERT INTO `sys_logininfor` VALUES (117, 'admin', '127.0.0.1', '??????IP', 'Chrome 9', 'Mac OS X', '0', '????????????', '2021-05-11 08:54:31');
INSERT INTO `sys_logininfor` VALUES (118, 'admin', '127.0.0.1', '??????IP', 'Chrome 9', 'Mac OS X', '0', '????????????', '2021-05-11 08:55:24');
INSERT INTO `sys_logininfor` VALUES (119, 'admin', '127.0.0.1', '??????IP', 'Chrome 9', 'Mac OS X', '0', '????????????', '2021-05-11 08:56:32');
INSERT INTO `sys_logininfor` VALUES (120, 'admin', '127.0.0.1', '??????IP', 'Chrome 9', 'Mac OS X', '0', '????????????', '2021-05-11 09:06:27');
INSERT INTO `sys_logininfor` VALUES (121, 'admin', '127.0.0.1', '??????IP', 'Chrome 9', 'Mac OS X', '0', '????????????', '2021-05-11 09:15:59');
INSERT INTO `sys_logininfor` VALUES (122, 'admin', '127.0.0.1', '??????IP', 'Chrome 9', 'Mac OS X', '0', '????????????', '2021-05-11 09:26:51');
INSERT INTO `sys_logininfor` VALUES (123, 'admin', '127.0.0.1', '??????IP', 'Chrome 9', 'Mac OS X', '0', '????????????', '2021-05-11 09:28:12');
INSERT INTO `sys_logininfor` VALUES (124, 'admin', '127.0.0.1', '??????IP', 'Chrome 9', 'Mac OS X', '0', '????????????', '2021-05-11 09:50:54');
INSERT INTO `sys_logininfor` VALUES (125, 'admin', '127.0.0.1', '??????IP', 'Chrome 9', 'Mac OS X', '0', '????????????', '2021-05-11 10:10:58');
INSERT INTO `sys_logininfor` VALUES (126, 'admin', '127.0.0.1', '??????IP', 'Chrome 9', 'Mac OS X', '0', '????????????', '2021-05-11 10:18:53');
INSERT INTO `sys_logininfor` VALUES (127, 'admin', '127.0.0.1', '??????IP', 'Chrome 9', 'Mac OS X', '0', '????????????', '2021-05-11 10:23:07');
INSERT INTO `sys_logininfor` VALUES (128, 'admin', '127.0.0.1', '??????IP', 'Chrome 9', 'Mac OS X', '1', '???????????????', '2021-05-11 10:25:05');
INSERT INTO `sys_logininfor` VALUES (129, 'admin', '127.0.0.1', '??????IP', 'Chrome 9', 'Mac OS X', '0', '????????????', '2021-05-11 10:25:08');
INSERT INTO `sys_logininfor` VALUES (130, 'admin', '127.0.0.1', '??????IP', 'Chrome 9', 'Mac OS X', '0', '????????????', '2021-05-11 10:28:45');
INSERT INTO `sys_logininfor` VALUES (131, 'admin', '127.0.0.1', '??????IP', 'Chrome 9', 'Mac OS X', '0', '????????????', '2021-05-11 10:30:38');
INSERT INTO `sys_logininfor` VALUES (132, 'admin', '127.0.0.1', '??????IP', 'Chrome 9', 'Mac OS X', '0', '????????????', '2021-05-11 10:46:04');
INSERT INTO `sys_logininfor` VALUES (133, 'admin', '127.0.0.1', '??????IP', 'Chrome 9', 'Mac OS X', '1', '???????????????', '2021-05-12 01:18:15');
INSERT INTO `sys_logininfor` VALUES (134, 'admin', '127.0.0.1', '??????IP', 'Chrome 9', 'Mac OS X', '0', '????????????', '2021-05-12 01:18:18');
INSERT INTO `sys_logininfor` VALUES (135, 'admin', '127.0.0.1', '??????IP', 'Chrome 9', 'Mac OS X', '0', '????????????', '2021-05-12 01:22:14');
INSERT INTO `sys_logininfor` VALUES (136, 'admin', '127.0.0.1', '??????IP', 'Chrome 9', 'Mac OS X', '0', '????????????', '2021-05-12 01:35:53');
INSERT INTO `sys_logininfor` VALUES (137, 'admin', '127.0.0.1', '??????IP', 'Chrome 9', 'Mac OS X', '0', '????????????', '2021-05-12 01:40:51');
INSERT INTO `sys_logininfor` VALUES (138, 'admin', '127.0.0.1', '??????IP', 'Chrome 9', 'Mac OS X', '0', '????????????', '2021-05-12 01:43:38');
INSERT INTO `sys_logininfor` VALUES (139, 'admin', '127.0.0.1', '??????IP', 'Chrome 9', 'Mac OS X', '0', '????????????', '2021-05-12 01:44:36');
INSERT INTO `sys_logininfor` VALUES (140, 'admin', '127.0.0.1', '??????IP', 'Chrome 9', 'Mac OS X', '0', '????????????', '2021-05-12 01:45:53');
INSERT INTO `sys_logininfor` VALUES (141, 'admin', '127.0.0.1', '??????IP', 'Chrome 9', 'Mac OS X', '0', '????????????', '2021-05-12 02:03:31');
INSERT INTO `sys_logininfor` VALUES (142, 'admin', '127.0.0.1', '??????IP', 'Chrome 9', 'Mac OS X', '0', '????????????', '2021-05-12 02:08:53');
INSERT INTO `sys_logininfor` VALUES (143, 'admin', '127.0.0.1', '??????IP', 'Chrome 9', 'Mac OS X', '0', '????????????', '2021-05-12 02:13:17');
INSERT INTO `sys_logininfor` VALUES (144, 'admin', '127.0.0.1', '??????IP', 'Chrome 9', 'Mac OS X', '0', '????????????', '2021-05-12 02:20:42');
INSERT INTO `sys_logininfor` VALUES (145, 'admin', '127.0.0.1', '??????IP', 'Chrome 9', 'Mac OS X', '0', '????????????', '2021-05-12 02:22:07');
INSERT INTO `sys_logininfor` VALUES (146, 'admin', '127.0.0.1', '??????IP', 'Chrome 9', 'Mac OS X', '0', '????????????', '2021-05-12 02:29:21');
INSERT INTO `sys_logininfor` VALUES (147, 'admin', '127.0.0.1', '??????IP', 'Chrome 9', 'Mac OS X', '0', '????????????', '2021-05-12 02:37:44');
INSERT INTO `sys_logininfor` VALUES (148, 'admin', '127.0.0.1', '??????IP', 'Chrome 9', 'Mac OS X', '0', '????????????', '2021-05-12 02:38:30');
INSERT INTO `sys_logininfor` VALUES (149, 'admin', '127.0.0.1', '??????IP', 'Chrome 9', 'Mac OS X', '0', '????????????', '2021-05-12 02:43:12');
INSERT INTO `sys_logininfor` VALUES (150, 'admin', '127.0.0.1', '??????IP', 'Chrome 9', 'Mac OS X', '0', '????????????', '2021-05-12 03:23:28');
INSERT INTO `sys_logininfor` VALUES (151, 'admin', '127.0.0.1', '??????IP', 'Chrome 9', 'Mac OS X', '0', '????????????', '2021-05-12 03:32:01');
INSERT INTO `sys_logininfor` VALUES (152, 'admin', '127.0.0.1', '??????IP', 'Chrome 9', 'Mac OS X', '0', '????????????', '2021-05-12 03:33:38');
INSERT INTO `sys_logininfor` VALUES (153, 'admin', '127.0.0.1', '??????IP', 'Chrome 9', 'Mac OS X', '0', '????????????', '2021-05-12 03:50:56');
INSERT INTO `sys_logininfor` VALUES (154, 'admin', '192.168.43.246', '??????IP', 'Chrome 9', 'Mac OS X', '0', '????????????', '2021-06-29 22:58:05');
INSERT INTO `sys_logininfor` VALUES (155, 'admin', '127.0.0.1', '??????IP', 'Chrome 9', 'Mac OS X', '0', '????????????', '2021-10-19 02:21:36');
COMMIT;

-- ----------------------------
-- Table structure for sys_menu
-- ----------------------------
DROP TABLE IF EXISTS `sys_menu`;
CREATE TABLE `sys_menu` (
  `menu_id` bigint NOT NULL AUTO_INCREMENT COMMENT '??????ID',
  `menu_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '????????????',
  `parent_id` bigint DEFAULT '0' COMMENT '?????????ID',
  `order_num` int DEFAULT '0' COMMENT '????????????',
  `url` varchar(200) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT '#' COMMENT '????????????',
  `target` varchar(20) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT '' COMMENT '???????????????menuItem?????? menuBlank????????????',
  `menu_type` char(1) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT '' COMMENT '???????????????M?????? C?????? F?????????',
  `visible` char(1) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT '0' COMMENT '???????????????0?????? 1?????????',
  `is_refresh` char(1) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT '1' COMMENT '???????????????0?????? 1????????????',
  `perms` varchar(100) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '????????????',
  `icon` varchar(100) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT '#' COMMENT '????????????',
  `create_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT '' COMMENT '?????????',
  `create_time` datetime DEFAULT NULL COMMENT '????????????',
  `update_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT '' COMMENT '?????????',
  `update_time` datetime DEFAULT NULL COMMENT '????????????',
  `remark` varchar(500) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT '' COMMENT '??????',
  PRIMARY KEY (`menu_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=2001 DEFAULT CHARSET=utf8mb3 COLLATE=utf8_bin COMMENT='???????????????';

-- ----------------------------
-- Records of sys_menu
-- ----------------------------
BEGIN;
INSERT INTO `sys_menu` VALUES (1, '????????????', 0, 1, '#', '', 'M', '0', '1', '', 'fa fa-gear', 'admin', '2021-05-11 00:58:50', '', NULL, '??????????????????');
INSERT INTO `sys_menu` VALUES (2, '????????????', 0, 2, '#', '', 'M', '0', '1', '', 'fa fa-video-camera', 'admin', '2021-05-11 00:58:50', '', NULL, '??????????????????');
INSERT INTO `sys_menu` VALUES (3, '????????????', 0, 3, '#', '', 'M', '0', '1', '', 'fa fa-bars', 'admin', '2021-05-11 00:58:50', '', NULL, '??????????????????');
INSERT INTO `sys_menu` VALUES (4, '????????????', 0, 4, 'http://ruoyi.vip', 'menuBlank', 'C', '0', '1', '', 'fa fa-location-arrow', 'admin', '2021-05-11 00:58:50', '', NULL, '??????????????????');
INSERT INTO `sys_menu` VALUES (100, '????????????', 1, 1, '/system/user', '', 'C', '0', '1', 'system:user:view', 'fa fa-user-o', 'admin', '2021-05-11 00:58:50', '', NULL, '??????????????????');
INSERT INTO `sys_menu` VALUES (101, '????????????', 1, 2, '/system/role', '', 'C', '0', '1', 'system:role:view', 'fa fa-user-secret', 'admin', '2021-05-11 00:58:50', '', NULL, '??????????????????');
INSERT INTO `sys_menu` VALUES (102, '????????????', 1, 3, '/system/menu', '', 'C', '0', '1', 'system:menu:view', 'fa fa-th-list', 'admin', '2021-05-11 00:58:50', '', NULL, '??????????????????');
INSERT INTO `sys_menu` VALUES (103, '????????????', 1, 4, '/system/dept', '', 'C', '0', '1', 'system:dept:view', 'fa fa-outdent', 'admin', '2021-05-11 00:58:50', '', NULL, '??????????????????');
INSERT INTO `sys_menu` VALUES (104, '????????????', 1, 5, '/system/post', '', 'C', '0', '1', 'system:post:view', 'fa fa-address-card-o', 'admin', '2021-05-11 00:58:50', '', NULL, '??????????????????');
INSERT INTO `sys_menu` VALUES (105, '????????????', 1, 6, '/system/dict', '', 'C', '0', '1', 'system:dict:view', 'fa fa-bookmark-o', 'admin', '2021-05-11 00:58:50', '', NULL, '??????????????????');
INSERT INTO `sys_menu` VALUES (106, '????????????', 1, 7, '/system/config', '', 'C', '0', '1', 'system:config:view', 'fa fa-sun-o', 'admin', '2021-05-11 00:58:50', '', NULL, '??????????????????');
INSERT INTO `sys_menu` VALUES (107, '????????????', 1, 8, '/system/notice', '', 'C', '0', '1', 'system:notice:view', 'fa fa-bullhorn', 'admin', '2021-05-11 00:58:50', '', NULL, '??????????????????');
INSERT INTO `sys_menu` VALUES (108, '????????????', 1, 9, '#', '', 'M', '0', '1', '', 'fa fa-pencil-square-o', 'admin', '2021-05-11 00:58:50', '', NULL, '??????????????????');
INSERT INTO `sys_menu` VALUES (109, '????????????', 2, 1, '/monitor/online', '', 'C', '0', '1', 'monitor:online:view', 'fa fa-user-circle', 'admin', '2021-05-11 00:58:50', '', NULL, '??????????????????');
INSERT INTO `sys_menu` VALUES (110, '????????????', 2, 2, '/monitor/job', '', 'C', '0', '1', 'monitor:job:view', 'fa fa-tasks', 'admin', '2021-05-11 00:58:50', '', NULL, '??????????????????');
INSERT INTO `sys_menu` VALUES (111, '????????????', 2, 3, '/monitor/data', '', 'C', '0', '1', 'monitor:data:view', 'fa fa-bug', 'admin', '2021-05-11 00:58:50', '', NULL, '??????????????????');
INSERT INTO `sys_menu` VALUES (112, '????????????', 2, 4, '/monitor/server', '', 'C', '0', '1', 'monitor:server:view', 'fa fa-server', 'admin', '2021-05-11 00:58:50', '', NULL, '??????????????????');
INSERT INTO `sys_menu` VALUES (113, '????????????', 2, 5, '/monitor/cache', '', 'C', '0', '1', 'monitor:cache:view', 'fa fa-cube', 'admin', '2021-05-11 00:58:50', '', NULL, '??????????????????');
INSERT INTO `sys_menu` VALUES (114, '????????????', 3, 1, '/tool/build', '', 'C', '0', '1', 'tool:build:view', 'fa fa-wpforms', 'admin', '2021-05-11 00:58:50', '', NULL, '??????????????????');
INSERT INTO `sys_menu` VALUES (115, '????????????', 3, 2, '/tool/gen', '', 'C', '0', '1', 'tool:gen:view', 'fa fa-code', 'admin', '2021-05-11 00:58:50', '', NULL, '??????????????????');
INSERT INTO `sys_menu` VALUES (116, '????????????', 3, 3, '/tool/swagger', '', 'C', '0', '1', 'tool:swagger:view', 'fa fa-gg', 'admin', '2021-05-11 00:58:50', '', NULL, '??????????????????');
INSERT INTO `sys_menu` VALUES (500, '????????????', 108, 1, '/monitor/operlog', '', 'C', '0', '1', 'monitor:operlog:view', 'fa fa-address-book', 'admin', '2021-05-11 00:58:50', '', NULL, '??????????????????');
INSERT INTO `sys_menu` VALUES (501, '????????????', 108, 2, '/monitor/logininfor', '', 'C', '0', '1', 'monitor:logininfor:view', 'fa fa-file-image-o', 'admin', '2021-05-11 00:58:50', '', NULL, '??????????????????');
INSERT INTO `sys_menu` VALUES (1000, '????????????', 100, 1, '#', '', 'F', '0', '1', 'system:user:list', '#', 'admin', '2021-05-11 00:58:50', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1001, '????????????', 100, 2, '#', '', 'F', '0', '1', 'system:user:add', '#', 'admin', '2021-05-11 00:58:50', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1002, '????????????', 100, 3, '#', '', 'F', '0', '1', 'system:user:edit', '#', 'admin', '2021-05-11 00:58:50', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1003, '????????????', 100, 4, '#', '', 'F', '0', '1', 'system:user:remove', '#', 'admin', '2021-05-11 00:58:50', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1004, '????????????', 100, 5, '#', '', 'F', '0', '1', 'system:user:export', '#', 'admin', '2021-05-11 00:58:50', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1005, '????????????', 100, 6, '#', '', 'F', '0', '1', 'system:user:import', '#', 'admin', '2021-05-11 00:58:50', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1006, '????????????', 100, 7, '#', '', 'F', '0', '1', 'system:user:resetPwd', '#', 'admin', '2021-05-11 00:58:50', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1007, '????????????', 101, 1, '#', '', 'F', '0', '1', 'system:role:list', '#', 'admin', '2021-05-11 00:58:50', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1008, '????????????', 101, 2, '#', '', 'F', '0', '1', 'system:role:add', '#', 'admin', '2021-05-11 00:58:50', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1009, '????????????', 101, 3, '#', '', 'F', '0', '1', 'system:role:edit', '#', 'admin', '2021-05-11 00:58:50', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1010, '????????????', 101, 4, '#', '', 'F', '0', '1', 'system:role:remove', '#', 'admin', '2021-05-11 00:58:50', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1011, '????????????', 101, 5, '#', '', 'F', '0', '1', 'system:role:export', '#', 'admin', '2021-05-11 00:58:50', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1012, '????????????', 102, 1, '#', '', 'F', '0', '1', 'system:menu:list', '#', 'admin', '2021-05-11 00:58:50', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1013, '????????????', 102, 2, '#', '', 'F', '0', '1', 'system:menu:add', '#', 'admin', '2021-05-11 00:58:50', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1014, '????????????', 102, 3, '#', '', 'F', '0', '1', 'system:menu:edit', '#', 'admin', '2021-05-11 00:58:50', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1015, '????????????', 102, 4, '#', '', 'F', '0', '1', 'system:menu:remove', '#', 'admin', '2021-05-11 00:58:50', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1016, '????????????', 103, 1, '#', '', 'F', '0', '1', 'system:dept:list', '#', 'admin', '2021-05-11 00:58:50', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1017, '????????????', 103, 2, '#', '', 'F', '0', '1', 'system:dept:add', '#', 'admin', '2021-05-11 00:58:50', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1018, '????????????', 103, 3, '#', '', 'F', '0', '1', 'system:dept:edit', '#', 'admin', '2021-05-11 00:58:50', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1019, '????????????', 103, 4, '#', '', 'F', '0', '1', 'system:dept:remove', '#', 'admin', '2021-05-11 00:58:50', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1020, '????????????', 104, 1, '#', '', 'F', '0', '1', 'system:post:list', '#', 'admin', '2021-05-11 00:58:50', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1021, '????????????', 104, 2, '#', '', 'F', '0', '1', 'system:post:add', '#', 'admin', '2021-05-11 00:58:50', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1022, '????????????', 104, 3, '#', '', 'F', '0', '1', 'system:post:edit', '#', 'admin', '2021-05-11 00:58:50', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1023, '????????????', 104, 4, '#', '', 'F', '0', '1', 'system:post:remove', '#', 'admin', '2021-05-11 00:58:50', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1024, '????????????', 104, 5, '#', '', 'F', '0', '1', 'system:post:export', '#', 'admin', '2021-05-11 00:58:50', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1025, '????????????', 105, 1, '#', '', 'F', '0', '1', 'system:dict:list', '#', 'admin', '2021-05-11 00:58:50', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1026, '????????????', 105, 2, '#', '', 'F', '0', '1', 'system:dict:add', '#', 'admin', '2021-05-11 00:58:50', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1027, '????????????', 105, 3, '#', '', 'F', '0', '1', 'system:dict:edit', '#', 'admin', '2021-05-11 00:58:50', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1028, '????????????', 105, 4, '#', '', 'F', '0', '1', 'system:dict:remove', '#', 'admin', '2021-05-11 00:58:50', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1029, '????????????', 105, 5, '#', '', 'F', '0', '1', 'system:dict:export', '#', 'admin', '2021-05-11 00:58:50', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1030, '????????????', 106, 1, '#', '', 'F', '0', '1', 'system:config:list', '#', 'admin', '2021-05-11 00:58:50', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1031, '????????????', 106, 2, '#', '', 'F', '0', '1', 'system:config:add', '#', 'admin', '2021-05-11 00:58:50', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1032, '????????????', 106, 3, '#', '', 'F', '0', '1', 'system:config:edit', '#', 'admin', '2021-05-11 00:58:50', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1033, '????????????', 106, 4, '#', '', 'F', '0', '1', 'system:config:remove', '#', 'admin', '2021-05-11 00:58:50', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1034, '????????????', 106, 5, '#', '', 'F', '0', '1', 'system:config:export', '#', 'admin', '2021-05-11 00:58:50', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1035, '????????????', 107, 1, '#', '', 'F', '0', '1', 'system:notice:list', '#', 'admin', '2021-05-11 00:58:50', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1036, '????????????', 107, 2, '#', '', 'F', '0', '1', 'system:notice:add', '#', 'admin', '2021-05-11 00:58:50', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1037, '????????????', 107, 3, '#', '', 'F', '0', '1', 'system:notice:edit', '#', 'admin', '2021-05-11 00:58:50', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1038, '????????????', 107, 4, '#', '', 'F', '0', '1', 'system:notice:remove', '#', 'admin', '2021-05-11 00:58:50', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1039, '????????????', 500, 1, '#', '', 'F', '0', '1', 'monitor:operlog:list', '#', 'admin', '2021-05-11 00:58:50', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1040, '????????????', 500, 2, '#', '', 'F', '0', '1', 'monitor:operlog:remove', '#', 'admin', '2021-05-11 00:58:50', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1041, '????????????', 500, 3, '#', '', 'F', '0', '1', 'monitor:operlog:detail', '#', 'admin', '2021-05-11 00:58:50', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1042, '????????????', 500, 4, '#', '', 'F', '0', '1', 'monitor:operlog:export', '#', 'admin', '2021-05-11 00:58:50', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1043, '????????????', 501, 1, '#', '', 'F', '0', '1', 'monitor:logininfor:list', '#', 'admin', '2021-05-11 00:58:50', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1044, '????????????', 501, 2, '#', '', 'F', '0', '1', 'monitor:logininfor:remove', '#', 'admin', '2021-05-11 00:58:50', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1045, '????????????', 501, 3, '#', '', 'F', '0', '1', 'monitor:logininfor:export', '#', 'admin', '2021-05-11 00:58:50', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1046, '????????????', 501, 4, '#', '', 'F', '0', '1', 'monitor:logininfor:unlock', '#', 'admin', '2021-05-11 00:58:50', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1047, '????????????', 109, 1, '#', '', 'F', '0', '1', 'monitor:online:list', '#', 'admin', '2021-05-11 00:58:50', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1048, '????????????', 109, 2, '#', '', 'F', '0', '1', 'monitor:online:batchForceLogout', '#', 'admin', '2021-05-11 00:58:50', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1049, '????????????', 109, 3, '#', '', 'F', '0', '1', 'monitor:online:forceLogout', '#', 'admin', '2021-05-11 00:58:50', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1050, '????????????', 110, 1, '#', '', 'F', '0', '1', 'monitor:job:list', '#', 'admin', '2021-05-11 00:58:50', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1051, '????????????', 110, 2, '#', '', 'F', '0', '1', 'monitor:job:add', '#', 'admin', '2021-05-11 00:58:50', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1052, '????????????', 110, 3, '#', '', 'F', '0', '1', 'monitor:job:edit', '#', 'admin', '2021-05-11 00:58:50', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1053, '????????????', 110, 4, '#', '', 'F', '0', '1', 'monitor:job:remove', '#', 'admin', '2021-05-11 00:58:50', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1054, '????????????', 110, 5, '#', '', 'F', '0', '1', 'monitor:job:changeStatus', '#', 'admin', '2021-05-11 00:58:50', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1055, '????????????', 110, 6, '#', '', 'F', '0', '1', 'monitor:job:detail', '#', 'admin', '2021-05-11 00:58:50', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1056, '????????????', 110, 7, '#', '', 'F', '0', '1', 'monitor:job:export', '#', 'admin', '2021-05-11 00:58:50', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1057, '????????????', 115, 1, '#', '', 'F', '0', '1', 'tool:gen:list', '#', 'admin', '2021-05-11 00:58:50', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1058, '????????????', 115, 2, '#', '', 'F', '0', '1', 'tool:gen:edit', '#', 'admin', '2021-05-11 00:58:50', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1059, '????????????', 115, 3, '#', '', 'F', '0', '1', 'tool:gen:remove', '#', 'admin', '2021-05-11 00:58:50', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1060, '????????????', 115, 4, '#', '', 'F', '0', '1', 'tool:gen:preview', '#', 'admin', '2021-05-11 00:58:50', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1061, '????????????', 115, 5, '#', '', 'F', '0', '1', 'tool:gen:code', '#', 'admin', '2021-05-11 00:58:50', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2000, '??????????????????', 0, 2, '/member', 'menuItem', 'C', '0', '1', 'system:member:view', '#', 'admin', '2021-05-11 06:44:33', '', NULL, '');
COMMIT;

-- ----------------------------
-- Table structure for sys_notice
-- ----------------------------
DROP TABLE IF EXISTS `sys_notice`;
CREATE TABLE `sys_notice` (
  `notice_id` int NOT NULL AUTO_INCREMENT COMMENT '??????ID',
  `notice_title` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '????????????',
  `notice_type` char(1) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '???????????????1?????? 2?????????',
  `notice_content` varchar(2000) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '????????????',
  `status` char(1) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT '0' COMMENT '???????????????0?????? 1?????????',
  `create_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT '' COMMENT '?????????',
  `create_time` datetime DEFAULT NULL COMMENT '????????????',
  `update_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT '' COMMENT '?????????',
  `update_time` datetime DEFAULT NULL COMMENT '????????????',
  `remark` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '??????',
  PRIMARY KEY (`notice_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb3 COLLATE=utf8_bin COMMENT='???????????????';

-- ----------------------------
-- Records of sys_notice
-- ----------------------------
BEGIN;
INSERT INTO `sys_notice` VALUES (1, '???????????????2018-07-01 ????????????????????????', '2', '???????????????', '0', 'admin', '2021-05-11 00:58:50', '', NULL, '?????????');
INSERT INTO `sys_notice` VALUES (2, '???????????????2018-07-01 ????????????????????????', '1', '????????????', '0', 'admin', '2021-05-11 00:58:50', '', NULL, '?????????');
COMMIT;

-- ----------------------------
-- Table structure for sys_oper_log
-- ----------------------------
DROP TABLE IF EXISTS `sys_oper_log`;
CREATE TABLE `sys_oper_log` (
  `oper_id` bigint NOT NULL AUTO_INCREMENT COMMENT '????????????',
  `title` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT '' COMMENT '????????????',
  `business_type` int DEFAULT '0' COMMENT '???????????????0?????? 1?????? 2?????? 3?????????',
  `method` varchar(100) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT '' COMMENT '????????????',
  `request_method` varchar(10) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT '' COMMENT '????????????',
  `operator_type` int DEFAULT '0' COMMENT '???????????????0?????? 1???????????? 2??????????????????',
  `oper_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT '' COMMENT '????????????',
  `dept_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT '' COMMENT '????????????',
  `oper_url` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT '' COMMENT '??????URL',
  `oper_ip` varchar(128) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT '' COMMENT '????????????',
  `oper_location` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT '' COMMENT '????????????',
  `oper_param` varchar(2000) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT '' COMMENT '????????????',
  `json_result` varchar(2000) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT '' COMMENT '????????????',
  `status` int DEFAULT '0' COMMENT '???????????????0?????? 1?????????',
  `error_msg` varchar(2000) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT '' COMMENT '????????????',
  `oper_time` datetime DEFAULT NULL COMMENT '????????????',
  PRIMARY KEY (`oper_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=128 DEFAULT CHARSET=utf8mb3 COLLATE=utf8_bin COMMENT='??????????????????';

-- ----------------------------
-- Records of sys_oper_log
-- ----------------------------
BEGIN;
INSERT INTO `sys_oper_log` VALUES (100, '????????????', 6, 'com.ruoyi.generator.controller.GenController.importTableSave()', 'POST', 1, 'admin', '????????????', '/tool/gen/importTable', '127.0.0.1', '??????IP', '{\"tables\":[\"member\"]}', '{\n  \"msg\" : \"????????????\",\n  \"code\" : 0\n}', 0, NULL, '2021-05-11 05:35:54');
INSERT INTO `sys_oper_log` VALUES (101, '????????????', 1, 'com.ruoyi.web.controller.system.SysMenuController.addSave()', 'POST', 1, 'admin', '????????????', '/system/menu/add', '127.0.0.1', '??????IP', '{\"parentId\":[\"0\"],\"menuType\":[\"C\"],\"menuName\":[\"??????????????????\"],\"url\":[\"/member\"],\"target\":[\"menuItem\"],\"perms\":[\"system:member:view\"],\"orderNum\":[\"2\"],\"icon\":[\"\"],\"visible\":[\"0\"],\"isRefresh\":[\"1\"]}', '{\n  \"msg\" : \"????????????\",\n  \"code\" : 0\n}', 0, NULL, '2021-05-11 06:44:33');
INSERT INTO `sys_oper_log` VALUES (102, '???????????????????????????', 2, 'com.ruoyi.controller.MemberController.editSave()', 'POST', 1, 'admin', '????????????', '/member/edit', '127.0.0.1', '??????IP', '{\"id\":[\"\"],\"name\":[\"FengRoot\"],\"age\":[\"24\"],\"balance\":[\"13\"],\"totalMoney\":[\"12\"],\"state\":[\"1\"]}', NULL, 1, 'nested exception is org.apache.ibatis.exceptions.PersistenceException: \n### Error updating database.  Cause: java.lang.IllegalStateException: Type handler was null on parameter mapping for property \'params\'. It was either not specified and/or could not be found for the javaType (java.util.Map) : jdbcType (null) combination.\n### The error may exist in com/ruoyi/mapper/MemberMapper.java (best guess)\n### The error may involve com.ruoyi.mapper.MemberMapper.insert\n### The error occurred while executing an update\n### Cause: java.lang.IllegalStateException: Type handler was null on parameter mapping for property \'params\'. It was either not specified and/or could not be found for the javaType (java.util.Map) : jdbcType (null) combination.', '2021-05-11 10:31:15');
INSERT INTO `sys_oper_log` VALUES (103, '???????????????????????????', 2, 'com.ruoyi.controller.MemberController.editSave()', 'POST', 1, 'admin', '????????????', '/member/edit', '127.0.0.1', '??????IP', '{\"id\":[\"\"],\"name\":[\"FengRoot\"],\"age\":[\"24\"],\"balance\":[\"13\"]}', NULL, 1, 'nested exception is org.apache.ibatis.exceptions.PersistenceException: \n### Error updating database.  Cause: java.lang.IllegalStateException: Type handler was null on parameter mapping for property \'params\'. It was either not specified and/or could not be found for the javaType (java.util.Map) : jdbcType (null) combination.\n### The error may exist in com/ruoyi/mapper/MemberMapper.java (best guess)\n### The error may involve com.ruoyi.mapper.MemberMapper.insert\n### The error occurred while executing an update\n### Cause: java.lang.IllegalStateException: Type handler was null on parameter mapping for property \'params\'. It was either not specified and/or could not be found for the javaType (java.util.Map) : jdbcType (null) combination.', '2021-05-11 10:46:28');
INSERT INTO `sys_oper_log` VALUES (104, '???????????????????????????', 2, 'com.ruoyi.controller.MemberController.editSave()', 'POST', 1, 'admin', '????????????', '/member/edit', '127.0.0.1', '??????IP', '{\"id\":[\"\"],\"name\":[\"FengRoot\"],\"age\":[\"24\"],\"balance\":[\"13\"]}', NULL, 1, 'nested exception is org.apache.ibatis.exceptions.PersistenceException: \n### Error updating database.  Cause: java.lang.IllegalStateException: Type handler was null on parameter mapping for property \'params\'. It was either not specified and/or could not be found for the javaType (java.util.Map) : jdbcType (null) combination.\n### The error may exist in com/ruoyi/mapper/MemberMapper.java (best guess)\n### The error may involve com.ruoyi.mapper.MemberMapper.insert\n### The error occurred while executing an update\n### Cause: java.lang.IllegalStateException: Type handler was null on parameter mapping for property \'params\'. It was either not specified and/or could not be found for the javaType (java.util.Map) : jdbcType (null) combination.', '2021-05-11 10:46:34');
INSERT INTO `sys_oper_log` VALUES (105, '???????????????????????????', 2, 'com.ruoyi.controller.MemberController.editSave()', 'POST', 1, 'admin', '????????????', '/member/edit', '127.0.0.1', '??????IP', '{\"id\":[\"\"],\"name\":[\"FengRoot\"],\"age\":[\"24\"],\"balance\":[\"13\"]}', NULL, 1, 'nested exception is org.apache.ibatis.exceptions.PersistenceException: \n### Error updating database.  Cause: java.lang.IllegalStateException: Type handler was null on parameter mapping for property \'params\'. It was either not specified and/or could not be found for the javaType (java.util.Map) : jdbcType (null) combination.\n### The error may exist in com/ruoyi/mapper/MemberMapper.java (best guess)\n### The error may involve com.ruoyi.mapper.MemberMapper.insert\n### The error occurred while executing an update\n### Cause: java.lang.IllegalStateException: Type handler was null on parameter mapping for property \'params\'. It was either not specified and/or could not be found for the javaType (java.util.Map) : jdbcType (null) combination.', '2021-05-11 10:47:07');
INSERT INTO `sys_oper_log` VALUES (106, '???????????????????????????', 2, 'com.ruoyi.controller.MemberController.editSave()', 'POST', 1, 'admin', '????????????', '/member/edit', '127.0.0.1', '??????IP', '{\"id\":[\"\"],\"name\":[\"FengRoot\"],\"age\":[\"24\"],\"balance\":[\"13\"]}', NULL, 1, 'nested exception is org.apache.ibatis.exceptions.PersistenceException: \n### Error updating database.  Cause: java.lang.IllegalStateException: Type handler was null on parameter mapping for property \'params\'. It was either not specified and/or could not be found for the javaType (java.util.Map) : jdbcType (null) combination.\n### The error may exist in com/ruoyi/mapper/MemberMapper.java (best guess)\n### The error may involve com.ruoyi.mapper.MemberMapper.insert\n### The error occurred while executing an update\n### Cause: java.lang.IllegalStateException: Type handler was null on parameter mapping for property \'params\'. It was either not specified and/or could not be found for the javaType (java.util.Map) : jdbcType (null) combination.', '2021-05-11 10:49:32');
INSERT INTO `sys_oper_log` VALUES (107, '???????????????????????????', 2, 'com.ruoyi.controller.MemberController.editSave()', 'POST', 1, 'admin', '????????????', '/member/edit', '127.0.0.1', '??????IP', '{\"id\":[\"\"],\"name\":[\"FengRoot\"],\"age\":[\"\"],\"balance\":[\"\"]}', NULL, 1, 'nested exception is org.apache.ibatis.exceptions.PersistenceException: \n### Error updating database.  Cause: java.lang.IllegalStateException: Type handler was null on parameter mapping for property \'params\'. It was either not specified and/or could not be found for the javaType (java.util.Map) : jdbcType (null) combination.\n### The error may exist in com/ruoyi/mapper/MemberMapper.java (best guess)\n### The error may involve com.ruoyi.mapper.MemberMapper.insert\n### The error occurred while executing an update\n### Cause: java.lang.IllegalStateException: Type handler was null on parameter mapping for property \'params\'. It was either not specified and/or could not be found for the javaType (java.util.Map) : jdbcType (null) combination.', '2021-05-12 01:18:31');
INSERT INTO `sys_oper_log` VALUES (108, '???????????????????????????', 2, 'com.ruoyi.controller.MemberController.editSave()', 'POST', 1, 'admin', '????????????', '/member/edit', '127.0.0.1', '??????IP', '{\"id\":[\"\"],\"name\":[\"FengRoot\"],\"age\":[\"\"],\"balance\":[\"\"]}', NULL, 1, 'nested exception is org.apache.ibatis.exceptions.PersistenceException: \n### Error updating database.  Cause: java.lang.IllegalStateException: Type handler was null on parameter mapping for property \'params\'. It was either not specified and/or could not be found for the javaType (java.util.Map) : jdbcType (null) combination.\n### The error may exist in com/ruoyi/mapper/MemberMapper.java (best guess)\n### The error may involve com.ruoyi.mapper.MemberMapper.insert\n### The error occurred while executing an update\n### Cause: java.lang.IllegalStateException: Type handler was null on parameter mapping for property \'params\'. It was either not specified and/or could not be found for the javaType (java.util.Map) : jdbcType (null) combination.', '2021-05-12 01:21:42');
INSERT INTO `sys_oper_log` VALUES (109, '???????????????????????????', 2, 'com.ruoyi.controller.MemberController.editSave()', 'POST', 1, 'admin', '????????????', '/member/edit', '127.0.0.1', '??????IP', '{\"id\":[\"\"],\"name\":[\"FengRoot\"],\"age\":[\"\"],\"balance\":[\"\"]}', NULL, 1, 'nested exception is org.apache.ibatis.exceptions.PersistenceException: \n### Error updating database.  Cause: java.lang.IllegalStateException: Type handler was null on parameter mapping for property \'params\'. It was either not specified and/or could not be found for the javaType (java.util.Map) : jdbcType (null) combination.\n### The error may exist in com/ruoyi/mapper/MemberMapper.java (best guess)\n### The error may involve com.ruoyi.mapper.MemberMapper.insert\n### The error occurred while executing an update\n### Cause: java.lang.IllegalStateException: Type handler was null on parameter mapping for property \'params\'. It was either not specified and/or could not be found for the javaType (java.util.Map) : jdbcType (null) combination.', '2021-05-12 01:22:22');
INSERT INTO `sys_oper_log` VALUES (110, '???????????????????????????', 2, 'com.ruoyi.controller.MemberController.editSave()', 'POST', 1, 'admin', '????????????', '/member/edit', '127.0.0.1', '??????IP', '{\"id\":[\"\"],\"name\":[\"FengRoot\"],\"age\":[\"\"],\"balance\":[\"\"]}', NULL, 1, '\n### Error updating database.  Cause: com.mysql.cj.jdbc.exceptions.MysqlDataTruncation: Data truncation: Out of range value for column \'id\' at row 1\n### The error may exist in com/ruoyi/mapper/MemberMapper.java (best guess)\n### The error may involve com.ruoyi.mapper.MemberMapper.insert-Inline\n### The error occurred while setting parameters\n### SQL: INSERT INTO member  ( id, name )  VALUES  ( ?, ? )\n### Cause: com.mysql.cj.jdbc.exceptions.MysqlDataTruncation: Data truncation: Out of range value for column \'id\' at row 1\n; Data truncation: Out of range value for column \'id\' at row 1; nested exception is com.mysql.cj.jdbc.exceptions.MysqlDataTruncation: Data truncation: Out of range value for column \'id\' at row 1', '2021-05-12 01:36:44');
INSERT INTO `sys_oper_log` VALUES (111, '???????????????????????????', 2, 'com.ruoyi.controller.MemberController.editSave()', 'POST', 1, 'admin', '????????????', '/member/edit', '127.0.0.1', '??????IP', '{\"id\":[\"\"],\"name\":[\"FengRoot\"],\"age\":[\"24\"],\"balance\":[\"13\"]}', NULL, 1, '\n### Error updating database.  Cause: com.mysql.cj.jdbc.exceptions.MysqlDataTruncation: Data truncation: Out of range value for column \'id\' at row 1\n### The error may exist in com/ruoyi/mapper/MemberMapper.java (best guess)\n### The error may involve com.ruoyi.mapper.MemberMapper.insert-Inline\n### The error occurred while setting parameters\n### SQL: INSERT INTO member  ( id, name, age, balance )  VALUES  ( ?, ?, ?, ? )\n### Cause: com.mysql.cj.jdbc.exceptions.MysqlDataTruncation: Data truncation: Out of range value for column \'id\' at row 1\n; Data truncation: Out of range value for column \'id\' at row 1; nested exception is com.mysql.cj.jdbc.exceptions.MysqlDataTruncation: Data truncation: Out of range value for column \'id\' at row 1', '2021-05-12 01:41:04');
INSERT INTO `sys_oper_log` VALUES (112, '???????????????????????????', 2, 'com.ruoyi.controller.MemberController.editSave()', 'POST', 1, 'admin', '????????????', '/member/edit', '127.0.0.1', '??????IP', '{\"name\":[\"FengRoot\"],\"age\":[\"\"],\"balance\":[\"\"]}', NULL, 1, '\n### Error updating database.  Cause: com.mysql.cj.jdbc.exceptions.MysqlDataTruncation: Data truncation: Out of range value for column \'id\' at row 1\n### The error may exist in com/ruoyi/mapper/MemberMapper.java (best guess)\n### The error may involve com.ruoyi.mapper.MemberMapper.insert-Inline\n### The error occurred while setting parameters\n### SQL: INSERT INTO member  ( id, name )  VALUES  ( ?, ? )\n### Cause: com.mysql.cj.jdbc.exceptions.MysqlDataTruncation: Data truncation: Out of range value for column \'id\' at row 1\n; Data truncation: Out of range value for column \'id\' at row 1; nested exception is com.mysql.cj.jdbc.exceptions.MysqlDataTruncation: Data truncation: Out of range value for column \'id\' at row 1', '2021-05-12 01:43:47');
INSERT INTO `sys_oper_log` VALUES (113, '???????????????????????????', 2, 'com.ruoyi.controller.MemberController.editSave()', 'POST', 1, 'admin', '????????????', '/member/edit', '127.0.0.1', '??????IP', '{\"name\":[\"FengRoot\"],\"age\":[\"\"],\"balance\":[\"\"]}', NULL, 1, '\n### Error updating database.  Cause: com.mysql.cj.jdbc.exceptions.MysqlDataTruncation: Data truncation: Out of range value for column \'id\' at row 1\n### The error may exist in com/ruoyi/mapper/MemberMapper.java (best guess)\n### The error may involve com.ruoyi.mapper.MemberMapper.insert-Inline\n### The error occurred while setting parameters\n### SQL: INSERT INTO member  ( id, name )  VALUES  ( ?, ? )\n### Cause: com.mysql.cj.jdbc.exceptions.MysqlDataTruncation: Data truncation: Out of range value for column \'id\' at row 1\n; Data truncation: Out of range value for column \'id\' at row 1; nested exception is com.mysql.cj.jdbc.exceptions.MysqlDataTruncation: Data truncation: Out of range value for column \'id\' at row 1', '2021-05-12 01:44:45');
INSERT INTO `sys_oper_log` VALUES (114, '???????????????????????????', 2, 'com.ruoyi.controller.MemberController.editSave()', 'POST', 1, 'admin', '????????????', '/member/edit', '127.0.0.1', '??????IP', '{\"id\":[\"\"],\"name\":[\"FengRoot\"],\"age\":[\"\"],\"balance\":[\"\"]}', NULL, 1, '\n### Error updating database.  Cause: com.mysql.cj.jdbc.exceptions.MysqlDataTruncation: Data truncation: Out of range value for column \'id\' at row 1\n### The error may exist in com/ruoyi/mapper/MemberMapper.java (best guess)\n### The error may involve com.ruoyi.mapper.MemberMapper.insert-Inline\n### The error occurred while setting parameters\n### SQL: INSERT INTO member  ( id, name )  VALUES  ( ?, ? )\n### Cause: com.mysql.cj.jdbc.exceptions.MysqlDataTruncation: Data truncation: Out of range value for column \'id\' at row 1\n; Data truncation: Out of range value for column \'id\' at row 1; nested exception is com.mysql.cj.jdbc.exceptions.MysqlDataTruncation: Data truncation: Out of range value for column \'id\' at row 1', '2021-05-12 01:49:34');
INSERT INTO `sys_oper_log` VALUES (115, '???????????????????????????', 2, 'com.ruoyi.controller.MemberController.editSave()', 'POST', 1, 'admin', '????????????', '/member/edit', '127.0.0.1', '??????IP', '{\"id\":[\"\"],\"name\":[\"FengRoot\"],\"age\":[\"\"],\"balance\":[\"\"]}', '{\n  \"msg\" : \"????????????\",\n  \"code\" : 0\n}', 0, NULL, '2021-05-12 01:50:52');
INSERT INTO `sys_oper_log` VALUES (116, '???????????????????????????', 2, 'com.ruoyi.controller.MemberController.editSave()', 'POST', 1, 'admin', '????????????', '/member/edit', '127.0.0.1', '??????IP', '{\"id\":[\"\"],\"name\":[\"FengRoot\"],\"age\":[\"24\"],\"balance\":[\"13\"]}', '{\n  \"msg\" : \"????????????\",\n  \"code\" : 0\n}', 0, NULL, '2021-05-12 02:03:49');
INSERT INTO `sys_oper_log` VALUES (117, '???????????????????????????', 2, 'com.ruoyi.controller.MemberController.editSave()', 'POST', 1, 'admin', '????????????', '/member/edit', '127.0.0.1', '??????IP', '{\"id\":[\"\"],\"name\":[\"?????????\"],\"age\":[\"24\"],\"balance\":[\"13\"]}', '{\n  \"msg\" : \"????????????\",\n  \"code\" : 0\n}', 0, NULL, '2021-05-12 02:04:57');
INSERT INTO `sys_oper_log` VALUES (118, '???????????????????????????', 3, 'com.ruoyi.controller.MemberController.remove()', 'POST', 1, 'admin', '????????????', '/member/remove', '127.0.0.1', '??????IP', '{\"ids\":[\"1392299727445364700\"]}', '{\n  \"msg\" : \"????????????\",\n  \"code\" : 0\n}', 0, NULL, '2021-05-12 02:13:27');
INSERT INTO `sys_oper_log` VALUES (119, '???????????????????????????', 2, 'com.ruoyi.controller.MemberController.editSave()', 'POST', 1, 'admin', '????????????', '/member/edit', '127.0.0.1', '??????IP', '{\"id\":[\"\"],\"name\":[\"apple\"],\"age\":[\"24\"],\"balance\":[\"13\"]}', '{\n  \"msg\" : \"????????????\",\n  \"code\" : 0\n}', 0, NULL, '2021-05-12 02:13:45');
INSERT INTO `sys_oper_log` VALUES (120, '???????????????????????????', 2, 'com.ruoyi.controller.MemberController.editSave()', 'POST', 1, 'admin', '????????????', '/member/edit', '127.0.0.1', '??????IP', '{\"id\":[\"\"],\"name\":[\"RootFaker\"],\"age\":[\"\"],\"balance\":[\"\"]}', '{\n  \"msg\" : \"????????????\",\n  \"code\" : 0\n}', 0, NULL, '2021-05-12 02:20:52');
INSERT INTO `sys_oper_log` VALUES (121, '???????????????????????????', 2, 'com.ruoyi.controller.MemberController.editSave()', 'POST', 1, 'admin', '????????????', '/member/edit', '127.0.0.1', '??????IP', '{\"id\":[\"\"],\"name\":[\"RootFaker\"],\"age\":[\"\"],\"balance\":[\"\"]}', '{\n  \"msg\" : \"????????????\",\n  \"code\" : 0\n}', 0, NULL, '2021-05-12 02:22:18');
INSERT INTO `sys_oper_log` VALUES (122, '???????????????????????????', 3, 'com.ruoyi.controller.MemberController.remove()', 'POST', 1, 'admin', '????????????', '/member/remove', '127.0.0.1', '??????IP', '{\"ids\":[\"1392304093585956900\"]}', '{\n  \"msg\" : \"????????????\",\n  \"code\" : 0\n}', 0, NULL, '2021-05-12 02:29:31');
INSERT INTO `sys_oper_log` VALUES (123, '???????????????????????????', 3, 'com.ruoyi.controller.MemberController.remove()', 'POST', 1, 'admin', '????????????', '/member/remove', '127.0.0.1', '??????IP', '{\"ids\":[\"1392304093585956900\"]}', '{\n  \"msg\" : \"????????????\",\n  \"code\" : 0\n}', 0, NULL, '2021-05-12 02:29:47');
INSERT INTO `sys_oper_log` VALUES (124, '???????????????????????????', 3, 'com.ruoyi.controller.MemberController.remove()', 'POST', 1, 'admin', '????????????', '/member/remove', '127.0.0.1', '??????IP', '{\"ids\":[\"1\"]}', '{\n  \"msg\" : \"????????????\",\n  \"code\" : 0\n}', 0, NULL, '2021-05-12 02:39:28');
INSERT INTO `sys_oper_log` VALUES (125, '???????????????????????????', 3, 'com.ruoyi.controller.MemberController.remove()', 'POST', 1, 'admin', '????????????', '/member/remove', '127.0.0.1', '??????IP', '{\"ids\":[\"2\"]}', '{\n  \"msg\" : \"????????????\",\n  \"code\" : 0\n}', 0, NULL, '2021-05-12 02:41:00');
INSERT INTO `sys_oper_log` VALUES (126, '???????????????????????????', 2, 'com.ruoyi.controller.MemberController.editSave()', 'POST', 1, 'admin', '????????????', '/member/edit', '127.0.0.1', '??????IP', '{\"id\":[\"\"],\"name\":[\"FengRoot\"],\"age\":[\"24\"],\"balance\":[\"\"]}', '{\n  \"msg\" : \"????????????\",\n  \"code\" : 0\n}', 0, NULL, '2021-05-12 02:41:08');
INSERT INTO `sys_oper_log` VALUES (127, '????????????', 2, 'com.ruoyi.generator.controller.GenController.synchDb()', 'GET', 1, 'admin', '????????????', '/tool/gen/synchDb/member', '127.0.0.1', '??????IP', '\"member\"', '{\n  \"msg\" : \"????????????\",\n  \"code\" : 0\n}', 0, NULL, '2021-10-19 02:22:08');
COMMIT;

-- ----------------------------
-- Table structure for sys_post
-- ----------------------------
DROP TABLE IF EXISTS `sys_post`;
CREATE TABLE `sys_post` (
  `post_id` bigint NOT NULL AUTO_INCREMENT COMMENT '??????ID',
  `post_code` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '????????????',
  `post_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '????????????',
  `post_sort` int NOT NULL COMMENT '????????????',
  `status` char(1) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '?????????0?????? 1?????????',
  `create_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT '' COMMENT '?????????',
  `create_time` datetime DEFAULT NULL COMMENT '????????????',
  `update_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT '' COMMENT '?????????',
  `update_time` datetime DEFAULT NULL COMMENT '????????????',
  `remark` varchar(500) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '??????',
  PRIMARY KEY (`post_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb3 COLLATE=utf8_bin COMMENT='???????????????';

-- ----------------------------
-- Records of sys_post
-- ----------------------------
BEGIN;
INSERT INTO `sys_post` VALUES (1, 'ceo', '?????????', 1, '0', 'admin', '2021-05-11 00:58:50', '', NULL, '');
INSERT INTO `sys_post` VALUES (2, 'se', '????????????', 2, '0', 'admin', '2021-05-11 00:58:50', '', NULL, '');
INSERT INTO `sys_post` VALUES (3, 'hr', '????????????', 3, '0', 'admin', '2021-05-11 00:58:50', '', NULL, '');
INSERT INTO `sys_post` VALUES (4, 'user', '????????????', 4, '0', 'admin', '2021-05-11 00:58:50', '', NULL, '');
COMMIT;

-- ----------------------------
-- Table structure for sys_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_role`;
CREATE TABLE `sys_role` (
  `role_id` bigint NOT NULL AUTO_INCREMENT COMMENT '??????ID',
  `role_name` varchar(30) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '????????????',
  `role_key` varchar(100) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '?????????????????????',
  `role_sort` int NOT NULL COMMENT '????????????',
  `data_scope` char(1) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT '1' COMMENT '???????????????1????????????????????? 2????????????????????? 3???????????????????????? 4????????????????????????????????????',
  `status` char(1) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '???????????????0?????? 1?????????',
  `del_flag` char(1) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT '0' COMMENT '???????????????0???????????? 2???????????????',
  `create_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT '' COMMENT '?????????',
  `create_time` datetime DEFAULT NULL COMMENT '????????????',
  `update_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT '' COMMENT '?????????',
  `update_time` datetime DEFAULT NULL COMMENT '????????????',
  `remark` varchar(500) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '??????',
  PRIMARY KEY (`role_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb3 COLLATE=utf8_bin COMMENT='???????????????';

-- ----------------------------
-- Records of sys_role
-- ----------------------------
BEGIN;
INSERT INTO `sys_role` VALUES (1, '???????????????', 'admin', 1, '1', '0', '0', 'admin', '2021-05-11 00:58:50', '', NULL, '???????????????');
INSERT INTO `sys_role` VALUES (2, '????????????', 'common', 2, '2', '0', '0', 'admin', '2021-05-11 00:58:50', '', NULL, '????????????');
COMMIT;

-- ----------------------------
-- Table structure for sys_role_dept
-- ----------------------------
DROP TABLE IF EXISTS `sys_role_dept`;
CREATE TABLE `sys_role_dept` (
  `role_id` bigint NOT NULL COMMENT '??????ID',
  `dept_id` bigint NOT NULL COMMENT '??????ID',
  PRIMARY KEY (`role_id`,`dept_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8_bin COMMENT='????????????????????????';

-- ----------------------------
-- Records of sys_role_dept
-- ----------------------------
BEGIN;
INSERT INTO `sys_role_dept` VALUES (2, 100);
INSERT INTO `sys_role_dept` VALUES (2, 101);
INSERT INTO `sys_role_dept` VALUES (2, 105);
COMMIT;

-- ----------------------------
-- Table structure for sys_role_menu
-- ----------------------------
DROP TABLE IF EXISTS `sys_role_menu`;
CREATE TABLE `sys_role_menu` (
  `role_id` bigint NOT NULL COMMENT '??????ID',
  `menu_id` bigint NOT NULL COMMENT '??????ID',
  PRIMARY KEY (`role_id`,`menu_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8_bin COMMENT='????????????????????????';

-- ----------------------------
-- Records of sys_role_menu
-- ----------------------------
BEGIN;
INSERT INTO `sys_role_menu` VALUES (2, 1);
INSERT INTO `sys_role_menu` VALUES (2, 2);
INSERT INTO `sys_role_menu` VALUES (2, 3);
INSERT INTO `sys_role_menu` VALUES (2, 4);
INSERT INTO `sys_role_menu` VALUES (2, 100);
INSERT INTO `sys_role_menu` VALUES (2, 101);
INSERT INTO `sys_role_menu` VALUES (2, 102);
INSERT INTO `sys_role_menu` VALUES (2, 103);
INSERT INTO `sys_role_menu` VALUES (2, 104);
INSERT INTO `sys_role_menu` VALUES (2, 105);
INSERT INTO `sys_role_menu` VALUES (2, 106);
INSERT INTO `sys_role_menu` VALUES (2, 107);
INSERT INTO `sys_role_menu` VALUES (2, 108);
INSERT INTO `sys_role_menu` VALUES (2, 109);
INSERT INTO `sys_role_menu` VALUES (2, 110);
INSERT INTO `sys_role_menu` VALUES (2, 111);
INSERT INTO `sys_role_menu` VALUES (2, 112);
INSERT INTO `sys_role_menu` VALUES (2, 113);
INSERT INTO `sys_role_menu` VALUES (2, 114);
INSERT INTO `sys_role_menu` VALUES (2, 115);
INSERT INTO `sys_role_menu` VALUES (2, 116);
INSERT INTO `sys_role_menu` VALUES (2, 500);
INSERT INTO `sys_role_menu` VALUES (2, 501);
INSERT INTO `sys_role_menu` VALUES (2, 1000);
INSERT INTO `sys_role_menu` VALUES (2, 1001);
INSERT INTO `sys_role_menu` VALUES (2, 1002);
INSERT INTO `sys_role_menu` VALUES (2, 1003);
INSERT INTO `sys_role_menu` VALUES (2, 1004);
INSERT INTO `sys_role_menu` VALUES (2, 1005);
INSERT INTO `sys_role_menu` VALUES (2, 1006);
INSERT INTO `sys_role_menu` VALUES (2, 1007);
INSERT INTO `sys_role_menu` VALUES (2, 1008);
INSERT INTO `sys_role_menu` VALUES (2, 1009);
INSERT INTO `sys_role_menu` VALUES (2, 1010);
INSERT INTO `sys_role_menu` VALUES (2, 1011);
INSERT INTO `sys_role_menu` VALUES (2, 1012);
INSERT INTO `sys_role_menu` VALUES (2, 1013);
INSERT INTO `sys_role_menu` VALUES (2, 1014);
INSERT INTO `sys_role_menu` VALUES (2, 1015);
INSERT INTO `sys_role_menu` VALUES (2, 1016);
INSERT INTO `sys_role_menu` VALUES (2, 1017);
INSERT INTO `sys_role_menu` VALUES (2, 1018);
INSERT INTO `sys_role_menu` VALUES (2, 1019);
INSERT INTO `sys_role_menu` VALUES (2, 1020);
INSERT INTO `sys_role_menu` VALUES (2, 1021);
INSERT INTO `sys_role_menu` VALUES (2, 1022);
INSERT INTO `sys_role_menu` VALUES (2, 1023);
INSERT INTO `sys_role_menu` VALUES (2, 1024);
INSERT INTO `sys_role_menu` VALUES (2, 1025);
INSERT INTO `sys_role_menu` VALUES (2, 1026);
INSERT INTO `sys_role_menu` VALUES (2, 1027);
INSERT INTO `sys_role_menu` VALUES (2, 1028);
INSERT INTO `sys_role_menu` VALUES (2, 1029);
INSERT INTO `sys_role_menu` VALUES (2, 1030);
INSERT INTO `sys_role_menu` VALUES (2, 1031);
INSERT INTO `sys_role_menu` VALUES (2, 1032);
INSERT INTO `sys_role_menu` VALUES (2, 1033);
INSERT INTO `sys_role_menu` VALUES (2, 1034);
INSERT INTO `sys_role_menu` VALUES (2, 1035);
INSERT INTO `sys_role_menu` VALUES (2, 1036);
INSERT INTO `sys_role_menu` VALUES (2, 1037);
INSERT INTO `sys_role_menu` VALUES (2, 1038);
INSERT INTO `sys_role_menu` VALUES (2, 1039);
INSERT INTO `sys_role_menu` VALUES (2, 1040);
INSERT INTO `sys_role_menu` VALUES (2, 1041);
INSERT INTO `sys_role_menu` VALUES (2, 1042);
INSERT INTO `sys_role_menu` VALUES (2, 1043);
INSERT INTO `sys_role_menu` VALUES (2, 1044);
INSERT INTO `sys_role_menu` VALUES (2, 1045);
INSERT INTO `sys_role_menu` VALUES (2, 1046);
INSERT INTO `sys_role_menu` VALUES (2, 1047);
INSERT INTO `sys_role_menu` VALUES (2, 1048);
INSERT INTO `sys_role_menu` VALUES (2, 1049);
INSERT INTO `sys_role_menu` VALUES (2, 1050);
INSERT INTO `sys_role_menu` VALUES (2, 1051);
INSERT INTO `sys_role_menu` VALUES (2, 1052);
INSERT INTO `sys_role_menu` VALUES (2, 1053);
INSERT INTO `sys_role_menu` VALUES (2, 1054);
INSERT INTO `sys_role_menu` VALUES (2, 1055);
INSERT INTO `sys_role_menu` VALUES (2, 1056);
INSERT INTO `sys_role_menu` VALUES (2, 1057);
INSERT INTO `sys_role_menu` VALUES (2, 1058);
INSERT INTO `sys_role_menu` VALUES (2, 1059);
INSERT INTO `sys_role_menu` VALUES (2, 1060);
INSERT INTO `sys_role_menu` VALUES (2, 1061);
COMMIT;

-- ----------------------------
-- Table structure for sys_user
-- ----------------------------
DROP TABLE IF EXISTS `sys_user`;
CREATE TABLE `sys_user` (
  `user_id` bigint NOT NULL AUTO_INCREMENT COMMENT '??????ID',
  `dept_id` bigint DEFAULT NULL COMMENT '??????ID',
  `login_name` varchar(30) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '????????????',
  `user_name` varchar(30) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT '' COMMENT '????????????',
  `user_type` varchar(2) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT '00' COMMENT '???????????????00???????????? 01???????????????',
  `email` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT '' COMMENT '????????????',
  `phonenumber` varchar(11) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT '' COMMENT '????????????',
  `sex` char(1) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT '0' COMMENT '???????????????0??? 1??? 2?????????',
  `avatar` varchar(100) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT '' COMMENT '????????????',
  `password` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT '' COMMENT '??????',
  `salt` varchar(20) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT '' COMMENT '?????????',
  `status` char(1) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT '0' COMMENT '???????????????0?????? 1?????????',
  `del_flag` char(1) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT '0' COMMENT '???????????????0???????????? 2???????????????',
  `login_ip` varchar(128) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT '' COMMENT '????????????IP',
  `login_date` datetime DEFAULT NULL COMMENT '??????????????????',
  `pwd_update_date` datetime DEFAULT NULL COMMENT '????????????????????????',
  `create_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT '' COMMENT '?????????',
  `create_time` datetime DEFAULT NULL COMMENT '????????????',
  `update_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT '' COMMENT '?????????',
  `update_time` datetime DEFAULT NULL COMMENT '????????????',
  `remark` varchar(500) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '??????',
  PRIMARY KEY (`user_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb3 COLLATE=utf8_bin COMMENT='???????????????';

-- ----------------------------
-- Records of sys_user
-- ----------------------------
BEGIN;
INSERT INTO `sys_user` VALUES (1, 103, 'admin', '??????', '00', 'ry@163.com', '15888888888', '1', '', '29c67a30398638269fe600f73a054934', '111111', '0', '0', '127.0.0.1', '2021-10-19 10:21:36', '2021-05-11 00:58:50', 'admin', '2021-05-11 00:58:50', '', '2021-10-19 02:21:36', '?????????');
INSERT INTO `sys_user` VALUES (2, 105, 'ry', '??????', '00', 'ry@qq.com', '15666666666', '1', '', '8e6d98b90472783cc73c17047ddccf36', '222222', '0', '0', '127.0.0.1', '2021-05-11 00:58:50', '2021-05-11 00:58:50', 'admin', '2021-05-11 00:58:50', '', NULL, '?????????');
COMMIT;

-- ----------------------------
-- Table structure for sys_user_online
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_online`;
CREATE TABLE `sys_user_online` (
  `sessionId` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT '' COMMENT '????????????id',
  `login_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT '' COMMENT '????????????',
  `dept_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT '' COMMENT '????????????',
  `ipaddr` varchar(128) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT '' COMMENT '??????IP??????',
  `login_location` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT '' COMMENT '????????????',
  `browser` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT '' COMMENT '???????????????',
  `os` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT '' COMMENT '????????????',
  `status` varchar(10) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT '' COMMENT '????????????on_line??????off_line??????',
  `start_timestamp` datetime DEFAULT NULL COMMENT 'session????????????',
  `last_access_time` datetime DEFAULT NULL COMMENT 'session??????????????????',
  `expire_time` int DEFAULT '0' COMMENT '??????????????????????????????',
  PRIMARY KEY (`sessionId`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8_bin COMMENT='??????????????????';

-- ----------------------------
-- Records of sys_user_online
-- ----------------------------
BEGIN;
INSERT INTO `sys_user_online` VALUES ('dab50573-2abc-44e8-bbfe-714b9617aa67', 'admin', '????????????', '127.0.0.1', '??????IP', 'Chrome 9', 'Mac OS X', 'on_line', '2021-10-19 10:21:31', '2021-10-19 10:22:40', 1800000);
COMMIT;

-- ----------------------------
-- Table structure for sys_user_post
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_post`;
CREATE TABLE `sys_user_post` (
  `user_id` bigint NOT NULL COMMENT '??????ID',
  `post_id` bigint NOT NULL COMMENT '??????ID',
  PRIMARY KEY (`user_id`,`post_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8_bin COMMENT='????????????????????????';

-- ----------------------------
-- Records of sys_user_post
-- ----------------------------
BEGIN;
INSERT INTO `sys_user_post` VALUES (1, 1);
INSERT INTO `sys_user_post` VALUES (2, 2);
COMMIT;

-- ----------------------------
-- Table structure for sys_user_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_role`;
CREATE TABLE `sys_user_role` (
  `user_id` bigint NOT NULL COMMENT '??????ID',
  `role_id` bigint NOT NULL COMMENT '??????ID',
  PRIMARY KEY (`user_id`,`role_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8_bin COMMENT='????????????????????????';

-- ----------------------------
-- Records of sys_user_role
-- ----------------------------
BEGIN;
INSERT INTO `sys_user_role` VALUES (1, 1);
INSERT INTO `sys_user_role` VALUES (2, 2);
COMMIT;

SET FOREIGN_KEY_CHECKS = 1;
