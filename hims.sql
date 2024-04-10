/*
Navicat MySQL Data Transfer

Source Server         : localhost
Source Server Version : 80025
Source Host           : localhost:3306
Source Database       : hims

Target Server Type    : MYSQL
Target Server Version : 80025
File Encoding         : 65001

Date: 2021-09-04 18:13:02
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for bed
-- ----------------------------
DROP TABLE IF EXISTS `bed`;
CREATE TABLE `bed` (
  `bedId` int(10) unsigned zerofill NOT NULL AUTO_INCREMENT,
  `ward` int DEFAULT NULL,
  `bedNo` int DEFAULT NULL,
  `state` int DEFAULT NULL,
  PRIMARY KEY (`bedId`)
) ENGINE=InnoDB AUTO_INCREMENT=308 DEFAULT CHARSET=utf8mb3;

-- ----------------------------
-- Records of bed
-- ----------------------------
INSERT INTO `bed` VALUES ('0000000256', '101', '10101', '0');
INSERT INTO `bed` VALUES ('0000000257', '102', '10201', '0');
INSERT INTO `bed` VALUES ('0000000258', '102', '10202', '0');
INSERT INTO `bed` VALUES ('0000000259', '103', '10301', '1');
INSERT INTO `bed` VALUES ('0000000260', '103', '10302', '0');
INSERT INTO `bed` VALUES ('0000000261', '103', '10303', '0');
INSERT INTO `bed` VALUES ('0000000262', '103', '10304', '0');
INSERT INTO `bed` VALUES ('0000000263', '104', '10401', '0');
INSERT INTO `bed` VALUES ('0000000264', '105', '10501', '0');
INSERT INTO `bed` VALUES ('0000000265', '106', '10601', '0');
INSERT INTO `bed` VALUES ('0000000266', '106', '10602', '0');
INSERT INTO `bed` VALUES ('0000000267', '107', '10701', '0');
INSERT INTO `bed` VALUES ('0000000268', '107', '10702', '0');
INSERT INTO `bed` VALUES ('0000000269', '107', '10703', '0');
INSERT INTO `bed` VALUES ('0000000270', '107', '10704', '0');
INSERT INTO `bed` VALUES ('0000000271', '108', '10801', '0');
INSERT INTO `bed` VALUES ('0000000272', '201', '20101', '0');
INSERT INTO `bed` VALUES ('0000000273', '201', '20102', '0');
INSERT INTO `bed` VALUES ('0000000274', '201', '20103', '0');
INSERT INTO `bed` VALUES ('0000000275', '201', '20104', '0');
INSERT INTO `bed` VALUES ('0000000276', '202', '20201', '0');
INSERT INTO `bed` VALUES ('0000000277', '202', '20202', '0');
INSERT INTO `bed` VALUES ('0000000278', '203', '20301', '0');
INSERT INTO `bed` VALUES ('0000000279', '204', '20401', '0');
INSERT INTO `bed` VALUES ('0000000280', '301', '30101', '0');
INSERT INTO `bed` VALUES ('0000000281', '301', '30102', '0');
INSERT INTO `bed` VALUES ('0000000282', '301', '30103', '0');
INSERT INTO `bed` VALUES ('0000000283', '301', '30104', '0');
INSERT INTO `bed` VALUES ('0000000284', '302', '30201', '0');
INSERT INTO `bed` VALUES ('0000000285', '302', '30202', '1');
INSERT INTO `bed` VALUES ('0000000286', '303', '30301', '0');
INSERT INTO `bed` VALUES ('0000000287', '304', '30401', '1');
INSERT INTO `bed` VALUES ('0000000288', '401', '40101', '0');
INSERT INTO `bed` VALUES ('0000000289', '402', '40201', '1');
INSERT INTO `bed` VALUES ('0000000290', '402', '40202', '0');
INSERT INTO `bed` VALUES ('0000000291', '403', '40301', '0');
INSERT INTO `bed` VALUES ('0000000292', '501', '50101', '1');
INSERT INTO `bed` VALUES ('0000000293', '502', '50201', '0');
INSERT INTO `bed` VALUES ('0000000294', '503', '50301', '0');
INSERT INTO `bed` VALUES ('0000000295', '503', '50302', '0');
INSERT INTO `bed` VALUES ('0000000296', '503', '50303', '0');
INSERT INTO `bed` VALUES ('0000000297', '503', '50304', '0');
INSERT INTO `bed` VALUES ('0000000298', '504', '50401', '0');
INSERT INTO `bed` VALUES ('0000000299', '504', '50402', '0');
INSERT INTO `bed` VALUES ('0000000300', '505', '50501', '0');
INSERT INTO `bed` VALUES ('0000000301', '601', '60101', '1');
INSERT INTO `bed` VALUES ('0000000302', '506', '50601', '0');
INSERT INTO `bed` VALUES ('0000000303', '506', '50602', '0');
INSERT INTO `bed` VALUES ('0000000304', '506', '50603', '1');
INSERT INTO `bed` VALUES ('0000000305', '506', '50604', '1');
INSERT INTO `bed` VALUES ('0000000306', '502', '50202', '1');
INSERT INTO `bed` VALUES ('0000000307', '502', '50203', '0');

-- ----------------------------
-- Table structure for category
-- ----------------------------
DROP TABLE IF EXISTS `category`;
CREATE TABLE `category` (
  `id` int NOT NULL AUTO_INCREMENT,
  `type` int DEFAULT NULL,
  `name` varchar(20) DEFAULT NULL,
  `price` float DEFAULT '0',
  `updateTime` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=utf8mb3;

-- ----------------------------
-- Records of category
-- ----------------------------
INSERT INTO `category` VALUES ('24', '1', 'VIP(1人)', '1286', '2021-08-25 09:49:19');
INSERT INTO `category` VALUES ('25', '2', '高等(2人)', '250', '2021-08-25 09:46:06');
INSERT INTO `category` VALUES ('26', '3', '初级(4人)', '180', '2019-04-25 00:00:00');
INSERT INTO `category` VALUES ('27', '4', '重症监护室(ICU_1人)', '3000', '2021-08-25 14:51:22');

-- ----------------------------
-- Table structure for cost
-- ----------------------------
DROP TABLE IF EXISTS `cost`;
CREATE TABLE `cost` (
  `Id` varchar(20) NOT NULL,
  `patientId` varchar(20) DEFAULT NULL,
  `account` float DEFAULT NULL,
  `type` varchar(10) DEFAULT NULL,
  `userId` varchar(20) DEFAULT NULL,
  `costTime` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- ----------------------------
-- Records of cost
-- ----------------------------
INSERT INTO `cost` VALUES ('485098712050171904', '484668607406538752', '100', '现金', 'service', '2021-08-31 14:49:05');
INSERT INTO `cost` VALUES ('485098794673766400', '484668607406538752', '100', '现金', 'service', '2021-08-31 14:49:25');
INSERT INTO `cost` VALUES ('485122915306569728', '485113494627155968', '1000', '现金', 'manager', '2021-08-31 16:25:16');
INSERT INTO `cost` VALUES ('485130135003987968', '485113494627155968', '10000', '现金', 'manager', '2021-08-31 16:53:57');
INSERT INTO `cost` VALUES ('485381163150475264', '485378416191733760', '10000', '现金', 'manager', '2021-09-01 09:31:27');
INSERT INTO `cost` VALUES ('485488484820189184', '1555923323591', '10000', '现金', 'manager', '2021-09-01 16:37:54');
INSERT INTO `cost` VALUES ('485489022215389184', '484670245978505216', '10000', '现金', 'manager', '2021-09-01 16:40:02');
INSERT INTO `cost` VALUES ('485489031895842816', '484670245978505216', '10000', '现金', 'manager', '2021-09-01 16:40:05');
INSERT INTO `cost` VALUES ('485489640178974720', '485113494627155968', '1111', '现金', 'manager', '2021-09-01 16:42:30');
INSERT INTO `cost` VALUES ('485490749731766272', '1556762747114', '1111', '现金', 'manager', '2021-09-01 16:46:54');
INSERT INTO `cost` VALUES ('485493346752528384', '1557287431528', '1111', '现金', 'manager', '2021-09-01 16:57:13');

-- ----------------------------
-- Table structure for doctor
-- ----------------------------
DROP TABLE IF EXISTS `doctor`;
CREATE TABLE `doctor` (
  `doctorId` int(6) unsigned zerofill NOT NULL AUTO_INCREMENT,
  `gender` int NOT NULL,
  `doctor_department` int NOT NULL,
  `name` varchar(10) NOT NULL,
  `doctor_title` int NOT NULL,
  `working_time` date DEFAULT NULL,
  `state` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`doctorId`)
) ENGINE=InnoDB AUTO_INCREMENT=44 DEFAULT CHARSET=utf8mb3;

-- ----------------------------
-- Records of doctor
-- ----------------------------
INSERT INTO `doctor` VALUES ('000026', '1', '1', '李华佗', '4', '2015-02-05', '1');
INSERT INTO `doctor` VALUES ('000027', '1', '1', '张仲景', '4', '2015-06-01', '1');
INSERT INTO `doctor` VALUES ('000028', '2', '1', '刘珊珊', '1', '2018-02-01', '0');
INSERT INTO `doctor` VALUES ('000029', '2', '2', '刘文程', '2', '2017-06-24', '0');
INSERT INTO `doctor` VALUES ('000030', '1', '3', '刘正坤', '3', '2014-01-31', '0');
INSERT INTO `doctor` VALUES ('000031', '1', '2', '王刘涛', '1', '2019-04-22', '0');
INSERT INTO `doctor` VALUES ('000032', '2', '3', '石晓英', '4', '2014-10-10', '0');
INSERT INTO `doctor` VALUES ('000033', '2', '4', '李飞飞', '1', '2019-01-01', '1');
INSERT INTO `doctor` VALUES ('000034', '1', '4', '巴巴纳吉', '2', '2018-10-03', '0');
INSERT INTO `doctor` VALUES ('000035', '1', '7', '李时珍', '4', '2016-06-01', '0');
INSERT INTO `doctor` VALUES ('000036', '2', '5', '欧阳御程', '3', '2014-06-12', '0');
INSERT INTO `doctor` VALUES ('000037', '2', '5', '刘采薇', '1', '2019-04-22', '0');
INSERT INTO `doctor` VALUES ('000038', '1', '5', '刘玉峰', '2', '2018-05-09', '0');
INSERT INTO `doctor` VALUES ('000039', '1', '5', '邢枭龙', '4', '2017-07-10', '0');
INSERT INTO `doctor` VALUES ('000040', '1', '8', '刘二狗', '3', '2021-08-25', '0');
INSERT INTO `doctor` VALUES ('000041', '1', '3', '王小明', '1', '2021-08-25', '0');
INSERT INTO `doctor` VALUES ('000042', '2', '6', '胡子号', '4', '2021-08-25', '0');
INSERT INTO `doctor` VALUES ('000043', '2', '6', '刘子豪', '2', '2021-08-25', '0');

-- ----------------------------
-- Table structure for drug
-- ----------------------------
DROP TABLE IF EXISTS `drug`;
CREATE TABLE `drug` (
  `id` int(10) unsigned zerofill NOT NULL AUTO_INCREMENT,
  `drugId` varchar(20) DEFAULT NULL,
  `drugname` varchar(20) DEFAULT NULL,
  `manufaturer` varchar(50) DEFAULT NULL,
  `price` float DEFAULT NULL,
  `validityDay` int DEFAULT NULL,
  `validityYear` int DEFAULT NULL,
  `validityMouth` int DEFAULT NULL,
  `supply` varchar(30) DEFAULT NULL,
  `addNum` int DEFAULT NULL,
  `createTime` date DEFAULT NULL,
  `productionTime` date DEFAULT NULL,
  `validityTime` date DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8mb3;

-- ----------------------------
-- Records of drug
-- ----------------------------
INSERT INTO `drug` VALUES ('0000000001', 'Z0001', '乌鸡白凤丸', '深圳市天安堂深圳力昌大药房', '47.64', '0', '0', '6', '江中集团', '100', '2018-12-25', '2018-12-01', '2019-02-01');
INSERT INTO `drug` VALUES ('0000000002', 'Z0002', '鸦胆子油软胶囊 ', '江苏万高药业有限公司', '36.72', '0', '0', '3', '东北制药', '200', '2018-12-25', '2018-12-01', '2019-03-28');
INSERT INTO `drug` VALUES ('0000000003', 'Z0003', '来曲唑片', '江苏恒瑞医药股份有限公司 ', '109', '0', '1', '0', '葵花药业', '80', '2018-12-25', '2018-12-01', '2019-03-21');
INSERT INTO `drug` VALUES ('0000000004', 'Z0004', '慈丹胶囊 ', '北京勃然制药有限公司 ', '45.9', '0', '0', '4', '拜耳医药', '100', '2018-12-25', '2018-12-01', '2019-08-08');
INSERT INTO `drug` VALUES ('0000000005', 'Z0005', '石杉碱甲片', '河南太龙药业股份有限公司', '24.8', '0', '0', '5', '联邦制药', '200', '2018-12-25', '2018-12-01', '2019-09-28');
INSERT INTO `drug` VALUES ('0000000006', 'Z0006', '吡贝地尔缓释片', 'LES LABORATOIRES SERVIER INDUSTRIE', '76.5', '0', '0', '1', '哈药集团', '50', '2018-12-25', '2018-12-01', '2019-05-02');
INSERT INTO `drug` VALUES ('0000000007', 'Z0007', '盐酸维拉帕米缓释片 ', '德国基诺药厂', '36.1', '0', '0', '2', '新华医药', '50', '2018-12-25', '2018-12-01', '2019-06-28');
INSERT INTO `drug` VALUES ('0000000008', 'Z0008', '马来酸依那普利胶囊 ', '佛山手心制药有限公司', '18', '0', '0', '7', '中美史克', '100', '2018-12-25', '2018-12-01', '2019-10-17');
INSERT INTO `drug` VALUES ('0000000009', 'Z0009', '肝复乐片', '康哲(湖南)制药有限公司', '74.44', '2', '0', '4', '扬子江制药', '200', '2018-12-25', '2018-12-01', '2019-08-31');
INSERT INTO `drug` VALUES ('0000000010', 'Z1234', '强力枇杷露', '扬子江制药', '47.64', '30', '2022', '4', '内部采购', '300', '2019-05-23', '2019-04-03', '2022-04-27');
INSERT INTO `drug` VALUES ('0000000011', 'Z1234', '强力枇杷露', '东北制药', '23.11', '1', '2021', '3', '外部采购', '11', '2019-05-23', '2019-03-01', '2021-01-26');
INSERT INTO `drug` VALUES ('0000000012', 'Z0001', '乌鸡白凤丸', '成都生物制药', '47.64', '1', '1', '1', '成都生物制药有限公司', '100', '2021-08-26', '2021-08-26', '2021-01-26');
INSERT INTO `drug` VALUES ('0000000013', 'Z9999', '汇仁肾宝', '成都医药', '12.8', '0', '1', '0', '成都医药公司', '100', '2021-08-26', '2021-08-03', '2021-01-26');
INSERT INTO `drug` VALUES ('0000000014', 'Z9999', '汇仁肾宝', '成都医药', '122', '0', '1', '0', '成都医药公司', '111', '2021-08-26', '2021-08-18', '2021-01-26');
INSERT INTO `drug` VALUES ('0000000015', 'Z9999', '汇仁肾宝', '成都制药', '12.8', '0', '1', '0', '成都制药', '100', '2021-08-26', '2021-08-26', '2021-01-26');
INSERT INTO `drug` VALUES ('0000000016', 'Z9999', '汇仁肾宝', '测试', '12.8', '1', '1', '1', '测试测试', '1', '2021-08-26', '2021-08-19', '2021-01-26');
INSERT INTO `drug` VALUES ('0000000019', 'Z9999', '汇仁肾宝', '成都制药', '12.8', '1', '1', '1', '成都制药成都制药', '12', '2021-08-26', '2021-08-26', '2022-09-27');
INSERT INTO `drug` VALUES ('0000000020', 'Z0004', '慈丹胶囊 ', '成都制药', '45.9', '1', '1', '1', '成都制药集团', '10', '2021-09-01', '2021-07-14', '2022-08-15');
INSERT INTO `drug` VALUES ('0000000021', 'Z0009', '肝复乐片', '成都制药', '74.44', '1', '1', '1', '成都制药集团', '1', '2021-09-01', '2021-06-16', '2022-07-17');
INSERT INTO `drug` VALUES ('0000000022', 'Z0004', '慈丹胶囊 ', '成都生物', '45.9', '1', '1', '1', '成都生物集群', '1', '2021-09-01', '2021-08-09', '2022-09-10');
INSERT INTO `drug` VALUES ('0000000023', 'Z0005', '石杉碱甲片', '成都医药', '24.8', '1', '1', '1', '成都生物集群', '11', '2021-09-01', '2021-06-15', '2022-07-16');
INSERT INTO `drug` VALUES ('0000000024', 'Z0006', '吡贝地尔缓释片', '成都生物', '76.5', '1', '1', '1', '成都生物成都生物', '11', '2021-09-01', '2021-06-10', '2022-07-11');
INSERT INTO `drug` VALUES ('0000000025', 'Z0005', '石杉碱甲片', '成都生物', '24.8', '1', '1', '1', '成都生物集群', '1', '2021-09-01', '2021-07-14', '2022-08-15');
INSERT INTO `drug` VALUES ('0000000026', 'Z9999', '汇仁肾宝', '成都生物', '12.8', '1', '1', '1', '成都生物成都生物', '1', '2021-09-01', '2021-08-03', '2022-09-04');

-- ----------------------------
-- Table structure for fee
-- ----------------------------
DROP TABLE IF EXISTS `fee`;
CREATE TABLE `fee` (
  `id` int NOT NULL AUTO_INCREMENT,
  `patientId` varchar(25) COLLATE utf8_bin DEFAULT NULL,
  `patientName` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `feeType` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `fee` double DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb3 COLLATE=utf8_bin;

-- ----------------------------
-- Records of fee
-- ----------------------------
INSERT INTO `fee` VALUES ('1', '484668607406538752', '小刘', '预缴费用', '200');
INSERT INTO `fee` VALUES ('2', '484668607406538752', '小刘', '用药费用', '60.439999389648435');
INSERT INTO `fee` VALUES ('3', '484668607406538752', '小刘', '退药费用', '47.63999938964844');
INSERT INTO `fee` VALUES ('4', '485113494627155968', '小A', '用药费用', '604.3999938964844');
INSERT INTO `fee` VALUES ('5', '485113494627155968', '小A', '退药费用', '25.600000381469727');
INSERT INTO `fee` VALUES ('6', '485113494627155968', '小A', '预缴费用', '12111');
INSERT INTO `fee` VALUES ('7', '1555923323591', '张褴褛', '用药费用', '297.5999755859375');
INSERT INTO `fee` VALUES ('8', '485378416191733760', '小三', '用药费用', '216');
INSERT INTO `fee` VALUES ('9', '485378416191733760', '小三', '预缴费用', '10000');
INSERT INTO `fee` VALUES ('10', '1555923323591', '张褴褛', '预缴费用', '10000');
INSERT INTO `fee` VALUES ('11', '484670245978505216', '老张', '预缴费用', '20000');
INSERT INTO `fee` VALUES ('12', '1556762747114', '丁子彧', '预缴费用', '1111');
INSERT INTO `fee` VALUES ('13', '1557287431528', '王大拿', '预缴费用', '1111');

-- ----------------------------
-- Table structure for grantdrug
-- ----------------------------
DROP TABLE IF EXISTS `grantdrug`;
CREATE TABLE `grantdrug` (
  `Id` int(10) unsigned zerofill NOT NULL AUTO_INCREMENT,
  `drugId` varchar(30) DEFAULT NULL,
  `drugName` varchar(30) DEFAULT NULL,
  `drugPrice` float DEFAULT NULL,
  `drugCount` int DEFAULT NULL,
  `patientName` varchar(30) DEFAULT NULL,
  `patientId` varchar(30) DEFAULT NULL,
  `grantUserId` varchar(20) DEFAULT NULL,
  `grantUserName` varchar(30) DEFAULT NULL,
  `grantTime` datetime DEFAULT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=45 DEFAULT CHARSET=utf8mb3;

-- ----------------------------
-- Records of grantdrug
-- ----------------------------
INSERT INTO `grantdrug` VALUES ('0000000031', 'Z0008', '马来酸依那普利胶囊', '18', '2', '王大拿', '1557287431528', 'admin', '超级管理员', '2019-04-25 13:56:48');
INSERT INTO `grantdrug` VALUES ('0000000032', 'Z0001', '乌鸡白凤丸', '47.64', '1', '王大拿', '1555922984939', 'admin', '超级管理员', '2019-04-25 15:07:12');
INSERT INTO `grantdrug` VALUES ('0000000033', 'Z0009', '肝复乐片', '74.44', '4', '王梓桐', '1556262004947', 'admin', '超级管理员', '2019-04-29 23:37:25');
INSERT INTO `grantdrug` VALUES ('0000000034', 'Z0008', '马来酸依那普利胶囊', '18', '1', '王大拿', '1557287431528', 'admin', '超级管理员', '2019-05-08 11:58:27');
INSERT INTO `grantdrug` VALUES ('0000000035', 'Z0006', '吡贝地尔缓释片', '76.5', '5', '王大拿', '1557287431528', 'admin', '超级管理员', '2019-05-08 11:58:52');
INSERT INTO `grantdrug` VALUES ('0000000036', 'Z1234', '强力枇杷露', '47.64', '3', '丁子彧', '1556762747114', 'admin', '超级管理员', '2019-05-23 13:17:10');
INSERT INTO `grantdrug` VALUES ('0000000039', 'Z9999', '汇仁肾宝', '12.8', '1', '小刘', '484668607406538752', 'manager', '系统管理员', '2021-08-31 14:59:15');
INSERT INTO `grantdrug` VALUES ('0000000040', 'Z0001', '乌鸡白凤丸', '47.64', '1', '小刘', '484668607406538752', 'manager', '系统管理员', '2021-08-31 15:00:12');
INSERT INTO `grantdrug` VALUES ('0000000041', 'Z0001', '乌鸡白凤丸', '47.64', '10', '小A', '485113494627155968', 'manager', '系统管理员', '2021-08-31 16:19:59');
INSERT INTO `grantdrug` VALUES ('0000000042', 'Z9999', '汇仁肾宝', '12.8', '10', '小A', '485113494627155968', 'manager', '系统管理员', '2021-08-31 16:20:21');
INSERT INTO `grantdrug` VALUES ('0000000043', 'Z0005', '石杉碱甲片', '24.8', '12', '张褴褛', '1555923323591', 'manager', '系统管理员', '2021-09-01 09:17:57');
INSERT INTO `grantdrug` VALUES ('0000000044', 'Z0008', '马来酸依那普利胶囊 ', '18', '12', '小三', '485378416191733760', 'manager', '系统管理员', '2021-09-01 09:21:20');

-- ----------------------------
-- Table structure for log
-- ----------------------------
DROP TABLE IF EXISTS `log`;
CREATE TABLE `log` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `userId` text CHARACTER SET utf8 COLLATE utf8_general_ci,
  `type` varchar(255) DEFAULT NULL,
  `create_time` datetime(3) NOT NULL,
  `methodInfo` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `logDescription` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `methodParms` text CHARACTER SET utf8 COLLATE utf8_general_ci,
  `methodReturn` text CHARACTER SET utf8 COLLATE utf8_general_ci,
  `exMsg` text,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb3;

-- ----------------------------
-- Records of log
-- ----------------------------
INSERT INTO `log` VALUES ('3', 'manager', '普通日志', '2021-09-01 15:59:04.000', 'find', '药品入库查询业务', '传入参数 4 个:[ {drugVo=Drug(id=null, drugId=null, drugname=null, manufaturer=null, price=null, validityDay=null, validityYear=null, validityMouth=null, supply=null, addNum=null, createTime=null, productionTime=null, validityTime=null), org.springframework.validation.BindingResult.drugVo=org.springframework.validation.BeanPropertyBindingResult: 0 errors, pageUtils=com.hims.utils.PageUtils@990bd69} ,Drug(id=null, drugId=null, drugname=null, manufaturer=null, price=null, validityDay=null, validityYear=null, validityMouth=null, supply=null, addNum=null, createTime=null, productionTime=null, validityTime=null) ,1 ,10 ]', 'drug-inventory-query', null);
INSERT INTO `log` VALUES ('4', 'manager', '普通日志', '2021-09-01 16:03:17.000', 'find', '药品入库查询业务', '传入参数 4 个:[ {drugVo=Drug(id=null, drugId=null, drugname=null, manufaturer=null, price=null, validityDay=null, validityYear=null, validityMouth=null, supply=null, addNum=null, createTime=null, productionTime=null, validityTime=null), org.springframework.validation.BindingResult.drugVo=org.springframework.validation.BeanPropertyBindingResult: 0 errors, pageUtils=com.hims.utils.PageUtils@670c306e} ,Drug(id=null, drugId=null, drugname=null, manufaturer=null, price=null, validityDay=null, validityYear=null, validityMouth=null, supply=null, addNum=null, createTime=null, productionTime=null, validityTime=null) ,1 ,10 ]', 'drug-inventory-query', null);
INSERT INTO `log` VALUES ('5', 'manager', '普通日志', '2021-09-01 16:51:13.000', 'find', '药品入库查询业务', '传入参数 4 个:[ {drugVo=Drug(id=null, drugId=null, drugname=null, manufaturer=null, price=null, validityDay=null, validityYear=null, validityMouth=null, supply=null, addNum=null, createTime=null, productionTime=null, validityTime=null), org.springframework.validation.BindingResult.drugVo=org.springframework.validation.BeanPropertyBindingResult: 0 errors, pageUtils=com.hims.utils.PageUtils@2a835ab3} ,Drug(id=null, drugId=null, drugname=null, manufaturer=null, price=null, validityDay=null, validityYear=null, validityMouth=null, supply=null, addNum=null, createTime=null, productionTime=null, validityTime=null) ,1 ,10 ]', 'drug-inventory-query', null);
INSERT INTO `log` VALUES ('6', 'manager', '普通日志', '2021-09-01 16:52:02.000', 'ruKu', '药品入库业务', '传入参数 1 个:[ Drug(id=null, drugId=Z0006, drugname=吡贝地尔缓释片, manufaturer=成都生物, price=76.5, validityDay=1, validityYear=1, validityMouth=1, supply=成都生物成都生物, addNum=11, createTime=2021-9-1, productionTime=, validityTime=null) ]', '返回值JSON{code=500, msg=\'请求失败\', data=null}', null);
INSERT INTO `log` VALUES ('7', 'manager', '普通日志', '2021-09-01 16:52:36.000', 'ruKu', '药品入库业务', '传入参数 1 个:[ Drug(id=24, drugId=Z0006, drugname=吡贝地尔缓释片, manufaturer=成都生物, price=76.5, validityDay=1, validityYear=1, validityMouth=1, supply=成都生物成都生物, addNum=11, createTime=2021-9-1, productionTime=2021-06-10, validityTime=2022-07-11) ]', '返回值JSON{code=200, msg=\'请求成功\', data=null}', null);
INSERT INTO `log` VALUES ('8', 'manager', '普通日志', '2021-09-01 16:57:13.000', 'add', '费用预缴', '传入参数 1 个:[ Cost(Id=485493346752528384, patientId=1557287431528, patientName=王大拿, account=1111.0, type=现金, userId=manager, costTime=2021-09-01 16:57:13) ]', '返回值JSON{code=200, msg=\'请求成功\', data=null}', null);
INSERT INTO `log` VALUES ('9', 'manager', '普通日志', '2021-09-01 16:58:01.000', 'ruKu', '药品入库业务', '传入参数 1 个:[ Drug(id=25, drugId=Z0005, drugname=石杉碱甲片, manufaturer=成都生物, price=24.8, validityDay=1, validityYear=1, validityMouth=1, supply=成都生物集群, addNum=1, createTime=2021-9-1, productionTime=2021-07-14, validityTime=2022-08-15) ]', '返回值JSON{code=200, msg=\'请求成功\', data=null}', null);
INSERT INTO `log` VALUES ('10', 'manager', '异常日志', '2021-09-01 17:10:28.000', 'ruKu', '药品入库业务', '传入参数 1 个:[ Drug(id=null, drugId=Z0006, drugname=吡贝地尔缓释片, manufaturer=成都生物, price=76.5, validityDay=1, validityYear=1, validityMouth=1, supply=成都生物集团, addNum=1, createTime=2021-9-1, productionTime=, validityTime=null) ]', '返回值JSON{code=500, msg=\'请求失败\', data=null}', '\r\n### Error updating database.  Cause: com.mysql.cj.jdbc.exceptions.MysqlDataTruncation: Data truncation: Incorrect date value: \'\' for column \'productionTime\' at row 1\r\n### The error may exist in com/hims/mapper/DrugMapper.java (best guess)\r\n### The error may involve com.hims.mapper.DrugMapper.insert-Inline\r\n### The error occurred while setting parameters\r\n### SQL: INSERT INTO drug  ( drugId, drugname, manufaturer, price, validityDay, validityYear, validityMouth, supply, addNum, createTime, productionTime )  VALUES  ( ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ? )\r\n### Cause: com.mysql.cj.jdbc.exceptions.MysqlDataTruncation: Data truncation: Incorrect date value: \'\' for column \'productionTime\' at row 1\n; Data truncation: Incorrect date value: \'\' for column \'productionTime\' at row 1; nested exception is com.mysql.cj.jdbc.exceptions.MysqlDataTruncation: Data truncation: Incorrect date value: \'\' for column \'productionTime\' at row 1');
INSERT INTO `log` VALUES ('11', 'manager', '异常日志', '2021-09-01 17:22:22.000', 'ruKu', '药品入库业务', '传入参数 1 个:[ Drug(id=null, drugId=Z0006, drugname=吡贝地尔缓释片, manufaturer=成都生物, price=76.5, validityDay=1, validityYear=1, validityMouth=1, supply=成都生物集团, addNum=1, createTime=2021-9-1, productionTime=, validityTime=null) ]', null, '\r\n### Error updating database.  Cause: com.mysql.cj.jdbc.exceptions.MysqlDataTruncation: Data truncation: Incorrect date value: \'\' for column \'productionTime\' at row 1\r\n### The error may exist in com/hims/mapper/DrugMapper.java (best guess)\r\n### The error may involve com.hims.mapper.DrugMapper.insert-Inline\r\n### The error occurred while setting parameters\r\n### SQL: INSERT INTO drug  ( drugId, drugname, manufaturer, price, validityDay, validityYear, validityMouth, supply, addNum, createTime, productionTime )  VALUES  ( ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ? )\r\n### Cause: com.mysql.cj.jdbc.exceptions.MysqlDataTruncation: Data truncation: Incorrect date value: \'\' for column \'productionTime\' at row 1\n; Data truncation: Incorrect date value: \'\' for column \'productionTime\' at row 1; nested exception is com.mysql.cj.jdbc.exceptions.MysqlDataTruncation: Data truncation: Incorrect date value: \'\' for column \'productionTime\' at row 1');
INSERT INTO `log` VALUES ('12', 'manager', '普通日志', '2021-09-01 17:30:16.000', 'ruKu', '药品入库业务', '传入参数 1 个:[ Drug(id=26, drugId=Z9999, drugname=汇仁肾宝, manufaturer=成都生物, price=12.8, validityDay=1, validityYear=1, validityMouth=1, supply=成都生物成都生物, addNum=1, createTime=2021-9-1, productionTime=2021-08-03, validityTime=2022-09-04) ]', '返回值JSON{code=200, msg=\'请求成功\', data=null}', null);
INSERT INTO `log` VALUES ('13', 'manager', '异常日志', '2021-09-01 17:33:20.000', 'ruKu', '药品入库业务', '传入参数 1 个:[ Drug(id=null, drugId=Z0007, drugname=盐酸维拉帕米缓释片 , manufaturer=111, price=36.1, validityDay=1, validityYear=1, validityMouth=1, supply=111, addNum=1, createTime=2021-9-1, productionTime=, validityTime=null) ]', null, '\r\n### Error updating database.  Cause: com.mysql.cj.jdbc.exceptions.MysqlDataTruncation: Data truncation: Incorrect date value: \'\' for column \'productionTime\' at row 1\r\n### The error may exist in com/hims/mapper/DrugMapper.java (best guess)\r\n### The error may involve com.hims.mapper.DrugMapper.insert-Inline\r\n### The error occurred while setting parameters\r\n### SQL: INSERT INTO drug  ( drugId, drugname, manufaturer, price, validityDay, validityYear, validityMouth, supply, addNum, createTime, productionTime )  VALUES  ( ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ? )\r\n### Cause: com.mysql.cj.jdbc.exceptions.MysqlDataTruncation: Data truncation: Incorrect date value: \'\' for column \'productionTime\' at row 1\n; Data truncation: Incorrect date value: \'\' for column \'productionTime\' at row 1; nested exception is com.mysql.cj.jdbc.exceptions.MysqlDataTruncation: Data truncation: Incorrect date value: \'\' for column \'productionTime\' at row 1');
INSERT INTO `log` VALUES ('14', 'manager', '异常日志', '2021-09-01 17:34:50.000', 'ruKu', '药品入库业务', '传入参数 1 个:[ Drug(id=null, drugId=Z0007, drugname=盐酸维拉帕米缓释片 , manufaturer=111, price=36.1, validityDay=1, validityYear=1, validityMouth=1, supply=111, addNum=1, createTime=2021-9-1, productionTime=, validityTime=null) ]', null, '\r\n### Error updating database.  Cause: com.mysql.cj.jdbc.exceptions.MysqlDataTruncation: Data truncation: Incorrect date value: \'\' for column \'productionTime\' at row 1\r\n### The error may exist in com/hims/mapper/DrugMapper.java (best guess)\r\n### The error may involve com.hims.mapper.DrugMapper.insert-Inline\r\n### The error occurred while setting parameters\r\n### SQL: INSERT INTO drug  ( drugId, drugname, manufaturer, price, validityDay, validityYear, validityMouth, supply, addNum, createTime, productionTime )  VALUES  ( ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ? )\r\n### Cause: com.mysql.cj.jdbc.exceptions.MysqlDataTruncation: Data truncation: Incorrect date value: \'\' for column \'productionTime\' at row 1\n; Data truncation: Incorrect date value: \'\' for column \'productionTime\' at row 1; nested exception is com.mysql.cj.jdbc.exceptions.MysqlDataTruncation: Data truncation: Incorrect date value: \'\' for column \'productionTime\' at row 1');
INSERT INTO `log` VALUES ('15', 'manager', '异常日志', '2021-09-01 17:36:49.000', 'ruKu', '药品入库业务', '传入参数 1 个:[ Drug(id=null, drugId=Z0007, drugname=盐酸维拉帕米缓释片 , manufaturer=111, price=36.1, validityDay=1, validityYear=1, validityMouth=1, supply=111, addNum=1, createTime=2021-9-1, productionTime=, validityTime=null) ]', null, '\r\n### Error updating database.  Cause: com.mysql.cj.jdbc.exceptions.MysqlDataTruncation: Data truncation: Incorrect date value: \'\' for column \'productionTime\' at row 1\r\n### The error may exist in com/hims/mapper/DrugMapper.java (best guess)\r\n### The error may involve com.hims.mapper.DrugMapper.insert-Inline\r\n### The error occurred while setting parameters\r\n### SQL: INSERT INTO drug  ( drugId, drugname, manufaturer, price, validityDay, validityYear, validityMouth, supply, addNum, createTime, productionTime )  VALUES  ( ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ? )\r\n### Cause: com.mysql.cj.jdbc.exceptions.MysqlDataTruncation: Data truncation: Incorrect date value: \'\' for column \'productionTime\' at row 1\n; Data truncation: Incorrect date value: \'\' for column \'productionTime\' at row 1; nested exception is com.mysql.cj.jdbc.exceptions.MysqlDataTruncation: Data truncation: Incorrect date value: \'\' for column \'productionTime\' at row 1');
INSERT INTO `log` VALUES ('16', 'manager', '异常日志', '2021-09-01 17:37:30.000', 'ruKu', '药品入库业务', '传入参数 1 个:[ Drug(id=null, drugId=Z0005, drugname=石杉碱甲片, manufaturer=成都生物, price=24.8, validityDay=1, validityYear=1, validityMouth=1, supply=成都生物11, addNum=1, createTime=2021-9-1, productionTime=, validityTime=null) ]', null, '\r\n### Error updating database.  Cause: com.mysql.cj.jdbc.exceptions.MysqlDataTruncation: Data truncation: Incorrect date value: \'\' for column \'productionTime\' at row 1\r\n### The error may exist in com/hims/mapper/DrugMapper.java (best guess)\r\n### The error may involve com.hims.mapper.DrugMapper.insert-Inline\r\n### The error occurred while setting parameters\r\n### SQL: INSERT INTO drug  ( drugId, drugname, manufaturer, price, validityDay, validityYear, validityMouth, supply, addNum, createTime, productionTime )  VALUES  ( ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ? )\r\n### Cause: com.mysql.cj.jdbc.exceptions.MysqlDataTruncation: Data truncation: Incorrect date value: \'\' for column \'productionTime\' at row 1\n; Data truncation: Incorrect date value: \'\' for column \'productionTime\' at row 1; nested exception is com.mysql.cj.jdbc.exceptions.MysqlDataTruncation: Data truncation: Incorrect date value: \'\' for column \'productionTime\' at row 1');
INSERT INTO `log` VALUES ('17', 'manager', '异常日志', '2021-09-01 17:41:22.000', 'ruKu', '药品入库业务', '传入参数 1 个:[ Drug(id=null, drugId=Z0005, drugname=石杉碱甲片, manufaturer=成都医药, price=24.8, validityDay=1, validityYear=1, validityMouth=1, supply=成都生物集群, addNum=1, createTime=2021-9-1, productionTime=, validityTime=null) ]', null, '\r\n### Error updating database.  Cause: com.mysql.cj.jdbc.exceptions.MysqlDataTruncation: Data truncation: Incorrect date value: \'\' for column \'productionTime\' at row 1\r\n### The error may exist in com/hims/mapper/DrugMapper.java (best guess)\r\n### The error may involve com.hims.mapper.DrugMapper.insert-Inline\r\n### The error occurred while setting parameters\r\n### SQL: INSERT INTO drug  ( drugId, drugname, manufaturer, price, validityDay, validityYear, validityMouth, supply, addNum, createTime, productionTime )  VALUES  ( ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ? )\r\n### Cause: com.mysql.cj.jdbc.exceptions.MysqlDataTruncation: Data truncation: Incorrect date value: \'\' for column \'productionTime\' at row 1\n; Data truncation: Incorrect date value: \'\' for column \'productionTime\' at row 1; nested exception is com.mysql.cj.jdbc.exceptions.MysqlDataTruncation: Data truncation: Incorrect date value: \'\' for column \'productionTime\' at row 1');
INSERT INTO `log` VALUES ('18', 'manager', '异常日志', '2021-09-01 17:45:04.000', 'find', '药品入库查询业务', '传入参数 4 个:[ {drugVo=Drug(id=null, drugId=null, drugname=null, manufaturer=null, price=null, validityDay=null, validityYear=null, validityMouth=null, supply=null, addNum=null, createTime=null, productionTime=null, validityTime=null), org.springframework.validation.BindingResult.drugVo=org.springframework.validation.BeanPropertyBindingResult: 0 errors} ,Drug(id=null, drugId=null, drugname=null, manufaturer=null, price=null, validityDay=null, validityYear=null, validityMouth=null, supply=null, addNum=null, createTime=null, productionTime=null, validityTime=null) ,1 ,10 ]', null, '/ by zero');
INSERT INTO `log` VALUES ('19', 'manager', '异常日志', '2021-09-01 17:49:46.000', 'find', '药品入库查询业务', '传入参数 4 个:[ {drugVo=Drug(id=null, drugId=null, drugname=null, manufaturer=null, price=null, validityDay=null, validityYear=null, validityMouth=null, supply=null, addNum=null, createTime=null, productionTime=null, validityTime=null), org.springframework.validation.BindingResult.drugVo=org.springframework.validation.BeanPropertyBindingResult: 0 errors} ,Drug(id=null, drugId=null, drugname=null, manufaturer=null, price=null, validityDay=null, validityYear=null, validityMouth=null, supply=null, addNum=null, createTime=null, productionTime=null, validityTime=null) ,1 ,10 ]', null, '/ by zero');
INSERT INTO `log` VALUES ('20', '372502197702051215', '异常日志', '2021-09-04 18:05:51.000', 'find', '药品入库查询业务', '传入参数 4 个:[ {drugVo=Drug(id=null, drugId=null, drugname=null, manufaturer=null, price=null, validityDay=null, validityYear=null, validityMouth=null, supply=null, addNum=null, createTime=null, productionTime=null, validityTime=null), org.springframework.validation.BindingResult.drugVo=org.springframework.validation.BeanPropertyBindingResult: 0 errors} ,Drug(id=null, drugId=null, drugname=null, manufaturer=null, price=null, validityDay=null, validityYear=null, validityMouth=null, supply=null, addNum=null, createTime=null, productionTime=null, validityTime=null) ,1 ,10 ]', null, '/ by zero');

-- ----------------------------
-- Table structure for nation
-- ----------------------------
DROP TABLE IF EXISTS `nation`;
CREATE TABLE `nation` (
  `nationNum` int NOT NULL,
  `nationName` varchar(30) NOT NULL,
  PRIMARY KEY (`nationNum`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- ----------------------------
-- Records of nation
-- ----------------------------
INSERT INTO `nation` VALUES ('1', '汉族');
INSERT INTO `nation` VALUES ('2', '蒙古族');
INSERT INTO `nation` VALUES ('3', '回族');
INSERT INTO `nation` VALUES ('4', '藏族');
INSERT INTO `nation` VALUES ('5', '维吾尔族');
INSERT INTO `nation` VALUES ('6', '苗族');
INSERT INTO `nation` VALUES ('7', '彝族');
INSERT INTO `nation` VALUES ('8', '壮族');
INSERT INTO `nation` VALUES ('9', '布依族');
INSERT INTO `nation` VALUES ('10', '朝鲜族');
INSERT INTO `nation` VALUES ('11', '满族');
INSERT INTO `nation` VALUES ('12', '侗族');
INSERT INTO `nation` VALUES ('13', '瑶族');
INSERT INTO `nation` VALUES ('14', '白族');
INSERT INTO `nation` VALUES ('15', '土家族');
INSERT INTO `nation` VALUES ('16', '哈尼族');
INSERT INTO `nation` VALUES ('17', '哈萨克族');
INSERT INTO `nation` VALUES ('18', '傣族');
INSERT INTO `nation` VALUES ('19', '黎族');
INSERT INTO `nation` VALUES ('20', '傈僳族');
INSERT INTO `nation` VALUES ('21', '佤族');
INSERT INTO `nation` VALUES ('22', '畲族');
INSERT INTO `nation` VALUES ('23', '高山族');
INSERT INTO `nation` VALUES ('24', '拉祜族');
INSERT INTO `nation` VALUES ('25', '水族');
INSERT INTO `nation` VALUES ('26', '东乡族');
INSERT INTO `nation` VALUES ('27', '纳西族');
INSERT INTO `nation` VALUES ('28', '景颇族');
INSERT INTO `nation` VALUES ('29', '柯尔克孜族');
INSERT INTO `nation` VALUES ('30', '土族');
INSERT INTO `nation` VALUES ('31', '达斡尔族');
INSERT INTO `nation` VALUES ('32', '仫佬族');
INSERT INTO `nation` VALUES ('33', '羌族');
INSERT INTO `nation` VALUES ('34', '布朗族');
INSERT INTO `nation` VALUES ('35', '撒拉族');
INSERT INTO `nation` VALUES ('36', '毛难族');
INSERT INTO `nation` VALUES ('37', '仡佬族');
INSERT INTO `nation` VALUES ('38', '锡伯族');
INSERT INTO `nation` VALUES ('39', '阿昌族');
INSERT INTO `nation` VALUES ('40', '普米族');
INSERT INTO `nation` VALUES ('41', '塔吉克族');
INSERT INTO `nation` VALUES ('42', '怒族');
INSERT INTO `nation` VALUES ('43', '乌孜别克族');
INSERT INTO `nation` VALUES ('44', '俄罗斯族');
INSERT INTO `nation` VALUES ('45', '鄂温克族');
INSERT INTO `nation` VALUES ('46', '崩龙族');
INSERT INTO `nation` VALUES ('47', '保安族');
INSERT INTO `nation` VALUES ('48', '裕固族');
INSERT INTO `nation` VALUES ('49', '京族');
INSERT INTO `nation` VALUES ('50', '塔塔尔族');
INSERT INTO `nation` VALUES ('51', '独龙族');
INSERT INTO `nation` VALUES ('52', '鄂伦春族');
INSERT INTO `nation` VALUES ('53', '赫哲族');
INSERT INTO `nation` VALUES ('54', '门巴族');
INSERT INTO `nation` VALUES ('55', '珞巴族');
INSERT INTO `nation` VALUES ('56', '基诺族');

-- ----------------------------
-- Table structure for paracode
-- ----------------------------
DROP TABLE IF EXISTS `paracode`;
CREATE TABLE `paracode` (
  `code_id` int(6) unsigned zerofill NOT NULL AUTO_INCREMENT,
  `code` varchar(6) NOT NULL,
  `parameter_values` int NOT NULL,
  `parameter_name` varchar(20) NOT NULL,
  PRIMARY KEY (`code_id`)
) ENGINE=InnoDB AUTO_INCREMENT=138 DEFAULT CHARSET=utf8mb3;

-- ----------------------------
-- Records of paracode
-- ----------------------------
INSERT INTO `paracode` VALUES ('000083', '005', '0', '患者');
INSERT INTO `paracode` VALUES ('000084', '005', '1', '护士');
INSERT INTO `paracode` VALUES ('000085', '005', '2', '医生');
INSERT INTO `paracode` VALUES ('000086', '005', '3', '服务前台');
INSERT INTO `paracode` VALUES ('000087', '005', '4', '系统管理员');
INSERT INTO `paracode` VALUES ('000088', '005', '5', '超级管理员');
INSERT INTO `paracode` VALUES ('000089', '001', '1', '呼吸内科');
INSERT INTO `paracode` VALUES ('000090', '001', '2', '消化内科');
INSERT INTO `paracode` VALUES ('000091', '001', '3', '泌尿内科');
INSERT INTO `paracode` VALUES ('000092', '001', '4', '心内科');
INSERT INTO `paracode` VALUES ('000093', '001', '5', '血液科');
INSERT INTO `paracode` VALUES ('000094', '001', '6', '小儿科');
INSERT INTO `paracode` VALUES ('000095', '001', '7', '内分泌科');
INSERT INTO `paracode` VALUES ('000096', '001', '8', '神经内科');
INSERT INTO `paracode` VALUES ('000097', '001', '9', '感染科');
INSERT INTO `paracode` VALUES ('000098', '001', '10', '骨科');
INSERT INTO `paracode` VALUES ('000099', '001', '11', '神经外科');
INSERT INTO `paracode` VALUES ('000100', '001', '12', '肝胆外科');
INSERT INTO `paracode` VALUES ('000101', '001', '13', '烧伤科');
INSERT INTO `paracode` VALUES ('000102', '001', '14', '妇科');
INSERT INTO `paracode` VALUES ('000103', '001', '15', '产科');
INSERT INTO `paracode` VALUES ('000104', '002', '1', '住院医师');
INSERT INTO `paracode` VALUES ('000105', '002', '2', '主治医师');
INSERT INTO `paracode` VALUES ('000106', '002', '3', '副主任医师');
INSERT INTO `paracode` VALUES ('000107', '002', '4', '主任医师');
INSERT INTO `paracode` VALUES ('000108', '003', '1', 'VIP(1人)');
INSERT INTO `paracode` VALUES ('000109', '003', '2', '高等(2人)');
INSERT INTO `paracode` VALUES ('000110', '003', '3', '初级(4人)');
INSERT INTO `paracode` VALUES ('000111', '003', '4', '重症监护室(ICU_1人)');
INSERT INTO `paracode` VALUES ('000112', '004', '101', 'VIP(1人)');
INSERT INTO `paracode` VALUES ('000113', '004', '102', '高等(2人)');
INSERT INTO `paracode` VALUES ('000114', '004', '103', '初级(4人)');
INSERT INTO `paracode` VALUES ('000115', '004', '104', '重症监护室(ICU_1人)');
INSERT INTO `paracode` VALUES ('000116', '004', '105', 'VIP(1人)');
INSERT INTO `paracode` VALUES ('000117', '004', '106', '高等(2人)');
INSERT INTO `paracode` VALUES ('000118', '004', '107', '初级(4人)');
INSERT INTO `paracode` VALUES ('000119', '004', '108', '重症监护室(ICU_1人)');
INSERT INTO `paracode` VALUES ('000120', '004', '201', '初级(4人)');
INSERT INTO `paracode` VALUES ('000121', '004', '202', '高等(2人)');
INSERT INTO `paracode` VALUES ('000122', '004', '203', 'VIP(1人)');
INSERT INTO `paracode` VALUES ('000123', '004', '204', '重症监护室(ICU_1人)');
INSERT INTO `paracode` VALUES ('000124', '004', '301', '初级(4人)');
INSERT INTO `paracode` VALUES ('000125', '004', '302', '高等(2人)');
INSERT INTO `paracode` VALUES ('000126', '004', '303', 'VIP(1人)');
INSERT INTO `paracode` VALUES ('000127', '004', '304', '重症监护室(ICU_1人)');
INSERT INTO `paracode` VALUES ('000128', '004', '401', 'VIP(1人)');
INSERT INTO `paracode` VALUES ('000129', '004', '402', '高等(2人)');
INSERT INTO `paracode` VALUES ('000130', '004', '403', '重症监护室(ICU_1人)');
INSERT INTO `paracode` VALUES ('000131', '004', '501', '重症监护室(ICU_1人)');
INSERT INTO `paracode` VALUES ('000132', '004', '502', '重症监护室(ICU_1人)');
INSERT INTO `paracode` VALUES ('000133', '004', '503', '初级(4人)');
INSERT INTO `paracode` VALUES ('000134', '004', '504', '高等(2人)');
INSERT INTO `paracode` VALUES ('000135', '004', '505', 'VIP(1人)');
INSERT INTO `paracode` VALUES ('000136', '004', '601', 'VIP(1人)');
INSERT INTO `paracode` VALUES ('000137', '004', '506', '初级(4人)');

-- ----------------------------
-- Table structure for parameter
-- ----------------------------
DROP TABLE IF EXISTS `parameter`;
CREATE TABLE `parameter` (
  `parameter_id` int(6) unsigned zerofill NOT NULL AUTO_INCREMENT,
  `code` varchar(6) NOT NULL,
  `name` varchar(12) NOT NULL,
  PRIMARY KEY (`parameter_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb3;

-- ----------------------------
-- Records of parameter
-- ----------------------------
INSERT INTO `parameter` VALUES ('000001', '001', '科室');
INSERT INTO `parameter` VALUES ('000002', '002', '职称');
INSERT INTO `parameter` VALUES ('000003', '003', '病房类型');
INSERT INTO `parameter` VALUES ('000004', '004', '病房');
INSERT INTO `parameter` VALUES ('000005', '005', '角色');

-- ----------------------------
-- Table structure for patient
-- ----------------------------
DROP TABLE IF EXISTS `patient`;
CREATE TABLE `patient` (
  `id` int(11) unsigned zerofill NOT NULL AUTO_INCREMENT,
  `patientId` varchar(20) DEFAULT NULL,
  `patientName` varchar(20) NOT NULL,
  `gender` int NOT NULL,
  `nation` int DEFAULT NULL,
  `birth` date DEFAULT NULL,
  `department` int DEFAULT NULL,
  `certificateNo` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `workUnit` varchar(200) DEFAULT NULL,
  `maritalStatus` int DEFAULT NULL,
  `doctorId` int DEFAULT NULL,
  `admissionTime` datetime DEFAULT NULL,
  `homeAddress` varchar(255) DEFAULT NULL,
  `homePhone` varchar(11) DEFAULT NULL,
  `contacts` varchar(20) DEFAULT NULL,
  `contactsPhone` varchar(11) DEFAULT NULL,
  `admissionStatus` int DEFAULT NULL,
  `roomType` int DEFAULT NULL,
  `roomNo` int DEFAULT NULL,
  `bedNo` int DEFAULT NULL,
  `state` int DEFAULT NULL,
  `settlementState` int NOT NULL DEFAULT '0',
  `leaveState` int DEFAULT '0',
  `leaveTime` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=61 DEFAULT CHARSET=utf8mb3;

-- ----------------------------
-- Records of patient
-- ----------------------------
INSERT INTO `patient` VALUES ('00000000044', '1555922984939', '王大拿', '1', '2', '1977-02-01', '1', '372323197702011234', '大拿研究院', '1', '28', '2019-04-22 16:49:44', '内蒙古自治区巴彦淖尔市', '87876654', '王小拿', '87876654', '1', '4', '108', '10801', '0', '1', '1', '2019-05-08 11:14:37');
INSERT INTO `patient` VALUES ('00000000045', '1555923323591', '张褴褛', '1', '4', '1998-08-01', '3', '231123199808011232', '拉萨市第一中学', '0', '32', '2019-04-22 16:55:23', '拉萨', '6765432', '张筚路', '6765432', '1', '2', '302', '30201', '0', '0', '0', null);
INSERT INTO `patient` VALUES ('00000000046', '1556262004947', '王梓桐', '2', '6', '2011-01-04', '6', '371312201101042323', '', '0', '37', '2019-04-26 15:00:04', '山东青岛', '12345678901', '张大仙', '13312431212', '1', '1', '601', '60101', '0', '0', '0', null);
INSERT INTO `patient` VALUES ('00000000047', '1556762747114', '丁子彧', '2', '1', '1997-02-05', '1', '372502197702051212', '中国海洋大学', '0', '27', '2019-05-02 10:05:47', '山东聊城', '', '丁凡', '13798234312', '1', '3', '103', '10301', '0', '0', '0', null);
INSERT INTO `patient` VALUES ('00000000048', '1557287431528', '王大拿', '1', '1', '2018-01-03', '4', '372323197702011234', '', '0', '34', '2019-05-08 11:50:31', '呼伦贝厄', '', '王晓娜', '17865432121', '1', '2', '402', '40202', '0', '0', '0', null);
INSERT INTO `patient` VALUES ('00000000049', '1558535901290', 'MD5测试', '2', '2', '2019-05-21', '2', '372312201905211234', '', '0', '31', '2019-05-22 22:38:21', '黄岛', '', 'MD4', '13123231234', '1', '2', '202', '20201', '0', '1', '1', '2019-05-23 13:01:35');
INSERT INTO `patient` VALUES ('00000000053', '483672081083400192', '小李', '1', '1', '2021-08-18', '2', '372323197702011111', 'Java开发部', '1', '29', '2021-08-27 16:20:10', 'Java开发部Java开发部', '12344321', '老李', '13345678991', '0', '2', '202', '276', '0', '0', '0', null);
INSERT INTO `patient` VALUES ('00000000054', '483672718378532864', '小李', '1', '1', '2021-08-18', '2', '372323197702011111', 'Java开发部', '1', '29', '2021-08-27 16:22:42', 'Java开发部Java开发部', '12344321', '老李', '13345678991', '0', '2', '202', '276', '0', '0', '0', null);
INSERT INTO `patient` VALUES ('00000000055', '483673062051414016', '小李', '1', '1', '2021-08-19', '2', '372323197702011234', '测试', '1', '29', '2021-08-27 16:24:04', '测试测试', '12344321', '测试', '13345678901', '2', '2', '202', '20201', '0', '1', '1', '2021-08-27 16:45:48');
INSERT INTO `patient` VALUES ('00000000056', '484668607406538752', '小刘', '1', '1', '2021-08-25', '5', '420911119901010422', 'Java开发部门', '1', '38', '2021-08-30 10:20:00', '北京学府路', '42091010', '老刘', '13345678990', '0', '4', '502', '50202', '0', '1', '0', null);
INSERT INTO `patient` VALUES ('00000000057', '484670245978505216', '老张', '1', '1', '2021-08-30', '5', '372323197702011345', '老张工作室', '1', '38', '2021-08-30 10:26:31', '隔壁的老张', '12343211', '小张', '13356781910', '0', '3', '506', '50603', '0', '0', '0', null);
INSERT INTO `patient` VALUES ('00000000059', '485113494627155968', '小A', '1', '1', '2021-08-31', '5', '372323197702011333', 'Java开发部门', '1', '37', '2021-08-31 15:47:50', 'Java开发部门', '12345565', 'AA', '1334567899', '0', '4', '501', '50101', '0', '0', '0', null);
INSERT INTO `patient` VALUES ('00000000060', '485378416191733760', '小三', '1', '1', '2021-04-20', '1', '372323197702011255', '东莞XX洗浴中心', '1', '28', '2021-09-01 09:20:32', '广东省XXX', '12344321', '小三', '1334567892', '1', '1', '101', '10101', '0', '1', '1', '2021-09-01 09:45:36');

-- ----------------------------
-- Table structure for permission
-- ----------------------------
DROP TABLE IF EXISTS `permission`;
CREATE TABLE `permission` (
  `id` int NOT NULL AUTO_INCREMENT,
  `li_id` varchar(300) COLLATE utf8_bin DEFAULT NULL,
  `title` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `iocn` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `parent_id` int DEFAULT NULL,
  `sort` int DEFAULT NULL,
  `url` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `type` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `code` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=39 DEFAULT CHARSET=utf8mb3 COLLATE=utf8_bin;

-- ----------------------------
-- Records of permission
-- ----------------------------
INSERT INTO `permission` VALUES ('1', 'ruyuanguanli', '入院管理', 'icon-home', '0', '0', null, 'menu', null);
INSERT INTO `permission` VALUES ('2', null, '入院登记', null, '1', '1', '/to_patient-reg', 'menu', null);
INSERT INTO `permission` VALUES ('3', null, '住院查询', null, '1', '2', '/patient/find', 'menu', null);
INSERT INTO `permission` VALUES ('4', 'chuyuanguanli', '出院管理', 'icon-interface-windows', '0', '0', null, 'menu', null);
INSERT INTO `permission` VALUES ('5', null, '出院登记', null, '4', '1', '/to_patient-out-hospital', 'menu', null);
INSERT INTO `permission` VALUES ('6', null, '出院查询', null, '4', '2', '/patient/outfind', 'menu', null);
INSERT INTO `permission` VALUES ('7', null, '转科室/病房', null, '4', '3', '/to_ward-transfer', 'menu', null);
INSERT INTO `permission` VALUES ('8', 'bingfangguanli', '病房管理', 'fa fa-building-o', '0', '0', null, 'menu', null);
INSERT INTO `permission` VALUES ('9', null, '新置病房', null, '8', '1', '/to_ward-create', 'menu', null);
INSERT INTO `permission` VALUES ('10', null, '病房价格调整', null, '8', '2', '/category/list', 'menu', null);
INSERT INTO `permission` VALUES ('11', 'jiesuanzhongxin', '结算中心', 'fa fa-map-o', '0', '0', null, 'menu', null);
INSERT INTO `permission` VALUES ('12', null, '费用预缴', null, '11', '1', '/to_cost_yujiao', 'menu', null);
INSERT INTO `permission` VALUES ('13', null, '缴费记录', null, '11', '2', '/cost/find', 'menu', null);
INSERT INTO `permission` VALUES ('14', null, '费用查询', null, '11', '3', '/to_cost_jiesuan', 'menu', null);
INSERT INTO `permission` VALUES ('15', 'hulizhongxin', '护理中心', 'icon-line-chart', '0', '0', null, 'menu', null);
INSERT INTO `permission` VALUES ('16', null, '录入体征数据', null, '15', '1', '/to_sign-entry', 'menu', null);
INSERT INTO `permission` VALUES ('17', null, '体征数据查询', null, '15', '2', '/sign/find', 'menu', null);
INSERT INTO `permission` VALUES ('18', null, '住院历史', null, '15', '3', '/patient/allFind', 'menu', null);
INSERT INTO `permission` VALUES ('19', null, '用药历史', null, '15', '4', '/grantdrug/find', 'menu', null);
INSERT INTO `permission` VALUES ('20', 'tongjizhongxin', '统计中心', 'fa fa-bar-chart', '0', '0', null, 'menu', null);
INSERT INTO `permission` VALUES ('21', null, '科室病人数据查询', null, '20', '1', '/department/departmentInformation', 'menu', null);
INSERT INTO `permission` VALUES ('22', null, '科室病人报表统计', null, '20', '2', '/department/departmentInformationtongji', 'menu', null);
INSERT INTO `permission` VALUES ('23', null, '病房统计', null, '20', '3', '/wardinfo/info', 'menu', null);
INSERT INTO `permission` VALUES ('24', null, '病房报表统计', null, '20', '4', '/wardinfo/baobiaoinfo', 'menu', null);
INSERT INTO `permission` VALUES ('25', 'yaopinguanli', '药品管理', 'icon-flask', '0', '0', null, 'menu', null);
INSERT INTO `permission` VALUES ('26', null, '药品入库', null, '25', '1', '/to_drugs-reg', 'menu', null);
INSERT INTO `permission` VALUES ('27', null, '药品发放', null, '25', '2', '/to_drugs-delivery', 'menu', null);
INSERT INTO `permission` VALUES ('28', null, '退药处理', null, '25', '3', '/to_drugs-repercussion', 'menu', null);
INSERT INTO `permission` VALUES ('29', null, '入库查询', null, '25', '4', '/drug/rukuQuery', 'menu', null);
INSERT INTO `permission` VALUES ('30', null, '库存查询', null, '25', '5', '/stock/find', 'menu', null);
INSERT INTO `permission` VALUES ('31', 'yonghuguanli', '用户管理', 'icon-user', '0', '0', null, 'menu', null);
INSERT INTO `permission` VALUES ('32', null, '用户注册', null, '31', '1', '/to_user-reg', 'menu', null);
INSERT INTO `permission` VALUES ('33', null, '用户查询', null, '31', '2', '/user/find', 'menu', null);
INSERT INTO `permission` VALUES ('34', null, '医生管理', 'icon-check', '0', '0', null, 'menu', null);
INSERT INTO `permission` VALUES ('35', null, '医生录入', null, '34', '1', '/to_doctor-reg', 'menu', null);
INSERT INTO `permission` VALUES ('36', null, '医生查询', null, '34', '2', '/doctor/find', 'menu', null);
INSERT INTO `permission` VALUES ('37', 'canshushezhi', '系统配置', 'icon-list', '0', '0', null, 'menu', null);
INSERT INTO `permission` VALUES ('38', null, '行为日志', null, '37', '1', '/log/find', 'menu', null);

-- ----------------------------
-- Table structure for role
-- ----------------------------
DROP TABLE IF EXISTS `role`;
CREATE TABLE `role` (
  `id` int NOT NULL,
  `role_name` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8_bin;

-- ----------------------------
-- Records of role
-- ----------------------------
INSERT INTO `role` VALUES ('0', '患者');
INSERT INTO `role` VALUES ('1', '护士');
INSERT INTO `role` VALUES ('2', '医生');
INSERT INTO `role` VALUES ('3', '服务前台');
INSERT INTO `role` VALUES ('4', '系统管理员');
INSERT INTO `role` VALUES ('5', '超级管理员');

-- ----------------------------
-- Table structure for role_permission
-- ----------------------------
DROP TABLE IF EXISTS `role_permission`;
CREATE TABLE `role_permission` (
  `id` int NOT NULL AUTO_INCREMENT,
  `role_id` int DEFAULT NULL,
  `permission_id` int DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=95 DEFAULT CHARSET=utf8mb3 COLLATE=utf8_bin;

-- ----------------------------
-- Records of role_permission
-- ----------------------------
INSERT INTO `role_permission` VALUES ('1', '1', '1');
INSERT INTO `role_permission` VALUES ('2', '1', '3');
INSERT INTO `role_permission` VALUES ('3', '1', '4');
INSERT INTO `role_permission` VALUES ('4', '1', '6');
INSERT INTO `role_permission` VALUES ('5', '1', '16');
INSERT INTO `role_permission` VALUES ('6', '1', '15');
INSERT INTO `role_permission` VALUES ('7', '1', '17');
INSERT INTO `role_permission` VALUES ('8', '1', '18');
INSERT INTO `role_permission` VALUES ('9', '1', '19');
INSERT INTO `role_permission` VALUES ('10', '1', '20');
INSERT INTO `role_permission` VALUES ('11', '1', '22');
INSERT INTO `role_permission` VALUES ('12', '1', '21');
INSERT INTO `role_permission` VALUES ('13', '1', '24');
INSERT INTO `role_permission` VALUES ('14', '1', '23');
INSERT INTO `role_permission` VALUES ('15', '2', '1');
INSERT INTO `role_permission` VALUES ('16', '2', '3');
INSERT INTO `role_permission` VALUES ('17', '2', '4');
INSERT INTO `role_permission` VALUES ('18', '2', '6');
INSERT INTO `role_permission` VALUES ('19', '2', '20');
INSERT INTO `role_permission` VALUES ('20', '2', '21');
INSERT INTO `role_permission` VALUES ('21', '2', '22');
INSERT INTO `role_permission` VALUES ('22', '2', '23');
INSERT INTO `role_permission` VALUES ('23', '2', '24');
INSERT INTO `role_permission` VALUES ('24', '2', '25');
INSERT INTO `role_permission` VALUES ('25', '2', '27');
INSERT INTO `role_permission` VALUES ('26', '2', '28');
INSERT INTO `role_permission` VALUES ('27', '2', '30');
INSERT INTO `role_permission` VALUES ('28', '3', '1');
INSERT INTO `role_permission` VALUES ('29', '3', '3');
INSERT INTO `role_permission` VALUES ('30', '3', '2');
INSERT INTO `role_permission` VALUES ('31', '3', '4');
INSERT INTO `role_permission` VALUES ('32', '3', '5');
INSERT INTO `role_permission` VALUES ('33', '3', '6');
INSERT INTO `role_permission` VALUES ('34', '3', '7');
INSERT INTO `role_permission` VALUES ('35', '3', '11');
INSERT INTO `role_permission` VALUES ('36', '3', '12');
INSERT INTO `role_permission` VALUES ('37', '3', '13');
INSERT INTO `role_permission` VALUES ('38', '3', '14');
INSERT INTO `role_permission` VALUES ('40', '0', '11');
INSERT INTO `role_permission` VALUES ('41', '0', '13');
INSERT INTO `role_permission` VALUES ('42', '0', '15');
INSERT INTO `role_permission` VALUES ('43', '0', '17');
INSERT INTO `role_permission` VALUES ('44', '0', '18');
INSERT INTO `role_permission` VALUES ('45', '0', '19');
INSERT INTO `role_permission` VALUES ('46', '4', '8');
INSERT INTO `role_permission` VALUES ('47', '4', '9');
INSERT INTO `role_permission` VALUES ('48', '4', '10');
INSERT INTO `role_permission` VALUES ('49', '4', '34');
INSERT INTO `role_permission` VALUES ('50', '4', '35');
INSERT INTO `role_permission` VALUES ('51', '4', '36');
INSERT INTO `role_permission` VALUES ('52', '4', '25');
INSERT INTO `role_permission` VALUES ('53', '4', '26');
INSERT INTO `role_permission` VALUES ('54', '4', '29');
INSERT INTO `role_permission` VALUES ('55', '4', '30');
INSERT INTO `role_permission` VALUES ('56', '5', '1');
INSERT INTO `role_permission` VALUES ('57', '5', '2');
INSERT INTO `role_permission` VALUES ('58', '5', '3');
INSERT INTO `role_permission` VALUES ('59', '5', '4');
INSERT INTO `role_permission` VALUES ('60', '5', '5');
INSERT INTO `role_permission` VALUES ('61', '5', '6');
INSERT INTO `role_permission` VALUES ('62', '5', '7');
INSERT INTO `role_permission` VALUES ('63', '5', '8');
INSERT INTO `role_permission` VALUES ('64', '5', '9');
INSERT INTO `role_permission` VALUES ('65', '5', '10');
INSERT INTO `role_permission` VALUES ('66', '5', '11');
INSERT INTO `role_permission` VALUES ('67', '5', '12');
INSERT INTO `role_permission` VALUES ('68', '5', '13');
INSERT INTO `role_permission` VALUES ('69', '5', '14');
INSERT INTO `role_permission` VALUES ('70', '5', '15');
INSERT INTO `role_permission` VALUES ('71', '5', '16');
INSERT INTO `role_permission` VALUES ('72', '5', '17');
INSERT INTO `role_permission` VALUES ('73', '5', '18');
INSERT INTO `role_permission` VALUES ('74', '5', '19');
INSERT INTO `role_permission` VALUES ('75', '5', '20');
INSERT INTO `role_permission` VALUES ('76', '5', '21');
INSERT INTO `role_permission` VALUES ('77', '5', '22');
INSERT INTO `role_permission` VALUES ('78', '5', '23');
INSERT INTO `role_permission` VALUES ('79', '5', '24');
INSERT INTO `role_permission` VALUES ('80', '5', '25');
INSERT INTO `role_permission` VALUES ('81', '5', '26');
INSERT INTO `role_permission` VALUES ('82', '5', '27');
INSERT INTO `role_permission` VALUES ('83', '5', '28');
INSERT INTO `role_permission` VALUES ('84', '5', '29');
INSERT INTO `role_permission` VALUES ('85', '5', '30');
INSERT INTO `role_permission` VALUES ('86', '5', '31');
INSERT INTO `role_permission` VALUES ('87', '5', '32');
INSERT INTO `role_permission` VALUES ('88', '5', '33');
INSERT INTO `role_permission` VALUES ('89', '5', '34');
INSERT INTO `role_permission` VALUES ('90', '5', '35');
INSERT INTO `role_permission` VALUES ('91', '5', '36');
INSERT INTO `role_permission` VALUES ('92', '5', '37');
INSERT INTO `role_permission` VALUES ('93', '5', '38');

-- ----------------------------
-- Table structure for sign
-- ----------------------------
DROP TABLE IF EXISTS `sign`;
CREATE TABLE `sign` (
  `signId` int(11) unsigned zerofill NOT NULL AUTO_INCREMENT,
  `patientId` varchar(20) DEFAULT NULL,
  `measureTime` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `userId` varchar(20) DEFAULT NULL,
  `temperature` float DEFAULT '0',
  `bloodPressure` varchar(7) DEFAULT '0/0',
  `pulse` int DEFAULT '0',
  `remarks` varchar(100) DEFAULT NULL,
  `userName` varchar(20) DEFAULT NULL,
  `createTime` datetime DEFAULT NULL,
  `breathing` int DEFAULT '0',
  `bloodSugar` float DEFAULT '0',
  `vein` float DEFAULT '0',
  PRIMARY KEY (`signId`)
) ENGINE=InnoDB AUTO_INCREMENT=39 DEFAULT CHARSET=utf8mb3;

-- ----------------------------
-- Records of sign
-- ----------------------------
INSERT INTO `sign` VALUES ('00000000001', '1555922984939', '2019-04-27 21:21:04', 'admin', '36.7', '80/120', '98', '没毛病', '超级管理员', '2019-04-23 22:37:06', null, '6.4', '0');
INSERT INTO `sign` VALUES ('00000000002', '1555922984939', '2019-04-27 21:21:09', 'admin', '37.6', '85/110', '110', '发烧', '超级管理员', '2019-04-23 22:37:38', null, '7.2', '0');
INSERT INTO `sign` VALUES ('00000000003', '1555922984939', '2019-04-27 21:21:12', 'admin', '36', '90/130', '120', '高血压', '超级管理员', '2019-04-23 22:38:12', null, '6.8', '0');
INSERT INTO `sign` VALUES ('00000000004', '1555923323591', '2019-04-27 21:21:22', 'admin', '39.7', '110/150', '180', '快凉了', '超级管理员', '2019-04-23 22:41:02', null, '7.1', '0');
INSERT INTO `sign` VALUES ('00000000023', '1555922984939', '2019-04-29 23:53:28', '372323197702011234', '22', '90/130', '77', null, '王大拿', '2019-04-25 11:56:38', null, '0', '0');
INSERT INTO `sign` VALUES ('00000000026', '1555922984939', '2019-04-27 21:17:56', 'admin', '36', '80/120', '78', null, '超级管理员', '2019-04-27 21:20:44', null, '6.7', '0');
INSERT INTO `sign` VALUES ('00000000027', '1556262004947', '2019-04-30 11:31:15', 'admin', '37', '90/120', '120', null, '超级管理员', '2019-04-30 11:36:08', null, '6.7', '0');
INSERT INTO `sign` VALUES ('00000000028', '1556262004947', '2019-04-30 11:40:45', 'admin', '39', '90/125', '120', '校验测试', '超级管理员', '2019-04-30 11:41:20', null, '6.6', '0');
INSERT INTO `sign` VALUES ('00000000029', '1555923323591', '2019-05-05 11:31:46', 'superman', '36.8', '90/128', '87', '超级权限用户测试', '超级权限用户', '2019-05-05 11:32:20', null, '7.7', '0');
INSERT INTO `sign` VALUES ('00000000030', '1556262004947', '2019-05-07 11:44:23', 'superman', '37.8', '75/115', '77', '持续低烧', '超级权限用户', '2019-05-07 11:44:49', null, '6.7', '0');
INSERT INTO `sign` VALUES ('00000000031', '1555922984939', '2019-05-07 11:48:32', 'superman', '36.8', '85/135', '77', '准备出院', '超级权限用户', '2019-05-07 11:49:19', null, '0', '0');
INSERT INTO `sign` VALUES ('00000000032', '1555922984939', '2019-05-08 10:43:00', 'doctor', '39', '80/117', '140', '再次高烧', '医生', '2019-05-08 10:43:42', null, '0', '0');
INSERT INTO `sign` VALUES ('00000000033', '1557287431528', '2019-05-08 11:51:21', 'admin', '36.8', '89/130', '110', null, '超级管理员', '2019-05-08 11:51:41', null, '7.4', '0');
INSERT INTO `sign` VALUES ('00000000034', '1557287431528', '2019-05-08 11:59:11', 'admin', '36', '90/145', '77', null, '超级管理员', '2019-05-08 11:59:36', null, '6.2', '0');
INSERT INTO `sign` VALUES ('00000000035', '1557287431528', '2019-05-08 11:59:38', 'admin', '37.5', '80/117', '78', null, '超级管理员', '2019-05-08 12:00:15', null, '6.2', '0');
INSERT INTO `sign` VALUES ('00000000036', '1557287431528', '2019-05-08 12:00:16', 'admin', '0', '90/130', '0', null, '超级管理员', '2019-05-08 12:00:36', null, '0', '0');
INSERT INTO `sign` VALUES ('00000000037', '1557287431528', '2019-05-08 12:10:27', 'admin', '36.5', '70/130', '69', '正常', '超级管理员', '2019-05-08 12:11:10', null, '6.3', '0');
INSERT INTO `sign` VALUES ('00000000038', '484668607406538752', '2021-08-30 15:58:28', 'manager', '39', '70/130', '222', '呵呵', '系统管理员', '2021-08-30 15:58:38', '0', '2.2', '0');

-- ----------------------------
-- Table structure for stock
-- ----------------------------
DROP TABLE IF EXISTS `stock`;
CREATE TABLE `stock` (
  `id` int(10) unsigned zerofill NOT NULL AUTO_INCREMENT,
  `drugId` varchar(15) DEFAULT NULL,
  `drugName` varchar(30) DEFAULT NULL,
  `price` float DEFAULT NULL,
  `count` int DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8mb3;

-- ----------------------------
-- Records of stock
-- ----------------------------
INSERT INTO `stock` VALUES ('0000000009', 'Z0001', '乌鸡白凤丸', '47.64', '185');
INSERT INTO `stock` VALUES ('0000000010', 'Z0003', '鸦胆子油软胶囊 ', '109', '278');
INSERT INTO `stock` VALUES ('0000000011', 'Z0004', '慈丹胶囊 ', '45.9', '96');
INSERT INTO `stock` VALUES ('0000000012', 'Z0005', '石杉碱甲片', '24.8', '198');
INSERT INTO `stock` VALUES ('0000000013', 'Z0006', '吡贝地尔缓释片', '76.5', '56');
INSERT INTO `stock` VALUES ('0000000014', 'Z0007', '盐酸维拉帕米缓释片 ', '36.1', '39');
INSERT INTO `stock` VALUES ('0000000015', 'Z0008', '马来酸依那普利胶囊 ', '18', '79');
INSERT INTO `stock` VALUES ('0000000016', 'Z0009', '肝复乐片', '74.44', '197');
INSERT INTO `stock` VALUES ('0000000017', 'Z1234', '强力枇杷露', '47.64', '309');
INSERT INTO `stock` VALUES ('0000000018', 'Z9999', '汇仁肾宝', '12.8', '315');

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `user_id` varchar(25) NOT NULL,
  `user_name` varchar(20) NOT NULL,
  `user_password` varchar(32) NOT NULL,
  `user_phone` varchar(11) DEFAULT NULL,
  `user_describe` int NOT NULL DEFAULT '0',
  `create_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `user_del` int DEFAULT NULL,
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES ('1556762747114', '372502197702051212', '46586EF47D610D6AFD2F18D4D5323D63', '13356789922', '0', '2021-09-04 17:56:46', '0');
INSERT INTO `user` VALUES ('372323197702011234', '小O', '46586EF47D610D6AFD2F18D4D5323D63', '13345676673', '1', '2019-04-22 16:52:01', '0');
INSERT INTO `user` VALUES ('372502197702051213', '小C', '46586EF47D610D6AFD2F18D4D5323D63', '13345676677', '5', '2019-04-22 13:39:53', '0');
INSERT INTO `user` VALUES ('372502197702051214', '小E', '46586EF47D610D6AFD2F18D4D5323D63', '13345676678', '2', '2019-04-22 13:38:11', '0');
INSERT INTO `user` VALUES ('372502197702051215', '小D', '46586EF47D610D6AFD2F18D4D5323D63', '13345676679', '4', '2019-04-22 13:39:32', '0');
INSERT INTO `user` VALUES ('372502197702051222', '小B', '46586EF47D610D6AFD2F18D4D5323D63', '13345676611', '1', '2019-04-22 13:37:52', '0');
INSERT INTO `user` VALUES ('372502197702051333', '小A', '46586EF47D610D6AFD2F18D4D5323D63', '13345676622', '3', '2019-04-22 13:39:19', '0');
INSERT INTO `user` VALUES ('372502197702052200', '372323197702011234', '46586EF47D610D6AFD2F18D4D5323D63', '13356789902', '0', '2021-09-04 16:21:29', '0');
INSERT INTO `user` VALUES ('372502197702052222', '小花', '46586EF47D610D6AFD2F18D4D5323D63', '13356789901', '2', '2021-08-26 10:56:13', '0');
INSERT INTO `user` VALUES ('372502197702052223', '231123199808011232', '46586EF47D610D6AFD2F18D4D5323D63', '13356789902', '0', '2021-09-04 16:22:22', '0');

-- ----------------------------
-- Table structure for ward
-- ----------------------------
DROP TABLE IF EXISTS `ward`;
CREATE TABLE `ward` (
  `id` int(10) unsigned zerofill NOT NULL AUTO_INCREMENT,
  `wardNo` int NOT NULL,
  `departmentNo` int DEFAULT NULL,
  `type` int DEFAULT NULL,
  `space` int DEFAULT NULL,
  `state` int DEFAULT NULL,
  `createTime` date NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=102 DEFAULT CHARSET=utf8mb3;

-- ----------------------------
-- Records of ward
-- ----------------------------
INSERT INTO `ward` VALUES ('0000000071', '101', '1', '1', '1', '0', '2019-04-22');
INSERT INTO `ward` VALUES ('0000000072', '102', '1', '2', '2', '0', '2019-04-22');
INSERT INTO `ward` VALUES ('0000000073', '103', '1', '3', '4', '0', '2019-04-22');
INSERT INTO `ward` VALUES ('0000000074', '104', '1', '4', '1', '0', '2019-04-22');
INSERT INTO `ward` VALUES ('0000000075', '105', '1', '1', '1', '0', '2019-04-22');
INSERT INTO `ward` VALUES ('0000000076', '106', '1', '2', '2', '0', '2019-04-22');
INSERT INTO `ward` VALUES ('0000000077', '107', '1', '3', '4', '0', '2019-04-22');
INSERT INTO `ward` VALUES ('0000000078', '108', '1', '4', '1', '0', '2019-04-22');
INSERT INTO `ward` VALUES ('0000000079', '201', '2', '3', '4', '0', '2019-04-22');
INSERT INTO `ward` VALUES ('0000000080', '202', '2', '2', '2', '0', '2019-04-22');
INSERT INTO `ward` VALUES ('0000000081', '203', '2', '1', '1', '0', '2019-04-22');
INSERT INTO `ward` VALUES ('0000000082', '204', '2', '4', '1', '0', '2019-04-22');
INSERT INTO `ward` VALUES ('0000000083', '301', '3', '3', '4', '0', '2019-04-22');
INSERT INTO `ward` VALUES ('0000000084', '302', '3', '2', '2', '0', '2019-04-22');
INSERT INTO `ward` VALUES ('0000000085', '303', '3', '1', '1', '0', '2019-04-22');
INSERT INTO `ward` VALUES ('0000000086', '304', '3', '4', '1', '0', '2019-04-22');
INSERT INTO `ward` VALUES ('0000000087', '401', '4', '1', '1', '0', '2019-04-22');
INSERT INTO `ward` VALUES ('0000000088', '402', '4', '2', '2', '0', '2019-04-22');
INSERT INTO `ward` VALUES ('0000000089', '403', '4', '4', '1', '0', '2019-04-22');
INSERT INTO `ward` VALUES ('0000000090', '501', '5', '4', '1', '0', '2019-04-22');
INSERT INTO `ward` VALUES ('0000000091', '502', '5', '4', '1', '0', '2019-04-22');
INSERT INTO `ward` VALUES ('0000000092', '503', '5', '3', '4', '0', '2019-04-22');
INSERT INTO `ward` VALUES ('0000000093', '504', '5', '2', '2', '0', '2019-04-22');
INSERT INTO `ward` VALUES ('0000000094', '505', '5', '1', '1', '0', '2019-04-22');
INSERT INTO `ward` VALUES ('0000000095', '601', '6', '1', '1', '1', '2019-04-26');
INSERT INTO `ward` VALUES ('0000000096', '506', '5', '3', '4', '0', '2019-05-23');
INSERT INTO `ward` VALUES ('0000000097', '888', '2', '1', '1', '0', '2021-10-01');
INSERT INTO `ward` VALUES ('0000000098', '999', '2', '1', '1', '0', '2021-10-01');
INSERT INTO `ward` VALUES ('0000000099', '6767', '2', '2', '2', '0', '2021-08-11');
INSERT INTO `ward` VALUES ('0000000100', '9898', '2', '2', '2', '0', '2021-08-11');
INSERT INTO `ward` VALUES ('0000000101', '7777', '2', '2', '2', '0', '2021-08-19');

-- ----------------------------
-- Table structure for wardupdate
-- ----------------------------
DROP TABLE IF EXISTS `wardupdate`;
CREATE TABLE `wardupdate` (
  `id` int(10) unsigned zerofill NOT NULL AUTO_INCREMENT,
  `patientId` varchar(20) DEFAULT NULL,
  `roomType` int DEFAULT NULL,
  `inTime` datetime DEFAULT NULL COMMENT '住院日期,与patient表的admissionTime字段保持一致',
  `outTime` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=64 DEFAULT CHARSET=utf8mb3 COMMENT='床位费用计算表';

-- ----------------------------
-- Records of wardupdate
-- ----------------------------
INSERT INTO `wardupdate` VALUES ('0000000061', '485113494627155968', '1', '2021-08-31 15:47:50', '2021-08-31 15:48:35');
INSERT INTO `wardupdate` VALUES ('0000000062', '485113494627155968', '4', '2021-08-31 15:48:35', null);
INSERT INTO `wardupdate` VALUES ('0000000063', '485378416191733760', '1', '2021-09-01 09:20:32', null);

-- ----------------------------
-- Table structure for withdrawal
-- ----------------------------
DROP TABLE IF EXISTS `withdrawal`;
CREATE TABLE `withdrawal` (
  `id` int(10) unsigned zerofill NOT NULL AUTO_INCREMENT,
  `patientId` varchar(20) DEFAULT NULL,
  `patientName` varchar(20) DEFAULT NULL,
  `count` int DEFAULT NULL,
  `userName` varchar(20) DEFAULT NULL,
  `userId` varchar(20) DEFAULT NULL,
  `drugsId` varchar(20) DEFAULT NULL,
  `entiyTime` date DEFAULT NULL,
  `reason` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8mb3;

-- ----------------------------
-- Records of withdrawal
-- ----------------------------
INSERT INTO `withdrawal` VALUES ('0000000015', '1493657709971', '赵薇', '1', '王飞', 'admin', 'Z0001', '2018-12-25', '过期');
INSERT INTO `withdrawal` VALUES ('0000000016', '1555922984939', '王大拿', '1', '超级管理员', 'admin', 'Z0001', '2019-04-25', '测试');
INSERT INTO `withdrawal` VALUES ('0000000017', '1556762747114', '丁子彧', '1', '超级管理员', 'admin', 'Z1234', '2019-05-23', '多发');
INSERT INTO `withdrawal` VALUES ('0000000020', '484668607406538752', '小刘', '1', '系统管理员', 'manager', 'Z0001', '2021-08-31', '吃了不管用');
INSERT INTO `withdrawal` VALUES ('0000000021', '485113494627155968', '小A', '2', '系统管理员', 'manager', 'Z9999', '2021-08-31', '吃了没作用');

-- ----------------------------
-- Procedure structure for AutoDeleteLogs
-- ----------------------------
DROP PROCEDURE IF EXISTS `AutoDeleteLogs`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `AutoDeleteLogs`()
BEGIN
		DELETE FROM log WHERE DATE(create_time) <= DATE(DATE_SUB(NOW(),INTERVAL 3 DAY)) AND (type = 'DEBUG' OR type = 'INFO');
	END
;;
DELIMITER ;

-- ----------------------------
-- Function structure for currval
-- ----------------------------
DROP FUNCTION IF EXISTS `currval`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `currval`(doctor_id VARCHAR(6)) RETURNS int
    READS SQL DATA
    DETERMINISTIC
BEGIN  
DECLARE VALUE INTEGER;  
SET VALUE = 10001;  
SELECT current_value INTO VALUE FROM doctor WHERE NAME = doctor_id;  
RETURN VALUE;  
END
;;
DELIMITER ;

-- ----------------------------
-- Function structure for nextval
-- ----------------------------
DROP FUNCTION IF EXISTS `nextval`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `nextval`(doctor_id VARCHAR(6)) RETURNS int
    DETERMINISTIC
BEGIN  
UPDATE doctor SET current_value = current_value + increment WHERE Name = doctor_id;  
RETURN currval(seq_name);  
END
;;
DELIMITER ;

-- ----------------------------
-- Event structure for event_AutoDeleteLogs
-- ----------------------------
DROP EVENT IF EXISTS `event_AutoDeleteLogs`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` EVENT `event_AutoDeleteLogs` ON SCHEDULE EVERY 1 DAY STARTS '2019-04-25 00:00:00' ON COMPLETION PRESERVE ENABLE DO CALL AutoDeleteLogs()
;;
DELIMITER ;
DROP TRIGGER IF EXISTS `insert_trigger_on_paracode`;
DELIMITER ;;
CREATE TRIGGER `insert_trigger_on_paracode` AFTER INSERT ON `paracode` FOR EACH ROW BEGIN
IF (new.code = '003') THEN
insert into category(type,name) values(new.parameter_values,new.parameter_name);
END IF;
END
;;
DELIMITER ;
DROP TRIGGER IF EXISTS `update_trigger_on_paracode`;
DELIMITER ;;
CREATE TRIGGER `update_trigger_on_paracode` AFTER UPDATE ON `paracode` FOR EACH ROW BEGIN
IF (new.code = '003') THEN
update category set type=new.parameter_values,name=new.parameter_name where type=new.parameter_values;
END IF;
END
;;
DELIMITER ;
DROP TRIGGER IF EXISTS `delete_trigger_on_paracode`;
DELIMITER ;;
CREATE TRIGGER `delete_trigger_on_paracode` AFTER DELETE ON `paracode` FOR EACH ROW BEGIN
IF (old.code = '004') THEN
delete from bed where ward=old.parameter_values;
END IF;
END
;;
DELIMITER ;
