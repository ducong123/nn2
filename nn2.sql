-- phpMyAdmin SQL Dump
-- version 4.1.14
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: 2016-06-08 12:29:14
-- 服务器版本： 5.6.17
-- PHP Version: 5.5.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `nn`
--

DELIMITER $$
--
-- 函数
--
CREATE DEFINER=`root`@`localhost` FUNCTION `getChildLists`(`rootId` INT) RETURNS varchar(1000) CHARSET utf8
BEGIN 
                   DECLARE sTemp VARCHAR(1000); 
                   DECLARE sTempChd VARCHAR(1000); 
                 
                   SET sTemp = '$'; 
                   SET sTempChd =cast(rootId as CHAR); 
                 
                   WHILE sTempChd is not null DO 
                     SET sTemp = concat(sTemp,',',sTempChd); 
                     SELECT group_concat(id) INTO sTempChd FROM nn.product_category where FIND_IN_SET(pid,sTempChd)>0; 
                   END WHILE; 
                   RETURN sTemp; 
                 END$$

DELIMITER ;

-- --------------------------------------------------------

--
-- 表的结构 `admin`
--

CREATE TABLE IF NOT EXISTS `admin` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `name` varchar(20) NOT NULL COMMENT '管理员用户名',
  `password` varchar(40) NOT NULL COMMENT '密码',
  `role` int(11) NOT NULL COMMENT '角色id，0:超级管理员',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  `email` varchar(255) NOT NULL COMMENT '邮箱',
  `last_ip` varchar(30) NOT NULL DEFAULT '' COMMENT '最后登录ip',
  `last_time` datetime NOT NULL COMMENT '最后登录时间',
  `status` tinyint(2) NOT NULL DEFAULT '0' COMMENT '状态0:正常1:锁定',
  `session_id` varchar(255) NOT NULL COMMENT 'sessionID',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='后台管理员表' AUTO_INCREMENT=20 ;

--
-- 转存表中的数据 `admin`
--

INSERT INTO `admin` (`id`, `name`, `password`, `role`, `create_time`, `email`, `last_ip`, `last_time`, `status`, `session_id`) VALUES
(1, 'admin', '7c4a8d09ca3762af61e59520943dc26494f8941b', 0, '2016-04-01 00:00:00', '', '127.0.0.1', '0000-00-00 00:00:00', 0, '78dnng6qmfdf07u9i7rb1n7qe4'),
(2, 'admin12223', '7c4a8d09ca3762af61e59520943dc26494f8941b', 1, '2016-04-07 14:55:10', '48888@qq.com34', '::1', '2016-04-07 14:55:10', -1, ''),
(3, 'admin21', '7c4a8d09ca3762af61e59520943dc26494f8941b', 1, '2016-04-07 15:33:22', '1234567@qq.com', '::1', '2016-04-07 15:33:22', -1, ''),
(4, 'admin2', '7c4a8d09ca3762af61e59520943dc26494f8941b', 0, '2016-04-07 15:35:09', '1234562@qq.com', '::1', '2016-04-07 15:35:09', -1, '6tkenqd045pg6likt33p14h9j2'),
(5, 'admin23', '7c4a8d09ca3762af61e59520943dc26494f8941b', 1, '2016-04-07 15:35:28', '12345623@qq.com', '::1', '2016-04-07 15:35:28', -1, ''),
(6, 'admin5', '7c4a8d09ca3762af61e59520943dc26494f8941b', 1, '2016-04-07 15:37:48', '123456222@qq.com', '::1', '2016-04-07 15:37:48', -1, ''),
(7, 'admin88', '7c4a8d09ca3762af61e59520943dc26494f8941b', 1, '2016-04-07 15:39:12', '12345688@qq.com', '::1', '2016-04-07 15:39:12', -1, ''),
(8, 'admin889', '7c4a8d09ca3762af61e59520943dc26494f8941b', 1, '2016-04-07 15:39:46', '123456@qq.com1', '::1', '2016-04-07 15:39:46', -1, ''),
(9, 'admin99', '7c4a8d09ca3762af61e59520943dc26494f8941b', 1, '2016-04-07 15:40:56', '12345699@qq.com', '::1', '2016-04-07 15:40:56', -1, ''),
(10, 'admin65', '7c4a8d09ca3762af61e59520943dc26494f8941b', 1, '2016-04-07 16:04:10', '1234562221@qq.com', '::1', '2016-04-07 16:04:10', -1, ''),
(11, 'admin009', '7c4a8d09ca3762af61e59520943dc26494f8941b', 1, '2016-04-07 16:07:06', '1234522116@qq.com', '::1', '2016-04-07 16:07:06', -1, ''),
(12, 'admin777', '7c4a8d09ca3762af61e59520943dc26494f8941b', 1, '2016-04-07 16:07:59', '12345677@qq.com', '::1', '2016-04-07 16:07:59', -1, ''),
(13, 'admin88752', '20eabe5d64b0e216796e834f52d61fd0b70332fc', 8, '2016-04-07 16:09:30', '123456882@qq.com1212', '::1', '2016-04-07 16:09:30', 0, ''),
(14, 'admin2223', '05fe7461c607c33229772d402505601016a7d0ea', 1, '2016-04-07 16:18:04', '123456009@qq.com', '::1', '2016-04-07 16:18:04', -1, ''),
(15, 'admin2556', '7c4a8d09ca3762af61e59520943dc26494f8941b', 1, '2016-04-07 16:20:49', '123456117@qq.com', '::1', '2016-04-07 16:20:49', -1, ''),
(16, 'admin998', '7c4a8d09ca3762af61e59520943dc26494f8941b', 1, '2016-04-07 16:28:49', '123459986@qq.com', '::1', '2016-04-07 16:28:49', -1, ''),
(17, 'admin0099812', '7c4a8d09ca3762af61e59520943dc26494f8941b', 4, '2016-04-07 18:10:32', '123456zzz@qq.com', '::1', '2016-04-07 18:10:32', -1, ''),
(18, 'admin111', '1edd072aad695cf469832e2d473dca2eec0d5ef9', 1, '2016-04-08 09:57:28', '123456@qq.com', '::1', '2016-04-08 09:57:28', -1, ''),
(19, 'test_admin1', '7c4a8d09ca3762af61e59520943dc26494f8941b', 9, '2016-04-12 11:00:52', 'test_admin@qq.com', '::1', '2016-04-12 11:00:52', -1, '');

-- --------------------------------------------------------

--
-- 表的结构 `admin_access`
--

