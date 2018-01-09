/*
Navicat MySQL Data Transfer

Source Server         : chenlai
Source Server Version : 50720
Source Host           : localhost:3306
Source Database       : chenlai

Target Server Type    : MYSQL
Target Server Version : 50720
File Encoding         : 65001

Date: 2018-01-09 14:17:11
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for cms_article_data_guide
-- ----------------------------
DROP TABLE IF EXISTS `cms_article_data_guide`;
CREATE TABLE `cms_article_data_guide` (
  `id` varchar(64) COLLATE utf8_bin NOT NULL COMMENT '编号',
  `parent_id` varchar(64) COLLATE utf8_bin DEFAULT NULL COMMENT '父级编号',
  `parent_ids` varchar(2000) COLLATE utf8_bin DEFAULT NULL COMMENT '所有父级编号',
  `article_data_id` varchar(100) COLLATE utf8_bin NOT NULL COMMENT '栏目名称',
  `articleDivTitle` varchar(255) COLLATE utf8_bin DEFAULT NULL COMMENT '描述',
  `create_by` varchar(64) COLLATE utf8_bin DEFAULT NULL COMMENT '创建者',
  `create_date` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) COLLATE utf8_bin DEFAULT NULL COMMENT '更新者',
  `update_date` datetime DEFAULT NULL COMMENT '更新时间',
  `remarks` varchar(255) COLLATE utf8_bin DEFAULT NULL COMMENT '备注信息',
  `del_flag` char(1) COLLATE utf8_bin NOT NULL DEFAULT '0' COMMENT '删除标记',
  `articleDivHref` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `cms_category_parent_id` (`parent_id`),
  KEY `cms_category_name` (`article_data_id`),
  KEY `cms_category_del_flag` (`del_flag`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='栏目表';
