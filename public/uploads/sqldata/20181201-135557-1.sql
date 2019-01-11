-- -----------------------------
-- Think MySQL Data Transfer 
-- 
-- Host     : 127.0.0.1
-- Port     : 3306
-- Database : ds_mall
-- 
-- Part : #1
-- Date : 2018-12-01 13:55:57
-- -----------------------------

SET FOREIGN_KEY_CHECKS = 0;


-- -----------------------------
-- Table structure for `ds_activity`
-- -----------------------------
DROP TABLE IF EXISTS `ds_activity`;
CREATE TABLE `ds_activity` (
  `activity_id` mediumint(9) NOT NULL AUTO_INCREMENT COMMENT '活动自增ID',
  `activity_title` varchar(255) NOT NULL COMMENT '活动标题',
  `activity_type` enum('1','2') DEFAULT NULL COMMENT '活动类型 1:商品 2:抢购',
  `activity_banner` varchar(255) NOT NULL COMMENT '活动图片',
  `activity_style` varchar(255) NOT NULL COMMENT '活动页面样式',
  `activity_desc` varchar(1000) NOT NULL COMMENT '活动描述',
  `activity_startdate` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '活动开始时间',
  `activity_enddate` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '活动结束时间',
  `activity_sort` tinyint(1) unsigned NOT NULL DEFAULT '255' COMMENT '活动排序',
  `activity_state` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '活动状态 0为关闭 1为开启',
  PRIMARY KEY (`activity_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='活动表';


-- -----------------------------
-- Table structure for `ds_activitydetail`
-- -----------------------------
DROP TABLE IF EXISTS `ds_activitydetail`;
CREATE TABLE `ds_activitydetail` (
  `activitydetail_id` mediumint(9) NOT NULL AUTO_INCREMENT COMMENT '活动详情自增ID',
  `activity_id` mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '活动ID',
  `item_id` int(11) NOT NULL COMMENT '商品或抢购的编号',
  `item_name` varchar(255) NOT NULL COMMENT '商品或抢购名称',
  `store_id` int(11) NOT NULL COMMENT '店铺ID',
  `store_name` varchar(255) NOT NULL COMMENT '店铺名称',
  `activitydetail_state` enum('0','1','2','3') NOT NULL DEFAULT '0' COMMENT '审核状态 0:(默认)待审核 1:通过 2:未通过 3:再次申请',
  `activitydetail_sort` tinyint(1) unsigned NOT NULL DEFAULT '255' COMMENT '活动详情排序',
  PRIMARY KEY (`activitydetail_id`),
  KEY `activity_id` (`activity_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='活动详情表';


-- -----------------------------
-- Table structure for `ds_address`
-- -----------------------------
DROP TABLE IF EXISTS `ds_address`;
CREATE TABLE `ds_address` (
  `address_id` mediumint(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '地址ID',
  `member_id` mediumint(10) unsigned NOT NULL DEFAULT '0' COMMENT '会员ID',
  `address_realname` varchar(50) NOT NULL COMMENT '会员姓名',
  `city_id` mediumint(9) DEFAULT NULL COMMENT '市级ID',
  `area_id` mediumint(10) unsigned NOT NULL DEFAULT '0' COMMENT '地区ID',
  `area_info` varchar(255) NOT NULL DEFAULT '' COMMENT '地区内容',
  `address_detail` varchar(255) NOT NULL COMMENT '详细地址',
  `address_tel_phone` varchar(20) DEFAULT NULL COMMENT '座机',
  `address_mob_phone` varchar(15) DEFAULT NULL COMMENT '手机',
  `address_is_default` enum('0','1') NOT NULL DEFAULT '0' COMMENT '1默认收货地址',
  `dlyp_id` int(11) DEFAULT '0' COMMENT '自提点ID',
  `address_longitude` varchar(20) DEFAULT '' COMMENT '经度',
  `address_latitude` varchar(20) DEFAULT '' COMMENT '纬度',
  PRIMARY KEY (`address_id`),
  KEY `member_id` (`member_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='买家地址信息表';


-- -----------------------------
-- Table structure for `ds_admin`
-- -----------------------------
DROP TABLE IF EXISTS `ds_admin`;
CREATE TABLE `ds_admin` (
  `admin_id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '管理员自增ID',
  `admin_name` varchar(20) NOT NULL COMMENT '管理员名称',
  `admin_password` varchar(32) NOT NULL DEFAULT '' COMMENT '管理员密码',
  `admin_login_time` int(10) NOT NULL DEFAULT '0' COMMENT '登录时间',
  `admin_login_num` int(11) NOT NULL DEFAULT '0' COMMENT '登录次数',
  `admin_is_super` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否超级管理员',
  `admin_gid` smallint(6) DEFAULT '0' COMMENT '权限组ID',
  PRIMARY KEY (`admin_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='管理员表';

-- -----------------------------
-- Records of `ds_admin`
-- -----------------------------
INSERT INTO `ds_admin` VALUES ('1', 'admin', '7fef6171469e80d32c0559f88b377245', '1543637981', '2', '1', '0');

-- -----------------------------
-- Table structure for `ds_adminlog`
-- -----------------------------
DROP TABLE IF EXISTS `ds_adminlog`;
CREATE TABLE `ds_adminlog` (
  `adminlog_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '管理员记录自增ID',
  `admin_id` mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '管理员ID',
  `admin_name` char(20) NOT NULL COMMENT '管理员名称',
  `adminlog_content` varchar(255) NOT NULL COMMENT '操作内容',
  `adminlog_time` int(10) unsigned DEFAULT NULL COMMENT '发生时间',
  `adminlog_ip` char(15) NOT NULL COMMENT '管理员操作IP',
  `adminlog_url` varchar(50) NOT NULL DEFAULT '' COMMENT 'controller/action',
  PRIMARY KEY (`adminlog_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='管理员操作日志';

-- -----------------------------
-- Records of `ds_adminlog`
-- -----------------------------
INSERT INTO `ds_adminlog` VALUES ('1', '1', 'admin', '新增外驻店铺: test', '1543562542', '0.0.0.0', 'Store&newshop_add');

-- -----------------------------
-- Table structure for `ds_adv`
-- -----------------------------
DROP TABLE IF EXISTS `ds_adv`;
CREATE TABLE `ds_adv` (
  `adv_id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT COMMENT '广告自增ID',
  `ap_id` mediumint(8) unsigned NOT NULL COMMENT '广告位ID',
  `adv_title` varchar(255) NOT NULL COMMENT '广告内容描述',
  `adv_link` varchar(255) NOT NULL COMMENT '广告链接地址',
  `adv_code` varchar(1000) DEFAULT NULL COMMENT '广告图片地址',
  `adv_startdate` int(10) DEFAULT NULL COMMENT '广告开始时间',
  `adv_enddate` int(10) DEFAULT NULL COMMENT '广告结束时间',
  `adv_sort` int(10) unsigned DEFAULT '0' COMMENT '广告图片排序',
  `adv_enabled` tinyint(1) unsigned DEFAULT '1' COMMENT '广告是否有效',
  `adv_clicknum` int(10) unsigned DEFAULT '0' COMMENT '广告点击次数',
  `adv_bgcolor` varchar(50) DEFAULT NULL COMMENT '广告背景颜色',
  PRIMARY KEY (`adv_id`)
) ENGINE=InnoDB AUTO_INCREMENT=35 DEFAULT CHARSET=utf8 COMMENT='广告表';

-- -----------------------------
-- Records of `ds_adv`
-- -----------------------------
INSERT INTO `ds_adv` VALUES ('1', '1', '首页轮播图1', '', '5a4341aeb0372.jpg', '1199116800', '1830268800', '0', '1', '0', '');
INSERT INTO `ds_adv` VALUES ('2', '1', '首页轮播图2', '', '5a4341c011073.jpg', '1199116800', '1830268800', '0', '1', '0', '');
INSERT INTO `ds_adv` VALUES ('3', '2', '首页促销图-1', '', '5a4355443eaad.jpg', '1199116800', '1830268800', '0', '1', '0', '');
INSERT INTO `ds_adv` VALUES ('4', '2', '首页促销图-2', '', '5a43555f3590a.jpg', '1199116800', '1830268800', '0', '1', '0', '');
INSERT INTO `ds_adv` VALUES ('5', '2', '首页促销图-3', '', '5a43556e94bb6.jpg', '1199116800', '1830268800', '0', '1', '0', '');
INSERT INTO `ds_adv` VALUES ('6', '2', '首页促销图-4', '', '5a43557f91fb5.jpg', '1199116800', '1830268800', '0', '1', '0', '');
INSERT INTO `ds_adv` VALUES ('7', '2', '首页促销图-5', '', '5a43558d3d004.jpg', '1199116800', '1830268800', '0', '1', '0', '');
INSERT INTO `ds_adv` VALUES ('8', '2', '首页促销图-6', '', '5a4355999c09c.jpg', '1199116800', '1830268800', '0', '1', '0', '');
INSERT INTO `ds_adv` VALUES ('9', '2', '首页促销图-7', '', '5a4355a53c2d4.jpg', '1199116800', '1830268800', '0', '1', '0', '');
INSERT INTO `ds_adv` VALUES ('10', '2', '首页促销图-8', '', '5a4355b51b338.jpg', '1199116800', '1830268800', '0', '1', '0', '');
INSERT INTO `ds_adv` VALUES ('11', '3', '首页-楼层1底部广告', '', '5a435adbf392f.png', '1514304000', '1545840000', '0', '1', '0', '');
INSERT INTO `ds_adv` VALUES ('12', '4', '首页-楼层2底部广告', '', '5a435b549421e.png', '1514304000', '1545840000', '0', '1', '0', '');
INSERT INTO `ds_adv` VALUES ('13', '5', '首页-楼层3底部广告', '', '5a435b7d9f595.png', '1514304000', '1545840000', '0', '1', '0', '');
INSERT INTO `ds_adv` VALUES ('14', '6', '首页-楼层4底部广告', '', '5a435b916f3dd.png', '1514304000', '1545840000', '0', '1', '0', '');
INSERT INTO `ds_adv` VALUES ('15', '7', '首页-楼层5底部广告', '', '5a435b9bdd15c.jpg', '1514304000', '1545840000', '0', '1', '0', '');
INSERT INTO `ds_adv` VALUES ('16', '8', '首页-楼层1侧边广告', '', '5a436c7cb280d.jpg', '1514304000', '1545840000', '0', '1', '0', '');
INSERT INTO `ds_adv` VALUES ('17', '9', '首页-楼层2侧边广告', '', '5a436c8b76e45.jpg', '1514304000', '1545840000', '0', '1', '0', '');
INSERT INTO `ds_adv` VALUES ('18', '10', '首页-楼层3侧边广告', '', '5a436c953dab3.png', '1514304000', '1545840000', '0', '1', '0', '');
INSERT INTO `ds_adv` VALUES ('19', '11', '首页-楼层4侧边广告', '', '5a436ca09a8f4.jpg', '1514304000', '1545840000', '0', '1', '0', '');
INSERT INTO `ds_adv` VALUES ('20', '12', '首页-楼层5侧边广告', '', '5a436cae1b5b3.png', '1514304000', '1545840000', '0', '1', '0', '');
INSERT INTO `ds_adv` VALUES ('21', '13', '手机-促销-左(320X260)', '', '5a44c828b411b.jpg', '1514390400', '1545926400', '0', '1', '0', '');
INSERT INTO `ds_adv` VALUES ('22', '13', '手机-促销-右上(320X130)', '', '5a44c84ace6ca.jpg', '1514390400', '1545926400', '0', '1', '0', '');
INSERT INTO `ds_adv` VALUES ('23', '13', '手机-促销-右下(320X130)', '', '5a44c85ca3b46.jpg', '1514390400', '1545926400', '0', '1', '0', '');
INSERT INTO `ds_adv` VALUES ('24', '14', '手机-轮播图1', '', '5a460095839c8.jpg', '1514476800', '1546012800', '0', '1', '0', '');
INSERT INTO `ds_adv` VALUES ('25', '14', '手机-轮播图2', '', '5a4600a260e0f.jpg', '1514476800', '1546012800', '0', '1', '0', '');
INSERT INTO `ds_adv` VALUES ('26', '14', '手机-轮播图3', '', '5a4600c518da8.jpg', '1514476800', '1546012800', '0', '1', '0', '');
INSERT INTO `ds_adv` VALUES ('27', '15', '分类', 'mall/product_first_categroy.html', '5a4600c518da81.png', '1514476800', '1546012800', '0', '1', '0', '');
INSERT INTO `ds_adv` VALUES ('28', '15', '购物车', 'mall/cart_list.html', '5a4600c518da82.png', '1514476800', '1546012800', '0', '1', '0', '');
INSERT INTO `ds_adv` VALUES ('29', '15', '我的商城', 'member/member.html', '5a4600c518da83.png', '1514476800', '1546012800', '0', '1', '0', '');
INSERT INTO `ds_adv` VALUES ('30', '15', '每日签到', 'member/signin.html', '5a4600c518da84.png', '1514476800', '1546012800', '0', '1', '0', '');
INSERT INTO `ds_adv` VALUES ('31', '15', '商城拼团', 'mall/pintuan_list.html', '5a4600c518da85.png', '1514476800', '1546012800', '0', '1', '0', '');
INSERT INTO `ds_adv` VALUES ('32', '15', '积分兑换', 'mall/pointspro_list.html', '5a4600c518da86.png', '1514476800', '1546012800', '0', '1', '0', '');
INSERT INTO `ds_adv` VALUES ('33', '15', '附近店铺', 'mall/store_nearby.html', '5a4600c518da87.png', '1514476800', '1546012800', '0', '1', '0', '');
INSERT INTO `ds_adv` VALUES ('34', '15', '商城帮助', 'mall/article_class.html', '5a4600c518da88.png', '1514476800', '1546012800', '0', '1', '0', '');

-- -----------------------------
-- Table structure for `ds_advposition`
-- -----------------------------
DROP TABLE IF EXISTS `ds_advposition`;
CREATE TABLE `ds_advposition` (
  `ap_id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT COMMENT '广告位置自增ID',
  `ap_name` varchar(100) NOT NULL COMMENT '广告位名称',
  `ap_intro` varchar(255) NOT NULL COMMENT '广告位简介',
  `ap_isuse` smallint(1) unsigned NOT NULL COMMENT '广告位是否启用：0不启用1启用',
  `ap_width` int(10) DEFAULT '0' COMMENT '广告位宽度',
  `ap_height` int(10) DEFAULT '0' COMMENT '广告位高度',
  PRIMARY KEY (`ap_id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8 COMMENT='广告位表';

-- -----------------------------
-- Records of `ds_advposition`
-- -----------------------------
INSERT INTO `ds_advposition` VALUES ('1', '首页-轮播图', '', '1', '1200', '1200');
INSERT INTO `ds_advposition` VALUES ('2', '首页-促销图', '', '1', '240', '164');
INSERT INTO `ds_advposition` VALUES ('3', '首页-楼层1底部广告', '', '1', '1200', '125');
INSERT INTO `ds_advposition` VALUES ('4', '首页-楼层2底部广告', '', '1', '1200', '125');
INSERT INTO `ds_advposition` VALUES ('5', '首页-楼层3底部广告', '', '1', '1200', '125');
INSERT INTO `ds_advposition` VALUES ('6', '首页-楼层4底部广告', '', '1', '1200', '125');
INSERT INTO `ds_advposition` VALUES ('7', '首页-楼层5底部广告', '', '1', '1200', '125');
INSERT INTO `ds_advposition` VALUES ('8', '首页-楼层1侧边广告', '', '1', '210', '210');
INSERT INTO `ds_advposition` VALUES ('9', '首页-楼层2侧边广告', '', '1', '210', '210');
INSERT INTO `ds_advposition` VALUES ('10', '首页-楼层3侧边广告', '', '1', '210', '210');
INSERT INTO `ds_advposition` VALUES ('11', '首页-楼层4侧边广告', '', '1', '210', '210');
INSERT INTO `ds_advposition` VALUES ('12', '首页-楼层5侧边广告', '', '1', '210', '210');
INSERT INTO `ds_advposition` VALUES ('13', '手机-首页-促销', '', '1', '0', '0');
INSERT INTO `ds_advposition` VALUES ('14', '手机-首页-轮播图', '', '1', '720', '320');
INSERT INTO `ds_advposition` VALUES ('15', '手机-首页-快捷导航', '', '1', '80', '80');
INSERT INTO `ds_advposition` VALUES ('16', '闲置首页中部横栏广告', '', '1', '1200', '61');
INSERT INTO `ds_advposition` VALUES ('17', '闲置首页中部短栏广告1', '', '1', '290', '100');
INSERT INTO `ds_advposition` VALUES ('18', '闲置首页中部短栏广告2', '', '1', '290', '100');
INSERT INTO `ds_advposition` VALUES ('19', '闲置首页中部短栏广告3', '', '1', '290', '100');
INSERT INTO `ds_advposition` VALUES ('20', '闲置首页中部短栏广告4', '', '1', '290', '100');

-- -----------------------------
-- Table structure for `ds_albumclass`
-- -----------------------------
DROP TABLE IF EXISTS `ds_albumclass`;
CREATE TABLE `ds_albumclass` (
  `aclass_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '相册自增ID',
  `aclass_name` varchar(100) NOT NULL COMMENT '相册名称',
  `store_id` int(10) unsigned NOT NULL COMMENT '店铺id',
  `aclass_des` varchar(255) NOT NULL COMMENT '相册描述',
  `aclass_sort` tinyint(3) unsigned NOT NULL COMMENT '相册排序',
  `aclass_cover` varchar(255) DEFAULT NULL COMMENT '相册封面',
  `aclass_uploadtime` int(10) unsigned NOT NULL COMMENT '图片上传时间',
  `aclass_isdefault` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '是否为默认相册,1代表默认',
  PRIMARY KEY (`aclass_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COMMENT='相册表';

-- -----------------------------
-- Records of `ds_albumclass`
-- -----------------------------
INSERT INTO `ds_albumclass` VALUES ('1', '默认相册', '1', '1', '255', '', '1506020826', '1');
INSERT INTO `ds_albumclass` VALUES ('2', '默认相册', '2', '', '255', '', '1543562542', '1');
INSERT INTO `ds_albumclass` VALUES ('3', '213231321', '1', '213', '213', '', '1543573622', '0');

-- -----------------------------
-- Table structure for `ds_albumpic`
-- -----------------------------
DROP TABLE IF EXISTS `ds_albumpic`;
CREATE TABLE `ds_albumpic` (
  `apic_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '相册图片自增ID',
  `apic_name` varchar(100) NOT NULL COMMENT '图片名称',
  `apic_tag` varchar(255) NOT NULL COMMENT '图片标签',
  `aclass_id` int(10) unsigned NOT NULL COMMENT '相册ID',
  `apic_cover` varchar(255) NOT NULL COMMENT '图片路径',
  `apic_size` int(10) unsigned NOT NULL COMMENT '图片大小',
  `apic_spec` varchar(100) NOT NULL COMMENT '图片规格',
  `store_id` int(10) unsigned NOT NULL COMMENT '店铺id',
  `apic_uploadtime` int(10) unsigned NOT NULL COMMENT '图片上传时间',
  PRIMARY KEY (`apic_id`)
) ENGINE=InnoDB AUTO_INCREMENT=117 DEFAULT CHARSET=utf8 COMMENT='相册图片表';

-- -----------------------------
-- Records of `ds_albumpic`
-- -----------------------------
INSERT INTO `ds_albumpic` VALUES ('1', '1_2017092120144795113.jpg', '', '0', '1_2017092120144795113.jpg', '0', '800x800', '1', '1505996087');
INSERT INTO `ds_albumpic` VALUES ('2', '1_2017092120244885492.jpg', '', '0', '1_2017092120244885492.jpg', '0', '800x800', '1', '1505996688');
INSERT INTO `ds_albumpic` VALUES ('3', '1_2017092120312320763.jpg', '', '0', '1_2017092120312320763.jpg', '0', '800x800', '1', '1505997083');
INSERT INTO `ds_albumpic` VALUES ('4', '1_2017092120345719915.jpg', '', '0', '1_2017092120345719915.jpg', '0', '800x800', '1', '1505997297');
INSERT INTO `ds_albumpic` VALUES ('5', '1_2017092120365848023.jpg', '', '0', '1_2017092120365848023.jpg', '0', '800x800', '1', '1505997418');
INSERT INTO `ds_albumpic` VALUES ('6', '1_2017092120382376796.jpg', '', '0', '1_2017092120382376796.jpg', '0', '800x800', '1', '1505997503');
INSERT INTO `ds_albumpic` VALUES ('7', '1_2017092120445748551.jpg', '', '0', '1_2017092120445748551.jpg', '0', '800x800', '1', '1505997897');
INSERT INTO `ds_albumpic` VALUES ('8', '1_2017092120480147477.jpg', '', '0', '1_2017092120480147477.jpg', '0', '800x800', '1', '1505998081');
INSERT INTO `ds_albumpic` VALUES ('9', '1_2017092120493430154.jpg', '', '0', '1_2017092120493430154.jpg', '0', '800x800', '1', '1505998174');
INSERT INTO `ds_albumpic` VALUES ('10', '1_2017092120564717575.jpg', '', '0', '1_2017092120564717575.jpg', '0', '800x800', '1', '1505998607');
INSERT INTO `ds_albumpic` VALUES ('11', '1_2017092121050988491.jpg', '', '0', '1_2017092121050988491.jpg', '0', '800x800', '1', '1505999109');
INSERT INTO `ds_albumpic` VALUES ('12', '1_2017092121142556524.jpg', '', '0', '1_2017092121142556524.jpg', '0', '800x800', '1', '1505999665');
INSERT INTO `ds_albumpic` VALUES ('13', '1_2017092121225164684.jpg', '', '0', '1_2017092121225164684.jpg', '0', '800x800', '1', '1506000171');
INSERT INTO `ds_albumpic` VALUES ('14', '1_2017092121260662503.jpg', '', '0', '1_2017092121260662503.jpg', '0', '800x800', '1', '1506000366');
INSERT INTO `ds_albumpic` VALUES ('15', '1_2017092121492327671.jpg', '', '0', '1_2017092121492327671.jpg', '0', '800x800', '1', '1506001763');
INSERT INTO `ds_albumpic` VALUES ('16', '1_2017092121542617701.jpg', '', '0', '1_2017092121542617701.jpg', '0', '800x800', '1', '1506002066');
INSERT INTO `ds_albumpic` VALUES ('17', '1_2017092121564484910.jpg', '', '0', '1_2017092121564484910.jpg', '0', '800x800', '1', '1506002204');
INSERT INTO `ds_albumpic` VALUES ('18', '1_2017092122005521920.jpg', '', '0', '1_2017092122005521920.jpg', '0', '800x800', '1', '1506002455');
INSERT INTO `ds_albumpic` VALUES ('19', '1_2017092122035543274.jpg', '', '0', '1_2017092122035543274.jpg', '0', '800x800', '1', '1506002635');
INSERT INTO `ds_albumpic` VALUES ('20', '1_2017092123585272874.jpg', '', '0', '1_2017092123585272874.jpg', '0', '800x800', '1', '1506009532');
INSERT INTO `ds_albumpic` VALUES ('21', '1_2017092200403659812.jpg', '', '0', '1_2017092200403659812.jpg', '0', '800x800', '1', '1506012036');
INSERT INTO `ds_albumpic` VALUES ('22', '1_2017092201034951336.jpg', '', '0', '1_2017092201034951336.jpg', '0', '800x800', '1', '1506013429');
INSERT INTO `ds_albumpic` VALUES ('23', '1_2017092201084565859.jpg', '', '0', '1_2017092201084565859.jpg', '0', '800x800', '1', '1506013725');
INSERT INTO `ds_albumpic` VALUES ('24', '1_2017092201381015306.jpg', '', '0', '1_2017092201381015306.jpg', '0', '220x220', '1', '1506015490');
INSERT INTO `ds_albumpic` VALUES ('25', '1_2017092201461861948.jpg', '', '0', '1_2017092201461861948.jpg', '0', '800x800', '1', '1506015978');
INSERT INTO `ds_albumpic` VALUES ('26', '1_2017092201523177266.jpg', '', '0', '1_2017092201523177266.jpg', '0', '800x800', '1', '1506016351');
INSERT INTO `ds_albumpic` VALUES ('27', '1_2017092202022516767.jpg', '', '0', '1_2017092202022516767.jpg', '0', '800x800', '1', '1506016945');
INSERT INTO `ds_albumpic` VALUES ('28', '1_2017092202082283957.jpg', '', '0', '1_2017092202082283957.jpg', '0', '800x800', '1', '1506017302');
INSERT INTO `ds_albumpic` VALUES ('29', '1_2017092202112937358.jpg', '', '0', '1_2017092202112937358.jpg', '0', '800x800', '1', '1506017489');
INSERT INTO `ds_albumpic` VALUES ('30', '1_2017092202162519571.jpg', '', '0', '1_2017092202162519571.jpg', '0', '800x800', '1', '1506017785');
INSERT INTO `ds_albumpic` VALUES ('31', '1_2017092202215519250.jpg', '', '0', '1_2017092202215519250.jpg', '0', '800x800', '1', '1506018115');
INSERT INTO `ds_albumpic` VALUES ('32', '1_2017092202310929808.jpg', '', '0', '1_2017092202310929808.jpg', '0', '800x800', '1', '1506018669');
INSERT INTO `ds_albumpic` VALUES ('33', '1_2017092202323192694.jpg', '', '0', '1_2017092202323192694.jpg', '0', '800x800', '1', '1506018751');
INSERT INTO `ds_albumpic` VALUES ('34', '1_2017092202350299027.jpg', '', '0', '1_2017092202350299027.jpg', '0', '800x800', '1', '1506018902');
INSERT INTO `ds_albumpic` VALUES ('35', '1_2017092202382291274.jpg', '', '0', '1_2017092202382291274.jpg', '0', '800x800', '1', '1506019102');
INSERT INTO `ds_albumpic` VALUES ('36', '1_2017092202443553519.jpg', '', '0', '1_2017092202443553519.jpg', '0', '800x800', '1', '1506019475');
INSERT INTO `ds_albumpic` VALUES ('37', '1_2017092202461115940.jpg', '', '0', '1_2017092202461115940.jpg', '0', '800x800', '1', '1506019571');
INSERT INTO `ds_albumpic` VALUES ('38', '1_2017092202492958131.jpg', '', '0', '1_2017092202492958131.jpg', '0', '800x800', '1', '1506019769');
INSERT INTO `ds_albumpic` VALUES ('39', '1_2017092202514891485.jpg', '', '0', '1_2017092202514891485.jpg', '0', '800x800', '1', '1506019908');
INSERT INTO `ds_albumpic` VALUES ('40', '1_2017092202553367071.jpg', '', '0', '1_2017092202553367071.jpg', '0', '800x800', '1', '1506020133');
INSERT INTO `ds_albumpic` VALUES ('41', '1_2017092202585843151.jpg', '', '0', '1_2017092202585843151.jpg', '0', '800x800', '1', '1506020338');
INSERT INTO `ds_albumpic` VALUES ('42', '1_2017092203045216863.jpg', '', '0', '1_2017092203045216863.jpg', '0', '800x800', '1', '1506020692');
INSERT INTO `ds_albumpic` VALUES ('43', '1_2017092203062937149.jpg', '', '0', '1_2017092203062937149.jpg', '0', '800x800', '1', '1506020789');
INSERT INTO `ds_albumpic` VALUES ('44', '1_2017092203072292427.jpg', '', '1', '1_2017092203072292427.jpg', '131950', '800x800', '1', '1506020842');
INSERT INTO `ds_albumpic` VALUES ('45', '1_2017092203072777906.jpg', '', '1', '1_2017092203072777906.jpg', '120853', '800x800', '1', '1506020847');
INSERT INTO `ds_albumpic` VALUES ('46', '1_2017092203083967214.jpg', '', '1', '1_2017092203083967214.jpg', '0', '800x800', '1', '1506020919');
INSERT INTO `ds_albumpic` VALUES ('47', '1_2017092203123417256.jpg', '', '1', '1_2017092203123417256.jpg', '0', '800x800', '1', '1506021154');
INSERT INTO `ds_albumpic` VALUES ('48', '1_2017092203151752294.jpg', '', '1', '1_2017092203151752294.jpg', '0', '800x800', '1', '1506021317');
INSERT INTO `ds_albumpic` VALUES ('49', '1_2017092203175020843.jpg', '', '1', '1_2017092203175020843.jpg', '0', '800x800', '1', '1506021470');
INSERT INTO `ds_albumpic` VALUES ('50', '1_2017092203201884569.jpg', '', '1', '1_2017092203201884569.jpg', '0', '800x800', '1', '1506021618');
INSERT INTO `ds_albumpic` VALUES ('51', '1_2017092203242754461.jpg', '', '1', '1_2017092203242754461.jpg', '0', '800x800', '1', '1506021867');
INSERT INTO `ds_albumpic` VALUES ('52', '1_2017092203261873185.jpg', '', '1', '1_2017092203261873185.jpg', '0', '800x800', '1', '1506021978');
INSERT INTO `ds_albumpic` VALUES ('53', '1_2017092203275599920.jpg', '', '1', '1_2017092203275599920.jpg', '0', '800x800', '1', '1506022075');
INSERT INTO `ds_albumpic` VALUES ('54', '1_2017092203294765362.jpg', '', '1', '1_2017092203294765362.jpg', '0', '800x800', '1', '1506022187');
INSERT INTO `ds_albumpic` VALUES ('55', '1_2017092203321969628.jpg', '', '1', '1_2017092203321969628.jpg', '0', '800x800', '1', '1506022339');
INSERT INTO `ds_albumpic` VALUES ('56', '1_2017092203335981358.jpg', '', '1', '1_2017092203335981358.jpg', '0', '800x800', '1', '1506022439');
INSERT INTO `ds_albumpic` VALUES ('57', '1_2017092203371485168.jpg', '', '1', '1_2017092203371485168.jpg', '0', '800x800', '1', '1506022634');
INSERT INTO `ds_albumpic` VALUES ('58', '1_2017092821352360295.jpg', '', '1', '1_2017092821352360295.jpg', '0', '430x430', '1', '1506605723');
INSERT INTO `ds_albumpic` VALUES ('59', '1_2017092821383373641.jpg', '', '1', '1_2017092821383373641.jpg', '0', '430x430', '1', '1506605913');
INSERT INTO `ds_albumpic` VALUES ('60', '1_2017092821403589442.jpg', '', '1', '1_2017092821403589442.jpg', '0', '379x400', '1', '1506606035');
INSERT INTO `ds_albumpic` VALUES ('61', '1_2017092821431519588.jpg', '', '1', '1_2017092821431519588.jpg', '0', '400x400', '1', '1506606195');
INSERT INTO `ds_albumpic` VALUES ('62', '1_2017092821510935694.jpg', '', '1', '1_2017092821510935694.jpg', '0', '430x430', '1', '1506606669');
INSERT INTO `ds_albumpic` VALUES ('63', '1_2017092821530372212.jpg', '', '1', '1_2017092821530372212.jpg', '0', '430x430', '1', '1506606783');
INSERT INTO `ds_albumpic` VALUES ('64', '1_2017092821544898610.jpg', '', '1', '1_2017092821544898610.jpg', '0', '430x430', '1', '1506606888');
INSERT INTO `ds_albumpic` VALUES ('65', '1_2017092821585013652.jpg', '', '1', '1_2017092821585013652.jpg', '0', '400x380', '1', '1506607130');
INSERT INTO `ds_albumpic` VALUES ('66', '1_2017092822032535526.jpg', '', '1', '1_2017092822032535526.jpg', '0', '430x430', '1', '1506607405');
INSERT INTO `ds_albumpic` VALUES ('67', '1_2017092822050083427.jpg', '', '1', '1_2017092822050083427.jpg', '0', '430x430', '1', '1506607500');
INSERT INTO `ds_albumpic` VALUES ('68', '1_2017092822064182226.jpg', '', '1', '1_2017092822064182226.jpg', '0', '430x430', '1', '1506607601');
INSERT INTO `ds_albumpic` VALUES ('69', '1_2017092823485490716.jpg', '', '1', '1_2017092823485490716.jpg', '0', '430x430', '1', '1506613734');
INSERT INTO `ds_albumpic` VALUES ('70', '1_2017092823501155931.jpg', '', '1', '1_2017092823501155931.jpg', '0', '400x400', '1', '1506613811');
INSERT INTO `ds_albumpic` VALUES ('71', '1_2017092823531033711.jpg', '', '1', '1_2017092823531033711.jpg', '0', '430x430', '1', '1506613990');
INSERT INTO `ds_albumpic` VALUES ('72', '1_2017092900001256656.jpg', '', '1', '1_2017092900001256656.jpg', '0', '430x430', '1', '1506614412');
INSERT INTO `ds_albumpic` VALUES ('73', '1_2017092900022214210.jpg', '', '1', '1_2017092900022214210.jpg', '0', '430x430', '1', '1506614542');
INSERT INTO `ds_albumpic` VALUES ('74', '1_2017092900033832502.jpg', '', '1', '1_2017092900033832502.jpg', '0', '430x430', '1', '1506614618');
INSERT INTO `ds_albumpic` VALUES ('75', '1_2017092900052977159.jpg', '', '1', '1_2017092900052977159.jpg', '0', '430x430', '1', '1506614729');
INSERT INTO `ds_albumpic` VALUES ('76', '1_2017092900064438234.jpg', '', '1', '1_2017092900064438234.jpg', '0', '430x430', '1', '1506614804');
INSERT INTO `ds_albumpic` VALUES ('77', '1_2017092900081355788.jpg', '', '1', '1_2017092900081355788.jpg', '0', '430x430', '1', '1506614893');
INSERT INTO `ds_albumpic` VALUES ('78', '1_2017092900095941942.jpg', '', '1', '1_2017092900095941942.jpg', '0', '430x430', '1', '1506614999');
INSERT INTO `ds_albumpic` VALUES ('79', '1_2017092900115721538.jpg', '', '1', '1_2017092900115721538.jpg', '0', '430x430', '1', '1506615117');
INSERT INTO `ds_albumpic` VALUES ('80', '1_2017092900132832208.jpg', '', '1', '1_2017092900132832208.jpg', '0', '400x400', '1', '1506615208');
INSERT INTO `ds_albumpic` VALUES ('81', '1_2017092900144267524.jpg', '', '1', '1_2017092900144267524.jpg', '0', '430x430', '1', '1506615282');
INSERT INTO `ds_albumpic` VALUES ('82', '1_2017092900175249561.jpg', '', '1', '1_2017092900175249561.jpg', '0', '400x400', '1', '1506615472');
INSERT INTO `ds_albumpic` VALUES ('83', '1_2017092900220838539.jpg', '', '1', '1_2017092900220838539.jpg', '0', '800x800', '1', '1506615728');
INSERT INTO `ds_albumpic` VALUES ('84', '1_2017092900242419538.jpg', '', '1', '1_2017092900242419538.jpg', '0', '800x800', '1', '1506615864');
INSERT INTO `ds_albumpic` VALUES ('85', '1_2017092900261952044.jpg', '', '1', '1_2017092900261952044.jpg', '0', '430x430', '1', '1506615979');
INSERT INTO `ds_albumpic` VALUES ('86', '1_2017092900363278117.jpg', '', '1', '1_2017092900363278117.jpg', '0', '400x400', '1', '1506616592');
INSERT INTO `ds_albumpic` VALUES ('87', '1_2017092900412680293.jpg', '', '1', '1_2017092900412680293.jpg', '0', '400x400', '1', '1506616886');
INSERT INTO `ds_albumpic` VALUES ('88', '1_2017092900450210134.jpg', '', '1', '1_2017092900450210134.jpg', '0', '800x800', '1', '1506617102');
INSERT INTO `ds_albumpic` VALUES ('89', '1_2017092900501117171.jpg', '', '1', '1_2017092900501117171.jpg', '0', '430x430', '1', '1506617411');
INSERT INTO `ds_albumpic` VALUES ('90', '1_2017092900544928056.jpg', '', '1', '1_2017092900544928056.jpg', '0', '430x430', '1', '1506617689');
INSERT INTO `ds_albumpic` VALUES ('91', '1_2017092901044975398.jpg', '', '1', '1_2017092901044975398.jpg', '0', '430x430', '1', '1506618290');
INSERT INTO `ds_albumpic` VALUES ('92', '1_2017092901063965472.jpg', '', '1', '1_2017092901063965472.jpg', '0', '430x430', '1', '1506618399');
INSERT INTO `ds_albumpic` VALUES ('93', '1_2017092901082884641.jpg', '', '1', '1_2017092901082884641.jpg', '0', '430x430', '1', '1506618508');
INSERT INTO `ds_albumpic` VALUES ('94', '1_2017092901111615092.jpg', '', '1', '1_2017092901111615092.jpg', '0', '400x400', '1', '1506618676');
INSERT INTO `ds_albumpic` VALUES ('95', '1_2017092901182073726.jpg', '', '1', '1_2017092901182073726.jpg', '0', '400x400', '1', '1506619100');
INSERT INTO `ds_albumpic` VALUES ('96', '1_2017092901201262580.jpg', '', '1', '1_2017092901201262580.jpg', '0', '430x430', '1', '1506619212');
INSERT INTO `ds_albumpic` VALUES ('97', '1_2017092901242476412.jpg', '', '1', '1_2017092901242476412.jpg', '0', '430x430', '1', '1506619464');
INSERT INTO `ds_albumpic` VALUES ('98', '1_2017092901271966752.jpg', '', '1', '1_2017092901271966752.jpg', '0', '400x400', '1', '1506619639');
INSERT INTO `ds_albumpic` VALUES ('99', '1_2017092901284880537.jpg', '', '1', '1_2017092901284880537.jpg', '0', '430x430', '1', '1506619728');
INSERT INTO `ds_albumpic` VALUES ('100', '1_2017092901314252467.jpg', '', '1', '1_2017092901314252467.jpg', '0', '430x430', '1', '1506619902');
INSERT INTO `ds_albumpic` VALUES ('101', '1_2017092901331891773.jpg', '', '1', '1_2017092901331891773.jpg', '0', '430x430', '1', '1506619998');
INSERT INTO `ds_albumpic` VALUES ('102', '1_2017092901395681652.jpg', '', '1', '1_2017092901395681652.jpg', '0', '430x430', '1', '1506620396');
INSERT INTO `ds_albumpic` VALUES ('103', '1_2017092901414663050.jpg', '', '1', '1_2017092901414663050.jpg', '0', '400x400', '1', '1506620506');
INSERT INTO `ds_albumpic` VALUES ('104', '1_2017092901444780977.jpg', '', '1', '1_2017092901444780977.jpg', '0', '430x430', '1', '1506620687');
INSERT INTO `ds_albumpic` VALUES ('105', '1_2017092901470136191.jpg', '', '1', '1_2017092901470136191.jpg', '0', '1200x1200', '1', '1506620821');
INSERT INTO `ds_albumpic` VALUES ('106', '1_2017092901492561069.jpg', '', '1', '1_2017092901492561069.jpg', '0', '430x430', '1', '1506620965');
INSERT INTO `ds_albumpic` VALUES ('107', '1_2017092901531025952.jpg', '', '1', '1_2017092901531025952.jpg', '0', '430x430', '1', '1506621190');
INSERT INTO `ds_albumpic` VALUES ('108', '1_2017092901561798176.jpg', '', '1', '1_2017092901561798176.jpg', '0', '400x400', '1', '1506621377');
INSERT INTO `ds_albumpic` VALUES ('109', '1_2017092901584247144.jpg', '', '1', '1_2017092901584247144.jpg', '0', '430x430', '1', '1506621522');
INSERT INTO `ds_albumpic` VALUES ('110', '1_2017092902070476170.jpg', '', '1', '1_2017092902070476170.jpg', '0', '430x430', '1', '1506622024');
INSERT INTO `ds_albumpic` VALUES ('111', '1_2017092902123493954.jpg', '', '1', '1_2017092902123493954.jpg', '0', '430x430', '1', '1506622354');
INSERT INTO `ds_albumpic` VALUES ('112', '1_2017092902135876412.jpg', '', '1', '1_2017092902135876412.jpg', '0', '400x400', '1', '1506622438');
INSERT INTO `ds_albumpic` VALUES ('113', '1_2017092902182426089.jpg', '', '1', '1_2017092902182426089.jpg', '0', '430x430', '1', '1506622704');
INSERT INTO `ds_albumpic` VALUES ('115', '1_2017092902341762945.jpg', '', '1', '1_2017092902341762945.jpg', '0', '430x430', '1', '1506623657');
INSERT INTO `ds_albumpic` VALUES ('116', '1_2017092902405679397.jpg', '', '1', '1_2017092902405679397.jpg', '0', '430x430', '1', '1506624056');

-- -----------------------------
-- Table structure for `ds_appadv`
-- -----------------------------
DROP TABLE IF EXISTS `ds_appadv`;
CREATE TABLE `ds_appadv` (
  `adv_id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT COMMENT 'APP广告自增ID',
  `ap_id` mediumint(8) unsigned NOT NULL COMMENT 'APP广告位ID',
  `adv_title` varchar(255) NOT NULL COMMENT 'APP广告内容描述',
  `adv_type` varchar(255) DEFAULT NULL COMMENT 'APP广告类型,goods,store,article',
  `adv_typedate` tinyint(10) DEFAULT NULL COMMENT 'APP广告类型对应的值,判断具体跳转内容',
  `adv_code` varchar(1000) DEFAULT NULL COMMENT 'APP广告图片地址',
  `adv_startdate` int(10) DEFAULT NULL COMMENT 'APP广告开始时间',
  `adv_enddate` int(10) DEFAULT NULL COMMENT 'APP广告结束时间',
  `adv_sort` int(10) unsigned DEFAULT '0' COMMENT 'APP广告图片排序',
  `adv_enabled` tinyint(1) unsigned DEFAULT '1' COMMENT 'APP广告是否有效',
  PRIMARY KEY (`adv_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='APP广告表';


-- -----------------------------
-- Table structure for `ds_appadvposition`
-- -----------------------------
DROP TABLE IF EXISTS `ds_appadvposition`;
CREATE TABLE `ds_appadvposition` (
  `ap_id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT COMMENT 'APP广告位自增ID',
  `ap_name` varchar(100) NOT NULL COMMENT 'APP广告位名称',
  `ap_intro` varchar(255) NOT NULL COMMENT 'APP广告位简介',
  `ap_isuse` smallint(1) unsigned NOT NULL COMMENT 'APP广告位是否启用：0不启用1启用',
  `ap_width` int(10) DEFAULT '0' COMMENT 'APP广告位宽度',
  `ap_height` int(10) DEFAULT '0' COMMENT 'APP广告位高度',
  PRIMARY KEY (`ap_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='APP广告位表';


-- -----------------------------
-- Table structure for `ds_area`
-- -----------------------------
DROP TABLE IF EXISTS `ds_area`;
CREATE TABLE `ds_area` (
  `area_id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '地区自增ID',
  `area_name` varchar(50) NOT NULL COMMENT '地区名称',
  `area_parent_id` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '地区上级ID',
  `area_sort` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '地区排序',
  `area_deep` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '地区深度',
  `area_region` varchar(3) DEFAULT NULL COMMENT '大区名称',
  PRIMARY KEY (`area_id`),
  KEY `area_parent_id` (`area_parent_id`)
) ENGINE=InnoDB AUTO_INCREMENT=45056 DEFAULT CHARSET=utf8 COMMENT='地区表';

-- -----------------------------
-- Records of `ds_area`
-- -----------------------------
INSERT INTO `ds_area` VALUES ('1', '北京', '0', '0', '1', '华北');
INSERT INTO `ds_area` VALUES ('2', '天津', '0', '0', '1', '华北');
INSERT INTO `ds_area` VALUES ('3', '河北', '0', '0', '1', '华北');
INSERT INTO `ds_area` VALUES ('4', '山西', '0', '0', '1', '华北');
INSERT INTO `ds_area` VALUES ('5', '内蒙古', '0', '0', '1', '华北');
INSERT INTO `ds_area` VALUES ('6', '辽宁', '0', '0', '1', '东北');
INSERT INTO `ds_area` VALUES ('7', '吉林', '0', '0', '1', '东北');
INSERT INTO `ds_area` VALUES ('8', '黑龙江', '0', '0', '1', '东北');
INSERT INTO `ds_area` VALUES ('9', '上海', '0', '0', '1', '华东');
INSERT INTO `ds_area` VALUES ('10', '江苏', '0', '0', '1', '华东');
INSERT INTO `ds_area` VALUES ('11', '浙江', '0', '0', '1', '华东');
INSERT INTO `ds_area` VALUES ('12', '安徽', '0', '0', '1', '华东');
INSERT INTO `ds_area` VALUES ('13', '福建', '0', '0', '1', '华南');
INSERT INTO `ds_area` VALUES ('14', '江西', '0', '0', '1', '华东');
INSERT INTO `ds_area` VALUES ('15', '山东', '0', '0', '1', '华东');
INSERT INTO `ds_area` VALUES ('16', '河南', '0', '0', '1', '华中');
INSERT INTO `ds_area` VALUES ('17', '湖北', '0', '0', '1', '华中');
INSERT INTO `ds_area` VALUES ('18', '湖南', '0', '0', '1', '华中');
INSERT INTO `ds_area` VALUES ('19', '广东', '0', '0', '1', '华南');
INSERT INTO `ds_area` VALUES ('20', '广西', '0', '0', '1', '华南');
INSERT INTO `ds_area` VALUES ('21', '海南', '0', '0', '1', '华南');
INSERT INTO `ds_area` VALUES ('22', '重庆', '0', '0', '1', '西南');
INSERT INTO `ds_area` VALUES ('23', '四川', '0', '0', '1', '西南');
INSERT INTO `ds_area` VALUES ('24', '贵州', '0', '0', '1', '西南');
INSERT INTO `ds_area` VALUES ('25', '云南', '0', '0', '1', '西南');
INSERT INTO `ds_area` VALUES ('26', '西藏', '0', '0', '1', '西南');
INSERT INTO `ds_area` VALUES ('27', '陕西', '0', '0', '1', '西北');
INSERT INTO `ds_area` VALUES ('28', '甘肃', '0', '0', '1', '西北');
INSERT INTO `ds_area` VALUES ('29', '青海', '0', '0', '1', '西北');
INSERT INTO `ds_area` VALUES ('30', '宁夏', '0', '0', '1', '西北');
INSERT INTO `ds_area` VALUES ('31', '新疆', '0', '0', '1', '西北');
INSERT INTO `ds_area` VALUES ('32', '台湾', '0', '0', '1', '港澳台');
INSERT INTO `ds_area` VALUES ('33', '香港', '0', '0', '1', '港澳台');
INSERT INTO `ds_area` VALUES ('34', '澳门', '0', '0', '1', '港澳台');
INSERT INTO `ds_area` VALUES ('35', '海外', '0', '0', '1', '海外');
INSERT INTO `ds_area` VALUES ('36', '北京市', '1', '0', '2', '');
INSERT INTO `ds_area` VALUES ('37', '东城区', '36', '0', '3', '');
INSERT INTO `ds_area` VALUES ('38', '西城区', '36', '0', '3', '');
INSERT INTO `ds_area` VALUES ('39', '上海市', '9', '0', '2', '');
INSERT INTO `ds_area` VALUES ('40', '天津市', '2', '0', '2', '');
INSERT INTO `ds_area` VALUES ('41', '朝阳区', '36', '0', '3', '');
INSERT INTO `ds_area` VALUES ('42', '丰台区', '36', '0', '3', '');
INSERT INTO `ds_area` VALUES ('43', '石景山区', '36', '0', '3', '');
INSERT INTO `ds_area` VALUES ('44', '海淀区', '36', '0', '3', '');
INSERT INTO `ds_area` VALUES ('45', '门头沟区', '36', '0', '3', '');
INSERT INTO `ds_area` VALUES ('46', '房山区', '36', '0', '3', '');
INSERT INTO `ds_area` VALUES ('47', '通州区', '36', '0', '3', '');
INSERT INTO `ds_area` VALUES ('48', '顺义区', '36', '0', '3', '');
INSERT INTO `ds_area` VALUES ('49', '昌平区', '36', '0', '3', '');
INSERT INTO `ds_area` VALUES ('50', '大兴区', '36', '0', '3', '');
INSERT INTO `ds_area` VALUES ('51', '怀柔区', '36', '0', '3', '');
INSERT INTO `ds_area` VALUES ('52', '平谷区', '36', '0', '3', '');
INSERT INTO `ds_area` VALUES ('53', '密云县', '36', '0', '3', '');
INSERT INTO `ds_area` VALUES ('54', '延庆县', '36', '0', '3', '');
INSERT INTO `ds_area` VALUES ('55', '和平区', '40', '0', '3', '');
INSERT INTO `ds_area` VALUES ('56', '河东区', '40', '0', '3', '');
INSERT INTO `ds_area` VALUES ('57', '河西区', '40', '0', '3', '');
INSERT INTO `ds_area` VALUES ('58', '南开区', '40', '0', '3', '');
INSERT INTO `ds_area` VALUES ('59', '河北区', '40', '0', '3', '');
INSERT INTO `ds_area` VALUES ('60', '红桥区', '40', '0', '3', '');
INSERT INTO `ds_area` VALUES ('61', '塘沽区', '40', '0', '3', '');
INSERT INTO `ds_area` VALUES ('62', '重庆市', '22', '0', '2', '');
INSERT INTO `ds_area` VALUES ('64', '东丽区', '40', '0', '3', '');
INSERT INTO `ds_area` VALUES ('65', '西青区', '40', '0', '3', '');
INSERT INTO `ds_area` VALUES ('66', '津南区', '40', '0', '3', '');
INSERT INTO `ds_area` VALUES ('67', '北辰区', '40', '0', '3', '');
INSERT INTO `ds_area` VALUES ('68', '武清区', '40', '0', '3', '');
INSERT INTO `ds_area` VALUES ('69', '宝坻区', '40', '0', '3', '');
INSERT INTO `ds_area` VALUES ('70', '宁河县', '40', '0', '3', '');
INSERT INTO `ds_area` VALUES ('71', '静海县', '40', '0', '3', '');
INSERT INTO `ds_area` VALUES ('72', '蓟县', '40', '0', '3', '');
INSERT INTO `ds_area` VALUES ('73', '石家庄市', '3', '0', '2', '');
INSERT INTO `ds_area` VALUES ('74', '唐山市', '3', '0', '2', '');
INSERT INTO `ds_area` VALUES ('75', '秦皇岛市', '3', '0', '2', '');
INSERT INTO `ds_area` VALUES ('76', '邯郸市', '3', '0', '2', '');
INSERT INTO `ds_area` VALUES ('77', '邢台市', '3', '0', '2', '');
INSERT INTO `ds_area` VALUES ('78', '保定市', '3', '0', '2', '');
INSERT INTO `ds_area` VALUES ('79', '张家口市', '3', '0', '2', '');
INSERT INTO `ds_area` VALUES ('80', '承德市', '3', '0', '2', '');
INSERT INTO `ds_area` VALUES ('81', '衡水市', '3', '0', '2', '');
INSERT INTO `ds_area` VALUES ('82', '廊坊市', '3', '0', '2', '');
INSERT INTO `ds_area` VALUES ('83', '沧州市', '3', '0', '2', '');
INSERT INTO `ds_area` VALUES ('84', '太原市', '4', '0', '2', '');
INSERT INTO `ds_area` VALUES ('85', '大同市', '4', '0', '2', '');
INSERT INTO `ds_area` VALUES ('86', '阳泉市', '4', '0', '2', '');
INSERT INTO `ds_area` VALUES ('87', '长治市', '4', '0', '2', '');
INSERT INTO `ds_area` VALUES ('88', '晋城市', '4', '0', '2', '');
INSERT INTO `ds_area` VALUES ('89', '朔州市', '4', '0', '2', '');
INSERT INTO `ds_area` VALUES ('90', '晋中市', '4', '0', '2', '');
INSERT INTO `ds_area` VALUES ('91', '运城市', '4', '0', '2', '');
INSERT INTO `ds_area` VALUES ('92', '忻州市', '4', '0', '2', '');
INSERT INTO `ds_area` VALUES ('93', '临汾市', '4', '0', '2', '');
INSERT INTO `ds_area` VALUES ('94', '吕梁市', '4', '0', '2', '');
INSERT INTO `ds_area` VALUES ('95', '呼和浩特市', '5', '0', '2', '');
INSERT INTO `ds_area` VALUES ('96', '包头市', '5', '0', '2', '');
INSERT INTO `ds_area` VALUES ('97', '乌海市', '5', '0', '2', '');
INSERT INTO `ds_area` VALUES ('98', '赤峰市', '5', '0', '2', '');
INSERT INTO `ds_area` VALUES ('99', '通辽市', '5', '0', '2', '');
INSERT INTO `ds_area` VALUES ('100', '鄂尔多斯市', '5', '0', '2', '');
INSERT INTO `ds_area` VALUES ('101', '呼伦贝尔市', '5', '0', '2', '');
INSERT INTO `ds_area` VALUES ('102', '巴彦淖尔市', '5', '0', '2', '');
INSERT INTO `ds_area` VALUES ('103', '乌兰察布市', '5', '0', '2', '');
INSERT INTO `ds_area` VALUES ('104', '兴安盟', '5', '0', '2', '');
INSERT INTO `ds_area` VALUES ('105', '锡林郭勒盟', '5', '0', '2', '');
INSERT INTO `ds_area` VALUES ('106', '阿拉善盟', '5', '0', '2', '');
INSERT INTO `ds_area` VALUES ('107', '沈阳市', '6', '0', '2', '');
INSERT INTO `ds_area` VALUES ('108', '大连市', '6', '0', '2', '');
INSERT INTO `ds_area` VALUES ('109', '鞍山市', '6', '0', '2', '');
INSERT INTO `ds_area` VALUES ('110', '抚顺市', '6', '0', '2', '');
INSERT INTO `ds_area` VALUES ('111', '本溪市', '6', '0', '2', '');
INSERT INTO `ds_area` VALUES ('112', '丹东市', '6', '0', '2', '');
INSERT INTO `ds_area` VALUES ('113', '锦州市', '6', '0', '2', '');
INSERT INTO `ds_area` VALUES ('114', '营口市', '6', '0', '2', '');
INSERT INTO `ds_area` VALUES ('115', '阜新市', '6', '0', '2', '');
INSERT INTO `ds_area` VALUES ('116', '辽阳市', '6', '0', '2', '');
INSERT INTO `ds_area` VALUES ('117', '盘锦市', '6', '0', '2', '');
INSERT INTO `ds_area` VALUES ('118', '铁岭市', '6', '0', '2', '');
INSERT INTO `ds_area` VALUES ('119', '朝阳市', '6', '0', '2', '');
INSERT INTO `ds_area` VALUES ('120', '葫芦岛市', '6', '0', '2', '');
INSERT INTO `ds_area` VALUES ('121', '长春市', '7', '0', '2', '');
INSERT INTO `ds_area` VALUES ('122', '吉林市', '7', '0', '2', '');
INSERT INTO `ds_area` VALUES ('123', '四平市', '7', '0', '2', '');
INSERT INTO `ds_area` VALUES ('124', '辽源市', '7', '0', '2', '');
INSERT INTO `ds_area` VALUES ('125', '通化市', '7', '0', '2', '');
INSERT INTO `ds_area` VALUES ('126', '白山市', '7', '0', '2', '');
INSERT INTO `ds_area` VALUES ('127', '松原市', '7', '0', '2', '');
INSERT INTO `ds_area` VALUES ('128', '白城市', '7', '0', '2', '');
INSERT INTO `ds_area` VALUES ('129', '延边朝鲜族自治州', '7', '0', '2', '');
INSERT INTO `ds_area` VALUES ('130', '哈尔滨市', '8', '0', '2', '');
INSERT INTO `ds_area` VALUES ('131', '齐齐哈尔市', '8', '0', '2', '');
INSERT INTO `ds_area` VALUES ('132', '鸡西市', '8', '0', '2', '');
INSERT INTO `ds_area` VALUES ('133', '鹤岗市', '8', '0', '2', '');
INSERT INTO `ds_area` VALUES ('134', '双鸭山市', '8', '0', '2', '');
INSERT INTO `ds_area` VALUES ('135', '大庆市', '8', '0', '2', '');
INSERT INTO `ds_area` VALUES ('136', '伊春市', '8', '0', '2', '');
INSERT INTO `ds_area` VALUES ('137', '佳木斯市', '8', '0', '2', '');
INSERT INTO `ds_area` VALUES ('138', '七台河市', '8', '0', '2', '');
INSERT INTO `ds_area` VALUES ('139', '牡丹江市', '8', '0', '2', '');
INSERT INTO `ds_area` VALUES ('140', '黑河市', '8', '0', '2', '');
INSERT INTO `ds_area` VALUES ('141', '绥化市', '8', '0', '2', '');
INSERT INTO `ds_area` VALUES ('142', '大兴安岭地区', '8', '0', '2', '');
INSERT INTO `ds_area` VALUES ('143', '黄浦区', '39', '0', '3', '');
INSERT INTO `ds_area` VALUES ('144', '卢湾区', '39', '0', '3', '');
INSERT INTO `ds_area` VALUES ('145', '徐汇区', '39', '0', '3', '');
INSERT INTO `ds_area` VALUES ('146', '长宁区', '39', '0', '3', '');
INSERT INTO `ds_area` VALUES ('147', '静安区', '39', '0', '3', '');
INSERT INTO `ds_area` VALUES ('148', '普陀区', '39', '0', '3', '');
INSERT INTO `ds_area` VALUES ('149', '闸北区', '39', '0', '3', '');
INSERT INTO `ds_area` VALUES ('150', '虹口区', '39', '0', '3', '');
INSERT INTO `ds_area` VALUES ('151', '杨浦区', '39', '0', '3', '');
INSERT INTO `ds_area` VALUES ('152', '闵行区', '39', '0', '3', '');
INSERT INTO `ds_area` VALUES ('153', '宝山区', '39', '0', '3', '');
INSERT INTO `ds_area` VALUES ('154', '嘉定区', '39', '0', '3', '');
INSERT INTO `ds_area` VALUES ('155', '浦东新区', '39', '0', '3', '');
INSERT INTO `ds_area` VALUES ('156', '金山区', '39', '0', '3', '');
INSERT INTO `ds_area` VALUES ('157', '松江区', '39', '0', '3', '');
INSERT INTO `ds_area` VALUES ('158', '青浦区', '39', '0', '3', '');
INSERT INTO `ds_area` VALUES ('159', '南汇区', '39', '0', '3', '');
INSERT INTO `ds_area` VALUES ('160', '奉贤区', '39', '0', '3', '');
INSERT INTO `ds_area` VALUES ('161', '崇明县', '39', '0', '3', '');
INSERT INTO `ds_area` VALUES ('162', '南京市', '10', '0', '2', '');
INSERT INTO `ds_area` VALUES ('163', '无锡市', '10', '0', '2', '');
INSERT INTO `ds_area` VALUES ('164', '徐州市', '10', '0', '2', '');
INSERT INTO `ds_area` VALUES ('165', '常州市', '10', '0', '2', '');
INSERT INTO `ds_area` VALUES ('166', '苏州市', '10', '0', '2', '');
INSERT INTO `ds_area` VALUES ('167', '南通市', '10', '0', '2', '');
INSERT INTO `ds_area` VALUES ('168', '连云港市', '10', '0', '2', '');
INSERT INTO `ds_area` VALUES ('169', '淮安市', '10', '0', '2', '');
INSERT INTO `ds_area` VALUES ('170', '盐城市', '10', '0', '2', '');
INSERT INTO `ds_area` VALUES ('171', '扬州市', '10', '0', '2', '');
INSERT INTO `ds_area` VALUES ('172', '镇江市', '10', '0', '2', '');
INSERT INTO `ds_area` VALUES ('173', '泰州市', '10', '0', '2', '');
INSERT INTO `ds_area` VALUES ('174', '宿迁市', '10', '0', '2', '');
INSERT INTO `ds_area` VALUES ('175', '杭州市', '11', '0', '2', '');
INSERT INTO `ds_area` VALUES ('176', '宁波市', '11', '0', '2', '');
INSERT INTO `ds_area` VALUES ('177', '温州市', '11', '0', '2', '');
INSERT INTO `ds_area` VALUES ('178', '嘉兴市', '11', '0', '2', '');
INSERT INTO `ds_area` VALUES ('179', '湖州市', '11', '0', '2', '');
INSERT INTO `ds_area` VALUES ('180', '绍兴市', '11', '0', '2', '');
INSERT INTO `ds_area` VALUES ('181', '舟山市', '11', '0', '2', '');
INSERT INTO `ds_area` VALUES ('182', '衢州市', '11', '0', '2', '');
INSERT INTO `ds_area` VALUES ('183', '金华市', '11', '0', '2', '');
INSERT INTO `ds_area` VALUES ('184', '台州市', '11', '0', '2', '');
INSERT INTO `ds_area` VALUES ('185', '丽水市', '11', '0', '2', '');
INSERT INTO `ds_area` VALUES ('186', '合肥市', '12', '0', '2', '');
INSERT INTO `ds_area` VALUES ('187', '芜湖市', '12', '0', '2', '');
INSERT INTO `ds_area` VALUES ('188', '蚌埠市', '12', '0', '2', '');
INSERT INTO `ds_area` VALUES ('189', '淮南市', '12', '0', '2', '');
INSERT INTO `ds_area` VALUES ('190', '马鞍山市', '12', '0', '2', '');
INSERT INTO `ds_area` VALUES ('191', '淮北市', '12', '0', '2', '');
INSERT INTO `ds_area` VALUES ('192', '铜陵市', '12', '0', '2', '');
INSERT INTO `ds_area` VALUES ('193', '安庆市', '12', '0', '2', '');
INSERT INTO `ds_area` VALUES ('194', '黄山市', '12', '0', '2', '');
INSERT INTO `ds_area` VALUES ('195', '滁州市', '12', '0', '2', '');
INSERT INTO `ds_area` VALUES ('196', '阜阳市', '12', '0', '2', '');
INSERT INTO `ds_area` VALUES ('197', '宿州市', '12', '0', '2', '');
INSERT INTO `ds_area` VALUES ('198', '巢湖市', '12', '0', '2', '');
INSERT INTO `ds_area` VALUES ('199', '六安市', '12', '0', '2', '');
INSERT INTO `ds_area` VALUES ('200', '亳州市', '12', '0', '2', '');
INSERT INTO `ds_area` VALUES ('201', '池州市', '12', '0', '2', '');
INSERT INTO `ds_area` VALUES ('202', '宣城市', '12', '0', '2', '');
INSERT INTO `ds_area` VALUES ('203', '福州市', '13', '0', '2', '');
INSERT INTO `ds_area` VALUES ('204', '厦门市', '13', '0', '2', '');
INSERT INTO `ds_area` VALUES ('205', '莆田市', '13', '0', '2', '');
INSERT INTO `ds_area` VALUES ('206', '三明市', '13', '0', '2', '');
INSERT INTO `ds_area` VALUES ('207', '泉州市', '13', '0', '2', '');
INSERT INTO `ds_area` VALUES ('208', '漳州市', '13', '0', '2', '');
INSERT INTO `ds_area` VALUES ('209', '南平市', '13', '0', '2', '');
INSERT INTO `ds_area` VALUES ('210', '龙岩市', '13', '0', '2', '');
INSERT INTO `ds_area` VALUES ('211', '宁德市', '13', '0', '2', '');
INSERT INTO `ds_area` VALUES ('212', '南昌市', '14', '0', '2', '');
INSERT INTO `ds_area` VALUES ('213', '景德镇市', '14', '0', '2', '');
INSERT INTO `ds_area` VALUES ('214', '萍乡市', '14', '0', '2', '');
INSERT INTO `ds_area` VALUES ('215', '九江市', '14', '0', '2', '');
INSERT INTO `ds_area` VALUES ('216', '新余市', '14', '0', '2', '');
INSERT INTO `ds_area` VALUES ('217', '鹰潭市', '14', '0', '2', '');
INSERT INTO `ds_area` VALUES ('218', '赣州市', '14', '0', '2', '');
INSERT INTO `ds_area` VALUES ('219', '吉安市', '14', '0', '2', '');
INSERT INTO `ds_area` VALUES ('220', '宜春市', '14', '0', '2', '');
INSERT INTO `ds_area` VALUES ('221', '抚州市', '14', '0', '2', '');
INSERT INTO `ds_area` VALUES ('222', '上饶市', '14', '0', '2', '');
INSERT INTO `ds_area` VALUES ('223', '济南市', '15', '0', '2', '');
INSERT INTO `ds_area` VALUES ('224', '青岛市', '15', '0', '2', '');
INSERT INTO `ds_area` VALUES ('225', '淄博市', '15', '0', '2', '');
INSERT INTO `ds_area` VALUES ('226', '枣庄市', '15', '0', '2', '');
INSERT INTO `ds_area` VALUES ('227', '东营市', '15', '0', '2', '');
INSERT INTO `ds_area` VALUES ('228', '烟台市', '15', '0', '2', '');
INSERT INTO `ds_area` VALUES ('229', '潍坊市', '15', '0', '2', '');
INSERT INTO `ds_area` VALUES ('230', '济宁市', '15', '0', '2', '');
INSERT INTO `ds_area` VALUES ('231', '泰安市', '15', '0', '2', '');
INSERT INTO `ds_area` VALUES ('232', '威海市', '15', '0', '2', '');
INSERT INTO `ds_area` VALUES ('233', '日照市', '15', '0', '2', '');
INSERT INTO `ds_area` VALUES ('234', '莱芜市', '15', '0', '2', '');
INSERT INTO `ds_area` VALUES ('235', '临沂市', '15', '0', '2', '');
INSERT INTO `ds_area` VALUES ('236', '德州市', '15', '0', '2', '');
INSERT INTO `ds_area` VALUES ('237', '聊城市', '15', '0', '2', '');
INSERT INTO `ds_area` VALUES ('238', '滨州市', '15', '0', '2', '');
INSERT INTO `ds_area` VALUES ('239', '菏泽市', '15', '0', '2', '');
INSERT INTO `ds_area` VALUES ('240', '郑州市', '16', '0', '2', '');
INSERT INTO `ds_area` VALUES ('241', '开封市', '16', '0', '2', '');
INSERT INTO `ds_area` VALUES ('242', '洛阳市', '16', '0', '2', '');
INSERT INTO `ds_area` VALUES ('243', '平顶山市', '16', '0', '2', '');
INSERT INTO `ds_area` VALUES ('244', '安阳市', '16', '0', '2', '');
INSERT INTO `ds_area` VALUES ('245', '鹤壁市', '16', '0', '2', '');
INSERT INTO `ds_area` VALUES ('246', '新乡市', '16', '0', '2', '');
INSERT INTO `ds_area` VALUES ('247', '焦作市', '16', '0', '2', '');
INSERT INTO `ds_area` VALUES ('248', '濮阳市', '16', '0', '2', '');
INSERT INTO `ds_area` VALUES ('249', '许昌市', '16', '0', '2', '');
INSERT INTO `ds_area` VALUES ('250', '漯河市', '16', '0', '2', '');
INSERT INTO `ds_area` VALUES ('251', '三门峡市', '16', '0', '2', '');
INSERT INTO `ds_area` VALUES ('252', '南阳市', '16', '0', '2', '');
INSERT INTO `ds_area` VALUES ('253', '商丘市', '16', '0', '2', '');
INSERT INTO `ds_area` VALUES ('254', '信阳市', '16', '0', '2', '');
INSERT INTO `ds_area` VALUES ('255', '周口市', '16', '0', '2', '');
INSERT INTO `ds_area` VALUES ('256', '驻马店市', '16', '0', '2', '');
INSERT INTO `ds_area` VALUES ('257', '济源市', '16', '0', '2', '');
INSERT INTO `ds_area` VALUES ('258', '武汉市', '17', '0', '2', '');
INSERT INTO `ds_area` VALUES ('259', '黄石市', '17', '0', '2', '');
INSERT INTO `ds_area` VALUES ('260', '十堰市', '17', '0', '2', '');
INSERT INTO `ds_area` VALUES ('261', '宜昌市', '17', '0', '2', '');
INSERT INTO `ds_area` VALUES ('262', '襄樊市', '17', '0', '2', '');
INSERT INTO `ds_area` VALUES ('263', '鄂州市', '17', '0', '2', '');
INSERT INTO `ds_area` VALUES ('264', '荆门市', '17', '0', '2', '');
INSERT INTO `ds_area` VALUES ('265', '孝感市', '17', '0', '2', '');
INSERT INTO `ds_area` VALUES ('266', '荆州市', '17', '0', '2', '');
INSERT INTO `ds_area` VALUES ('267', '黄冈市', '17', '0', '2', '');
INSERT INTO `ds_area` VALUES ('268', '咸宁市', '17', '0', '2', '');
INSERT INTO `ds_area` VALUES ('269', '随州市', '17', '0', '2', '');
INSERT INTO `ds_area` VALUES ('270', '恩施土家族苗族自治州', '17', '0', '2', '');
INSERT INTO `ds_area` VALUES ('271', '仙桃市', '17', '0', '2', '');
INSERT INTO `ds_area` VALUES ('272', '潜江市', '17', '0', '2', '');
INSERT INTO `ds_area` VALUES ('273', '天门市', '17', '0', '2', '');
INSERT INTO `ds_area` VALUES ('274', '神农架林区', '17', '0', '2', '');
INSERT INTO `ds_area` VALUES ('275', '长沙市', '18', '0', '2', '');
INSERT INTO `ds_area` VALUES ('276', '株洲市', '18', '0', '2', '');
INSERT INTO `ds_area` VALUES ('277', '湘潭市', '18', '0', '2', '');
INSERT INTO `ds_area` VALUES ('278', '衡阳市', '18', '0', '2', '');
INSERT INTO `ds_area` VALUES ('279', '邵阳市', '18', '0', '2', '');
INSERT INTO `ds_area` VALUES ('280', '岳阳市', '18', '0', '2', '');
INSERT INTO `ds_area` VALUES ('281', '常德市', '18', '0', '2', '');
INSERT INTO `ds_area` VALUES ('282', '张家界市', '18', '0', '2', '');
INSERT INTO `ds_area` VALUES ('283', '益阳市', '18', '0', '2', '');
INSERT INTO `ds_area` VALUES ('284', '郴州市', '18', '0', '2', '');
INSERT INTO `ds_area` VALUES ('285', '永州市', '18', '0', '2', '');
INSERT INTO `ds_area` VALUES ('286', '怀化市', '18', '0', '2', '');
INSERT INTO `ds_area` VALUES ('287', '娄底市', '18', '0', '2', '');
INSERT INTO `ds_area` VALUES ('288', '湘西土家族苗族自治州', '18', '0', '2', '');
INSERT INTO `ds_area` VALUES ('289', '广州市', '19', '0', '2', '');
INSERT INTO `ds_area` VALUES ('290', '韶关市', '19', '0', '2', '');
INSERT INTO `ds_area` VALUES ('291', '深圳市', '19', '0', '2', '');
INSERT INTO `ds_area` VALUES ('292', '珠海市', '19', '0', '2', '');
INSERT INTO `ds_area` VALUES ('293', '汕头市', '19', '0', '2', '');
INSERT INTO `ds_area` VALUES ('294', '佛山市', '19', '0', '2', '');
INSERT INTO `ds_area` VALUES ('295', '江门市', '19', '0', '2', '');
INSERT INTO `ds_area` VALUES ('296', '湛江市', '19', '0', '2', '');
INSERT INTO `ds_area` VALUES ('297', '茂名市', '19', '0', '2', '');
INSERT INTO `ds_area` VALUES ('298', '肇庆市', '19', '0', '2', '');
INSERT INTO `ds_area` VALUES ('299', '惠州市', '19', '0', '2', '');
INSERT INTO `ds_area` VALUES ('300', '梅州市', '19', '0', '2', '');
INSERT INTO `ds_area` VALUES ('301', '汕尾市', '19', '0', '2', '');
INSERT INTO `ds_area` VALUES ('302', '河源市', '19', '0', '2', '');
INSERT INTO `ds_area` VALUES ('303', '阳江市', '19', '0', '2', '');
INSERT INTO `ds_area` VALUES ('304', '清远市', '19', '0', '2', '');
INSERT INTO `ds_area` VALUES ('305', '东莞市', '19', '0', '2', '');
INSERT INTO `ds_area` VALUES ('306', '中山市', '19', '0', '2', '');
INSERT INTO `ds_area` VALUES ('307', '潮州市', '19', '0', '2', '');
INSERT INTO `ds_area` VALUES ('308', '揭阳市', '19', '0', '2', '');
INSERT INTO `ds_area` VALUES ('309', '云浮市', '19', '0', '2', '');
INSERT INTO `ds_area` VALUES ('310', '南宁市', '20', '0', '2', '');
INSERT INTO `ds_area` VALUES ('311', '柳州市', '20', '0', '2', '');
INSERT INTO `ds_area` VALUES ('312', '桂林市', '20', '0', '2', '');
INSERT INTO `ds_area` VALUES ('313', '梧州市', '20', '0', '2', '');
INSERT INTO `ds_area` VALUES ('314', '北海市', '20', '0', '2', '');
INSERT INTO `ds_area` VALUES ('315', '防城港市', '20', '0', '2', '');
INSERT INTO `ds_area` VALUES ('316', '钦州市', '20', '0', '2', '');
INSERT INTO `ds_area` VALUES ('317', '贵港市', '20', '0', '2', '');
INSERT INTO `ds_area` VALUES ('318', '玉林市', '20', '0', '2', '');
INSERT INTO `ds_area` VALUES ('319', '百色市', '20', '0', '2', '');
INSERT INTO `ds_area` VALUES ('320', '贺州市', '20', '0', '2', '');
INSERT INTO `ds_area` VALUES ('321', '河池市', '20', '0', '2', '');
INSERT INTO `ds_area` VALUES ('322', '来宾市', '20', '0', '2', '');
INSERT INTO `ds_area` VALUES ('323', '崇左市', '20', '0', '2', '');
INSERT INTO `ds_area` VALUES ('324', '海口市', '21', '0', '2', '');
INSERT INTO `ds_area` VALUES ('325', '三亚市', '21', '0', '2', '');
INSERT INTO `ds_area` VALUES ('326', '五指山市', '21', '0', '2', '');
INSERT INTO `ds_area` VALUES ('327', '琼海市', '21', '0', '2', '');
INSERT INTO `ds_area` VALUES ('328', '儋州市', '21', '0', '2', '');
INSERT INTO `ds_area` VALUES ('329', '文昌市', '21', '0', '2', '');
INSERT INTO `ds_area` VALUES ('330', '万宁市', '21', '0', '2', '');
INSERT INTO `ds_area` VALUES ('331', '东方市', '21', '0', '2', '');
INSERT INTO `ds_area` VALUES ('332', '定安县', '21', '0', '2', '');
INSERT INTO `ds_area` VALUES ('333', '屯昌县', '21', '0', '2', '');
INSERT INTO `ds_area` VALUES ('334', '澄迈县', '21', '0', '2', '');
INSERT INTO `ds_area` VALUES ('335', '临高县', '21', '0', '2', '');
INSERT INTO `ds_area` VALUES ('336', '白沙黎族自治县', '21', '0', '2', '');
INSERT INTO `ds_area` VALUES ('337', '昌江黎族自治县', '21', '0', '2', '');
INSERT INTO `ds_area` VALUES ('338', '乐东黎族自治县', '21', '0', '2', '');
INSERT INTO `ds_area` VALUES ('339', '陵水黎族自治县', '21', '0', '2', '');
INSERT INTO `ds_area` VALUES ('340', '保亭黎族苗族自治县', '21', '0', '2', '');
INSERT INTO `ds_area` VALUES ('341', '琼中黎族苗族自治县', '21', '0', '2', '');
INSERT INTO `ds_area` VALUES ('342', '西沙群岛', '21', '0', '2', '');
INSERT INTO `ds_area` VALUES ('343', '南沙群岛', '21', '0', '2', '');
INSERT INTO `ds_area` VALUES ('344', '中沙群岛的岛礁及其海域', '21', '0', '2', '');
INSERT INTO `ds_area` VALUES ('345', '万州区', '62', '0', '3', '');
INSERT INTO `ds_area` VALUES ('346', '涪陵区', '62', '0', '3', '');
INSERT INTO `ds_area` VALUES ('347', '渝中区', '62', '0', '3', '');
INSERT INTO `ds_area` VALUES ('348', '大渡口区', '62', '0', '3', '');
INSERT INTO `ds_area` VALUES ('349', '江北区', '62', '0', '3', '');
INSERT INTO `ds_area` VALUES ('350', '沙坪坝区', '62', '0', '3', '');
INSERT INTO `ds_area` VALUES ('351', '九龙坡区', '62', '0', '3', '');
INSERT INTO `ds_area` VALUES ('352', '南岸区', '62', '0', '3', '');
INSERT INTO `ds_area` VALUES ('353', '北碚区', '62', '0', '3', '');
INSERT INTO `ds_area` VALUES ('354', '双桥区', '62', '0', '3', '');
INSERT INTO `ds_area` VALUES ('355', '万盛区', '62', '0', '3', '');
INSERT INTO `ds_area` VALUES ('356', '渝北区', '62', '0', '3', '');
INSERT INTO `ds_area` VALUES ('357', '巴南区', '62', '0', '3', '');
INSERT INTO `ds_area` VALUES ('358', '黔江区', '62', '0', '3', '');
INSERT INTO `ds_area` VALUES ('359', '长寿区', '62', '0', '3', '');
INSERT INTO `ds_area` VALUES ('360', '綦江县', '62', '0', '3', '');
INSERT INTO `ds_area` VALUES ('361', '潼南县', '62', '0', '3', '');
INSERT INTO `ds_area` VALUES ('362', '铜梁县', '62', '0', '3', '');
INSERT INTO `ds_area` VALUES ('363', '大足县', '62', '0', '3', '');
INSERT INTO `ds_area` VALUES ('364', '荣昌县', '62', '0', '3', '');
INSERT INTO `ds_area` VALUES ('365', '璧山县', '62', '0', '3', '');
INSERT INTO `ds_area` VALUES ('366', '梁平县', '62', '0', '3', '');
INSERT INTO `ds_area` VALUES ('367', '城口县', '62', '0', '3', '');
INSERT INTO `ds_area` VALUES ('368', '丰都县', '62', '0', '3', '');
INSERT INTO `ds_area` VALUES ('369', '垫江县', '62', '0', '3', '');
INSERT INTO `ds_area` VALUES ('370', '武隆县', '62', '0', '3', '');
INSERT INTO `ds_area` VALUES ('371', '忠县', '62', '0', '3', '');
INSERT INTO `ds_area` VALUES ('372', '开县', '62', '0', '3', '');
INSERT INTO `ds_area` VALUES ('373', '云阳县', '62', '0', '3', '');
INSERT INTO `ds_area` VALUES ('374', '奉节县', '62', '0', '3', '');
INSERT INTO `ds_area` VALUES ('375', '巫山县', '62', '0', '3', '');
INSERT INTO `ds_area` VALUES ('376', '巫溪县', '62', '0', '3', '');
INSERT INTO `ds_area` VALUES ('377', '石柱土家族自治县', '62', '0', '3', '');
INSERT INTO `ds_area` VALUES ('378', '秀山土家族苗族自治县', '62', '0', '3', '');
INSERT INTO `ds_area` VALUES ('379', '酉阳土家族苗族自治县', '62', '0', '3', '');
INSERT INTO `ds_area` VALUES ('380', '彭水苗族土家族自治县', '62', '0', '3', '');
INSERT INTO `ds_area` VALUES ('381', '江津市', '62', '0', '3', '');
INSERT INTO `ds_area` VALUES ('382', '合川市', '62', '0', '3', '');
INSERT INTO `ds_area` VALUES ('383', '永川市', '62', '0', '3', '');
INSERT INTO `ds_area` VALUES ('384', '南川市', '62', '0', '3', '');
INSERT INTO `ds_area` VALUES ('385', '成都市', '23', '0', '2', '');
INSERT INTO `ds_area` VALUES ('386', '自贡市', '23', '0', '2', '');
INSERT INTO `ds_area` VALUES ('387', '攀枝花市', '23', '0', '2', '');
INSERT INTO `ds_area` VALUES ('388', '泸州市', '23', '0', '2', '');
INSERT INTO `ds_area` VALUES ('389', '德阳市', '23', '0', '2', '');
INSERT INTO `ds_area` VALUES ('390', '绵阳市', '23', '0', '2', '');
INSERT INTO `ds_area` VALUES ('391', '广元市', '23', '0', '2', '');
INSERT INTO `ds_area` VALUES ('392', '遂宁市', '23', '0', '2', '');
INSERT INTO `ds_area` VALUES ('393', '内江市', '23', '0', '2', '');
INSERT INTO `ds_area` VALUES ('394', '乐山市', '23', '0', '2', '');
INSERT INTO `ds_area` VALUES ('395', '南充市', '23', '0', '2', '');
INSERT INTO `ds_area` VALUES ('396', '眉山市', '23', '0', '2', '');
INSERT INTO `ds_area` VALUES ('397', '宜宾市', '23', '0', '2', '');
INSERT INTO `ds_area` VALUES ('398', '广安市', '23', '0', '2', '');
INSERT INTO `ds_area` VALUES ('399', '达州市', '23', '0', '2', '');
INSERT INTO `ds_area` VALUES ('400', '雅安市', '23', '0', '2', '');
INSERT INTO `ds_area` VALUES ('401', '巴中市', '23', '0', '2', '');
INSERT INTO `ds_area` VALUES ('402', '资阳市', '23', '0', '2', '');
INSERT INTO `ds_area` VALUES ('403', '阿坝藏族羌族自治州', '23', '0', '2', '');
INSERT INTO `ds_area` VALUES ('404', '甘孜藏族自治州', '23', '0', '2', '');
INSERT INTO `ds_area` VALUES ('405', '凉山彝族自治州', '23', '0', '2', '');
INSERT INTO `ds_area` VALUES ('406', '贵阳市', '24', '0', '2', '');
INSERT INTO `ds_area` VALUES ('407', '六盘水市', '24', '0', '2', '');
INSERT INTO `ds_area` VALUES ('408', '遵义市', '24', '0', '2', '');
INSERT INTO `ds_area` VALUES ('409', '安顺市', '24', '0', '2', '');
INSERT INTO `ds_area` VALUES ('410', '铜仁地区', '24', '0', '2', '');
INSERT INTO `ds_area` VALUES ('411', '黔西南布依族苗族自治州', '24', '0', '2', '');
INSERT INTO `ds_area` VALUES ('412', '毕节地区', '24', '0', '2', '');
INSERT INTO `ds_area` VALUES ('413', '黔东南苗族侗族自治州', '24', '0', '2', '');
INSERT INTO `ds_area` VALUES ('414', '黔南布依族苗族自治州', '24', '0', '2', '');
INSERT INTO `ds_area` VALUES ('415', '昆明市', '25', '0', '2', '');
INSERT INTO `ds_area` VALUES ('416', '曲靖市', '25', '0', '2', '');
INSERT INTO `ds_area` VALUES ('417', '玉溪市', '25', '0', '2', '');
INSERT INTO `ds_area` VALUES ('418', '保山市', '25', '0', '2', '');
INSERT INTO `ds_area` VALUES ('419', '昭通市', '25', '0', '2', '');
INSERT INTO `ds_area` VALUES ('420', '丽江市', '25', '0', '2', '');
INSERT INTO `ds_area` VALUES ('421', '思茅市', '25', '0', '2', '');
INSERT INTO `ds_area` VALUES ('422', '临沧市', '25', '0', '2', '');
INSERT INTO `ds_area` VALUES ('423', '楚雄彝族自治州', '25', '0', '2', '');
INSERT INTO `ds_area` VALUES ('424', '红河哈尼族彝族自治州', '25', '0', '2', '');
INSERT INTO `ds_area` VALUES ('425', '文山壮族苗族自治州', '25', '0', '2', '');
INSERT INTO `ds_area` VALUES ('426', '西双版纳傣族自治州', '25', '0', '2', '');
INSERT INTO `ds_area` VALUES ('427', '大理白族自治州', '25', '0', '2', '');
INSERT INTO `ds_area` VALUES ('428', '德宏傣族景颇族自治州', '25', '0', '2', '');
INSERT INTO `ds_area` VALUES ('429', '怒江傈僳族自治州', '25', '0', '2', '');
INSERT INTO `ds_area` VALUES ('430', '迪庆藏族自治州', '25', '0', '2', '');
INSERT INTO `ds_area` VALUES ('431', '拉萨市', '26', '0', '2', '');
INSERT INTO `ds_area` VALUES ('432', '昌都地区', '26', '0', '2', '');
INSERT INTO `ds_area` VALUES ('433', '山南地区', '26', '0', '2', '');
INSERT INTO `ds_area` VALUES ('434', '日喀则地区', '26', '0', '2', '');
INSERT INTO `ds_area` VALUES ('435', '那曲地区', '26', '0', '2', '');
INSERT INTO `ds_area` VALUES ('436', '阿里地区', '26', '0', '2', '');
INSERT INTO `ds_area` VALUES ('437', '林芝地区', '26', '0', '2', '');
INSERT INTO `ds_area` VALUES ('438', '西安市', '27', '0', '2', '');
INSERT INTO `ds_area` VALUES ('439', '铜川市', '27', '0', '2', '');
INSERT INTO `ds_area` VALUES ('440', '宝鸡市', '27', '0', '2', '');
INSERT INTO `ds_area` VALUES ('441', '咸阳市', '27', '0', '2', '');
INSERT INTO `ds_area` VALUES ('442', '渭南市', '27', '0', '2', '');
INSERT INTO `ds_area` VALUES ('443', '延安市', '27', '0', '2', '');
INSERT INTO `ds_area` VALUES ('444', '汉中市', '27', '0', '2', '');
INSERT INTO `ds_area` VALUES ('445', '榆林市', '27', '0', '2', '');
INSERT INTO `ds_area` VALUES ('446', '安康市', '27', '0', '2', '');
INSERT INTO `ds_area` VALUES ('447', '商洛市', '27', '0', '2', '');
INSERT INTO `ds_area` VALUES ('448', '兰州市', '28', '0', '2', '');
INSERT INTO `ds_area` VALUES ('449', '嘉峪关市', '28', '0', '2', '');
INSERT INTO `ds_area` VALUES ('450', '金昌市', '28', '0', '2', '');
INSERT INTO `ds_area` VALUES ('451', '白银市', '28', '0', '2', '');
INSERT INTO `ds_area` VALUES ('452', '天水市', '28', '0', '2', '');
INSERT INTO `ds_area` VALUES ('453', '武威市', '28', '0', '2', '');
INSERT INTO `ds_area` VALUES ('454', '张掖市', '28', '0', '2', '');
INSERT INTO `ds_area` VALUES ('455', '平凉市', '28', '0', '2', '');
INSERT INTO `ds_area` VALUES ('456', '酒泉市', '28', '0', '2', '');
INSERT INTO `ds_area` VALUES ('457', '庆阳市', '28', '0', '2', '');
INSERT INTO `ds_area` VALUES ('458', '定西市', '28', '0', '2', '');
INSERT INTO `ds_area` VALUES ('459', '陇南市', '28', '0', '2', '');
INSERT INTO `ds_area` VALUES ('460', '临夏回族自治州', '28', '0', '2', '');
INSERT INTO `ds_area` VALUES ('461', '甘南藏族自治州', '28', '0', '2', '');
INSERT INTO `ds_area` VALUES ('462', '西宁市', '29', '0', '2', '');
INSERT INTO `ds_area` VALUES ('463', '海东地区', '29', '0', '2', '');
INSERT INTO `ds_area` VALUES ('464', '海北藏族自治州', '29', '0', '2', '');
INSERT INTO `ds_area` VALUES ('465', '黄南藏族自治州', '29', '0', '2', '');
INSERT INTO `ds_area` VALUES ('466', '海南藏族自治州', '29', '0', '2', '');
INSERT INTO `ds_area` VALUES ('467', '果洛藏族自治州', '29', '0', '2', '');
INSERT INTO `ds_area` VALUES ('468', '玉树藏族自治州', '29', '0', '2', '');
INSERT INTO `ds_area` VALUES ('469', '海西蒙古族藏族自治州', '29', '0', '2', '');
INSERT INTO `ds_area` VALUES ('470', '银川市', '30', '0', '2', '');
INSERT INTO `ds_area` VALUES ('471', '石嘴山市', '30', '0', '2', '');
INSERT INTO `ds_area` VALUES ('472', '吴忠市', '30', '0', '2', '');
INSERT INTO `ds_area` VALUES ('473', '固原市', '30', '0', '2', '');
INSERT INTO `ds_area` VALUES ('474', '中卫市', '30', '0', '2', '');
INSERT INTO `ds_area` VALUES ('475', '乌鲁木齐市', '31', '0', '2', '');
INSERT INTO `ds_area` VALUES ('476', '克拉玛依市', '31', '0', '2', '');
INSERT INTO `ds_area` VALUES ('477', '吐鲁番地区', '31', '0', '2', '');
INSERT INTO `ds_area` VALUES ('478', '哈密地区', '31', '0', '2', '');
INSERT INTO `ds_area` VALUES ('479', '昌吉回族自治州', '31', '0', '2', '');
INSERT INTO `ds_area` VALUES ('480', '博尔塔拉蒙古自治州', '31', '0', '2', '');
INSERT INTO `ds_area` VALUES ('481', '巴音郭楞蒙古自治州', '31', '0', '2', '');
INSERT INTO `ds_area` VALUES ('482', '阿克苏地区', '31', '0', '2', '');
INSERT INTO `ds_area` VALUES ('483', '克孜勒苏柯尔克孜自治州', '31', '0', '2', '');
INSERT INTO `ds_area` VALUES ('484', '喀什地区', '31', '0', '2', '');
INSERT INTO `ds_area` VALUES ('485', '和田地区', '31', '0', '2', '');
INSERT INTO `ds_area` VALUES ('486', '伊犁哈萨克自治州', '31', '0', '2', '');
INSERT INTO `ds_area` VALUES ('487', '塔城地区', '31', '0', '2', '');
INSERT INTO `ds_area` VALUES ('488', '阿勒泰地区', '31', '0', '2', '');
INSERT INTO `ds_area` VALUES ('489', '石河子市', '31', '0', '2', '');
INSERT INTO `ds_area` VALUES ('490', '阿拉尔市', '31', '0', '2', '');
INSERT INTO `ds_area` VALUES ('491', '图木舒克市', '31', '0', '2', '');
INSERT INTO `ds_area` VALUES ('492', '五家渠市', '31', '0', '2', '');
INSERT INTO `ds_area` VALUES ('493', '台北市', '32', '0', '2', '');
INSERT INTO `ds_area` VALUES ('494', '高雄市', '32', '0', '2', '');
INSERT INTO `ds_area` VALUES ('495', '基隆市', '32', '0', '2', '');
INSERT INTO `ds_area` VALUES ('496', '台中市', '32', '0', '2', '');
INSERT INTO `ds_area` VALUES ('497', '台南市', '32', '0', '2', '');
INSERT INTO `ds_area` VALUES ('498', '新竹市', '32', '0', '2', '');
INSERT INTO `ds_area` VALUES ('499', '嘉义市', '32', '0', '2', '');
INSERT INTO `ds_area` VALUES ('500', '台北县', '32', '0', '2', '');
INSERT INTO `ds_area` VALUES ('501', '宜兰县', '32', '0', '2', '');
INSERT INTO `ds_area` VALUES ('502', '桃园县', '32', '0', '2', '');
INSERT INTO `ds_area` VALUES ('503', '新竹县', '32', '0', '2', '');
INSERT INTO `ds_area` VALUES ('504', '苗栗县', '32', '0', '2', '');
INSERT INTO `ds_area` VALUES ('505', '台中县', '32', '0', '2', '');
INSERT INTO `ds_area` VALUES ('506', '彰化县', '32', '0', '2', '');
INSERT INTO `ds_area` VALUES ('507', '南投县', '32', '0', '2', '');
INSERT INTO `ds_area` VALUES ('508', '云林县', '32', '0', '2', '');
INSERT INTO `ds_area` VALUES ('509', '嘉义县', '32', '0', '2', '');
INSERT INTO `ds_area` VALUES ('510', '台南县', '32', '0', '2', '');
INSERT INTO `ds_area` VALUES ('511', '高雄县', '32', '0', '2', '');
INSERT INTO `ds_area` VALUES ('512', '屏东县', '32', '0', '2', '');
INSERT INTO `ds_area` VALUES ('513', '澎湖县', '32', '0', '2', '');
INSERT INTO `ds_area` VALUES ('514', '台东县', '32', '0', '2', '');
INSERT INTO `ds_area` VALUES ('515', '花莲县', '32', '0', '2', '');
INSERT INTO `ds_area` VALUES ('516', '中西区', '33', '0', '2', '');
INSERT INTO `ds_area` VALUES ('517', '东区', '33', '0', '2', '');
INSERT INTO `ds_area` VALUES ('518', '九龙城区', '33', '0', '2', '');
INSERT INTO `ds_area` VALUES ('519', '观塘区', '33', '0', '2', '');
INSERT INTO `ds_area` VALUES ('520', '南区', '33', '0', '2', '');
INSERT INTO `ds_area` VALUES ('521', '深水埗区', '33', '0', '2', '');
INSERT INTO `ds_area` VALUES ('522', '黄大仙区', '33', '0', '2', '');
INSERT INTO `ds_area` VALUES ('523', '湾仔区', '33', '0', '2', '');
INSERT INTO `ds_area` VALUES ('524', '油尖旺区', '33', '0', '2', '');
INSERT INTO `ds_area` VALUES ('525', '离岛区', '33', '0', '2', '');
INSERT INTO `ds_area` VALUES ('526', '葵青区', '33', '0', '2', '');
INSERT INTO `ds_area` VALUES ('527', '北区', '33', '0', '2', '');
INSERT INTO `ds_area` VALUES ('528', '西贡区', '33', '0', '2', '');
INSERT INTO `ds_area` VALUES ('529', '沙田区', '33', '0', '2', '');
INSERT INTO `ds_area` VALUES ('530', '屯门区', '33', '0', '2', '');
INSERT INTO `ds_area` VALUES ('531', '大埔区', '33', '0', '2', '');
INSERT INTO `ds_area` VALUES ('532', '荃湾区', '33', '0', '2', '');
INSERT INTO `ds_area` VALUES ('533', '元朗区', '33', '0', '2', '');
INSERT INTO `ds_area` VALUES ('534', '澳门特别行政区', '34', '0', '2', '');
INSERT INTO `ds_area` VALUES ('535', '美国', '45055', '0', '3', '');
INSERT INTO `ds_area` VALUES ('536', '加拿大', '45055', '0', '3', '');
INSERT INTO `ds_area` VALUES ('537', '澳大利亚', '45055', '0', '3', '');
INSERT INTO `ds_area` VALUES ('538', '新西兰', '45055', '0', '3', '');
INSERT INTO `ds_area` VALUES ('539', '英国', '45055', '0', '3', '');
INSERT INTO `ds_area` VALUES ('540', '法国', '45055', '0', '3', '');
INSERT INTO `ds_area` VALUES ('541', '德国', '45055', '0', '3', '');
INSERT INTO `ds_area` VALUES ('542', '捷克', '45055', '0', '3', '');
INSERT INTO `ds_area` VALUES ('543', '荷兰', '45055', '0', '3', '');
INSERT INTO `ds_area` VALUES ('544', '瑞士', '45055', '0', '3', '');
INSERT INTO `ds_area` VALUES ('545', '希腊', '45055', '0', '3', '');
INSERT INTO `ds_area` VALUES ('546', '挪威', '45055', '0', '3', '');
INSERT INTO `ds_area` VALUES ('547', '瑞典', '45055', '0', '3', '');
INSERT INTO `ds_area` VALUES ('548', '丹麦', '45055', '0', '3', '');
INSERT INTO `ds_area` VALUES ('549', '芬兰', '45055', '0', '3', '');
INSERT INTO `ds_area` VALUES ('550', '爱尔兰', '45055', '0', '3', '');
INSERT INTO `ds_area` VALUES ('551', '奥地利', '45055', '0', '3', '');
INSERT INTO `ds_area` VALUES ('552', '意大利', '45055', '0', '3', '');
INSERT INTO `ds_area` VALUES ('553', '乌克兰', '45055', '0', '3', '');
INSERT INTO `ds_area` VALUES ('554', '俄罗斯', '45055', '0', '3', '');
INSERT INTO `ds_area` VALUES ('555', '西班牙', '45055', '0', '3', '');
INSERT INTO `ds_area` VALUES ('556', '韩国', '45055', '0', '3', '');
INSERT INTO `ds_area` VALUES ('557', '新加坡', '45055', '0', '3', '');
INSERT INTO `ds_area` VALUES ('558', '马来西亚', '45055', '0', '3', '');
INSERT INTO `ds_area` VALUES ('559', '印度', '45055', '0', '3', '');
INSERT INTO `ds_area` VALUES ('560', '泰国', '45055', '0', '3', '');
INSERT INTO `ds_area` VALUES ('561', '日本', '45055', '0', '3', '');
INSERT INTO `ds_area` VALUES ('562', '巴西', '45055', '0', '3', '');
INSERT INTO `ds_area` VALUES ('563', '阿根廷', '45055', '0', '3', '');
INSERT INTO `ds_area` VALUES ('564', '南非', '45055', '0', '3', '');
INSERT INTO `ds_area` VALUES ('565', '埃及', '45055', '0', '3', '');
INSERT INTO `ds_area` VALUES ('566', '其他', '36', '0', '3', '');
INSERT INTO `ds_area` VALUES ('1126', '井陉县', '73', '0', '3', '');
INSERT INTO `ds_area` VALUES ('1127', '井陉矿区', '73', '0', '3', '');
INSERT INTO `ds_area` VALUES ('1128', '元氏县', '73', '0', '3', '');
INSERT INTO `ds_area` VALUES ('1129', '平山县', '73', '0', '3', '');
INSERT INTO `ds_area` VALUES ('1130', '新乐市', '73', '0', '3', '');
INSERT INTO `ds_area` VALUES ('1131', '新华区', '73', '0', '3', '');
INSERT INTO `ds_area` VALUES ('1132', '无极县', '73', '0', '3', '');
INSERT INTO `ds_area` VALUES ('1133', '晋州市', '73', '0', '3', '');
INSERT INTO `ds_area` VALUES ('1134', '栾城县', '73', '0', '3', '');
INSERT INTO `ds_area` VALUES ('1135', '桥东区', '73', '0', '3', '');
INSERT INTO `ds_area` VALUES ('1136', '桥西区', '73', '0', '3', '');
INSERT INTO `ds_area` VALUES ('1137', '正定县', '73', '0', '3', '');
INSERT INTO `ds_area` VALUES ('1138', '深泽县', '73', '0', '3', '');
INSERT INTO `ds_area` VALUES ('1139', '灵寿县', '73', '0', '3', '');
INSERT INTO `ds_area` VALUES ('1140', '藁城市', '73', '0', '3', '');
INSERT INTO `ds_area` VALUES ('1141', '行唐县', '73', '0', '3', '');
INSERT INTO `ds_area` VALUES ('1142', '裕华区', '73', '0', '3', '');
INSERT INTO `ds_area` VALUES ('1143', '赞皇县', '73', '0', '3', '');
INSERT INTO `ds_area` VALUES ('1144', '赵县', '73', '0', '3', '');
INSERT INTO `ds_area` VALUES ('1145', '辛集市', '73', '0', '3', '');
INSERT INTO `ds_area` VALUES ('1146', '长安区', '73', '0', '3', '');
INSERT INTO `ds_area` VALUES ('1147', '高邑县', '73', '0', '3', '');
INSERT INTO `ds_area` VALUES ('1148', '鹿泉市', '73', '0', '3', '');
INSERT INTO `ds_area` VALUES ('1149', '丰南区', '74', '0', '3', '');
INSERT INTO `ds_area` VALUES ('1150', '丰润区', '74', '0', '3', '');
INSERT INTO `ds_area` VALUES ('1151', '乐亭县', '74', '0', '3', '');
INSERT INTO `ds_area` VALUES ('1152', '古冶区', '74', '0', '3', '');
INSERT INTO `ds_area` VALUES ('1153', '唐海县', '74', '0', '3', '');
INSERT INTO `ds_area` VALUES ('1154', '开平区', '74', '0', '3', '');
INSERT INTO `ds_area` VALUES ('1155', '滦南县', '74', '0', '3', '');
INSERT INTO `ds_area` VALUES ('1156', '滦县', '74', '0', '3', '');
INSERT INTO `ds_area` VALUES ('1157', '玉田县', '74', '0', '3', '');
INSERT INTO `ds_area` VALUES ('1158', '路北区', '74', '0', '3', '');
INSERT INTO `ds_area` VALUES ('1159', '路南区', '74', '0', '3', '');
INSERT INTO `ds_area` VALUES ('1160', '迁安市', '74', '0', '3', '');
INSERT INTO `ds_area` VALUES ('1161', '迁西县', '74', '0', '3', '');
INSERT INTO `ds_area` VALUES ('1162', '遵化市', '74', '0', '3', '');
INSERT INTO `ds_area` VALUES ('1163', '北戴河区', '75', '0', '3', '');
INSERT INTO `ds_area` VALUES ('1164', '卢龙县', '75', '0', '3', '');
INSERT INTO `ds_area` VALUES ('1165', '山海关区', '75', '0', '3', '');
INSERT INTO `ds_area` VALUES ('1166', '抚宁县', '75', '0', '3', '');
INSERT INTO `ds_area` VALUES ('1167', '昌黎县', '75', '0', '3', '');
INSERT INTO `ds_area` VALUES ('1168', '海港区', '75', '0', '3', '');
INSERT INTO `ds_area` VALUES ('1169', '青龙满族自治县', '75', '0', '3', '');
INSERT INTO `ds_area` VALUES ('1170', '丛台区', '76', '0', '3', '');
INSERT INTO `ds_area` VALUES ('1171', '临漳县', '76', '0', '3', '');
INSERT INTO `ds_area` VALUES ('1172', '复兴区', '76', '0', '3', '');
INSERT INTO `ds_area` VALUES ('1173', '大名县', '76', '0', '3', '');
INSERT INTO `ds_area` VALUES ('1174', '峰峰矿区', '76', '0', '3', '');
INSERT INTO `ds_area` VALUES ('1175', '广平县', '76', '0', '3', '');
INSERT INTO `ds_area` VALUES ('1176', '成安县', '76', '0', '3', '');
INSERT INTO `ds_area` VALUES ('1177', '曲周县', '76', '0', '3', '');
INSERT INTO `ds_area` VALUES ('1178', '武安市', '76', '0', '3', '');
INSERT INTO `ds_area` VALUES ('1179', '永年县', '76', '0', '3', '');
INSERT INTO `ds_area` VALUES ('1180', '涉县', '76', '0', '3', '');
INSERT INTO `ds_area` VALUES ('1181', '磁县', '76', '0', '3', '');
INSERT INTO `ds_area` VALUES ('1182', '肥乡县', '76', '0', '3', '');
INSERT INTO `ds_area` VALUES ('1183', '邯山区', '76', '0', '3', '');
INSERT INTO `ds_area` VALUES ('1184', '邯郸县', '76', '0', '3', '');
INSERT INTO `ds_area` VALUES ('1185', '邱县', '76', '0', '3', '');
INSERT INTO `ds_area` VALUES ('1186', '馆陶县', '76', '0', '3', '');
INSERT INTO `ds_area` VALUES ('1187', '魏县', '76', '0', '3', '');
INSERT INTO `ds_area` VALUES ('1188', '鸡泽县', '76', '0', '3', '');
INSERT INTO `ds_area` VALUES ('1189', '临城县', '77', '0', '3', '');
INSERT INTO `ds_area` VALUES ('1190', '临西县', '77', '0', '3', '');
INSERT INTO `ds_area` VALUES ('1191', '任县', '77', '0', '3', '');
INSERT INTO `ds_area` VALUES ('1192', '内丘县', '77', '0', '3', '');
INSERT INTO `ds_area` VALUES ('1193', '南和县', '77', '0', '3', '');
INSERT INTO `ds_area` VALUES ('1194', '南宫市', '77', '0', '3', '');
INSERT INTO `ds_area` VALUES ('1195', '威县', '77', '0', '3', '');
INSERT INTO `ds_area` VALUES ('1196', '宁晋县', '77', '0', '3', '');
INSERT INTO `ds_area` VALUES ('1197', '巨鹿县', '77', '0', '3', '');
INSERT INTO `ds_area` VALUES ('1198', '平乡县', '77', '0', '3', '');
INSERT INTO `ds_area` VALUES ('1199', '广宗县', '77', '0', '3', '');
INSERT INTO `ds_area` VALUES ('1200', '新河县', '77', '0', '3', '');
INSERT INTO `ds_area` VALUES ('1201', '柏乡县', '77', '0', '3', '');
INSERT INTO `ds_area` VALUES ('1202', '桥东区', '77', '0', '3', '');
INSERT INTO `ds_area` VALUES ('1203', '桥西区', '77', '0', '3', '');
INSERT INTO `ds_area` VALUES ('1204', '沙河市', '77', '0', '3', '');
INSERT INTO `ds_area` VALUES ('1205', '清河县', '77', '0', '3', '');
INSERT INTO `ds_area` VALUES ('1206', '邢台县', '77', '0', '3', '');
INSERT INTO `ds_area` VALUES ('1207', '隆尧县', '77', '0', '3', '');
INSERT INTO `ds_area` VALUES ('1208', '北市区', '78', '0', '3', '');
INSERT INTO `ds_area` VALUES ('1209', '南市区', '78', '0', '3', '');
INSERT INTO `ds_area` VALUES ('1210', '博野县', '78', '0', '3', '');
INSERT INTO `ds_area` VALUES ('1211', '唐县', '78', '0', '3', '');
INSERT INTO `ds_area` VALUES ('1212', '安国市', '78', '0', '3', '');
INSERT INTO `ds_area` VALUES ('1213', '安新县', '78', '0', '3', '');
INSERT INTO `ds_area` VALUES ('1214', '定兴县', '78', '0', '3', '');
INSERT INTO `ds_area` VALUES ('1215', '定州市', '78', '0', '3', '');
INSERT INTO `ds_area` VALUES ('1216', '容城县', '78', '0', '3', '');
INSERT INTO `ds_area` VALUES ('1217', '徐水县', '78', '0', '3', '');
INSERT INTO `ds_area` VALUES ('1218', '新市区', '78', '0', '3', '');
INSERT INTO `ds_area` VALUES ('1219', '易县', '78', '0', '3', '');
INSERT INTO `ds_area` VALUES ('1220', '曲阳县', '78', '0', '3', '');
INSERT INTO `ds_area` VALUES ('1221', '望都县', '78', '0', '3', '');
INSERT INTO `ds_area` VALUES ('1222', '涞水县', '78', '0', '3', '');
INSERT INTO `ds_area` VALUES ('1223', '涞源县', '78', '0', '3', '');
INSERT INTO `ds_area` VALUES ('1224', '涿州市', '78', '0', '3', '');
INSERT INTO `ds_area` VALUES ('1225', '清苑县', '78', '0', '3', '');
INSERT INTO `ds_area` VALUES ('1226', '满城县', '78', '0', '3', '');
INSERT INTO `ds_area` VALUES ('1227', '蠡县', '78', '0', '3', '');
INSERT INTO `ds_area` VALUES ('1228', '阜平县', '78', '0', '3', '');
INSERT INTO `ds_area` VALUES ('1229', '雄县', '78', '0', '3', '');
INSERT INTO `ds_area` VALUES ('1230', '顺平县', '78', '0', '3', '');
INSERT INTO `ds_area` VALUES ('1231', '高碑店市', '78', '0', '3', '');
INSERT INTO `ds_area` VALUES ('1232', '高阳县', '78', '0', '3', '');
INSERT INTO `ds_area` VALUES ('1233', '万全县', '79', '0', '3', '');
INSERT INTO `ds_area` VALUES ('1234', '下花园区', '79', '0', '3', '');
INSERT INTO `ds_area` VALUES ('1235', '宣化区', '79', '0', '3', '');
INSERT INTO `ds_area` VALUES ('1236', '宣化县', '79', '0', '3', '');
INSERT INTO `ds_area` VALUES ('1237', '尚义县', '79', '0', '3', '');
INSERT INTO `ds_area` VALUES ('1238', '崇礼县', '79', '0', '3', '');
INSERT INTO `ds_area` VALUES ('1239', '康保县', '79', '0', '3', '');
INSERT INTO `ds_area` VALUES ('1240', '张北县', '79', '0', '3', '');
INSERT INTO `ds_area` VALUES ('1241', '怀安县', '79', '0', '3', '');
INSERT INTO `ds_area` VALUES ('1242', '怀来县', '79', '0', '3', '');
INSERT INTO `ds_area` VALUES ('1243', '桥东区', '79', '0', '3', '');
INSERT INTO `ds_area` VALUES ('1244', '桥西区', '79', '0', '3', '');
INSERT INTO `ds_area` VALUES ('1245', '沽源县', '79', '0', '3', '');
INSERT INTO `ds_area` VALUES ('1246', '涿鹿县', '79', '0', '3', '');
INSERT INTO `ds_area` VALUES ('1247', '蔚县', '79', '0', '3', '');
INSERT INTO `ds_area` VALUES ('1248', '赤城县', '79', '0', '3', '');
INSERT INTO `ds_area` VALUES ('1249', '阳原县', '79', '0', '3', '');
INSERT INTO `ds_area` VALUES ('1250', '丰宁满族自治县', '80', '0', '3', '');
INSERT INTO `ds_area` VALUES ('1251', '兴隆县', '80', '0', '3', '');
INSERT INTO `ds_area` VALUES ('1252', '双桥区', '80', '0', '3', '');
INSERT INTO `ds_area` VALUES ('1253', '双滦区', '80', '0', '3', '');
INSERT INTO `ds_area` VALUES ('1254', '围场满族蒙古族自治县', '80', '0', '3', '');
INSERT INTO `ds_area` VALUES ('1255', '宽城满族自治县', '80', '0', '3', '');
INSERT INTO `ds_area` VALUES ('1256', '平泉县', '80', '0', '3', '');
INSERT INTO `ds_area` VALUES ('1257', '承德县', '80', '0', '3', '');
INSERT INTO `ds_area` VALUES ('1258', '滦平县', '80', '0', '3', '');
INSERT INTO `ds_area` VALUES ('1259', '隆化县', '80', '0', '3', '');
INSERT INTO `ds_area` VALUES ('1260', '鹰手营子矿区', '80', '0', '3', '');
INSERT INTO `ds_area` VALUES ('1261', '冀州市', '81', '0', '3', '');
INSERT INTO `ds_area` VALUES ('1262', '安平县', '81', '0', '3', '');
INSERT INTO `ds_area` VALUES ('1263', '故城县', '81', '0', '3', '');
INSERT INTO `ds_area` VALUES ('1264', '景县', '81', '0', '3', '');
INSERT INTO `ds_area` VALUES ('1265', '枣强县', '81', '0', '3', '');
INSERT INTO `ds_area` VALUES ('1266', '桃城区', '81', '0', '3', '');
INSERT INTO `ds_area` VALUES ('1267', '武强县', '81', '0', '3', '');
INSERT INTO `ds_area` VALUES ('1268', '武邑县', '81', '0', '3', '');
INSERT INTO `ds_area` VALUES ('1269', '深州市', '81', '0', '3', '');
INSERT INTO `ds_area` VALUES ('1270', '阜城县', '81', '0', '3', '');
INSERT INTO `ds_area` VALUES ('1271', '饶阳县', '81', '0', '3', '');
INSERT INTO `ds_area` VALUES ('1272', '三河市', '82', '0', '3', '');
INSERT INTO `ds_area` VALUES ('1273', '固安县', '82', '0', '3', '');
INSERT INTO `ds_area` VALUES ('1274', '大厂回族自治县', '82', '0', '3', '');
INSERT INTO `ds_area` VALUES ('1275', '大城县', '82', '0', '3', '');
INSERT INTO `ds_area` VALUES ('1276', '安次区', '82', '0', '3', '');
INSERT INTO `ds_area` VALUES ('1277', '广阳区', '82', '0', '3', '');
INSERT INTO `ds_area` VALUES ('1278', '文安县', '82', '0', '3', '');
INSERT INTO `ds_area` VALUES ('1279', '永清县', '82', '0', '3', '');
INSERT INTO `ds_area` VALUES ('1280', '霸州市', '82', '0', '3', '');
INSERT INTO `ds_area` VALUES ('1281', '香河县', '82', '0', '3', '');
INSERT INTO `ds_area` VALUES ('1282', '东光县', '83', '0', '3', '');
INSERT INTO `ds_area` VALUES ('1283', '任丘市', '83', '0', '3', '');
INSERT INTO `ds_area` VALUES ('1284', '南皮县', '83', '0', '3', '');
INSERT INTO `ds_area` VALUES ('1285', '吴桥县', '83', '0', '3', '');
INSERT INTO `ds_area` VALUES ('1286', '孟村回族自治县', '83', '0', '3', '');
INSERT INTO `ds_area` VALUES ('1287', '新华区', '83', '0', '3', '');
INSERT INTO `ds_area` VALUES ('1288', '沧县', '83', '0', '3', '');
INSERT INTO `ds_area` VALUES ('1289', '河间市', '83', '0', '3', '');
INSERT INTO `ds_area` VALUES ('1290', '泊头市', '83', '0', '3', '');
INSERT INTO `ds_area` VALUES ('1291', '海兴县', '83', '0', '3', '');
INSERT INTO `ds_area` VALUES ('1292', '献县', '83', '0', '3', '');
INSERT INTO `ds_area` VALUES ('1293', '盐山县', '83', '0', '3', '');
INSERT INTO `ds_area` VALUES ('1294', '肃宁县', '83', '0', '3', '');
INSERT INTO `ds_area` VALUES ('1295', '运河区', '83', '0', '3', '');
INSERT INTO `ds_area` VALUES ('1296', '青县', '83', '0', '3', '');
INSERT INTO `ds_area` VALUES ('1297', '黄骅市', '83', '0', '3', '');
INSERT INTO `ds_area` VALUES ('1298', '万柏林区', '84', '0', '3', '');
INSERT INTO `ds_area` VALUES ('1299', '古交市', '84', '0', '3', '');
INSERT INTO `ds_area` VALUES ('1300', '娄烦县', '84', '0', '3', '');
INSERT INTO `ds_area` VALUES ('1301', '小店区', '84', '0', '3', '');
INSERT INTO `ds_area` VALUES ('1302', '尖草坪区', '84', '0', '3', '');
INSERT INTO `ds_area` VALUES ('1303', '晋源区', '84', '0', '3', '');
INSERT INTO `ds_area` VALUES ('1304', '杏花岭区', '84', '0', '3', '');
INSERT INTO `ds_area` VALUES ('1305', '清徐县', '84', '0', '3', '');
INSERT INTO `ds_area` VALUES ('1306', '迎泽区', '84', '0', '3', '');
INSERT INTO `ds_area` VALUES ('1307', '阳曲县', '84', '0', '3', '');
INSERT INTO `ds_area` VALUES ('1308', '南郊区', '85', '0', '3', '');
INSERT INTO `ds_area` VALUES ('1309', '城区', '85', '0', '3', '');
INSERT INTO `ds_area` VALUES ('1310', '大同县', '85', '0', '3', '');
INSERT INTO `ds_area` VALUES ('1311', '天镇县', '85', '0', '3', '');
INSERT INTO `ds_area` VALUES ('1312', '左云县', '85', '0', '3', '');
INSERT INTO `ds_area` VALUES ('1313', '广灵县', '85', '0', '3', '');
INSERT INTO `ds_area` VALUES ('1314', '新荣区', '85', '0', '3', '');
INSERT INTO `ds_area` VALUES ('1315', '浑源县', '85', '0', '3', '');
INSERT INTO `ds_area` VALUES ('1316', '灵丘县', '85', '0', '3', '');
INSERT INTO `ds_area` VALUES ('1317', '矿区', '85', '0', '3', '');
INSERT INTO `ds_area` VALUES ('1318', '阳高县', '85', '0', '3', '');
INSERT INTO `ds_area` VALUES ('1319', '城区', '86', '0', '3', '');
INSERT INTO `ds_area` VALUES ('1320', '平定县', '86', '0', '3', '');
INSERT INTO `ds_area` VALUES ('1321', '盂县', '86', '0', '3', '');
INSERT INTO `ds_area` VALUES ('1322', '矿区', '86', '0', '3', '');
INSERT INTO `ds_area` VALUES ('1323', '郊区', '86', '0', '3', '');
INSERT INTO `ds_area` VALUES ('1324', '城区', '87', '0', '3', '');
INSERT INTO `ds_area` VALUES ('1325', '壶关县', '87', '0', '3', '');
INSERT INTO `ds_area` VALUES ('1326', '屯留县', '87', '0', '3', '');
INSERT INTO `ds_area` VALUES ('1327', '平顺县', '87', '0', '3', '');
INSERT INTO `ds_area` VALUES ('1328', '武乡县', '87', '0', '3', '');
INSERT INTO `ds_area` VALUES ('1329', '沁县', '87', '0', '3', '');
INSERT INTO `ds_area` VALUES ('1330', '沁源县', '87', '0', '3', '');
INSERT INTO `ds_area` VALUES ('1331', '潞城市', '87', '0', '3', '');
INSERT INTO `ds_area` VALUES ('1332', '襄垣县', '87', '0', '3', '');
INSERT INTO `ds_area` VALUES ('1333', '郊区', '87', '0', '3', '');
INSERT INTO `ds_area` VALUES ('1334', '长子县', '87', '0', '3', '');
INSERT INTO `ds_area` VALUES ('1335', '长治县', '87', '0', '3', '');
INSERT INTO `ds_area` VALUES ('1336', '黎城县', '87', '0', '3', '');
INSERT INTO `ds_area` VALUES ('1337', '城区', '88', '0', '3', '');
INSERT INTO `ds_area` VALUES ('1338', '沁水县', '88', '0', '3', '');
INSERT INTO `ds_area` VALUES ('1339', '泽州县', '88', '0', '3', '');
INSERT INTO `ds_area` VALUES ('1340', '阳城县', '88', '0', '3', '');
INSERT INTO `ds_area` VALUES ('1341', '陵川县', '88', '0', '3', '');
INSERT INTO `ds_area` VALUES ('1342', '高平市', '88', '0', '3', '');
INSERT INTO `ds_area` VALUES ('1343', '右玉县', '89', '0', '3', '');
INSERT INTO `ds_area` VALUES ('1344', '山阴县', '89', '0', '3', '');
INSERT INTO `ds_area` VALUES ('1345', '平鲁区', '89', '0', '3', '');
INSERT INTO `ds_area` VALUES ('1346', '应县', '89', '0', '3', '');
INSERT INTO `ds_area` VALUES ('1347', '怀仁县', '89', '0', '3', '');
INSERT INTO `ds_area` VALUES ('1348', '朔城区', '89', '0', '3', '');
INSERT INTO `ds_area` VALUES ('1349', '介休市', '90', '0', '3', '');
INSERT INTO `ds_area` VALUES ('1350', '和顺县', '90', '0', '3', '');
INSERT INTO `ds_area` VALUES ('1351', '太谷县', '90', '0', '3', '');
INSERT INTO `ds_area` VALUES ('1352', '寿阳县', '90', '0', '3', '');
INSERT INTO `ds_area` VALUES ('1353', '左权县', '90', '0', '3', '');
INSERT INTO `ds_area` VALUES ('1354', '平遥县', '90', '0', '3', '');
INSERT INTO `ds_area` VALUES ('1355', '昔阳县', '90', '0', '3', '');
INSERT INTO `ds_area` VALUES ('1356', '榆次区', '90', '0', '3', '');
INSERT INTO `ds_area` VALUES ('1357', '榆社县', '90', '0', '3', '');
INSERT INTO `ds_area` VALUES ('1358', '灵石县', '90', '0', '3', '');
INSERT INTO `ds_area` VALUES ('1359', '祁县', '90', '0', '3', '');
INSERT INTO `ds_area` VALUES ('1360', '万荣县', '91', '0', '3', '');
INSERT INTO `ds_area` VALUES ('1361', '临猗县', '91', '0', '3', '');
INSERT INTO `ds_area` VALUES ('1362', '垣曲县', '91', '0', '3', '');
INSERT INTO `ds_area` VALUES ('1363', '夏县', '91', '0', '3', '');
INSERT INTO `ds_area` VALUES ('1364', '平陆县', '91', '0', '3', '');
INSERT INTO `ds_area` VALUES ('1365', '新绛县', '91', '0', '3', '');
INSERT INTO `ds_area` VALUES ('1366', '永济市', '91', '0', '3', '');
INSERT INTO `ds_area` VALUES ('1367', '河津市', '91', '0', '3', '');
INSERT INTO `ds_area` VALUES ('1368', '盐湖区', '91', '0', '3', '');
INSERT INTO `ds_area` VALUES ('1369', '稷山县', '91', '0', '3', '');
INSERT INTO `ds_area` VALUES ('1370', '绛县', '91', '0', '3', '');
INSERT INTO `ds_area` VALUES ('1371', '芮城县', '91', '0', '3', '');
INSERT INTO `ds_area` VALUES ('1372', '闻喜县', '91', '0', '3', '');
INSERT INTO `ds_area` VALUES ('1373', '五台县', '92', '0', '3', '');
INSERT INTO `ds_area` VALUES ('1374', '五寨县', '92', '0', '3', '');
INSERT INTO `ds_area` VALUES ('1375', '代县', '92', '0', '3', '');
INSERT INTO `ds_area` VALUES ('1376', '保德县', '92', '0', '3', '');
INSERT INTO `ds_area` VALUES ('1377', '偏关县', '92', '0', '3', '');
INSERT INTO `ds_area` VALUES ('1378', '原平市', '92', '0', '3', '');
INSERT INTO `ds_area` VALUES ('1379', '宁武县', '92', '0', '3', '');
INSERT INTO `ds_area` VALUES ('1380', '定襄县', '92', '0', '3', '');
INSERT INTO `ds_area` VALUES ('1381', '岢岚县', '92', '0', '3', '');
INSERT INTO `ds_area` VALUES ('1382', '忻府区', '92', '0', '3', '');
INSERT INTO `ds_area` VALUES ('1383', '河曲县', '92', '0', '3', '');
INSERT INTO `ds_area` VALUES ('1384', '神池县', '92', '0', '3', '');
INSERT INTO `ds_area` VALUES ('1385', '繁峙县', '92', '0', '3', '');
INSERT INTO `ds_area` VALUES ('1386', '静乐县', '92', '0', '3', '');
INSERT INTO `ds_area` VALUES ('1387', '乡宁县', '93', '0', '3', '');
INSERT INTO `ds_area` VALUES ('1388', '侯马市', '93', '0', '3', '');
INSERT INTO `ds_area` VALUES ('1389', '古县', '93', '0', '3', '');
INSERT INTO `ds_area` VALUES ('1390', '吉县', '93', '0', '3', '');
INSERT INTO `ds_area` VALUES ('1391', '大宁县', '93', '0', '3', '');
INSERT INTO `ds_area` VALUES ('1392', '安泽县', '93', '0', '3', '');
INSERT INTO `ds_area` VALUES ('1393', '尧都区', '93', '0', '3', '');
INSERT INTO `ds_area` VALUES ('1394', '曲沃县', '93', '0', '3', '');
INSERT INTO `ds_area` VALUES ('1395', '永和县', '93', '0', '3', '');
INSERT INTO `ds_area` VALUES ('1396', '汾西县', '93', '0', '3', '');
INSERT INTO `ds_area` VALUES ('1397', '洪洞县', '93', '0', '3', '');
INSERT INTO `ds_area` VALUES ('1398', '浮山县', '93', '0', '3', '');
INSERT INTO `ds_area` VALUES ('1399', '翼城县', '93', '0', '3', '');
INSERT INTO `ds_area` VALUES ('1400', '蒲县', '93', '0', '3', '');
INSERT INTO `ds_area` VALUES ('1401', '襄汾县', '93', '0', '3', '');
INSERT INTO `ds_area` VALUES ('1402', '隰县', '93', '0', '3', '');
INSERT INTO `ds_area` VALUES ('1403', '霍州市', '93', '0', '3', '');
INSERT INTO `ds_area` VALUES ('1404', '中阳县', '94', '0', '3', '');
INSERT INTO `ds_area` VALUES ('1405', '临县', '94', '0', '3', '');
INSERT INTO `ds_area` VALUES ('1406', '交口县', '94', '0', '3', '');
INSERT INTO `ds_area` VALUES ('1407', '交城县', '94', '0', '3', '');
INSERT INTO `ds_area` VALUES ('1408', '兴县', '94', '0', '3', '');
INSERT INTO `ds_area` VALUES ('1409', '孝义市', '94', '0', '3', '');
INSERT INTO `ds_area` VALUES ('1410', '岚县', '94', '0', '3', '');
INSERT INTO `ds_area` VALUES ('1411', '文水县', '94', '0', '3', '');
INSERT INTO `ds_area` VALUES ('1412', '方山县', '94', '0', '3', '');
INSERT INTO `ds_area` VALUES ('1413', '柳林县', '94', '0', '3', '');
INSERT INTO `ds_area` VALUES ('1414', '汾阳市', '94', '0', '3', '');
INSERT INTO `ds_area` VALUES ('1415', '石楼县', '94', '0', '3', '');
INSERT INTO `ds_area` VALUES ('1416', '离石区', '94', '0', '3', '');
INSERT INTO `ds_area` VALUES ('1417', '和林格尔县', '95', '0', '3', '');
INSERT INTO `ds_area` VALUES ('1418', '回民区', '95', '0', '3', '');
INSERT INTO `ds_area` VALUES ('1419', '土默特左旗', '95', '0', '3', '');
INSERT INTO `ds_area` VALUES ('1420', '托克托县', '95', '0', '3', '');
INSERT INTO `ds_area` VALUES ('1421', '新城区', '95', '0', '3', '');
INSERT INTO `ds_area` VALUES ('1422', '武川县', '95', '0', '3', '');
INSERT INTO `ds_area` VALUES ('1423', '清水河县', '95', '0', '3', '');
INSERT INTO `ds_area` VALUES ('1424', '玉泉区', '95', '0', '3', '');
INSERT INTO `ds_area` VALUES ('1425', '赛罕区', '95', '0', '3', '');
INSERT INTO `ds_area` VALUES ('1426', '东河区', '96', '0', '3', '');
INSERT INTO `ds_area` VALUES ('1427', '九原区', '96', '0', '3', '');
INSERT INTO `ds_area` VALUES ('1428', '固阳县', '96', '0', '3', '');
INSERT INTO `ds_area` VALUES ('1429', '土默特右旗', '96', '0', '3', '');
INSERT INTO `ds_area` VALUES ('1430', '昆都仑区', '96', '0', '3', '');
INSERT INTO `ds_area` VALUES ('1431', '白云矿区', '96', '0', '3', '');
INSERT INTO `ds_area` VALUES ('1432', '石拐区', '96', '0', '3', '');
INSERT INTO `ds_area` VALUES ('1433', '达尔罕茂明安联合旗', '96', '0', '3', '');
INSERT INTO `ds_area` VALUES ('1434', '青山区', '96', '0', '3', '');
INSERT INTO `ds_area` VALUES ('1435', '乌达区', '97', '0', '3', '');
INSERT INTO `ds_area` VALUES ('1436', '海勃湾区', '97', '0', '3', '');
INSERT INTO `ds_area` VALUES ('1437', '海南区', '97', '0', '3', '');
INSERT INTO `ds_area` VALUES ('1438', '元宝山区', '98', '0', '3', '');
INSERT INTO `ds_area` VALUES ('1439', '克什克腾旗', '98', '0', '3', '');
INSERT INTO `ds_area` VALUES ('1440', '喀喇沁旗', '98', '0', '3', '');
INSERT INTO `ds_area` VALUES ('1441', '宁城县', '98', '0', '3', '');
INSERT INTO `ds_area` VALUES ('1442', '巴林右旗', '98', '0', '3', '');
INSERT INTO `ds_area` VALUES ('1443', '巴林左旗', '98', '0', '3', '');
INSERT INTO `ds_area` VALUES ('1444', '敖汉旗', '98', '0', '3', '');
INSERT INTO `ds_area` VALUES ('1445', '松山区', '98', '0', '3', '');
INSERT INTO `ds_area` VALUES ('1446', '林西县', '98', '0', '3', '');
INSERT INTO `ds_area` VALUES ('1447', '红山区', '98', '0', '3', '');
INSERT INTO `ds_area` VALUES ('1448', '翁牛特旗', '98', '0', '3', '');
INSERT INTO `ds_area` VALUES ('1449', '阿鲁科尔沁旗', '98', '0', '3', '');
INSERT INTO `ds_area` VALUES ('1450', '奈曼旗', '99', '0', '3', '');
INSERT INTO `ds_area` VALUES ('1451', '库伦旗', '99', '0', '3', '');
INSERT INTO `ds_area` VALUES ('1452', '开鲁县', '99', '0', '3', '');
INSERT INTO `ds_area` VALUES ('1453', '扎鲁特旗', '99', '0', '3', '');
INSERT INTO `ds_area` VALUES ('1454', '科尔沁区', '99', '0', '3', '');
INSERT INTO `ds_area` VALUES ('1455', '科尔沁左翼中旗', '99', '0', '3', '');
INSERT INTO `ds_area` VALUES ('1456', '科尔沁左翼后旗', '99', '0', '3', '');
INSERT INTO `ds_area` VALUES ('1457', '霍林郭勒市', '99', '0', '3', '');
INSERT INTO `ds_area` VALUES ('1458', '东胜区', '100', '0', '3', '');
INSERT INTO `ds_area` VALUES ('1459', '乌审旗', '100', '0', '3', '');
INSERT INTO `ds_area` VALUES ('1460', '伊金霍洛旗', '100', '0', '3', '');
INSERT INTO `ds_area` VALUES ('1461', '准格尔旗', '100', '0', '3', '');
INSERT INTO `ds_area` VALUES ('1462', '杭锦旗', '100', '0', '3', '');
INSERT INTO `ds_area` VALUES ('1463', '达拉特旗', '100', '0', '3', '');
INSERT INTO `ds_area` VALUES ('1464', '鄂东胜区', '100', '0', '3', '');
INSERT INTO `ds_area` VALUES ('1465', '鄂托克前旗', '100', '0', '3', '');
INSERT INTO `ds_area` VALUES ('1466', '鄂托克旗', '100', '0', '3', '');
INSERT INTO `ds_area` VALUES ('1467', '扎兰屯市', '101', '0', '3', '');
INSERT INTO `ds_area` VALUES ('1468', '新巴尔虎右旗', '101', '0', '3', '');
INSERT INTO `ds_area` VALUES ('1469', '新巴尔虎左旗', '101', '0', '3', '');
INSERT INTO `ds_area` VALUES ('1470', '根河市', '101', '0', '3', '');
INSERT INTO `ds_area` VALUES ('1471', '海拉尔区', '101', '0', '3', '');
INSERT INTO `ds_area` VALUES ('1472', '满洲里市', '101', '0', '3', '');
INSERT INTO `ds_area` VALUES ('1473', '牙克石市', '101', '0', '3', '');
INSERT INTO `ds_area` VALUES ('1474', '莫力达瓦达斡尔族自治旗', '101', '0', '3', '');
INSERT INTO `ds_area` VALUES ('1475', '鄂伦春自治旗', '101', '0', '3', '');
INSERT INTO `ds_area` VALUES ('1476', '鄂温克族自治旗', '101', '0', '3', '');
INSERT INTO `ds_area` VALUES ('1477', '阿荣旗', '101', '0', '3', '');
INSERT INTO `ds_area` VALUES ('1478', '陈巴尔虎旗', '101', '0', '3', '');
INSERT INTO `ds_area` VALUES ('1479', '额尔古纳市', '101', '0', '3', '');
INSERT INTO `ds_area` VALUES ('1480', '临河区', '102', '0', '3', '');
INSERT INTO `ds_area` VALUES ('1481', '乌拉特中旗', '102', '0', '3', '');
INSERT INTO `ds_area` VALUES ('1482', '乌拉特前旗', '102', '0', '3', '');
INSERT INTO `ds_area` VALUES ('1483', '乌拉特后旗', '102', '0', '3', '');
INSERT INTO `ds_area` VALUES ('1484', '五原县', '102', '0', '3', '');
INSERT INTO `ds_area` VALUES ('1485', '杭锦后旗', '102', '0', '3', '');
INSERT INTO `ds_area` VALUES ('1486', '磴口县', '102', '0', '3', '');
INSERT INTO `ds_area` VALUES ('1487', '丰镇市', '103', '0', '3', '');
INSERT INTO `ds_area` VALUES ('1488', '兴和县', '103', '0', '3', '');
INSERT INTO `ds_area` VALUES ('1489', '凉城县', '103', '0', '3', '');
INSERT INTO `ds_area` VALUES ('1490', '化德县', '103', '0', '3', '');
INSERT INTO `ds_area` VALUES ('1491', '卓资县', '103', '0', '3', '');
INSERT INTO `ds_area` VALUES ('1492', '商都县', '103', '0', '3', '');
INSERT INTO `ds_area` VALUES ('1493', '四子王旗', '103', '0', '3', '');
INSERT INTO `ds_area` VALUES ('1494', '察哈尔右翼中旗', '103', '0', '3', '');
INSERT INTO `ds_area` VALUES ('1495', '察哈尔右翼前旗', '103', '0', '3', '');
INSERT INTO `ds_area` VALUES ('1496', '察哈尔右翼后旗', '103', '0', '3', '');
INSERT INTO `ds_area` VALUES ('1497', '集宁区', '103', '0', '3', '');
INSERT INTO `ds_area` VALUES ('1498', '乌兰浩特市', '104', '0', '3', '');
INSERT INTO `ds_area` VALUES ('1499', '扎赉特旗', '104', '0', '3', '');
INSERT INTO `ds_area` VALUES ('1500', '科尔沁右翼中旗', '104', '0', '3', '');
INSERT INTO `ds_area` VALUES ('1501', '科尔沁右翼前旗', '104', '0', '3', '');
INSERT INTO `ds_area` VALUES ('1502', '突泉县', '104', '0', '3', '');
INSERT INTO `ds_area` VALUES ('1503', '阿尔山市', '104', '0', '3', '');
INSERT INTO `ds_area` VALUES ('1504', '东乌珠穆沁旗', '105', '0', '3', '');
INSERT INTO `ds_area` VALUES ('1505', '二连浩特市', '105', '0', '3', '');
INSERT INTO `ds_area` VALUES ('1506', '多伦县', '105', '0', '3', '');
INSERT INTO `ds_area` VALUES ('1507', '太仆寺旗', '105', '0', '3', '');
INSERT INTO `ds_area` VALUES ('1508', '正蓝旗', '105', '0', '3', '');
INSERT INTO `ds_area` VALUES ('1509', '正镶白旗', '105', '0', '3', '');
INSERT INTO `ds_area` VALUES ('1510', '苏尼特右旗', '105', '0', '3', '');
INSERT INTO `ds_area` VALUES ('1511', '苏尼特左旗', '105', '0', '3', '');
INSERT INTO `ds_area` VALUES ('1512', '西乌珠穆沁旗', '105', '0', '3', '');
INSERT INTO `ds_area` VALUES ('1513', '锡林浩特市', '105', '0', '3', '');
INSERT INTO `ds_area` VALUES ('1514', '镶黄旗', '105', '0', '3', '');
INSERT INTO `ds_area` VALUES ('1515', '阿巴嘎旗', '105', '0', '3', '');
INSERT INTO `ds_area` VALUES ('1516', '阿拉善右旗', '106', '0', '3', '');
INSERT INTO `ds_area` VALUES ('1517', '阿拉善左旗', '106', '0', '3', '');
INSERT INTO `ds_area` VALUES ('1518', '额济纳旗', '106', '0', '3', '');
INSERT INTO `ds_area` VALUES ('1519', '东陵区', '107', '0', '3', '');
INSERT INTO `ds_area` VALUES ('1520', '于洪区', '107', '0', '3', '');
INSERT INTO `ds_area` VALUES ('1521', '和平区', '107', '0', '3', '');
INSERT INTO `ds_area` VALUES ('1522', '大东区', '107', '0', '3', '');
INSERT INTO `ds_area` VALUES ('1523', '康平县', '107', '0', '3', '');
INSERT INTO `ds_area` VALUES ('1524', '新民市', '107', '0', '3', '');
INSERT INTO `ds_area` VALUES ('1525', '沈北新区', '107', '0', '3', '');
INSERT INTO `ds_area` VALUES ('1526', '沈河区', '107', '0', '3', '');
INSERT INTO `ds_area` VALUES ('1527', '法库县', '107', '0', '3', '');
INSERT INTO `ds_area` VALUES ('1528', '皇姑区', '107', '0', '3', '');
INSERT INTO `ds_area` VALUES ('1529', '苏家屯区', '107', '0', '3', '');
INSERT INTO `ds_area` VALUES ('1530', '辽中县', '107', '0', '3', '');
INSERT INTO `ds_area` VALUES ('1531', '铁西区', '107', '0', '3', '');
INSERT INTO `ds_area` VALUES ('1532', '中山区', '108', '0', '3', '');
INSERT INTO `ds_area` VALUES ('1533', '庄河市', '108', '0', '3', '');
INSERT INTO `ds_area` VALUES ('1534', '旅顺口区', '108', '0', '3', '');
INSERT INTO `ds_area` VALUES ('1535', '普兰店市', '108', '0', '3', '');
INSERT INTO `ds_area` VALUES ('1536', '沙河口区', '108', '0', '3', '');
INSERT INTO `ds_area` VALUES ('1537', '瓦房店市', '108', '0', '3', '');
INSERT INTO `ds_area` VALUES ('1538', '甘井子区', '108', '0', '3', '');
INSERT INTO `ds_area` VALUES ('1539', '西岗区', '108', '0', '3', '');
INSERT INTO `ds_area` VALUES ('1540', '金州区', '108', '0', '3', '');
INSERT INTO `ds_area` VALUES ('1541', '长海县', '108', '0', '3', '');
INSERT INTO `ds_area` VALUES ('1542', '千山区', '109', '0', '3', '');
INSERT INTO `ds_area` VALUES ('1543', '台安县', '109', '0', '3', '');
INSERT INTO `ds_area` VALUES ('1544', '岫岩满族自治县', '109', '0', '3', '');
INSERT INTO `ds_area` VALUES ('1545', '海城市', '109', '0', '3', '');
INSERT INTO `ds_area` VALUES ('1546', '立山区', '109', '0', '3', '');
INSERT INTO `ds_area` VALUES ('1547', '铁东区', '109', '0', '3', '');
INSERT INTO `ds_area` VALUES ('1548', '铁西区', '109', '0', '3', '');
INSERT INTO `ds_area` VALUES ('1549', '东洲区', '110', '0', '3', '');
INSERT INTO `ds_area` VALUES ('1550', '抚顺县', '110', '0', '3', '');
INSERT INTO `ds_area` VALUES ('1551', '新宾满族自治县', '110', '0', '3', '');
INSERT INTO `ds_area` VALUES ('1552', '新抚区', '110', '0', '3', '');
INSERT INTO `ds_area` VALUES ('1553', '望花区', '110', '0', '3', '');
INSERT INTO `ds_area` VALUES ('1554', '清原满族自治县', '110', '0', '3', '');
INSERT INTO `ds_area` VALUES ('1555', '顺城区', '110', '0', '3', '');
INSERT INTO `ds_area` VALUES ('1556', '南芬区', '111', '0', '3', '');
INSERT INTO `ds_area` VALUES ('1557', '平山区', '111', '0', '3', '');
INSERT INTO `ds_area` VALUES ('1558', '明山区', '111', '0', '3', '');
INSERT INTO `ds_area` VALUES ('1559', '本溪满族自治县', '111', '0', '3', '');
INSERT INTO `ds_area` VALUES ('1560', '桓仁满族自治县', '111', '0', '3', '');
INSERT INTO `ds_area` VALUES ('1561', '溪湖区', '111', '0', '3', '');
INSERT INTO `ds_area` VALUES ('1562', '东港市', '112', '0', '3', '');
INSERT INTO `ds_area` VALUES ('1563', '元宝区', '112', '0', '3', '');
INSERT INTO `ds_area` VALUES ('1564', '凤城市', '112', '0', '3', '');
INSERT INTO `ds_area` VALUES ('1565', '宽甸满族自治县', '112', '0', '3', '');
INSERT INTO `ds_area` VALUES ('1566', '振兴区', '112', '0', '3', '');
INSERT INTO `ds_area` VALUES ('1567', '振安区', '112', '0', '3', '');
INSERT INTO `ds_area` VALUES ('1568', '义县', '113', '0', '3', '');
INSERT INTO `ds_area` VALUES ('1569', '凌河区', '113', '0', '3', '');
INSERT INTO `ds_area` VALUES ('1570', '凌海市', '113', '0', '3', '');
INSERT INTO `ds_area` VALUES ('1571', '北镇市', '113', '0', '3', '');
INSERT INTO `ds_area` VALUES ('1572', '古塔区', '113', '0', '3', '');
INSERT INTO `ds_area` VALUES ('1573', '太和区', '113', '0', '3', '');
INSERT INTO `ds_area` VALUES ('1574', '黑山县', '113', '0', '3', '');
INSERT INTO `ds_area` VALUES ('1575', '大石桥市', '114', '0', '3', '');
INSERT INTO `ds_area` VALUES ('1576', '盖州市', '114', '0', '3', '');
INSERT INTO `ds_area` VALUES ('1577', '站前区', '114', '0', '3', '');
INSERT INTO `ds_area` VALUES ('1578', '老边区', '114', '0', '3', '');
INSERT INTO `ds_area` VALUES ('1579', '西市区', '114', '0', '3', '');
INSERT INTO `ds_area` VALUES ('1580', '鲅鱼圈区', '114', '0', '3', '');
INSERT INTO `ds_area` VALUES ('1581', '太平区', '115', '0', '3', '');
INSERT INTO `ds_area` VALUES ('1582', '彰武县', '115', '0', '3', '');
INSERT INTO `ds_area` VALUES ('1583', '新邱区', '115', '0', '3', '');
INSERT INTO `ds_area` VALUES ('1584', '海州区', '115', '0', '3', '');
INSERT INTO `ds_area` VALUES ('1585', '清河门区', '115', '0', '3', '');
INSERT INTO `ds_area` VALUES ('1586', '细河区', '115', '0', '3', '');
INSERT INTO `ds_area` VALUES ('1587', '蒙古族自治县', '115', '0', '3', '');
INSERT INTO `ds_area` VALUES ('1588', '太子河区', '116', '0', '3', '');
INSERT INTO `ds_area` VALUES ('1589', '宏伟区', '116', '0', '3', '');
INSERT INTO `ds_area` VALUES ('1590', '弓长岭区', '116', '0', '3', '');
INSERT INTO `ds_area` VALUES ('1591', '文圣区', '116', '0', '3', '');
INSERT INTO `ds_area` VALUES ('1592', '灯塔市', '116', '0', '3', '');
INSERT INTO `ds_area` VALUES ('1593', '白塔区', '116', '0', '3', '');
INSERT INTO `ds_area` VALUES ('1594', '辽阳县', '116', '0', '3', '');
INSERT INTO `ds_area` VALUES ('1595', '兴隆台区', '117', '0', '3', '');
INSERT INTO `ds_area` VALUES ('1596', '双台子区', '117', '0', '3', '');
INSERT INTO `ds_area` VALUES ('1597', '大洼县', '117', '0', '3', '');
INSERT INTO `ds_area` VALUES ('1598', '盘山县', '117', '0', '3', '');
INSERT INTO `ds_area` VALUES ('1599', '开原市', '118', '0', '3', '');
INSERT INTO `ds_area` VALUES ('1600', '昌图县', '118', '0', '3', '');
INSERT INTO `ds_area` VALUES ('1601', '清河区', '118', '0', '3', '');
INSERT INTO `ds_area` VALUES ('1602', '西丰县', '118', '0', '3', '');
INSERT INTO `ds_area` VALUES ('1603', '调兵山市', '118', '0', '3', '');
INSERT INTO `ds_area` VALUES ('1604', '铁岭县', '118', '0', '3', '');
INSERT INTO `ds_area` VALUES ('1605', '银州区', '118', '0', '3', '');
INSERT INTO `ds_area` VALUES ('1606', '凌源市', '119', '0', '3', '');
INSERT INTO `ds_area` VALUES ('1607', '北票市', '119', '0', '3', '');
INSERT INTO `ds_area` VALUES ('1608', '双塔区', '119', '0', '3', '');
INSERT INTO `ds_area` VALUES ('1609', '喀喇沁左翼蒙古族自治县', '119', '0', '3', '');
INSERT INTO `ds_area` VALUES ('1610', '建平县', '119', '0', '3', '');
INSERT INTO `ds_area` VALUES ('1611', '朝阳县', '119', '0', '3', '');
INSERT INTO `ds_area` VALUES ('1612', '龙城区', '119', '0', '3', '');
INSERT INTO `ds_area` VALUES ('1613', '兴城市', '120', '0', '3', '');
INSERT INTO `ds_area` VALUES ('1614', '南票区', '120', '0', '3', '');
INSERT INTO `ds_area` VALUES ('1615', '建昌县', '120', '0', '3', '');
INSERT INTO `ds_area` VALUES ('1616', '绥中县', '120', '0', '3', '');
INSERT INTO `ds_area` VALUES ('1617', '连山区', '120', '0', '3', '');
INSERT INTO `ds_area` VALUES ('1618', '龙港区', '120', '0', '3', '');
INSERT INTO `ds_area` VALUES ('1619', '九台市', '121', '0', '3', '');
INSERT INTO `ds_area` VALUES ('1620', '二道区', '121', '0', '3', '');
INSERT INTO `ds_area` VALUES ('1621', '农安县', '121', '0', '3', '');
INSERT INTO `ds_area` VALUES ('1622', '南关区', '121', '0', '3', '');
INSERT INTO `ds_area` VALUES ('1623', '双阳区', '121', '0', '3', '');
INSERT INTO `ds_area` VALUES ('1624', '宽城区', '121', '0', '3', '');
INSERT INTO `ds_area` VALUES ('1625', '德惠市', '121', '0', '3', '');
INSERT INTO `ds_area` VALUES ('1626', '朝阳区', '121', '0', '3', '');
INSERT INTO `ds_area` VALUES ('1627', '榆树市', '121', '0', '3', '');
INSERT INTO `ds_area` VALUES ('1628', '绿园区', '121', '0', '3', '');
INSERT INTO `ds_area` VALUES ('1629', '丰满区', '122', '0', '3', '');
INSERT INTO `ds_area` VALUES ('1630', '昌邑区', '122', '0', '3', '');
INSERT INTO `ds_area` VALUES ('1631', '桦甸市', '122', '0', '3', '');
INSERT INTO `ds_area` VALUES ('1632', '永吉县', '122', '0', '3', '');
INSERT INTO `ds_area` VALUES ('1633', '磐石市', '122', '0', '3', '');
INSERT INTO `ds_area` VALUES ('1634', '舒兰市', '122', '0', '3', '');
INSERT INTO `ds_area` VALUES ('1635', '船营区', '122', '0', '3', '');
INSERT INTO `ds_area` VALUES ('1636', '蛟河市', '122', '0', '3', '');
INSERT INTO `ds_area` VALUES ('1637', '龙潭区', '122', '0', '3', '');
INSERT INTO `ds_area` VALUES ('1638', '伊通满族自治县', '123', '0', '3', '');
INSERT INTO `ds_area` VALUES ('1639', '公主岭市', '123', '0', '3', '');
INSERT INTO `ds_area` VALUES ('1640', '双辽市', '123', '0', '3', '');
INSERT INTO `ds_area` VALUES ('1641', '梨树县', '123', '0', '3', '');
INSERT INTO `ds_area` VALUES ('1642', '铁东区', '123', '0', '3', '');
INSERT INTO `ds_area` VALUES ('1643', '铁西区', '123', '0', '3', '');
INSERT INTO `ds_area` VALUES ('1644', '东丰县', '124', '0', '3', '');
INSERT INTO `ds_area` VALUES ('1645', '东辽县', '124', '0', '3', '');
INSERT INTO `ds_area` VALUES ('1646', '西安区', '124', '0', '3', '');
INSERT INTO `ds_area` VALUES ('1647', '龙山区', '124', '0', '3', '');
INSERT INTO `ds_area` VALUES ('1648', '东昌区', '125', '0', '3', '');
INSERT INTO `ds_area` VALUES ('1649', '二道江区', '125', '0', '3', '');
INSERT INTO `ds_area` VALUES ('1650', '柳河县', '125', '0', '3', '');
INSERT INTO `ds_area` VALUES ('1651', '梅河口市', '125', '0', '3', '');
INSERT INTO `ds_area` VALUES ('1652', '辉南县', '125', '0', '3', '');
INSERT INTO `ds_area` VALUES ('1653', '通化县', '125', '0', '3', '');
INSERT INTO `ds_area` VALUES ('1654', '集安市', '125', '0', '3', '');
INSERT INTO `ds_area` VALUES ('1655', '临江市', '126', '0', '3', '');
INSERT INTO `ds_area` VALUES ('1656', '八道江区', '126', '0', '3', '');
INSERT INTO `ds_area` VALUES ('1657', '抚松县', '126', '0', '3', '');
INSERT INTO `ds_area` VALUES ('1658', '江源区', '126', '0', '3', '');
INSERT INTO `ds_area` VALUES ('1659', '长白朝鲜族自治县', '126', '0', '3', '');
INSERT INTO `ds_area` VALUES ('1660', '靖宇县', '126', '0', '3', '');
INSERT INTO `ds_area` VALUES ('1661', '干安县', '127', '0', '3', '');
INSERT INTO `ds_area` VALUES ('1662', '前郭尔罗斯蒙古族自治县', '127', '0', '3', '');
INSERT INTO `ds_area` VALUES ('1663', '宁江区', '127', '0', '3', '');
INSERT INTO `ds_area` VALUES ('1664', '扶余县', '127', '0', '3', '');
INSERT INTO `ds_area` VALUES ('1665', '长岭县', '127', '0', '3', '');
INSERT INTO `ds_area` VALUES ('1666', '大安市', '128', '0', '3', '');
INSERT INTO `ds_area` VALUES ('1667', '洮北区', '128', '0', '3', '');
INSERT INTO `ds_area` VALUES ('1668', '洮南市', '128', '0', '3', '');
INSERT INTO `ds_area` VALUES ('1669', '通榆县', '128', '0', '3', '');
INSERT INTO `ds_area` VALUES ('1670', '镇赉县', '128', '0', '3', '');
INSERT INTO `ds_area` VALUES ('1671', '和龙市', '129', '0', '3', '');
INSERT INTO `ds_area` VALUES ('1672', '图们市', '129', '0', '3', '');
INSERT INTO `ds_area` VALUES ('1673', '安图县', '129', '0', '3', '');
INSERT INTO `ds_area` VALUES ('1674', '延吉市', '129', '0', '3', '');
INSERT INTO `ds_area` VALUES ('1675', '敦化市', '129', '0', '3', '');
INSERT INTO `ds_area` VALUES ('1676', '汪清县', '129', '0', '3', '');
INSERT INTO `ds_area` VALUES ('1677', '珲春市', '129', '0', '3', '');
INSERT INTO `ds_area` VALUES ('1678', '龙井市', '129', '0', '3', '');
INSERT INTO `ds_area` VALUES ('1679', '五常市', '130', '0', '3', '');
INSERT INTO `ds_area` VALUES ('1680', '依兰县', '130', '0', '3', '');
INSERT INTO `ds_area` VALUES ('1681', '南岗区', '130', '0', '3', '');
INSERT INTO `ds_area` VALUES ('1682', '双城市', '130', '0', '3', '');
INSERT INTO `ds_area` VALUES ('1683', '呼兰区', '130', '0', '3', '');
INSERT INTO `ds_area` VALUES ('1684', '哈尔滨市道里区', '130', '0', '3', '');
INSERT INTO `ds_area` VALUES ('1685', '宾县', '130', '0', '3', '');
INSERT INTO `ds_area` VALUES ('1686', '尚志市', '130', '0', '3', '');
INSERT INTO `ds_area` VALUES ('1687', '巴彦县', '130', '0', '3', '');
INSERT INTO `ds_area` VALUES ('1688', '平房区', '130', '0', '3', '');
INSERT INTO `ds_area` VALUES ('1689', '延寿县', '130', '0', '3', '');
INSERT INTO `ds_area` VALUES ('1690', '方正县', '130', '0', '3', '');
INSERT INTO `ds_area` VALUES ('1691', '木兰县', '130', '0', '3', '');
INSERT INTO `ds_area` VALUES ('1692', '松北区', '130', '0', '3', '');
INSERT INTO `ds_area` VALUES ('1693', '通河县', '130', '0', '3', '');
INSERT INTO `ds_area` VALUES ('1694', '道外区', '130', '0', '3', '');
INSERT INTO `ds_area` VALUES ('1695', '阿城区', '130', '0', '3', '');
INSERT INTO `ds_area` VALUES ('1696', '香坊区', '130', '0', '3', '');
INSERT INTO `ds_area` VALUES ('1697', '依安县', '131', '0', '3', '');
INSERT INTO `ds_area` VALUES ('1698', '克东县', '131', '0', '3', '');
INSERT INTO `ds_area` VALUES ('1699', '克山县', '131', '0', '3', '');
INSERT INTO `ds_area` VALUES ('1700', '富拉尔基区', '131', '0', '3', '');
INSERT INTO `ds_area` VALUES ('1701', '富裕县', '131', '0', '3', '');
INSERT INTO `ds_area` VALUES ('1702', '建华区', '131', '0', '3', '');
INSERT INTO `ds_area` VALUES ('1703', '拜泉县', '131', '0', '3', '');
INSERT INTO `ds_area` VALUES ('1704', '昂昂溪区', '131', '0', '3', '');
INSERT INTO `ds_area` VALUES ('1705', '梅里斯达斡尔族区', '131', '0', '3', '');
INSERT INTO `ds_area` VALUES ('1706', '泰来县', '131', '0', '3', '');
INSERT INTO `ds_area` VALUES ('1707', '甘南县', '131', '0', '3', '');
INSERT INTO `ds_area` VALUES ('1708', '碾子山区', '131', '0', '3', '');
INSERT INTO `ds_area` VALUES ('1709', '讷河市', '131', '0', '3', '');
INSERT INTO `ds_area` VALUES ('1710', '铁锋区', '131', '0', '3', '');
INSERT INTO `ds_area` VALUES ('1711', '龙江县', '131', '0', '3', '');
INSERT INTO `ds_area` VALUES ('1712', '龙沙区', '131', '0', '3', '');
INSERT INTO `ds_area` VALUES ('1713', '城子河区', '132', '0', '3', '');
INSERT INTO `ds_area` VALUES ('1714', '密山市', '132', '0', '3', '');
INSERT INTO `ds_area` VALUES ('1715', '恒山区', '132', '0', '3', '');
INSERT INTO `ds_area` VALUES ('1716', '梨树区', '132', '0', '3', '');
INSERT INTO `ds_area` VALUES ('1717', '滴道区', '132', '0', '3', '');
INSERT INTO `ds_area` VALUES ('1718', '虎林市', '132', '0', '3', '');
INSERT INTO `ds_area` VALUES ('1719', '鸡东县', '132', '0', '3', '');
INSERT INTO `ds_area` VALUES ('1720', '鸡冠区', '132', '0', '3', '');
INSERT INTO `ds_area` VALUES ('1721', '麻山区', '132', '0', '3', '');
INSERT INTO `ds_area` VALUES ('1722', '东山区', '133', '0', '3', '');
INSERT INTO `ds_area` VALUES ('1723', '兴安区', '133', '0', '3', '');
INSERT INTO `ds_area` VALUES ('1724', '兴山区', '133', '0', '3', '');
INSERT INTO `ds_area` VALUES ('1725', '南山区', '133', '0', '3', '');
INSERT INTO `ds_area` VALUES ('1726', '向阳区', '133', '0', '3', '');
INSERT INTO `ds_area` VALUES ('1727', '工农区', '133', '0', '3', '');
INSERT INTO `ds_area` VALUES ('1728', '绥滨县', '133', '0', '3', '');
INSERT INTO `ds_area` VALUES ('1729', '萝北县', '133', '0', '3', '');
INSERT INTO `ds_area` VALUES ('1730', '友谊县', '134', '0', '3', '');
INSERT INTO `ds_area` VALUES ('1731', '四方台区', '134', '0', '3', '');
INSERT INTO `ds_area` VALUES ('1732', '宝山区', '134', '0', '3', '');
INSERT INTO `ds_area` VALUES ('1733', '宝清县', '134', '0', '3', '');
INSERT INTO `ds_area` VALUES ('1734', '尖山区', '134', '0', '3', '');
INSERT INTO `ds_area` VALUES ('1735', '岭东区', '134', '0', '3', '');
INSERT INTO `ds_area` VALUES ('1736', '集贤县', '134', '0', '3', '');
INSERT INTO `ds_area` VALUES ('1737', '饶河县', '134', '0', '3', '');
INSERT INTO `ds_area` VALUES ('1738', '大同区', '135', '0', '3', '');
INSERT INTO `ds_area` VALUES ('1739', '杜尔伯特蒙古族自治县', '135', '0', '3', '');
INSERT INTO `ds_area` VALUES ('1740', '林甸县', '135', '0', '3', '');
INSERT INTO `ds_area` VALUES ('1741', '红岗区', '135', '0', '3', '');
INSERT INTO `ds_area` VALUES ('1742', '肇州县', '135', '0', '3', '');
INSERT INTO `ds_area` VALUES ('1743', '肇源县', '135', '0', '3', '');
INSERT INTO `ds_area` VALUES ('1744', '胡路区', '135', '0', '3', '');
INSERT INTO `ds_area` VALUES ('1745', '萨尔图区', '135', '0', '3', '');
INSERT INTO `ds_area` VALUES ('1746', '龙凤区', '135', '0', '3', '');
INSERT INTO `ds_area` VALUES ('1747', '上甘岭区', '136', '0', '3', '');
INSERT INTO `ds_area` VALUES ('1748', '乌伊岭区', '136', '0', '3', '');
INSERT INTO `ds_area` VALUES ('1749', '乌马河区', '136', '0', '3', '');
INSERT INTO `ds_area` VALUES ('1750', '五营区', '136', '0', '3', '');
INSERT INTO `ds_area` VALUES ('1751', '伊春区', '136', '0', '3', '');
INSERT INTO `ds_area` VALUES ('1752', '南岔区', '136', '0', '3', '');
INSERT INTO `ds_area` VALUES ('1753', '友好区', '136', '0', '3', '');
INSERT INTO `ds_area` VALUES ('1754', '嘉荫县', '136', '0', '3', '');
INSERT INTO `ds_area` VALUES ('1755', '带岭区', '136', '0', '3', '');
INSERT INTO `ds_area` VALUES ('1756', '新青区', '136', '0', '3', '');
INSERT INTO `ds_area` VALUES ('1757', '汤旺河区', '136', '0', '3', '');
INSERT INTO `ds_area` VALUES ('1758', '红星区', '136', '0', '3', '');
INSERT INTO `ds_area` VALUES ('1759', '美溪区', '136', '0', '3', '');
INSERT INTO `ds_area` VALUES ('1760', '翠峦区', '136', '0', '3', '');
INSERT INTO `ds_area` VALUES ('1761', '西林区', '136', '0', '3', '');
INSERT INTO `ds_area` VALUES ('1762', '金山屯区', '136', '0', '3', '');
INSERT INTO `ds_area` VALUES ('1763', '铁力市', '136', '0', '3', '');
INSERT INTO `ds_area` VALUES ('1764', '东风区', '137', '0', '3', '');
INSERT INTO `ds_area` VALUES ('1765', '前进区', '137', '0', '3', '');
INSERT INTO `ds_area` VALUES ('1766', '同江市', '137', '0', '3', '');
INSERT INTO `ds_area` VALUES ('1767', '向阳区', '137', '0', '3', '');
INSERT INTO `ds_area` VALUES ('1768', '富锦市', '137', '0', '3', '');
INSERT INTO `ds_area` VALUES ('1769', '抚远县', '137', '0', '3', '');
INSERT INTO `ds_area` VALUES ('1770', '桦南县', '137', '0', '3', '');
INSERT INTO `ds_area` VALUES ('1771', '桦川县', '137', '0', '3', '');
INSERT INTO `ds_area` VALUES ('1772', '汤原县', '137', '0', '3', '');
INSERT INTO `ds_area` VALUES ('1773', '郊区', '137', '0', '3', '');
INSERT INTO `ds_area` VALUES ('1774', '勃利县', '138', '0', '3', '');
INSERT INTO `ds_area` VALUES ('1775', '新兴区', '138', '0', '3', '');
INSERT INTO `ds_area` VALUES ('1776', '桃山区', '138', '0', '3', '');
INSERT INTO `ds_area` VALUES ('1777', '茄子河区', '138', '0', '3', '');
INSERT INTO `ds_area` VALUES ('1778', '东宁县', '139', '0', '3', '');
INSERT INTO `ds_area` VALUES ('1779', '东安区', '139', '0', '3', '');
INSERT INTO `ds_area` VALUES ('1780', '宁安市', '139', '0', '3', '');
INSERT INTO `ds_area` VALUES ('1781', '林口县', '139', '0', '3', '');
INSERT INTO `ds_area` VALUES ('1782', '海林市', '139', '0', '3', '');
INSERT INTO `ds_area` VALUES ('1783', '爱民区', '139', '0', '3', '');
INSERT INTO `ds_area` VALUES ('1784', '穆棱市', '139', '0', '3', '');
INSERT INTO `ds_area` VALUES ('1785', '绥芬河市', '139', '0', '3', '');
INSERT INTO `ds_area` VALUES ('1786', '西安区', '139', '0', '3', '');
INSERT INTO `ds_area` VALUES ('1787', '阳明区', '139', '0', '3', '');
INSERT INTO `ds_area` VALUES ('1788', '五大连池市', '140', '0', '3', '');
INSERT INTO `ds_area` VALUES ('1789', '北安市', '140', '0', '3', '');
INSERT INTO `ds_area` VALUES ('1790', '嫩江县', '140', '0', '3', '');
INSERT INTO `ds_area` VALUES ('1791', '孙吴县', '140', '0', '3', '');
INSERT INTO `ds_area` VALUES ('1792', '爱辉区', '140', '0', '3', '');
INSERT INTO `ds_area` VALUES ('1793', '车逊克县', '140', '0', '3', '');
INSERT INTO `ds_area` VALUES ('1794', '逊克县', '140', '0', '3', '');
INSERT INTO `ds_area` VALUES ('1795', '兰西县', '141', '0', '3', '');
INSERT INTO `ds_area` VALUES ('1796', '安达市', '141', '0', '3', '');
INSERT INTO `ds_area` VALUES ('1797', '庆安县', '141', '0', '3', '');
INSERT INTO `ds_area` VALUES ('1798', '明水县', '141', '0', '3', '');
INSERT INTO `ds_area` VALUES ('1799', '望奎县', '141', '0', '3', '');
INSERT INTO `ds_area` VALUES ('1800', '海伦市', '141', '0', '3', '');
INSERT INTO `ds_area` VALUES ('1801', '绥化市北林区', '141', '0', '3', '');
INSERT INTO `ds_area` VALUES ('1802', '绥棱县', '141', '0', '3', '');
INSERT INTO `ds_area` VALUES ('1803', '肇东市', '141', '0', '3', '');
INSERT INTO `ds_area` VALUES ('1804', '青冈县', '141', '0', '3', '');
INSERT INTO `ds_area` VALUES ('1805', '呼玛县', '142', '0', '3', '');
INSERT INTO `ds_area` VALUES ('1806', '塔河县', '142', '0', '3', '');
INSERT INTO `ds_area` VALUES ('1807', '大兴安岭地区加格达奇区', '142', '0', '3', '');
INSERT INTO `ds_area` VALUES ('1808', '大兴安岭地区呼中区', '142', '0', '3', '');
INSERT INTO `ds_area` VALUES ('1809', '大兴安岭地区新林区', '142', '0', '3', '');
INSERT INTO `ds_area` VALUES ('1810', '大兴安岭地区松岭区', '142', '0', '3', '');
INSERT INTO `ds_area` VALUES ('1811', '漠河县', '142', '0', '3', '');
INSERT INTO `ds_area` VALUES ('2027', '下关区', '162', '0', '3', '');
INSERT INTO `ds_area` VALUES ('2028', '六合区', '162', '0', '3', '');
INSERT INTO `ds_area` VALUES ('2029', '建邺区', '162', '0', '3', '');
INSERT INTO `ds_area` VALUES ('2030', '栖霞区', '162', '0', '3', '');
INSERT INTO `ds_area` VALUES ('2031', '江宁区', '162', '0', '3', '');
INSERT INTO `ds_area` VALUES ('2032', '浦口区', '162', '0', '3', '');
INSERT INTO `ds_area` VALUES ('2033', '溧水县', '162', '0', '3', '');
INSERT INTO `ds_area` VALUES ('2034', '玄武区', '162', '0', '3', '');
INSERT INTO `ds_area` VALUES ('2035', '白下区', '162', '0', '3', '');
INSERT INTO `ds_area` VALUES ('2036', '秦淮区', '162', '0', '3', '');
INSERT INTO `ds_area` VALUES ('2037', '雨花台区', '162', '0', '3', '');
INSERT INTO `ds_area` VALUES ('2038', '高淳县', '162', '0', '3', '');
INSERT INTO `ds_area` VALUES ('2039', '鼓楼区', '162', '0', '3', '');
INSERT INTO `ds_area` VALUES ('2040', '北塘区', '163', '0', '3', '');
INSERT INTO `ds_area` VALUES ('2041', '南长区', '163', '0', '3', '');
INSERT INTO `ds_area` VALUES ('2042', '宜兴市', '163', '0', '3', '');
INSERT INTO `ds_area` VALUES ('2043', '崇安区', '163', '0', '3', '');
INSERT INTO `ds_area` VALUES ('2044', '惠山区', '163', '0', '3', '');
INSERT INTO `ds_area` VALUES ('2045', '江阴市', '163', '0', '3', '');
INSERT INTO `ds_area` VALUES ('2046', '滨湖区', '163', '0', '3', '');
INSERT INTO `ds_area` VALUES ('2047', '锡山区', '163', '0', '3', '');
INSERT INTO `ds_area` VALUES ('2048', '丰县', '164', '0', '3', '');
INSERT INTO `ds_area` VALUES ('2049', '九里区', '164', '0', '3', '');
INSERT INTO `ds_area` VALUES ('2050', '云龙区', '164', '0', '3', '');
INSERT INTO `ds_area` VALUES ('2051', '新沂市', '164', '0', '3', '');
INSERT INTO `ds_area` VALUES ('2052', '沛县', '164', '0', '3', '');
INSERT INTO `ds_area` VALUES ('2053', '泉山区', '164', '0', '3', '');
INSERT INTO `ds_area` VALUES ('2054', '睢宁县', '164', '0', '3', '');
INSERT INTO `ds_area` VALUES ('2055', '贾汪区', '164', '0', '3', '');
INSERT INTO `ds_area` VALUES ('2056', '邳州市', '164', '0', '3', '');
INSERT INTO `ds_area` VALUES ('2057', '铜山县', '164', '0', '3', '');
INSERT INTO `ds_area` VALUES ('2058', '鼓楼区', '164', '0', '3', '');
INSERT INTO `ds_area` VALUES ('2059', '天宁区', '165', '0', '3', '');
INSERT INTO `ds_area` VALUES ('2060', '戚墅堰区', '165', '0', '3', '');
INSERT INTO `ds_area` VALUES ('2061', '新北区', '165', '0', '3', '');
INSERT INTO `ds_area` VALUES ('2062', '武进区', '165', '0', '3', '');
INSERT INTO `ds_area` VALUES ('2063', '溧阳市', '165', '0', '3', '');
INSERT INTO `ds_area` VALUES ('2064', '金坛市', '165', '0', '3', '');
INSERT INTO `ds_area` VALUES ('2065', '钟楼区', '165', '0', '3', '');
INSERT INTO `ds_area` VALUES ('2066', '吴中区', '166', '0', '3', '');
INSERT INTO `ds_area` VALUES ('2067', '吴江市', '166', '0', '3', '');
INSERT INTO `ds_area` VALUES ('2068', '太仓市', '166', '0', '3', '');
INSERT INTO `ds_area` VALUES ('2069', '常熟市', '166', '0', '3', '');
INSERT INTO `ds_area` VALUES ('2070', '平江区', '166', '0', '3', '');
INSERT INTO `ds_area` VALUES ('2071', '张家港市', '166', '0', '3', '');
INSERT INTO `ds_area` VALUES ('2072', '昆山市', '166', '0', '3', '');
INSERT INTO `ds_area` VALUES ('2073', '沧浪区', '166', '0', '3', '');
INSERT INTO `ds_area` VALUES ('2074', '相城区', '166', '0', '3', '');
INSERT INTO `ds_area` VALUES ('2075', '苏州工业园区', '166', '0', '3', '');
INSERT INTO `ds_area` VALUES ('2076', '虎丘区', '166', '0', '3', '');
INSERT INTO `ds_area` VALUES ('2077', '金阊区', '166', '0', '3', '');
INSERT INTO `ds_area` VALUES ('2078', '启东市', '167', '0', '3', '');
INSERT INTO `ds_area` VALUES ('2079', '如东县', '167', '0', '3', '');
INSERT INTO `ds_area` VALUES ('2080', '如皋市', '167', '0', '3', '');
INSERT INTO `ds_area` VALUES ('2081', '崇川区', '167', '0', '3', '');
INSERT INTO `ds_area` VALUES ('2082', '海安县', '167', '0', '3', '');
INSERT INTO `ds_area` VALUES ('2083', '海门市', '167', '0', '3', '');
INSERT INTO `ds_area` VALUES ('2084', '港闸区', '167', '0', '3', '');
INSERT INTO `ds_area` VALUES ('2085', '通州市', '167', '0', '3', '');
INSERT INTO `ds_area` VALUES ('2086', '东海县', '168', '0', '3', '');
INSERT INTO `ds_area` VALUES ('2087', '新浦区', '168', '0', '3', '');
INSERT INTO `ds_area` VALUES ('2088', '海州区', '168', '0', '3', '');
INSERT INTO `ds_area` VALUES ('2089', '灌云县', '168', '0', '3', '');
INSERT INTO `ds_area` VALUES ('2090', '灌南县', '168', '0', '3', '');
INSERT INTO `ds_area` VALUES ('2091', '赣榆县', '168', '0', '3', '');
INSERT INTO `ds_area` VALUES ('2092', '连云区', '168', '0', '3', '');
INSERT INTO `ds_area` VALUES ('2093', '楚州区', '169', '0', '3', '');
INSERT INTO `ds_area` VALUES ('2094', '洪泽县', '169', '0', '3', '');
INSERT INTO `ds_area` VALUES ('2095', '涟水县', '169', '0', '3', '');
INSERT INTO `ds_area` VALUES ('2096', '淮阴区', '169', '0', '3', '');
INSERT INTO `ds_area` VALUES ('2097', '清河区', '169', '0', '3', '');
INSERT INTO `ds_area` VALUES ('2098', '清浦区', '169', '0', '3', '');
INSERT INTO `ds_area` VALUES ('2099', '盱眙县', '169', '0', '3', '');
INSERT INTO `ds_area` VALUES ('2100', '金湖县', '169', '0', '3', '');
INSERT INTO `ds_area` VALUES ('2101', '东台市', '170', '0', '3', '');
INSERT INTO `ds_area` VALUES ('2102', '亭湖区', '170', '0', '3', '');
INSERT INTO `ds_area` VALUES ('2103', '响水县', '170', '0', '3', '');
INSERT INTO `ds_area` VALUES ('2104', '大丰市', '170', '0', '3', '');
INSERT INTO `ds_area` VALUES ('2105', '射阳县', '170', '0', '3', '');
INSERT INTO `ds_area` VALUES ('2106', '建湖县', '170', '0', '3', '');
INSERT INTO `ds_area` VALUES ('2107', '滨海县', '170', '0', '3', '');
INSERT INTO `ds_area` VALUES ('2108', '盐都区', '170', '0', '3', '');
INSERT INTO `ds_area` VALUES ('2109', '阜宁县', '170', '0', '3', '');
INSERT INTO `ds_area` VALUES ('2110', '仪征市', '171', '0', '3', '');
INSERT INTO `ds_area` VALUES ('2111', '宝应县', '171', '0', '3', '');
INSERT INTO `ds_area` VALUES ('2112', '广陵区', '171', '0', '3', '');
INSERT INTO `ds_area` VALUES ('2113', '江都市', '171', '0', '3', '');
INSERT INTO `ds_area` VALUES ('2114', '维扬区', '171', '0', '3', '');
INSERT INTO `ds_area` VALUES ('2115', '邗江区', '171', '0', '3', '');
INSERT INTO `ds_area` VALUES ('2116', '高邮市', '171', '0', '3', '');
INSERT INTO `ds_area` VALUES ('2117', '丹徒区', '172', '0', '3', '');
INSERT INTO `ds_area` VALUES ('2118', '丹阳市', '172', '0', '3', '');
INSERT INTO `ds_area` VALUES ('2119', '京口区', '172', '0', '3', '');
INSERT INTO `ds_area` VALUES ('2120', '句容市', '172', '0', '3', '');
INSERT INTO `ds_area` VALUES ('2121', '扬中市', '172', '0', '3', '');
INSERT INTO `ds_area` VALUES ('2122', '润州区', '172', '0', '3', '');
INSERT INTO `ds_area` VALUES ('2123', '兴化市', '173', '0', '3', '');
INSERT INTO `ds_area` VALUES ('2124', '姜堰市', '173', '0', '3', '');
INSERT INTO `ds_area` VALUES ('2125', '泰兴市', '173', '0', '3', '');
INSERT INTO `ds_area` VALUES ('2126', '海陵区', '173', '0', '3', '');
INSERT INTO `ds_area` VALUES ('2127', '靖江市', '173', '0', '3', '');
INSERT INTO `ds_area` VALUES ('2128', '高港区', '173', '0', '3', '');
INSERT INTO `ds_area` VALUES ('2129', '宿城区', '174', '0', '3', '');
INSERT INTO `ds_area` VALUES ('2130', '宿豫区', '174', '0', '3', '');
INSERT INTO `ds_area` VALUES ('2131', '沭阳县', '174', '0', '3', '');
INSERT INTO `ds_area` VALUES ('2132', '泗洪县', '174', '0', '3', '');
INSERT INTO `ds_area` VALUES ('2133', '泗阳县', '174', '0', '3', '');
INSERT INTO `ds_area` VALUES ('2134', '上城区', '175', '0', '3', '');
INSERT INTO `ds_area` VALUES ('2135', '下城区', '175', '0', '3', '');
INSERT INTO `ds_area` VALUES ('2136', '临安市', '175', '0', '3', '');
INSERT INTO `ds_area` VALUES ('2137', '余杭区', '175', '0', '3', '');
INSERT INTO `ds_area` VALUES ('2138', '富阳市', '175', '0', '3', '');
INSERT INTO `ds_area` VALUES ('2139', '建德市', '175', '0', '3', '');
INSERT INTO `ds_area` VALUES ('2140', '拱墅区', '175', '0', '3', '');
INSERT INTO `ds_area` VALUES ('2141', '桐庐县', '175', '0', '3', '');
INSERT INTO `ds_area` VALUES ('2142', '江干区', '175', '0', '3', '');
INSERT INTO `ds_area` VALUES ('2143', '淳安县', '175', '0', '3', '');
INSERT INTO `ds_area` VALUES ('2144', '滨江区', '175', '0', '3', '');
INSERT INTO `ds_area` VALUES ('2145', '萧山区', '175', '0', '3', '');
INSERT INTO `ds_area` VALUES ('2146', '西湖区', '175', '0', '3', '');
INSERT INTO `ds_area` VALUES ('2147', '余姚市', '176', '0', '3', '');
INSERT INTO `ds_area` VALUES ('2148', '北仑区', '176', '0', '3', '');
INSERT INTO `ds_area` VALUES ('2149', '奉化市', '176', '0', '3', '');
INSERT INTO `ds_area` VALUES ('2150', '宁海县', '176', '0', '3', '');
INSERT INTO `ds_area` VALUES ('2151', '慈溪市', '176', '0', '3', '');
INSERT INTO `ds_area` VALUES ('2152', '江东区', '176', '0', '3', '');
INSERT INTO `ds_area` VALUES ('2153', '江北区', '176', '0', '3', '');
INSERT INTO `ds_area` VALUES ('2154', '海曙区', '176', '0', '3', '');
INSERT INTO `ds_area` VALUES ('2155', '象山县', '176', '0', '3', '');
INSERT INTO `ds_area` VALUES ('2156', '鄞州区', '176', '0', '3', '');
INSERT INTO `ds_area` VALUES ('2157', '镇海区', '176', '0', '3', '');
INSERT INTO `ds_area` VALUES ('2158', '乐清市', '177', '0', '3', '');
INSERT INTO `ds_area` VALUES ('2159', '平阳县', '177', '0', '3', '');
INSERT INTO `ds_area` VALUES ('2160', '文成县', '177', '0', '3', '');
INSERT INTO `ds_area` VALUES ('2161', '永嘉县', '177', '0', '3', '');
INSERT INTO `ds_area` VALUES ('2162', '泰顺县', '177', '0', '3', '');
INSERT INTO `ds_area` VALUES ('2163', '洞头县', '177', '0', '3', '');
INSERT INTO `ds_area` VALUES ('2164', '瑞安市', '177', '0', '3', '');
INSERT INTO `ds_area` VALUES ('2165', '瓯海区', '177', '0', '3', '');
INSERT INTO `ds_area` VALUES ('2166', '苍南县', '177', '0', '3', '');
INSERT INTO `ds_area` VALUES ('2167', '鹿城区', '177', '0', '3', '');
INSERT INTO `ds_area` VALUES ('2168', '龙湾区', '177', '0', '3', '');
INSERT INTO `ds_area` VALUES ('2169', '南湖区', '178', '0', '3', '');
INSERT INTO `ds_area` VALUES ('2170', '嘉善县', '178', '0', '3', '');
INSERT INTO `ds_area` VALUES ('2171', '平湖市', '178', '0', '3', '');
INSERT INTO `ds_area` VALUES ('2172', '桐乡市', '178', '0', '3', '');
INSERT INTO `ds_area` VALUES ('2173', '海宁市', '178', '0', '3', '');
INSERT INTO `ds_area` VALUES ('2174', '海盐县', '178', '0', '3', '');
INSERT INTO `ds_area` VALUES ('2175', '秀洲区', '178', '0', '3', '');
INSERT INTO `ds_area` VALUES ('2176', '南浔区', '179', '0', '3', '');
INSERT INTO `ds_area` VALUES ('2177', '吴兴区', '179', '0', '3', '');
INSERT INTO `ds_area` VALUES ('2178', '安吉县', '179', '0', '3', '');
INSERT INTO `ds_area` VALUES ('2179', '德清县', '179', '0', '3', '');
INSERT INTO `ds_area` VALUES ('2180', '长兴县', '179', '0', '3', '');
INSERT INTO `ds_area` VALUES ('2181', '上虞市', '180', '0', '3', '');
INSERT INTO `ds_area` VALUES ('2182', '嵊州市', '180', '0', '3', '');
INSERT INTO `ds_area` VALUES ('2183', '新昌县', '180', '0', '3', '');
INSERT INTO `ds_area` VALUES ('2184', '绍兴县', '180', '0', '3', '');
INSERT INTO `ds_area` VALUES ('2185', '诸暨市', '180', '0', '3', '');
INSERT INTO `ds_area` VALUES ('2186', '越城区', '180', '0', '3', '');
INSERT INTO `ds_area` VALUES ('2187', '定海区', '181', '0', '3', '');
INSERT INTO `ds_area` VALUES ('2188', '岱山县', '181', '0', '3', '');
INSERT INTO `ds_area` VALUES ('2189', '嵊泗县', '181', '0', '3', '');
INSERT INTO `ds_area` VALUES ('2190', '普陀区', '181', '0', '3', '');
INSERT INTO `ds_area` VALUES ('2191', '常山县', '182', '0', '3', '');
INSERT INTO `ds_area` VALUES ('2192', '开化县', '182', '0', '3', '');
INSERT INTO `ds_area` VALUES ('2193', '柯城区', '182', '0', '3', '');
INSERT INTO `ds_area` VALUES ('2194', '江山市', '182', '0', '3', '');
INSERT INTO `ds_area` VALUES ('2195', '衢江区', '182', '0', '3', '');
INSERT INTO `ds_area` VALUES ('2196', '龙游县', '182', '0', '3', '');
INSERT INTO `ds_area` VALUES ('2197', '东阳市', '183', '0', '3', '');
INSERT INTO `ds_area` VALUES ('2198', '义乌市', '183', '0', '3', '');
INSERT INTO `ds_area` VALUES ('2199', '兰溪市', '183', '0', '3', '');
INSERT INTO `ds_area` VALUES ('2200', '婺城区', '183', '0', '3', '');
INSERT INTO `ds_area` VALUES ('2201', '武义县', '183', '0', '3', '');
INSERT INTO `ds_area` VALUES ('2202', '永康市', '183', '0', '3', '');
INSERT INTO `ds_area` VALUES ('2203', '浦江县', '183', '0', '3', '');
INSERT INTO `ds_area` VALUES ('2204', '磐安县', '183', '0', '3', '');
INSERT INTO `ds_area` VALUES ('2205', '金东区', '183', '0', '3', '');
INSERT INTO `ds_area` VALUES ('2206', '三门县', '184', '0', '3', '');
INSERT INTO `ds_area` VALUES ('2207', '临海市', '184', '0', '3', '');
INSERT INTO `ds_area` VALUES ('2208', '仙居县', '184', '0', '3', '');
INSERT INTO `ds_area` VALUES ('2209', '天台县', '184', '0', '3', '');
INSERT INTO `ds_area` VALUES ('2210', '椒江区', '184', '0', '3', '');
INSERT INTO `ds_area` VALUES ('2211', '温岭市', '184', '0', '3', '');
INSERT INTO `ds_area` VALUES ('2212', '玉环县', '184', '0', '3', '');
INSERT INTO `ds_area` VALUES ('2213', '路桥区', '184', '0', '3', '');
INSERT INTO `ds_area` VALUES ('2214', '黄岩区', '184', '0', '3', '');
INSERT INTO `ds_area` VALUES ('2215', '云和县', '185', '0', '3', '');
INSERT INTO `ds_area` VALUES ('2216', '庆元县', '185', '0', '3', '');
INSERT INTO `ds_area` VALUES ('2217', '景宁畲族自治县', '185', '0', '3', '');
INSERT INTO `ds_area` VALUES ('2218', '松阳县', '185', '0', '3', '');
INSERT INTO `ds_area` VALUES ('2219', '缙云县', '185', '0', '3', '');
INSERT INTO `ds_area` VALUES ('2220', '莲都区', '185', '0', '3', '');
INSERT INTO `ds_area` VALUES ('2221', '遂昌县', '185', '0', '3', '');
INSERT INTO `ds_area` VALUES ('2222', '青田县', '185', '0', '3', '');
INSERT INTO `ds_area` VALUES ('2223', '龙泉市', '185', '0', '3', '');
INSERT INTO `ds_area` VALUES ('2224', '包河区', '186', '0', '3', '');
INSERT INTO `ds_area` VALUES ('2225', '庐阳区', '186', '0', '3', '');
INSERT INTO `ds_area` VALUES ('2226', '瑶海区', '186', '0', '3', '');
INSERT INTO `ds_area` VALUES ('2227', '肥东县', '186', '0', '3', '');
INSERT INTO `ds_area` VALUES ('2228', '肥西县', '186', '0', '3', '');
INSERT INTO `ds_area` VALUES ('2229', '蜀山区', '186', '0', '3', '');
INSERT INTO `ds_area` VALUES ('2230', '长丰县', '186', '0', '3', '');
INSERT INTO `ds_area` VALUES ('2231', '三山区', '187', '0', '3', '');
INSERT INTO `ds_area` VALUES ('2232', '南陵县', '187', '0', '3', '');
INSERT INTO `ds_area` VALUES ('2233', '弋江区', '187', '0', '3', '');
INSERT INTO `ds_area` VALUES ('2234', '繁昌县', '187', '0', '3', '');
INSERT INTO `ds_area` VALUES ('2235', '芜湖县', '187', '0', '3', '');
INSERT INTO `ds_area` VALUES ('2236', '镜湖区', '187', '0', '3', '');
INSERT INTO `ds_area` VALUES ('2237', '鸠江区', '187', '0', '3', '');
INSERT INTO `ds_area` VALUES ('2238', '五河县', '188', '0', '3', '');
INSERT INTO `ds_area` VALUES ('2239', '固镇县', '188', '0', '3', '');
INSERT INTO `ds_area` VALUES ('2240', '怀远县', '188', '0', '3', '');
INSERT INTO `ds_area` VALUES ('2241', '淮上区', '188', '0', '3', '');
INSERT INTO `ds_area` VALUES ('2242', '禹会区', '188', '0', '3', '');
INSERT INTO `ds_area` VALUES ('2243', '蚌山区', '188', '0', '3', '');
INSERT INTO `ds_area` VALUES ('2244', '龙子湖区', '188', '0', '3', '');
INSERT INTO `ds_area` VALUES ('2245', '八公山区', '189', '0', '3', '');
INSERT INTO `ds_area` VALUES ('2246', '凤台县', '189', '0', '3', '');
INSERT INTO `ds_area` VALUES ('2247', '大通区', '189', '0', '3', '');
INSERT INTO `ds_area` VALUES ('2248', '潘集区', '189', '0', '3', '');
INSERT INTO `ds_area` VALUES ('2249', '田家庵区', '189', '0', '3', '');
INSERT INTO `ds_area` VALUES ('2250', '谢家集区', '189', '0', '3', '');
INSERT INTO `ds_area` VALUES ('2251', '当涂县', '190', '0', '3', '');
INSERT INTO `ds_area` VALUES ('2252', '花山区', '190', '0', '3', '');
INSERT INTO `ds_area` VALUES ('2253', '金家庄区', '190', '0', '3', '');
INSERT INTO `ds_area` VALUES ('2254', '雨山区', '190', '0', '3', '');
INSERT INTO `ds_area` VALUES ('2255', '杜集区', '191', '0', '3', '');
INSERT INTO `ds_area` VALUES ('2256', '濉溪县', '191', '0', '3', '');
INSERT INTO `ds_area` VALUES ('2257', '烈山区', '191', '0', '3', '');
INSERT INTO `ds_area` VALUES ('2258', '相山区', '191', '0', '3', '');
INSERT INTO `ds_area` VALUES ('2259', '狮子山区', '192', '0', '3', '');
INSERT INTO `ds_area` VALUES ('2260', '郊区', '192', '0', '3', '');
INSERT INTO `ds_area` VALUES ('2261', '铜官山区', '192', '0', '3', '');
INSERT INTO `ds_area` VALUES ('2262', '铜陵县', '192', '0', '3', '');
INSERT INTO `ds_area` VALUES ('2263', '大观区', '193', '0', '3', '');
INSERT INTO `ds_area` VALUES ('2264', '太湖县', '193', '0', '3', '');
INSERT INTO `ds_area` VALUES ('2265', '宜秀区', '193', '0', '3', '');
INSERT INTO `ds_area` VALUES ('2266', '宿松县', '193', '0', '3', '');
INSERT INTO `ds_area` VALUES ('2267', '岳西县', '193', '0', '3', '');
INSERT INTO `ds_area` VALUES ('2268', '怀宁县', '193', '0', '3', '');
INSERT INTO `ds_area` VALUES ('2269', '望江县', '193', '0', '3', '');
INSERT INTO `ds_area` VALUES ('2270', '枞阳县', '193', '0', '3', '');
INSERT INTO `ds_area` VALUES ('2271', '桐城市', '193', '0', '3', '');
INSERT INTO `ds_area` VALUES ('2272', '潜山县', '193', '0', '3', '');
INSERT INTO `ds_area` VALUES ('2273', '迎江区', '193', '0', '3', '');
INSERT INTO `ds_area` VALUES ('2274', '休宁县', '194', '0', '3', '');
INSERT INTO `ds_area` VALUES ('2275', '屯溪区', '194', '0', '3', '');
INSERT INTO `ds_area` VALUES ('2276', '徽州区', '194', '0', '3', '');
INSERT INTO `ds_area` VALUES ('2277', '歙县', '194', '0', '3', '');
INSERT INTO `ds_area` VALUES ('2278', '祁门县', '194', '0', '3', '');
INSERT INTO `ds_area` VALUES ('2279', '黄山区', '194', '0', '3', '');
INSERT INTO `ds_area` VALUES ('2280', '黟县', '194', '0', '3', '');
INSERT INTO `ds_area` VALUES ('2281', '全椒县', '195', '0', '3', '');
INSERT INTO `ds_area` VALUES ('2282', '凤阳县', '195', '0', '3', '');
INSERT INTO `ds_area` VALUES ('2283', '南谯区', '195', '0', '3', '');
INSERT INTO `ds_area` VALUES ('2284', '天长市', '195', '0', '3', '');
INSERT INTO `ds_area` VALUES ('2285', '定远县', '195', '0', '3', '');
INSERT INTO `ds_area` VALUES ('2286', '明光市', '195', '0', '3', '');
INSERT INTO `ds_area` VALUES ('2287', '来安县', '195', '0', '3', '');
INSERT INTO `ds_area` VALUES ('2288', '琅玡区', '195', '0', '3', '');
INSERT INTO `ds_area` VALUES ('2289', '临泉县', '196', '0', '3', '');
INSERT INTO `ds_area` VALUES ('2290', '太和县', '196', '0', '3', '');
INSERT INTO `ds_area` VALUES ('2291', '界首市', '196', '0', '3', '');
INSERT INTO `ds_area` VALUES ('2292', '阜南县', '196', '0', '3', '');
INSERT INTO `ds_area` VALUES ('2293', '颍东区', '196', '0', '3', '');
INSERT INTO `ds_area` VALUES ('2294', '颍州区', '196', '0', '3', '');
INSERT INTO `ds_area` VALUES ('2295', '颍泉区', '196', '0', '3', '');
INSERT INTO `ds_area` VALUES ('2296', '颖上县', '196', '0', '3', '');
INSERT INTO `ds_area` VALUES ('2297', '埇桥区', '197', '0', '3', '');
INSERT INTO `ds_area` VALUES ('2298', '泗县辖', '197', '0', '3', '');
INSERT INTO `ds_area` VALUES ('2299', '灵璧县', '197', '0', '3', '');
INSERT INTO `ds_area` VALUES ('2300', '砀山县', '197', '0', '3', '');
INSERT INTO `ds_area` VALUES ('2301', '萧县', '197', '0', '3', '');
INSERT INTO `ds_area` VALUES ('2302', '含山县', '198', '0', '3', '');
INSERT INTO `ds_area` VALUES ('2303', '和县', '198', '0', '3', '');
INSERT INTO `ds_area` VALUES ('2304', '居巢区', '198', '0', '3', '');
INSERT INTO `ds_area` VALUES ('2305', '庐江县', '198', '0', '3', '');
INSERT INTO `ds_area` VALUES ('2306', '无为县', '198', '0', '3', '');
INSERT INTO `ds_area` VALUES ('2307', '寿县', '199', '0', '3', '');
INSERT INTO `ds_area` VALUES ('2308', '舒城县', '199', '0', '3', '');
INSERT INTO `ds_area` VALUES ('2309', '裕安区', '199', '0', '3', '');
INSERT INTO `ds_area` VALUES ('2310', '金安区', '199', '0', '3', '');
INSERT INTO `ds_area` VALUES ('2311', '金寨县', '199', '0', '3', '');
INSERT INTO `ds_area` VALUES ('2312', '霍山县', '199', '0', '3', '');
INSERT INTO `ds_area` VALUES ('2313', '霍邱县', '199', '0', '3', '');
INSERT INTO `ds_area` VALUES ('2314', '利辛县', '200', '0', '3', '');
INSERT INTO `ds_area` VALUES ('2315', '涡阳县', '200', '0', '3', '');
INSERT INTO `ds_area` VALUES ('2316', '蒙城县', '200', '0', '3', '');
INSERT INTO `ds_area` VALUES ('2317', '谯城区', '200', '0', '3', '');
INSERT INTO `ds_area` VALUES ('2318', '东至县', '201', '0', '3', '');
INSERT INTO `ds_area` VALUES ('2319', '石台县', '201', '0', '3', '');
INSERT INTO `ds_area` VALUES ('2320', '贵池区', '201', '0', '3', '');
INSERT INTO `ds_area` VALUES ('2321', '青阳县', '201', '0', '3', '');
INSERT INTO `ds_area` VALUES ('2322', '宁国市', '202', '0', '3', '');
INSERT INTO `ds_area` VALUES ('2323', '宣州区', '202', '0', '3', '');
INSERT INTO `ds_area` VALUES ('2324', '广德县', '202', '0', '3', '');
INSERT INTO `ds_area` VALUES ('2325', '旌德县', '202', '0', '3', '');
INSERT INTO `ds_area` VALUES ('2326', '泾县', '202', '0', '3', '');
INSERT INTO `ds_area` VALUES ('2327', '绩溪县', '202', '0', '3', '');
INSERT INTO `ds_area` VALUES ('2328', '郎溪县', '202', '0', '3', '');
INSERT INTO `ds_area` VALUES ('2329', '仓山区', '203', '0', '3', '');
INSERT INTO `ds_area` VALUES ('2330', '台江区', '203', '0', '3', '');
INSERT INTO `ds_area` VALUES ('2331', '平潭县', '203', '0', '3', '');
INSERT INTO `ds_area` VALUES ('2332', '晋安区', '203', '0', '3', '');
INSERT INTO `ds_area` VALUES ('2333', '永泰县', '203', '0', '3', '');
INSERT INTO `ds_area` VALUES ('2334', '福清市', '203', '0', '3', '');
INSERT INTO `ds_area` VALUES ('2335', '罗源县', '203', '0', '3', '');
INSERT INTO `ds_area` VALUES ('2336', '连江县', '203', '0', '3', '');
INSERT INTO `ds_area` VALUES ('2337', '长乐市', '203', '0', '3', '');
INSERT INTO `ds_area` VALUES ('2338', '闽侯县', '203', '0', '3', '');
INSERT INTO `ds_area` VALUES ('2339', '闽清县', '203', '0', '3', '');
INSERT INTO `ds_area` VALUES ('2340', '马尾区', '203', '0', '3', '');
INSERT INTO `ds_area` VALUES ('2341', '鼓楼区', '203', '0', '3', '');
INSERT INTO `ds_area` VALUES ('2342', '同安区', '204', '0', '3', '');
INSERT INTO `ds_area` VALUES ('2343', '思明区', '204', '0', '3', '');
INSERT INTO `ds_area` VALUES ('2344', '海沧区', '204', '0', '3', '');
INSERT INTO `ds_area` VALUES ('2345', '湖里区', '204', '0', '3', '');
INSERT INTO `ds_area` VALUES ('2346', '翔安区', '204', '0', '3', '');
INSERT INTO `ds_area` VALUES ('2347', '集美区', '204', '0', '3', '');
INSERT INTO `ds_area` VALUES ('2348', '仙游县', '205', '0', '3', '');
INSERT INTO `ds_area` VALUES ('2349', '城厢区', '205', '0', '3', '');
INSERT INTO `ds_area` VALUES ('2350', '涵江区', '205', '0', '3', '');
INSERT INTO `ds_area` VALUES ('2351', '秀屿区', '205', '0', '3', '');
INSERT INTO `ds_area` VALUES ('2352', '荔城区', '205', '0', '3', '');
INSERT INTO `ds_area` VALUES ('2353', '三元区', '206', '0', '3', '');
INSERT INTO `ds_area` VALUES ('2354', '大田县', '206', '0', '3', '');
INSERT INTO `ds_area` VALUES ('2355', '宁化县', '206', '0', '3', '');
INSERT INTO `ds_area` VALUES ('2356', '将乐县', '206', '0', '3', '');
INSERT INTO `ds_area` VALUES ('2357', '尤溪县', '206', '0', '3', '');
INSERT INTO `ds_area` VALUES ('2358', '建宁县', '206', '0', '3', '');
INSERT INTO `ds_area` VALUES ('2359', '明溪县', '206', '0', '3', '');
INSERT INTO `ds_area` VALUES ('2360', '梅列区', '206', '0', '3', '');
INSERT INTO `ds_area` VALUES ('2361', '永安市', '206', '0', '3', '');
INSERT INTO `ds_area` VALUES ('2362', '沙县', '206', '0', '3', '');
INSERT INTO `ds_area` VALUES ('2363', '泰宁县', '206', '0', '3', '');
INSERT INTO `ds_area` VALUES ('2364', '清流县', '206', '0', '3', '');
INSERT INTO `ds_area` VALUES ('2365', '丰泽区', '207', '0', '3', '');
INSERT INTO `ds_area` VALUES ('2366', '南安市', '207', '0', '3', '');
INSERT INTO `ds_area` VALUES ('2367', '安溪县', '207', '0', '3', '');
INSERT INTO `ds_area` VALUES ('2368', '德化县', '207', '0', '3', '');
INSERT INTO `ds_area` VALUES ('2369', '惠安县', '207', '0', '3', '');
INSERT INTO `ds_area` VALUES ('2370', '晋江市', '207', '0', '3', '');
INSERT INTO `ds_area` VALUES ('2371', '永春县', '207', '0', '3', '');
INSERT INTO `ds_area` VALUES ('2372', '泉港区', '207', '0', '3', '');
INSERT INTO `ds_area` VALUES ('2373', '洛江区', '207', '0', '3', '');
INSERT INTO `ds_area` VALUES ('2374', '石狮市', '207', '0', '3', '');
INSERT INTO `ds_area` VALUES ('2375', '金门县', '207', '0', '3', '');
INSERT INTO `ds_area` VALUES ('2376', '鲤城区', '207', '0', '3', '');
INSERT INTO `ds_area` VALUES ('2377', '东山县', '208', '0', '3', '');
INSERT INTO `ds_area` VALUES ('2378', '云霄县', '208', '0', '3', '');
INSERT INTO `ds_area` VALUES ('2379', '华安县', '208', '0', '3', '');
INSERT INTO `ds_area` VALUES ('2380', '南靖县', '208', '0', '3', '');
INSERT INTO `ds_area` VALUES ('2381', '平和县', '208', '0', '3', '');
INSERT INTO `ds_area` VALUES ('2382', '漳浦县', '208', '0', '3', '');
INSERT INTO `ds_area` VALUES ('2383', '芗城区', '208', '0', '3', '');
INSERT INTO `ds_area` VALUES ('2384', '诏安县', '208', '0', '3', '');
INSERT INTO `ds_area` VALUES ('2385', '长泰县', '208', '0', '3', '');
INSERT INTO `ds_area` VALUES ('2386', '龙文区', '208', '0', '3', '');
INSERT INTO `ds_area` VALUES ('2387', '龙海市', '208', '0', '3', '');
INSERT INTO `ds_area` VALUES ('2388', '光泽县', '209', '0', '3', '');
INSERT INTO `ds_area` VALUES ('2389', '延平区', '209', '0', '3', '');
INSERT INTO `ds_area` VALUES ('2390', '建瓯市', '209', '0', '3', '');
INSERT INTO `ds_area` VALUES ('2391', '建阳市', '209', '0', '3', '');
INSERT INTO `ds_area` VALUES ('2392', '政和县', '209', '0', '3', '');
INSERT INTO `ds_area` VALUES ('2393', '松溪县', '209', '0', '3', '');
INSERT INTO `ds_area` VALUES ('2394', '武夷山市', '209', '0', '3', '');
INSERT INTO `ds_area` VALUES ('2395', '浦城县', '209', '0', '3', '');
INSERT INTO `ds_area` VALUES ('2396', '邵武市', '209', '0', '3', '');
INSERT INTO `ds_area` VALUES ('2397', '顺昌县', '209', '0', '3', '');
INSERT INTO `ds_area` VALUES ('2398', '上杭县', '210', '0', '3', '');
INSERT INTO `ds_area` VALUES ('2399', '新罗区', '210', '0', '3', '');
INSERT INTO `ds_area` VALUES ('2400', '武平县', '210', '0', '3', '');
INSERT INTO `ds_area` VALUES ('2401', '永定县', '210', '0', '3', '');
INSERT INTO `ds_area` VALUES ('2402', '漳平市', '210', '0', '3', '');
INSERT INTO `ds_area` VALUES ('2403', '连城县', '210', '0', '3', '');
INSERT INTO `ds_area` VALUES ('2404', '长汀县', '210', '0', '3', '');
INSERT INTO `ds_area` VALUES ('2405', '古田县', '211', '0', '3', '');
INSERT INTO `ds_area` VALUES ('2406', '周宁县', '211', '0', '3', '');
INSERT INTO `ds_area` VALUES ('2407', '寿宁县', '211', '0', '3', '');
INSERT INTO `ds_area` VALUES ('2408', '屏南县', '211', '0', '3', '');
INSERT INTO `ds_area` VALUES ('2409', '柘荣县', '211', '0', '3', '');
INSERT INTO `ds_area` VALUES ('2410', '福安市', '211', '0', '3', '');
INSERT INTO `ds_area` VALUES ('2411', '福鼎市', '211', '0', '3', '');
INSERT INTO `ds_area` VALUES ('2412', '蕉城区', '211', '0', '3', '');
INSERT INTO `ds_area` VALUES ('2413', '霞浦县', '211', '0', '3', '');
INSERT INTO `ds_area` VALUES ('2414', '东湖区', '212', '0', '3', '');
INSERT INTO `ds_area` VALUES ('2415', '南昌县', '212', '0', '3', '');
INSERT INTO `ds_area` VALUES ('2416', '安义县', '212', '0', '3', '');
INSERT INTO `ds_area` VALUES ('2417', '新建县', '212', '0', '3', '');
INSERT INTO `ds_area` VALUES ('2418', '湾里区', '212', '0', '3', '');
INSERT INTO `ds_area` VALUES ('2419', '西湖区', '212', '0', '3', '');
INSERT INTO `ds_area` VALUES ('2420', '进贤县', '212', '0', '3', '');
INSERT INTO `ds_area` VALUES ('2421', '青云谱区', '212', '0', '3', '');
INSERT INTO `ds_area` VALUES ('2422', '青山湖区', '212', '0', '3', '');
INSERT INTO `ds_area` VALUES ('2423', '乐平市', '213', '0', '3', '');
INSERT INTO `ds_area` VALUES ('2424', '昌江区', '213', '0', '3', '');
INSERT INTO `ds_area` VALUES ('2425', '浮梁县', '213', '0', '3', '');
INSERT INTO `ds_area` VALUES ('2426', '珠山区', '213', '0', '3', '');
INSERT INTO `ds_area` VALUES ('2427', '上栗县', '214', '0', '3', '');
INSERT INTO `ds_area` VALUES ('2428', '安源区', '214', '0', '3', '');
INSERT INTO `ds_area` VALUES ('2429', '湘东区', '214', '0', '3', '');
INSERT INTO `ds_area` VALUES ('2430', '芦溪县', '214', '0', '3', '');
INSERT INTO `ds_area` VALUES ('2431', '莲花县', '214', '0', '3', '');
INSERT INTO `ds_area` VALUES ('2432', '九江县', '215', '0', '3', '');
INSERT INTO `ds_area` VALUES ('2433', '修水县', '215', '0', '3', '');
INSERT INTO `ds_area` VALUES ('2434', '庐山区', '215', '0', '3', '');
INSERT INTO `ds_area` VALUES ('2435', '彭泽县', '215', '0', '3', '');
INSERT INTO `ds_area` VALUES ('2436', '德安县', '215', '0', '3', '');
INSERT INTO `ds_area` VALUES ('2437', '星子县', '215', '0', '3', '');
INSERT INTO `ds_area` VALUES ('2438', '武宁县', '215', '0', '3', '');
INSERT INTO `ds_area` VALUES ('2439', '永修县', '215', '0', '3', '');
INSERT INTO `ds_area` VALUES ('2440', '浔阳区', '215', '0', '3', '');
INSERT INTO `ds_area` VALUES ('2441', '湖口县', '215', '0', '3', '');
INSERT INTO `ds_area` VALUES ('2442', '瑞昌市', '215', '0', '3', '');
INSERT INTO `ds_area` VALUES ('2443', '都昌县', '215', '0', '3', '');
INSERT INTO `ds_area` VALUES ('2444', '分宜县', '216', '0', '3', '');
INSERT INTO `ds_area` VALUES ('2445', '渝水区', '216', '0', '3', '');
INSERT INTO `ds_area` VALUES ('2446', '余江县', '217', '0', '3', '');
INSERT INTO `ds_area` VALUES ('2447', '月湖区', '217', '0', '3', '');
INSERT INTO `ds_area` VALUES ('2448', '贵溪市', '217', '0', '3', '');
INSERT INTO `ds_area` VALUES ('2449', '上犹县', '218', '0', '3', '');
INSERT INTO `ds_area` VALUES ('2450', '于都县', '218', '0', '3', '');
INSERT INTO `ds_area` VALUES ('2451', '会昌县', '218', '0', '3', '');
INSERT INTO `ds_area` VALUES ('2452', '信丰县', '218', '0', '3', '');
INSERT INTO `ds_area` VALUES ('2453', '全南县', '218', '0', '3', '');
INSERT INTO `ds_area` VALUES ('2454', '兴国县', '218', '0', '3', '');
INSERT INTO `ds_area` VALUES ('2455', '南康市', '218', '0', '3', '');
INSERT INTO `ds_area` VALUES ('2456', '大余县', '218', '0', '3', '');
INSERT INTO `ds_area` VALUES ('2457', '宁都县', '218', '0', '3', '');
INSERT INTO `ds_area` VALUES ('2458', '安远县', '218', '0', '3', '');
INSERT INTO `ds_area` VALUES ('2459', '定南县', '218', '0', '3', '');
INSERT INTO `ds_area` VALUES ('2460', '寻乌县', '218', '0', '3', '');
INSERT INTO `ds_area` VALUES ('2461', '崇义县', '218', '0', '3', '');
INSERT INTO `ds_area` VALUES ('2462', '瑞金市', '218', '0', '3', '');
INSERT INTO `ds_area` VALUES ('2463', '石城县', '218', '0', '3', '');
INSERT INTO `ds_area` VALUES ('2464', '章贡区', '218', '0', '3', '');
INSERT INTO `ds_area` VALUES ('2465', '赣县', '218', '0', '3', '');
INSERT INTO `ds_area` VALUES ('2466', '龙南县', '218', '0', '3', '');
INSERT INTO `ds_area` VALUES ('2467', '万安县', '219', '0', '3', '');
INSERT INTO `ds_area` VALUES ('2468', '井冈山市', '219', '0', '3', '');
INSERT INTO `ds_area` VALUES ('2469', '吉安县', '219', '0', '3', '');
INSERT INTO `ds_area` VALUES ('2470', '吉州区', '219', '0', '3', '');
INSERT INTO `ds_area` VALUES ('2471', '吉水县', '219', '0', '3', '');
INSERT INTO `ds_area` VALUES ('2472', '安福县', '219', '0', '3', '');
INSERT INTO `ds_area` VALUES ('2473', '峡江县', '219', '0', '3', '');
INSERT INTO `ds_area` VALUES ('2474', '新干县', '219', '0', '3', '');
INSERT INTO `ds_area` VALUES ('2475', '永丰县', '219', '0', '3', '');
INSERT INTO `ds_area` VALUES ('2476', '永新县', '219', '0', '3', '');
INSERT INTO `ds_area` VALUES ('2477', '泰和县', '219', '0', '3', '');
INSERT INTO `ds_area` VALUES ('2478', '遂川县', '219', '0', '3', '');
INSERT INTO `ds_area` VALUES ('2479', '青原区', '219', '0', '3', '');
INSERT INTO `ds_area` VALUES ('2480', '万载县', '220', '0', '3', '');
INSERT INTO `ds_area` VALUES ('2481', '上高县', '220', '0', '3', '');
INSERT INTO `ds_area` VALUES ('2482', '丰城市', '220', '0', '3', '');
INSERT INTO `ds_area` VALUES ('2483', '奉新县', '220', '0', '3', '');
INSERT INTO `ds_area` VALUES ('2484', '宜丰县', '220', '0', '3', '');
INSERT INTO `ds_area` VALUES ('2485', '樟树市', '220', '0', '3', '');
INSERT INTO `ds_area` VALUES ('2486', '袁州区', '220', '0', '3', '');
INSERT INTO `ds_area` VALUES ('2487', '铜鼓县', '220', '0', '3', '');
INSERT INTO `ds_area` VALUES ('2488', '靖安县', '220', '0', '3', '');
INSERT INTO `ds_area` VALUES ('2489', '高安市', '220', '0', '3', '');
INSERT INTO `ds_area` VALUES ('2490', '东乡县', '221', '0', '3', '');
INSERT INTO `ds_area` VALUES ('2491', '临川区', '221', '0', '3', '');
INSERT INTO `ds_area` VALUES ('2492', '乐安县', '221', '0', '3', '');
INSERT INTO `ds_area` VALUES ('2493', '南丰县', '221', '0', '3', '');
INSERT INTO `ds_area` VALUES ('2494', '南城县', '221', '0', '3', '');
INSERT INTO `ds_area` VALUES ('2495', '宜黄县', '221', '0', '3', '');
INSERT INTO `ds_area` VALUES ('2496', '崇仁县', '221', '0', '3', '');
INSERT INTO `ds_area` VALUES ('2497', '广昌县', '221', '0', '3', '');
INSERT INTO `ds_area` VALUES ('2498', '资溪县', '221', '0', '3', '');
INSERT INTO `ds_area` VALUES ('2499', '金溪县', '221', '0', '3', '');
INSERT INTO `ds_area` VALUES ('2500', '黎川县', '221', '0', '3', '');
INSERT INTO `ds_area` VALUES ('2501', '万年县', '222', '0', '3', '');
INSERT INTO `ds_area` VALUES ('2502', '上饶县', '222', '0', '3', '');
INSERT INTO `ds_area` VALUES ('2503', '余干县', '222', '0', '3', '');
INSERT INTO `ds_area` VALUES ('2504', '信州区', '222', '0', '3', '');
INSERT INTO `ds_area` VALUES ('2505', '婺源县', '222', '0', '3', '');
INSERT INTO `ds_area` VALUES ('2506', '广丰县', '222', '0', '3', '');
INSERT INTO `ds_area` VALUES ('2507', '弋阳县', '222', '0', '3', '');
INSERT INTO `ds_area` VALUES ('2508', '德兴市', '222', '0', '3', '');
INSERT INTO `ds_area` VALUES ('2509', '横峰县', '222', '0', '3', '');
INSERT INTO `ds_area` VALUES ('2510', '玉山县', '222', '0', '3', '');
INSERT INTO `ds_area` VALUES ('2511', '鄱阳县', '222', '0', '3', '');
INSERT INTO `ds_area` VALUES ('2512', '铅山县', '222', '0', '3', '');
INSERT INTO `ds_area` VALUES ('2513', '历下区', '223', '0', '3', '');
INSERT INTO `ds_area` VALUES ('2514', '历城区', '223', '0', '3', '');
INSERT INTO `ds_area` VALUES ('2515', '商河县', '223', '0', '3', '');
INSERT INTO `ds_area` VALUES ('2516', '天桥区', '223', '0', '3', '');
INSERT INTO `ds_area` VALUES ('2517', '市中区', '223', '0', '3', '');
INSERT INTO `ds_area` VALUES ('2518', '平阴县', '223', '0', '3', '');
INSERT INTO `ds_area` VALUES ('2519', '槐荫区', '223', '0', '3', '');
INSERT INTO `ds_area` VALUES ('2520', '济阳县', '223', '0', '3', '');
INSERT INTO `ds_area` VALUES ('2521', '章丘市', '223', '0', '3', '');
INSERT INTO `ds_area` VALUES ('2522', '长清区', '223', '0', '3', '');
INSERT INTO `ds_area` VALUES ('2523', '即墨市', '224', '0', '3', '');
INSERT INTO `ds_area` VALUES ('2524', '四方区', '224', '0', '3', '');
INSERT INTO `ds_area` VALUES ('2525', '城阳区', '224', '0', '3', '');
INSERT INTO `ds_area` VALUES ('2526', '崂山区', '224', '0', '3', '');
INSERT INTO `ds_area` VALUES ('2527', '市北区', '224', '0', '3', '');
INSERT INTO `ds_area` VALUES ('2528', '市南区', '224', '0', '3', '');
INSERT INTO `ds_area` VALUES ('2529', '平度市', '224', '0', '3', '');
INSERT INTO `ds_area` VALUES ('2530', '李沧区', '224', '0', '3', '');
INSERT INTO `ds_area` VALUES ('2531', '胶南市', '224', '0', '3', '');
INSERT INTO `ds_area` VALUES ('2532', '胶州市', '224', '0', '3', '');
INSERT INTO `ds_area` VALUES ('2533', '莱西市', '224', '0', '3', '');
INSERT INTO `ds_area` VALUES ('2534', '黄岛区', '224', '0', '3', '');
INSERT INTO `ds_area` VALUES ('2535', '临淄区', '225', '0', '3', '');
INSERT INTO `ds_area` VALUES ('2536', '博山区', '225', '0', '3', '');
INSERT INTO `ds_area` VALUES ('2537', '周村区', '225', '0', '3', '');
INSERT INTO `ds_area` VALUES ('2538', '张店区', '225', '0', '3', '');
INSERT INTO `ds_area` VALUES ('2539', '桓台县', '225', '0', '3', '');
INSERT INTO `ds_area` VALUES ('2540', '沂源县', '225', '0', '3', '');
INSERT INTO `ds_area` VALUES ('2541', '淄川区', '225', '0', '3', '');
INSERT INTO `ds_area` VALUES ('2542', '高青县', '225', '0', '3', '');
INSERT INTO `ds_area` VALUES ('2543', '台儿庄区', '226', '0', '3', '');
INSERT INTO `ds_area` VALUES ('2544', '山亭区', '226', '0', '3', '');
INSERT INTO `ds_area` VALUES ('2545', '峄城区', '226', '0', '3', '');
INSERT INTO `ds_area` VALUES ('2546', '市中区', '226', '0', '3', '');
INSERT INTO `ds_area` VALUES ('2547', '滕州市', '226', '0', '3', '');
INSERT INTO `ds_area` VALUES ('2548', '薛城区', '226', '0', '3', '');
INSERT INTO `ds_area` VALUES ('2549', '东营区', '227', '0', '3', '');
INSERT INTO `ds_area` VALUES ('2550', '利津县', '227', '0', '3', '');
INSERT INTO `ds_area` VALUES ('2551', '垦利县', '227', '0', '3', '');
INSERT INTO `ds_area` VALUES ('2552', '广饶县', '227', '0', '3', '');
INSERT INTO `ds_area` VALUES ('2553', '河口区', '227', '0', '3', '');
INSERT INTO `ds_area` VALUES ('2554', '招远市', '228', '0', '3', '');
INSERT INTO `ds_area` VALUES ('2555', '栖霞市', '228', '0', '3', '');
INSERT INTO `ds_area` VALUES ('2556', '海阳市', '228', '0', '3', '');
INSERT INTO `ds_area` VALUES ('2557', '牟平区', '228', '0', '3', '');
INSERT INTO `ds_area` VALUES ('2558', '福山区', '228', '0', '3', '');
INSERT INTO `ds_area` VALUES ('2559', '芝罘区', '228', '0', '3', '');
INSERT INTO `ds_area` VALUES ('2560', '莱山区', '228', '0', '3', '');
INSERT INTO `ds_area` VALUES ('2561', '莱州市', '228', '0', '3', '');
INSERT INTO `ds_area` VALUES ('2562', '莱阳市', '228', '0', '3', '');
INSERT INTO `ds_area` VALUES ('2563', '蓬莱市', '228', '0', '3', '');
INSERT INTO `ds_area` VALUES ('2564', '长岛县', '228', '0', '3', '');
INSERT INTO `ds_area` VALUES ('2565', '龙口市', '228', '0', '3', '');
INSERT INTO `ds_area` VALUES ('2566', '临朐县', '229', '0', '3', '');
INSERT INTO `ds_area` VALUES ('2567', '坊子区', '229', '0', '3', '');
INSERT INTO `ds_area` VALUES ('2568', '奎文区', '229', '0', '3', '');
INSERT INTO `ds_area` VALUES ('2569', '安丘市', '229', '0', '3', '');
INSERT INTO `ds_area` VALUES ('2570', '寒亭区', '229', '0', '3', '');
INSERT INTO `ds_area` VALUES ('2571', '寿光市', '229', '0', '3', '');
INSERT INTO `ds_area` VALUES ('2572', '昌乐县', '229', '0', '3', '');
INSERT INTO `ds_area` VALUES ('2573', '昌邑市', '229', '0', '3', '');
INSERT INTO `ds_area` VALUES ('2574', '潍城区', '229', '0', '3', '');
INSERT INTO `ds_area` VALUES ('2575', '诸城市', '229', '0', '3', '');
INSERT INTO `ds_area` VALUES ('2576', '青州市', '229', '0', '3', '');
INSERT INTO `ds_area` VALUES ('2577', '高密市', '229', '0', '3', '');
INSERT INTO `ds_area` VALUES ('2578', '任城区', '230', '0', '3', '');
INSERT INTO `ds_area` VALUES ('2579', '兖州市', '230', '0', '3', '');
INSERT INTO `ds_area` VALUES ('2580', '嘉祥县', '230', '0', '3', '');
INSERT INTO `ds_area` VALUES ('2581', '市中区', '230', '0', '3', '');
INSERT INTO `ds_area` VALUES ('2582', '微山县', '230', '0', '3', '');
INSERT INTO `ds_area` VALUES ('2583', '曲阜市', '230', '0', '3', '');
INSERT INTO `ds_area` VALUES ('2584', '梁山县', '230', '0', '3', '');
INSERT INTO `ds_area` VALUES ('2585', '汶上县', '230', '0', '3', '');
INSERT INTO `ds_area` VALUES ('2586', '泗水县', '230', '0', '3', '');
INSERT INTO `ds_area` VALUES ('2587', '邹城市', '230', '0', '3', '');
INSERT INTO `ds_area` VALUES ('2588', '金乡县', '230', '0', '3', '');
INSERT INTO `ds_area` VALUES ('2589', '鱼台县', '230', '0', '3', '');
INSERT INTO `ds_area` VALUES ('2590', '东平县', '231', '0', '3', '');
INSERT INTO `ds_area` VALUES ('2591', '宁阳县', '231', '0', '3', '');
INSERT INTO `ds_area` VALUES ('2592', '岱岳区', '231', '0', '3', '');
INSERT INTO `ds_area` VALUES ('2593', '新泰市', '231', '0', '3', '');
INSERT INTO `ds_area` VALUES ('2594', '泰山区', '231', '0', '3', '');
INSERT INTO `ds_area` VALUES ('2595', '肥城市', '231', '0', '3', '');
INSERT INTO `ds_area` VALUES ('2596', '乳山市', '232', '0', '3', '');
INSERT INTO `ds_area` VALUES ('2597', '文登市', '232', '0', '3', '');
INSERT INTO `ds_area` VALUES ('2598', '环翠区', '232', '0', '3', '');
INSERT INTO `ds_area` VALUES ('2599', '荣成市', '232', '0', '3', '');
INSERT INTO `ds_area` VALUES ('2600', '东港区', '233', '0', '3', '');
INSERT INTO `ds_area` VALUES ('2601', '五莲县', '233', '0', '3', '');
INSERT INTO `ds_area` VALUES ('2602', '岚山区', '233', '0', '3', '');
INSERT INTO `ds_area` VALUES ('2603', '莒县', '233', '0', '3', '');
INSERT INTO `ds_area` VALUES ('2604', '莱城区', '234', '0', '3', '');
INSERT INTO `ds_area` VALUES ('2605', '钢城区', '234', '0', '3', '');
INSERT INTO `ds_area` VALUES ('2606', '临沭县', '235', '0', '3', '');
INSERT INTO `ds_area` VALUES ('2607', '兰山区', '235', '0', '3', '');
INSERT INTO `ds_area` VALUES ('2608', '平邑县', '235', '0', '3', '');
INSERT INTO `ds_area` VALUES ('2609', '沂南县', '235', '0', '3', '');
INSERT INTO `ds_area` VALUES ('2610', '沂水县', '235', '0', '3', '');
INSERT INTO `ds_area` VALUES ('2611', '河东区', '235', '0', '3', '');
INSERT INTO `ds_area` VALUES ('2612', '罗庄区', '235', '0', '3', '');
INSERT INTO `ds_area` VALUES ('2613', '苍山县', '235', '0', '3', '');
INSERT INTO `ds_area` VALUES ('2614', '莒南县', '235', '0', '3', '');
INSERT INTO `ds_area` VALUES ('2615', '蒙阴县', '235', '0', '3', '');
INSERT INTO `ds_area` VALUES ('2616', '费县', '235', '0', '3', '');
INSERT INTO `ds_area` VALUES ('2617', '郯城县', '235', '0', '3', '');
INSERT INTO `ds_area` VALUES ('2618', '临邑县', '236', '0', '3', '');
INSERT INTO `ds_area` VALUES ('2619', '乐陵市', '236', '0', '3', '');
INSERT INTO `ds_area` VALUES ('2620', '夏津县', '236', '0', '3', '');
INSERT INTO `ds_area` VALUES ('2621', '宁津县', '236', '0', '3', '');
INSERT INTO `ds_area` VALUES ('2622', '平原县', '236', '0', '3', '');
INSERT INTO `ds_area` VALUES ('2623', '庆云县', '236', '0', '3', '');
INSERT INTO `ds_area` VALUES ('2624', '德城区', '236', '0', '3', '');
INSERT INTO `ds_area` VALUES ('2625', '武城县', '236', '0', '3', '');
INSERT INTO `ds_area` VALUES ('2626', '禹城市', '236', '0', '3', '');
INSERT INTO `ds_area` VALUES ('2627', '陵县', '236', '0', '3', '');
INSERT INTO `ds_area` VALUES ('2628', '齐河县', '236', '0', '3', '');
INSERT INTO `ds_area` VALUES ('2629', '东昌府区', '237', '0', '3', '');
INSERT INTO `ds_area` VALUES ('2630', '东阿县', '237', '0', '3', '');
INSERT INTO `ds_area` VALUES ('2631', '临清市', '237', '0', '3', '');
INSERT INTO `ds_area` VALUES ('2632', '冠县', '237', '0', '3', '');
INSERT INTO `ds_area` VALUES ('2633', '茌平县', '237', '0', '3', '');
INSERT INTO `ds_area` VALUES ('2634', '莘县', '237', '0', '3', '');
INSERT INTO `ds_area` VALUES ('2635', '阳谷县', '237', '0', '3', '');
INSERT INTO `ds_area` VALUES ('2636', '高唐县', '237', '0', '3', '');
INSERT INTO `ds_area` VALUES ('2637', '博兴县', '238', '0', '3', '');
INSERT INTO `ds_area` VALUES ('2638', '惠民县', '238', '0', '3', '');
INSERT INTO `ds_area` VALUES ('2639', '无棣县', '238', '0', '3', '');
INSERT INTO `ds_area` VALUES ('2640', '沾化县', '238', '0', '3', '');
INSERT INTO `ds_area` VALUES ('2641', '滨城区', '238', '0', '3', '');
INSERT INTO `ds_area` VALUES ('2642', '邹平县', '238', '0', '3', '');
INSERT INTO `ds_area` VALUES ('2643', '阳信县', '238', '0', '3', '');
INSERT INTO `ds_area` VALUES ('2644', '东明县', '239', '0', '3', '');
INSERT INTO `ds_area` VALUES ('2645', '单县', '239', '0', '3', '');
INSERT INTO `ds_area` VALUES ('2646', '定陶县', '239', '0', '3', '');
INSERT INTO `ds_area` VALUES ('2647', '巨野县', '239', '0', '3', '');
INSERT INTO `ds_area` VALUES ('2648', '成武县', '239', '0', '3', '');
INSERT INTO `ds_area` VALUES ('2649', '曹县', '239', '0', '3', '');
INSERT INTO `ds_area` VALUES ('2650', '牡丹区', '239', '0', '3', '');
INSERT INTO `ds_area` VALUES ('2651', '郓城县', '239', '0', '3', '');
INSERT INTO `ds_area` VALUES ('2652', '鄄城县', '239', '0', '3', '');
INSERT INTO `ds_area` VALUES ('2653', '上街区', '240', '0', '3', '');
INSERT INTO `ds_area` VALUES ('2654', '中原区', '240', '0', '3', '');
INSERT INTO `ds_area` VALUES ('2655', '中牟县', '240', '0', '3', '');
INSERT INTO `ds_area` VALUES ('2656', '二七区', '240', '0', '3', '');
INSERT INTO `ds_area` VALUES ('2657', '巩义市', '240', '0', '3', '');
INSERT INTO `ds_area` VALUES ('2658', '惠济区', '240', '0', '3', '');
INSERT INTO `ds_area` VALUES ('2659', '新密市', '240', '0', '3', '');
INSERT INTO `ds_area` VALUES ('2660', '新郑市', '240', '0', '3', '');
INSERT INTO `ds_area` VALUES ('2661', '登封市', '240', '0', '3', '');
INSERT INTO `ds_area` VALUES ('2662', '管城回族区', '240', '0', '3', '');
INSERT INTO `ds_area` VALUES ('2663', '荥阳市', '240', '0', '3', '');
INSERT INTO `ds_area` VALUES ('2664', '金水区', '240', '0', '3', '');
INSERT INTO `ds_area` VALUES ('2665', '兰考县', '241', '0', '3', '');
INSERT INTO `ds_area` VALUES ('2666', '尉氏县', '241', '0', '3', '');
INSERT INTO `ds_area` VALUES ('2667', '开封县', '241', '0', '3', '');
INSERT INTO `ds_area` VALUES ('2668', '杞县', '241', '0', '3', '');
INSERT INTO `ds_area` VALUES ('2669', '禹王台区', '241', '0', '3', '');
INSERT INTO `ds_area` VALUES ('2670', '通许县', '241', '0', '3', '');
INSERT INTO `ds_area` VALUES ('2671', '金明区', '241', '0', '3', '');
INSERT INTO `ds_area` VALUES ('2672', '顺河回族区', '241', '0', '3', '');
INSERT INTO `ds_area` VALUES ('2673', '鼓楼区', '241', '0', '3', '');
INSERT INTO `ds_area` VALUES ('2674', '龙亭区', '241', '0', '3', '');
INSERT INTO `ds_area` VALUES ('2675', '伊川县', '242', '0', '3', '');
INSERT INTO `ds_area` VALUES ('2676', '偃师市', '242', '0', '3', '');
INSERT INTO `ds_area` VALUES ('2677', '吉利区', '242', '0', '3', '');
INSERT INTO `ds_area` VALUES ('2678', '孟津县', '242', '0', '3', '');
INSERT INTO `ds_area` VALUES ('2679', '宜阳县', '242', '0', '3', '');
INSERT INTO `ds_area` VALUES ('2680', '嵩县', '242', '0', '3', '');
INSERT INTO `ds_area` VALUES ('2681', '新安县', '242', '0', '3', '');
INSERT INTO `ds_area` VALUES ('2682', '栾川县', '242', '0', '3', '');
INSERT INTO `ds_area` VALUES ('2683', '汝阳县', '242', '0', '3', '');
INSERT INTO `ds_area` VALUES ('2684', '洛宁县', '242', '0', '3', '');
INSERT INTO `ds_area` VALUES ('2685', '洛龙区', '242', '0', '3', '');
INSERT INTO `ds_area` VALUES ('2686', '涧西区', '242', '0', '3', '');
INSERT INTO `ds_area` VALUES ('2687', '瀍河回族区', '242', '0', '3', '');
INSERT INTO `ds_area` VALUES ('2688', '老城区', '242', '0', '3', '');
INSERT INTO `ds_area` VALUES ('2689', '西工区', '242', '0', '3', '');
INSERT INTO `ds_area` VALUES ('2690', '卫东区', '243', '0', '3', '');
INSERT INTO `ds_area` VALUES ('2691', '叶县', '243', '0', '3', '');
INSERT INTO `ds_area` VALUES ('2692', '宝丰县', '243', '0', '3', '');
INSERT INTO `ds_area` VALUES ('2693', '新华区', '243', '0', '3', '');
INSERT INTO `ds_area` VALUES ('2694', '汝州市', '243', '0', '3', '');
INSERT INTO `ds_area` VALUES ('2695', '湛河区', '243', '0', '3', '');
INSERT INTO `ds_area` VALUES ('2696', '石龙区', '243', '0', '3', '');
INSERT INTO `ds_area` VALUES ('2697', '舞钢市', '243', '0', '3', '');
INSERT INTO `ds_area` VALUES ('2698', '郏县', '243', '0', '3', '');
INSERT INTO `ds_area` VALUES ('2699', '鲁山县', '243', '0', '3', '');
INSERT INTO `ds_area` VALUES ('2700', '内黄县', '244', '0', '3', '');
INSERT INTO `ds_area` VALUES ('2701', '北关区', '244', '0', '3', '');
INSERT INTO `ds_area` VALUES ('2702', '安阳县', '244', '0', '3', '');
INSERT INTO `ds_area` VALUES ('2703', '文峰区', '244', '0', '3', '');
INSERT INTO `ds_area` VALUES ('2704', '林州市', '244', '0', '3', '');
INSERT INTO `ds_area` VALUES ('2705', '殷都区', '244', '0', '3', '');
INSERT INTO `ds_area` VALUES ('2706', '汤阴县', '244', '0', '3', '');
INSERT INTO `ds_area` VALUES ('2707', '滑县', '244', '0', '3', '');
INSERT INTO `ds_area` VALUES ('2708', '龙安区', '244', '0', '3', '');
INSERT INTO `ds_area` VALUES ('2709', '山城区', '245', '0', '3', '');
INSERT INTO `ds_area` VALUES ('2710', '浚县', '245', '0', '3', '');
INSERT INTO `ds_area` VALUES ('2711', '淇县', '245', '0', '3', '');
INSERT INTO `ds_area` VALUES ('2712', '淇滨区', '245', '0', '3', '');
INSERT INTO `ds_area` VALUES ('2713', '鹤山区', '245', '0', '3', '');
INSERT INTO `ds_area` VALUES ('2714', '凤泉区', '246', '0', '3', '');
INSERT INTO `ds_area` VALUES ('2715', '卫滨区', '246', '0', '3', '');
INSERT INTO `ds_area` VALUES ('2716', '卫辉市', '246', '0', '3', '');
INSERT INTO `ds_area` VALUES ('2717', '原阳县', '246', '0', '3', '');
INSERT INTO `ds_area` VALUES ('2718', '封丘县', '246', '0', '3', '');
INSERT INTO `ds_area` VALUES ('2719', '延津县', '246', '0', '3', '');
INSERT INTO `ds_area` VALUES ('2720', '新乡县', '246', '0', '3', '');
INSERT INTO `ds_area` VALUES ('2721', '牧野区', '246', '0', '3', '');
INSERT INTO `ds_area` VALUES ('2722', '红旗区', '246', '0', '3', '');
INSERT INTO `ds_area` VALUES ('2723', '获嘉县', '246', '0', '3', '');
INSERT INTO `ds_area` VALUES ('2724', '辉县市', '246', '0', '3', '');
INSERT INTO `ds_area` VALUES ('2725', '长垣县', '246', '0', '3', '');
INSERT INTO `ds_area` VALUES ('2726', '中站区', '247', '0', '3', '');
INSERT INTO `ds_area` VALUES ('2727', '修武县', '247', '0', '3', '');
INSERT INTO `ds_area` VALUES ('2728', '博爱县', '247', '0', '3', '');
INSERT INTO `ds_area` VALUES ('2729', '孟州市', '247', '0', '3', '');
INSERT INTO `ds_area` VALUES ('2730', '山阳区', '247', '0', '3', '');
INSERT INTO `ds_area` VALUES ('2731', '武陟县', '247', '0', '3', '');
INSERT INTO `ds_area` VALUES ('2732', '沁阳市', '247', '0', '3', '');
INSERT INTO `ds_area` VALUES ('2733', '温县', '247', '0', '3', '');
INSERT INTO `ds_area` VALUES ('2734', '解放区', '247', '0', '3', '');
INSERT INTO `ds_area` VALUES ('2735', '马村区', '247', '0', '3', '');
INSERT INTO `ds_area` VALUES ('2736', '华龙区', '248', '0', '3', '');
INSERT INTO `ds_area` VALUES ('2737', '南乐县', '248', '0', '3', '');
INSERT INTO `ds_area` VALUES ('2738', '台前县', '248', '0', '3', '');
INSERT INTO `ds_area` VALUES ('2739', '清丰县', '248', '0', '3', '');
INSERT INTO `ds_area` VALUES ('2740', '濮阳县', '248', '0', '3', '');
INSERT INTO `ds_area` VALUES ('2741', '范县', '248', '0', '3', '');
INSERT INTO `ds_area` VALUES ('2742', '禹州市', '249', '0', '3', '');
INSERT INTO `ds_area` VALUES ('2743', '襄城县', '249', '0', '3', '');
INSERT INTO `ds_area` VALUES ('2744', '许昌县', '249', '0', '3', '');
INSERT INTO `ds_area` VALUES ('2745', '鄢陵县', '249', '0', '3', '');
INSERT INTO `ds_area` VALUES ('2746', '长葛市', '249', '0', '3', '');
INSERT INTO `ds_area` VALUES ('2747', '魏都区', '249', '0', '3', '');
INSERT INTO `ds_area` VALUES ('2748', '临颍县', '250', '0', '3', '');
INSERT INTO `ds_area` VALUES ('2749', '召陵区', '250', '0', '3', '');
INSERT INTO `ds_area` VALUES ('2750', '源汇区', '250', '0', '3', '');
INSERT INTO `ds_area` VALUES ('2751', '舞阳县', '250', '0', '3', '');
INSERT INTO `ds_area` VALUES ('2752', '郾城区', '250', '0', '3', '');
INSERT INTO `ds_area` VALUES ('2753', '义马市', '251', '0', '3', '');
INSERT INTO `ds_area` VALUES ('2754', '卢氏县', '251', '0', '3', '');
INSERT INTO `ds_area` VALUES ('2755', '渑池县', '251', '0', '3', '');
INSERT INTO `ds_area` VALUES ('2756', '湖滨区', '251', '0', '3', '');
INSERT INTO `ds_area` VALUES ('2757', '灵宝市', '251', '0', '3', '');
INSERT INTO `ds_area` VALUES ('2758', '陕县', '251', '0', '3', '');
INSERT INTO `ds_area` VALUES ('2759', '内乡县', '252', '0', '3', '');
INSERT INTO `ds_area` VALUES ('2760', '南召县', '252', '0', '3', '');
INSERT INTO `ds_area` VALUES ('2761', '卧龙区', '252', '0', '3', '');
INSERT INTO `ds_area` VALUES ('2762', '唐河县', '252', '0', '3', '');
INSERT INTO `ds_area` VALUES ('2763', '宛城区', '252', '0', '3', '');
INSERT INTO `ds_area` VALUES ('2764', '新野县', '252', '0', '3', '');
INSERT INTO `ds_area` VALUES ('2765', '方城县', '252', '0', '3', '');
INSERT INTO `ds_area` VALUES ('2766', '桐柏县', '252', '0', '3', '');
INSERT INTO `ds_area` VALUES ('2767', '淅川县', '252', '0', '3', '');
INSERT INTO `ds_area` VALUES ('2768', '社旗县', '252', '0', '3', '');
INSERT INTO `ds_area` VALUES ('2769', '西峡县', '252', '0', '3', '');
INSERT INTO `ds_area` VALUES ('2770', '邓州市', '252', '0', '3', '');
INSERT INTO `ds_area` VALUES ('2771', '镇平县', '252', '0', '3', '');
INSERT INTO `ds_area` VALUES ('2772', '夏邑县', '253', '0', '3', '');
INSERT INTO `ds_area` VALUES ('2773', '宁陵县', '253', '0', '3', '');
INSERT INTO `ds_area` VALUES ('2774', '柘城县', '253', '0', '3', '');
INSERT INTO `ds_area` VALUES ('2775', '民权县', '253', '0', '3', '');
INSERT INTO `ds_area` VALUES ('2776', '永城市', '253', '0', '3', '');
INSERT INTO `ds_area` VALUES ('2777', '睢县', '253', '0', '3', '');
INSERT INTO `ds_area` VALUES ('2778', '睢阳区', '253', '0', '3', '');
INSERT INTO `ds_area` VALUES ('2779', '粱园区', '253', '0', '3', '');
INSERT INTO `ds_area` VALUES ('2780', '虞城县', '253', '0', '3', '');
INSERT INTO `ds_area` VALUES ('2781', '光山县', '254', '0', '3', '');
INSERT INTO `ds_area` VALUES ('2782', '商城县', '254', '0', '3', '');
INSERT INTO `ds_area` VALUES ('2783', '固始县', '254', '0', '3', '');
INSERT INTO `ds_area` VALUES ('2784', '平桥区', '254', '0', '3', '');
INSERT INTO `ds_area` VALUES ('2785', '息县', '254', '0', '3', '');
INSERT INTO `ds_area` VALUES ('2786', '新县', '254', '0', '3', '');
INSERT INTO `ds_area` VALUES ('2787', '浉河区', '254', '0', '3', '');
INSERT INTO `ds_area` VALUES ('2788', '淮滨县', '254', '0', '3', '');
INSERT INTO `ds_area` VALUES ('2789', '潢川县', '254', '0', '3', '');
INSERT INTO `ds_area` VALUES ('2790', '罗山县', '254', '0', '3', '');
INSERT INTO `ds_area` VALUES ('2791', '商水县', '255', '0', '3', '');
INSERT INTO `ds_area` VALUES ('2792', '太康县', '255', '0', '3', '');
INSERT INTO `ds_area` VALUES ('2793', '川汇区', '255', '0', '3', '');
INSERT INTO `ds_area` VALUES ('2794', '扶沟县', '255', '0', '3', '');
INSERT INTO `ds_area` VALUES ('2795', '沈丘县', '255', '0', '3', '');
INSERT INTO `ds_area` VALUES ('2796', '淮阳县', '255', '0', '3', '');
INSERT INTO `ds_area` VALUES ('2797', '西华县', '255', '0', '3', '');
INSERT INTO `ds_area` VALUES ('2798', '郸城县', '255', '0', '3', '');
INSERT INTO `ds_area` VALUES ('2799', '项城市', '255', '0', '3', '');
INSERT INTO `ds_area` VALUES ('2800', '鹿邑县', '255', '0', '3', '');
INSERT INTO `ds_area` VALUES ('2801', '上蔡县', '256', '0', '3', '');
INSERT INTO `ds_area` VALUES ('2802', '平舆县', '256', '0', '3', '');
INSERT INTO `ds_area` VALUES ('2803', '新蔡县', '256', '0', '3', '');
INSERT INTO `ds_area` VALUES ('2804', '正阳县', '256', '0', '3', '');
INSERT INTO `ds_area` VALUES ('2805', '汝南县', '256', '0', '3', '');
INSERT INTO `ds_area` VALUES ('2806', '泌阳县', '256', '0', '3', '');
INSERT INTO `ds_area` VALUES ('2807', '确山县', '256', '0', '3', '');
INSERT INTO `ds_area` VALUES ('2808', '西平县', '256', '0', '3', '');
INSERT INTO `ds_area` VALUES ('2809', '遂平县', '256', '0', '3', '');
INSERT INTO `ds_area` VALUES ('2810', '驿城区', '256', '0', '3', '');
INSERT INTO `ds_area` VALUES ('2811', '济源市', '257', '0', '3', '');
INSERT INTO `ds_area` VALUES ('2812', '东西湖区', '258', '0', '3', '');
INSERT INTO `ds_area` VALUES ('2813', '新洲区', '258', '0', '3', '');
INSERT INTO `ds_area` VALUES ('2814', '武昌区', '258', '0', '3', '');
INSERT INTO `ds_area` VALUES ('2815', '汉南区', '258', '0', '3', '');
INSERT INTO `ds_area` VALUES ('2816', '汉阳区', '258', '0', '3', '');
INSERT INTO `ds_area` VALUES ('2817', '江夏区', '258', '0', '3', '');
INSERT INTO `ds_area` VALUES ('2818', '江岸区', '258', '0', '3', '');
INSERT INTO `ds_area` VALUES ('2819', '江汉区', '258', '0', '3', '');
INSERT INTO `ds_area` VALUES ('2820', '洪山区', '258', '0', '3', '');
INSERT INTO `ds_area` VALUES ('2821', '硚口区', '258', '0', '3', '');
INSERT INTO `ds_area` VALUES ('2822', '蔡甸区', '258', '0', '3', '');
INSERT INTO `ds_area` VALUES ('2823', '青山区', '258', '0', '3', '');
INSERT INTO `ds_area` VALUES ('2824', '黄陂区', '258', '0', '3', '');
INSERT INTO `ds_area` VALUES ('2825', '下陆区', '259', '0', '3', '');
INSERT INTO `ds_area` VALUES ('2826', '大冶市', '259', '0', '3', '');
INSERT INTO `ds_area` VALUES ('2827', '西塞山区', '259', '0', '3', '');
INSERT INTO `ds_area` VALUES ('2828', '铁山区', '259', '0', '3', '');
INSERT INTO `ds_area` VALUES ('2829', '阳新县', '259', '0', '3', '');
INSERT INTO `ds_area` VALUES ('2830', '黄石港区', '259', '0', '3', '');
INSERT INTO `ds_area` VALUES ('2831', '丹江口市', '260', '0', '3', '');
INSERT INTO `ds_area` VALUES ('2832', '张湾区', '260', '0', '3', '');
INSERT INTO `ds_area` VALUES ('2833', '房县', '260', '0', '3', '');
INSERT INTO `ds_area` VALUES ('2834', '竹山县', '260', '0', '3', '');
INSERT INTO `ds_area` VALUES ('2835', '竹溪县', '260', '0', '3', '');
INSERT INTO `ds_area` VALUES ('2836', '茅箭区', '260', '0', '3', '');
INSERT INTO `ds_area` VALUES ('2837', '郧县', '260', '0', '3', '');
INSERT INTO `ds_area` VALUES ('2838', '郧西县', '260', '0', '3', '');
INSERT INTO `ds_area` VALUES ('2839', '五峰土家族自治县', '261', '0', '3', '');
INSERT INTO `ds_area` VALUES ('2840', '伍家岗区', '261', '0', '3', '');
INSERT INTO `ds_area` VALUES ('2841', '兴山县', '261', '0', '3', '');
INSERT INTO `ds_area` VALUES ('2842', '夷陵区', '261', '0', '3', '');
INSERT INTO `ds_area` VALUES ('2843', '宜都市', '261', '0', '3', '');
INSERT INTO `ds_area` VALUES ('2844', '当阳市', '261', '0', '3', '');
INSERT INTO `ds_area` VALUES ('2845', '枝江市', '261', '0', '3', '');
INSERT INTO `ds_area` VALUES ('2846', '点军区', '261', '0', '3', '');
INSERT INTO `ds_area` VALUES ('2847', '秭归县', '261', '0', '3', '');
INSERT INTO `ds_area` VALUES ('2848', '虢亭区', '261', '0', '3', '');
INSERT INTO `ds_area` VALUES ('2849', '西陵区', '261', '0', '3', '');
INSERT INTO `ds_area` VALUES ('2850', '远安县', '261', '0', '3', '');
INSERT INTO `ds_area` VALUES ('2851', '长阳土家族自治县', '261', '0', '3', '');
INSERT INTO `ds_area` VALUES ('2852', '保康县', '262', '0', '3', '');
INSERT INTO `ds_area` VALUES ('2853', '南漳县', '262', '0', '3', '');
INSERT INTO `ds_area` VALUES ('2854', '宜城市', '262', '0', '3', '');
INSERT INTO `ds_area` VALUES ('2855', '枣阳市', '262', '0', '3', '');
INSERT INTO `ds_area` VALUES ('2856', '樊城区', '262', '0', '3', '');
INSERT INTO `ds_area` VALUES ('2857', '老河口市', '262', '0', '3', '');
INSERT INTO `ds_area` VALUES ('2858', '襄城区', '262', '0', '3', '');
INSERT INTO `ds_area` VALUES ('2859', '襄阳区', '262', '0', '3', '');
INSERT INTO `ds_area` VALUES ('2860', '谷城县', '262', '0', '3', '');
INSERT INTO `ds_area` VALUES ('2861', '华容区', '263', '0', '3', '');
INSERT INTO `ds_area` VALUES ('2862', '粱子湖', '263', '0', '3', '');
INSERT INTO `ds_area` VALUES ('2863', '鄂城区', '263', '0', '3', '');
INSERT INTO `ds_area` VALUES ('2864', '东宝区', '264', '0', '3', '');
INSERT INTO `ds_area` VALUES ('2865', '京山县', '264', '0', '3', '');
INSERT INTO `ds_area` VALUES ('2866', '掇刀区', '264', '0', '3', '');
INSERT INTO `ds_area` VALUES ('2867', '沙洋县', '264', '0', '3', '');
INSERT INTO `ds_area` VALUES ('2868', '钟祥市', '264', '0', '3', '');
INSERT INTO `ds_area` VALUES ('2869', '云梦县', '265', '0', '3', '');
INSERT INTO `ds_area` VALUES ('2870', '大悟县', '265', '0', '3', '');
INSERT INTO `ds_area` VALUES ('2871', '孝南区', '265', '0', '3', '');
INSERT INTO `ds_area` VALUES ('2872', '孝昌县', '265', '0', '3', '');
INSERT INTO `ds_area` VALUES ('2873', '安陆市', '265', '0', '3', '');
INSERT INTO `ds_area` VALUES ('2874', '应城市', '265', '0', '3', '');
INSERT INTO `ds_area` VALUES ('2875', '汉川市', '265', '0', '3', '');
INSERT INTO `ds_area` VALUES ('2876', '公安县', '266', '0', '3', '');
INSERT INTO `ds_area` VALUES ('2877', '松滋市', '266', '0', '3', '');
INSERT INTO `ds_area` VALUES ('2878', '江陵县', '266', '0', '3', '');
INSERT INTO `ds_area` VALUES ('2879', '沙市区', '266', '0', '3', '');
INSERT INTO `ds_area` VALUES ('2880', '洪湖市', '266', '0', '3', '');
INSERT INTO `ds_area` VALUES ('2881', '监利县', '266', '0', '3', '');
INSERT INTO `ds_area` VALUES ('2882', '石首市', '266', '0', '3', '');
INSERT INTO `ds_area` VALUES ('2883', '荆州区', '266', '0', '3', '');
INSERT INTO `ds_area` VALUES ('2884', '团风县', '267', '0', '3', '');
INSERT INTO `ds_area` VALUES ('2885', '武穴市', '267', '0', '3', '');
INSERT INTO `ds_area` VALUES ('2886', '浠水县', '267', '0', '3', '');
INSERT INTO `ds_area` VALUES ('2887', '红安县', '267', '0', '3', '');
INSERT INTO `ds_area` VALUES ('2888', '罗田县', '267', '0', '3', '');
INSERT INTO `ds_area` VALUES ('2889', '英山县', '267', '0', '3', '');
INSERT INTO `ds_area` VALUES ('2890', '蕲春县', '267', '0', '3', '');
INSERT INTO `ds_area` VALUES ('2891', '麻城市', '267', '0', '3', '');
INSERT INTO `ds_area` VALUES ('2892', '黄州区', '267', '0', '3', '');
INSERT INTO `ds_area` VALUES ('2893', '黄梅县', '267', '0', '3', '');
INSERT INTO `ds_area` VALUES ('2894', '咸安区', '268', '0', '3', '');
INSERT INTO `ds_area` VALUES ('2895', '嘉鱼县', '268', '0', '3', '');
INSERT INTO `ds_area` VALUES ('2896', '崇阳县', '268', '0', '3', '');
INSERT INTO `ds_area` VALUES ('2897', '赤壁市', '268', '0', '3', '');
INSERT INTO `ds_area` VALUES ('2898', '通城县', '268', '0', '3', '');
INSERT INTO `ds_area` VALUES ('2899', '通山县', '268', '0', '3', '');
INSERT INTO `ds_area` VALUES ('2900', '广水市', '269', '0', '3', '');
INSERT INTO `ds_area` VALUES ('2901', '曾都区', '269', '0', '3', '');
INSERT INTO `ds_area` VALUES ('2902', '利川市', '270', '0', '3', '');
INSERT INTO `ds_area` VALUES ('2903', '咸丰县', '270', '0', '3', '');
INSERT INTO `ds_area` VALUES ('2904', '宣恩县', '270', '0', '3', '');
INSERT INTO `ds_area` VALUES ('2905', '巴东县', '270', '0', '3', '');
INSERT INTO `ds_area` VALUES ('2906', '建始县', '270', '0', '3', '');
INSERT INTO `ds_area` VALUES ('2907', '恩施市', '270', '0', '3', '');
INSERT INTO `ds_area` VALUES ('2908', '来凤县', '270', '0', '3', '');
INSERT INTO `ds_area` VALUES ('2909', '鹤峰县', '270', '0', '3', '');
INSERT INTO `ds_area` VALUES ('2910', '仙桃市', '271', '0', '3', '');
INSERT INTO `ds_area` VALUES ('2911', '潜江市', '272', '0', '3', '');
INSERT INTO `ds_area` VALUES ('2912', '天门市', '273', '0', '3', '');
INSERT INTO `ds_area` VALUES ('2913', '神农架林区', '274', '0', '3', '');
INSERT INTO `ds_area` VALUES ('2914', '天心区', '275', '0', '3', '');
INSERT INTO `ds_area` VALUES ('2915', '宁乡县', '275', '0', '3', '');
INSERT INTO `ds_area` VALUES ('2916', '岳麓区', '275', '0', '3', '');
INSERT INTO `ds_area` VALUES ('2917', '开福区', '275', '0', '3', '');
INSERT INTO `ds_area` VALUES ('2918', '望城县', '275', '0', '3', '');
INSERT INTO `ds_area` VALUES ('2919', '浏阳市', '275', '0', '3', '');
INSERT INTO `ds_area` VALUES ('2920', '芙蓉区', '275', '0', '3', '');
INSERT INTO `ds_area` VALUES ('2921', '长沙县', '275', '0', '3', '');
INSERT INTO `ds_area` VALUES ('2922', '雨花区', '275', '0', '3', '');
INSERT INTO `ds_area` VALUES ('2923', '天元区', '276', '0', '3', '');
INSERT INTO `ds_area` VALUES ('2924', '攸县', '276', '0', '3', '');
INSERT INTO `ds_area` VALUES ('2925', '株洲县', '276', '0', '3', '');
INSERT INTO `ds_area` VALUES ('2926', '炎陵县', '276', '0', '3', '');
INSERT INTO `ds_area` VALUES ('2927', '石峰区', '276', '0', '3', '');
INSERT INTO `ds_area` VALUES ('2928', '芦淞区', '276', '0', '3', '');
INSERT INTO `ds_area` VALUES ('2929', '茶陵县', '276', '0', '3', '');
INSERT INTO `ds_area` VALUES ('2930', '荷塘区', '276', '0', '3', '');
INSERT INTO `ds_area` VALUES ('2931', '醴陵市', '276', '0', '3', '');
INSERT INTO `ds_area` VALUES ('2932', '岳塘区', '277', '0', '3', '');
INSERT INTO `ds_area` VALUES ('2933', '湘乡市', '277', '0', '3', '');
INSERT INTO `ds_area` VALUES ('2934', '湘潭县', '277', '0', '3', '');
INSERT INTO `ds_area` VALUES ('2935', '雨湖区', '277', '0', '3', '');
INSERT INTO `ds_area` VALUES ('2936', '韶山市', '277', '0', '3', '');
INSERT INTO `ds_area` VALUES ('2937', '南岳区', '278', '0', '3', '');
INSERT INTO `ds_area` VALUES ('2938', '常宁市', '278', '0', '3', '');
INSERT INTO `ds_area` VALUES ('2939', '珠晖区', '278', '0', '3', '');
INSERT INTO `ds_area` VALUES ('2940', '石鼓区', '278', '0', '3', '');
INSERT INTO `ds_area` VALUES ('2941', '祁东县', '278', '0', '3', '');
INSERT INTO `ds_area` VALUES ('2942', '耒阳市', '278', '0', '3', '');
INSERT INTO `ds_area` VALUES ('2943', '蒸湘区', '278', '0', '3', '');
INSERT INTO `ds_area` VALUES ('2944', '衡东县', '278', '0', '3', '');
INSERT INTO `ds_area` VALUES ('2945', '衡南县', '278', '0', '3', '');
INSERT INTO `ds_area` VALUES ('2946', '衡山县', '278', '0', '3', '');
INSERT INTO `ds_area` VALUES ('2947', '衡阳县', '278', '0', '3', '');
INSERT INTO `ds_area` VALUES ('2948', '雁峰区', '278', '0', '3', '');
INSERT INTO `ds_area` VALUES ('2949', '北塔区', '279', '0', '3', '');
INSERT INTO `ds_area` VALUES ('2950', '双清区', '279', '0', '3', '');
INSERT INTO `ds_area` VALUES ('2951', '城步苗族自治县', '279', '0', '3', '');
INSERT INTO `ds_area` VALUES ('2952', '大祥区', '279', '0', '3', '');
INSERT INTO `ds_area` VALUES ('2953', '新宁县', '279', '0', '3', '');
INSERT INTO `ds_area` VALUES ('2954', '新邵县', '279', '0', '3', '');
INSERT INTO `ds_area` VALUES ('2955', '武冈市', '279', '0', '3', '');
INSERT INTO `ds_area` VALUES ('2956', '洞口县', '279', '0', '3', '');
INSERT INTO `ds_area` VALUES ('2957', '绥宁县', '279', '0', '3', '');
INSERT INTO `ds_area` VALUES ('2958', '邵东县', '279', '0', '3', '');
INSERT INTO `ds_area` VALUES ('2959', '邵阳县', '279', '0', '3', '');
INSERT INTO `ds_area` VALUES ('2960', '隆回县', '279', '0', '3', '');
INSERT INTO `ds_area` VALUES ('2961', '临湘市', '280', '0', '3', '');
INSERT INTO `ds_area` VALUES ('2962', '云溪区', '280', '0', '3', '');
INSERT INTO `ds_area` VALUES ('2963', '华容县', '280', '0', '3', '');
INSERT INTO `ds_area` VALUES ('2964', '君山区', '280', '0', '3', '');
INSERT INTO `ds_area` VALUES ('2965', '岳阳县', '280', '0', '3', '');
INSERT INTO `ds_area` VALUES ('2966', '岳阳楼区', '280', '0', '3', '');
INSERT INTO `ds_area` VALUES ('2967', '平江县', '280', '0', '3', '');
INSERT INTO `ds_area` VALUES ('2968', '汨罗市', '280', '0', '3', '');
INSERT INTO `ds_area` VALUES ('2969', '湘阴县', '280', '0', '3', '');
INSERT INTO `ds_area` VALUES ('2970', '临澧县', '281', '0', '3', '');
INSERT INTO `ds_area` VALUES ('2971', '安乡县', '281', '0', '3', '');
INSERT INTO `ds_area` VALUES ('2972', '桃源县', '281', '0', '3', '');
INSERT INTO `ds_area` VALUES ('2973', '武陵区', '281', '0', '3', '');
INSERT INTO `ds_area` VALUES ('2974', '汉寿县', '281', '0', '3', '');
INSERT INTO `ds_area` VALUES ('2975', '津市市', '281', '0', '3', '');
INSERT INTO `ds_area` VALUES ('2976', '澧县', '281', '0', '3', '');
INSERT INTO `ds_area` VALUES ('2977', '石门县', '281', '0', '3', '');
INSERT INTO `ds_area` VALUES ('2978', '鼎城区', '281', '0', '3', '');
INSERT INTO `ds_area` VALUES ('2979', '慈利县', '282', '0', '3', '');
INSERT INTO `ds_area` VALUES ('2980', '桑植县', '282', '0', '3', '');
INSERT INTO `ds_area` VALUES ('2981', '武陵源区', '282', '0', '3', '');
INSERT INTO `ds_area` VALUES ('2982', '永定区', '282', '0', '3', '');
INSERT INTO `ds_area` VALUES ('2983', '南县', '283', '0', '3', '');
INSERT INTO `ds_area` VALUES ('2984', '安化县', '283', '0', '3', '');
INSERT INTO `ds_area` VALUES ('2985', '桃江县', '283', '0', '3', '');
INSERT INTO `ds_area` VALUES ('2986', '沅江市', '283', '0', '3', '');
INSERT INTO `ds_area` VALUES ('2987', '资阳区', '283', '0', '3', '');
INSERT INTO `ds_area` VALUES ('2988', '赫山区', '283', '0', '3', '');
INSERT INTO `ds_area` VALUES ('2989', '临武县', '284', '0', '3', '');
INSERT INTO `ds_area` VALUES ('2990', '北湖区', '284', '0', '3', '');
INSERT INTO `ds_area` VALUES ('2991', '嘉禾县', '284', '0', '3', '');
INSERT INTO `ds_area` VALUES ('2992', '安仁县', '284', '0', '3', '');
INSERT INTO `ds_area` VALUES ('2993', '宜章县', '284', '0', '3', '');
INSERT INTO `ds_area` VALUES ('2994', '桂东县', '284', '0', '3', '');
INSERT INTO `ds_area` VALUES ('2995', '桂阳县', '284', '0', '3', '');
INSERT INTO `ds_area` VALUES ('2996', '永兴县', '284', '0', '3', '');
INSERT INTO `ds_area` VALUES ('2997', '汝城县', '284', '0', '3', '');
INSERT INTO `ds_area` VALUES ('2998', '苏仙区', '284', '0', '3', '');
INSERT INTO `ds_area` VALUES ('2999', '资兴市', '284', '0', '3', '');
INSERT INTO `ds_area` VALUES ('3000', '东安县', '285', '0', '3', '');
INSERT INTO `ds_area` VALUES ('3001', '冷水滩区', '285', '0', '3', '');
INSERT INTO `ds_area` VALUES ('3002', '双牌县', '285', '0', '3', '');
INSERT INTO `ds_area` VALUES ('3003', '宁远县', '285', '0', '3', '');
INSERT INTO `ds_area` VALUES ('3004', '新田县', '285', '0', '3', '');
INSERT INTO `ds_area` VALUES ('3005', '江华瑶族自治县', '285', '0', '3', '');
INSERT INTO `ds_area` VALUES ('3006', '江永县', '285', '0', '3', '');
INSERT INTO `ds_area` VALUES ('3007', '祁阳县', '285', '0', '3', '');
INSERT INTO `ds_area` VALUES ('3008', '蓝山县', '285', '0', '3', '');
INSERT INTO `ds_area` VALUES ('3009', '道县', '285', '0', '3', '');
INSERT INTO `ds_area` VALUES ('3010', '零陵区', '285', '0', '3', '');
INSERT INTO `ds_area` VALUES ('3011', '中方县', '286', '0', '3', '');
INSERT INTO `ds_area` VALUES ('3012', '会同县', '286', '0', '3', '');
INSERT INTO `ds_area` VALUES ('3013', '新晃侗族自治县', '286', '0', '3', '');
INSERT INTO `ds_area` VALUES ('3014', '沅陵县', '286', '0', '3', '');
INSERT INTO `ds_area` VALUES ('3015', '洪江市/洪江区', '286', '0', '3', '');
INSERT INTO `ds_area` VALUES ('3016', '溆浦县', '286', '0', '3', '');
INSERT INTO `ds_area` VALUES ('3017', '芷江侗族自治县', '286', '0', '3', '');
INSERT INTO `ds_area` VALUES ('3018', '辰溪县', '286', '0', '3', '');
INSERT INTO `ds_area` VALUES ('3019', '通道侗族自治县', '286', '0', '3', '');
INSERT INTO `ds_area` VALUES ('3020', '靖州苗族侗族自治县', '286', '0', '3', '');
INSERT INTO `ds_area` VALUES ('3021', '鹤城区', '286', '0', '3', '');
INSERT INTO `ds_area` VALUES ('3022', '麻阳苗族自治县', '286', '0', '3', '');
INSERT INTO `ds_area` VALUES ('3023', '冷水江市', '287', '0', '3', '');
INSERT INTO `ds_area` VALUES ('3024', '双峰县', '287', '0', '3', '');
INSERT INTO `ds_area` VALUES ('3025', '娄星区', '287', '0', '3', '');
INSERT INTO `ds_area` VALUES ('3026', '新化县', '287', '0', '3', '');
INSERT INTO `ds_area` VALUES ('3027', '涟源市', '287', '0', '3', '');
INSERT INTO `ds_area` VALUES ('3028', '保靖县', '288', '0', '3', '');
INSERT INTO `ds_area` VALUES ('3029', '凤凰县', '288', '0', '3', '');
INSERT INTO `ds_area` VALUES ('3030', '古丈县', '288', '0', '3', '');
INSERT INTO `ds_area` VALUES ('3031', '吉首市', '288', '0', '3', '');
INSERT INTO `ds_area` VALUES ('3032', '永顺县', '288', '0', '3', '');
INSERT INTO `ds_area` VALUES ('3033', '泸溪县', '288', '0', '3', '');
INSERT INTO `ds_area` VALUES ('3034', '花垣县', '288', '0', '3', '');
INSERT INTO `ds_area` VALUES ('3035', '龙山县', '288', '0', '3', '');
INSERT INTO `ds_area` VALUES ('3036', '萝岗区', '289', '0', '3', '');
INSERT INTO `ds_area` VALUES ('3037', '南沙区', '289', '0', '3', '');
INSERT INTO `ds_area` VALUES ('3038', '从化市', '289', '0', '3', '');
INSERT INTO `ds_area` VALUES ('3039', '增城市', '289', '0', '3', '');
INSERT INTO `ds_area` VALUES ('3040', '天河区', '289', '0', '3', '');
INSERT INTO `ds_area` VALUES ('3041', '海珠区', '289', '0', '3', '');
INSERT INTO `ds_area` VALUES ('3042', '番禺区', '289', '0', '3', '');
INSERT INTO `ds_area` VALUES ('3043', '白云区', '289', '0', '3', '');
INSERT INTO `ds_area` VALUES ('3044', '花都区', '289', '0', '3', '');
INSERT INTO `ds_area` VALUES ('3045', '荔湾区', '289', '0', '3', '');
INSERT INTO `ds_area` VALUES ('3046', '越秀区', '289', '0', '3', '');
INSERT INTO `ds_area` VALUES ('3047', '黄埔区', '289', '0', '3', '');
INSERT INTO `ds_area` VALUES ('3048', '乐昌市', '290', '0', '3', '');
INSERT INTO `ds_area` VALUES ('3049', '乳源瑶族自治县', '290', '0', '3', '');
INSERT INTO `ds_area` VALUES ('3050', '仁化县', '290', '0', '3', '');
INSERT INTO `ds_area` VALUES ('3051', '南雄市', '290', '0', '3', '');
INSERT INTO `ds_area` VALUES ('3052', '始兴县', '290', '0', '3', '');
INSERT INTO `ds_area` VALUES ('3053', '新丰县', '290', '0', '3', '');
INSERT INTO `ds_area` VALUES ('3054', '曲江区', '290', '0', '3', '');
INSERT INTO `ds_area` VALUES ('3055', '武江区', '290', '0', '3', '');
INSERT INTO `ds_area` VALUES ('3056', '浈江区', '290', '0', '3', '');
INSERT INTO `ds_area` VALUES ('3057', '翁源县', '290', '0', '3', '');
INSERT INTO `ds_area` VALUES ('3058', '南山区', '291', '0', '3', '');
INSERT INTO `ds_area` VALUES ('3059', '宝安区', '291', '0', '3', '');
INSERT INTO `ds_area` VALUES ('3060', '盐田区', '291', '0', '3', '');
INSERT INTO `ds_area` VALUES ('3061', '福田区', '291', '0', '3', '');
INSERT INTO `ds_area` VALUES ('3062', '罗湖区', '291', '0', '3', '');
INSERT INTO `ds_area` VALUES ('3063', '龙岗区', '291', '0', '3', '');
INSERT INTO `ds_area` VALUES ('3064', '斗门区', '292', '0', '3', '');
INSERT INTO `ds_area` VALUES ('3065', '金湾区', '292', '0', '3', '');
INSERT INTO `ds_area` VALUES ('3066', '香洲区', '292', '0', '3', '');
INSERT INTO `ds_area` VALUES ('3067', '南澳县', '293', '0', '3', '');
INSERT INTO `ds_area` VALUES ('3068', '潮南区', '293', '0', '3', '');
INSERT INTO `ds_area` VALUES ('3069', '潮阳区', '293', '0', '3', '');
INSERT INTO `ds_area` VALUES ('3070', '澄海区', '293', '0', '3', '');
INSERT INTO `ds_area` VALUES ('3071', '濠江区', '293', '0', '3', '');
INSERT INTO `ds_area` VALUES ('3072', '金平区', '293', '0', '3', '');
INSERT INTO `ds_area` VALUES ('3073', '龙湖区', '293', '0', '3', '');
INSERT INTO `ds_area` VALUES ('3074', '三水区', '294', '0', '3', '');
INSERT INTO `ds_area` VALUES ('3075', '南海区', '294', '0', '3', '');
INSERT INTO `ds_area` VALUES ('3076', '禅城区', '294', '0', '3', '');
INSERT INTO `ds_area` VALUES ('3077', '顺德区', '294', '0', '3', '');
INSERT INTO `ds_area` VALUES ('3078', '高明区', '294', '0', '3', '');
INSERT INTO `ds_area` VALUES ('3079', '台山市', '295', '0', '3', '');
INSERT INTO `ds_area` VALUES ('3080', '开平市', '295', '0', '3', '');
INSERT INTO `ds_area` VALUES ('3081', '恩平市', '295', '0', '3', '');
INSERT INTO `ds_area` VALUES ('3082', '新会区', '295', '0', '3', '');
INSERT INTO `ds_area` VALUES ('3083', '江海区', '295', '0', '3', '');
INSERT INTO `ds_area` VALUES ('3084', '蓬江区', '295', '0', '3', '');
INSERT INTO `ds_area` VALUES ('3085', '鹤山市', '295', '0', '3', '');
INSERT INTO `ds_area` VALUES ('3086', '吴川市', '296', '0', '3', '');
INSERT INTO `ds_area` VALUES ('3087', '坡头区', '296', '0', '3', '');
INSERT INTO `ds_area` VALUES ('3088', '廉江市', '296', '0', '3', '');
INSERT INTO `ds_area` VALUES ('3089', '徐闻县', '296', '0', '3', '');
INSERT INTO `ds_area` VALUES ('3090', '赤坎区', '296', '0', '3', '');
INSERT INTO `ds_area` VALUES ('3091', '遂溪县', '296', '0', '3', '');
INSERT INTO `ds_area` VALUES ('3092', '雷州市', '296', '0', '3', '');
INSERT INTO `ds_area` VALUES ('3093', '霞山区', '296', '0', '3', '');
INSERT INTO `ds_area` VALUES ('3094', '麻章区', '296', '0', '3', '');
INSERT INTO `ds_area` VALUES ('3095', '信宜市', '297', '0', '3', '');
INSERT INTO `ds_area` VALUES ('3096', '化州市', '297', '0', '3', '');
INSERT INTO `ds_area` VALUES ('3097', '电白县', '297', '0', '3', '');
INSERT INTO `ds_area` VALUES ('3098', '茂南区', '297', '0', '3', '');
INSERT INTO `ds_area` VALUES ('3099', '茂港区', '297', '0', '3', '');
INSERT INTO `ds_area` VALUES ('3100', '高州市', '297', '0', '3', '');
INSERT INTO `ds_area` VALUES ('3101', '四会市', '298', '0', '3', '');
INSERT INTO `ds_area` VALUES ('3102', '封开县', '298', '0', '3', '');
INSERT INTO `ds_area` VALUES ('3103', '广宁县', '298', '0', '3', '');
INSERT INTO `ds_area` VALUES ('3104', '德庆县', '298', '0', '3', '');
INSERT INTO `ds_area` VALUES ('3105', '怀集县', '298', '0', '3', '');
INSERT INTO `ds_area` VALUES ('3106', '端州区', '298', '0', '3', '');
INSERT INTO `ds_area` VALUES ('3107', '高要市', '298', '0', '3', '');
INSERT INTO `ds_area` VALUES ('3108', '鼎湖区', '298', '0', '3', '');
INSERT INTO `ds_area` VALUES ('3109', '博罗县', '299', '0', '3', '');
INSERT INTO `ds_area` VALUES ('3110', '惠东县', '299', '0', '3', '');
INSERT INTO `ds_area` VALUES ('3111', '惠城区', '299', '0', '3', '');
INSERT INTO `ds_area` VALUES ('3112', '惠阳区', '299', '0', '3', '');
INSERT INTO `ds_area` VALUES ('3113', '龙门县', '299', '0', '3', '');
INSERT INTO `ds_area` VALUES ('3114', '丰顺县', '300', '0', '3', '');
INSERT INTO `ds_area` VALUES ('3115', '五华县', '300', '0', '3', '');
INSERT INTO `ds_area` VALUES ('3116', '兴宁市', '300', '0', '3', '');
INSERT INTO `ds_area` VALUES ('3117', '大埔县', '300', '0', '3', '');
INSERT INTO `ds_area` VALUES ('3118', '平远县', '300', '0', '3', '');
INSERT INTO `ds_area` VALUES ('3119', '梅县', '300', '0', '3', '');
INSERT INTO `ds_area` VALUES ('3120', '梅江区', '300', '0', '3', '');
INSERT INTO `ds_area` VALUES ('3121', '蕉岭县', '300', '0', '3', '');
INSERT INTO `ds_area` VALUES ('3122', '城区', '301', '0', '3', '');
INSERT INTO `ds_area` VALUES ('3123', '海丰县', '301', '0', '3', '');
INSERT INTO `ds_area` VALUES ('3124', '陆丰市', '301', '0', '3', '');
INSERT INTO `ds_area` VALUES ('3125', '陆河县', '301', '0', '3', '');
INSERT INTO `ds_area` VALUES ('3126', '东源县', '302', '0', '3', '');
INSERT INTO `ds_area` VALUES ('3127', '和平县', '302', '0', '3', '');
INSERT INTO `ds_area` VALUES ('3128', '源城区', '302', '0', '3', '');
INSERT INTO `ds_area` VALUES ('3129', '紫金县', '302', '0', '3', '');
INSERT INTO `ds_area` VALUES ('3130', '连平县', '302', '0', '3', '');
INSERT INTO `ds_area` VALUES ('3131', '龙川县', '302', '0', '3', '');
INSERT INTO `ds_area` VALUES ('3132', '江城区', '303', '0', '3', '');
INSERT INTO `ds_area` VALUES ('3133', '阳东县', '303', '0', '3', '');
INSERT INTO `ds_area` VALUES ('3134', '阳春市', '303', '0', '3', '');
INSERT INTO `ds_area` VALUES ('3135', '阳西县', '303', '0', '3', '');
INSERT INTO `ds_area` VALUES ('3136', '佛冈县', '304', '0', '3', '');
INSERT INTO `ds_area` VALUES ('3137', '清城区', '304', '0', '3', '');
INSERT INTO `ds_area` VALUES ('3138', '清新县', '304', '0', '3', '');
INSERT INTO `ds_area` VALUES ('3139', '英德市', '304', '0', '3', '');
INSERT INTO `ds_area` VALUES ('3140', '连南瑶族自治县', '304', '0', '3', '');
INSERT INTO `ds_area` VALUES ('3141', '连山壮族瑶族自治县', '304', '0', '3', '');
INSERT INTO `ds_area` VALUES ('3142', '连州市', '304', '0', '3', '');
INSERT INTO `ds_area` VALUES ('3143', '阳山县', '304', '0', '3', '');
INSERT INTO `ds_area` VALUES ('3144', '东莞市', '305', '0', '3', '');
INSERT INTO `ds_area` VALUES ('3145', '中山市', '306', '0', '3', '');
INSERT INTO `ds_area` VALUES ('3146', '湘桥区', '307', '0', '3', '');
INSERT INTO `ds_area` VALUES ('3147', '潮安县', '307', '0', '3', '');
INSERT INTO `ds_area` VALUES ('3148', '饶平县', '307', '0', '3', '');
INSERT INTO `ds_area` VALUES ('3149', '惠来县', '308', '0', '3', '');
INSERT INTO `ds_area` VALUES ('3150', '揭东县', '308', '0', '3', '');
INSERT INTO `ds_area` VALUES ('3151', '揭西县', '308', '0', '3', '');
INSERT INTO `ds_area` VALUES ('3152', '普宁市', '308', '0', '3', '');
INSERT INTO `ds_area` VALUES ('3153', '榕城区', '308', '0', '3', '');
INSERT INTO `ds_area` VALUES ('3154', '云城区', '309', '0', '3', '');
INSERT INTO `ds_area` VALUES ('3155', '云安县', '309', '0', '3', '');
INSERT INTO `ds_area` VALUES ('3156', '新兴县', '309', '0', '3', '');
INSERT INTO `ds_area` VALUES ('3157', '罗定市', '309', '0', '3', '');
INSERT INTO `ds_area` VALUES ('3158', '郁南县', '309', '0', '3', '');
INSERT INTO `ds_area` VALUES ('3159', '上林县', '310', '0', '3', '');
INSERT INTO `ds_area` VALUES ('3160', '兴宁区', '310', '0', '3', '');
INSERT INTO `ds_area` VALUES ('3161', '宾阳县', '310', '0', '3', '');
INSERT INTO `ds_area` VALUES ('3162', '横县', '310', '0', '3', '');
INSERT INTO `ds_area` VALUES ('3163', '武鸣县', '310', '0', '3', '');
INSERT INTO `ds_area` VALUES ('3164', '江南区', '310', '0', '3', '');
INSERT INTO `ds_area` VALUES ('3165', '良庆区', '310', '0', '3', '');
INSERT INTO `ds_area` VALUES ('3166', '西乡塘区', '310', '0', '3', '');
INSERT INTO `ds_area` VALUES ('3167', '邕宁区', '310', '0', '3', '');
INSERT INTO `ds_area` VALUES ('3168', '隆安县', '310', '0', '3', '');
INSERT INTO `ds_area` VALUES ('3169', '青秀区', '310', '0', '3', '');
INSERT INTO `ds_area` VALUES ('3170', '马山县', '310', '0', '3', '');
INSERT INTO `ds_area` VALUES ('3171', '三江侗族自治县', '311', '0', '3', '');
INSERT INTO `ds_area` VALUES ('3172', '城中区', '311', '0', '3', '');
INSERT INTO `ds_area` VALUES ('3173', '柳北区', '311', '0', '3', '');
INSERT INTO `ds_area` VALUES ('3174', '柳南区', '311', '0', '3', '');
INSERT INTO `ds_area` VALUES ('3175', '柳城县', '311', '0', '3', '');
INSERT INTO `ds_area` VALUES ('3176', '柳江县', '311', '0', '3', '');
INSERT INTO `ds_area` VALUES ('3177', '融安县', '311', '0', '3', '');
INSERT INTO `ds_area` VALUES ('3178', '融水苗族自治县', '311', '0', '3', '');
INSERT INTO `ds_area` VALUES ('3179', '鱼峰区', '311', '0', '3', '');
INSERT INTO `ds_area` VALUES ('3180', '鹿寨县', '311', '0', '3', '');
INSERT INTO `ds_area` VALUES ('3181', '七星区', '312', '0', '3', '');
INSERT INTO `ds_area` VALUES ('3182', '临桂县', '312', '0', '3', '');
INSERT INTO `ds_area` VALUES ('3183', '全州县', '312', '0', '3', '');
INSERT INTO `ds_area` VALUES ('3184', '兴安县', '312', '0', '3', '');
INSERT INTO `ds_area` VALUES ('3185', '叠彩区', '312', '0', '3', '');
INSERT INTO `ds_area` VALUES ('3186', '平乐县', '312', '0', '3', '');
INSERT INTO `ds_area` VALUES ('3187', '恭城瑶族自治县', '312', '0', '3', '');
INSERT INTO `ds_area` VALUES ('3188', '永福县', '312', '0', '3', '');
INSERT INTO `ds_area` VALUES ('3189', '灌阳县', '312', '0', '3', '');
INSERT INTO `ds_area` VALUES ('3190', '灵川县', '312', '0', '3', '');
INSERT INTO `ds_area` VALUES ('3191', '秀峰区', '312', '0', '3', '');
INSERT INTO `ds_area` VALUES ('3192', '荔浦县', '312', '0', '3', '');
INSERT INTO `ds_area` VALUES ('3193', '象山区', '312', '0', '3', '');
INSERT INTO `ds_area` VALUES ('3194', '资源县', '312', '0', '3', '');
INSERT INTO `ds_area` VALUES ('3195', '阳朔县', '312', '0', '3', '');
INSERT INTO `ds_area` VALUES ('3196', '雁山区', '312', '0', '3', '');
INSERT INTO `ds_area` VALUES ('3197', '龙胜各族自治县', '312', '0', '3', '');
INSERT INTO `ds_area` VALUES ('3198', '万秀区', '313', '0', '3', '');
INSERT INTO `ds_area` VALUES ('3199', '岑溪市', '313', '0', '3', '');
INSERT INTO `ds_area` VALUES ('3200', '苍梧县', '313', '0', '3', '');
INSERT INTO `ds_area` VALUES ('3201', '蒙山县', '313', '0', '3', '');
INSERT INTO `ds_area` VALUES ('3202', '藤县', '313', '0', '3', '');
INSERT INTO `ds_area` VALUES ('3203', '蝶山区', '313', '0', '3', '');
INSERT INTO `ds_area` VALUES ('3204', '长洲区', '313', '0', '3', '');
INSERT INTO `ds_area` VALUES ('3205', '合浦县', '314', '0', '3', '');
INSERT INTO `ds_area` VALUES ('3206', '海城区', '314', '0', '3', '');
INSERT INTO `ds_area` VALUES ('3207', '铁山港区', '314', '0', '3', '');
INSERT INTO `ds_area` VALUES ('3208', '银海区', '314', '0', '3', '');
INSERT INTO `ds_area` VALUES ('3209', '上思县', '315', '0', '3', '');
INSERT INTO `ds_area` VALUES ('3210', '东兴市', '315', '0', '3', '');
INSERT INTO `ds_area` VALUES ('3211', '港口区', '315', '0', '3', '');
INSERT INTO `ds_area` VALUES ('3212', '防城区', '315', '0', '3', '');
INSERT INTO `ds_area` VALUES ('3213', '浦北县', '316', '0', '3', '');
INSERT INTO `ds_area` VALUES ('3214', '灵山县', '316', '0', '3', '');
INSERT INTO `ds_area` VALUES ('3215', '钦北区', '316', '0', '3', '');
INSERT INTO `ds_area` VALUES ('3216', '钦南区', '316', '0', '3', '');
INSERT INTO `ds_area` VALUES ('3217', '平南县', '317', '0', '3', '');
INSERT INTO `ds_area` VALUES ('3218', '桂平市', '317', '0', '3', '');
INSERT INTO `ds_area` VALUES ('3219', '港北区', '317', '0', '3', '');
INSERT INTO `ds_area` VALUES ('3220', '港南区', '317', '0', '3', '');
INSERT INTO `ds_area` VALUES ('3221', '覃塘区', '317', '0', '3', '');
INSERT INTO `ds_area` VALUES ('3222', '兴业县', '318', '0', '3', '');
INSERT INTO `ds_area` VALUES ('3223', '北流市', '318', '0', '3', '');
INSERT INTO `ds_area` VALUES ('3224', '博白县', '318', '0', '3', '');
INSERT INTO `ds_area` VALUES ('3225', '容县', '318', '0', '3', '');
INSERT INTO `ds_area` VALUES ('3226', '玉州区', '318', '0', '3', '');
INSERT INTO `ds_area` VALUES ('3227', '陆川县', '318', '0', '3', '');
INSERT INTO `ds_area` VALUES ('3228', '乐业县', '319', '0', '3', '');
INSERT INTO `ds_area` VALUES ('3229', '凌云县', '319', '0', '3', '');
INSERT INTO `ds_area` VALUES ('3230', '右江区', '319', '0', '3', '');
INSERT INTO `ds_area` VALUES ('3231', '平果县', '319', '0', '3', '');
INSERT INTO `ds_area` VALUES ('3232', '德保县', '319', '0', '3', '');
INSERT INTO `ds_area` VALUES ('3233', '田东县', '319', '0', '3', '');
INSERT INTO `ds_area` VALUES ('3234', '田林县', '319', '0', '3', '');
INSERT INTO `ds_area` VALUES ('3235', '田阳县', '319', '0', '3', '');
INSERT INTO `ds_area` VALUES ('3236', '西林县', '319', '0', '3', '');
INSERT INTO `ds_area` VALUES ('3237', '那坡县', '319', '0', '3', '');
INSERT INTO `ds_area` VALUES ('3238', '隆林各族自治县', '319', '0', '3', '');
INSERT INTO `ds_area` VALUES ('3239', '靖西县', '319', '0', '3', '');
INSERT INTO `ds_area` VALUES ('3240', '八步区', '320', '0', '3', '');
INSERT INTO `ds_area` VALUES ('3241', '富川瑶族自治县', '320', '0', '3', '');
INSERT INTO `ds_area` VALUES ('3242', '昭平县', '320', '0', '3', '');
INSERT INTO `ds_area` VALUES ('3243', '钟山县', '320', '0', '3', '');
INSERT INTO `ds_area` VALUES ('3244', '东兰县', '321', '0', '3', '');
INSERT INTO `ds_area` VALUES ('3245', '凤山县', '321', '0', '3', '');
INSERT INTO `ds_area` VALUES ('3246', '南丹县', '321', '0', '3', '');
INSERT INTO `ds_area` VALUES ('3247', '大化瑶族自治县', '321', '0', '3', '');
INSERT INTO `ds_area` VALUES ('3248', '天峨县', '321', '0', '3', '');
INSERT INTO `ds_area` VALUES ('3249', '宜州市', '321', '0', '3', '');
INSERT INTO `ds_area` VALUES ('3250', '巴马瑶族自治县', '321', '0', '3', '');
INSERT INTO `ds_area` VALUES ('3251', '环江毛南族自治县', '321', '0', '3', '');
INSERT INTO `ds_area` VALUES ('3252', '罗城仫佬族自治县', '321', '0', '3', '');
INSERT INTO `ds_area` VALUES ('3253', '都安瑶族自治县', '321', '0', '3', '');
INSERT INTO `ds_area` VALUES ('3254', '金城江区', '321', '0', '3', '');
INSERT INTO `ds_area` VALUES ('3255', '兴宾区', '322', '0', '3', '');
INSERT INTO `ds_area` VALUES ('3256', '合山市', '322', '0', '3', '');
INSERT INTO `ds_area` VALUES ('3257', '忻城县', '322', '0', '3', '');
INSERT INTO `ds_area` VALUES ('3258', '武宣县', '322', '0', '3', '');
INSERT INTO `ds_area` VALUES ('3259', '象州县', '322', '0', '3', '');
INSERT INTO `ds_area` VALUES ('3260', '金秀瑶族自治县', '322', '0', '3', '');
INSERT INTO `ds_area` VALUES ('3261', '凭祥市', '323', '0', '3', '');
INSERT INTO `ds_area` VALUES ('3262', '大新县', '323', '0', '3', '');
INSERT INTO `ds_area` VALUES ('3263', '天等县', '323', '0', '3', '');
INSERT INTO `ds_area` VALUES ('3264', '宁明县', '323', '0', '3', '');
INSERT INTO `ds_area` VALUES ('3265', '扶绥县', '323', '0', '3', '');
INSERT INTO `ds_area` VALUES ('3266', '江州区', '323', '0', '3', '');
INSERT INTO `ds_area` VALUES ('3267', '龙州县', '323', '0', '3', '');
INSERT INTO `ds_area` VALUES ('3268', '琼山区', '324', '0', '3', '');
INSERT INTO `ds_area` VALUES ('3269', '秀英区', '324', '0', '3', '');
INSERT INTO `ds_area` VALUES ('3270', '美兰区', '324', '0', '3', '');
INSERT INTO `ds_area` VALUES ('3271', '龙华区', '324', '0', '3', '');
INSERT INTO `ds_area` VALUES ('3272', '三亚市', '325', '0', '3', '');
INSERT INTO `ds_area` VALUES ('3273', '五指山市', '326', '0', '3', '');
INSERT INTO `ds_area` VALUES ('3274', '琼海市', '327', '0', '3', '');
INSERT INTO `ds_area` VALUES ('3275', '儋州市', '328', '0', '3', '');
INSERT INTO `ds_area` VALUES ('3276', '文昌市', '329', '0', '3', '');
INSERT INTO `ds_area` VALUES ('3277', '万宁市', '330', '0', '3', '');
INSERT INTO `ds_area` VALUES ('3278', '东方市', '331', '0', '3', '');
INSERT INTO `ds_area` VALUES ('3279', '定安县', '332', '0', '3', '');
INSERT INTO `ds_area` VALUES ('3280', '屯昌县', '333', '0', '3', '');
INSERT INTO `ds_area` VALUES ('3281', '澄迈县', '334', '0', '3', '');
INSERT INTO `ds_area` VALUES ('3282', '临高县', '335', '0', '3', '');
INSERT INTO `ds_area` VALUES ('3283', '白沙黎族自治县', '336', '0', '3', '');
INSERT INTO `ds_area` VALUES ('3284', '昌江黎族自治县', '337', '0', '3', '');
INSERT INTO `ds_area` VALUES ('3285', '乐东黎族自治县', '338', '0', '3', '');
INSERT INTO `ds_area` VALUES ('3286', '陵水黎族自治县', '339', '0', '3', '');
INSERT INTO `ds_area` VALUES ('3287', '保亭黎族苗族自治县', '340', '0', '3', '');
INSERT INTO `ds_area` VALUES ('3288', '琼中黎族苗族自治县', '341', '0', '3', '');
INSERT INTO `ds_area` VALUES ('4209', '双流县', '385', '0', '3', '');
INSERT INTO `ds_area` VALUES ('4210', '大邑县', '385', '0', '3', '');
INSERT INTO `ds_area` VALUES ('4211', '崇州市', '385', '0', '3', '');
INSERT INTO `ds_area` VALUES ('4212', '彭州市', '385', '0', '3', '');
INSERT INTO `ds_area` VALUES ('4213', '成华区', '385', '0', '3', '');
INSERT INTO `ds_area` VALUES ('4214', '新津县', '385', '0', '3', '');
INSERT INTO `ds_area` VALUES ('4215', '新都区', '385', '0', '3', '');
INSERT INTO `ds_area` VALUES ('4216', '武侯区', '385', '0', '3', '');
INSERT INTO `ds_area` VALUES ('4217', '温江区', '385', '0', '3', '');
INSERT INTO `ds_area` VALUES ('4218', '蒲江县', '385', '0', '3', '');
INSERT INTO `ds_area` VALUES ('4219', '邛崃市', '385', '0', '3', '');
INSERT INTO `ds_area` VALUES ('4220', '郫县', '385', '0', '3', '');
INSERT INTO `ds_area` VALUES ('4221', '都江堰市', '385', '0', '3', '');
INSERT INTO `ds_area` VALUES ('4222', '金堂县', '385', '0', '3', '');
INSERT INTO `ds_area` VALUES ('4223', '金牛区', '385', '0', '3', '');
INSERT INTO `ds_area` VALUES ('4224', '锦江区', '385', '0', '3', '');
INSERT INTO `ds_area` VALUES ('4225', '青白江区', '385', '0', '3', '');
INSERT INTO `ds_area` VALUES ('4226', '青羊区', '385', '0', '3', '');
INSERT INTO `ds_area` VALUES ('4227', '龙泉驿区', '385', '0', '3', '');
INSERT INTO `ds_area` VALUES ('4228', '大安区', '386', '0', '3', '');
INSERT INTO `ds_area` VALUES ('4229', '富顺县', '386', '0', '3', '');
INSERT INTO `ds_area` VALUES ('4230', '沿滩区', '386', '0', '3', '');
INSERT INTO `ds_area` VALUES ('4231', '自流井区', '386', '0', '3', '');
INSERT INTO `ds_area` VALUES ('4232', '荣县', '386', '0', '3', '');
INSERT INTO `ds_area` VALUES ('4233', '贡井区', '386', '0', '3', '');
INSERT INTO `ds_area` VALUES ('4234', '东区', '387', '0', '3', '');
INSERT INTO `ds_area` VALUES ('4235', '仁和区', '387', '0', '3', '');
INSERT INTO `ds_area` VALUES ('4236', '盐边县', '387', '0', '3', '');
INSERT INTO `ds_area` VALUES ('4237', '米易县', '387', '0', '3', '');
INSERT INTO `ds_area` VALUES ('4238', '西区', '387', '0', '3', '');
INSERT INTO `ds_area` VALUES ('4239', '叙永县', '388', '0', '3', '');
INSERT INTO `ds_area` VALUES ('4240', '古蔺县', '388', '0', '3', '');
INSERT INTO `ds_area` VALUES ('4241', '合江县', '388', '0', '3', '');
INSERT INTO `ds_area` VALUES ('4242', '江阳区', '388', '0', '3', '');
INSERT INTO `ds_area` VALUES ('4243', '泸县', '388', '0', '3', '');
INSERT INTO `ds_area` VALUES ('4244', '纳溪区', '388', '0', '3', '');
INSERT INTO `ds_area` VALUES ('4245', '龙马潭区', '388', '0', '3', '');
INSERT INTO `ds_area` VALUES ('4246', '中江县', '389', '0', '3', '');
INSERT INTO `ds_area` VALUES ('4247', '什邡市', '389', '0', '3', '');
INSERT INTO `ds_area` VALUES ('4248', '广汉市', '389', '0', '3', '');
INSERT INTO `ds_area` VALUES ('4249', '旌阳区', '389', '0', '3', '');
INSERT INTO `ds_area` VALUES ('4250', '绵竹市', '389', '0', '3', '');
INSERT INTO `ds_area` VALUES ('4251', '罗江县', '389', '0', '3', '');
INSERT INTO `ds_area` VALUES ('4252', '三台县', '390', '0', '3', '');
INSERT INTO `ds_area` VALUES ('4253', '北川羌族自治县', '390', '0', '3', '');
INSERT INTO `ds_area` VALUES ('4254', '安县', '390', '0', '3', '');
INSERT INTO `ds_area` VALUES ('4255', '平武县', '390', '0', '3', '');
INSERT INTO `ds_area` VALUES ('4256', '梓潼县', '390', '0', '3', '');
INSERT INTO `ds_area` VALUES ('4257', '江油市', '390', '0', '3', '');
INSERT INTO `ds_area` VALUES ('4258', '涪城区', '390', '0', '3', '');
INSERT INTO `ds_area` VALUES ('4259', '游仙区', '390', '0', '3', '');
INSERT INTO `ds_area` VALUES ('4260', '盐亭县', '390', '0', '3', '');
INSERT INTO `ds_area` VALUES ('4261', '元坝区', '391', '0', '3', '');
INSERT INTO `ds_area` VALUES ('4262', '利州区', '391', '0', '3', '');
INSERT INTO `ds_area` VALUES ('4263', '剑阁县', '391', '0', '3', '');
INSERT INTO `ds_area` VALUES ('4264', '旺苍县', '391', '0', '3', '');
INSERT INTO `ds_area` VALUES ('4265', '朝天区', '391', '0', '3', '');
INSERT INTO `ds_area` VALUES ('4266', '苍溪县', '391', '0', '3', '');
INSERT INTO `ds_area` VALUES ('4267', '青川县', '391', '0', '3', '');
INSERT INTO `ds_area` VALUES ('4268', '大英县', '392', '0', '3', '');
INSERT INTO `ds_area` VALUES ('4269', '安居区', '392', '0', '3', '');
INSERT INTO `ds_area` VALUES ('4270', '射洪县', '392', '0', '3', '');
INSERT INTO `ds_area` VALUES ('4271', '船山区', '392', '0', '3', '');
INSERT INTO `ds_area` VALUES ('4272', '蓬溪县', '392', '0', '3', '');
INSERT INTO `ds_area` VALUES ('4273', '东兴区', '393', '0', '3', '');
INSERT INTO `ds_area` VALUES ('4274', '威远县', '393', '0', '3', '');
INSERT INTO `ds_area` VALUES ('4275', '市中区', '393', '0', '3', '');
INSERT INTO `ds_area` VALUES ('4276', '资中县', '393', '0', '3', '');
INSERT INTO `ds_area` VALUES ('4277', '隆昌县', '393', '0', '3', '');
INSERT INTO `ds_area` VALUES ('4278', '五通桥区', '394', '0', '3', '');
INSERT INTO `ds_area` VALUES ('4279', '井研县', '394', '0', '3', '');
INSERT INTO `ds_area` VALUES ('4280', '夹江县', '394', '0', '3', '');
INSERT INTO `ds_area` VALUES ('4281', '峨眉山市', '394', '0', '3', '');
INSERT INTO `ds_area` VALUES ('4282', '峨边彝族自治县', '394', '0', '3', '');
INSERT INTO `ds_area` VALUES ('4283', '市中区', '394', '0', '3', '');
INSERT INTO `ds_area` VALUES ('4284', '沐川县', '394', '0', '3', '');
INSERT INTO `ds_area` VALUES ('4285', '沙湾区', '394', '0', '3', '');
INSERT INTO `ds_area` VALUES ('4286', '犍为县', '394', '0', '3', '');
INSERT INTO `ds_area` VALUES ('4287', '金口河区', '394', '0', '3', '');
INSERT INTO `ds_area` VALUES ('4288', '马边彝族自治县', '394', '0', '3', '');
INSERT INTO `ds_area` VALUES ('4289', '仪陇县', '395', '0', '3', '');
INSERT INTO `ds_area` VALUES ('4290', '南充市嘉陵区', '395', '0', '3', '');
INSERT INTO `ds_area` VALUES ('4291', '南部县', '395', '0', '3', '');
INSERT INTO `ds_area` VALUES ('4292', '嘉陵区', '395', '0', '3', '');
INSERT INTO `ds_area` VALUES ('4293', '营山县', '395', '0', '3', '');
INSERT INTO `ds_area` VALUES ('4294', '蓬安县', '395', '0', '3', '');
INSERT INTO `ds_area` VALUES ('4295', '西充县', '395', '0', '3', '');
INSERT INTO `ds_area` VALUES ('4296', '阆中市', '395', '0', '3', '');
INSERT INTO `ds_area` VALUES ('4297', '顺庆区', '395', '0', '3', '');
INSERT INTO `ds_area` VALUES ('4298', '高坪区', '395', '0', '3', '');
INSERT INTO `ds_area` VALUES ('4299', '东坡区', '396', '0', '3', '');
INSERT INTO `ds_area` VALUES ('4300', '丹棱县', '396', '0', '3', '');
INSERT INTO `ds_area` VALUES ('4301', '仁寿县', '396', '0', '3', '');
INSERT INTO `ds_area` VALUES ('4302', '彭山县', '396', '0', '3', '');
INSERT INTO `ds_area` VALUES ('4303', '洪雅县', '396', '0', '3', '');
INSERT INTO `ds_area` VALUES ('4304', '青神县', '396', '0', '3', '');
INSERT INTO `ds_area` VALUES ('4305', '兴文县', '397', '0', '3', '');
INSERT INTO `ds_area` VALUES ('4306', '南溪县', '397', '0', '3', '');
INSERT INTO `ds_area` VALUES ('4307', '宜宾县', '397', '0', '3', '');
INSERT INTO `ds_area` VALUES ('4308', '屏山县', '397', '0', '3', '');
INSERT INTO `ds_area` VALUES ('4309', '江安县', '397', '0', '3', '');
INSERT INTO `ds_area` VALUES ('4310', '珙县', '397', '0', '3', '');
INSERT INTO `ds_area` VALUES ('4311', '筠连县', '397', '0', '3', '');
INSERT INTO `ds_area` VALUES ('4312', '翠屏区', '397', '0', '3', '');
INSERT INTO `ds_area` VALUES ('4313', '长宁县', '397', '0', '3', '');
INSERT INTO `ds_area` VALUES ('4314', '高县', '397', '0', '3', '');
INSERT INTO `ds_area` VALUES ('4315', '华蓥市', '398', '0', '3', '');
INSERT INTO `ds_area` VALUES ('4316', '岳池县', '398', '0', '3', '');
INSERT INTO `ds_area` VALUES ('4317', '广安区', '398', '0', '3', '');
INSERT INTO `ds_area` VALUES ('4318', '武胜县', '398', '0', '3', '');
INSERT INTO `ds_area` VALUES ('4319', '邻水县', '398', '0', '3', '');
INSERT INTO `ds_area` VALUES ('4320', '万源市', '399', '0', '3', '');
INSERT INTO `ds_area` VALUES ('4321', '大竹县', '399', '0', '3', '');
INSERT INTO `ds_area` VALUES ('4322', '宣汉县', '399', '0', '3', '');
INSERT INTO `ds_area` VALUES ('4323', '开江县', '399', '0', '3', '');
INSERT INTO `ds_area` VALUES ('4324', '渠县', '399', '0', '3', '');
INSERT INTO `ds_area` VALUES ('4325', '达县', '399', '0', '3', '');
INSERT INTO `ds_area` VALUES ('4326', '通川区', '399', '0', '3', '');
INSERT INTO `ds_area` VALUES ('4327', '名山县', '400', '0', '3', '');
INSERT INTO `ds_area` VALUES ('4328', '天全县', '400', '0', '3', '');
INSERT INTO `ds_area` VALUES ('4329', '宝兴县', '400', '0', '3', '');
INSERT INTO `ds_area` VALUES ('4330', '汉源县', '400', '0', '3', '');
INSERT INTO `ds_area` VALUES ('4331', '石棉县', '400', '0', '3', '');
INSERT INTO `ds_area` VALUES ('4332', '芦山县', '400', '0', '3', '');
INSERT INTO `ds_area` VALUES ('4333', '荥经县', '400', '0', '3', '');
INSERT INTO `ds_area` VALUES ('4334', '雨城区', '400', '0', '3', '');
INSERT INTO `ds_area` VALUES ('4335', '南江县', '401', '0', '3', '');
INSERT INTO `ds_area` VALUES ('4336', '巴州区', '401', '0', '3', '');
INSERT INTO `ds_area` VALUES ('4337', '平昌县', '401', '0', '3', '');
INSERT INTO `ds_area` VALUES ('4338', '通江县', '401', '0', '3', '');
INSERT INTO `ds_area` VALUES ('4339', '乐至县', '402', '0', '3', '');
INSERT INTO `ds_area` VALUES ('4340', '安岳县', '402', '0', '3', '');
INSERT INTO `ds_area` VALUES ('4341', '简阳市', '402', '0', '3', '');
INSERT INTO `ds_area` VALUES ('4342', '雁江区', '402', '0', '3', '');
INSERT INTO `ds_area` VALUES ('4343', '九寨沟县', '403', '0', '3', '');
INSERT INTO `ds_area` VALUES ('4344', '壤塘县', '403', '0', '3', '');
INSERT INTO `ds_area` VALUES ('4345', '小金县', '403', '0', '3', '');
INSERT INTO `ds_area` VALUES ('4346', '松潘县', '403', '0', '3', '');
INSERT INTO `ds_area` VALUES ('4347', '汶川县', '403', '0', '3', '');
INSERT INTO `ds_area` VALUES ('4348', '理县', '403', '0', '3', '');
INSERT INTO `ds_area` VALUES ('4349', '红原县', '403', '0', '3', '');
INSERT INTO `ds_area` VALUES ('4350', '若尔盖县', '403', '0', '3', '');
INSERT INTO `ds_area` VALUES ('4351', '茂县', '403', '0', '3', '');
INSERT INTO `ds_area` VALUES ('4352', '金川县', '403', '0', '3', '');
INSERT INTO `ds_area` VALUES ('4353', '阿坝县', '403', '0', '3', '');
INSERT INTO `ds_area` VALUES ('4354', '马尔康县', '403', '0', '3', '');
INSERT INTO `ds_area` VALUES ('4355', '黑水县', '403', '0', '3', '');
INSERT INTO `ds_area` VALUES ('4356', '丹巴县', '404', '0', '3', '');
INSERT INTO `ds_area` VALUES ('4357', '乡城县', '404', '0', '3', '');
INSERT INTO `ds_area` VALUES ('4358', '巴塘县', '404', '0', '3', '');
INSERT INTO `ds_area` VALUES ('4359', '康定县', '404', '0', '3', '');
INSERT INTO `ds_area` VALUES ('4360', '得荣县', '404', '0', '3', '');
INSERT INTO `ds_area` VALUES ('4361', '德格县', '404', '0', '3', '');
INSERT INTO `ds_area` VALUES ('4362', '新龙县', '404', '0', '3', '');
INSERT INTO `ds_area` VALUES ('4363', '泸定县', '404', '0', '3', '');
INSERT INTO `ds_area` VALUES ('4364', '炉霍县', '404', '0', '3', '');
INSERT INTO `ds_area` VALUES ('4365', '理塘县', '404', '0', '3', '');
INSERT INTO `ds_area` VALUES ('4366', '甘孜县', '404', '0', '3', '');
INSERT INTO `ds_area` VALUES ('4367', '白玉县', '404', '0', '3', '');
INSERT INTO `ds_area` VALUES ('4368', '石渠县', '404', '0', '3', '');
INSERT INTO `ds_area` VALUES ('4369', '稻城县', '404', '0', '3', '');
INSERT INTO `ds_area` VALUES ('4370', '色达县', '404', '0', '3', '');
INSERT INTO `ds_area` VALUES ('4371', '道孚县', '404', '0', '3', '');
INSERT INTO `ds_area` VALUES ('4372', '雅江县', '404', '0', '3', '');
INSERT INTO `ds_area` VALUES ('4373', '会东县', '405', '0', '3', '');
INSERT INTO `ds_area` VALUES ('4374', '会理县', '405', '0', '3', '');
INSERT INTO `ds_area` VALUES ('4375', '冕宁县', '405', '0', '3', '');
INSERT INTO `ds_area` VALUES ('4376', '喜德县', '405', '0', '3', '');
INSERT INTO `ds_area` VALUES ('4377', '宁南县', '405', '0', '3', '');
INSERT INTO `ds_area` VALUES ('4378', '布拖县', '405', '0', '3', '');
INSERT INTO `ds_area` VALUES ('4379', '德昌县', '405', '0', '3', '');
INSERT INTO `ds_area` VALUES ('4380', '昭觉县', '405', '0', '3', '');
INSERT INTO `ds_area` VALUES ('4381', '普格县', '405', '0', '3', '');
INSERT INTO `ds_area` VALUES ('4382', '木里藏族自治县', '405', '0', '3', '');
INSERT INTO `ds_area` VALUES ('4383', '甘洛县', '405', '0', '3', '');
INSERT INTO `ds_area` VALUES ('4384', '盐源县', '405', '0', '3', '');
INSERT INTO `ds_area` VALUES ('4385', '美姑县', '405', '0', '3', '');
INSERT INTO `ds_area` VALUES ('4386', '西昌', '405', '0', '3', '');
INSERT INTO `ds_area` VALUES ('4387', '越西县', '405', '0', '3', '');
INSERT INTO `ds_area` VALUES ('4388', '金阳县', '405', '0', '3', '');
INSERT INTO `ds_area` VALUES ('4389', '雷波县', '405', '0', '3', '');
INSERT INTO `ds_area` VALUES ('4390', '乌当区', '406', '0', '3', '');
INSERT INTO `ds_area` VALUES ('4391', '云岩区', '406', '0', '3', '');
INSERT INTO `ds_area` VALUES ('4392', '修文县', '406', '0', '3', '');
INSERT INTO `ds_area` VALUES ('4393', '南明区', '406', '0', '3', '');
INSERT INTO `ds_area` VALUES ('4394', '小河区', '406', '0', '3', '');
INSERT INTO `ds_area` VALUES ('4395', '开阳县', '406', '0', '3', '');
INSERT INTO `ds_area` VALUES ('4396', '息烽县', '406', '0', '3', '');
INSERT INTO `ds_area` VALUES ('4397', '清镇市', '406', '0', '3', '');
INSERT INTO `ds_area` VALUES ('4398', '白云区', '406', '0', '3', '');
INSERT INTO `ds_area` VALUES ('4399', '花溪区', '406', '0', '3', '');
INSERT INTO `ds_area` VALUES ('4400', '六枝特区', '407', '0', '3', '');
INSERT INTO `ds_area` VALUES ('4401', '水城县', '407', '0', '3', '');
INSERT INTO `ds_area` VALUES ('4402', '盘县', '407', '0', '3', '');
INSERT INTO `ds_area` VALUES ('4403', '钟山区', '407', '0', '3', '');
INSERT INTO `ds_area` VALUES ('4404', '习水县', '408', '0', '3', '');
INSERT INTO `ds_area` VALUES ('4405', '仁怀市', '408', '0', '3', '');
INSERT INTO `ds_area` VALUES ('4406', '余庆县', '408', '0', '3', '');
INSERT INTO `ds_area` VALUES ('4407', '凤冈县', '408', '0', '3', '');
INSERT INTO `ds_area` VALUES ('4408', '务川仡佬族苗族自治县', '408', '0', '3', '');
INSERT INTO `ds_area` VALUES ('4409', '桐梓县', '408', '0', '3', '');
INSERT INTO `ds_area` VALUES ('4410', '正安县', '408', '0', '3', '');
INSERT INTO `ds_area` VALUES ('4411', '汇川区', '408', '0', '3', '');
INSERT INTO `ds_area` VALUES ('4412', '湄潭县', '408', '0', '3', '');
INSERT INTO `ds_area` VALUES ('4413', '红花岗区', '408', '0', '3', '');
INSERT INTO `ds_area` VALUES ('4414', '绥阳县', '408', '0', '3', '');
INSERT INTO `ds_area` VALUES ('4415', '赤水市', '408', '0', '3', '');
INSERT INTO `ds_area` VALUES ('4416', '道真仡佬族苗族自治县', '408', '0', '3', '');
INSERT INTO `ds_area` VALUES ('4417', '遵义县', '408', '0', '3', '');
INSERT INTO `ds_area` VALUES ('4418', '关岭布依族苗族自治县', '409', '0', '3', '');
INSERT INTO `ds_area` VALUES ('4419', '平坝县', '409', '0', '3', '');
INSERT INTO `ds_area` VALUES ('4420', '普定县', '409', '0', '3', '');
INSERT INTO `ds_area` VALUES ('4421', '紫云苗族布依族自治县', '409', '0', '3', '');
INSERT INTO `ds_area` VALUES ('4422', '西秀区', '409', '0', '3', '');
INSERT INTO `ds_area` VALUES ('4423', '镇宁布依族苗族自治县', '409', '0', '3', '');
INSERT INTO `ds_area` VALUES ('4424', '万山特区', '410', '0', '3', '');
INSERT INTO `ds_area` VALUES ('4425', '印江土家族苗族自治县', '410', '0', '3', '');
INSERT INTO `ds_area` VALUES ('4426', '德江县', '410', '0', '3', '');
INSERT INTO `ds_area` VALUES ('4427', '思南县', '410', '0', '3', '');
INSERT INTO `ds_area` VALUES ('4428', '松桃苗族自治县', '410', '0', '3', '');
INSERT INTO `ds_area` VALUES ('4429', '江口县', '410', '0', '3', '');
INSERT INTO `ds_area` VALUES ('4430', '沿河土家族自治县', '410', '0', '3', '');
INSERT INTO `ds_area` VALUES ('4431', '玉屏侗族自治县', '410', '0', '3', '');
INSERT INTO `ds_area` VALUES ('4432', '石阡县', '410', '0', '3', '');
INSERT INTO `ds_area` VALUES ('4433', '铜仁市', '410', '0', '3', '');
INSERT INTO `ds_area` VALUES ('4434', '兴义市', '411', '0', '3', '');
INSERT INTO `ds_area` VALUES ('4435', '兴仁县', '411', '0', '3', '');
INSERT INTO `ds_area` VALUES ('4436', '册亨县', '411', '0', '3', '');
INSERT INTO `ds_area` VALUES ('4437', '安龙县', '411', '0', '3', '');
INSERT INTO `ds_area` VALUES ('4438', '普安县', '411', '0', '3', '');
INSERT INTO `ds_area` VALUES ('4439', '晴隆县', '411', '0', '3', '');
INSERT INTO `ds_area` VALUES ('4440', '望谟县', '411', '0', '3', '');
INSERT INTO `ds_area` VALUES ('4441', '贞丰县', '411', '0', '3', '');
INSERT INTO `ds_area` VALUES ('4442', '大方县', '412', '0', '3', '');
INSERT INTO `ds_area` VALUES ('4443', '威宁彝族回族苗族自治县', '412', '0', '3', '');
INSERT INTO `ds_area` VALUES ('4444', '毕节市', '412', '0', '3', '');
INSERT INTO `ds_area` VALUES ('4445', '纳雍县', '412', '0', '3', '');
INSERT INTO `ds_area` VALUES ('4446', '织金县', '412', '0', '3', '');
INSERT INTO `ds_area` VALUES ('4447', '赫章县', '412', '0', '3', '');
INSERT INTO `ds_area` VALUES ('4448', '金沙县', '412', '0', '3', '');
INSERT INTO `ds_area` VALUES ('4449', '黔西县', '412', '0', '3', '');
INSERT INTO `ds_area` VALUES ('4450', '三穗县', '413', '0', '3', '');
INSERT INTO `ds_area` VALUES ('4451', '丹寨县', '413', '0', '3', '');
INSERT INTO `ds_area` VALUES ('4452', '从江县', '413', '0', '3', '');
INSERT INTO `ds_area` VALUES ('4453', '凯里市', '413', '0', '3', '');
INSERT INTO `ds_area` VALUES ('4454', '剑河县', '413', '0', '3', '');
INSERT INTO `ds_area` VALUES ('4455', '台江县', '413', '0', '3', '');
INSERT INTO `ds_area` VALUES ('4456', '天柱县', '413', '0', '3', '');
INSERT INTO `ds_area` VALUES ('4457', '岑巩县', '413', '0', '3', '');
INSERT INTO `ds_area` VALUES ('4458', '施秉县', '413', '0', '3', '');
INSERT INTO `ds_area` VALUES ('4459', '榕江县', '413', '0', '3', '');
INSERT INTO `ds_area` VALUES ('4460', '锦屏县', '413', '0', '3', '');
INSERT INTO `ds_area` VALUES ('4461', '镇远县', '413', '0', '3', '');
INSERT INTO `ds_area` VALUES ('4462', '雷山县', '413', '0', '3', '');
INSERT INTO `ds_area` VALUES ('4463', '麻江县', '413', '0', '3', '');
INSERT INTO `ds_area` VALUES ('4464', '黄平县', '413', '0', '3', '');
INSERT INTO `ds_area` VALUES ('4465', '黎平县', '413', '0', '3', '');
INSERT INTO `ds_area` VALUES ('4466', '三都水族自治县', '414', '0', '3', '');
INSERT INTO `ds_area` VALUES ('4467', '平塘县', '414', '0', '3', '');
INSERT INTO `ds_area` VALUES ('4468', '惠水县', '414', '0', '3', '');
INSERT INTO `ds_area` VALUES ('4469', '独山县', '414', '0', '3', '');
INSERT INTO `ds_area` VALUES ('4470', '瓮安县', '414', '0', '3', '');
INSERT INTO `ds_area` VALUES ('4471', '福泉市', '414', '0', '3', '');
INSERT INTO `ds_area` VALUES ('4472', '罗甸县', '414', '0', '3', '');
INSERT INTO `ds_area` VALUES ('4473', '荔波县', '414', '0', '3', '');
INSERT INTO `ds_area` VALUES ('4474', '贵定县', '414', '0', '3', '');
INSERT INTO `ds_area` VALUES ('4475', '都匀市', '414', '0', '3', '');
INSERT INTO `ds_area` VALUES ('4476', '长顺县', '414', '0', '3', '');
INSERT INTO `ds_area` VALUES ('4477', '龙里县', '414', '0', '3', '');
INSERT INTO `ds_area` VALUES ('4478', '东川区', '415', '0', '3', '');
INSERT INTO `ds_area` VALUES ('4479', '五华区', '415', '0', '3', '');
INSERT INTO `ds_area` VALUES ('4480', '呈贡县', '415', '0', '3', '');
INSERT INTO `ds_area` VALUES ('4481', '安宁市', '415', '0', '3', '');
INSERT INTO `ds_area` VALUES ('4482', '官渡区', '415', '0', '3', '');
INSERT INTO `ds_area` VALUES ('4483', '宜良县', '415', '0', '3', '');
INSERT INTO `ds_area` VALUES ('4484', '富民县', '415', '0', '3', '');
INSERT INTO `ds_area` VALUES ('4485', '寻甸回族彝族自治县', '415', '0', '3', '');
INSERT INTO `ds_area` VALUES ('4486', '嵩明县', '415', '0', '3', '');
INSERT INTO `ds_area` VALUES ('4487', '晋宁县', '415', '0', '3', '');
INSERT INTO `ds_area` VALUES ('4488', '盘龙区', '415', '0', '3', '');
INSERT INTO `ds_area` VALUES ('4489', '石林彝族自治县', '415', '0', '3', '');
INSERT INTO `ds_area` VALUES ('4490', '禄劝彝族苗族自治县', '415', '0', '3', '');
INSERT INTO `ds_area` VALUES ('4491', '西山区', '415', '0', '3', '');
INSERT INTO `ds_area` VALUES ('4492', '会泽县', '416', '0', '3', '');
INSERT INTO `ds_area` VALUES ('4493', '宣威市', '416', '0', '3', '');
INSERT INTO `ds_area` VALUES ('4494', '富源县', '416', '0', '3', '');
INSERT INTO `ds_area` VALUES ('4495', '师宗县', '416', '0', '3', '');
INSERT INTO `ds_area` VALUES ('4496', '沾益县', '416', '0', '3', '');
INSERT INTO `ds_area` VALUES ('4497', '罗平县', '416', '0', '3', '');
INSERT INTO `ds_area` VALUES ('4498', '陆良县', '416', '0', '3', '');
INSERT INTO `ds_area` VALUES ('4499', '马龙县', '416', '0', '3', '');
INSERT INTO `ds_area` VALUES ('4500', '麒麟区', '416', '0', '3', '');
INSERT INTO `ds_area` VALUES ('4501', '元江哈尼族彝族傣族自治县', '417', '0', '3', '');
INSERT INTO `ds_area` VALUES ('4502', '华宁县', '417', '0', '3', '');
INSERT INTO `ds_area` VALUES ('4503', '峨山彝族自治县', '417', '0', '3', '');
INSERT INTO `ds_area` VALUES ('4504', '新平彝族傣族自治县', '417', '0', '3', '');
INSERT INTO `ds_area` VALUES ('4505', '易门县', '417', '0', '3', '');
INSERT INTO `ds_area` VALUES ('4506', '江川县', '417', '0', '3', '');
INSERT INTO `ds_area` VALUES ('4507', '澄江县', '417', '0', '3', '');
INSERT INTO `ds_area` VALUES ('4508', '红塔区', '417', '0', '3', '');
INSERT INTO `ds_area` VALUES ('4509', '通海县', '417', '0', '3', '');
INSERT INTO `ds_area` VALUES ('4510', '施甸县', '418', '0', '3', '');
INSERT INTO `ds_area` VALUES ('4511', '昌宁县', '418', '0', '3', '');
INSERT INTO `ds_area` VALUES ('4512', '腾冲县', '418', '0', '3', '');
INSERT INTO `ds_area` VALUES ('4513', '隆阳区', '418', '0', '3', '');
INSERT INTO `ds_area` VALUES ('4514', '龙陵县', '418', '0', '3', '');
INSERT INTO `ds_area` VALUES ('4515', '大关县', '419', '0', '3', '');
INSERT INTO `ds_area` VALUES ('4516', '威信县', '419', '0', '3', '');
INSERT INTO `ds_area` VALUES ('4517', '巧家县', '419', '0', '3', '');
INSERT INTO `ds_area` VALUES ('4518', '彝良县', '419', '0', '3', '');
INSERT INTO `ds_area` VALUES ('4519', '昭阳区', '419', '0', '3', '');
INSERT INTO `ds_area` VALUES ('4520', '水富县', '419', '0', '3', '');
INSERT INTO `ds_area` VALUES ('4521', '永善县', '419', '0', '3', '');
INSERT INTO `ds_area` VALUES ('4522', '盐津县', '419', '0', '3', '');
INSERT INTO `ds_area` VALUES ('4523', '绥江县', '419', '0', '3', '');
INSERT INTO `ds_area` VALUES ('4524', '镇雄县', '419', '0', '3', '');
INSERT INTO `ds_area` VALUES ('4525', '鲁甸县', '419', '0', '3', '');
INSERT INTO `ds_area` VALUES ('4526', '华坪县', '420', '0', '3', '');
INSERT INTO `ds_area` VALUES ('4527', '古城区', '420', '0', '3', '');
INSERT INTO `ds_area` VALUES ('4528', '宁蒗彝族自治县', '420', '0', '3', '');
INSERT INTO `ds_area` VALUES ('4529', '永胜县', '420', '0', '3', '');
INSERT INTO `ds_area` VALUES ('4530', '玉龙纳西族自治县', '420', '0', '3', '');
INSERT INTO `ds_area` VALUES ('4531', '临翔区', '422', '0', '3', '');
INSERT INTO `ds_area` VALUES ('4532', '云县', '422', '0', '3', '');
INSERT INTO `ds_area` VALUES ('4533', '凤庆县', '422', '0', '3', '');
INSERT INTO `ds_area` VALUES ('4534', '双江拉祜族佤族布朗族傣族自治县', '422', '0', '3', '');
INSERT INTO `ds_area` VALUES ('4535', '永德县', '422', '0', '3', '');
INSERT INTO `ds_area` VALUES ('4536', '沧源佤族自治县', '422', '0', '3', '');
INSERT INTO `ds_area` VALUES ('4537', '耿马傣族佤族自治县', '422', '0', '3', '');
INSERT INTO `ds_area` VALUES ('4538', '镇康县', '422', '0', '3', '');
INSERT INTO `ds_area` VALUES ('4539', '元谋县', '423', '0', '3', '');
INSERT INTO `ds_area` VALUES ('4540', '南华县', '423', '0', '3', '');
INSERT INTO `ds_area` VALUES ('4541', '双柏县', '423', '0', '3', '');
INSERT INTO `ds_area` VALUES ('4542', '大姚县', '423', '0', '3', '');
INSERT INTO `ds_area` VALUES ('4543', '姚安县', '423', '0', '3', '');
INSERT INTO `ds_area` VALUES ('4544', '楚雄市', '423', '0', '3', '');
INSERT INTO `ds_area` VALUES ('4545', '武定县', '423', '0', '3', '');
INSERT INTO `ds_area` VALUES ('4546', '永仁县', '423', '0', '3', '');
INSERT INTO `ds_area` VALUES ('4547', '牟定县', '423', '0', '3', '');
INSERT INTO `ds_area` VALUES ('4548', '禄丰县', '423', '0', '3', '');
INSERT INTO `ds_area` VALUES ('4549', '个旧市', '424', '0', '3', '');
INSERT INTO `ds_area` VALUES ('4550', '元阳县', '424', '0', '3', '');
INSERT INTO `ds_area` VALUES ('4551', '屏边苗族自治县', '424', '0', '3', '');
INSERT INTO `ds_area` VALUES ('4552', '建水县', '424', '0', '3', '');
INSERT INTO `ds_area` VALUES ('4553', '开远市', '424', '0', '3', '');
INSERT INTO `ds_area` VALUES ('4554', '弥勒县', '424', '0', '3', '');
INSERT INTO `ds_area` VALUES ('4555', '河口瑶族自治县', '424', '0', '3', '');
INSERT INTO `ds_area` VALUES ('4556', '泸西县', '424', '0', '3', '');
INSERT INTO `ds_area` VALUES ('4557', '石屏县', '424', '0', '3', '');
INSERT INTO `ds_area` VALUES ('4558', '红河县', '424', '0', '3', '');
INSERT INTO `ds_area` VALUES ('4559', '绿春县', '424', '0', '3', '');
INSERT INTO `ds_area` VALUES ('4560', '蒙自县', '424', '0', '3', '');
INSERT INTO `ds_area` VALUES ('4561', '金平苗族瑶族傣族自治县', '424', '0', '3', '');
INSERT INTO `ds_area` VALUES ('4562', '丘北县', '425', '0', '3', '');
INSERT INTO `ds_area` VALUES ('4563', '富宁县', '425', '0', '3', '');
INSERT INTO `ds_area` VALUES ('4564', '广南县', '425', '0', '3', '');
INSERT INTO `ds_area` VALUES ('4565', '文山县', '425', '0', '3', '');
INSERT INTO `ds_area` VALUES ('4566', '砚山县', '425', '0', '3', '');
INSERT INTO `ds_area` VALUES ('4567', '西畴县', '425', '0', '3', '');
INSERT INTO `ds_area` VALUES ('4568', '马关县', '425', '0', '3', '');
INSERT INTO `ds_area` VALUES ('4569', '麻栗坡县', '425', '0', '3', '');
INSERT INTO `ds_area` VALUES ('4570', '勐海县', '426', '0', '3', '');
INSERT INTO `ds_area` VALUES ('4571', '勐腊县', '426', '0', '3', '');
INSERT INTO `ds_area` VALUES ('4572', '景洪市', '426', '0', '3', '');
INSERT INTO `ds_area` VALUES ('4573', '云龙县', '427', '0', '3', '');
INSERT INTO `ds_area` VALUES ('4574', '剑川县', '427', '0', '3', '');
INSERT INTO `ds_area` VALUES ('4575', '南涧彝族自治县', '427', '0', '3', '');
INSERT INTO `ds_area` VALUES ('4576', '大理市', '427', '0', '3', '');
INSERT INTO `ds_area` VALUES ('4577', '宾川县', '427', '0', '3', '');
INSERT INTO `ds_area` VALUES ('4578', '巍山彝族回族自治县', '427', '0', '3', '');
INSERT INTO `ds_area` VALUES ('4579', '弥渡县', '427', '0', '3', '');
INSERT INTO `ds_area` VALUES ('4580', '永平县', '427', '0', '3', '');
INSERT INTO `ds_area` VALUES ('4581', '洱源县', '427', '0', '3', '');
INSERT INTO `ds_area` VALUES ('4582', '漾濞彝族自治县', '427', '0', '3', '');
INSERT INTO `ds_area` VALUES ('4583', '祥云县', '427', '0', '3', '');
INSERT INTO `ds_area` VALUES ('4584', '鹤庆县', '427', '0', '3', '');
INSERT INTO `ds_area` VALUES ('4585', '梁河县', '428', '0', '3', '');
INSERT INTO `ds_area` VALUES ('4586', '潞西市', '428', '0', '3', '');
INSERT INTO `ds_area` VALUES ('4587', '瑞丽市', '428', '0', '3', '');
INSERT INTO `ds_area` VALUES ('4588', '盈江县', '428', '0', '3', '');
INSERT INTO `ds_area` VALUES ('4589', '陇川县', '428', '0', '3', '');
INSERT INTO `ds_area` VALUES ('4590', '德钦县', '430', '0', '3', '');
INSERT INTO `ds_area` VALUES ('4591', '维西傈僳族自治县', '430', '0', '3', '');
INSERT INTO `ds_area` VALUES ('4592', '香格里拉县', '430', '0', '3', '');
INSERT INTO `ds_area` VALUES ('4593', '城关区', '431', '0', '3', '');
INSERT INTO `ds_area` VALUES ('4594', '堆龙德庆县', '431', '0', '3', '');
INSERT INTO `ds_area` VALUES ('4595', '墨竹工卡县', '431', '0', '3', '');
INSERT INTO `ds_area` VALUES ('4596', '尼木县', '431', '0', '3', '');
INSERT INTO `ds_area` VALUES ('4597', '当雄县', '431', '0', '3', '');
INSERT INTO `ds_area` VALUES ('4598', '曲水县', '431', '0', '3', '');
INSERT INTO `ds_area` VALUES ('4599', '林周县', '431', '0', '3', '');
INSERT INTO `ds_area` VALUES ('4600', '达孜县', '431', '0', '3', '');
INSERT INTO `ds_area` VALUES ('4601', '丁青县', '432', '0', '3', '');
INSERT INTO `ds_area` VALUES ('4602', '八宿县', '432', '0', '3', '');
INSERT INTO `ds_area` VALUES ('4603', '察雅县', '432', '0', '3', '');
INSERT INTO `ds_area` VALUES ('4604', '左贡县', '432', '0', '3', '');
INSERT INTO `ds_area` VALUES ('4605', '昌都县', '432', '0', '3', '');
INSERT INTO `ds_area` VALUES ('4606', '江达县', '432', '0', '3', '');
INSERT INTO `ds_area` VALUES ('4607', '洛隆县', '432', '0', '3', '');
INSERT INTO `ds_area` VALUES ('4608', '类乌齐县', '432', '0', '3', '');
INSERT INTO `ds_area` VALUES ('4609', '芒康县', '432', '0', '3', '');
INSERT INTO `ds_area` VALUES ('4610', '贡觉县', '432', '0', '3', '');
INSERT INTO `ds_area` VALUES ('4611', '边坝县', '432', '0', '3', '');
INSERT INTO `ds_area` VALUES ('4612', '乃东县', '433', '0', '3', '');
INSERT INTO `ds_area` VALUES ('4613', '加查县', '433', '0', '3', '');
INSERT INTO `ds_area` VALUES ('4614', '扎囊县', '433', '0', '3', '');
INSERT INTO `ds_area` VALUES ('4615', '措美县', '433', '0', '3', '');
INSERT INTO `ds_area` VALUES ('4616', '曲松县', '433', '0', '3', '');
INSERT INTO `ds_area` VALUES ('4617', '桑日县', '433', '0', '3', '');
INSERT INTO `ds_area` VALUES ('4618', '洛扎县', '433', '0', '3', '');
INSERT INTO `ds_area` VALUES ('4619', '浪卡子县', '433', '0', '3', '');
INSERT INTO `ds_area` VALUES ('4620', '琼结县', '433', '0', '3', '');
INSERT INTO `ds_area` VALUES ('4621', '贡嘎县', '433', '0', '3', '');
INSERT INTO `ds_area` VALUES ('4622', '错那县', '433', '0', '3', '');
INSERT INTO `ds_area` VALUES ('4623', '隆子县', '433', '0', '3', '');
INSERT INTO `ds_area` VALUES ('4624', '亚东县', '434', '0', '3', '');
INSERT INTO `ds_area` VALUES ('4625', '仁布县', '434', '0', '3', '');
INSERT INTO `ds_area` VALUES ('4626', '仲巴县', '434', '0', '3', '');
INSERT INTO `ds_area` VALUES ('4627', '南木林县', '434', '0', '3', '');
INSERT INTO `ds_area` VALUES ('4628', '吉隆县', '434', '0', '3', '');
INSERT INTO `ds_area` VALUES ('4629', '定日县', '434', '0', '3', '');
INSERT INTO `ds_area` VALUES ('4630', '定结县', '434', '0', '3', '');
INSERT INTO `ds_area` VALUES ('4631', '岗巴县', '434', '0', '3', '');
INSERT INTO `ds_area` VALUES ('4632', '康马县', '434', '0', '3', '');
INSERT INTO `ds_area` VALUES ('4633', '拉孜县', '434', '0', '3', '');
INSERT INTO `ds_area` VALUES ('4634', '日喀则市', '434', '0', '3', '');
INSERT INTO `ds_area` VALUES ('4635', '昂仁县', '434', '0', '3', '');
INSERT INTO `ds_area` VALUES ('4636', '江孜县', '434', '0', '3', '');
INSERT INTO `ds_area` VALUES ('4637', '白朗县', '434', '0', '3', '');
INSERT INTO `ds_area` VALUES ('4638', '聂拉木县', '434', '0', '3', '');
INSERT INTO `ds_area` VALUES ('4639', '萨嘎县', '434', '0', '3', '');
INSERT INTO `ds_area` VALUES ('4640', '萨迦县', '434', '0', '3', '');
INSERT INTO `ds_area` VALUES ('4641', '谢通门县', '434', '0', '3', '');
INSERT INTO `ds_area` VALUES ('4642', '嘉黎县', '435', '0', '3', '');
INSERT INTO `ds_area` VALUES ('4643', '安多县', '435', '0', '3', '');
INSERT INTO `ds_area` VALUES ('4644', '尼玛县', '435', '0', '3', '');
INSERT INTO `ds_area` VALUES ('4645', '巴青县', '435', '0', '3', '');
INSERT INTO `ds_area` VALUES ('4646', '比如县', '435', '0', '3', '');
INSERT INTO `ds_area` VALUES ('4647', '班戈县', '435', '0', '3', '');
INSERT INTO `ds_area` VALUES ('4648', '申扎县', '435', '0', '3', '');
INSERT INTO `ds_area` VALUES ('4649', '索县', '435', '0', '3', '');
INSERT INTO `ds_area` VALUES ('4650', '聂荣县', '435', '0', '3', '');
INSERT INTO `ds_area` VALUES ('4651', '那曲县', '435', '0', '3', '');
INSERT INTO `ds_area` VALUES ('4652', '噶尔县', '436', '0', '3', '');
INSERT INTO `ds_area` VALUES ('4653', '措勤县', '436', '0', '3', '');
INSERT INTO `ds_area` VALUES ('4654', '改则县', '436', '0', '3', '');
INSERT INTO `ds_area` VALUES ('4655', '日土县', '436', '0', '3', '');
INSERT INTO `ds_area` VALUES ('4656', '普兰县', '436', '0', '3', '');
INSERT INTO `ds_area` VALUES ('4657', '札达县', '436', '0', '3', '');
INSERT INTO `ds_area` VALUES ('4658', '革吉县', '436', '0', '3', '');
INSERT INTO `ds_area` VALUES ('4659', '墨脱县', '437', '0', '3', '');
INSERT INTO `ds_area` VALUES ('4660', '察隅县', '437', '0', '3', '');
INSERT INTO `ds_area` VALUES ('4661', '工布江达县', '437', '0', '3', '');
INSERT INTO `ds_area` VALUES ('4662', '朗县', '437', '0', '3', '');
INSERT INTO `ds_area` VALUES ('4663', '林芝县', '437', '0', '3', '');
INSERT INTO `ds_area` VALUES ('4664', '波密县', '437', '0', '3', '');
INSERT INTO `ds_area` VALUES ('4665', '米林县', '437', '0', '3', '');
INSERT INTO `ds_area` VALUES ('4666', '临潼区', '438', '0', '3', '');
INSERT INTO `ds_area` VALUES ('4667', '周至县', '438', '0', '3', '');
INSERT INTO `ds_area` VALUES ('4668', '户县', '438', '0', '3', '');
INSERT INTO `ds_area` VALUES ('4669', '新城区', '438', '0', '3', '');
INSERT INTO `ds_area` VALUES ('4670', '未央区', '438', '0', '3', '');
INSERT INTO `ds_area` VALUES ('4671', '灞桥区', '438', '0', '3', '');
INSERT INTO `ds_area` VALUES ('4672', '碑林区', '438', '0', '3', '');
INSERT INTO `ds_area` VALUES ('4673', '莲湖区', '438', '0', '3', '');
INSERT INTO `ds_area` VALUES ('4674', '蓝田县', '438', '0', '3', '');
INSERT INTO `ds_area` VALUES ('4675', '长安区', '438', '0', '3', '');
INSERT INTO `ds_area` VALUES ('4676', '阎良区', '438', '0', '3', '');
INSERT INTO `ds_area` VALUES ('4677', '雁塔区', '438', '0', '3', '');
INSERT INTO `ds_area` VALUES ('4678', '高陵县', '438', '0', '3', '');
INSERT INTO `ds_area` VALUES ('4679', '印台区', '439', '0', '3', '');
INSERT INTO `ds_area` VALUES ('4680', '宜君县', '439', '0', '3', '');
INSERT INTO `ds_area` VALUES ('4681', '王益区', '439', '0', '3', '');
INSERT INTO `ds_area` VALUES ('4682', '耀州区', '439', '0', '3', '');
INSERT INTO `ds_area` VALUES ('4683', '凤县', '440', '0', '3', '');
INSERT INTO `ds_area` VALUES ('4684', '凤翔县', '440', '0', '3', '');
INSERT INTO `ds_area` VALUES ('4685', '千阳县', '440', '0', '3', '');
INSERT INTO `ds_area` VALUES ('4686', '太白县', '440', '0', '3', '');
INSERT INTO `ds_area` VALUES ('4687', '岐山县', '440', '0', '3', '');
INSERT INTO `ds_area` VALUES ('4688', '扶风县', '440', '0', '3', '');
INSERT INTO `ds_area` VALUES ('4689', '渭滨区', '440', '0', '3', '');
INSERT INTO `ds_area` VALUES ('4690', '眉县', '440', '0', '3', '');
INSERT INTO `ds_area` VALUES ('4691', '金台区', '440', '0', '3', '');
INSERT INTO `ds_area` VALUES ('4692', '陇县', '440', '0', '3', '');
INSERT INTO `ds_area` VALUES ('4693', '陈仓区', '440', '0', '3', '');
INSERT INTO `ds_area` VALUES ('4694', '麟游县', '440', '0', '3', '');
INSERT INTO `ds_area` VALUES ('4695', '三原县', '441', '0', '3', '');
INSERT INTO `ds_area` VALUES ('4696', '干县', '441', '0', '3', '');
INSERT INTO `ds_area` VALUES ('4697', '兴平市', '441', '0', '3', '');
INSERT INTO `ds_area` VALUES ('4698', '彬县', '441', '0', '3', '');
INSERT INTO `ds_area` VALUES ('4699', '旬邑县', '441', '0', '3', '');
INSERT INTO `ds_area` VALUES ('4700', '杨陵区', '441', '0', '3', '');
INSERT INTO `ds_area` VALUES ('4701', '武功县', '441', '0', '3', '');
INSERT INTO `ds_area` VALUES ('4702', '永寿县', '441', '0', '3', '');
INSERT INTO `ds_area` VALUES ('4703', '泾阳县', '441', '0', '3', '');
INSERT INTO `ds_area` VALUES ('4704', '淳化县', '441', '0', '3', '');
INSERT INTO `ds_area` VALUES ('4705', '渭城区', '441', '0', '3', '');
INSERT INTO `ds_area` VALUES ('4706', '礼泉县', '441', '0', '3', '');
INSERT INTO `ds_area` VALUES ('4707', '秦都区', '441', '0', '3', '');
INSERT INTO `ds_area` VALUES ('4708', '长武县', '441', '0', '3', '');
INSERT INTO `ds_area` VALUES ('4709', '临渭区', '442', '0', '3', '');
INSERT INTO `ds_area` VALUES ('4710', '华县', '442', '0', '3', '');
INSERT INTO `ds_area` VALUES ('4711', '华阴市', '442', '0', '3', '');
INSERT INTO `ds_area` VALUES ('4712', '合阳县', '442', '0', '3', '');
INSERT INTO `ds_area` VALUES ('4713', '大荔县', '442', '0', '3', '');
INSERT INTO `ds_area` VALUES ('4714', '富平县', '442', '0', '3', '');
INSERT INTO `ds_area` VALUES ('4715', '潼关县', '442', '0', '3', '');
INSERT INTO `ds_area` VALUES ('4716', '澄城县', '442', '0', '3', '');
INSERT INTO `ds_area` VALUES ('4717', '白水县', '442', '0', '3', '');
INSERT INTO `ds_area` VALUES ('4718', '蒲城县', '442', '0', '3', '');
INSERT INTO `ds_area` VALUES ('4719', '韩城市', '442', '0', '3', '');
INSERT INTO `ds_area` VALUES ('4720', '吴起县', '443', '0', '3', '');
INSERT INTO `ds_area` VALUES ('4721', '子长县', '443', '0', '3', '');
INSERT INTO `ds_area` VALUES ('4722', '安塞县', '443', '0', '3', '');
INSERT INTO `ds_area` VALUES ('4723', '宜川县', '443', '0', '3', '');
INSERT INTO `ds_area` VALUES ('4724', '宝塔区', '443', '0', '3', '');
INSERT INTO `ds_area` VALUES ('4725', '富县', '443', '0', '3', '');
INSERT INTO `ds_area` VALUES ('4726', '延川县', '443', '0', '3', '');
INSERT INTO `ds_area` VALUES ('4727', '延长县', '443', '0', '3', '');
INSERT INTO `ds_area` VALUES ('4728', '志丹县', '443', '0', '3', '');
INSERT INTO `ds_area` VALUES ('4729', '洛川县', '443', '0', '3', '');
INSERT INTO `ds_area` VALUES ('4730', '甘泉县', '443', '0', '3', '');
INSERT INTO `ds_area` VALUES ('4731', '黄陵县', '443', '0', '3', '');
INSERT INTO `ds_area` VALUES ('4732', '黄龙县', '443', '0', '3', '');
INSERT INTO `ds_area` VALUES ('4733', '佛坪县', '444', '0', '3', '');
INSERT INTO `ds_area` VALUES ('4734', '勉县', '444', '0', '3', '');
INSERT INTO `ds_area` VALUES ('4735', '南郑县', '444', '0', '3', '');
INSERT INTO `ds_area` VALUES ('4736', '城固县', '444', '0', '3', '');
INSERT INTO `ds_area` VALUES ('4737', '宁强县', '444', '0', '3', '');
INSERT INTO `ds_area` VALUES ('4738', '汉台区', '444', '0', '3', '');
INSERT INTO `ds_area` VALUES ('4739', '洋县', '444', '0', '3', '');
INSERT INTO `ds_area` VALUES ('4740', '留坝县', '444', '0', '3', '');
INSERT INTO `ds_area` VALUES ('4741', '略阳县', '444', '0', '3', '');
INSERT INTO `ds_area` VALUES ('4742', '西乡县', '444', '0', '3', '');
INSERT INTO `ds_area` VALUES ('4743', '镇巴县', '444', '0', '3', '');
INSERT INTO `ds_area` VALUES ('4744', '佳县', '445', '0', '3', '');
INSERT INTO `ds_area` VALUES ('4745', '吴堡县', '445', '0', '3', '');
INSERT INTO `ds_area` VALUES ('4746', '子洲县', '445', '0', '3', '');
INSERT INTO `ds_area` VALUES ('4747', '定边县', '445', '0', '3', '');
INSERT INTO `ds_area` VALUES ('4748', '府谷县', '445', '0', '3', '');
INSERT INTO `ds_area` VALUES ('4749', '榆林市榆阳区', '445', '0', '3', '');
INSERT INTO `ds_area` VALUES ('4750', '横山县', '445', '0', '3', '');
INSERT INTO `ds_area` VALUES ('4751', '清涧县', '445', '0', '3', '');
INSERT INTO `ds_area` VALUES ('4752', '神木县', '445', '0', '3', '');
INSERT INTO `ds_area` VALUES ('4753', '米脂县', '445', '0', '3', '');
INSERT INTO `ds_area` VALUES ('4754', '绥德县', '445', '0', '3', '');
INSERT INTO `ds_area` VALUES ('4755', '靖边县', '445', '0', '3', '');
INSERT INTO `ds_area` VALUES ('4756', '宁陕县', '446', '0', '3', '');
INSERT INTO `ds_area` VALUES ('4757', '岚皋县', '446', '0', '3', '');
INSERT INTO `ds_area` VALUES ('4758', '平利县', '446', '0', '3', '');
INSERT INTO `ds_area` VALUES ('4759', '旬阳县', '446', '0', '3', '');
INSERT INTO `ds_area` VALUES ('4760', '汉滨区', '446', '0', '3', '');
INSERT INTO `ds_area` VALUES ('4761', '汉阴县', '446', '0', '3', '');
INSERT INTO `ds_area` VALUES ('4762', '白河县', '446', '0', '3', '');
INSERT INTO `ds_area` VALUES ('4763', '石泉县', '446', '0', '3', '');
INSERT INTO `ds_area` VALUES ('4764', '紫阳县', '446', '0', '3', '');
INSERT INTO `ds_area` VALUES ('4765', '镇坪县', '446', '0', '3', '');
INSERT INTO `ds_area` VALUES ('4766', '丹凤县', '447', '0', '3', '');
INSERT INTO `ds_area` VALUES ('4767', '商南县', '447', '0', '3', '');
INSERT INTO `ds_area` VALUES ('4768', '商州区', '447', '0', '3', '');
INSERT INTO `ds_area` VALUES ('4769', '山阳县', '447', '0', '3', '');
INSERT INTO `ds_area` VALUES ('4770', '柞水县', '447', '0', '3', '');
INSERT INTO `ds_area` VALUES ('4771', '洛南县', '447', '0', '3', '');
INSERT INTO `ds_area` VALUES ('4772', '镇安县', '447', '0', '3', '');
INSERT INTO `ds_area` VALUES ('4773', '七里河区', '448', '0', '3', '');
INSERT INTO `ds_area` VALUES ('4774', '城关区', '448', '0', '3', '');
INSERT INTO `ds_area` VALUES ('4775', '安宁区', '448', '0', '3', '');
INSERT INTO `ds_area` VALUES ('4776', '榆中县', '448', '0', '3', '');
INSERT INTO `ds_area` VALUES ('4777', '永登县', '448', '0', '3', '');
INSERT INTO `ds_area` VALUES ('4778', '皋兰县', '448', '0', '3', '');
INSERT INTO `ds_area` VALUES ('4779', '红古区', '448', '0', '3', '');
INSERT INTO `ds_area` VALUES ('4780', '西固区', '448', '0', '3', '');
INSERT INTO `ds_area` VALUES ('4781', '嘉峪关市', '449', '0', '3', '');
INSERT INTO `ds_area` VALUES ('4782', '永昌县', '450', '0', '3', '');
INSERT INTO `ds_area` VALUES ('4783', '金川区', '450', '0', '3', '');
INSERT INTO `ds_area` VALUES ('4784', '会宁县', '451', '0', '3', '');
INSERT INTO `ds_area` VALUES ('4785', '平川区', '451', '0', '3', '');
INSERT INTO `ds_area` VALUES ('4786', '景泰县', '451', '0', '3', '');
INSERT INTO `ds_area` VALUES ('4787', '白银区', '451', '0', '3', '');
INSERT INTO `ds_area` VALUES ('4788', '靖远县', '451', '0', '3', '');
INSERT INTO `ds_area` VALUES ('4789', '张家川回族自治县', '452', '0', '3', '');
INSERT INTO `ds_area` VALUES ('4790', '武山县', '452', '0', '3', '');
INSERT INTO `ds_area` VALUES ('4791', '清水县', '452', '0', '3', '');
INSERT INTO `ds_area` VALUES ('4792', '甘谷县', '452', '0', '3', '');
INSERT INTO `ds_area` VALUES ('4793', '秦安县', '452', '0', '3', '');
INSERT INTO `ds_area` VALUES ('4794', '秦州区', '452', '0', '3', '');
INSERT INTO `ds_area` VALUES ('4795', '麦积区', '452', '0', '3', '');
INSERT INTO `ds_area` VALUES ('4796', '凉州区', '453', '0', '3', '');
INSERT INTO `ds_area` VALUES ('4797', '古浪县', '453', '0', '3', '');
INSERT INTO `ds_area` VALUES ('4798', '天祝藏族自治县', '453', '0', '3', '');
INSERT INTO `ds_area` VALUES ('4799', '民勤县', '453', '0', '3', '');
INSERT INTO `ds_area` VALUES ('4800', '临泽县', '454', '0', '3', '');
INSERT INTO `ds_area` VALUES ('4801', '山丹县', '454', '0', '3', '');
INSERT INTO `ds_area` VALUES ('4802', '民乐县', '454', '0', '3', '');
INSERT INTO `ds_area` VALUES ('4803', '甘州区', '454', '0', '3', '');
INSERT INTO `ds_area` VALUES ('4804', '肃南裕固族自治县', '454', '0', '3', '');
INSERT INTO `ds_area` VALUES ('4805', '高台县', '454', '0', '3', '');
INSERT INTO `ds_area` VALUES ('4806', '华亭县', '455', '0', '3', '');
INSERT INTO `ds_area` VALUES ('4807', '崆峒区', '455', '0', '3', '');
INSERT INTO `ds_area` VALUES ('4808', '崇信县', '455', '0', '3', '');
INSERT INTO `ds_area` VALUES ('4809', '庄浪县', '455', '0', '3', '');
INSERT INTO `ds_area` VALUES ('4810', '泾川县', '455', '0', '3', '');
INSERT INTO `ds_area` VALUES ('4811', '灵台县', '455', '0', '3', '');
INSERT INTO `ds_area` VALUES ('4812', '静宁县', '455', '0', '3', '');
INSERT INTO `ds_area` VALUES ('4813', '敦煌市', '456', '0', '3', '');
INSERT INTO `ds_area` VALUES ('4814', '玉门市', '456', '0', '3', '');
INSERT INTO `ds_area` VALUES ('4815', '瓜州县（原安西县）', '456', '0', '3', '');
INSERT INTO `ds_area` VALUES ('4816', '肃北蒙古族自治县', '456', '0', '3', '');
INSERT INTO `ds_area` VALUES ('4817', '肃州区', '456', '0', '3', '');
INSERT INTO `ds_area` VALUES ('4818', '金塔县', '456', '0', '3', '');
INSERT INTO `ds_area` VALUES ('4819', '阿克塞哈萨克族自治县', '456', '0', '3', '');
INSERT INTO `ds_area` VALUES ('4820', '华池县', '457', '0', '3', '');
INSERT INTO `ds_area` VALUES ('4821', '合水县', '457', '0', '3', '');
INSERT INTO `ds_area` VALUES ('4822', '宁县', '457', '0', '3', '');
INSERT INTO `ds_area` VALUES ('4823', '庆城县', '457', '0', '3', '');
INSERT INTO `ds_area` VALUES ('4824', '正宁县', '457', '0', '3', '');
INSERT INTO `ds_area` VALUES ('4825', '环县', '457', '0', '3', '');
INSERT INTO `ds_area` VALUES ('4826', '西峰区', '457', '0', '3', '');
INSERT INTO `ds_area` VALUES ('4827', '镇原县', '457', '0', '3', '');
INSERT INTO `ds_area` VALUES ('4828', '临洮县', '458', '0', '3', '');
INSERT INTO `ds_area` VALUES ('4829', '安定区', '458', '0', '3', '');
INSERT INTO `ds_area` VALUES ('4830', '岷县', '458', '0', '3', '');
INSERT INTO `ds_area` VALUES ('4831', '渭源县', '458', '0', '3', '');
INSERT INTO `ds_area` VALUES ('4832', '漳县', '458', '0', '3', '');
INSERT INTO `ds_area` VALUES ('4833', '通渭县', '458', '0', '3', '');
INSERT INTO `ds_area` VALUES ('4834', '陇西县', '458', '0', '3', '');
INSERT INTO `ds_area` VALUES ('4835', '两当县', '459', '0', '3', '');
INSERT INTO `ds_area` VALUES ('4836', '宕昌县', '459', '0', '3', '');
INSERT INTO `ds_area` VALUES ('4837', '康县', '459', '0', '3', '');
INSERT INTO `ds_area` VALUES ('4838', '徽县', '459', '0', '3', '');
INSERT INTO `ds_area` VALUES ('4839', '成县', '459', '0', '3', '');
INSERT INTO `ds_area` VALUES ('4840', '文县', '459', '0', '3', '');
INSERT INTO `ds_area` VALUES ('4841', '武都区', '459', '0', '3', '');
INSERT INTO `ds_area` VALUES ('4842', '礼县', '459', '0', '3', '');
INSERT INTO `ds_area` VALUES ('4843', '西和县', '459', '0', '3', '');
INSERT INTO `ds_area` VALUES ('4844', '东乡族自治县', '460', '0', '3', '');
INSERT INTO `ds_area` VALUES ('4845', '临夏县', '460', '0', '3', '');
INSERT INTO `ds_area` VALUES ('4846', '临夏市', '460', '0', '3', '');
INSERT INTO `ds_area` VALUES ('4847', '和政县', '460', '0', '3', '');
INSERT INTO `ds_area` VALUES ('4848', '广河县', '460', '0', '3', '');
INSERT INTO `ds_area` VALUES ('4849', '康乐县', '460', '0', '3', '');
INSERT INTO `ds_area` VALUES ('4850', '永靖县', '460', '0', '3', '');
INSERT INTO `ds_area` VALUES ('4851', '积石山保安族东乡族撒拉族自治县', '460', '0', '3', '');
INSERT INTO `ds_area` VALUES ('4852', '临潭县', '461', '0', '3', '');
INSERT INTO `ds_area` VALUES ('4853', '卓尼县', '461', '0', '3', '');
INSERT INTO `ds_area` VALUES ('4854', '合作市', '461', '0', '3', '');
INSERT INTO `ds_area` VALUES ('4855', '夏河县', '461', '0', '3', '');
INSERT INTO `ds_area` VALUES ('4856', '玛曲县', '461', '0', '3', '');
INSERT INTO `ds_area` VALUES ('4857', '碌曲县', '461', '0', '3', '');
INSERT INTO `ds_area` VALUES ('4858', '舟曲县', '461', '0', '3', '');
INSERT INTO `ds_area` VALUES ('4859', '迭部县', '461', '0', '3', '');
INSERT INTO `ds_area` VALUES ('4860', '城东区', '462', '0', '3', '');
INSERT INTO `ds_area` VALUES ('4861', '城中区', '462', '0', '3', '');
INSERT INTO `ds_area` VALUES ('4862', '城北区', '462', '0', '3', '');
INSERT INTO `ds_area` VALUES ('4863', '城西区', '462', '0', '3', '');
INSERT INTO `ds_area` VALUES ('4864', '大通回族土族自治县', '462', '0', '3', '');
INSERT INTO `ds_area` VALUES ('4865', '湟中县', '462', '0', '3', '');
INSERT INTO `ds_area` VALUES ('4866', '湟源县', '462', '0', '3', '');
INSERT INTO `ds_area` VALUES ('4867', '乐都县', '463', '0', '3', '');
INSERT INTO `ds_area` VALUES ('4868', '互助土族自治县', '463', '0', '3', '');
INSERT INTO `ds_area` VALUES ('4869', '化隆回族自治县', '463', '0', '3', '');
INSERT INTO `ds_area` VALUES ('4870', '平安县', '463', '0', '3', '');
INSERT INTO `ds_area` VALUES ('4871', '循化撒拉族自治县', '463', '0', '3', '');
INSERT INTO `ds_area` VALUES ('4872', '民和回族土族自治县', '463', '0', '3', '');
INSERT INTO `ds_area` VALUES ('4873', '刚察县', '464', '0', '3', '');
INSERT INTO `ds_area` VALUES ('4874', '海晏县', '464', '0', '3', '');
INSERT INTO `ds_area` VALUES ('4875', '祁连县', '464', '0', '3', '');
INSERT INTO `ds_area` VALUES ('4876', '门源回族自治县', '464', '0', '3', '');
INSERT INTO `ds_area` VALUES ('4877', '同仁县', '465', '0', '3', '');
INSERT INTO `ds_area` VALUES ('4878', '尖扎县', '465', '0', '3', '');
INSERT INTO `ds_area` VALUES ('4879', '河南蒙古族自治县', '465', '0', '3', '');
INSERT INTO `ds_area` VALUES ('4880', '泽库县', '465', '0', '3', '');
INSERT INTO `ds_area` VALUES ('4881', '共和县', '466', '0', '3', '');
INSERT INTO `ds_area` VALUES ('4882', '兴海县', '466', '0', '3', '');
INSERT INTO `ds_area` VALUES ('4883', '同德县', '466', '0', '3', '');
INSERT INTO `ds_area` VALUES ('4884', '贵南县', '466', '0', '3', '');
INSERT INTO `ds_area` VALUES ('4885', '贵德县', '466', '0', '3', '');
INSERT INTO `ds_area` VALUES ('4886', '久治县', '467', '0', '3', '');
INSERT INTO `ds_area` VALUES ('4887', '玛多县', '467', '0', '3', '');
INSERT INTO `ds_area` VALUES ('4888', '玛沁县', '467', '0', '3', '');
INSERT INTO `ds_area` VALUES ('4889', '班玛县', '467', '0', '3', '');
INSERT INTO `ds_area` VALUES ('4890', '甘德县', '467', '0', '3', '');
INSERT INTO `ds_area` VALUES ('4891', '达日县', '467', '0', '3', '');
INSERT INTO `ds_area` VALUES ('4892', '囊谦县', '468', '0', '3', '');
INSERT INTO `ds_area` VALUES ('4893', '曲麻莱县', '468', '0', '3', '');
INSERT INTO `ds_area` VALUES ('4894', '杂多县', '468', '0', '3', '');
INSERT INTO `ds_area` VALUES ('4895', '治多县', '468', '0', '3', '');
INSERT INTO `ds_area` VALUES ('4896', '玉树县', '468', '0', '3', '');
INSERT INTO `ds_area` VALUES ('4897', '称多县', '468', '0', '3', '');
INSERT INTO `ds_area` VALUES ('4898', '乌兰县', '469', '0', '3', '');
INSERT INTO `ds_area` VALUES ('4899', '冷湖行委', '469', '0', '3', '');
INSERT INTO `ds_area` VALUES ('4900', '大柴旦行委', '469', '0', '3', '');
INSERT INTO `ds_area` VALUES ('4901', '天峻县', '469', '0', '3', '');
INSERT INTO `ds_area` VALUES ('4902', '德令哈市', '469', '0', '3', '');
INSERT INTO `ds_area` VALUES ('4903', '格尔木市', '469', '0', '3', '');
INSERT INTO `ds_area` VALUES ('4904', '茫崖行委', '469', '0', '3', '');
INSERT INTO `ds_area` VALUES ('4905', '都兰县', '469', '0', '3', '');
INSERT INTO `ds_area` VALUES ('4906', '兴庆区', '470', '0', '3', '');
INSERT INTO `ds_area` VALUES ('4907', '永宁县', '470', '0', '3', '');
INSERT INTO `ds_area` VALUES ('4908', '灵武市', '470', '0', '3', '');
INSERT INTO `ds_area` VALUES ('4909', '西夏区', '470', '0', '3', '');
INSERT INTO `ds_area` VALUES ('4910', '贺兰县', '470', '0', '3', '');
INSERT INTO `ds_area` VALUES ('4911', '金凤区', '470', '0', '3', '');
INSERT INTO `ds_area` VALUES ('4912', '大武口区', '471', '0', '3', '');
INSERT INTO `ds_area` VALUES ('4913', '平罗县', '471', '0', '3', '');
INSERT INTO `ds_area` VALUES ('4914', '惠农区', '471', '0', '3', '');
INSERT INTO `ds_area` VALUES ('4915', '利通区', '472', '0', '3', '');
INSERT INTO `ds_area` VALUES ('4916', '同心县', '472', '0', '3', '');
INSERT INTO `ds_area` VALUES ('4917', '盐池县', '472', '0', '3', '');
INSERT INTO `ds_area` VALUES ('4918', '青铜峡市', '472', '0', '3', '');
INSERT INTO `ds_area` VALUES ('4919', '原州区', '473', '0', '3', '');
INSERT INTO `ds_area` VALUES ('4920', '彭阳县', '473', '0', '3', '');
INSERT INTO `ds_area` VALUES ('4921', '泾源县', '473', '0', '3', '');
INSERT INTO `ds_area` VALUES ('4922', '西吉县', '473', '0', '3', '');
INSERT INTO `ds_area` VALUES ('4923', '隆德县', '473', '0', '3', '');
INSERT INTO `ds_area` VALUES ('4924', '中宁县', '474', '0', '3', '');
INSERT INTO `ds_area` VALUES ('4925', '沙坡头区', '474', '0', '3', '');
INSERT INTO `ds_area` VALUES ('4926', '海原县', '474', '0', '3', '');
INSERT INTO `ds_area` VALUES ('4927', '东山区', '475', '0', '3', '');
INSERT INTO `ds_area` VALUES ('4928', '乌鲁木齐县', '475', '0', '3', '');
INSERT INTO `ds_area` VALUES ('4929', '天山区', '475', '0', '3', '');
INSERT INTO `ds_area` VALUES ('4930', '头屯河区', '475', '0', '3', '');
INSERT INTO `ds_area` VALUES ('4931', '新市区', '475', '0', '3', '');
INSERT INTO `ds_area` VALUES ('4932', '水磨沟区', '475', '0', '3', '');
INSERT INTO `ds_area` VALUES ('4933', '沙依巴克区', '475', '0', '3', '');
INSERT INTO `ds_area` VALUES ('4934', '达坂城区', '475', '0', '3', '');
INSERT INTO `ds_area` VALUES ('4935', '乌尔禾区', '476', '0', '3', '');
INSERT INTO `ds_area` VALUES ('4936', '克拉玛依区', '476', '0', '3', '');
INSERT INTO `ds_area` VALUES ('4937', '独山子区', '476', '0', '3', '');
INSERT INTO `ds_area` VALUES ('4938', '白碱滩区', '476', '0', '3', '');
INSERT INTO `ds_area` VALUES ('4939', '吐鲁番市', '477', '0', '3', '');
INSERT INTO `ds_area` VALUES ('4940', '托克逊县', '477', '0', '3', '');
INSERT INTO `ds_area` VALUES ('4941', '鄯善县', '477', '0', '3', '');
INSERT INTO `ds_area` VALUES ('4942', '伊吾县', '478', '0', '3', '');
INSERT INTO `ds_area` VALUES ('4943', '哈密市', '478', '0', '3', '');
INSERT INTO `ds_area` VALUES ('4944', '巴里坤哈萨克自治县', '478', '0', '3', '');
INSERT INTO `ds_area` VALUES ('4945', '吉木萨尔县', '479', '0', '3', '');
INSERT INTO `ds_area` VALUES ('4946', '呼图壁县', '479', '0', '3', '');
INSERT INTO `ds_area` VALUES ('4947', '奇台县', '479', '0', '3', '');
INSERT INTO `ds_area` VALUES ('4948', '昌吉市', '479', '0', '3', '');
INSERT INTO `ds_area` VALUES ('4949', '木垒哈萨克自治县', '479', '0', '3', '');
INSERT INTO `ds_area` VALUES ('4950', '玛纳斯县', '479', '0', '3', '');
INSERT INTO `ds_area` VALUES ('4951', '米泉市', '479', '0', '3', '');
INSERT INTO `ds_area` VALUES ('4952', '阜康市', '479', '0', '3', '');
INSERT INTO `ds_area` VALUES ('4953', '博乐市', '480', '0', '3', '');
INSERT INTO `ds_area` VALUES ('4954', '温泉县', '480', '0', '3', '');
INSERT INTO `ds_area` VALUES ('4955', '精河县', '480', '0', '3', '');
INSERT INTO `ds_area` VALUES ('4956', '博湖县', '481', '0', '3', '');
INSERT INTO `ds_area` VALUES ('4957', '和硕县', '481', '0', '3', '');
INSERT INTO `ds_area` VALUES ('4958', '和静县', '481', '0', '3', '');
INSERT INTO `ds_area` VALUES ('4959', '尉犁县', '481', '0', '3', '');
INSERT INTO `ds_area` VALUES ('4960', '库尔勒市', '481', '0', '3', '');
INSERT INTO `ds_area` VALUES ('4961', '焉耆回族自治县', '481', '0', '3', '');
INSERT INTO `ds_area` VALUES ('4962', '若羌县', '481', '0', '3', '');
INSERT INTO `ds_area` VALUES ('4963', '轮台县', '481', '0', '3', '');
INSERT INTO `ds_area` VALUES ('4964', '乌什县', '482', '0', '3', '');
INSERT INTO `ds_area` VALUES ('4965', '库车县', '482', '0', '3', '');
INSERT INTO `ds_area` VALUES ('4966', '拜城县', '482', '0', '3', '');
INSERT INTO `ds_area` VALUES ('4967', '新和县', '482', '0', '3', '');
INSERT INTO `ds_area` VALUES ('4968', '柯坪县', '482', '0', '3', '');
INSERT INTO `ds_area` VALUES ('4969', '沙雅县', '482', '0', '3', '');
INSERT INTO `ds_area` VALUES ('4970', '温宿县', '482', '0', '3', '');
INSERT INTO `ds_area` VALUES ('4971', '阿克苏市', '482', '0', '3', '');
INSERT INTO `ds_area` VALUES ('4972', '阿瓦提县', '482', '0', '3', '');
INSERT INTO `ds_area` VALUES ('4973', '乌恰县', '483', '0', '3', '');
INSERT INTO `ds_area` VALUES ('4974', '阿克陶县', '483', '0', '3', '');
INSERT INTO `ds_area` VALUES ('4975', '阿合奇县', '483', '0', '3', '');
INSERT INTO `ds_area` VALUES ('4976', '阿图什市', '483', '0', '3', '');
INSERT INTO `ds_area` VALUES ('4977', '伽师县', '484', '0', '3', '');
INSERT INTO `ds_area` VALUES ('4978', '叶城县', '484', '0', '3', '');
INSERT INTO `ds_area` VALUES ('4979', '喀什市', '484', '0', '3', '');
INSERT INTO `ds_area` VALUES ('4980', '塔什库尔干塔吉克自治县', '484', '0', '3', '');
INSERT INTO `ds_area` VALUES ('4981', '岳普湖县', '484', '0', '3', '');
INSERT INTO `ds_area` VALUES ('4982', '巴楚县', '484', '0', '3', '');
INSERT INTO `ds_area` VALUES ('4983', '泽普县', '484', '0', '3', '');
INSERT INTO `ds_area` VALUES ('4984', '疏勒县', '484', '0', '3', '');
INSERT INTO `ds_area` VALUES ('4985', '疏附县', '484', '0', '3', '');
INSERT INTO `ds_area` VALUES ('4986', '英吉沙县', '484', '0', '3', '');
INSERT INTO `ds_area` VALUES ('4987', '莎车县', '484', '0', '3', '');
INSERT INTO `ds_area` VALUES ('4988', '麦盖提县', '484', '0', '3', '');
INSERT INTO `ds_area` VALUES ('4989', '于田县', '485', '0', '3', '');
INSERT INTO `ds_area` VALUES ('4990', '和田县', '485', '0', '3', '');
INSERT INTO `ds_area` VALUES ('4991', '和田市', '485', '0', '3', '');
INSERT INTO `ds_area` VALUES ('4992', '墨玉县', '485', '0', '3', '');
INSERT INTO `ds_area` VALUES ('4993', '民丰县', '485', '0', '3', '');
INSERT INTO `ds_area` VALUES ('4994', '洛浦县', '485', '0', '3', '');
INSERT INTO `ds_area` VALUES ('4995', '皮山县', '485', '0', '3', '');
INSERT INTO `ds_area` VALUES ('4996', '策勒县', '485', '0', '3', '');
INSERT INTO `ds_area` VALUES ('4997', '伊宁县', '486', '0', '3', '');
INSERT INTO `ds_area` VALUES ('4998', '伊宁市', '486', '0', '3', '');
INSERT INTO `ds_area` VALUES ('4999', '奎屯市', '486', '0', '3', '');
INSERT INTO `ds_area` VALUES ('5000', '察布查尔锡伯自治县', '486', '0', '3', '');
INSERT INTO `ds_area` VALUES ('5001', '尼勒克县', '486', '0', '3', '');
INSERT INTO `ds_area` VALUES ('5002', '巩留县', '486', '0', '3', '');
INSERT INTO `ds_area` VALUES ('5003', '新源县', '486', '0', '3', '');
INSERT INTO `ds_area` VALUES ('5004', '昭苏县', '486', '0', '3', '');
INSERT INTO `ds_area` VALUES ('5005', '特克斯县', '486', '0', '3', '');
INSERT INTO `ds_area` VALUES ('5006', '霍城县', '486', '0', '3', '');
INSERT INTO `ds_area` VALUES ('5007', '乌苏市', '487', '0', '3', '');
INSERT INTO `ds_area` VALUES ('5008', '和布克赛尔蒙古自治县', '487', '0', '3', '');
INSERT INTO `ds_area` VALUES ('5009', '塔城市', '487', '0', '3', '');
INSERT INTO `ds_area` VALUES ('5010', '托里县', '487', '0', '3', '');
INSERT INTO `ds_area` VALUES ('5011', '沙湾县', '487', '0', '3', '');
INSERT INTO `ds_area` VALUES ('5012', '裕民县', '487', '0', '3', '');
INSERT INTO `ds_area` VALUES ('5013', '额敏县', '487', '0', '3', '');
INSERT INTO `ds_area` VALUES ('5014', '吉木乃县', '488', '0', '3', '');
INSERT INTO `ds_area` VALUES ('5015', '哈巴河县', '488', '0', '3', '');
INSERT INTO `ds_area` VALUES ('5016', '富蕴县', '488', '0', '3', '');
INSERT INTO `ds_area` VALUES ('5017', '布尔津县', '488', '0', '3', '');
INSERT INTO `ds_area` VALUES ('5018', '福海县', '488', '0', '3', '');
INSERT INTO `ds_area` VALUES ('5019', '阿勒泰市', '488', '0', '3', '');
INSERT INTO `ds_area` VALUES ('5020', '青河县', '488', '0', '3', '');
INSERT INTO `ds_area` VALUES ('5021', '石河子市', '489', '0', '3', '');
INSERT INTO `ds_area` VALUES ('5022', '阿拉尔市', '490', '0', '3', '');
INSERT INTO `ds_area` VALUES ('5023', '图木舒克市', '491', '0', '3', '');
INSERT INTO `ds_area` VALUES ('5024', '五家渠市', '492', '0', '3', '');
INSERT INTO `ds_area` VALUES ('45055', '海外', '35', '0', '2', '');

-- -----------------------------
-- Table structure for `ds_arrivalnotice`
-- -----------------------------
DROP TABLE IF EXISTS `ds_arrivalnotice`;
CREATE TABLE `ds_arrivalnotice` (
  `arrivalnotice_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '到货通知自增ID',
  `goods_id` int(10) unsigned NOT NULL COMMENT '商品ID',
  `goods_name` varchar(50) NOT NULL COMMENT '商品名称',
  `member_id` int(10) unsigned NOT NULL COMMENT '会员ID',
  `arrivalnotice_addtime` int(10) unsigned NOT NULL COMMENT '到货通知添加时间',
  `arrivalnotice_email` varchar(100) NOT NULL COMMENT '邮箱',
  `arrivalnotice_mobile` varchar(11) NOT NULL COMMENT '手机号',
  `arrivalnotice_type` tinyint(3) unsigned NOT NULL DEFAULT '1' COMMENT '状态 1:到货通知 2:预售',
  PRIMARY KEY (`arrivalnotice_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='商品到货通知表';


-- -----------------------------
-- Table structure for `ds_article`
-- -----------------------------
DROP TABLE IF EXISTS `ds_article`;
CREATE TABLE `ds_article` (
  `article_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '文章自增ID',
  `ac_id` mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '分类id',
  `article_url` varchar(100) DEFAULT NULL COMMENT '文章跳转链接',
  `article_show` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '文章是否显示，0为否，1为是，默认为1',
  `article_sort` tinyint(3) unsigned NOT NULL DEFAULT '255' COMMENT '文章排序',
  `article_title` varchar(100) DEFAULT NULL COMMENT '文章标题',
  `article_content` text COMMENT '内容',
  `article_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '文章发布时间',
  PRIMARY KEY (`article_id`),
  KEY `ac_id` (`ac_id`)
) ENGINE=InnoDB AUTO_INCREMENT=42 DEFAULT CHARSET=utf8 COMMENT='文章表';

-- -----------------------------
-- Records of `ds_article`
-- -----------------------------
INSERT INTO `ds_article` VALUES ('6', '2', '', '1', '255', '如何注册成为会员', '如何注册成为会员', '1435672310');
INSERT INTO `ds_article` VALUES ('7', '2', '', '1', '255', '如何搜索', '如何搜索', '1435672310');
INSERT INTO `ds_article` VALUES ('8', '2', '', '1', '255', '忘记密码', '忘记密码', '1435672310');
INSERT INTO `ds_article` VALUES ('9', '2', '', '1', '255', '我要买', '我要买', '1435672310');
INSERT INTO `ds_article` VALUES ('10', '2', '', '1', '255', '查看已购买商品', '查看已购买商品', '1435672310');
INSERT INTO `ds_article` VALUES ('11', '3', '', '1', '255', '如何管理店铺', '如何管理店铺', '1435672310');
INSERT INTO `ds_article` VALUES ('12', '3', '', '1', '255', '查看售出商品', '查看售出商品', '1435672310');
INSERT INTO `ds_article` VALUES ('13', '3', '', '1', '255', '如何发货', '如何发货', '1435672310');
INSERT INTO `ds_article` VALUES ('14', '3', '', '1', '255', '商城商品推荐', '商城商品推荐', '1435672310');
INSERT INTO `ds_article` VALUES ('15', '3', '', '1', '255', '如何申请开店', '如何申请开店', '1435672310');
INSERT INTO `ds_article` VALUES ('16', '4', '', '1', '255', '如何注册支付宝', '如何注册支付宝', '1435672310');
INSERT INTO `ds_article` VALUES ('17', '4', '', '1', '255', '在线支付', '在线支付', '1435672310');
INSERT INTO `ds_article` VALUES ('18', '6', '', '1', '255', '会员修改密码', '会员修改密码', '1435672310');
INSERT INTO `ds_article` VALUES ('19', '6', '', '1', '255', '会员修改个人资料', '会员修改个人资料', '1435672310');
INSERT INTO `ds_article` VALUES ('20', '6', '', '1', '255', '商品发布', '商品发布', '1435672310');
INSERT INTO `ds_article` VALUES ('21', '6', '', '1', '255', '修改收货地址', '修改收货地址', '1435672310');
INSERT INTO `ds_article` VALUES ('22', '7', '', '1', '255', '关于我们', '关于我们', '1435672310');
INSERT INTO `ds_article` VALUES ('23', '7', '', '1', '255', '联系我们', '联系我们', '1435672310');
INSERT INTO `ds_article` VALUES ('24', '7', '', '1', '255', '招聘英才', '招聘英才', '1435672310');
INSERT INTO `ds_article` VALUES ('25', '7', '', '1', '255', '合作及洽谈', '合作及洽谈', '1435672310');
INSERT INTO `ds_article` VALUES ('26', '5', '', '1', '255', '联系卖家', '联系卖家', '1435672310');
INSERT INTO `ds_article` VALUES ('28', '4', '', '1', '255', '分期付款', '分期付款<br />', '1435672310');
INSERT INTO `ds_article` VALUES ('29', '4', '', '1', '255', '邮局汇款', '邮局汇款<br />', '1435672310');
INSERT INTO `ds_article` VALUES ('30', '4', '', '1', '255', '公司转账', '公司转账<br />', '1435672310');
INSERT INTO `ds_article` VALUES ('31', '5', '', '1', '255', '退换货政策', '退换货政策', '1435672310');
INSERT INTO `ds_article` VALUES ('32', '5', '', '1', '255', '退换货流程', '退换货流程', '1435672310');
INSERT INTO `ds_article` VALUES ('33', '5', '', '1', '255', '返修/退换货', '返修/退换货', '1435672310');
INSERT INTO `ds_article` VALUES ('34', '5', '', '1', '255', '退款申请', '退款申请', '1435672310');
INSERT INTO `ds_article` VALUES ('35', '1', 'http://www.csdeshang.com/', '1', '1', '火爆销售中', '火爆销售中<br />', '1435672310');
INSERT INTO `ds_article` VALUES ('36', '1', '', '1', '255', '管理功能说明', '管理功能说明', '1435672310');
INSERT INTO `ds_article` VALUES ('37', '1', '', '1', '255', '如何扩充水印字体库', '如何扩充水印字体库', '1435672310');
INSERT INTO `ds_article` VALUES ('38', '1', '', '1', '255', '提示信息', '提示信息', '1435672310');
INSERT INTO `ds_article` VALUES ('39', '2', '', '1', '255', '积分细则', '积分细则积分细则', '1435672310');
INSERT INTO `ds_article` VALUES ('40', '2', '', '1', '255', '积分兑换说明', '积分兑换说明', '1435672310');
INSERT INTO `ds_article` VALUES ('41', '1', '', '1', '255', '功能使用说明', '功能使用说明', '1435672310');

-- -----------------------------
-- Table structure for `ds_articleclass`
-- -----------------------------
DROP TABLE IF EXISTS `ds_articleclass`;
CREATE TABLE `ds_articleclass` (
  `ac_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '文章分类自增ID',
  `ac_code` varchar(20) DEFAULT NULL COMMENT '文章分类标识码',
  `ac_name` varchar(100) NOT NULL COMMENT '文章分类名称',
  `ac_parent_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '文章分类父ID',
  `ac_sort` tinyint(1) unsigned NOT NULL DEFAULT '255' COMMENT '文章分类排序',
  PRIMARY KEY (`ac_id`),
  KEY `ac_parent_id` (`ac_parent_id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 COMMENT='文章分类表';

-- -----------------------------
-- Records of `ds_articleclass`
-- -----------------------------
INSERT INTO `ds_articleclass` VALUES ('1', 'notice', '商城公告', '0', '255');
INSERT INTO `ds_articleclass` VALUES ('2', 'member', '帮助中心', '0', '255');
INSERT INTO `ds_articleclass` VALUES ('3', 'store', '店主之家', '0', '255');
INSERT INTO `ds_articleclass` VALUES ('4', 'payment', '支付方式', '0', '255');
INSERT INTO `ds_articleclass` VALUES ('5', 'sold', '售后服务', '0', '255');
INSERT INTO `ds_articleclass` VALUES ('6', 'service', '客服中心', '0', '255');
INSERT INTO `ds_articleclass` VALUES ('7', 'about', '关于我们', '0', '255');

-- -----------------------------
-- Table structure for `ds_attribute`
-- -----------------------------
DROP TABLE IF EXISTS `ds_attribute`;
CREATE TABLE `ds_attribute` (
  `attr_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '属性自增ID',
  `attr_name` varchar(100) NOT NULL COMMENT '属性名称',
  `type_id` int(10) unsigned NOT NULL COMMENT '所属类型id',
  `attr_value` text NOT NULL COMMENT '属性值',
  `attr_show` tinyint(1) unsigned NOT NULL COMMENT '属性是否显示。0不显示、1显示',
  `attr_sort` tinyint(1) unsigned NOT NULL COMMENT '属性排序',
  PRIMARY KEY (`attr_id`),
  KEY `attr_id` (`attr_id`,`type_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='商品属性表';


-- -----------------------------
-- Table structure for `ds_attributevalue`
-- -----------------------------
DROP TABLE IF EXISTS `ds_attributevalue`;
CREATE TABLE `ds_attributevalue` (
  `attrvalue_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '属性值id',
  `attrvalue_name` varchar(100) NOT NULL COMMENT '属性值名称',
  `attr_id` int(10) unsigned NOT NULL COMMENT '所属属性id',
  `type_id` int(10) unsigned NOT NULL COMMENT '类型id',
  `attrvalue_sort` tinyint(1) unsigned NOT NULL COMMENT '属性值排序',
  PRIMARY KEY (`attrvalue_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='商品属性值表';


-- -----------------------------
-- Table structure for `ds_brand`
-- -----------------------------
DROP TABLE IF EXISTS `ds_brand`;
CREATE TABLE `ds_brand` (
  `brand_id` mediumint(11) NOT NULL AUTO_INCREMENT COMMENT '品牌自增ID',
  `store_id` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '店铺ID',
  `gc_id` int(10) unsigned DEFAULT '0' COMMENT '商品分类id',
  `brand_name` varchar(100) DEFAULT NULL COMMENT '品牌名称',
  `brand_initial` varchar(1) DEFAULT NULL COMMENT '品牌首字母',
  `brand_class` varchar(50) DEFAULT NULL COMMENT '类别名称',
  `brand_pic` varchar(100) DEFAULT NULL COMMENT '品牌图片',
  `brand_sort` tinyint(3) unsigned DEFAULT '0' COMMENT '品牌排序',
  `brand_recommend` tinyint(1) DEFAULT '0' COMMENT '品牌推荐，0为否，1为是',
  `brand_apply` tinyint(1) NOT NULL DEFAULT '1' COMMENT '品牌申请，0为申请中，1为通过，默认为1，申请功能是会员使用',
  `brand_showtype` tinyint(1) NOT NULL DEFAULT '0' COMMENT '品牌展示类型 0表示图片 1表示文字 ',
  PRIMARY KEY (`brand_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='品牌表';


-- -----------------------------
-- Table structure for `ds_cart`
-- -----------------------------
DROP TABLE IF EXISTS `ds_cart`;
CREATE TABLE `ds_cart` (
  `cart_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '购物车自增ID',
  `buyer_id` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '买家ID',
  `store_id` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '店铺ID',
  `store_name` varchar(50) NOT NULL DEFAULT '' COMMENT '店铺名称',
  `goods_id` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '商品ID',
  `goods_name` varchar(100) NOT NULL COMMENT '商品名称',
  `goods_price` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '商品价格',
  `goods_num` smallint(5) unsigned NOT NULL DEFAULT '1' COMMENT '商品数量',
  `goods_image` varchar(100) DEFAULT NULL COMMENT '商品图片',
  `bl_id` mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '组合套装ID',
  PRIMARY KEY (`cart_id`),
  KEY `member_id` (`buyer_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='购物车数据表';


-- -----------------------------
-- Table structure for `ds_chatlog`
-- -----------------------------
DROP TABLE IF EXISTS `ds_chatlog`;
CREATE TABLE `ds_chatlog` (
  `m_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '消息记录自增ID',
  `f_id` int(10) unsigned NOT NULL COMMENT '会员ID',
  `f_name` varchar(50) NOT NULL COMMENT '会员名',
  `f_ip` varchar(15) NOT NULL COMMENT '发自IP',
  `t_id` int(10) unsigned NOT NULL COMMENT '接收会员ID',
  `t_name` varchar(50) NOT NULL COMMENT '接收会员名',
  `t_msg` varchar(300) DEFAULT NULL COMMENT '消息内容',
  `chatlog_addtime` int(10) unsigned DEFAULT '0' COMMENT '添加时间',
  PRIMARY KEY (`m_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='消息记录表';


-- -----------------------------
-- Table structure for `ds_chatmsg`
-- -----------------------------
DROP TABLE IF EXISTS `ds_chatmsg`;
CREATE TABLE `ds_chatmsg` (
  `m_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '消息自增ID',
  `f_id` int(10) unsigned NOT NULL COMMENT '会员ID',
  `f_name` varchar(50) NOT NULL COMMENT '会员名',
  `f_ip` varchar(15) NOT NULL COMMENT '发自IP',
  `t_id` int(10) unsigned NOT NULL COMMENT '接收会员ID',
  `t_name` varchar(50) NOT NULL COMMENT '接收会员名',
  `t_msg` varchar(300) DEFAULT NULL COMMENT '消息内容',
  `r_state` tinyint(1) unsigned DEFAULT '2' COMMENT '状态:1为已读,2为未读,默认为2',
  `chatmsg_addtime` int(10) unsigned DEFAULT '0' COMMENT '添加时间',
  PRIMARY KEY (`m_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='消息表';


-- -----------------------------
-- Table structure for `ds_complain`
-- -----------------------------
DROP TABLE IF EXISTS `ds_complain`;
CREATE TABLE `ds_complain` (
  `complain_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '投诉自增ID',
  `order_id` int(11) NOT NULL COMMENT '订单ID',
  `order_goods_id` int(10) unsigned DEFAULT '0' COMMENT '订单商品ID',
  `accuser_id` int(11) NOT NULL COMMENT '原告ID',
  `accuser_name` varchar(50) NOT NULL COMMENT '原告用户名',
  `accused_id` int(11) NOT NULL COMMENT '被告ID',
  `accused_name` varchar(50) NOT NULL COMMENT '被告名称',
  `complain_subject_content` varchar(50) NOT NULL COMMENT '投诉主题',
  `complain_subject_id` int(11) NOT NULL COMMENT '投诉主题id',
  `complain_content` varchar(255) NOT NULL COMMENT '投诉内容',
  `complain_pic1` varchar(100) DEFAULT NULL COMMENT '投诉图片1',
  `complain_pic2` varchar(100) DEFAULT NULL COMMENT '投诉图片2',
  `complain_pic3` varchar(100) DEFAULT NULL COMMENT '投诉图片3',
  `complain_datetime` int(11) DEFAULT NULL COMMENT '投诉时间',
  `complain_handle_datetime` int(11) DEFAULT NULL COMMENT '投诉处理时间',
  `complain_handle_member_id` int(11) DEFAULT NULL COMMENT '投诉处理人ID',
  `appeal_message` varchar(255) DEFAULT NULL COMMENT '申诉内容',
  `appeal_datetime` int(11) DEFAULT NULL COMMENT '申诉时间',
  `appeal_pic1` varchar(100) DEFAULT NULL COMMENT '申诉图片1',
  `appeal_pic2` varchar(100) DEFAULT NULL COMMENT '申诉图片2',
  `appeal_pic3` varchar(100) DEFAULT NULL COMMENT '申诉图片3',
  `final_handle_message` varchar(255) DEFAULT NULL COMMENT '最终处理意见',
  `final_handle_datetime` int(11) DEFAULT NULL COMMENT '最终处理时间',
  `final_handle_member_id` int(11) DEFAULT NULL COMMENT '最终处理人ID',
  `complain_state` tinyint(4) DEFAULT NULL COMMENT '投诉状态 10:新投诉 20:投诉通过转给被投诉人 30:被投诉人已申诉 40:提交仲裁 99:已关闭',
  `complain_active` tinyint(4) DEFAULT '1' COMMENT '投诉是否通过平台审批 1:未通过 2:通过',
  PRIMARY KEY (`complain_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='投诉表';


-- -----------------------------
-- Table structure for `ds_complainsubject`
-- -----------------------------
DROP TABLE IF EXISTS `ds_complainsubject`;
CREATE TABLE `ds_complainsubject` (
  `complainsubject_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '投诉主题id',
  `complainsubject_content` varchar(50) NOT NULL COMMENT '投诉主题',
  `complainsubject_desc` varchar(100) NOT NULL COMMENT '投诉主题描述',
  `complainsubject_state` tinyint(4) NOT NULL COMMENT '投诉主题状态 1:有效 2:失效',
  PRIMARY KEY (`complainsubject_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COMMENT='投诉主题表';

-- -----------------------------
-- Records of `ds_complainsubject`
-- -----------------------------
INSERT INTO `ds_complainsubject` VALUES ('1', '商家不同意退款', '买家申请退款被拒绝。', '2');
INSERT INTO `ds_complainsubject` VALUES ('2', '未收到货', '交易成功，未收到货，钱已经付给商家，可进行维权。', '1');
INSERT INTO `ds_complainsubject` VALUES ('3', '售后保障服务', '交易完成后30天内，在使用商品过程中，发现商品有质量问题或无法正常使用，可进行维权。', '1');

-- -----------------------------
-- Table structure for `ds_complaintalk`
-- -----------------------------
DROP TABLE IF EXISTS `ds_complaintalk`;
CREATE TABLE `ds_complaintalk` (
  `talk_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '投诉对话自增ID',
  `complain_id` int(11) NOT NULL COMMENT '投诉ID',
  `talk_member_id` int(11) NOT NULL COMMENT '发言人ID',
  `talk_member_name` varchar(50) NOT NULL COMMENT '发言人用户名',
  `talk_member_type` varchar(10) NOT NULL COMMENT '发言人类型(1-投诉人/2-被投诉人/3-平台)',
  `talk_content` varchar(255) NOT NULL COMMENT '发言内容',
  `talk_state` tinyint(4) NOT NULL COMMENT '发言状态(1-显示/2-不显示)',
  `talk_admin` int(11) NOT NULL DEFAULT '0' COMMENT '对话管理员，屏蔽对话人的id',
  `talk_datetime` int(11) NOT NULL COMMENT '对话发表时间',
  PRIMARY KEY (`talk_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='投诉对话表';


-- -----------------------------
-- Table structure for `ds_config`
-- -----------------------------
DROP TABLE IF EXISTS `ds_config`;
CREATE TABLE `ds_config` (
  `id` smallint(5) NOT NULL AUTO_INCREMENT,
  `code` varchar(30) NOT NULL,
  `value` text,
  `remark` varchar(100) DEFAULT '解释,备注',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=717 DEFAULT CHARSET=utf8 COMMENT='配置参数表';

-- -----------------------------
-- Records of `ds_config`
-- -----------------------------
INSERT INTO `ds_config` VALUES ('1', 'site_name', '德尚商城', '商城名称');
INSERT INTO `ds_config` VALUES ('2', 'site_phone', '3', '商城客服服务电话');
INSERT INTO `ds_config` VALUES ('3', 'site_state', '1', '商城状态');
INSERT INTO `ds_config` VALUES ('4', 'site_logo', 'site_logo.png', '商城logo图');
INSERT INTO `ds_config` VALUES ('5', 'member_logo', 'member_logo.png', '默认会员图');
INSERT INTO `ds_config` VALUES ('6', 'seller_center_logo', 'seller_center_logo.jpg', '默认卖家中心logo');
INSERT INTO `ds_config` VALUES ('7', 'site_mobile_logo', 'site_mobile_logo.jpg', '默认商城手机端logo');
INSERT INTO `ds_config` VALUES ('8', 'site_logowx', 'site_logowx.jpg', '微信商城二维码');
INSERT INTO `ds_config` VALUES ('9', 'icp_number', '2', 'ICP备案号');
INSERT INTO `ds_config` VALUES ('10', 'site_tel400', '40002541852', '解释,备注');
INSERT INTO `ds_config` VALUES ('11', 'site_email', '858761000@qq.com', '电子邮件');
INSERT INTO `ds_config` VALUES ('12', 'flow_static_code', '德尚网络科技', '底部版权信息');
INSERT INTO `ds_config` VALUES ('13', 'closed_reason', '7', '商城关闭原因');
INSERT INTO `ds_config` VALUES ('14', 'guest_comment', '1', '是否允许游客咨询');
INSERT INTO `ds_config` VALUES ('15', 'captcha_status_login', '1', '会员登录是否需要验证码');
INSERT INTO `ds_config` VALUES ('16', 'captcha_status_register', '1', '会员注册是否验证码');
INSERT INTO `ds_config` VALUES ('17', 'captcha_status_goodsqa', '1', '商品咨询是否验证码');
INSERT INTO `ds_config` VALUES ('18', 'switching_language_state', '1', '是否开启语言切换切换');
INSERT INTO `ds_config` VALUES ('21', 'default_goods_image', 'default_goods_image.jpg', '默认商品图');
INSERT INTO `ds_config` VALUES ('22', 'default_store_logo', 'default_store_logo.jpg', '默认店铺图');
INSERT INTO `ds_config` VALUES ('23', 'default_store_avatar', 'default_store_avatar.png', '默认店铺图像');
INSERT INTO `ds_config` VALUES ('24', 'default_user_portrait', 'default_user_portrait.gif', '默认会员图像');
INSERT INTO `ds_config` VALUES ('31', 'store_joinin_pic', 'a:2:{s:3:\"pic\";a:3:{i:1;s:18:\"store_joinin_1.jpg\";i:2;s:18:\"store_joinin_2.jpg\";i:3;s:18:\"store_joinin_3.jpg\";}s:8:\"show_txt\";s:6:\"测试\";}', '解释,备注');
INSERT INTO `ds_config` VALUES ('40', 'smscf_wj_username', '', '短信平台账号');
INSERT INTO `ds_config` VALUES ('41', 'smscf_wj_key', '', '短信平台密钥');
INSERT INTO `ds_config` VALUES ('51', 'email_host', 'smtp.126.com', '邮箱地址');
INSERT INTO `ds_config` VALUES ('52', 'email_port', '25', '邮箱端口');
INSERT INTO `ds_config` VALUES ('53', 'email_addr', '', '邮箱发件人地址');
INSERT INTO `ds_config` VALUES ('54', 'email_id', '', '身份验证用户名');
INSERT INTO `ds_config` VALUES ('55', 'email_pass', '', '用户名密码');
INSERT INTO `ds_config` VALUES ('56', 'email_secure', '', '邮箱发送协议');
INSERT INTO `ds_config` VALUES ('60', 'setup_date', '2018-11-30 03:04:54', '安装时间');
INSERT INTO `ds_config` VALUES ('61', 'upload_type', 'local', '图片上传保存方式');
INSERT INTO `ds_config` VALUES ('62', 'alioss_accessid', '', 'accessid');
INSERT INTO `ds_config` VALUES ('63', 'alioss_accesssecret', '', 'oss_accesssecret');
INSERT INTO `ds_config` VALUES ('64', 'alioss_bucket', '', 'oss_bucket');
INSERT INTO `ds_config` VALUES ('65', 'alioss_endpoint', '', 'oss_endpoint');
INSERT INTO `ds_config` VALUES ('66', 'aliendpoint_type', '0', 'aliendpoint_type');
INSERT INTO `ds_config` VALUES ('70', 'node_site_url', '', '站内IM服务器地址');
INSERT INTO `ds_config` VALUES ('71', 'node_site_use', '0', '是否启用im');
INSERT INTO `ds_config` VALUES ('80', 'flea_site_title', '', '');
INSERT INTO `ds_config` VALUES ('81', 'flea_site_description', '', '');
INSERT INTO `ds_config` VALUES ('82', 'flea_site_keywords', '', '');
INSERT INTO `ds_config` VALUES ('83', 'flea_loginpic', '', '');
INSERT INTO `ds_config` VALUES ('91', 'order_auto_receive_day', '7', '自动确认收货的天数');
INSERT INTO `ds_config` VALUES ('92', 'order_auto_cancel_day', '3', '自动取消订单的天数');
INSERT INTO `ds_config` VALUES ('93', 'code_invalid_refund', '7', '兑换码过期自动退款的天数');
INSERT INTO `ds_config` VALUES ('101', 'qq_isuse', '1', '是否使用QQ互联');
INSERT INTO `ds_config` VALUES ('102', 'qq_appid', '', 'qq互联id');
INSERT INTO `ds_config` VALUES ('103', 'qq_appkey', '', 'qq秘钥');
INSERT INTO `ds_config` VALUES ('111', 'sina_isuse', '1', '是的使用微博登录');
INSERT INTO `ds_config` VALUES ('112', 'sina_wb_akey', '', '新浪id');
INSERT INTO `ds_config` VALUES ('113', 'sina_wb_skey', '', '新浪秘钥');
INSERT INTO `ds_config` VALUES ('121', 'sms_register', '0', '是否手机注册');
INSERT INTO `ds_config` VALUES ('122', 'sms_login', '0', '是否手机登录');
INSERT INTO `ds_config` VALUES ('123', 'sms_password', '0', '是否手机找回密码');
INSERT INTO `ds_config` VALUES ('131', 'weixin_isuse', '', '是否微信登录');
INSERT INTO `ds_config` VALUES ('132', 'weixin_appid', '', '微信appid');
INSERT INTO `ds_config` VALUES ('133', 'weixin_secret', '', '微信appserite');
INSERT INTO `ds_config` VALUES ('134', 'consult_prompt', '<p>因厂家更改商品包装、场地、附配件等不做提前通知，且每位咨询者购买、提问时间等不同。为此，客服给到的回复仅对提问者3天内有效，其他网友仅供参考！给您带来的不变还请谅解，谢谢！</p>', '解释,备注');
INSERT INTO `ds_config` VALUES ('135', 'complain_time_limit', '864000', '商品详情页咨询文字提示');
INSERT INTO `ds_config` VALUES ('136', 'malbum_max_sum', '10', '个人相册数量');
INSERT INTO `ds_config` VALUES ('137', 'hot_search', '', '热门搜索关键字');
INSERT INTO `ds_config` VALUES ('138', 'image_allow_ext', 'gif,jpg,jpeg,bmp,png,swf', '允许后缀');
INSERT INTO `ds_config` VALUES ('139', 'image_max_filesize', '1024', '允许上传最大值');
INSERT INTO `ds_config` VALUES ('201', 'flea_isuse', '1', '闲置市场');
INSERT INTO `ds_config` VALUES ('202', 'promotion_allow', '1', '商品促销');
INSERT INTO `ds_config` VALUES ('203', 'groupbuy_allow', '1', '抢购');
INSERT INTO `ds_config` VALUES ('204', 'points_isuse', '1', '开启积分机制');
INSERT INTO `ds_config` VALUES ('205', 'pointshop_isuse', '1', '积分中心');
INSERT INTO `ds_config` VALUES ('206', 'pointprod_isuse', '1', '积分兑换');
INSERT INTO `ds_config` VALUES ('207', 'voucher_allow', '1', '代金券');
INSERT INTO `ds_config` VALUES ('208', 'mgdiscount_allow', '1', '会员等级折扣');
INSERT INTO `ds_config` VALUES ('209', 'mgdiscount_price', '1', '会员等级折扣价格');
INSERT INTO `ds_config` VALUES ('230', 'points_reg', '5', '注册赠送积分数');
INSERT INTO `ds_config` VALUES ('231', 'points_login', '10', '登录赠送积分数');
INSERT INTO `ds_config` VALUES ('232', 'points_comments', '10', '评论赠送积分数');
INSERT INTO `ds_config` VALUES ('233', 'points_signin', '10', '会员签到赠送积分');
INSERT INTO `ds_config` VALUES ('234', 'points_invite', '10', '邀请注册积分');
INSERT INTO `ds_config` VALUES ('235', 'points_rebate', '1', '返佣比例');
INSERT INTO `ds_config` VALUES ('236', 'points_orderrate', '4', '消费额与赠送积分比例');
INSERT INTO `ds_config` VALUES ('237', 'points_ordermax', '4', '每单最多赠送积分');
INSERT INTO `ds_config` VALUES ('240', 'groupbuy_price', '20', '抢购价格');
INSERT INTO `ds_config` VALUES ('241', 'groupbuy_review_day', '3', '抢购审核期');
INSERT INTO `ds_config` VALUES ('250', 'live_pic1', '', '抢购默认幻灯片');
INSERT INTO `ds_config` VALUES ('251', 'live_link1', '', '抢购幻灯片跳转地址');
INSERT INTO `ds_config` VALUES ('252', 'live_pic2', '', '抢购默认幻灯片');
INSERT INTO `ds_config` VALUES ('253', 'live_link2', '', '抢购幻灯片跳转地址');
INSERT INTO `ds_config` VALUES ('254', 'live_pic3', '', '抢购默认幻灯片');
INSERT INTO `ds_config` VALUES ('255', 'live_link3', '', '抢购幻灯片跳转地址');
INSERT INTO `ds_config` VALUES ('256', 'live_pic4', '', '抢购默认幻灯片');
INSERT INTO `ds_config` VALUES ('257', 'live_link4', '', '抢购幻灯片跳转地址');
INSERT INTO `ds_config` VALUES ('260', 'promotion_xianshi_price', '10', '限时促销价格');
INSERT INTO `ds_config` VALUES ('261', 'promotion_mansong_price', '16', '满送活动价格');
INSERT INTO `ds_config` VALUES ('262', 'promotion_bundling_price', '15', '优惠活动价格');
INSERT INTO `ds_config` VALUES ('263', 'promotion_bundling_sum', '10', '允许活动数量');
INSERT INTO `ds_config` VALUES ('264', 'promotion_bundling_goods_sum', '3', '活动最大商品发布数量');
INSERT INTO `ds_config` VALUES ('265', 'promotion_booth_price', '10', '推荐展位价格');
INSERT INTO `ds_config` VALUES ('266', 'promotion_booth_goods_sum', '10', '允许设置最大推荐商品数量');
INSERT INTO `ds_config` VALUES ('267', 'promotion_voucher_price', '10', '代金券价格');
INSERT INTO `ds_config` VALUES ('268', 'promotion_pintuan_price', '10', '拼团套餐价格');
INSERT INTO `ds_config` VALUES ('270', 'voucher_storetimes_limit', '20', '代金券活动数');
INSERT INTO `ds_config` VALUES ('271', 'voucher_buyertimes_limit', '20', '卖家最大领取数');
INSERT INTO `ds_config` VALUES ('280', 'delivery_isuse', '1', '物流自提是否开启');
INSERT INTO `ds_config` VALUES ('290', 'goods_verify', '0', '商品审核');
INSERT INTO `ds_config` VALUES ('301', 'stat_pricerange', 'a:3:{i:0;a:2:{s:1:\"s\";s:1:\"5\";s:1:\"e\";s:2:\"10\";}i:1;a:2:{s:1:\"s\";s:2:\"11\";s:1:\"e\";s:2:\"20\";}i:2;a:2:{s:1:\"s\";s:2:\"21\";s:1:\"e\";s:2:\"25\";}}', '统计商品价格区间');
INSERT INTO `ds_config` VALUES ('302', 'stat_orderpricerange', 'a:1:{i:0;a:2:{s:1:\"s\";s:2:\"21\";s:1:\"e\";s:2:\"30\";}}', '订单金额区间');
INSERT INTO `ds_config` VALUES ('501', 'expset', 'a:4:{s:9:\"login_exp\";s:3:\"151\";s:11:\"comment_exp\";s:1:\"1\";s:7:\"buy_exp\";s:1:\"1\";s:11:\"buy_exp_max\";s:2:\"50\";}', '解释,备注');
INSERT INTO `ds_config` VALUES ('502', 'exppoints_rule', 'a:4:{s:9:\"exp_login\";s:2:\"20\";s:12:\"exp_comments\";s:2:\"10\";s:13:\"exp_orderrate\";s:2:\"10\";s:12:\"exp_ordermax\";s:2:\"10\";}', '解释,备注');
INSERT INTO `ds_config` VALUES ('601', 'member_grade', 'a:4:{i:1;a:3:{s:5:\"level\";i:1;s:10:\"level_name\";s:2:\"V1\";s:9:\"exppoints\";i:0;}i:2;a:3:{s:5:\"level\";i:2;s:10:\"level_name\";s:2:\"V2\";s:9:\"exppoints\";i:150;}i:3;a:3:{s:5:\"level\";i:3;s:10:\"level_name\";s:2:\"V3\";s:9:\"exppoints\";i:200;}i:4;a:3:{s:5:\"level\";i:4;s:10:\"level_name\";s:2:\"V4\";s:9:\"exppoints\";i:500;}}', '解释,备注');
INSERT INTO `ds_config` VALUES ('701', 'inviter_back', 'inviter_back.jpg', '会员推广背景图片');
INSERT INTO `ds_config` VALUES ('702', 'inviter_ratio_1', '0.5', '会员一级推广佣金比例');
INSERT INTO `ds_config` VALUES ('703', 'inviter_ratio_2', '0.3', '会员二级推广佣金比例');
INSERT INTO `ds_config` VALUES ('704', 'inviter_ratio_3', '0.2', '会员三级推广佣金比例');
INSERT INTO `ds_config` VALUES ('705', 'baidu_ak', '22bb7221fc279a484895afcc6a0bb33a', '百度地图AK密钥');
INSERT INTO `ds_config` VALUES ('706', 'inviter_open', '1', '推广开关');
INSERT INTO `ds_config` VALUES ('707', 'inviter_level', '3', '推广级别');
INSERT INTO `ds_config` VALUES ('708', 'inviter_show', '1', '详情页显示推广佣金');
INSERT INTO `ds_config` VALUES ('709', 'inviter_return', '1', '推广员返佣');
INSERT INTO `ds_config` VALUES ('710', 'inviter_view', '0', '推广员审核');
INSERT INTO `ds_config` VALUES ('711', 'inviter_condition', '0', '推广员条件');
INSERT INTO `ds_config` VALUES ('712', 'inviter_condition_amount', '0', '成为推广员的消费门槛');
INSERT INTO `ds_config` VALUES ('713', 'store_bill_cycle', '7', '店铺结算周期（天）');
INSERT INTO `ds_config` VALUES ('714', 'store_withdraw_cycle', '1', '店铺提现周期（天）');
INSERT INTO `ds_config` VALUES ('715', 'store_withdraw_min', '100', '店铺最小提现金额（元）');
INSERT INTO `ds_config` VALUES ('716', 'store_withdraw_max', '10000', '店铺最大提现金额（元）');

-- -----------------------------
-- Table structure for `ds_consult`
-- -----------------------------
DROP TABLE IF EXISTS `ds_consult`;
CREATE TABLE `ds_consult` (
  `consult_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '咨询自增ID',
  `goods_id` int(11) unsigned DEFAULT '0' COMMENT '商品编号',
  `goods_name` varchar(100) NOT NULL COMMENT '商品名称',
  `member_id` int(11) NOT NULL DEFAULT '0' COMMENT '咨询发布者会员ID 0:游客',
  `member_name` varchar(100) DEFAULT NULL COMMENT '会员名称',
  `store_id` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '店铺ID',
  `store_name` varchar(50) NOT NULL COMMENT '店铺名称',
  `consulttype_id` int(10) unsigned NOT NULL COMMENT '咨询类型',
  `consult_content` varchar(255) DEFAULT NULL COMMENT '咨询内容',
  `consult_addtime` int(10) DEFAULT NULL COMMENT '咨询发布时间',
  `consult_reply` varchar(255) DEFAULT '' COMMENT '咨询回复内容',
  `consult_replytime` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '咨询回复时间',
  `consult_isanonymous` tinyint(1) NOT NULL DEFAULT '0' COMMENT '0表示不匿名 1表示匿名',
  PRIMARY KEY (`consult_id`),
  KEY `goods_id` (`goods_id`),
  KEY `seller_id` (`store_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='产品咨询表';


-- -----------------------------
-- Table structure for `ds_consulttype`
-- -----------------------------
DROP TABLE IF EXISTS `ds_consulttype`;
CREATE TABLE `ds_consulttype` (
  `consulttype_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '咨询类型ID',
  `consulttype_name` varchar(10) NOT NULL COMMENT '咨询类型名称',
  `consulttype_introduce` text NOT NULL COMMENT '咨询类型详细介绍',
  `consulttype_sort` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '咨询类型排序',
  PRIMARY KEY (`consulttype_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COMMENT='咨询类型表';

-- -----------------------------
-- Records of `ds_consulttype`
-- -----------------------------
INSERT INTO `ds_consulttype` VALUES ('1', '商品咨询', '后台->交易->咨询管理->咨询类型->编辑', '1');
INSERT INTO `ds_consulttype` VALUES ('2', '支付问题', '后台->交易->咨询管理->咨询类型->编辑', '2');
INSERT INTO `ds_consulttype` VALUES ('3', '发票及保修', '后台->交易->咨询管理->咨询类型->编辑', '3');
INSERT INTO `ds_consulttype` VALUES ('4', '促销及赠品', '后台->交易->咨询管理->咨询类型->编辑', '4');

-- -----------------------------
-- Table structure for `ds_cron`
-- -----------------------------
DROP TABLE IF EXISTS `ds_cron`;
CREATE TABLE `ds_cron` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '执行自增ID',
  `type` tinyint(3) unsigned DEFAULT NULL COMMENT '任务类型 1商品上架 2根据商品id更新商品促销价格 3优惠套装过期 4推荐展位过期 5抢购开始更新商品促销价格 6抢购过期 7限时折扣过期',
  `exeid` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '关联任务的ID[如商品ID,会员ID]',
  `exetime` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '执行时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='任务队列表';


-- -----------------------------
-- Table structure for `ds_daddress`
-- -----------------------------
DROP TABLE IF EXISTS `ds_daddress`;
CREATE TABLE `ds_daddress` (
  `daddress_id` mediumint(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '发货地址ID',
  `store_id` mediumint(10) unsigned NOT NULL DEFAULT '0' COMMENT '店铺ID',
  `seller_name` varchar(50) NOT NULL DEFAULT '' COMMENT '联系人',
  `city_id` mediumint(9) DEFAULT NULL COMMENT '市级ID',
  `area_id` mediumint(10) unsigned NOT NULL DEFAULT '0' COMMENT '地区ID',
  `area_info` varchar(100) DEFAULT NULL COMMENT '省市县',
  `daddress_detail` varchar(100) NOT NULL COMMENT '发货地址',
  `daddress_telphone` varchar(40) DEFAULT NULL COMMENT '发货电话',
  `daddress_company` varchar(50) NOT NULL COMMENT '发货公司',
  `daddress_isdefault` enum('0','1') NOT NULL DEFAULT '0' COMMENT '是否默认 1:是0:不是',
  PRIMARY KEY (`daddress_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='卖家发货地址信息表';


-- -----------------------------
-- Table structure for `ds_deliveryorder`
-- -----------------------------
DROP TABLE IF EXISTS `ds_deliveryorder`;
CREATE TABLE `ds_deliveryorder` (
  `order_id` int(11) NOT NULL COMMENT '订单ID',
  `dlyo_addtime` int(11) DEFAULT '0' COMMENT '订单生成时间',
  `order_sn` varchar(20) DEFAULT NULL COMMENT '订单号',
  `dlyp_id` int(11) DEFAULT NULL COMMENT '自提点ID',
  `shipping_code` varchar(50) DEFAULT NULL COMMENT '物流单号',
  `express_code` varchar(30) DEFAULT NULL COMMENT '快递公司编码',
  `express_name` varchar(30) DEFAULT NULL COMMENT '快递公司名称',
  `reciver_name` varchar(20) DEFAULT NULL COMMENT '收货人',
  `reciver_telphone` varchar(20) DEFAULT NULL COMMENT '收货人电话',
  `reciver_mobphone` varchar(11) DEFAULT NULL COMMENT '收货人手机',
  `dlyo_state` tinyint(3) unsigned NOT NULL DEFAULT '10' COMMENT '订单状态 10:未到站 20:已到站 30:已提取',
  `dlyo_pickup_code` varchar(4) DEFAULT NULL COMMENT '提货码',
  PRIMARY KEY (`order_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='订单自提点表';


-- -----------------------------
-- Table structure for `ds_deliverypoint`
-- -----------------------------
DROP TABLE IF EXISTS `ds_deliverypoint`;
CREATE TABLE `ds_deliverypoint` (
  `dlyp_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '提货站自增ID',
  `dlyp_name` varchar(50) NOT NULL COMMENT '提货站登录名',
  `dlyp_passwd` varchar(32) NOT NULL COMMENT '提货站登录密码',
  `dlyp_truename` varchar(20) NOT NULL COMMENT '真实姓名',
  `dlyp_mobile` varchar(11) NOT NULL COMMENT '手机号码',
  `dlyp_telephony` varchar(20) NOT NULL COMMENT '座机号码',
  `dlyp_addressname` varchar(20) NOT NULL COMMENT '服务站名称',
  `dlyp_area_2` int(10) unsigned NOT NULL COMMENT '二级地区id',
  `dlyp_area_3` int(10) unsigned NOT NULL COMMENT '三级地区id',
  `dlyp_area_info` varchar(255) NOT NULL COMMENT '提货站地区内容',
  `dlyp_address` varchar(255) NOT NULL COMMENT '提货站详细地址',
  `dlyp_idcard` varchar(18) NOT NULL COMMENT '身份证号码',
  `dlyp_idcardimage` varchar(255) NOT NULL COMMENT '身份证照片',
  `dlyp_addtime` int(10) unsigned NOT NULL COMMENT '提货站添加时间',
  `dlyp_state` tinyint(3) unsigned NOT NULL COMMENT '提货站状态 0关闭，1开启，10等待审核, 20审核失败',
  `dlyp_failreason` varchar(255) DEFAULT NULL COMMENT '失败原因',
  PRIMARY KEY (`dlyp_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='提货站表';


-- -----------------------------
-- Table structure for `ds_document`
-- -----------------------------
DROP TABLE IF EXISTS `ds_document`;
CREATE TABLE `ds_document` (
  `document_id` mediumint(11) NOT NULL AUTO_INCREMENT COMMENT '系统文章自增ID',
  `document_code` varchar(255) NOT NULL COMMENT '调用标识码',
  `document_title` varchar(255) NOT NULL COMMENT '系统文章标题',
  `document_content` text NOT NULL COMMENT '系统文章内容',
  `document_time` int(10) unsigned NOT NULL COMMENT '添加时间/修改时间',
  PRIMARY KEY (`document_id`),
  UNIQUE KEY `document_code` (`document_code`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COMMENT='系统文章表';

-- -----------------------------
-- Records of `ds_document`
-- -----------------------------
INSERT INTO `ds_document` VALUES ('1', 'agreement', '用户服务协议', '', '1435672310');
INSERT INTO `ds_document` VALUES ('4', 'open_store', '开店协议', '', '1435672310');
INSERT INTO `ds_document` VALUES ('5', 'groupbuy', '抢购活动协议', '', '1435672310');

-- -----------------------------
-- Table structure for `ds_evaluategoods`
-- -----------------------------
DROP TABLE IF EXISTS `ds_evaluategoods`;
CREATE TABLE `ds_evaluategoods` (
  `geval_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '信誉评价自增ID',
  `geval_orderid` int(11) NOT NULL COMMENT '订单表ID',
  `geval_orderno` varchar(20) NOT NULL COMMENT '订单编号',
  `geval_ordergoodsid` int(11) NOT NULL COMMENT '订单商品表编号',
  `geval_goodsid` int(11) NOT NULL COMMENT '商品表编号',
  `geval_goodsname` varchar(100) NOT NULL COMMENT '商品名称',
  `geval_goodsprice` decimal(10,2) DEFAULT NULL COMMENT '商品价格',
  `geval_goodsimage` varchar(255) DEFAULT NULL COMMENT '商品图片',
  `geval_scores` tinyint(1) NOT NULL COMMENT '1-5分',
  `geval_content` varchar(255) DEFAULT NULL COMMENT '信誉评价内容',
  `geval_isanonymous` tinyint(1) NOT NULL DEFAULT '0' COMMENT '0:不是 1:匿名评价',
  `geval_addtime` int(11) NOT NULL COMMENT '评价时间',
  `geval_storeid` int(11) NOT NULL COMMENT '店铺编号',
  `geval_storename` varchar(100) NOT NULL COMMENT '店铺名称',
  `geval_frommemberid` int(11) NOT NULL COMMENT '评价人编号',
  `geval_frommembername` varchar(100) NOT NULL COMMENT '评价人名称',
  `geval_state` tinyint(1) NOT NULL DEFAULT '0' COMMENT '评价信息的状态 0为正常 1为禁止显示',
  `geval_remark` varchar(255) DEFAULT NULL COMMENT '管理员对评价的处理备注',
  `geval_explain` varchar(255) DEFAULT NULL COMMENT '解释内容',
  `geval_image` varchar(255) DEFAULT NULL COMMENT '晒单图片',
  PRIMARY KEY (`geval_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='信誉评价表';


-- -----------------------------
-- Table structure for `ds_evaluatestore`
-- -----------------------------
DROP TABLE IF EXISTS `ds_evaluatestore`;
CREATE TABLE `ds_evaluatestore` (
  `seval_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '店铺评分自增ID',
  `seval_orderid` int(11) unsigned NOT NULL COMMENT '订单ID',
  `seval_orderno` varchar(100) NOT NULL COMMENT '订单编号',
  `seval_addtime` int(11) unsigned NOT NULL COMMENT '评价时间',
  `seval_storeid` int(11) unsigned NOT NULL COMMENT '店铺ID',
  `seval_storename` varchar(100) NOT NULL COMMENT '店铺名称',
  `seval_memberid` int(11) unsigned NOT NULL COMMENT '买家ID',
  `seval_membername` varchar(100) NOT NULL COMMENT '买家名称',
  `seval_desccredit` tinyint(1) unsigned NOT NULL DEFAULT '5' COMMENT '描述相符评分',
  `seval_servicecredit` tinyint(1) unsigned NOT NULL DEFAULT '5' COMMENT '服务态度评分',
  `seval_deliverycredit` tinyint(1) unsigned NOT NULL DEFAULT '5' COMMENT '发货速度评分',
  PRIMARY KEY (`seval_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='店铺评分表';


-- -----------------------------
-- Table structure for `ds_exppointslog`
-- -----------------------------
DROP TABLE IF EXISTS `ds_exppointslog`;
CREATE TABLE `ds_exppointslog` (
  `explog_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '经验值日志自增ID',
  `explog_memberid` int(11) NOT NULL COMMENT '会员ID',
  `explog_membername` varchar(100) NOT NULL COMMENT '会员名称',
  `explog_points` int(11) NOT NULL DEFAULT '0' COMMENT '经验值负数表示扣除',
  `explog_addtime` int(11) NOT NULL COMMENT '经验值添加时间',
  `explog_desc` varchar(100) NOT NULL COMMENT '经验值操作描述',
  `explog_stage` varchar(50) NOT NULL COMMENT '经验值操作状态',
  PRIMARY KEY (`explog_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='经验值日志表';


-- -----------------------------
-- Table structure for `ds_express`
-- -----------------------------
DROP TABLE IF EXISTS `ds_express`;
CREATE TABLE `ds_express` (
  `express_id` tinyint(1) unsigned NOT NULL AUTO_INCREMENT COMMENT '快递公司自增ID',
  `express_name` varchar(50) NOT NULL COMMENT '快递公司名称',
  `express_state` enum('0','1') NOT NULL DEFAULT '1' COMMENT '快递公司状态',
  `express_code` varchar(50) NOT NULL COMMENT '快递公司编号',
  `express_letter` char(1) NOT NULL COMMENT '快递公司首字母',
  `express_order` enum('1','2') NOT NULL DEFAULT '2' COMMENT '1:常用2:不常用',
  `express_url` varchar(100) NOT NULL COMMENT '快递公司网址',
  `express_zt_state` tinyint(4) DEFAULT '0' COMMENT '是否支持服务站配送0否1是',
  PRIMARY KEY (`express_id`)
) ENGINE=InnoDB AUTO_INCREMENT=48 DEFAULT CHARSET=utf8 COMMENT='快递公司';

-- -----------------------------
-- Records of `ds_express`
-- -----------------------------
INSERT INTO `ds_express` VALUES ('1', '安信达', '0', 'anxindakuaixi', 'A', '2', 'http://www.anxinda.com', '0');
INSERT INTO `ds_express` VALUES ('2', '包裹平邮', '1', 'youzhengguonei', 'B', '2', 'http://yjcx.chinapost.com.cn', '0');
INSERT INTO `ds_express` VALUES ('3', 'CCES', '1', 'cces', 'C', '2', 'http://www.cces.com.cn', '0');
INSERT INTO `ds_express` VALUES ('4', '传喜物流', '1', 'chuanxiwuliu', 'C', '2', 'http://www.cxcod.com', '0');
INSERT INTO `ds_express` VALUES ('5', 'DHL快递', '1', 'dhl', 'D', '2', 'http://www.cn.dhl.com', '0');
INSERT INTO `ds_express` VALUES ('6', '大田物流', '1', 'datianwuliu', 'D', '2', 'http://www.dtw.com.cn', '0');
INSERT INTO `ds_express` VALUES ('7', '德邦物流', '1', 'debangwuliu', 'D', '2', 'http://www.deppon.com', '0');
INSERT INTO `ds_express` VALUES ('8', 'EMS', '1', 'ems', 'E', '2', 'http://www.ems.com.cn', '0');
INSERT INTO `ds_express` VALUES ('9', 'EMS国际', '1', 'emsguoji', 'E', '2', '###', '0');
INSERT INTO `ds_express` VALUES ('10', '飞康达', '1', 'feikangda', 'F', '2', 'http://www.fkd.com.cn', '0');
INSERT INTO `ds_express` VALUES ('11', 'FedEx(国际)', '1', 'fedex', 'F', '2', 'http://fedex.com/cn', '0');
INSERT INTO `ds_express` VALUES ('12', '凡客如风达', '1', 'rufengda', 'F', '2', 'http://www.rufengda.com', '0');
INSERT INTO `ds_express` VALUES ('13', '港中能达', '1', 'ganzhongnengda', 'G', '2', 'http://www.nd56.com', '0');
INSERT INTO `ds_express` VALUES ('14', '挂号信', '1', 'youzhengguonei', 'G', '2', 'http://yjcx.chinapost.com.cn', '0');
INSERT INTO `ds_express` VALUES ('15', '共速达', '1', 'gongsuda', 'G', '2', 'http://www.gongsuda.com/mall/Search.aspx', '0');
INSERT INTO `ds_express` VALUES ('16', '汇通快递', '1', 'huitongkuaidi', 'H', '2', 'http://www.htky365.com', '0');
INSERT INTO `ds_express` VALUES ('17', '华宇物流', '1', 'tiandihuayu', 'H', '2', 'http://www.hoau.net', '0');
INSERT INTO `ds_express` VALUES ('18', '佳吉快运', '1', 'jiajiwuliu', 'J', '2', 'http://www.jiaji.com', '0');
INSERT INTO `ds_express` VALUES ('19', '佳怡物流', '1', 'jiayiwuliu', 'J', '2', 'http://www.jiayi56.com', '0');
INSERT INTO `ds_express` VALUES ('20', '急先达', '1', 'jixianda', 'J', '2', 'http://www.joust.cn', '0');
INSERT INTO `ds_express` VALUES ('21', '快捷速递', '1', 'kuaijiesudi', 'K', '2', 'http://www.fastexpress.com.cn', '0');
INSERT INTO `ds_express` VALUES ('22', '龙邦快递', '1', 'longbanwuliu', 'L', '2', 'http://www.lbex.com.cn', '0');
INSERT INTO `ds_express` VALUES ('23', '联邦快递', '1', 'lianbangkuaidi', 'L', '2', 'http://cndxp.apac.fedex.com/dxp.html', '0');
INSERT INTO `ds_express` VALUES ('24', '联昊通', '1', 'lianhaowuliu', 'L', '2', 'http://www.lhtex.com.cn', '0');
INSERT INTO `ds_express` VALUES ('25', '全一快递', '1', 'quanyikuaidi', 'Q', '2', 'http://www.apex100.com', '0');
INSERT INTO `ds_express` VALUES ('26', '全峰快递', '1', 'quanfengkuaidi', 'Q', '2', 'http://www.qfkd.com.cn', '0');
INSERT INTO `ds_express` VALUES ('27', '全日通', '1', 'quanritongkuaidi', 'Q', '2', 'http://www.at-express.com', '0');
INSERT INTO `ds_express` VALUES ('28', '申通快递', '1', 'shentong', 'S', '2', 'http://www.sto.cn', '0');
INSERT INTO `ds_express` VALUES ('29', '顺丰快递', '1', 'shunfeng', 'S', '1', 'http://www.sf-express.com', '0');
INSERT INTO `ds_express` VALUES ('30', '速尔快递', '1', 'suer', 'S', '2', 'http://www.sure56.com', '0');
INSERT INTO `ds_express` VALUES ('31', 'TNT快递', '1', 'tnt', 'T', '2', 'http://www.tnt.com.cn', '0');
INSERT INTO `ds_express` VALUES ('32', '天天快递', '1', 'tiantian', 'T', '2', 'http://www.ttkdex.com', '0');
INSERT INTO `ds_express` VALUES ('33', '天地华宇', '1', 'tiandihuayu', 'T', '2', 'http://www.hoau.net', '0');
INSERT INTO `ds_express` VALUES ('34', 'UPS快递', '1', 'ups', 'U', '2', 'http://www.ups.com/cn', '0');
INSERT INTO `ds_express` VALUES ('35', 'USPS', '1', 'usps', 'U', '2', 'http://www.kuaidi100.com/all/usps.shtml', '0');
INSERT INTO `ds_express` VALUES ('36', '新邦物流', '1', 'xinbangwuliu', 'X', '2', 'http://www.xbwl.cn', '0');
INSERT INTO `ds_express` VALUES ('37', '信丰物流', '1', 'xinfengwuliu', 'X', '2', 'http://www.xf-express.com.cn', '0');
INSERT INTO `ds_express` VALUES ('38', '希伊艾斯', '1', 'cces', 'X', '2', 'http://www.cces.com.cn', '0');
INSERT INTO `ds_express` VALUES ('39', '新蛋物流', '1', 'neweggozzo', 'X', '2', 'http://www.ozzo.com.cn', '0');
INSERT INTO `ds_express` VALUES ('40', '圆通快递', '1', 'yuantong', 'Y', '1', 'http://www.yto.net.cn', '0');
INSERT INTO `ds_express` VALUES ('41', '韵达快递', '1', 'yunda', 'Y', '1', 'http://www.yundaex.com', '0');
INSERT INTO `ds_express` VALUES ('42', '邮政包裹', '1', 'youzhengguonei', 'Y', '2', 'http://yjcx.chinapost.com.cn', '0');
INSERT INTO `ds_express` VALUES ('43', '优速快递', '1', 'youshuwuliu', 'Y', '2', 'http://www.uc56.com', '0');
INSERT INTO `ds_express` VALUES ('44', '中通快递', '1', 'zhongtong', 'Z', '1', 'http://www.zto.cn', '0');
INSERT INTO `ds_express` VALUES ('45', '中铁快运', '1', 'zhongtiewuliu', 'Z', '2', 'http://www.cre.cn', '0');
INSERT INTO `ds_express` VALUES ('46', '宅急送', '1', 'zhaijisong', 'Z', '2', 'http://www.zjs.com.cn', '0');
INSERT INTO `ds_express` VALUES ('47', '中邮物流', '1', 'zhongyouwuliu', 'Z', '2', 'http://www.cnpl.com.cn', '0');

-- -----------------------------
-- Table structure for `ds_favorites`
-- -----------------------------
DROP TABLE IF EXISTS `ds_favorites`;
CREATE TABLE `ds_favorites` (
  `favlog_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '收藏记录自增ID',
  `member_id` int(10) unsigned NOT NULL COMMENT '会员ID',
  `member_name` varchar(50) NOT NULL COMMENT '会员名',
  `fav_id` int(10) unsigned NOT NULL COMMENT '商品ID或店铺ID',
  `fav_type` char(5) NOT NULL DEFAULT 'goods' COMMENT '类型:goods为商品,store为店铺',
  `fav_time` int(10) unsigned NOT NULL COMMENT '收藏时间',
  `store_id` int(10) unsigned NOT NULL COMMENT '店铺ID',
  `store_name` varchar(20) NOT NULL COMMENT '店铺名称',
  `storeclass_id` int(10) unsigned DEFAULT '0' COMMENT '店铺分类ID',
  `goods_name` varchar(50) DEFAULT NULL COMMENT '商品名称',
  `goods_image` varchar(100) DEFAULT NULL COMMENT '商品图片',
  `gc_id` int(10) unsigned DEFAULT '0' COMMENT '商品分类ID',
  `favlog_price` decimal(10,2) DEFAULT '0.00' COMMENT '商品收藏时价格',
  `favlog_msg` varchar(20) DEFAULT NULL COMMENT '收藏备注',
  PRIMARY KEY (`favlog_id`),
  KEY `member_id` (`member_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='收藏表';


-- -----------------------------
-- Table structure for `ds_flea`
-- -----------------------------
DROP TABLE IF EXISTS `ds_flea`;
CREATE TABLE `ds_flea` (
  `goods_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '闲置自增ID',
  `goods_name` varchar(100) NOT NULL COMMENT '闲置名称',
  `fleaclass_id` int(11) NOT NULL COMMENT '闲置分类ID',
  `fleaclass_name` varchar(200) NOT NULL COMMENT '闲置分类名称',
  `member_id` int(11) NOT NULL COMMENT '店铺ID',
  `member_name` varchar(110) NOT NULL COMMENT '会员名称',
  `goods_image` varchar(100) DEFAULT NULL COMMENT '闲置默认封面图片',
  `goods_tag` varchar(100) NOT NULL COMMENT '闲置标签',
  `goods_price` decimal(10,2) NOT NULL COMMENT '闲置原价',
  `goods_store_price` decimal(10,2) NOT NULL COMMENT '闲置转让价格',
  `goods_show` tinyint(1) NOT NULL COMMENT '闲置上架',
  `goods_click` int(11) NOT NULL DEFAULT '0' COMMENT '闲置浏览数',
  `flea_collect_num` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '闲置物品总收藏次数',
  `goods_commend` tinyint(1) NOT NULL DEFAULT '0' COMMENT '闲置推荐',
  `goods_addtime` varchar(10) NOT NULL COMMENT '闲置添加时间',
  `goods_keywords` varchar(255) NOT NULL COMMENT '闲置关键字',
  `goods_description` varchar(255) NOT NULL COMMENT '闲置描述',
  `goods_body` text NOT NULL COMMENT '商品详细内容',
  `flea_commentnum` int(11) NOT NULL DEFAULT '0' COMMENT '评论次数',
  `flea_salenum` int(11) NOT NULL DEFAULT '0' COMMENT '售出数量',
  `flea_quality` tinyint(4) NOT NULL DEFAULT '0' COMMENT '闲置物品成色，0未选择，9-5九五成新，3是低于五成新',
  `flea_pname` varchar(20) DEFAULT NULL COMMENT '闲置商品联系人',
  `flea_pphone` varchar(20) DEFAULT NULL COMMENT '闲置商品联系人电话',
  `fleaarea_id` int(11) unsigned NOT NULL COMMENT '闲置物品地区id',
  `fleaarea_name` varchar(50) NOT NULL COMMENT '闲置物品地区名称',
  PRIMARY KEY (`goods_id`),
  KEY `goods_name` (`goods_name`,`fleaclass_id`,`member_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COMMENT='闲置商品';

-- -----------------------------
-- Records of `ds_flea`
-- -----------------------------
INSERT INTO `ds_flea` VALUES ('3', '2132121332112', '23', '数码3C产品	U盘', '3', 'test', '', '123321321132', '231123.00', '213321.00', '1', '0', '0', '0', '1543568965', '', '', '', '0', '0', '9', '213312', '13213231232', '0', '');

-- -----------------------------
-- Table structure for `ds_fleaarea`
-- -----------------------------
DROP TABLE IF EXISTS `ds_fleaarea`;
CREATE TABLE `ds_fleaarea` (
  `fleaarea_id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '闲置地区自增ID',
  `fleaarea_name` varchar(50) NOT NULL COMMENT '闲置地区名称',
  `fleaarea_parent_id` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '闲置地区上级地区ID',
  `fleaarea_sort` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '闲置地区排序',
  `fleaarea_deep` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '闲置地区层级',
  `fleaarea_hot` int(11) NOT NULL DEFAULT '0' COMMENT '地区检索热度',
  PRIMARY KEY (`fleaarea_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='闲置地区';


-- -----------------------------
-- Table structure for `ds_fleaclass`
-- -----------------------------
DROP TABLE IF EXISTS `ds_fleaclass`;
CREATE TABLE `ds_fleaclass` (
  `fleaclass_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '闲置分类自增ID',
  `fleaclass_name` varchar(100) NOT NULL COMMENT '闲置分类名称',
  `fleaclass_name_index` varchar(100) DEFAULT NULL COMMENT '闲置首页显示的名称',
  `fleaclass_parent_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '上级ID',
  `fleaclass_sort` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '闲置分类排序',
  `fleaclass_show` tinyint(1) NOT NULL DEFAULT '1' COMMENT '前台显示 0:否 1:是',
  `fleaclass_index_show` tinyint(1) NOT NULL DEFAULT '1' COMMENT '首页显示 1:显示 0:不显示',
  PRIMARY KEY (`fleaclass_id`)
) ENGINE=InnoDB AUTO_INCREMENT=108 DEFAULT CHARSET=utf8 COMMENT='闲置分类';

-- -----------------------------
-- Records of `ds_fleaclass`
-- -----------------------------
INSERT INTO `ds_fleaclass` VALUES ('1', '手机', '', '0', '1', '1', '1');
INSERT INTO `ds_fleaclass` VALUES ('2', '手机', '', '1', '255', '1', '1');
INSERT INTO `ds_fleaclass` VALUES ('3', '配件', '', '1', '255', '1', '1');
INSERT INTO `ds_fleaclass` VALUES ('4', '相机/摄像机', '', '0', '2', '1', '1');
INSERT INTO `ds_fleaclass` VALUES ('5', '单反镜头', '', '4', '255', '1', '1');
INSERT INTO `ds_fleaclass` VALUES ('6', '数码单反', '', '4', '255', '1', '1');
INSERT INTO `ds_fleaclass` VALUES ('7', '普通数码相机', '', '4', '255', '1', '1');
INSERT INTO `ds_fleaclass` VALUES ('8', '胶片相机', '', '4', '255', '1', '1');
INSERT INTO `ds_fleaclass` VALUES ('9', '摄像机', '', '4', '255', '1', '1');
INSERT INTO `ds_fleaclass` VALUES ('10', '其他', '', '4', '255', '1', '1');
INSERT INTO `ds_fleaclass` VALUES ('11', '电脑/电脑配件', '', '0', '3', '1', '1');
INSERT INTO `ds_fleaclass` VALUES ('12', '笔记本电脑', '', '11', '255', '1', '1');
INSERT INTO `ds_fleaclass` VALUES ('13', '平板电脑', '', '11', '255', '1', '1');
INSERT INTO `ds_fleaclass` VALUES ('14', '台式机', '', '11', '255', '1', '1');
INSERT INTO `ds_fleaclass` VALUES ('15', '显示器', '', '11', '255', '1', '1');
INSERT INTO `ds_fleaclass` VALUES ('16', '台式机配件', '', '11', '255', '1', '1');
INSERT INTO `ds_fleaclass` VALUES ('17', '网络设备', '', '11', '255', '1', '1');
INSERT INTO `ds_fleaclass` VALUES ('18', '笔记本配件', '', '11', '255', '1', '1');
INSERT INTO `ds_fleaclass` VALUES ('19', '数码3C产品', '', '0', '4', '1', '1');
INSERT INTO `ds_fleaclass` VALUES ('20', 'MP3/MP4/录音笔', '', '19', '255', '1', '1');
INSERT INTO `ds_fleaclass` VALUES ('21', '游戏机', '', '19', '255', '1', '1');
INSERT INTO `ds_fleaclass` VALUES ('22', '游戏软件', '', '19', '255', '1', '1');
INSERT INTO `ds_fleaclass` VALUES ('23', 'U盘', '', '19', '255', '1', '1');
INSERT INTO `ds_fleaclass` VALUES ('24', '移动硬盘', '', '19', '255', '1', '1');
INSERT INTO `ds_fleaclass` VALUES ('25', '闪存卡', '', '19', '255', '1', '1');
INSERT INTO `ds_fleaclass` VALUES ('26', '其他', '', '19', '255', '1', '1');
INSERT INTO `ds_fleaclass` VALUES ('27', '服装/服饰', '', '0', '5', '1', '1');
INSERT INTO `ds_fleaclass` VALUES ('28', '女装', '', '27', '255', '1', '1');
INSERT INTO `ds_fleaclass` VALUES ('29', '男装', '', '27', '255', '1', '1');
INSERT INTO `ds_fleaclass` VALUES ('30', '男鞋', '', '27', '255', '1', '1');
INSERT INTO `ds_fleaclass` VALUES ('31', '女鞋', '', '27', '255', '1', '1');
INSERT INTO `ds_fleaclass` VALUES ('32', '饰品', '', '27', '255', '1', '1');
INSERT INTO `ds_fleaclass` VALUES ('33', '箱包', '', '27', '255', '1', '1');
INSERT INTO `ds_fleaclass` VALUES ('34', '其他', '', '27', '255', '1', '1');
INSERT INTO `ds_fleaclass` VALUES ('35', '美容/美颜/香水', '', '0', '6', '1', '1');
INSERT INTO `ds_fleaclass` VALUES ('36', '美容护肤', '', '35', '255', '1', '1');
INSERT INTO `ds_fleaclass` VALUES ('37', '彩妆', '', '35', '255', '1', '1');
INSERT INTO `ds_fleaclass` VALUES ('38', '美容工具', '', '35', '255', '1', '1');
INSERT INTO `ds_fleaclass` VALUES ('39', '香水', '', '35', '255', '1', '1');
INSERT INTO `ds_fleaclass` VALUES ('40', '美容护发', '', '35', '255', '1', '1');
INSERT INTO `ds_fleaclass` VALUES ('41', '其他', '', '35', '255', '1', '1');
INSERT INTO `ds_fleaclass` VALUES ('42', '家居/日用品', '', '0', '7', '1', '1');
INSERT INTO `ds_fleaclass` VALUES ('43', '家具', '', '42', '255', '1', '1');
INSERT INTO `ds_fleaclass` VALUES ('44', '日用日化', '', '42', '255', '1', '1');
INSERT INTO `ds_fleaclass` VALUES ('45', '建材', '', '42', '255', '1', '1');
INSERT INTO `ds_fleaclass` VALUES ('46', '家饰家纺', '', '42', '255', '1', '1');
INSERT INTO `ds_fleaclass` VALUES ('47', '其他', '', '42', '255', '1', '1');
INSERT INTO `ds_fleaclass` VALUES ('48', '食品/保健品', '', '0', '8', '1', '1');
INSERT INTO `ds_fleaclass` VALUES ('49', '食品', '', '48', '255', '1', '1');
INSERT INTO `ds_fleaclass` VALUES ('50', '保健品', '', '48', '255', '1', '1');
INSERT INTO `ds_fleaclass` VALUES ('51', '家用电器/影音设备', '', '0', '9', '1', '1');
INSERT INTO `ds_fleaclass` VALUES ('52', '电视机', '', '51', '255', '1', '1');
INSERT INTO `ds_fleaclass` VALUES ('53', '洗衣机', '', '51', '255', '1', '1');
INSERT INTO `ds_fleaclass` VALUES ('54', '空调', '', '51', '255', '1', '1');
INSERT INTO `ds_fleaclass` VALUES ('55', '冰箱', '', '51', '255', '1', '1');
INSERT INTO `ds_fleaclass` VALUES ('56', '其他大家电', '', '51', '255', '1', '1');
INSERT INTO `ds_fleaclass` VALUES ('57', '厨房电器', '', '51', '255', '1', '1');
INSERT INTO `ds_fleaclass` VALUES ('58', '影音/耳机/HIFI', '', '51', '255', '1', '1');
INSERT INTO `ds_fleaclass` VALUES ('59', '生活小家电', '', '51', '255', '1', '1');
INSERT INTO `ds_fleaclass` VALUES ('60', '母婴/儿童用品/玩具', '', '0', '10', '1', '1');
INSERT INTO `ds_fleaclass` VALUES ('61', '孕产妇用品/营养', '', '60', '255', '1', '1');
INSERT INTO `ds_fleaclass` VALUES ('62', '婴儿装/童装', '', '60', '255', '1', '1');
INSERT INTO `ds_fleaclass` VALUES ('63', '玩具/早教/益智', '', '60', '255', '1', '1');
INSERT INTO `ds_fleaclass` VALUES ('64', '婴儿用品', '', '60', '255', '1', '1');
INSERT INTO `ds_fleaclass` VALUES ('65', '奶粉/宝宝营养', '', '60', '255', '1', '1');
INSERT INTO `ds_fleaclass` VALUES ('66', '其他', '', '60', '255', '1', '1');
INSERT INTO `ds_fleaclass` VALUES ('67', '宠物/宠物用品', '', '0', '11', '1', '1');
INSERT INTO `ds_fleaclass` VALUES ('68', '宠物', '', '67', '255', '1', '1');
INSERT INTO `ds_fleaclass` VALUES ('69', '宠物用品', '', '67', '255', '1', '1');
INSERT INTO `ds_fleaclass` VALUES ('70', '宠物食品', '', '67', '255', '1', '1');
INSERT INTO `ds_fleaclass` VALUES ('71', '其他', '', '67', '255', '1', '1');
INSERT INTO `ds_fleaclass` VALUES ('72', '生活服务/票务/卡券', '', '0', '12', '1', '1');
INSERT INTO `ds_fleaclass` VALUES ('73', '电影票', '', '72', '255', '1', '1');
INSERT INTO `ds_fleaclass` VALUES ('74', '演出赛事', '', '72', '255', '1', '1');
INSERT INTO `ds_fleaclass` VALUES ('75', '折扣券/购物卡', '', '72', '255', '1', '1');
INSERT INTO `ds_fleaclass` VALUES ('76', '餐饮美食', '', '72', '255', '1', '1');
INSERT INTO `ds_fleaclass` VALUES ('77', '休闲娱乐', '', '72', '255', '1', '1');
INSERT INTO `ds_fleaclass` VALUES ('78', '生活服务', '', '72', '255', '1', '1');
INSERT INTO `ds_fleaclass` VALUES ('79', '其他', '', '72', '255', '1', '1');
INSERT INTO `ds_fleaclass` VALUES ('80', '书刊音像/问题用品', '', '0', '13', '1', '1');
INSERT INTO `ds_fleaclass` VALUES ('81', '书籍', '', '80', '255', '1', '1');
INSERT INTO `ds_fleaclass` VALUES ('82', 'CD/DVD', '', '80', '255', '1', '1');
INSERT INTO `ds_fleaclass` VALUES ('83', '期刊杂志', '', '80', '255', '1', '1');
INSERT INTO `ds_fleaclass` VALUES ('84', '乐器', '', '80', '255', '1', '1');
INSERT INTO `ds_fleaclass` VALUES ('85', '运动器材', '', '80', '255', '1', '1');
INSERT INTO `ds_fleaclass` VALUES ('86', '文具', '', '80', '255', '1', '1');
INSERT INTO `ds_fleaclass` VALUES ('87', '其他', '', '80', '255', '1', '1');
INSERT INTO `ds_fleaclass` VALUES ('88', '汽摩/电动车/自行车', '', '0', '14', '1', '1');
INSERT INTO `ds_fleaclass` VALUES ('89', '二手整车', '', '88', '255', '1', '1');
INSERT INTO `ds_fleaclass` VALUES ('90', '骑车配件', '', '88', '255', '1', '1');
INSERT INTO `ds_fleaclass` VALUES ('91', '摩托/电动车', '', '88', '255', '1', '1');
INSERT INTO `ds_fleaclass` VALUES ('92', '摩托/电动配件', '', '88', '255', '1', '1');
INSERT INTO `ds_fleaclass` VALUES ('93', '自行车', '', '88', '255', '1', '1');
INSERT INTO `ds_fleaclass` VALUES ('94', '其他', '', '88', '255', '1', '1');
INSERT INTO `ds_fleaclass` VALUES ('95', '珠宝/黄金/手表', '', '0', '15', '1', '1');
INSERT INTO `ds_fleaclass` VALUES ('96', '裴翠', '', '95', '255', '1', '1');
INSERT INTO `ds_fleaclass` VALUES ('97', '黄金', '', '95', '255', '1', '1');
INSERT INTO `ds_fleaclass` VALUES ('98', '玉石', '', '95', '255', '1', '1');
INSERT INTO `ds_fleaclass` VALUES ('99', '钻石', '', '95', '255', '1', '1');
INSERT INTO `ds_fleaclass` VALUES ('100', '手表', '', '95', '255', '1', '1');
INSERT INTO `ds_fleaclass` VALUES ('101', '其他', '', '95', '255', '1', '1');
INSERT INTO `ds_fleaclass` VALUES ('102', '艺术品/收藏品/古董古玩', '', '0', '16', '1', '1');
INSERT INTO `ds_fleaclass` VALUES ('103', '书画', '', '102', '255', '1', '1');
INSERT INTO `ds_fleaclass` VALUES ('104', '收藏品', '', '102', '255', '1', '1');
INSERT INTO `ds_fleaclass` VALUES ('105', '古玩', '', '102', '255', '1', '1');
INSERT INTO `ds_fleaclass` VALUES ('106', '其他', '', '102', '255', '1', '1');
INSERT INTO `ds_fleaclass` VALUES ('107', '其他闲置', '', '0', '17', '1', '1');

-- -----------------------------
-- Table structure for `ds_fleaclassindex`
-- -----------------------------
DROP TABLE IF EXISTS `ds_fleaclassindex`;
CREATE TABLE `ds_fleaclassindex` (
  `fcindex_id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `fcindex_class` varchar(50) NOT NULL COMMENT '类别名称',
  `fcindex_code` varchar(50) NOT NULL COMMENT '类别code',
  `fcindex_id1` varchar(50) NOT NULL DEFAULT '0' COMMENT '分类id1',
  `fcindex_name1` varchar(50) NOT NULL,
  `fcindex_id2` varchar(50) NOT NULL DEFAULT '0' COMMENT '分类id2',
  `fcindex_name2` varchar(50) NOT NULL,
  `fcindex_id3` varchar(50) NOT NULL DEFAULT '0' COMMENT '分类id3',
  `fcindex_name3` varchar(50) NOT NULL,
  `fcindex_id4` varchar(50) NOT NULL DEFAULT '0' COMMENT '分类id4',
  `fcindex_name4` varchar(50) NOT NULL,
  PRIMARY KEY (`fcindex_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COMMENT='闲置首页分类';

-- -----------------------------
-- Records of `ds_fleaclassindex`
-- -----------------------------
INSERT INTO `ds_fleaclassindex` VALUES ('1', '数码', 'shuma', '1', '手机', '4', '相机/摄像', '11', '电脑/配件', '19', '数码3C');
INSERT INTO `ds_fleaclassindex` VALUES ('2', '装扮', 'zhuangban', '27', '服装/服饰', '35', '美容/美颜', '42', '家具/日用', '48', '食品/保健');
INSERT INTO `ds_fleaclassindex` VALUES ('3', '居家', 'jujia', '51', '电器/影音', '60', '母婴/玩具', '67', '宠物/用品', '72', '生活/卡券');
INSERT INTO `ds_fleaclassindex` VALUES ('4', '兴趣', 'xingqu', '80', '书刊/音像', '88', '汽摩/电动', '95', '珠宝/黄金', '102', '艺术/收藏');
INSERT INTO `ds_fleaclassindex` VALUES ('5', '母婴', 'muying', '107', '其他闲置', '4', '相机/摄像', '19', '数码3C', '27', '服装/服饰');

-- -----------------------------
-- Table structure for `ds_fleaconsult`
-- -----------------------------
DROP TABLE IF EXISTS `ds_fleaconsult`;
CREATE TABLE `ds_fleaconsult` (
  `fleaconsult_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '闲置咨询自增ID',
  `goods_id` int(11) DEFAULT '0' COMMENT '商品ID',
  `member_id` int(11) NOT NULL DEFAULT '0' COMMENT '咨询发布者会员编号(0：游客)',
  `seller_id` int(11) NOT NULL COMMENT '信息发布者编号',
  `fleaconsult_email` varchar(255) DEFAULT NULL COMMENT '闲置咨询发布者邮箱',
  `fleaconsult_content` varchar(4000) DEFAULT NULL COMMENT '闲置咨询内容',
  `fleaconsult_addtime` int(10) DEFAULT NULL COMMENT '闲置咨询发布时间',
  `fleaconsult_reply` varchar(4000) DEFAULT NULL COMMENT '闲置咨询回复内容',
  `fleaconsult_reply_time` int(10) DEFAULT NULL COMMENT '闲置咨询回复时间',
  `fleaconsult_type` varchar(20) NOT NULL DEFAULT 'flea' COMMENT '闲置咨询类型',
  PRIMARY KEY (`fleaconsult_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='闲置咨询';


-- -----------------------------
-- Table structure for `ds_fleafavorites`
-- -----------------------------
DROP TABLE IF EXISTS `ds_fleafavorites`;
CREATE TABLE `ds_fleafavorites` (
  `member_id` int(10) unsigned NOT NULL COMMENT '会员ID',
  `fleafav_id` int(10) unsigned NOT NULL COMMENT '收藏ID',
  `fleafav_type` varchar(20) NOT NULL COMMENT '闲置收藏类型',
  `fleafav_time` varchar(10) NOT NULL COMMENT '闲置收藏时间'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='买家闲置收藏表';


-- -----------------------------
-- Table structure for `ds_fleaupload`
-- -----------------------------
DROP TABLE IF EXISTS `ds_fleaupload`;
CREATE TABLE `ds_fleaupload` (
  `fleaupload_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '闲置上传文件自增ID',
  `fleafile_name` varchar(100) DEFAULT NULL COMMENT '文件名',
  `fleafile_size` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '文件大小',
  `store_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '会员ID',
  `fleaupload_type` tinyint(1) NOT NULL DEFAULT '0' COMMENT '默认为0，12为商品切换图片，13为商品内容图片',
  `fleaupload_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '添加时间',
  `item_id` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '信息ID',
  PRIMARY KEY (`fleaupload_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='闲置上传文件表';

-- -----------------------------
-- Records of `ds_fleaupload`
-- -----------------------------
INSERT INTO `ds_fleaupload` VALUES ('1', '3_2018113016384436773.png', '11735', '3', '12', '1543567124', '1');

-- -----------------------------
-- Table structure for `ds_flowstat`
-- -----------------------------
DROP TABLE IF EXISTS `ds_flowstat`;
CREATE TABLE `ds_flowstat` (
  `flowstat_stattime` int(11) unsigned NOT NULL COMMENT '访问日期',
  `flowstat_clicknum` int(11) unsigned NOT NULL COMMENT '访问量',
  `flowstat_type` varchar(10) NOT NULL COMMENT '类型',
  `store_id` int(11) unsigned NOT NULL COMMENT '店铺ID',
  `goods_id` int(11) unsigned NOT NULL COMMENT '商品ID'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='访问量统计表';


-- -----------------------------
-- Table structure for `ds_gadmin`
-- -----------------------------
DROP TABLE IF EXISTS `ds_gadmin`;
CREATE TABLE `ds_gadmin` (
  `gid` smallint(5) unsigned NOT NULL AUTO_INCREMENT COMMENT '权限自增id',
  `gname` varchar(50) DEFAULT NULL COMMENT '权限组名',
  `glimits` text COMMENT '权限组序列',
  PRIMARY KEY (`gid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='权限组';


-- -----------------------------
-- Table structure for `ds_goods`
-- -----------------------------
DROP TABLE IF EXISTS `ds_goods`;
CREATE TABLE `ds_goods` (
  `goods_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '商品自增ID(SKU)',
  `goods_commonid` int(10) unsigned NOT NULL COMMENT '商品公共表id',
  `goods_name` varchar(50) NOT NULL COMMENT '商品名称+规格名称',
  `goods_advword` varchar(150) NOT NULL COMMENT '商品广告词',
  `store_id` int(10) unsigned NOT NULL COMMENT '店铺ID',
  `store_name` varchar(50) NOT NULL COMMENT '店铺名称',
  `gc_id` int(10) unsigned NOT NULL COMMENT '商品分类ID',
  `gc_id_1` int(10) DEFAULT NULL COMMENT '一级分类ID',
  `gc_id_2` int(10) DEFAULT NULL COMMENT '二级分类ID',
  `gc_id_3` int(10) DEFAULT NULL COMMENT '三级分类ID',
  `brand_id` int(10) unsigned DEFAULT '0' COMMENT '品牌ID',
  `goods_price` decimal(10,2) NOT NULL COMMENT '商品价格',
  `goods_promotion_price` decimal(10,2) NOT NULL COMMENT '商品促销价格',
  `goods_promotion_type` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '促销类型 0:无促销 1:抢购 2:限时折扣',
  `goods_marketprice` decimal(10,2) NOT NULL COMMENT '商品市场价',
  `goods_serial` varchar(50) NOT NULL COMMENT '商家编号',
  `goods_storage_alarm` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '商品库存报警值',
  `goods_click` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '商品点击数量',
  `goods_salenum` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '商品销售数量',
  `goods_collect` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '商品收藏数量',
  `goods_spec` text NOT NULL COMMENT '商品规格序列化',
  `goods_storage` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '商品库存',
  `goods_image` varchar(100) DEFAULT '' COMMENT '商品主图',
  `goods_state` tinyint(3) unsigned DEFAULT '0' COMMENT '商品状态 0:下架 1:正常，10:违规（禁售）',
  `goods_verify` tinyint(3) unsigned DEFAULT NULL COMMENT '商品审核 1:通过 0:未通过 10:审核中',
  `goods_addtime` int(10) unsigned NOT NULL COMMENT '商品添加时间',
  `goods_edittime` int(10) unsigned NOT NULL COMMENT '商品编辑时间',
  `areaid_1` int(10) unsigned DEFAULT NULL COMMENT '一级地区id',
  `areaid_2` int(10) unsigned DEFAULT NULL COMMENT '二级地区id',
  `region_id` int(10) unsigned DEFAULT '0' COMMENT '一级地区id',
  `color_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '颜色规格id',
  `transport_id` mediumint(8) unsigned DEFAULT '0' COMMENT '售卖区域id',
  `goods_freight` decimal(10,2) unsigned NOT NULL DEFAULT '0.00' COMMENT '运费 0:免运费',
  `goods_vat` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '是否开具增值税发票 1:是 0:否',
  `goods_commend` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '商品推荐 1:是 0:否',
  `goods_stcids` varchar(255) NOT NULL DEFAULT '' COMMENT '店铺分类ID 首尾用,隔开',
  `evaluation_good_star` tinyint(3) unsigned NOT NULL DEFAULT '5' COMMENT '好评星级',
  `evaluation_count` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '评价数',
  `is_virtual` tinyint(3) DEFAULT '0' COMMENT '是否为虚拟商品 1:是 0:否',
  `virtual_indate` int(10) DEFAULT NULL COMMENT '虚拟商品有效期',
  `virtual_limit` tinyint(3) unsigned DEFAULT NULL COMMENT '虚拟商品购买上限',
  `virtual_invalid_refund` tinyint(3) unsigned DEFAULT '1' COMMENT '是否允许过期退款 1:是 0:否',
  `is_goodsfcode` tinyint(4) DEFAULT '0' COMMENT '是否为F码商品 1:是 0:否',
  `is_appoint` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '是否是预约商品 1:是 0:否',
  `is_presell` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '是否是预售商品 1:是 0:否',
  `is_have_gift` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '是否拥有赠品',
  `is_platform_store` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '是否为平台自营',
  `goods_mgdiscount` text COMMENT '序列化会员等级折扣(商品)',
  PRIMARY KEY (`goods_id`)
) ENGINE=InnoDB AUTO_INCREMENT=128 DEFAULT CHARSET=utf8 COMMENT='商品表';

-- -----------------------------
-- Records of `ds_goods`
-- -----------------------------
INSERT INTO `ds_goods` VALUES ('2', '2', '荣耀V9 play 标配版 3+32G 全网通4G手机 铂光金', '北欧极简设计，EMUI5.1', '1', 'admin', '2', '1', '2', '0', '0', '998.00', '998.00', '0', '1290.00', '1', '0', '4', '0', '0', 'N;', '900', '1_2017092120144795113.jpg', '1', '1', '1505996432', '1506662106', '0', '0', '0', '0', '0', '0.00', '0', '1', '', '5', '0', '1', '1514476799', '1', '0', '0', '0', '0', '0', '1', '');
INSERT INTO `ds_goods` VALUES ('3', '3', 'Apple/苹果 iPhone 7plus 128GB 玫瑰金色 移动联通电信4G手机', '购机即送精美防尘塞+便捷支架+鱼骨绕线器+店铺延保一年', '1', 'admin', '2', '1', '2', '0', '0', '6999.00', '6999.00', '0', '7100.00', '2', '10', '6', '0', '0', 'N;', '899', '1_2017092120244885492.jpg', '1', '1', '1505996810', '1506081445', '0', '0', '0', '0', '0', '0.00', '0', '1', '', '5', '0', '0', '0', '0', '0', '0', '0', '0', '0', '1', '');
INSERT INTO `ds_goods` VALUES ('4', '4', 'nubia/努比亚Z17 6G+64G 全网通4G手机 烈焰红 无边框', '烈焰红 无边框', '1', 'admin', '2', '1', '2', '0', '0', '2699.00', '2699.00', '0', '3000.00', '3', '10', '3', '0', '0', 'N;', '899', '1_2017092120312320763.jpg', '1', '1', '1505997092', '1506602848', '0', '0', '0', '0', '0', '0.00', '0', '1', '', '5', '0', '0', '0', '0', '0', '0', '0', '0', '0', '1', '');
INSERT INTO `ds_goods` VALUES ('5', '5', '智能电动代步车', '长续航蓝牙遥控 轻小便携', '1', 'admin', '3', '1', '3', '0', '0', '1990.00', '1990.00', '0', '2000.00', '4', '0', '5', '0', '0', 'N;', '99', '1_2017092120345719915.jpg', '1', '1', '1505997303', '1506616770', '0', '0', '0', '0', '0', '0.00', '0', '1', '', '5', '0', '0', '0', '0', '0', '0', '0', '0', '0', '1', '');
INSERT INTO `ds_goods` VALUES ('6', '6', '灵动Lite版 NV3012 视频通话智能机器人', '人工智能 视频聊天儿童早教益智娱乐 智能家居', '1', 'admin', '3', '1', '3', '0', '0', '149.00', '149.00', '0', '150.00', '5', '10', '0', '0', '0', 'N;', '56', '1_2017092120365848023.jpg', '1', '1', '1505997421', '1505997423', '0', '0', '0', '0', '0', '0.00', '0', '1', '', '5', '0', '0', '0', '0', '0', '0', '0', '0', '0', '1', '');
INSERT INTO `ds_goods` VALUES ('7', '7', 'HOST好帅智能云教育机器人二蛋Q6 ', '早教机英语学习机国学儿童陪护 玩具礼物百科全书正版音乐播放机京剧粤剧儿歌国学', '1', 'admin', '3', '1', '3', '0', '0', '1699.00', '1699.00', '0', '2000.00', '6', '0', '4', '0', '0', 'N;', '199', '1_2017092120382376796.jpg', '1', '1', '1505997509', '1506609730', '0', '0', '0', '0', '0', '0.00', '0', '1', '', '5', '0', '0', '0', '0', '0', '0', '0', '0', '0', '1', '');
INSERT INTO `ds_goods` VALUES ('8', '8', '先锋(Pioneer)LED-39B700S 39英寸 高清 网络 智能 液晶电视', '六核高速处理器 智能系统 高清解码 聚力影视资源  ', '1', 'admin', '5', '4', '5', '0', '0', '1599.00', '1599.00', '0', '1699.00', '7', '0', '1', '0', '0', 'N;', '399', '1_2017092120445748551.jpg', '1', '1', '1505997903', '1506272856', '0', '0', '0', '0', '0', '0.00', '0', '1', '', '5', '0', '0', '0', '0', '0', '0', '0', '0', '0', '1', '');
INSERT INTO `ds_goods` VALUES ('9', '9', '长虹（CHANGHONG）39M1 39英寸 窄边高清液晶电视（黑色）', '蓝光护眼电视，卧室精选', '1', 'admin', '5', '4', '5', '0', '0', '1399.00', '1399.00', '0', '1500.00', '8', '0', '0', '0', '0', 'N;', '69', '1_2017092120480147477.jpg', '1', '1', '1505998084', '1505998087', '0', '0', '0', '0', '0', '0.00', '0', '1', '', '5', '0', '0', '0', '0', '0', '0', '0', '0', '0', '1', '');
INSERT INTO `ds_goods` VALUES ('10', '10', '39英寸64位24核安卓智能平板液晶电视（黑色）', '炫彩A+屏看的更清晰，2K电视4K芯！HDR10让画面栩栩如生', '1', 'admin', '5', '4', '5', '0', '0', '1200.00', '1200.00', '0', '1399.00', '', '0', '0', '0', '0', 'N;', '45', '1_2017092120493430154.jpg', '1', '1', '1505998176', '1505998179', '0', '0', '0', '0', '0', '0.00', '0', '1', '', '5', '0', '0', '0', '0', '0', '0', '0', '0', '0', '1', '');
INSERT INTO `ds_goods` VALUES ('11', '11', '1.5匹 变频 智能 二级能效极速侠 空调挂机', '60秒暖房，wifi智控，18分贝静音，焕新家，就是这么简单！', '1', 'admin', '6', '4', '6', '0', '0', '2699.00', '2699.00', '0', '2780.00', '9', '0', '0', '0', '0', 'N;', '700', '1_2017092120564717575.jpg', '1', '1', '1505998723', '1505998725', '0', '0', '0', '0', '0', '0.00', '0', '1', '', '5', '0', '0', '0', '0', '0', '0', '0', '0', '0', '1', '');
INSERT INTO `ds_goods` VALUES ('12', '12', '扬子(YAIR) 小2匹 冷暖 自动清洗 定频空调柜机', '日立压缩机，全网比价，柜机中的战斗机', '1', 'admin', '6', '4', '6', '0', '0', '2999.00', '2999.00', '0', '3200.00', '10', '0', '0', '0', '0', 'N;', '390', '1_2017092121050988491.jpg', '1', '1', '1505999121', '1505999124', '0', '0', '0', '0', '0', '0.00', '0', '1', '', '5', '0', '0', '0', '0', '0', '0', '0', '0', '0', '1', '');
INSERT INTO `ds_goods` VALUES ('13', '13', '变频风冷无霜 独立双循环 LED显示 对开门冰箱（白色)', '   变频压缩机，双独立循环，满足对空气、温度、湿度要求，创造大容量保鲜奇迹！并联双循环+智能精准控温', '1', 'admin', '7', '4', '7', '0', '0', '5380.00', '5380.00', '0', '5399.00', '11', '0', '2', '0', '0', 'N;', '180', '1_2017092121142556524.jpg', '1', '1', '1505999668', '1506080123', '0', '0', '0', '0', '0', '0.00', '0', '1', '', '5', '0', '0', '0', '0', '0', '0', '0', '0', '0', '1', '');
INSERT INTO `ds_goods` VALUES ('14', '14', '三门冰箱', ' 家用节能 中门软冷冻 红色玻璃面板 静音低噪', '1', 'admin', '7', '4', '7', '0', '0', '1433.00', '1433.00', '0', '1699.00', '12', '0', '0', '0', '0', 'N;', '69', '1_2017092121225164684.jpg', '1', '1', '1506000181', '1506000196', '0', '0', '0', '0', '0', '0.00', '0', '1', '', '5', '0', '0', '0', '0', '0', '0', '0', '0', '0', '1', '');
INSERT INTO `ds_goods` VALUES ('15', '15', '方太（FOTILE）云魔方欧式 烟灶套餐', '18立方 天然气', '1', 'admin', '20', '8', '20', '0', '0', '4299.00', '4299.00', '0', '4380.00', '13', '0', '2', '0', '0', 'N;', '58', '1_2017092121260662503.jpg', '1', '1', '1506000371', '1506082454', '0', '0', '0', '0', '0', '0.00', '0', '1', '', '5', '0', '0', '0', '0', '0', '0', '0', '0', '0', '1', '');
INSERT INTO `ds_goods` VALUES ('16', '16', '美的(Midea)台嵌两用燃气灶JZT-Q360B防爆钢化玻璃面板', '4.2KW强劲火力；五档精控；时尚方灶，高端厨房品质之选！  ', '1', 'admin', '20', '8', '20', '0', '0', '1190.00', '1190.00', '0', '1200.00', '14', '0', '0', '0', '0', 'N;', '140', '1_2017092121492327671.jpg', '1', '1', '1506001770', '1506001773', '0', '0', '0', '0', '0', '0.00', '0', '1', '', '5', '0', '0', '0', '0', '0', '0', '0', '0', '0', '1', '');
INSERT INTO `ds_goods` VALUES ('17', '17', '飞科(FLYCO) 电动剃须刀', '全身水洗，USB充电系统，优雅充电底座，刀架可浮动，1小时快充', '1', 'admin', '21', '8', '21', '0', '0', '145.00', '145.00', '0', '160.00', '15', '0', '0', '0', '0', 'N;', '456', '1_2017092121542617701.jpg', '1', '1', '1506002071', '1506002073', '0', '0', '0', '0', '0', '0.00', '0', '1', '', '5', '0', '0', '0', '0', '0', '0', '0', '0', '0', '1', '');
INSERT INTO `ds_goods` VALUES ('18', '18', '美的（Midea）电饭煲', '不锈钢外壳 智能一键通 24小时预约3-4-5-6人电饭锅', '1', 'admin', '21', '8', '21', '0', '0', '199.00', '199.00', '0', '210.00', '16', '0', '1', '0', '0', 'N;', '132', '1_2017092121564484910.jpg', '1', '1', '1506002220', '1506082498', '0', '0', '0', '0', '0', '0.00', '0', '1', '', '5', '0', '0', '0', '0', '0', '0', '0', '0', '0', '1', '');
INSERT INTO `ds_goods` VALUES ('19', '19', '孔雀尾 菜刀套装', '刀具齐全 优质钢材 经久耐用 耐腐蚀高强度', '1', 'admin', '22', '8', '22', '0', '0', '368.00', '368.00', '0', '400.00', '17', '0', '2', '0', '0', 'N;', '454', '1_2017092122005521920.jpg', '1', '1', '1506002467', '1506082460', '0', '0', '0', '0', '0', '0.00', '0', '1', '', '5', '0', '0', '0', '0', '0', '0', '0', '0', '0', '1', '');
INSERT INTO `ds_goods` VALUES ('20', '20', '苏泊尔（supor)家用真空保温壶·晶韵系列KC20AP1(摩卡金)', '2L大容量 真空保温 304不锈钢 保冷保热  ', '1', 'admin', '22', '8', '22', '0', '0', '199.00', '199.00', '0', '250.00', '', '0', '0', '0', '0', 'N;', '248', '1_2017092122035543274.jpg', '1', '1', '1506002646', '1506002648', '0', '0', '0', '0', '0', '0.00', '0', '1', '', '5', '0', '0', '0', '0', '0', '0', '0', '0', '0', '1', '');
INSERT INTO `ds_goods` VALUES ('21', '21', '联想(Lenovo)拯救者Y520 15.6英寸游戏笔记本电脑', 'R720同模具，加128SSD混合硬盘，GTX1050显卡，背光键盘', '1', 'admin', '23', '9', '23', '0', '0', '5400.00', '5400.00', '0', '5499.00', '20', '0', '0', '0', '0', 'N;', '459', '1_2017092123585272874.jpg', '1', '1', '1506009741', '1506009743', '0', '0', '0', '0', '0', '0.00', '0', '1', '', '5', '0', '0', '0', '0', '0', '0', '0', '0', '0', '1', '');
INSERT INTO `ds_goods` VALUES ('22', '22', '华硕（ASUS）FH5900 顽石电竞版15.6英寸游戏笔记本电脑', '1T 940MX-2G独显', '1', 'admin', '23', '9', '23', '0', '0', '4499.00', '4499.00', '0', '4500.00', '20', '0', '0', '0', '0', 'N;', '168', '1_2017092200403659812.jpg', '1', '1', '1506012042', '1506012045', '0', '0', '0', '0', '0', '0.00', '0', '1', '', '5', '0', '0', '0', '0', '0', '0', '0', '0', '0', '1', '');
INSERT INTO `ds_goods` VALUES ('23', '23', '戴尔(DELL)灵越Ins15MR-7528SS 15.6英寸笔记本电脑', '', '1', 'admin', '23', '9', '23', '0', '0', '3999.00', '3999.00', '0', '4200.00', '21', '0', '4', '0', '0', 'N;', '230', '1_2017092201034951336.jpg', '1', '1', '1506013470', '1506099311', '0', '0', '0', '0', '0', '0.00', '0', '1', '', '5', '0', '0', '0', '0', '0', '0', '0', '0', '0', '1', '');
INSERT INTO `ds_goods` VALUES ('24', '24', '佳能(Canon) EOS M10 微单套机', '时尚翻屏设计-超赞屏幕取景-WiFi随拍随秀', '1', 'admin', '24', '9', '24', '0', '0', '2290.00', '2290.00', '0', '2999.00', '22', '0', '2', '0', '0', 'N;', '145', '1_2017092201084565859.jpg', '1', '1', '1506013739', '1506257962', '0', '0', '0', '0', '0', '0.00', '0', '1', '', '5', '0', '0', '0', '0', '0', '0', '0', '0', '0', '1', '');
INSERT INTO `ds_goods` VALUES ('25', '25', ' 数码单反相机', '下单赠送主图大礼包 内存卡 相机包 三脚架', '1', 'admin', '24', '9', '24', '0', '0', '4280.00', '4280.00', '0', '4300.00', '23', '0', '2', '0', '0', 'N;', '128', '1_2017092201381015306.jpg', '1', '1', '1506015501', '1506272844', '0', '0', '0', '0', '0', '0.00', '0', '1', '', '5', '0', '0', '0', '0', '0', '0', '0', '0', '0', '1', '');
INSERT INTO `ds_goods` VALUES ('26', '26', '南极人(NanJiren) 加高蒙古包蚊帐', '开门支架学生宿舍单人双人B', '1', 'admin', '25', '10', '25', '0', '0', '59.00', '59.00', '0', '66.00', '10', '0', '0', '0', '0', 'N;', '78', '1_2017092201461861948.jpg', '1', '1', '1506015989', '1506015992', '0', '0', '0', '0', '0', '0.00', '0', '1', '', '5', '0', '0', '0', '0', '0', '0', '0', '0', '0', '1', '');
INSERT INTO `ds_goods` VALUES ('27', '27', '小狮子抱枕', ' 带给你专宠的美好', '1', 'admin', '25', '10', '25', '0', '0', '39.00', '39.00', '0', '45.00', '28', '10', '0', '0', '0', 'N;', '99', '1_2017092201523177266.jpg', '1', '1', '1506016354', '1506016361', '0', '0', '0', '0', '0', '0.00', '0', '1', '', '5', '0', '0', '0', '0', '0', '0', '0', '0', '0', '1', '');
INSERT INTO `ds_goods` VALUES ('28', '28', '南极人(NanJiren)纯棉床单四件套全棉床上用品婚庆被套4件套', '夏日约“惠”南极人', '1', 'admin', '26', '10', '26', '0', '0', '109.00', '109.00', '0', '120.00', '', '0', '0', '0', '0', 'N;', '147', '1_2017092202022516767.jpg', '1', '1', '1506016948', '1506016953', '0', '0', '0', '0', '0', '0.00', '0', '1', '', '5', '0', '0', '0', '0', '0', '0', '0', '0', '0', '1', '');
INSERT INTO `ds_goods` VALUES ('29', '29', '欧式美式实木雕花沙发 高档大户型客厅真皮沙发头层牛皮沙发组合', '头层牛皮+全实木', '1', 'admin', '26', '10', '26', '0', '0', '1320.00', '1320.00', '0', '1400.00', '26', '0', '0', '0', '0', 'N;', '99', '1_2017092202082283957.jpg', '1', '1', '1506017336', '1506017338', '0', '0', '0', '0', '0', '0.00', '0', '1', '', '5', '0', '0', '0', '0', '0', '0', '0', '0', '0', '1', '');
INSERT INTO `ds_goods` VALUES ('30', '30', '北欧简约现代日式可拆洗布艺床', '小户型实木婚床软床', '1', 'admin', '26', '10', '26', '0', '0', '1980.00', '1980.00', '0', '2100.00', '', '0', '0', '0', '0', 'N;', '49', '1_2017092202112937358.jpg', '1', '1', '1506017493', '1506017495', '0', '0', '0', '0', '0', '0.00', '0', '1', '', '5', '0', '0', '0', '0', '0', '0', '0', '0', '0', '1', '');
INSERT INTO `ds_goods` VALUES ('31', '31', '宜莱芙 吸盘挂壁式牙刷架漱口杯套装（4口之家）', '', '1', 'admin', '27', '10', '27', '0', '0', '49.00', '49.00', '0', '55.00', '27', '0', '0', '0', '0', 'N;', '78', '1_2017092202162519571.jpg', '1', '1', '1506017804', '1506017806', '0', '0', '0', '0', '0', '0.00', '0', '1', '', '5', '0', '0', '0', '0', '0', '0', '0', '0', '0', '1', '');
INSERT INTO `ds_goods` VALUES ('32', '32', '日用浴室用品现代时尚家居家用浴帘', '宽150*高180+环 一个装', '1', 'admin', '27', '10', '27', '0', '0', '22.50', '22.50', '0', '25.00', '28', '0', '0', '0', '0', 'N;', '59', '1_2017092202215519250.jpg', '1', '1', '1506018119', '1506018121', '0', '0', '0', '0', '0', '0.00', '0', '1', '', '5', '0', '0', '0', '0', '0', '0', '0', '0', '0', '1', '');
INSERT INTO `ds_goods` VALUES ('33', '33', '益达 木糖醇清爽西瓜味40粒瓶装56g', '关爱牙齿，更关心您', '1', 'admin', '28', '11', '28', '0', '0', '12.80', '12.80', '0', '13.00', '10', '0', '0', '0', '0', 'N;', '998', '1_2017092202310929808.jpg', '1', '1', '1506018671', '1506018673', '0', '0', '0', '0', '0', '0.00', '0', '1', '', '5', '0', '0', '0', '0', '0', '0', '0', '0', '0', '1', '');
INSERT INTO `ds_goods` VALUES ('34', '34', '三只松鼠_小贱串烧味拉面丸子85g', '闲膨化零食拉面丸子休闲丸子串烧味', '1', 'admin', '28', '11', '28', '0', '0', '13.80', '13.80', '0', '14.00', '', '0', '0', '0', '0', 'N;', '546', '1_2017092202323192694.jpg', '1', '1', '1506018762', '1506018764', '0', '0', '0', '0', '0', '0.00', '0', '1', '', '5', '0', '0', '0', '0', '0', '0', '0', '0', '0', '1', '');
INSERT INTO `ds_goods` VALUES ('36', '36', '洋河 梦之蓝M3-52度500ml', '', '1', 'admin', '29', '11', '29', '0', '0', '528.00', '528.00', '0', '570.00', '', '0', '0', '0', '0', 'N;', '85', '1_2017092202350299027.jpg', '1', '1', '1506018905', '1506018907', '0', '0', '0', '0', '0', '0.00', '0', '1', '', '5', '0', '0', '0', '0', '0', '0', '0', '0', '0', '1', '');
INSERT INTO `ds_goods` VALUES ('37', '37', '五粮液 红 52度', '孝敬长辈，推荐用酒', '1', 'admin', '29', '11', '29', '0', '0', '695.00', '695.00', '0', '820.00', '31', '0', '0', '0', '0', 'a:2:{i:1;s:3:\"红\";i:37;s:5:\"52度\";}', '450', '1_2017092202382291274.jpg', '1', '1', '1506019112', '1506019114', '0', '0', '0', '1', '0', '0.00', '0', '1', '', '5', '0', '0', '0', '0', '0', '0', '0', '0', '0', '1', '');
INSERT INTO `ds_goods` VALUES ('39', '39', '自然堂 水润保湿两件套 补水保湿套装', '', '1', 'admin', '30', '12', '30', '0', '0', '69.40', '69.40', '0', '70.00', '', '0', '0', '0', '0', 'N;', '148', '1_2017092202443553519.jpg', '1', '1', '1506019477', '1506019479', '0', '0', '0', '0', '0', '0.00', '0', '1', '', '5', '0', '0', '0', '0', '0', '0', '0', '0', '0', '1', '');
INSERT INTO `ds_goods` VALUES ('40', '40', '百雀羚水能量焕耀套装补水保湿护肤套装 两件套 翠绿 200ml', '补水修复 宛若新生  ', '1', 'admin', '30', '12', '30', '0', '0', '369.00', '369.00', '0', '400.00', '34', '0', '1', '0', '0', 'a:3:{i:42;s:9:\"两件套\";i:45;s:6:\"翠绿\";i:46;s:5:\"200ml\";}', '25', '1_2017092202461115940.jpg', '1', '1', '1506019573', '1506023205', '0', '0', '0', '42', '0', '0.00', '0', '1', '', '5', '0', '0', '0', '0', '0', '0', '0', '0', '0', '1', '');
INSERT INTO `ds_goods` VALUES ('41', '41', ' 小黑裙香水洗发水+沐浴露 500ml', ' 风魔欧美 持久留香 洗护套装', '1', 'admin', '31', '12', '31', '0', '0', '45.90', '45.90', '0', '40.00', '38', '0', '0', '0', '0', 'a:1:{i:1;s:5:\"500ml\";}', '58', '1_2017092202492958131.jpg', '1', '1', '1506019782', '1506019787', '0', '0', '0', '1', '0', '0.00', '0', '1', '', '5', '0', '0', '0', '0', '0', '0', '0', '0', '0', '1', '');
INSERT INTO `ds_goods` VALUES ('42', '42', '滋源无硅油洗发水氨基酸生姜535洗护发套装 两件套 紫 500ml', '', '1', 'admin', '31', '12', '31', '0', '0', '179.00', '179.00', '0', '189.00', '39', '0', '0', '0', '0', 'a:3:{i:49;s:9:\"两件套\";i:1;s:3:\"紫\";i:47;s:5:\"500ml\";}', '45', '1_2017092202514891485.jpg', '1', '1', '1506019911', '1506019916', '0', '0', '0', '49', '0', '0.00', '0', '1', '', '5', '0', '0', '0', '0', '0', '0', '0', '0', '0', '1', '');
INSERT INTO `ds_goods` VALUES ('43', '43', '宠物用品出行牵引带', '', '1', 'admin', '32', '12', '32', '0', '0', '14.90', '14.90', '0', '25.00', '39', '0', '0', '0', '0', 'N;', '126', '1_2017092202553367071.jpg', '1', '1', '1506020205', '1506020208', '0', '0', '0', '0', '0', '0.00', '0', '1', '', '5', '0', '0', '0', '0', '0', '0', '0', '0', '0', '1', '');
INSERT INTO `ds_goods` VALUES ('44', '44', '家用宠物日用品饮水器喝水瓶', '', '1', 'admin', '32', '12', '32', '0', '0', '14.90', '14.90', '0', '15.00', '35', '10', '0', '0', '0', 'N;', '120', '1_2017092202585843151.jpg', '1', '1', '1506020341', '1506020345', '0', '0', '0', '0', '0', '0.00', '0', '1', '', '5', '0', '0', '0', '0', '0', '0', '0', '0', '0', '1', '');
INSERT INTO `ds_goods` VALUES ('45', '45', '与牧2017韩版短款 针织 黑 M', '', '1', 'admin', '39', '15', '39', '0', '0', '39.00', '39.00', '0', '42.00', '', '0', '1', '0', '0', 'a:3:{i:1;s:6:\"针织\";i:3;s:3:\"黑\";i:8;s:1:\"M\";}', '100', '1_2017092203045216863.jpg', '1', '1', '1506020705', '1506272777', '0', '0', '0', '1', '0', '0.00', '0', '1', '', '5', '0', '0', '0', '0', '0', '0', '0', '0', '0', '1', '');
INSERT INTO `ds_goods` VALUES ('46', '45', '与牧2017韩版短款 针织 黑 L', '', '1', 'admin', '39', '15', '39', '0', '0', '39.00', '39.00', '0', '42.00', '', '0', '0', '0', '0', 'a:3:{i:1;s:6:\"针织\";i:3;s:3:\"黑\";i:9;s:1:\"L\";}', '100', '1_2017092203045216863.jpg', '1', '1', '1506020705', '1506020714', '0', '0', '0', '1', '0', '0.00', '0', '1', '', '5', '0', '0', '0', '0', '0', '0', '0', '0', '0', '1', '');
INSERT INTO `ds_goods` VALUES ('47', '45', '与牧2017韩版短款 针织 黑 XL', '', '1', 'admin', '39', '15', '39', '0', '0', '39.00', '39.00', '0', '42.00', '', '0', '0', '0', '0', 'a:3:{i:1;s:6:\"针织\";i:3;s:3:\"黑\";i:10;s:2:\"XL\";}', '100', '1_2017092203045216863.jpg', '1', '1', '1506020705', '1506020714', '0', '0', '0', '1', '0', '0.00', '0', '1', '', '5', '0', '0', '0', '0', '0', '0', '0', '0', '0', '1', '');
INSERT INTO `ds_goods` VALUES ('48', '45', '与牧2017韩版短款 针织 白 M', '', '1', 'admin', '39', '15', '39', '0', '0', '39.00', '39.00', '0', '42.00', '', '0', '0', '0', '0', 'a:3:{i:1;s:6:\"针织\";i:4;s:3:\"白\";i:8;s:1:\"M\";}', '140', '1_2017092203045216863.jpg', '1', '1', '1506020705', '1506020714', '0', '0', '0', '1', '0', '0.00', '0', '1', '', '5', '0', '0', '0', '0', '0', '0', '0', '0', '0', '1', '');
INSERT INTO `ds_goods` VALUES ('49', '45', '与牧2017韩版短款 针织 白 L', '', '1', 'admin', '39', '15', '39', '0', '0', '39.00', '39.00', '0', '42.00', '', '0', '0', '0', '0', 'a:3:{i:1;s:6:\"针织\";i:4;s:3:\"白\";i:9;s:1:\"L\";}', '100', '1_2017092203045216863.jpg', '1', '1', '1506020705', '1506020714', '0', '0', '0', '1', '0', '0.00', '0', '1', '', '5', '0', '0', '0', '0', '0', '0', '0', '0', '0', '1', '');
INSERT INTO `ds_goods` VALUES ('50', '45', '与牧2017韩版短款 针织 白 XL', '', '1', 'admin', '39', '15', '39', '0', '0', '39.00', '39.00', '0', '42.00', '', '0', '0', '0', '0', 'a:3:{i:1;s:6:\"针织\";i:4;s:3:\"白\";i:10;s:2:\"XL\";}', '100', '1_2017092203045216863.jpg', '1', '1', '1506020705', '1506020714', '0', '0', '0', '1', '0', '0.00', '0', '1', '', '5', '0', '0', '0', '0', '0', '0', '0', '0', '0', '1', '');
INSERT INTO `ds_goods` VALUES ('51', '46', '蔚缇2017夏季小花网纱+吊带+喇叭裤三件套女', '限时促销', '1', 'admin', '39', '15', '39', '0', '0', '139.50', '139.50', '0', '145.00', '1610', '0', '3', '0', '0', 'N;', '169', '1_2017092203062937149.jpg', '1', '1', '1506020790', '1506023285', '0', '0', '0', '0', '0', '0.00', '0', '1', '', '5', '0', '0', '0', '0', '0', '0', '0', '0', '0', '1', '');
INSERT INTO `ds_goods` VALUES ('52', '47', '2017夏季百搭吊带背心女新款修身纯棉吊带衫蕾丝打底背心', '宽松小吊带 白色', '1', 'admin', '39', '15', '39', '0', '0', '39.90', '39.90', '0', '45.00', '1620', '0', '3', '0', '0', 'N;', '466', '1_2017092203083967214.jpg', '1', '1', '1506020928', '1506272731', '0', '0', '0', '0', '0', '0.00', '0', '1', '', '5', '0', '0', '0', '0', '0', '0', '0', '0', '0', '1', '');
INSERT INTO `ds_goods` VALUES ('53', '48', '2017秋季新款男士外套休闲潮牛仔夹克衫帅气棒球服学生韩版', '秋季新款', '1', 'admin', '41', '15', '41', '0', '0', '159.00', '159.00', '0', '169.00', '1630', '10', '3', '0', '0', 'N;', '258', '1_2017092203123417256.jpg', '1', '1', '1506021154', '1506023354', '0', '0', '0', '0', '0', '0.00', '0', '1', '', '5', '0', '0', '0', '0', '0', '0', '0', '0', '0', '1', '');
INSERT INTO `ds_goods` VALUES ('54', '49', '丹杰仕 夏季男女情侣防晒衣潮男时尚韩版修身连帽薄款印花夹克上衣', '', '1', 'admin', '41', '15', '41', '0', '0', '59.00', '59.00', '0', '69.00', '1640', '0', '2', '0', '0', 'N;', '540', '1_2017092203151752294.jpg', '1', '1', '1506021320', '1506023291', '0', '0', '0', '0', '0', '0.00', '0', '1', '', '5', '0', '0', '0', '0', '0', '0', '0', '0', '0', '1', '');
INSERT INTO `ds_goods` VALUES ('55', '50', '轻颦双黛 男士内裤透气吸汗男内裤', '　男士舒适透气内裤 柔软舒适不易变形  ', '1', 'admin', '44', '15', '44', '0', '0', '29.80', '29.80', '0', '36.00', '1650', '10', '0', '0', '0', 'N;', '128', '1_2017092203175020843.jpg', '1', '1', '1506021473', '1506021475', '0', '0', '0', '0', '0', '0.00', '0', '1', '', '5', '0', '0', '0', '0', '0', '0', '0', '0', '0', '1', '');
INSERT INTO `ds_goods` VALUES ('56', '51', '北极绒女士内裤', '性感轻薄中低腰透气女内裤', '1', 'admin', '44', '15', '44', '0', '0', '49.00', '49.00', '0', '58.00', '1660', '0', '0', '0', '0', 'N;', '999', '1_2017092203201884569.jpg', '1', '1', '1506021621', '1506021625', '0', '0', '0', '0', '0', '0.00', '0', '1', '', '5', '0', '0', '0', '0', '0', '0', '0', '0', '0', '1', '');
INSERT INTO `ds_goods` VALUES ('57', '52', '尖头粗跟高跟鞋一字扣单鞋 性感窜珠脚链高跟浅口凉鞋女鞋', '', '1', 'admin', '45', '16', '45', '0', '0', '49.00', '49.00', '0', '52.00', '1068', '10', '2', '0', '0', 'N;', '586', '1_2017092203242754461.jpg', '1', '1', '1506021871', '1506023299', '0', '0', '0', '0', '0', '0.00', '0', '1', '', '5', '0', '0', '0', '0', '0', '0', '0', '0', '0', '1', '');
INSERT INTO `ds_goods` VALUES ('58', '53', '品点新款平底轻便蛋卷鞋防滑牛筋底舒适女鞋', '防滑舒适，轻便时尚，标准尺码！', '1', 'admin', '45', '16', '45', '0', '0', '78.00', '78.00', '0', '82.00', '2017', '10', '2', '0', '0', 'N;', '410', '1_2017092203261873185.jpg', '1', '1', '1506021982', '1506023239', '0', '0', '0', '0', '0', '0.00', '0', '1', '', '5', '0', '0', '0', '0', '0', '0', '0', '0', '0', '1', '');
INSERT INTO `ds_goods` VALUES ('59', '54', '贝美芬 925银心心相印女士项链 女生饰品 时尚流行', '时尚简约', '1', 'admin', '46', '16', '46', '0', '0', '88.00', '88.00', '0', '98.00', '', '0', '0', '0', '0', 'N;', '140', '1_2017092203275599920.jpg', '1', '1', '1506022081', '1506022083', '0', '0', '0', '0', '0', '0.00', '0', '1', '', '5', '0', '0', '0', '0', '0', '0', '0', '0', '0', '1', '');
INSERT INTO `ds_goods` VALUES ('60', '55', '幸运四叶草纯银吊坠', '', '1', 'admin', '46', '16', '46', '0', '0', '75.00', '75.00', '0', '89.00', '2016', '10', '0', '0', '0', 'N;', '45', '1_2017092203294765362.jpg', '1', '1', '1506022193', '1506022195', '0', '0', '0', '0', '0', '0.00', '0', '1', '', '5', '0', '0', '0', '0', '0', '0', '0', '0', '0', '1', '');
INSERT INTO `ds_goods` VALUES ('61', '56', '施诺绮心梦爱心型925纯银水晶项链采用施华洛世奇元素水晶吊坠', '', '1', 'admin', '46', '16', '46', '0', '0', '108.00', '108.00', '0', '120.00', '2018', '10', '0', '0', '0', 'N;', '186', '1_2017092203321969628.jpg', '1', '1', '1506022343', '1506022346', '0', '0', '0', '0', '0', '0.00', '0', '1', '', '5', '0', '0', '0', '0', '0', '0', '0', '0', '0', '1', '');
INSERT INTO `ds_goods` VALUES ('62', '57', '封后皮皮虾韩国单肩包女韩版帆布手提袋', '简约帆布袋', '1', 'admin', '47', '16', '47', '0', '0', '39.00', '39.00', '0', '49.00', '2049', '10', '0', '0', '0', 'N;', '99', '1_2017092203335981358.jpg', '1', '1', '1506022442', '1506022444', '0', '0', '0', '0', '0', '0.00', '0', '1', '', '5', '0', '0', '0', '0', '0', '0', '0', '0', '0', '1', '');
INSERT INTO `ds_goods` VALUES ('63', '58', '迈克.科尔斯(Michael Kors/MK)小号女包手提单肩斜跨包', '海外采购', '1', 'admin', '47', '16', '47', '0', '0', '1096.00', '1096.00', '0', '1200.00', '1068', '0', '10', '0', '0', 'N;', '58', '1_2017092203371485168.jpg', '1', '1', '1506022638', '1506096333', '0', '0', '0', '0', '0', '0.00', '0', '1', '', '5', '0', '0', '0', '0', '0', '0', '0', '0', '0', '1', '');
INSERT INTO `ds_goods` VALUES ('64', '59', '蜂苹果6s数据线iphone6二合一拖安卓通用手机8P充电线器快充线', '闪电快充 提速40% 一年换新', '1', 'admin', '48', '1', '48', '0', '0', '19.90', '19.90', '0', '21.00', '10123', '0', '0', '0', '0', 'N;', '99', '1_2017092821352360295.jpg', '1', '1', '1506605735', '1506605738', '0', '0', '0', '0', '0', '0.00', '0', '1', '', '5', '0', '0', '0', '0', '0', '0', '0', '0', '0', '1', '');
INSERT INTO `ds_goods` VALUES ('65', '60', '手机散热器华为苹果通用充电宝式架子桌面游戏手柄支驾冷却降温器', '双风扇快速降温 可供电持久续航', '1', 'admin', '48', '1', '48', '0', '0', '58.00', '58.00', '0', '66.00', '', '0', '0', '0', '0', 'N;', '99', '1_2017092821383373641.jpg', '1', '1', '1506605915', '1506605918', '0', '0', '0', '0', '0', '0.00', '0', '1', '', '5', '0', '0', '0', '0', '0', '0', '0', '0', '0', '1', '');
INSERT INTO `ds_goods` VALUES ('66', '61', '手机充电宝带蓝牙音响三合一多功能平坂支架1毫安5移动电源20000M', '二合一 [支架+充电宝] 三合一 [支架+充电宝+蓝牙音响]', '1', 'admin', '48', '1', '48', '0', '0', '55.00', '55.00', '0', '80.00', '', '0', '0', '0', '0', 'N;', '99', '1_2017092821403589442.jpg', '1', '1', '1506606045', '1506606047', '0', '0', '0', '0', '0', '0.00', '0', '1', '', '5', '0', '0', '0', '0', '0', '0', '0', '0', '0', '1', '');
INSERT INTO `ds_goods` VALUES ('67', '62', '苹果无线HDMI同屏器airplay推送宝高清安卓手机电视投影视频传输', '无需软件不需要安装app即可实现无线同屏', '1', 'admin', '49', '1', '49', '0', '0', '158.00', '158.00', '0', '158.00', '', '0', '0', '0', '0', 'N;', '99', '1_2017092821431519588.jpg', '1', '1', '1506606198', '1506606200', '0', '0', '0', '0', '0', '0.00', '0', '1', '', '5', '0', '0', '0', '0', '0', '0', '0', '0', '0', '1', '');
INSERT INTO `ds_goods` VALUES ('68', '63', '唐麦 F3耳机入耳式 重低音炮手机电脑音乐有线耳塞式金属通用带麦', '15天无理由退换货一年质保换新', '1', 'admin', '49', '1', '49', '0', '0', '55.00', '55.00', '0', '59.00', '', '0', '0', '0', '0', 'N;', '99', '1_2017092821510935694.jpg', '1', '1', '1506606673', '1506606675', '0', '0', '0', '0', '0', '0.00', '0', '1', '', '5', '0', '0', '0', '0', '0', '0', '0', '0', '0', '1', '');
INSERT INTO `ds_goods` VALUES ('69', '64', '森狗SimDog sim2.0手机k歌耳机入耳式通用男女生耳塞式耳麦重低音', '专利产品 支持语音 支持接听电话', '1', 'admin', '49', '1', '49', '0', '0', '19.80', '19.80', '0', '20.00', '', '0', '0', '0', '0', 'N;', '999', '1_2017092821530372212.jpg', '1', '1', '1506606785', '1506606788', '0', '0', '0', '0', '0', '0.00', '0', '1', '', '5', '0', '0', '0', '0', '0', '0', '0', '0', '0', '1', '');
INSERT INTO `ds_goods` VALUES ('70', '65', '达尔优 进化者D3带麦克风震动电脑游戏耳机头戴式耳麦绝地求生lol', '头戴式震动发光耳麦 电竞赛事耳机金属头梁', '1', 'admin', '49', '1', '49', '0', '0', '158.00', '158.00', '0', '160.00', '', '0', '0', '0', '0', 'N;', '99', '1_2017092821544898610.jpg', '1', '1', '1506606891', '1506606893', '0', '0', '0', '0', '0', '0.00', '0', '1', '', '5', '0', '0', '0', '0', '0', '0', '0', '0', '0', '1', '');
INSERT INTO `ds_goods` VALUES ('71', '66', 'uoluo特价21 22 24 32 40 42 50 55寸60智能wifi网络小液晶电视机 50', '高清电视接口：闭路+AV+HDMI+电脑VGA+DVD+音频+USB多媒体【不含网络功能】； 智能电视接口：含高清电视所有的功能接口+有线网络+无线wifi。', '1', 'admin', '5', '4', '5', '0', '0', '2099.00', '2099.00', '0', '2099.00', '', '0', '0', '0', '0', 'a:1:{i:1;s:11:\"50寸高清\";}', '99', '1_2017092821585013652.jpg', '1', '1', '1506607133', '1506607136', '0', '0', '0', '1', '0', '0.00', '0', '1', '', '5', '0', '0', '0', '0', '0', '0', '0', '0', '0', '1', '');
INSERT INTO `ds_goods` VALUES ('72', '67', 'Hisense/海信 KFR-35GW/ER22N3(1L04) 大1.5p匹家用冷暖空调挂机', '', '1', 'admin', '6', '4', '6', '0', '0', '1999.00', '1999.00', '0', '1999.00', '', '0', '0', '0', '0', 'N;', '99', '1_2017092822032535526.jpg', '1', '1', '1506607408', '1506607410', '0', '0', '0', '0', '0', '0.00', '0', '1', '', '5', '0', '0', '0', '0', '0', '0', '0', '0', '0', '1', '');
INSERT INTO `ds_goods` VALUES ('73', '68', '先锋工业冷风扇 移动空调扇家用 冷风机商用小空调 加湿水冷气扇', '先锋新品工业冷风扇', '1', 'admin', '6', '4', '6', '0', '0', '1199.00', '1199.00', '0', '1200.00', '', '0', '0', '0', '0', 'N;', '999', '1_2017092822050083427.jpg', '1', '1', '1506607504', '1506607507', '0', '0', '0', '0', '0', '0.00', '0', '1', '', '5', '0', '0', '0', '0', '0', '0', '0', '0', '0', '1', '');
INSERT INTO `ds_goods` VALUES ('75', '70', '荣事达空调扇冷暖两用家用静音遥控冷风机制冷风扇加湿移动小空调', '强劲制冷 触摸屏 智能遥控 净化加湿', '1', 'admin', '6', '4', '6', '0', '0', '358.00', '358.00', '0', '358.00', '', '0', '0', '0', '0', 'N;', '99', '1_2017092823485490716.jpg', '1', '1', '1506613743', '1506613744', '0', '0', '0', '0', '0', '0.00', '0', '1', '', '5', '0', '0', '0', '0', '0', '0', '0', '0', '0', '1', '');
INSERT INTO `ds_goods` VALUES ('76', '71', '美菱可移动式空调一体机1.5匹1 P单冷型小制冷厨房窗式冷暖免安装', '', '1', 'admin', '6', '4', '6', '0', '0', '1299.00', '1299.00', '0', '1299.00', '', '0', '0', '0', '0', 'N;', '9', '1_2017092823501155931.jpg', '1', '1', '1506613814', '1506613817', '0', '0', '0', '0', '0', '0.00', '0', '1', '', '5', '0', '0', '0', '0', '0', '0', '0', '0', '0', '1', '');
INSERT INTO `ds_goods` VALUES ('77', '72', '乐创冷藏工作台冷冻冰箱平冷保鲜不锈钢商用厨房奶茶店操作台冰柜', '优质商家热销2万无磁不锈钢加厚全发泡', '1', 'admin', '7', '4', '7', '0', '0', '1478.00', '1478.00', '0', '1478.00', '', '0', '0', '0', '0', 'N;', '99', '1_2017092823531033711.jpg', '1', '1', '1506613995', '1506613997', '0', '0', '0', '0', '0', '0.00', '0', '1', '', '5', '0', '0', '0', '0', '0', '0', '0', '0', '0', '1', '');
INSERT INTO `ds_goods` VALUES ('78', '73', 'Midea/美的 BCD-169CM(E)双门冰箱家用冷藏冷冻对开门小型冰箱', '对开门小型冰箱', '1', 'admin', '7', '4', '7', '0', '0', '1099.00', '1099.00', '0', '1100.00', '', '0', '0', '0', '0', 'N;', '99', '1_2017092900001256656.jpg', '1', '1', '1506614415', '1506614418', '0', '0', '0', '0', '0', '0.00', '0', '1', '', '5', '0', '0', '0', '0', '0', '0', '0', '0', '0', '1', '');
INSERT INTO `ds_goods` VALUES ('79', '74', '志高全自动洗衣机 家用 小型 5.5公斤波轮 静音宿舍 迷你风干预约', '小家优选 节能静音 顺丰入户 预约童锁', '1', 'admin', '51', '4', '51', '0', '0', '498.00', '498.00', '0', '500.00', '', '0', '0', '0', '0', 'N;', '999', '1_2017092900022214210.jpg', '1', '1', '1506614544', '1506614547', '0', '0', '0', '0', '0', '0.00', '0', '1', '', '5', '0', '0', '0', '0', '0', '0', '0', '0', '0', '1', '');
INSERT INTO `ds_goods` VALUES ('80', '75', 'Chigo/志高全自动洗衣机 15KG宾馆酒店商用大容量不锈钢顺丰入户', '顺丰入户 下单送荣事达电烤箱一个', '1', 'admin', '51', '4', '51', '0', '0', '2500.00', '2500.00', '0', '2600.00', '', '0', '0', '0', '0', 'N;', '99', '1_2017092900033832502.jpg', '1', '1', '1506614620', '1506614623', '0', '0', '0', '0', '0', '0.00', '0', '1', '', '5', '0', '0', '0', '0', '0', '0', '0', '0', '0', '1', '');
INSERT INTO `ds_goods` VALUES ('81', '76', '集成灶自动清洗正品 侧吸下排式油烟机一体环保灶 双电磁炉威士伯', '天然气5000火力！断电应急！烟机延时', '1', 'admin', '20', '8', '20', '0', '0', '3180.00', '3180.00', '0', '3400.00', '', '0', '0', '0', '0', 'N;', '450', '1_2017092900052977159.jpg', '1', '1', '1506614732', '1506614734', '0', '0', '0', '0', '0', '0.00', '0', '1', '', '5', '0', '0', '0', '0', '0', '0', '0', '0', '0', '1', '');
INSERT INTO `ds_goods` VALUES ('82', '77', '威士伯J2集成灶 翻盖 一体 自动清洗烤箱蒸汽炉烟灶消套装 环保灶', '上门安装 双电机 漏气保护', '1', 'admin', '20', '8', '20', '0', '0', '4590.00', '4590.00', '0', '4700.00', '', '0', '0', '0', '0', 'N;', '99', '1_2017092900064438234.jpg', '1', '1', '1506614807', '1506614809', '0', '0', '0', '0', '0', '0.00', '0', '1', '', '5', '0', '0', '0', '0', '0', '0', '0', '0', '0', '1', '');
INSERT INTO `ds_goods` VALUES ('83', '78', '红心大蒸汽挂烫机家用熨斗手持挂烫机烫衣服熨烫机电熨斗正品包邮', '2000W大功率 超强蒸汽 快速熨衣', '1', 'admin', '21', '8', '21', '0', '0', '139.00', '139.00', '0', '145.00', '', '0', '0', '0', '0', 'N;', '99', '1_2017092900081355788.jpg', '1', '1', '1506614894', '1506614899', '0', '0', '0', '0', '0', '0.00', '0', '1', '', '5', '0', '0', '0', '0', '0', '0', '0', '0', '0', '1', '');
INSERT INTO `ds_goods` VALUES ('84', '79', '美的家用平烫挂烫双杆蒸汽挂烫机电熨斗熨YGD20D7', '独创可卧可立 35秒出蒸汽 六档微电脑', '1', 'admin', '21', '8', '21', '0', '0', '389.00', '389.00', '0', '400.00', '', '0', '0', '0', '0', 'N;', '99', '1_2017092900095941942.jpg', '1', '1', '1506615002', '1506615004', '0', '0', '0', '0', '0', '0.00', '0', '1', '', '5', '0', '0', '0', '0', '0', '0', '0', '0', '0', '1', '');
INSERT INTO `ds_goods` VALUES ('85', '80', '铨聚臭氧发生器果蔬解毒杀菌洗菜多功能负离子活氧净化消毒机家用', '臭氧消毒杀菌 果蔬解毒机 家用', '1', 'admin', '21', '8', '21', '0', '0', '399.00', '399.00', '0', '450.00', '', '0', '0', '0', '0', 'N;', '99', '1_2017092900115721538.jpg', '1', '1', '1506615121', '1506615123', '0', '0', '0', '0', '0', '0.00', '0', '1', '', '5', '0', '0', '0', '0', '0', '0', '0', '0', '0', '1', '');
INSERT INTO `ds_goods` VALUES ('86', '81', '拜格不锈钢锅具套装铁炒锅家用汤锅全套厨房厨具组合', '', '1', 'admin', '22', '8', '22', '0', '0', '89.00', '89.00', '0', '99.00', '', '0', '0', '0', '0', 'N;', '99', '1_2017092900132832208.jpg', '1', '1', '1506615216', '1506615219', '0', '0', '0', '0', '0', '0.00', '0', '1', '', '5', '0', '0', '0', '0', '0', '0', '0', '0', '0', '1', '');
INSERT INTO `ds_goods` VALUES ('87', '82', '朝暮之家厨房置物架落地多层收纳架放锅架子厨具用品转角架 锅架', '火爆热卖 多款可选 多功能厨房落地置物架', '1', 'admin', '22', '8', '22', '0', '0', '55.00', '55.00', '0', '69.00', '', '0', '0', '0', '0', 'N;', '89', '1_2017092900144267524.jpg', '1', '1', '1506615285', '1506615287', '0', '0', '0', '0', '0', '0.00', '0', '1', '', '5', '0', '0', '0', '0', '0', '0', '0', '0', '0', '1', '');
INSERT INTO `ds_goods` VALUES ('88', '83', '夏季薄网状透气型护腰带保健腰托腰围带钢板家用', '秋冬薄网状透气护腰', '1', 'admin', '55', '8', '55', '0', '0', '9.90', '9.90', '0', '15.90', '', '0', '0', '0', '0', 'N;', '99', '1_2017092900175249561.jpg', '1', '1', '1506615475', '1506615490', '0', '0', '0', '0', '0', '0.00', '0', '1', '', '5', '0', '0', '0', '0', '0', '0', '0', '0', '0', '1', '');
INSERT INTO `ds_goods` VALUES ('89', '84', '茗振海盐袋粗盐热敷包电加热理疗包袋家用颈椎腰部膝盖艾叶全身热敷袋', '', '1', 'admin', '55', '8', '55', '0', '0', '139.00', '139.00', '0', '145.00', '', '0', '0', '0', '0', 'N;', '98', '1_2017092900220838539.jpg', '1', '1', '1506615733', '1506615735', '0', '0', '0', '0', '0', '0.00', '0', '1', '', '5', '0', '0', '0', '0', '0', '0', '0', '0', '0', '1', '');
INSERT INTO `ds_goods` VALUES ('90', '85', '普立PL-603AC4刮痧机电脑版红光电动震动按摩机脂肪运动机', '刮痧推脂机美体仪高频震动爆溶按摩仪强力碎脂机腰部电动震动刮痧机甩脂机  ', '1', 'admin', '55', '8', '55', '0', '0', '79.00', '79.00', '0', '88.00', '', '0', '0', '0', '0', 'N;', '99', '1_2017092900242419538.jpg', '1', '1', '1506615869', '1506615871', '0', '0', '0', '0', '0', '0.00', '0', '1', '', '5', '0', '0', '0', '0', '0', '0', '0', '0', '0', '1', '');
INSERT INTO `ds_goods` VALUES ('91', '86', '南极人颈椎热敷护颈带护颈椎套保暖保护肩颈理疗自发热护颈椎脖套', '热敷理疗 穴位磁石 托玛琳 自发热', '1', 'admin', '55', '8', '55', '0', '0', '39.00', '39.00', '0', '59.00', '', '0', '0', '0', '0', 'N;', '120', '1_2017092900261952044.jpg', '1', '1', '1506615983', '1506615986', '0', '0', '0', '0', '0', '0.00', '0', '1', '', '5', '0', '0', '0', '0', '0', '0', '0', '0', '0', '1', '');
INSERT INTO `ds_goods` VALUES ('92', '87', '电脑非全新二手电脑主机台式整机i5i7游戏组装机27寸无边框显示器 4G 黑 硬盘500G', '', '1', 'admin', '23', '9', '23', '0', '0', '2178.00', '2178.00', '0', '2450.00', '', '0', '0', '0', '0', 'a:3:{i:15;s:2:\"4G\";i:14;s:3:\"黑\";i:1;s:10:\"硬盘500G\";}', '68', '1_2017092900363278117.jpg', '1', '1', '1506616595', '1506616600', '0', '0', '0', '15', '0', '0.00', '0', '1', '', '5', '0', '0', '0', '0', '0', '0', '0', '0', '0', '1', '');
INSERT INTO `ds_goods` VALUES ('93', '87', '电脑非全新二手电脑主机台式整机i5i7游戏组装机27寸无边框显示器 4G 硬盘500G', '', '1', 'admin', '23', '9', '23', '0', '0', '2178.00', '2178.00', '0', '2450.00', '', '0', '0', '0', '0', 'a:2:{i:15;s:2:\"4G\";i:1;s:10:\"硬盘500G\";}', '89', '1_2017092900363278117.jpg', '1', '1', '1506616595', '1506616600', '0', '0', '0', '15', '0', '0.00', '0', '1', '', '5', '0', '0', '0', '0', '0', '0', '0', '0', '0', '1', '');
INSERT INTO `ds_goods` VALUES ('94', '87', '电脑非全新二手电脑主机台式整机i5i7游戏组装机27寸无边框显示器 3G 黑 硬盘500G', '', '1', 'admin', '23', '9', '23', '0', '0', '2178.00', '2178.00', '0', '2450.00', '', '0', '0', '0', '0', 'a:3:{i:16;s:2:\"3G\";i:14;s:3:\"黑\";i:1;s:10:\"硬盘500G\";}', '36', '1_2017092900363278117.jpg', '1', '1', '1506616595', '1506616600', '0', '0', '0', '16', '0', '0.00', '0', '1', '', '5', '0', '0', '0', '0', '0', '0', '0', '0', '0', '1', '');
INSERT INTO `ds_goods` VALUES ('95', '87', '电脑非全新二手电脑主机台式整机i5i7游戏组装机27寸无边框显示器 3G 硬盘500G', '', '1', 'admin', '23', '9', '23', '0', '0', '2178.00', '2178.00', '0', '2450.00', '', '0', '0', '0', '0', 'a:2:{i:16;s:2:\"3G\";i:1;s:10:\"硬盘500G\";}', '69', '1_2017092900363278117.jpg', '1', '1', '1506616595', '1506616600', '0', '0', '0', '16', '0', '0.00', '0', '1', '', '5', '0', '0', '0', '0', '0', '0', '0', '0', '0', '1', '');
INSERT INTO `ds_goods` VALUES ('96', '88', '全新台式高配吃鸡电脑主机i7高端全套网吧游戏型八核组装家用整机 4G 白 硬盘500G', '八核游戏竞电主机，配套GTX1050显卡', '1', 'admin', '23', '9', '23', '0', '0', '2688.00', '2688.00', '0', '3450.00', '', '0', '0', '0', '0', 'a:3:{i:15;s:2:\"4G\";i:111;s:3:\"白\";i:113;s:10:\"硬盘500G\";}', '69', '1_2017092900412680293.jpg', '1', '1', '1506616890', '1506616893', '0', '0', '0', '15', '0', '0.00', '0', '1', '', '5', '0', '0', '0', '0', '0', '0', '0', '0', '0', '1', '');
INSERT INTO `ds_goods` VALUES ('97', '88', '全新台式高配吃鸡电脑主机i7高端全套网吧游戏型八核组装家用整机 3G 白 硬盘500G', '八核游戏竞电主机，配套GTX1050显卡', '1', 'admin', '23', '9', '23', '0', '0', '2688.00', '2688.00', '0', '3450.00', '', '0', '0', '0', '0', 'a:3:{i:16;s:2:\"3G\";i:111;s:3:\"白\";i:113;s:10:\"硬盘500G\";}', '89', '1_2017092900412680293.jpg', '1', '1', '1506616890', '1506616893', '0', '0', '0', '16', '0', '0.00', '0', '1', '', '5', '0', '0', '0', '0', '0', '0', '0', '0', '0', '1', '');
INSERT INTO `ds_goods` VALUES ('98', '89', 'Seagate/希捷 ST1000DM010 1TB新酷鱼台式机械电脑硬盘', '新酷鱼台盘-7200转', '1', 'admin', '24', '9', '24', '0', '0', '309.00', '309.00', '0', '350.00', '', '0', '0', '0', '0', 'N;', '999', '1_2017092900450210134.jpg', '1', '1', '1506617106', '1506617109', '0', '0', '0', '0', '0', '0.00', '0', '1', '', '5', '0', '0', '0', '0', '0', '0', '0', '0', '0', '1', '');
INSERT INTO `ds_goods` VALUES ('99', '90', 'Asus/华硕 X555YI 7110-554LXFA2X10轻薄手提游戏本笔记本电脑', '', '1', 'admin', '134', '9', '23', '134', '0', '2599.00', '2599.00', '0', '2780.00', '', '0', '0', '0', '0', 'N;', '99', '1_2017092900501117171.jpg', '1', '1', '1506617415', '1506617419', '0', '0', '0', '0', '0', '0.00', '0', '1', '', '5', '0', '0', '0', '0', '0', '0', '0', '0', '0', '1', '');
INSERT INTO `ds_goods` VALUES ('100', '91', '小米 红米NOTE 5A智能拍照手机16G/32G/64G', '', '1', 'admin', '75', '1', '2', '75', '0', '799.00', '799.00', '0', '899.00', '', '0', '0', '0', '0', 'N;', '998', '1_2017092900544928056.jpg', '1', '1', '1506617760', '1506617762', '0', '0', '0', '0', '0', '0.00', '0', '1', '', '5', '0', '0', '0', '0', '0', '0', '0', '0', '0', '1', '');
INSERT INTO `ds_goods` VALUES ('101', '92', '3期免息【高配2799】Xiaomi/小米 小米NOTE 3全网通小米手机新品 128G', '', '1', 'admin', '75', '1', '2', '75', '0', '2890.00', '2890.00', '0', '2999.00', '', '0', '0', '0', '0', 'a:1:{i:1;s:4:\"128G\";}', '99', '1_2017092901044975398.jpg', '1', '1', '1506618294', '1506618297', '0', '0', '0', '1', '0', '0.00', '0', '1', '', '5', '0', '0', '0', '0', '0', '0', '0', '0', '0', '1', '');
INSERT INTO `ds_goods` VALUES ('102', '93', 'honor/荣耀 荣耀9 全网通4G手机双摄像头智能手机', '后置双摄像头手机', '1', 'admin', '76', '1', '2', '76', '0', '2499.00', '2499.00', '0', '2699.00', '', '0', '0', '0', '0', 'N;', '450', '1_2017092901063965472.jpg', '1', '1', '1506618422', '1506618424', '0', '0', '0', '0', '0', '0.00', '0', '1', '', '5', '0', '0', '0', '0', '0', '0', '0', '0', '0', '1', '');
INSERT INTO `ds_goods` VALUES ('103', '94', 'honor/荣耀 荣耀V9 play全网通4G手机', '', '1', 'admin', '76', '1', '2', '76', '0', '1099.00', '1099.00', '0', '1200.00', '', '0', '0', '0', '0', 'N;', '983', '1_2017092901082884641.jpg', '1', '1', '1506618514', '1506618516', '0', '0', '0', '0', '0', '0.00', '0', '1', '', '5', '0', '0', '0', '0', '0', '0', '0', '0', '0', '1', '');
INSERT INTO `ds_goods` VALUES ('104', '95', 'OnePlus/一加 一加手机5 一加五 1加5手机 一加5星辰黑', '一加授权 官方直供 优惠低至官网', '1', 'admin', '77', '1', '2', '77', '0', '2068.00', '2068.00', '0', '2100.00', '', '0', '0', '0', '0', 'N;', '98', '1_2017092901111615092.jpg', '1', '1', '1506618679', '1506618684', '0', '0', '0', '0', '0', '0.00', '0', '1', '', '5', '0', '0', '0', '0', '0', '0', '0', '0', '0', '1', '');
INSERT INTO `ds_goods` VALUES ('105', '96', '超薄5.5寸移动电信全网通4G双曲屏学生智能指纹一体一加手机', '', '1', 'admin', '77', '1', '2', '77', '0', '748.00', '748.00', '0', '820.00', '', '0', '0', '0', '0', 'N;', '422', '1_2017092901182073726.jpg', '1', '1', '1506619103', '1506619105', '0', '0', '0', '0', '0', '0.00', '0', '1', '', '5', '0', '0', '0', '0', '0', '0', '0', '0', '0', '1', '');
INSERT INTO `ds_goods` VALUES ('116', '107', '向往家庭背景音乐主机系统套装 wifi音响功放控制器 智能家居M8', '安卓系统 APP控制 7寸大屏', '1', 'admin', '73', '1', '3', '73', '0', '1999.00', '1999.00', '0', '2400.00', '', '0', '0', '0', '0', 'N;', '83', '1_2017092901492561069.jpg', '0', '1', '1506620974', '1543574170', '0', '0', '0', '0', '0', '0.00', '0', '1', '', '5', '0', '0', '0', '0', '0', '0', '0', '0', '0', '1', '');
INSERT INTO `ds_goods` VALUES ('117', '108', '亚太天能阿里智能指纹锁家用防盗门锁 电子锁密码锁大门防盗锁V9', '家装焕新 阿里智能 全屋联网', '1', 'admin', '74', '1', '3', '74', '0', '2599.00', '2599.00', '0', '2699.00', '', '0', '0', '0', '0', 'N;', '78', '1_2017092901531025952.jpg', '0', '1', '1506621192', '1543574170', '0', '0', '0', '0', '0', '0.00', '0', '1', '', '5', '0', '0', '0', '0', '0', '0', '0', '0', '0', '1', '');
INSERT INTO `ds_goods` VALUES ('118', '109', 'mai小麦指纹锁家用防盗门智能门锁电子锁密码锁刷卡锁防盗锁正品', '锁芯5★防盗性能', '1', 'admin', '74', '1', '3', '74', '0', '799.00', '799.00', '0', '1200.00', '', '0', '0', '0', '0', 'N;', '66', '1_2017092901561798176.jpg', '0', '1', '1506621381', '1543574170', '0', '0', '0', '0', '0', '0.00', '0', '1', '', '5', '0', '0', '0', '0', '0', '0', '0', '0', '0', '1', '');
INSERT INTO `ds_goods` VALUES ('119', '110', '欧瑞特智能手环运动计步器测心率血压手表小米多功能健康防水男女', '多模式血压手环！！', '1', 'admin', '71', '1', '3', '71', '0', '179.00', '179.00', '0', '189.00', '', '0', '0', '0', '0', 'N;', '94', '1_2017092901584247144.jpg', '0', '1', '1506621524', '1543574170', '0', '0', '0', '0', '0', '0.00', '0', '1', '', '5', '0', '0', '0', '0', '0', '0', '0', '0', '0', '1', '');
INSERT INTO `ds_goods` VALUES ('120', '111', '君米运动智能手环防水测血压心跳心率跑步小米手表多功能苹果男女', '深度防水游泳 超长待机180天 微信qq', '1', 'admin', '71', '1', '3', '71', '0', '258.00', '258.00', '0', '269.00', '', '0', '0', '0', '0', 'N;', '95', '1_2017092902070476170.jpg', '0', '1', '1506622029', '1543574170', '0', '0', '0', '0', '0', '0.00', '0', '1', '', '5', '0', '0', '0', '0', '0', '0', '0', '0', '0', '1', '');
INSERT INTO `ds_goods` VALUES ('121', '112', '拜斯特台式放大镜带LED灯10倍20倍老人阅读电子检验钟表手机维修', '台式 带LED灯 阅读维修', '1', 'admin', '68', '16', '68', '0', '0', '45.00', '45.00', '0', '69.00', '', '0', '0', '0', '0', 'N;', '65', '1_2017092902123493954.jpg', '0', '1', '1506622356', '1543574170', '0', '0', '0', '0', '0', '0.00', '0', '1', '', '5', '0', '0', '0', '0', '0', '0', '0', '0', '0', '1', '');
INSERT INTO `ds_goods` VALUES ('122', '113', '商务tr90近视眼镜男款超轻眼镜框半框潮商务近视镜眼镜架黑镜框男', '', '1', 'admin', '68', '16', '68', '0', '0', '75.00', '75.00', '0', '120.00', '', '0', '0', '0', '0', 'N;', '62', '1_2017092902135876412.jpg', '0', '1', '1506622587', '1543574170', '0', '0', '0', '0', '0', '0.00', '0', '1', '', '5', '0', '0', '0', '0', '0', '0', '0', '0', '0', '1', '');
INSERT INTO `ds_goods` VALUES ('123', '114', '景德镇陶瓷花瓶摆件客厅装饰品摆设中式家居新房装饰品酒柜摆件', '富贵吉祥蛋 向往美好 充满生活气息\r\n', '1', 'admin', '69', '16', '69', '0', '0', '36.00', '36.00', '0', '54.00', '', '0', '0', '0', '0', 'N;', '66', '1_2017092902182426089.jpg', '0', '1', '1506622742', '1543574170', '0', '0', '0', '0', '0', '0.00', '0', '1', '', '5', '0', '0', '0', '0', '0', '0', '0', '0', '0', '1', '');
INSERT INTO `ds_goods` VALUES ('124', '115', '财富节节高电视柜酒柜客厅摆件装饰品竹子家居饰品工艺品招财摆设', '财富节节高 四季长青 象征财运旺盛', '1', 'admin', '69', '16', '69', '0', '0', '79.00', '79.00', '0', '109.00', '', '0', '0', '0', '0', 'N;', '72', '1_2017092902201298747.jpg', '0', '1', '1506622814', '1543574170', '0', '0', '0', '0', '0', '0.00', '0', '1', '', '5', '0', '0', '0', '0', '0', '0', '0', '0', '0', '1', '');
INSERT INTO `ds_goods` VALUES ('125', '116', 'LAVER防脱育发液快速增发密发生新发液脂溢性脱发头发增长液男女', '认准国妆特字 告别脱发轻松密发买3送1', '1', 'admin', '64', '12', '64', '0', '0', '128.00', '128.00', '0', '144.00', '', '0', '0', '0', '0', 'N;', '88', '1_2017092902341762945.jpg', '0', '1', '1506623660', '1543574170', '0', '0', '0', '0', '0', '0.00', '0', '1', '', '5', '0', '0', '0', '0', '0', '0', '0', '0', '0', '1', '');
INSERT INTO `ds_goods` VALUES ('126', '117', '冲牙器便携式洗牙器家用电动口腔牙齿冲洗器牙龈牙缝清洁器洁牙器', '洁牙器 洗牙机 冲牙 洗牙 口腔清洁器', '1', 'admin', '63', '12', '63', '0', '0', '178.00', '178.00', '0', '210.00', '', '0', '0', '0', '0', 'N;', '84', '1_2017092902405679397.jpg', '0', '1', '1506624060', '1543574118', '0', '0', '0', '0', '0', '0.00', '0', '1', '', '5', '0', '0', '0', '0', '0', '0', '0', '0', '0', '1', '');
INSERT INTO `ds_goods` VALUES ('127', '118', '新西兰进口牛奶纽仕兰高钙低脂纯牛奶250ml*24盒*1箱', '新西兰进口 牧场直供 100%生牛乳', '1', 'admin', '231', '11', '60', '231', '0', '89.00', '89.00', '0', '120.00', '', '0', '0', '0', '0', 'N;', '74', '1_2017092902485560056.jpg', '0', '1', '1506624539', '1543574118', '0', '0', '0', '0', '0', '0.00', '0', '1', '', '5', '0', '0', '0', '0', '0', '0', '0', '0', '0', '1', '');

-- -----------------------------
-- Table structure for `ds_goodsattrindex`
-- -----------------------------
DROP TABLE IF EXISTS `ds_goodsattrindex`;
CREATE TABLE `ds_goodsattrindex` (
  `goods_id` int(10) unsigned NOT NULL COMMENT '商品ID',
  `goods_commonid` int(10) unsigned NOT NULL COMMENT '商品公共表ID',
  `gc_id` int(10) unsigned NOT NULL COMMENT '商品分类ID',
  `type_id` int(10) unsigned NOT NULL COMMENT '类型ID',
  `attr_id` int(10) unsigned NOT NULL COMMENT '属性ID',
  `attrvalue_id` int(10) unsigned NOT NULL COMMENT '属性值ID',
  PRIMARY KEY (`goods_id`,`gc_id`,`attrvalue_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='商品与属性对应表';


-- -----------------------------
-- Table structure for `ds_goodsbrowse`
-- -----------------------------
DROP TABLE IF EXISTS `ds_goodsbrowse`;
CREATE TABLE `ds_goodsbrowse` (
  `goods_id` int(11) NOT NULL COMMENT '商品ID',
  `member_id` int(11) NOT NULL COMMENT '会员ID',
  `goodsbrowse_time` int(11) NOT NULL COMMENT '浏览时间',
  `gc_id` int(11) NOT NULL COMMENT '商品分类',
  `gc_id_1` int(11) NOT NULL COMMENT '商品一级分类',
  `gc_id_2` int(11) NOT NULL COMMENT '商品二级分类',
  `gc_id_3` int(11) NOT NULL COMMENT '商品三级分类',
  PRIMARY KEY (`goods_id`,`member_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='商品浏览历史表';


-- -----------------------------
-- Table structure for `ds_goodsclass`
-- -----------------------------
DROP TABLE IF EXISTS `ds_goodsclass`;
CREATE TABLE `ds_goodsclass` (
  `gc_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '商品分类自增ID',
  `gc_name` varchar(100) NOT NULL COMMENT '商品分类名称',
  `type_id` int(10) unsigned NOT NULL COMMENT '类型id',
  `type_name` varchar(100) NOT NULL COMMENT '类型名称',
  `gc_parent_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '商品分类上级ID',
  `commis_rate` float unsigned NOT NULL DEFAULT '0' COMMENT '商品分类佣金比例',
  `gc_sort` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '商品分类排序',
  `gc_virtual` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '是否允许发布虚拟商品 1:是 0:否',
  `gc_title` varchar(200) DEFAULT NULL COMMENT '商品分类名称',
  `gc_keywords` varchar(255) DEFAULT '' COMMENT '商品分类关键词',
  `gc_description` varchar(255) DEFAULT '' COMMENT '商品分类描述',
  `gc_show` tinyint(1) NOT NULL DEFAULT '1' COMMENT '商品分类前台显示 0:否 1:是',
  PRIMARY KEY (`gc_id`),
  KEY `store_id` (`gc_parent_id`)
) ENGINE=InnoDB AUTO_INCREMENT=764 DEFAULT CHARSET=utf8 COMMENT='商品分类表';

-- -----------------------------
-- Records of `ds_goodsclass`
-- -----------------------------
INSERT INTO `ds_goodsclass` VALUES ('1', ' 手机/ 运营商/ 智能数码', '1', '联动', '0', '1', '0', '1', '', '', '', '1');
INSERT INTO `ds_goodsclass` VALUES ('2', '手机通讯', '1', '联动', '1', '1', '0', '1', '', '', '', '1');
INSERT INTO `ds_goodsclass` VALUES ('3', '智能设备', '1', '联动', '1', '1', '0', '1', '', '', '', '1');
INSERT INTO `ds_goodsclass` VALUES ('4', ' 电视/ 空调/ 冰箱/ 洗衣机', '1', '联动', '0', '1', '0', '0', '', '', '', '1');
INSERT INTO `ds_goodsclass` VALUES ('5', '电视', '1', '联动', '4', '1', '0', '0', '', '', '', '1');
INSERT INTO `ds_goodsclass` VALUES ('6', '空调', '1', '联动', '4', '1', '0', '0', '', '', '', '1');
INSERT INTO `ds_goodsclass` VALUES ('7', '冰箱', '1', '联动', '4', '1', '0', '0', '', '', '', '1');
INSERT INTO `ds_goodsclass` VALUES ('8', ' 厨卫电器/ 生活家电/ 厨具', '1', '联动', '0', '1', '0', '0', '', '', '', '1');
INSERT INTO `ds_goodsclass` VALUES ('9', ' 电脑办公/ 相机/ DIY', '1', '联动', '0', '1', '0', '0', '', '', '', '1');
INSERT INTO `ds_goodsclass` VALUES ('10', ' 家居/ 家具/ 家装', '1', '联动', '0', '1', '0', '0', '', '', '', '1');
INSERT INTO `ds_goodsclass` VALUES ('11', ' 食品/ 酒水/ 生鲜/ 特产', '1', '联动', '0', '1', '0', '0', '', '', '', '1');
INSERT INTO `ds_goodsclass` VALUES ('12', '个护化妆/ 纸品清洁/ 宠物', '1', '联动', '0', '1', '0', '0', '', '', '', '1');
INSERT INTO `ds_goodsclass` VALUES ('15', ' 男装/ 女装/ 内衣', '1', '联动', '0', '1', '0', '0', '', '', '', '1');
INSERT INTO `ds_goodsclass` VALUES ('16', ' 鞋靴/ 箱包/ 钟表/ 珠宝', '1', '联动', '0', '1', '0', '0', '', '', '', '1');
INSERT INTO `ds_goodsclass` VALUES ('20', '厨房大电', '1', '联动', '8', '1', '0', '0', '', '', '', '1');
INSERT INTO `ds_goodsclass` VALUES ('21', '生活家电', '1', '联动', '8', '1', '0', '0', '', '', '', '1');
INSERT INTO `ds_goodsclass` VALUES ('22', '厨具', '1', '联动', '8', '1', '0', '0', '', '', '', '1');
INSERT INTO `ds_goodsclass` VALUES ('23', '电脑整机', '1', '联动', '9', '1', '0', '0', '', '', '', '1');
INSERT INTO `ds_goodsclass` VALUES ('24', '办公打印', '1', '联动', '9', '1', '0', '0', '', '', '', '1');
INSERT INTO `ds_goodsclass` VALUES ('25', '家纺', '1', '联动', '10', '1', '0', '0', '', '', '', '1');
INSERT INTO `ds_goodsclass` VALUES ('26', '家具', '1', '联动', '10', '1', '0', '0', '', '', '', '1');
INSERT INTO `ds_goodsclass` VALUES ('27', '生活日用', '1', '联动', '10', '1', '0', '0', '', '', '', '1');
INSERT INTO `ds_goodsclass` VALUES ('28', '食品', '1', '联动', '11', '1', '0', '0', '', '', '', '1');
INSERT INTO `ds_goodsclass` VALUES ('29', '酒水', '1', '联动', '11', '1', '0', '0', '', '', '', '1');
INSERT INTO `ds_goodsclass` VALUES ('30', '护肤品', '1', '联动', '12', '1', '0', '0', '', '', '', '1');
INSERT INTO `ds_goodsclass` VALUES ('31', '清洁洗护', '1', '联动', '12', '1', '0', '0', '', '', '', '1');
INSERT INTO `ds_goodsclass` VALUES ('32', '宠物生活', '1', '联动', '12', '1', '0', '0', '', '', '', '1');
INSERT INTO `ds_goodsclass` VALUES ('39', '女装', '1', '联动', '15', '1', '0', '0', '', '', '', '1');
INSERT INTO `ds_goodsclass` VALUES ('41', '男装', '1', '联动', '15', '1', '0', '0', '', '', '', '1');
INSERT INTO `ds_goodsclass` VALUES ('44', '内衣内裤', '1', '联动', '15', '1', '0', '0', '', '', '', '1');
INSERT INTO `ds_goodsclass` VALUES ('45', '时尚鞋靴', '1', '联动', '16', '1', '0', '0', '', '', '', '1');
INSERT INTO `ds_goodsclass` VALUES ('46', '珠宝饰品', '1', '联动', '16', '1', '0', '0', '', '', '', '1');
INSERT INTO `ds_goodsclass` VALUES ('47', '时尚皮包', '1', '联动', '16', '1', '0', '0', '', '', '', '1');
INSERT INTO `ds_goodsclass` VALUES ('48', '手机配件', '1', '联动', '1', '1', '0', '0', '', '', '', '1');
INSERT INTO `ds_goodsclass` VALUES ('49', '影音电子', '1', '联动', '1', '1', '0', '0', '', '', '', '1');
INSERT INTO `ds_goodsclass` VALUES ('51', '洗衣机', '1', '联动', '4', '1', '0', '0', '', '', '', '1');
INSERT INTO `ds_goodsclass` VALUES ('54', '饮水设备', '1', '联动', '4', '1', '0', '0', '', '', '', '1');
INSERT INTO `ds_goodsclass` VALUES ('55', '个护健康', '1', '联动', '8', '1', '0', '0', '', '', '', '1');
INSERT INTO `ds_goodsclass` VALUES ('56', '外设附件', '1', '联动', '9', '1', '0', '1', '', '', '', '1');
INSERT INTO `ds_goodsclass` VALUES ('57', 'DIY硬件', '1', '联动', '9', '1', '0', '0', '', '', '', '1');
INSERT INTO `ds_goodsclass` VALUES ('58', '灯具灯饰', '1', '联动', '10', '1', '0', '0', '', '', '', '1');
INSERT INTO `ds_goodsclass` VALUES ('59', '厨房卫浴', '1', '联动', '10', '1', '0', '0', '', '', '', '1');
INSERT INTO `ds_goodsclass` VALUES ('60', '饮料冲乳', '1', '联动', '11', '1', '0', '0', '', '', '', '1');
INSERT INTO `ds_goodsclass` VALUES ('61', '生鲜食品', '1', '联动', '11', '1', '0', '0', '', '', '', '1');
INSERT INTO `ds_goodsclass` VALUES ('62', '营养保健', '1', '联动', '11', '1', '0', '0', '', '', '', '1');
INSERT INTO `ds_goodsclass` VALUES ('63', '口腔护理', '1', '联动', '12', '1', '0', '0', '', '', '', '1');
INSERT INTO `ds_goodsclass` VALUES ('64', '洗发护发', '1', '联动', '12', '1', '0', '0', '', '', '', '1');
INSERT INTO `ds_goodsclass` VALUES ('65', '当季流行', '1', '联动', '15', '1', '0', '0', '', '', '', '1');
INSERT INTO `ds_goodsclass` VALUES ('66', '袜子配饰', '1', '联动', '15', '1', '0', '0', '', '', '', '1');
INSERT INTO `ds_goodsclass` VALUES ('67', '特色服装', '1', '联动', '15', '1', '0', '0', '', '', '', '1');
INSERT INTO `ds_goodsclass` VALUES ('68', '钟表眼镜', '1', '联动', '16', '1', '0', '0', '', '', '', '1');
INSERT INTO `ds_goodsclass` VALUES ('69', '艺术品', '1', '联动', '16', '1', '0', '0', '', '', '', '1');
INSERT INTO `ds_goodsclass` VALUES ('70', '智能手表', '0', '', '3', '1', '0', '0', '', '', '', '1');
INSERT INTO `ds_goodsclass` VALUES ('71', '智能手环', '0', '', '3', '1', '10', '0', '', '', '', '1');
INSERT INTO `ds_goodsclass` VALUES ('72', '健康监测', '0', '', '3', '2', '0', '0', '', '', '', '1');
INSERT INTO `ds_goodsclass` VALUES ('73', '智能家居', '0', '', '3', '3', '0', '0', '', '', '', '1');
INSERT INTO `ds_goodsclass` VALUES ('74', '智能门锁', '0', '', '3', '2', '3', '0', '', '', '', '1');
INSERT INTO `ds_goodsclass` VALUES ('75', '小米', '1', '联动', '2', '5', '255', '0', '', '', '', '1');
INSERT INTO `ds_goodsclass` VALUES ('76', '荣耀', '0', '', '2', '5', '255', '0', '', '', '', '1');
INSERT INTO `ds_goodsclass` VALUES ('77', '一加', '0', '', '2', '5', '255', '0', '', '', '', '1');
INSERT INTO `ds_goodsclass` VALUES ('78', 'vivo', '0', '', '2', '5', '255', '0', '', '', '', '1');
INSERT INTO `ds_goodsclass` VALUES ('79', 'oppo', '0', '', '2', '5', '255', '0', '', '', '', '1');
INSERT INTO `ds_goodsclass` VALUES ('80', '存储卡', '0', '', '48', '5', '255', '0', '', '', '', '1');
INSERT INTO `ds_goodsclass` VALUES ('81', '电池/充电器', '0', '', '48', '5', '255', '0', '', '', '', '1');
INSERT INTO `ds_goodsclass` VALUES ('82', '清洁工具', '0', '', '48', '5', '255', '0', '', '', '', '1');
INSERT INTO `ds_goodsclass` VALUES ('83', '数据线', '0', '', '48', '5', '255', '0', '', '', '', '1');
INSERT INTO `ds_goodsclass` VALUES ('84', '手机耳机', '0', '', '48', '5', '255', '0', '', '', '', '1');
INSERT INTO `ds_goodsclass` VALUES ('85', '耳机/耳麦', '0', '', '49', '5', '255', '0', '', '', '', '1');
INSERT INTO `ds_goodsclass` VALUES ('86', '电脑平板', '0', '', '49', '5', '255', '0', '', '', '', '1');
INSERT INTO `ds_goodsclass` VALUES ('87', '录音笔', '0', '', '49', '5', '255', '0', '', '', '', '1');
INSERT INTO `ds_goodsclass` VALUES ('88', '运动相机', '0', '', '49', '5', '255', '0', '', '', '', '1');
INSERT INTO `ds_goodsclass` VALUES ('89', '无人机设备', '0', '', '49', '5', '255', '0', '', '', '', '1');
INSERT INTO `ds_goodsclass` VALUES ('90', '空调扇', '0', '', '6', '5', '255', '0', '', '', '', '1');
INSERT INTO `ds_goodsclass` VALUES ('91', '挂式空调', '0', '', '6', '5', '255', '0', '', '', '', '1');
INSERT INTO `ds_goodsclass` VALUES ('92', '柜式空调', '0', '', '6', '5', '255', '0', '', '', '', '1');
INSERT INTO `ds_goodsclass` VALUES ('93', '中央空调', '0', '', '6', '5', '255', '0', '', '', '', '1');
INSERT INTO `ds_goodsclass` VALUES ('94', '平板电视', '0', '', '5', '5', '255', '0', '', '', '', '1');
INSERT INTO `ds_goodsclass` VALUES ('95', '冰箱', '0', '', '7', '5', '255', '0', '', '', '', '1');
INSERT INTO `ds_goodsclass` VALUES ('96', '冰柜', '0', '', '7', '5', '255', '0', '', '', '', '1');
INSERT INTO `ds_goodsclass` VALUES ('97', '酒柜', '0', '', '7', '5', '255', '0', '', '', '', '1');
INSERT INTO `ds_goodsclass` VALUES ('98', '洗烘一体机', '0', '', '51', '5', '255', '0', '', '', '', '1');
INSERT INTO `ds_goodsclass` VALUES ('99', '滚筒洗衣机', '0', '', '51', '5', '255', '0', '', '', '', '1');
INSERT INTO `ds_goodsclass` VALUES ('100', '波轮洗衣机', '0', '', '51', '5', '255', '0', '', '', '', '1');
INSERT INTO `ds_goodsclass` VALUES ('101', '迷你洗衣机', '0', '', '51', '5', '255', '0', '', '', '', '1');
INSERT INTO `ds_goodsclass` VALUES ('102', '双缸洗衣机', '0', '', '51', '5', '255', '0', '', '', '', '1');
INSERT INTO `ds_goodsclass` VALUES ('103', '脱水机', '0', '', '51', '5', '255', '0', '', '', '', '1');
INSERT INTO `ds_goodsclass` VALUES ('104', '曲面电视', '0', '', '5', '5', '255', '0', '', '', '', '1');
INSERT INTO `ds_goodsclass` VALUES ('105', '超薄电视', '0', '', '5', '5', '255', '0', '', '', '', '1');
INSERT INTO `ds_goodsclass` VALUES ('106', '4看电视', '0', '', '5', '5', '255', '0', '', '', '', '1');
INSERT INTO `ds_goodsclass` VALUES ('107', '智能电视', '0', '', '5', '5', '255', '0', '', '', '', '1');
INSERT INTO `ds_goodsclass` VALUES ('108', 'OLED电视', '0', '', '5', '5', '255', '0', '', '', '', '1');
INSERT INTO `ds_goodsclass` VALUES ('109', '油烟机', '0', '', '20', '5', '255', '0', '', '', '', '1');
INSERT INTO `ds_goodsclass` VALUES ('110', '热水器', '0', '', '20', '5', '255', '0', '', '', '', '1');
INSERT INTO `ds_goodsclass` VALUES ('111', '电饭煲', '0', '', '20', '5', '255', '0', '', '', '', '1');
INSERT INTO `ds_goodsclass` VALUES ('112', '消毒机', '0', '', '20', '5', '255', '0', '', '', '', '1');
INSERT INTO `ds_goodsclass` VALUES ('113', '洗碗机', '0', '', '20', '5', '255', '0', '', '', '', '1');
INSERT INTO `ds_goodsclass` VALUES ('114', '净水器', '0', '', '20', '5', '255', '0', '', '', '', '1');
INSERT INTO `ds_goodsclass` VALUES ('115', '厨卫配件', '0', '', '20', '5', '255', '0', '', '', '', '1');
INSERT INTO `ds_goodsclass` VALUES ('116', '电风扇', '0', '', '21', '5', '255', '0', '', '', '', '1');
INSERT INTO `ds_goodsclass` VALUES ('117', '空气净化器', '0', '', '21', '5', '255', '0', '', '', '', '1');
INSERT INTO `ds_goodsclass` VALUES ('118', '吸尘器', '0', '', '21', '5', '255', '0', '', '', '', '1');
INSERT INTO `ds_goodsclass` VALUES ('119', '挂烫机', '0', '', '21', '5', '255', '0', '', '', '', '1');
INSERT INTO `ds_goodsclass` VALUES ('120', '电熨斗', '0', '', '21', '5', '255', '0', '', '', '', '1');
INSERT INTO `ds_goodsclass` VALUES ('121', '烤箱', '0', '', '22', '5', '255', '0', '', '', '', '1');
INSERT INTO `ds_goodsclass` VALUES ('122', '电水壶', '0', '', '22', '5', '255', '0', '', '', '', '1');
INSERT INTO `ds_goodsclass` VALUES ('123', '电磁炉', '0', '', '22', '5', '255', '0', '', '', '', '1');
INSERT INTO `ds_goodsclass` VALUES ('124', '剃须刀', '0', '', '55', '5', '255', '0', '', '', '', '1');
INSERT INTO `ds_goodsclass` VALUES ('125', '口腔护理', '0', '', '55', '5', '255', '0', '', '', '', '1');
INSERT INTO `ds_goodsclass` VALUES ('126', '电吹风', '0', '', '55', '5', '255', '0', '', '', '', '1');
INSERT INTO `ds_goodsclass` VALUES ('127', '美容仪', '0', '', '55', '5', '255', '0', '', '', '', '1');
INSERT INTO `ds_goodsclass` VALUES ('128', '洁面仪', '0', '', '55', '5', '255', '0', '', '', '', '1');
INSERT INTO `ds_goodsclass` VALUES ('129', '卷发器', '0', '', '55', '5', '255', '0', '', '', '', '1');
INSERT INTO `ds_goodsclass` VALUES ('130', '按摩椅', '0', '', '55', '5', '255', '0', '', '', '', '1');
INSERT INTO `ds_goodsclass` VALUES ('131', '足浴盆', '0', '', '55', '5', '255', '0', '', '', '', '1');
INSERT INTO `ds_goodsclass` VALUES ('132', '健康秤', '0', '', '55', '5', '255', '0', '', '', '', '1');
INSERT INTO `ds_goodsclass` VALUES ('133', '其他', '0', '', '55', '5', '255', '0', '', '', '', '1');
INSERT INTO `ds_goodsclass` VALUES ('134', '笔记本', '0', '', '23', '5', '255', '0', '', '', '', '1');
INSERT INTO `ds_goodsclass` VALUES ('135', '平板电脑', '0', '', '23', '5', '255', '0', '', '', '', '1');
INSERT INTO `ds_goodsclass` VALUES ('136', '台式电脑', '0', '', '23', '5', '255', '0', '', '', '', '1');
INSERT INTO `ds_goodsclass` VALUES ('137', '游戏本', '0', '', '23', '5', '255', '0', '', '', '', '1');
INSERT INTO `ds_goodsclass` VALUES ('138', '轻薄本', '0', '', '23', '5', '255', '0', '', '', '', '1');
INSERT INTO `ds_goodsclass` VALUES ('139', '电脑一体机', '0', '', '23', '5', '255', '0', '', '', '', '1');
INSERT INTO `ds_goodsclass` VALUES ('140', '组装电脑', '0', '', '23', '5', '255', '0', '', '', '', '1');
INSERT INTO `ds_goodsclass` VALUES ('141', '商用笔记本', '0', '', '23', '5', '255', '0', '', '', '', '1');
INSERT INTO `ds_goodsclass` VALUES ('142', '商用一体机', '0', '', '23', '5', '255', '0', '', '', '', '1');
INSERT INTO `ds_goodsclass` VALUES ('143', '商用台式机', '0', '', '23', '5', '255', '0', '', '', '', '1');
INSERT INTO `ds_goodsclass` VALUES ('144', '打印机', '0', '', '24', '5', '255', '0', '', '', '', '1');
INSERT INTO `ds_goodsclass` VALUES ('145', '电话机', '0', '', '24', '5', '255', '0', '', '', '', '1');
INSERT INTO `ds_goodsclass` VALUES ('146', '扫描仪', '0', '', '24', '5', '255', '0', '', '', '', '1');
INSERT INTO `ds_goodsclass` VALUES ('147', '投影仪', '0', '', '24', '5', '255', '0', '', '', '', '1');
INSERT INTO `ds_goodsclass` VALUES ('148', '投影附件', '0', '', '24', '5', '255', '0', '', '', '', '1');
INSERT INTO `ds_goodsclass` VALUES ('149', '传真机', '0', '', '24', '5', '255', '0', '', '', '', '1');
INSERT INTO `ds_goodsclass` VALUES ('150', '碎纸机', '0', '', '24', '5', '255', '0', '', '', '', '1');
INSERT INTO `ds_goodsclass` VALUES ('151', '复印/复合机', '0', '', '24', '5', '255', '0', '', '', '', '1');
INSERT INTO `ds_goodsclass` VALUES ('152', '激光笔', '0', '', '24', '5', '255', '0', '', '', '', '1');
INSERT INTO `ds_goodsclass` VALUES ('153', '投影幕布', '0', '', '24', '5', '255', '0', '', '', '', '1');
INSERT INTO `ds_goodsclass` VALUES ('154', '鼠标', '0', '', '56', '5', '255', '0', '', '', '', '1');
INSERT INTO `ds_goodsclass` VALUES ('155', '键盘', '0', '', '56', '5', '255', '0', '', '', '', '1');
INSERT INTO `ds_goodsclass` VALUES ('156', '鼠标垫', '0', '', '56', '5', '255', '0', '', '', '', '1');
INSERT INTO `ds_goodsclass` VALUES ('157', '电脑包', '0', '', '56', '5', '255', '0', '', '', '', '1');
INSERT INTO `ds_goodsclass` VALUES ('158', '电脑音箱', '0', '', '56', '5', '255', '0', '', '', '', '1');
INSERT INTO `ds_goodsclass` VALUES ('159', '显示器', '0', '', '57', '5', '255', '0', '', '', '', '1');
INSERT INTO `ds_goodsclass` VALUES ('160', 'CPU', '0', '', '57', '5', '255', '0', '', '', '', '1');
INSERT INTO `ds_goodsclass` VALUES ('161', '主板', '0', '', '57', '5', '255', '0', '', '', '', '1');
INSERT INTO `ds_goodsclass` VALUES ('162', '显卡', '0', '', '57', '5', '255', '0', '', '', '', '1');
INSERT INTO `ds_goodsclass` VALUES ('163', '硬盘', '0', '', '57', '5', '255', '0', '', '', '', '1');
INSERT INTO `ds_goodsclass` VALUES ('164', '内存', '0', '', '57', '5', '255', '0', '', '', '', '1');
INSERT INTO `ds_goodsclass` VALUES ('165', '机箱', '0', '', '57', '5', '255', '0', '', '', '', '1');
INSERT INTO `ds_goodsclass` VALUES ('166', '固态硬盘', '0', '', '57', '5', '255', '0', '', '', '', '1');
INSERT INTO `ds_goodsclass` VALUES ('167', '床品套件', '0', '', '25', '5', '255', '0', '', '', '', '1');
INSERT INTO `ds_goodsclass` VALUES ('168', '枕头/枕套', '0', '', '25', '5', '255', '0', '', '', '', '1');
INSERT INTO `ds_goodsclass` VALUES ('169', '凉席', '0', '', '25', '5', '255', '0', '', '', '', '1');
INSERT INTO `ds_goodsclass` VALUES ('170', '蚊帐', '0', '', '25', '5', '255', '0', '', '', '', '1');
INSERT INTO `ds_goodsclass` VALUES ('171', '毛巾', '0', '', '25', '5', '255', '0', '', '', '', '1');
INSERT INTO `ds_goodsclass` VALUES ('172', '床单', '0', '', '25', '5', '255', '0', '', '', '', '1');
INSERT INTO `ds_goodsclass` VALUES ('173', '被子', '0', '', '25', '5', '255', '0', '', '', '', '1');
INSERT INTO `ds_goodsclass` VALUES ('174', '床', '0', '', '26', '5', '255', '0', '', '', '', '1');
INSERT INTO `ds_goodsclass` VALUES ('175', '沙发', '0', '', '26', '5', '255', '0', '', '', '', '1');
INSERT INTO `ds_goodsclass` VALUES ('176', '衣柜', '0', '', '26', '5', '255', '0', '', '', '', '1');
INSERT INTO `ds_goodsclass` VALUES ('177', '电视柜', '0', '', '26', '5', '255', '0', '', '', '', '1');
INSERT INTO `ds_goodsclass` VALUES ('178', '电脑桌', '0', '', '26', '5', '255', '0', '', '', '', '1');
INSERT INTO `ds_goodsclass` VALUES ('179', '书桌', '0', '', '26', '5', '255', '0', '', '', '', '1');
INSERT INTO `ds_goodsclass` VALUES ('180', '餐桌', '0', '', '26', '5', '255', '0', '', '', '', '1');
INSERT INTO `ds_goodsclass` VALUES ('181', '餐椅', '0', '', '26', '5', '255', '0', '', '', '', '1');
INSERT INTO `ds_goodsclass` VALUES ('182', '收纳用品', '0', '', '27', '5', '255', '0', '', '', '', '1');
INSERT INTO `ds_goodsclass` VALUES ('183', '洗晒用品', '0', '', '27', '5', '255', '0', '', '', '', '1');
INSERT INTO `ds_goodsclass` VALUES ('184', '晴雨用具', '0', '', '27', '5', '255', '0', '', '', '', '1');
INSERT INTO `ds_goodsclass` VALUES ('185', '园艺用品', '0', '', '27', '5', '255', '0', '', '', '', '1');
INSERT INTO `ds_goodsclass` VALUES ('186', '日常防护', '0', '', '27', '5', '255', '0', '', '', '', '1');
INSERT INTO `ds_goodsclass` VALUES ('187', '休闲食品', '0', '', '28', '5', '255', '0', '', '', '', '1');
INSERT INTO `ds_goodsclass` VALUES ('188', '吸顶灯', '0', '', '58', '5', '255', '0', '', '', '', '1');
INSERT INTO `ds_goodsclass` VALUES ('189', '吊灯', '0', '', '58', '5', '255', '0', '', '', '', '1');
INSERT INTO `ds_goodsclass` VALUES ('190', '台灯', '0', '', '58', '5', '255', '0', '', '', '', '1');
INSERT INTO `ds_goodsclass` VALUES ('191', 'LED照明', '0', '', '58', '5', '255', '0', '', '', '', '1');
INSERT INTO `ds_goodsclass` VALUES ('192', '日光灯', '0', '', '58', '5', '255', '0', '', '', '', '1');
INSERT INTO `ds_goodsclass` VALUES ('193', '龙头', '0', '', '59', '5', '255', '0', '', '', '', '1');
INSERT INTO `ds_goodsclass` VALUES ('194', '浴缸', '0', '', '59', '5', '255', '0', '', '', '', '1');
INSERT INTO `ds_goodsclass` VALUES ('195', '角阀', '0', '', '59', '5', '255', '0', '', '', '', '1');
INSERT INTO `ds_goodsclass` VALUES ('196', '小便器', '0', '', '59', '5', '255', '0', '', '', '', '1');
INSERT INTO `ds_goodsclass` VALUES ('197', '坚果', '0', '', '28', '5', '255', '0', '', '', '', '1');
INSERT INTO `ds_goodsclass` VALUES ('198', '饼干', '0', '', '28', '5', '255', '0', '', '', '', '1');
INSERT INTO `ds_goodsclass` VALUES ('199', '蜜饯', '0', '', '28', '5', '255', '0', '', '', '', '1');
INSERT INTO `ds_goodsclass` VALUES ('200', '卤味小食', '0', '', '28', '5', '255', '0', '', '', '', '1');
INSERT INTO `ds_goodsclass` VALUES ('201', '膨化食品', '0', '', '28', '5', '255', '0', '', '', '', '1');
INSERT INTO `ds_goodsclass` VALUES ('202', '巧克力', '0', '', '28', '5', '255', '0', '', '', '', '1');
INSERT INTO `ds_goodsclass` VALUES ('203', '糖果', '0', '', '28', '5', '255', '0', '', '', '', '1');
INSERT INTO `ds_goodsclass` VALUES ('204', '糕点', '0', '', '28', '5', '255', '0', '', '', '', '1');
INSERT INTO `ds_goodsclass` VALUES ('205', '面粉', '0', '', '28', '5', '255', '0', '', '', '', '1');
INSERT INTO `ds_goodsclass` VALUES ('206', '面条', '0', '', '28', '5', '255', '0', '', '', '', '1');
INSERT INTO `ds_goodsclass` VALUES ('207', '食用油', '0', '', '28', '5', '255', '0', '', '', '', '1');
INSERT INTO `ds_goodsclass` VALUES ('208', '大米', '0', '', '28', '5', '255', '0', '', '', '', '1');
INSERT INTO `ds_goodsclass` VALUES ('209', '月饼', '0', '', '28', '5', '255', '0', '', '', '', '1');
INSERT INTO `ds_goodsclass` VALUES ('210', '口香糖', '0', '', '28', '5', '255', '0', '', '', '', '1');
INSERT INTO `ds_goodsclass` VALUES ('211', '薯片', '0', '', '28', '5', '255', '0', '', '', '', '1');
INSERT INTO `ds_goodsclass` VALUES ('212', '龟苓膏', '0', '', '28', '5', '255', '0', '', '', '', '1');
INSERT INTO `ds_goodsclass` VALUES ('213', '白酒', '0', '', '29', '5', '255', '0', '', '', '', '1');
INSERT INTO `ds_goodsclass` VALUES ('214', '红酒', '0', '', '29', '5', '255', '0', '', '', '', '1');
INSERT INTO `ds_goodsclass` VALUES ('215', '黄酒', '0', '', '29', '5', '255', '0', '', '', '', '1');
INSERT INTO `ds_goodsclass` VALUES ('216', '啤酒', '0', '', '29', '5', '255', '0', '', '', '', '1');
INSERT INTO `ds_goodsclass` VALUES ('217', '预调酒', '0', '', '29', '5', '255', '0', '', '', '', '1');
INSERT INTO `ds_goodsclass` VALUES ('219', '碳酸饮料', '0', '', '29', '5', '255', '0', '', '', '', '1');
INSERT INTO `ds_goodsclass` VALUES ('220', '饮用水', '0', '', '29', '5', '255', '0', '', '', '', '1');
INSERT INTO `ds_goodsclass` VALUES ('221', '果蔬汁', '0', '', '29', '5', '255', '0', '', '', '', '1');
INSERT INTO `ds_goodsclass` VALUES ('222', '椰奶', '0', '', '29', '5', '255', '0', '', '', '', '1');
INSERT INTO `ds_goodsclass` VALUES ('223', '功能饮料', '0', '', '29', '5', '255', '0', '', '', '', '1');
INSERT INTO `ds_goodsclass` VALUES ('224', '含乳饮料', '0', '', '29', '5', '255', '0', '', '', '', '1');
INSERT INTO `ds_goodsclass` VALUES ('225', '绿茶', '0', '', '29', '5', '255', '0', '', '', '', '1');
INSERT INTO `ds_goodsclass` VALUES ('226', '红茶', '0', '', '29', '5', '255', '0', '', '', '', '1');
INSERT INTO `ds_goodsclass` VALUES ('227', '奶茶', '0', '', '29', '5', '255', '0', '', '', '', '1');
INSERT INTO `ds_goodsclass` VALUES ('228', '纯奶', '0', '', '29', '5', '255', '0', '', '', '', '1');
INSERT INTO `ds_goodsclass` VALUES ('229', '酸奶', '0', '', '29', '5', '255', '0', '', '', '', '1');
INSERT INTO `ds_goodsclass` VALUES ('230', '风味奶', '0', '', '29', '5', '255', '0', '', '', '', '1');
INSERT INTO `ds_goodsclass` VALUES ('231', '纯牛奶', '0', '', '60', '5', '255', '0', '', '', '', '1');
INSERT INTO `ds_goodsclass` VALUES ('232', '碳酸饮料', '0', '', '60', '5', '255', '0', '', '', '', '1');
INSERT INTO `ds_goodsclass` VALUES ('233', '麦片', '0', '', '60', '5', '255', '0', '', '', '', '1');
INSERT INTO `ds_goodsclass` VALUES ('234', '进口水果', '0', '', '61', '5', '255', '0', '', '', '', '1');
INSERT INTO `ds_goodsclass` VALUES ('235', '奇异果', '0', '', '61', '5', '255', '0', '', '', '', '1');
INSERT INTO `ds_goodsclass` VALUES ('236', '橙子', '0', '', '61', '5', '255', '0', '', '', '', '1');
INSERT INTO `ds_goodsclass` VALUES ('237', '火龙果', '0', '', '61', '5', '255', '0', '', '', '', '1');
INSERT INTO `ds_goodsclass` VALUES ('238', '芒果', '0', '', '61', '5', '255', '0', '', '', '', '1');
INSERT INTO `ds_goodsclass` VALUES ('239', '凤梨', '0', '', '61', '5', '255', '0', '', '', '', '1');
INSERT INTO `ds_goodsclass` VALUES ('240', '虾类', '0', '', '61', '5', '255', '0', '', '', '', '1');
INSERT INTO `ds_goodsclass` VALUES ('241', '贝类', '0', '', '61', '5', '255', '0', '', '', '', '1');
INSERT INTO `ds_goodsclass` VALUES ('242', '鱼类', '0', '', '61', '5', '255', '0', '', '', '', '1');
INSERT INTO `ds_goodsclass` VALUES ('243', '猪肉', '0', '', '61', '5', '255', '0', '', '', '', '1');
INSERT INTO `ds_goodsclass` VALUES ('244', '牛肉', '0', '', '61', '5', '255', '0', '', '', '', '1');
INSERT INTO `ds_goodsclass` VALUES ('245', '羊肉', '0', '', '61', '5', '255', '0', '', '', '', '1');
INSERT INTO `ds_goodsclass` VALUES ('246', '蛋类', '0', '', '62', '5', '255', '0', '', '', '', '1');
INSERT INTO `ds_goodsclass` VALUES ('247', '冷冻食品', '0', '', '61', '5', '255', '0', '', '', '', '1');
INSERT INTO `ds_goodsclass` VALUES ('248', '时令蔬菜', '0', '', '61', '5', '255', '0', '', '', '', '1');
INSERT INTO `ds_goodsclass` VALUES ('249', '维生素/矿物质', '0', '', '62', '5', '255', '0', '', '', '', '1');
INSERT INTO `ds_goodsclass` VALUES ('250', '减肥瘦身', '0', '', '62', '5', '255', '0', '', '', '', '1');
INSERT INTO `ds_goodsclass` VALUES ('251', '提高免疫', '0', '', '62', '5', '255', '0', '', '', '', '1');
INSERT INTO `ds_goodsclass` VALUES ('252', '美容养颜', '0', '', '62', '5', '255', '0', '', '', '', '1');
INSERT INTO `ds_goodsclass` VALUES ('253', '补肾强身', '0', '', '62', '5', '255', '0', '', '', '', '1');
INSERT INTO `ds_goodsclass` VALUES ('254', '蜂制品', '0', '', '62', '5', '255', '0', '', '', '', '1');
INSERT INTO `ds_goodsclass` VALUES ('255', '参类', '0', '', '62', '5', '255', '0', '', '', '', '1');
INSERT INTO `ds_goodsclass` VALUES ('256', '枸杞', '0', '', '62', '5', '255', '0', '', '', '', '1');
INSERT INTO `ds_goodsclass` VALUES ('257', '冬虫夏草', '0', '', '62', '5', '255', '0', '', '', '', '1');
INSERT INTO `ds_goodsclass` VALUES ('258', '燕窝', '0', '', '62', '5', '255', '0', '', '', '', '1');
INSERT INTO `ds_goodsclass` VALUES ('259', '石斛', '0', '', '62', '5', '255', '0', '', '', '', '1');
INSERT INTO `ds_goodsclass` VALUES ('260', '三七', '0', '', '62', '5', '255', '0', '', '', '', '1');
INSERT INTO `ds_goodsclass` VALUES ('262', '特产', '0', '', '11', '5', '255', '0', '', '', '', '1');
INSERT INTO `ds_goodsclass` VALUES ('263', '食用油', '0', '', '262', '5', '255', '0', '', '', '', '1');
INSERT INTO `ds_goodsclass` VALUES ('264', '五谷杂粮', '0', '', '262', '5', '255', '0', '', '', '', '1');
INSERT INTO `ds_goodsclass` VALUES ('265', '调味品', '0', '', '262', '5', '255', '0', '', '', '', '1');
INSERT INTO `ds_goodsclass` VALUES ('266', '糖果', '0', '', '262', '5', '255', '0', '', '', '', '1');
INSERT INTO `ds_goodsclass` VALUES ('267', '坚果', '0', '', '262', '5', '255', '0', '', '', '', '1');
INSERT INTO `ds_goodsclass` VALUES ('268', '蜜饯', '0', '', '262', '5', '255', '0', '', '', '', '1');
INSERT INTO `ds_goodsclass` VALUES ('269', '陶瓷', '0', '', '262', '5', '255', '0', '', '', '', '1');
INSERT INTO `ds_goodsclass` VALUES ('270', '商务鞋', '1', '联动', '45', '5', '255', '0', '', '', '', '1');
INSERT INTO `ds_goodsclass` VALUES ('271', '茶艺', '0', '', '262', '5', '255', '0', '', '', '', '1');
INSERT INTO `ds_goodsclass` VALUES ('272', '滋补营养品', '0', '', '262', '5', '255', '0', '', '', '', '1');
INSERT INTO `ds_goodsclass` VALUES ('273', '休闲鞋', '1', '联动', '45', '5', '255', '0', '', '', '', '1');
INSERT INTO `ds_goodsclass` VALUES ('274', '营养保健', '0', '', '262', '5', '255', '0', '', '', '', '1');
INSERT INTO `ds_goodsclass` VALUES ('275', '酒水', '0', '', '262', '5', '255', '0', '', '', '', '1');
INSERT INTO `ds_goodsclass` VALUES ('276', '板鞋', '1', '联动', '45', '5', '255', '0', '', '', '', '1');
INSERT INTO `ds_goodsclass` VALUES ('277', '茗茶', '0', '', '262', '5', '255', '0', '', '', '', '1');
INSERT INTO `ds_goodsclass` VALUES ('278', '饮料', '0', '', '262', '5', '255', '0', '', '', '', '1');
INSERT INTO `ds_goodsclass` VALUES ('279', '帆布鞋', '1', '联动', '45', '5', '255', '0', '', '', '', '1');
INSERT INTO `ds_goodsclass` VALUES ('280', '海鲜水产', '0', '', '262', '5', '255', '0', '', '', '', '1');
INSERT INTO `ds_goodsclass` VALUES ('281', '高跟鞋', '1', '联动', '45', '5', '255', '0', '', '', '', '1');
INSERT INTO `ds_goodsclass` VALUES ('282', '三星', '0', '', '2', '5', '255', '0', '', '', '', '1');
INSERT INTO `ds_goodsclass` VALUES ('283', '凉鞋', '1', '联动', '45', '5', '255', '0', '', '', '', '1');
INSERT INTO `ds_goodsclass` VALUES ('284', '魅族', '0', '', '2', '5', '255', '0', '', '', '', '1');
INSERT INTO `ds_goodsclass` VALUES ('285', '努比亚', '0', '', '2', '5', '255', '0', '', '', '', '1');
INSERT INTO `ds_goodsclass` VALUES ('286', '钻戒', '1', '联动', '46', '5', '255', '0', '', '', '', '1');
INSERT INTO `ds_goodsclass` VALUES ('287', '乐视', '0', '', '2', '5', '255', '0', '', '', '', '1');
INSERT INTO `ds_goodsclass` VALUES ('288', '洛基亚', '0', '', '2', '5', '255', '0', '', '', '', '1');
INSERT INTO `ds_goodsclass` VALUES ('289', '黄金饰品', '1', '联动', '46', '5', '255', '0', '', '', '', '1');
INSERT INTO `ds_goodsclass` VALUES ('290', '翡翠玉石', '1', '联动', '46', '5', '255', '0', '', '', '', '1');
INSERT INTO `ds_goodsclass` VALUES ('291', '运动跟踪', '0', '', '3', '5', '255', '0', '', '', '', '1');
INSERT INTO `ds_goodsclass` VALUES ('292', '银饰', '1', '联动', '46', '5', '255', '0', '', '', '', '1');
INSERT INTO `ds_goodsclass` VALUES ('293', '智能防丢', '0', '', '3', '5', '255', '0', '', '', '', '1');
INSERT INTO `ds_goodsclass` VALUES ('294', '木饰', '1', '联动', '46', '5', '255', '0', '', '', '', '1');
INSERT INTO `ds_goodsclass` VALUES ('295', '体感车', '0', '', '2', '5', '255', '0', '', '', '', '1');
INSERT INTO `ds_goodsclass` VALUES ('296', '智能安防', '0', '', '3', '5', '255', '0', '', '', '', '1');
INSERT INTO `ds_goodsclass` VALUES ('297', '虚拟现实', '0', '', '3', '5', '255', '0', '', '', '', '1');
INSERT INTO `ds_goodsclass` VALUES ('298', '智能机器人', '0', '', '2', '5', '255', '0', '', '', '', '1');
INSERT INTO `ds_goodsclass` VALUES ('299', '智能摄像头', '0', '', '3', '5', '255', '0', '', '', '', '1');
INSERT INTO `ds_goodsclass` VALUES ('300', '单肩包', '1', '联动', '47', '5', '255', '0', '', '', '', '1');
INSERT INTO `ds_goodsclass` VALUES ('301', '双肩包', '1', '联动', '47', '5', '255', '0', '', '', '', '1');
INSERT INTO `ds_goodsclass` VALUES ('302', '充电宝', '0', '', '48', '5', '255', '0', '', '', '', '1');
INSERT INTO `ds_goodsclass` VALUES ('303', '手提包', '1', '联动', '47', '5', '255', '0', '', '', '', '1');
INSERT INTO `ds_goodsclass` VALUES ('304', '快充电源', '0', '', '48', '5', '255', '0', '', '', '', '1');
INSERT INTO `ds_goodsclass` VALUES ('305', '手机电池', '0', '', '48', '5', '255', '0', '', '', '', '1');
INSERT INTO `ds_goodsclass` VALUES ('306', '卡包', '1', '联动', '47', '5', '255', '0', '', '', '', '1');
INSERT INTO `ds_goodsclass` VALUES ('307', '车载充电', '0', '', '48', '5', '255', '0', '', '', '', '1');
INSERT INTO `ds_goodsclass` VALUES ('308', '斜挎包', '1', '联动', '47', '5', '255', '0', '', '', '', '1');
INSERT INTO `ds_goodsclass` VALUES ('309', '蓝牙耳机', '0', '', '48', '5', '255', '0', '', '', '', '1');
INSERT INTO `ds_goodsclass` VALUES ('310', '蓝牙音箱', '0', '', '48', '5', '255', '0', '', '', '', '1');
INSERT INTO `ds_goodsclass` VALUES ('311', '女表', '1', '联动', '68', '5', '255', '0', '', '', '', '1');
INSERT INTO `ds_goodsclass` VALUES ('312', '高帮鞋', '1', '联动', '45', '5', '255', '0', '', '', '', '1');
INSERT INTO `ds_goodsclass` VALUES ('313', '手机套', '0', '', '48', '5', '255', '0', '', '', '', '1');
INSERT INTO `ds_goodsclass` VALUES ('314', '手机壳', '0', '', '48', '5', '255', '0', '', '', '', '1');
INSERT INTO `ds_goodsclass` VALUES ('315', '皮鞋', '1', '联动', '45', '5', '255', '0', '', '', '', '1');
INSERT INTO `ds_goodsclass` VALUES ('316', '手机贴膜', '0', '', '48', '5', '255', '0', '', '', '', '1');
INSERT INTO `ds_goodsclass` VALUES ('317', '手机支架', '0', '', '48', '5', '255', '0', '', '', '', '1');
INSERT INTO `ds_goodsclass` VALUES ('318', '球鞋', '1', '联动', '45', '5', '255', '0', '', '', '', '1');
INSERT INTO `ds_goodsclass` VALUES ('319', '自拍神器', '0', '', '48', '5', '255', '0', '', '', '', '1');
INSERT INTO `ds_goodsclass` VALUES ('320', '豆豆鞋', '1', '联动', '45', '5', '255', '0', '', '', '', '1');
INSERT INTO `ds_goodsclass` VALUES ('321', '电子教育', '0', '', '1', '5', '255', '0', '', '', '', '1');
INSERT INTO `ds_goodsclass` VALUES ('322', '铂金', '1', '联动', '46', '5', '255', '0', '', '', '', '1');
INSERT INTO `ds_goodsclass` VALUES ('323', '彩宝', '1', '联动', '46', '5', '255', '0', '', '', '', '1');
INSERT INTO `ds_goodsclass` VALUES ('324', '锤子', '0', '', '2', '5', '255', '0', '', '', '', '1');
INSERT INTO `ds_goodsclass` VALUES ('325', '学生电脑', '0', '', '321', '5', '255', '0', '', '', '', '1');
INSERT INTO `ds_goodsclass` VALUES ('326', '水晶玛瑙', '1', '联动', '46', '5', '255', '0', '', '', '', '1');
INSERT INTO `ds_goodsclass` VALUES ('327', '珍珠', '1', '联动', '46', '5', '255', '0', '', '', '', '1');
INSERT INTO `ds_goodsclass` VALUES ('328', '电子词典', '0', '', '321', '5', '255', '0', '', '', '', '1');
INSERT INTO `ds_goodsclass` VALUES ('329', '故事机', '0', '', '321', '5', '255', '0', '', '', '', '1');
INSERT INTO `ds_goodsclass` VALUES ('330', '点读机', '0', '', '321', '5', '255', '0', '', '', '', '1');
INSERT INTO `ds_goodsclass` VALUES ('331', '商务公文包', '1', '联动', '47', '5', '255', '0', '', '', '', '1');
INSERT INTO `ds_goodsclass` VALUES ('332', '电子书', '0', '', '321', '5', '255', '0', '', '', '', '1');
INSERT INTO `ds_goodsclass` VALUES ('333', '儿童手表', '0', '', '321', '5', '255', '0', '', '', '', '1');
INSERT INTO `ds_goodsclass` VALUES ('334', '旅行包', '0', '', '47', '5', '255', '0', '', '', '', '1');
INSERT INTO `ds_goodsclass` VALUES ('335', '学生手机', '0', '', '321', '5', '255', '0', '', '', '', '1');
INSERT INTO `ds_goodsclass` VALUES ('336', '手拿包', '1', '联动', '47', '5', '255', '0', '', '', '', '1');
INSERT INTO `ds_goodsclass` VALUES ('337', '瑞士名表', '1', '联动', '68', '5', '255', '0', '', '', '', '1');
INSERT INTO `ds_goodsclass` VALUES ('338', '营业厅', '0', '', '1', '5', '255', '0', '', '', '', '1');
INSERT INTO `ds_goodsclass` VALUES ('339', '中国移动', '0', '', '338', '5', '255', '0', '', '', '', '1');
INSERT INTO `ds_goodsclass` VALUES ('340', '国产名表', '1', '联动', '68', '5', '255', '0', '', '', '', '1');
INSERT INTO `ds_goodsclass` VALUES ('341', '中国电信', '0', '', '338', '5', '255', '0', '', '', '', '1');
INSERT INTO `ds_goodsclass` VALUES ('342', '石英表', '0', '', '68', '5', '255', '0', '', '', '', '1');
INSERT INTO `ds_goodsclass` VALUES ('343', '中国联通', '0', '', '338', '5', '255', '0', '', '', '', '1');
INSERT INTO `ds_goodsclass` VALUES ('344', '选号码', '0', '', '338', '5', '255', '0', '', '', '', '1');
INSERT INTO `ds_goodsclass` VALUES ('345', '运动表', '0', '', '68', '5', '255', '0', '', '', '', '1');
INSERT INTO `ds_goodsclass` VALUES ('346', '办套餐', '0', '', '338', '5', '255', '0', '', '', '', '1');
INSERT INTO `ds_goodsclass` VALUES ('347', '闹钟挂钟', '1', '联动', '68', '5', '255', '0', '', '', '', '1');
INSERT INTO `ds_goodsclass` VALUES ('348', '低月租', '0', '', '338', '5', '255', '0', '', '', '', '1');
INSERT INTO `ds_goodsclass` VALUES ('349', '充值', '0', '', '338', '5', '255', '0', '', '', '', '1');
INSERT INTO `ds_goodsclass` VALUES ('350', '太阳镜', '1', '联动', '68', '5', '255', '0', '', '', '', '1');
INSERT INTO `ds_goodsclass` VALUES ('351', '购机送话费', '0', '', '338', '5', '255', '0', '', '', '', '1');
INSERT INTO `ds_goodsclass` VALUES ('352', '隐形眼镜', '1', '联动', '68', '5', '255', '0', '', '', '', '1');
INSERT INTO `ds_goodsclass` VALUES ('353', '水晶', '0', '', '69', '5', '255', '0', '', '', '', '1');
INSERT INTO `ds_goodsclass` VALUES ('354', '琉璃', '0', '', '69', '5', '255', '0', '', '', '', '1');
INSERT INTO `ds_goodsclass` VALUES ('355', '陶瓷', '0', '', '69', '5', '255', '0', '', '', '', '1');
INSERT INTO `ds_goodsclass` VALUES ('356', '雕刻', '1', '联动', '69', '5', '255', '0', '', '', '', '1');
INSERT INTO `ds_goodsclass` VALUES ('357', '刺绣', '0', '', '69', '5', '255', '0', '', '', '', '1');
INSERT INTO `ds_goodsclass` VALUES ('358', '刺绣', '0', '', '69', '5', '255', '0', '', '', '', '1');
INSERT INTO `ds_goodsclass` VALUES ('359', '青铜器', '1', '联动', '69', '5', '255', '0', '', '', '', '1');
INSERT INTO `ds_goodsclass` VALUES ('360', '书画', '0', '', '69', '5', '255', '0', '', '', '', '1');
INSERT INTO `ds_goodsclass` VALUES ('361', '影视周边', '0', '', '69', '5', '255', '0', '', '', '', '1');
INSERT INTO `ds_goodsclass` VALUES ('362', 'T恤', '1', '联动', '39', '5', '255', '0', '', '', '', '1');
INSERT INTO `ds_goodsclass` VALUES ('363', '短外套', '0', '', '39', '5', '255', '0', '', '', '', '1');
INSERT INTO `ds_goodsclass` VALUES ('364', '长袖衬衫', '1', '联动', '39', '5', '255', '0', '', '', '', '1');
INSERT INTO `ds_goodsclass` VALUES ('365', '针织衫女', '1', '联动', '39', '5', '255', '0', '', '', '', '1');
INSERT INTO `ds_goodsclass` VALUES ('366', '字母T恤', '1', '联动', '39', '5', '255', '0', '', '', '', '1');
INSERT INTO `ds_goodsclass` VALUES ('367', '卫衣女', '1', '联动', '39', '5', '255', '0', '', '', '', '1');
INSERT INTO `ds_goodsclass` VALUES ('368', '小西装', '1', '联动', '39', '5', '255', '0', '', '', '', '1');
INSERT INTO `ds_goodsclass` VALUES ('369', '一步裙', '1', '联动', '39', '5', '255', '0', '', '', '', '1');
INSERT INTO `ds_goodsclass` VALUES ('370', '牛仔裙', '1', '联动', '39', '5', '255', '0', '', '', '', '1');
INSERT INTO `ds_goodsclass` VALUES ('371', 'A字裙', '1', '联动', '39', '5', '255', '0', '', '', '', '1');
INSERT INTO `ds_goodsclass` VALUES ('372', '半身裙', '1', '联动', '39', '5', '255', '0', '', '', '', '1');
INSERT INTO `ds_goodsclass` VALUES ('373', '一字肩连衣裙', '1', '联动', '39', '5', '255', '0', '', '', '', '1');
INSERT INTO `ds_goodsclass` VALUES ('374', '蕾丝裙', '1', '联动', '39', '5', '255', '0', '', '', '', '1');
INSERT INTO `ds_goodsclass` VALUES ('375', '卫衣', '1', '联动', '41', '5', '255', '0', '', '', '', '1');
INSERT INTO `ds_goodsclass` VALUES ('376', '夹克', '1', '联动', '41', '5', '255', '0', '', '', '', '1');
INSERT INTO `ds_goodsclass` VALUES ('377', '西服', '1', '联动', '41', '5', '255', '0', '', '', '', '1');
INSERT INTO `ds_goodsclass` VALUES ('378', 'POLO衫', '1', '联动', '41', '5', '255', '0', '', '', '', '1');
INSERT INTO `ds_goodsclass` VALUES ('379', '4k', '0', '', '5', '5', '255', '0', '', '', '', '1');
INSERT INTO `ds_goodsclass` VALUES ('380', '短袖衬衫', '1', '联动', '41', '5', '255', '0', '', '', '', '1');
INSERT INTO `ds_goodsclass` VALUES ('381', '海信', '0', '', '5', '5', '255', '0', '', '', '', '1');
INSERT INTO `ds_goodsclass` VALUES ('382', '牛仔裤', '1', '联动', '41', '5', '255', '0', '', '', '', '1');
INSERT INTO `ds_goodsclass` VALUES ('383', '索尼', '0', '', '5', '5', '255', '0', '', '', '', '1');
INSERT INTO `ds_goodsclass` VALUES ('384', '创维', '0', '', '5', '5', '255', '0', '', '', '', '1');
INSERT INTO `ds_goodsclass` VALUES ('385', '夏普', '0', '', '5', '5', '255', '0', '', '', '', '1');
INSERT INTO `ds_goodsclass` VALUES ('386', '先锋', '0', '', '5', '5', '255', '0', '', '', '', '1');
INSERT INTO `ds_goodsclass` VALUES ('387', '西裤', '1', '联动', '41', '5', '255', '0', '', '', '', '1');
INSERT INTO `ds_goodsclass` VALUES ('388', '小脚裤', '1', '联动', '41', '5', '255', '0', '', '', '', '1');
INSERT INTO `ds_goodsclass` VALUES ('389', '九分裤', '1', '联动', '41', '5', '255', '0', '', '', '', '1');
INSERT INTO `ds_goodsclass` VALUES ('390', '哈伦裤', '1', '联动', '41', '5', '255', '0', '', '', '', '1');
INSERT INTO `ds_goodsclass` VALUES ('391', '运动裤', '1', '联动', '41', '5', '255', '0', '', '', '', '1');
INSERT INTO `ds_goodsclass` VALUES ('392', '影音', '0', '', '4', '5', '255', '0', '', '', '', '1');
INSERT INTO `ds_goodsclass` VALUES ('393', '女士内裤', '0', '', '44', '5', '255', '0', '', '', '', '1');
INSERT INTO `ds_goodsclass` VALUES ('394', '男士内裤', '1', '联动', '44', '5', '255', '0', '', '', '', '1');
INSERT INTO `ds_goodsclass` VALUES ('395', '纯棉内裤', '1', '联动', '44', '5', '255', '0', '', '', '', '1');
INSERT INTO `ds_goodsclass` VALUES ('396', '家庭影院', '0', '', '392', '5', '255', '0', '', '', '', '1');
INSERT INTO `ds_goodsclass` VALUES ('397', 'HIFI音箱', '0', '', '392', '5', '255', '0', '', '', '', '1');
INSERT INTO `ds_goodsclass` VALUES ('398', '莫代尔内裤', '1', '联动', '44', '5', '255', '0', '', '', '', '1');
INSERT INTO `ds_goodsclass` VALUES ('399', '多条装内裤', '1', '联动', '44', '5', '255', '0', '', '', '', '1');
INSERT INTO `ds_goodsclass` VALUES ('400', '净水器', '0', '', '54', '5', '255', '0', '', '', '', '1');
INSERT INTO `ds_goodsclass` VALUES ('401', '无痕内裤', '1', '联动', '44', '5', '255', '0', '', '', '', '1');
INSERT INTO `ds_goodsclass` VALUES ('402', '直饮机', '0', '', '54', '5', '255', '0', '', '', '', '1');
INSERT INTO `ds_goodsclass` VALUES ('403', '饮水机', '0', '', '54', '5', '255', '0', '', '', '', '1');
INSERT INTO `ds_goodsclass` VALUES ('404', '吊带背心', '1', '联动', '44', '5', '255', '0', '', '', '', '1');
INSERT INTO `ds_goodsclass` VALUES ('405', '双水机', '0', '', '54', '5', '255', '0', '', '', '', '1');
INSERT INTO `ds_goodsclass` VALUES ('406', '男士背心', '1', '联动', '44', '5', '255', '0', '', '', '', '1');
INSERT INTO `ds_goodsclass` VALUES ('407', '开水器', '0', '', '54', '5', '255', '0', '', '', '', '1');
INSERT INTO `ds_goodsclass` VALUES ('408', '卫衣女', '1', '联动', '65', '5', '255', '0', '', '', '', '1');
INSERT INTO `ds_goodsclass` VALUES ('409', '连衣裙', '1', '联动', '65', '5', '255', '0', '', '', '', '1');
INSERT INTO `ds_goodsclass` VALUES ('410', '卫浴电器', '0', '', '8', '5', '255', '0', '', '', '', '1');
INSERT INTO `ds_goodsclass` VALUES ('411', '夹克男', '1', '联动', '65', '5', '255', '0', '', '', '', '1');
INSERT INTO `ds_goodsclass` VALUES ('412', '中式厨房', '0', '', '8', '5', '255', '0', '', '', '', '1');
INSERT INTO `ds_goodsclass` VALUES ('413', '西式厨房', '0', '', '8', '5', '255', '0', '', '', '', '1');
INSERT INTO `ds_goodsclass` VALUES ('414', '男士衬衫', '1', '联动', '65', '5', '255', '0', '', '', '', '1');
INSERT INTO `ds_goodsclass` VALUES ('415', '雪纺衫', '1', '联动', '65', '5', '255', '0', '', '', '', '1');
INSERT INTO `ds_goodsclass` VALUES ('416', '进口专区', '0', '', '8', '5', '255', '0', '', '', '', '1');
INSERT INTO `ds_goodsclass` VALUES ('417', '碎花裙', '1', '联动', '65', '5', '255', '0', '', '', '', '1');
INSERT INTO `ds_goodsclass` VALUES ('418', '文胸', '1', '联动', '65', '5', '255', '0', '', '', '', '1');
INSERT INTO `ds_goodsclass` VALUES ('419', '睡裙', '1', '联动', '65', '5', '255', '0', '', '', '', '1');
INSERT INTO `ds_goodsclass` VALUES ('420', '五金建材', '0', '', '10', '5', '255', '0', '', '', '', '1');
INSERT INTO `ds_goodsclass` VALUES ('421', '牛仔裤女', '1', '联动', '65', '5', '255', '0', '', '', '', '1');
INSERT INTO `ds_goodsclass` VALUES ('422', '定制装修', '0', '', '10', '5', '255', '0', '', '', '', '1');
INSERT INTO `ds_goodsclass` VALUES ('423', '眼部护理', '1', '联动', '30', '5', '255', '0', '', '', '', '1');
INSERT INTO `ds_goodsclass` VALUES ('424', '平板电脑', '0', '', '9', '5', '255', '0', '', '', '', '1');
INSERT INTO `ds_goodsclass` VALUES ('425', '商用电脑', '0', '', '9', '5', '255', '0', '', '', '', '1');
INSERT INTO `ds_goodsclass` VALUES ('426', '网络设备', '0', '', '9', '5', '255', '0', '', '', '', '1');
INSERT INTO `ds_goodsclass` VALUES ('427', '船袜', '1', '联动', '66', '5', '255', '0', '', '', '', '1');
INSERT INTO `ds_goodsclass` VALUES ('428', '办公文印', '0', '', '9', '5', '255', '0', '', '', '', '1');
INSERT INTO `ds_goodsclass` VALUES ('429', '棉袜棉袜', '1', '联动', '66', '5', '255', '0', '', '', '', '1');
INSERT INTO `ds_goodsclass` VALUES ('430', '男袜', '1', '联动', '66', '5', '255', '0', '', '', '', '1');
INSERT INTO `ds_goodsclass` VALUES ('431', '女袜', '1', '联动', '66', '5', '255', '0', '', '', '', '1');
INSERT INTO `ds_goodsclass` VALUES ('432', '连裤袜', '1', '联动', '66', '5', '255', '0', '', '', '', '1');
INSERT INTO `ds_goodsclass` VALUES ('433', '瘦身袜', '1', '联动', '66', '5', '255', '0', '', '', '', '1');
INSERT INTO `ds_goodsclass` VALUES ('434', '器械隐形', '0', '', '10', '5', '255', '0', '', '', '', '1');
INSERT INTO `ds_goodsclass` VALUES ('435', '遮阳帽', '0', '', '66', '5', '255', '0', '', '', '', '1');
INSERT INTO `ds_goodsclass` VALUES ('436', '男士丝巾/围巾', '1', '联动', '66', '5', '255', '0', '', '', '', '1');
INSERT INTO `ds_goodsclass` VALUES ('437', '领带', '1', '联动', '66', '5', '255', '0', '', '', '', '1');
INSERT INTO `ds_goodsclass` VALUES ('438', '妈妈装', '1', '联动', '67', '5', '255', '0', '', '', '', '1');
INSERT INTO `ds_goodsclass` VALUES ('439', '大码女装', '1', '联动', '67', '5', '255', '0', '', '', '', '1');
INSERT INTO `ds_goodsclass` VALUES ('440', '面部护肤', '0', '', '12', '5', '255', '0', '', '', '', '1');
INSERT INTO `ds_goodsclass` VALUES ('441', '职业套装', '1', '联动', '67', '5', '255', '0', '', '', '', '1');
INSERT INTO `ds_goodsclass` VALUES ('442', '身体护理', '0', '', '12', '5', '255', '0', '', '', '', '1');
INSERT INTO `ds_goodsclass` VALUES ('443', '婚纱礼服', '1', '联动', '67', '5', '255', '0', '', '', '', '1');
INSERT INTO `ds_goodsclass` VALUES ('444', '运动套装', '1', '联动', '67', '5', '255', '0', '', '', '', '1');
INSERT INTO `ds_goodsclass` VALUES ('445', '彩妆香氛', '0', '', '12', '5', '255', '0', '', '', '', '1');
INSERT INTO `ds_goodsclass` VALUES ('446', '女性护理', '0', '', '12', '5', '255', '0', '', '', '', '1');
INSERT INTO `ds_goodsclass` VALUES ('447', '唐装', '1', '联动', '67', '5', '255', '0', '', '', '', '1');
INSERT INTO `ds_goodsclass` VALUES ('448', '生活用纸', '0', '', '12', '5', '255', '0', '', '', '', '1');
INSERT INTO `ds_goodsclass` VALUES ('449', '塑身衣', '1', '联动', '67', '5', '255', '0', '', '', '', '1');
INSERT INTO `ds_goodsclass` VALUES ('450', '情趣内衣', '0', '', '67', '5', '255', '0', '', '', '', '1');
INSERT INTO `ds_goodsclass` VALUES ('454', '卷纸', '0', '', '448', '5', '255', '0', '', '', '', '1');
INSERT INTO `ds_goodsclass` VALUES ('455', '文胸睡衣', '0', '', '15', '5', '255', '0', '', '', '', '1');
INSERT INTO `ds_goodsclass` VALUES ('456', '湿纸巾', '0', '', '448', '5', '255', '0', '', '', '', '1');
INSERT INTO `ds_goodsclass` VALUES ('459', '蕾丝文胸', '1', '联动', '455', '5', '255', '0', '', '', '', '1');
INSERT INTO `ds_goodsclass` VALUES ('460', '功能箱包', '0', '', '16', '5', '255', '0', '', '', '', '1');
INSERT INTO `ds_goodsclass` VALUES ('461', '运动文胸', '1', '联动', '455', '5', '255', '0', '', '', '', '1');
INSERT INTO `ds_goodsclass` VALUES ('462', '礼品乐器', '0', '', '16', '5', '255', '0', '', '', '', '1');
INSERT INTO `ds_goodsclass` VALUES ('463', '纯棉睡衣', '1', '联动', '455', '5', '255', '0', '', '', '', '1');
INSERT INTO `ds_goodsclass` VALUES ('464', '睡袍/浴袍', '1', '联动', '455', '5', '255', '0', '', '', '', '1');
INSERT INTO `ds_goodsclass` VALUES ('465', '情侣睡衣', '1', '联动', '455', '5', '255', '0', '', '', '', '1');
INSERT INTO `ds_goodsclass` VALUES ('466', '抹胸', '1', '联动', '455', '5', '255', '0', '', '', '', '1');
INSERT INTO `ds_goodsclass` VALUES ('467', '无痕文胸', '1', '联动', '455', '5', '255', '0', '', '', '', '1');
INSERT INTO `ds_goodsclass` VALUES ('468', '母婴/玩具/车床/童装', '0', '', '0', '5', '255', '0', '', '', '', '1');
INSERT INTO `ds_goodsclass` VALUES ('469', '聚拢文胸', '1', '联动', '455', '5', '255', '0', '', '', '', '1');
INSERT INTO `ds_goodsclass` VALUES ('470', '拉杆箱', '1', '联动', '460', '5', '255', '0', '', '', '', '1');
INSERT INTO `ds_goodsclass` VALUES ('471', '华为', '0', '', '424', '5', '255', '0', '', '', '', '1');
INSERT INTO `ds_goodsclass` VALUES ('472', '小米', '0', '', '424', '5', '255', '0', '', '', '', '1');
INSERT INTO `ds_goodsclass` VALUES ('473', 'ipad', '0', '', '424', '5', '255', '0', '', '', '', '1');
INSERT INTO `ds_goodsclass` VALUES ('474', '神舟', '0', '', '424', '5', '255', '0', '', '', '', '1');
INSERT INTO `ds_goodsclass` VALUES ('475', '三星', '0', '', '424', '5', '255', '0', '', '', '', '1');
INSERT INTO `ds_goodsclass` VALUES ('476', '电脑数码包', '1', '联动', '460', '5', '255', '0', '', '', '', '1');
INSERT INTO `ds_goodsclass` VALUES ('477', '商用笔记本', '0', '', '425', '5', '255', '0', '', '', '', '1');
INSERT INTO `ds_goodsclass` VALUES ('478', '商用台式机', '0', '', '425', '5', '255', '0', '', '', '', '1');
INSERT INTO `ds_goodsclass` VALUES ('479', '商用一体机', '0', '', '425', '5', '255', '0', '', '', '', '1');
INSERT INTO `ds_goodsclass` VALUES ('480', '旅行包', '1', '联动', '460', '5', '255', '0', '', '', '', '1');
INSERT INTO `ds_goodsclass` VALUES ('481', '商用显示器', '0', '', '425', '5', '255', '0', '', '', '', '1');
INSERT INTO `ds_goodsclass` VALUES ('482', '运动休闲', '1', '联动', '460', '5', '255', '0', '', '', '', '1');
INSERT INTO `ds_goodsclass` VALUES ('483', '路由器', '0', '', '426', '5', '255', '0', '', '', '', '1');
INSERT INTO `ds_goodsclass` VALUES ('484', '无线网卡', '0', '', '426', '5', '255', '0', '', '', '', '1');
INSERT INTO `ds_goodsclass` VALUES ('485', '登山包', '1', '联动', '460', '5', '255', '0', '', '', '', '1');
INSERT INTO `ds_goodsclass` VALUES ('486', '交换机', '0', '', '426', '5', '255', '0', '', '', '', '1');
INSERT INTO `ds_goodsclass` VALUES ('487', '随身wifi', '0', '', '426', '5', '255', '0', '', '', '', '1');
INSERT INTO `ds_goodsclass` VALUES ('488', '腰包/胸包', '1', '联动', '460', '5', '255', '0', '', '', '', '1');
INSERT INTO `ds_goodsclass` VALUES ('489', '书包', '1', '联动', '460', '5', '255', '0', '', '', '', '1');
INSERT INTO `ds_goodsclass` VALUES ('490', '箱包配件', '0', '', '460', '5', '255', '0', '', '', '', '1');
INSERT INTO `ds_goodsclass` VALUES ('491', '投影仪', '0', '', '428', '5', '255', '0', '', '', '', '1');
INSERT INTO `ds_goodsclass` VALUES ('492', '一体机', '0', '', '428', '5', '255', '0', '', '', '', '1');
INSERT INTO `ds_goodsclass` VALUES ('493', '打火机', '1', '联动', '462', '5', '255', '0', '', '', '', '1');
INSERT INTO `ds_goodsclass` VALUES ('494', '打印机', '0', '', '428', '5', '255', '0', '', '', '', '1');
INSERT INTO `ds_goodsclass` VALUES ('495', '瑞士军刀', '1', '联动', '462', '5', '255', '0', '', '', '', '1');
INSERT INTO `ds_goodsclass` VALUES ('496', '保险柜', '0', '', '428', '5', '255', '0', '', '', '', '1');
INSERT INTO `ds_goodsclass` VALUES ('497', '电子烟', '1', '联动', '462', '5', '255', '0', '', '', '', '1');
INSERT INTO `ds_goodsclass` VALUES ('498', '对讲机', '0', '', '428', '5', '255', '0', '', '', '', '1');
INSERT INTO `ds_goodsclass` VALUES ('499', '电话机', '0', '', '428', '5', '255', '0', '', '', '', '1');
INSERT INTO `ds_goodsclass` VALUES ('500', '标签机', '0', '', '428', '5', '255', '0', '', '', '', '1');
INSERT INTO `ds_goodsclass` VALUES ('501', '乐器', '1', '联动', '462', '5', '255', '0', '', '', '', '1');
INSERT INTO `ds_goodsclass` VALUES ('502', '笔芯', '0', '', '428', '5', '255', '0', '', '', '', '1');
INSERT INTO `ds_goodsclass` VALUES ('503', '电钢琴', '1', '联动', '462', '5', '255', '0', '', '', '', '1');
INSERT INTO `ds_goodsclass` VALUES ('504', '电子琴', '0', '', '462', '5', '255', '0', '', '', '', '1');
INSERT INTO `ds_goodsclass` VALUES ('505', '吉他', '1', '联动', '462', '5', '255', '0', '', '', '', '1');
INSERT INTO `ds_goodsclass` VALUES ('506', '尤克里里', '1', '联动', '462', '5', '255', '0', '', '', '', '1');
INSERT INTO `ds_goodsclass` VALUES ('507', '护肤套装', '1', '联动', '30', '5', '255', '0', '', '', '', '1');
INSERT INTO `ds_goodsclass` VALUES ('508', '颈部护理', '1', '联动', '30', '5', '255', '0', '', '', '', '1');
INSERT INTO `ds_goodsclass` VALUES ('509', '面膜', '1', '联动', '30', '5', '255', '0', '', '', '', '1');
INSERT INTO `ds_goodsclass` VALUES ('510', '爽肤水', '1', '联动', '30', '5', '255', '0', '', '', '', '1');
INSERT INTO `ds_goodsclass` VALUES ('511', '乳液', '1', '联动', '30', '5', '255', '0', '', '', '', '1');
INSERT INTO `ds_goodsclass` VALUES ('512', '面霜', '1', '联动', '30', '5', '255', '0', '', '', '', '1');
INSERT INTO `ds_goodsclass` VALUES ('513', '精华', '1', '联动', '30', '5', '255', '0', '', '', '', '1');
INSERT INTO `ds_goodsclass` VALUES ('514', '防晒隔离', '0', '', '30', '5', '255', '0', '', '', '', '1');
INSERT INTO `ds_goodsclass` VALUES ('515', '进口护肤', '1', '联动', '30', '5', '255', '0', '', '', '', '1');
INSERT INTO `ds_goodsclass` VALUES ('516', '洗衣液', '1', '联动', '31', '5', '255', '0', '', '', '', '1');
INSERT INTO `ds_goodsclass` VALUES ('517', '洗衣粉/皂', '1', '联动', '31', '5', '255', '0', '', '', '', '1');
INSERT INTO `ds_goodsclass` VALUES ('518', '家庭清洁', '1', '联动', '31', '5', '255', '0', '', '', '', '1');
INSERT INTO `ds_goodsclass` VALUES ('519', '洗洁精', '1', '联动', '31', '5', '255', '0', '', '', '', '1');
INSERT INTO `ds_goodsclass` VALUES ('520', '洁厕剂', '1', '联动', '31', '5', '255', '0', '', '', '', '1');
INSERT INTO `ds_goodsclass` VALUES ('521', '消毒液', '1', '联动', '31', '5', '255', '0', '', '', '', '1');
INSERT INTO `ds_goodsclass` VALUES ('522', '衣物洗护', '1', '联动', '31', '5', '255', '0', '', '', '', '1');
INSERT INTO `ds_goodsclass` VALUES ('523', '宠物零食', '1', '联动', '32', '5', '255', '0', '', '', '', '1');
INSERT INTO `ds_goodsclass` VALUES ('524', '出行装备', '1', '联动', '32', '5', '255', '0', '', '', '', '1');
INSERT INTO `ds_goodsclass` VALUES ('525', '宠物保健', '1', '联动', '32', '5', '255', '0', '', '', '', '1');
INSERT INTO `ds_goodsclass` VALUES ('526', '宠物日用', '1', '联动', '32', '5', '255', '0', '', '', '', '1');
INSERT INTO `ds_goodsclass` VALUES ('527', '宠物玩具', '1', '联动', '32', '5', '255', '0', '', '', '', '1');
INSERT INTO `ds_goodsclass` VALUES ('528', '宠物美容洗护', '1', '联动', '32', '5', '255', '0', '', '', '', '1');
INSERT INTO `ds_goodsclass` VALUES ('529', '宠物主食', '1', '联动', '32', '5', '255', '0', '', '', '', '1');
INSERT INTO `ds_goodsclass` VALUES ('530', '牙刷', '1', '联动', '63', '5', '255', '0', '', '', '', '1');
INSERT INTO `ds_goodsclass` VALUES ('531', '口腔套装', '1', '联动', '63', '5', '255', '0', '', '', '', '1');
INSERT INTO `ds_goodsclass` VALUES ('532', '漱口水/口喷', '1', '联动', '63', '5', '255', '0', '', '', '', '1');
INSERT INTO `ds_goodsclass` VALUES ('533', '儿童牙膏', '1', '联动', '63', '5', '255', '0', '', '', '', '1');
INSERT INTO `ds_goodsclass` VALUES ('534', '牙膏', '1', '联动', '63', '5', '255', '0', '', '', '', '1');
INSERT INTO `ds_goodsclass` VALUES ('535', '护发素', '1', '联动', '64', '5', '255', '0', '', '', '', '1');
INSERT INTO `ds_goodsclass` VALUES ('536', '洗护套装', '1', '联动', '64', '5', '255', '0', '', '', '', '1');
INSERT INTO `ds_goodsclass` VALUES ('537', '洗发水', '1', '联动', '64', '5', '255', '0', '', '', '', '1');
INSERT INTO `ds_goodsclass` VALUES ('538', '造型', '1', '联动', '64', '5', '255', '0', '', '', '', '1');
INSERT INTO `ds_goodsclass` VALUES ('539', '无硅油', '1', '联动', '64', '5', '255', '0', '', '', '', '1');
INSERT INTO `ds_goodsclass` VALUES ('540', '去屑', '1', '联动', '64', '5', '255', '0', '', '', '', '1');
INSERT INTO `ds_goodsclass` VALUES ('541', '染发', '1', '联动', '64', '5', '255', '0', '', '', '', '1');
INSERT INTO `ds_goodsclass` VALUES ('542', '洗面奶', '1', '联动', '440', '5', '255', '0', '', '', '', '1');
INSERT INTO `ds_goodsclass` VALUES ('543', '面部清洁', '1', '联动', '440', '5', '255', '0', '', '', '', '1');
INSERT INTO `ds_goodsclass` VALUES ('544', '进口水乳套装', '1', '联动', '440', '5', '255', '0', '', '', '', '1');
INSERT INTO `ds_goodsclass` VALUES ('545', '海外尖货', '1', '联动', '440', '5', '255', '0', '', '', '', '1');
INSERT INTO `ds_goodsclass` VALUES ('546', '精华', '1', '联动', '440', '5', '255', '0', '', '', '', '1');
INSERT INTO `ds_goodsclass` VALUES ('547', '爽肤水', '1', '联动', '440', '5', '255', '0', '', '', '', '1');
INSERT INTO `ds_goodsclass` VALUES ('548', '眼霜', '1', '联动', '440', '5', '255', '0', '', '', '', '1');
INSERT INTO `ds_goodsclass` VALUES ('549', '沐浴露', '1', '联动', '442', '5', '255', '0', '', '', '', '1');
INSERT INTO `ds_goodsclass` VALUES ('550', '润体乳', '1', '联动', '442', '5', '255', '0', '', '', '', '1');
INSERT INTO `ds_goodsclass` VALUES ('551', '护手霜', '1', '联动', '442', '5', '255', '0', '', '', '', '1');
INSERT INTO `ds_goodsclass` VALUES ('552', '足部护理', '0', '', '442', '5', '255', '0', '', '', '', '1');
INSERT INTO `ds_goodsclass` VALUES ('553', '瘦身纤体', '1', '联动', '442', '5', '255', '0', '', '', '', '1');
INSERT INTO `ds_goodsclass` VALUES ('554', '洗手液', '1', '联动', '442', '5', '255', '0', '', '', '', '1');
INSERT INTO `ds_goodsclass` VALUES ('555', '防蚊露/花露水', '1', '联动', '442', '5', '255', '0', '', '', '', '1');
INSERT INTO `ds_goodsclass` VALUES ('556', '脱毛膏', '1', '联动', '442', '5', '255', '0', '', '', '', '1');
INSERT INTO `ds_goodsclass` VALUES ('557', '眉笔', '1', '联动', '445', '5', '255', '0', '', '', '', '1');
INSERT INTO `ds_goodsclass` VALUES ('558', '眼部', '1', '联动', '445', '5', '255', '0', '', '', '', '1');
INSERT INTO `ds_goodsclass` VALUES ('559', '口红', '1', '联动', '445', '5', '255', '0', '', '', '', '1');
INSERT INTO `ds_goodsclass` VALUES ('560', '卸妆', '1', '联动', '445', '5', '255', '0', '', '', '', '1');
INSERT INTO `ds_goodsclass` VALUES ('561', '美妆工具', '1', '联动', '445', '5', '255', '0', '', '', '', '1');
INSERT INTO `ds_goodsclass` VALUES ('562', '香水', '1', '联动', '445', '5', '255', '0', '', '', '', '1');
INSERT INTO `ds_goodsclass` VALUES ('563', '精油', '1', '联动', '445', '5', '255', '0', '', '', '', '1');
INSERT INTO `ds_goodsclass` VALUES ('564', '气垫BB', '1', '联动', '445', '5', '255', '0', '', '', '', '1');
INSERT INTO `ds_goodsclass` VALUES ('565', '面部底妆', '1', '联动', '445', '5', '255', '0', '', '', '', '1');
INSERT INTO `ds_goodsclass` VALUES ('566', '走珠', '0', '', '445', '5', '255', '0', '', '', '', '1');
INSERT INTO `ds_goodsclass` VALUES ('567', '日用', '1', '联动', '446', '5', '255', '0', '', '', '', '1');
INSERT INTO `ds_goodsclass` VALUES ('568', '夜用', '1', '联动', '446', '5', '255', '0', '', '', '', '1');
INSERT INTO `ds_goodsclass` VALUES ('569', '组合套装', '1', '联动', '446', '5', '255', '0', '', '', '', '1');
INSERT INTO `ds_goodsclass` VALUES ('570', '私处洗液', '1', '联动', '446', '5', '255', '0', '', '', '', '1');
INSERT INTO `ds_goodsclass` VALUES ('571', '护垫', '1', '联动', '446', '5', '255', '0', '', '', '', '1');
INSERT INTO `ds_goodsclass` VALUES ('572', '卫生巾', '1', '联动', '446', '5', '255', '0', '', '', '', '1');
INSERT INTO `ds_goodsclass` VALUES ('573', '手帕纸', '1', '联动', '448', '5', '255', '0', '', '', '', '1');
INSERT INTO `ds_goodsclass` VALUES ('574', '厨房用纸', '1', '联动', '448', '5', '255', '0', '', '', '', '1');
INSERT INTO `ds_goodsclass` VALUES ('575', '平板纸', '1', '联动', '448', '5', '255', '0', '', '', '', '1');
INSERT INTO `ds_goodsclass` VALUES ('576', '抽纸', '1', '联动', '448', '5', '255', '0', '', '', '', '1');
INSERT INTO `ds_goodsclass` VALUES ('577', '开关', '1', '联动', '420', '5', '255', '0', '', '', '', '1');
INSERT INTO `ds_goodsclass` VALUES ('578', '果蔬汁', '1', '联动', '60', '5', '255', '0', '', '', '', '1');
INSERT INTO `ds_goodsclass` VALUES ('579', '功能饮料', '1', '联动', '60', '5', '255', '0', '', '', '', '1');
INSERT INTO `ds_goodsclass` VALUES ('580', '含乳饮料', '1', '联动', '60', '5', '255', '0', '', '', '', '1');
INSERT INTO `ds_goodsclass` VALUES ('581', '酸奶', '1', '联动', '60', '5', '255', '0', '', '', '', '1');
INSERT INTO `ds_goodsclass` VALUES ('582', '风味奶', '1', '联动', '60', '5', '255', '0', '', '', '', '1');
INSERT INTO `ds_goodsclass` VALUES ('583', '蜂蜜', '1', '联动', '60', '5', '255', '0', '', '', '', '1');
INSERT INTO `ds_goodsclass` VALUES ('584', '奶茶', '1', '联动', '60', '5', '255', '0', '', '', '', '1');
INSERT INTO `ds_goodsclass` VALUES ('585', '枕芯', '1', '联动', '25', '5', '255', '0', '', '', '', '1');
INSERT INTO `ds_goodsclass` VALUES ('586', '毛巾/浴巾', '1', '联动', '25', '5', '255', '0', '', '', '', '1');
INSERT INTO `ds_goodsclass` VALUES ('587', '坐垫/抱枕', '1', '联动', '25', '5', '255', '0', '', '', '', '1');
INSERT INTO `ds_goodsclass` VALUES ('588', '毛巾被/毯', '1', '联动', '25', '5', '255', '0', '', '', '', '1');
INSERT INTO `ds_goodsclass` VALUES ('589', '冬被', '1', '联动', '25', '5', '255', '0', '', '', '', '1');
INSERT INTO `ds_goodsclass` VALUES ('590', '窗帘/窗纱', '1', '联动', '25', '5', '255', '0', '', '', '', '1');
INSERT INTO `ds_goodsclass` VALUES ('591', '餐桌布艺', '1', '联动', '25', '5', '255', '0', '', '', '', '1');
INSERT INTO `ds_goodsclass` VALUES ('592', '客厅成套家具', '1', '联动', '26', '5', '255', '0', '', '', '', '1');
INSERT INTO `ds_goodsclass` VALUES ('593', '餐厅成套家具', '1', '联动', '26', '5', '255', '0', '', '', '', '1');
INSERT INTO `ds_goodsclass` VALUES ('594', '卧室成套家具', '1', '联动', '26', '5', '255', '0', '', '', '', '1');
INSERT INTO `ds_goodsclass` VALUES ('595', '儿童成套家具', '1', '联动', '26', '5', '255', '0', '', '', '', '1');
INSERT INTO `ds_goodsclass` VALUES ('596', '书房家具', '1', '联动', '26', '5', '255', '0', '', '', '', '1');
INSERT INTO `ds_goodsclass` VALUES ('597', '阳台/户外', '1', '联动', '26', '5', '255', '0', '', '', '', '1');
INSERT INTO `ds_goodsclass` VALUES ('598', '家居器皿', '1', '联动', '27', '5', '255', '0', '', '', '', '1');
INSERT INTO `ds_goodsclass` VALUES ('599', '水杯', '0', '', '27', '5', '255', '0', '', '', '', '1');
INSERT INTO `ds_goodsclass` VALUES ('600', '保温器具', '1', '联动', '27', '5', '255', '0', '', '', '', '1');
INSERT INTO `ds_goodsclass` VALUES ('601', '一次性用品', '1', '联动', '27', '5', '255', '0', '', '', '', '1');
INSERT INTO `ds_goodsclass` VALUES ('602', '净化除味', '1', '联动', '27', '5', '255', '0', '', '', '', '1');
INSERT INTO `ds_goodsclass` VALUES ('603', '客厅灯', '1', '联动', '58', '5', '255', '0', '', '', '', '1');
INSERT INTO `ds_goodsclass` VALUES ('604', '卧室灯', '1', '联动', '58', '5', '255', '0', '', '', '', '1');
INSERT INTO `ds_goodsclass` VALUES ('605', '灯具套餐', '1', '联动', '58', '5', '255', '0', '', '', '', '1');
INSERT INTO `ds_goodsclass` VALUES ('606', '集成吊顶', '1', '联动', '58', '5', '255', '0', '', '', '', '1');
INSERT INTO `ds_goodsclass` VALUES ('607', '筒灯', '1', '联动', '58', '5', '255', '0', '', '', '', '1');
INSERT INTO `ds_goodsclass` VALUES ('608', '射灯', '1', '联动', '58', '5', '255', '0', '', '', '', '1');
INSERT INTO `ds_goodsclass` VALUES ('609', '花洒', '1', '联动', '59', '5', '255', '0', '', '', '', '1');
INSERT INTO `ds_goodsclass` VALUES ('610', '水槽', '1', '联动', '59', '5', '255', '0', '', '', '', '1');
INSERT INTO `ds_goodsclass` VALUES ('611', '马桶', '1', '联动', '59', '5', '255', '0', '', '', '', '1');
INSERT INTO `ds_goodsclass` VALUES ('612', '坐便器盖板', '1', '联动', '59', '5', '255', '0', '', '', '', '1');
INSERT INTO `ds_goodsclass` VALUES ('613', '浴室柜', '1', '联动', '59', '5', '255', '0', '', '', '', '1');
INSERT INTO `ds_goodsclass` VALUES ('614', '卫浴挂件', '1', '联动', '59', '5', '255', '0', '', '', '', '1');
INSERT INTO `ds_goodsclass` VALUES ('615', '插座', '1', '联动', '420', '5', '255', '0', '', '', '', '1');
INSERT INTO `ds_goodsclass` VALUES ('616', '锁具', '1', '联动', '420', '5', '255', '0', '', '', '', '1');
INSERT INTO `ds_goodsclass` VALUES ('617', '监控器材', '1', '联动', '420', '5', '255', '0', '', '', '', '1');
INSERT INTO `ds_goodsclass` VALUES ('618', '电钻', '1', '联动', '420', '5', '255', '0', '', '', '', '1');
INSERT INTO `ds_goodsclass` VALUES ('619', '电线', '1', '联动', '420', '5', '255', '0', '', '', '', '1');
INSERT INTO `ds_goodsclass` VALUES ('620', '家具五金', '1', '联动', '420', '5', '255', '0', '', '', '', '1');
INSERT INTO `ds_goodsclass` VALUES ('621', '手动工具', '1', '联动', '420', '5', '255', '0', '', '', '', '1');
INSERT INTO `ds_goodsclass` VALUES ('622', '工具箱', '1', '联动', '420', '5', '255', '0', '', '', '', '1');
INSERT INTO `ds_goodsclass` VALUES ('623', '电动工具', '1', '联动', '420', '5', '255', '0', '', '', '', '1');
INSERT INTO `ds_goodsclass` VALUES ('624', '接线板', '1', '联动', '420', '5', '255', '0', '', '', '', '1');
INSERT INTO `ds_goodsclass` VALUES ('625', '整体衣柜', '1', '联动', '422', '5', '255', '0', '', '', '', '1');
INSERT INTO `ds_goodsclass` VALUES ('626', '定制电视柜', '1', '联动', '422', '5', '255', '0', '', '', '', '1');
INSERT INTO `ds_goodsclass` VALUES ('627', '定制柜类', '1', '联动', '422', '5', '255', '0', '', '', '', '1');
INSERT INTO `ds_goodsclass` VALUES ('628', '整装定制', '1', '联动', '422', '5', '255', '0', '', '', '', '1');
INSERT INTO `ds_goodsclass` VALUES ('629', '装修服务', '1', '联动', '422', '5', '255', '0', '', '', '', '1');
INSERT INTO `ds_goodsclass` VALUES ('630', '木门', '1', '联动', '422', '5', '255', '0', '', '', '', '1');
INSERT INTO `ds_goodsclass` VALUES ('631', '特权定金', '1', '联动', '422', '5', '255', '0', '', '', '', '1');
INSERT INTO `ds_goodsclass` VALUES ('632', '制氧机', '1', '联动', '434', '5', '255', '0', '', '', '', '1');
INSERT INTO `ds_goodsclass` VALUES ('633', '血糖仪', '1', '联动', '434', '5', '255', '0', '', '', '', '1');
INSERT INTO `ds_goodsclass` VALUES ('634', '体温计', '1', '联动', '434', '5', '255', '0', '', '', '', '1');
INSERT INTO `ds_goodsclass` VALUES ('635', '隐形眼镜', '1', '联动', '434', '5', '255', '0', '', '', '', '1');
INSERT INTO `ds_goodsclass` VALUES ('636', '雾化器', '1', '联动', '434', '5', '255', '0', '', '', '', '1');
INSERT INTO `ds_goodsclass` VALUES ('637', '呼吸机', '1', '联动', '434', '5', '255', '0', '', '', '', '1');
INSERT INTO `ds_goodsclass` VALUES ('638', '血压计', '1', '联动', '434', '5', '255', '0', '', '', '', '1');
INSERT INTO `ds_goodsclass` VALUES ('639', '助听器', '1', '联动', '434', '5', '255', '0', '', '', '', '1');
INSERT INTO `ds_goodsclass` VALUES ('640', '热水器', '1', '联动', '410', '5', '255', '0', '', '', '', '1');
INSERT INTO `ds_goodsclass` VALUES ('641', '燃气热水器', '1', '联动', '410', '5', '255', '0', '', '', '', '1');
INSERT INTO `ds_goodsclass` VALUES ('642', '厨宝', '1', '联动', '410', '5', '255', '0', '', '', '', '1');
INSERT INTO `ds_goodsclass` VALUES ('643', '浴霸', '1', '联动', '410', '5', '255', '0', '', '', '', '1');
INSERT INTO `ds_goodsclass` VALUES ('644', '智能马桶盖', '0', '', '410', '5', '255', '0', '', '', '', '1');
INSERT INTO `ds_goodsclass` VALUES ('645', '空气能', '1', '联动', '410', '5', '255', '0', '', '', '', '1');
INSERT INTO `ds_goodsclass` VALUES ('646', '卫浴家电配件', '1', '联动', '410', '5', '255', '0', '', '', '', '1');
INSERT INTO `ds_goodsclass` VALUES ('647', '电饭煲', '1', '联动', '412', '5', '255', '0', '', '', '', '1');
INSERT INTO `ds_goodsclass` VALUES ('648', '电压力锅', '1', '联动', '412', '5', '255', '0', '', '', '', '1');
INSERT INTO `ds_goodsclass` VALUES ('649', '豆浆机', '1', '联动', '412', '5', '255', '0', '', '', '', '1');
INSERT INTO `ds_goodsclass` VALUES ('650', '电磁炉', '1', '联动', '412', '5', '255', '0', '', '', '', '1');
INSERT INTO `ds_goodsclass` VALUES ('651', '电水壶/电水瓶', '1', '联动', '412', '5', '255', '0', '', '', '', '1');
INSERT INTO `ds_goodsclass` VALUES ('652', '榨汁机', '1', '联动', '412', '5', '255', '0', '', '', '', '1');
INSERT INTO `ds_goodsclass` VALUES ('653', '电饼铛', '1', '联动', '412', '5', '255', '0', '', '', '', '1');
INSERT INTO `ds_goodsclass` VALUES ('654', '原汁机', '1', '联动', '412', '5', '255', '0', '', '', '', '1');
INSERT INTO `ds_goodsclass` VALUES ('655', '电炖锅', '1', '联动', '412', '5', '255', '0', '', '', '', '1');
INSERT INTO `ds_goodsclass` VALUES ('656', '微波炉', '1', '联动', '413', '5', '255', '0', '', '', '', '1');
INSERT INTO `ds_goodsclass` VALUES ('657', '电烤箱', '1', '联动', '413', '5', '255', '0', '', '', '', '1');
INSERT INTO `ds_goodsclass` VALUES ('658', '面包机', '1', '联动', '413', '5', '255', '0', '', '', '', '1');
INSERT INTO `ds_goodsclass` VALUES ('659', '酸奶机', '1', '联动', '413', '5', '255', '0', '', '', '', '1');
INSERT INTO `ds_goodsclass` VALUES ('660', '咖啡机', '1', '联动', '413', '5', '255', '0', '', '', '', '1');
INSERT INTO `ds_goodsclass` VALUES ('661', '空气炸锅', '1', '联动', '413', '5', '255', '0', '', '', '', '1');
INSERT INTO `ds_goodsclass` VALUES ('662', '食品加工机/搅拌机', '1', '联动', '413', '5', '255', '0', '', '', '', '1');
INSERT INTO `ds_goodsclass` VALUES ('663', '打蛋器', '1', '联动', '413', '5', '255', '0', '', '', '', '1');
INSERT INTO `ds_goodsclass` VALUES ('664', '剃须刀', '1', '联动', '416', '5', '255', '0', '', '', '', '1');
INSERT INTO `ds_goodsclass` VALUES ('665', '电饭煲', '1', '联动', '416', '5', '255', '0', '', '', '', '1');
INSERT INTO `ds_goodsclass` VALUES ('666', '电动牙刷', '1', '联动', '416', '5', '255', '0', '', '', '', '1');
INSERT INTO `ds_goodsclass` VALUES ('667', '美容仪', '1', '联动', '416', '5', '255', '0', '', '', '', '1');
INSERT INTO `ds_goodsclass` VALUES ('668', '进口咖啡机', '1', '联动', '416', '5', '255', '0', '', '', '', '1');
INSERT INTO `ds_goodsclass` VALUES ('669', '戴森', '1', '联动', '22', '5', '255', '0', '', '', '', '1');
INSERT INTO `ds_goodsclass` VALUES ('670', '奶粉', '1', '联动', '468', '5', '255', '0', '', '', '', '1');
INSERT INTO `ds_goodsclass` VALUES ('671', '尿裤湿巾', '1', '联动', '468', '5', '255', '0', '', '', '', '1');
INSERT INTO `ds_goodsclass` VALUES ('672', '营养辅食', '1', '联动', '468', '5', '255', '0', '', '', '', '1');
INSERT INTO `ds_goodsclass` VALUES ('673', '喂养用品', '1', '联动', '468', '5', '255', '0', '', '', '', '1');
INSERT INTO `ds_goodsclass` VALUES ('674', '孕婴洗护', '1', '联动', '468', '5', '255', '0', '', '', '', '1');
INSERT INTO `ds_goodsclass` VALUES ('675', '服饰寝居', '1', '联动', '468', '5', '255', '0', '', '', '', '1');
INSERT INTO `ds_goodsclass` VALUES ('676', '童车童床', '1', '联动', '468', '5', '255', '0', '', '', '', '1');
INSERT INTO `ds_goodsclass` VALUES ('677', '1段', '1', '联动', '670', '5', '255', '0', '', '', '', '1');
INSERT INTO `ds_goodsclass` VALUES ('678', '2段', '1', '联动', '670', '5', '255', '0', '', '', '', '1');
INSERT INTO `ds_goodsclass` VALUES ('679', '3段', '1', '联动', '670', '5', '255', '0', '', '', '', '1');
INSERT INTO `ds_goodsclass` VALUES ('680', '4段', '1', '联动', '670', '5', '255', '0', '', '', '', '1');
INSERT INTO `ds_goodsclass` VALUES ('681', '孕妈奶粉', '1', '联动', '670', '5', '255', '0', '', '', '', '1');
INSERT INTO `ds_goodsclass` VALUES ('682', '特配奶粉', '1', '联动', '670', '5', '255', '0', '', '', '', '1');
INSERT INTO `ds_goodsclass` VALUES ('683', '有机奶粉', '1', '联动', '670', '5', '255', '0', '', '', '', '1');
INSERT INTO `ds_goodsclass` VALUES ('684', '羊奶粉', '1', '联动', '670', '5', '255', '0', '', '', '', '1');
INSERT INTO `ds_goodsclass` VALUES ('685', '新生儿', '1', '联动', '671', '5', '255', '0', '', '', '', '1');
INSERT INTO `ds_goodsclass` VALUES ('686', 'S号尿裤', '1', '联动', '671', '5', '255', '0', '', '', '', '1');
INSERT INTO `ds_goodsclass` VALUES ('687', 'M号尿裤', '1', '联动', '671', '5', '255', '0', '', '', '', '1');
INSERT INTO `ds_goodsclass` VALUES ('688', 'L号尿裤', '1', '联动', '671', '5', '255', '0', '', '', '', '1');
INSERT INTO `ds_goodsclass` VALUES ('689', 'XL/XXL号', '1', '联动', '671', '5', '255', '0', '', '', '', '1');
INSERT INTO `ds_goodsclass` VALUES ('690', '拉拉裤', '1', '联动', '671', '5', '255', '0', '', '', '', '1');
INSERT INTO `ds_goodsclass` VALUES ('691', '宝宝湿巾', '1', '联动', '671', '5', '255', '0', '', '', '', '1');
INSERT INTO `ds_goodsclass` VALUES ('692', '成人尿裤', '1', '联动', '671', '5', '255', '0', '', '', '', '1');
INSERT INTO `ds_goodsclass` VALUES ('693', '米粉', '1', '联动', '672', '5', '255', '0', '', '', '', '1');
INSERT INTO `ds_goodsclass` VALUES ('694', '辅食', '1', '联动', '672', '5', '255', '0', '', '', '', '1');
INSERT INTO `ds_goodsclass` VALUES ('695', '果汁果泥', '1', '联动', '672', '5', '255', '0', '', '', '', '1');
INSERT INTO `ds_goodsclass` VALUES ('696', '钙铁锌', '1', '联动', '672', '5', '255', '0', '', '', '', '1');
INSERT INTO `ds_goodsclass` VALUES ('697', '清火开胃', '1', '联动', '672', '5', '255', '0', '', '', '', '1');
INSERT INTO `ds_goodsclass` VALUES ('698', 'DHA', '1', '联动', '672', '5', '255', '0', '', '', '', '1');
INSERT INTO `ds_goodsclass` VALUES ('699', '孕婴营养品', '1', '联动', '672', '5', '255', '0', '', '', '', '1');
INSERT INTO `ds_goodsclass` VALUES ('700', '宝宝面食', '1', '联动', '672', '5', '255', '0', '', '', '', '1');
INSERT INTO `ds_goodsclass` VALUES ('701', '奶瓶', '1', '联动', '673', '5', '255', '0', '', '', '', '1');
INSERT INTO `ds_goodsclass` VALUES ('702', '奶嘴', '1', '联动', '673', '5', '255', '0', '', '', '', '1');
INSERT INTO `ds_goodsclass` VALUES ('703', '吸奶器', '1', '联动', '673', '5', '255', '0', '', '', '', '1');
INSERT INTO `ds_goodsclass` VALUES ('704', '保温消毒', '1', '联动', '673', '5', '255', '0', '', '', '', '1');
INSERT INTO `ds_goodsclass` VALUES ('705', '儿童餐具', '1', '联动', '673', '5', '255', '0', '', '', '', '1');
INSERT INTO `ds_goodsclass` VALUES ('706', '水杯水壶', '1', '联动', '673', '5', '255', '0', '', '', '', '1');
INSERT INTO `ds_goodsclass` VALUES ('707', '围兜/口水巾', '1', '联动', '673', '5', '255', '0', '', '', '', '1');
INSERT INTO `ds_goodsclass` VALUES ('708', '口腔清洁', '1', '联动', '673', '5', '255', '0', '', '', '', '1');
INSERT INTO `ds_goodsclass` VALUES ('709', '辅食机/料理机', '1', '联动', '673', '5', '255', '0', '', '', '', '1');
INSERT INTO `ds_goodsclass` VALUES ('710', '牙胶安抚', '1', '联动', '673', '5', '255', '0', '', '', '', '1');
INSERT INTO `ds_goodsclass` VALUES ('711', '洗衣皂', '1', '联动', '674', '5', '255', '0', '', '', '', '1');
INSERT INTO `ds_goodsclass` VALUES ('712', '洗衣液', '1', '联动', '674', '5', '255', '0', '', '', '', '1');
INSERT INTO `ds_goodsclass` VALUES ('713', '洗发/沐浴', '1', '联动', '674', '5', '255', '0', '', '', '', '1');
INSERT INTO `ds_goodsclass` VALUES ('714', '洗护套装', '1', '联动', '674', '5', '255', '0', '', '', '', '1');
INSERT INTO `ds_goodsclass` VALUES ('715', '孕婴童护肤', '1', '联动', '674', '5', '255', '0', '', '', '', '1');
INSERT INTO `ds_goodsclass` VALUES ('716', '理发器', '1', '联动', '674', '5', '255', '0', '', '', '', '1');
INSERT INTO `ds_goodsclass` VALUES ('717', '理发器', '1', '联动', '674', '5', '255', '0', '', '', '', '1');
INSERT INTO `ds_goodsclass` VALUES ('718', '婴童护臀', '1', '联动', '674', '5', '255', '0', '', '', '', '1');
INSERT INTO `ds_goodsclass` VALUES ('719', '尿布/尿垫', '1', '联动', '674', '5', '255', '0', '', '', '', '1');
INSERT INTO `ds_goodsclass` VALUES ('720', '学步鞋', '1', '联动', '674', '5', '255', '0', '', '', '', '1');
INSERT INTO `ds_goodsclass` VALUES ('721', '儿童套装', '1', '联动', '675', '5', '255', '0', '', '', '', '1');
INSERT INTO `ds_goodsclass` VALUES ('722', '外套/风衣', '1', '联动', '675', '5', '255', '0', '', '', '', '1');
INSERT INTO `ds_goodsclass` VALUES ('723', '裤子', '1', '联动', '675', '5', '255', '0', '', '', '', '1');
INSERT INTO `ds_goodsclass` VALUES ('724', '家居床品', '1', '联动', '675', '5', '255', '0', '', '', '', '1');
INSERT INTO `ds_goodsclass` VALUES ('725', '儿童防护', '1', '联动', '675', '5', '255', '0', '', '', '', '1');
INSERT INTO `ds_goodsclass` VALUES ('726', '睡袋/抱枕', '1', '联动', '675', '5', '255', '0', '', '', '', '1');
INSERT INTO `ds_goodsclass` VALUES ('727', '婴童内衣', '1', '联动', '675', '5', '255', '0', '', '', '', '1');
INSERT INTO `ds_goodsclass` VALUES ('728', '婴儿礼盒', '1', '联动', '675', '5', '255', '0', '', '', '', '1');
INSERT INTO `ds_goodsclass` VALUES ('729', '安全座椅', '1', '联动', '676', '5', '255', '0', '', '', '', '1');
INSERT INTO `ds_goodsclass` VALUES ('730', '婴儿推车', '1', '联动', '676', '5', '255', '0', '', '', '', '1');
INSERT INTO `ds_goodsclass` VALUES ('731', '婴儿床', '1', '联动', '676', '5', '255', '0', '', '', '', '1');
INSERT INTO `ds_goodsclass` VALUES ('732', '自行车', '1', '联动', '676', '5', '255', '0', '', '', '', '1');
INSERT INTO `ds_goodsclass` VALUES ('733', '电动车', '1', '联动', '676', '5', '255', '0', '', '', '', '1');
INSERT INTO `ds_goodsclass` VALUES ('734', '滑板车', '1', '联动', '676', '5', '255', '0', '', '', '', '1');
INSERT INTO `ds_goodsclass` VALUES ('735', '学步车', '1', '联动', '676', '5', '255', '0', '', '', '', '1');
INSERT INTO `ds_goodsclass` VALUES ('736', '三轮车', '1', '联动', '676', '5', '255', '0', '', '', '', '1');
INSERT INTO `ds_goodsclass` VALUES ('737', '儿童家具', '1', '联动', '676', '5', '255', '0', '', '', '', '1');
INSERT INTO `ds_goodsclass` VALUES ('738', '儿童餐椅', '1', '联动', '676', '5', '255', '0', '', '', '', '1');
INSERT INTO `ds_goodsclass` VALUES ('739', '变频空调', '1', '联动', '6', '5', '255', '0', '', '', '', '1');
INSERT INTO `ds_goodsclass` VALUES ('740', '以旧换新', '1', '联动', '6', '5', '255', '0', '', '', '', '1');
INSERT INTO `ds_goodsclass` VALUES ('741', '0元安装合资空调', '1', '联动', '6', '5', '255', '0', '', '', '', '1');
INSERT INTO `ds_goodsclass` VALUES ('742', '对开门冰箱', '1', '联动', '7', '5', '255', '0', '', '', '', '1');
INSERT INTO `ds_goodsclass` VALUES ('743', '多门冰箱', '1', '联动', '7', '5', '255', '0', '', '', '', '1');
INSERT INTO `ds_goodsclass` VALUES ('744', '十字对开', '1', '联动', '7', '5', '255', '0', '', '', '', '1');
INSERT INTO `ds_goodsclass` VALUES ('745', '三门', '1', '联动', '7', '5', '255', '0', '', '', '', '1');
INSERT INTO `ds_goodsclass` VALUES ('746', '双门', '1', '联动', '7', '5', '255', '0', '', '', '', '1');
INSERT INTO `ds_goodsclass` VALUES ('747', '风冷（无霜）', '1', '联动', '7', '5', '255', '0', '', '', '', '1');
INSERT INTO `ds_goodsclass` VALUES ('748', '美的', '1', '联动', '7', '5', '255', '0', '', '', '', '1');
INSERT INTO `ds_goodsclass` VALUES ('749', '洗干一体机', '1', '联动', '51', '5', '255', '0', '', '', '', '1');
INSERT INTO `ds_goodsclass` VALUES ('750', '净水杯', '1', '联动', '54', '5', '255', '0', '', '', '', '1');
INSERT INTO `ds_goodsclass` VALUES ('751', '净水滤芯', '1', '联动', '54', '5', '255', '0', '', '', '', '1');
INSERT INTO `ds_goodsclass` VALUES ('752', '回音壁', '0', '', '54', '5', '255', '0', '', '', '', '1');
INSERT INTO `ds_goodsclass` VALUES ('753', '回音壁', '0', '', '54', '5', '255', '0', '', '', '', '1');
INSERT INTO `ds_goodsclass` VALUES ('754', '迷你音响', '1', '联动', '392', '5', '255', '0', '', '', '', '1');
INSERT INTO `ds_goodsclass` VALUES ('755', '雅马哈', '1', '联动', '392', '5', '255', '0', '', '', '', '1');
INSERT INTO `ds_goodsclass` VALUES ('756', '索尼', '1', '联动', '392', '5', '255', '0', '', '', '', '1');
INSERT INTO `ds_goodsclass` VALUES ('757', 'BOSE', '1', '联动', '392', '5', '255', '0', '', '', '', '1');
INSERT INTO `ds_goodsclass` VALUES ('758', '烟灶套餐', '1', '联动', '20', '5', '255', '0', '', '', '', '1');
INSERT INTO `ds_goodsclass` VALUES ('759', '消毒柜', '1', '联动', '20', '5', '255', '0', '', '', '', '1');
INSERT INTO `ds_goodsclass` VALUES ('760', '除湿机', '1', '联动', '21', '5', '255', '0', '', '', '', '1');
INSERT INTO `ds_goodsclass` VALUES ('761', '刀具', '1', '联动', '22', '5', '255', '0', '', '', '', '1');
INSERT INTO `ds_goodsclass` VALUES ('762', '奶锅', '1', '联动', '22', '5', '255', '0', '', '', '', '1');
INSERT INTO `ds_goodsclass` VALUES ('763', '汤锅', '1', '联动', '22', '5', '255', '0', '', '', '', '1');

-- -----------------------------
-- Table structure for `ds_goodsclassnav`
-- -----------------------------
DROP TABLE IF EXISTS `ds_goodsclassnav`;
CREATE TABLE `ds_goodsclassnav` (
  `gc_id` int(10) unsigned NOT NULL COMMENT '商品分类ID',
  `goodscn_alias` varchar(100) DEFAULT '' COMMENT '商品分类别名',
  `goodscn_classids` varchar(100) DEFAULT '' COMMENT '推荐子级分类',
  `goodscn_brandids` varchar(100) DEFAULT '' COMMENT '推荐的品牌',
  `goodscn_pic` varchar(100) DEFAULT '' COMMENT '分类图片',
  `goodscn_adv1` varchar(100) DEFAULT '' COMMENT '广告图1',
  `goodscn_adv1_link` varchar(100) DEFAULT '' COMMENT '广告1链接',
  `goodscn_adv2` varchar(100) DEFAULT '' COMMENT '广告图2',
  `goodscn_adv2_link` varchar(100) NOT NULL COMMENT '广告2链接',
  PRIMARY KEY (`gc_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='分类导航表';


-- -----------------------------
-- Table structure for `ds_goodsclassstaple`
-- -----------------------------
DROP TABLE IF EXISTS `ds_goodsclassstaple`;
CREATE TABLE `ds_goodsclassstaple` (
  `staple_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '常用分类id',
  `staple_counter` int(10) unsigned NOT NULL DEFAULT '1' COMMENT '计数器',
  `staple_name` varchar(255) NOT NULL COMMENT '常用分类名称',
  `gc_id_1` int(10) unsigned NOT NULL COMMENT '一级分类id',
  `gc_id_2` int(10) unsigned NOT NULL COMMENT '二级商品分类',
  `gc_id_3` int(10) unsigned NOT NULL COMMENT '三级商品分类',
  `type_id` int(10) unsigned NOT NULL COMMENT '类型id',
  `member_id` int(10) unsigned NOT NULL COMMENT '会员id',
  PRIMARY KEY (`staple_id`),
  KEY `store_id` (`member_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='店铺常用分类表';


-- -----------------------------
-- Table structure for `ds_goodsclasstag`
-- -----------------------------
DROP TABLE IF EXISTS `ds_goodsclasstag`;
CREATE TABLE `ds_goodsclasstag` (
  `gctag_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'TAG自增ID',
  `gctag_name` varchar(255) NOT NULL COMMENT '分类TAG名称',
  `gctag_value` text NOT NULL COMMENT '分类TAG值',
  `type_id` int(10) unsigned NOT NULL COMMENT '类型ID',
  `gc_id` int(10) unsigned NOT NULL COMMENT '商品分类ID',
  `gc_id_1` int(10) unsigned NOT NULL COMMENT '一级分类ID',
  `gc_id_2` int(10) unsigned NOT NULL COMMENT '二级分类ID',
  `gc_id_3` int(10) unsigned NOT NULL COMMENT '三级分类ID',
  PRIMARY KEY (`gctag_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='商品分类TAG表';


-- -----------------------------
-- Table structure for `ds_goodscombo`
-- -----------------------------
DROP TABLE IF EXISTS `ds_goodscombo`;
CREATE TABLE `ds_goodscombo` (
  `combo_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '推荐组合自增ID ',
  `goods_id` int(10) unsigned NOT NULL COMMENT '主商品ID',
  `goods_commonid` int(10) unsigned NOT NULL COMMENT '主商品公共ID',
  `combo_goodsid` int(10) unsigned NOT NULL COMMENT '推荐组合商品ID',
  PRIMARY KEY (`combo_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='商品推荐组合表';


-- -----------------------------
-- Table structure for `ds_goodscommon`
-- -----------------------------
DROP TABLE IF EXISTS `ds_goodscommon`;
CREATE TABLE `ds_goodscommon` (
  `goods_commonid` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '商品公共表id',
  `goods_name` varchar(50) NOT NULL COMMENT '商品名称',
  `goods_advword` varchar(150) NOT NULL COMMENT '商品广告词',
  `gc_id` int(10) unsigned NOT NULL COMMENT '商品分类',
  `gc_id_1` int(10) unsigned DEFAULT NULL COMMENT '一级分类id',
  `gc_id_2` int(10) unsigned DEFAULT NULL COMMENT '二级分类id',
  `gc_id_3` int(10) unsigned DEFAULT NULL COMMENT '三级分类id',
  `gc_name` varchar(200) NOT NULL COMMENT '商品分类',
  `store_id` int(10) unsigned NOT NULL COMMENT '店铺id',
  `store_name` varchar(50) NOT NULL COMMENT '店铺名称',
  `spec_name` varchar(255) NOT NULL COMMENT '规格名称',
  `spec_value` text NOT NULL COMMENT '规格值',
  `brand_id` int(10) unsigned DEFAULT '0' COMMENT '品牌id',
  `brand_name` varchar(100) DEFAULT NULL COMMENT '品牌名称',
  `type_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '类型id',
  `goods_image` varchar(100) DEFAULT NULL COMMENT '商品主图',
  `goods_attr` text NOT NULL COMMENT '商品属性',
  `goods_body` text COMMENT '商品内容',
  `mobile_body` text COMMENT '手机端商品描述',
  `goods_state` tinyint(3) unsigned DEFAULT '0' COMMENT '商品状态 0:下架 1:正常 10:违规（禁售）',
  `goods_stateremark` varchar(255) DEFAULT NULL COMMENT '违规原因',
  `goods_verify` tinyint(3) unsigned DEFAULT NULL COMMENT '商品审核 1通过，0未通过，10审核中',
  `goods_verifyremark` varchar(255) DEFAULT NULL COMMENT '审核失败原因',
  `goods_lock` tinyint(3) unsigned DEFAULT '0' COMMENT '商品锁定 0未锁，1已锁',
  `goods_addtime` int(10) unsigned NOT NULL COMMENT '商品添加时间',
  `goods_shelftime` int(10) unsigned NOT NULL COMMENT '上架时间',
  `goods_specname` text COMMENT '规格名称序列化（下标为规格id）',
  `goods_price` decimal(10,2) NOT NULL COMMENT '商品价格',
  `goods_marketprice` decimal(10,2) NOT NULL COMMENT '商品市场价',
  `goods_costprice` decimal(10,2) NOT NULL COMMENT '商品成本价',
  `goods_discount` float unsigned NOT NULL COMMENT '商品折扣',
  `goods_serial` varchar(50) NOT NULL COMMENT '商家编号',
  `goods_storage_alarm` tinyint(3) unsigned NOT NULL COMMENT '商品库存报警值',
  `transport_id` mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '商品售卖区域',
  `transport_title` varchar(60) DEFAULT '' COMMENT '商品售卖区域名称',
  `goods_commend` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '商品推荐 1:是 0:否',
  `goods_freight` decimal(10,2) unsigned NOT NULL DEFAULT '0.00' COMMENT '商品运费 0为免运费',
  `goods_vat` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '商品是否开具增值税发票 1:是 0:否',
  `areaid_1` int(10) DEFAULT NULL COMMENT '一级地区id',
  `areaid_2` int(10) DEFAULT NULL COMMENT '二级地区id',
  `goods_stcids` varchar(255) NOT NULL DEFAULT '' COMMENT '店铺分类id 首尾用,隔开',
  `plateid_top` int(10) unsigned DEFAULT NULL COMMENT '顶部关联板式',
  `plateid_bottom` int(10) unsigned DEFAULT NULL COMMENT '底部关联板式',
  `is_virtual` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '是否为虚拟商品 1:是 0:否',
  `virtual_indate` int(10) unsigned DEFAULT NULL COMMENT '虚拟商品有效期',
  `virtual_limit` tinyint(3) unsigned DEFAULT NULL COMMENT '虚拟商品购买上限',
  `virtual_invalid_refund` tinyint(3) unsigned NOT NULL DEFAULT '1' COMMENT '是否允许过期退款 1:是 0:否',
  `is_goodsfcode` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '是否为F码商品 1:是 0:否',
  `is_appoint` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '是否是预约商品 1:是 0:否',
  `appoint_satedate` int(10) unsigned NOT NULL COMMENT '预约商品出售时间',
  `is_presell` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '是否是预售商品 1:是 0:否',
  `presell_deliverdate` int(10) unsigned NOT NULL COMMENT '预售商品发货时间',
  `is_platform_store` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '是否为平台自营',
  `goods_mgdiscount` text COMMENT '序列化会员等级折扣(商品)',
  `inviter_ratio_1` decimal(3,2) unsigned NOT NULL DEFAULT '0.00' COMMENT '一级分销比例',
  `inviter_ratio_2` decimal(3,2) unsigned NOT NULL DEFAULT '0.00' COMMENT '二级分销比例',
  `inviter_ratio_3` decimal(3,2) unsigned NOT NULL DEFAULT '0.00' COMMENT '三级分销比例',
  `inviter_total_quantity` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '已分销的商品数量',
  `inviter_total_amount` decimal(10,2) unsigned NOT NULL DEFAULT '0.00' COMMENT '已分销的商品金额',
  `inviter_amount` decimal(10,2) unsigned NOT NULL DEFAULT '0.00' COMMENT '商品已结算的分销佣金',
  `inviter_open` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '开启推广',
  PRIMARY KEY (`goods_commonid`)
) ENGINE=InnoDB AUTO_INCREMENT=119 DEFAULT CHARSET=utf8 COMMENT='商品公共内容表';

-- -----------------------------
-- Records of `ds_goodscommon`
-- -----------------------------
INSERT INTO `ds_goodscommon` VALUES ('2', '荣耀V9 play 标配版 3+32G 全网通4G手机 铂光金', '北欧极简设计，EMUI5.1', '2', '1', '2', '0', '手机/ 运营商/ 智能数码 >手机通讯', '1', 'admin', 'N;', 'N;', '0', '', '0', '1_2017092120144795113.jpg', 'N;', '', '', '1', '', '1', '', '0', '1505996432', '0', '', '998.00', '1290.00', '0.00', '77', '1', '0', '0', '', '1', '0.00', '0', '0', '0', '', '0', '0', '1', '1514476799', '1', '0', '0', '0', '0', '0', '0', '1', '', '0.00', '0.00', '0.00', '0', '0.00', '0.00', '0');
INSERT INTO `ds_goodscommon` VALUES ('3', 'Apple/苹果 iPhone 7plus 128GB 玫瑰金色 移动联通电信4G手机', '购机即送精美防尘塞+便捷支架+鱼骨绕线器+店铺延保一年', '2', '1', '2', '0', '手机/ 运营商/ 智能数码 >手机通讯', '1', 'admin', 'N;', 'N;', '0', '', '0', '1_2017092120244885492.jpg', 'N;', '', '', '1', '', '1', '', '0', '1505996810', '0', '', '6999.00', '7100.00', '0.00', '98', '2', '10', '0', '', '1', '0.00', '0', '0', '0', '', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '1', '', '0.00', '0.00', '0.00', '0', '0.00', '0.00', '0');
INSERT INTO `ds_goodscommon` VALUES ('4', 'nubia/努比亚Z17 6G+64G 全网通4G手机 烈焰红 无边框', '烈焰红 无边框', '2', '1', '2', '0', '手机/ 运营商/ 智能数码 >手机通讯', '1', 'admin', 'N;', 'N;', '0', '', '0', '1_2017092120312320763.jpg', 'N;', '', '', '1', '', '1', '', '0', '1505997092', '0', '', '2699.00', '3000.00', '0.00', '89', '3', '10', '0', '', '1', '0.00', '0', '0', '0', '', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '1', '', '0.00', '0.00', '0.00', '0', '0.00', '0.00', '0');
INSERT INTO `ds_goodscommon` VALUES ('5', '智能电动代步车', '长续航蓝牙遥控 轻小便携', '3', '1', '3', '0', '手机/ 运营商/ 智能数码 >智能设备', '1', 'admin', 'N;', 'N;', '0', '', '0', '1_2017092120345719915.jpg', 'N;', '', '', '1', '', '1', '', '0', '1505997303', '0', '', '1990.00', '2000.00', '0.00', '99', '4', '0', '0', '', '1', '0.00', '0', '0', '0', '', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '1', '', '0.00', '0.00', '0.00', '0', '0.00', '0.00', '0');
INSERT INTO `ds_goodscommon` VALUES ('6', '灵动Lite版 NV3012 视频通话智能机器人', '人工智能 视频聊天儿童早教益智娱乐 智能家居', '3', '1', '3', '0', '手机/ 运营商/ 智能数码 >智能设备', '1', 'admin', 'N;', 'N;', '0', '', '0', '1_2017092120365848023.jpg', 'N;', '', '', '1', '', '1', '', '0', '1505997421', '0', '', '149.00', '150.00', '0.00', '99', '5', '10', '0', '', '1', '0.00', '0', '0', '0', '', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '1', '', '0.00', '0.00', '0.00', '0', '0.00', '0.00', '0');
INSERT INTO `ds_goodscommon` VALUES ('7', 'HOST好帅智能云教育机器人二蛋Q6 ', '早教机英语学习机国学儿童陪护 玩具礼物百科全书正版音乐播放机京剧粤剧儿歌国学', '3', '1', '3', '0', '手机/ 运营商/ 智能数码 >智能设备', '1', 'admin', 'N;', 'N;', '0', '', '0', '1_2017092120382376796.jpg', 'N;', '', '', '1', '', '1', '', '0', '1505997509', '0', '', '1699.00', '2000.00', '0.00', '84', '6', '0', '0', '', '1', '0.00', '0', '0', '0', '', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '1', '', '0.00', '0.00', '0.00', '0', '0.00', '0.00', '0');
INSERT INTO `ds_goodscommon` VALUES ('8', '先锋(Pioneer)LED-39B700S 39英寸 高清 网络 智能 液晶电视', '六核高速处理器 智能系统 高清解码 聚力影视资源  ', '5', '4', '5', '0', '电视/ 空调/ 冰箱/ 洗衣机 >电视', '1', 'admin', 'N;', 'N;', '0', '', '0', '1_2017092120445748551.jpg', 'N;', '', '', '1', '', '1', '', '0', '1505997903', '0', '', '1599.00', '1699.00', '0.00', '94', '7', '0', '0', '', '1', '0.00', '0', '0', '0', '', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '1', '', '0.00', '0.00', '0.00', '0', '0.00', '0.00', '0');
INSERT INTO `ds_goodscommon` VALUES ('9', '长虹（CHANGHONG）39M1 39英寸 窄边高清液晶电视（黑色）', '蓝光护眼电视，卧室精选', '5', '4', '5', '0', '电视/ 空调/ 冰箱/ 洗衣机 >电视', '1', 'admin', 'N;', 'N;', '0', '', '0', '1_2017092120480147477.jpg', 'N;', '', '', '1', '', '1', '', '0', '1505998084', '0', '', '1399.00', '1500.00', '0.00', '93', '8', '0', '0', '', '1', '0.00', '0', '0', '0', '', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '1', '', '0.00', '0.00', '0.00', '0', '0.00', '0.00', '0');
INSERT INTO `ds_goodscommon` VALUES ('10', '39英寸64位24核安卓智能平板液晶电视（黑色）', '炫彩A+屏看的更清晰，2K电视4K芯！HDR10让画面栩栩如生', '5', '4', '5', '0', '电视/ 空调/ 冰箱/ 洗衣机 >电视', '1', 'admin', 'N;', 'N;', '0', '', '0', '1_2017092120493430154.jpg', 'N;', '', '', '1', '', '1', '', '0', '1505998176', '0', '', '1200.00', '1399.00', '0.00', '85', '', '0', '0', '', '1', '0.00', '0', '0', '0', '', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '1', '', '0.00', '0.00', '0.00', '0', '0.00', '0.00', '0');
INSERT INTO `ds_goodscommon` VALUES ('11', '1.5匹 变频 智能 二级能效极速侠 空调挂机', '60秒暖房，wifi智控，18分贝静音，焕新家，就是这么简单！', '6', '4', '6', '0', '电视/ 空调/ 冰箱/ 洗衣机 >空调', '1', 'admin', 'N;', 'N;', '0', '', '0', '1_2017092120564717575.jpg', 'N;', '', '', '1', '', '1', '', '0', '1505998723', '0', '', '2699.00', '2780.00', '0.00', '97', '9', '0', '0', '', '1', '0.00', '0', '0', '0', '', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '1', '', '0.00', '0.00', '0.00', '0', '0.00', '0.00', '0');
INSERT INTO `ds_goodscommon` VALUES ('12', '扬子(YAIR) 小2匹 冷暖 自动清洗 定频空调柜机', '日立压缩机，全网比价，柜机中的战斗机', '6', '4', '6', '0', '电视/ 空调/ 冰箱/ 洗衣机 >空调', '1', 'admin', 'N;', 'N;', '0', '', '0', '1_2017092121050988491.jpg', 'N;', '', '', '1', '', '1', '', '0', '1505999121', '0', '', '2999.00', '3200.00', '0.00', '93', '10', '0', '0', '', '1', '0.00', '0', '0', '0', '', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '1', '', '0.00', '0.00', '0.00', '0', '0.00', '0.00', '0');
INSERT INTO `ds_goodscommon` VALUES ('13', '变频风冷无霜 独立双循环 LED显示 对开门冰箱（白色)', '   变频压缩机，双独立循环，满足对空气、温度、湿度要求，创造大容量保鲜奇迹！并联双循环+智能精准控温', '7', '4', '7', '0', '电视/ 空调/ 冰箱/ 洗衣机 >冰箱', '1', 'admin', 'N;', 'N;', '0', '', '0', '1_2017092121142556524.jpg', 'N;', '', '', '1', '', '1', '', '0', '1505999668', '0', '', '5380.00', '5399.00', '0.00', '99', '11', '0', '0', '', '1', '0.00', '0', '0', '0', '', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '1', '', '0.00', '0.00', '0.00', '0', '0.00', '0.00', '0');
INSERT INTO `ds_goodscommon` VALUES ('14', '三门冰箱', ' 家用节能 中门软冷冻 红色玻璃面板 静音低噪', '7', '4', '7', '0', '电视/ 空调/ 冰箱/ 洗衣机 >冰箱', '1', 'admin', 'N;', 'N;', '0', '', '0', '1_2017092121225164684.jpg', 'N;', '', '', '1', '', '1', '', '0', '1506000181', '0', '', '1433.00', '1699.00', '0.00', '84', '12', '0', '0', '', '1', '0.00', '0', '0', '0', '', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '1', '', '0.00', '0.00', '0.00', '0', '0.00', '0.00', '0');
INSERT INTO `ds_goodscommon` VALUES ('15', '方太（FOTILE）云魔方欧式 烟灶套餐', '18立方 天然气', '20', '8', '20', '0', '厨卫电器/ 生活家电/ 厨具 >厨房大电', '1', 'admin', 'N;', 'N;', '0', '', '0', '1_2017092121260662503.jpg', 'N;', '', '', '1', '', '1', '', '0', '1506000371', '0', '', '4299.00', '4380.00', '0.00', '98', '13', '0', '0', '', '1', '0.00', '0', '0', '0', '', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '1', '', '0.00', '0.00', '0.00', '0', '0.00', '0.00', '0');
INSERT INTO `ds_goodscommon` VALUES ('16', '美的(Midea)台嵌两用燃气灶JZT-Q360B防爆钢化玻璃面板', '4.2KW强劲火力；五档精控；时尚方灶，高端厨房品质之选！  ', '20', '8', '20', '0', '厨卫电器/ 生活家电/ 厨具 >厨房大电', '1', 'admin', 'N;', 'N;', '0', '', '1', '1_2017092121492327671.jpg', 'N;', '', '', '1', '', '1', '', '0', '1506001770', '0', '', '1190.00', '1200.00', '0.00', '99', '14', '0', '0', '', '1', '0.00', '0', '0', '0', '', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '1', '', '0.00', '0.00', '0.00', '0', '0.00', '0.00', '0');
INSERT INTO `ds_goodscommon` VALUES ('17', '飞科(FLYCO) 电动剃须刀', '全身水洗，USB充电系统，优雅充电底座，刀架可浮动，1小时快充', '21', '8', '21', '0', '厨卫电器/ 生活家电/ 厨具 >生活家电', '1', 'admin', 'N;', 'N;', '0', '', '1', '1_2017092121542617701.jpg', 'N;', '', '', '1', '', '1', '', '0', '1506002071', '0', '', '145.00', '160.00', '0.00', '90', '15', '0', '0', '', '1', '0.00', '0', '0', '0', '', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '1', '', '0.00', '0.00', '0.00', '0', '0.00', '0.00', '0');
INSERT INTO `ds_goodscommon` VALUES ('18', '美的（Midea）电饭煲', '不锈钢外壳 智能一键通 24小时预约3-4-5-6人电饭锅', '21', '8', '21', '0', '厨卫电器/ 生活家电/ 厨具 >生活家电', '1', 'admin', 'N;', 'N;', '0', '', '1', '1_2017092121564484910.jpg', 'N;', '', '', '1', '', '1', '', '0', '1506002220', '0', '', '199.00', '210.00', '0.00', '94', '16', '0', '0', '', '1', '0.00', '0', '0', '0', '', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '1', '', '0.00', '0.00', '0.00', '0', '0.00', '0.00', '0');
INSERT INTO `ds_goodscommon` VALUES ('19', '孔雀尾 菜刀套装', '刀具齐全 优质钢材 经久耐用 耐腐蚀高强度', '22', '8', '22', '0', '厨卫电器/ 生活家电/ 厨具 >厨具', '1', 'admin', 'N;', 'N;', '0', '', '1', '1_2017092122005521920.jpg', 'N;', '', '', '1', '', '1', '', '0', '1506002467', '0', '', '368.00', '400.00', '0.00', '92', '17', '0', '0', '', '1', '0.00', '0', '0', '0', '', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '1', '', '0.00', '0.00', '0.00', '0', '0.00', '0.00', '0');
INSERT INTO `ds_goodscommon` VALUES ('20', '苏泊尔（supor)家用真空保温壶·晶韵系列KC20AP1(摩卡金)', '2L大容量 真空保温 304不锈钢 保冷保热  ', '22', '8', '22', '0', '厨卫电器/ 生活家电/ 厨具 >厨具', '1', 'admin', 'N;', 'N;', '0', '', '1', '1_2017092122035543274.jpg', 'N;', '', '', '1', '', '1', '', '0', '1506002646', '0', '', '199.00', '250.00', '0.00', '79', '', '0', '0', '', '1', '0.00', '0', '0', '0', '', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '1', '', '0.00', '0.00', '0.00', '0', '0.00', '0.00', '0');
INSERT INTO `ds_goodscommon` VALUES ('21', '联想(Lenovo)拯救者Y520 15.6英寸游戏笔记本电脑', 'R720同模具，加128SSD混合硬盘，GTX1050显卡，背光键盘', '23', '9', '23', '0', '电脑办公/ 相机/ DIY >电脑整机', '1', 'admin', 'N;', 'N;', '0', '', '1', '1_2017092123585272874.jpg', 'N;', '', '', '1', '', '1', '', '0', '1506009741', '0', '', '5400.00', '5499.00', '0.00', '0', '20', '0', '0', '', '1', '0.00', '0', '0', '0', '', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '1', '', '0.00', '0.00', '0.00', '0', '0.00', '0.00', '0');
INSERT INTO `ds_goodscommon` VALUES ('22', '华硕（ASUS）FH5900 顽石电竞版15.6英寸游戏笔记本电脑', '1T 940MX-2G独显', '23', '9', '23', '0', '电脑办公/ 相机/ DIY >电脑整机', '1', 'admin', 'N;', 'N;', '0', '', '1', '1_2017092200403659812.jpg', 'N;', '', '', '1', '', '1', '', '0', '1506012042', '0', '', '4499.00', '4500.00', '0.00', '99', '20', '0', '0', '', '1', '0.00', '0', '0', '0', '', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '1', '', '0.00', '0.00', '0.00', '0', '0.00', '0.00', '0');
INSERT INTO `ds_goodscommon` VALUES ('23', '戴尔(DELL)灵越Ins15MR-7528SS 15.6英寸笔记本电脑', '', '23', '9', '23', '0', '电脑办公/ 相机/ DIY >电脑整机', '1', 'admin', 'N;', 'N;', '0', '', '1', '1_2017092201034951336.jpg', 'N;', '', '', '1', '', '1', '', '0', '1506013470', '0', '', '3999.00', '4200.00', '0.00', '95', '21', '0', '0', '', '1', '0.00', '0', '0', '0', '', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '1', '', '0.00', '0.00', '0.00', '0', '0.00', '0.00', '0');
INSERT INTO `ds_goodscommon` VALUES ('24', '佳能(Canon) EOS M10 微单套机', '时尚翻屏设计-超赞屏幕取景-WiFi随拍随秀', '24', '9', '24', '0', '电脑办公/ 相机/ DIY >相机', '1', 'admin', 'N;', 'N;', '0', '', '1', '1_2017092201084565859.jpg', 'N;', '', '', '1', '', '1', '', '0', '1506013739', '0', '', '2290.00', '2999.00', '0.00', '76', '22', '0', '0', '', '1', '0.00', '0', '0', '0', '', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '1', '', '0.00', '0.00', '0.00', '0', '0.00', '0.00', '0');
INSERT INTO `ds_goodscommon` VALUES ('25', ' 数码单反相机', '下单赠送主图大礼包 内存卡 相机包 三脚架', '24', '9', '24', '0', '电脑办公/ 相机/ DIY >相机', '1', 'admin', 'N;', 'N;', '0', '', '1', '1_2017092201381015306.jpg', 'N;', '', '', '1', '', '1', '', '0', '1506015501', '0', '', '4280.00', '4300.00', '0.00', '99', '23', '0', '0', '', '1', '0.00', '0', '0', '0', '', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '1', '', '0.00', '0.00', '0.00', '0', '0.00', '0.00', '0');
INSERT INTO `ds_goodscommon` VALUES ('26', '南极人(NanJiren) 加高蒙古包蚊帐', '开门支架学生宿舍单人双人B', '25', '10', '25', '0', '家居/ 家具/ 家装 >家纺', '1', 'admin', 'N;', 'N;', '0', '', '1', '1_2017092201461861948.jpg', 'N;', '', '', '1', '', '1', '', '0', '1506015989', '0', '', '59.00', '66.00', '0.00', '89', '10', '0', '0', '', '1', '0.00', '0', '0', '0', '', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '1', '', '0.00', '0.00', '0.00', '0', '0.00', '0.00', '0');
INSERT INTO `ds_goodscommon` VALUES ('27', '小狮子抱枕', ' 带给你专宠的美好', '25', '10', '25', '0', '家居/ 家具/ 家装 >家纺', '1', 'admin', 'N;', 'N;', '0', '', '1', '1_2017092201523177266.jpg', 'N;', '', '', '1', '', '1', '', '0', '1506016354', '0', '', '39.00', '45.00', '0.00', '86', '28', '10', '0', '', '1', '0.00', '0', '0', '0', '', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '1', '', '0.00', '0.00', '0.00', '0', '0.00', '0.00', '0');
INSERT INTO `ds_goodscommon` VALUES ('28', '南极人(NanJiren)纯棉床单四件套全棉床上用品婚庆被套4件套', '夏日约“惠”南极人', '26', '10', '26', '0', '家居/ 家具/ 家装 >家具', '1', 'admin', 'N;', 'N;', '0', '', '1', '1_2017092202022516767.jpg', 'N;', '', '', '1', '', '1', '', '0', '1506016948', '0', '', '109.00', '120.00', '0.00', '90', '', '0', '0', '', '1', '0.00', '0', '0', '0', '', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '1', '', '0.00', '0.00', '0.00', '0', '0.00', '0.00', '0');
INSERT INTO `ds_goodscommon` VALUES ('29', '欧式美式实木雕花沙发 高档大户型客厅真皮沙发头层牛皮沙发组合', '头层牛皮+全实木', '26', '10', '26', '0', '家居/ 家具/ 家装 >家具', '1', 'admin', 'N;', 'N;', '0', '', '1', '1_2017092202082283957.jpg', 'N;', '', '', '1', '', '1', '', '0', '1506017336', '0', '', '1320.00', '1400.00', '0.00', '94', '26', '0', '0', '', '1', '0.00', '0', '0', '0', '', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '1', '', '0.00', '0.00', '0.00', '0', '0.00', '0.00', '0');
INSERT INTO `ds_goodscommon` VALUES ('30', '北欧简约现代日式可拆洗布艺床', '小户型实木婚床软床', '26', '10', '26', '0', '家居/ 家具/ 家装 >家具', '1', 'admin', 'N;', 'N;', '0', '', '1', '1_2017092202112937358.jpg', 'N;', '', '', '1', '', '1', '', '0', '1506017493', '0', '', '1980.00', '2100.00', '0.00', '94', '', '0', '0', '', '1', '0.00', '0', '0', '0', '', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '1', '', '0.00', '0.00', '0.00', '0', '0.00', '0.00', '0');
INSERT INTO `ds_goodscommon` VALUES ('31', '宜莱芙 吸盘挂壁式牙刷架漱口杯套装（4口之家）', '', '27', '10', '27', '0', '家居/ 家具/ 家装 >生活日用', '1', 'admin', 'N;', 'N;', '0', '', '1', '1_2017092202162519571.jpg', 'N;', '', '', '1', '', '1', '', '0', '1506017804', '0', '', '49.00', '55.00', '0.00', '89', '27', '0', '0', '', '1', '0.00', '0', '0', '0', '', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '1', '', '0.00', '0.00', '0.00', '0', '0.00', '0.00', '0');
INSERT INTO `ds_goodscommon` VALUES ('32', '日用浴室用品现代时尚家居家用浴帘', '宽150*高180+环 一个装', '27', '10', '27', '0', '家居/ 家具/ 家装 >生活日用', '1', 'admin', 'N;', 'N;', '0', '', '1', '1_2017092202215519250.jpg', 'N;', '', '', '1', '', '1', '', '0', '1506018119', '0', '', '22.50', '25.00', '0.00', '90', '28', '0', '0', '', '1', '0.00', '0', '0', '0', '', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '1', '', '0.00', '0.00', '0.00', '0', '0.00', '0.00', '0');
INSERT INTO `ds_goodscommon` VALUES ('33', '益达 木糖醇清爽西瓜味40粒瓶装56g', '关爱牙齿，更关心您', '28', '11', '28', '0', '食品/ 酒水/ 生鲜/ 特产 >食品', '1', 'admin', 'N;', 'N;', '0', '', '1', '1_2017092202310929808.jpg', 'N;', '', '', '1', '', '1', '', '0', '1506018671', '0', '', '12.80', '13.00', '0.00', '98', '10', '0', '0', '', '1', '0.00', '0', '0', '0', '', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '1', '', '0.00', '0.00', '0.00', '0', '0.00', '0.00', '0');
INSERT INTO `ds_goodscommon` VALUES ('34', '三只松鼠_小贱串烧味拉面丸子85g', '闲膨化零食拉面丸子休闲丸子串烧味', '28', '11', '28', '0', '食品/ 酒水/ 生鲜/ 特产 >食品', '1', 'admin', 'N;', 'N;', '0', '', '1', '1_2017092202323192694.jpg', 'N;', '', '', '1', '', '1', '', '0', '1506018762', '0', '', '13.80', '14.00', '0.00', '98', '', '0', '0', '', '1', '0.00', '0', '0', '0', '', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '1', '', '0.00', '0.00', '0.00', '0', '0.00', '0.00', '0');
INSERT INTO `ds_goodscommon` VALUES ('36', '洋河 梦之蓝M3-52度500ml', '', '29', '11', '29', '0', '食品/ 酒水/ 生鲜/ 特产 >酒水', '1', 'admin', 'N;', 'N;', '0', '', '1', '1_2017092202350299027.jpg', 'N;', '', '', '1', '', '1', '', '0', '1506018905', '0', '', '528.00', '570.00', '0.00', '92', '', '0', '0', '', '1', '0.00', '0', '0', '0', '', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '1', '', '0.00', '0.00', '0.00', '0', '0.00', '0.00', '0');
INSERT INTO `ds_goodscommon` VALUES ('37', '五粮液', '孝敬长辈，推荐用酒', '29', '11', '29', '0', '食品/ 酒水/ 生鲜/ 特产 >酒水', '1', 'admin', 'a:3:{i:1;s:6:\"样式\";i:2;s:6:\"颜色\";i:3;s:6:\"大小\";}', 'a:3:{i:1;a:1:{i:1;s:5:\"400ml\";}i:2;a:1:{i:1;s:3:\"红\";}i:3;a:1:{i:37;s:5:\"52度\";}}', '0', '', '1', '1_2017092202382291274.jpg', 'N;', '', '', '1', '', '1', '', '0', '1506019112', '0', '', '695.00', '820.00', '0.00', '84', '', '0', '0', '', '1', '0.00', '0', '0', '0', '', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '1', '', '0.00', '0.00', '0.00', '0', '0.00', '0.00', '0');
INSERT INTO `ds_goodscommon` VALUES ('39', '自然堂 水润保湿两件套 补水保湿套装', '', '30', '12', '30', '0', '个护化妆/ 纸品清洁/ 宠物 >护肤品', '1', 'admin', 'N;', 'N;', '0', '', '1', '1_2017092202443553519.jpg', 'N;', '', '', '1', '', '1', '', '0', '1506019477', '0', '', '69.40', '70.00', '0.00', '99', '', '0', '0', '', '1', '0.00', '0', '0', '0', '', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '1', '', '0.00', '0.00', '0.00', '0', '0.00', '0.00', '0');
INSERT INTO `ds_goodscommon` VALUES ('40', '百雀羚水能量焕耀套装补水保湿护肤套装', '补水修复 宛若新生  ', '30', '12', '30', '0', '个护化妆/ 纸品清洁/ 宠物 >护肤品', '1', 'admin', 'a:3:{i:1;s:6:\"样式\";i:2;s:6:\"颜色\";i:3;s:6:\"大小\";}', 'a:3:{i:1;a:1:{i:42;s:9:\"两件套\";}i:2;a:1:{i:45;s:6:\"翠绿\";}i:3;a:1:{i:46;s:5:\"200ml\";}}', '0', '', '1', '1_2017092202461115940.jpg', 'N;', '', '', '1', '', '1', '', '0', '1506019573', '0', '', '369.00', '400.00', '0.00', '92', '', '0', '0', '', '1', '0.00', '0', '0', '0', '', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '1', '', '0.00', '0.00', '0.00', '0', '0.00', '0.00', '0');
INSERT INTO `ds_goodscommon` VALUES ('41', ' 小黑裙香水洗发水+沐浴露', ' 风魔欧美 持久留香 洗护套装', '31', '12', '31', '0', '个护化妆/ 纸品清洁/ 宠物 >清洁洗护', '1', 'admin', 'a:3:{i:1;s:6:\"样式\";i:2;s:6:\"颜色\";i:3;s:6:\"大小\";}', 'a:3:{i:1;a:1:{i:1;s:9:\"两件套\";}i:2;a:1:{i:1;s:3:\"白\";}i:3;a:1:{i:1;s:5:\"500ml\";}}', '0', '', '1', '1_2017092202492958131.jpg', 'N;', '', '', '1', '', '1', '', '0', '1506019782', '0', '', '45.90', '56.00', '0.00', '81', '', '0', '0', '', '1', '0.00', '0', '0', '0', '', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '1', '', '0.00', '0.00', '0.00', '0', '0.00', '0.00', '0');
INSERT INTO `ds_goodscommon` VALUES ('42', '滋源无硅油洗发水氨基酸生姜535洗护发套装', '', '31', '12', '31', '0', '个护化妆/ 纸品清洁/ 宠物 >清洁洗护', '1', 'admin', 'a:3:{i:1;s:6:\"样式\";i:2;s:6:\"颜色\";i:3;s:6:\"大小\";}', 'a:3:{i:1;a:1:{i:49;s:9:\"两件套\";}i:2;a:1:{i:1;s:3:\"紫\";}i:3;a:1:{i:47;s:5:\"500ml\";}}', '0', '', '1', '1_2017092202514891485.jpg', 'N;', '', '', '1', '', '1', '', '0', '1506019911', '0', '', '179.00', '189.00', '0.00', '94', '', '0', '0', '', '1', '0.00', '0', '0', '0', '', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '1', '', '0.00', '0.00', '0.00', '0', '0.00', '0.00', '0');
INSERT INTO `ds_goodscommon` VALUES ('43', '宠物用品出行牵引带', '', '32', '12', '32', '0', '个护化妆/ 纸品清洁/ 宠物 >宠物生活', '1', 'admin', 'N;', 'N;', '0', '', '1', '1_2017092202553367071.jpg', 'N;', '', '', '1', '', '1', '', '0', '1506020205', '0', '', '14.90', '25.00', '0.00', '59', '39', '0', '0', '', '1', '0.00', '0', '0', '0', '', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '1', '', '0.00', '0.00', '0.00', '0', '0.00', '0.00', '0');
INSERT INTO `ds_goodscommon` VALUES ('44', '家用宠物日用品饮水器喝水瓶', '', '32', '12', '32', '0', '个护化妆/ 纸品清洁/ 宠物 >宠物生活', '1', 'admin', 'N;', 'N;', '0', '', '1', '1_2017092202585843151.jpg', 'N;', '', '', '1', '', '1', '', '0', '1506020341', '0', '', '14.90', '15.00', '0.00', '99', '35', '10', '0', '', '1', '0.00', '0', '0', '0', '', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '1', '', '0.00', '0.00', '0.00', '0', '0.00', '0.00', '0');
INSERT INTO `ds_goodscommon` VALUES ('45', '与牧2017韩版短款', '', '39', '15', '39', '0', '男装/ 女装/ 内衣 >女装', '1', 'admin', 'a:3:{i:1;s:6:\"样式\";i:2;s:6:\"颜色\";i:3;s:6:\"大小\";}', 'a:3:{i:1;a:1:{i:1;s:6:\"针织\";}i:2;a:2:{i:3;s:3:\"黑\";i:4;s:3:\"白\";}i:3;a:3:{i:8;s:1:\"M\";i:9;s:1:\"L\";i:10;s:2:\"XL\";}}', '0', '', '1', '1_2017092203045216863.jpg', 'N;', '', '', '1', '', '1', '', '0', '1506020705', '0', '', '39.00', '42.00', '0.00', '92', '', '0', '0', '', '1', '0.00', '0', '0', '0', '', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '1', '', '0.00', '0.00', '0.00', '0', '0.00', '0.00', '0');
INSERT INTO `ds_goodscommon` VALUES ('46', '蔚缇2017夏季小花网纱+吊带+喇叭裤三件套女', '限时促销', '39', '15', '39', '0', '男装/ 女装/ 内衣 >女装', '1', 'admin', 'N;', 'N;', '0', '', '1', '1_2017092203062937149.jpg', 'N;', '', '', '1', '', '1', '', '0', '1506020790', '0', '', '139.50', '145.00', '0.00', '96', '1610', '0', '0', '', '1', '0.00', '0', '0', '0', '', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '1', '', '0.00', '0.00', '0.00', '0', '0.00', '0.00', '0');
INSERT INTO `ds_goodscommon` VALUES ('47', '2017夏季百搭吊带背心女新款修身纯棉吊带衫蕾丝打底背心', '宽松小吊带 白色', '39', '15', '39', '0', '男装/ 女装/ 内衣 >女装', '1', 'admin', 'N;', 'N;', '0', '', '1', '1_2017092203083967214.jpg', 'N;', '', '', '1', '', '1', '', '0', '1506020928', '0', '', '39.90', '45.00', '0.00', '88', '1620', '0', '0', '', '1', '0.00', '0', '0', '0', '', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '1', '', '0.00', '0.00', '0.00', '0', '0.00', '0.00', '0');
INSERT INTO `ds_goodscommon` VALUES ('48', '2017秋季新款男士外套休闲潮牛仔夹克衫帅气棒球服学生韩版', '秋季新款', '41', '15', '41', '0', '男装/ 女装/ 内衣 >男装', '1', 'admin', 'N;', 'N;', '0', '', '1', '1_2017092203123417256.jpg', 'N;', '', '', '1', '', '1', '', '0', '1506021154', '0', '', '159.00', '169.00', '0.00', '94', '1630', '10', '0', '', '1', '0.00', '0', '0', '0', '', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '1', '', '0.00', '0.00', '0.00', '0', '0.00', '0.00', '0');
INSERT INTO `ds_goodscommon` VALUES ('49', '丹杰仕 夏季男女情侣防晒衣潮男时尚韩版修身连帽薄款印花夹克上衣', '', '41', '15', '41', '0', '男装/ 女装/ 内衣 >男装', '1', 'admin', 'N;', 'N;', '0', '', '1', '1_2017092203151752294.jpg', 'N;', '', '', '1', '', '1', '', '0', '1506021320', '0', '', '59.00', '69.00', '0.00', '85', '1640', '0', '0', '', '1', '0.00', '0', '0', '0', '', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '1', '', '0.00', '0.00', '0.00', '0', '0.00', '0.00', '0');
INSERT INTO `ds_goodscommon` VALUES ('50', '轻颦双黛 男士内裤透气吸汗男内裤', '　男士舒适透气内裤 柔软舒适不易变形  ', '44', '15', '44', '0', '男装/ 女装/ 内衣 >内衣内裤', '1', 'admin', 'N;', 'N;', '0', '', '1', '1_2017092203175020843.jpg', 'N;', '', '', '1', '', '1', '', '0', '1506021473', '0', '', '29.80', '36.00', '0.00', '82', '1650', '10', '0', '', '1', '0.00', '0', '0', '0', '', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '1', '', '0.00', '0.00', '0.00', '0', '0.00', '0.00', '0');
INSERT INTO `ds_goodscommon` VALUES ('51', '北极绒女士内裤', '性感轻薄中低腰透气女内裤', '44', '15', '44', '0', '男装/ 女装/ 内衣 >内衣内裤', '1', 'admin', 'N;', 'N;', '0', '', '1', '1_2017092203201884569.jpg', 'N;', '', '', '1', '', '1', '', '0', '1506021621', '0', '', '49.00', '58.00', '0.00', '84', '1660', '0', '0', '', '1', '0.00', '0', '0', '0', '', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '1', '', '0.00', '0.00', '0.00', '0', '0.00', '0.00', '0');
INSERT INTO `ds_goodscommon` VALUES ('52', '尖头粗跟高跟鞋一字扣单鞋 性感窜珠脚链高跟浅口凉鞋女鞋', '', '45', '16', '45', '0', '鞋靴/ 箱包/ 钟表/ 珠宝 >时尚鞋靴', '1', 'admin', 'N;', 'N;', '0', '', '1', '1_2017092203242754461.jpg', 'N;', '', '', '1', '', '1', '', '0', '1506021871', '0', '', '49.00', '52.00', '0.00', '94', '1068', '10', '0', '', '1', '0.00', '0', '0', '0', '', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '1', '', '0.00', '0.00', '0.00', '0', '0.00', '0.00', '0');
INSERT INTO `ds_goodscommon` VALUES ('53', '品点新款平底轻便蛋卷鞋防滑牛筋底舒适女鞋', '防滑舒适，轻便时尚，标准尺码！', '45', '16', '45', '0', '鞋靴/ 箱包/ 钟表/ 珠宝 >时尚鞋靴', '1', 'admin', 'N;', 'N;', '0', '', '1', '1_2017092203261873185.jpg', 'N;', '', '', '1', '', '1', '', '0', '1506021982', '0', '', '78.00', '82.00', '0.00', '95', '2017', '10', '0', '', '1', '0.00', '0', '0', '0', '', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '1', '', '0.00', '0.00', '0.00', '0', '0.00', '0.00', '0');
INSERT INTO `ds_goodscommon` VALUES ('54', '贝美芬 925银心心相印女士项链 女生饰品 时尚流行', '时尚简约', '46', '16', '46', '0', '鞋靴/ 箱包/ 钟表/ 珠宝 >珠宝饰品', '1', 'admin', 'N;', 'N;', '0', '', '1', '1_2017092203275599920.jpg', 'N;', '', '', '1', '', '1', '', '0', '1506022081', '0', '', '88.00', '98.00', '0.00', '89', '', '0', '0', '', '1', '0.00', '0', '0', '0', '', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '1', '', '0.00', '0.00', '0.00', '0', '0.00', '0.00', '0');
INSERT INTO `ds_goodscommon` VALUES ('55', '幸运四叶草纯银吊坠', '', '46', '16', '46', '0', '鞋靴/ 箱包/ 钟表/ 珠宝 >珠宝饰品', '1', 'admin', 'N;', 'N;', '0', '', '1', '1_2017092203294765362.jpg', 'N;', '', '', '1', '', '1', '', '0', '1506022193', '0', '', '75.00', '89.00', '0.00', '84', '2016', '10', '0', '', '1', '0.00', '0', '0', '0', '', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '1', '', '0.00', '0.00', '0.00', '0', '0.00', '0.00', '0');
INSERT INTO `ds_goodscommon` VALUES ('56', '施诺绮心梦爱心型925纯银水晶项链采用施华洛世奇元素水晶吊坠', '', '46', '16', '46', '0', '鞋靴/ 箱包/ 钟表/ 珠宝 >珠宝饰品', '1', 'admin', 'N;', 'N;', '0', '', '1', '1_2017092203321969628.jpg', 'N;', '', '', '1', '', '1', '', '0', '1506022343', '0', '', '108.00', '120.00', '0.00', '90', '2018', '10', '0', '', '1', '0.00', '0', '0', '0', '', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '1', '', '0.00', '0.00', '0.00', '0', '0.00', '0.00', '0');
INSERT INTO `ds_goodscommon` VALUES ('57', '封后皮皮虾韩国单肩包女韩版帆布手提袋', '简约帆布袋', '47', '16', '47', '0', '鞋靴/ 箱包/ 钟表/ 珠宝 >时尚皮包', '1', 'admin', 'N;', 'N;', '0', '', '1', '1_2017092203335981358.jpg', 'N;', '', '', '1', '', '1', '', '0', '1506022442', '0', '', '39.00', '49.00', '0.00', '79', '2049', '10', '0', '', '1', '0.00', '0', '0', '0', '', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '1', '', '0.00', '0.00', '0.00', '0', '0.00', '0.00', '0');
INSERT INTO `ds_goodscommon` VALUES ('58', '迈克.科尔斯(Michael Kors/MK)小号女包手提单肩斜跨包', '海外采购', '47', '16', '47', '0', '鞋靴/ 箱包/ 钟表/ 珠宝 >时尚皮包', '1', 'admin', 'N;', 'N;', '0', '', '1', '1_2017092203371485168.jpg', 'N;', '', '', '1', '', '1', '', '0', '1506022638', '0', '', '1096.00', '1200.00', '0.00', '91', '1068', '0', '0', '', '1', '0.00', '0', '0', '0', '', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '1', '', '0.00', '0.00', '0.00', '0', '0.00', '0.00', '0');
INSERT INTO `ds_goodscommon` VALUES ('59', '蜂苹果6s数据线iphone6二合一拖安卓通用手机8P充电线器快充线', '闪电快充 提速40% 一年换新', '48', '1', '48', '0', '手机/ 运营商/ 智能数码 >手机配件', '1', 'admin', 'N;', 'N;', '0', '', '1', '1_2017092821352360295.jpg', 'N;', '', '', '1', '', '1', '', '0', '1506605735', '0', '', '19.90', '21.00', '0.00', '94', '10123', '0', '0', '', '1', '0.00', '0', '0', '0', '', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '1', '', '0.00', '0.00', '0.00', '0', '0.00', '0.00', '0');
INSERT INTO `ds_goodscommon` VALUES ('60', '手机散热器华为苹果通用充电宝式架子桌面游戏手柄支驾冷却降温器', '双风扇快速降温 可供电持久续航', '48', '1', '48', '0', '手机/ 运营商/ 智能数码 >手机配件', '1', 'admin', 'N;', 'N;', '0', '', '1', '1_2017092821383373641.jpg', 'N;', '', '', '1', '', '1', '', '0', '1506605915', '0', '', '58.00', '66.00', '0.00', '87', '', '0', '0', '', '1', '0.00', '0', '0', '0', '', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '1', '', '0.00', '0.00', '0.00', '0', '0.00', '0.00', '0');
INSERT INTO `ds_goodscommon` VALUES ('61', '手机充电宝带蓝牙音响三合一多功能平坂支架1毫安5移动电源20000M', '二合一 [支架+充电宝] 三合一 [支架+充电宝+蓝牙音响]', '48', '1', '48', '0', '手机/ 运营商/ 智能数码 >手机配件', '1', 'admin', 'N;', 'N;', '0', '', '1', '1_2017092821403589442.jpg', 'N;', '', '', '1', '', '1', '', '0', '1506606045', '0', '', '55.00', '80.00', '0.00', '68', '', '0', '0', '', '1', '0.00', '0', '0', '0', '', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '1', '', '0.00', '0.00', '0.00', '0', '0.00', '0.00', '0');
INSERT INTO `ds_goodscommon` VALUES ('62', '苹果无线HDMI同屏器airplay推送宝高清安卓手机电视投影视频传输', '无需软件不需要安装app即可实现无线同屏', '49', '1', '49', '0', '手机/ 运营商/ 智能数码 >影音电子', '1', 'admin', 'N;', 'N;', '0', '', '1', '1_2017092821431519588.jpg', 'N;', '', '', '1', '', '1', '', '0', '1506606198', '0', '', '158.00', '158.00', '0.00', '100', '', '0', '0', '', '1', '0.00', '0', '0', '0', '', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '1', '', '0.00', '0.00', '0.00', '0', '0.00', '0.00', '0');
INSERT INTO `ds_goodscommon` VALUES ('63', '唐麦 F3耳机入耳式 重低音炮手机电脑音乐有线耳塞式金属通用带麦', '15天无理由退换货一年质保换新', '49', '1', '49', '0', '手机/ 运营商/ 智能数码 >影音电子', '1', 'admin', 'N;', 'N;', '0', '', '1', '1_2017092821510935694.jpg', 'N;', '', '', '1', '', '1', '', '0', '1506606673', '0', '', '55.00', '59.00', '0.00', '93', '', '0', '0', '', '1', '0.00', '0', '0', '0', '', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '1', '', '0.00', '0.00', '0.00', '0', '0.00', '0.00', '0');
INSERT INTO `ds_goodscommon` VALUES ('64', '森狗SimDog sim2.0手机k歌耳机入耳式通用男女生耳塞式耳麦重低音', '专利产品 支持语音 支持接听电话', '49', '1', '49', '0', '手机/ 运营商/ 智能数码 >影音电子', '1', 'admin', 'N;', 'N;', '0', '', '1', '1_2017092821530372212.jpg', 'N;', '', '', '1', '', '1', '', '0', '1506606785', '0', '', '19.80', '20.00', '0.00', '99', '', '0', '0', '', '1', '0.00', '0', '0', '0', '', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '1', '', '0.00', '0.00', '0.00', '0', '0.00', '0.00', '0');
INSERT INTO `ds_goodscommon` VALUES ('65', '达尔优 进化者D3带麦克风震动电脑游戏耳机头戴式耳麦绝地求生lol', '头戴式震动发光耳麦 电竞赛事耳机金属头梁', '49', '1', '49', '0', '手机/ 运营商/ 智能数码 >影音电子', '1', 'admin', 'N;', 'N;', '0', '', '1', '1_2017092821544898610.jpg', 'N;', '', '', '1', '', '1', '', '0', '1506606891', '0', '', '158.00', '160.00', '0.00', '98', '', '0', '0', '', '1', '0.00', '0', '0', '0', '', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '1', '', '0.00', '0.00', '0.00', '0', '0.00', '0.00', '0');
INSERT INTO `ds_goodscommon` VALUES ('66', 'uoluo特价21 22 24 32 40 42 50 55寸60智能wifi网络小液晶电视机', '高清电视接口：闭路+AV+HDMI+电脑VGA+DVD+音频+USB多媒体【不含网络功能】； 智能电视接口：含高清电视所有的功能接口+有线网络+无线wifi。', '5', '4', '5', '0', '电视/ 空调/ 冰箱/ 洗衣机 >电视', '1', 'admin', 'a:3:{i:1;s:6:\"样式\";i:2;s:6:\"颜色\";i:3;s:6:\"大小\";}', 'a:3:{i:1;a:1:{i:1;s:6:\"液晶\";}i:2;a:1:{i:1;s:3:\"黑\";}i:3;a:1:{i:1;s:11:\"50寸高清\";}}', '0', '', '1', '1_2017092821585013652.jpg', 'N;', '', '', '1', '', '1', '', '0', '1506607133', '0', '', '1299.00', '1500.00', '0.00', '86', '', '0', '0', '', '1', '0.00', '0', '0', '0', '', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '1', '', '0.00', '0.00', '0.00', '0', '0.00', '0.00', '0');
INSERT INTO `ds_goodscommon` VALUES ('67', 'Hisense/海信 KFR-35GW/ER22N3(1L04) 大1.5p匹家用冷暖空调挂机', '', '6', '4', '6', '0', '电视/ 空调/ 冰箱/ 洗衣机 >空调', '1', 'admin', 'N;', 'N;', '0', '', '1', '1_2017092822032535526.jpg', 'N;', '', '', '1', '', '1', '', '0', '1506607408', '0', '', '1999.00', '1999.00', '0.00', '100', '', '0', '0', '', '1', '0.00', '0', '0', '0', '', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '1', '', '0.00', '0.00', '0.00', '0', '0.00', '0.00', '0');
INSERT INTO `ds_goodscommon` VALUES ('68', '先锋工业冷风扇 移动空调扇家用 冷风机商用小空调 加湿水冷气扇', '先锋新品工业冷风扇', '6', '4', '6', '0', '电视/ 空调/ 冰箱/ 洗衣机 >空调', '1', 'admin', 'N;', 'N;', '0', '', '1', '1_2017092822050083427.jpg', 'N;', '', '', '1', '', '1', '', '0', '1506607504', '0', '', '1199.00', '1200.00', '0.00', '99', '', '0', '0', '', '1', '0.00', '0', '0', '0', '', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '1', '', '0.00', '0.00', '0.00', '0', '0.00', '0.00', '0');
INSERT INTO `ds_goodscommon` VALUES ('70', '荣事达空调扇冷暖两用家用静音遥控冷风机制冷风扇加湿移动小空调', '强劲制冷 触摸屏 智能遥控 净化加湿', '6', '4', '6', '0', '电视/ 空调/ 冰箱/ 洗衣机 >空调', '1', 'admin', 'N;', 'N;', '0', '', '1', '1_2017092823485490716.jpg', 'N;', '', '', '1', '', '1', '', '0', '1506613743', '0', '', '358.00', '358.00', '0.00', '100', '', '0', '0', '', '1', '0.00', '0', '0', '0', '', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '1', '', '0.00', '0.00', '0.00', '0', '0.00', '0.00', '0');
INSERT INTO `ds_goodscommon` VALUES ('71', '美菱可移动式空调一体机1.5匹1 P单冷型小制冷厨房窗式冷暖免安装', '', '6', '4', '6', '0', '电视/ 空调/ 冰箱/ 洗衣机 >空调', '1', 'admin', 'N;', 'N;', '0', '', '1', '1_2017092823501155931.jpg', 'N;', '', '', '1', '', '1', '', '0', '1506613814', '0', '', '1299.00', '1299.00', '0.00', '100', '', '0', '0', '', '1', '0.00', '0', '0', '0', '', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '1', '', '0.00', '0.00', '0.00', '0', '0.00', '0.00', '0');
INSERT INTO `ds_goodscommon` VALUES ('72', '乐创冷藏工作台冷冻冰箱平冷保鲜不锈钢商用厨房奶茶店操作台冰柜', '优质商家热销2万无磁不锈钢加厚全发泡', '7', '4', '7', '0', '电视/ 空调/ 冰箱/ 洗衣机 >冰箱', '1', 'admin', 'N;', 'N;', '0', '', '1', '1_2017092823531033711.jpg', 'N;', '', '', '1', '', '1', '', '0', '1506613995', '0', '', '1478.00', '1478.00', '0.00', '100', '', '0', '0', '', '1', '0.00', '0', '0', '0', '', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '1', '', '0.00', '0.00', '0.00', '0', '0.00', '0.00', '0');
INSERT INTO `ds_goodscommon` VALUES ('73', 'Midea/美的 BCD-169CM(E)双门冰箱家用冷藏冷冻对开门小型冰箱', '对开门小型冰箱', '7', '4', '7', '0', '电视/ 空调/ 冰箱/ 洗衣机 >冰箱', '1', 'admin', 'N;', 'N;', '0', '', '1', '1_2017092900001256656.jpg', 'N;', '', '', '1', '', '1', '', '0', '1506614415', '0', '', '1099.00', '1100.00', '0.00', '99', '', '0', '0', '', '1', '0.00', '0', '0', '0', '', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '1', '', '0.00', '0.00', '0.00', '0', '0.00', '0.00', '0');
INSERT INTO `ds_goodscommon` VALUES ('74', '志高全自动洗衣机 家用 小型 5.5公斤波轮 静音宿舍 迷你风干预约', '小家优选 节能静音 顺丰入户 预约童锁', '51', '4', '51', '0', '电视/ 空调/ 冰箱/ 洗衣机 >洗衣机', '1', 'admin', 'N;', 'N;', '0', '', '1', '1_2017092900022214210.jpg', 'N;', '', '', '1', '', '1', '', '0', '1506614544', '0', '', '498.00', '500.00', '0.00', '99', '', '0', '0', '', '1', '0.00', '0', '0', '0', '', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '1', '', '0.00', '0.00', '0.00', '0', '0.00', '0.00', '0');
INSERT INTO `ds_goodscommon` VALUES ('75', 'Chigo/志高全自动洗衣机 15KG宾馆酒店商用大容量不锈钢顺丰入户', '顺丰入户 下单送荣事达电烤箱一个', '51', '4', '51', '0', '电视/ 空调/ 冰箱/ 洗衣机 >洗衣机', '1', 'admin', 'N;', 'N;', '0', '', '1', '1_2017092900033832502.jpg', 'N;', '', '', '1', '', '1', '', '0', '1506614620', '0', '', '2500.00', '2600.00', '0.00', '96', '', '0', '0', '', '1', '0.00', '0', '0', '0', '', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '1', '', '0.00', '0.00', '0.00', '0', '0.00', '0.00', '0');
INSERT INTO `ds_goodscommon` VALUES ('76', '集成灶自动清洗正品 侧吸下排式油烟机一体环保灶 双电磁炉威士伯', '天然气5000火力！断电应急！烟机延时', '20', '8', '20', '0', '厨卫电器/ 生活家电/ 厨具 >厨房大电', '1', 'admin', 'N;', 'N;', '0', '', '1', '1_2017092900052977159.jpg', 'N;', '', '', '1', '', '1', '', '0', '1506614732', '0', '', '3180.00', '3400.00', '0.00', '93', '', '0', '0', '', '1', '0.00', '0', '0', '0', '', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '1', '', '0.00', '0.00', '0.00', '0', '0.00', '0.00', '0');
INSERT INTO `ds_goodscommon` VALUES ('77', '威士伯J2集成灶 翻盖 一体 自动清洗烤箱蒸汽炉烟灶消套装 环保灶', '上门安装 双电机 漏气保护', '20', '8', '20', '0', '厨卫电器/ 生活家电/ 厨具 >厨房大电', '1', 'admin', 'N;', 'N;', '0', '', '1', '1_2017092900064438234.jpg', 'N;', '', '', '1', '', '1', '', '0', '1506614807', '0', '', '4590.00', '4700.00', '0.00', '97', '', '0', '0', '', '1', '0.00', '0', '0', '0', '', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '1', '', '0.00', '0.00', '0.00', '0', '0.00', '0.00', '0');
INSERT INTO `ds_goodscommon` VALUES ('78', '红心大蒸汽挂烫机家用熨斗手持挂烫机烫衣服熨烫机电熨斗正品包邮', '2000W大功率 超强蒸汽 快速熨衣', '21', '8', '21', '0', '厨卫电器/ 生活家电/ 厨具 >生活家电', '1', 'admin', 'N;', 'N;', '0', '', '1', '1_2017092900081355788.jpg', 'N;', '', '', '1', '', '1', '', '0', '1506614894', '0', '', '139.00', '145.00', '0.00', '95', '', '0', '0', '', '1', '0.00', '0', '0', '0', '', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '1', '', '0.00', '0.00', '0.00', '0', '0.00', '0.00', '0');
INSERT INTO `ds_goodscommon` VALUES ('79', '美的家用平烫挂烫双杆蒸汽挂烫机电熨斗熨YGD20D7', '独创可卧可立 35秒出蒸汽 六档微电脑', '21', '8', '21', '0', '厨卫电器/ 生活家电/ 厨具 >生活家电', '1', 'admin', 'N;', 'N;', '0', '', '1', '1_2017092900095941942.jpg', 'N;', '', '', '1', '', '1', '', '0', '1506615002', '0', '', '389.00', '400.00', '0.00', '97', '', '0', '0', '', '1', '0.00', '0', '0', '0', '', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '1', '', '0.00', '0.00', '0.00', '0', '0.00', '0.00', '0');
INSERT INTO `ds_goodscommon` VALUES ('80', '铨聚臭氧发生器果蔬解毒杀菌洗菜多功能负离子活氧净化消毒机家用', '臭氧消毒杀菌 果蔬解毒机 家用', '21', '8', '21', '0', '厨卫电器/ 生活家电/ 厨具 >生活家电', '1', 'admin', 'N;', 'N;', '0', '', '1', '1_2017092900115721538.jpg', 'N;', '', '', '1', '', '1', '', '0', '1506615121', '0', '', '399.00', '450.00', '0.00', '88', '', '0', '0', '', '1', '0.00', '0', '0', '0', '', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '1', '', '0.00', '0.00', '0.00', '0', '0.00', '0.00', '0');
INSERT INTO `ds_goodscommon` VALUES ('81', '拜格不锈钢锅具套装铁炒锅家用汤锅全套厨房厨具组合', '', '22', '8', '22', '0', '厨卫电器/ 生活家电/ 厨具 >厨具', '1', 'admin', 'N;', 'N;', '0', '', '1', '1_2017092900132832208.jpg', 'N;', '', '', '1', '', '1', '', '0', '1506615216', '0', '', '89.00', '99.00', '0.00', '89', '', '0', '0', '', '1', '0.00', '0', '0', '0', '', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '1', '', '0.00', '0.00', '0.00', '0', '0.00', '0.00', '0');
INSERT INTO `ds_goodscommon` VALUES ('82', '朝暮之家厨房置物架落地多层收纳架放锅架子厨具用品转角架 锅架', '火爆热卖 多款可选 多功能厨房落地置物架', '22', '8', '22', '0', '厨卫电器/ 生活家电/ 厨具 >厨具', '1', 'admin', 'N;', 'N;', '0', '', '1', '1_2017092900144267524.jpg', 'N;', '', '', '1', '', '1', '', '0', '1506615285', '0', '', '55.00', '69.00', '0.00', '79', '', '0', '0', '', '1', '0.00', '0', '0', '0', '', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '1', '', '0.00', '0.00', '0.00', '0', '0.00', '0.00', '0');
INSERT INTO `ds_goodscommon` VALUES ('83', '夏季薄网状透气型护腰带保健腰托腰围带钢板家用', '秋冬薄网状透气护腰', '55', '8', '55', '0', '厨卫电器/ 生活家电/ 厨具 >个护健康', '1', 'admin', 'N;', 'N;', '0', '', '1', '1_2017092900175249561.jpg', 'N;', '', '', '1', '', '1', '', '0', '1506615475', '0', '', '9.90', '15.90', '0.00', '62', '', '0', '0', '', '1', '0.00', '0', '0', '0', '', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '1', '', '0.00', '0.00', '0.00', '0', '0.00', '0.00', '0');
INSERT INTO `ds_goodscommon` VALUES ('84', '茗振海盐袋粗盐热敷包电加热理疗包袋家用颈椎腰部膝盖艾叶全身热敷袋', '', '55', '8', '55', '0', '厨卫电器/ 生活家电/ 厨具 >个护健康', '1', 'admin', 'N;', 'N;', '0', '', '1', '1_2017092900220838539.jpg', 'N;', '', '', '1', '', '1', '', '0', '1506615733', '0', '', '139.00', '145.00', '0.00', '95', '', '0', '0', '', '1', '0.00', '0', '0', '0', '', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '1', '', '0.00', '0.00', '0.00', '0', '0.00', '0.00', '0');
INSERT INTO `ds_goodscommon` VALUES ('85', '普立PL-603AC4刮痧机电脑版红光电动震动按摩机脂肪运动机', '刮痧推脂机美体仪高频震动爆溶按摩仪强力碎脂机腰部电动震动刮痧机甩脂机  ', '55', '8', '55', '0', '厨卫电器/ 生活家电/ 厨具 >个护健康', '1', 'admin', 'N;', 'N;', '0', '', '1', '1_2017092900242419538.jpg', 'N;', '', '', '1', '', '1', '', '0', '1506615869', '0', '', '79.00', '88.00', '0.00', '89', '', '0', '0', '', '1', '0.00', '0', '0', '0', '', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '1', '', '0.00', '0.00', '0.00', '0', '0.00', '0.00', '0');
INSERT INTO `ds_goodscommon` VALUES ('86', '南极人颈椎热敷护颈带护颈椎套保暖保护肩颈理疗自发热护颈椎脖套', '热敷理疗 穴位磁石 托玛琳 自发热', '55', '8', '55', '0', '厨卫电器/ 生活家电/ 厨具 >个护健康', '1', 'admin', 'N;', 'N;', '0', '', '1', '1_2017092900261952044.jpg', 'N;', '', '', '1', '', '1', '', '0', '1506615983', '0', '', '39.00', '59.00', '0.00', '66', '', '0', '0', '', '1', '0.00', '0', '0', '0', '', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '1', '', '0.00', '0.00', '0.00', '0', '0.00', '0.00', '0');
INSERT INTO `ds_goodscommon` VALUES ('87', '电脑非全新二手电脑主机台式整机i5i7游戏组装机27寸无边框显示器', '', '23', '9', '23', '0', '电脑办公/ 相机/ DIY >电脑整机', '1', 'admin', 'a:3:{i:1;s:6:\"样式\";i:2;s:6:\"颜色\";i:3;s:6:\"大小\";}', 'a:3:{i:1;a:2:{i:15;s:2:\"4G\";i:16;s:2:\"3G\";}i:2;a:2:{i:14;s:3:\"黑\";i:1;s:3:\"白\";}i:3;a:1:{i:1;s:10:\"硬盘500G\";}}', '0', '', '1', '1_2017092900363278117.jpg', 'N;', '', '', '1', '', '1', '', '0', '1506616595', '0', '', '1698.00', '2450.00', '0.00', '69', '', '0', '0', '', '1', '0.00', '0', '0', '0', '', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '1', '', '0.00', '0.00', '0.00', '0', '0.00', '0.00', '0');
INSERT INTO `ds_goodscommon` VALUES ('88', '全新台式高配吃鸡电脑主机i7高端全套网吧游戏型八核组装家用整机', '八核游戏竞电主机，配套GTX1050显卡', '23', '9', '23', '0', '电脑办公/ 相机/ DIY >电脑整机', '1', 'admin', 'a:3:{i:1;s:6:\"样式\";i:2;s:6:\"颜色\";i:3;s:6:\"大小\";}', 'a:3:{i:1;a:2:{i:15;s:2:\"4G\";i:16;s:2:\"3G\";}i:2;a:1:{i:111;s:3:\"白\";}i:3;a:1:{i:113;s:10:\"硬盘500G\";}}', '0', '', '1', '1_2017092900412680293.jpg', 'N;', '', '', '1', '', '1', '', '0', '1506616890', '0', '', '2688.00', '3450.00', '0.00', '77', '', '0', '0', '', '1', '0.00', '0', '0', '0', '', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '1', '', '0.00', '0.00', '0.00', '0', '0.00', '0.00', '0');
INSERT INTO `ds_goodscommon` VALUES ('89', 'Seagate/希捷 ST1000DM010 1TB新酷鱼台式机械电脑硬盘', '新酷鱼台盘-7200转', '24', '9', '24', '0', '电脑办公/ 相机/ DIY >相机', '1', 'admin', 'N;', 'N;', '0', '', '1', '1_2017092900450210134.jpg', 'N;', '', '', '1', '', '1', '', '0', '1506617106', '0', '', '309.00', '350.00', '0.00', '88', '', '0', '0', '', '1', '0.00', '0', '0', '0', '', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '1', '', '0.00', '0.00', '0.00', '0', '0.00', '0.00', '0');
INSERT INTO `ds_goodscommon` VALUES ('90', 'Asus/华硕 X555YI 7110-554LXFA2X10轻薄手提游戏本笔记本电脑', '', '134', '9', '23', '134', '电脑办公/ 相机/ DIY >电脑整机 >笔记本', '1', 'admin', 'N;', 'N;', '0', '', '0', '1_2017092900501117171.jpg', 'N;', '', '', '1', '', '1', '', '0', '1506617415', '0', '', '2599.00', '2780.00', '0.00', '93', '', '0', '0', '', '1', '0.00', '0', '0', '0', '', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '1', '', '0.00', '0.00', '0.00', '0', '0.00', '0.00', '0');
INSERT INTO `ds_goodscommon` VALUES ('91', '小米 红米NOTE 5A智能拍照手机16G/32G/64G', '', '75', '1', '2', '75', '手机/ 运营商/ 智能数码 >手机通讯 >小米', '1', 'admin', 'N;', 'N;', '0', '', '1', '1_2017092900544928056.jpg', 'N;', '', '', '1', '', '1', '', '0', '1506617760', '0', '', '799.00', '899.00', '0.00', '88', '', '0', '0', '', '1', '0.00', '0', '0', '0', '', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '1', '', '0.00', '0.00', '0.00', '0', '0.00', '0.00', '0');
INSERT INTO `ds_goodscommon` VALUES ('92', '3期免息【高配2799】Xiaomi/小米 小米NOTE 3全网通小米手机新品', '', '75', '1', '2', '75', '手机/ 运营商/ 智能数码 >手机通讯 >小米', '1', 'admin', 'a:3:{i:1;s:6:\"样式\";i:2;s:6:\"颜色\";i:3;s:6:\"大小\";}', 'a:3:{i:1;a:1:{i:1;s:9:\"全网通\";}i:2;a:1:{i:1;s:3:\"白\";}i:3;a:1:{i:1;s:4:\"128G\";}}', '0', '', '1', '1_2017092901044975398.jpg', 'N;', '', '', '1', '', '1', '', '0', '1506618294', '0', '', '2466.00', '2546.00', '0.00', '96', '', '0', '0', '', '1', '0.00', '0', '0', '0', '', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '1', '', '0.00', '0.00', '0.00', '0', '0.00', '0.00', '0');
INSERT INTO `ds_goodscommon` VALUES ('93', 'honor/荣耀 荣耀9 全网通4G手机双摄像头智能手机', '后置双摄像头手机', '76', '1', '2', '76', '手机/ 运营商/ 智能数码 >手机通讯 >荣耀', '1', 'admin', 'N;', 'N;', '0', '', '0', '1_2017092901063965472.jpg', 'N;', '', '', '1', '', '1', '', '0', '1506618422', '0', '', '2499.00', '2699.00', '0.00', '92', '', '0', '0', '', '1', '0.00', '0', '0', '0', '', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '1', '', '0.00', '0.00', '0.00', '0', '0.00', '0.00', '0');
INSERT INTO `ds_goodscommon` VALUES ('94', 'honor/荣耀 荣耀V9 play全网通4G手机', '', '76', '1', '2', '76', '手机/ 运营商/ 智能数码 >手机通讯 >荣耀', '1', 'admin', 'N;', 'N;', '0', '', '0', '1_2017092901082884641.jpg', 'N;', '', '', '1', '', '1', '', '0', '1506618514', '0', '', '1099.00', '1200.00', '0.00', '91', '', '0', '0', '', '1', '0.00', '0', '0', '0', '', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '1', '', '0.00', '0.00', '0.00', '0', '0.00', '0.00', '0');
INSERT INTO `ds_goodscommon` VALUES ('95', 'OnePlus/一加 一加手机5 一加五 1加5手机 一加5星辰黑', '一加授权 官方直供 优惠低至官网', '77', '1', '2', '77', '手机/ 运营商/ 智能数码 >手机通讯 >一加', '1', 'admin', 'N;', 'N;', '0', '', '0', '1_2017092901111615092.jpg', 'N;', '', '', '1', '', '1', '', '0', '1506618679', '0', '', '2068.00', '2100.00', '0.00', '98', '', '0', '0', '', '1', '0.00', '0', '0', '0', '', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '1', '', '0.00', '0.00', '0.00', '0', '0.00', '0.00', '0');
INSERT INTO `ds_goodscommon` VALUES ('96', '超薄5.5寸移动电信全网通4G双曲屏学生智能指纹一体一加手机', '', '77', '1', '2', '77', '手机/ 运营商/ 智能数码 >手机通讯 >一加', '1', 'admin', 'N;', 'N;', '0', '', '0', '1_2017092901182073726.jpg', 'N;', '', '', '1', '', '1', '', '0', '1506619103', '0', '', '748.00', '820.00', '0.00', '91', '', '0', '0', '', '1', '0.00', '0', '0', '0', '', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '1', '', '0.40', '0.30', '0.10', '0', '0.00', '0.00', '1');
INSERT INTO `ds_goodscommon` VALUES ('107', '向往家庭背景音乐主机系统套装 wifi音响功放控制器 智能家居M8', '安卓系统 APP控制 7寸大屏', '73', '1', '3', '73', '手机/ 运营商/ 智能数码 >智能设备 >智能家居', '1', 'admin', 'N;', 'N;', '0', '', '0', '1_2017092901492561069.jpg', 'N;', '', '', '0', '', '1', '', '0', '1506620974', '0', '', '1999.00', '2400.00', '0.00', '83', '', '0', '0', '', '1', '0.00', '0', '0', '0', '', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '1', '', '0.00', '0.00', '0.00', '0', '0.00', '0.00', '0');
INSERT INTO `ds_goodscommon` VALUES ('108', '亚太天能阿里智能指纹锁家用防盗门锁 电子锁密码锁大门防盗锁V9', '家装焕新 阿里智能 全屋联网', '74', '1', '3', '74', '手机/ 运营商/ 智能数码 >智能设备 >智能门锁', '1', 'admin', 'N;', 'N;', '0', '', '0', '1_2017092901531025952.jpg', 'N;', '', '', '0', '', '1', '', '0', '1506621192', '0', '', '2599.00', '2699.00', '0.00', '96', '', '0', '0', '', '1', '0.00', '0', '0', '0', '', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '1', '', '0.00', '0.00', '0.00', '0', '0.00', '0.00', '0');
INSERT INTO `ds_goodscommon` VALUES ('109', 'mai小麦指纹锁家用防盗门智能门锁电子锁密码锁刷卡锁防盗锁正品', '锁芯5★防盗性能', '74', '1', '3', '74', '手机/ 运营商/ 智能数码 >智能设备 >智能门锁', '1', 'admin', 'N;', 'N;', '0', '', '0', '1_2017092901561798176.jpg', 'N;', '', '', '0', '', '1', '', '0', '1506621381', '0', '', '799.00', '1200.00', '0.00', '66', '', '0', '0', '', '1', '0.00', '0', '0', '0', '', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '1', '', '0.00', '0.00', '0.00', '0', '0.00', '0.00', '0');
INSERT INTO `ds_goodscommon` VALUES ('110', '欧瑞特智能手环运动计步器测心率血压手表小米多功能健康防水男女', '多模式血压手环！！', '71', '1', '3', '71', '手机/ 运营商/ 智能数码 >智能设备 >智能手环', '1', 'admin', 'N;', 'N;', '0', '', '0', '1_2017092901584247144.jpg', 'N;', '', '', '0', '', '1', '', '0', '1506621524', '0', '', '179.00', '189.00', '0.00', '94', '', '0', '0', '', '1', '0.00', '0', '0', '0', '', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '1', '', '0.00', '0.00', '0.00', '0', '0.00', '0.00', '0');
INSERT INTO `ds_goodscommon` VALUES ('111', '君米运动智能手环防水测血压心跳心率跑步小米手表多功能苹果男女', '深度防水游泳 超长待机180天 微信qq', '71', '1', '3', '71', '手机/ 运营商/ 智能数码 >智能设备 >智能手环', '1', 'admin', 'N;', 'N;', '0', '', '0', '1_2017092902070476170.jpg', 'N;', '', '', '0', '', '1', '', '0', '1506622029', '0', '', '258.00', '269.00', '0.00', '95', '', '0', '0', '', '1', '0.00', '0', '0', '0', '', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '1', '', '0.00', '0.00', '0.00', '0', '0.00', '0.00', '0');
INSERT INTO `ds_goodscommon` VALUES ('112', '拜斯特台式放大镜带LED灯10倍20倍老人阅读电子检验钟表手机维修', '台式 带LED灯 阅读维修', '68', '16', '68', '0', '鞋靴/ 箱包/ 钟表/ 珠宝 >钟表眼镜', '1', 'admin', 'N;', 'N;', '0', '', '1', '1_2017092902123493954.jpg', 'N;', '', '', '0', '', '1', '', '0', '1506622356', '0', '', '45.00', '69.00', '0.00', '65', '', '0', '0', '', '1', '0.00', '0', '0', '0', '', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '1', '', '0.00', '0.00', '0.00', '0', '0.00', '0.00', '0');
INSERT INTO `ds_goodscommon` VALUES ('113', '商务tr90近视眼镜男款超轻眼镜框半框潮商务近视镜眼镜架黑镜框男', '', '68', '16', '68', '0', '鞋靴/ 箱包/ 钟表/ 珠宝 >钟表眼镜', '1', 'admin', 'N;', 'N;', '0', '', '1', '1_2017092902135876412.jpg', 'N;', '', '', '0', '', '1', '', '0', '1506622587', '0', '', '75.00', '120.00', '0.00', '62', '', '0', '0', '', '1', '0.00', '0', '0', '0', '', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '1', '', '0.00', '0.00', '0.00', '0', '0.00', '0.00', '0');
INSERT INTO `ds_goodscommon` VALUES ('114', '景德镇陶瓷花瓶摆件客厅装饰品摆设中式家居新房装饰品酒柜摆件', '富贵吉祥蛋 向往美好 充满生活气息\r\n', '69', '16', '69', '0', '鞋靴/ 箱包/ 钟表/ 珠宝 >艺术品', '1', 'admin', 'N;', 'N;', '0', '', '1', '1_2017092902182426089.jpg', 'N;', '', '', '0', '', '1', '', '0', '1506622742', '0', '', '36.00', '54.00', '0.00', '66', '', '0', '0', '', '1', '0.00', '0', '0', '0', '', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '1', '', '0.00', '0.00', '0.00', '0', '0.00', '0.00', '0');
INSERT INTO `ds_goodscommon` VALUES ('115', '财富节节高电视柜酒柜客厅摆件装饰品竹子家居饰品工艺品招财摆设', '财富节节高 四季长青 象征财运旺盛', '69', '16', '69', '0', '鞋靴/ 箱包/ 钟表/ 珠宝 >艺术品', '1', 'admin', 'N;', 'N;', '0', '', '1', '1_2017092902201298747.jpg', 'N;', '', '', '0', '', '1', '', '0', '1506622814', '0', '', '79.00', '109.00', '0.00', '72', '', '0', '0', '', '1', '0.00', '0', '0', '0', '', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '1', '', '0.00', '0.00', '0.00', '0', '0.00', '0.00', '0');
INSERT INTO `ds_goodscommon` VALUES ('116', 'LAVER防脱育发液快速增发密发生新发液脂溢性脱发头发增长液男女', '认准国妆特字 告别脱发轻松密发买3送1', '64', '12', '64', '0', '个护化妆/ 纸品清洁/ 宠物 >洗发护发', '1', 'admin', 'N;', 'N;', '0', '', '1', '1_2017092902341762945.jpg', 'N;', '', '', '0', '', '1', '', '0', '1506623660', '0', '', '128.00', '144.00', '0.00', '88', '', '0', '0', '', '1', '0.00', '0', '0', '0', '', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '1', '', '0.00', '0.00', '0.00', '0', '0.00', '0.00', '0');
INSERT INTO `ds_goodscommon` VALUES ('117', '冲牙器便携式洗牙器家用电动口腔牙齿冲洗器牙龈牙缝清洁器洁牙器', '洁牙器 洗牙机 冲牙 洗牙 口腔清洁器', '63', '12', '63', '0', '个护化妆/ 纸品清洁/ 宠物 >口腔护理', '1', 'admin', 'N;', 'N;', '0', '', '1', '1_2017092902405679397.jpg', 'N;', '', '', '0', '', '1', '', '0', '1506624060', '0', '', '178.00', '210.00', '0.00', '84', '', '0', '0', '', '1', '0.00', '0', '0', '0', '', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '1', '', '0.00', '0.00', '0.00', '0', '0.00', '0.00', '0');
INSERT INTO `ds_goodscommon` VALUES ('118', '新西兰进口牛奶纽仕兰高钙低脂纯牛奶250ml*24盒*1箱', '新西兰进口 牧场直供 100%生牛乳', '231', '11', '60', '231', '食品/ 酒水/ 生鲜/ 特产 >饮料冲乳 >纯牛奶', '1', 'admin', 'N;', 'N;', '0', '', '0', '1_2017092902485560056.jpg', 'N;', '', '', '0', '', '1', '', '0', '1506624539', '0', '', '89.00', '120.00', '0.00', '74', '', '0', '0', '', '1', '0.00', '0', '0', '0', '', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '1', '', '0.00', '0.00', '0.00', '0', '0.00', '0.00', '0');

-- -----------------------------
-- Table structure for `ds_goodsfcode`
-- -----------------------------
DROP TABLE IF EXISTS `ds_goodsfcode`;
CREATE TABLE `ds_goodsfcode` (
  `goodsfcode_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'F码自增ID',
  `goods_commonid` int(10) unsigned NOT NULL COMMENT '商品公共ID',
  `goodsfcode_code` varchar(20) NOT NULL COMMENT 'F码内容',
  `goodsfcode_state` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '状态 0:未使用 1:已使用',
  PRIMARY KEY (`goodsfcode_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='商品F码';


-- -----------------------------
-- Table structure for `ds_goodsgift`
-- -----------------------------
DROP TABLE IF EXISTS `ds_goodsgift`;
CREATE TABLE `ds_goodsgift` (
  `gift_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '赠品ID',
  `gift_goodsid` int(10) unsigned NOT NULL COMMENT '赠品商品ID',
  `gift_goodsname` varchar(50) NOT NULL COMMENT '主商品名称',
  `gift_goodsimage` varchar(100) NOT NULL COMMENT '主商品图片',
  `gift_amount` tinyint(3) unsigned NOT NULL COMMENT '赠品数量',
  `goods_id` int(10) unsigned NOT NULL COMMENT '主商品ID',
  `goods_commonid` int(10) unsigned NOT NULL COMMENT '主商品公共ID',
  PRIMARY KEY (`gift_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='商品赠品表';


-- -----------------------------
-- Table structure for `ds_goodsimages`
-- -----------------------------
DROP TABLE IF EXISTS `ds_goodsimages`;
CREATE TABLE `ds_goodsimages` (
  `goodsimage_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '商品图片自增ID',
  `goods_commonid` int(10) unsigned NOT NULL COMMENT '商品公共ID',
  `store_id` int(10) unsigned NOT NULL COMMENT '店铺ID',
  `color_id` int(10) unsigned NOT NULL COMMENT '颜色规格值ID',
  `goodsimage_url` varchar(1000) NOT NULL COMMENT '商品图片',
  `goodsimage_sort` tinyint(3) unsigned NOT NULL COMMENT '商品图片排序',
  `goodsimage_isdefault` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '商品图片默认主图，1是，0否',
  PRIMARY KEY (`goodsimage_id`)
) ENGINE=InnoDB AUTO_INCREMENT=122 DEFAULT CHARSET=utf8 COMMENT='商品图片';

-- -----------------------------
-- Records of `ds_goodsimages`
-- -----------------------------
INSERT INTO `ds_goodsimages` VALUES ('1', '2', '1', '0', '1_2017092120144795113.jpg', '0', '1');
INSERT INTO `ds_goodsimages` VALUES ('2', '3', '1', '0', '1_2017092120244885492.jpg', '0', '1');
INSERT INTO `ds_goodsimages` VALUES ('3', '4', '1', '0', '1_2017092120312320763.jpg', '0', '1');
INSERT INTO `ds_goodsimages` VALUES ('4', '5', '1', '0', '1_2017092120345719915.jpg', '0', '1');
INSERT INTO `ds_goodsimages` VALUES ('5', '6', '1', '0', '1_2017092120365848023.jpg', '0', '1');
INSERT INTO `ds_goodsimages` VALUES ('6', '7', '1', '0', '1_2017092120382376796.jpg', '0', '1');
INSERT INTO `ds_goodsimages` VALUES ('7', '8', '1', '0', '1_2017092120445748551.jpg', '0', '1');
INSERT INTO `ds_goodsimages` VALUES ('8', '9', '1', '0', '1_2017092120480147477.jpg', '0', '1');
INSERT INTO `ds_goodsimages` VALUES ('9', '10', '1', '0', '1_2017092120493430154.jpg', '0', '1');
INSERT INTO `ds_goodsimages` VALUES ('10', '11', '1', '0', '1_2017092120564717575.jpg', '0', '1');
INSERT INTO `ds_goodsimages` VALUES ('11', '12', '1', '0', '1_2017092121050988491.jpg', '0', '1');
INSERT INTO `ds_goodsimages` VALUES ('12', '13', '1', '0', '1_2017092121142556524.jpg', '0', '1');
INSERT INTO `ds_goodsimages` VALUES ('13', '14', '1', '0', '1_2017092121225164684.jpg', '0', '1');
INSERT INTO `ds_goodsimages` VALUES ('14', '15', '1', '0', '1_2017092121260662503.jpg', '0', '1');
INSERT INTO `ds_goodsimages` VALUES ('15', '16', '1', '0', '1_2017092121492327671.jpg', '0', '1');
INSERT INTO `ds_goodsimages` VALUES ('16', '17', '1', '0', '1_2017092121542617701.jpg', '0', '1');
INSERT INTO `ds_goodsimages` VALUES ('17', '18', '1', '0', '1_2017092121564484910.jpg', '0', '1');
INSERT INTO `ds_goodsimages` VALUES ('18', '19', '1', '0', '1_2017092122005521920.jpg', '0', '1');
INSERT INTO `ds_goodsimages` VALUES ('19', '20', '1', '0', '1_2017092122035543274.jpg', '0', '1');
INSERT INTO `ds_goodsimages` VALUES ('20', '21', '1', '0', '1_2017092123585272874.jpg', '0', '1');
INSERT INTO `ds_goodsimages` VALUES ('21', '22', '1', '0', '1_2017092200403659812.jpg', '0', '1');
INSERT INTO `ds_goodsimages` VALUES ('22', '23', '1', '0', '1_2017092201034951336.jpg', '0', '1');
INSERT INTO `ds_goodsimages` VALUES ('23', '24', '1', '0', '1_2017092201084565859.jpg', '0', '1');
INSERT INTO `ds_goodsimages` VALUES ('24', '25', '1', '0', '1_2017092201381015306.jpg', '0', '1');
INSERT INTO `ds_goodsimages` VALUES ('25', '26', '1', '0', '1_2017092201461861948.jpg', '0', '1');
INSERT INTO `ds_goodsimages` VALUES ('26', '27', '1', '0', '1_2017092201523177266.jpg', '0', '1');
INSERT INTO `ds_goodsimages` VALUES ('27', '28', '1', '0', '1_2017092202022516767.jpg', '0', '1');
INSERT INTO `ds_goodsimages` VALUES ('28', '29', '1', '0', '1_2017092202082283957.jpg', '0', '1');
INSERT INTO `ds_goodsimages` VALUES ('29', '30', '1', '0', '1_2017092202112937358.jpg', '0', '1');
INSERT INTO `ds_goodsimages` VALUES ('30', '31', '1', '0', '1_2017092202162519571.jpg', '0', '1');
INSERT INTO `ds_goodsimages` VALUES ('31', '32', '1', '0', '1_2017092202215519250.jpg', '0', '1');
INSERT INTO `ds_goodsimages` VALUES ('32', '33', '1', '0', '1_2017092202310929808.jpg', '0', '1');
INSERT INTO `ds_goodsimages` VALUES ('33', '34', '1', '0', '1_2017092202323192694.jpg', '0', '1');
INSERT INTO `ds_goodsimages` VALUES ('34', '36', '1', '0', '1_2017092202350299027.jpg', '0', '1');
INSERT INTO `ds_goodsimages` VALUES ('35', '37', '1', '1', '1_2017092202382291274.jpg', '0', '1');
INSERT INTO `ds_goodsimages` VALUES ('36', '39', '1', '0', '1_2017092202443553519.jpg', '0', '1');
INSERT INTO `ds_goodsimages` VALUES ('37', '40', '1', '42', '1_2017092202461115940.jpg', '0', '1');
INSERT INTO `ds_goodsimages` VALUES ('38', '41', '1', '1', '1_2017092202492958131.jpg', '0', '1');
INSERT INTO `ds_goodsimages` VALUES ('39', '42', '1', '49', '1_2017092202514891485.jpg', '0', '1');
INSERT INTO `ds_goodsimages` VALUES ('40', '43', '1', '0', '1_2017092202553367071.jpg', '0', '1');
INSERT INTO `ds_goodsimages` VALUES ('41', '44', '1', '0', '1_2017092202585843151.jpg', '0', '1');
INSERT INTO `ds_goodsimages` VALUES ('42', '45', '1', '1', '1_2017092203045216863.jpg', '0', '1');
INSERT INTO `ds_goodsimages` VALUES ('43', '46', '1', '0', '1_2017092203062937149.jpg', '0', '1');
INSERT INTO `ds_goodsimages` VALUES ('44', '47', '1', '0', '1_2017092203083967214.jpg', '0', '1');
INSERT INTO `ds_goodsimages` VALUES ('45', '47', '1', '0', '1_2017092203072292427.jpg', '0', '0');
INSERT INTO `ds_goodsimages` VALUES ('47', '48', '1', '0', '1_2017092203123417256.jpg', '0', '1');
INSERT INTO `ds_goodsimages` VALUES ('48', '49', '1', '0', '1_2017092203151752294.jpg', '0', '1');
INSERT INTO `ds_goodsimages` VALUES ('49', '50', '1', '0', '1_2017092203175020843.jpg', '0', '1');
INSERT INTO `ds_goodsimages` VALUES ('50', '51', '1', '0', '1_2017092203201884569.jpg', '0', '1');
INSERT INTO `ds_goodsimages` VALUES ('51', '52', '1', '0', '1_2017092203242754461.jpg', '0', '1');
INSERT INTO `ds_goodsimages` VALUES ('52', '53', '1', '0', '1_2017092203261873185.jpg', '0', '1');
INSERT INTO `ds_goodsimages` VALUES ('53', '54', '1', '0', '1_2017092203275599920.jpg', '0', '1');
INSERT INTO `ds_goodsimages` VALUES ('54', '55', '1', '0', '1_2017092203294765362.jpg', '0', '1');
INSERT INTO `ds_goodsimages` VALUES ('55', '56', '1', '0', '1_2017092203321969628.jpg', '0', '1');
INSERT INTO `ds_goodsimages` VALUES ('56', '57', '1', '0', '1_2017092203335981358.jpg', '0', '1');
INSERT INTO `ds_goodsimages` VALUES ('57', '58', '1', '0', '1_2017092203371485168.jpg', '0', '1');
INSERT INTO `ds_goodsimages` VALUES ('58', '59', '1', '0', '1_2017092821352360295.jpg', '0', '1');
INSERT INTO `ds_goodsimages` VALUES ('59', '60', '1', '0', '1_2017092821383373641.jpg', '0', '1');
INSERT INTO `ds_goodsimages` VALUES ('60', '61', '1', '0', '1_2017092821403589442.jpg', '0', '1');
INSERT INTO `ds_goodsimages` VALUES ('61', '62', '1', '0', '1_2017092821431519588.jpg', '0', '1');
INSERT INTO `ds_goodsimages` VALUES ('62', '63', '1', '0', '1_2017092821510935694.jpg', '0', '1');
INSERT INTO `ds_goodsimages` VALUES ('63', '64', '1', '0', '1_2017092821530372212.jpg', '0', '1');
INSERT INTO `ds_goodsimages` VALUES ('64', '65', '1', '0', '1_2017092821544898610.jpg', '0', '1');
INSERT INTO `ds_goodsimages` VALUES ('65', '66', '1', '1', '1_2017092821585013652.jpg', '0', '1');
INSERT INTO `ds_goodsimages` VALUES ('66', '67', '1', '0', '1_2017092822032535526.jpg', '0', '1');
INSERT INTO `ds_goodsimages` VALUES ('67', '68', '1', '0', '1_2017092822050083427.jpg', '0', '1');
INSERT INTO `ds_goodsimages` VALUES ('69', '70', '1', '0', '1_2017092823485490716.jpg', '0', '1');
INSERT INTO `ds_goodsimages` VALUES ('70', '71', '1', '0', '1_2017092823501155931.jpg', '0', '1');
INSERT INTO `ds_goodsimages` VALUES ('71', '72', '1', '0', '1_2017092823531033711.jpg', '0', '1');
INSERT INTO `ds_goodsimages` VALUES ('72', '73', '1', '0', '1_2017092900001256656.jpg', '0', '1');
INSERT INTO `ds_goodsimages` VALUES ('73', '74', '1', '0', '1_2017092900022214210.jpg', '0', '1');
INSERT INTO `ds_goodsimages` VALUES ('74', '75', '1', '0', '1_2017092900033832502.jpg', '0', '1');
INSERT INTO `ds_goodsimages` VALUES ('75', '76', '1', '0', '1_2017092900052977159.jpg', '0', '1');
INSERT INTO `ds_goodsimages` VALUES ('76', '77', '1', '0', '1_2017092900064438234.jpg', '0', '1');
INSERT INTO `ds_goodsimages` VALUES ('77', '78', '1', '0', '1_2017092900081355788.jpg', '0', '1');
INSERT INTO `ds_goodsimages` VALUES ('78', '79', '1', '0', '1_2017092900095941942.jpg', '0', '1');
INSERT INTO `ds_goodsimages` VALUES ('79', '80', '1', '0', '1_2017092900115721538.jpg', '0', '1');
INSERT INTO `ds_goodsimages` VALUES ('80', '81', '1', '0', '1_2017092900132832208.jpg', '0', '1');
INSERT INTO `ds_goodsimages` VALUES ('81', '82', '1', '0', '1_2017092900144267524.jpg', '0', '1');
INSERT INTO `ds_goodsimages` VALUES ('82', '83', '1', '0', '1_2017092900175249561.jpg', '0', '1');
INSERT INTO `ds_goodsimages` VALUES ('83', '84', '1', '0', '1_2017092900220838539.jpg', '0', '1');
INSERT INTO `ds_goodsimages` VALUES ('84', '85', '1', '0', '1_2017092900242419538.jpg', '0', '1');
INSERT INTO `ds_goodsimages` VALUES ('85', '86', '1', '0', '1_2017092900261952044.jpg', '0', '1');
INSERT INTO `ds_goodsimages` VALUES ('86', '87', '1', '15', '1_2017092900363278117.jpg', '0', '1');
INSERT INTO `ds_goodsimages` VALUES ('87', '87', '1', '16', '1_2017092900363278117.jpg', '0', '1');
INSERT INTO `ds_goodsimages` VALUES ('89', '88', '1', '15', '1_2017092900412680293.jpg', '0', '1');
INSERT INTO `ds_goodsimages` VALUES ('90', '88', '1', '16', '1_2017092900412680293.jpg', '0', '1');
INSERT INTO `ds_goodsimages` VALUES ('92', '89', '1', '0', '1_2017092900450210134.jpg', '0', '1');
INSERT INTO `ds_goodsimages` VALUES ('93', '90', '1', '0', '1_2017092900501117171.jpg', '0', '1');
INSERT INTO `ds_goodsimages` VALUES ('94', '91', '1', '0', '1_2017092900544928056.jpg', '0', '1');
INSERT INTO `ds_goodsimages` VALUES ('95', '92', '1', '1', '1_2017092901044975398.jpg', '0', '1');
INSERT INTO `ds_goodsimages` VALUES ('96', '93', '1', '0', '1_2017092901063965472.jpg', '0', '1');
INSERT INTO `ds_goodsimages` VALUES ('97', '94', '1', '0', '1_2017092901082884641.jpg', '0', '1');
INSERT INTO `ds_goodsimages` VALUES ('98', '95', '1', '0', '1_2017092901111615092.jpg', '0', '1');
INSERT INTO `ds_goodsimages` VALUES ('99', '96', '1', '0', '1_2017092901182073726.jpg', '0', '1');
INSERT INTO `ds_goodsimages` VALUES ('110', '107', '1', '0', '1_2017092901492561069.jpg', '0', '1');
INSERT INTO `ds_goodsimages` VALUES ('111', '108', '1', '0', '1_2017092901531025952.jpg', '0', '1');
INSERT INTO `ds_goodsimages` VALUES ('112', '109', '1', '0', '1_2017092901561798176.jpg', '0', '1');
INSERT INTO `ds_goodsimages` VALUES ('113', '110', '1', '0', '1_2017092901584247144.jpg', '0', '1');
INSERT INTO `ds_goodsimages` VALUES ('114', '111', '1', '0', '1_2017092902070476170.jpg', '0', '1');
INSERT INTO `ds_goodsimages` VALUES ('115', '112', '1', '0', '1_2017092902123493954.jpg', '0', '1');
INSERT INTO `ds_goodsimages` VALUES ('116', '113', '1', '0', '1_2017092902135876412.jpg', '0', '1');
INSERT INTO `ds_goodsimages` VALUES ('117', '114', '1', '0', '1_2017092902182426089.jpg', '0', '1');
INSERT INTO `ds_goodsimages` VALUES ('118', '115', '1', '0', '1_2017092902201298747.jpg', '0', '1');
INSERT INTO `ds_goodsimages` VALUES ('119', '116', '1', '0', '1_2017092902341762945.jpg', '0', '1');
INSERT INTO `ds_goodsimages` VALUES ('120', '117', '1', '0', '1_2017092902405679397.jpg', '0', '1');
INSERT INTO `ds_goodsimages` VALUES ('121', '118', '1', '0', '1_2017092902485560056.jpg', '0', '1');

-- -----------------------------
-- Table structure for `ds_groupbuy`
-- -----------------------------
DROP TABLE IF EXISTS `ds_groupbuy`;
CREATE TABLE `ds_groupbuy` (
  `groupbuy_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '抢购自增ID',
  `groupbuy_name` varchar(255) NOT NULL COMMENT '抢购活动名称',
  `groupbuy_starttime` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '抢购开始时间',
  `groupbuy_endtime` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '抢购结束时间',
  `goods_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '商品ID',
  `goods_commonid` int(10) unsigned NOT NULL COMMENT '商品公共表ID',
  `goods_name` varchar(200) NOT NULL COMMENT '商品名称',
  `store_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '店铺ID',
  `store_name` varchar(50) NOT NULL COMMENT '店铺名称',
  `goods_price` decimal(10,2) NOT NULL COMMENT '商品原价',
  `groupbuy_price` decimal(10,2) NOT NULL COMMENT '抢购价格',
  `groupbuy_rebate` decimal(10,2) NOT NULL COMMENT '折扣',
  `virtual_quantity` int(10) unsigned NOT NULL COMMENT '虚拟购买数量',
  `groupbuy_upper_limit` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '购买上限',
  `groupbuy_buyer_count` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '已购买人数',
  `groupbuy_buy_quantity` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '购买数量',
  `groupbuy_intro` text COMMENT '本团介绍',
  `groupbuy_state` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '抢购状态 10-审核中 20-正常 30-审核失败 31-管理员关闭 32-已结束',
  `groupbuy_recommended` tinyint(1) unsigned NOT NULL COMMENT '是否推荐 0.未推荐 1.已推荐',
  `groupbuy_views` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '查看次数',
  `gclass_id` int(10) unsigned NOT NULL COMMENT '抢购类别编号',
  `s_gclass_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '抢购2级分类id',
  `groupbuy_image` varchar(100) NOT NULL COMMENT '抢购图片',
  `groupbuy_image1` varchar(100) DEFAULT NULL COMMENT '抢购图片1',
  `groupbuy_remark` varchar(255) NOT NULL COMMENT '备注',
  `groupbuy_is_vr` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '是否虚拟抢购 1是0否',
  `vr_class_id` int(11) DEFAULT NULL COMMENT '虚拟抢购大分类id',
  `vr_s_class_id` int(11) DEFAULT NULL COMMENT '虚拟抢购小分类id',
  PRIMARY KEY (`groupbuy_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='抢购商品表';


-- -----------------------------
-- Table structure for `ds_groupbuyclass`
-- -----------------------------
DROP TABLE IF EXISTS `ds_groupbuyclass`;
CREATE TABLE `ds_groupbuyclass` (
  `gclass_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '抢购类别自增ID',
  `gclass_name` varchar(20) NOT NULL COMMENT '抢购类别名称',
  `gclass_parent_id` int(10) unsigned NOT NULL COMMENT '抢购上级类别ID',
  `gclass_sort` tinyint(1) unsigned NOT NULL COMMENT '抢购类别排序',
  `gclass_deep` tinyint(1) unsigned DEFAULT NULL COMMENT '抢购类别深度',
  PRIMARY KEY (`gclass_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='抢购类别表';


-- -----------------------------
-- Table structure for `ds_groupbuypricerange`
-- -----------------------------
DROP TABLE IF EXISTS `ds_groupbuypricerange`;
CREATE TABLE `ds_groupbuypricerange` (
  `gprange_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '抢购价格区间ID',
  `gprange_name` varchar(20) NOT NULL COMMENT '抢购价格区间名称',
  `gprange_start` int(10) unsigned NOT NULL COMMENT '抢购价格区间下限',
  `gprange_end` int(10) unsigned NOT NULL COMMENT '抢购价格区间上限',
  PRIMARY KEY (`gprange_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='抢购价格区间表';


-- -----------------------------
-- Table structure for `ds_groupbuyquota`
-- -----------------------------
DROP TABLE IF EXISTS `ds_groupbuyquota`;
CREATE TABLE `ds_groupbuyquota` (
  `groupbuyquota_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '抢购套餐ID',
  `member_id` int(10) unsigned NOT NULL COMMENT '用户编号',
  `store_id` int(10) unsigned NOT NULL COMMENT '店铺编号',
  `member_name` varchar(50) NOT NULL COMMENT '用户名',
  `store_name` varchar(50) NOT NULL COMMENT '店铺名称',
  `groupbuyquota_starttime` int(10) unsigned NOT NULL COMMENT '抢购套餐开始时间',
  `groupbuyquota_endtime` int(10) unsigned NOT NULL COMMENT '抢购套餐结束时间',
  PRIMARY KEY (`groupbuyquota_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='抢购套餐表';


-- -----------------------------
-- Table structure for `ds_help`
-- -----------------------------
DROP TABLE IF EXISTS `ds_help`;
CREATE TABLE `ds_help` (
  `help_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '帮助自增ID',
  `help_sort` tinyint(1) unsigned DEFAULT '255' COMMENT '帮助排序',
  `help_title` varchar(100) NOT NULL COMMENT '帮助标题',
  `help_info` text COMMENT '帮助内容',
  `help_url` varchar(100) DEFAULT '' COMMENT '帮助跳转链接',
  `help_updatetime` int(10) unsigned NOT NULL COMMENT '帮助更新时间',
  `helptype_id` int(10) unsigned NOT NULL COMMENT '帮助类型',
  `page_show` tinyint(1) unsigned DEFAULT '1' COMMENT '页面类型 1:店铺 2:会员',
  PRIMARY KEY (`help_id`)
) ENGINE=InnoDB AUTO_INCREMENT=111 DEFAULT CHARSET=utf8 COMMENT='帮助内容表';

-- -----------------------------
-- Records of `ds_help`
-- -----------------------------
INSERT INTO `ds_help` VALUES ('96', '1', '招商方向', '后台->店铺->开店首页->入驻指南->编辑内容', '', '1399284217', '1', '1');
INSERT INTO `ds_help` VALUES ('97', '2', '招商标准', '后台->店铺->开店首页->入驻指南->编辑内容', '', '1399281053', '1', '1');
INSERT INTO `ds_help` VALUES ('98', '3', '资质要求', '后台->店铺->开店首页->入驻指南->编辑内容', '', '1399282350', '1', '1');
INSERT INTO `ds_help` VALUES ('99', '4', '资费标准', '后台->店铺->开店首页->入驻指南->编辑内容', '', '1399282379', '1', '1');
INSERT INTO `ds_help` VALUES ('101', '155', '签署入驻协议', '签署入驻协议(后台->店铺->店铺帮助->帮助内容->编辑内容)', '', '1392949932', '99', '1');
INSERT INTO `ds_help` VALUES ('102', '156', '商家信息提交', '商家信息提交(后台->店铺->店铺帮助->帮助内容->编辑内容)', '', '1392949961', '99', '1');
INSERT INTO `ds_help` VALUES ('103', '157', '平台审核资质', '平台审核资质(后台->店铺->店铺帮助->帮助内容->编辑内容)', '', '1392949991', '99', '1');
INSERT INTO `ds_help` VALUES ('104', '158', '商家缴纳费用', '商家缴纳费用(后台->店铺->店铺帮助->帮助内容->编辑内容)', '', '1392950031', '99', '1');
INSERT INTO `ds_help` VALUES ('105', '159', '店铺开通', '店铺开通(后台->店铺->店铺帮助->帮助内容->编辑内容)', '', '1392950076', '99', '1');
INSERT INTO `ds_help` VALUES ('106', '255', '商品发布规则', '商品发布规则(后台->店铺->店铺帮助->帮助内容->编辑内容)', '', '1392950396', '91', '1');
INSERT INTO `ds_help` VALUES ('107', '255', '商品规格及属性', '商品规格及属性(后台->店铺->店铺帮助->帮助内容->编辑内容)', '', '1392950481', '92', '1');
INSERT INTO `ds_help` VALUES ('108', '255', '限时折扣说明', '限时折扣说明(后台->店铺->店铺帮助->帮助内容->编辑内容)', '', '1392950523', '93', '1');
INSERT INTO `ds_help` VALUES ('109', '255', '订单商品退款', '订单商品退款(后台->店铺->店铺帮助->帮助内容->编辑内容)', '', '1392950670', '94', '1');
INSERT INTO `ds_help` VALUES ('110', '255', '续约流程及费用', '续约流程及费用(后台->店铺->店铺帮助->帮助内容->编辑内容)', '', '1392950739', '95', '1');

-- -----------------------------
-- Table structure for `ds_helptype`
-- -----------------------------
DROP TABLE IF EXISTS `ds_helptype`;
CREATE TABLE `ds_helptype` (
  `helptype_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '帮助类型自增ID',
  `helptype_name` varchar(50) NOT NULL COMMENT '帮助类型名称',
  `helptype_sort` tinyint(1) unsigned DEFAULT '255' COMMENT '帮助类型',
  `helptype_code` varchar(10) DEFAULT 'auto' COMMENT '调用编号(auto的可删除)',
  `helptype_show` tinyint(1) unsigned DEFAULT '1' COMMENT '帮助类型是否显示 0:否 1:是',
  `page_show` tinyint(1) unsigned DEFAULT '1' COMMENT '页面类型:1:店铺 2:会员',
  PRIMARY KEY (`helptype_id`)
) ENGINE=InnoDB AUTO_INCREMENT=100 DEFAULT CHARSET=utf8 COMMENT='帮助类型表';

-- -----------------------------
-- Records of `ds_helptype`
-- -----------------------------
INSERT INTO `ds_helptype` VALUES ('91', '规则体系', '91', 'sys_rules', '1', '1');
INSERT INTO `ds_helptype` VALUES ('92', '商品管理', '92', 'sys_goods', '1', '1');
INSERT INTO `ds_helptype` VALUES ('93', '促销方式', '93', 'sys_sales', '1', '1');
INSERT INTO `ds_helptype` VALUES ('94', '订单及售后', '94', 'sys_order', '1', '1');
INSERT INTO `ds_helptype` VALUES ('95', '店铺续约', '95', 'sys_renew', '1', '1');
INSERT INTO `ds_helptype` VALUES ('99', '入驻流程', '99', 'store_in', '1', '1');

-- -----------------------------
-- Table structure for `ds_inform`
-- -----------------------------
DROP TABLE IF EXISTS `ds_inform`;
CREATE TABLE `ds_inform` (
  `inform_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '举报自增ID',
  `inform_member_id` int(11) NOT NULL COMMENT '举报人ID',
  `inform_member_name` varchar(50) NOT NULL COMMENT '举报人会员名',
  `inform_goods_id` int(11) NOT NULL COMMENT '被举报的商品ID',
  `inform_goods_name` varchar(100) NOT NULL COMMENT '被举报的商品名称',
  `informsubject_id` int(11) NOT NULL COMMENT '举报主题ID',
  `informsubject_content` varchar(50) NOT NULL COMMENT '举报主题',
  `inform_content` varchar(100) NOT NULL COMMENT '举报信息',
  `inform_pic1` varchar(100) NOT NULL COMMENT '图片1',
  `inform_pic2` varchar(100) NOT NULL COMMENT '图片2',
  `inform_pic3` varchar(100) NOT NULL COMMENT '图片3',
  `inform_datetime` int(11) NOT NULL COMMENT '举报时间',
  `inform_store_id` int(11) NOT NULL COMMENT '被举报商品的店铺ID',
  `inform_state` tinyint(4) NOT NULL COMMENT '举报状态(1未处理/2已处理)',
  `inform_handle_type` tinyint(4) DEFAULT NULL COMMENT '举报处理结果(1无效举报/2恶意举报/3有效举报)',
  `inform_handle_message` varchar(100) NOT NULL COMMENT '举报处理信息',
  `inform_handle_datetime` int(11) NOT NULL DEFAULT '0' COMMENT '举报处理时间',
  `inform_handle_member_id` int(11) NOT NULL DEFAULT '0' COMMENT '管理员ID',
  `inform_goods_image` varchar(150) DEFAULT NULL COMMENT '商品图',
  `inform_store_name` varchar(100) DEFAULT NULL COMMENT '店铺名',
  PRIMARY KEY (`inform_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='举报表';


-- -----------------------------
-- Table structure for `ds_informsubject`
-- -----------------------------
DROP TABLE IF EXISTS `ds_informsubject`;
CREATE TABLE `ds_informsubject` (
  `informsubject_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '举报主题自增ID',
  `informsubject_content` varchar(100) NOT NULL COMMENT '举报主题内容',
  `informsubject_type_id` int(11) NOT NULL COMMENT '举报类型ID',
  `informsubject_type_name` varchar(50) NOT NULL COMMENT '举报类型名称 ',
  `informsubject_state` tinyint(11) NOT NULL COMMENT '举报主题状态 1:可用 2:失效',
  PRIMARY KEY (`informsubject_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COMMENT='举报主题表';

-- -----------------------------
-- Records of `ds_informsubject`
-- -----------------------------
INSERT INTO `ds_informsubject` VALUES ('1', '管制刀具、弓弩类、其他武器等', '1', '出售禁售品', '1');
INSERT INTO `ds_informsubject` VALUES ('2', '赌博用具类', '1', '出售禁售品', '1');
INSERT INTO `ds_informsubject` VALUES ('3', '枪支弹药', '1', '出售禁售品', '1');
INSERT INTO `ds_informsubject` VALUES ('4', '毒品及吸毒工具', '1', '出售禁售品', '1');
INSERT INTO `ds_informsubject` VALUES ('5', '色差大，质量差。', '2', '产品质量问题', '1');

-- -----------------------------
-- Table structure for `ds_informsubjecttype`
-- -----------------------------
DROP TABLE IF EXISTS `ds_informsubjecttype`;
CREATE TABLE `ds_informsubjecttype` (
  `informtype_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '举报类型自增ID',
  `informtype_name` varchar(50) NOT NULL COMMENT '举报类型名称 ',
  `informtype_desc` varchar(100) NOT NULL COMMENT '举报类型描述',
  `informtype_state` tinyint(4) NOT NULL COMMENT '举报类型状态 1:有效 2:失效',
  PRIMARY KEY (`informtype_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COMMENT='举报类型表';

-- -----------------------------
-- Records of `ds_informsubjecttype`
-- -----------------------------
INSERT INTO `ds_informsubjecttype` VALUES ('1', '出售禁售品', '销售商城禁止和限制交易规则下所规定的所有商品。', '1');
INSERT INTO `ds_informsubjecttype` VALUES ('2', '产品质量问题', '产品质量差，与描述严重不相符。', '1');

-- -----------------------------
-- Table structure for `ds_inviter`
-- -----------------------------
DROP TABLE IF EXISTS `ds_inviter`;
CREATE TABLE `ds_inviter` (
  `inviter_id` int(10) unsigned NOT NULL COMMENT '推广员id即会员id',
  `inviter_state` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '推广员状态（0审核中1已审核2已清退）',
  `inviter_total_amount` decimal(10,2) unsigned NOT NULL DEFAULT '0.00' COMMENT '总共结算的佣金 ',
  `inviter_1_quantity` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '1级成员数量',
  `inviter_2_quantity` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '2级成员数量',
  `inviter_3_quantity` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '3级成员数量',
  `inviter_applytime` int(10) unsigned NOT NULL COMMENT '申请时间',
  `inviter_goods_quantity` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '总共分销的商品件数',
  `inviter_goods_amount` decimal(10,0) unsigned NOT NULL DEFAULT '0' COMMENT '总共分销的商品金额',
  PRIMARY KEY (`inviter_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='推广员表';

-- -----------------------------
-- Records of `ds_inviter`
-- -----------------------------
INSERT INTO `ds_inviter` VALUES ('2', '1', '0.00', '0', '0', '0', '1543550739', '0', '0');
INSERT INTO `ds_inviter` VALUES ('3', '1', '0.00', '0', '0', '0', '1543563819', '0', '0');

-- -----------------------------
-- Table structure for `ds_inviterclass`
-- -----------------------------
DROP TABLE IF EXISTS `ds_inviterclass`;
CREATE TABLE `ds_inviterclass` (
  `inviterclass_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '推广员等级id',
  `inviterclass_name` varchar(60) NOT NULL COMMENT '等级名',
  `inviterclass_amount` decimal(10,2) NOT NULL COMMENT '等级门槛',
  PRIMARY KEY (`inviterclass_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='推广等级表';


-- -----------------------------
-- Table structure for `ds_invoice`
-- -----------------------------
DROP TABLE IF EXISTS `ds_invoice`;
CREATE TABLE `ds_invoice` (
  `invoice_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '发票信息ID',
  `member_id` int(10) unsigned NOT NULL COMMENT '会员ID',
  `invoice_state` enum('1','2') DEFAULT NULL COMMENT '发票类型 1:普通发票 2:增值税发票',
  `invoice_title` varchar(50) DEFAULT '' COMMENT '发票抬头[普通发票]',
  `invoice_code` varchar(50) DEFAULT '' COMMENT '纳税人识别号[普通发票]',
  `invoice_content` varchar(10) DEFAULT '' COMMENT '发票内容[普通发票]',
  `invoice_company` varchar(50) DEFAULT '' COMMENT '单位名称',
  `invoice_company_code` varchar(50) DEFAULT '' COMMENT '纳税人识别号',
  `invoice_reg_addr` varchar(50) DEFAULT '' COMMENT '注册地址',
  `invoice_reg_phone` varchar(30) DEFAULT '' COMMENT '注册电话',
  `invoice_reg_bname` varchar(30) DEFAULT '' COMMENT '开户银行',
  `invoice_reg_baccount` varchar(30) DEFAULT '' COMMENT '银行帐户',
  `invoice_rec_name` varchar(20) DEFAULT '' COMMENT '收票人姓名',
  `invoice_rec_mobphone` varchar(15) DEFAULT '' COMMENT '收票人手机号',
  `invoice_rec_province` varchar(30) DEFAULT '' COMMENT '收票人省份',
  `invoice_goto_addr` varchar(50) DEFAULT '' COMMENT '送票地址',
  PRIMARY KEY (`invoice_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='买家发票信息表';


-- -----------------------------
-- Table structure for `ds_link`
-- -----------------------------
DROP TABLE IF EXISTS `ds_link`;
CREATE TABLE `ds_link` (
  `link_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '友情链接自增ID',
  `link_title` varchar(100) DEFAULT NULL COMMENT '友情链接标题',
  `link_url` varchar(100) DEFAULT NULL COMMENT '友情链接地址',
  `link_pic` varchar(100) DEFAULT NULL COMMENT '友情链接图片',
  `link_sort` tinyint(3) unsigned NOT NULL DEFAULT '255' COMMENT '友情链接排序',
  PRIMARY KEY (`link_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='友情链接';


-- -----------------------------
-- Table structure for `ds_mailcron`
-- -----------------------------
DROP TABLE IF EXISTS `ds_mailcron`;
CREATE TABLE `ds_mailcron` (
  `mailcron_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '消息任务计划自增ID',
  `mailcron_address` varchar(100) NOT NULL COMMENT '邮箱地址',
  `mailcron_subject` varchar(255) NOT NULL COMMENT '邮件标题',
  `mailcron_contnet` text NOT NULL COMMENT '邮件内容',
  PRIMARY KEY (`mailcron_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='邮件任务计划表';


-- -----------------------------
-- Table structure for `ds_mailmsgtemlates`
-- -----------------------------
DROP TABLE IF EXISTS `ds_mailmsgtemlates`;
CREATE TABLE `ds_mailmsgtemlates` (
  `mailmt_name` varchar(100) NOT NULL COMMENT '模板名称',
  `mailmt_title` varchar(100) DEFAULT NULL COMMENT '模板标题',
  `mailmt_code` varchar(30) NOT NULL COMMENT '模板调用代码',
  `mailmt_content` text NOT NULL COMMENT '模板内容',
  PRIMARY KEY (`mailmt_code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='邮件模板表';

-- -----------------------------
-- Records of `ds_mailmsgtemlates`
-- -----------------------------
INSERT INTO `ds_mailmsgtemlates` VALUES ('<strong>[用户]</strong>身份验证通知', '账户安全认证 - {$site_name}', 'authenticate', '【{$site_name}】您于{$send_time}提交账户安全验证，验证码是：{$verify_code}。');
INSERT INTO `ds_mailmsgtemlates` VALUES ('<strong>[用户]</strong>邮箱验证通知', '邮箱验证通知 - {$site_name}', 'bind_email', '<p>您好！</p>\r\n<p>请在24小时内点击以下链接完成邮箱验证</p>\r\n<p><a href=\"{$verify_url}\" target=\"_blank\">马上验证</a></p>\r\n<p>如果您不能点击上面链接，还可以将以下链接复制到浏览器地址栏中访问</p>\r\n<p>{$verify_url}</p>');
INSERT INTO `ds_mailmsgtemlates` VALUES ('<strong>[用户]</strong>手机验证通知', '手机验证通知 - {$site_name}', 'modify_mobile', '【{$site_name}】您于{$send_time}绑定手机号，验证码是：{$verify_code}。');
INSERT INTO `ds_mailmsgtemlates` VALUES ('<strong>[用户]</strong>重置密码通知', '重置密码通知 - {$site_name}', 'reset_pwd', '<p>您好！</p>\r\n<p>您刚才在{$site_name}重置了密码，新密码为：{$new_password}。</p>\r\n<p>请尽快登录 <a href=\"{$site_url}\" target=\"_blank\">{$site_url}</a> 修改密码。</p>');
INSERT INTO `ds_mailmsgtemlates` VALUES ('<strong>[用户]</strong>自提通知', '用户自提通知 - {$site_name}', 'send_pickup_code', '【{$site_name}】您的订单已到达自提点，请上门取货！提货时请提供手机号/订单号/运单号及提货码：{$pickup_code}。');
INSERT INTO `ds_mailmsgtemlates` VALUES ('<strong>[用户]</strong>虚拟兑换码通知', '虚拟兑换码通知 - {$site_name}', 'send_vr_code', '【{$site_name}】您的虚拟兑换码是：{$vr_code}。');

-- -----------------------------
-- Table structure for `ds_mallconsult`
-- -----------------------------
DROP TABLE IF EXISTS `ds_mallconsult`;
CREATE TABLE `ds_mallconsult` (
  `mallconsult_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '平台客服咨询自增ID',
  `mallconsulttype_id` int(10) unsigned NOT NULL COMMENT '咨询类型ID',
  `member_id` int(10) unsigned NOT NULL COMMENT '会员ID',
  `member_name` varchar(50) NOT NULL COMMENT '会员名称',
  `mallconsult_content` varchar(500) NOT NULL COMMENT '咨询内容',
  `mallconsult_addtime` int(10) unsigned NOT NULL COMMENT '咨询时间',
  `mallconsult_isreply` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '是否回复 1:是 0:否',
  `mallconsult_reply_content` varchar(500) NOT NULL DEFAULT '' COMMENT '平台回复内容',
  `mallconsult_replytime` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '平台回复时间',
  `admin_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '管理员id',
  `admin_name` varchar(50) NOT NULL DEFAULT '' COMMENT '管理员名称',
  PRIMARY KEY (`mallconsult_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='平台客服咨询表';


-- -----------------------------
-- Table structure for `ds_mallconsulttype`
-- -----------------------------
DROP TABLE IF EXISTS `ds_mallconsulttype`;
CREATE TABLE `ds_mallconsulttype` (
  `mallconsulttype_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '平台客服咨询类型ID',
  `mallconsulttype_name` varchar(50) NOT NULL COMMENT '咨询类型名称',
  `mallconsulttype_introduce` text NOT NULL COMMENT '平台客服咨询类型备注',
  `mallconsulttype_sort` tinyint(255) unsigned NOT NULL COMMENT '咨询类型排序',
  PRIMARY KEY (`mallconsulttype_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COMMENT='平台客服咨询类型表';

-- -----------------------------
-- Records of `ds_mallconsulttype`
-- -----------------------------
INSERT INTO `ds_mallconsulttype` VALUES ('1', '商品咨询', '&lt;p&gt;\r\n	请写明商品链接，或平台货号。\r\n&lt;/p&gt;\r\n&lt;p&gt;\r\n	如果您对商品规格、介绍等有疑问，可以在商品详情页“购买咨询”处发起咨询，会得到及时专业的回复。\r\n&lt;/p&gt;', '255');
INSERT INTO `ds_mallconsulttype` VALUES ('2', '订单咨询', '&lt;p&gt;\r\n	请写明要咨询的订单编号。\r\n&lt;/p&gt;\r\n&lt;p&gt;\r\n	如需处理交易中产生的纠纷，请选择投诉。\r\n&lt;/p&gt;', '255');

-- -----------------------------
-- Table structure for `ds_mbcategory`
-- -----------------------------
DROP TABLE IF EXISTS `ds_mbcategory`;
CREATE TABLE `ds_mbcategory` (
  `gc_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT '手机端分类ID',
  `gc_thumb` varchar(150) DEFAULT NULL COMMENT '手机端分类缩略图',
  PRIMARY KEY (`gc_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='手机端一级分类缩略图';


-- -----------------------------
-- Table structure for `ds_mbfeedback`
-- -----------------------------
DROP TABLE IF EXISTS `ds_mbfeedback`;
CREATE TABLE `ds_mbfeedback` (
  `mbfb_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '反馈自增ID',
  `mbfb_content` varchar(500) DEFAULT NULL COMMENT '反馈内容',
  `mbfb_type` varchar(50) DEFAULT NULL COMMENT '1:手机端 2:PC端',
  `mbfb_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '反馈时间',
  `member_id` int(10) unsigned NOT NULL COMMENT '用户ID',
  `member_name` varchar(50) NOT NULL COMMENT '用户名',
  PRIMARY KEY (`mbfb_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='意见反馈';


-- -----------------------------
-- Table structure for `ds_mbsellertoken`
-- -----------------------------
DROP TABLE IF EXISTS `ds_mbsellertoken`;
CREATE TABLE `ds_mbsellertoken` (
  `seller_token_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '令牌编号',
  `seller_id` int(10) unsigned NOT NULL COMMENT '用户编号',
  `seller_name` varchar(50) NOT NULL COMMENT '用户名',
  `seller_token` varchar(50) NOT NULL COMMENT '登录令牌',
  `seller_logintime` int(10) unsigned NOT NULL COMMENT '登录时间',
  `seller_clienttype` varchar(10) NOT NULL COMMENT '客户端类型 windows',
  PRIMARY KEY (`seller_token_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='客户端商家登录令牌表';


-- -----------------------------
-- Table structure for `ds_mbusertoken`
-- -----------------------------
DROP TABLE IF EXISTS `ds_mbusertoken`;
CREATE TABLE `ds_mbusertoken` (
  `member_token_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '令牌编号',
  `member_id` int(10) unsigned NOT NULL COMMENT '用户编号',
  `member_name` varchar(50) NOT NULL COMMENT '用户名',
  `member_token` varchar(50) NOT NULL COMMENT '登录令牌',
  `member_logintime` int(10) unsigned NOT NULL COMMENT '登录时间',
  `member_clienttype` varchar(10) NOT NULL COMMENT '客户端类型 android wap',
  `member_openid` varchar(50) DEFAULT NULL COMMENT '微信支付jsapi的openid缓存',
  PRIMARY KEY (`member_token_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='移动端登录令牌表';


-- -----------------------------
-- Table structure for `ds_member`
-- -----------------------------
DROP TABLE IF EXISTS `ds_member`;
CREATE TABLE `ds_member` (
  `member_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '会员自增ID',
  `member_name` varchar(50) NOT NULL COMMENT '会员用户名',
  `member_truename` varchar(20) DEFAULT NULL COMMENT '会员真实姓名',
  `member_avatar` varchar(50) DEFAULT NULL COMMENT '会员头像',
  `member_sex` tinyint(1) DEFAULT NULL COMMENT '会员性别',
  `member_birthday` int(11) DEFAULT NULL COMMENT '会员生日',
  `member_password` varchar(32) NOT NULL COMMENT '会员密码',
  `member_paypwd` varchar(32) DEFAULT NULL COMMENT '支付密码',
  `member_email` varchar(50) DEFAULT NULL COMMENT '会员邮箱',
  `member_emailbind` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否绑定邮箱',
  `member_mobile` varchar(11) DEFAULT NULL COMMENT '手机号码',
  `member_mobilebind` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否绑定手机',
  `member_qq` varchar(20) DEFAULT NULL COMMENT '会员QQ',
  `member_ww` varchar(20) DEFAULT NULL COMMENT '会员旺旺',
  `member_loginnum` int(11) NOT NULL DEFAULT '0' COMMENT '会员登录次数',
  `member_addtime` int(11) NOT NULL COMMENT '会员添加时间',
  `member_logintime` int(11) DEFAULT '0' COMMENT '会员当前登录时间',
  `member_old_logintime` int(11) DEFAULT '0' COMMENT '会员上次登录时间',
  `member_login_ip` varchar(20) DEFAULT NULL COMMENT '会员当前登录IP',
  `member_old_login_ip` varchar(20) DEFAULT NULL COMMENT '会员上次登录IP',
  `member_qqopenid` varchar(100) DEFAULT NULL COMMENT 'qq互联id',
  `member_qqinfo` text COMMENT 'qq账号相关信息',
  `member_sinaopenid` varchar(100) DEFAULT NULL COMMENT '新浪微博登录id',
  `member_sinainfo` text COMMENT '新浪账号相关信息序列化值',
  `member_wxopenid` varchar(100) DEFAULT NULL COMMENT '微信互联openid',
  `member_wxunionid` varchar(100) DEFAULT NULL COMMENT '微信用户统一标识',
  `member_wxinfo` text COMMENT '微信用户相关信息',
  `member_points` int(11) NOT NULL DEFAULT '0' COMMENT '会员积分',
  `available_predeposit` decimal(10,2) unsigned NOT NULL DEFAULT '0.00' COMMENT '预存款可用金额',
  `freeze_predeposit` decimal(10,2) unsigned NOT NULL DEFAULT '0.00' COMMENT '预存款冻结金额',
  `available_rc_balance` decimal(10,2) unsigned NOT NULL DEFAULT '0.00' COMMENT '可用充值卡余额',
  `freeze_rc_balance` decimal(10,2) unsigned NOT NULL DEFAULT '0.00' COMMENT '冻结充值卡余额',
  `inform_allow` tinyint(1) NOT NULL DEFAULT '1' COMMENT '是否允许举报(1可以/2不可以)',
  `is_buylimit` tinyint(1) NOT NULL DEFAULT '1' COMMENT '会员是否有购买权限 1为开启 0为关闭',
  `is_allowtalk` tinyint(1) NOT NULL DEFAULT '1' COMMENT '会员是否有咨询和发送站内信的权限 1为开启 0为关闭',
  `member_state` tinyint(1) NOT NULL DEFAULT '1' COMMENT '会员的开启状态 1为开启 0为关闭',
  `member_areaid` int(11) DEFAULT NULL COMMENT '地区ID',
  `member_cityid` int(11) DEFAULT NULL COMMENT '城市ID',
  `member_provinceid` int(11) DEFAULT NULL COMMENT '省份ID',
  `member_areainfo` varchar(255) DEFAULT NULL COMMENT '地区内容',
  `member_privacy` text COMMENT '隐私设定',
  `member_exppoints` int(11) NOT NULL DEFAULT '0' COMMENT '会员经验值',
  `inviter_id` int(11) DEFAULT NULL COMMENT '邀请人ID',
  PRIMARY KEY (`member_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COMMENT='会员表';

-- -----------------------------
-- Records of `ds_member`
-- -----------------------------
INSERT INTO `ds_member` VALUES ('1', 'admin', '', '', '', '', '7fef6171469e80d32c0559f88b377245', '', '', '0', '', '0', '', '', '1', '1543547094', '1543569534', '1543547094', '0.0.0.0', '', '', '', '', '', '', '', '', '0', '0.00', '0.00', '0.00', '0.00', '1', '1', '1', '1', '', '', '', '', '', '0', '');
INSERT INTO `ds_member` VALUES ('2', 'buyer', '', '', '', '', 'e10adc3949ba59abbe56e057f20f883e', '', '', '0', '', '0', '', '', '2', '1543550729', '1543551807', '1543550729', '0.0.0.0', '0.0.0.0', '', '', '', '', '', '', '', '5', '0.00', '0.00', '0.00', '0.00', '1', '1', '1', '1', '', '', '', '', '', '0', '');
INSERT INTO `ds_member` VALUES ('3', 'test', '', '', '0', '', 'e10adc3949ba59abbe56e057f20f883e', 'e10adc3949ba59abbe56e057f20f883e', '123132213132213@qq.com', '0', '', '0', '', '', '0', '1543562542', '1543562542', '1543562542', '0.0.0.0', '0.0.0.0', '', '', '', '', '', '', '', '5', '0.00', '0.00', '0.00', '0.00', '1', '1', '1', '1', '0', '0', '0', '', '', '0', '');

-- -----------------------------
-- Table structure for `ds_membercommon`
-- -----------------------------
DROP TABLE IF EXISTS `ds_membercommon`;
CREATE TABLE `ds_membercommon` (
  `member_id` int(11) NOT NULL COMMENT '会员ID',
  `auth_code` char(6) DEFAULT NULL COMMENT '短信/邮件验证码',
  `send_acode_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '短信/邮件验证码发送时间',
  `send_mb_time` int(11) DEFAULT NULL COMMENT '发送短信验证码时间',
  `send_emailtime` int(11) DEFAULT NULL COMMENT '发送邮件验证码时间',
  `send_mb_times` tinyint(4) NOT NULL DEFAULT '0' COMMENT '发送手机验证码次数',
  `send_acodetimes` tinyint(4) NOT NULL DEFAULT '0' COMMENT '发送验证码次数',
  `auth_code_checktimes` tinyint(4) NOT NULL DEFAULT '0' COMMENT '验证短信错误次数',
  `auth_modify_pwdtime` int(11) NOT NULL DEFAULT '0' COMMENT '支付密码修改时间'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='会员扩展表';

-- -----------------------------
-- Records of `ds_membercommon`
-- -----------------------------
INSERT INTO `ds_membercommon` VALUES ('1', '', '0', '', '', '0', '0', '0', '0');
INSERT INTO `ds_membercommon` VALUES ('2', '', '0', '', '', '0', '0', '0', '0');
INSERT INTO `ds_membercommon` VALUES ('3', '', '0', '', '', '0', '0', '0', '0');

-- -----------------------------
-- Table structure for `ds_membermsgsetting`
-- -----------------------------
DROP TABLE IF EXISTS `ds_membermsgsetting`;
CREATE TABLE `ds_membermsgsetting` (
  `membermt_code` varchar(50) NOT NULL COMMENT '用户消息模板代码',
  `membermt_isreceive` tinyint(3) unsigned NOT NULL COMMENT '是否接收 1是，0否',
  `member_id` int(10) unsigned NOT NULL COMMENT '会员ID',
  PRIMARY KEY (`membermt_code`,`member_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户消息接收设置表';

-- -----------------------------
-- Records of `ds_membermsgsetting`
-- -----------------------------
INSERT INTO `ds_membermsgsetting` VALUES ('arrival_notice', '1', '1');
INSERT INTO `ds_membermsgsetting` VALUES ('consult_goods_reply', '1', '1');
INSERT INTO `ds_membermsgsetting` VALUES ('consult_mall_reply', '1', '1');
INSERT INTO `ds_membermsgsetting` VALUES ('order_deliver_success', '0', '1');
INSERT INTO `ds_membermsgsetting` VALUES ('order_payment_success', '0', '1');
INSERT INTO `ds_membermsgsetting` VALUES ('predeposit_change', '0', '1');
INSERT INTO `ds_membermsgsetting` VALUES ('recharge_card_balance_change', '1', '1');
INSERT INTO `ds_membermsgsetting` VALUES ('refund_return_notice', '1', '1');
INSERT INTO `ds_membermsgsetting` VALUES ('voucher_use', '0', '1');
INSERT INTO `ds_membermsgsetting` VALUES ('voucher_will_expire', '0', '1');
INSERT INTO `ds_membermsgsetting` VALUES ('vr_code_will_expire', '0', '1');

-- -----------------------------
-- Table structure for `ds_membermsgtpl`
-- -----------------------------
DROP TABLE IF EXISTS `ds_membermsgtpl`;
CREATE TABLE `ds_membermsgtpl` (
  `membermt_code` varchar(50) NOT NULL COMMENT '用户消息模板编号',
  `membermt_name` varchar(50) NOT NULL COMMENT '模板名称',
  `membermt_message_switch` tinyint(3) unsigned NOT NULL COMMENT '站内信接收开关',
  `membermt_message_content` varchar(255) NOT NULL COMMENT '站内信消息内容',
  `membermt_short_switch` tinyint(3) unsigned NOT NULL COMMENT '短信接收开关',
  `membermt_short_content` varchar(255) NOT NULL COMMENT '短信接收内容',
  `membermt_mail_switch` tinyint(3) unsigned NOT NULL COMMENT '邮件接收开关',
  `membermt_mail_subject` varchar(255) NOT NULL COMMENT '邮件标题',
  `membermt_mail_content` text NOT NULL COMMENT '邮件内容',
  PRIMARY KEY (`membermt_code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户消息模板';

-- -----------------------------
-- Records of `ds_membermsgtpl`
-- -----------------------------
INSERT INTO `ds_membermsgtpl` VALUES ('arrival_notice', '到货通知提醒', '1', '您关注的商品 “{$goods_name}” 已经到货。<a href=\"{$goods_url}\" target=\"_blank\">点击查看商品</a>', '1', '【{$site_name}】您关注的商品 “{$goods_name}” 已经到货。', '0', '{$site_name}提醒：您关注的商品  “{$goods_name}” 已经到货。', '<p>\r\n	{$site_name}提醒：\r\n</p>\r\n<p>\r\n	您关注的商品 “{$goods_name}” 已经到货。\r\n</p>\r\n<p>\r\n	<a href=\"{$goods_url}\" target=\"_blank\">点击查看商品</a> \r\n</p>\r\n<p>\r\n	<br />\r\n</p>\r\n<p>\r\n	<br />\r\n</p>\r\n<p>\r\n	<br />\r\n</p>\r\n<p style=\"text-align:right;\">\r\n	{$site_name}\r\n</p>\r\n<p style=\"text-align:right;\">\r\n	{$mail_send_time}\r\n</p>');
INSERT INTO `ds_membermsgtpl` VALUES ('consult_goods_reply', '商品咨询回复提醒', '1', '您关于商品 “{$goods_name}”的咨询，商家已经回复。<a href=\"{$consult_url}\" target=\"_blank\">点击查看回复</a>', '0', '【{$site_name}】您关于商品 “{$goods_name}” 的咨询，商家已经回复。', '0', '{$site_name}提醒：您关于商品 “{$goods_name}”的咨询，商家已经回复。', '<p>\r\n	{$site_name}提醒：\r\n</p>\r\n<p>\r\n	您关注的商品“{$goods_name}” 已经到货。\r\n</p>\r\n<p>\r\n	<a href=\"{$consult_url}\" target=\"_blank\">点击查看回复</a> \r\n</p>\r\n<p>\r\n	<br />\r\n</p>\r\n<p>\r\n	<br />\r\n</p>\r\n<p>\r\n	<br />\r\n</p>\r\n<p style=\"text-align:right;\">\r\n	{$site_name}\r\n</p>\r\n<p style=\"text-align:right;\">\r\n	{$mail_send_time}\r\n</p>\r\n<br />\r\n<div class=\"firebugResetStyles firebugBlockBackgroundColor\">\r\n	<div style=\"background-color:transparent ! important;\" class=\"firebugResetStyles\">\r\n	</div>\r\n</div>');
INSERT INTO `ds_membermsgtpl` VALUES ('consult_mall_reply', '平台客服回复提醒', '1', '您的平台客服咨询已经回复。<a href=\"{$consult_url}\" target=\"_blank\">点击查看回复</a>', '0', '【{$site_name}】您的平台客服咨询已经回复。', '0', '{$site_name}提醒：您的平台客服咨询已经回复。', '<p>\r\n	{$site_name}提醒：\r\n</p>\r\n<p>\r\n	您的平台客服咨询已经回复。\r\n</p>\r\n<p>\r\n	<a href=\"{$consult_url}\" target=\"_blank\">点击查看回复</a> \r\n</p>\r\n<p>\r\n	<br />\r\n</p>\r\n<p>\r\n	<br />\r\n</p>\r\n<p style=\"text-align:right;\">\r\n	{$site_name}\r\n</p>\r\n<p style=\"text-align:right;\">\r\n	{$mail_send_time}\r\n</p>');
INSERT INTO `ds_membermsgtpl` VALUES ('order_deliver_success', '商品出库提醒', '1', '您的订单已经出库。<a href=\"{$order_url}\" target=\"_blank\">点击查看订单</a>', '1', '【{$site_name}】您的订单已经出库。订单编号 {$order_sn}。', '0', '{$site_name}提醒：您的订单已经出库。订单编号 {$order_sn}。', '<p>\r\n	{$site_name}提醒：\r\n</p>\r\n<p>\r\n	您的订单已经出库。订单编号 {$order_sn}。<br />\r\n<a href=\"{$order_url}\" target=\"_blank\">点击查看订单</a>\r\n</p>\r\n<p>\r\n	<br />\r\n</p>\r\n<p>\r\n	<br />\r\n</p>\r\n<p>\r\n	<br />\r\n</p>\r\n<p style=\"text-align:right;\">\r\n	{$site_name}\r\n</p>\r\n<p style=\"text-align:right;\">\r\n	{$mail_send_time}\r\n</p>\r\n<br />');
INSERT INTO `ds_membermsgtpl` VALUES ('order_payment_success', '付款成功提醒', '1', '关于订单：{$order_sn}的款项已经收到，请留意出库通知。<a href=\"{$order_url}\" target=\"_blank\">点击查看订单详情</a>', '1', '【{$site_name}】{$order_sn}的款项已经收到，请留意出库通知。', '0', '{$site_name}提醒：{$order_sn}的款项已经收到，请留意出库通知。', '<p>\r\n	{$site_name}提醒：\r\n</p>\r\n<p>\r\n	{$order_sn}的款项已经收到，请留意出库通知。\r\n</p>\r\n<p>\r\n	<a href=\"{$order_url}\" target=\"_blank\">点击查看订单详情</a>\r\n</p>\r\n<p>\r\n	<br />\r\n</p>\r\n<p>\r\n	<br />\r\n</p>\r\n<p>\r\n	<br />\r\n</p>\r\n<p style=\"text-align:right;\">\r\n	{$site_name}\r\n</p>\r\n<p style=\"text-align:right;\">\r\n	{$mail_send_time}\r\n</p>\r\n<br />');
INSERT INTO `ds_membermsgtpl` VALUES ('predeposit_change', '余额变动提醒', '1', '你的账户于 {$time} 账户资金有变化，描述：{$desc}，可用金额变化 ：{$av_amount}元，冻结金额变化：{$freeze_amount}元。<a href=\"{$pd_url}\" target=\"_blank\">点击查看余额</a>', '0', '【{$site_name}】你的账户于 {$time} 账户资金有变化，描述：{$desc}，可用金额变化： {$av_amount}元，冻结金额变化：{$freeze_amount}元。', '0', '{$site_name}提醒：你的账户于 {$time} 账户资金有变化，描述：{$desc}，可用金额变化： {$av_amount}元，冻结金额变化：{$freeze_amount}元。', '<p>\r\n	{$site_name}提醒：\r\n</p>\r\n<p>\r\n	你的账户于 {$time} 账户资金有变化，描述：{$desc}，可用金额变化：{$av_amount}元，冻结金额变化：{$freeze_amount}元。\r\n</p>\r\n<p>\r\n	<a href=\"{$pd_url}\" target=\"_blank\">点击查看余额</a> \r\n</p>\r\n<p>\r\n	<br />\r\n</p>\r\n<p>\r\n	<br />\r\n</p>\r\n<p>\r\n	<br />\r\n</p>\r\n<p style=\"text-align:right;\">\r\n	{$site_name}\r\n</p>\r\n<p style=\"text-align:right;\">\r\n	{$mail_send_time}\r\n</p>');
INSERT INTO `ds_membermsgtpl` VALUES ('recharge_card_balance_change', '充值卡余额变动提醒', '1', '你的账户于 {$time} 充值卡余额有变化，描述：{$description}，可用充值卡余额变化 ：{$available_amount}元，冻结充值卡余额变化：{$freeze_amount}元。<a href=\"{$url}\" target=\"_blank\">点击查看充值卡余额</a>', '0', '【{$site_name}】你的账户于 {$time} 充值卡余额有变化，描述：{$description}，可用充值卡余额变化： {$available_amount}元，冻结充值卡余额变化：{$freeze_amount}元。', '0', '{$site_name}提醒：你的账户于 {$time} 充值卡余额有变化，描述：{$description}，可用充值卡余额变化： {$available_amount}元，冻结充值卡余额变化：{$freeze_amount}元。', '<p>\r\n    {$site_name}提醒：\r\n</p>\r\n<p>\r\n  你的账户于 {$time} 充值卡余额有变化，描述：{$description}，可用充值卡余额变化：{$available_amount}元，冻结充值卡余额变化：{$freeze_amount}元。\r\n</p>\r\n<p>\r\n  <a href=\"{$url}\" target=\"_blank\">点击查看余额</a> \r\n</p>\r\n<p>\r\n  <br />\r\n</p>\r\n<p>\r\n   <br />\r\n</p>\r\n<p>\r\n   <br />\r\n</p>\r\n<p style=\"text-align:right;\">\r\n {$site_name}\r\n</p>\r\n<p style=\"text-align:right;\">\r\n   {$mail_send_time}\r\n</p>');
INSERT INTO `ds_membermsgtpl` VALUES ('refund_return_notice', '退款退货提醒', '1', '您的退款退货单有了变化。<a href=\"{$refund_url}\" target=\"_blank\">点击查看</a>', '1', '【{$site_name}】您的退款退货单有了变化。退款退货单编号：{$refund_sn}。', '0', '{$site_name}提醒：您的退款退货单有了变化。', '<p>\r\n	{$site_name}提醒：\r\n</p>\r\n<p>\r\n	您的退款退货单有了变化。退款退货单编号：{$refund_sn}。\r\n</p>\r\n<p>\r\n	&lt;a href=\"{$refund_url}\" target=\"_blank\"&gt;点击查看&lt;/a&gt;\r\n</p>\r\n<p>\r\n	<br />\r\n</p>\r\n<p>\r\n	<br />\r\n</p>\r\n<p>\r\n	<br />\r\n</p>\r\n<p style=\"text-align:right;\">\r\n	{$site_name}\r\n</p>\r\n<p style=\"text-align:right;\">\r\n	{$mail_send_time}\r\n</p>\r\n<br />');
INSERT INTO `ds_membermsgtpl` VALUES ('voucher_use', '代金券使用提醒', '1', '您有代金券已经使用，代金券编号：{$voucher_code}。<a href=\"{$voucher_url}\" target=\"_blank\">点击查看</a>', '0', '【{$site_name}】您有代金券已经使用，代金券编号：{$voucher_code}。', '0', '{$site_name}提醒：您有代金券已经使用，代金券编号：{$voucher_code}。', '<p>\r\n	{$site_name}提醒：\r\n</p>\r\n<p>\r\n	您有代金券已经使用，代金券编号：{$voucher_code}。\r\n</p>\r\n<p>\r\n	&lt;a href=\"{$voucher_url}\" target=\"_blank\"&gt;点击查看&lt;/a&gt;\r\n</p>\r\n<p>\r\n	<br />\r\n</p>\r\n<p>\r\n	<br />\r\n</p>\r\n<p>\r\n	<br />\r\n</p>\r\n<p style=\"text-align:right;\">\r\n	{$site_name}\r\n</p>\r\n<p style=\"text-align:right;\">\r\n	{$mail_send_time}\r\n</p>\r\n<p>\r\n	<br />\r\n</p>\r\n<p>\r\n	<br />\r\n</p>');
INSERT INTO `ds_membermsgtpl` VALUES ('voucher_will_expire', '代金券即将到期提醒', '1', '您有一个代金券即将在{$indate}过期，请记得使用。<a href=\"{$voucher_url}\" target=\"_blank\">点击查看</a>', '0', '【{$site_name}】您有一个代金券即将在{$indate}过期，请记得使用。', '0', '{$site_name}提醒：您有一个代金券即将在{$indate}过期，请记得使用。', '<p>\r\n	{$site_name}提醒：\r\n</p>\r\n<p>\r\n	您有一个代金券即将在{$indate}过期，请记得使用。\r\n</p>\r\n<p>\r\n	<a href=\"{$voucher_url}\" target=\"_blank\">点击查看</a> \r\n</p>\r\n<p>\r\n	<br />\r\n</p>\r\n<p>\r\n	<br />\r\n</p>\r\n<p>\r\n	<br />\r\n</p>\r\n<p style=\"text-align:right;\">\r\n	{$site_name}\r\n</p>\r\n<p style=\"text-align:right;\">\r\n	{$mail_send_time}\r\n</p>\r\n<p>\r\n	<br />\r\n</p>\r\n<p>\r\n	<br />\r\n</p>');
INSERT INTO `ds_membermsgtpl` VALUES ('vr_code_will_expire', '兑换码即将到期提醒', '1', '您有一组兑换码即将在{$indate}过期，请记得使用。<a href=\"{$vr_order_url}\" target=\"_blank\">点击查看</a>', '0', '【{$site_name}】您有一组兑换码即将在{$indate}过期，请记得使用。', '0', '{$site_name}提醒：您有一组兑换码即将在{$indate}过期，请记得使用。', '<p>\r\n	{$site_name}提醒：\r\n</p>\r\n<p>\r\n	您有一组兑换码即将在{$indate}过期，请记得使用。\r\n</p>\r\n<p>\r\n	&lt;a href=\"{$vr_order_url}\" target=\"_blank\"&gt;点击查看&lt;/a&gt;\r\n</p>\r\n<p>\r\n	<br />\r\n</p>\r\n<p>\r\n	<br />\r\n</p>\r\n<p>\r\n	<br />\r\n</p>\r\n<p style=\"text-align:right;\">\r\n	{$site_name}\r\n</p>\r\n<p style=\"text-align:right;\">\r\n	{$mail_send_time}\r\n</p>\r\n<p>\r\n	<br />\r\n</p>\r\n<p>\r\n	<br />\r\n</p>');

-- -----------------------------
-- Table structure for `ds_message`
-- -----------------------------
DROP TABLE IF EXISTS `ds_message`;
CREATE TABLE `ds_message` (
  `message_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '短消息自增ID',
  `message_parent_id` int(11) NOT NULL COMMENT '回复短消息message_id',
  `from_member_id` int(11) NOT NULL COMMENT '短消息发送人',
  `to_member_id` varchar(1000) NOT NULL COMMENT '短消息接收人',
  `message_title` varchar(50) DEFAULT NULL COMMENT '短消息标题',
  `message_body` varchar(255) NOT NULL COMMENT '短消息内容',
  `message_time` varchar(10) NOT NULL COMMENT '短消息发送时间',
  `message_update_time` varchar(10) DEFAULT NULL COMMENT '短消息回复更新时间',
  `message_open` tinyint(1) NOT NULL DEFAULT '0' COMMENT '短消息打开状态',
  `message_state` tinyint(1) NOT NULL DEFAULT '0' COMMENT '短消息状态，0为正常状态，1为发送人删除状态，2为接收人删除状态',
  `message_type` tinyint(1) NOT NULL DEFAULT '0' COMMENT '0为私信、1为系统消息、2为留言',
  `read_member_id` varchar(1000) DEFAULT NULL COMMENT '已经读过该消息的会员id',
  `del_member_id` varchar(1000) DEFAULT NULL COMMENT '已经删除该消息的会员id',
  `message_ismore` tinyint(1) NOT NULL DEFAULT '0' COMMENT '站内信是否为一条发给多个用户 0为否 1为多条 ',
  `from_member_name` varchar(100) DEFAULT NULL COMMENT '发信息人用户名',
  `to_member_name` varchar(100) DEFAULT NULL COMMENT '接收人用户名',
  PRIMARY KEY (`message_id`),
  KEY `from_member_id` (`from_member_id`),
  KEY `to_member_id` (`to_member_id`(255)),
  KEY `message_ismore` (`message_ismore`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COMMENT='短消息';

-- -----------------------------
-- Records of `ds_message`
-- -----------------------------
INSERT INTO `ds_message` VALUES ('1', '0', '3', '1', '', '213123', '1543569520', '1543569953', '1', '0', '2', '', '', '0', 'test', 'admin');
INSERT INTO `ds_message` VALUES ('2', '1', '1', '3', '', '111', '1543569574', '1543569574', '1', '0', '0', '', '', '0', 'admin', 'test');
INSERT INTO `ds_message` VALUES ('3', '1', '1', '3', '', '111', '1543569724', '1543569724', '1', '0', '0', '', '', '0', 'admin', 'test');
INSERT INTO `ds_message` VALUES ('4', '1', '1', '3', '', '123312', '1543569947', '1543569947', '1', '0', '0', '', '', '0', 'admin', 'test');
INSERT INTO `ds_message` VALUES ('5', '1', '1', '3', '', '1212', '1543569950', '1543569950', '1', '0', '0', '', '', '0', 'admin', 'test');
INSERT INTO `ds_message` VALUES ('6', '1', '1', '3', '', '123123', '1543569953', '1543569953', '1', '0', '0', '', '', '0', 'admin', 'test');

-- -----------------------------
-- Table structure for `ds_navigation`
-- -----------------------------
DROP TABLE IF EXISTS `ds_navigation`;
CREATE TABLE `ds_navigation` (
  `nav_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '页面导航自增ID',
  `nav_type` tinyint(1) NOT NULL DEFAULT '0' COMMENT '页面导航类别，0自定义导航，1商品分类，2文章导航，3活动导航，默认为0',
  `nav_title` varchar(100) DEFAULT NULL COMMENT '页面导航标题',
  `nav_url` varchar(255) DEFAULT NULL COMMENT '页面导航链接',
  `nav_location` varchar(10) NOT NULL COMMENT '页面导航位置，header头部，middle中部，footer底部',
  `nav_new_open` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否以新窗口打开，0为否，1为是，默认为0',
  `nav_sort` tinyint(3) unsigned NOT NULL DEFAULT '255' COMMENT '页面导航排序',
  `item_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '页面导航类别ID，对应着nav_type中的内容，默认为0',
  `nav_is_close` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否前台显示，0为否，1为是，默认为1',
  PRIMARY KEY (`nav_id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COMMENT='页面导航表';

-- -----------------------------
-- Records of `ds_navigation`
-- -----------------------------
INSERT INTO `ds_navigation` VALUES ('1', '0', '使用手册', 'http://www.csdeshang.com/home/help/article/id/1.html', 'middle', '1', '15', '0', '0');
INSERT INTO `ds_navigation` VALUES ('2', '0', '官方网站', 'http://www.csdeshang.com/', 'middle', '1', '15', '0', '0');
INSERT INTO `ds_navigation` VALUES ('3', '0', '官方论坛', 'http://bbs.csdeshang.com', 'middle', '1', '0', '0', '0');
INSERT INTO `ds_navigation` VALUES ('4', '0', '店铺', 'http://dsmall.php.60data.com/Home/storelist', 'middle', '1', '23', '0', '0');
INSERT INTO `ds_navigation` VALUES ('5', '0', '品牌', 'http://dsmall.php.60data.com/Home/brand', 'middle', '1', '24', '0', '0');
INSERT INTO `ds_navigation` VALUES ('6', '0', '附近店铺', 'http://dsmall.php.60data.com/Home/Shopnearby', 'middle', '1', '24', '0', '0');

-- -----------------------------
-- Table structure for `ds_offpayarea`
-- -----------------------------
DROP TABLE IF EXISTS `ds_offpayarea`;
CREATE TABLE `ds_offpayarea` (
  `store_id` int(8) unsigned NOT NULL COMMENT '商家ID',
  `area_id` text COMMENT '县ID组合',
  PRIMARY KEY (`store_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='货到付款支持地区表';


-- -----------------------------
-- Table structure for `ds_order`
-- -----------------------------
DROP TABLE IF EXISTS `ds_order`;
CREATE TABLE `ds_order` (
  `order_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '订单自增id',
  `order_sn` varchar(20) NOT NULL COMMENT '订单编号',
  `pay_sn` varchar(20) NOT NULL COMMENT '支付单号',
  `store_id` int(11) unsigned NOT NULL COMMENT '卖家店铺ID',
  `store_name` varchar(50) NOT NULL COMMENT '卖家店铺名称',
  `buyer_id` int(11) unsigned NOT NULL COMMENT '买家ID',
  `buyer_name` varchar(50) NOT NULL COMMENT '买家姓名',
  `buyer_email` varchar(80) DEFAULT NULL COMMENT '买家电子邮箱',
  `add_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '订单生成时间',
  `payment_code` char(20) NOT NULL DEFAULT '' COMMENT '支付方式名称代码',
  `payment_time` int(10) unsigned DEFAULT '0' COMMENT '支付(付款)时间',
  `finnshed_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '订单完成时间',
  `goods_amount` decimal(10,2) unsigned NOT NULL DEFAULT '0.00' COMMENT '商品总价格',
  `order_amount` decimal(10,2) unsigned NOT NULL DEFAULT '0.00' COMMENT '订单总价格',
  `rcb_amount` decimal(10,2) unsigned NOT NULL DEFAULT '0.00' COMMENT '充值卡支付金额',
  `pd_amount` decimal(10,2) unsigned NOT NULL DEFAULT '0.00' COMMENT '预存款支付金额',
  `shipping_fee` decimal(10,2) unsigned DEFAULT '0.00' COMMENT '运费',
  `evaluation_state` tinyint(4) DEFAULT '0' COMMENT '评价状态 0：未评价 1：已评价 2:已过期未评价',
  `order_state` tinyint(4) NOT NULL DEFAULT '10' COMMENT '订单状态：0:已取消 10:未付款 20:已付款 30:已发货 40:已收货',
  `refund_state` tinyint(1) unsigned DEFAULT '0' COMMENT '退款状态 0:无退款 1:部分退款 2:全部退款',
  `lock_state` tinyint(1) unsigned DEFAULT '0' COMMENT '锁定状态:0:正常,大于0:锁定',
  `delete_state` tinyint(4) NOT NULL DEFAULT '0' COMMENT '删除状态 0:未删除 1:放入回收站 2:彻底删除',
  `refund_amount` decimal(10,2) DEFAULT '0.00' COMMENT '退款金额',
  `delay_time` int(10) unsigned DEFAULT '0' COMMENT '延迟时间,默认为0',
  `order_from` tinyint(4) NOT NULL DEFAULT '1' COMMENT '订单来源，1:PC 2:手机',
  `shipping_code` varchar(50) DEFAULT '' COMMENT '订单物流单号',
  `order_type` tinyint(4) DEFAULT NULL COMMENT '订单类型',
  `ob_no` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '相关结算单号',
  PRIMARY KEY (`order_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='订单表';


-- -----------------------------
-- Table structure for `ds_orderbill`
-- -----------------------------
DROP TABLE IF EXISTS `ds_orderbill`;
CREATE TABLE `ds_orderbill` (
  `ob_no` int(11) NOT NULL AUTO_INCREMENT COMMENT '结算单编号(年月店铺ID)',
  `ob_startdate` int(11) NOT NULL COMMENT '开始日期',
  `ob_enddate` int(11) NOT NULL COMMENT '结束日期',
  `ob_order_totals` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '结算订单金额',
  `ob_shipping_totals` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '结算运费',
  `ob_order_return_totals` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '结算退单金额',
  `ob_commis_totals` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '结算佣金金额',
  `ob_commis_return_totals` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '结算退还佣金',
  `ob_store_cost_totals` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '店铺促销活动费用',
  `ob_vr_order_totals` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '虚拟订单金额',
  `ob_vr_order_return_totals` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '虚拟订单退款金额',
  `ob_vr_commis_totals` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '虚拟佣金金额',
  `ob_vr_commis_return_totals` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '虚拟退还佣金金额',
  `ob_vr_inviter_totals` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '虚拟分销佣金金额',
  `ob_result_totals` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '应结金额',
  `ob_createdate` int(11) DEFAULT '0' COMMENT '生成结算单日期',
  `ob_state` enum('1','2','3','4') DEFAULT '1' COMMENT '结算状态 1，默认2，店家已确认3，平台已审核4，结算完成',
  `ob_store_id` int(11) NOT NULL COMMENT '店铺ID',
  `ob_store_name` varchar(50) DEFAULT NULL COMMENT '店铺名',
  `ob_inviter_totals` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '分销的佣金',
  `ob_seller_content` varchar(255) NOT NULL COMMENT '商家备注',
  `ob_admin_content` varchar(255) NOT NULL COMMENT '管理员备注',
  PRIMARY KEY (`ob_no`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='结算表';


-- -----------------------------
-- Table structure for `ds_ordercommon`
-- -----------------------------
DROP TABLE IF EXISTS `ds_ordercommon`;
CREATE TABLE `ds_ordercommon` (
  `order_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '订单ID',
  `store_id` int(10) unsigned NOT NULL COMMENT '店铺ID',
  `shipping_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '配送时间',
  `shipping_express_id` tinyint(1) NOT NULL DEFAULT '0' COMMENT '配送公司ID',
  `evaluation_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '评价时间',
  `evalseller_state` enum('0','1') NOT NULL DEFAULT '0' COMMENT '卖家是否已评价买家',
  `evalseller_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '卖家评价买家的时间',
  `order_message` varchar(300) DEFAULT NULL COMMENT '订单留言',
  `order_pointscount` int(11) NOT NULL DEFAULT '0' COMMENT '订单赠送积分',
  `voucher_price` int(11) DEFAULT NULL COMMENT '代金券面额',
  `voucher_code` varchar(32) DEFAULT NULL COMMENT '代金券编码',
  `deliver_explain` text COMMENT '订单发货备注',
  `daddress_id` mediumint(9) NOT NULL DEFAULT '0' COMMENT '发货地址ID',
  `reciver_name` varchar(50) NOT NULL COMMENT '收货人姓名',
  `reciver_info` varchar(500) NOT NULL COMMENT '收货人其它信息',
  `reciver_province_id` mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '收货人省级ID',
  `reciver_city_id` mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '收货人市级ID',
  `invoice_info` varchar(500) DEFAULT NULL COMMENT '订单发票信息',
  `promotion_info` varchar(500) DEFAULT NULL COMMENT '订单促销信息备注',
  `dlyo_pickup_code` varchar(4) DEFAULT NULL COMMENT '订单提货码',
  PRIMARY KEY (`order_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='订单信息扩展表';


-- -----------------------------
-- Table structure for `ds_ordergoods`
-- -----------------------------
DROP TABLE IF EXISTS `ds_ordergoods`;
CREATE TABLE `ds_ordergoods` (
  `rec_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '订单商品表自增ID',
  `order_id` int(11) NOT NULL COMMENT '订单ID',
  `goods_id` int(11) NOT NULL COMMENT '商品ID',
  `goods_name` varchar(50) NOT NULL COMMENT '商品名称',
  `goods_price` decimal(10,2) NOT NULL COMMENT '商品价格',
  `goods_num` smallint(5) unsigned NOT NULL DEFAULT '1' COMMENT '商品数量',
  `goods_image` varchar(100) DEFAULT NULL COMMENT '商品图片',
  `goods_pay_price` decimal(10,2) unsigned NOT NULL COMMENT '商品实际成交价',
  `store_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '店铺ID',
  `buyer_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '买家ID',
  `goods_type` enum('1','2','3','4','5','6','7') NOT NULL DEFAULT '1' COMMENT '1默认2抢购商品3限时折扣商品4组合套装5赠品6拼团7会员等级折扣',
  `promotions_id` mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '促销活动ID（抢购ID/限时折扣ID/优惠套装ID）与goods_type搭配使用',
  `commis_rate` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT '佣金比例',
  `gc_id` mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '商品最底级分类ID',
  PRIMARY KEY (`rec_id`),
  KEY `order_id` (`order_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='订单商品表';


-- -----------------------------
-- Table structure for `ds_orderinviter`
-- -----------------------------
DROP TABLE IF EXISTS `ds_orderinviter`;
CREATE TABLE `ds_orderinviter` (
  `orderinviter_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '分销详情自增ID',
  `orderinviter_order_id` int(10) unsigned NOT NULL COMMENT '订单ID',
  `orderinviter_member_id` int(10) unsigned NOT NULL COMMENT '推荐人ID',
  `orderinviter_money` decimal(10,2) unsigned NOT NULL COMMENT '佣金',
  `orderinviter_remark` varchar(255) NOT NULL COMMENT '分销详情备注',
  `orderinviter_member_name` varchar(60) NOT NULL COMMENT '推荐人用户名',
  `orderinviter_order_sn` varchar(20) NOT NULL COMMENT '订单号',
  `orderinviter_goods_commonid` int(10) unsigned NOT NULL COMMENT '商品公共id',
  `orderinviter_goods_id` int(10) unsigned NOT NULL COMMENT '商品id',
  `orderinviter_level` int(10) unsigned NOT NULL COMMENT '分销级别',
  `orderinviter_goods_name` varchar(255) NOT NULL COMMENT '商品名称',
  `orderinviter_valid` tinyint(1) unsigned NOT NULL COMMENT '是否有效',
  `orderinviter_store_id` int(10) unsigned NOT NULL COMMENT '店铺id',
  `orderinviter_order_type` tinyint(1) unsigned NOT NULL COMMENT '订单类型（0实物订单1虚拟订单）',
  `orderinviter_goods_quantity` int(10) unsigned NOT NULL COMMENT '商品数量',
  `orderinviter_goods_amount` decimal(10,2) unsigned NOT NULL COMMENT '商品金额',
  `orderinviter_store_name` varchar(60) NOT NULL COMMENT '店铺名',
  `orderinviter_addtime` int(10) unsigned NOT NULL COMMENT '添加时间',
  PRIMARY KEY (`orderinviter_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='分销详情表';


-- -----------------------------
-- Table structure for `ds_orderlog`
-- -----------------------------
DROP TABLE IF EXISTS `ds_orderlog`;
CREATE TABLE `ds_orderlog` (
  `log_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '订单记录自增ID',
  `order_id` int(11) NOT NULL COMMENT '订单id',
  `log_msg` varchar(150) DEFAULT '' COMMENT '订单记录文字描述',
  `log_time` int(10) unsigned NOT NULL COMMENT '订单记录处理时间',
  `log_role` char(2) NOT NULL COMMENT '操作角色',
  `log_user` varchar(30) DEFAULT '' COMMENT '操作人',
  `log_orderstate` enum('0','10','20','30','40') DEFAULT NULL COMMENT '订单状态：0:已取消10:未付款;20:已付款;30:已发货;40:已收货;',
  PRIMARY KEY (`log_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='订单记录表';


-- -----------------------------
-- Table structure for `ds_orderpay`
-- -----------------------------
DROP TABLE IF EXISTS `ds_orderpay`;
CREATE TABLE `ds_orderpay` (
  `pay_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '订单支付自增ID',
  `pay_sn` varchar(20) NOT NULL COMMENT '支付单号',
  `buyer_id` int(10) unsigned NOT NULL COMMENT '买家ID',
  `api_paystate` enum('0','1') DEFAULT '0' COMMENT '0默认未支付1已支付(只有第三方支付接口通知到时才会更改此状态)',
  PRIMARY KEY (`pay_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='订单支付表';


-- -----------------------------
-- Table structure for `ds_orderstatis`
-- -----------------------------
DROP TABLE IF EXISTS `ds_orderstatis`;
CREATE TABLE `ds_orderstatis` (
  `os_month` mediumint(9) unsigned NOT NULL DEFAULT '0' COMMENT '统计编号(年月)',
  `os_order_totals` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '订单金额',
  `os_shipping_totals` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '运费',
  `os_order_returntotals` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '退单金额',
  `os_commis_totals` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '佣金金额',
  `os_commis_returntotals` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '退还佣金',
  `os_store_costtotals` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '店铺促销活动费用',
  `os_vr_order_totals` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '虚拟订单金额',
  `os_vr_order_return_totals` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '虚拟订单退款金额',
  `os_vr_commis_totals` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '虚拟佣金金额',
  `os_vr_commis_return_totals` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '虚拟退还佣金金额',
  `os_vr_inviter_totals` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '虚拟分销佣金金额',
  `os_result_totals` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '本期应结',
  `os_createdate` int(11) DEFAULT NULL COMMENT '创建记录日期',
  `os_inviter_totals` decimal(10,2) unsigned NOT NULL DEFAULT '0.00' COMMENT '分销佣金',
  PRIMARY KEY (`os_month`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='月销量统计表';


-- -----------------------------
-- Table structure for `ds_payment`
-- -----------------------------
DROP TABLE IF EXISTS `ds_payment`;
CREATE TABLE `ds_payment` (
  `payment_code` char(20) NOT NULL COMMENT '支付代码',
  `payment_name` char(20) NOT NULL COMMENT '支付名称',
  `payment_config` text COMMENT '支付接口配置信息',
  `payment_platform` char(10) NOT NULL COMMENT '支付方式所适应平台 pc h5 app',
  `payment_state` enum('0','1') NOT NULL DEFAULT '0' COMMENT '接口状态0禁用1启用',
  PRIMARY KEY (`payment_code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='支付方式表';


-- -----------------------------
-- Table structure for `ds_pboothgoods`
-- -----------------------------
DROP TABLE IF EXISTS `ds_pboothgoods`;
CREATE TABLE `ds_pboothgoods` (
  `boothgoods_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '展位商品ID',
  `store_id` int(10) unsigned NOT NULL COMMENT '展位店铺id',
  `goods_id` int(10) unsigned NOT NULL COMMENT '展位商品id',
  `gc_id` int(10) unsigned NOT NULL COMMENT '商品分类id',
  `boothgoods_state` tinyint(3) unsigned NOT NULL DEFAULT '1' COMMENT '展位商品状态 1开启 0关闭 默认1',
  PRIMARY KEY (`boothgoods_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='展位商品表';


-- -----------------------------
-- Table structure for `ds_pboothquota`
-- -----------------------------
DROP TABLE IF EXISTS `ds_pboothquota`;
CREATE TABLE `ds_pboothquota` (
  `boothquota_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '展位套餐自增ID',
  `store_id` int(10) unsigned NOT NULL COMMENT '店铺id',
  `store_name` varchar(50) NOT NULL COMMENT '店铺名称',
  `boothquota_starttime` int(10) unsigned NOT NULL COMMENT '展位开始时间',
  `boothquota_endtime` int(10) unsigned NOT NULL COMMENT '展位结束时间',
  `boothquota_state` tinyint(3) unsigned NOT NULL DEFAULT '1' COMMENT '套餐状态 1:开启 0:关闭',
  PRIMARY KEY (`boothquota_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='展位套餐表';


-- -----------------------------
-- Table structure for `ds_pbundling`
-- -----------------------------
DROP TABLE IF EXISTS `ds_pbundling`;
CREATE TABLE `ds_pbundling` (
  `bl_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '组合ID',
  `store_id` int(11) NOT NULL COMMENT '店铺名称',
  `store_name` varchar(50) NOT NULL COMMENT '店铺名称',
  `bl_name` varchar(50) NOT NULL COMMENT '组合名称',
  `bl_discount_price` decimal(10,2) NOT NULL COMMENT '组合价格',
  `bl_freight_choose` tinyint(1) NOT NULL COMMENT '运费承担方式',
  `bl_freight` decimal(10,2) NOT NULL COMMENT '运费',
  `bl_state` tinyint(1) NOT NULL DEFAULT '1' COMMENT '组合状态 0:关闭 1:开启',
  PRIMARY KEY (`bl_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='组合销售活动表';


-- -----------------------------
-- Table structure for `ds_pbundlinggoods`
-- -----------------------------
DROP TABLE IF EXISTS `ds_pbundlinggoods`;
CREATE TABLE `ds_pbundlinggoods` (
  `blgoods_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '组合商品id',
  `blgoods_price` decimal(10,2) NOT NULL COMMENT '商品价格',
  `blgoods_appoint` tinyint(3) unsigned NOT NULL COMMENT '指定商品 1是，0否',
  `bl_id` int(11) NOT NULL COMMENT '组合id',
  `goods_id` int(10) unsigned NOT NULL COMMENT '商品id',
  `goods_name` varchar(50) NOT NULL COMMENT '商品名称',
  `goods_image` varchar(100) NOT NULL COMMENT '商品图片',
  PRIMARY KEY (`blgoods_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='组合销售活动商品表';


-- -----------------------------
-- Table structure for `ds_pbundlingquota`
-- -----------------------------
DROP TABLE IF EXISTS `ds_pbundlingquota`;
CREATE TABLE `ds_pbundlingquota` (
  `blquota_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '组合套餐自增ID',
  `store_id` int(11) NOT NULL COMMENT '店铺ID',
  `store_name` varchar(50) NOT NULL COMMENT '店铺名称',
  `member_id` int(11) NOT NULL COMMENT '会员ID',
  `member_name` varchar(50) NOT NULL COMMENT '会员名称',
  `blquota_month` tinyint(3) unsigned NOT NULL COMMENT '组合套餐购买数量（单位月）',
  `blquota_starttime` varchar(10) NOT NULL COMMENT '组合套餐开始时间',
  `blquota_endtime` varchar(10) NOT NULL COMMENT '组合套餐结束时间',
  `blquota_state` tinyint(1) unsigned NOT NULL COMMENT '组合套餐状态：0关闭，1开启。默认为 1',
  PRIMARY KEY (`blquota_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='组合销售套餐表';


-- -----------------------------
-- Table structure for `ds_pdcash`
-- -----------------------------
DROP TABLE IF EXISTS `ds_pdcash`;
CREATE TABLE `ds_pdcash` (
  `pdc_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '提现记录自增ID',
  `pdc_sn` varchar(20) NOT NULL COMMENT '记录唯一标示',
  `pdc_member_id` int(11) NOT NULL COMMENT '会员ID',
  `pdc_member_name` varchar(50) NOT NULL COMMENT '会员名称',
  `pdc_amount` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '金额',
  `pdc_bank_name` varchar(40) NOT NULL COMMENT '收款银行',
  `pdc_bank_no` varchar(30) DEFAULT NULL COMMENT '收款账号',
  `pdc_bank_user` varchar(10) DEFAULT NULL COMMENT '开户人姓名',
  `pdc_addtime` int(11) NOT NULL COMMENT '添加时间',
  `pdc_payment_time` int(11) DEFAULT NULL COMMENT '付款时间',
  `pdc_payment_state` enum('0','1') NOT NULL DEFAULT '0' COMMENT '提现支付状态 0:默认1:支付完成',
  `pdc_payment_admin` varchar(30) DEFAULT NULL COMMENT '支付管理员',
  PRIMARY KEY (`pdc_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='预存款提现记录表';


-- -----------------------------
-- Table structure for `ds_pdlog`
-- -----------------------------
DROP TABLE IF EXISTS `ds_pdlog`;
CREATE TABLE `ds_pdlog` (
  `lg_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '预存款变更日志自增ID',
  `lg_member_id` int(11) NOT NULL COMMENT '会员ID',
  `lg_member_name` varchar(50) NOT NULL COMMENT '会员名称',
  `lg_admin_name` varchar(50) DEFAULT NULL COMMENT '管理员名称',
  `lg_type` varchar(15) NOT NULL DEFAULT '' COMMENT 'order_pay下单支付预存款,order_freeze下单冻结预存款,order_cancel取消订单解冻预存款,order_comb_pay下单支付被冻结的预存款,recharge充值,cash_apply申请提现冻结预存款,cash_pay提现成功,cash_del取消提现申请，解冻预存款,refund退款',
  `lg_av_amount` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '可用金额变更0:未变更',
  `lg_freeze_amount` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '冻结金额变更0:未变更',
  `lg_addtime` int(11) NOT NULL COMMENT '变更添加时间',
  `lg_desc` varchar(150) DEFAULT NULL COMMENT '变更描述',
  PRIMARY KEY (`lg_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='预存款变更日志表';


-- -----------------------------
-- Table structure for `ds_pdrecharge`
-- -----------------------------
DROP TABLE IF EXISTS `ds_pdrecharge`;
CREATE TABLE `ds_pdrecharge` (
  `pdr_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '充值自增ID',
  `pdr_sn` varchar(20) NOT NULL COMMENT '记录唯一标示',
  `pdr_member_id` int(11) NOT NULL COMMENT '会员ID',
  `pdr_member_name` varchar(50) NOT NULL COMMENT '会员名称',
  `pdr_amount` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '充值金额',
  `pdr_payment_code` varchar(20) DEFAULT '' COMMENT '支付方式',
  `pdr_trade_sn` varchar(50) DEFAULT '' COMMENT '第三方支付接口交易号',
  `pdr_addtime` int(11) NOT NULL COMMENT '充值添加时间',
  `pdr_payment_state` enum('0','1') NOT NULL DEFAULT '0' COMMENT '支付状态 0未支付1支付',
  `pdr_paymenttime` int(11) NOT NULL DEFAULT '0' COMMENT '支付时间',
  `pdr_admin` varchar(30) DEFAULT '' COMMENT '管理员名',
  PRIMARY KEY (`pdr_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='预存款充值表';


-- -----------------------------
-- Table structure for `ds_pmansong`
-- -----------------------------
DROP TABLE IF EXISTS `ds_pmansong`;
CREATE TABLE `ds_pmansong` (
  `mansong_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '满送活动编号',
  `mansong_name` varchar(50) NOT NULL COMMENT '活动名称',
  `mansongquota_id` int(10) unsigned NOT NULL COMMENT '套餐编号',
  `mansong_starttime` int(10) unsigned NOT NULL COMMENT '活动开始时间',
  `mansong_endtime` int(10) unsigned NOT NULL COMMENT '活动结束时间',
  `member_id` int(10) unsigned NOT NULL COMMENT '用户ID',
  `member_name` varchar(50) NOT NULL COMMENT '用户名',
  `store_id` int(10) unsigned NOT NULL COMMENT '店铺ID',
  `store_name` varchar(50) NOT NULL COMMENT '店铺名称',
  `mansong_state` tinyint(1) unsigned NOT NULL COMMENT '活动状态 1:未发布 2:正常 3:取消 4:失效 5:结束',
  `mansong_remark` varchar(200) NOT NULL COMMENT '满就送备注',
  PRIMARY KEY (`mansong_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='满就送活动表';


-- -----------------------------
-- Table structure for `ds_pmansongquota`
-- -----------------------------
DROP TABLE IF EXISTS `ds_pmansongquota`;
CREATE TABLE `ds_pmansongquota` (
  `mansongquota_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '满就送套餐编号',
  `member_id` int(10) unsigned NOT NULL COMMENT '用户ID',
  `member_name` varchar(50) NOT NULL COMMENT '用户名',
  `store_id` int(10) unsigned NOT NULL COMMENT '店铺ID',
  `store_name` varchar(50) NOT NULL COMMENT '店铺名称',
  `mansongquota_apply_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '申请ID',
  `mansongquota_starttime` int(10) unsigned NOT NULL COMMENT '开始时间',
  `mansongquota_endtime` int(10) unsigned NOT NULL COMMENT '结束时间',
  `mansongquota_state` tinyint(1) unsigned DEFAULT NULL COMMENT '配额状态 1:可用 2:取消 3:结束',
  PRIMARY KEY (`mansongquota_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='满就送套餐表';


-- -----------------------------
-- Table structure for `ds_pmansongrule`
-- -----------------------------
DROP TABLE IF EXISTS `ds_pmansongrule`;
CREATE TABLE `ds_pmansongrule` (
  `mansongrule_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '满就送规则ID',
  `mansong_id` int(10) unsigned NOT NULL COMMENT '满就送活动ID',
  `mansongrule_price` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '满就送级别价格',
  `mansongrule_discount` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '满就送减现金优惠金额',
  `mansong_goods_name` varchar(50) DEFAULT NULL COMMENT '满就送礼品名称',
  `goods_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '满就送商品ID',
  PRIMARY KEY (`mansongrule_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='满就送活动规则表';


-- -----------------------------
-- Table structure for `ds_pmgdiscountquota`
-- -----------------------------
DROP TABLE IF EXISTS `ds_pmgdiscountquota`;
CREATE TABLE `ds_pmgdiscountquota` (
  `mgdiscountquota_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '会员等级折扣套餐ID',
  `member_id` int(10) unsigned NOT NULL COMMENT '用户ID',
  `member_name` varchar(50) NOT NULL COMMENT '用户名',
  `store_id` int(10) unsigned NOT NULL COMMENT '店铺ID',
  `store_name` varchar(50) NOT NULL COMMENT '店铺名称',
  `mgdiscountquota_starttime` int(10) unsigned NOT NULL COMMENT '会员等级折扣套餐开始时间',
  `mgdiscountquota_endtime` int(10) unsigned NOT NULL COMMENT '会员等级折扣套餐结束时间',
  PRIMARY KEY (`mgdiscountquota_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='会员等级折扣套餐表';


-- -----------------------------
-- Table structure for `ds_pointscart`
-- -----------------------------
DROP TABLE IF EXISTS `ds_pointscart`;
CREATE TABLE `ds_pointscart` (
  `pcart_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '积分购物车自增ID',
  `pmember_id` int(11) NOT NULL COMMENT '会员ID',
  `pgoods_id` int(11) NOT NULL COMMENT '积分礼品序号',
  `pgoods_name` varchar(100) NOT NULL COMMENT '积分礼品名称',
  `pgoods_points` int(11) NOT NULL COMMENT '积分礼品兑换积分',
  `pgoods_choosenum` int(11) NOT NULL COMMENT '选择积分礼品数量',
  `pgoods_image` varchar(100) DEFAULT NULL COMMENT '积分礼品图片',
  PRIMARY KEY (`pcart_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='积分礼品兑换购物车';


-- -----------------------------
-- Table structure for `ds_pointsgoods`
-- -----------------------------
DROP TABLE IF EXISTS `ds_pointsgoods`;
CREATE TABLE `ds_pointsgoods` (
  `pgoods_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '积分礼品自增ID',
  `pgoods_name` varchar(100) NOT NULL COMMENT '积分礼品名称',
  `pgoods_price` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '积分礼品原价',
  `pgoods_points` int(11) NOT NULL COMMENT '积分礼品兑换积分',
  `pgoods_image` varchar(100) NOT NULL COMMENT '积分礼品封面图片',
  `pgoods_tag` varchar(100) NOT NULL COMMENT '积分礼品标签',
  `pgoods_serial` varchar(50) NOT NULL COMMENT '积分礼品货号',
  `pgoods_storage` int(11) NOT NULL DEFAULT '0' COMMENT '积分礼品库存',
  `pgoods_show` tinyint(1) NOT NULL COMMENT '积分礼品上架 0:下架 1:上架',
  `pgoods_commend` tinyint(1) NOT NULL COMMENT '积分礼品是否推荐',
  `pgoods_addtime` int(11) NOT NULL COMMENT '积分礼品添加时间',
  `pgoods_keywords` varchar(100) DEFAULT NULL COMMENT '积分礼品关键字',
  `pgoods_description` varchar(200) DEFAULT NULL COMMENT '积分礼品描述',
  `pgoods_body` text COMMENT '积分礼品内容',
  `pgoods_state` tinyint(1) NOT NULL DEFAULT '0' COMMENT '积分礼品状态 0:开启 1:禁售',
  `pgoods_close_reason` varchar(255) DEFAULT NULL COMMENT '积分礼品禁售原因',
  `pgoods_salenum` int(11) NOT NULL DEFAULT '0' COMMENT '积分礼品售出数量',
  `pgoods_view` int(11) NOT NULL DEFAULT '0' COMMENT '积分商品浏览量',
  `pgoods_islimit` tinyint(1) NOT NULL COMMENT '是否限制兑换数量',
  `pgoods_limitnum` int(11) DEFAULT NULL COMMENT '限制兑换数量',
  `pgoods_islimittime` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否限制兑换时间 0:不限制 1:限制',
  `pgoods_limitmgrade` int(11) NOT NULL DEFAULT '0' COMMENT '限制参与兑换的会员级别',
  `pgoods_starttime` int(11) DEFAULT NULL COMMENT '积分兑换开始时间',
  `pgoods_endtime` int(11) DEFAULT NULL COMMENT '积分兑换结束时间',
  `pgoods_sort` int(11) NOT NULL DEFAULT '0' COMMENT '积分礼品排序',
  PRIMARY KEY (`pgoods_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='积分礼品表';


-- -----------------------------
-- Table structure for `ds_pointslog`
-- -----------------------------
DROP TABLE IF EXISTS `ds_pointslog`;
CREATE TABLE `ds_pointslog` (
  `pl_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '积分日志自增ID',
  `pl_memberid` int(11) NOT NULL COMMENT '会员ID',
  `pl_membername` varchar(100) NOT NULL COMMENT '会员名称',
  `pl_adminid` int(11) DEFAULT NULL COMMENT '管理员ID',
  `pl_adminname` varchar(100) DEFAULT NULL COMMENT '管理员名称',
  `pl_points` int(11) NOT NULL DEFAULT '0' COMMENT '积分数 负数为扣除',
  `pl_addtime` int(11) NOT NULL COMMENT '积分添加时间',
  `pl_desc` varchar(100) NOT NULL COMMENT '积分操作描述',
  `pl_stage` varchar(50) NOT NULL COMMENT '积分操作阶段',
  PRIMARY KEY (`pl_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COMMENT='会员积分日志表';

-- -----------------------------
-- Records of `ds_pointslog`
-- -----------------------------
INSERT INTO `ds_pointslog` VALUES ('1', '2', 'buyer', '', '', '5', '1543550729', '注册会员', 'regist');
INSERT INTO `ds_pointslog` VALUES ('2', '3', 'test', '', '', '5', '1543562542', '注册会员', 'regist');

-- -----------------------------
-- Table structure for `ds_pointsorder`
-- -----------------------------
DROP TABLE IF EXISTS `ds_pointsorder`;
CREATE TABLE `ds_pointsorder` (
  `point_orderid` int(11) NOT NULL AUTO_INCREMENT COMMENT '兑换订单自增ID',
  `point_ordersn` varchar(20) NOT NULL COMMENT '兑换订单编号',
  `point_buyerid` int(11) NOT NULL COMMENT '兑换会员ID',
  `point_buyername` varchar(50) NOT NULL COMMENT '兑换会员姓名',
  `point_buyeremail` varchar(100) DEFAULT NULL COMMENT '兑换会员email',
  `point_addtime` int(11) NOT NULL COMMENT '兑换订单添加时间',
  `point_shippingtime` int(11) DEFAULT NULL COMMENT '兑换配送时间',
  `point_shippingcode` varchar(50) DEFAULT NULL COMMENT '兑换物流单号',
  `point_shipping_ecode` varchar(30) DEFAULT NULL COMMENT '兑换物流公司编码',
  `point_finnshedtime` int(11) DEFAULT NULL COMMENT '兑换订单完成时间',
  `point_allpoint` int(11) NOT NULL DEFAULT '0' COMMENT '兑换总积分',
  `point_ordermessage` varchar(300) DEFAULT NULL COMMENT '兑换订单留言',
  `point_orderstate` int(11) NOT NULL DEFAULT '20' COMMENT '订单状态：20:已兑换并扣除积分;30:已发货;40:已收货;50:已完成;2:已取消',
  PRIMARY KEY (`point_orderid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='兑换订单表';


-- -----------------------------
-- Table structure for `ds_pointsorderaddress`
-- -----------------------------
DROP TABLE IF EXISTS `ds_pointsorderaddress`;
CREATE TABLE `ds_pointsorderaddress` (
  `pointoa_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '积分兑换地址自增ID',
  `pointoa_orderid` int(11) NOT NULL COMMENT '订单id',
  `pointoa_truename` varchar(50) NOT NULL COMMENT '收货人姓名',
  `pointoa_areaid` int(11) NOT NULL COMMENT '地区id',
  `pointoa_areainfo` varchar(100) NOT NULL COMMENT '地区内容',
  `pointoa_address` varchar(200) NOT NULL COMMENT '详细地址',
  `pointoa_zipcode` varchar(20) NOT NULL COMMENT '邮政编码',
  `pointoa_telphone` varchar(20) NOT NULL COMMENT '电话号码',
  `pointoa_mobphone` varchar(20) NOT NULL COMMENT '手机号码',
  PRIMARY KEY (`pointoa_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='积分兑换地址表';


-- -----------------------------
-- Table structure for `ds_pointsordergoods`
-- -----------------------------
DROP TABLE IF EXISTS `ds_pointsordergoods`;
CREATE TABLE `ds_pointsordergoods` (
  `pointog_recid` int(11) NOT NULL AUTO_INCREMENT COMMENT '积分订单商品自增ID',
  `pointog_orderid` int(11) NOT NULL COMMENT '订单ID',
  `pointog_goodsid` int(11) NOT NULL COMMENT '礼品ID',
  `pointog_goodsname` varchar(100) NOT NULL COMMENT '礼品名称',
  `pointog_goodspoints` int(11) NOT NULL COMMENT '礼品兑换积分',
  `pointog_goodsnum` int(11) NOT NULL COMMENT '礼品数量',
  `pointog_goodsimage` varchar(100) DEFAULT NULL COMMENT '礼品图片',
  PRIMARY KEY (`pointog_recid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='兑换订单商品表';


-- -----------------------------
-- Table structure for `ds_ppintuan`
-- -----------------------------
DROP TABLE IF EXISTS `ds_ppintuan`;
CREATE TABLE `ds_ppintuan` (
  `pintuan_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '拼团自增ID',
  `member_id` int(11) unsigned NOT NULL COMMENT '用户ID',
  `member_name` varchar(50) NOT NULL COMMENT '用户名',
  `store_name` varchar(50) NOT NULL COMMENT '店铺名称',
  `store_id` int(11) unsigned NOT NULL COMMENT '店铺ID',
  `pintuanquota_id` int(10) unsigned NOT NULL COMMENT '拼团套餐ID',
  `pintuan_name` varchar(50) NOT NULL COMMENT '拼团名称',
  `pintuan_goods_id` int(11) unsigned NOT NULL COMMENT '商品ID',
  `pintuan_goods_name` varchar(50) NOT NULL COMMENT '拼团名称',
  `pintuan_goods_commonid` int(10) unsigned NOT NULL COMMENT '商品公共表ID',
  `pintuan_zhe` int(10) unsigned NOT NULL COMMENT '拼团折扣',
  `pintuan_image` varchar(50) DEFAULT NULL COMMENT '拼团图片',
  `pintuan_starttime` int(10) unsigned NOT NULL COMMENT '拼团开始时间',
  `pintuan_end_time` int(10) unsigned NOT NULL COMMENT '拼团结束时间',
  `pintuan_limit_number` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '成团人数',
  `pintuan_limit_hour` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '成团时限',
  `pintuan_limit_quantity` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '成团数量限制',
  `pintuan_count` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '组团数量',
  `pintuan_ok_count` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '成功组团数量',
  `pintuan_state` tinyint(3) unsigned NOT NULL DEFAULT '1' COMMENT '状态，0:取消 1:正常',
  PRIMARY KEY (`pintuan_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='店铺拼团表';

-- -----------------------------
-- Records of `ds_ppintuan`
-- -----------------------------
INSERT INTO `ds_ppintuan` VALUES ('1', '1', 'admin', 'admin', '1', '0', '12231231', '105', '超薄5.5寸移动电信全网通4G双曲屏学生智能指纹一体一加手机', '96', '1', '1_2017092901182073726.jpg', '1543507200', '1548864000', '2', '2', '1', '0', '0', '1');

-- -----------------------------
-- Table structure for `ds_ppintuangroup`
-- -----------------------------
DROP TABLE IF EXISTS `ds_ppintuangroup`;
CREATE TABLE `ds_ppintuangroup` (
  `pintuangroup_id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '拼团开团ID',
  `pintuan_id` int(10) unsigned NOT NULL COMMENT '拼团ID',
  `pintuangroup_goods_id` int(10) unsigned NOT NULL COMMENT '商品ID',
  `pintuangroup_limit_number` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '成团人数',
  `pintuangroup_limit_hour` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '成团时限',
  `pintuangroup_joined` int(10) unsigned NOT NULL COMMENT '己参团人数',
  `pintuangroup_headid` int(10) unsigned NOT NULL COMMENT '团长用户编号',
  `pintuangroup_starttime` int(10) unsigned NOT NULL COMMENT '开团时间',
  `pintuangroup_endtime` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '结束时间 成功或失败',
  `pintuangroup_state` tinyint(3) unsigned NOT NULL DEFAULT '1' COMMENT '状态，0:取消 1:参团中 2:成功',
  PRIMARY KEY (`pintuangroup_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='拼团开团表';


-- -----------------------------
-- Table structure for `ds_ppintuanorder`
-- -----------------------------
DROP TABLE IF EXISTS `ds_ppintuanorder`;
CREATE TABLE `ds_ppintuanorder` (
  `pintuanorder_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '拼团开团ID',
  `pintuan_id` int(10) unsigned NOT NULL COMMENT '拼团ID',
  `pintuangroup_id` int(11) unsigned NOT NULL COMMENT '拼团开团ID',
  `order_id` int(11) NOT NULL COMMENT '订单ID',
  `order_sn` varchar(20) NOT NULL COMMENT '订单编号',
  `pintuanorder_isfirst` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '是否首团订单，0:否 1:是',
  `pintuanorder_state` tinyint(3) unsigned NOT NULL DEFAULT '1' COMMENT '状态，0:取消 1:参团中 2:成功',
  PRIMARY KEY (`pintuanorder_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='拼团订单辅助表';


-- -----------------------------
-- Table structure for `ds_ppintuanquota`
-- -----------------------------
DROP TABLE IF EXISTS `ds_ppintuanquota`;
CREATE TABLE `ds_ppintuanquota` (
  `pintuanquota_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '拼团套餐ID',
  `member_id` int(11) unsigned NOT NULL COMMENT '用户ID',
  `member_name` varchar(50) NOT NULL COMMENT '用户名',
  `store_id` int(11) unsigned NOT NULL COMMENT '店铺ID',
  `store_name` varchar(50) NOT NULL COMMENT '店铺名称',
  `pintuanquota_starttime` int(10) unsigned NOT NULL COMMENT '拼团套餐开始时间',
  `pintuanquota_endtime` int(10) unsigned NOT NULL COMMENT '拼团套餐结束时间',
  PRIMARY KEY (`pintuanquota_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='拼团套餐表';


-- -----------------------------
-- Table structure for `ds_pxianshi`
-- -----------------------------
DROP TABLE IF EXISTS `ds_pxianshi`;
CREATE TABLE `ds_pxianshi` (
  `xianshi_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '限时折扣自增ID',
  `member_id` int(10) unsigned NOT NULL COMMENT '用户ID',
  `member_name` varchar(50) NOT NULL COMMENT '用户名',
  `store_name` varchar(50) NOT NULL COMMENT '店铺名称',
  `store_id` int(10) unsigned NOT NULL COMMENT '店铺ID',
  `xianshiquota_id` int(10) unsigned NOT NULL COMMENT '套餐ID',
  `xianshi_name` varchar(50) NOT NULL COMMENT '活动名称',
  `xianshi_title` varchar(10) DEFAULT NULL COMMENT '活动标题',
  `xianshi_explain` varchar(50) DEFAULT NULL COMMENT '活动说明',
  `xianshi_starttime` int(10) unsigned NOT NULL COMMENT '活动开始时间',
  `xianshi_end_time` int(10) unsigned NOT NULL COMMENT '活动结束时间',
  `xianshi_lower_limit` int(10) unsigned NOT NULL DEFAULT '1' COMMENT '购买下限，1:不限制',
  `xianshi_state` tinyint(3) unsigned NOT NULL DEFAULT '1' COMMENT '状态，0:取消 1:正常',
  PRIMARY KEY (`xianshi_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='限时折扣活动表';


-- -----------------------------
-- Table structure for `ds_pxianshigoods`
-- -----------------------------
DROP TABLE IF EXISTS `ds_pxianshigoods`;
CREATE TABLE `ds_pxianshigoods` (
  `xianshigoods_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '限时折扣商品表',
  `xianshi_id` int(10) unsigned NOT NULL COMMENT '限时折扣ID',
  `xianshi_name` varchar(50) NOT NULL COMMENT '限时折扣名称',
  `xianshi_title` varchar(10) DEFAULT NULL COMMENT '限时折扣标题',
  `xianshi_explain` varchar(50) DEFAULT NULL COMMENT '限时折扣说明',
  `goods_id` int(10) unsigned NOT NULL COMMENT '商品ID',
  `store_id` int(10) unsigned NOT NULL COMMENT '店铺ID',
  `goods_name` varchar(100) NOT NULL COMMENT '商品名称',
  `goods_price` decimal(10,2) NOT NULL COMMENT '店铺价格',
  `goods_image` varchar(100) NOT NULL COMMENT '商品图片',
  `xianshigoods_price` decimal(10,2) NOT NULL COMMENT '限时折扣价格',
  `xianshigoods_starttime` int(10) unsigned NOT NULL COMMENT '限时折扣开始时间',
  `xianshigoods_end_time` int(10) unsigned NOT NULL COMMENT '限时折扣结束时间',
  `xianshigoods_lower_limit` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '购买下限，0为不限制',
  `xianshigoods_state` tinyint(3) unsigned NOT NULL DEFAULT '1' COMMENT '限时折扣状态，0-取消 1-正常',
  `xianshigoods_recommend` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '限时折扣推荐标志 0-未推荐 1-已推荐',
  `gc_id_1` mediumint(9) DEFAULT '0' COMMENT '商品分类一级ID',
  PRIMARY KEY (`xianshigoods_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='限时折扣商品表';


-- -----------------------------
-- Table structure for `ds_pxianshiquota`
-- -----------------------------
DROP TABLE IF EXISTS `ds_pxianshiquota`;
CREATE TABLE `ds_pxianshiquota` (
  `xianshiquota_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '限时折扣套餐ID',
  `member_id` int(10) unsigned NOT NULL COMMENT '用户ID',
  `member_name` varchar(50) NOT NULL COMMENT '用户名',
  `store_id` int(10) unsigned NOT NULL COMMENT '店铺ID',
  `store_name` varchar(50) NOT NULL COMMENT '店铺名称',
  `xianshiquota_starttime` int(10) unsigned NOT NULL COMMENT '限时折扣套餐开始时间',
  `xianshiquota_endtime` int(10) unsigned NOT NULL COMMENT '限时折扣套餐结束时间',
  PRIMARY KEY (`xianshiquota_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='限时折扣套餐表';

-- -----------------------------
-- Records of `ds_pxianshiquota`
-- -----------------------------
INSERT INTO `ds_pxianshiquota` VALUES ('1', '3', 'test', '2', 'test', '1543563871', '1553931871');

-- -----------------------------
-- Table structure for `ds_rcblog`
-- -----------------------------
DROP TABLE IF EXISTS `ds_rcblog`;
CREATE TABLE `ds_rcblog` (
  `rcblog_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '余额变更日志自增ID',
  `member_id` int(11) NOT NULL COMMENT '会员ID',
  `member_name` varchar(50) NOT NULL COMMENT '会员名称',
  `rcblog_type` varchar(15) NOT NULL DEFAULT '' COMMENT 'order_pay:下单使用 order_freeze:下单冻结 order_cancel:取消订单解冻 order_comb_pay:下单扣除被冻结 recharge:平台充值卡充值 refund:确认退款 vr_refund:虚拟兑码退款',
  `rcblog_addtime` int(11) NOT NULL COMMENT '变更添加时间',
  `available_amount` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '可用充值卡余额变更 0表示未变更',
  `freeze_amount` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '冻结充值卡余额变更 0表示未变更',
  `rcblog_description` varchar(150) DEFAULT NULL COMMENT '变更描述',
  PRIMARY KEY (`rcblog_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='充值卡余额变更日志表';


-- -----------------------------
-- Table structure for `ds_rechargecard`
-- -----------------------------
DROP TABLE IF EXISTS `ds_rechargecard`;
CREATE TABLE `ds_rechargecard` (
  `rc_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '充值卡自增ID',
  `rc_sn` varchar(50) NOT NULL COMMENT '充值卡卡号',
  `rc_denomination` decimal(10,2) NOT NULL COMMENT '充值卡面额',
  `rc_batchflag` varchar(20) NOT NULL COMMENT '充值卡批次标识',
  `rc_admin_name` varchar(50) DEFAULT NULL COMMENT '充值卡创建者名称',
  `rc_tscreated` int(10) unsigned NOT NULL COMMENT '充值卡创建时间',
  `rc_tsused` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '充值卡使用时间',
  `rc_state` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '充值卡状态 0可用 1已用 2已删',
  `member_id` int(11) NOT NULL DEFAULT '0' COMMENT '使用者会员ID',
  `member_name` varchar(50) DEFAULT NULL COMMENT '使用者会员名称',
  PRIMARY KEY (`rc_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='平台充值卡';


-- -----------------------------
-- Table structure for `ds_refundreason`
-- -----------------------------
DROP TABLE IF EXISTS `ds_refundreason`;
CREATE TABLE `ds_refundreason` (
  `reason_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '原因自增ID',
  `reason_info` varchar(50) NOT NULL COMMENT '原因内容',
  `reason_sort` tinyint(1) unsigned DEFAULT '255' COMMENT '退款退货原因排序',
  `reason_updatetime` int(10) unsigned NOT NULL COMMENT '退款退货原因更新时间',
  PRIMARY KEY (`reason_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COMMENT='退款退货原因表';

-- -----------------------------
-- Records of `ds_refundreason`
-- -----------------------------
INSERT INTO `ds_refundreason` VALUES ('1', '效果不好不喜欢', '1', '1393480261');
INSERT INTO `ds_refundreason` VALUES ('2', '商品破损、有污渍', '2', '1393480261');
INSERT INTO `ds_refundreason` VALUES ('3', '保质期不符', '3', '1393480261');
INSERT INTO `ds_refundreason` VALUES ('4', '认为是假货', '4', '1393480261');
INSERT INTO `ds_refundreason` VALUES ('5', '不能按时发货', '5', '1393480261');

-- -----------------------------
-- Table structure for `ds_refundreturn`
-- -----------------------------
DROP TABLE IF EXISTS `ds_refundreturn`;
CREATE TABLE `ds_refundreturn` (
  `refund_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '退款退货记录自增ID',
  `order_id` int(10) unsigned NOT NULL COMMENT '订单ID',
  `order_sn` varchar(20) NOT NULL COMMENT '订单编号',
  `refund_sn` varchar(50) NOT NULL COMMENT '申请编号',
  `store_id` int(10) unsigned NOT NULL COMMENT '店铺ID',
  `store_name` varchar(20) NOT NULL COMMENT '店铺名称',
  `buyer_id` int(10) unsigned NOT NULL COMMENT '买家ID',
  `buyer_name` varchar(50) NOT NULL COMMENT '买家会员名',
  `goods_id` int(10) unsigned NOT NULL COMMENT '商品ID,0:全部退款',
  `order_goods_id` int(10) unsigned DEFAULT '0' COMMENT '订单商品ID,0:全部退款',
  `goods_name` varchar(50) NOT NULL COMMENT '商品名称',
  `goods_num` int(10) unsigned DEFAULT '1' COMMENT '商品数量',
  `refund_amount` decimal(10,2) DEFAULT '0.00' COMMENT '退款金额',
  `goods_image` varchar(100) DEFAULT NULL COMMENT '商品图片',
  `order_goods_type` tinyint(1) unsigned DEFAULT '1' COMMENT '订单商品类型:1:默认2:抢购商品3:限时折扣商品4:组合套装 5:赠品6:拼团7:会员等级折扣',
  `refund_type` tinyint(1) unsigned DEFAULT '1' COMMENT '申请类型:1:退款,2:退货',
  `seller_state` tinyint(1) unsigned DEFAULT '1' COMMENT '卖家处理状态:1:待审核,2:同意,3:不同意',
  `refund_state` tinyint(1) unsigned DEFAULT '1' COMMENT '申请状态:1:处理中,2:待管理员处理,3:已完成',
  `return_type` tinyint(1) unsigned DEFAULT '1' COMMENT '退货类型:1:不用退货,2:需要退货',
  `order_lock` tinyint(1) unsigned DEFAULT '1' COMMENT '订单锁定类型:1:不用锁定,2:需要锁定',
  `goods_state` tinyint(1) unsigned DEFAULT '1' COMMENT '物流状态:1:待发货,2:待收货,3:未收到,4:已收货',
  `add_time` int(10) unsigned NOT NULL COMMENT '添加时间',
  `seller_time` int(10) unsigned DEFAULT '0' COMMENT '卖家处理时间',
  `admin_time` int(10) unsigned DEFAULT '0' COMMENT '管理员处理时间',
  `reason_id` int(10) unsigned DEFAULT '0' COMMENT '原因ID:0:其它',
  `reason_info` varchar(300) DEFAULT '' COMMENT '原因内容',
  `pic_info` varchar(300) DEFAULT '' COMMENT '退款退货图片',
  `buyer_message` varchar(300) DEFAULT NULL COMMENT '退款退货申请原因',
  `seller_message` varchar(300) DEFAULT NULL COMMENT '卖家备注',
  `admin_message` varchar(300) DEFAULT NULL COMMENT '管理员备注',
  `express_id` tinyint(1) unsigned DEFAULT '0' COMMENT '物流公司编号',
  `invoice_no` varchar(50) DEFAULT NULL COMMENT '物流单号',
  `ship_time` int(10) unsigned DEFAULT '0' COMMENT '发货时间,默认为0',
  `delay_time` int(10) unsigned DEFAULT '0' COMMENT '收货延迟时间,默认为0',
  `receive_time` int(10) unsigned DEFAULT '0' COMMENT '收货时间,默认为0',
  `receive_message` varchar(300) DEFAULT NULL COMMENT '收货备注',
  `commis_rate` smallint(6) DEFAULT '0' COMMENT '佣金比例',
  PRIMARY KEY (`refund_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='退款退货表';


-- -----------------------------
-- Table structure for `ds_seller`
-- -----------------------------
DROP TABLE IF EXISTS `ds_seller`;
CREATE TABLE `ds_seller` (
  `seller_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '卖家自增ID',
  `seller_name` varchar(50) NOT NULL COMMENT '卖家用户名',
  `member_id` int(10) unsigned NOT NULL COMMENT '用户ID',
  `sellergroup_id` int(10) unsigned NOT NULL COMMENT '卖家组ID',
  `store_id` int(10) unsigned NOT NULL COMMENT '店铺ID',
  `is_admin` tinyint(3) unsigned NOT NULL COMMENT '是否管理员 0:不是 1:是',
  `last_logintime` int(10) unsigned DEFAULT NULL COMMENT '最后登录时间',
  PRIMARY KEY (`seller_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COMMENT='卖家用户表';

-- -----------------------------
-- Records of `ds_seller`
-- -----------------------------
INSERT INTO `ds_seller` VALUES ('1', 'admin', '1', '0', '1', '1', '1543573488');
INSERT INTO `ds_seller` VALUES ('2', 'test', '3', '0', '2', '1', '1543562573');

-- -----------------------------
-- Table structure for `ds_sellergroup`
-- -----------------------------
DROP TABLE IF EXISTS `ds_sellergroup`;
CREATE TABLE `ds_sellergroup` (
  `sellergroup_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '卖家组自增ID',
  `sellergroup_name` varchar(50) NOT NULL COMMENT '卖家组名称',
  `sellergroup_limits` text NOT NULL COMMENT '卖家组权限',
  `smt_limits` text NOT NULL COMMENT '消卖家组息权限范围',
  `store_id` int(10) unsigned NOT NULL COMMENT '店铺ID',
  PRIMARY KEY (`sellergroup_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='卖家用户组表';


-- -----------------------------
-- Table structure for `ds_sellerlog`
-- -----------------------------
DROP TABLE IF EXISTS `ds_sellerlog`;
CREATE TABLE `ds_sellerlog` (
  `sellerlog_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '卖家日志自增ID',
  `sellerlog_content` varchar(100) NOT NULL COMMENT '卖家日志内容',
  `sellerlog_time` int(10) unsigned NOT NULL COMMENT '卖家日志时间',
  `sellerlog_seller_id` int(10) unsigned NOT NULL COMMENT '卖家ID',
  `sellerlog_seller_name` varchar(50) NOT NULL COMMENT '卖家帐号',
  `sellerlog_store_id` int(10) unsigned NOT NULL COMMENT '店铺编号',
  `sellerlog_seller_ip` varchar(50) NOT NULL COMMENT '卖家ip',
  `sellerlog_url` varchar(100) NOT NULL COMMENT '卖家日志url',
  `sellerlog_state` tinyint(3) unsigned NOT NULL COMMENT '日志状态 0:失败 1:成功',
  PRIMARY KEY (`sellerlog_id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8 COMMENT='卖家日志表';

-- -----------------------------
-- Records of `ds_sellerlog`
-- -----------------------------
INSERT INTO `ds_sellerlog` VALUES ('1', '登录成功', '1543550756', '1', 'admin', '1', '0.0.0.0', 'home/Sellerlogin/login', '1');
INSERT INTO `ds_sellerlog` VALUES ('2', '登录成功', '1543551822', '1', 'admin', '1', '0.0.0.0', 'home/Sellerlogin/login', '1');
INSERT INTO `ds_sellerlog` VALUES ('3', '注销成功', '1543562547', '1', 'admin', '1', '0.0.0.0', 'home/Sellerlogin/logout', '1');
INSERT INTO `ds_sellerlog` VALUES ('4', '登录成功', '1543562573', '2', 'test', '2', '0.0.0.0', 'home/Sellerlogin/login', '1');
INSERT INTO `ds_sellerlog` VALUES ('5', '购买2份限时折扣套餐，单价：10元', '1543563871', '2', 'test', '2', '0.0.0.0', 'home/Sellerpromotionxianshi/xianshi_quota_add_save', '1');
INSERT INTO `ds_sellerlog` VALUES ('6', '购买2份限时折扣套餐，单价：10元', '1543563883', '2', 'test', '2', '0.0.0.0', 'home/Sellerpromotionxianshi/xianshi_quota_add_save', '1');
INSERT INTO `ds_sellerlog` VALUES ('7', '登录成功', '1543573488', '1', 'admin', '1', '0.0.0.0', 'home/Sellerlogin/login', '1');
INSERT INTO `ds_sellerlog` VALUES ('8', '商品下架，平台货号：118,117', '1543574118', '1', 'admin', '1', '0.0.0.0', 'home/Sellergoodsonline/goods_unshow', '1');
INSERT INTO `ds_sellerlog` VALUES ('9', '商品下架，平台货号：116,115,114,113,112,111,110,109,108,107', '1543574170', '1', 'admin', '1', '0.0.0.0', 'home/Sellergoodsonline/goods_unshow', '1');
INSERT INTO `ds_sellerlog` VALUES ('10', '删除商品，平台货号：106,105,104,103,102,101,100,99,98,97', '1543574175', '1', 'admin', '1', '0.0.0.0', 'home/Sellergoodsonline/drop_goods', '1');
INSERT INTO `ds_sellerlog` VALUES ('11', '添加分销商品，商品编号：96', '1543574393', '1', 'admin', '1', '0.0.0.0', 'home/Sellerinviter/goods_add', '1');
INSERT INTO `ds_sellerlog` VALUES ('12', '编辑分销商品，商品编号：96', '1543574495', '1', 'admin', '1', '0.0.0.0', 'home/Sellerinviter/goods_edit', '1');
INSERT INTO `ds_sellerlog` VALUES ('13', '添加拼团活动，活动名称：12231231，活动编号：1', '1543575133', '1', 'admin', '1', '0.0.0.0', 'home/Sellerpromotionpintuan/pintuan_add', '1');

-- -----------------------------
-- Table structure for `ds_seo`
-- -----------------------------
DROP TABLE IF EXISTS `ds_seo`;
CREATE TABLE `ds_seo` (
  `seo_id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT COMMENT 'SEO自增ID',
  `seo_title` varchar(255) NOT NULL COMMENT 'SEO标题',
  `seo_keywords` varchar(255) NOT NULL COMMENT 'SEO关键词',
  `seo_description` text NOT NULL COMMENT 'SEO描述',
  `seo_type` varchar(20) NOT NULL COMMENT 'SEO类型',
  PRIMARY KEY (`seo_id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8 COMMENT='SEO信息存放表';

-- -----------------------------
-- Records of `ds_seo`
-- -----------------------------
INSERT INTO `ds_seo` VALUES ('1', '{sitename} - 程序来源于德尚网络', 'DSMALL,PHP商城系统,DSMALL商城系统,多用户商城系统,电商ERP,电商CRM,电子商务解决方案', '', 'index');
INSERT INTO `ds_seo` VALUES ('2', '{sitename} - 抢购', 'DSMALL,{sitename}', '', 'group');
INSERT INTO `ds_seo` VALUES ('3', '{sitename} - {name}', 'DSMALL,{name},{sitename}', 'DSMALL,{name},{sitename}', 'group_content');
INSERT INTO `ds_seo` VALUES ('4', '{sitename} - 品牌', 'DSMALL,{sitename}', 'DSMALL,{sitename}', 'brand');
INSERT INTO `ds_seo` VALUES ('5', '{sitename} - {name}', 'DSMALL,{sitename},{name}', 'DSMALL,{sitename},{name}', 'brand_list');
INSERT INTO `ds_seo` VALUES ('7', '{sitename} - {name}', 'DSMALL,{sitename},{name}', 'DSMALL,{sitename},{name}', 'coupon_content');
INSERT INTO `ds_seo` VALUES ('8', '{sitename} - 积分商城', 'DSMALL,{sitename}', 'DSMALL,{sitename}', 'point');
INSERT INTO `ds_seo` VALUES ('9', '{sitename} - {name}', 'DSMALL,{sitename},{key}', 'DSMALL,{sitename},{description}', 'point_content');
INSERT INTO `ds_seo` VALUES ('10', '{sitename} - {article_class}', 'DSMALL,{sitename}', 'DSMALL,{sitename}', 'article');
INSERT INTO `ds_seo` VALUES ('11', '{sitename} - {name}', 'DSMALL,{sitename},{key}', 'DSMALL,{sitename},{description}', 'article_content');
INSERT INTO `ds_seo` VALUES ('12', '{sitename} - {shopname}', 'DSMALL,{sitename},{key}', 'DSMALL,{sitename},{description}', 'shop');
INSERT INTO `ds_seo` VALUES ('13', '{name} - {sitename}', 'DSMALL,{sitename},{key}', 'DSMALL,{sitename},{description}', 'product');
INSERT INTO `ds_seo` VALUES ('14', '看{name}怎么淘到好的宝贝-{sitename}', 'DSMALL,{sitename},{name}', 'DSMALL,{sitename},{name}', 'sns');

-- -----------------------------
-- Table structure for `ds_smslog`
-- -----------------------------
DROP TABLE IF EXISTS `ds_smslog`;
CREATE TABLE `ds_smslog` (
  `smslog_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '短信记录自增ID',
  `smslog_phone` char(11) NOT NULL COMMENT '短信手机号',
  `smslog_captcha` char(6) NOT NULL COMMENT '短信动态码',
  `smslog_ip` varchar(15) NOT NULL COMMENT '短信请求IP',
  `smslog_msg` varchar(300) NOT NULL COMMENT '短信内容',
  `smslog_type` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '短信类型:1为注册,2为登录,3为找回密码,默认为1',
  `smslog_smstime` int(10) unsigned NOT NULL COMMENT '短信添加时间',
  `member_id` int(10) unsigned DEFAULT '0' COMMENT '短信会员ID,注册为0',
  `member_name` varchar(50) DEFAULT '' COMMENT '短信会员名',
  PRIMARY KEY (`smslog_id`),
  KEY `smslog_phone` (`smslog_phone`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='手机短信记录表';


-- -----------------------------
-- Table structure for `ds_snsalbumclass`
-- -----------------------------
DROP TABLE IF EXISTS `ds_snsalbumclass`;
CREATE TABLE `ds_snsalbumclass` (
  `ac_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '相册自增ID',
  `member_id` int(10) unsigned NOT NULL COMMENT '会员ID',
  `ac_name` varchar(100) NOT NULL COMMENT '相册名称',
  `ac_des` varchar(255) NOT NULL COMMENT '相册描述',
  `ac_sort` tinyint(3) unsigned NOT NULL COMMENT '相册排序',
  `ac_cover` varchar(255) DEFAULT NULL COMMENT '相册封面',
  `ac_uploadtime` int(10) unsigned NOT NULL COMMENT '图片上传时间',
  `ac_isdefault` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '是否为买家秀相册  1:是 0:否',
  PRIMARY KEY (`ac_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COMMENT='相册表';

-- -----------------------------
-- Records of `ds_snsalbumclass`
-- -----------------------------
INSERT INTO `ds_snsalbumclass` VALUES ('1', '2', '买家秀', '买家秀默认相册', '1', '', '1543550729', '1');
INSERT INTO `ds_snsalbumclass` VALUES ('2', '3', '买家秀', '买家秀默认相册', '1', '', '1543562542', '1');

-- -----------------------------
-- Table structure for `ds_snsalbumpic`
-- -----------------------------
DROP TABLE IF EXISTS `ds_snsalbumpic`;
CREATE TABLE `ds_snsalbumpic` (
  `ap_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '相册图片自增ID',
  `ac_id` int(10) unsigned DEFAULT NULL COMMENT '相册ID',
  `member_id` int(10) unsigned NOT NULL COMMENT '会员ID',
  `ap_name` varchar(100) NOT NULL COMMENT '图片名称',
  `ap_cover` varchar(255) NOT NULL COMMENT '图片路径',
  `ap_size` int(10) unsigned NOT NULL COMMENT '图片大小',
  `ap_spec` varchar(100) NOT NULL COMMENT '图片规格',
  `ap_uploadtime` int(10) unsigned NOT NULL COMMENT '图片上传时间',
  `ap_type` tinyint(4) NOT NULL DEFAULT '0' COMMENT '图片类型，0为无、1为买家秀',
  `item_id` tinyint(4) NOT NULL DEFAULT '0' COMMENT '信息ID',
  PRIMARY KEY (`ap_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='相册图片表';


-- -----------------------------
-- Table structure for `ds_snsbinding`
-- -----------------------------
DROP TABLE IF EXISTS `ds_snsbinding`;
CREATE TABLE `ds_snsbinding` (
  `snsbind_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '分享自增ID',
  `snsbind_memberid` int(11) NOT NULL COMMENT '会员ID',
  `snsbind_membername` varchar(100) NOT NULL COMMENT '会员名称',
  `snsbind_appsign` varchar(50) NOT NULL COMMENT '应用标志',
  `snsbind_updatetime` int(11) NOT NULL COMMENT '更新时间',
  `snsbind_openid` varchar(100) NOT NULL COMMENT '应用用户编号',
  `snsbind_openinfo` text COMMENT '应用用户信息',
  `snsbind_accesstoken` varchar(100) NOT NULL COMMENT '访问第三方资源的凭证',
  `snsbind_expiresin` int(11) NOT NULL COMMENT 'accesstoken过期时间，以返回的时间的准，单位为秒，注意过期时提醒用户重新授权',
  `snsbind_refreshtoken` varchar(100) DEFAULT NULL COMMENT '刷新token',
  PRIMARY KEY (`snsbind_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='分享应用用户绑定记录表';


-- -----------------------------
-- Table structure for `ds_snscomment`
-- -----------------------------
DROP TABLE IF EXISTS `ds_snscomment`;
CREATE TABLE `ds_snscomment` (
  `snscomment_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '评论自增ID',
  `snscomment_memberid` int(11) NOT NULL COMMENT '会员ID',
  `snscomment_membername` varchar(100) NOT NULL COMMENT '会员名称',
  `snscomment_memberavatar` varchar(100) DEFAULT NULL COMMENT '会员头像',
  `snscomment_originalid` int(11) NOT NULL COMMENT '原帖ID',
  `snscomment_originaltype` tinyint(1) NOT NULL DEFAULT '0' COMMENT '原帖类型 0表示动态信息 1表示分享商品 默认为0',
  `snscomment_content` varchar(500) NOT NULL COMMENT '评论内容',
  `snscomment_addtime` int(11) NOT NULL COMMENT '添加时间',
  `snscomment_ip` varchar(50) NOT NULL COMMENT '来源IP',
  `snscomment_state` tinyint(1) NOT NULL DEFAULT '0' COMMENT '状态 0正常 1屏蔽',
  PRIMARY KEY (`snscomment_id`)
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8 COMMENT='评论表';

-- -----------------------------
-- Records of `ds_snscomment`
-- -----------------------------
INSERT INTO `ds_snscomment` VALUES ('1', '2', 'buyer', '', '1', '1', '123123231', '1543022325', '0.0.0.0', '0');
INSERT INTO `ds_snscomment` VALUES ('2', '2', 'buyer', '', '1', '1', '213', '1543022451', '0.0.0.0', '0');
INSERT INTO `ds_snscomment` VALUES ('3', '2', 'buyer', '', '1', '1', '123123', '1543022454', '0.0.0.0', '0');
INSERT INTO `ds_snscomment` VALUES ('4', '2', 'buyer', '', '1', '1', '231', '1543022522', '0.0.0.0', '0');
INSERT INTO `ds_snscomment` VALUES ('5', '2', 'buyer', '', '1', '1', '123321132', '1543022527', '0.0.0.0', '0');
INSERT INTO `ds_snscomment` VALUES ('6', '2', 'buyer', '', '1', '1', '123123', '1543022544', '0.0.0.0', '0');
INSERT INTO `ds_snscomment` VALUES ('7', '2', 'buyer', '', '1', '1', '213132', '1543022670', '0.0.0.0', '0');
INSERT INTO `ds_snscomment` VALUES ('8', '2', 'buyer', '', '1', '1', '213', '1543022921', '0.0.0.0', '0');
INSERT INTO `ds_snscomment` VALUES ('9', '2', 'buyer', '', '1', '1', '321321321', '1543023823', '0.0.0.0', '0');
INSERT INTO `ds_snscomment` VALUES ('10', '2', 'buyer', '', '1', '1', '321321', '1543024293', '0.0.0.0', '0');
INSERT INTO `ds_snscomment` VALUES ('11', '2', 'buyer', '', '1', '1', '321321', '1543024293', '0.0.0.0', '0');
INSERT INTO `ds_snscomment` VALUES ('12', '2', 'buyer', '', '1', '1', '321321', '1543024302', '0.0.0.0', '0');
INSERT INTO `ds_snscomment` VALUES ('13', '2', 'buyer', '', '1', '1', '213213', '1543024319', '0.0.0.0', '0');
INSERT INTO `ds_snscomment` VALUES ('14', '2', 'buyer', '', '1', '1', '123123', '1543024323', '0.0.0.0', '0');
INSERT INTO `ds_snscomment` VALUES ('18', '2', 'buyer', '', '11', '0', '1221', '1543024406', '0.0.0.0', '0');
INSERT INTO `ds_snscomment` VALUES ('19', '2', 'buyer', '', '11', '0', '1212', '1543024409', '0.0.0.0', '0');
INSERT INTO `ds_snscomment` VALUES ('20', '2', 'buyer', '', '11', '0', '1', '1543024412', '0.0.0.0', '0');
INSERT INTO `ds_snscomment` VALUES ('21', '2', 'buyer', '', '11', '0', '2', '1543024415', '0.0.0.0', '0');
INSERT INTO `ds_snscomment` VALUES ('22', '2', 'buyer', '', '11', '0', '3', '1543024426', '0.0.0.0', '0');
INSERT INTO `ds_snscomment` VALUES ('23', '2', 'buyer', '', '12', '0', '1', '1543024440', '0.0.0.0', '0');

-- -----------------------------
-- Table structure for `ds_snsfriend`
-- -----------------------------
DROP TABLE IF EXISTS `ds_snsfriend`;
CREATE TABLE `ds_snsfriend` (
  `friend_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '好友自增ID',
  `friend_frommid` int(11) NOT NULL COMMENT '会员ID',
  `friend_frommname` varchar(100) DEFAULT NULL COMMENT '会员名称',
  `friend_frommavatar` varchar(100) DEFAULT NULL COMMENT '会员头像',
  `friend_tomid` int(11) NOT NULL COMMENT '朋友ID',
  `friend_tomname` varchar(100) NOT NULL COMMENT '好友会员名称',
  `friend_tomavatar` varchar(100) DEFAULT NULL COMMENT '好友头像',
  `friend_addtime` int(11) NOT NULL COMMENT '好友添加时间',
  `friend_followstate` tinyint(1) NOT NULL DEFAULT '1' COMMENT '关注状态 1:单方关注 2:双方关注',
  PRIMARY KEY (`friend_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='好友数据表';


-- -----------------------------
-- Table structure for `ds_snsgoods`
-- -----------------------------
DROP TABLE IF EXISTS `ds_snsgoods`;
CREATE TABLE `ds_snsgoods` (
  `snsgoods_goodsid` int(11) NOT NULL COMMENT '商品ID',
  `snsgoods_goodsname` varchar(100) NOT NULL COMMENT '商品名称',
  `snsgoods_goodsimage` varchar(100) DEFAULT NULL COMMENT '商品图片',
  `snsgoods_goodsprice` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '商品价格',
  `snsgoods_storeid` int(11) NOT NULL COMMENT '店铺ID',
  `snsgoods_storename` varchar(100) NOT NULL COMMENT '店铺名称',
  `snsgoods_addtime` int(11) NOT NULL COMMENT '添加时间',
  `snsgoods_likenum` int(11) NOT NULL DEFAULT '0' COMMENT '喜欢数',
  `snsgoods_likemember` text COMMENT '喜欢过的会员ID，用逗号分隔',
  `snsgoods_sharenum` int(11) NOT NULL DEFAULT '0' COMMENT '分享数',
  UNIQUE KEY `snsgoods_goodsid` (`snsgoods_goodsid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='SNS商品表';

-- -----------------------------
-- Records of `ds_snsgoods`
-- -----------------------------
INSERT INTO `ds_snsgoods` VALUES ('15', '方太（FOTILE）云魔方欧式 烟灶套餐', '1_2017092121260662503.jpg', '4299.00', '1', 'admin', '1543021203', '1', '2', '2');

-- -----------------------------
-- Table structure for `ds_snsmembertag`
-- -----------------------------
DROP TABLE IF EXISTS `ds_snsmembertag`;
CREATE TABLE `ds_snsmembertag` (
  `mtag_id` int(10) NOT NULL AUTO_INCREMENT COMMENT '会员标签自增ID',
  `mtag_name` varchar(20) NOT NULL COMMENT '会员标签名称',
  `mtag_sort` tinyint(4) NOT NULL DEFAULT '0' COMMENT '会员标签排序',
  `mtag_recommend` tinyint(4) NOT NULL DEFAULT '0' COMMENT '标签推荐 0:未推荐 1:已推荐',
  `mtag_desc` varchar(50) NOT NULL COMMENT '标签描述',
  `mtag_img` varchar(50) DEFAULT NULL COMMENT '标签图片',
  PRIMARY KEY (`mtag_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='会员标签表';


-- -----------------------------
-- Table structure for `ds_snsmtagmember`
-- -----------------------------
DROP TABLE IF EXISTS `ds_snsmtagmember`;
CREATE TABLE `ds_snsmtagmember` (
  `mtag_id` int(11) NOT NULL COMMENT '会员标签表ID',
  `member_id` int(11) NOT NULL COMMENT '会员ID',
  `recommend` tinyint(4) NOT NULL DEFAULT '0' COMMENT '推荐，默认为0',
  PRIMARY KEY (`mtag_id`,`member_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='会员标签会员对照表';


-- -----------------------------
-- Table structure for `ds_snssharegoods`
-- -----------------------------
DROP TABLE IF EXISTS `ds_snssharegoods`;
CREATE TABLE `ds_snssharegoods` (
  `sharegoods_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '共享商品自增ID',
  `sharegoods_goodsid` int(11) NOT NULL COMMENT '商品ID',
  `sharegoods_memberid` int(11) NOT NULL COMMENT '所属会员ID',
  `sharegoods_membername` varchar(100) NOT NULL COMMENT '会员名称',
  `sharegoods_content` varchar(500) DEFAULT NULL COMMENT '描述内容',
  `sharegoods_addtime` int(11) NOT NULL COMMENT '分享操作时间',
  `sharegoods_likeaddtime` int(11) NOT NULL DEFAULT '0' COMMENT '喜欢操作时间',
  `sharegoods_privacy` tinyint(1) NOT NULL DEFAULT '0' COMMENT '隐私可见度 0:所有人可见 1:好友可见 2:仅自己可见',
  `sharegoods_commentcount` int(11) NOT NULL DEFAULT '0' COMMENT '评论数',
  `sharegoods_isshare` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否分享 0:未分享 1:分享',
  `sharegoods_islike` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否喜欢 0:未喜欢 1:喜欢',
  PRIMARY KEY (`sharegoods_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='共享商品表';

-- -----------------------------
-- Records of `ds_snssharegoods`
-- -----------------------------
INSERT INTO `ds_snssharegoods` VALUES ('1', '15', '2', 'buyer', '213', '1543021211', '1543022275', '1', '14', '1', '1');

-- -----------------------------
-- Table structure for `ds_snssharestore`
-- -----------------------------
DROP TABLE IF EXISTS `ds_snssharestore`;
CREATE TABLE `ds_snssharestore` (
  `sharestore_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '共享店铺自增ID',
  `sharestore_storeid` int(11) NOT NULL COMMENT '店铺ID',
  `sharestore_storename` varchar(100) NOT NULL COMMENT '店铺名称',
  `sharestore_memberid` int(11) NOT NULL COMMENT '会员ID',
  `sharestore_membername` varchar(100) NOT NULL COMMENT '会员名称',
  `sharestore_content` varchar(500) DEFAULT NULL COMMENT '描述内容',
  `sharestore_addtime` int(11) NOT NULL COMMENT '添加时间',
  `sharestore_privacy` tinyint(1) NOT NULL DEFAULT '0' COMMENT '隐私可见度 0:所有人可见 1:好友可见 2:仅自己可见',
  PRIMARY KEY (`sharestore_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COMMENT='共享店铺表';

-- -----------------------------
-- Records of `ds_snssharestore`
-- -----------------------------
INSERT INTO `ds_snssharestore` VALUES ('2', '1', 'admin', '2', 'buyer', '231', '1543021664', '0');

-- -----------------------------
-- Table structure for `ds_snstracelog`
-- -----------------------------
DROP TABLE IF EXISTS `ds_snstracelog`;
CREATE TABLE `ds_snstracelog` (
  `tracelog_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '动态信息自增ID',
  `tracelog_originalid` int(11) NOT NULL DEFAULT '0' COMMENT '原动态ID 默认为0',
  `tracelog_originalmemberid` int(11) NOT NULL DEFAULT '0' COMMENT '原帖会员ID',
  `tracelog_originalstate` tinyint(1) NOT NULL DEFAULT '0' COMMENT '原帖的删除状态 0:正常 1:删除',
  `tracelog_memberid` int(11) NOT NULL COMMENT '会员ID',
  `tracelog_membername` varchar(100) NOT NULL COMMENT '会员名称',
  `tracelog_memberavatar` varchar(100) DEFAULT NULL COMMENT '会员头像',
  `tracelog_title` varchar(500) DEFAULT NULL COMMENT '动态标题',
  `tracelog_content` text NOT NULL COMMENT '动态内容',
  `tracelog_addtime` int(11) NOT NULL COMMENT '添加时间',
  `tracelog_state` tinyint(1) NOT NULL DEFAULT '0' COMMENT '状态  0:正常 1:禁止显示',
  `tracelog_privacy` tinyint(1) NOT NULL DEFAULT '0' COMMENT '隐私可见度 0:所有人可见 1:好友可见 2:仅自己可见',
  `tracelog_commentcount` int(11) NOT NULL DEFAULT '0' COMMENT '评论数',
  `tracelog_copycount` int(11) NOT NULL DEFAULT '0' COMMENT '转发数',
  `tracelog_orgcommentcount` int(11) NOT NULL DEFAULT '0' COMMENT '原帖评论次数',
  `tracelog_orgcopycount` int(11) NOT NULL DEFAULT '0' COMMENT '原帖转帖次数',
  `tracelog_from` tinyint(4) DEFAULT '1' COMMENT '来源 1:shop 2:storetracelog',
  PRIMARY KEY (`tracelog_id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8 COMMENT='动态信息表';

-- -----------------------------
-- Records of `ds_snstracelog`
-- -----------------------------
INSERT INTO `ds_snstracelog` VALUES ('1', '0', '0', '0', '2', 'buyer', '', '12321312', '<div class=\"fd-media\">\r\n					<div class=\"goodsimg\"><a target=\"_blank\" href=\"/git/DSMall/public/index.php/home/goods/index/goods_id/15.html\"><img src=\"http://localhost/git/DSMall/public/uploads/home/store/goods/1/1_2017092121260662503.jpg\" onload=\"javascript:ResizeImage(this,120,120);\" alt=\"方太（FOTILE）云魔方欧式 烟灶套餐\"></a></div>\r\n					<div class=\"goodsinfo\">\r\n						<dl>\r\n							<dt><a target=\"_blank\" href=\"/git/DSMall/public/index.php/home/goods/index/goods_id/15.html\">方太（FOTILE）云魔方欧式 烟灶套餐</a></dt>\r\n							<dd>价&nbsp;&nbsp;格：&yen;4299.00</dd>\r\n							<dd>运&nbsp;&nbsp;费：&yen;0.00</dd>\r\n	                  		<dd dstype=\"collectbtn_15\"><a href=\"javascript:void(0);\" onclick=\"javascript:collect_goods(\\\'15\\\',\\\'succ\\\',\\\'collectbtn_15\\\');\">收藏该宝贝</a></dd>\r\n	                  	</dl>\r\n	                  </div>\r\n	             </div>', '1543021203', '0', '0', '0', '0', '0', '0', '1');
INSERT INTO `ds_snstracelog` VALUES ('2', '0', '0', '0', '2', 'buyer', '', '213', '<div class=\"fd-media\">\r\n					<div class=\"goodsimg\"><a target=\"_blank\" href=\"/git/DSMall/public/index.php/home/goods/index/goods_id/15.html\"><img src=\"http://localhost/git/DSMall/public/uploads/home/store/goods/1/1_2017092121260662503.jpg\" onload=\"javascript:ResizeImage(this,120,120);\" alt=\"方太（FOTILE）云魔方欧式 烟灶套餐\"></a></div>\r\n					<div class=\"goodsinfo\">\r\n						<dl>\r\n							<dt><a target=\"_blank\" href=\"/git/DSMall/public/index.php/home/goods/index/goods_id/15.html\">方太（FOTILE）云魔方欧式 烟灶套餐</a></dt>\r\n							<dd>价&nbsp;&nbsp;格：&yen;4299.00</dd>\r\n							<dd>运&nbsp;&nbsp;费：&yen;0.00</dd>\r\n	                  		<dd dstype=\"collectbtn_15\"><a href=\"javascript:void(0);\" onclick=\"javascript:collect_goods(\\\'15\\\',\\\'succ\\\',\\\'collectbtn_15\\\');\">收藏该宝贝</a></dd>\r\n	                  	</dl>\r\n	                  </div>\r\n	             </div>', '1543021211', '0', '0', '0', '0', '0', '0', '1');
INSERT INTO `ds_snstracelog` VALUES ('3', '0', '0', '0', '2', 'buyer', '', '213321', '<div class=\"fd-media\">\r\n					<div class=\"goodsimg\"><a target=\"_blank\" href=\"/git/DSMall/public/index.php/home/store/index/store_id/1.html\"><img src=\"http://localhost/git/DSMall/public/uploads\\home/common\\default_store_avatar.png\" onload=\"javascript:ResizeImage(this,120,120);\" alt=\"admin\"></a></div>\r\n					<div class=\"goodsinfo\">\r\n						<dl>\r\n							<dt><a target=\"_blank\" href=\"/git/DSMall/public/index.php/home/store/index/store_id/1.html\">admin</a></dt>\r\n	                  		<dd dstype=\"storecollectbtn_1\"><a href=\"javascript:void(0);\" onclick=\"javascript:collect_store(\\\'1\\\',\\\'succ\\\',\\\'storecollectbtn_1\\\');\">收藏该店铺</a></dd>\r\n	                  	</dl>\r\n	                  </div>\r\n	             </div>', '1543021252', '0', '0', '0', '0', '0', '0', '1');
INSERT INTO `ds_snstracelog` VALUES ('4', '0', '0', '0', '2', 'buyer', '', '213321', '<div class=\"fd-media\">\r\n					<div class=\"goodsimg\"><a target=\"_blank\" href=\"/git/DSMall/public/index.php/home/store/index/store_id/1.html\"><img src=\"http://localhost/git/DSMall/public/uploads\\home/common\\default_store_avatar.png\" onload=\"javascript:ResizeImage(this,120,120);\" alt=\"admin\"></a></div>\r\n					<div class=\"goodsinfo\">\r\n						<dl>\r\n							<dt><a target=\"_blank\" href=\"/git/DSMall/public/index.php/home/store/index/store_id/1.html\">admin</a></dt>\r\n	                  		<dd dstype=\"storecollectbtn_1\"><a href=\"javascript:void(0);\" onclick=\"javascript:collect_store(\\\'1\\\',\\\'succ\\\',\\\'storecollectbtn_1\\\');\">收藏该店铺</a></dd>\r\n	                  	</dl>\r\n	                  </div>\r\n	             </div>', '1543021262', '0', '0', '0', '0', '0', '0', '1');
INSERT INTO `ds_snstracelog` VALUES ('5', '0', '0', '0', '2', 'buyer', '', '2134234', '<div class=\"fd-media\">\r\n					<div class=\"goodsimg\"><a target=\"_blank\" href=\"/git/DSMall/public/index.php/home/store/index/store_id/1.html\"><img src=\"http://localhost/git/DSMall/public/uploads\\home/common\\default_store_avatar.png\" onload=\"javascript:ResizeImage(this,120,120);\" alt=\"admin\"></a></div>\r\n					<div class=\"goodsinfo\">\r\n						<dl>\r\n							<dt><a target=\"_blank\" href=\"/git/DSMall/public/index.php/home/store/index/store_id/1.html\">admin</a></dt>\r\n	                  		<dd dstype=\"storecollectbtn_1\"><a href=\"javascript:void(0);\" onclick=\"javascript:collect_store(\\\'1\\\',\\\'succ\\\',\\\'storecollectbtn_1\\\');\">收藏该店铺</a></dd>\r\n	                  	</dl>\r\n	                  </div>\r\n	             </div>', '1543021268', '0', '0', '0', '0', '0', '0', '1');
INSERT INTO `ds_snstracelog` VALUES ('6', '0', '0', '0', '2', 'buyer', '', '321', '<div class=\"fd-media\">\r\n					<div class=\"goodsimg\"><a target=\"_blank\" href=\"/git/DSMall/public/index.php/home/store/index/store_id/1.html\"><img src=\"http://localhost/git/DSMall/public/uploads\\home/common\\default_store_avatar.png\" onload=\"javascript:ResizeImage(this,120,120);\" alt=\"admin\"></a></div>\r\n					<div class=\"goodsinfo\">\r\n						<dl>\r\n							<dt><a target=\"_blank\" href=\"/git/DSMall/public/index.php/home/store/index/store_id/1.html\">admin</a></dt>\r\n	                  		<dd dstype=\"storecollectbtn_1\"><a href=\"javascript:void(0);\" onclick=\"javascript:collect_store(\\\'1\\\',\\\'succ\\\',\\\'storecollectbtn_1\\\');\">收藏该店铺</a></dd>\r\n	                  	</dl>\r\n	                  </div>\r\n	             </div>', '1543021530', '0', '0', '0', '0', '0', '0', '1');
INSERT INTO `ds_snstracelog` VALUES ('7', '0', '0', '0', '2', 'buyer', '', '231', '<div class=\"fd-media\">\r\n					<div class=\"goodsimg\"><a target=\"_blank\" href=\"/git/DSMall/public/index.php/home/store/index/store_id/1.html\"><img src=\"http://localhost/git/DSMall/public/uploads\\home/common\\default_store_avatar.png\" onload=\"javascript:ResizeImage(this,120,120);\" alt=\"admin\"></a></div>\r\n					<div class=\"goodsinfo\">\r\n						<dl>\r\n							<dt><a target=\"_blank\" href=\"/git/DSMall/public/index.php/home/store/index/store_id/1.html\">admin</a></dt>\r\n	                  		<dd dstype=\"storecollectbtn_1\"><a href=\"javascript:void(0);\" onclick=\"javascript:collect_store(\\\'1\\\',\\\'succ\\\',\\\'storecollectbtn_1\\\');\">收藏该店铺</a></dd>\r\n	                  	</dl>\r\n	                  </div>\r\n	             </div>', '1543021594', '0', '0', '0', '0', '0', '0', '1');
INSERT INTO `ds_snstracelog` VALUES ('8', '0', '0', '0', '2', 'buyer', '', '231', '<div class=\"fd-media\">\r\n					<div class=\"goodsimg\"><a target=\"_blank\" href=\"/git/DSMall/public/index.php/home/store/index/store_id/1.html\"><img src=\"http://localhost/git/DSMall/public/uploads\\home/common\\default_store_avatar.png\" onload=\"javascript:ResizeImage(this,120,120);\" alt=\"admin\"></a></div>\r\n					<div class=\"goodsinfo\">\r\n						<dl>\r\n							<dt><a target=\"_blank\" href=\"/git/DSMall/public/index.php/home/store/index/store_id/1.html\">admin</a></dt>\r\n	                  		<dd dstype=\"storecollectbtn_1\"><a href=\"javascript:void(0);\" onclick=\"javascript:collect_store(\\\'1\\\',\\\'succ\\\',\\\'storecollectbtn_1\\\');\">收藏该店铺</a></dd>\r\n	                  	</dl>\r\n	                  </div>\r\n	             </div>', '1543021629', '0', '0', '0', '0', '0', '0', '1');
INSERT INTO `ds_snstracelog` VALUES ('9', '0', '0', '0', '2', 'buyer', '', '213132', '<div class=\"fd-media\">\r\n					<div class=\"goodsimg\"><a target=\"_blank\" href=\"/git/DSMall/public/index.php/home/store/index/store_id/1.html\"><img src=\"http://localhost/git/DSMall/public/uploads\\home/common\\default_store_avatar.png\" onload=\"javascript:ResizeImage(this,120,120);\" alt=\"admin\"></a></div>\r\n					<div class=\"goodsinfo\">\r\n						<dl>\r\n							<dt><a target=\"_blank\" href=\"/git/DSMall/public/index.php/home/store/index/store_id/1.html\">admin</a></dt>\r\n	                  		<dd dstype=\"storecollectbtn_1\"><a href=\"javascript:void(0);\" onclick=\"javascript:collect_store(\\\'1\\\',\\\'succ\\\',\\\'storecollectbtn_1\\\');\">收藏该店铺</a></dd>\r\n	                  	</dl>\r\n	                  </div>\r\n	             </div>', '1543021641', '0', '0', '0', '0', '0', '0', '1');
INSERT INTO `ds_snstracelog` VALUES ('10', '0', '0', '0', '2', 'buyer', '', '321312', '<div class=\"fd-media\">\r\n					<div class=\"goodsimg\"><a target=\"_blank\" href=\"/git/DSMall/public/index.php/home/store/index/store_id/1.html\"><img src=\"http://localhost/git/DSMall/public/uploads\\home/common\\default_store_avatar.png\" onload=\"javascript:ResizeImage(this,120,120);\" alt=\"admin\"></a></div>\r\n					<div class=\"goodsinfo\">\r\n						<dl>\r\n							<dt><a target=\"_blank\" href=\"/git/DSMall/public/index.php/home/store/index/store_id/1.html\">admin</a></dt>\r\n	                  		<dd dstype=\"storecollectbtn_1\"><a href=\"javascript:void(0);\" onclick=\"javascript:collect_store(\\\'1\\\',\\\'succ\\\',\\\'storecollectbtn_1\\\');\">收藏该店铺</a></dd>\r\n	                  	</dl>\r\n	                  </div>\r\n	             </div>', '1543021655', '0', '0', '0', '0', '0', '0', '1');
INSERT INTO `ds_snstracelog` VALUES ('11', '0', '0', '0', '2', 'buyer', '', '231', '<div class=\"fd-media\">\r\n					<div class=\"goodsimg\"><a target=\"_blank\" href=\"/git/DSMall/public/index.php/home/store/index/store_id/1.html\"><img src=\"http://localhost/git/DSMall/public/uploads\\home/common\\default_store_avatar.png\" onload=\"javascript:ResizeImage(this,120,120);\" alt=\"admin\"></a></div>\r\n					<div class=\"goodsinfo\">\r\n						<dl>\r\n							<dt><a target=\"_blank\" href=\"/git/DSMall/public/index.php/home/store/index/store_id/1.html\">admin</a></dt>\r\n	                  		<dd dstype=\"storecollectbtn_1\"><a href=\"javascript:void(0);\" onclick=\"javascript:collect_store(\\\'1\\\',\\\'succ\\\',\\\'storecollectbtn_1\\\');\">收藏该店铺</a></dd>\r\n	                  	</dl>\r\n	                  </div>\r\n	             </div>', '1543021664', '0', '0', '5', '0', '5', '0', '1');
INSERT INTO `ds_snstracelog` VALUES ('12', '0', '0', '0', '2', 'buyer', '', '我很喜欢这个哦~', '<div class=\"fd-media\">\r\n				<div class=\"goodsimg\"><a target=\"_blank\" href=\"/git/DSMall/public/index.php/home/goods/index/goods_id/15.html\"><img src=\"http://localhost/git/DSMall/public/uploads/home/store/goods/1/1_2017092121260662503.jpg\" onload=\"javascript:ResizeImage(this,120,120);\" alt=\"方太（FOTILE）云魔方欧式 烟灶套餐\"></a></div>\r\n				<div class=\"goodsinfo\">\r\n					<dl>\r\n						<dt><a target=\"_blank\" href=\"/git/DSMall/public/index.php/home/goods/index/goods_id/15.html\">方太（FOTILE）云魔方欧式 烟灶套餐</a></dt>\r\n						<dd>价&nbsp;&nbsp;格：&yen;4299.00</dd>\r\n						<dd>运&nbsp;&nbsp;费：&yen;0.00</dd>\r\n                  		<dd dstype=\"collectbtn_15\"><a href=\"javascript:void(0);\" onclick=\"javascript:collect_goods(\\\'15\\\',\\\'succ\\\',\\\'collectbtn_15\\\');\">收藏该宝贝</a>&nbsp;&nbsp;(1人收藏)</dd>\r\n                  	</dl>\r\n                  </div>\r\n             </div>', '1543022275', '0', '0', '1', '0', '1', '0', '1');

-- -----------------------------
-- Table structure for `ds_snsvisitor`
-- -----------------------------
DROP TABLE IF EXISTS `ds_snsvisitor`;
CREATE TABLE `ds_snsvisitor` (
  `snsvisitor_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '访客自增ID',
  `snsvisitor_mid` int(11) NOT NULL COMMENT '访客会员ID',
  `snsvisitor_mname` varchar(100) NOT NULL COMMENT '访客会员名称',
  `snsvisitor_mavatar` varchar(100) DEFAULT NULL COMMENT '访客会员头像',
  `snsvisitor_ownermid` int(11) NOT NULL COMMENT '主人会员ID',
  `snsvisitor_ownermname` varchar(100) NOT NULL COMMENT '主人会员名称',
  `snsvisitor_ownermavatar` varchar(100) DEFAULT NULL COMMENT '主人会员头像',
  `snsvisitor_addtime` int(11) NOT NULL COMMENT '访问时间',
  PRIMARY KEY (`snsvisitor_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='sns访客表';


-- -----------------------------
-- Table structure for `ds_spec`
-- -----------------------------
DROP TABLE IF EXISTS `ds_spec`;
CREATE TABLE `ds_spec` (
  `sp_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '规格自增ID',
  `sp_name` varchar(100) NOT NULL COMMENT '规格名称',
  `sp_sort` tinyint(1) unsigned NOT NULL COMMENT '规格排序',
  `gc_id` int(10) unsigned DEFAULT '0' COMMENT '所属商品分类id',
  `gc_name` varchar(100) DEFAULT NULL COMMENT '所属商品分类名称',
  PRIMARY KEY (`sp_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COMMENT='商品规格表';

-- -----------------------------
-- Records of `ds_spec`
-- -----------------------------
INSERT INTO `ds_spec` VALUES ('1', '样式', '0', '4', '电视/ 空调/ 冰箱/ 洗衣机');
INSERT INTO `ds_spec` VALUES ('2', '颜色', '0', '39', '女装');
INSERT INTO `ds_spec` VALUES ('3', '大小', '0', '15', '男装/ 女装/ 内衣');

-- -----------------------------
-- Table structure for `ds_specvalue`
-- -----------------------------
DROP TABLE IF EXISTS `ds_specvalue`;
CREATE TABLE `ds_specvalue` (
  `spvalue_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '规格值自增ID',
  `spvalue_name` varchar(100) NOT NULL COMMENT '规格值名称',
  `sp_id` int(10) unsigned NOT NULL COMMENT '所属规格ID',
  `gc_id` int(10) unsigned NOT NULL COMMENT '分类ID',
  `store_id` int(10) unsigned NOT NULL COMMENT '店铺ID',
  `spvalue_color` varchar(10) DEFAULT NULL COMMENT '规格颜色',
  `spvalue_sort` tinyint(1) unsigned NOT NULL COMMENT '规格排序',
  PRIMARY KEY (`spvalue_id`),
  KEY `store_id` (`store_id`)
) ENGINE=InnoDB AUTO_INCREMENT=130 DEFAULT CHARSET=utf8 COMMENT='商品规格值表';

-- -----------------------------
-- Records of `ds_specvalue`
-- -----------------------------
INSERT INTO `ds_specvalue` VALUES ('1', '红', '2', '39', '1', '', '0');
INSERT INTO `ds_specvalue` VALUES ('2', '蓝', '2', '39', '1', '', '0');
INSERT INTO `ds_specvalue` VALUES ('3', '黑', '2', '39', '1', '', '0');
INSERT INTO `ds_specvalue` VALUES ('4', '白', '2', '39', '1', '', '0');
INSERT INTO `ds_specvalue` VALUES ('8', 'M', '3', '39', '1', '', '0');
INSERT INTO `ds_specvalue` VALUES ('9', 'L', '3', '39', '1', '', '0');
INSERT INTO `ds_specvalue` VALUES ('10', 'XL', '3', '39', '1', '', '0');
INSERT INTO `ds_specvalue` VALUES ('11', '蓝', '2', '21', '1', '', '0');
INSERT INTO `ds_specvalue` VALUES ('12', '黑', '2', '21', '1', '', '0');
INSERT INTO `ds_specvalue` VALUES ('13', '红', '2', '21', '1', '', '0');
INSERT INTO `ds_specvalue` VALUES ('14', '黑', '2', '23', '1', '', '0');
INSERT INTO `ds_specvalue` VALUES ('15', '4G', '1', '23', '1', '', '0');
INSERT INTO `ds_specvalue` VALUES ('16', '3G', '1', '23', '1', '', '0');
INSERT INTO `ds_specvalue` VALUES ('17', '黑', '2', '24', '1', '', '0');
INSERT INTO `ds_specvalue` VALUES ('18', '白', '2', '24', '1', '', '0');
INSERT INTO `ds_specvalue` VALUES ('19', '粉色', '2', '25', '1', '', '0');
INSERT INTO `ds_specvalue` VALUES ('20', '紫色', '2', '25', '1', '', '0');
INSERT INTO `ds_specvalue` VALUES ('21', '蓝色', '2', '25', '1', '', '0');
INSERT INTO `ds_specvalue` VALUES ('22', '1.5M', '3', '25', '1', '', '0');
INSERT INTO `ds_specvalue` VALUES ('23', '1.6', '3', '25', '1', '', '0');
INSERT INTO `ds_specvalue` VALUES ('24', '1.7', '3', '25', '1', '', '0');
INSERT INTO `ds_specvalue` VALUES ('25', '黄', '2', '25', '1', '', '0');
INSERT INTO `ds_specvalue` VALUES ('26', '1.5', '3', '26', '1', '', '0');
INSERT INTO `ds_specvalue` VALUES ('27', '1.8', '3', '26', '1', '', '0');
INSERT INTO `ds_specvalue` VALUES ('28', '红', '2', '26', '1', '', '0');
INSERT INTO `ds_specvalue` VALUES ('29', '紫', '2', '26', '1', '', '0');
INSERT INTO `ds_specvalue` VALUES ('30', '白', '2', '26', '1', '', '0');
INSERT INTO `ds_specvalue` VALUES ('31', '两口之家', '1', '27', '1', '', '0');
INSERT INTO `ds_specvalue` VALUES ('32', '三口之家', '1', '27', '1', '', '0');
INSERT INTO `ds_specvalue` VALUES ('33', '四口之家', '1', '27', '1', '', '0');
INSERT INTO `ds_specvalue` VALUES ('34', '清爽西瓜味', '2', '28', '1', '', '0');
INSERT INTO `ds_specvalue` VALUES ('35', '草莓味', '2', '28', '1', '', '0');
INSERT INTO `ds_specvalue` VALUES ('36', '45度', '3', '29', '1', '', '0');
INSERT INTO `ds_specvalue` VALUES ('37', '52度', '3', '29', '1', '', '0');
INSERT INTO `ds_specvalue` VALUES ('38', '蓝', '2', '29', '1', '', '0');
INSERT INTO `ds_specvalue` VALUES ('39', '红', '2', '29', '1', '', '0');
INSERT INTO `ds_specvalue` VALUES ('40', '500ml', '1', '29', '1', '', '0');
INSERT INTO `ds_specvalue` VALUES ('41', '400ml', '1', '29', '1', '', '0');
INSERT INTO `ds_specvalue` VALUES ('42', '两件套', '1', '30', '1', '', '0');
INSERT INTO `ds_specvalue` VALUES ('43', '三件套', '1', '30', '1', '', '0');
INSERT INTO `ds_specvalue` VALUES ('44', '四件套', '1', '30', '1', '', '0');
INSERT INTO `ds_specvalue` VALUES ('45', '翠绿', '2', '30', '1', '', '0');
INSERT INTO `ds_specvalue` VALUES ('46', '200ml', '3', '30', '1', '', '0');
INSERT INTO `ds_specvalue` VALUES ('47', '500ml', '3', '31', '1', '', '0');
INSERT INTO `ds_specvalue` VALUES ('48', '白', '2', '31', '1', '', '0');
INSERT INTO `ds_specvalue` VALUES ('49', '两件套', '1', '31', '1', '', '0');
INSERT INTO `ds_specvalue` VALUES ('50', '紫', '2', '31', '1', '', '0');
INSERT INTO `ds_specvalue` VALUES ('51', 'S', '3', '32', '1', '', '0');
INSERT INTO `ds_specvalue` VALUES ('52', 'M', '3', '32', '1', '', '0');
INSERT INTO `ds_specvalue` VALUES ('53', 'L', '3', '32', '1', '', '0');
INSERT INTO `ds_specvalue` VALUES ('54', '红', '2', '32', '1', '', '0');
INSERT INTO `ds_specvalue` VALUES ('55', '紫', '2', '32', '1', '', '0');
INSERT INTO `ds_specvalue` VALUES ('56', '蓝', '2', '32', '1', '', '0');
INSERT INTO `ds_specvalue` VALUES ('57', '黑', '2', '32', '1', '', '0');
INSERT INTO `ds_specvalue` VALUES ('58', '牛奶丝棉', '1', '39', '1', '', '0');
INSERT INTO `ds_specvalue` VALUES ('59', '针织', '1', '39', '1', '', '0');
INSERT INTO `ds_specvalue` VALUES ('60', 'M', '3', '41', '1', '', '0');
INSERT INTO `ds_specvalue` VALUES ('61', 'L', '3', '41', '1', '', '0');
INSERT INTO `ds_specvalue` VALUES ('62', 'XL', '3', '41', '1', '', '0');
INSERT INTO `ds_specvalue` VALUES ('63', '黑', '2', '41', '1', '', '0');
INSERT INTO `ds_specvalue` VALUES ('64', '白', '2', '41', '1', '', '0');
INSERT INTO `ds_specvalue` VALUES ('65', '蓝', '2', '41', '1', '', '0');
INSERT INTO `ds_specvalue` VALUES ('66', '黑', '2', '44', '1', '', '0');
INSERT INTO `ds_specvalue` VALUES ('67', '蓝', '2', '44', '1', '', '0');
INSERT INTO `ds_specvalue` VALUES ('68', 'M', '3', '44', '1', '', '0');
INSERT INTO `ds_specvalue` VALUES ('69', 'L', '3', '44', '1', '', '0');
INSERT INTO `ds_specvalue` VALUES ('70', 'XL', '3', '44', '1', '', '0');
INSERT INTO `ds_specvalue` VALUES ('71', '红', '2', '44', '1', '', '0');
INSERT INTO `ds_specvalue` VALUES ('72', '35', '3', '45', '1', '', '0');
INSERT INTO `ds_specvalue` VALUES ('73', '36', '3', '45', '1', '', '0');
INSERT INTO `ds_specvalue` VALUES ('74', '37', '3', '45', '1', '', '0');
INSERT INTO `ds_specvalue` VALUES ('75', '38', '3', '45', '1', '', '0');
INSERT INTO `ds_specvalue` VALUES ('76', '粉红', '2', '45', '1', '', '0');
INSERT INTO `ds_specvalue` VALUES ('77', '黑色', '2', '45', '1', '', '0');
INSERT INTO `ds_specvalue` VALUES ('78', '灰色', '2', '45', '1', '', '0');
INSERT INTO `ds_specvalue` VALUES ('79', '金色', '2', '45', '1', '', '0');
INSERT INTO `ds_specvalue` VALUES ('80', '黑', '2', '47', '1', '', '0');
INSERT INTO `ds_specvalue` VALUES ('81', '白', '2', '47', '1', '', '0');
INSERT INTO `ds_specvalue` VALUES ('82', '银', '2', '47', '1', '', '0');
INSERT INTO `ds_specvalue` VALUES ('83', '金', '2', '47', '1', '', '0');
INSERT INTO `ds_specvalue` VALUES ('84', '红', '2', '48', '1', '', '0');
INSERT INTO `ds_specvalue` VALUES ('85', '白', '2', '48', '1', '', '0');
INSERT INTO `ds_specvalue` VALUES ('86', '玫瑰金', '2', '48', '1', '', '0');
INSERT INTO `ds_specvalue` VALUES ('87', '黑', '2', '48', '1', '', '0');
INSERT INTO `ds_specvalue` VALUES ('88', '黑', '2', '49', '1', '', '0');
INSERT INTO `ds_specvalue` VALUES ('89', '白', '2', '49', '1', '', '0');
INSERT INTO `ds_specvalue` VALUES ('90', '蓝', '2', '49', '1', '', '0');
INSERT INTO `ds_specvalue` VALUES ('91', '20寸高清', '3', '5', '1', '', '0');
INSERT INTO `ds_specvalue` VALUES ('92', '25寸高清', '3', '5', '1', '', '0');
INSERT INTO `ds_specvalue` VALUES ('93', '30寸高清', '3', '5', '1', '', '0');
INSERT INTO `ds_specvalue` VALUES ('94', '40寸高清', '3', '5', '1', '', '0');
INSERT INTO `ds_specvalue` VALUES ('95', '50寸高清', '3', '5', '1', '', '0');
INSERT INTO `ds_specvalue` VALUES ('96', '黑', '2', '5', '1', '', '0');
INSERT INTO `ds_specvalue` VALUES ('97', '液晶', '1', '5', '1', '', '0');
INSERT INTO `ds_specvalue` VALUES ('98', '白', '2', '6', '1', '', '0');
INSERT INTO `ds_specvalue` VALUES ('99', '蓝', '2', '6', '1', '', '0');
INSERT INTO `ds_specvalue` VALUES ('100', '白', '2', '7', '1', '', '0');
INSERT INTO `ds_specvalue` VALUES ('101', '白', '2', '51', '1', '', '0');
INSERT INTO `ds_specvalue` VALUES ('102', '灰', '2', '51', '1', '', '0');
INSERT INTO `ds_specvalue` VALUES ('103', '白', '2', '21', '1', '', '0');
INSERT INTO `ds_specvalue` VALUES ('104', 'S', '3', '55', '1', '', '0');
INSERT INTO `ds_specvalue` VALUES ('105', 'M', '3', '55', '1', '', '0');
INSERT INTO `ds_specvalue` VALUES ('106', 'L', '3', '55', '1', '', '0');
INSERT INTO `ds_specvalue` VALUES ('107', '红', '2', '55', '1', '', '0');
INSERT INTO `ds_specvalue` VALUES ('108', '灰', '2', '55', '1', '', '0');
INSERT INTO `ds_specvalue` VALUES ('109', '蓝', '2', '55', '1', '', '0');
INSERT INTO `ds_specvalue` VALUES ('110', '黑', '2', '55', '1', '', '0');
INSERT INTO `ds_specvalue` VALUES ('111', '白', '2', '23', '1', '', '0');
INSERT INTO `ds_specvalue` VALUES ('112', '硬盘120G', '3', '23', '1', '', '0');
INSERT INTO `ds_specvalue` VALUES ('113', '硬盘500G', '3', '23', '1', '', '0');
INSERT INTO `ds_specvalue` VALUES ('114', '1T', '3', '24', '1', '', '0');
INSERT INTO `ds_specvalue` VALUES ('115', '2T', '3', '24', '1', '', '0');
INSERT INTO `ds_specvalue` VALUES ('116', '3T', '3', '24', '1', '', '0');
INSERT INTO `ds_specvalue` VALUES ('117', '香槟金', '2', '75', '1', '', '0');
INSERT INTO `ds_specvalue` VALUES ('118', '16G', '3', '75', '1', '', '0');
INSERT INTO `ds_specvalue` VALUES ('119', '32G', '3', '75', '1', '', '0');
INSERT INTO `ds_specvalue` VALUES ('120', '黑', '2', '75', '1', '', '0');
INSERT INTO `ds_specvalue` VALUES ('121', '白', '2', '75', '1', '', '0');
INSERT INTO `ds_specvalue` VALUES ('122', '64G', '3', '75', '1', '', '0');
INSERT INTO `ds_specvalue` VALUES ('123', '128G', '3', '75', '1', '', '0');
INSERT INTO `ds_specvalue` VALUES ('124', '全网通', '1', '75', '1', '', '0');
INSERT INTO `ds_specvalue` VALUES ('125', '蓝', '2', '68', '1', '', '0');
INSERT INTO `ds_specvalue` VALUES ('126', '黑', '2', '68', '1', '', '0');
INSERT INTO `ds_specvalue` VALUES ('127', '白', '2', '68', '1', '', '0');
INSERT INTO `ds_specvalue` VALUES ('128', '单框镜', '1', '68', '1', '', '0');
INSERT INTO `ds_specvalue` VALUES ('129', '变色镜', '1', '68', '1', '', '0');

-- -----------------------------
-- Table structure for `ds_statmember`
-- -----------------------------
DROP TABLE IF EXISTS `ds_statmember`;
CREATE TABLE `ds_statmember` (
  `statm_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '统计自增ID',
  `statm_memberid` int(11) NOT NULL COMMENT '会员ID',
  `statm_membername` varchar(100) NOT NULL COMMENT '会员名称',
  `statm_time` int(11) NOT NULL COMMENT '统计时间',
  `statm_ordernum` int(11) NOT NULL DEFAULT '0' COMMENT '下单量',
  `statm_orderamount` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '下单金额',
  `statm_goodsnum` int(11) NOT NULL DEFAULT '0' COMMENT '下单商品件数',
  `statm_predincrease` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '预存款增加额',
  `statm_predreduce` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '预存款减少额',
  `statm_pointsincrease` int(11) NOT NULL DEFAULT '0' COMMENT '积分增加额',
  `statm_pointsreduce` int(11) NOT NULL DEFAULT '0' COMMENT '积分减少额',
  `statm_updatetime` int(11) NOT NULL COMMENT '更新时间',
  PRIMARY KEY (`statm_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='会员相关数据统计';


-- -----------------------------
-- Table structure for `ds_statorder`
-- -----------------------------
DROP TABLE IF EXISTS `ds_statorder`;
CREATE TABLE `ds_statorder` (
  `order_id` int(11) NOT NULL COMMENT '订单id',
  `order_sn` varchar(20) NOT NULL COMMENT '订单编号',
  `order_add_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '订单生成时间',
  `payment_code` char(20) DEFAULT '' COMMENT '支付方式',
  `order_amount` decimal(10,2) unsigned NOT NULL DEFAULT '0.00' COMMENT '订单总价格',
  `shipping_fee` decimal(10,2) unsigned DEFAULT '0.00' COMMENT '运费',
  `evaluation_state` enum('0','1') DEFAULT '0' COMMENT '评价状态 0未评价，1已评价',
  `order_state` enum('0','10','20','30','40') NOT NULL DEFAULT '10' COMMENT '订单状态：0(已取消)10(默认):未付款;20:已付款;30:已发货;40:已收货;',
  `refund_state` tinyint(1) unsigned DEFAULT '0' COMMENT '退款状态:0是无退款,1是部分退款,2是全部退款',
  `refund_amount` decimal(10,2) DEFAULT '0.00' COMMENT '退款金额',
  `order_from` enum('1','2') NOT NULL DEFAULT '1' COMMENT '1WEB2mobile',
  `order_isvalid` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否为计入统计的有效订单，0为无效 1为有效',
  `reciver_province_id` mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '收货人省级ID',
  `store_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '店铺ID',
  `store_name` varchar(50) NOT NULL COMMENT '卖家店铺名称',
  `grade_id` int(11) NOT NULL COMMENT '店铺等级',
  `storeclass_id` int(11) NOT NULL COMMENT '店铺分类',
  `buyer_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '买家ID',
  `buyer_name` varchar(50) NOT NULL COMMENT '买家姓名',
  UNIQUE KEY `order_id` (`order_id`),
  KEY `order_add_time` (`order_add_time`),
  KEY `order_isvalid` (`order_isvalid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='统计功能订单缓存表';


-- -----------------------------
-- Table structure for `ds_statordergoods`
-- -----------------------------
DROP TABLE IF EXISTS `ds_statordergoods`;
CREATE TABLE `ds_statordergoods` (
  `rec_id` int(11) NOT NULL COMMENT '订单商品表索引ID',
  `stat_updatetime` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '缓存生成时间',
  `order_id` int(11) NOT NULL COMMENT '订单id',
  `order_sn` varchar(20) NOT NULL COMMENT '订单编号',
  `order_add_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '订单生成时间',
  `payment_code` char(20) DEFAULT '' COMMENT '支付方式',
  `order_amount` decimal(10,2) unsigned NOT NULL DEFAULT '0.00' COMMENT '订单总价格',
  `shipping_fee` decimal(10,2) unsigned DEFAULT '0.00' COMMENT '运费',
  `evaluation_state` enum('0','1') DEFAULT '0' COMMENT '评价状态 0:未评价，1:已评价',
  `order_state` enum('0','10','20','30','40') NOT NULL DEFAULT '10' COMMENT '订单状态 0:已取消;10:未付款;20:已付款;30:已发货;40:已收货;',
  `refund_state` tinyint(1) unsigned DEFAULT '0' COMMENT '退款状态:0:无退款,1:部分退款,2:全部退款',
  `refund_amount` decimal(10,2) DEFAULT '0.00' COMMENT '退款金额',
  `order_from` enum('1','2') NOT NULL DEFAULT '1' COMMENT '来源 1:PC 2:手机',
  `order_isvalid` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否为计入统计的有效订单，0为无效 1为有效',
  `reciver_province_id` mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '收货人省级ID',
  `store_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '店铺ID',
  `store_name` varchar(50) NOT NULL COMMENT '卖家店铺名称',
  `grade_id` int(11) NOT NULL COMMENT '店铺等级',
  `storeclass_id` int(11) NOT NULL COMMENT '店铺分类',
  `buyer_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '买家ID',
  `buyer_name` varchar(50) NOT NULL COMMENT '买家姓名',
  `goods_id` int(11) NOT NULL COMMENT '商品ID',
  `goods_name` varchar(50) NOT NULL COMMENT '商品名称+规格',
  `goods_commonid` int(10) unsigned NOT NULL COMMENT '商品公共表id',
  `goods_commonname` varchar(50) NOT NULL COMMENT '商品公共表中商品名称',
  `gc_id` mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '商品最底级分类ID',
  `gc_parentid_1` int(11) NOT NULL DEFAULT '0' COMMENT '一级父类ID',
  `gc_parentid_2` int(11) NOT NULL DEFAULT '0' COMMENT '二级父类ID',
  `gc_parentid_3` int(11) NOT NULL DEFAULT '0' COMMENT '三级父类ID',
  `brand_id` int(10) unsigned NOT NULL COMMENT '品牌id',
  `brand_name` varchar(100) NOT NULL COMMENT '品牌名称',
  `goods_serial` varchar(50) NOT NULL COMMENT '商家编号',
  `goods_price` decimal(10,2) NOT NULL COMMENT '商品价格',
  `goods_num` smallint(5) unsigned NOT NULL DEFAULT '1' COMMENT '商品数量',
  `goods_image` varchar(100) DEFAULT NULL COMMENT '商品图片',
  `goods_pay_price` decimal(10,2) unsigned NOT NULL COMMENT '商品实际成交价',
  `goods_type` enum('1','2','3','4','5','6') NOT NULL DEFAULT '1' COMMENT '1:默认 2:抢购商品 3:限时折扣商品 4:优惠套装 5:赠品 6:拼团 7:会员等级折扣',
  `promotions_id` mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '促销活动ID（抢购ID/限时折扣ID/优惠套装ID）与goods_type搭配使用',
  `commis_rate` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT '佣金比例',
  UNIQUE KEY `rec_id` (`rec_id`),
  KEY `order_id` (`order_id`),
  KEY `order_add_time` (`order_add_time`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='统计功能订单商品缓存表';


-- -----------------------------
-- Table structure for `ds_store`
-- -----------------------------
DROP TABLE IF EXISTS `ds_store`;
CREATE TABLE `ds_store` (
  `store_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '店铺自增ID',
  `store_name` varchar(100) NOT NULL COMMENT '店铺名称',
  `grade_id` int(11) DEFAULT '0' COMMENT '店铺等级ID',
  `member_id` int(11) NOT NULL COMMENT '用户ID',
  `member_name` varchar(50) NOT NULL COMMENT '用户名',
  `seller_name` varchar(50) NOT NULL COMMENT '店主卖家用户名',
  `storeclass_id` int(11) DEFAULT '0' COMMENT '店铺分类ID',
  `store_company_name` varchar(50) DEFAULT NULL COMMENT '店铺公司名称',
  `region_id` int(10) DEFAULT NULL COMMENT '地区ID',
  `area_info` varchar(100) DEFAULT NULL COMMENT '地区名称',
  `store_address` varchar(100) DEFAULT NULL COMMENT '店铺地址',
  `store_zip` varchar(10) DEFAULT NULL COMMENT '邮政编码',
  `store_state` tinyint(1) NOT NULL DEFAULT '2' COMMENT '店铺状态:0关闭，1开启，2审核中',
  `store_close_info` varchar(255) DEFAULT NULL COMMENT '店铺关闭原因',
  `store_sort` int(11) NOT NULL DEFAULT '0' COMMENT '店铺排序',
  `store_addtime` int(11) NOT NULL DEFAULT '0' COMMENT '店铺时间',
  `store_endtime` int(11) NOT NULL DEFAULT '0' COMMENT '店铺关闭时间',
  `store_logo` varchar(255) DEFAULT NULL COMMENT '店铺LOGO',
  `store_banner` varchar(255) DEFAULT NULL COMMENT '店铺Banner',
  `store_avatar` varchar(255) DEFAULT NULL COMMENT '店铺头像',
  `store_keywords` varchar(255) DEFAULT NULL COMMENT '店铺SEO关键字',
  `store_description` varchar(255) DEFAULT NULL COMMENT '店铺SEO描述',
  `store_qq` varchar(50) DEFAULT NULL COMMENT '店铺QQ',
  `store_ww` varchar(50) DEFAULT NULL COMMENT '店铺WW',
  `store_phone` varchar(20) DEFAULT NULL COMMENT '商家电话',
  `store_mainbusiness` text COMMENT '主营商品',
  `store_recommend` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否推荐:0否 1是',
  `store_theme` varchar(50) NOT NULL DEFAULT 'default' COMMENT '店铺当前主题',
  `store_credit` int(11) NOT NULL DEFAULT '0' COMMENT '店铺信用',
  `store_desccredit` float unsigned NOT NULL DEFAULT '0' COMMENT '描述相符度分数',
  `store_servicecredit` float unsigned NOT NULL DEFAULT '0' COMMENT '服务态度分数',
  `store_deliverycredit` float unsigned NOT NULL DEFAULT '0' COMMENT '发货速度分数',
  `store_collect` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '店铺收藏数量',
  `store_slide` text COMMENT '店铺幻灯片',
  `store_slide_url` text COMMENT '店铺幻灯片链接',
  `store_seal` varchar(255) DEFAULT NULL COMMENT '店铺印章',
  `store_printexplain` varchar(500) DEFAULT NULL COMMENT '打印订单页面下方说明文字',
  `store_sales` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '店铺销量',
  `store_presales` text COMMENT '售前客服',
  `store_aftersales` text COMMENT '售后客服',
  `store_workingtime` varchar(100) DEFAULT NULL COMMENT '工作时间',
  `store_free_price` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '超出该金额免运费，大于0才表示该值有效',
  `store_decoration_switch` int(10) unsigned DEFAULT '0' COMMENT '店铺装修开关(0-关闭 装修编号-开启)',
  `store_decoration_only` tinyint(1) unsigned DEFAULT '0' COMMENT '开启店铺装修时，仅显示店铺装修(1-是 0-否',
  `store_decoration_image_count` int(10) unsigned DEFAULT '0' COMMENT '店铺装修相册图片数量',
  `live_store_name` varchar(255) DEFAULT NULL COMMENT '商铺名称',
  `live_store_address` varchar(255) DEFAULT NULL COMMENT '商家地址',
  `live_store_tel` varchar(255) DEFAULT NULL COMMENT '商铺电话',
  `live_store_bus` varchar(255) DEFAULT NULL COMMENT '公交线路',
  `is_platform_store` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否自营店铺 1是 0否',
  `bind_all_gc` tinyint(1) NOT NULL DEFAULT '0' COMMENT '自营店是否绑定全部分类 0否1是',
  `store_vrcode_prefix` char(3) DEFAULT NULL COMMENT '商家兑换码前缀',
  `store_baozh` tinyint(1) DEFAULT '0' COMMENT '保证服务开关',
  `store_baozhopen` tinyint(1) DEFAULT '0' COMMENT '保证金显示开关',
  `store_baozhrmb` varchar(10) DEFAULT '零' COMMENT '保证金金额',
  `store_qtian` tinyint(1) DEFAULT '0' COMMENT '7天退换',
  `store_zhping` tinyint(1) DEFAULT '0' COMMENT '正品保障',
  `store_erxiaoshi` tinyint(1) DEFAULT '0' COMMENT '两小时发货',
  `store_tuihuo` tinyint(1) DEFAULT '0' COMMENT '退货承诺',
  `store_shiyong` tinyint(1) DEFAULT '0' COMMENT '试用中心',
  `store_shiti` tinyint(1) DEFAULT '0' COMMENT '实体验证',
  `store_xiaoxie` tinyint(1) DEFAULT '0' COMMENT '消协保证',
  `store_huodaofk` tinyint(1) DEFAULT '0' COMMENT '货到付款',
  `store_free_time` varchar(10) DEFAULT NULL COMMENT '商家配送时间',
  `store_longitude` varchar(20) DEFAULT '' COMMENT '经度',
  `store_latitude` varchar(20) DEFAULT '' COMMENT '纬度',
  `mb_title_img` varchar(150) DEFAULT NULL COMMENT '手机店铺背景图',
  `mb_sliders` text COMMENT '手机店铺轮播图',
  `deliver_region` varchar(50) DEFAULT NULL COMMENT '店铺默认配送区域',
  `store_mgdiscount` text COMMENT '序列化会员等级折扣(店铺)',
  `store_mgdiscount_state` tinyint(1) DEFAULT '0' COMMENT '店铺是否开启序列化会员等级折扣',
  `store_bill_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '上一期结算时间',
  `store_avaliable_deposit` decimal(10,2) unsigned NOT NULL DEFAULT '0.00' COMMENT '店铺已缴保证金',
  `store_freeze_deposit` decimal(10,2) unsigned NOT NULL DEFAULT '0.00' COMMENT '店铺审核保证金',
  `store_payable_deposit` decimal(10,2) unsigned NOT NULL DEFAULT '0.00' COMMENT '店铺应缴保证金',
  `store_avaliable_money` decimal(10,2) unsigned NOT NULL DEFAULT '0.00' COMMENT '店铺可用金额',
  `store_freeze_money` decimal(10,2) unsigned NOT NULL DEFAULT '0.00' COMMENT '店铺冻结金额',
  PRIMARY KEY (`store_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COMMENT='店铺数据表';

-- -----------------------------
-- Records of `ds_store`
-- -----------------------------
INSERT INTO `ds_store` VALUES ('1', 'admin', '1', '1', 'admin', 'admin', '0', '', '', '', '', '', '1', '', '0', '1543547094', '0', '', '', '', '', '', '', '', '', '', '0', 'default', '0', '0', '0', '0', '0', '', '', '', '', '0', '', '', '', '0.00', '0', '0', '0', '', '', '', '', '1', '1', '', '0', '0', '零', '0', '0', '0', '0', '0', '0', '0', '0', '', '', '', '', '', '', '', '0', '0', '0.00', '0.00', '0.00', '0.00', '0.00');
INSERT INTO `ds_store` VALUES ('2', 'test', '1', '3', 'test', 'test', '0', '', '', '', '', '', '1', '', '0', '1543562542', '0', '', '', '', '', '', '', '', '', '', '0', 'default', '0', '0', '0', '0', '0', '', '', '', '', '0', '', '', '', '0.00', '0', '0', '0', '', '', '', '', '0', '1', '', '0', '0', '零', '0', '0', '0', '0', '0', '0', '0', '0', '', '', '', '', '', '', '', '0', '0', '0.00', '0.00', '0.00', '0.00', '0.00');

-- -----------------------------
-- Table structure for `ds_storebindclass`
-- -----------------------------
DROP TABLE IF EXISTS `ds_storebindclass`;
CREATE TABLE `ds_storebindclass` (
  `storebindclass_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '类目自增ID',
  `store_id` int(11) unsigned DEFAULT '0' COMMENT '店铺ID',
  `commis_rate` tinyint(4) unsigned DEFAULT '0' COMMENT '佣金比例',
  `class_1` mediumint(9) unsigned DEFAULT '0' COMMENT '一级分类',
  `class_2` mediumint(9) unsigned DEFAULT '0' COMMENT '二级分类',
  `class_3` mediumint(9) unsigned DEFAULT '0' COMMENT '三级分类',
  `storebindclass_state` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '状态0:审核中1:已审核 2:平台自营店铺',
  PRIMARY KEY (`storebindclass_id`),
  KEY `store_id` (`store_id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8 COMMENT='店铺可发布商品类目表';

-- -----------------------------
-- Records of `ds_storebindclass`
-- -----------------------------
INSERT INTO `ds_storebindclass` VALUES ('12', '2', '5', '4', '7', '96', '0');
INSERT INTO `ds_storebindclass` VALUES ('13', '2', '5', '4', '6', '92', '0');

-- -----------------------------
-- Table structure for `ds_storeclass`
-- -----------------------------
DROP TABLE IF EXISTS `ds_storeclass`;
CREATE TABLE `ds_storeclass` (
  `storeclass_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '店铺分类自增ID',
  `storeclass_name` varchar(50) NOT NULL COMMENT '店铺分类名称',
  `storeclass_bail` mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '店铺分类保证金数额',
  `storeclass_sort` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '店铺分类排序',
  PRIMARY KEY (`storeclass_id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8 COMMENT='店铺分类表';

-- -----------------------------
-- Records of `ds_storeclass`
-- -----------------------------
INSERT INTO `ds_storeclass` VALUES ('1', '珠宝/首饰', '0', '8');
INSERT INTO `ds_storeclass` VALUES ('2', '服装鞋包', '0', '1');
INSERT INTO `ds_storeclass` VALUES ('3', '3C数码', '0', '2');
INSERT INTO `ds_storeclass` VALUES ('4', '美容护理', '0', '3');
INSERT INTO `ds_storeclass` VALUES ('5', '家居用品', '0', '4');
INSERT INTO `ds_storeclass` VALUES ('6', '食品/保健', '0', '5');
INSERT INTO `ds_storeclass` VALUES ('7', '母婴用品', '0', '6');
INSERT INTO `ds_storeclass` VALUES ('8', '文体/汽车', '0', '7');
INSERT INTO `ds_storeclass` VALUES ('9', '收藏/爱好', '0', '9');
INSERT INTO `ds_storeclass` VALUES ('10', '生活/服务', '0', '10');

-- -----------------------------
-- Table structure for `ds_storecost`
-- -----------------------------
DROP TABLE IF EXISTS `ds_storecost`;
CREATE TABLE `ds_storecost` (
  `storecost_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '店铺消费自增ID',
  `storecost_store_id` int(10) unsigned NOT NULL COMMENT '店铺ID',
  `storecost_seller_id` int(10) unsigned NOT NULL COMMENT '卖家ID',
  `storecost_price` int(10) unsigned NOT NULL COMMENT '店铺消费价格',
  `storecost_remark` varchar(255) NOT NULL COMMENT '店铺消费备注',
  `storecost_state` tinyint(3) unsigned NOT NULL COMMENT '费用状态 0:未结算 1:已结算',
  `storecost_time` int(10) unsigned NOT NULL COMMENT '费用发生时间',
  PRIMARY KEY (`storecost_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COMMENT='店铺消费表';

-- -----------------------------
-- Records of `ds_storecost`
-- -----------------------------
INSERT INTO `ds_storecost` VALUES ('1', '2', '2', '20', '购买限时折扣：', '0', '1543563871');
INSERT INTO `ds_storecost` VALUES ('2', '2', '2', '20', '购买限时折扣：', '0', '1543563883');

-- -----------------------------
-- Table structure for `ds_storedepositlog`
-- -----------------------------
DROP TABLE IF EXISTS `ds_storedepositlog`;
CREATE TABLE `ds_storedepositlog` (
  `storedepositlog_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '保证金日志id',
  `seller_id` int(10) unsigned NOT NULL COMMENT '店主id',
  `seller_name` varchar(60) NOT NULL COMMENT '店主用户名',
  `store_avaliable_deposit` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '已缴保证金',
  `store_freeze_deposit` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '审核保证金',
  `store_payable_deposit` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '应缴保证金',
  `storedepositlog_state` tinyint(1) unsigned NOT NULL COMMENT '状态（0无效1有效2待审核3已同意4已拒绝5已缴纳6已取消）',
  `storedepositlog_type` smallint(5) unsigned NOT NULL COMMENT '日志类型',
  `storedepositlog_desc` varchar(255) NOT NULL COMMENT '日志详情',
  `storedepositlog_add_time` int(10) unsigned NOT NULL COMMENT '添加时间',
  PRIMARY KEY (`storedepositlog_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='店铺保证金日志表';


-- -----------------------------
-- Table structure for `ds_storeextend`
-- -----------------------------
DROP TABLE IF EXISTS `ds_storeextend`;
CREATE TABLE `ds_storeextend` (
  `store_id` mediumint(8) unsigned NOT NULL COMMENT '店铺ID',
  `express` text COMMENT '快递公司ID的组合',
  `pricerange` text COMMENT '店铺统计设置的商品价格区间',
  `orderpricerange` text COMMENT '店铺统计设置的订单价格区间',
  PRIMARY KEY (`store_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='店铺信息扩展表';

-- -----------------------------
-- Records of `ds_storeextend`
-- -----------------------------
INSERT INTO `ds_storeextend` VALUES ('2', '', '', '');

-- -----------------------------
-- Table structure for `ds_storegoodsclass`
-- -----------------------------
DROP TABLE IF EXISTS `ds_storegoodsclass`;
CREATE TABLE `ds_storegoodsclass` (
  `storegc_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '店铺商品分类ID',
  `store_id` int(11) NOT NULL DEFAULT '0' COMMENT '店铺ID',
  `storegc_name` varchar(50) NOT NULL COMMENT '店铺商品分类名称',
  `storegc_parent_id` int(11) NOT NULL COMMENT '上级ID',
  `storegc_state` tinyint(1) NOT NULL DEFAULT '0' COMMENT '店铺商品分类状态',
  `storegc_sort` int(11) NOT NULL DEFAULT '0' COMMENT '商品分类排序',
  PRIMARY KEY (`storegc_id`),
  KEY `storegc_parent_id` (`storegc_parent_id`,`storegc_sort`),
  KEY `store_id` (`store_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='店铺商品分类表';


-- -----------------------------
-- Table structure for `ds_storegrade`
-- -----------------------------
DROP TABLE IF EXISTS `ds_storegrade`;
CREATE TABLE `ds_storegrade` (
  `storegrade_id` int(10) NOT NULL AUTO_INCREMENT COMMENT '店铺等级自增ID',
  `storegrade_name` varchar(50) NOT NULL COMMENT '店铺等级名称',
  `storegrade_goods_limit` int(10) DEFAULT '0' COMMENT '允许发布商品数量',
  `storegrade_album_limit` int(10) DEFAULT '0' COMMENT '允许发布图片数量',
  `storegrade_space_limit` int(10) DEFAULT '0' COMMENT '允许上传空间大小,单位MB',
  `storegrade_template_number` tinyint(3) DEFAULT '0' COMMENT '店铺等级选择店铺模板套数',
  `storegrade_template` varchar(255) DEFAULT NULL COMMENT '店铺等级模板内容',
  `storegrade_price` int(10) DEFAULT '0' COMMENT '店铺等级费用',
  `storegrade_confirm` tinyint(1) DEFAULT '1' COMMENT '店铺等级审核,0为否 1为是',
  `storegrade_description` text COMMENT '店铺等级申请说明',
  `storegrade_function` varchar(255) DEFAULT NULL COMMENT '店铺等级附加功能',
  `storegrade_sort` tinyint(100) NOT NULL DEFAULT '0' COMMENT '店铺等级排序',
  PRIMARY KEY (`storegrade_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COMMENT='店铺等级表';

-- -----------------------------
-- Records of `ds_storegrade`
-- -----------------------------
INSERT INTO `ds_storegrade` VALUES ('1', '系统默认', '100', '500', '100', '6', 'default|style1|style2|style3|style4|style5', '100', '1', '用户选择“默认等级”，可以立即开通。', '', '0');
INSERT INTO `ds_storegrade` VALUES ('2', '白金店铺', '200', '1000', '100', '6', 'default|style1|style2|style3|style4|style5', '200', '1', '享受更多特权', 'editor_multimedia', '2');
INSERT INTO `ds_storegrade` VALUES ('3', '钻石店铺', '0', '1000', '100', '6', 'default|style1|style2|style3|style4|style5', '1000', '1', '', 'editor_multimedia', '100');

-- -----------------------------
-- Table structure for `ds_storejoinin`
-- -----------------------------
DROP TABLE IF EXISTS `ds_storejoinin`;
CREATE TABLE `ds_storejoinin` (
  `member_id` int(10) unsigned NOT NULL COMMENT '用户ID',
  `member_name` varchar(50) DEFAULT NULL COMMENT '店主用户名',
  `company_name` varchar(50) DEFAULT NULL COMMENT '公司名称',
  `company_province_id` mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '所在地省ID',
  `company_address` varchar(50) DEFAULT NULL COMMENT '公司地址',
  `company_address_detail` varchar(50) DEFAULT NULL COMMENT '公司详细地址',
  `company_registered_capital` int(10) unsigned DEFAULT NULL COMMENT '注册资金',
  `contacts_name` varchar(50) DEFAULT NULL COMMENT '联系人姓名',
  `contacts_phone` varchar(20) DEFAULT NULL COMMENT '联系人电话',
  `contacts_email` varchar(50) DEFAULT NULL COMMENT '联系人邮箱',
  `business_licence_number` varchar(50) DEFAULT NULL COMMENT '营业执照号',
  `business_licence_address` varchar(50) DEFAULT NULL COMMENT '营业执所在地',
  `business_licence_start` date DEFAULT NULL COMMENT '营业执照有效期开始',
  `business_licence_end` date DEFAULT NULL COMMENT '营业执照有效期结束',
  `business_sphere` varchar(1000) DEFAULT NULL COMMENT '法定经营范围',
  `business_licence_number_electronic` varchar(50) DEFAULT NULL COMMENT '营业执照电子版',
  `bank_account_name` varchar(50) DEFAULT NULL COMMENT '银行开户名',
  `bank_account_number` varchar(50) DEFAULT NULL COMMENT '公司银行账号',
  `bank_name` varchar(50) DEFAULT NULL COMMENT '开户银行支行名称',
  `bank_address` varchar(50) DEFAULT NULL COMMENT '开户银行所在地',
  `is_settlement_account` tinyint(1) DEFAULT NULL COMMENT '开户行账号是否为结算账号 1-开户行就是结算账号 2-独立的计算账号',
  `settlement_bank_account_name` varchar(50) DEFAULT NULL COMMENT '结算银行开户名',
  `settlement_bank_account_number` varchar(50) DEFAULT NULL COMMENT '结算公司银行账号',
  `settlement_bank_name` varchar(50) DEFAULT NULL COMMENT '结算开户银行支行名称',
  `settlement_bank_address` varchar(50) DEFAULT NULL COMMENT '结算开户银行所在地',
  `seller_name` varchar(50) DEFAULT NULL COMMENT '卖家帐号',
  `store_name` varchar(50) DEFAULT NULL COMMENT '店铺名称',
  `store_class_ids` varchar(1000) DEFAULT NULL COMMENT '店铺分类编号集合',
  `store_class_names` varchar(1000) DEFAULT NULL COMMENT '店铺分类名称集合',
  `store_longitude` varchar(20) DEFAULT '' COMMENT '经度',
  `store_latitude` varchar(20) DEFAULT '' COMMENT '纬度',
  `joinin_state` varchar(50) DEFAULT NULL COMMENT '申请状态 10-已提交申请 11-缴费完成  20-审核成功 30-审核失败 31-缴费审核失败 40-审核通过开店',
  `joinin_message` varchar(200) DEFAULT NULL COMMENT '管理员审核信息',
  `joinin_year` tinyint(3) unsigned NOT NULL DEFAULT '1' COMMENT '开店时长(年)',
  `storegrade_name` varchar(50) DEFAULT NULL COMMENT '店铺等级名称',
  `storegrade_id` int(10) unsigned DEFAULT NULL COMMENT '店铺等级编号',
  `sg_info` varchar(200) DEFAULT NULL COMMENT '店铺等级下的收费等信息',
  `storeclass_name` varchar(50) DEFAULT NULL COMMENT '店铺分类名称',
  `storeclass_id` int(10) unsigned DEFAULT NULL COMMENT '店铺分类编号',
  `storeclass_bail` mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '店铺分类保证金',
  `store_class_commis_rates` varchar(200) DEFAULT NULL COMMENT '分类佣金比例',
  `paying_money_certificate` varchar(50) DEFAULT NULL COMMENT '付款凭证',
  `paying_money_certificate_explain` varchar(200) DEFAULT NULL COMMENT '付款凭证说明',
  `paying_amount` decimal(10,2) unsigned NOT NULL DEFAULT '0.00' COMMENT '付款金额'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='店铺入住表';

-- -----------------------------
-- Records of `ds_storejoinin`
-- -----------------------------
INSERT INTO `ds_storejoinin` VALUES ('1', 'admin', '', '0', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 'admin', 'admin', '', '', '', '', '40', '', '1', '', '', '', '', '', '0', '', '', '', '0.00');
INSERT INTO `ds_storejoinin` VALUES ('3', 'test', '', '0', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 'test', 'test', '', '', '', '', '40', '', '1', '', '', '', '', '', '0', '', '', '', '0.00');

-- -----------------------------
-- Table structure for `ds_storemoneylog`
-- -----------------------------
DROP TABLE IF EXISTS `ds_storemoneylog`;
CREATE TABLE `ds_storemoneylog` (
  `storemoneylog_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '金额日志id',
  `seller_id` int(10) unsigned NOT NULL COMMENT '店主id',
  `seller_name` varchar(60) NOT NULL COMMENT '店主用户名',
  `store_avaliable_money` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '变动可用金额',
  `store_freeze_money` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '变动冻结金额',
  `storemoneylog_type` smallint(5) unsigned NOT NULL COMMENT '日志类型',
  `storemoneylog_desc` varchar(255) NOT NULL COMMENT '日志详情',
  `storemoneylog_state` tinyint(1) unsigned NOT NULL COMMENT '状态（0无效1有效2待审核3已同意4已拒绝）',
  `storemoneylog_add_time` int(10) unsigned NOT NULL COMMENT '添加时间',
  PRIMARY KEY (`storemoneylog_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='店铺金额日志表';


-- -----------------------------
-- Table structure for `ds_storemsg`
-- -----------------------------
DROP TABLE IF EXISTS `ds_storemsg`;
CREATE TABLE `ds_storemsg` (
  `storemsg_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '店铺消息自增ID',
  `storemt_code` varchar(100) NOT NULL COMMENT '模板编码',
  `store_id` int(10) unsigned NOT NULL COMMENT '店铺id',
  `storemsg_content` varchar(255) NOT NULL COMMENT '消息内容',
  `storemsg_addtime` int(10) unsigned NOT NULL COMMENT '发送时间',
  `storemsg_readids` varchar(255) DEFAULT NULL COMMENT '已读卖家id',
  PRIMARY KEY (`storemsg_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COMMENT='店铺消息表';

-- -----------------------------
-- Records of `ds_storemsg`
-- -----------------------------
INSERT INTO `ds_storemsg` VALUES ('1', 'store_cost', '2', '您有一条新的店铺消费记录，金额：20，操作人：test，备注：购买限时折扣：。', '1543563871', '');
INSERT INTO `ds_storemsg` VALUES ('2', 'store_cost', '2', '您有一条新的店铺消费记录，金额：20，操作人：test，备注：购买限时折扣：。', '1543563883', '');

-- -----------------------------
-- Table structure for `ds_storemsgread`
-- -----------------------------
DROP TABLE IF EXISTS `ds_storemsgread`;
CREATE TABLE `ds_storemsgread` (
  `storemsg_id` int(11) NOT NULL COMMENT '店铺消息ID',
  `seller_id` int(11) NOT NULL COMMENT '卖家ID',
  `storemsg_readtime` int(11) NOT NULL COMMENT '阅读时间',
  PRIMARY KEY (`storemsg_id`,`seller_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='店铺消息阅读表';


-- -----------------------------
-- Table structure for `ds_storemsgsetting`
-- -----------------------------
DROP TABLE IF EXISTS `ds_storemsgsetting`;
CREATE TABLE `ds_storemsgsetting` (
  `storemt_code` varchar(100) NOT NULL COMMENT '模板编码',
  `store_id` int(10) unsigned NOT NULL COMMENT '店铺id',
  `storems_message_switch` tinyint(3) unsigned NOT NULL COMMENT '站内信接收开关 0:关闭 1:开启',
  `storems_short_switch` tinyint(3) unsigned NOT NULL COMMENT '短消息接收开关 0:关闭 1:开启',
  `storems_mail_switch` tinyint(3) unsigned NOT NULL COMMENT '邮件接收开关 0:关闭 1:开启',
  `storems_short_number` varchar(11) NOT NULL COMMENT '手机号码',
  `storems_mail_number` varchar(100) NOT NULL COMMENT '邮箱号码',
  PRIMARY KEY (`storemt_code`,`store_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='店铺消息接收设置';


-- -----------------------------
-- Table structure for `ds_storemsgtpl`
-- -----------------------------
DROP TABLE IF EXISTS `ds_storemsgtpl`;
CREATE TABLE `ds_storemsgtpl` (
  `storemt_code` varchar(100) NOT NULL COMMENT '商家消息模板编码',
  `storemt_name` varchar(100) NOT NULL COMMENT '商家消息模板名称',
  `storemt_message_switch` tinyint(3) unsigned NOT NULL COMMENT '站内信默认开关 0:关 1:开',
  `storemt_message_content` varchar(255) NOT NULL COMMENT '站内信内容',
  `storemt_message_forced` tinyint(3) unsigned NOT NULL COMMENT '站内信强制接收 0:否 1:是',
  `storemt_short_switch` tinyint(3) unsigned NOT NULL COMMENT '短信默认开关 0:关 1:开',
  `storemt_short_content` varchar(255) NOT NULL COMMENT '短信内容',
  `smt_short_forced` tinyint(3) unsigned NOT NULL COMMENT '短信强制接收 0:否 1:是',
  `storemt_mail_switch` tinyint(3) unsigned NOT NULL COMMENT '邮件默认开 0:关 1:开',
  `storemt_mail_subject` varchar(255) NOT NULL COMMENT '邮件标题',
  `storemt_mail_content` text NOT NULL COMMENT '邮件内容',
  `storemt_mail_forced` tinyint(3) unsigned NOT NULL COMMENT '邮件强制接收 0:否 1:是',
  PRIMARY KEY (`storemt_code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='商家消息模板';

-- -----------------------------
-- Records of `ds_storemsgtpl`
-- -----------------------------
INSERT INTO `ds_storemsgtpl` VALUES ('complain', '商品被投诉提醒', '1', '您售出的商品被投诉，等待商家申诉。投诉单编号：{$complain_id}。', '1', '1', '【{$site_name}】您售出的商品被投诉，等待商家申诉。投诉单编号：{$complain_id}。', '1', '1', '{$site_name}提醒：您售出的商品被投诉，等待商家申诉。投诉单编号：{$complain_id}。', '<p>\r\n	{$site_name}提醒：\r\n</p>\r\n<p>\r\n	您售出的商品被投诉，等待商家申诉。投诉单编号：{$complain_id}。\r\n</p>\r\n<p>\r\n	<br />\r\n</p>\r\n<p>\r\n	<br />\r\n</p>\r\n<p>\r\n	<br />\r\n</p>\r\n<p style=\"text-align:right;\">\r\n	{$site_name}\r\n</p>\r\n<p style=\"text-align:right;\">\r\n	{$mail_send_time}\r\n</p>\r\n<p>\r\n	<br />\r\n</p>', '1');
INSERT INTO `ds_storemsgtpl` VALUES ('goods_storage_alarm', '商品库存预警', '1', '您的商品库存不足，请及时补货。平台货号：{$common_id}，SKU：{$sku_id}。', '1', '0', '【{$site_name}】您的商品库存不足，请及时补货。平台货号：{$common_id}，SKU：{$sku_id}。', '0', '0', '{$site_name}提醒：您的商品库存不足，请及时补货。', '<p>\r\n	{$site_name}提醒：\r\n</p>\r\n<p>\r\n	您的商品库存不足，请及时补货。平台货号：{$common_id}，SKU：{$sku_id}。\r\n</p>\r\n<p>\r\n	点击下面链接查看商品详细信息\r\n</p>\r\n<p>\r\n	<a href=\"http://{$shop_site_url}/goods/index.html?goods_id={$sku_id}\" target=\"_blank\">http://{$shop_site_url}/goods/index.html?goods_id={$sku_id}</a> \r\n</p>\r\n<p>\r\n	<br />\r\n</p>\r\n<p>\r\n	<br />\r\n</p>\r\n<p>\r\n	<br />\r\n</p>\r\n<p style=\"text-align:right;\">\r\n	{$site_name}\r\n</p>\r\n<p style=\"text-align:right;\">\r\n	{$mail_send_time}\r\n</p>\r\n<p>\r\n	<br />\r\n</p>\r\n<br />', '0');
INSERT INTO `ds_storemsgtpl` VALUES ('goods_verify', '商品审核失败提醒', '1', '您的商品没有通过管理员审核，原因：“{$remark}”。平台货号：{$common_id}。', '1', '0', '【{$site_name}】您的商品没有通过管理员审核，原因：“{$remark}”。平台货号：{$common_id}。', '0', '0', '{$site_name}提醒：您的商品没有通过管理员审核。', '<p>\r\n	{$site_name}提醒：\r\n</p>\r\n<p>\r\n	您的商品没有通过管理员审核，原因：“{$remark}”。平台货号：{$common_id}。\r\n	</p><p>\r\n		<br />\r\n	</p>\r\n	<p>\r\n		<br />\r\n	</p>\r\n	<p style=\"text-align:right;\">\r\n		{$site_name}\r\n	</p>\r\n	<p style=\"text-align:right;\">\r\n		{$mail_send_time}\r\n	</p>', '0');
INSERT INTO `ds_storemsgtpl` VALUES ('goods_violation', '商品违规被下架', '1', '您的商品被违规下架，原因：“{$remark}”。平台货号：{$common_id}。', '1', '0', '【{$site_name}】您的商品被违规下架，原因：“{$remark}”。平台货号：{$common_id}。', '0', '0', '{$site_name}提醒：您的商品被违规下架。', '<p>\r\n	{$site_name}提醒：\r\n</p>\r\n<p>\r\n	您的商品被违规下架。，原因：“{$remark}”。平台货号：{$common_id}。\r\n</p>\r\n<p>\r\n	<br />\r\n</p>\r\n<p>\r\n	<br />\r\n</p>\r\n<p style=\"text-align:right;\">\r\n	{$site_name}\r\n</p>\r\n<p style=\"text-align:right;\">\r\n	{$mail_send_time}\r\n</p>\r\n<p>\r\n	<br />\r\n</p>', '0');
INSERT INTO `ds_storemsgtpl` VALUES ('new_order', '新订单提醒', '1', '您有订单需要处理，订单编号：{$order_sn}。', '1', '1', '【{$site_name}】您有订单需要处理，订单编号：{$order_sn}。', '1', '0', '{$site_name}提醒：您有订单需要处理。', '<p>\r\n	{$site_name}提醒：\r\n</p>\r\n<p>\r\n	您有订单需要处理，订单编号：{$order_sn}。\r\n</p>\r\n<p>\r\n	<br />\r\n</p>\r\n<p>\r\n	<br />\r\n</p>\r\n<p>\r\n	<br />\r\n</p>\r\n<p style=\"text-align:right;\">\r\n	{$site_name}\r\n</p>\r\n<p style=\"text-align:right;\">\r\n	{$mail_send_time}\r\n</p>\r\n<br />', '0');
INSERT INTO `ds_storemsgtpl` VALUES ('refund', '退款提醒', '1', '您有一个{$type}退款单需要处理，退款编号：{$refund_sn}。', '1', '0', '【{$site_name}】您有一个{$type}退款单需要处理，退款编号：{$refund_sn}。', '1', '0', '{$site_name}提醒：您有一个{$type}退款单需要处理，退款编号：{$refund_sn}。', '<p>\r\n	{$site_name}提醒：\r\n</p>\r\n<p>\r\n	您有一个{$type}退款单需要处理，退款编号：{$refund_sn}。\r\n</p>\r\n<p>\r\n	<br />\r\n</p>\r\n<p>\r\n	<br />\r\n</p>\r\n<p>\r\n	<br />\r\n</p>\r\n<p style=\"text-align:right;\">\r\n	{$site_name}\r\n</p>\r\n<p style=\"text-align:right;\">\r\n	{$mail_send_time}\r\n</p>\r\n<p>\r\n	<br />\r\n</p>', '1');
INSERT INTO `ds_storemsgtpl` VALUES ('refund_auto_process', '退款自动处理提醒', '1', '您的{$type}退款单超期未处理，已自动同意买家退款申请。退款单编号：{$refund_sn}。', '1', '0', '【{$site_name}】您的{$type}退款单超期未处理，已自动同意买家退款申请。退款单编号：{$refund_sn}。', '0', '0', '{site_name}提醒：您的{$type}退款单超期未处理，已自动同意买家退款申请。退款单编号：{$refund_sn}。', '<p>\r\n	{site_name}提醒：\r\n</p>\r\n<p>\r\n	您的{$type}退款单超期未处理，已自动同意买家退款申请。退款单编号：{$refund_sn}。\r\n</p>\r\n<p>\r\n	<br />\r\n</p>\r\n<p>\r\n	<br />\r\n</p>\r\n<p>\r\n	<br />\r\n</p>\r\n<p style=\"text-align:right;\">\r\n	{$site_name}\r\n</p>\r\n<p style=\"text-align:right;\">\r\n	{$mail_send_time}\r\n</p>\r\n<p>\r\n	<br />\r\n</p>', '0');
INSERT INTO `ds_storemsgtpl` VALUES ('return', '退货提醒', '1', '您有一个{$type}退货单需要处理。退货编号：{$refund_sn}。', '1', '0', '【{site_name}】您有一个{$type}退货单需要处理。退货编号：{$refund_sn}。', '0', '0', '{$site_name}提醒：您有一个{$type}退货单需要处理。退货编号：{$refund_sn}。', '<p>\r\n	{$site_name}提醒：\r\n</p>\r\n<p>\r\n	您有一个{$type}退货单需要处理。退货编号：{$refund_sn}。\r\n</p>\r\n<p>\r\n	<br />\r\n</p>\r\n<p>\r\n	<br />\r\n</p>\r\n<p>\r\n	<br />\r\n</p>\r\n<p style=\"text-align:right;\">\r\n	{$site_name}\r\n</p>\r\n<p style=\"text-align:right;\">\r\n	{$mail_send_time}\r\n</p>\r\n<p>\r\n	<br />\r\n</p>\r\n<br />', '0');
INSERT INTO `ds_storemsgtpl` VALUES ('return_auto_process', '退货自动处理提醒', '1', '您的{$type}退货单超期未处理，已自动同意买家退货申请（弃货）。退货单编号：{$refund_sn}。', '1', '0', '【{$site_name}】您的{$type}退货单超期未处理，已自动同意买家退货申请（弃货）。退货单编号：{$refund_sn}。', '0', '0', '{$site_name}提醒：您的{$type}退货单超期未处理，已自动同意买家退货申请（弃货）。退货单编号：{$refund_sn}。', '<p>\r\n	{$site_name}提醒：\r\n</p>\r\n<p>\r\n	您的{$type}退货单超期未处理，已自动同意买家退货申请（弃货）。退货单编号：{$refund_sn}。\r\n</p>\r\n<p>\r\n	<br />\r\n</p>\r\n<p>\r\n	<br />\r\n</p>\r\n<p>\r\n	<br />\r\n</p>\r\n<p style=\"text-align:right;\">\r\n	{$site_name}\r\n</p>\r\n<p style=\"text-align:right;\">\r\n	{$mail_send_time}\r\n</p>', '0');
INSERT INTO `ds_storemsgtpl` VALUES ('return_auto_receipt', '退货未收货自动处理提醒', '1', '您的{$type}退货单不处理收货超期未处理，已自动按弃货处理。退货单编号：{$refund_sn}。', '1', '0', '【{$site_name}】您的{$type}退货单不处理收货超期未处理，已自动按弃货处理。退货单编号：{$refund_sn}。', '0', '0', '{$site_name}提醒：您的{$type}退货单超期未处理，已自动同意买家退货申请（弃货）。退货单编号：{$refund_sn}。', '<p>\r\n	{$site_name}提醒：\r\n</p>\r\n<p>\r\n	您的{$type}退货单超期未处理，已自动同意买家退货申请（弃货）。退货单编号：{$refund_sn}。\r\n</p>\r\n<p>\r\n	<br />\r\n</p>\r\n<p>\r\n	<br />\r\n</p>\r\n<p>\r\n	<br />\r\n</p>\r\n<p style=\"text-align:right;\">\r\n	{$site_name}\r\n</p>\r\n<p style=\"text-align:right;\">\r\n	{$mail_send_time}\r\n</p>\r\n<p>\r\n	<br />\r\n</p>', '0');
INSERT INTO `ds_storemsgtpl` VALUES ('store_bill_affirm', '结算单等待确认提醒', '1', '您有新的结算单等待确认，开始时间：{$state_time}，结束时间：{$end_time}，结算单号：{$bill_no}。', '1', '0', '【{$site_name}】您有新的结算单等待确认，开始时间：{$state_time}，结束时间：{$end_time}，结算单号：{$bill_no}。', '0', '0', '{$site_name}提醒：您有新的结算单等待确认。', '<p>\r\n	{$site_name}提醒：\r\n</p>\r\n<p>\r\n	您有新的结算单等待确认，起止时间：开始时间：{$state_time}，结束时间：{$end_time}，结算单号：{$bill_no}。\r\n</p>\r\n<p>\r\n	<br />\r\n</p>\r\n<p>\r\n	<br />\r\n</p>\r\n<p>\r\n	<br />\r\n</p>\r\n<p style=\"text-align:right;\">\r\n	{$site_name}\r\n</p>\r\n<p style=\"text-align:right;\">\r\n	{$mail_send_time}\r\n</p>\r\n<p>\r\n	<br />\r\n</p>', '0');
INSERT INTO `ds_storemsgtpl` VALUES ('store_bill_gathering', '结算单已经付款提醒', '1', '您的结算单平台已付款，请注意查收，结算单编号：{$bill_no}。', '1', '0', '【{$site_name}】您的结算单平台已付款，请注意查收，结算单编号：{$bill_no}。', '0', '0', '{$site_name}提醒：您的结算单平台已付款，请注意查收。', '<p>\r\n	</p><p>\r\n		{$site_name}提醒：\r\n	</p>\r\n\r\n<p>\r\n	您的结算单平台已付款，请注意查收，结算单编号：{$bill_no}。\r\n	</p><p>\r\n		<br />\r\n	</p>\r\n	<p>\r\n		<br />\r\n	</p>\r\n	<p>\r\n		<br />\r\n	</p>\r\n	<p style=\"text-align:right;\">\r\n		{$site_name}\r\n	</p>\r\n	<p style=\"text-align:right;\">\r\n		{$mail_send_time}\r\n	</p>\r\n\r\n<br />', '0');
INSERT INTO `ds_storemsgtpl` VALUES ('store_cost', '店铺消费提醒', '1', '您有一条新的店铺消费记录，金额：{$price}，操作人：{$seller_name}，备注：{$remark}。', '1', '1', '【{$site_name}】您有一条新的店铺消费记录，金额：{$price}，操作人：{$seller_name}，备注：{$remark}。', '1', '0', '{$site_name}提醒：您有一条新的店铺消费记录。', '<p>\r\n	{$site_name}提醒：\r\n</p>\r\n<p>\r\n	您有一条新的店铺消费记录，金额：{$price}，操作人：{$seller_name}，备注：{$remark}。\r\n</p>\r\n<p>\r\n	<br />\r\n</p>\r\n<p>\r\n	<br />\r\n</p>\r\n<p>\r\n	<br />\r\n</p>\r\n<p style=\"text-align:right;\">\r\n	{$site_name}\r\n</p>\r\n<p style=\"text-align:right;\">\r\n	{$mail_send_time}\r\n</p>', '0');
INSERT INTO `ds_storemsgtpl` VALUES ('store_expire', '店铺到期提醒', '1', '你的店铺即将到期，请及时续期。', '1', '0', '【{$site_name}】你的店铺即将到期，请及时续期。', '0', '0', '{$site_name}提醒：你的店铺即将到期，请及时续期。', '<p>\r\n	{$site_name}提醒：\r\n</p>\r\n<p>\r\n	你的店铺即将到期，请及时续期。\r\n</p>\r\n<p>\r\n	<br />\r\n</p>\r\n<p>\r\n	<br />\r\n</p>\r\n<p>\r\n	<br />\r\n</p>\r\n<p style=\"text-align:right;\">\r\n	{$site_name}\r\n</p>\r\n<p style=\"text-align:right;\">\r\n	{$mail_send_time}\r\n</p>\r\n<p>\r\n	<br />\r\n</p>', '0');

-- -----------------------------
-- Table structure for `ds_storenavigation`
-- -----------------------------
DROP TABLE IF EXISTS `ds_storenavigation`;
CREATE TABLE `ds_storenavigation` (
  `storenav_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '卖家店铺导航自增ID',
  `storenav_title` varchar(50) NOT NULL COMMENT '卖家店铺导航名称',
  `storenav_store_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '卖家店铺ID',
  `storenav_content` text COMMENT '卖家店铺导航内容',
  `storenav_sort` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '卖家店铺导航排序',
  `storenav_url` varchar(255) DEFAULT NULL COMMENT '店铺导航的外链URL',
  PRIMARY KEY (`storenav_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='卖家店铺导航信息表';


-- -----------------------------
-- Table structure for `ds_storeplate`
-- -----------------------------
DROP TABLE IF EXISTS `ds_storeplate`;
CREATE TABLE `ds_storeplate` (
  `storeplate_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '关联板式id',
  `storeplate_name` varchar(10) NOT NULL COMMENT '关联板式名称',
  `storeplate_position` tinyint(3) unsigned NOT NULL COMMENT '关联板式位置 1:顶部 0:底部',
  `storeplate_content` text NOT NULL COMMENT '关联板式内容',
  `store_id` int(10) unsigned NOT NULL COMMENT '所属店铺ID',
  PRIMARY KEY (`storeplate_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='关联板式表';


-- -----------------------------
-- Table structure for `ds_storereopen`
-- -----------------------------
DROP TABLE IF EXISTS `ds_storereopen`;
CREATE TABLE `ds_storereopen` (
  `storereopen_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '续签自增ID',
  `storereopen_grade_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT '店铺等级ID',
  `storereopen_grade_name` varchar(30) DEFAULT NULL COMMENT '等级名称',
  `storereopen_grade_price` decimal(10,2) unsigned NOT NULL DEFAULT '0.00' COMMENT '等级收费(元/年)',
  `storereopen_year` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '续签时长(年)',
  `storereopen_pay_amount` decimal(10,2) unsigned NOT NULL DEFAULT '0.00' COMMENT '应付总金额',
  `storereopen_store_name` varchar(50) DEFAULT NULL COMMENT '店铺名字',
  `storereopen_store_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '店铺ID',
  `storereopen_state` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '状态 0:未上传凭证 1:审核中 2:审核通过',
  `storereopen_pay_cert` varchar(50) DEFAULT NULL COMMENT '付款凭证',
  `storereopen_pay_cert_explain` varchar(200) DEFAULT NULL COMMENT '付款说明',
  PRIMARY KEY (`storereopen_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='续签内容表';


-- -----------------------------
-- Table structure for `ds_storesnscomment`
-- -----------------------------
DROP TABLE IF EXISTS `ds_storesnscomment`;
CREATE TABLE `ds_storesnscomment` (
  `storesnscomm_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '店铺动态评论自增ID',
  `stracelog_id` int(11) NOT NULL COMMENT '店铺动态ID',
  `storesnscomm_content` varchar(150) DEFAULT NULL COMMENT '评论内容',
  `storesnscomm_memberid` int(11) DEFAULT NULL COMMENT '会员ID',
  `storesnscomm_membername` varchar(45) DEFAULT NULL COMMENT '会员名称',
  `storesnscomm_memberavatar` varchar(50) DEFAULT NULL COMMENT '会员头像',
  `storesnscomm_time` varchar(11) DEFAULT NULL COMMENT '评论时间',
  `storesnscomm_state` tinyint(1) NOT NULL DEFAULT '1' COMMENT '评论状态 1:正常 0:屏蔽',
  PRIMARY KEY (`storesnscomm_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='店铺动态评论表';


-- -----------------------------
-- Table structure for `ds_storesnssetting`
-- -----------------------------
DROP TABLE IF EXISTS `ds_storesnssetting`;
CREATE TABLE `ds_storesnssetting` (
  `storesnsset_storeid` int(11) NOT NULL COMMENT '店铺ID',
  `storesnsset_new` tinyint(4) NOT NULL DEFAULT '1' COMMENT '新品 0:关闭 1:开启',
  `storesnsset_newtitle` varchar(150) NOT NULL COMMENT '新品内容',
  `storesnsset_coupon` tinyint(4) NOT NULL DEFAULT '1' COMMENT '优惠券 0:关闭 1:开启',
  `storesnsset_coupontitle` varchar(150) NOT NULL COMMENT '优惠券内容',
  `storesnsset_xianshi` tinyint(4) NOT NULL DEFAULT '1' COMMENT '限时折扣 0:关闭 1:开启',
  `storesnsset_xianshititle` varchar(150) NOT NULL COMMENT '限时折扣内容',
  `storesnsset_mansong` tinyint(4) NOT NULL DEFAULT '1' COMMENT '满即送 0:关闭 1:开启',
  `storesnsset_mansongtitle` varchar(150) NOT NULL COMMENT '满即送内容',
  `storesnsset_bundling` tinyint(4) NOT NULL DEFAULT '1' COMMENT '组合销售 0:关闭 1:开启',
  `storesnsset_bundlingtitle` varchar(150) NOT NULL COMMENT '组合销售内容',
  `storesnsset_groupbuy` tinyint(4) NOT NULL DEFAULT '1' COMMENT '抢购,0:关闭 1:开启',
  `storesnsset_groupbuytitle` varchar(150) NOT NULL COMMENT '抢购内容',
  PRIMARY KEY (`storesnsset_storeid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='店铺自动发布动态设置表';


-- -----------------------------
-- Table structure for `ds_storesnstracelog`
-- -----------------------------
DROP TABLE IF EXISTS `ds_storesnstracelog`;
CREATE TABLE `ds_storesnstracelog` (
  `stracelog_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '店铺动态自增ID',
  `stracelog_storeid` int(11) DEFAULT NULL COMMENT '店铺ID',
  `stracelog_storename` varchar(100) DEFAULT NULL COMMENT '店铺名称',
  `stracelog_storelogo` varchar(255) NOT NULL COMMENT '店标',
  `stracelog_title` varchar(150) DEFAULT NULL COMMENT '动态标题',
  `stracelog_content` text COMMENT '发表内容',
  `stracelog_time` varchar(11) DEFAULT NULL COMMENT '动态发表时间',
  `stracelog_cool` int(11) DEFAULT '0' COMMENT '动态赞数量',
  `stracelog_spread` int(11) DEFAULT '0' COMMENT '动态转播数量',
  `stracelog_comment` int(11) DEFAULT '0' COMMENT '动态评论数量',
  `stracelog_type` tinyint(4) DEFAULT '1' COMMENT '1:relay,2:normal,3:new,4:coupon,5:xianshi,6:mansong,7:bundling,8:groupbuy,9:recommend,10:hotsell',
  `stracelog_goodsdata` varchar(1000) DEFAULT NULL COMMENT '商品信息',
  `stracelog_state` tinyint(1) NOT NULL DEFAULT '1' COMMENT '动态状态 1:正常 0:屏蔽',
  PRIMARY KEY (`stracelog_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='店铺动态表';


-- -----------------------------
-- Table structure for `ds_storewatermark`
-- -----------------------------
DROP TABLE IF EXISTS `ds_storewatermark`;
CREATE TABLE `ds_storewatermark` (
  `swm_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '水印自增ID',
  `swm_quality` int(3) NOT NULL DEFAULT '90' COMMENT '水印图片质量',
  `swm_image_name` varchar(255) DEFAULT NULL COMMENT '水印文件名',
  `swm_image_pos` tinyint(1) NOT NULL DEFAULT '1' COMMENT '水印图片存放位置',
  `swm_image_transition` int(3) NOT NULL DEFAULT '20' COMMENT '水印图片融合度 ',
  `swm_text` text COMMENT '水印文字',
  `swm_text_size` int(3) NOT NULL DEFAULT '20' COMMENT '水印文字大小',
  `swm_text_angle` tinyint(1) NOT NULL DEFAULT '4' COMMENT '水印文字角度',
  `swm_text_pos` tinyint(1) NOT NULL DEFAULT '3' COMMENT '水印文字位置',
  `swm_text_font` varchar(50) DEFAULT NULL COMMENT '水印文字字体',
  `swm_text_color` varchar(7) NOT NULL DEFAULT '#CCCCCC' COMMENT '水印字体颜色值',
  `swm_is_open` tinyint(1) NOT NULL DEFAULT '0' COMMENT '水印是否开启 0:关闭 1:开启',
  `store_id` int(11) DEFAULT NULL COMMENT '店铺ID',
  PRIMARY KEY (`swm_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='店铺水印图片表';

-- -----------------------------
-- Records of `ds_storewatermark`
-- -----------------------------
INSERT INTO `ds_storewatermark` VALUES ('1', '90', '', '1', '20', '', '20', '4', '3', 'default', '#CCCCCC', '0', '1');

-- -----------------------------
-- Table structure for `ds_storewaybill`
-- -----------------------------
DROP TABLE IF EXISTS `ds_storewaybill`;
CREATE TABLE `ds_storewaybill` (
  `storewaybill_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '店铺运单模板自增ID',
  `store_id` int(10) unsigned NOT NULL COMMENT '店铺ID',
  `express_id` int(10) unsigned NOT NULL COMMENT '物流公司ID',
  `waybill_id` int(10) unsigned NOT NULL COMMENT '运单模板ID',
  `waybill_name` varchar(50) NOT NULL COMMENT '运单模板名称',
  `storewaybill_data` varchar(2000) DEFAULT NULL COMMENT '店铺自定义设置',
  `storewaybill_isdefault` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '是否默认模板',
  `storewaybill_left` int(11) NOT NULL DEFAULT '0' COMMENT '店铺运单左偏移',
  `storewaybill_top` int(11) NOT NULL DEFAULT '0' COMMENT '店铺运单上偏移',
  PRIMARY KEY (`storewaybill_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='店铺运单模板表';


-- -----------------------------
-- Table structure for `ds_transport`
-- -----------------------------
DROP TABLE IF EXISTS `ds_transport`;
CREATE TABLE `ds_transport` (
  `transport_id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT COMMENT '售卖区域自增ID',
  `transport_title` varchar(30) NOT NULL COMMENT '售卖区域名称',
  `send_tpl_id` mediumint(8) unsigned DEFAULT NULL COMMENT '发货地区模板ID',
  `store_id` mediumint(8) unsigned NOT NULL COMMENT '店铺ID',
  `transport_updatetime` int(10) unsigned DEFAULT '0' COMMENT '最后更新时间',
  PRIMARY KEY (`transport_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='售卖区域';


-- -----------------------------
-- Table structure for `ds_transportextend`
-- -----------------------------
DROP TABLE IF EXISTS `ds_transportextend`;
CREATE TABLE `ds_transportextend` (
  `transportext_id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT COMMENT '运费模板扩展ID',
  `transportext_area_id` text COMMENT '市级地区ID组成的串，以，隔开，两端也有，',
  `transportext_top_area_id` text COMMENT '省级地区ID组成的串，以，隔开，两端也有，',
  `transportext_area_name` text COMMENT '地区name组成的串，以，隔开',
  `transportext_sprice` decimal(10,2) DEFAULT '0.00' COMMENT '首件运费',
  `transport_id` mediumint(8) unsigned NOT NULL COMMENT '运费模板ID',
  `transport_title` varchar(60) DEFAULT NULL COMMENT '运费模板',
  `transportext_is_default` tinyint(2) NOT NULL DEFAULT '0',
  `transportext_snum` int(11) DEFAULT '1' COMMENT '起始件数',
  `transportext_xnum` int(11) DEFAULT NULL,
  `transportext_xprice` decimal(10,2) DEFAULT NULL,
  PRIMARY KEY (`transportext_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='运费模板扩展表';


-- -----------------------------
-- Table structure for `ds_type`
-- -----------------------------
DROP TABLE IF EXISTS `ds_type`;
CREATE TABLE `ds_type` (
  `type_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '类型自增ID',
  `type_name` varchar(100) NOT NULL COMMENT '类型名称',
  `type_sort` tinyint(1) unsigned NOT NULL COMMENT '类型排序',
  `class_id` int(10) unsigned DEFAULT '0' COMMENT '所属商品分类id',
  `class_name` varchar(100) NOT NULL COMMENT '所属商品分类名称',
  PRIMARY KEY (`type_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='商品类型表';

-- -----------------------------
-- Records of `ds_type`
-- -----------------------------
INSERT INTO `ds_type` VALUES ('1', '联动', '0', '15', '男装/ 女装/ 内衣');

-- -----------------------------
-- Table structure for `ds_typebrand`
-- -----------------------------
DROP TABLE IF EXISTS `ds_typebrand`;
CREATE TABLE `ds_typebrand` (
  `type_id` int(10) unsigned NOT NULL COMMENT '类型ID',
  `brand_id` int(10) unsigned NOT NULL COMMENT '品牌ID'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='商品类型与品牌对应表';


-- -----------------------------
-- Table structure for `ds_typespec`
-- -----------------------------
DROP TABLE IF EXISTS `ds_typespec`;
CREATE TABLE `ds_typespec` (
  `type_id` int(10) unsigned NOT NULL COMMENT '类型ID',
  `sp_id` int(10) unsigned NOT NULL COMMENT '规格ID'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='商品类型与规格对应表';

-- -----------------------------
-- Records of `ds_typespec`
-- -----------------------------
INSERT INTO `ds_typespec` VALUES ('1', '1');
INSERT INTO `ds_typespec` VALUES ('1', '3');
INSERT INTO `ds_typespec` VALUES ('1', '2');

-- -----------------------------
-- Table structure for `ds_upload`
-- -----------------------------
DROP TABLE IF EXISTS `ds_upload`;
CREATE TABLE `ds_upload` (
  `upload_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '上传文件自增ID',
  `file_name` varchar(100) DEFAULT NULL COMMENT '上传文件名',
  `file_size` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '上传文件大小',
  `upload_type` tinyint(1) NOT NULL DEFAULT '0' COMMENT '上传文件类别 0:无 1:文章图片 2:帮助内容图片 3:店铺幻灯片 4:系统文章图片 5:积分礼品切换图片 6:积分礼品内容图片',
  `upload_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '上传文件添加时间',
  `item_id` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '信息ID',
  PRIMARY KEY (`upload_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='上传文件表';


-- -----------------------------
-- Table structure for `ds_voucher`
-- -----------------------------
DROP TABLE IF EXISTS `ds_voucher`;
CREATE TABLE `ds_voucher` (
  `voucher_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '代金券自增ID',
  `voucher_code` varchar(32) NOT NULL COMMENT '代金券编码',
  `vouchertemplate_id` int(11) NOT NULL COMMENT '代金券模版编号',
  `voucher_title` varchar(50) NOT NULL COMMENT '代金券标题',
  `voucher_desc` varchar(255) NOT NULL COMMENT '代金券描述',
  `voucher_startdate` int(11) NOT NULL COMMENT '代金券有效期开始时间',
  `voucher_enddate` int(11) NOT NULL COMMENT '代金券有效期结束时间',
  `voucher_price` int(11) NOT NULL COMMENT '代金券面额',
  `voucher_limit` decimal(10,2) NOT NULL COMMENT '代金券使用时的订单限额',
  `voucher_store_id` int(11) NOT NULL COMMENT '代金券的店铺id',
  `voucher_state` tinyint(4) NOT NULL COMMENT '代金券状态 1:未用 2:已用 3:过期 4:收回 ',
  `voucher_activedate` int(11) NOT NULL COMMENT '代金券发放日期',
  `voucher_type` tinyint(4) NOT NULL DEFAULT '0' COMMENT '代金券类别',
  `voucher_owner_id` int(11) NOT NULL COMMENT '代金券所有者ID',
  `voucher_owner_name` varchar(50) NOT NULL COMMENT '代金券所有者名称',
  `voucher_order_id` int(11) DEFAULT NULL COMMENT '使用该代金券的订单编号',
  PRIMARY KEY (`voucher_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='代金券表';


-- -----------------------------
-- Table structure for `ds_voucherprice`
-- -----------------------------
DROP TABLE IF EXISTS `ds_voucherprice`;
CREATE TABLE `ds_voucherprice` (
  `voucherprice_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '代金券面值自增ID',
  `voucherprice_describe` varchar(255) NOT NULL COMMENT '代金券描述',
  `voucherprice` int(11) NOT NULL COMMENT '代金券面值',
  `voucherprice_defaultpoints` int(11) NOT NULL DEFAULT '0' COMMENT '代金劵默认的兑换所需积分可以为0',
  PRIMARY KEY (`voucherprice_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='代金券面额表';


-- -----------------------------
-- Table structure for `ds_voucherquota`
-- -----------------------------
DROP TABLE IF EXISTS `ds_voucherquota`;
CREATE TABLE `ds_voucherquota` (
  `voucherquota_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '代金券套餐自增ID',
  `voucherquota_applyid` int(11) DEFAULT NULL COMMENT '代金券套餐申请编号',
  `voucherquota_memberid` int(11) NOT NULL COMMENT '会员ID',
  `voucherquota_membername` varchar(100) NOT NULL COMMENT '会员名称',
  `voucherquota_storeid` int(11) NOT NULL COMMENT '店铺ID',
  `voucherquota_storename` varchar(100) NOT NULL COMMENT '店铺名称',
  `voucherquota_starttime` int(11) NOT NULL COMMENT '代金券套餐开始时间',
  `voucherquota_endtime` int(11) NOT NULL COMMENT '代金券套餐结束时间',
  `voucherquota_state` tinyint(1) NOT NULL DEFAULT '1' COMMENT '状态 1:可用 2:取消 3:结束',
  PRIMARY KEY (`voucherquota_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='代金券套餐表';


-- -----------------------------
-- Table structure for `ds_vouchertemplate`
-- -----------------------------
DROP TABLE IF EXISTS `ds_vouchertemplate`;
CREATE TABLE `ds_vouchertemplate` (
  `vouchertemplate_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '代金券模版自增ID',
  `vouchertemplate_title` varchar(50) NOT NULL COMMENT '代金券模版名称',
  `vouchertemplate_desc` varchar(255) NOT NULL COMMENT '代金券模版描述',
  `vouchertemplate_startdate` int(11) NOT NULL COMMENT '代金券模版有效期开始时间',
  `vouchertemplate_enddate` int(11) NOT NULL COMMENT '代金券模版有效期结束时间',
  `vouchertemplate_price` int(11) NOT NULL COMMENT '代金券模版面额',
  `vouchertemplate_limit` decimal(10,2) NOT NULL COMMENT '代金券使用时的订单限额',
  `vouchertemplate_store_id` int(11) NOT NULL COMMENT '代金券模版的店铺ID',
  `vouchertemplate_storename` varchar(100) DEFAULT NULL COMMENT '店铺名称',
  `vouchertemplate_sc_id` int(11) NOT NULL DEFAULT '0' COMMENT '所属店铺分类ID',
  `vouchertemplate_creator_id` int(11) NOT NULL COMMENT '代金券模版的创建者ID',
  `vouchertemplate_state` tinyint(4) NOT NULL COMMENT '代金券模版状态 1:有效 2:失效',
  `vouchertemplate_total` int(11) NOT NULL COMMENT '模版可发放的代金券总数',
  `vouchertemplate_giveout` int(11) NOT NULL COMMENT '模版已发放的代金券数量',
  `vouchertemplate_used` int(11) NOT NULL COMMENT '模版已经使用过的代金券',
  `vouchertemplate_adddate` int(11) NOT NULL COMMENT '模版的创建时间',
  `vouchertemplate_quotaid` int(11) NOT NULL COMMENT '套餐编号',
  `vouchertemplate_points` int(11) NOT NULL DEFAULT '0' COMMENT '兑换所需积分',
  `vouchertemplate_eachlimit` int(11) NOT NULL DEFAULT '1' COMMENT '每人限领张数',
  `vouchertemplate_styleimg` varchar(200) DEFAULT NULL COMMENT '样式模版图片',
  `vouchertemplate_customimg` varchar(200) DEFAULT NULL COMMENT '自定义代金券模板图片',
  `vouchertemplate_recommend` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否推荐 0:不推荐 1:推荐',
  `vouchertemplate_gettype` tinyint(1) NOT NULL COMMENT '代金券类型',
  PRIMARY KEY (`vouchertemplate_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='代金券模版表';


-- -----------------------------
-- Table structure for `ds_vrgroupbuyclass`
-- -----------------------------
DROP TABLE IF EXISTS `ds_vrgroupbuyclass`;
CREATE TABLE `ds_vrgroupbuyclass` (
  `vrgclass_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '虚拟抢购分类自增ID',
  `vrgclass_name` varchar(100) NOT NULL COMMENT '分类名称',
  `vrgclass_parent_id` int(11) NOT NULL COMMENT '上级分类ID',
  `vrgclass_sort` tinyint(3) unsigned DEFAULT NULL COMMENT '虚拟抢购分类排序',
  PRIMARY KEY (`vrgclass_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='虚拟抢购分类表';


-- -----------------------------
-- Table structure for `ds_vrorder`
-- -----------------------------
DROP TABLE IF EXISTS `ds_vrorder`;
CREATE TABLE `ds_vrorder` (
  `order_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '虚拟订单自增ID',
  `order_sn` varchar(20) NOT NULL COMMENT '虚拟订单编号',
  `store_id` int(11) unsigned NOT NULL COMMENT '卖家店铺ID',
  `store_name` varchar(50) NOT NULL COMMENT '卖家店铺名称',
  `buyer_id` int(11) unsigned NOT NULL COMMENT '买家ID',
  `buyer_name` varchar(50) NOT NULL COMMENT '买家登录名',
  `buyer_phone` varchar(11) NOT NULL COMMENT '买家手机',
  `add_time` int(10) unsigned NOT NULL COMMENT '虚拟订单生成时间',
  `payment_code` char(20) NOT NULL DEFAULT '' COMMENT '虚拟订单支付方式名称代码',
  `payment_time` int(10) unsigned DEFAULT '0' COMMENT '虚拟订单支付(付款)时间',
  `trade_no` varchar(35) DEFAULT NULL COMMENT '第三方平台交易号',
  `close_time` int(10) unsigned DEFAULT '0' COMMENT '虚拟订单关闭时间',
  `close_reason` varchar(50) DEFAULT NULL COMMENT '虚拟订单关闭原因',
  `finnshed_time` int(11) DEFAULT NULL COMMENT '虚拟订单完成时间',
  `order_amount` decimal(10,2) unsigned NOT NULL DEFAULT '0.00' COMMENT '订单总价格(支付金额)',
  `refund_amount` decimal(10,2) DEFAULT '0.00' COMMENT '退款金额',
  `rcb_amount` decimal(10,2) unsigned NOT NULL DEFAULT '0.00' COMMENT '充值卡支付金额',
  `pd_amount` decimal(10,2) unsigned NOT NULL DEFAULT '0.00' COMMENT '预存款支付金额',
  `order_state` tinyint(4) NOT NULL DEFAULT '0' COMMENT '订单状态 0:已取消 10:未付款 20:已付款 40:已完成',
  `refund_state` tinyint(1) unsigned DEFAULT '0' COMMENT '退款状态 0:无退款 1:部分退款 2:全部退款',
  `buyer_msg` varchar(150) DEFAULT NULL COMMENT '虚拟订单买家留言',
  `delete_state` tinyint(4) NOT NULL DEFAULT '0' COMMENT '删除状态 0:未删除1:放入回收站2:彻底删除',
  `goods_id` int(11) NOT NULL COMMENT '商品ID',
  `goods_name` varchar(50) NOT NULL COMMENT '商品名称',
  `goods_price` decimal(10,2) NOT NULL COMMENT '商品价格',
  `goods_num` smallint(5) unsigned NOT NULL DEFAULT '1' COMMENT '商品数量',
  `goods_image` varchar(100) DEFAULT NULL COMMENT '商品图片',
  `commis_rate` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT '佣金比例',
  `gc_id` mediumint(9) DEFAULT '0' COMMENT '商品最底级分类ID',
  `vr_indate` int(11) DEFAULT NULL COMMENT '虚拟订单有效期',
  `vr_send_times` tinyint(4) NOT NULL DEFAULT '0' COMMENT '兑换码发送次数',
  `vr_invalid_refund` tinyint(4) NOT NULL DEFAULT '1' COMMENT '允许过期退款 1:是 0:否',
  `order_promotion_type` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '订单参加的促销类型 0:无促销 1:抢购',
  `promotions_id` mediumint(9) DEFAULT '0' COMMENT '促销ID，与order_promotion_type配合使用',
  `order_from` tinyint(4) NOT NULL DEFAULT '1' COMMENT '订单来源 1:PC 2:手机',
  `evaluation_state` tinyint(4) NOT NULL DEFAULT '0' COMMENT '评价状态 0:默认 1:已评价 2:禁止评价',
  `evaluation_time` int(11) NOT NULL DEFAULT '0' COMMENT '评价时间',
  `use_state` tinyint(4) DEFAULT '0' COMMENT '使用状态 0:未使用 1:已使用',
  `ob_no` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '相关结算单号',
  PRIMARY KEY (`order_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='虚拟订单表';


-- -----------------------------
-- Table structure for `ds_vrorderbill`
-- -----------------------------
DROP TABLE IF EXISTS `ds_vrorderbill`;
CREATE TABLE `ds_vrorderbill` (
  `vrob_no` int(11) NOT NULL COMMENT '虚拟订单结算单编号(年月店铺ID)',
  `vrob_startdate` int(11) NOT NULL COMMENT '虚拟订单结算开始日期',
  `vrob_enddate` int(11) NOT NULL COMMENT '虚拟订单结算结束日期',
  `vrob_order_totals` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '订单金额',
  `vrob_commis_totals` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '佣金金额',
  `vrob_result_totals` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '应结金额',
  `vrob_createdate` int(11) DEFAULT '0' COMMENT '生成结算单日期',
  `vros_month` mediumint(6) unsigned NOT NULL COMMENT '结算单年月份',
  `vrob_state` enum('1','2','3','4') DEFAULT '1' COMMENT '1:默认2:店家已确认3:平台已审核4:结算完成',
  `vrob_paydate` int(11) DEFAULT '0' COMMENT '付款日期',
  `vrob_pay_content` varchar(200) DEFAULT '' COMMENT '支付备注',
  `vrob_store_id` int(11) NOT NULL COMMENT '店铺ID',
  `vrob_store_name` varchar(50) DEFAULT NULL COMMENT '店铺名',
  `vrob_inviter_totals` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '分销的佣金',
  PRIMARY KEY (`vrob_no`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='虚拟订单结算表';


-- -----------------------------
-- Table structure for `ds_vrordercode`
-- -----------------------------
DROP TABLE IF EXISTS `ds_vrordercode`;
CREATE TABLE `ds_vrordercode` (
  `rec_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '兑换码自增ID',
  `order_id` int(11) NOT NULL COMMENT '虚拟订单ID',
  `store_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '店铺ID',
  `buyer_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '买家ID',
  `vr_code` varchar(18) NOT NULL COMMENT '兑换码',
  `vr_state` tinyint(4) NOT NULL DEFAULT '0' COMMENT '使用状态 0:(默认)未使用1:已使用2:已过期',
  `vr_usetime` int(11) DEFAULT NULL COMMENT '使用时间',
  `pay_price` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '实际支付金额(结算)',
  `vr_indate` int(11) DEFAULT NULL COMMENT '过期时间',
  `commis_rate` smallint(6) NOT NULL DEFAULT '0' COMMENT '佣金比例',
  `refund_lock` tinyint(1) unsigned DEFAULT '0' COMMENT '退款锁定状态:0:正常,1:锁定,2:同意',
  `vr_invalid_refund` tinyint(4) NOT NULL DEFAULT '1' COMMENT '允许过期退款1:是0:否',
  PRIMARY KEY (`rec_id`),
  KEY `order_id` (`order_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='兑换码表';


-- -----------------------------
-- Table structure for `ds_vrorderstatis`
-- -----------------------------
DROP TABLE IF EXISTS `ds_vrorderstatis`;
CREATE TABLE `ds_vrorderstatis` (
  `vros_month` mediumint(9) unsigned NOT NULL DEFAULT '0' COMMENT '统计编号(年月)',
  `vros_year` smallint(6) DEFAULT '0' COMMENT '年',
  `vros_startdate` int(11) NOT NULL COMMENT '统计开始日期',
  `vros_enddate` int(11) NOT NULL COMMENT '统计结束日期',
  `vros_order_totals` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '统计订单金额',
  `vros_commis_totals` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '统计佣金金额',
  `vros_result_totals` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '统计本期应结',
  `vros_createdate` int(11) DEFAULT NULL COMMENT '统计创建记录日期',
  `vros_inviter_totals` decimal(10,2) unsigned NOT NULL COMMENT '分销佣金',
  PRIMARY KEY (`vros_month`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='虚拟订单月销量统计表';


-- -----------------------------
-- Table structure for `ds_vrrefund`
-- -----------------------------
DROP TABLE IF EXISTS `ds_vrrefund`;
CREATE TABLE `ds_vrrefund` (
  `refund_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '虚拟退款记录自增ID',
  `order_id` int(10) unsigned NOT NULL COMMENT '虚拟订单ID',
  `order_sn` varchar(20) NOT NULL COMMENT '虚拟订单编号',
  `refund_sn` varchar(50) NOT NULL COMMENT '申请编号',
  `store_id` int(10) unsigned NOT NULL COMMENT '店铺ID',
  `store_name` varchar(20) NOT NULL COMMENT '店铺名称',
  `buyer_id` int(10) unsigned NOT NULL COMMENT '买家ID',
  `buyer_name` varchar(50) NOT NULL COMMENT '买家会员名',
  `goods_id` int(10) unsigned NOT NULL COMMENT '商品ID',
  `goods_num` int(10) unsigned DEFAULT '1' COMMENT '退款商品数量',
  `goods_name` varchar(50) NOT NULL COMMENT '商品名称',
  `goods_image` varchar(100) DEFAULT NULL COMMENT '商品图片',
  `redeemcode_sn` varchar(300) NOT NULL COMMENT '兑换码编号',
  `refund_amount` decimal(10,2) DEFAULT '0.00' COMMENT '退款金额',
  `admin_state` tinyint(1) unsigned DEFAULT '1' COMMENT '退款状态 1:待审核 2:同意 3:不同意',
  `add_time` int(10) unsigned NOT NULL COMMENT '虚拟退款添加时间',
  `admin_time` int(10) unsigned DEFAULT '0' COMMENT '管理员处理时间',
  `buyer_message` varchar(300) DEFAULT NULL COMMENT '虚拟退款申请原因',
  `admin_message` varchar(300) DEFAULT NULL COMMENT '管理员备注',
  `commis_rate` smallint(6) DEFAULT '0' COMMENT '佣金比例',
  PRIMARY KEY (`refund_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='虚拟退款表';


-- -----------------------------
-- Table structure for `ds_waybill`
-- -----------------------------
DROP TABLE IF EXISTS `ds_waybill`;
CREATE TABLE `ds_waybill` (
  `waybill_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '快递单模板自增ID',
  `waybill_name` varchar(50) NOT NULL COMMENT '快递单模板名称',
  `waybill_image` varchar(50) NOT NULL COMMENT '快递单模板背景图',
  `waybill_width` int(10) unsigned NOT NULL COMMENT '宽度',
  `waybill_height` int(10) unsigned NOT NULL COMMENT '高度',
  `waybill_data` varchar(2000) DEFAULT NULL COMMENT '打印位置数据',
  `waybill_usable` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '是否可用',
  `waybill_top` int(11) NOT NULL DEFAULT '0' COMMENT '上偏移量',
  `waybill_left` int(11) NOT NULL DEFAULT '0' COMMENT '左偏移量',
  `express_id` tinyint(1) unsigned NOT NULL COMMENT '快递公司ID',
  `express_name` varchar(50) NOT NULL COMMENT '快递公司名称',
  `store_id` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '店铺编号 0:系统模板',
  PRIMARY KEY (`waybill_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='快递单打印模板表';


-- -----------------------------
-- Table structure for `ds_wxconfig`
-- -----------------------------
DROP TABLE IF EXISTS `ds_wxconfig`;
CREATE TABLE `ds_wxconfig` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '微信配置自增ID',
  `wxname` varchar(60) NOT NULL DEFAULT '' COMMENT '公众号名称',
  `appid` varchar(50) NOT NULL DEFAULT '' COMMENT 'appid',
  `appsecret` varchar(50) NOT NULL DEFAULT '' COMMENT 'appsecret',
  `token` char(255) NOT NULL COMMENT 'token',
  `qrcode` varchar(200) NOT NULL DEFAULT '' COMMENT '公众号二维码',
  `access_token` varchar(250) DEFAULT NULL COMMENT '令牌',
  `expires_in` int(15) DEFAULT NULL COMMENT '过期时间',
  `xcx_appid` varchar(50) NOT NULL DEFAULT '' COMMENT '小程序appid',
  `xcx_appsecret` varchar(50) NOT NULL DEFAULT '' COMMENT '小程序appsecret',
  `xcx_access_token` varchar(250) DEFAULT NULL COMMENT '小程序令牌',
  `xcx_expires_in` int(15) DEFAULT NULL COMMENT '小程序过期时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='微信配置表';


-- -----------------------------
-- Table structure for `ds_wxkeyword`
-- -----------------------------
DROP TABLE IF EXISTS `ds_wxkeyword`;
CREATE TABLE `ds_wxkeyword` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '表id',
  `keyword` char(255) NOT NULL COMMENT '关键词',
  `pid` int(11) NOT NULL COMMENT '对应表ID',
  `type` varchar(30) DEFAULT 'TEXT' COMMENT '关键词操作类型',
  PRIMARY KEY (`id`),
  KEY `pid` (`pid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='微信关键词表';


-- -----------------------------
-- Table structure for `ds_wxmenu`
-- -----------------------------
DROP TABLE IF EXISTS `ds_wxmenu`;
CREATE TABLE `ds_wxmenu` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '微信菜单id',
  `pid` int(11) NOT NULL COMMENT '父菜单id',
  `name` varchar(32) NOT NULL COMMENT '微信菜单名称',
  `type` varchar(10) NOT NULL COMMENT '微信菜单类型',
  `value` varchar(200) NOT NULL COMMENT '微信菜单值',
  `sort` int(11) NOT NULL COMMENT '排序',
  PRIMARY KEY (`id`),
  KEY `pid` (`pid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='微信菜单表';


-- -----------------------------
-- Table structure for `ds_wxmsg`
-- -----------------------------
DROP TABLE IF EXISTS `ds_wxmsg`;
CREATE TABLE `ds_wxmsg` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '推送ID',
  `member_id` int(11) DEFAULT NULL COMMENT '为空则推送全体微信用户',
  `content` text NOT NULL COMMENT '推送内容',
  `createtime` int(15) NOT NULL COMMENT '创建时间',
  `issend` tinyint(4) NOT NULL DEFAULT '0' COMMENT '0未发送1成功2失败',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='微信推送表';


-- -----------------------------
-- Table structure for `ds_wxtext`
-- -----------------------------
DROP TABLE IF EXISTS `ds_wxtext`;
CREATE TABLE `ds_wxtext` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '表id',
  `keyword` char(255) NOT NULL COMMENT '关键词',
  `text` text NOT NULL COMMENT 'text',
  `createtime` varchar(13) NOT NULL DEFAULT '' COMMENT '创建时间',
  `updatetime` varchar(13) NOT NULL DEFAULT '' COMMENT '更新时间',
  `click` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '点击',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='微信文本回复表';