CREATE TABLE IF NOT EXISTS `admin_access` (
  `role_id` smallint(6) unsigned NOT NULL,
  `node_id` smallint(6) unsigned NOT NULL,
  `level` tinyint(1) DEFAULT NULL,
  `module` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `admin_access`
--

INSERT INTO `admin_access` (`role_id`, `node_id`, `level`, `module`) VALUES
(8, 6, NULL, NULL),
(8, 7, NULL, NULL),
(8, 10, NULL, NULL),
(8, 13, NULL, NULL),
(8, 14, NULL, NULL),
(8, 15, NULL, NULL),
(8, 16, NULL, NULL),
(8, 17, NULL, NULL),
(8, 18, NULL, NULL),
(8, 34, NULL, NULL),
(8, 35, NULL, NULL),
(8, 36, NULL, NULL),
(8, 38, NULL, NULL),
(8, 27, NULL, NULL),
(8, 28, NULL, NULL),
(8, 29, NULL, NULL),
(8, 30, NULL, NULL),
(8, 31, NULL, NULL),
(8, 37, NULL, NULL),
(8, 39, NULL, NULL),
(8, 40, NULL, NULL),
(8, 41, NULL, NULL),
(8, 42, NULL, NULL),
(8, 19, NULL, NULL),
(8, 32, NULL, NULL),
(8, 33, NULL, NULL),
(4, 6, NULL, NULL),
(4, 7, NULL, NULL),
(4, 38, NULL, NULL),
(4, 27, NULL, NULL),
(4, 28, NULL, NULL),
(4, 29, NULL, NULL),
(4, 30, NULL, NULL),
(4, 31, NULL, NULL),
(8, 6, NULL, NULL),
(8, 7, NULL, NULL),
(8, 10, NULL, NULL),
(8, 13, NULL, NULL),
(8, 14, NULL, NULL),
(8, 15, NULL, NULL),
(8, 16, NULL, NULL),
(8, 17, NULL, NULL),
(8, 18, NULL, NULL),
(8, 34, NULL, NULL),
(8, 35, NULL, NULL),
(8, 36, NULL, NULL),
(8, 38, NULL, NULL),
(8, 43, NULL, NULL),
(8, 27, NULL, NULL),
(8, 28, NULL, NULL),
(8, 29, NULL, NULL),
(8, 30, NULL, NULL),
(8, 31, NULL, NULL),
(8, 37, NULL, NULL),
(8, 39, NULL, NULL),
(8, 40, NULL, NULL),
(8, 41, NULL, NULL),
(8, 42, NULL, NULL),
(8, 19, NULL, NULL),
(8, 32, NULL, NULL),
(8, 33, NULL, NULL),
(5, 6, NULL, NULL),
(5, 27, NULL, NULL),
(5, 28, NULL, NULL),
(5, 29, NULL, NULL),
(5, 31, NULL, NULL),
(5, 39, NULL, NULL),
(5, 41, NULL, NULL),
(5, 19, NULL, NULL),
(5, 32, NULL, NULL),
(5, 33, NULL, NULL),
(5, 46, NULL, NULL),
(5, 47, NULL, NULL),
(9, 6, NULL, NULL),
(9, 7, NULL, NULL),
(9, 10, NULL, NULL),
(9, 13, NULL, NULL),
(9, 14, NULL, NULL),
(9, 15, NULL, NULL),
(9, 16, NULL, NULL),
(9, 17, NULL, NULL),
(9, 18, NULL, NULL),
(9, 34, NULL, NULL),
(9, 35, NULL, NULL),
(9, 36, NULL, NULL),
(9, 38, NULL, NULL),
(9, 43, NULL, NULL),
(9, 27, NULL, NULL),
(9, 28, NULL, NULL),
(9, 29, NULL, NULL),
(9, 30, NULL, NULL),
(9, 31, NULL, NULL),
(9, 37, NULL, NULL),
(9, 39, NULL, NULL),
(9, 40, NULL, NULL),
(9, 41, NULL, NULL),
(9, 42, NULL, NULL),
(9, 19, NULL, NULL),
(9, 32, NULL, NULL),
(9, 33, NULL, NULL),
(9, 46, NULL, NULL),
(9, 47, NULL, NULL),
(2, 68, NULL, NULL),
(2, 69, NULL, NULL),
(2, 70, NULL, NULL),
(2, 71, NULL, NULL),
(2, 72, NULL, NULL),
(2, 73, NULL, NULL),
(2, 74, NULL, NULL);

-- --------------------------------------------------------

--
-- 表的结构 `admin_log`
--

CREATE TABLE IF NOT EXISTS `admin_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `admin_id` int(11) NOT NULL,
  `ip` varchar(50) NOT NULL,
  `time` datetime NOT NULL,
  `type` varchar(20) NOT NULL COMMENT '操作类型 默认login',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='管理员操作记录' AUTO_INCREMENT=15 ;

--
-- 转存表中的数据 `admin_log`
--

INSERT INTO `admin_log` (`id`, `admin_id`, `ip`, `time`, `type`) VALUES
(2, 4, '127.0.0.1', '2016-05-04 15:48:15', 'login'),
(3, 17, '127.0.0.1', '2016-05-04 15:48:36', 'login'),
(4, 4, '127.0.0.1', '2016-05-04 15:57:09', 'login'),
(5, 1, '127.0.0.1', '2016-06-07 15:23:28', 'login'),
(6, 1, '127.0.0.1', '2016-06-07 15:23:43', 'login'),
(7, 1, '127.0.0.1', '2016-06-07 15:23:46', 'login'),
(8, 1, '127.0.0.1', '2016-06-07 16:05:17', 'login'),
(9, 1, '127.0.0.1', '2016-06-07 17:16:58', 'login'),
(10, 1, '127.0.0.1', '2016-06-07 17:30:09', 'login'),
(11, 1, '127.0.0.1', '2016-06-07 17:30:16', 'login'),
(12, 1, '127.0.0.1', '2016-06-07 17:30:39', 'login'),
(13, 1, '127.0.0.1', '2016-06-08 16:46:36', 'login'),
(14, 1, '127.0.0.1', '2016-06-08 17:21:01', 'login');

-- --------------------------------------------------------

--
-- 表的结构 `admin_node`
--

CREATE TABLE IF NOT EXISTS `admin_node` (
  `id` smallint(6) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(20) NOT NULL,
  `title` varchar(50) DEFAULT NULL,
  `status` tinyint(1) DEFAULT '0',
  `remark` varchar(255) DEFAULT NULL,
  `sort` smallint(6) unsigned DEFAULT NULL,
  `pid` smallint(6) unsigned NOT NULL,
  `level` tinyint(1) unsigned NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=160 ;

--
-- 转存表中的数据 `admin_node`
--

INSERT INTO `admin_node` (`id`, `name`, `title`, `status`, `remark`, `sort`, `pid`, `level`) VALUES
(49, 'system', '系统管理', 0, NULL, NULL, 0, 1),
(50, 'Rbac', '权限管理', 0, NULL, NULL, 49, 2),
(51, 'roleDel', '管理员分组,删除角色', 0, NULL, NULL, 50, 3),
(52, 'roleUpdate', '管理员分组,更新角色', 0, NULL, NULL, 50, 3),
(53, 'roleAdd', '管理员分组,添加角色页面', 0, NULL, NULL, 50, 3),
(54, 'roleList', '管理员分组,角色列表', 0, NULL, NULL, 50, 3),
(55, 'setStatus', '管理员分组,设置角色状态', 0, NULL, NULL, 50, 3),
(56, 'nodeAdd', '权限分配,添加节点', 0, NULL, NULL, 50, 3),
(57, 'controllerList', '权限分配,控制器列表', 0, NULL, NULL, 50, 3),
(58, 'actionList', '权限分配,方法列表', 0, NULL, NULL, 50, 3),
(59, 'actionTitle', '权限分配,方法标题', 0, NULL, NULL, 50, 3),
(60, 'accessList', '权限分配,已授权列表', 0, NULL, NULL, 50, 3),
(61, 'AccessAdd', '权限分配,授权', 0, NULL, NULL, 50, 3),
(62, 'Admin', '管理员信息', 0, NULL, NULL, 49, 2),
(63, 'adminList', '管理员列表,管理员列表', 0, NULL, NULL, 62, 3),
(64, 'adminAdd', '管理员列表,新增页面', 0, NULL, NULL, 62, 3),
(65, 'adminUpdate', '管理员列表,更新', 0, NULL, NULL, 62, 3),
(66, 'adminPwd', '管理员列表,修改密码', 0, NULL, NULL, 62, 3),
(67, 'setStatus', '管理员列表,设置状态', 0, NULL, NULL, 62, 3),
(68, 'member', '会员管理', 0, NULL, NULL, 0, 1),
(69, 'Usergroup', '用户角色分组', 0, NULL, NULL, 68, 2),
(70, 'groupList', '角色分组,分组列表', 0, NULL, NULL, 69, 3),
(71, 'groupAdd', '角色分组,新增分组', 0, NULL, NULL, 69, 3),
(72, 'groupEdit', '角色分组,编辑分组', 0, NULL, NULL, 69, 3),
(73, 'groupDel', '角色分组,删除分组', 0, NULL, NULL, 69, 3),
(74, 'setStatus', '角色分组,设置状态', 0, NULL, NULL, 69, 3),
(75, 'balance', '结算系统', 0, NULL, NULL, 0, 1),
(84, 'accManage', '账户管理', 0, NULL, NULL, 75, 2),
(85, 'userAccList', '代理账户列表,账户列表', 0, NULL, NULL, 84, 3),
(86, 'userAccInfo', '代理账户列表,账户详情', 0, NULL, NULL, 84, 3),
(87, 'Confsystem', '系统配置项', 0, NULL, NULL, 49, 2),
(88, 'creditList', '信誉配置,信誉配置列表', 0, NULL, NULL, 87, 3),
(89, 'creditOper', '信誉配置,信誉配置操作', 0, NULL, NULL, 87, 3),
(90, 'creditDel', '信誉配置,删除配置', 0, NULL, NULL, 87, 3),
(91, 'scaleOfferOper', '报盘费率设置,报盘费率设置', 0, NULL, NULL, 87, 3),
(92, 'certManage', '会员认证', 0, NULL, NULL, 68, 2),
(93, 'dealerCert', '交易商认证,交易商认证列表', 0, NULL, NULL, 92, 3),
(94, 'dealercertDetail', '交易商认证,交易商认证详情页', 0, NULL, NULL, 92, 3),
(95, 'doDealerCert', '交易商认证,交易商认证审核', 0, NULL, NULL, 92, 3),
(96, 'storecertDetail', '仓库认证,仓库认证详情', 0, NULL, NULL, 92, 3),
(97, 'storeCert', '仓库认证,仓库认证列表', 0, NULL, NULL, 92, 3),
(98, 'doStoreCert', '仓库认证,仓库认证审核', 0, NULL, NULL, 92, 3),
(99, 'member', '会员列表', 0, NULL, NULL, 68, 2),
(100, 'memberList', '会员列表,会员列表', 0, NULL, NULL, 99, 3),
(101, 'agent', '代理商管理', 0, NULL, NULL, 68, 2),
(102, 'agentList', '代理商列表,代理商列表', 0, NULL, NULL, 101, 3),
(103, 'addAgent', '添加代理商,添加代理商', 0, NULL, NULL, 101, 3),
(104, 'deleteAgent', '代理商列表,删除代理商', 0, NULL, NULL, 101, 3),
(105, 'trade', '交易管理', 0, NULL, NULL, 0, 1),
(106, 'product', '产品设置', 0, NULL, NULL, 105, 2),
(107, 'categoryList', '分类列表,分类列表', 0, NULL, NULL, 106, 3),
(108, 'categoryAdd', '分类列表,分类添加', 0, NULL, NULL, 106, 3),
(109, 'setStatusCate', '分类列表,设置状态', 0, NULL, NULL, 106, 3),
(110, 'logicDelCate', '分类列表,删除分类', 0, NULL, NULL, 106, 3),
(111, 'attributeList', '属性列表,属性列表', 0, NULL, NULL, 106, 3),
(112, 'attributeAdd', '属性列表,属性添加', 0, NULL, NULL, 106, 3),
(113, 'setStatusAttr', '属性列表,设置状态', 0, NULL, NULL, 106, 3),
(114, 'logicDelAttr', '属性列表,删除属性', 0, NULL, NULL, 106, 3),
(115, 'OfferManage', '报盘管理', 0, NULL, NULL, 105, 2),
(116, 'offerList', '报盘管理,报盘管理', 0, NULL, NULL, 115, 3),
(117, 'offerDetails', '报盘管理,报盘详情', 0, NULL, NULL, 115, 3),
(118, 'logicDel', '报盘管理,报盘删除', 0, NULL, NULL, 115, 3),
(119, 'offerReview', '报盘审核,报盘审核列表', 0, NULL, NULL, 115, 3),
(120, 'reviewDetails', '报盘审核,报盘详情', 0, NULL, NULL, 115, 3),
(121, 'setStatus', '报盘审核,报盘审核', 0, NULL, NULL, 115, 3),
(122, 'offerRecycle', '报盘垃圾箱,报盘信息垃圾箱', 0, NULL, NULL, 115, 3),
(123, 'logicRec', '报盘垃圾箱,报盘复原', 0, NULL, NULL, 115, 3),
(124, 'Pairing', '合同管理', 0, NULL, NULL, 105, 2),
(125, 'contractList', '合同列表,合同列表', 0, NULL, NULL, 124, 3),
(126, 'contractDetail', '合同列表,合同详情', 0, NULL, NULL, 124, 3),
(127, 'fundIn', '入金审核', 0, NULL, NULL, 75, 2),
(128, 'onlineList', '线上入金,线上入金列表', 0, NULL, NULL, 127, 3),
(129, 'offlineList', '线下入金,线下入金列表', 0, NULL, NULL, 127, 3),
(130, 'offlineEdit', '线下入金,入金详情', 0, NULL, NULL, 127, 3),
(131, 'offlineFirst', '线下入金,线下入金初审', 0, NULL, NULL, 127, 3),
(132, 'offlineFinal', '线下入金,线下入金终审', 0, NULL, NULL, 127, 3),
(133, '-1', '线上入金,入金删除', 0, NULL, NULL, 127, 3),
(134, 'fundOut', '出金审核', 0, NULL, NULL, 75, 2),
(135, 'fundOutList', '出金审核,出金列表', 0, NULL, NULL, 134, 3),
(136, 'fundOutEdit', '出金审核,出金审核详情', 0, NULL, NULL, 134, 3),
(137, 'firstCheck', '出金审核,出金初审', 0, NULL, NULL, 134, 3),
(138, 'finalCheck', '出金审核,出金终审', 0, NULL, NULL, 134, 3),
(139, 'transfer', '出金审核,打款操作', 0, NULL, NULL, 134, 3),
(140, 'del', '出金审核,出金删除', 0, NULL, NULL, 134, 3),
(141, 'upload', '出金审核,上传文件', 0, NULL, NULL, 134, 3),
(142, 'store', '仓库管理', 0, NULL, NULL, 0, 1),
(143, 'store', '仓库管理', 0, NULL, NULL, 142, 2),
(144, 'storeList', '仓库列表,仓库列表', 0, NULL, NULL, 143, 3),
(145, 'setStatus', '仓库列表,设置状态', 0, NULL, NULL, 143, 3),
(146, 'logicDel', '仓库列表,仓库删除', 0, NULL, NULL, 143, 3),
(147, 'storeAdd', '仓库添加,仓库添加', 0, NULL, NULL, 143, 3),
(148, 'storeProduct', '仓单管理', 0, NULL, NULL, 142, 2),
(149, 'getList', '仓单列表,仓单列表', 0, NULL, NULL, 148, 3),
(150, 'details', '仓单列表,仓单详情', 0, NULL, NULL, 148, 3),
(151, 'reviewList', '仓单审核,仓单审核列表', 0, NULL, NULL, 148, 3),
(152, 'reviewDetails', '仓单审核,仓单详情', 0, NULL, NULL, 148, 3),
(153, 'setStatus', '仓单审核,设置状态', 0, NULL, NULL, 148, 3),
(154, 'storeOrder', '出库管理', 0, NULL, NULL, 142, 2),
(155, 'checkedorderList', '已出库列表,已出库列表', 0, NULL, NULL, 154, 3),
(156, 'checkedOrderDetail', '已出库列表,出库详情', 0, NULL, NULL, 154, 3),
(157, 'checkorderList', '待审核,待审核列表', 0, NULL, NULL, 154, 3),
(158, 'storeOrderDetail', '待审核,出库详情', 0, NULL, NULL, 154, 3),
(159, 'storeOrderPass', '待审核,出库审核', 0, NULL, NULL, 154, 3);

-- --------------------------------------------------------

--
-- 表的结构 `admin_role`
--

CREATE TABLE IF NOT EXISTS `admin_role` (
  `id` smallint(6) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(20) NOT NULL,
  `pid` smallint(6) DEFAULT NULL,
  `status` tinyint(1) unsigned DEFAULT NULL,
  `remark` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=10 ;

--
-- 转存表中的数据 `admin_role`
--

INSERT INTO `admin_role` (`id`, `name`, `pid`, `status`, `remark`) VALUES
(2, '商品管理员', NULL, 0, '商品管理'),
(4, '会计', NULL, 1, '资金管理'),
(5, '测试管理员', NULL, 0, '测试'),
(8, '管理员', NULL, 1, '管理员1理员12312312312321312312312'),
(9, '运维', NULL, 0, '运维');

-- --------------------------------------------------------

--
-- 表的结构 `admin_role_user`
--

CREATE TABLE IF NOT EXISTS `admin_role_user` (
  `role_id` mediumint(9) unsigned DEFAULT NULL,
  `user_id` char(32) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `admin_session`
--

CREATE TABLE IF NOT EXISTS `admin_session` (
  `session_id` varchar(255) NOT NULL COMMENT '登录时session_id',
  `session_expire` int(11) NOT NULL COMMENT '过期时间戳',
  `session_data` text NOT NULL COMMENT 'session数据',
  UNIQUE KEY `session_id` (`session_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='后台登录session表';

--
-- 转存表中的数据 `admin_session`
--

INSERT INTO `admin_session` (`session_id`, `session_expire`, `session_data`) VALUES
('78dnng6qmfdf07u9i7rb1n7qe4', 1465379495, 'nn_dde10c11f5e72ab98f182471a0ffc2f4|b:0;nn_admin|a:3:{s:2:"id";s:1:"1";s:4:"name";s:5:"admin";s:4:"role";s:15:"超级管理员";}');

-- --------------------------------------------------------

--
-- 表的结构 `agent`
--

CREATE TABLE IF NOT EXISTS `agent` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `username` varchar(40) NOT NULL COMMENT '代理商用户名',
  `mobile` varchar(13) NOT NULL COMMENT '代理商手机号',
  `email` varchar(50) NOT NULL COMMENT '邮箱',
  `company_name` varchar(40) NOT NULL COMMENT '公司名称',
  `area` varchar(6) NOT NULL COMMENT '地区',
  `contact` varchar(30) NOT NULL COMMENT '联系人',
  `contact_phone` varchar(13) NOT NULL COMMENT '联系电话',
  `address` varchar(100) NOT NULL COMMENT '详细地址',
  `serial_no` varchar(50) NOT NULL COMMENT '代理商序列号，用于用户注册',
  `status` tinyint(1) NOT NULL COMMENT '状态，0：关闭，1：启用',
  `create_time` datetime NOT NULL COMMENT '加入时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='代理商表' AUTO_INCREMENT=4 ;

--
-- 转存表中的数据 `agent`
--

INSERT INTO `agent` (`id`, `username`, `mobile`, `email`, `company_name`, `area`, `contact`, `contact_phone`, `address`, `serial_no`, `status`, `create_time`) VALUES
(2, 'test1', '18810194461', 'zengmaoyong@126.com', 'ceshi', '150303', '71112', '14444444', 'ttttttttt', '', 1, '2016-05-10 00:00:00'),
(3, 'wer', '14232323232', 'weiping.lee@163.com', 'sdfsdfsdf', '110102', '213', '14343434347', 'sdfsdfsdf', '', 0, '2016-05-20 16:47:26');

-- --------------------------------------------------------

--
-- 表的结构 `answer`
--

CREATE TABLE IF NOT EXISTS `answer` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `content` text,
  `status` int(11) DEFAULT NULL COMMENT '是否被采纳',
  `question_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `bid_list`
--

CREATE TABLE IF NOT EXISTS `bid_list` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL COMMENT '投标人id',
  `bid_id` int(11) DEFAULT NULL COMMENT '招标id',
  `cert_verify` int(11) DEFAULT NULL COMMENT '资质审核状态',
  `document_buy` int(11) DEFAULT NULL COMMENT '是否已买标书',
  `has_bid` int(11) DEFAULT NULL COMMENT '是否投标',
  `status` int(11) DEFAULT NULL COMMENT '是否审核通过',
  `sign_time` varchar(45) DEFAULT NULL COMMENT '报名时间',
  `call_bid_id` int(11) NOT NULL,
  PRIMARY KEY (`id`,`call_bid_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `bid_package`
--

CREATE TABLE IF NOT EXISTS `bid_package` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `p_no` int(11) DEFAULT NULL COMMENT '包件号码',
  `name` varchar(100) DEFAULT NULL COMMENT '货品名称',
  `brand` varchar(45) DEFAULT NULL COMMENT '品牌',
  `spec` varchar(100) DEFAULT NULL COMMENT '型号规格',
  `tech_need` varchar(100) DEFAULT NULL COMMENT '技术要求',
  `unit` varchar(10) DEFAULT NULL COMMENT '计量单位',
  `num` decimal(10,6) DEFAULT NULL COMMENT '数量',
  `deliver_date` int(11) DEFAULT NULL COMMENT '交付日期',
  `call_bid_id` int(11) NOT NULL,
  PRIMARY KEY (`id`,`call_bid_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `bid_package_price`
--

CREATE TABLE IF NOT EXISTS `bid_package_price` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `bid_package_id` int(11) DEFAULT NULL COMMENT '包件id',
  `name` varchar(45) DEFAULT NULL,
  `price` decimal(15,2) DEFAULT NULL COMMENT '单价',
  `other_fee` decimal(15,2) DEFAULT NULL,
  `deliver_days` int(11) DEFAULT NULL COMMENT '交货天数',
  `bid_id` int(11) DEFAULT NULL COMMENT '投标id',
  `bid_package_id1` int(11) NOT NULL,
  `bid_package_call_bid_id` int(11) NOT NULL,
  PRIMARY KEY (`id`,`bid_package_id1`,`bid_package_call_bid_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `call_bid`
--

CREATE TABLE IF NOT EXISTS `call_bid` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `project_name` varchar(200) DEFAULT NULL COMMENT '项目名称',
  `province` varchar(6) DEFAULT NULL COMMENT '省份',
  `city` varchar(6) DEFAULT NULL,
  `area` varchar(6) DEFAULT NULL,
  `bid_time` date DEFAULT NULL COMMENT '投标时间',
  `open_time` date DEFAULT NULL COMMENT '开标时间',
  `cond` text COMMENT '投标条件',
  `project_intro` text COMMENT '项目概况',
  `bid_content` text COMMENT '招标内容',
  `status` int(11) DEFAULT NULL COMMENT '状态',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `company_info`
--

CREATE TABLE IF NOT EXISTS `company_info` (
  `user_id` int(10) DEFAULT NULL,
  `area` varchar(6) DEFAULT NULL,
  `address` varchar(100) DEFAULT NULL COMMENT '详细地址',
  `company_name` varchar(100) DEFAULT NULL COMMENT '公司名称',
  `legal_person` varchar(20) NOT NULL COMMENT '法人',
  `reg_fund` decimal(9,2) NOT NULL COMMENT '注册资金',
  `category` int(4) NOT NULL COMMENT '企业分类',
  `nature` int(2) NOT NULL COMMENT '企业性质',
  `business` varchar(100) NOT NULL COMMENT '主营品种',
  `contact` varchar(20) DEFAULT NULL COMMENT '联系人',
  `contact_phone` varchar(15) NOT NULL COMMENT '联系人电话',
  `contact_duty` int(3) NOT NULL COMMENT '联系人职务',
  `check_taker` varchar(20) DEFAULT NULL COMMENT '收票人',
  `check_taker_phone` varchar(15) DEFAULT NULL COMMENT '收票人电话',
  `check_taker_add` varchar(100) DEFAULT NULL COMMENT '收票地址',
  `deposit_bank` varchar(50) DEFAULT NULL COMMENT '开户银行',
  `bank_acc` varchar(20) DEFAULT NULL COMMENT '银行账号',
  `tax_no` varchar(20) DEFAULT NULL COMMENT '税号',
  `cert_oc` varchar(100) DEFAULT NULL COMMENT '组织机构代码证',
  `cert_bl` varchar(100) DEFAULT NULL COMMENT '营业执照',
  `cert_tax` varchar(100) DEFAULT NULL COMMENT '税务登记证',
  `qq` varchar(15) DEFAULT NULL,
  UNIQUE KEY `user_id` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `company_info`
--

INSERT INTO `company_info` (`user_id`, `area`, `address`, `company_name`, `legal_person`, `reg_fund`, `category`, `nature`, `business`, `contact`, `contact_phone`, `contact_duty`, `check_taker`, `check_taker_phone`, `check_taker_add`, `deposit_bank`, `bank_acc`, `tax_no`, `cert_oc`, `cert_bl`, `cert_tax`, `qq`) VALUES
(8, '1202', NULL, '123324', 'SDFSDF', '44.00', 0, 0, '', '234234', '145343434', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(15, '210303', NULL, '23423', '的方法', '123.00', 0, 0, '', '多大的', '1423343434', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(25, '130102', NULL, '耐耐', '玩儿', '23.00', 0, 0, '', '快快快', '234234', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(26, '130102', NULL, '耐耐', '玩儿', '23.00', 0, 0, '', '快快快', '234234', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(27, '130102', NULL, '耐耐', '玩儿', '23.00', 0, 0, '', '快快快', '234234', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(28, '130102', NULL, '耐耐', '玩儿', '23.00', 0, 0, '', '快快快', '234234', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(29, '130102', NULL, '耐耐', '玩儿', '23.00', 0, 0, '', '快快快', '234234', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(30, '130102', NULL, '耐耐', '玩儿', '23.00', 0, 0, '', '快快快', '234234', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(31, '130102', NULL, '耐耐', '玩儿', '23.00', 0, 0, '', '快快快', '234234', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(34, '140311', NULL, '白泉耐火', '赵总', '100.00', 1, 2, '', '张', '14323232323', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(35, '140303', 'sdfsdf', 'weqwe', '张小j', '100.00', 1, 1, '', '王', '123123123', 1, '张张', '13534343434', '水电费水电费水电费', '了看见了看见', '112342342234234234', '1234234234234', 'filefromuser/2016/03/11/20160311071634276.jpg@user@user@user@user@user@user@user@user@user@user@user', 'filefromuser/2016/03/11/20160311071631414.jpg@user@user@user@user@user@user@user@user@user@user@user', 'filefromuser/2016/03/11/20160311071637894.jpg@user@user@user@user@user@user@user@user@user@user@user', ''),
(36, '130102', 'sdfsdf', '一二十', '赵看', '200.00', 1, 1, '水电费', '果果', '15288888888', 1, 'asdasd', '13123123123', '13123', '123123123', '123123123123', '123123123', 'upload/2016/05/03/20160503153032859.jpg@user', 'upload/2016/05/03/20160503153028151.jpg@user', 'upload/2016/05/03/20160503153030911.jpg@user', '123123'),
(51, '220102', NULL, '的多大的的', '水电费', '111.00', 10, 1, '', '水电费', '15234343434', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(52, '130102', '而微软sdfsdfds', '的多大的的', '丰东股份', '100.00', 2, 1, 'dffddffd', '威尔而', '14523232323', 1, NULL, NULL, NULL, NULL, NULL, NULL, 'upload/2016/06/01/20160601143108291.jpg@user', 'upload/2016/06/01/20160601143104761.jpg@user', 'upload/2016/06/01/20160601143106748.jpg@user', NULL),
(53, '130202', NULL, 'sdfdf', '快快快', '100.00', 3, 1, '', '的方法', '15323232323', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(54, '140203', NULL, 'sdfdf', '快快快', '100.00', 3, 1, '', '的方法', '15323232323', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(55, '130203', NULL, '的多大的的', '水电费', '111.00', 3, 1, '', '对方答复', '15323232323', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(56, '130202', 'sdfsdf', '的多大的的', '水电费', '100.00', 2, 1, 'sdfsdf', '李卫平', '14523232323', 1, NULL, NULL, NULL, NULL, NULL, NULL, 'upload/2016/06/01/20160601150929808.jpg@user', 'upload/2016/06/01/20160601150924222.jpg@user', 'upload/2016/06/01/20160601150926825.jpg@user', NULL),
(57, '140411', 'sdfffdf', '多大的', '水电费', '100.00', 2, 2, '对方答复', '水电费', '14334343434', 1, NULL, NULL, NULL, NULL, NULL, NULL, 'upload/2016/06/02/20160602145201431.jpg@user', 'upload/2016/06/02/20160602145158664.jpg@user', 'upload/2016/06/02/20160602145200121.jpg@user', NULL),
(59, '220203', '白泉', '白泉耐火', '李卫平', '10.00', 2, 1, '耐火材料', '李卫平', '15296631253', 1, NULL, NULL, NULL, NULL, NULL, NULL, 'upload/2016/06/03/20160603102703867.jpg@user', 'upload/2016/06/03/20160603102700591.jpg@user', 'upload/2016/06/03/20160603102702673.jpg@user', NULL),
(60, '220303', '看见看见姐姐姐姐', '仓库', '赵伟胜', '100.00', 2, 1, 'sdf', '赵赵', '15296631253', 1, NULL, NULL, NULL, NULL, NULL, NULL, 'upload/2016/06/06/20160606091601316.jpg@user', 'upload/2016/06/06/20160606091557985.jpg@user', 'upload/2016/06/06/20160606091559865.jpg@user', NULL);

-- --------------------------------------------------------

--
-- 表的结构 `company_rec`
--

CREATE TABLE IF NOT EXISTS `company_rec` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `user_id` int(11) NOT NULL DEFAULT '0' COMMENT '用户id',
  `type` tinyint(2) NOT NULL DEFAULT '1' COMMENT '推荐类型:1,第一推荐.2:第二推荐\r\n.3:第三推荐',
  `start_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '推荐开始时间\r\n',
  `end_time` datetime DEFAULT NULL COMMENT '推荐结束时间',
  `status` tinyint(2) NOT NULL DEFAULT '1' COMMENT '状态:0:关闭,1:正常',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `configs_credit`
--

CREATE TABLE IF NOT EXISTS `configs_credit` (
  `name` varchar(40) NOT NULL COMMENT '参数名',
  `name_zh` varchar(30) NOT NULL COMMENT '中文名称',
  `type` int(2) NOT NULL COMMENT '参数类型,0:数值，1：百分比',
  `sign` int(2) NOT NULL DEFAULT '0' COMMENT '0,增加，1：减少',
  `value` decimal(8,5) NOT NULL COMMENT '参数值',
  `time` datetime NOT NULL COMMENT '创建时间',
  `sort` int(4) NOT NULL,
  `note` varchar(255) NOT NULL COMMENT '解释',
  PRIMARY KEY (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `configs_credit`
--

INSERT INTO `configs_credit` (`name`, `name_zh`, `type`, `sign`, `value`, `time`, `sort`, `note`) VALUES
('cancel_contract', '取消合同', 1, 1, '0.00000', '2016-04-19 00:00:00', 5, '取消合同扣减合同金额的百分比'),
('cancel_offer', '取消报盘', 1, 1, '0.00000', '2016-04-19 00:00:00', 4, ''),
('cert_dealer', '认证交易商', 0, 0, '0.00000', '2016-04-19 00:00:00', 0, ''),
('cert_ship', '认证物流', 0, 0, '0.00000', '2016-04-19 00:00:00', 5, ''),
('cert_store', '认证仓库管理员', 0, 0, '0.00000', '2016-04-19 00:00:00', 3, '认证成功加信誉'),
('contract', '完成合同', 1, 0, '0.00000', '2016-04-19 00:00:00', 0, ''),
('credit_money', '信誉保证金', 1, 0, '0.00000', '2016-04-19 00:00:00', 0, '信誉保证金数额的百分比'),
('pay', '支付', 1, 0, '0.00000', '2016-04-19 00:00:00', 0, '支付金额的百分比'),
('product', '', 0, 0, '0.00000', '2016-04-19 00:00:00', 0, ''),
('register', '', 0, 0, '0.00000', '2016-04-19 00:00:00', 0, '');

-- --------------------------------------------------------

--
-- 表的结构 `credit_log`
--

CREATE TABLE IF NOT EXISTS `credit_log` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL COMMENT '用户id',
  `datetime` datetime NOT NULL COMMENT '发生时间',
  `value` varchar(15) NOT NULL COMMENT '积分变化，增加正数，减少负数',
  `intro` text NOT NULL COMMENT '积分变化说明',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=7 ;

--
-- 转存表中的数据 `credit_log`
--

INSERT INTO `credit_log` (`id`, `user_id`, `datetime`, `value`, `intro`) VALUES
(1, 48, '2016-05-17 16:01:04', '-1.50000', '0'),
(2, 48, '2016-05-17 16:01:32', '-1.50000', '他看见对方考虑'),
(3, 48, '2016-05-17 16:11:12', '-1.50000', '他看见对方考虑'),
(4, 48, '2016-05-17 16:11:22', '-1.50000', '他看见对方考虑'),
(5, 48, '2016-05-17 16:22:29', '-1.50000', '他看见对方考虑'),
(6, 48, '2016-05-17 17:07:15', '-1.50000', '他看见对方考虑');

-- --------------------------------------------------------

--
-- 表的结构 `dealer`
--

CREATE TABLE IF NOT EXISTS `dealer` (
  `user_id` int(11) NOT NULL,
  `status` int(11) DEFAULT NULL,
  `apply_time` datetime DEFAULT NULL,
  `verify_time` datetime DEFAULT NULL,
  `admin_id` int(11) DEFAULT NULL,
  `message` text NOT NULL COMMENT '驳回原因',
  UNIQUE KEY `user_id` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `dealer`
--

INSERT INTO `dealer` (`user_id`, `status`, `apply_time`, `verify_time`, `admin_id`, `message`) VALUES
(36, 2, '2016-06-02 14:47:28', '2016-06-02 14:48:15', NULL, ''),
(42, 2, '2016-04-13 15:20:48', '2016-05-12 12:32:15', NULL, ''),
(48, 2, '2016-05-17 12:44:54', '2016-05-18 09:36:18', NULL, ''),
(52, 2, '2016-06-01 14:31:10', '2016-06-01 14:32:27', NULL, ''),
(56, 2, '2016-06-01 15:09:30', '2016-06-01 15:09:44', NULL, ''),
(57, 2, '2016-06-02 14:52:03', '2016-06-02 14:52:14', NULL, ''),
(58, 2, '2016-06-02 17:45:44', '2016-06-02 17:46:05', NULL, ''),
(59, 2, '2016-06-03 10:27:05', '2016-06-03 10:28:17', NULL, ''),
(60, 2, '2016-06-06 09:16:02', '2016-06-06 09:16:40', NULL, '');

-- --------------------------------------------------------

--
-- 表的结构 `editor`
--

CREATE TABLE IF NOT EXISTS `editor` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `status` int(11) DEFAULT NULL,
  `apply_time` datetime DEFAULT NULL,
  `verify_time` datetime DEFAULT NULL,
  `admin_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `entrust_order`
--

CREATE TABLE IF NOT EXISTS `entrust_order` (
  `id` int(11) NOT NULL,
  `offer_id` int(11) unsigned NOT NULL COMMENT '报盘id',
  `order_no` varchar(50) NOT NULL,
  `num` decimal(15,2) NOT NULL COMMENT '购买数量',
  `amount` decimal(10,2) unsigned NOT NULL COMMENT '订单总额',
  `user_id` int(11) unsigned NOT NULL,
  `pay_deposit` decimal(10,2) unsigned DEFAULT NULL COMMENT '买方定金',
  `pay_retainage` decimal(10,2) DEFAULT NULL,
  `payment` int(11) DEFAULT NULL COMMENT '1:余额支付',
  `contract_status` int(11) NOT NULL DEFAULT '0' COMMENT '合同状态 0:未形成3:等待支付尾款4:生效5:完成',
  `proof` varchar(100) DEFAULT NULL COMMENT '支付凭证',
  `create_time` datetime NOT NULL COMMENT '创建时间'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='委托摘牌';

-- --------------------------------------------------------

--
-- 表的结构 `expert`
--

CREATE TABLE IF NOT EXISTS `expert` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `status` int(11) DEFAULT NULL COMMENT '开通状态',
  `domain` varchar(100) DEFAULT NULL COMMENT '删除的领域，问题分类以，相隔',
  `answer_times` int(11) DEFAULT NULL COMMENT '回答次数',
  `accept_times` int(11) DEFAULT NULL COMMENT '被采纳次数',
  `apply_time` datetime DEFAULT NULL,
  `verify_time` datetime DEFAULT NULL,
  `admin_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `free_order`
--

CREATE TABLE IF NOT EXISTS `free_order` (
  `id` int(11) NOT NULL,
  `offer_id` int(11) unsigned NOT NULL COMMENT '报盘id',
  `order_no` varchar(50) NOT NULL,
  `num` decimal(15,2) NOT NULL COMMENT '购买数量',
  `amount` decimal(10,2) unsigned NOT NULL COMMENT '订单总额',
  `user_id` int(11) unsigned NOT NULL,
  `pay_deposit` decimal(10,2) unsigned DEFAULT NULL COMMENT '买方定金',
  `pay_retainage` decimal(10,2) DEFAULT NULL,
  `payment` int(11) DEFAULT NULL COMMENT '1:余额支付',
  `contract_status` int(11) NOT NULL DEFAULT '0' COMMENT '合同状态 0:未形成3:等待支付尾款4:生效5:完成',
  `proof` varchar(100) DEFAULT NULL COMMENT '支付凭证',
  `create_time` datetime NOT NULL COMMENT '创建时间'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='仓单摘牌';

-- --------------------------------------------------------

--
-- 表的结构 `log_operation`
--

CREATE TABLE IF NOT EXISTS `log_operation` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `author` varchar(80) NOT NULL COMMENT '管理员',
  `action` varchar(200) NOT NULL COMMENT '动作',
  `content` text NOT NULL COMMENT '详情',
  `datetime` datetime NOT NULL COMMENT '时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=43 ;

--
-- 转存表中的数据 `log_operation`
--

INSERT INTO `log_operation` (`id`, `author`, `action`, `content`, `datetime`) VALUES
(1, 'admin', '处理了一个申请认证', '用户id:42', '2016-03-27 17:00:58'),
(2, 'admin', '处理了一个申请认证', '用户id:42', '2016-03-27 17:01:19'),
(3, 'admin', '处理了一个申请认证', '用户id:42', '2016-03-27 17:05:55'),
(4, 'admin', '处理了一个申请认证', '用户id:42', '2016-03-27 17:06:10'),
(5, 'admin', '处理了一个申请认证', '用户id:36', '2016-05-04 10:31:00'),
(6, 'admin', '处理了一个申请认证', '用户id:36', '2016-05-04 10:34:45'),
(7, 'admin', '处理了一个申请认证', '用户id:36', '2016-05-04 14:26:45'),
(8, 'admin', '处理了一个申请认证', '用户id:36', '2016-05-10 11:27:32'),
(9, 'admin', '处理了一个申请认证', '用户id:36', '2016-05-10 11:32:20'),
(10, 'admin', '处理了一个申请认证', '用户id:36', '2016-05-10 12:38:34'),
(11, 'admin', '处理了一个申请认证', '用户id:42', '2016-05-12 12:32:15'),
(12, 'admin', '处理了一个申请认证', '用户id:36', '2016-05-13 16:28:10'),
(13, 'admin', '处理了一个申请认证', '用户id:36', '2016-05-13 16:31:31'),
(14, 'admin', '处理了一个申请认证', '用户id:36', '2016-05-13 16:38:58'),
(15, 'admin', '处理了一个申请认证', '用户id:36', '2016-05-13 16:39:35'),
(16, 'admin', '处理了一个申请认证', '用户id:36', '2016-05-13 16:39:36'),
(17, 'admin', '处理了一个申请认证', '用户id:36', '2016-05-13 16:43:45'),
(18, 'admin', '处理了一个申请认证', '用户id:36', '2016-05-13 16:44:55'),
(19, 'admin', '处理了一个申请认证', '用户id:36', '2016-05-13 16:47:09'),
(20, 'admin', '处理了一个申请认证', '用户id:36', '2016-05-13 16:47:40'),
(21, 'admin', '处理了一个申请认证', '用户id:48', '2016-05-17 12:35:27'),
(22, 'admin', '处理了一个申请认证', '用户id:48', '2016-05-18 09:36:18'),
(23, 'admin', '处理了一个申请认证', '用户id:36', '2016-05-19 15:35:30'),
(24, 'admin', '处理了一个申请认证', '用户id:36', '2016-05-19 15:35:49'),
(25, 'admin', '处理了一个申请认证', '用户id:36', '2016-05-19 15:37:03'),
(26, 'admin', '处理了一个申请认证', '用户id:36', '2016-05-19 15:50:14'),
(27, 'admin', '处理了一个申请认证', '用户id:36', '2016-05-19 15:57:46'),
(28, 'admin', '处理了一个申请认证', '用户id:36', '2016-05-19 15:58:23'),
(29, 'admin', '处理了一个申请认证', '用户id:36', '2016-05-20 17:24:22'),
(30, 'admin', '处理了一个申请认证', '用户id:52', '2016-06-01 14:32:27'),
(31, 'admin', '处理了一个申请认证', '用户id:52', '2016-06-01 14:35:33'),
(32, 'admin', '处理了一个申请认证', '用户id:36', '2016-06-01 14:36:24'),
(33, 'admin', '处理了一个申请认证', '用户id:56', '2016-06-01 15:09:44'),
(34, 'admin', '处理了一个申请认证', '用户id:36', '2016-06-02 14:48:16'),
(35, 'admin', '处理了一个申请认证', '用户id:57', '2016-06-02 14:52:14'),
(36, 'admin', '处理了一个申请认证', '用户id:58', '2016-06-02 17:46:05'),
(37, 'admin', '处理了一个申请认证', '用户id:59', '2016-06-03 10:28:17'),
(38, 'admin', '处理了一个申请认证', '用户id:60', '2016-06-03 10:42:35'),
(39, 'admin', '处理了一个申请认证', '用户id:60', '2016-06-03 10:44:11'),
(40, 'admin', '处理了一个申请认证', '用户id:60', '2016-06-06 09:16:40'),
(41, 'admin', '处理了一个申请认证', '用户id:36', '2016-06-06 17:30:55'),
(42, 'admin', '处理了一个申请认证', '用户id:36', '2016-06-06 17:31:20');

-- --------------------------------------------------------

--
-- 表的结构 `menu`
--

CREATE TABLE IF NOT EXISTS `menu` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `menu_zn` varchar(255) NOT NULL,
  `menu_cert` varchar(20) NOT NULL COMMENT '需要的认证角色，公共菜单留空',
  `menu_url` varchar(255) DEFAULT NULL COMMENT '菜单表',
  `pid` int(11) NOT NULL,
  `create_time` datetime NOT NULL,
  `sort` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=52 ;

--
-- 转存表中的数据 `menu`
--

INSERT INTO `menu` (`id`, `menu_zn`, `menu_cert`, `menu_url`, `pid`, `create_time`, `sort`) VALUES
(3, '账户信息', '0', '/ucenter/baseinfo', 0, '2016-05-27 15:30:38', 2),
(4, '交易管理', 'deal', '/managerdeal/storeProductList', 0, '2016-05-27 15:30:50', 4),
(5, '资金管理', 'deal', '/fund/index', 0, '2016-05-27 15:31:02', 3),
(8, '申请仓单', '', 'http://market.nainaiwang.com/#sortId=2395&amp;amp;nsortId=2423', 7, '2016-05-27 15:38:52', 5),
(9, '仓单列表', '', 'http://market.nainaiwang.com/#sortId=2395&amp;amp;nsortId=2423\\"', 7, '2016-05-27 15:39:04', 2),
(10, '账户管理', '0', '', 3, '2016-05-27 15:48:41', 0),
(11, '基本信息', '', '/ucenter/baseinfo', 10, '2016-05-27 15:48:55', 0),
(12, '修改密码', '', '/ucenter/password', 10, '2016-05-27 15:49:08', 11),
(16, '关注中心', '', '', 0, '2016-05-27 17:18:25', 6),
(17, '首页', '0', '/ucenterindex/index', 0, '2016-05-27 17:32:08', 1),
(20, '仓单管理', '', '/managerdeal/storeproductlist', 4, '2016-05-31 16:09:07', 0),
(21, '仓库管理', 'store', '/ManagerStore/applystorelist', 0, '2016-06-02 13:48:24', 5),
(22, '资质认证', '', '', 3, '2016-06-06 14:59:29', 2),
(23, '交易商', '', '/ucenter/dealcert', 22, '2016-06-06 15:00:14', 1),
(24, '仓库管理员', '', '/ucenter/storecert', 22, '2016-06-06 15:00:52', 2),
(25, '子账户管理', '', '/ucenter/subacc', 3, '2016-06-06 15:03:21', 3),
(26, '添加子账户', '', '/ucenter/subacc', 25, '2016-06-06 15:04:33', 0),
(27, '开票信息管理', '', '/ucenter/invoice', 3, '2016-06-06 15:05:06', 6),
(28, '开户信息管理', '', '/fund/bank', 5, '2016-06-06 15:10:37', 1),
(29, '资金账户管理', '', '', 5, '2016-06-06 15:11:09', 2),
(30, '市场代理账户', '', '/fund/index', 29, '2016-06-06 15:11:41', 1),
(31, '票据账户', '', '', 29, '2016-06-06 15:11:59', 2),
(32, '销售管理', '', '', 4, '2016-06-06 15:13:18', 1),
(33, '销售列表', '', '/managerdeal/productlist', 32, '2016-06-06 15:14:09', 1),
(34, '发布产品', '', '/managerdeal/indexoffer', 32, '2016-06-06 15:15:20', 2),
(35, '申请仓单', '', '/managerdeal/storeproduct', 20, '2016-06-06 15:16:54', 1),
(36, '仓单列表', '', '/managerdeal/storeproductlist', 20, '2016-06-06 15:17:23', 2),
(37, '采购管理', '', '', 4, '2016-06-06 15:17:50', 3),
(38, '采购列表', '', '', 37, '2016-06-06 15:18:09', 1),
(39, '采购添加', '', '', 37, '2016-06-06 15:18:23', 2),
(40, '合同管理', '', '', 4, '2016-06-06 15:19:16', 4),
(41, '销售合同', '', '/contract/sellerlist', 40, '2016-06-06 15:19:57', 1),
(42, '购买合同', '', '/contract/buyerlist', 40, '2016-06-06 15:20:35', 2),
(43, '提单管理', '', '', 4, '2016-06-06 15:21:06', 6),
(44, '购买提单', '', '/delivery/deliverylist?is_seller=0', 43, '2016-06-06 15:22:09', 1),
(45, '销售提单', '', '/delivery/deliverylist?is_seller=1', 43, '2016-06-06 15:22:44', 2),
(46, '仓单管理', '', '/managerstore/applystorelist/type/2', 21, '2016-06-06 15:23:56', 1),
(47, '仓单审核', '', '/managerstore/applystorelist/type/1', 21, '2016-06-06 15:24:33', 2),
(48, '仓单出库审核', '', '/managerstore/storechecklist', 21, '2016-06-06 15:25:02', 3),
(49, '申诉管理', '', '', 4, '2016-06-06 17:38:37', 8),
(50, '申诉添加', '', '/contract/complainContract', 49, '2016-06-06 17:38:59', 1),
(51, '申诉列表', '', '/contract/complainList', 49, '2016-06-06 17:39:34', 2);

-- --------------------------------------------------------

--
-- 表的结构 `menu_role`
--

CREATE TABLE IF NOT EXISTS `menu_role` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '组ID',
  `cert` varchar(20) NOT NULL COMMENT '英文名称',
  `name` varchar(50) NOT NULL COMMENT '组名称',
  `purview` text NOT NULL COMMENT '可以使用的权限',
  `explanation` varchar(255) DEFAULT NULL COMMENT '用户组描述',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='用户组' AUTO_INCREMENT=6 ;

--
-- 转存表中的数据 `menu_role`
--

INSERT INTO `menu_role` (`id`, `cert`, `name`, `purview`, `explanation`) VALUES
(3, 'deal', '交易商', 'a:24:{i:0;i:5;i:1;i:28;i:2;i:29;i:3;i:30;i:4;i:31;i:5;i:4;i:6;i:20;i:7;i:35;i:8;i:36;i:9;i:32;i:10;i:33;i:11;i:34;i:12;i:37;i:13;i:38;i:14;i:39;i:15;i:40;i:16;i:41;i:17;i:42;i:18;i:43;i:19;i:44;i:20;i:45;i:21;i:49;i:22;i:50;i:23;i:51;}', ''),
(4, 'store', '仓库管理', 'a:4:{i:0;i:21;i:1;i:46;i:2;i:47;i:3;i:48;}', ''),
(5, 'public', '公共', 'a:12:{i:0;i:17;i:1;i:3;i:2;i:10;i:3;i:11;i:4;i:12;i:5;i:22;i:6;i:23;i:7;i:24;i:8;i:25;i:9;i:26;i:10;i:27;i:11;i:16;}', '');

-- --------------------------------------------------------

--
-- 表的结构 `message`
--

CREATE TABLE IF NOT EXISTS `message` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL COMMENT '用户id',
  `title` varchar(255) NOT NULL DEFAULT '' COMMENT '消息标题',
  `content` text NOT NULL COMMENT '消息内容',
  `send_time` datetime DEFAULT NULL COMMENT '发送时间',
  `write_time` datetime DEFAULT NULL COMMENT '阅读时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=4 ;

--
-- 转存表中的数据 `message`
--

INSERT INTO `message` (`id`, `user_id`, `title`, `content`, `send_time`, `write_time`) VALUES
(1, 56, '保证金支付', '您的订单7需支付保证金', '2016-06-02 15:28:36', NULL),
(2, 36, '保证金支付', '您的订单8需支付保证金', '2016-06-02 15:35:50', NULL),
(3, 59, '保证金支付', '您的订单13需支付保证金', '2016-06-03 10:50:26', NULL);

-- --------------------------------------------------------

--
-- 表的结构 `model`
--

CREATE TABLE IF NOT EXISTS `model` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(20) DEFAULT NULL COMMENT '模型名称',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `model_attr`
--

CREATE TABLE IF NOT EXISTS `model_attr` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(45) DEFAULT NULL COMMENT '属性名',
  `value` text COMMENT '属性值，多个以,分割',
  `model_id` int(11) NOT NULL,
  PRIMARY KEY (`id`,`model_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `order`
--

CREATE TABLE IF NOT EXISTS `order` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `order_no` varchar(30) DEFAULT NULL,
  `num` decimal(15,2) DEFAULT NULL COMMENT '产品数量',
  `price` decimal(15,2) DEFAULT NULL,
  `order_amount` decimal(15,2) DEFAULT NULL COMMENT '订单总金额',
  `create_time` datetime DEFAULT NULL,
  `complate_time` datetime DEFAULT NULL,
  `status` int(11) DEFAULT NULL COMMENT '订单状态',
  `products_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `order_complain`
--

CREATE TABLE IF NOT EXISTS `order_complain` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(11) unsigned NOT NULL COMMENT '用户id',
  `type` tinytext NOT NULL COMMENT '1：买方申诉，2：卖方申诉',
  `order_id` int(11) unsigned NOT NULL COMMENT '订单id',
  `title` varchar(200) NOT NULL COMMENT '申诉标题',
  `detail` text NOT NULL COMMENT '申诉内容',
  `proof` varchar(255) NOT NULL COMMENT '凭证图片',
  `status` tinyint(2) unsigned NOT NULL COMMENT '状态，申请，不处理，介入，介入后协商通过，处理完成（买家违约），处理完成（卖家违约）',
  `apply_time` datetime DEFAULT NULL COMMENT '申诉发起时间',
  `check_admin` int(11) NOT NULL COMMENT '审核管理员',
  `check_time` datetime DEFAULT NULL COMMENT '审核时间',
  `check_msg` text NOT NULL COMMENT '审核意见',
  `handle_admin` varchar(255) NOT NULL COMMENT '处理管理员',
  `handle_time` datetime DEFAULT NULL COMMENT '处理时间',
  `handle_msg` varchar(255) NOT NULL COMMENT '处理意见',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='申述' AUTO_INCREMENT=33 ;

--
-- 转存表中的数据 `order_complain`
--

INSERT INTO `order_complain` (`id`, `user_id`, `type`, `order_id`, `title`, `detail`, `proof`, `status`, `apply_time`, `check_admin`, `check_time`, `check_msg`, `handle_admin`, `handle_time`, `handle_msg`) VALUES
(1, 48, '1', 1, 'ssssssssssssssss', 'cccccccccc', 'a:1:{i:0;s:39:"upload/2016/05/20/20160520144531995.jpg";}', 2, '2016-05-20 14:45:33', 1, '2016-05-23 15:56:27', 'aaaaaaaaaaaaaaaaaaaaaaaaaaaaa', '', NULL, ''),
(2, 48, '1', 1, 'cccccccc', 'ssssssssssss', 'a:1:{i:0;s:39:"upload/2016/05/20/20160520144550173.jpg";}', 4, '2016-05-20 14:45:51', 1, '2016-05-23 15:56:48', 'zzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzz', '1', '2016-05-23 16:00:37', 'ccccccccccccccccccccccccccccccc'),
(7, 28, '2', 1, 'bbbbbbbbbbbbbb', 'nnnnnnnnn', 'a:2:{i:0;s:39:"upload/2016/05/20/20160520145013248.jpg";i:1;s:39:"upload/2016/05/20/20160520145013834.jpg";}', 5, '2016-05-20 14:50:15', 1, '2016-05-23 16:10:45', 'bbbbbbbbbbbbbbbbbbbbbbbbbbbbb', '1', '2016-05-23 16:10:51', 'vvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvv'),
(8, 48, '2', 1, 'vasdas', 'jjjjjjjjjjjjjjjjjjjjjjjjjj', 'a:1:{i:0;s:39:"upload/2016/05/23/20160523161135686.jpg";}', 4, '2016-05-23 16:11:36', 1, '2016-05-23 17:05:02', 'cccccccccccccccccccccccc', '1', '2016-05-23 17:05:10', 'vvvvvvvvvvvvvvvvvvv'),
(16, 48, '2', 1, 'ccccccccccc', 'ssssssssss', 'a:1:{i:0;s:39:"upload/2016/05/24/20160524104125583.jpg";}', 1, '2016-05-24 10:41:29', 0, NULL, '', '', NULL, ''),
(17, 48, '2', 1, 'ssssssssssssssssss', '111111111111111', 's:0:"";', 1, '2016-05-24 10:42:59', 0, NULL, '', '', NULL, ''),
(18, 48, '2', 1, 'gggggggggggggggggg', 'ssssssssssssssssss', 'a:2:{i:0;s:39:"upload/2016/05/24/20160524105326808.jpg";i:1;s:39:"upload/2016/05/24/20160524105326570.jpg";}', 1, '2016-05-24 10:53:28', 0, NULL, '', '', NULL, ''),
(19, 48, '2', 1, 'afdas', 'asdfasdf', 's:0:"";', 1, '2016-05-25 13:26:43', 0, NULL, '', '', NULL, ''),
(20, 48, '2', 1, 'adfasd', 'sdafdsaf', 's:0:"";', 1, '2016-05-25 13:28:41', 0, NULL, '', '', NULL, ''),
(21, 48, '2', 1, 'vvvvvvvvvvv', 'ssssssssssssssssssssssss', 's:0:"";', 1, '2016-05-25 14:17:58', 0, NULL, '', '', NULL, ''),
(22, 48, '2', 1, 'ccccccccccccccc', 'ssssssssssss', 's:0:"";', 1, '2016-05-25 16:14:31', 0, NULL, '', '', NULL, ''),
(23, 48, '2', 1, 'ccccccccccccccc', 'ssssssssssss', 's:0:"";', 1, '2016-05-25 16:14:48', 0, NULL, '', '', NULL, ''),
(24, 48, '2', 1, 'cccccccccccccccccccc', 'sssssssssssssssssssssss', 's:0:"";', 1, '2016-05-25 16:17:51', 0, NULL, '', '', NULL, ''),
(25, 48, '2', 1, 'ccc', 'sssss', 's:0:"";', 1, '2016-05-26 11:25:36', 0, NULL, '', '', NULL, ''),
(26, 48, '2', 1, 'cccccc', 'sssssssss', 's:0:"";', 1, '2016-05-26 14:51:40', 0, NULL, '', '', NULL, ''),
(27, 48, '2', 1, 'cccccccccccccccccc', 'sssssssssssssssss', 's:0:"";', 1, '2016-05-26 15:11:15', 0, NULL, '', '', NULL, ''),
(28, 48, '2', 1, 'ssssss', 'aaaaaaaaaaaa', 's:0:"";', 1, '2016-05-26 15:18:10', 0, NULL, '', '', NULL, ''),
(29, 48, '2', 1, 'ssssss', 'aaaaaaaaaaaa', 's:0:"";', 1, '2016-05-26 15:18:26', 0, NULL, '', '', NULL, ''),
(30, 48, '2', 1, 'ssssssssssssssssss', 'aaaaaaaaaaaaaaaaaaaaa', 's:0:"";', 1, '2016-05-26 15:18:43', 0, NULL, '', '', NULL, ''),
(31, 48, '2', 1, 'sssssssss', 'aaaaaaaaaaaaa', 's:0:"";', 1, '2016-05-26 15:20:42', 0, NULL, '', '', NULL, ''),
(32, 48, '2', 1, 'gggggggggggggggg', 'sssssssssssssssssssssssssssssssssssssssss', 's:0:"";', 1, '2016-05-26 15:31:48', 0, NULL, '', '', NULL, '');

-- --------------------------------------------------------

--
-- 表的结构 `order_pairing`
--

CREATE TABLE IF NOT EXISTS `order_pairing` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `admin_id` int(11) NOT NULL,
  `order_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `order_id` (`order_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=4 ;

--
-- 转存表中的数据 `order_pairing`
--

INSERT INTO `order_pairing` (`id`, `admin_id`, `order_id`) VALUES
(3, 1, 1);

-- --------------------------------------------------------

--
-- 表的结构 `order_sell`
--

CREATE TABLE IF NOT EXISTS `order_sell` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `offer_id` int(11) unsigned NOT NULL COMMENT '报盘id',
  `mode` int(2) NOT NULL COMMENT '报盘模式',
  `order_no` varchar(50) NOT NULL,
  `num` decimal(15,2) NOT NULL COMMENT '购买数量',
  `amount` decimal(10,2) unsigned NOT NULL COMMENT '订单总额',
  `user_id` int(11) unsigned NOT NULL,
  `pay_deposit` decimal(10,2) unsigned DEFAULT NULL COMMENT '买方定金',
  `pay_retainage` decimal(10,2) DEFAULT NULL,
  `payment` int(11) DEFAULT NULL COMMENT '1:余额支付',
  `contract_status` int(11) NOT NULL DEFAULT '0' COMMENT '合同状态 0:未形成1:等待卖家保证金2：合同作废3:等待支付尾款4:生效5:完成',
  `seller_deposit` decimal(10,2) DEFAULT NULL COMMENT '卖方支付保证金金额',
  `proof` varchar(100) DEFAULT NULL COMMENT '支付凭证',
  `reduce_amount` decimal(15,5) DEFAULT NULL COMMENT '买方扣减货款数',
  `reduce_remark` varchar(200) NOT NULL COMMENT '扣减货款说明',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='保证金摘牌' AUTO_INCREMENT=19 ;

--
-- 转存表中的数据 `order_sell`
--

INSERT INTO `order_sell` (`id`, `offer_id`, `mode`, `order_no`, `num`, `amount`, `user_id`, `pay_deposit`, `pay_retainage`, `payment`, `contract_status`, `seller_deposit`, `proof`, `reduce_amount`, `reduce_remark`, `create_time`) VALUES
(1, 5, 0, '{0A4F6E0C-E443-408C-8089-5183734ABC07}', '10.00', '1230.00', 32, '12.30', '1217.70', NULL, 4, '1.00', NULL, NULL, '', '2016-04-29 09:52:20'),
(2, 8, 0, '{9BD946AD-398E-4CBF-A2A9-0DED189652A9}', '100.00', '1200.00', 36, '360.00', NULL, NULL, 3, NULL, NULL, NULL, '', '2016-05-11 13:28:15'),
(3, 8, 4, '{3855878B-567B-4E16-BD47-811F6095087C}', '100.00', '1200.00', 36, '360.00', NULL, NULL, 3, NULL, NULL, NULL, '', '2016-05-11 13:36:10'),
(4, 9, 2, '{E0427250-F1FA-4E18-AEE1-571A3AE36C55}', '23.00', '529.00', 36, NULL, NULL, NULL, 0, NULL, NULL, NULL, '', '2016-05-16 09:22:49'),
(5, 9, 2, '{0AADF874-3CDD-4343-95EE-6B82E39AB769}', '23.00', '529.00', 36, '105.80', NULL, NULL, 1, NULL, NULL, NULL, '', '2016-05-16 09:25:09'),
(6, 22, 1, '{CAEF00D9-E04C-4157-94F2-C2AA26095B27}', '190.00', '22800.00', 57, NULL, NULL, NULL, 8, NULL, 'upload/2016/06/02/20160602151105287.jpg', NULL, '', '2016-06-02 15:08:31'),
(7, 19, 2, '{23685A03-C84C-45CD-A593-112B2120CECD}', '12.00', '1200.00', 57, '24.00', NULL, NULL, 1, NULL, NULL, NULL, '', '2016-06-02 15:28:36'),
(8, 24, 2, '{597701FC-5503-4CCD-9C64-2D622AE4DEA4}', '15.00', '150.00', 57, '3.00', '147.00', NULL, 8, '14.94', NULL, '100.00000', '567567', '2016-06-02 15:35:50'),
(9, 22, 1, '{AA391062-44E4-4105-BEAC-73DF85DE7725}', '190.00', '22800.00', 57, NULL, NULL, NULL, 3, NULL, NULL, NULL, '', '2016-06-02 15:41:29'),
(10, 23, 4, '{D530DD0E-25FB-4ACB-9FEA-EA25F594F126}', '10.00', '1900.00', 57, '38.00', '1862.00', NULL, 4, NULL, NULL, NULL, '', '2016-06-03 08:21:32'),
(11, 25, 1, '{FA15E2DC-A880-46E8-A981-DB7EF92818EE}', '15.00', '150.00', 57, NULL, NULL, NULL, 8, NULL, 'upload/2016/06/03/20160603091221758.jpg', NULL, '', '2016-06-03 08:35:55'),
(12, 20, 3, '{2E6B09D5-6FF0-45E6-BA93-D589958F24F4}', '100.00', '19000.00', 57, NULL, NULL, NULL, 3, NULL, 'upload/2016/06/03/20160603091741787.jpg', NULL, '', '2016-06-03 09:16:31'),
(13, 28, 2, '{A15451F8-B02C-4975-B116-4FD1D935D109}', '10.00', '1000.00', 57, '20.00', '980.00', NULL, 8, '39.84', NULL, NULL, '', '2016-06-03 10:50:26'),
(14, 29, 1, '{68916A74-6237-48C5-BC32-2E25E2B6E54A}', '10.00', '100.00', 57, NULL, NULL, NULL, 8, NULL, 'upload/2016/06/03/20160603110213945.jpg', NULL, '', '2016-06-03 11:01:37'),
(15, 30, 3, '{9B83A60D-06B8-4517-B841-17BAAC2ED8B3}', '10.00', '1000.00', 57, NULL, NULL, NULL, 8, NULL, 'upload/2016/06/03/20160603110408714.jpg', NULL, '', '2016-06-03 11:03:49'),
(16, 31, 4, '{694B7BCA-B312-46C2-806B-C0C3D5915E34}', '10.00', '1000.00', 57, '20.00', '980.00', NULL, 4, NULL, NULL, NULL, '', '2016-06-03 11:06:04'),
(17, 29, 1, '{E45F7601-CEB1-4783-B06C-A9655A0AD36D}', '11.00', '110.00', 36, NULL, NULL, NULL, 3, NULL, 'upload/2016/06/06/20160606085928277.jpg', NULL, '', '2016-06-06 08:58:48'),
(18, 32, 4, '{D7CB7291-E7A4-4516-8D30-8AC6E1D582CA}', '100.00', '2000.00', 36, '40.00', '1960.00', NULL, 4, NULL, NULL, NULL, '', '2016-06-06 09:31:45');

-- --------------------------------------------------------

--
-- 表的结构 `payment`
--

CREATE TABLE IF NOT EXISTS `payment` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL COMMENT '支付名称',
  `class_name` varchar(50) NOT NULL COMMENT '支付类名称',
  `description` text COMMENT '描述',
  `logo` varchar(255) NOT NULL COMMENT '支付方式logo图片路径',
  `status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '安装状态 0启用 1禁用',
  `order` smallint(5) NOT NULL DEFAULT '99' COMMENT '排序',
  `note` text COMMENT '支付说明',
  `poundage` decimal(15,2) NOT NULL DEFAULT '0.00' COMMENT '手续费',
  `poundage_type` tinyint(1) NOT NULL DEFAULT '1' COMMENT '手续费方式 1百分比 2固定值',
  `config_param` text COMMENT '配置参数,json数据对象',
  `client_type` tinyint(1) NOT NULL DEFAULT '1' COMMENT '1:PC端 2:移动端 3:通用',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='支付方式表' AUTO_INCREMENT=4 ;

--
-- 转存表中的数据 `payment`
--

INSERT INTO `payment` (`id`, `name`, `class_name`, `description`, `logo`, `status`, `order`, `note`, `poundage`, `poundage_type`, `config_param`, `client_type`) VALUES
(2, '支付宝即时到帐', 'directAlipay', '即时到帐支付方式，买家的交易资金直接打入卖家支付宝账户，快速回笼交易资金。 <a href="http://www.alipay.com/" target="_blank">立即申请</a>', '/payments/logos/pay_alipay.gif', 1, 99, '', '0.00', 1, '{"M_PartnerId":"","M_PartnerKey":"","M_Email":""}', 1),
(3, '银联支付', 'unionpay', '银联unionpay平台接口。<a href="https://open.unionpay.com/ajweb/index" target="_blank">立即申请</a>', '/payments/logos/pay_unionpay.png', 0, 99, '', '0.00', 1, '{"M_merId":"777290058119131","M_certPwd":"000000"}', 1);

-- --------------------------------------------------------

--
-- 表的结构 `pay_log`
--

CREATE TABLE IF NOT EXISTS `pay_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `pay_type` varchar(30) NOT NULL,
  `order_id` int(11) unsigned NOT NULL COMMENT '对应订单表id',
  `user_type` tinyint(4) NOT NULL COMMENT '0:买家1：卖家',
  `user_id` int(11) unsigned NOT NULL,
  `remark` varchar(50) NOT NULL COMMENT '备注',
  `create_time` datetime NOT NULL COMMENT '时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='支付纪录' AUTO_INCREMENT=53 ;

--
-- 转存表中的数据 `pay_log`
--

INSERT INTO `pay_log` (`id`, `pay_type`, `order_id`, `user_type`, `user_id`, `remark`, `create_time`) VALUES
(1, 'store_order', 5, 0, 36, '买方下单', '2016-05-11 11:27:47'),
(2, 'store_order', 5, 0, 36, '定金', '2016-05-11 11:27:48'),
(3, 'order_sell', 0, 0, 36, '买方下单', '2016-05-11 13:26:07'),
(4, 'order_sell', 2, 0, 36, '买方下单', '2016-05-11 13:28:15'),
(5, 'order_sell', 2, 0, 36, '定金', '2016-05-11 13:28:15'),
(6, 'order_sell', 3, 0, 36, '买方下单', '2016-05-11 13:36:10'),
(7, 'order_sell', 3, 0, 36, '定金', '2016-05-11 13:36:10'),
(8, 'order_sell', 4, 0, 36, '买方下单', '2016-05-16 09:22:49'),
(9, 'order_sell', 5, 0, 36, '买方下单', '2016-05-16 09:25:09'),
(10, 'order_sell', 5, 0, 36, '定金', '2016-05-16 09:25:09'),
(11, 'order_sell', 6, 0, 57, '买方下单', '2016-06-02 15:08:31'),
(12, 'order_sell', 6, 0, 57, '买家上传线下支付凭证', '2016-06-02 15:11:08'),
(13, 'order_sell', 7, 0, 57, '买方下单', '2016-06-02 15:28:36'),
(14, 'order_sell', 7, 0, 57, '定金', '2016-06-02 15:28:36'),
(15, 'order_sell', 8, 0, 57, '买方下单', '2016-06-02 15:35:50'),
(16, 'order_sell', 8, 0, 57, '定金', '2016-06-02 15:35:50'),
(17, 'order_sell', 8, 1, 36, '卖方支付保证金', '2016-06-02 15:36:47'),
(18, 'order_sell', 8, 0, 57, '买家线上支付尾款', '2016-06-02 15:37:29'),
(19, 'order_sell', 9, 0, 57, '买方下单', '2016-06-02 15:41:29'),
(20, 'order_sell', 8, 0, 57, '买家确认提货质量（扣减款项：100)', '2016-06-02 16:10:12'),
(21, 'order_sell', 8, 0, 57, '卖家确认提货质量（扣减款项：100)', '2016-06-02 16:10:42'),
(22, 'order_sell', 8, 0, 57, '买家确认合同,合同结束(返还扣减项:100)', '2016-06-02 16:11:12'),
(23, 'order_sell', 10, 0, 57, '买方下单', '2016-06-03 08:21:32'),
(24, 'order_sell', 10, 0, 57, '定金', '2016-06-03 08:21:32'),
(25, 'order_sell', 10, 0, 57, '买家线上支付尾款', '2016-06-03 08:23:24'),
(26, 'order_sell', 11, 0, 57, '买方下单', '2016-06-03 08:35:55'),
(27, 'order_sell', 11, 0, 57, '买家上传线下支付凭证', '2016-06-03 09:12:22'),
(28, 'order_sell', 11, 1, 36, '卖家确认线下支付凭证', '2016-06-03 09:13:57'),
(29, 'order_sell', 12, 0, 57, '买方下单', '2016-06-03 09:16:31'),
(30, 'order_sell', 12, 0, 57, '买家上传线下支付凭证', '2016-06-03 09:17:42'),
(31, 'order_sell', 6, 1, 36, '卖家确认线下支付凭证', '2016-06-03 10:00:47'),
(32, 'order_sell', 13, 0, 57, '买方下单', '2016-06-03 10:50:26'),
(33, 'order_sell', 13, 0, 57, '定金', '2016-06-03 10:50:26'),
(34, 'order_sell', 13, 1, 59, '卖方支付保证金', '2016-06-03 10:51:52'),
(35, 'order_sell', 13, 0, 57, '买家线上支付尾款', '2016-06-03 10:52:47'),
(36, 'order_sell', 13, 0, 57, '买家确认提货质量', '2016-06-03 10:57:40'),
(37, 'order_sell', 13, 0, 57, '卖家确认提货质量', '2016-06-03 10:58:43'),
(38, 'order_sell', 13, 0, 57, '买家确认合同,合同结束', '2016-06-03 11:00:10'),
(39, 'order_sell', 14, 0, 57, '买方下单', '2016-06-03 11:01:37'),
(40, 'order_sell', 14, 0, 57, '买家上传线下支付凭证', '2016-06-03 11:02:14'),
(41, 'order_sell', 14, 1, 59, '卖家确认线下支付凭证', '2016-06-03 11:02:58'),
(42, 'order_sell', 15, 0, 57, '买方下单', '2016-06-03 11:03:49'),
(43, 'order_sell', 15, 0, 57, '买家上传线下支付凭证', '2016-06-03 11:04:12'),
(44, 'order_sell', 15, 1, 59, '卖家确认线下支付凭证', '2016-06-03 11:04:53'),
(45, 'order_sell', 16, 0, 57, '买方下单', '2016-06-03 11:06:04'),
(46, 'order_sell', 16, 0, 57, '定金', '2016-06-03 11:06:04'),
(47, 'order_sell', 16, 0, 57, '买家线上支付尾款', '2016-06-03 11:06:57'),
(48, 'order_sell', 17, 0, 36, '买方下单', '2016-06-06 08:58:48'),
(49, 'order_sell', 17, 0, 36, '买家上传线下支付凭证', '2016-06-06 08:59:29'),
(50, 'order_sell', 18, 0, 36, '买方下单', '2016-06-06 09:31:45'),
(51, 'order_sell', 18, 0, 36, '定金', '2016-06-06 09:31:45'),
(52, 'order_sell', 18, 0, 36, '买家线上支付尾款', '2016-06-06 09:33:57');

-- --------------------------------------------------------

--
-- 表的结构 `person_info`
--

CREATE TABLE IF NOT EXISTS `person_info` (
  `user_id` int(11) NOT NULL,
  `true_name` varchar(45) DEFAULT NULL,
  `area` varchar(6) NOT NULL COMMENT '地区',
  `address` varchar(200) NOT NULL COMMENT '地址',
  `sex` int(11) DEFAULT NULL,
  `identify_no` varchar(20) DEFAULT NULL COMMENT '身份证号码',
  `identify_front` varchar(100) DEFAULT NULL COMMENT '身份证正面照',
  `identify_back` varchar(100) DEFAULT NULL COMMENT '身份证背面',
  `birth` date DEFAULT NULL,
  `education` int(11) DEFAULT NULL COMMENT '学历，不同数字代表不同学历',
  `qq` varchar(20) DEFAULT NULL,
  `zhichen` varchar(30) NOT NULL,
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `person_info`
--

INSERT INTO `person_info` (`user_id`, `true_name`, `area`, `address`, `sex`, `identify_no`, `identify_front`, `identify_back`, `birth`, `education`, `qq`, `zhichen`) VALUES
(33, '张', '', '', 0, '12323425445345345345', 'filefromuser/2016/03/11/20160311021721228.jpg@user', 'filefromuser/2016/03/11/20160311021724227.jpg@user', '2012-03-06', 0, '123123123', ''),
(37, 'sdfdf', '', '', 0, '123123123123123123', 'filefromuser/2016/03/12/20160312184419736.png@user', 'filefromuser/2016/03/12/20160312184422991.png@user', '2015-09-29', 0, '', ''),
(38, NULL, '', '', NULL, NULL, NULL, NULL, '0000-00-00', NULL, NULL, ''),
(39, NULL, '', '', NULL, NULL, NULL, NULL, '0000-00-00', NULL, NULL, ''),
(40, NULL, '', '', NULL, NULL, NULL, NULL, '0000-00-00', NULL, NULL, ''),
(41, NULL, '', '', NULL, NULL, NULL, NULL, '0000-00-00', NULL, NULL, ''),
(42, 'qwe', '', '', 0, '1232354345345', 'filefromuser/2016/03/25/20160325085343348.jpg@user', 'filefromuser/2016/03/25/20160325085352495.jpg@user', '0000-00-00', 0, '123234234', '地方'),
(48, '李卫平', '130103', 'dsfsdf', NULL, '12334234234', 'upload/2016/05/17/20160517123434685.jpg@user', 'upload/2016/05/17/20160517123436391.jpg@user', NULL, NULL, NULL, ''),
(49, NULL, '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, ''),
(50, NULL, '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, ''),
(58, '李卫平', '150203', '收到了快放假了深刻的减肥', NULL, '140311198301272118', 'upload/2016/06/02/20160602174538115.jpg@user', 'upload/2016/06/02/20160602174540427.jpg@user', NULL, NULL, NULL, '');

-- --------------------------------------------------------

--
-- 表的结构 `products`
--

CREATE TABLE IF NOT EXISTS `products` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL COMMENT '所属用户id',
  `name` varchar(45) DEFAULT NULL,
  `cate_id` int(11) NOT NULL COMMENT '商品分类',
  `attribute` text NOT NULL COMMENT '商品属性',
  `unit` varchar(20) NOT NULL DEFAULT '吨' COMMENT '单位',
  `price` decimal(15,2) NOT NULL COMMENT '单价',
  `produce_area` varchar(6) NOT NULL COMMENT '产地',
  `currency` int(2) NOT NULL DEFAULT '1' COMMENT '币种1：人民币',
  `quantity` decimal(15,5) NOT NULL COMMENT '总数量',
  `freeze` decimal(15,5) NOT NULL COMMENT '已冻结',
  `sell` decimal(15,5) NOT NULL COMMENT '已销售',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `expire_time` datetime DEFAULT NULL,
  `sort` int(11) NOT NULL COMMENT '排序',
  `note` varchar(255) NOT NULL COMMENT '备注',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=45 ;

--
-- 转存表中的数据 `products`
--

INSERT INTO `products` (`id`, `user_id`, `name`, `cate_id`, `attribute`, `unit`, `price`, `produce_area`, `currency`, `quantity`, `freeze`, `sell`, `create_time`, `expire_time`, `sort`, `note`) VALUES
(1, 0, '水电费', 0, 's:0:"";', '吨', '123.00', '371423', 1, '22.00000', '0.00000', '0.00000', '2016-04-19 17:22:39', NULL, 0, '时代发生地方'),
(2, 0, 'tietie', 9, 'a:2:{i:3;s:2:"23";i:2;s:2:"90";}', '吨', '12.00', '350103', 1, '123.00000', '0.00000', '0.00000', '2016-04-19 17:29:29', NULL, 0, '3werwer'),
(3, 0, '1qw', 9, 'a:3:{i:4;s:1:"2";i:3;s:1:"3";i:2;s:1:"4";}', '吨', '23.00', '371311', 1, '123.00000', '0.00000', '0.00000', '2016-04-21 12:05:54', NULL, 0, '232323'),
(4, 0, '铝材', 9, 'a:3:{i:4;s:2:"23";i:3;s:2:"90";i:2;s:2:"24";}', '吨', '89.90', '422802', 1, '1222.00000', '0.00000', '0.00000', '2016-04-21 12:08:29', NULL, 0, '32是对方答复的方式'),
(7, 0, '高铝砖', 8, 'a:2:{i:2;s:2:"90";i:3;s:2:"12";}', '吨', '39.00', '350626', 1, '128.00000', '0.00000', '0.00000', '2016-04-21 12:19:26', NULL, 0, '2稍等'),
(8, 0, '高铝砖', 8, 'a:2:{i:2;s:2:"90";i:3;s:2:"12";}', '吨', '39.00', '350626', 1, '128.00000', '0.00000', '0.00000', '2016-04-21 12:24:36', NULL, 0, '2稍等'),
(9, 0, '高铝砖', 8, 'a:2:{i:2;s:2:"90";i:3;s:2:"12";}', '吨', '39.00', '350626', 1, '128.00000', '0.00000', '0.00000', '2016-04-21 12:24:56', NULL, 0, '2稍等'),
(10, 36, 'dsf', 8, 'a:2:{i:2;s:4:"2314";i:3;s:3:"234";}', '吨', '123.00', '130102', 1, '12.00000', '0.00000', '0.00000', '2016-04-26 15:12:40', NULL, 0, '213'),
(11, 48, '不锈钢', 8, 'a:2:{i:3;s:2:"12";i:2;s:3:"90%";}', '吨', '80.00', '130202', 1, '100.00000', '0.00000', '0.00000', '2016-04-28 09:13:53', NULL, 0, ''),
(12, 48, 'sdfs', 8, 'a:2:{i:2;s:3:"123";i:3;s:3:"123";}', '吨', '123.00', '130403', 1, '1234.00000', '0.00000', '0.00000', '2016-04-28 09:40:24', NULL, 0, 'werwer'),
(13, 48, 'wer', 6, 's:0:"";', '吨', '23.00', '130103', 1, '122.00000', '0.00000', '0.00000', '2016-04-28 16:51:29', NULL, 0, 'erewr'),
(14, 48, 'qwer', 8, 'a:2:{i:3;s:2:"13";i:2;s:2:"23";}', '吨', '123.00', '1202', 1, '12.00000', '0.00000', '0.00000', '2016-04-28 18:18:53', NULL, 0, '123'),
(15, 36, '好钢', 9, 'a:3:{i:4;s:2:"21";i:3;s:2:"23";i:2;s:3:"98%";}', '吨', '1909.00', '330203', 1, '1200.00000', '0.00000', '0.00000', '2016-04-29 09:27:25', NULL, 0, '123'),
(16, 36, '一级钢', 9, 'a:3:{i:4;s:1:"2";i:3;s:2:"12";i:2;s:6:"99.92%";}', '吨', '1206.00', '370103', 1, '1223.00000', '0.00000', '0.00000', '2016-04-29 09:32:07', NULL, 0, '第三方士大夫'),
(17, 36, '一级耐火材料', 2, 'a:2:{i:4;s:2:"12";i:3;s:2:"88";}', '吨', '900.00', '130102', 1, '1200.00000', '300.00000', '0.00000', '2016-04-29 09:33:59', NULL, 0, '发斯蒂芬'),
(18, 36, '金箍棒', 8, 'a:2:{i:2;s:2:"20";i:3;s:4:"99cm";}', '吨', '10000.00', '130102', 1, '1999.00000', '0.00000', '0.00000', '2016-05-09 15:03:06', NULL, 0, 'kjkkj'),
(19, 36, '12312', 8, 'a:2:{i:2;s:2:"23";i:3;s:2:"23";}', '吨', '23.00', '110228', 1, '23.00000', '23.00000', '0.00000', '2016-05-13 17:24:58', NULL, 0, ''),
(20, 36, '等等等等', 9, 'a:3:{i:4;s:2:"23";i:3;s:3:"121";i:2;s:2:"23";}', '吨', '12.00', '210202', 1, '12.00000', '0.00000', '0.00000', '2016-05-20 17:26:45', NULL, 0, ''),
(21, 36, '等等等等', 9, 'a:3:{i:4;s:2:"23";i:3;s:3:"121";i:2;s:2:"23";}', '吨', '12.00', '210202', 1, '12.00000', '0.00000', '0.00000', '2016-05-20 17:26:51', NULL, 0, ''),
(22, 36, '等等等等', 9, 'a:3:{i:4;s:2:"23";i:3;s:3:"121";i:2;s:2:"23";}', '吨', '12.00', '210202', 1, '12.00000', '0.00000', '0.00000', '2016-05-20 17:26:52', NULL, 0, ''),
(23, 36, '等等等等', 9, 'a:3:{i:4;s:2:"23";i:3;s:3:"121";i:2;s:2:"23";}', '吨', '12.00', '210202', 1, '12.00000', '0.00000', '0.00000', '2016-05-20 17:26:53', NULL, 0, ''),
(24, 36, '等等等等', 9, 'a:3:{i:4;s:2:"23";i:3;s:3:"121";i:2;s:2:"23";}', '吨', '12.00', '210202', 1, '12.00000', '0.00000', '0.00000', '2016-05-20 17:31:45', NULL, 0, ''),
(25, 36, '哥哥哥哥', 8, 'a:2:{i:2;s:3:"345";i:3;s:3:"345";}', '吨', '12.00', '110102', 1, '12.00000', '0.00000', '0.00000', '2016-05-20 17:49:17', NULL, 0, ''),
(26, 36, '玩儿', 8, 'a:2:{i:3;s:2:"89";i:2;s:2:"89";}', '吨', '10.00', '130203', 1, '10.00000', '0.00000', '0.00000', '2016-05-20 17:50:46', NULL, 0, ''),
(27, 36, 'df', 8, 'a:2:{i:2;s:2:"23";i:3;s:2:"23";}', '吨', '12.00', '140303', 1, '10.00000', '0.00000', '0.00000', '2016-05-20 17:54:41', NULL, 0, ''),
(28, 36, '地方大幅度发', 8, 'a:2:{i:2;s:2:"34";i:3;s:1:"3";}', '吨', '2.00', '140203', 1, '100.00000', '0.00000', '0.00000', '2016-05-20 18:09:47', NULL, 0, ''),
(29, 56, '很好的刚', 8, 'a:2:{i:3;s:2:"13";i:2;s:3:"90%";}', '吨', '100.00', '140105', 1, '12.00000', '12.00000', '0.00000', '2016-06-01 15:40:40', NULL, 0, '地方'),
(30, 56, '很好的刚', 8, 'a:2:{i:2;s:2:"12";i:3;s:2:"12";}', '吨', '190.00', '130203', 1, '100.00000', '0.00000', '0.00000', '2016-06-01 16:04:36', NULL, 0, ''),
(31, 36, '很好很哈的东西', 11, 'a:4:{i:5;s:4:"0.4%";i:4;s:4:"20cm";i:3;s:4:"90cm";i:1;s:6:"89.45%";}', '吨', '120.00', '140202', 1, '100.00000', '0.00000', '0.00000', '2016-06-01 17:22:04', NULL, 0, ''),
(32, 36, '哥的东西', 8, 'a:2:{i:2;s:2:"12";i:3;s:3:"121";}', '吨', '120.00', '150203', 1, '190.00000', '0.00000', '0.00000', '2016-06-01 17:23:26', NULL, 0, ''),
(33, 36, '仓单产品', 8, 'a:2:{i:2;s:3:"90%";i:3;s:3:"121";}', '吨', '190.00', '150202', 1, '100.00000', '10.00000', '0.00000', '2016-06-01 17:30:43', NULL, 0, ''),
(34, 36, '保证金测试1', 8, 'a:2:{i:2;s:2:"90";i:3;s:2:"12";}', '吨', '10.00', '130103', 1, '15.00000', '15.00000', '0.00000', '2016-06-02 15:35:00', NULL, 0, ''),
(35, 36, '仓单1', 8, 'a:2:{i:3;s:2:"12";i:2;s:3:"123";}', '吨', '10.00', '130203', 1, '120.00000', '0.00000', '0.00000', '2016-06-02 16:24:21', NULL, 0, ''),
(36, 36, '1233', 9, 'a:3:{i:4;s:3:"123";i:3;s:3:"123";i:2;s:3:"123";}', 'gd', '12.00', '130203', 1, '123.00000', '0.00000', '0.00000', '2016-06-02 16:29:46', NULL, 0, '23'),
(37, 36, '啥地方都是', 8, 'a:2:{i:3;s:2:"12";i:2;s:2:"12";}', '500g', '10.00', '130204', 1, '15.00000', '0.00000', '0.00000', '2016-06-02 16:31:33', NULL, 0, ''),
(38, 36, '哈哈哈哈哈', 11, 'a:4:{i:5;s:3:"123";i:4;s:3:"123";i:3;s:3:"123";i:1;s:3:"90%";}', 'kg', '12.00', '360102', 1, '12.00000', '0.00000', '0.00000', '2016-06-02 18:32:33', NULL, 0, ''),
(39, 36, '测试123', 11, 'a:4:{i:5;s:2:"12";i:4;s:1:"1";i:3;s:1:"2";i:1;s:3:"70%";}', 'kg', '12.00', '230102', 1, '12.00000', '0.00000', '0.00000', '2016-06-02 18:34:17', NULL, 0, ''),
(40, 59, '保证金报盘2', 8, 'a:2:{i:3;s:2:"12";i:2;s:2:"90";}', '500g', '100.00', '230229', 1, '10.00000', '10.00000', '0.00000', '2016-06-03 10:32:17', NULL, 0, ''),
(41, 59, '自由报盘1', 9, 'a:3:{i:4;s:3:"200";i:3;s:3:"100";i:2;s:2:"90";}', 'gd', '10.00', '211303', 1, '100.00000', '0.00000', '0.00000', '2016-06-03 10:34:16', NULL, 0, ''),
(42, 59, '委托报盘1', 8, 'a:2:{i:2;s:2:"20";i:3;s:2:"20";}', '500g', '100.00', '320202', 1, '10.00000', '0.00000', '0.00000', '2016-06-03 10:36:16', NULL, 0, ''),
(43, 59, '仓单商品3', 8, 'a:2:{i:2;s:2:"90";i:3;s:2:"12";}', '500g', '100.00', '350205', 1, '10.00000', '10.00000', '0.00000', '2016-06-03 10:37:45', NULL, 0, ''),
(44, 60, '仓单产品2', 8, 'a:2:{i:2;s:2:"12";i:3;s:2:"11";}', '500g', '10.00', '330205', 1, '100.00000', '100.00000', '0.00000', '2016-06-06 09:20:38', NULL, 0, '');

-- --------------------------------------------------------

--
-- 表的结构 `product_attribute`
--

CREATE TABLE IF NOT EXISTS `product_attribute` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(45) NOT NULL COMMENT '属性名称',
  `value` text NOT NULL COMMENT '可选的值，可以为空，多个以，相隔',
  `status` int(2) NOT NULL,
  `type` int(2) NOT NULL DEFAULT '1' COMMENT '类型：1：输入框，2：单选，3：多选',
  `sort` int(11) NOT NULL COMMENT '排序',
  `note` varchar(255) NOT NULL COMMENT '备注',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=11 ;

--
-- 转存表中的数据 `product_attribute`
--

INSERT INTO `product_attribute` (`id`, `name`, `value`, `status`, `type`, `sort`, `note`) VALUES
(1, 'Al含量', '80%,90%,70%', 1, 2, 2, ''),
(2, 'Fe含量', '', 1, 1, 2, ''),
(3, '长度', '', 1, 1, 4, ''),
(4, '宽度', '', 1, 1, 4, ''),
(5, 's含量', '', 1, 1, 6, ''),
(6, '第三方', '', 1, 1, 2, ''),
(7, '第三方', '', 1, 1, 2, ''),
(8, '第三方', '', 1, 1, 2, ''),
(9, 'lll', '3,5,4', 1, 2, 4, ''),
(10, '第三方的', '', 1, 1, 2, '');

-- --------------------------------------------------------

--
-- 表的结构 `product_category`
--

CREATE TABLE IF NOT EXISTS `product_category` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(45) DEFAULT NULL,
  `childname` varchar(20) NOT NULL COMMENT '下级分类统称',
  `unit` varchar(20) NOT NULL COMMENT '商品计量单位，向下继承',
  `percent` int(4) NOT NULL COMMENT '预付款比率，0到100之间',
  `pid` int(11) DEFAULT '0' COMMENT '父类id',
  `attrs` text NOT NULL COMMENT '关联的属性，多个已，相隔',
  `sort` int(11) DEFAULT NULL,
  `status` int(2) NOT NULL DEFAULT '1' COMMENT '0：关闭，1：开启',
  `note` varchar(255) NOT NULL COMMENT '备注',
  `is_del` int(2) NOT NULL COMMENT '0:正常，1：删除',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=17 ;

--
-- 转存表中的数据 `product_category`
--

INSERT INTO `product_category` (`id`, `name`, `childname`, `unit`, `percent`, `pid`, `attrs`, `sort`, `status`, `note`, `is_del`) VALUES
(1, '钢材', '种类', '顿', 20, 0, '2,3', 1, 1, '', 1),
(2, '耐材', '种类', '吨', 30, 0, '3,4', 1, 1, '', 0),
(3, '建材', '种类', '吨', 20, 0, '', 1, 1, '', 0),
(4, '热卷', '种类', 'kg', 20, 3, '', 1, 1, '', 0),
(5, '普卷', '种类', '', 0, 4, '', 1, 1, '', 0),
(6, '薄卷', '种类', '', 0, 4, '', 1, 1, '', 0),
(7, 'dsfd', '', '', 0, 1, '', 2, 1, '', 0),
(8, 'ddd', 'ddff', '500g', 2, 7, '', 4, 1, '', 0),
(9, '普卷', '种类', 'gd', 1, 7, '2,4', 1, 1, '', 0),
(10, '干干dd', '商品分类', 'g', 12, 0, '3', 3, 1, '', 0),
(11, '嘎嘎嘎', '商品分类', 'kg', 25, 2, '1,4,5', 4, 1, '', 0),
(12, 'sdf', '商品分类', 'dsf', 12, 0, '', 0, 1, '', 0),
(13, 'dfg', '商品分类', '23', 23, 0, '', 3, 1, '', 0),
(14, 'dfg', '商品分类', '23', 23, 0, '', 3, 1, '', 0),
(15, 'dfg', '商品分类', '23', 23, 0, '', 3, 1, '', 0),
(16, 'diyi', 'ok', '都', 10, 0, '1,4', 1, 1, '', 0);

-- --------------------------------------------------------

--
-- 表的结构 `product_delivery`
--

CREATE TABLE IF NOT EXISTS `product_delivery` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `order_id` int(11) unsigned NOT NULL COMMENT '订单表id',
  `offer_id` int(11) unsigned NOT NULL COMMENT '报盘id',
  `num` decimal(15,5) NOT NULL,
  `status` int(11) NOT NULL COMMENT '状态0:申请1：已发货（保证金）2：已付仓库费3：等待后台审核4：大于20%再次5：已完成6：已确认质量',
  `expect_time` datetime DEFAULT NULL COMMENT '预计提货日期',
  `delivery_man` varchar(20) NOT NULL COMMENT '提货人',
  `phone` varchar(30) NOT NULL COMMENT '联系电话',
  `idcard` varchar(30) NOT NULL COMMENT '身份证',
  `plate_number` text NOT NULL COMMENT '车牌号用英文,分隔',
  `remark` text NOT NULL COMMENT '备注',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='提货' AUTO_INCREMENT=10 ;

--
-- 转存表中的数据 `product_delivery`
--

INSERT INTO `product_delivery` (`id`, `order_id`, `offer_id`, `num`, `status`, `expect_time`, `delivery_man`, `phone`, `idcard`, `plate_number`, `remark`, `create_time`) VALUES
(1, 8, 24, '2.00000', 4, '2016-04-01 00:00:00', '李卫平', '15296631253', '15296631253', '23423', 'gaegag', '2016-06-02 15:53:20'),
(2, 8, 24, '5.00000', 4, '2016-04-01 00:00:00', '李卫平', '23123123', '15296631253', '34343', 'gaegag', '2016-06-02 15:55:07'),
(3, 8, 24, '4.00000', 4, '2016-04-01 00:00:00', '李卫平', '15296631253', '123231123', 'sdfsfd', 'gaegag', '2016-06-02 15:56:04'),
(4, 8, 24, '1.00000', 5, '2016-04-01 00:00:00', '李卫平', '15296631253', '15296631253', '34234,342343', 'gaegag', '2016-06-02 15:56:43'),
(5, 10, 23, '5.00000', 2, '2016-04-01 00:00:00', '李卫平', '15296631253', '152966312533123123123123', '23423', '', '2016-06-03 08:27:01'),
(6, 13, 28, '5.00000', 4, '2016-04-01 00:00:00', '李卫平', '15296631253', '152966312533123123123123', '34234,342343', 'gaegag', '2016-06-03 10:54:44'),
(7, 13, 28, '4.00000', 5, '2016-04-01 00:00:00', '李卫平', '23123123', '152966312533123123123123', '34234,342343', 'gaegag', '2016-06-03 10:56:30'),
(8, 16, 31, '5.00000', 2, '2016-04-01 00:00:00', '李卫平', '23123123', '152966312533123123123123', '34234,342343', 'gaegag', '2016-06-03 11:07:22'),
(9, 18, 32, '70.00000', 4, '2016-04-01 00:00:00', 'li', '12323232323', '23232323', '232323', 'gaegag', '2016-06-06 09:38:22');

-- --------------------------------------------------------

--
-- 表的结构 `product_offer`
--

CREATE TABLE IF NOT EXISTS `product_offer` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL COMMENT '用户id',
  `type` int(2) NOT NULL DEFAULT '1' COMMENT '报盘类型：1：卖盘，2：买盘',
  `mode` int(2) NOT NULL COMMENT '报盘模式：1：自由，2：保证金，3，委托，4:仓单',
  `product_id` int(11) NOT NULL COMMENT '商品iD',
  `price` decimal(8,2) NOT NULL COMMENT '商品单价',
  `divide` int(2) NOT NULL COMMENT '是否拆分，0：可以，1：不可',
  `minimum` decimal(15,2) NOT NULL COMMENT '最小起订量',
  `accept_area` varchar(100) NOT NULL COMMENT '交收地点',
  `accept_day` int(6) NOT NULL COMMENT '交收时间',
  `acc_type` varchar(20) NOT NULL COMMENT '支付方式',
  `offer_fee` decimal(10,2) NOT NULL COMMENT '报盘费率',
  `sign` varchar(100) NOT NULL COMMENT '签字照片，委托报盘为委托书照片',
  `status` int(2) NOT NULL COMMENT '审核状态',
  `is_del` int(2) NOT NULL COMMENT '0:正常，1：删除',
  `apply_time` datetime DEFAULT NULL COMMENT '申请时间',
  `finish_time` datetime DEFAULT NULL COMMENT '审核时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=33 ;

--
-- 转存表中的数据 `product_offer`
--

INSERT INTO `product_offer` (`id`, `user_id`, `type`, `mode`, `product_id`, `price`, `divide`, `minimum`, `accept_area`, `accept_day`, `acc_type`, `offer_fee`, `sign`, `status`, `is_del`, `apply_time`, `finish_time`) VALUES
(1, 0, 1, 1, 1, '123.00', 1, '0.00', '当时发生的', 3, '', '0.00', '', 0, 0, '2016-04-19 17:22:39', NULL),
(2, 0, 1, 1, 2, '12.00', 1, '0.00', '123', 2, '', '0.00', '', 0, 0, '2016-04-19 17:29:29', NULL),
(3, 0, 1, 1, 0, '23.00', 1, '0.00', '213', 2, '', '0.00', '', 0, 0, '2016-04-21 12:05:54', NULL),
(4, 0, 1, 2, 0, '89.90', 0, '2.00', '23', 6, '', '0.00', '', 1, 1, '2016-04-21 12:08:29', NULL),
(5, 36, 1, 3, 15, '12.00', 1, '0.00', 'sdfsdf', 2, '', '0.00', '', 2, 0, '2016-04-26 15:54:02', NULL),
(6, 0, 1, 4, 15, '12.00', 1, '0.00', '123', 2, '', '0.00', '', 2, 0, '2016-04-29 09:24:38', NULL),
(7, 0, 1, 4, 17, '800.00', 0, '123.00', '山西阳泉', 4, '', '0.00', '', 1, 0, '2016-04-29 09:37:05', NULL),
(8, 36, 1, 4, 17, '12.00', 0, '100.00', '河北', 4, '', '0.00', '', 1, 1, '2016-05-09 16:11:51', NULL),
(9, 36, 1, 2, 19, '23.00', 1, '0.00', '123', 23, '', '0.00', '', 1, 0, '2016-05-13 17:24:58', NULL),
(10, 36, 1, 1, 20, '12.00', 1, '0.00', '324', 234, '1', '100.00', '', 0, 0, '2016-05-20 17:26:45', NULL),
(11, 36, 1, 1, 21, '12.00', 1, '0.00', '324', 234, '1', '100.00', '', 0, 0, '2016-05-20 17:26:51', NULL),
(12, 36, 1, 1, 22, '12.00', 1, '0.00', '324', 234, '1', '100.00', '', 0, 0, '2016-05-20 17:26:52', NULL),
(13, 36, 1, 1, 23, '12.00', 1, '0.00', '324', 234, '1', '100.00', '', 0, 0, '2016-05-20 17:26:53', NULL),
(14, 36, 1, 1, 24, '12.00', 1, '0.00', '324', 234, '1', '100.00', '', 0, 0, '2016-05-20 17:31:45', NULL),
(15, 36, 1, 1, 25, '12.00', 1, '0.00', '324', 3, '1', '0.00', '', 0, 0, '2016-05-20 17:49:17', NULL),
(16, 36, 1, 1, 26, '10.00', 1, '0.00', '123', 12, '1', '0.00', '', 1, 0, '2016-05-20 17:50:46', NULL),
(17, 36, 1, 1, 27, '12.00', 1, '0.00', '12', 1, '1', '24.00', '', 1, 0, '2016-05-20 17:54:41', NULL),
(18, 36, 1, 3, 28, '2.00', 1, '0.00', '123', 1, '', '0.00', 'upload/2016/05/20/20160520180916632.jpg@user', 0, 0, '2016-05-20 18:09:47', NULL),
(19, 56, 1, 2, 29, '100.00', 1, '0.00', '阳泉', 1, '', '0.00', '', 2, 0, '2016-06-01 15:40:40', NULL),
(20, 56, 1, 3, 30, '190.00', 1, '0.00', '123', 1, '', '0.00', 'upload/2016/06/01/20160601160434821.jpg@user', 1, 0, '2016-06-01 16:04:36', NULL),
(21, 36, 1, 1, 31, '120.00', 1, '0.00', '阳泉', 1, '1', '20.00', '', 1, 0, '2016-06-01 17:22:04', NULL),
(22, 36, 1, 1, 32, '120.00', 1, '0.00', '阳泉', 123, '1', '20.00', '', 2, 0, '2016-06-01 17:23:26', NULL),
(23, 36, 1, 4, 33, '190.00', 0, '10.00', '阳泉', 3, '', '0.00', '', 1, 0, '2016-06-01 17:34:16', NULL),
(24, 36, 1, 2, 34, '10.00', 1, '0.00', '水电费', 12, '', '0.00', '', 1, 0, '2016-06-02 15:35:00', NULL),
(25, 36, 1, 1, 37, '10.00', 1, '0.00', '水电费', 2, '1', '20.00', '', 0, 0, '2016-06-02 16:31:33', NULL),
(26, 36, 1, 2, 38, '12.00', 1, '0.00', '12', 2, '', '0.00', '', 0, 0, '2016-06-02 18:32:33', NULL),
(27, 36, 1, 2, 39, '12.00', 1, '0.00', '请问', 2, '', '0.00', '', 0, 0, '2016-06-02 18:34:17', NULL),
(28, 59, 1, 2, 40, '100.00', 1, '0.00', '阳泉', 3, '', '0.00', '', 1, 0, '2016-06-03 10:32:17', NULL),
(29, 59, 1, 1, 41, '10.00', 0, '10.00', '辽宁', 2, '1', '14.00', '', 1, 0, '2016-06-03 10:34:16', NULL),
(30, 59, 1, 3, 42, '100.00', 1, '0.00', '江苏', 2, '', '0.00', 'upload/2016/06/03/20160603103614405.jpg@user', 1, 0, '2016-06-03 10:36:16', NULL),
(31, 59, 1, 4, 43, '100.00', 0, '10.00', '阳泉', 2, '', '0.00', '', 1, 0, '2016-06-03 10:48:24', NULL),
(32, 60, 1, 4, 44, '20.00', 1, '0.00', '会计', 2, '', '0.00', '', 1, 0, '2016-06-06 09:23:02', NULL);

-- --------------------------------------------------------

--
-- 表的结构 `product_photos`
--

CREATE TABLE IF NOT EXISTS `product_photos` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `img` varchar(100) DEFAULT NULL,
  `products_id` int(11) NOT NULL,
  PRIMARY KEY (`id`,`products_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=52 ;

--
-- 转存表中的数据 `product_photos`
--

INSERT INTO `product_photos` (`id`, `img`, `products_id`) VALUES
(1, ' upload/2016/04/19/20160419172228702.png@user', 1),
(2, ' upload/2016/04/19/20160419172919996.png@user', 2),
(3, ' upload/2016/04/19/20160419172920944.png@user', 2),
(4, 'upload/2016/04/21/20160421120549509.png@user', 3),
(5, 'upload/2016/04/21/20160421120549275.png@user', 3),
(6, 'upload/2016/04/21/20160421120818130.png@user', 4),
(7, 'upload/2016/04/21/20160421120818524.png@user', 4),
(8, 'upload/2016/04/26/20160426151236614.jpg@user', 10),
(9, 'upload/2016/04/26/20160426151237580.jpg@user', 10),
(10, 'upload/2016/04/28/20160428091345128.jpg@user', 11),
(11, 'upload/2016/04/28/20160428094019834.jpg@user', 12),
(12, 'upload/2016/04/28/20160428094019406.jpg@user', 12),
(13, 'upload/2016/04/28/20160428165119212.jpg@user', 13),
(14, 'upload/2016/04/28/20160428165119817.jpg@user', 13),
(15, 'upload/2016/04/28/20160428181848719.jpg@user', 14),
(16, 'upload/2016/04/29/20160429092719122.jpg@user', 15),
(17, 'upload/2016/04/29/20160429092719822.jpg@user', 15),
(18, 'upload/2016/04/29/20160429093134261.jpg@user', 16),
(19, 'upload/2016/04/29/20160429093145307.jpg@user', 16),
(20, 'upload/2016/04/29/20160429093145256.jpg@user', 16),
(21, 'upload/2016/04/29/20160429093352139.jpg@user', 17),
(22, 'upload/2016/04/29/20160429093352350.jpg@user', 17),
(23, 'upload/2016/04/29/20160429093352507.jpg@user', 17),
(24, 'upload/2016/05/09/20160509150149589.jpg@user', 18),
(25, 'upload/2016/05/20/20160520172639199.jpg@user', 20),
(26, 'upload/2016/05/20/20160520172639199.jpg@user', 21),
(27, 'upload/2016/05/20/20160520172639199.jpg@user', 22),
(28, 'upload/2016/05/20/20160520172639199.jpg@user', 23),
(29, 'upload/2016/05/20/20160520172639199.jpg@user', 24),
(30, 'upload/2016/05/20/20160520174911288.jpg@user', 25),
(31, 'upload/2016/05/20/20160520175436103.jpg@user', 27),
(32, 'upload/2016/05/20/20160520180940302.jpg@user', 28),
(33, 'upload/2016/06/01/20160601154030414.jpg@user', 29),
(34, 'upload/2016/06/01/20160601160426996.jpg@user', 30),
(35, 'upload/2016/06/01/20160601171958166.jpg@user', 31),
(36, 'upload/2016/06/01/20160601172322311.jpg@user', 32),
(37, 'upload/2016/06/01/20160601173024811.jpg@user', 33),
(38, 'upload/2016/06/02/20160602153455272.jpg@user', 34),
(39, 'upload/2016/06/02/20160602162413385.jpg@user', 35),
(40, 'upload/2016/06/02/20160602162941250.jpg@user', 36),
(41, 'upload/2016/06/02/20160602163129162.jpg@user', 37),
(42, 'upload/2016/06/02/20160602183228968.jpg@user', 38),
(43, 'upload/2016/06/02/20160602183413206.jpg@user', 39),
(44, 'upload/2016/06/03/20160603103200784.jpg@user', 40),
(45, 'upload/2016/06/03/20160603103200492.jpg@user', 40),
(46, 'upload/2016/06/03/20160603103201380.jpg@user', 40),
(47, 'upload/2016/06/03/20160603103354124.jpg@user', 41),
(48, 'upload/2016/06/03/20160603103557706.jpg@user', 42),
(49, 'upload/2016/06/03/20160603103557588.jpg@user', 42),
(50, 'upload/2016/06/03/20160603103726117.jpg@user', 43),
(51, 'upload/2016/06/06/20160606092028467.jpg@user', 44);

-- --------------------------------------------------------

--
-- 表的结构 `question`
--

CREATE TABLE IF NOT EXISTS `question` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(45) DEFAULT NULL,
  `content` text,
  `status` varchar(45) DEFAULT NULL COMMENT '状态',
  `user_id` int(11) NOT NULL,
  `question_cate_id` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `question_cate`
--

CREATE TABLE IF NOT EXISTS `question_cate` (
  `id` int(11) NOT NULL,
  `name` varchar(50) DEFAULT NULL,
  `pid` int(11) DEFAULT NULL COMMENT '父类id',
  `sort` int(11) DEFAULT NULL,
  `question_num` int(11) DEFAULT NULL COMMENT '问题数量',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `recharge_order`
--

CREATE TABLE IF NOT EXISTS `recharge_order` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `user_id` int(11) NOT NULL COMMENT '用户id',
  `order_no` varchar(50) NOT NULL COMMENT '订单序号，',
  `amount` decimal(10,2) NOT NULL COMMENT '充值金额',
  `pay_type` int(2) NOT NULL COMMENT '支付方式，1：线下，2：支付宝，3：银联',
  `proot` varchar(100) NOT NULL DEFAULT '' COMMENT '线下支付支付凭证，线上支付为\r\n第三方支付平台返回的流水号',
  `status` int(2) NOT NULL DEFAULT '0' COMMENT '支付状态，0：申请，1：成功',
  `create_time` datetime DEFAULT NULL COMMENT '申请时间',
  `first_time` datetime DEFAULT NULL COMMENT '初审时间',
  `first_message` text NOT NULL COMMENT '初审意见',
  `final_time` datetime DEFAULT NULL COMMENT '终审时间',
  `final_message` text NOT NULL COMMENT '终审意见',
  `is_del` int(2) NOT NULL DEFAULT '0' COMMENT '是否删除，0：否，1：是',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=26 ;

--
-- 转存表中的数据 `recharge_order`
--

INSERT INTO `recharge_order` (`id`, `user_id`, `order_no`, `amount`, `pay_type`, `proot`, `status`, `create_time`, `first_time`, `first_message`, `final_time`, `final_message`, `is_del`) VALUES
(1, 1, 'recharge20160505094216971737', '0.00', 3, ' ', 0, '2016-05-05 09:42:16', NULL, '', NULL, '', 0),
(2, 1, 'recharge20160505094436506164', '0.00', 2, ' ', 0, '2016-05-05 09:44:36', NULL, '', NULL, '', 0),
(4, 1, 'recharge20160505095107690789', '5.00', 2, ' ', 0, '2016-05-05 09:51:07', NULL, '', NULL, '', 0),
(5, 1, 'recharge20160505113323175558', '56.00', 1, 'upload/2016/05/05/20160505113323737.jpg', 2, '2016-05-05 11:33:23', '2016-05-12 12:34:18', '', NULL, '', 0),
(6, 1, 'recharge20160505134704342907', '4.00', 1, 'upload/2016/05/05/20160505134704156.jpg@user', 2, '2016-05-05 13:47:04', '2016-05-05 17:32:11', '', NULL, '', 0),
(7, 36, 'recharge20160505173529698672', '3434.00', 1, 'upload/2016/05/05/20160505173529953.jpg@user', 4, '2016-05-05 17:35:29', '2016-05-05 17:35:56', '', '2016-05-05 17:39:20', '不清晰', 0),
(8, 36, 'recharge20160505173808155041', '1000.00', 1, 'upload/2016/05/05/20160505173808535.jpg@user', 1, '2016-05-05 17:38:08', '2016-05-05 17:38:58', 'dfgdfg', '2016-05-05 17:39:44', '', 0),
(9, 36, 'recharge20160505174042417752', '200.00', 1, 'upload/2016/05/05/20160505174041708.jpg@user', 1, '2016-05-05 17:40:42', '2016-05-05 17:41:03', 'ok', '2016-05-05 17:41:13', '通过', 0),
(10, 36, 'recharge20160505174247466394', '700.00', 1, 'upload/2016/05/05/20160505174247679.jpg@user', 1, '2016-05-05 17:42:47', '2016-05-05 17:42:59', '二恶', '2016-05-05 17:43:05', '', 1),
(11, 36, 'recharge20160506082846882968', '100.00', 1, 'upload/2016/05/06/20160506082846540.jpg@user', 1, '2016-05-06 08:28:46', '2016-05-06 08:29:07', '初审通过', '2016-05-06 08:35:45', '', 1),
(12, 36, 'recharge20160506101656827624', '90.00', 1, 'upload/2016/05/06/20160506101655995.jpg@user', 1, '2016-05-06 10:16:56', '2016-05-06 10:17:24', '', '2016-05-06 10:17:28', '', 0),
(13, 36, 'recharge20160516171907684115', '2.00', 1, 'upload/2016/05/16/20160516171905655.jpg@user', 1, '2016-05-16 17:19:07', '2016-05-16 17:20:01', '', '2016-05-16 17:20:26', '', 0),
(14, 52, 'recharge20160601143653682247', '100.00', 1, 'upload/2016/06/01/20160601143651967.jpg@user', 2, '2016-06-01 14:36:53', '2016-06-01 14:37:11', '', NULL, '', 0),
(15, 56, 'recharge20160601151001780273', '100.00', 1, 'upload/2016/06/01/20160601151000362.jpg@user', 1, '2016-06-01 15:10:01', '2016-06-01 15:10:17', '', '2016-06-01 15:10:56', '', 0),
(16, 56, 'recharge20160601151135302011', '100.00', 1, 'upload/2016/06/01/20160601151134820.jpg@user', 1, '2016-06-01 15:11:35', '2016-06-01 15:11:55', '', '2016-06-01 15:12:05', '', 0),
(17, 56, 'recharge20160601153350810815', '200.00', 1, 'upload/2016/06/01/20160601153349721.jpg@user', 1, '2016-06-01 15:33:50', '2016-06-01 15:34:02', '', '2016-06-01 15:34:07', '', 0),
(18, 36, 'recharge20160602144624462438', '12.00', 1, 'upload/2016/06/02/20160602144623678.jpg@user', 2, '2016-06-02 14:46:24', '2016-06-02 14:47:00', '', NULL, '', 0),
(19, 57, 'recharge20160602145233801586', '1000.00', 1, 'upload/2016/06/02/20160602145232979.jpg@user', 1, '2016-06-02 14:52:33', '2016-06-02 14:52:44', '', '2016-06-02 14:52:52', '', 0),
(20, 57, 'recharge20160602150803931417', '1000000.00', 1, 'upload/2016/06/02/20160602150801142.jpg@user', 1, '2016-06-02 15:08:03', '2016-06-02 15:08:10', '', '2016-06-02 15:08:13', '', 0),
(21, 58, 'recharge20160602174621967947', '1000.00', 1, 'upload/2016/06/02/20160602174620748.jpg@user', 1, '2016-06-02 17:46:21', '2016-06-02 17:46:35', '', '2016-06-02 17:46:40', '', 0),
(22, 59, 'recharge20160603103029408880', '1000.00', 1, 'upload/2016/06/03/20160603103027603.jpg@user', 1, '2016-06-03 10:30:29', '2016-06-03 10:30:50', '', '2016-06-03 10:30:57', '', 0),
(23, 36, 'recharge20160606093113306433', '2000.00', 1, 'upload/2016/06/06/20160606093112491.jpg@user', 1, '2016-06-06 09:31:13', '2016-06-06 09:31:25', '', '2016-06-06 09:31:41', '', 0),
(24, 60, 'recharge20160606093944868878', '1000.00', 1, 'upload/2016/06/06/20160606093943103.jpg@user', 1, '2016-06-06 09:39:44', '2016-06-06 09:39:56', '', '2016-06-06 09:40:00', '', 0),
(25, 36, 'recharge20160606165702129141', '100.00', 1, 'upload/2016/06/06/20160606165701683.jpg@user', 0, '2016-06-06 16:57:02', NULL, '', NULL, '', 0);

-- --------------------------------------------------------

--
-- 表的结构 `scale_offer`
--

CREATE TABLE IF NOT EXISTS `scale_offer` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `free` decimal(10,2) NOT NULL COMMENT '自由报盘收费率',
  `deposite` decimal(5,2) NOT NULL COMMENT '保证金',
  `fee` decimal(5,2) NOT NULL COMMENT '手续费',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- 转存表中的数据 `scale_offer`
--

INSERT INTO `scale_offer` (`id`, `free`, `deposite`, `fee`) VALUES
(1, '101.00', '33.20', '43.00');

-- --------------------------------------------------------

--
-- 表的结构 `ship`
--

CREATE TABLE IF NOT EXISTS `ship` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `start_add` varchar(45) DEFAULT NULL COMMENT '出发地',
  `end_add` varchar(45) DEFAULT NULL COMMENT '目的地',
  `date` date DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `shipper`
--

CREATE TABLE IF NOT EXISTS `shipper` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `sattus` int(11) DEFAULT NULL COMMENT '开通状态',
  `user_id` int(11) NOT NULL,
  `apply_time` datetime DEFAULT NULL,
  `verify_time` datetime DEFAULT NULL,
  `admin_id` int(11) DEFAULT NULL COMMENT '审核的管理员id',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `ship_order`
--

CREATE TABLE IF NOT EXISTS `ship_order` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `ship_id` int(11) DEFAULT NULL COMMENT '运输需求id',
  `create_time` datetime DEFAULT NULL,
  `order_no` varchar(20) DEFAULT NULL COMMENT '订单号',
  `shipper_id` int(11) DEFAULT NULL COMMENT '车主id',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `ship_order_trucks`
--

CREATE TABLE IF NOT EXISTS `ship_order_trucks` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `ship_order_id` varchar(45) DEFAULT NULL COMMENT '运输订单id',
  `truck_id` int(11) DEFAULT NULL,
  `ship_weight` decimal(10,5) DEFAULT NULL COMMENT '运输重量',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `static_category`
--

CREATE TABLE IF NOT EXISTS `static_category` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键Id',
  `cate_id` int(11) NOT NULL DEFAULT '0' COMMENT '分类Id',
  `type` tinyint(2) NOT NULL DEFAULT '1' COMMENT '时间统计',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `static_market`
--

CREATE TABLE IF NOT EXISTS `static_market` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键Id',
  `cate_id` int(11) NOT NULL DEFAULT '0' COMMENT '分类id',
  `type` tinyint(2) NOT NULL DEFAULT '1' COMMENT '类型',
  `ave_price` decimal(12,2) NOT NULL DEFAULT '0.00' COMMENT '平均价',
  `create_time` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `days` int(5) NOT NULL DEFAULT '0' COMMENT '间隔天数',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `store_in_out`
--

CREATE TABLE IF NOT EXISTS `store_in_out` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `product_id` int(11) DEFAULT NULL,
  `num` decimal(15,2) DEFAULT NULL,
  `type` int(11) DEFAULT NULL COMMENT '类型：出或入',
  `time` datetime DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  `store_list_id` int(11) NOT NULL,
  `manager` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `store_list`
--

CREATE TABLE IF NOT EXISTS `store_list` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(45) DEFAULT NULL,
  `short_name` varchar(20) NOT NULL COMMENT '仓库简称',
  `area` varchar(6) DEFAULT NULL,
  `address` varchar(80) DEFAULT NULL,
  `service_phone` varchar(20) NOT NULL COMMENT '仓库服务的电话',
  `service_address` varchar(255) NOT NULL COMMENT '仓库服务点地址',
  `contact` varchar(30) NOT NULL COMMENT '联系人',
  `contact_phone` varchar(20) NOT NULL COMMENT '联系人电话',
  `type` int(2) NOT NULL COMMENT '仓库类型',
  `note` text NOT NULL COMMENT '备注',
  `status` int(2) NOT NULL COMMENT '0:关闭，1：启用',
  `img` varchar(255) NOT NULL COMMENT '仓库图片',
  `is_del` int(2) NOT NULL COMMENT '0:正常，1：删除',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=3 ;

--
-- 转存表中的数据 `store_list`
--

INSERT INTO `store_list` (`id`, `name`, `short_name`, `area`, `address`, `service_phone`, `service_address`, `contact`, `contact_phone`, `type`, `note`, `status`, `img`, `is_del`) VALUES
(1, '一号店', 'yi', '230303', '点开看看7', '123234545', 'dfgdfgdfg', '赵看看', '13434343439', 1, '水电费水电费水电费法国恢复供货', 1, '', 1),
(2, '地方', '二 分', '130202', '第三方士大夫的', '2323232', '2的孙菲菲', '3多少', '1434343434', 0, '', 1, '', 0);

-- --------------------------------------------------------

--
-- 表的结构 `store_manager`
--

CREATE TABLE IF NOT EXISTS `store_manager` (
  `user_id` int(11) NOT NULL,
  `status` int(11) DEFAULT NULL COMMENT '认证状态',
  `apply_time` datetime DEFAULT NULL,
  `verify_time` datetime DEFAULT NULL COMMENT '审核时间',
  `admin_id` int(11) DEFAULT NULL COMMENT '审核管理员id',
  `store_id` int(11) DEFAULT NULL COMMENT '管理的仓库id',
  `message` text NOT NULL,
  UNIQUE KEY `user_id` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `store_manager`
--

INSERT INTO `store_manager` (`user_id`, `status`, `apply_time`, `verify_time`, `admin_id`, `store_id`, `message`) VALUES
(36, 2, '2016-06-06 17:31:10', '2016-06-06 17:31:20', NULL, 1, ''),
(42, 0, '2016-03-12 23:05:44', NULL, NULL, 1, ''),
(52, 2, '2016-06-01 14:35:21', '2016-06-01 14:35:33', NULL, NULL, ''),
(60, 2, '2016-06-03 10:44:00', '2016-06-03 10:44:11', NULL, NULL, '');

-- --------------------------------------------------------

--
-- 表的结构 `store_order`
--

CREATE TABLE IF NOT EXISTS `store_order` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `offer_id` int(11) unsigned NOT NULL COMMENT '报盘id',
  `order_no` varchar(50) NOT NULL,
  `num` decimal(15,2) NOT NULL COMMENT '购买数量',
  `amount` decimal(10,2) unsigned NOT NULL COMMENT '订单总额',
  `user_id` int(11) unsigned NOT NULL,
  `pay_deposit` decimal(10,2) unsigned DEFAULT NULL COMMENT '买方定金',
  `pay_retainage` decimal(10,2) DEFAULT NULL,
  `payment` int(11) DEFAULT NULL COMMENT '1:余额支付',
  `contract_status` int(11) NOT NULL DEFAULT '0' COMMENT '合同状态 0:未形成3:等待支付尾款4:生效5:完成',
  `proof` varchar(100) DEFAULT NULL COMMENT '支付凭证',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='仓单摘牌' AUTO_INCREMENT=6 ;

--
-- 转存表中的数据 `store_order`
--

INSERT INTO `store_order` (`id`, `offer_id`, `order_no`, `num`, `amount`, `user_id`, `pay_deposit`, `pay_retainage`, `payment`, `contract_status`, `proof`, `create_time`) VALUES
(1, 8, '{4B82A515-5DA6-489E-B070-383F409DD4E2}', '100.00', '1200.00', 36, NULL, NULL, NULL, 0, NULL, '2016-05-11 11:01:04'),
(2, 8, '{84614893-D669-4C04-AB55-D6496161169C}', '100.00', '1200.00', 36, NULL, NULL, NULL, 0, NULL, '2016-05-11 11:02:14'),
(3, 8, '{1AE6B300-5EC9-4809-A7FF-2A553D8A182F}', '100.00', '1200.00', 36, NULL, NULL, NULL, 0, NULL, '2016-05-11 11:03:14'),
(4, 8, '{F9FDB591-9078-4115-AFDE-26DA0236EB72}', '100.00', '1200.00', 36, NULL, NULL, NULL, 0, NULL, '2016-05-11 11:19:51'),
(5, 8, '{1C824556-99A1-4882-915A-6EDA34BC8897}', '100.00', '1200.00', 36, '360.00', NULL, NULL, 3, NULL, '2016-05-11 11:27:47');

-- --------------------------------------------------------

--
-- 表的结构 `store_products`
--

CREATE TABLE IF NOT EXISTS `store_products` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL COMMENT '所属用户id',
  `store_id` int(11) NOT NULL COMMENT '仓库id',
  `product_id` int(11) DEFAULT NULL,
  `store_pos` varchar(200) NOT NULL COMMENT '库位',
  `cang_pos` varchar(100) NOT NULL COMMENT '仓位',
  `store_price` decimal(10,2) NOT NULL COMMENT '租库价格，每天每商品记重单位的价格',
  `package` int(2) NOT NULL COMMENT '是否包装',
  `package_unit` varchar(20) NOT NULL COMMENT '包装单位',
  `package_num` int(11) NOT NULL COMMENT '包装数量',
  `package_weight` decimal(8,5) NOT NULL COMMENT '包装重量',
  `status` int(2) NOT NULL COMMENT '审核状态',
  `is_offer` int(2) NOT NULL COMMENT '0：未报盘，1：已报盘',
  `apply_time` datetime NOT NULL COMMENT '申请时间',
  `manager_time` datetime DEFAULT NULL COMMENT '仓库管理员审核时间',
  `sign_time` datetime DEFAULT NULL COMMENT '仓单签发时间',
  `user_time` datetime DEFAULT NULL COMMENT '用户确认时间',
  `market_time` datetime DEFAULT NULL COMMENT '市场审核时间',
  `in_time` datetime NOT NULL COMMENT '入库时间',
  `rent_time` datetime NOT NULL COMMENT '租库时间',
  `finish_time` datetime NOT NULL COMMENT '完成时间',
  `expire_time` datetime NOT NULL COMMENT '失效日期',
  `check_org` varchar(50) NOT NULL COMMENT '检测机构',
  `check_no` varchar(100) NOT NULL COMMENT '证书编号',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=18 ;

--
-- 转存表中的数据 `store_products`
--

INSERT INTO `store_products` (`id`, `user_id`, `store_id`, `product_id`, `store_pos`, `cang_pos`, `store_price`, `package`, `package_unit`, `package_num`, `package_weight`, `status`, `is_offer`, `apply_time`, `manager_time`, `sign_time`, `user_time`, `market_time`, `in_time`, `rent_time`, `finish_time`, `expire_time`, `check_org`, `check_no`) VALUES
(1, 0, 0, 7, '123', '', '0.00', 0, '', 0, '0.00000', 1, 0, '2016-04-21 12:19:26', NULL, NULL, NULL, NULL, '2016-04-28 00:00:00', '2016-04-29 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '', ''),
(2, 0, 1, 8, '', '', '0.00', 0, '', 0, '0.00000', 1, 0, '2016-04-21 12:24:36', NULL, NULL, NULL, NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '', ''),
(3, 36, 1, 9, '', '', '0.00', 0, '', 12, '23.00000', 4, 0, '2016-04-21 12:24:56', NULL, NULL, NULL, NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '', ''),
(4, 36, 1, 10, '', '', '0.00', 0, '', 0, '0.00000', 4, 0, '2016-04-26 15:12:40', NULL, NULL, NULL, NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '', ''),
(5, 48, 1, 11, '', '', '0.00', 0, '', 0, '0.00000', 21, 0, '2016-04-28 09:13:53', '2016-05-16 17:25:38', NULL, NULL, NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '', ''),
(6, 36, 1, 12, '', '', '0.00', 0, '', 0, '0.00000', 31, 0, '2016-04-28 09:40:24', NULL, NULL, NULL, NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '', ''),
(7, 36, 1, 13, '', '', '0.00', 0, '', 0, '0.00000', 31, 0, '2016-04-28 16:51:29', NULL, NULL, NULL, NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '', ''),
(8, 48, 1, 14, '123', '', '0.00', 0, '', 0, '0.00000', 31, 0, '2016-04-28 18:18:53', NULL, NULL, NULL, NULL, '2016-04-28 00:00:00', '2016-04-28 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '', ''),
(9, 36, 1, 15, '', '', '0.00', 0, '', 0, '0.00000', 0, 0, '2016-04-29 09:27:25', NULL, NULL, NULL, NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '', ''),
(10, 36, 1, 16, '', '', '0.00', 1, '', 0, '0.00000', 22, 0, '2016-04-29 09:32:07', NULL, NULL, NULL, NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '', ''),
(11, 36, 1, 17, '1号位', '', '0.00', 0, '', 0, '0.00000', 31, 1, '2016-04-29 09:33:59', NULL, NULL, NULL, NULL, '2016-04-29 00:00:00', '2016-04-27 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '', ''),
(12, 36, 1, 18, 'x5', '', '0.00', 1, '', 0, '0.00000', 31, 0, '2016-05-09 15:03:06', '2016-05-09 15:04:07', '2016-05-09 15:05:02', '2016-05-09 15:07:53', '2016-05-09 15:37:46', '2016-05-09 00:00:00', '2016-05-08 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '', ''),
(13, 36, 1, 33, '1号', 'a', '0.00', 1, '', 0, '0.00000', 31, 1, '2016-06-01 17:30:43', '2016-06-01 17:31:09', '2016-06-01 17:32:47', '2016-06-01 17:32:58', '2016-06-01 17:33:46', '2016-06-15 00:00:00', '2016-06-02 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'hjkhjhjh', '12312313123'),
(14, 36, 2, 35, '', '', '0.00', 0, '', 0, '0.00000', 10, 0, '2016-06-02 16:24:21', NULL, NULL, NULL, NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '', ''),
(15, 36, 1, 36, 'qwe', '234', '10.00', 0, '', 0, '0.00000', 23, 0, '2016-06-02 16:29:46', '2016-06-02 16:40:35', '2016-06-02 16:51:59', NULL, NULL, '2016-06-02 00:00:00', '2016-06-03 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'dsfdsf', 'sdfsdfsdfsdf'),
(16, 59, 1, 43, '1', 'a', '10.00', 1, '', 0, '0.00000', 31, 1, '2016-06-03 10:37:45', '2016-06-03 10:45:32', '2016-06-03 10:46:23', '2016-06-03 10:47:26', '2016-06-03 10:47:50', '2016-06-03 00:00:00', '2016-06-03 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '1111111111111', '123123123123'),
(17, 60, 1, 44, '12', 'ab', '10.00', 1, '', 0, '0.00000', 31, 1, '2016-06-06 09:20:38', '2016-06-06 09:20:58', '2016-06-06 09:21:27', '2016-06-06 09:21:43', '2016-06-06 09:22:17', '2016-06-06 00:00:00', '2016-06-07 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'sdfsdf', '1231231231');

-- --------------------------------------------------------

--
-- 表的结构 `subuser_right`
--

CREATE TABLE IF NOT EXISTS `subuser_right` (
  `id` int(6) NOT NULL AUTO_INCREMENT COMMENT '权限id',
  `level` int(2) NOT NULL COMMENT '权限级别：0：应用，1：模块，2：控制器，3：方法',
  `name` varchar(20) NOT NULL COMMENT '权限名',
  `pid` int(6) NOT NULL COMMENT '父类权限id',
  `note` varchar(30) NOT NULL COMMENT '中文名称',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=7 ;

--
-- 转存表中的数据 `subuser_right`
--

INSERT INTO `subuser_right` (`id`, `level`, `name`, `pid`, `note`) VALUES
(1, 0, 'user', 0, '用户系统'),
(2, 2, 'ucenter', 1, '个人中心'),
(3, 3, 'index', 2, '首页'),
(4, 3, 'chgpass', 2, '修改密码'),
(5, 0, 'deal', 0, '交易系统'),
(6, 2, 'index', 5, '首页');

-- --------------------------------------------------------

--
-- 表的结构 `subuser_role`
--

CREATE TABLE IF NOT EXISTS `subuser_role` (
  `id` int(6) NOT NULL AUTO_INCREMENT,
  `name` text NOT NULL COMMENT '角色名',
  `status` int(2) NOT NULL COMMENT '0:关闭 1：开启',
  `note` varchar(100) NOT NULL COMMENT '角色说明',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `subuser_role_right`
--

CREATE TABLE IF NOT EXISTS `subuser_role_right` (
  `id` int(6) NOT NULL AUTO_INCREMENT,
  `role_id` int(8) NOT NULL,
  `right_id` int(8) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `subuser_user_role`
--

CREATE TABLE IF NOT EXISTS `subuser_user_role` (
  `user_id` int(11) NOT NULL,
  `role_id` int(6) NOT NULL,
  `note` text NOT NULL COMMENT '角色说明'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `test`
--

CREATE TABLE IF NOT EXISTS `test` (
  `id` int(5) NOT NULL AUTO_INCREMENT,
  `name` varchar(20) NOT NULL,
  `value` int(5) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- 转存表中的数据 `test`
--

INSERT INTO `test` (`id`, `name`, `value`) VALUES
(1, 'wplee', 7);

-- --------------------------------------------------------

--
-- 表的结构 `truck`
--

CREATE TABLE IF NOT EXISTS `truck` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL COMMENT '用户id',
  `vehicle_no` varchar(12) DEFAULT NULL COMMENT '车牌号',
  `area` varchar(8) DEFAULT NULL COMMENT '车辆所属地区',
  `max_load` decimal(6,2) DEFAULT NULL COMMENT '最大载重',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `user`
--

CREATE TABLE IF NOT EXISTS `user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type` tinyint(4) DEFAULT '0',
  `username` varchar(30) DEFAULT NULL,
  `password` varchar(40) DEFAULT NULL,
  `credit` decimal(15,2) NOT NULL COMMENT '会员信誉值',
  `mobile` varchar(14) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `head_photo` varchar(100) DEFAULT NULL COMMENT '头像',
  `pid` int(11) DEFAULT '0' COMMENT '父账户id',
  `roles` int(5) DEFAULT NULL COMMENT '用户角色',
  `status` smallint(6) DEFAULT NULL,
  `agent` int(5) NOT NULL COMMENT '代理商id',
  `agent_pass` varchar(50) NOT NULL COMMENT '代理商密码',
  `create_time` datetime DEFAULT NULL,
  `login_time` datetime DEFAULT NULL COMMENT '最近登录时间',
  `session_id` varchar(255) NOT NULL COMMENT '用户登录后的sessionID',
  `cert_status` int(2) NOT NULL DEFAULT '0' COMMENT '0:认证未改变，1：认证发生改变',
  `gid` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=61 ;

--
-- 转存表中的数据 `user`
--

INSERT INTO `user` (`id`, `type`, `username`, `password`, `credit`, `mobile`, `email`, `head_photo`, `pid`, `roles`, `status`, `agent`, `agent_pass`, `create_time`, `login_time`, `session_id`, `cert_status`, `gid`) VALUES
(28, 1, 'fgertertert', '601f1889667efaebb33b8c12572835da3f027f78', '0.00', '456345345345', '', NULL, NULL, NULL, NULL, 3, '12334234234', NULL, NULL, '', 0, ''),
(29, 1, 'bnfghfghfh', '05fe7461c607c33229772d402505601016a7d0ea', '0.00', '567456456', '', NULL, NULL, NULL, NULL, 3, '12334234234', NULL, NULL, '', 0, ''),
(31, 1, 'weipinglee33', '601f1889667efaebb33b8c12572835da3f027f78', '0.00', '456456456', '', NULL, NULL, NULL, NULL, 3, '12334234234', NULL, NULL, '285dnb0demflhc3n7sca0n95m2', 0, ''),
(32, 0, 'adminkkk', '05fe7461c607c33229772d402505601016a7d0ea', '0.00', '12323232323', '', NULL, NULL, NULL, NULL, 0, '0', NULL, NULL, '4odd8sfrcfacopn2j72c88qf64', 0, ''),
(33, 0, 'wplee', '05fe7461c607c33229772d402505601016a7d0ea', '0.00', '12323232328', '', '@user', NULL, NULL, NULL, 0, '0', NULL, NULL, '5buhd54rqajbajsfumkgr9ijb4', 0, ''),
(34, 1, 'wplee127', '05fe7461c607c33229772d402505601016a7d0ea', '0.00', '14523232323', '', NULL, NULL, NULL, NULL, 3, '123123', NULL, NULL, '8qgb5uv4h90s5vlsu1ddr8pr22', 0, ''),
(35, 1, '123qwe', 'c53255317bb11707d0f614696b3ce6f221d0e2f2', '0.00', '13434343434', '', 'filefromuser/2016/03/11/20160311074729915.jpg@user@user', NULL, NULL, NULL, 4, 'sdfsdfsdf', NULL, NULL, 'd6dr0opqrvgejc72khn3qoli91', 0, ''),
(36, 1, 'weipinglee', '05fe7461c607c33229772d402505601016a7d0ea', '350.00', '16767676767', '123123d@13.com', 'filefromuser/2016/03/19/20160319100358393.jpg@user', 0, NULL, NULL, 4, '1233124', NULL, NULL, 'nufu375e4778rm15k9mtug6gr2', 0, ''),
(37, 0, 'geren', '05fe7461c607c33229772d402505601016a7d0ea', '0.00', '14334343434', '', '', NULL, NULL, NULL, 0, '0', NULL, NULL, '', 0, ''),
(39, 0, 'kljklj', '05fe7461c607c33229772d402505601016a7d0ea', '0.00', '15454545454', '', NULL, NULL, NULL, NULL, 0, '0', NULL, NULL, 'ekp720eh5rqapk3ftfp87o3is5', 0, ''),
(40, 0, 'kljlkjlkji', '05fe7461c607c33229772d402505601016a7d0ea', '0.00', '14454545454', '', NULL, NULL, NULL, NULL, 0, '0', NULL, NULL, '', 0, ''),
(41, 0, 'weimama', '05fe7461c607c33229772d402505601016a7d0ea', '0.00', '12323232329', '', NULL, NULL, NULL, NULL, 0, '0', NULL, NULL, '', 0, ''),
(42, 0, 'gerenyonghu', '7c4a8d09ca3762af61e59520943dc26494f8941b', '0.00', '16767676760', '', 'filefromuser/2016/03/12/20160312193238190.png@user', 0, NULL, NULL, 0, '0', NULL, NULL, 'fhhhacsj5rihilp4d8tu3anca2', 1, ''),
(43, 0, 'weipine12', '05fe7461c607c33229772d402505601016a7d0ea', '0.00', '15323232323', 'weeer@133.com', NULL, 36, NULL, NULL, 0, '', NULL, NULL, '', 0, ''),
(44, 0, 'weiping12', '05fe7461c607c33229772d402505601016a7d0ea', '0.00', '12345678945', '123@1234.com', NULL, 36, NULL, NULL, 0, '', NULL, NULL, '', 0, ''),
(45, 0, 'weiping17', '05fe7461c607c33229772d402505601016a7d0ea', '0.00', '17878654325', '123@1234.com', NULL, 36, NULL, NULL, 0, '', NULL, NULL, '', 0, ''),
(46, 0, 'weipinglee1234', '601f1889667efaebb33b8c12572835da3f027f78', '0.00', '13423564589', 'werewr@153.cid', NULL, 36, NULL, NULL, 0, '', NULL, NULL, '', 0, ''),
(47, 0, 'weiping987', '7c4a8d09ca3762af61e59520943dc26494f8941b', '0.00', '12398765439', 'werewr@153.cid', 'filefromuser/2016/03/19/20160319112602131.jpg@user', 36, NULL, 1, 0, '', NULL, NULL, '', 0, ''),
(48, 0, 'weipinglee111', '05fe7461c607c33229772d402505601016a7d0ea', '0.00', '15296631253', '', NULL, 0, NULL, NULL, 0, '', NULL, NULL, '', 0, ''),
(49, 0, 'weipingleeqe', '05fe7461c607c33229772d402505601016a7d0ea', '0.00', '15296631254', 'weipoing@163.com', NULL, 0, NULL, NULL, 0, '', NULL, NULL, '', 0, ''),
(50, 0, 'wplee123', '7c4a8d09ca3762af61e59520943dc26494f8941b', '0.00', '15234343434', '', NULL, 0, NULL, NULL, 1, '', NULL, NULL, '', 0, ''),
(51, 1, 'weipinglee567', '05fe7461c607c33229772d402505601016a7d0ea', '0.00', '15296631218', 'weipoing@163.com', NULL, 0, NULL, NULL, 0, '', NULL, NULL, 'otcgk5n1jm3fgar084rd3p5tk1', 0, ''),
(52, 1, 'wwwppp5', '05fe7461c607c33229772d402505601016a7d0ea', '0.00', '15296631543', 'weiping.lee@163.com', NULL, 0, NULL, NULL, 0, '', NULL, NULL, '', 0, ''),
(53, 1, 'wwppp123', '05fe7461c607c33229772d402505601016a7d0ea', '0.00', '15233343433', '123123ee@13.com', NULL, 0, NULL, NULL, 0, '', NULL, NULL, 'ksnubed6u6j8oc461v4juh76c6', 0, ''),
(54, 1, 'wwppp1236', '05fe7461c607c33229772d402505601016a7d0ea', '0.00', '15233343432', '123123ee@13.com', NULL, 0, NULL, NULL, 0, '', NULL, NULL, '', 0, ''),
(55, 1, 'wwwpppqwe', '05fe7461c607c33229772d402505601016a7d0ea', '0.00', '15296631219', '123123ee@13.com', NULL, 0, NULL, NULL, 0, '', NULL, NULL, '', 0, ''),
(56, 1, 'wwwppprty', '05fe7461c607c33229772d402505601016a7d0ea', '0.00', '15296631213', '123123ee@13.com', NULL, 0, NULL, NULL, 0, '', NULL, NULL, 'mq9s5ld8v9jpv11s444rmv1252', 0, ''),
(57, 1, 'wplll', '05fe7461c607c33229772d402505601016a7d0ea', '0.00', '15234561890', 'werfddf@163.com', NULL, 0, NULL, NULL, 0, '', NULL, NULL, 'hr2iq1nvc31nc6t34ct92f8rv4', 0, ''),
(58, 0, 'wplll1289', '05fe7461c607c33229772d402505601016a7d0ea', '0.00', '14234343434', 'sdf@163.com', NULL, 0, NULL, NULL, 0, '', NULL, NULL, '', 0, ''),
(59, 1, 'wplll23456', '05fe7461c607c33229772d402505601016a7d0ea', '0.00', '15230987689', 'weiping@163.com', NULL, 0, NULL, NULL, 0, '', NULL, NULL, '9f7ugduin3ie4upddb66s7ll71', 0, ''),
(60, 1, 'wplee123456', '05fe7461c607c33229772d402505601016a7d0ea', '0.00', '15298765674', '', NULL, 0, NULL, NULL, 0, '', NULL, NULL, 'fcja1l8i2or3fj0ra5osjvtrc4', 0, '');

-- --------------------------------------------------------

--
-- 表的结构 `user_account`
--

CREATE TABLE IF NOT EXISTS `user_account` (
  `user_id` int(11) NOT NULL COMMENT '用户id',
  `fund` decimal(12,2) NOT NULL DEFAULT '0.00' COMMENT '代理账户资金总额',
  `freeze` decimal(12,2) NOT NULL DEFAULT '0.00' COMMENT '代理账户冻结资金',
  `ticket` decimal(12,2) NOT NULL DEFAULT '0.00' COMMENT '票据账户',
  `ticket_freeze` decimal(12,2) NOT NULL DEFAULT '0.00' COMMENT '票据账户冻结',
  `credit` decimal(12,2) NOT NULL DEFAULT '0.00' COMMENT '信誉保证金账户',
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `user_account`
--

INSERT INTO `user_account` (`user_id`, `fund`, `freeze`, `ticket`, `ticket_freeze`, `credit`) VALUES
(28, '140.00', '0.00', '0.00', '0.00', '0.00'),
(32, '8783.00', '1235.00', '0.00', '0.00', '0.00'),
(36, '528.20', '4568.80', '0.00', '0.00', '0.00'),
(56, '390.00', '0.00', '0.00', '0.00', '0.00'),
(57, '997016.00', '2924.00', '0.00', '0.00', '0.00'),
(58, '990.00', '0.00', '0.00', '0.00', '0.00'),
(59, '1164.00', '22.00', '0.00', '0.00', '0.00'),
(60, '994.03', '5.97', '0.00', '0.00', '0.00');

-- --------------------------------------------------------

--
-- 表的结构 `user_bank`
--

CREATE TABLE IF NOT EXISTS `user_bank` (
  `user_id` int(11) NOT NULL COMMENT '用户id',
  `bank_name` varchar(50) NOT NULL COMMENT '银行名称',
  `card_type` int(2) NOT NULL DEFAULT '1' COMMENT '1,借记卡，2：信用卡',
  `card_no` varchar(50) NOT NULL COMMENT '卡号',
  `true_name` varchar(20) NOT NULL COMMENT '姓名',
  `identify_no` varchar(25) NOT NULL COMMENT '身份证号',
  `proof` varchar(100) NOT NULL COMMENT '打款凭证',
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `user_bank`
--

INSERT INTO `user_bank` (`user_id`, `bank_name`, `card_type`, `card_no`, `true_name`, `identify_no`, `proof`) VALUES
(36, '中国银行', 1, '12312312312312313', '赵 看二', '123324234234234', 'upload/2016/05/16/20160516164002531.jpg@user'),
(56, '中国银行', 1, '123123423423423432', '第三方', '140311198301272118', 'upload/2016/06/01/20160601152502947.jpg@user'),
(57, '中国', 1, '12342343424234234234', '第三方', '14234343434343434', 'upload/2016/06/02/20160602145553172.jpg@user'),
(58, '建设银行', 1, '34234242342424234234', '李卫平', '140311198301272118', 'upload/2016/06/02/20160602174741458.jpg@user'),
(59, '中国银行', 1, '1232222222222222222222', '李卫平', '140311198301272118', 'upload/2016/06/03/20160603110933496.jpg@user');

-- --------------------------------------------------------

--
-- 表的结构 `user_fund_flow`
--

CREATE TABLE IF NOT EXISTS `user_fund_flow` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL COMMENT '交易的用户id',
  `acc_type` int(2) NOT NULL COMMENT '账户类型，1：代理账户，2：签约，3:票据',
  `flow_no` varchar(50) NOT NULL COMMENT '交易流水号',
  `fund_in` decimal(12,2) NOT NULL COMMENT '收入',
  `fund_out` decimal(12,2) NOT NULL COMMENT '支出',
  `freeze` decimal(12,2) NOT NULL COMMENT '冻结,负数代表解冻',
  `total` decimal(12,2) NOT NULL COMMENT '总金额',
  `active` decimal(12,2) NOT NULL COMMENT '可用余额',
  `note` varchar(255) NOT NULL COMMENT '摘要',
  `time` datetime NOT NULL COMMENT '交易时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=147 ;

--
-- 转存表中的数据 `user_fund_flow`
--

INSERT INTO `user_fund_flow` (`id`, `user_id`, `acc_type`, `flow_no`, `fund_in`, `fund_out`, `freeze`, `total`, `active`, `note`, `time`) VALUES
(47, 28, 1, '20160422094247199069', '10.00', '0.00', '0.00', '40.00', '40.00', '', '2016-04-22 09:42:47'),
(48, 32, 1, '20160422094247451672', '0.00', '10.00', '-10.00', '87.00', '72.00', '', '2016-04-22 09:42:47'),
(49, 28, 1, '20160422094459114996', '10.00', '0.00', '0.00', '40.00', '40.00', '', '2016-04-22 09:44:59'),
(50, 32, 1, '20160422094459920541', '0.00', '10.00', '-10.00', '77.00', '72.00', '', '2016-04-22 09:44:59'),
(51, 32, 1, '20160422094538848388', '10.00', '0.00', '0.00', '87.00', '82.00', '', '2016-04-22 09:45:38'),
(52, 28, 1, '20160422094558338430', '10.00', '0.00', '0.00', '50.00', '50.00', '', '2016-04-22 09:45:58'),
(53, 28, 1, '20160428090408212033', '10.00', '0.00', '0.00', '60.00', '60.00', '', '2016-04-28 09:04:08'),
(54, 32, 1, '20160429102703870223', '0.00', '0.00', '12.30', '87.00', '69.70', '', '2016-04-29 10:27:03'),
(55, 36, 1, '20160429103856266607', '0.00', '0.00', '1.00', '1000.00', '999.00', '', '2016-04-29 10:38:56'),
(56, 32, 1, '20160429104811441262', '0.00', '0.00', '1217.70', '10018.00', '8783.00', '', '2016-04-29 10:48:11'),
(59, 36, 1, '20160506083545391137', '100.00', '0.00', '0.00', '1100.00', '1099.00', '', '2016-05-06 08:35:45'),
(60, 36, 1, '20160506101728969046', '90.00', '0.00', '0.00', '1190.00', '1189.00', '', '2016-05-06 10:17:28'),
(61, 28, 1, '20160510103108720343', '10.00', '0.00', '0.00', '70.00', '70.00', '', '2016-05-10 10:31:08'),
(62, 28, 1, '20160510110453518798', '10.00', '0.00', '0.00', '80.00', '80.00', '', '2016-05-10 11:04:53'),
(63, 28, 1, '20160510122808289514', '10.00', '0.00', '0.00', '90.00', '90.00', '', '2016-05-10 12:28:08'),
(64, 36, 1, '20160510140527979180', '0.00', '0.00', '400.00', '1190.00', '789.00', '', '2016-05-10 14:05:27'),
(65, 36, 1, '20160510141229489657', '0.00', '0.00', '40.00', '1190.00', '749.00', '', '2016-05-10 14:12:29'),
(66, 36, 1, '20160510141644388775', '0.00', '0.00', '400.00', '1190.00', '349.00', '', '2016-05-10 14:16:44'),
(67, 36, 1, '20160510144331609161', '0.00', '0.00', '1.00', '1190.00', '348.00', '', '2016-05-10 14:43:31'),
(68, 36, 1, '20160510162424887857', '0.00', '1.00', '-1.00', '1189.00', '348.00', '', '2016-05-10 16:24:24'),
(69, 36, 1, '20160510162630385699', '0.00', '0.00', '200.00', '1189.00', '148.00', '', '2016-05-10 16:26:30'),
(70, 36, 1, '20160510162725857781', '0.00', '200.00', '-200.00', '989.00', '148.00', '', '2016-05-10 16:27:25'),
(75, 36, 1, '20160511112748311706', '0.00', '0.00', '360.00', '1989.00', '788.00', '', '2016-05-11 11:27:48'),
(76, 36, 1, '20160511132815232357', '0.00', '0.00', '360.00', '1989.00', '428.00', '', '2016-05-11 13:28:15'),
(77, 36, 1, '20160511133610245568', '0.00', '0.00', '360.00', '1989.00', '68.00', '', '2016-05-11 13:36:10'),
(78, 28, 1, '20160511140215734240', '10.00', '0.00', '0.00', '100.00', '100.00', '', '2016-05-11 14:02:15'),
(79, 28, 1, '20160511140541400942', '10.00', '0.00', '0.00', '110.00', '110.00', '', '2016-05-11 14:05:41'),
(80, 28, 1, '20160511140953112661', '10.00', '0.00', '0.00', '120.00', '120.00', '', '2016-05-11 14:09:53'),
(81, 28, 1, '20160511141341560162', '10.00', '0.00', '0.00', '130.00', '130.00', '', '2016-05-11 14:13:41'),
(82, 28, 1, '20160511142025124884', '10.00', '0.00', '0.00', '140.00', '140.00', '', '2016-05-11 14:20:25'),
(83, 36, 1, '20160516092509249716', '0.00', '0.00', '105.80', '3089.00', '1062.20', '', '2016-05-16 09:25:09'),
(84, 36, 1, '20160516172026900738', '2.00', '0.00', '0.00', '3091.00', '1064.20', '', '2016-05-16 17:20:26'),
(85, 36, 1, '20160520172645177261', '0.00', '0.00', '100.00', '3091.00', '964.20', '', '2016-05-20 17:26:45'),
(86, 36, 1, '20160520172651499023', '0.00', '0.00', '100.00', '3091.00', '864.20', '', '2016-05-20 17:26:51'),
(87, 36, 1, '20160520172652603585', '0.00', '0.00', '100.00', '3091.00', '764.20', '', '2016-05-20 17:26:52'),
(88, 36, 1, '20160520172653207501', '0.00', '0.00', '100.00', '3091.00', '664.20', '', '2016-05-20 17:26:53'),
(89, 36, 1, '20160520173145656814', '0.00', '0.00', '100.00', '3091.00', '564.20', '', '2016-05-20 17:31:45'),
(90, 36, 1, '20160520174917680902', '0.00', '0.00', '0.00', '3091.00', '564.20', '', '2016-05-20 17:49:17'),
(91, 36, 1, '20160520175046908264', '0.00', '0.00', '0.00', '3091.00', '564.20', '', '2016-05-20 17:50:46'),
(92, 36, 1, '20160520175441901644', '0.00', '0.00', '24.00', '3091.00', '540.20', '', '2016-05-20 17:54:41'),
(93, 36, 1, '20160520175540641873', '0.00', '24.00', '-24.00', '3067.00', '540.20', '', '2016-05-20 17:55:40'),
(95, 56, 1, '20160601151056517727', '100.00', '0.00', '0.00', '100.00', '100.00', '', '2016-06-01 15:10:56'),
(96, 56, 1, '20160601151205261938', '100.00', '0.00', '0.00', '200.00', '200.00', '', '2016-06-01 15:12:05'),
(97, 56, 1, '20160601152905284680', '0.00', '0.00', '10.00', '200.00', '190.00', '', '2016-06-01 15:29:05'),
(98, 56, 1, '20160601153314872448', '0.00', '10.00', '-10.00', '190.00', '190.00', '', '2016-06-01 15:33:14'),
(99, 56, 1, '20160601153407202337', '200.00', '0.00', '0.00', '390.00', '390.00', '', '2016-06-01 15:34:07'),
(100, 36, 1, '20160601172204761953', '0.00', '0.00', '20.00', '3067.00', '520.20', '', '2016-06-01 17:22:04'),
(101, 36, 1, '20160601172233506741', '0.00', '20.00', '-20.00', '3047.00', '520.20', '', '2016-06-01 17:22:33'),
(102, 36, 1, '20160601172326762063', '0.00', '0.00', '20.00', '3047.00', '500.20', '', '2016-06-01 17:23:26'),
(103, 36, 1, '20160601172348840231', '0.00', '0.00', '-20.00', '3047.00', '520.20', '', '2016-06-01 17:23:48'),
(104, 36, 1, '20160602112259227770', '0.00', '0.00', '0.00', '3047.00', '520.20', '', '2016-06-02 11:22:59'),
(105, 57, 1, '20160602145252663955', '1000.00', '0.00', '0.00', '1000.00', '1000.00', '', '2016-06-02 14:52:52'),
(106, 57, 1, '20160602145613661758', '0.00', '0.00', '10.00', '1000.00', '990.00', '', '2016-06-02 14:56:13'),
(107, 57, 1, '20160602145647910186', '0.00', '10.00', '-10.00', '990.00', '990.00', '', '2016-06-02 14:56:47'),
(108, 57, 1, '20160602150813459719', '1000000.00', '0.00', '0.00', '1000990.00', '1000990.00', '', '2016-06-02 15:08:13'),
(109, 57, 1, '20160602152836541815', '0.00', '0.00', '24.00', '1000990.00', '1000966.00', '', '2016-06-02 15:28:36'),
(110, 57, 1, '20160602153550469113', '0.00', '0.00', '3.00', '1000990.00', '1000963.00', '', '2016-06-02 15:35:50'),
(111, 36, 1, '20160602153647215988', '0.00', '0.00', '14.94', '3047.00', '505.26', '', '2016-06-02 15:36:47'),
(112, 57, 1, '20160602153729101373', '0.00', '0.00', '147.00', '1000990.00', '1000816.00', '', '2016-06-02 15:37:29'),
(113, 36, 1, '20160602161042305746', '30.00', '0.00', '0.00', '3077.00', '535.26', '', '2016-06-02 16:10:42'),
(114, 57, 1, '20160602161042210742', '0.00', '30.00', '-30.00', '1000960.00', '1000816.00', '', '2016-06-02 16:10:42'),
(115, 36, 1, '20160602161112106536', '0.00', '0.00', '-14.94', '3077.00', '550.20', '', '2016-06-02 16:11:12'),
(116, 36, 1, '20160602161112279708', '20.00', '0.00', '0.00', '3097.00', '570.20', '', '2016-06-02 16:11:12'),
(117, 57, 1, '20160602161112353894', '0.00', '20.00', '-20.00', '1000940.00', '1000816.00', '', '2016-06-02 16:11:12'),
(118, 57, 1, '20160602161112269766', '0.00', '0.00', '-100.00', '1000940.00', '1000916.00', '', '2016-06-02 16:11:12'),
(119, 36, 1, '20160602163133306076', '0.00', '0.00', '20.00', '3097.00', '550.20', '', '2016-06-02 16:31:33'),
(120, 58, 1, '20160602174640597241', '1000.00', '0.00', '0.00', '1000.00', '1000.00', '', '2016-06-02 17:46:40'),
(121, 58, 1, '20160602174806993106', '0.00', '0.00', '10.00', '1000.00', '990.00', '', '2016-06-02 17:48:06'),
(122, 58, 1, '20160602174836168472', '0.00', '10.00', '-10.00', '990.00', '990.00', '', '2016-06-02 17:48:36'),
(123, 57, 1, '20160603082132304592', '0.00', '0.00', '38.00', '1000940.00', '1000878.00', '', '2016-06-03 08:21:32'),
(124, 57, 1, '20160603082324138507', '0.00', '0.00', '1862.00', '1000940.00', '999016.00', '', '2016-06-03 08:23:24'),
(125, 36, 1, '20160603082826982971', '0.00', '0.00', '22.00', '3097.00', '528.20', '', '2016-06-03 08:28:26'),
(126, 59, 1, '20160603103057974072', '1000.00', '0.00', '0.00', '1000.00', '1000.00', '', '2016-06-03 10:30:57'),
(127, 59, 1, '20160603103416614682', '0.00', '0.00', '14.00', '1000.00', '986.00', '', '2016-06-03 10:34:16'),
(128, 59, 1, '20160603103457457632', '0.00', '14.00', '-14.00', '986.00', '986.00', '', '2016-06-03 10:34:57'),
(129, 57, 1, '20160603105026714959', '0.00', '0.00', '20.00', '1000940.00', '998996.00', '', '2016-06-03 10:50:26'),
(130, 59, 1, '20160603105152634732', '0.00', '0.00', '39.84', '986.00', '946.16', '', '2016-06-03 10:51:52'),
(131, 57, 1, '20160603105247309262', '0.00', '0.00', '980.00', '1000940.00', '998016.00', '', '2016-06-03 10:52:47'),
(132, 59, 1, '20160603105843193988', '600.00', '0.00', '0.00', '1586.00', '1546.16', '', '2016-06-03 10:58:43'),
(133, 57, 1, '20160603105843136886', '0.00', '600.00', '-600.00', '1000340.00', '998016.00', '', '2016-06-03 10:58:43'),
(134, 59, 1, '20160603110010115133', '0.00', '0.00', '-39.84', '1586.00', '1586.00', '', '2016-06-03 11:00:10'),
(135, 59, 1, '20160603110010977697', '400.00', '0.00', '0.00', '1986.00', '1986.00', '', '2016-06-03 11:00:10'),
(136, 57, 1, '20160603110010876870', '0.00', '400.00', '-400.00', '999940.00', '998016.00', '', '2016-06-03 11:00:10'),
(137, 57, 1, '20160603110604470156', '0.00', '0.00', '20.00', '999940.00', '997996.00', '', '2016-06-03 11:06:04'),
(138, 57, 1, '20160603110657267733', '0.00', '0.00', '980.00', '999940.00', '997016.00', '', '2016-06-03 11:06:57'),
(139, 59, 1, '20160603110735686148', '0.00', '0.00', '22.00', '1986.00', '1964.00', '', '2016-06-03 11:07:35'),
(140, 59, 1, '20160603111031345928', '0.00', '0.00', '800.00', '1986.00', '1164.00', '', '2016-06-03 11:10:31'),
(141, 59, 1, '20160603111105900875', '0.00', '800.00', '-800.00', '1186.00', '1164.00', '', '2016-06-03 11:11:05'),
(142, 36, 1, '20160606093141292755', '2000.00', '0.00', '0.00', '5097.00', '2528.20', '', '2016-06-06 09:31:41'),
(143, 36, 1, '20160606093145129580', '0.00', '0.00', '40.00', '5097.00', '2488.20', '', '2016-06-06 09:31:45'),
(144, 36, 1, '20160606093357901782', '0.00', '0.00', '1960.00', '5097.00', '528.20', '', '2016-06-06 09:33:57'),
(145, 60, 1, '20160606094000646295', '1000.00', '0.00', '0.00', '1000.00', '1000.00', '', '2016-06-06 09:40:00'),
(146, 60, 1, '20160606094022657693', '0.00', '0.00', '5.97', '1000.00', '994.03', '', '2016-06-06 09:40:22');

-- --------------------------------------------------------

--
-- 表的结构 `user_group`
--

CREATE TABLE IF NOT EXISTS `user_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `group_name` varchar(20) DEFAULT NULL COMMENT '会员组名称',
  `credit` int(11) NOT NULL COMMENT '信誉值分界线',
  `icon` varchar(255) NOT NULL COMMENT '分组图标',
  `caution_fee` int(3) NOT NULL COMMENT '保证金比率，0-100数',
  `free_fee` int(3) NOT NULL COMMENT '自由报盘费用比率',
  `depute_fee` int(3) NOT NULL COMMENT '委托报盘手续费比率',
  `create_time` datetime NOT NULL COMMENT '创建日期',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=6 ;

--
-- 转存表中的数据 `user_group`
--

INSERT INTO `user_group` (`id`, `group_name`, `credit`, `icon`, `caution_fee`, `free_fee`, `depute_fee`, `create_time`) VALUES
(1, '金牌用户', 500, 'upload/2016/04/18/20160418164725558.png@admin', 90, 80, 70, '2016-04-18 16:47:40'),
(2, '银牌会员', 400, 'upload/2016/05/18/20160518100649209.jpg@admin', 50, 30, 10, '2016-05-18 10:07:02'),
(3, '铜牌', 300, 'upload/2016/05/18/20160518100724258.jpg@admin', 30, 20, 17, '2016-05-18 10:07:34'),
(4, '铁牌会员', 200, 'upload/2016/05/18/20160518100757961.jpg@admin', 20, 18, 15, '2016-05-18 10:08:03'),
(5, '普通会员', 0, 'upload/2016/05/18/20160518100827881.jpg@admin', 12, 14, 14, '2016-05-18 10:08:31');

-- --------------------------------------------------------

--
-- 表的结构 `user_invoice`
--

CREATE TABLE IF NOT EXISTS `user_invoice` (
  `user_id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '用户id',
  `title` varchar(50) COLLATE utf8_romanian_ci NOT NULL COMMENT '发票抬头',
  `tax_no` varchar(50) COLLATE utf8_romanian_ci NOT NULL COMMENT '税人识别号',
  `address` varchar(100) COLLATE utf8_romanian_ci NOT NULL COMMENT '地址',
  `phone` varchar(15) COLLATE utf8_romanian_ci NOT NULL COMMENT '电话',
  `bank_name` varchar(40) COLLATE utf8_romanian_ci NOT NULL COMMENT '银行名称',
  `bank_no` varchar(50) COLLATE utf8_romanian_ci NOT NULL COMMENT '银行卡号',
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_romanian_ci COMMENT='开票信息表' AUTO_INCREMENT=37 ;

--
-- 转存表中的数据 `user_invoice`
--

INSERT INTO `user_invoice` (`user_id`, `title`, `tax_no`, `address`, `phone`, `bank_name`, `bank_no`) VALUES
(9, '水电费', '1234234', '123123', '1231324234', '123123', '123123'),
(36, '水电费df', '2132134', '234234', '234234', '234234', '234234234');

-- --------------------------------------------------------

--
-- 表的结构 `user_session`
--

CREATE TABLE IF NOT EXISTS `user_session` (
  `session_id` varchar(255) NOT NULL,
  `session_expire` int(11) NOT NULL,
  `session_data` text,
  UNIQUE KEY `session_id` (`session_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `user_session`
--

INSERT INTO `user_session` (`session_id`, `session_expire`, `session_data`) VALUES
('nufu375e4778rm15k9mtug6gr2', 1465353204, 'a:4:{s:7:"user_id";s:2:"36";s:8:"username";s:10:"weipinglee";s:6:"mobile";s:11:"16767676767";s:9:"user_type";s:1:"1";}');

-- --------------------------------------------------------

--
-- 表的结构 `withdraw_request`
--

CREATE TABLE IF NOT EXISTS `withdraw_request` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL COMMENT '用户id',
  `request_no` varchar(50) NOT NULL COMMENT '订单号',
  `amount` decimal(10,2) NOT NULL COMMENT '提现金额',
  `acc_name` varchar(20) NOT NULL COMMENT '开户名',
  `bank_name` varchar(50) NOT NULL COMMENT '银行',
  `back_card` varchar(40) NOT NULL COMMENT '银行卡号',
  `note` varchar(255) NOT NULL DEFAULT '' COMMENT '提现说明',
  `status` tinyint(2) NOT NULL DEFAULT '0' COMMENT '申请状态',
  `create_time` datetime DEFAULT NULL COMMENT '申请时间',
  `first_time` datetime DEFAULT NULL COMMENT '初审时间',
  `first_message` text COMMENT '初审意见',
  `final_time` datetime DEFAULT NULL COMMENT '终审时间',
  `final_message` text COMMENT '终审意见',
  `proot` varchar(100) NOT NULL DEFAULT '' COMMENT '后台打款凭证',
  `is_del` tinyint(2) NOT NULL DEFAULT '0' COMMENT '0:未删除，1：删除,默认0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=10 ;

--
-- 转存表中的数据 `withdraw_request`
--

INSERT INTO `withdraw_request` (`id`, `user_id`, `request_no`, `amount`, `acc_name`, `bank_name`, `back_card`, `note`, `status`, `create_time`, `first_time`, `first_message`, `final_time`, `final_message`, `proot`, `is_del`) VALUES
(1, 36, 'gold_20160510140527391494', '400.00', '123', '建设银行', '123324234234', '', 1, '2016-05-10 14:05:27', '2016-05-10 15:23:06', '', '2016-05-10 15:23:10', '', 'upload/2016/05/10/20160510152348616.jpg@admin', 0),
(2, 36, 'gold_20160510141229526983', '40.00', '123', '建设银行', '123324234234', '', 1, '2016-05-10 14:12:29', '2016-05-10 15:16:29', '', '2016-05-10 15:16:33', '', 'upload/2016/05/10/20160510151837658.jpg@admin', 0),
(3, 36, 'gold_20160510141644779312', '400.00', '123', '建设银行', '123324234234', '', 5, '2016-05-10 14:16:44', '2016-05-10 14:57:59', '', '2016-05-10 14:58:10', '', '', 1),
(4, 36, 'gold_20160510144331144522', '1.00', 'hhh', '建设银行', '23445354', '', 1, '2016-05-10 14:43:31', '2016-05-10 15:01:31', '', '2016-05-10 15:02:32', '', 'upload/2016/05/10/20160510162015592.jpg', 0),
(5, 36, 'gold_20160510162629806118', '200.00', '李卫平', '建设银行', '123123123123', '', 1, '2016-05-10 16:26:30', '2016-05-10 16:27:11', '', '2016-05-10 16:27:16', '', 'upload/2016/05/10/20160510162724361.jpg@admin', 0),
(6, 56, 'gold_20160601152905882858', '10.00', '', '', '', '看看', 1, '2016-06-01 15:29:05', '2016-06-01 15:32:29', '', '2016-06-01 15:32:48', '', 'upload/2016/06/01/20160601153312702.jpg@admin', 0),
(7, 57, 'gold_20160602145613795104', '10.00', '', '', '', '', 1, '2016-06-02 14:56:13', '2016-06-02 14:56:22', '', '2016-06-02 14:56:33', '', 'upload/2016/06/02/20160602145643463.jpg@admin', 0),
(8, 58, 'gold_20160602174806736218', '10.00', '', '', '', '', 1, '2016-06-02 17:48:06', '2016-06-02 17:48:17', '', '2016-06-02 17:48:23', '', 'upload/2016/06/02/20160602174834380.jpg@admin', 0),
(9, 59, 'gold_20160603111031895547', '800.00', '', '', '', '', 1, '2016-06-03 11:10:31', '2016-06-03 11:10:45', '', '2016-06-03 11:10:52', '', 'upload/2016/06/03/20160603111104705.jpg@admin', 0);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
create table `slide`(
  `id` int(11) unsigned not null auto_increment,
  `name` varchar(25) not null default '' comment '幻灯片名称',
  `img` varchar(100) not null default '' comment '图片',
  `link` varchar(100) not null default '' comment '链接地址',
  `status` tinyint(2) not null default 1 comment '1开启 0关闭',
  `order` int(5) not null default 100 comment '排序',
  primary key(`id`)
)engine=innodb charset=utf8;
create table `friendly_link`(
  `id` int(11) unsigned not null auto_increment,
  `name` varchar(25) not null default '' comment '名称',
  `link` varchar(100) not null default '' comment '链接地址',
  `order` int(5) not null default 100 comment '排序',
  `status` tinyint(2) not null default 1 comment '1开启，0关闭',
  primary key(`id`)
)engine=innodb charset=utf8;

CREATE TABLE IF NOT EXISTS `help_category` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(10) NOT NULL COMMENT '标题',
  `sort` smallint(5) NOT NULL COMMENT '顺序',
  `status` tinyint(2) not null default 1 comment '0关闭 1开启',
  PRIMARY KEY (`id`),
  KEY `sort` (`sort`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='帮助分类' ;
CREATE TABLE IF NOT EXISTS `help` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `cat_id` int(11) unsigned NOT NULL COMMENT '帮助分类，如果为0则代表着是下面的帮助单页',
  `sort` smallint(5) NOT NULL DEFAULT '99' COMMENT '顺序',
  `name` varchar(50) NOT NULL COMMENT '标题',
  `content` text NOT NULL COMMENT '内容',
  `time` datetime  NOT NULL default NOW()  comment '发布时间',
  `link` varchar(100) NOT NULL default '',
  PRIMARY KEY (`id`),
  KEY `cat_id` (`cat_id`),
  KEY `sort` (`sort`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='帮助内容' ;