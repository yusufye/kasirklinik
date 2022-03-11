/*
 Navicat Premium Data Transfer

 Source Server         : MySql Local
 Source Server Type    : MySQL
 Source Server Version : 100421
 Source Host           : localhost:3306
 Source Schema         : u8625483_muezza

 Target Server Type    : MySQL
 Target Server Version : 100421
 File Encoding         : 65001

 Date: 08/03/2022 02:33:29
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for tblbank
-- ----------------------------
DROP TABLE IF EXISTS `tblbank`;
CREATE TABLE `tblbank`  (
  `bank_id` int NOT NULL AUTO_INCREMENT,
  `bank_code` varchar(10) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `bank_name` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  PRIMARY KEY (`bank_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 11 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tblbank
-- ----------------------------
INSERT INTO `tblbank` VALUES (1, 'BRI', 'Bank Rakyat Indonesia');
INSERT INTO `tblbank` VALUES (2, 'BMI', 'Bank Mandiri');
INSERT INTO `tblbank` VALUES (3, 'BCA', 'Bank Central Asia');
INSERT INTO `tblbank` VALUES (4, 'BNI', 'Bank Negara Indonesia');
INSERT INTO `tblbank` VALUES (5, 'BTN', 'Bank Tabungan Negara');
INSERT INTO `tblbank` VALUES (6, 'BCN', 'Bank CIMB Niaga');
INSERT INTO `tblbank` VALUES (7, 'BPN', 'Bank Panin');
INSERT INTO `tblbank` VALUES (8, 'BPT', 'Bank Permata');
INSERT INTO `tblbank` VALUES (9, 'BMG', 'Bank Mega');
INSERT INTO `tblbank` VALUES (10, 'BDN', 'Bank Danamon');

-- ----------------------------
-- Table structure for tblbranch
-- ----------------------------
DROP TABLE IF EXISTS `tblbranch`;
CREATE TABLE `tblbranch`  (
  `branch_id` int NOT NULL AUTO_INCREMENT,
  `office_type` int NOT NULL,
  `branch_code` varchar(10) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `branch_name` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `branch_address` varchar(4000) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `branch_status` int NOT NULL,
  PRIMARY KEY (`branch_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 12 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tblbranch
-- ----------------------------
INSERT INTO `tblbranch` VALUES (11, 1, 'BR19090011', 'Muezza Pet Shop', '<p style=\"text-align:center\">Jl. Raya Pendidikan No.87 F RT. 03 / RW. 03</p>\r\n\r\n<p style=\"text-align:center\">Kel. Pengasinan, Kec. Gunung Sindur, Bogor 16340</p>\r\n\r\n<p style=\"text-align:center\">081298175687 - 081510810631</p>', 1);

-- ----------------------------
-- Table structure for tblbuffer
-- ----------------------------
DROP TABLE IF EXISTS `tblbuffer`;
CREATE TABLE `tblbuffer`  (
  `kategori_barang` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `satuan_barang` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `nama_barang` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `modal` decimal(18, 0) NULL DEFAULT NULL,
  `grosir` decimal(18, 0) NULL DEFAULT NULL,
  `harga_terendah` decimal(18, 0) NULL DEFAULT NULL,
  `harga_tertinggi` decimal(18, 0) NULL DEFAULT NULL,
  `supplier` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL
) ENGINE = MyISAM CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tblbuffer
-- ----------------------------

-- ----------------------------
-- Table structure for tblcompany_setting
-- ----------------------------
DROP TABLE IF EXISTS `tblcompany_setting`;
CREATE TABLE `tblcompany_setting`  (
  `company_name` varchar(500) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `address` varchar(2000) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `city` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `phone` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `mobile` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `email` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `sales_notes` varchar(4000) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `logo_filename` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `logo_preview` varchar(2000) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `sales_exchange_limit` int NOT NULL,
  `wholesale_limit` int NOT NULL
) ENGINE = InnoDB CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tblcompany_setting
-- ----------------------------
INSERT INTO `tblcompany_setting` VALUES ('SWR Frozen Food', 'Jl. Raya Pendidikan \r\nNo.87 F RT. 03 / RW. 03\r\nKel.Pengasinan, Kec. \r\nGunung Sindur, 16340', 'Bogor', '0812981175687', '081510810631', 'swrfrozenfood@gmail.com', '<p><span style=\"font-size:8px\">Barang yang sudah di beli tidak bisa ditukar&nbsp; </span></p>\r\n\r\n<p><span style=\"font-size:8px\">&nbsp; &nbsp; &nbsp; &nbsp; - Terima Kasih -</span></p>\r\n', '', '', 0, 0);

-- ----------------------------
-- Table structure for tblitem
-- ----------------------------
DROP TABLE IF EXISTS `tblitem`;
CREATE TABLE `tblitem`  (
  `item_id` int NOT NULL AUTO_INCREMENT,
  `stock_category_id` int NOT NULL,
  `unit_id` int NULL DEFAULT NULL,
  `item_code` varchar(20) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `item_name` varchar(500) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `barcode` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `minimum_stock` int UNSIGNED NOT NULL,
  `maximum_stock` int NOT NULL,
  `foto_filename` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `foto_preview` varchar(2000) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `merk_id` int UNSIGNED NULL DEFAULT NULL,
  `keterangan` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `creator_id` int NULL DEFAULT NULL,
  `created_date` datetime NULL DEFAULT NULL,
  `modificator_id` int NULL DEFAULT NULL,
  `modified_date` datetime NULL DEFAULT NULL,
  PRIMARY KEY (`item_id`) USING BTREE,
  UNIQUE INDEX `item_code`(`item_code` ASC) USING BTREE,
  UNIQUE INDEX `barcode`(`barcode` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 676 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tblitem
-- ----------------------------
INSERT INTO `tblitem` VALUES (1, 1, 1, '9000000000000', 'Goldstar Spicy Wing 500gr ', '9000000000000', 0, 0, '', '', 1, '', 1, '2022-03-08 01:49:01', 1, '2022-03-08 01:52:56');
INSERT INTO `tblitem` VALUES (2, 1, 1, '9000000000001', 'Goldstar Karage 500gr', '1000000000001', 0, 0, '', '', 1, NULL, 1, '2022-03-08 01:49:01', NULL, NULL);
INSERT INTO `tblitem` VALUES (3, 1, 1, '9000000000002', 'Goldstar Pok Pok 500gr', '1000000000002', 0, 0, '', '', 1, NULL, 1, '2022-03-08 01:49:01', NULL, NULL);
INSERT INTO `tblitem` VALUES (4, 1, 1, '9000000000003', 'Goldstar Katsu 500gr', '1000000000003', 0, 0, '', '', 1, NULL, 1, '2022-03-08 01:49:01', NULL, NULL);
INSERT INTO `tblitem` VALUES (5, 1, 1, '9000000000004', 'Goldstar Nugget 500gr', '1000000000004', 0, 0, '', '', 1, NULL, 1, '2022-03-08 01:49:01', NULL, NULL);
INSERT INTO `tblitem` VALUES (6, 1, 1, '9000000000005', 'Goldstar Nugget Angka 500gr', '1000000000005', 0, 0, '', '', 1, NULL, 1, '2022-03-08 01:49:01', NULL, NULL);
INSERT INTO `tblitem` VALUES (7, 1, 1, '9000000000006', 'Goldstar Nugget Stikie 500gr', '1000000000006', 0, 0, '', '', 1, NULL, 1, '2022-03-08 01:49:01', NULL, NULL);
INSERT INTO `tblitem` VALUES (8, 1, 1, '9000000000007', 'Goldstar Stikie Cheese 500gr', '1000000000007', 0, 0, '', '', 1, NULL, 1, '2022-03-08 01:49:01', NULL, NULL);
INSERT INTO `tblitem` VALUES (9, 1, 1, '9000000000008', 'Ngetop Kornet 450gr', '1000000000008', 0, 0, '', '', 2, NULL, 1, '2022-03-08 01:49:01', NULL, NULL);
INSERT INTO `tblitem` VALUES (10, 1, 1, '9000000000009', 'Hemato Nugget Reguler 250gr', '1000000000009', 0, 0, '', '', 3, NULL, 1, '2022-03-08 01:49:01', NULL, NULL);
INSERT INTO `tblitem` VALUES (11, 1, 1, '9000000000010', 'Hemato Nugget Reguler 500gr', '1000000000010', 0, 0, '', '', 3, NULL, 1, '2022-03-08 01:49:01', NULL, NULL);
INSERT INTO `tblitem` VALUES (12, 1, 1, '9000000000011', 'Hemato Nugget Reguler 1kg', '1000000000011', 0, 0, '', '', 3, NULL, 1, '2022-03-08 01:49:01', NULL, NULL);
INSERT INTO `tblitem` VALUES (13, 1, 1, '9000000000012', 'Hemato Sosis Sapi 375gr 15s', '1000000000012', 0, 0, '', '', 3, NULL, 1, '2022-03-08 01:49:01', NULL, NULL);
INSERT INTO `tblitem` VALUES (14, 1, 1, '9000000000013', 'Hemato Sosis Sapi 1kg 40s Short', '1000000000013', 0, 0, '', '', 3, NULL, 1, '2022-03-08 01:49:01', NULL, NULL);
INSERT INTO `tblitem` VALUES (15, 1, 1, '9000000000014', 'Hemato Sosis Sapi 1kg 30s Long', '1000000000014', 0, 0, '', '', 3, NULL, 1, '2022-03-08 01:49:01', NULL, NULL);
INSERT INTO `tblitem` VALUES (16, 1, 1, '9000000000015', 'Hemato Sosis Ayam 375gr 15s', '1000000000015', 0, 0, '', '', 3, NULL, 1, '2022-03-08 01:49:01', NULL, NULL);
INSERT INTO `tblitem` VALUES (17, 1, 1, '9000000000016', 'Hemato Sosis Ayam 1kg 30s Long', '1000000000016', 0, 0, '', '', 3, NULL, 1, '2022-03-08 01:49:01', NULL, NULL);
INSERT INTO `tblitem` VALUES (18, 1, 1, '9000000000017', 'Hemato Sosis Ayam 1kg 40s Short', '1000000000017', 0, 0, '', '', 3, NULL, 1, '2022-03-08 01:49:01', NULL, NULL);
INSERT INTO `tblitem` VALUES (19, 1, 1, '9000000000018', 'Hemato Beef Burger 250gr', '1000000000018', 0, 0, '', '', 3, NULL, 1, '2022-03-08 01:49:01', NULL, NULL);
INSERT INTO `tblitem` VALUES (20, 1, 1, '9000000000019', 'Hemato Beef Burger Mini 280gr', '1000000000019', 0, 0, '', '', 3, NULL, 1, '2022-03-08 01:49:01', NULL, NULL);
INSERT INTO `tblitem` VALUES (21, 1, 1, '9000000000020', 'Hemato Kornet Ayam Koin 450gr', '1000000000020', 0, 0, '', '', 3, NULL, 1, '2022-03-08 01:49:01', NULL, NULL);
INSERT INTO `tblitem` VALUES (22, 1, 1, '9000000000021', 'Hemato Kornet Ayam Kotak 450gr', '1000000000021', 0, 0, '', '', 3, NULL, 1, '2022-03-08 01:49:01', NULL, NULL);
INSERT INTO `tblitem` VALUES (23, 1, 1, '9000000000022', 'Hemato Naget Love 1kg', '1000000000022', 0, 0, '', '', 3, NULL, 1, '2022-03-08 01:49:01', NULL, NULL);
INSERT INTO `tblitem` VALUES (24, 1, 1, '9000000000023', 'Hemato Naget Love 500gr', '1000000000023', 0, 0, '', '', 3, NULL, 1, '2022-03-08 01:49:01', NULL, NULL);
INSERT INTO `tblitem` VALUES (25, 1, 1, '9000000000024', 'Hemato Sosis Sapi Long 500gr', '1000000000024', 0, 0, '', '', 3, NULL, 1, '2022-03-08 01:49:01', NULL, NULL);
INSERT INTO `tblitem` VALUES (26, 1, 1, '9000000000025', 'Hemato Sosis Ayam Long 500gr', '1000000000025', 0, 0, '', '', 3, NULL, 1, '2022-03-08 01:49:01', NULL, NULL);
INSERT INTO `tblitem` VALUES (27, 1, 1, '9000000000026', 'Yona Sosbak Sapi Mini Ori 12s 500gr', '1000000000026', 0, 0, '', '', 4, NULL, 1, '2022-03-08 01:49:01', NULL, NULL);
INSERT INTO `tblitem` VALUES (28, 1, 1, '9000000000027', 'Yona Sosbak Sapi Jumbo Ori 6s 500gr', '1000000000027', 0, 0, '', '', 4, NULL, 1, '2022-03-08 01:49:01', NULL, NULL);
INSERT INTO `tblitem` VALUES (29, 1, 1, '9000000000028', 'Yona Smoke Beef 250gr', '1000000000028', 0, 0, '', '', 4, NULL, 1, '2022-03-08 01:49:01', NULL, NULL);
INSERT INTO `tblitem` VALUES (30, 1, 1, '9000000000029', 'Yona Smoke Beef 500gr', '1000000000029', 0, 0, '', '', 4, NULL, 1, '2022-03-08 01:49:01', NULL, NULL);
INSERT INTO `tblitem` VALUES (31, 1, 1, '9000000000030', 'Yona Beef Patties 500gr', '1000000000030', 0, 0, '', '', 4, NULL, 1, '2022-03-08 01:49:01', NULL, NULL);
INSERT INTO `tblitem` VALUES (32, 1, 1, '9000000000031', 'Yona Beef Patties 1kg ', '1000000000031', 0, 0, '', '', 4, NULL, 1, '2022-03-08 01:49:01', NULL, NULL);
INSERT INTO `tblitem` VALUES (33, 1, 1, '9000000000032', 'Yona Chicken Burger 600gr', '1000000000032', 0, 0, '', '', 4, NULL, 1, '2022-03-08 01:49:01', NULL, NULL);
INSERT INTO `tblitem` VALUES (34, 1, 1, '9000000000033', 'Yona Beef Papperoni 500gr', '1000000000033', 0, 0, '', '', 4, NULL, 1, '2022-03-08 01:49:01', NULL, NULL);
INSERT INTO `tblitem` VALUES (35, 1, 1, '9000000000034', 'Yona Sosis Sapi Merah 15s 450gr', '1000000000034', 0, 0, '', '', 4, NULL, 1, '2022-03-08 01:49:01', NULL, NULL);
INSERT INTO `tblitem` VALUES (36, 1, 1, '9000000000035', 'Yona Nugget Reg 500gr', '1000000000035', 0, 0, '', '', 4, NULL, 1, '2022-03-08 01:49:01', NULL, NULL);
INSERT INTO `tblitem` VALUES (37, 1, 1, '9000000000036', 'Yona Sosis 3s ', '1000000000036', 0, 0, '', '', 4, NULL, 1, '2022-03-08 01:49:01', NULL, NULL);
INSERT INTO `tblitem` VALUES (38, 1, 1, '9000000000037', 'Jofrans Nugget Reguler 225gr', '1000000000037', 0, 0, '', '', 5, NULL, 1, '2022-03-08 01:49:01', NULL, NULL);
INSERT INTO `tblitem` VALUES (39, 1, 1, '9000000000038', 'Jofrans Nugget Reguler 500gr', '1000000000038', 0, 0, '', '', 5, NULL, 1, '2022-03-08 01:49:01', NULL, NULL);
INSERT INTO `tblitem` VALUES (40, 1, 1, '9000000000039', 'Jofrans Nugget Reguler 1kg', '1000000000039', 0, 0, '', '', 5, NULL, 1, '2022-03-08 01:49:01', NULL, NULL);
INSERT INTO `tblitem` VALUES (41, 1, 1, '9000000000040', 'Jofrans Nugget Love 500gr', '1000000000040', 0, 0, '', '', 5, NULL, 1, '2022-03-08 01:49:01', NULL, NULL);
INSERT INTO `tblitem` VALUES (42, 1, 1, '9000000000041', 'Jofrans Nugget Love 1kg', '1000000000041', 0, 0, '', '', 5, NULL, 1, '2022-03-08 01:49:01', NULL, NULL);
INSERT INTO `tblitem` VALUES (43, 1, 1, '9000000000042', 'Jofrans Nugget Stik 500gr', '1000000000042', 0, 0, '', '', 5, NULL, 1, '2022-03-08 01:49:01', NULL, NULL);
INSERT INTO `tblitem` VALUES (44, 1, 1, '9000000000043', 'Jofrans Nugget Stik 1kg ', '1000000000043', 0, 0, '', '', 5, NULL, 1, '2022-03-08 01:49:01', NULL, NULL);
INSERT INTO `tblitem` VALUES (45, 1, 1, '9000000000044', 'Jofrans Sosis Ayam 300gr 10s', '1000000000044', 0, 0, '', '', 5, NULL, 1, '2022-03-08 01:49:01', NULL, NULL);
INSERT INTO `tblitem` VALUES (46, 1, 1, '9000000000045', 'Jofrans Sosis Ayam 360gr 15s', '1000000000045', 0, 0, '', '', 5, NULL, 1, '2022-03-08 01:49:01', NULL, NULL);
INSERT INTO `tblitem` VALUES (47, 1, 1, '9000000000046', 'Jofrans Sosis Sapi 300gr 10s', '1000000000046', 0, 0, '', '', 5, NULL, 1, '2022-03-08 01:49:01', NULL, NULL);
INSERT INTO `tblitem` VALUES (48, 1, 1, '9000000000047', 'Jofrans Baso Ayam Kecil 200gr ', '1000000000047', 0, 0, '', '', 5, NULL, 1, '2022-03-08 01:49:01', NULL, NULL);
INSERT INTO `tblitem` VALUES (49, 1, 1, '9000000000048', 'Jofrans Baso Ayam Kerikil 400gr (Curah)', '1000000000048', 0, 0, '', '', 5, NULL, 1, '2022-03-08 01:49:01', NULL, NULL);
INSERT INTO `tblitem` VALUES (50, 1, 1, '9000000000049', 'Jofrans Baso Ayam Bsr 500gr ', '1000000000049', 0, 0, '', '', 5, NULL, 1, '2022-03-08 01:49:01', NULL, NULL);
INSERT INTO `tblitem` VALUES (51, 1, 1, '9000000000050', 'Jofrans Baso Sapi Kecil 200gr ', '1000000000050', 0, 0, '', '', 5, NULL, 1, '2022-03-08 01:49:01', NULL, NULL);
INSERT INTO `tblitem` VALUES (52, 1, 1, '9000000000051', 'Jofrans Baso Sapi Bsr 500gr ', '1000000000051', 0, 0, '', '', 5, NULL, 1, '2022-03-08 01:49:01', NULL, NULL);
INSERT INTO `tblitem` VALUES (53, 1, 1, '9000000000052', 'Jofrans Beef Patties 900gr', '1000000000052', 0, 0, '', '', 5, NULL, 1, '2022-03-08 01:49:01', NULL, NULL);
INSERT INTO `tblitem` VALUES (54, 1, 1, '9000000000053', 'Jofrans Chicken Patties 900gr', '1000000000053', 0, 0, '', '', 5, NULL, 1, '2022-03-08 01:49:01', NULL, NULL);
INSERT INTO `tblitem` VALUES (55, 1, 1, '9000000000054', 'Jofrans Spicy Wings 500gr', '1000000000054', 0, 0, '', '', 5, NULL, 1, '2022-03-08 01:49:01', NULL, NULL);
INSERT INTO `tblitem` VALUES (56, 1, 1, '9000000000055', 'Jofrans Sosbak Chicken Ori 7s 500gr', '1000000000055', 0, 0, '', '', 5, NULL, 1, '2022-03-08 01:49:01', NULL, NULL);
INSERT INTO `tblitem` VALUES (57, 1, 1, '9000000000056', 'Jofrans Sosbak Chicken MINI Ori 12s 500gr', '1000000000056', 0, 0, '', '', 5, NULL, 1, '2022-03-08 01:49:01', NULL, NULL);
INSERT INTO `tblitem` VALUES (58, 1, 1, '9000000000057', 'Jofrans Sosbak Chicken ORI 1kg 14s', '1000000000057', 0, 0, '', '', 5, NULL, 1, '2022-03-08 01:49:01', NULL, NULL);
INSERT INTO `tblitem` VALUES (59, 1, 1, '9000000000058', 'Jofrans Sosbak Beef Ori 7s 500gr', '1000000000058', 0, 0, '', '', 5, NULL, 1, '2022-03-08 01:49:01', NULL, NULL);
INSERT INTO `tblitem` VALUES (60, 1, 1, '9000000000059', 'Jofrans Sosbak Beef MINI Ori 12s 500gr', '1000000000059', 0, 0, '', '', 5, NULL, 1, '2022-03-08 01:49:01', NULL, NULL);
INSERT INTO `tblitem` VALUES (61, 1, 1, '9000000000060', 'Jofrans Sosbak Beef ORI 1kg 14s', '1000000000060', 0, 0, '', '', 5, NULL, 1, '2022-03-08 01:49:01', NULL, NULL);
INSERT INTO `tblitem` VALUES (62, 1, 1, '9000000000061', 'Jofrans Sosbak Beef KEJU 500gr 7s', '1000000000061', 0, 0, '', '', 5, NULL, 1, '2022-03-08 01:49:01', NULL, NULL);
INSERT INTO `tblitem` VALUES (63, 1, 1, '9000000000062', 'Jofrans Sosbak Chicken KEJU 500gr 7s', '1000000000062', 0, 0, '', '', 5, NULL, 1, '2022-03-08 01:49:01', NULL, NULL);
INSERT INTO `tblitem` VALUES (64, 1, 1, '9000000000063', 'Jofrans Sosbak Chicken Lada Hitam 500gr 7s', '1000000000063', 0, 0, '', '', 5, NULL, 1, '2022-03-08 01:49:01', NULL, NULL);
INSERT INTO `tblitem` VALUES (65, 1, 1, '9000000000064', 'Jofrans Sosbak Beef Lada HItam 500gr 7s', '1000000000064', 0, 0, '', '', 5, NULL, 1, '2022-03-08 01:49:01', NULL, NULL);
INSERT INTO `tblitem` VALUES (66, 1, 1, '9000000000065', 'Chop Chop Sosbak Ayam Jumbo 6s', '1000000000065', 0, 0, '', '', 6, NULL, 1, '2022-03-08 01:49:01', NULL, NULL);
INSERT INTO `tblitem` VALUES (67, 1, 1, '9000000000066', 'Chop Chop Sosbak Ayam Mini 10s', '1000000000066', 0, 0, '', '', 6, NULL, 1, '2022-03-08 01:49:01', NULL, NULL);
INSERT INTO `tblitem` VALUES (68, 1, 1, '9000000000067', 'Chop Chop Sosbak Sapi Jumbo 6s', '1000000000067', 0, 0, '', '', 6, NULL, 1, '2022-03-08 01:49:01', NULL, NULL);
INSERT INTO `tblitem` VALUES (69, 1, 1, '9000000000068', 'Chop Chop Sosbak Sapi Mini 10s', '1000000000068', 0, 0, '', '', 6, NULL, 1, '2022-03-08 01:49:01', NULL, NULL);
INSERT INTO `tblitem` VALUES (70, 1, 1, '9000000000069', 'Chop Chop Short 700gr', '1000000000069', 0, 0, '', '', 6, NULL, 1, '2022-03-08 01:49:01', NULL, NULL);
INSERT INTO `tblitem` VALUES (71, 1, 1, '9000000000070', 'Chop Chop Long 700gr', '1000000000070', 0, 0, '', '', 6, NULL, 1, '2022-03-08 01:49:01', NULL, NULL);
INSERT INTO `tblitem` VALUES (72, 1, 1, '9000000000071', 'Chop Chop Burger Sapi 250gr', '1000000000071', 0, 0, '', '', 6, NULL, 1, '2022-03-08 01:49:01', NULL, NULL);
INSERT INTO `tblitem` VALUES (73, 1, 1, '9000000000072', 'Chop Chop Burger Sapi MINI 280gr', '1000000000072', 0, 0, '', '', 6, NULL, 1, '2022-03-08 01:49:01', NULL, NULL);
INSERT INTO `tblitem` VALUES (74, 1, 1, '9000000000073', 'Chop Chop Kornet Koin 450gr (Luncheon)', '1000000000073', 0, 0, '', '', 6, NULL, 1, '2022-03-08 01:49:01', NULL, NULL);
INSERT INTO `tblitem` VALUES (75, 1, 1, '9000000000074', 'Chop Chop Kornet Kotak 450gr (Luncheon)', '1000000000074', 0, 0, '', '', 6, NULL, 1, '2022-03-08 01:49:01', NULL, NULL);
INSERT INTO `tblitem` VALUES (76, 1, 1, '9000000000075', 'Bernardi BND Roti Burger Wijen 6s', '1000000000075', 0, 0, '', '', 7, NULL, 1, '2022-03-08 01:49:01', NULL, NULL);
INSERT INTO `tblitem` VALUES (77, 1, 1, '9000000000076', 'Bernardi BND Roti Burger Polos 6s', '1000000000076', 0, 0, '', '', 7, NULL, 1, '2022-03-08 01:49:01', NULL, NULL);
INSERT INTO `tblitem` VALUES (78, 1, 1, '9000000000077', 'Bernardi BND Roti Burger Mini 20s', '1000000000077', 0, 0, '', '', 7, NULL, 1, '2022-03-08 01:49:01', NULL, NULL);
INSERT INTO `tblitem` VALUES (79, 1, 1, '9000000000078', 'Bernardi BND Plain Roll (Hotdog) 6s', '1000000000078', 0, 0, '', '', 7, NULL, 1, '2022-03-08 01:49:01', NULL, NULL);
INSERT INTO `tblitem` VALUES (80, 1, 1, '9000000000079', 'Bernardi BND Plain Roll Mini (Hotdog) 20s', '1000000000079', 0, 0, '', '', 7, NULL, 1, '2022-03-08 01:49:01', NULL, NULL);
INSERT INTO `tblitem` VALUES (81, 1, 1, '9000000000080', 'Bernardi BND Bakso Sapi Curah 500gr', '1000000000080', 0, 0, '', '', 7, NULL, 1, '2022-03-08 01:49:01', NULL, NULL);
INSERT INTO `tblitem` VALUES (82, 1, 1, '9000000000081', 'Bernardi BND Bakso Sapi Kecil 500gr 50s', '1000000000081', 0, 0, '', '', 7, NULL, 1, '2022-03-08 01:49:01', NULL, NULL);
INSERT INTO `tblitem` VALUES (83, 1, 1, '9000000000082', 'Bernardi BND Bakso Sapi Besar 25s ', '1000000000082', 0, 0, '', '', 7, NULL, 1, '2022-03-08 01:49:01', NULL, NULL);
INSERT INTO `tblitem` VALUES (84, 1, 1, '9000000000083', 'Bernardi BND Bakso Sapi Urat 25s', '1000000000083', 0, 0, '', '', 7, NULL, 1, '2022-03-08 01:49:01', NULL, NULL);
INSERT INTO `tblitem` VALUES (85, 1, 1, '9000000000084', 'Bernardi BND Bakso Sapi Kecil 100s', '1000000000084', 0, 0, '', '', 7, NULL, 1, '2022-03-08 01:49:01', NULL, NULL);
INSERT INTO `tblitem` VALUES (86, 1, 1, '9000000000085', 'Bernardi BND Bakso Sapi Jumbo 10s 340gr', '1000000000085', 0, 0, '', '', 7, NULL, 1, '2022-03-08 01:49:01', NULL, NULL);
INSERT INTO `tblitem` VALUES (87, 1, 1, '9000000000086', 'Bernardi BND Bakso Sapi 1kg ', '1000000000086', 0, 0, '', '', 7, NULL, 1, '2022-03-08 01:49:01', NULL, NULL);
INSERT INTO `tblitem` VALUES (88, 1, 1, '9000000000087', 'Bernardi BND Beef Patties Classic 6s', '1000000000087', 0, 0, '', '', 7, NULL, 1, '2022-03-08 01:49:01', NULL, NULL);
INSERT INTO `tblitem` VALUES (89, 1, 1, '9000000000088', 'Bernardi BND Beef Patties Premium 6s 250gr', '1000000000088', 0, 0, '', '', 7, NULL, 1, '2022-03-08 01:49:01', NULL, NULL);
INSERT INTO `tblitem` VALUES (90, 1, 1, '9000000000089', 'Bernardi Steamboat Instan 300gr', '1000000000089', 0, 0, '', '', 7, NULL, 1, '2022-03-08 01:49:01', NULL, NULL);
INSERT INTO `tblitem` VALUES (91, 1, 1, '9000000000090', 'Bernardi Yong Tofu Instan 300gr', '1000000000090', 0, 0, '', '', 7, NULL, 1, '2022-03-08 01:49:01', NULL, NULL);
INSERT INTO `tblitem` VALUES (92, 1, 1, '9000000000091', 'Bernardi Tom Yum 300gr', '1000000000091', 0, 0, '', '', 7, NULL, 1, '2022-03-08 01:49:01', NULL, NULL);
INSERT INTO `tblitem` VALUES (93, 1, 1, '9000000000092', 'Vitalia Roti Burger Wijen 6s', '1000000000092', 0, 0, '', '', 8, NULL, 1, '2022-03-08 01:49:01', NULL, NULL);
INSERT INTO `tblitem` VALUES (94, 1, 1, '9000000000093', 'Vitalia Roti Burger Polos 6s', '1000000000093', 0, 0, '', '', 8, NULL, 1, '2022-03-08 01:49:01', NULL, NULL);
INSERT INTO `tblitem` VALUES (95, 1, 1, '9000000000094', 'Bernardi BHP Horeca Sosis VP 1kg', '1000000000094', 0, 0, '', '', 7, NULL, 1, '2022-03-08 01:49:01', NULL, NULL);
INSERT INTO `tblitem` VALUES (96, 1, 1, '9000000000095', 'Bernardi BHP Horeca Sosis VP 500gr', '1000000000095', 0, 0, '', '', 7, NULL, 1, '2022-03-08 01:49:01', NULL, NULL);
INSERT INTO `tblitem` VALUES (97, 1, 1, '9000000000096', 'Bernardi BHP Horeca Sosis Premium 1kg', '1000000000096', 0, 0, '', '', 7, NULL, 1, '2022-03-08 01:49:01', NULL, NULL);
INSERT INTO `tblitem` VALUES (98, 1, 1, '9000000000097', 'Bernardi BHP Horeca Smoke Beef Blok 500gr', '1000000000097', 0, 0, '', '', 7, NULL, 1, '2022-03-08 01:49:01', NULL, NULL);
INSERT INTO `tblitem` VALUES (99, 1, 1, '9000000000098', 'Bernardi BHP Horeca Smoke Beef Bulat VP 500gr', '1000000000098', 0, 0, '', '', 7, NULL, 1, '2022-03-08 01:49:01', NULL, NULL);
INSERT INTO `tblitem` VALUES (100, 1, 1, '9000000000099', 'Weiwang WHP Siomay Ayam 30s', '1000000000099', 0, 0, '', '', 9, NULL, 1, '2022-03-08 01:49:01', NULL, NULL);
INSERT INTO `tblitem` VALUES (101, 1, 1, '9000000000100', 'Weiwang WHP Siomay Sayur 30s', '1000000000100', 0, 0, '', '', 9, NULL, 1, '2022-03-08 01:49:01', NULL, NULL);
INSERT INTO `tblitem` VALUES (102, 1, 1, '9000000000101', 'Weiwang WHP Siomay Jamur 30s', '1000000000101', 0, 0, '', '', 9, NULL, 1, '2022-03-08 01:49:01', NULL, NULL);
INSERT INTO `tblitem` VALUES (103, 1, 1, '9000000000102', 'Weiwang WHP Siomay Seafood 30s', '1000000000102', 0, 0, '', '', 9, NULL, 1, '2022-03-08 01:49:01', NULL, NULL);
INSERT INTO `tblitem` VALUES (104, 1, 1, '9000000000103', 'Umiami Minipao Ayam 30s', '1000000000103', 0, 0, '', '', 10, NULL, 1, '2022-03-08 01:49:01', NULL, NULL);
INSERT INTO `tblitem` VALUES (105, 1, 1, '9000000000104', 'Umiami Minipao Coklat 30s', '1000000000104', 0, 0, '', '', 10, NULL, 1, '2022-03-08 01:49:01', NULL, NULL);
INSERT INTO `tblitem` VALUES (106, 1, 1, '9000000000105', 'Umiami Minipao Sapi 30s', '1000000000105', 0, 0, '', '', 10, NULL, 1, '2022-03-08 01:49:01', NULL, NULL);
INSERT INTO `tblitem` VALUES (107, 1, 1, '9000000000106', 'Umiami Kornet Ayam 450gr', '1000000000106', 0, 0, '', '', 10, NULL, 1, '2022-03-08 01:49:01', NULL, NULL);
INSERT INTO `tblitem` VALUES (108, 1, 1, '9000000000107', 'Umiami Kornet Sapi 450gr', '1000000000107', 0, 0, '', '', 10, NULL, 1, '2022-03-08 01:49:01', NULL, NULL);
INSERT INTO `tblitem` VALUES (109, 1, 1, '9000000000108', 'Umiami Sosis Sapi Ulir 20s 500gr', '1000000000108', 0, 0, '', '', 10, NULL, 1, '2022-03-08 01:49:01', NULL, NULL);
INSERT INTO `tblitem` VALUES (110, 1, 1, '9000000000109', 'Umiami Sosis Ayam Ulir 20s 500gr', '1000000000109', 0, 0, '', '', 10, NULL, 1, '2022-03-08 01:49:01', NULL, NULL);
INSERT INTO `tblitem` VALUES (111, 1, 1, '9000000000110', 'Umiami Si Batagor 180gr', '1000000000110', 0, 0, '', '', 10, NULL, 1, '2022-03-08 01:49:01', NULL, NULL);
INSERT INTO `tblitem` VALUES (112, 1, 1, '9000000000111', 'Umiami Tempura Ikan 500gr', '1000000000111', 0, 0, '', '', 10, NULL, 1, '2022-03-08 01:49:01', NULL, NULL);
INSERT INTO `tblitem` VALUES (113, 1, 1, '9000000000112', 'Umiami Siomay Ayam Kecil 15s', '1000000000112', 0, 0, '', '', 10, NULL, 1, '2022-03-08 01:49:01', NULL, NULL);
INSERT INTO `tblitem` VALUES (114, 1, 1, '9000000000113', 'Umiami Siomay Ayam Besar 60s', '1000000000113', 0, 0, '', '', 10, NULL, 1, '2022-03-08 01:49:01', NULL, NULL);
INSERT INTO `tblitem` VALUES (115, 1, 1, '9000000000114', 'Umiami Siomay Vegie (Sayuran) 15s', '1000000000114', 0, 0, '', '', 10, NULL, 1, '2022-03-08 01:49:01', NULL, NULL);
INSERT INTO `tblitem` VALUES (116, 1, 1, '9000000000115', 'Weiwang Minipau Ayam 25s', '1000000000115', 0, 0, '', '', 9, NULL, 1, '2022-03-08 01:49:01', NULL, NULL);
INSERT INTO `tblitem` VALUES (117, 1, 1, '9000000000116', 'Weiwang Minipau Coklat 25s', '1000000000116', 0, 0, '', '', 9, NULL, 1, '2022-03-08 01:49:01', NULL, NULL);
INSERT INTO `tblitem` VALUES (118, 1, 1, '9000000000117', 'Weiwang Minipau Kacang Hijau 25s', '1000000000117', 0, 0, '', '', 9, NULL, 1, '2022-03-08 01:49:01', NULL, NULL);
INSERT INTO `tblitem` VALUES (119, 1, 1, '9000000000118', 'Weiwang Long Pao Coklat 24s', '1000000000118', 0, 0, '', '', 9, NULL, 1, '2022-03-08 01:49:01', NULL, NULL);
INSERT INTO `tblitem` VALUES (120, 1, 1, '9000000000119', 'Weiwang Ragout Roll 21s', '1000000000119', 0, 0, '', '', 9, NULL, 1, '2022-03-08 01:49:01', NULL, NULL);
INSERT INTO `tblitem` VALUES (121, 1, 1, '9000000000120', 'Weiwang Dosie Coklat Mini 28s', '1000000000120', 0, 0, '', '', 9, NULL, 1, '2022-03-08 01:49:01', NULL, NULL);
INSERT INTO `tblitem` VALUES (122, 1, 1, '9000000000121', 'Weiwang Mantou Plain 8s', '1000000000121', 0, 0, '', '', 9, NULL, 1, '2022-03-08 01:49:01', NULL, NULL);
INSERT INTO `tblitem` VALUES (123, 1, 1, '9000000000122', 'Vitalia Burger Sapi 250gr', '1000000000122', 0, 0, '', '', 8, NULL, 1, '2022-03-08 01:49:01', NULL, NULL);
INSERT INTO `tblitem` VALUES (124, 1, 1, '9000000000123', 'Vitalia Burger Sapi Mini 280gr', '1000000000123', 0, 0, '', '', 8, NULL, 1, '2022-03-08 01:49:01', NULL, NULL);
INSERT INTO `tblitem` VALUES (125, 1, 1, '9000000000124', 'Vitalia Bakso Sapi Bsr 640gr', '1000000000124', 0, 0, '', '', 8, NULL, 1, '2022-03-08 01:49:01', NULL, NULL);
INSERT INTO `tblitem` VALUES (126, 1, 1, '9000000000125', 'Vitalia Bakso Sapi Kecil 270gr', '1000000000125', 0, 0, '', '', 8, NULL, 1, '2022-03-08 01:49:01', NULL, NULL);
INSERT INTO `tblitem` VALUES (127, 1, 1, '9000000000126', 'Rious Gold Cake Original 200gr', '1000000000126', 0, 0, '', '', 11, NULL, 1, '2022-03-08 01:49:01', NULL, NULL);
INSERT INTO `tblitem` VALUES (128, 1, 1, '9000000000127', 'Rious Gold Cake Choco Cheese 200gr', '1000000000127', 0, 0, '', '', 11, NULL, 1, '2022-03-08 01:49:01', NULL, NULL);
INSERT INTO `tblitem` VALUES (129, 1, 1, '9000000000128', 'Rious Gold Cake Lemon Cheese 200gr', '1000000000128', 0, 0, '', '', 11, NULL, 1, '2022-03-08 01:49:01', NULL, NULL);
INSERT INTO `tblitem` VALUES (130, 1, 1, '9000000000129', 'Rious Gold Cake Light Cheese 200gr', '1000000000129', 0, 0, '', '', 11, NULL, 1, '2022-03-08 01:49:01', NULL, NULL);
INSERT INTO `tblitem` VALUES (131, 1, 1, '9000000000130', 'Rious Gold Cake Double Chocolate 200gr', '1000000000130', 0, 0, '', '', 11, NULL, 1, '2022-03-08 01:49:01', NULL, NULL);
INSERT INTO `tblitem` VALUES (132, 1, 1, '9000000000131', 'Rious Pizza Original 180gr', '1000000000131', 0, 0, '', '', 11, NULL, 1, '2022-03-08 01:49:01', NULL, NULL);
INSERT INTO `tblitem` VALUES (133, 1, 1, '9000000000132', 'Rious Pizza Double Cheese 180gr', '1000000000132', 0, 0, '', '', 11, NULL, 1, '2022-03-08 01:49:01', NULL, NULL);
INSERT INTO `tblitem` VALUES (134, 1, 1, '9000000000133', 'Belfoods Uenak Stik 250gr', '1000000000133', 0, 0, '', '', 12, NULL, 1, '2022-03-08 01:49:01', NULL, NULL);
INSERT INTO `tblitem` VALUES (135, 1, 1, '9000000000134', 'Belfoods Uenak Stik 500gr', '1000000000134', 0, 0, '', '', 12, NULL, 1, '2022-03-08 01:49:01', NULL, NULL);
INSERT INTO `tblitem` VALUES (136, 1, 1, '9000000000135', 'Belfoods Uenak Nugget Small 250gr', '1000000000135', 0, 0, '', '', 12, NULL, 1, '2022-03-08 01:49:01', NULL, NULL);
INSERT INTO `tblitem` VALUES (137, 1, 1, '9000000000136', 'Belfoods Uenak Nugget Small 500gr', '1000000000136', 0, 0, '', '', 12, NULL, 1, '2022-03-08 01:49:01', NULL, NULL);
INSERT INTO `tblitem` VALUES (138, 1, 1, '9000000000137', 'Belfoods Uenak Nugget Small 85gr (Kecil)', '1000000000137', 0, 0, '', '', 12, NULL, 1, '2022-03-08 01:49:01', NULL, NULL);
INSERT INTO `tblitem` VALUES (139, 1, 1, '9000000000138', 'Belfoods Uenak Nugget \"S\" 250gr', '1000000000138', 0, 0, '', '', 12, NULL, 1, '2022-03-08 01:49:01', NULL, NULL);
INSERT INTO `tblitem` VALUES (140, 1, 1, '9000000000139', 'Belfoods Uenak Nugget \"S\" 500gr', '1000000000139', 0, 0, '', '', 12, NULL, 1, '2022-03-08 01:49:01', NULL, NULL);
INSERT INTO `tblitem` VALUES (141, 1, 1, '9000000000140', 'Belfoods Uenak Sosis Ayam 75gr (Kecil)', '1000000000140', 0, 0, '', '', 12, NULL, 1, '2022-03-08 01:49:01', NULL, NULL);
INSERT INTO `tblitem` VALUES (142, 1, 1, '9000000000141', 'Belfoods Uenak Sosis Ayam 375gr ', '1000000000141', 0, 0, '', '', 12, NULL, 1, '2022-03-08 01:49:01', NULL, NULL);
INSERT INTO `tblitem` VALUES (143, 1, 1, '9000000000142', 'Belfoods Uenak Sosis Ayam Long 500gr', '1000000000142', 0, 0, '', '', 12, NULL, 1, '2022-03-08 01:49:01', NULL, NULL);
INSERT INTO `tblitem` VALUES (144, 1, 1, '9000000000143', 'Belfoods Uenak Sosis Ayam 1kg 30s (Long)', '1000000000143', 0, 0, '', '', 12, NULL, 1, '2022-03-08 01:49:01', NULL, NULL);
INSERT INTO `tblitem` VALUES (145, 1, 1, '9000000000144', 'Belfoods Uenak Sosis Ayam 1kg 40s (Short)', '1000000000144', 0, 0, '', '', 12, NULL, 1, '2022-03-08 01:49:01', NULL, NULL);
INSERT INTO `tblitem` VALUES (146, 1, 1, '9000000000145', 'Belfoods Uenak Baso Ayam Kerikil 500gr', '1000000000145', 0, 0, '', '', 12, NULL, 1, '2022-03-08 01:49:01', NULL, NULL);
INSERT INTO `tblitem` VALUES (147, 1, 1, '9000000000146', 'Belfoods Uenak Baso Ayam Inner Scht 500gr', '1000000000146', 0, 0, '', '', 12, NULL, 1, '2022-03-08 01:49:01', NULL, NULL);
INSERT INTO `tblitem` VALUES (148, 1, 1, '9000000000147', 'Belfoods Uenak Kornet Luncheon 450gr', '1000000000147', 0, 0, '', '', 12, NULL, 1, '2022-03-08 01:49:01', NULL, NULL);
INSERT INTO `tblitem` VALUES (149, 1, 1, '9000000000148', 'Belfoods Uenak Sosbak 6s 500gr', '1000000000148', 0, 0, '', '', 12, NULL, 1, '2022-03-08 01:49:01', NULL, NULL);
INSERT INTO `tblitem` VALUES (150, 1, 1, '9000000000149', 'Belfoods Favorite Nugget 250gr', '1000000000149', 0, 0, '', '', 12, NULL, 1, '2022-03-08 01:49:01', NULL, NULL);
INSERT INTO `tblitem` VALUES (151, 1, 1, '9000000000150', 'Belfoods Favorite Nugget 500gr', '1000000000150', 0, 0, '', '', 12, NULL, 1, '2022-03-08 01:49:01', NULL, NULL);
INSERT INTO `tblitem` VALUES (152, 1, 1, '9000000000151', 'Belfoods Favorite Nugget 1kg', '1000000000151', 0, 0, '', '', 12, NULL, 1, '2022-03-08 01:49:01', NULL, NULL);
INSERT INTO `tblitem` VALUES (153, 1, 1, '9000000000152', 'Belfoods Favorite Stik 250gr', '1000000000152', 0, 0, '', '', 12, NULL, 1, '2022-03-08 01:49:01', NULL, NULL);
INSERT INTO `tblitem` VALUES (154, 1, 1, '9000000000153', 'Belfoods Favorite Stik 500gr', '1000000000153', 0, 0, '', '', 12, NULL, 1, '2022-03-08 01:49:01', NULL, NULL);
INSERT INTO `tblitem` VALUES (155, 1, 1, '9000000000154', 'Belfoods Favorite Ceria 250gr ', '1000000000154', 0, 0, '', '', 12, NULL, 1, '2022-03-08 01:49:01', NULL, NULL);
INSERT INTO `tblitem` VALUES (156, 1, 1, '9000000000155', 'Belfoods Favorite Ceria 500gr ', '1000000000155', 0, 0, '', '', 12, NULL, 1, '2022-03-08 01:49:01', NULL, NULL);
INSERT INTO `tblitem` VALUES (157, 1, 1, '9000000000156', 'Belfoods Favorite Safari 450gr', '1000000000156', 0, 0, '', '', 12, NULL, 1, '2022-03-08 01:49:01', NULL, NULL);
INSERT INTO `tblitem` VALUES (158, 1, 1, '9000000000157', 'Belfoods Favorite Ayam Goreng Renyah 500gr', '1000000000157', 0, 0, '', '', 12, NULL, 1, '2022-03-08 01:49:01', NULL, NULL);
INSERT INTO `tblitem` VALUES (159, 1, 1, '9000000000158', 'Belfoods Favorite Chicken Pop corn 500gr', '1000000000158', 0, 0, '', '', 12, NULL, 1, '2022-03-08 01:49:01', NULL, NULL);
INSERT INTO `tblitem` VALUES (160, 1, 1, '9000000000159', 'Belfoods Favorite Spicy Wing 500gr', '1000000000159', 0, 0, '', '', 12, NULL, 1, '2022-03-08 01:49:01', NULL, NULL);
INSERT INTO `tblitem` VALUES (161, 1, 1, '9000000000160', 'Belfoods Favorite Nugget Crunchy 500gr', '1000000000160', 0, 0, '', '', 12, NULL, 1, '2022-03-08 01:49:01', NULL, NULL);
INSERT INTO `tblitem` VALUES (162, 1, 1, '9000000000161', 'Belfoods Favorite Chicken Burger 315gr', '1000000000161', 0, 0, '', '', 12, NULL, 1, '2022-03-08 01:49:01', NULL, NULL);
INSERT INTO `tblitem` VALUES (163, 1, 1, '9000000000162', 'Belfoods Favorite Kentang 500gr', '1000000000162', 0, 0, '', '', 12, NULL, 1, '2022-03-08 01:49:01', NULL, NULL);
INSERT INTO `tblitem` VALUES (164, 1, 1, '9000000000163', 'Belfoods SP Kentang 200gr', '1000000000163', 0, 0, '', '', 12, NULL, 1, '2022-03-08 01:49:01', NULL, NULL);
INSERT INTO `tblitem` VALUES (165, 1, 1, '9000000000164', 'Belfoods SP Ceria 170gr', '1000000000164', 0, 0, '', '', 12, NULL, 1, '2022-03-08 01:49:01', NULL, NULL);
INSERT INTO `tblitem` VALUES (166, 1, 1, '9000000000165', 'Belfoods SP Nugget 170gr', '1000000000165', 0, 0, '', '', 12, NULL, 1, '2022-03-08 01:49:01', NULL, NULL);
INSERT INTO `tblitem` VALUES (167, 1, 1, '9000000000166', 'Belfoods SP Sosis Ayam 200gr', '1000000000166', 0, 0, '', '', 12, NULL, 1, '2022-03-08 01:49:01', NULL, NULL);
INSERT INTO `tblitem` VALUES (168, 1, 1, '9000000000167', 'Belfoods SP Bakso Ayam 100gr', '1000000000167', 0, 0, '', '', 12, NULL, 1, '2022-03-08 01:49:01', NULL, NULL);
INSERT INTO `tblitem` VALUES (169, 1, 1, '9000000000168', 'Belfoods Nugget FROZEN II 450gr', '1000000000168', 0, 0, '', '', 12, NULL, 1, '2022-03-08 01:49:01', NULL, NULL);
INSERT INTO `tblitem` VALUES (170, 1, 1, '9000000000169', 'Belfoods Royal Nugget \"S\" 500gr', '1000000000169', 0, 0, '', '', 12, NULL, 1, '2022-03-08 01:49:01', NULL, NULL);
INSERT INTO `tblitem` VALUES (171, 1, 1, '9000000000170', 'Belfoods Royal Golden Fillet 250gr', '1000000000170', 0, 0, '', '', 12, NULL, 1, '2022-03-08 01:49:01', NULL, NULL);
INSERT INTO `tblitem` VALUES (172, 1, 1, '9000000000171', 'Belfoods Royal Golden Fillet 500gr', '1000000000171', 0, 0, '', '', 12, NULL, 1, '2022-03-08 01:49:01', NULL, NULL);
INSERT INTO `tblitem` VALUES (173, 1, 1, '9000000000172', 'Belfoods Royal Karage 500gr', '1000000000172', 0, 0, '', '', 12, NULL, 1, '2022-03-08 01:49:01', NULL, NULL);
INSERT INTO `tblitem` VALUES (174, 1, 1, '9000000000173', 'Belfoods Royal Nugget Drummies 500gr', '1000000000173', 0, 0, '', '', 12, NULL, 1, '2022-03-08 01:49:01', NULL, NULL);
INSERT INTO `tblitem` VALUES (175, 1, 1, '9000000000174', 'Belfodos Royal Cheesy Bites 500gr', '1000000000174', 0, 0, '', '', 12, NULL, 1, '2022-03-08 01:49:01', NULL, NULL);
INSERT INTO `tblitem` VALUES (176, 1, 1, '9000000000175', 'Cedea Baso Cumi 500gr', '1000000000175', 0, 0, '', '', 13, NULL, 1, '2022-03-08 01:49:01', NULL, NULL);
INSERT INTO `tblitem` VALUES (177, 1, 1, '9000000000176', 'Cedea Baso Ikan Besar 500gr', '1000000000176', 0, 0, '', '', 13, NULL, 1, '2022-03-08 01:49:01', NULL, NULL);
INSERT INTO `tblitem` VALUES (178, 1, 1, '9000000000177', 'Cedea Baso Ikan Sedang 500gr', '1000000000177', 0, 0, '', '', 13, NULL, 1, '2022-03-08 01:49:01', NULL, NULL);
INSERT INTO `tblitem` VALUES (179, 1, 1, '9000000000178', 'Cedea Baso Ikan 100s 1kg', '1000000000178', 0, 0, '', '', 13, NULL, 1, '2022-03-08 01:49:01', NULL, NULL);
INSERT INTO `tblitem` VALUES (180, 1, 1, '9000000000179', 'Cedea Baso Ikan Jamur 500gr', '1000000000179', 0, 0, '', '', 13, NULL, 1, '2022-03-08 01:49:01', NULL, NULL);
INSERT INTO `tblitem` VALUES (181, 1, 1, '9000000000180', 'Cedea Baso Ikan Pedas 500gr', '1000000000180', 0, 0, '', '', 13, NULL, 1, '2022-03-08 01:49:01', NULL, NULL);
INSERT INTO `tblitem` VALUES (182, 1, 1, '9000000000181', 'Cedea Baso Ikan Sayur Goreng 500gr', '1000000000181', 0, 0, '', '', 13, NULL, 1, '2022-03-08 01:49:01', NULL, NULL);
INSERT INTO `tblitem` VALUES (183, 1, 1, '9000000000182', 'Cedea Baso Ikan Sayuran 500gr', '1000000000182', 0, 0, '', '', 13, NULL, 1, '2022-03-08 01:49:01', NULL, NULL);
INSERT INTO `tblitem` VALUES (184, 1, 1, '9000000000183', 'Cedea Baso Ikan dan Udang 500gr', '1000000000183', 0, 0, '', '', 13, NULL, 1, '2022-03-08 01:49:01', NULL, NULL);
INSERT INTO `tblitem` VALUES (185, 1, 1, '9000000000184', 'Cedea Baso Kepiting 500gr', '1000000000184', 0, 0, '', '', 13, NULL, 1, '2022-03-08 01:49:01', NULL, NULL);
INSERT INTO `tblitem` VALUES (186, 1, 1, '9000000000185', 'Cedea Chikuwa Mini 500gr ', '1000000000185', 0, 0, '', '', 13, NULL, 1, '2022-03-08 01:49:01', NULL, NULL);
INSERT INTO `tblitem` VALUES (187, 1, 1, '9000000000186', 'Cedea Chikuwa MINI 1KG', '1000000000186', 0, 0, '', '', 13, NULL, 1, '2022-03-08 01:49:01', NULL, NULL);
INSERT INTO `tblitem` VALUES (188, 1, 1, '9000000000187', 'Cedea Chikuwa Mini Tray 250gr', '1000000000187', 0, 0, '', '', 13, NULL, 1, '2022-03-08 01:49:01', NULL, NULL);
INSERT INTO `tblitem` VALUES (189, 1, 1, '9000000000188', 'Cedea Chikuwa LONG 1KG', '1000000000188', 0, 0, '', '', 13, NULL, 1, '2022-03-08 01:49:01', NULL, NULL);
INSERT INTO `tblitem` VALUES (190, 1, 1, '9000000000189', 'Cedea Chikuwa Jamur Kecil 250gr', '1000000000189', 0, 0, '', '', 13, NULL, 1, '2022-03-08 01:49:01', NULL, NULL);
INSERT INTO `tblitem` VALUES (191, 1, 1, '9000000000190', 'Cedea Chikuwa Jamur Bsr 500gr', '1000000000190', 0, 0, '', '', 13, NULL, 1, '2022-03-08 01:49:01', NULL, NULL);
INSERT INTO `tblitem` VALUES (192, 1, 1, '9000000000191', 'Cedea Crab Stik 250gr', '1000000000191', 0, 0, '', '', 13, NULL, 1, '2022-03-08 01:49:01', NULL, NULL);
INSERT INTO `tblitem` VALUES (193, 1, 1, '9000000000192', 'Cedea Crab Stik 1KG', '1000000000192', 0, 0, '', '', 13, NULL, 1, '2022-03-08 01:49:01', NULL, NULL);
INSERT INTO `tblitem` VALUES (194, 1, 1, '9000000000193', 'Cedea Duo Twister 500gr', '1000000000193', 0, 0, '', '', 13, NULL, 1, '2022-03-08 01:49:01', NULL, NULL);
INSERT INTO `tblitem` VALUES (195, 1, 1, '9000000000194', 'Cedea Flower Twister 500gr', '1000000000194', 0, 0, '', '', 13, NULL, 1, '2022-03-08 01:49:01', NULL, NULL);
INSERT INTO `tblitem` VALUES (196, 1, 1, '9000000000195', 'Cedea Kue Ikan Pedas 500gr', '1000000000195', 0, 0, '', '', 13, NULL, 1, '2022-03-08 01:49:01', NULL, NULL);
INSERT INTO `tblitem` VALUES (197, 1, 1, '9000000000196', 'Cedea Shrimp Ball (Bola Udang) 200gr', '1000000000196', 0, 0, '', '', 13, NULL, 1, '2022-03-08 01:49:01', NULL, NULL);
INSERT INTO `tblitem` VALUES (198, 1, 1, '9000000000197', 'Cedea Shrimp Ball (Bola Udang) 500gr', '1000000000197', 0, 0, '', '', 13, NULL, 1, '2022-03-08 01:49:01', NULL, NULL);
INSERT INTO `tblitem` VALUES (199, 1, 1, '9000000000198', 'Cedea Tahu Baso Ikan 500gr', '1000000000198', 0, 0, '', '', 13, NULL, 1, '2022-03-08 01:49:01', NULL, NULL);
INSERT INTO `tblitem` VALUES (200, 1, 1, '9000000000199', 'Cedea Tahu Baso Seafood 500gr', '1000000000199', 0, 0, '', '', 13, NULL, 1, '2022-03-08 01:49:01', NULL, NULL);
INSERT INTO `tblitem` VALUES (201, 1, 1, '9000000000200', 'Cedea Crab Claw 450gr', '1000000000200', 0, 0, '', '', 13, NULL, 1, '2022-03-08 01:49:01', NULL, NULL);
INSERT INTO `tblitem` VALUES (202, 1, 1, '9000000000201', 'Cedea Fish Ball TR45 1kg', '1000000000201', 0, 0, '', '', 13, NULL, 1, '2022-03-08 01:49:01', NULL, NULL);
INSERT INTO `tblitem` VALUES (203, 1, 1, '9000000000202', 'Cedea Fish Dumpling Cheese 500gr', '1000000000202', 0, 0, '', '', 13, NULL, 1, '2022-03-08 01:49:01', NULL, NULL);
INSERT INTO `tblitem` VALUES (204, 1, 1, '9000000000203', 'Cedea Fish Dumpling Cheese 200gr (Kecil)', '1000000000203', 0, 0, '', '', 13, NULL, 1, '2022-03-08 01:49:01', NULL, NULL);
INSERT INTO `tblitem` VALUES (205, 1, 1, '9000000000204', 'Cedea Fish Dumpling Chicken 500gr', '1000000000204', 0, 0, '', '', 13, NULL, 1, '2022-03-08 01:49:01', NULL, NULL);
INSERT INTO `tblitem` VALUES (206, 1, 1, '9000000000205', 'Cedea Fish Dumpling Chicken 200gr (Kecil)', '1000000000205', 0, 0, '', '', 13, NULL, 1, '2022-03-08 01:49:01', NULL, NULL);
INSERT INTO `tblitem` VALUES (207, 1, 1, '9000000000206', 'Cedea Fried Fish Ball 1kg (Bakso Ikan Goreng)', '1000000000206', 0, 0, '', '', 13, NULL, 1, '2022-03-08 01:49:01', NULL, NULL);
INSERT INTO `tblitem` VALUES (208, 1, 1, '9000000000207', 'Cedea Fried Fish Ball 500gr (Singapore)', '1000000000207', 0, 0, '', '', 13, NULL, 1, '2022-03-08 01:49:01', NULL, NULL);
INSERT INTO `tblitem` VALUES (209, 1, 1, '9000000000208', 'Cedea Fried Fish Cake 500gr', '1000000000208', 0, 0, '', '', 13, NULL, 1, '2022-03-08 01:49:01', NULL, NULL);
INSERT INTO `tblitem` VALUES (210, 1, 1, '9000000000209', 'Cedea Lobster Ball 500gr', '1000000000209', 0, 0, '', '', 13, NULL, 1, '2022-03-08 01:49:01', NULL, NULL);
INSERT INTO `tblitem` VALUES (211, 1, 1, '9000000000210', 'Cedea Naget Kepiting 500gr', '1000000000210', 0, 0, '', '', 13, NULL, 1, '2022-03-08 01:49:01', NULL, NULL);
INSERT INTO `tblitem` VALUES (212, 1, 1, '9000000000211', 'Cedea Otak Otak Salju 1kg', '1000000000211', 0, 0, '', '', 13, NULL, 1, '2022-03-08 01:49:01', NULL, NULL);
INSERT INTO `tblitem` VALUES (213, 1, 1, '9000000000212', 'Cedea Otak Otak Singapur 1kg', '1000000000212', 0, 0, '', '', 13, NULL, 1, '2022-03-08 01:49:01', NULL, NULL);
INSERT INTO `tblitem` VALUES (214, 1, 1, '9000000000213', 'Cedea Otak Otak Singapur 500gr', '1000000000213', 0, 0, '', '', 13, NULL, 1, '2022-03-08 01:49:01', NULL, NULL);
INSERT INTO `tblitem` VALUES (215, 1, 1, '9000000000214', 'Cedea Salmon Ball 500gr', '1000000000214', 0, 0, '', '', 13, NULL, 1, '2022-03-08 01:49:01', NULL, NULL);
INSERT INTO `tblitem` VALUES (216, 1, 1, '9000000000215', 'Cedea Salmon Ball 200gr (Kecil)', '1000000000215', 0, 0, '', '', 13, NULL, 1, '2022-03-08 01:49:01', NULL, NULL);
INSERT INTO `tblitem` VALUES (217, 1, 1, '9000000000216', 'Cedea Sandwich Tofu 500gr', '1000000000216', 0, 0, '', '', 13, NULL, 1, '2022-03-08 01:49:01', NULL, NULL);
INSERT INTO `tblitem` VALUES (218, 1, 1, '9000000000217', 'Cedea Seafood Tofu 500gr (Tofu Premium)', '1000000000217', 0, 0, '', '', 13, NULL, 1, '2022-03-08 01:49:01', NULL, NULL);
INSERT INTO `tblitem` VALUES (219, 1, 1, '9000000000218', 'Cedea Ebi Furai 10s', '1000000000218', 0, 0, '', '', 13, NULL, 1, '2022-03-08 01:49:01', NULL, NULL);
INSERT INTO `tblitem` VALUES (220, 1, 1, '9000000000219', 'Cedea Fish Roll 250gr (Kecil)', '1000000000219', 0, 0, '', '', 13, NULL, 1, '2022-03-08 01:49:01', NULL, NULL);
INSERT INTO `tblitem` VALUES (221, 1, 1, '9000000000220', 'Cedea Fish Roll 1kg (Besar)', '1000000000220', 0, 0, '', '', 13, NULL, 1, '2022-03-08 01:49:01', NULL, NULL);
INSERT INTO `tblitem` VALUES (222, 1, 1, '9000000000221', 'Cedea Siomay Ikan 500gr', '1000000000221', 0, 0, '', '', 13, NULL, 1, '2022-03-08 01:49:01', NULL, NULL);
INSERT INTO `tblitem` VALUES (223, 1, 1, '9000000000222', 'Cedea Siomay Ayam dan Udang 500gr', '1000000000222', 0, 0, '', '', 13, NULL, 1, '2022-03-08 01:49:01', NULL, NULL);
INSERT INTO `tblitem` VALUES (224, 1, 1, '9000000000223', 'Cedea Vegetable Spring Roll 500gr', '1000000000223', 0, 0, '', '', 13, NULL, 1, '2022-03-08 01:49:01', NULL, NULL);
INSERT INTO `tblitem` VALUES (225, 1, 1, '9000000000224', 'Cedea Steamboat 300gr (Kecil)', '1000000000224', 0, 0, '', '', 13, NULL, 1, '2022-03-08 01:49:01', NULL, NULL);
INSERT INTO `tblitem` VALUES (226, 1, 1, '9000000000225', 'Cedea Steamboat 500gr ', '1000000000225', 0, 0, '', '', 13, NULL, 1, '2022-03-08 01:49:01', NULL, NULL);
INSERT INTO `tblitem` VALUES (227, 1, 1, '9000000000226', 'Cedea Tomyam 300gr', '1000000000226', 0, 0, '', '', 13, NULL, 1, '2022-03-08 01:49:01', NULL, NULL);
INSERT INTO `tblitem` VALUES (228, 1, 1, '9000000000227', 'Cedea Farm Animals 500gr', '1000000000227', 0, 0, '', '', 13, NULL, 1, '2022-03-08 01:49:01', NULL, NULL);
INSERT INTO `tblitem` VALUES (229, 1, 1, '9000000000228', 'Cedea Oriental Cartoon 500gr', '1000000000228', 0, 0, '', '', 13, NULL, 1, '2022-03-08 01:49:01', NULL, NULL);
INSERT INTO `tblitem` VALUES (230, 1, 1, '9000000000229', 'Teman Laut Baso Cumi 200gr (Kecil)', '1000000000229', 0, 0, '', '', 14, NULL, 1, '2022-03-08 01:49:01', NULL, NULL);
INSERT INTO `tblitem` VALUES (231, 1, 1, '9000000000230', 'Teman Laut Baso Cumi 500gr', '1000000000230', 0, 0, '', '', 14, NULL, 1, '2022-03-08 01:49:01', NULL, NULL);
INSERT INTO `tblitem` VALUES (232, 1, 1, '9000000000231', 'Teman Laut Baso Ikan 200gr (Kecil)', '1000000000231', 0, 0, '', '', 14, NULL, 1, '2022-03-08 01:49:01', NULL, NULL);
INSERT INTO `tblitem` VALUES (233, 1, 1, '9000000000232', 'Teman Laut Baso Ikan 500gr', '1000000000232', 0, 0, '', '', 14, NULL, 1, '2022-03-08 01:49:01', NULL, NULL);
INSERT INTO `tblitem` VALUES (234, 1, 1, '9000000000233', 'Teman Laut Baso Udang 200gr (Kecil)', '1000000000233', 0, 0, '', '', 14, NULL, 1, '2022-03-08 01:49:01', NULL, NULL);
INSERT INTO `tblitem` VALUES (235, 1, 1, '9000000000234', 'Teman Laut Baso Udang 500gr', '1000000000234', 0, 0, '', '', 14, NULL, 1, '2022-03-08 01:49:01', NULL, NULL);
INSERT INTO `tblitem` VALUES (236, 1, 1, '9000000000235', 'Teman Laut Scallop 200gr (Kecil)', '1000000000235', 0, 0, '', '', 14, NULL, 1, '2022-03-08 01:49:01', NULL, NULL);
INSERT INTO `tblitem` VALUES (237, 1, 1, '9000000000236', 'Teman Laut Scallop 500gr', '1000000000236', 0, 0, '', '', 14, NULL, 1, '2022-03-08 01:49:01', NULL, NULL);
INSERT INTO `tblitem` VALUES (238, 1, 1, '9000000000237', 'Teman Laut Fish Coin 200gr (Kecil)', '1000000000237', 0, 0, '', '', 14, NULL, 1, '2022-03-08 01:49:01', NULL, NULL);
INSERT INTO `tblitem` VALUES (239, 1, 1, '9000000000238', 'Teman Laut Fish Coin 500gr', '1000000000238', 0, 0, '', '', 14, NULL, 1, '2022-03-08 01:49:01', NULL, NULL);
INSERT INTO `tblitem` VALUES (240, 1, 1, '9000000000239', 'Teman Laut Coin Star 200gr (Kecil)', '1000000000239', 0, 0, '', '', 14, NULL, 1, '2022-03-08 01:49:01', NULL, NULL);
INSERT INTO `tblitem` VALUES (241, 1, 1, '9000000000240', 'Teman Laut Coin Star 500gr', '1000000000240', 0, 0, '', '', 14, NULL, 1, '2022-03-08 01:49:01', NULL, NULL);
INSERT INTO `tblitem` VALUES (242, 1, 1, '9000000000241', 'So Good Nugget Original 400gr', '1000000000241', 0, 0, '', '', 15, NULL, 1, '2022-03-08 01:49:01', NULL, NULL);
INSERT INTO `tblitem` VALUES (243, 1, 1, '9000000000242', 'So Good Nugget Hot n Spicy 400gr', '1000000000242', 0, 0, '', '', 15, NULL, 1, '2022-03-08 01:49:01', NULL, NULL);
INSERT INTO `tblitem` VALUES (244, 1, 1, '9000000000243', 'So Good Dino Bites 400gr', '1000000000243', 0, 0, '', '', 15, NULL, 1, '2022-03-08 01:49:01', NULL, NULL);
INSERT INTO `tblitem` VALUES (245, 1, 1, '9000000000244', 'So Good Alphabet 400gr', '1000000000244', 0, 0, '', '', 15, NULL, 1, '2022-03-08 01:49:01', NULL, NULL);
INSERT INTO `tblitem` VALUES (246, 1, 1, '9000000000245', 'So Good Nugget JETZ 400gr', '1000000000245', 0, 0, '', '', 15, NULL, 1, '2022-03-08 01:49:01', NULL, NULL);
INSERT INTO `tblitem` VALUES (247, 1, 1, '9000000000246', 'So Good Karage 400gr', '1000000000246', 0, 0, '', '', 15, NULL, 1, '2022-03-08 01:49:01', NULL, NULL);
INSERT INTO `tblitem` VALUES (248, 1, 1, '9000000000247', 'So Good Katsu 400gr', '1000000000247', 0, 0, '', '', 15, NULL, 1, '2022-03-08 01:49:01', NULL, NULL);
INSERT INTO `tblitem` VALUES (249, 1, 1, '9000000000248', 'So Good Spicy Chicken 400gr', '1000000000248', 0, 0, '', '', 15, NULL, 1, '2022-03-08 01:49:01', NULL, NULL);
INSERT INTO `tblitem` VALUES (250, 1, 1, '9000000000249', 'So Good Spicy Wing 400gr', '1000000000249', 0, 0, '', '', 15, NULL, 1, '2022-03-08 01:49:01', NULL, NULL);
INSERT INTO `tblitem` VALUES (251, 1, 1, '9000000000250', 'So Good Animal 400gr', '1000000000250', 0, 0, '', '', 15, NULL, 1, '2022-03-08 01:49:01', NULL, NULL);
INSERT INTO `tblitem` VALUES (252, 1, 1, '9000000000251', 'So Good Chicken Strip250gr', '1000000000251', 0, 0, '', '', 15, NULL, 1, '2022-03-08 01:49:01', NULL, NULL);
INSERT INTO `tblitem` VALUES (253, 1, 1, '9000000000252', 'So Good Ayam Utuh Potong 1kg', '1000000000252', 0, 0, '', '', 15, NULL, 1, '2022-03-08 01:49:01', NULL, NULL);
INSERT INTO `tblitem` VALUES (254, 1, 1, '9000000000253', 'So Good Paha Dada 1kg (Tanpa Bumbu)', '1000000000253', 0, 0, '', '', 15, NULL, 1, '2022-03-08 01:49:01', NULL, NULL);
INSERT INTO `tblitem` VALUES (255, 1, 1, '9000000000254', 'So Good Paha Dada 450gr (Tanpa Bumbu)', '1000000000254', 0, 0, '', '', 15, NULL, 1, '2022-03-08 01:49:01', NULL, NULL);
INSERT INTO `tblitem` VALUES (256, 1, 1, '9000000000255', 'So Good Paha Dada Pedas Manis 450gr', '1000000000255', 0, 0, '', '', 15, NULL, 1, '2022-03-08 01:49:01', NULL, NULL);
INSERT INTO `tblitem` VALUES (257, 1, 1, '9000000000256', 'So Good Paha Dada Bumbu Kuning 450gr', '1000000000256', 0, 0, '', '', 15, NULL, 1, '2022-03-08 01:49:01', NULL, NULL);
INSERT INTO `tblitem` VALUES (258, 1, 1, '9000000000257', 'So Good Baso Sapi Kuah 8s', '1000000000257', 0, 0, '', '', 15, NULL, 1, '2022-03-08 01:49:01', NULL, NULL);
INSERT INTO `tblitem` VALUES (259, 1, 1, '9000000000258', 'So Nice Nugget 250gr', '1000000000258', 0, 0, '', '', 16, NULL, 1, '2022-03-08 01:49:01', NULL, NULL);
INSERT INTO `tblitem` VALUES (260, 1, 1, '9000000000259', 'So Nice Nugget 500gr', '1000000000259', 0, 0, '', '', 16, NULL, 1, '2022-03-08 01:49:01', NULL, NULL);
INSERT INTO `tblitem` VALUES (261, 1, 1, '9000000000260', 'So Nice Nugget 1kg', '1000000000260', 0, 0, '', '', 16, NULL, 1, '2022-03-08 01:49:01', NULL, NULL);
INSERT INTO `tblitem` VALUES (262, 1, 1, '9000000000261', 'So Nice Stik 250gr', '1000000000261', 0, 0, '', '', 16, NULL, 1, '2022-03-08 01:49:01', NULL, NULL);
INSERT INTO `tblitem` VALUES (263, 1, 1, '9000000000262', 'So Nice Stik 500gr', '1000000000262', 0, 0, '', '', 16, NULL, 1, '2022-03-08 01:49:01', NULL, NULL);
INSERT INTO `tblitem` VALUES (264, 1, 1, '9000000000263', 'So Nice Stik 1kg', '1000000000263', 0, 0, '', '', 16, NULL, 1, '2022-03-08 01:49:01', NULL, NULL);
INSERT INTO `tblitem` VALUES (265, 1, 1, '9000000000264', 'So Nice Sosis 375gr', '1000000000264', 0, 0, '', '', 16, NULL, 1, '2022-03-08 01:49:01', NULL, NULL);
INSERT INTO `tblitem` VALUES (266, 1, 1, '9000000000265', 'So Nice Sosis 3s', '1000000000265', 0, 0, '', '', 16, NULL, 1, '2022-03-08 01:49:01', NULL, NULL);
INSERT INTO `tblitem` VALUES (267, 1, 1, '9000000000266', 'So Eco Nugget 1kg', '1000000000266', 0, 0, '', '', 17, NULL, 1, '2022-03-08 01:49:01', NULL, NULL);
INSERT INTO `tblitem` VALUES (268, 1, 1, '9000000000267', 'Queen Food Cordon Blue 340gr ', '1000000000267', 0, 0, '', '', 18, NULL, 1, '2022-03-08 01:49:01', NULL, NULL);
INSERT INTO `tblitem` VALUES (269, 1, 1, '9000000000268', 'Queen Food Chicken Katsu 350gr', '1000000000268', 0, 0, '', '', 18, NULL, 1, '2022-03-08 01:49:01', NULL, NULL);
INSERT INTO `tblitem` VALUES (270, 1, 1, '9000000000269', 'Queen Food Dory Katsu 350gr', '1000000000269', 0, 0, '', '', 18, NULL, 1, '2022-03-08 01:49:01', NULL, NULL);
INSERT INTO `tblitem` VALUES (271, 1, 1, '9000000000270', 'Queen Food Shrimp Roll 340gr', '1000000000270', 0, 0, '', '', 18, NULL, 1, '2022-03-08 01:49:01', NULL, NULL);
INSERT INTO `tblitem` VALUES (272, 1, 1, '9000000000271', 'Queen Food Spicy Chicken 340gr', '1000000000271', 0, 0, '', '', 18, NULL, 1, '2022-03-08 01:49:01', NULL, NULL);
INSERT INTO `tblitem` VALUES (273, 1, 1, '9000000000272', 'Queen Food Sayap Isi 450gr', '1000000000272', 0, 0, '', '', 18, NULL, 1, '2022-03-08 01:49:01', NULL, NULL);
INSERT INTO `tblitem` VALUES (274, 1, 1, '9000000000273', 'Queen Food Egg Chicken Roll 350gr', '1000000000273', 0, 0, '', '', 18, NULL, 1, '2022-03-08 01:49:01', NULL, NULL);
INSERT INTO `tblitem` VALUES (275, 1, 1, '9000000000274', 'Queen Food Ori Bag Telur 200gr', '1000000000274', 0, 0, '', '', 18, NULL, 1, '2022-03-08 01:49:01', NULL, NULL);
INSERT INTO `tblitem` VALUES (276, 1, 1, '9000000000275', 'Queen Food Sushi Crab Roll 400gr', '1000000000275', 0, 0, '', '', 18, NULL, 1, '2022-03-08 01:49:01', NULL, NULL);
INSERT INTO `tblitem` VALUES (277, 1, 1, '9000000000276', 'Queen Food Sushi Tuna Roll 400gr', '1000000000276', 0, 0, '', '', 18, NULL, 1, '2022-03-08 01:49:01', NULL, NULL);
INSERT INTO `tblitem` VALUES (278, 1, 1, '9000000000277', 'Queen Food Cheesy Stik 310gr', '1000000000277', 0, 0, '', '', 18, NULL, 1, '2022-03-08 01:49:01', NULL, NULL);
INSERT INTO `tblitem` VALUES (279, 1, 1, '9000000000278', 'Queen Food Cakwe Isi Udang 400gr', '1000000000278', 0, 0, '', '', 18, NULL, 1, '2022-03-08 01:49:01', NULL, NULL);
INSERT INTO `tblitem` VALUES (280, 1, 1, '9000000000279', 'Queen Food Bitter Ballen 300gr', '1000000000279', 0, 0, '', '', 18, NULL, 1, '2022-03-08 01:49:01', NULL, NULL);
INSERT INTO `tblitem` VALUES (281, 1, 1, '9000000000280', 'Queen Food Ebi Furai 340gr', '1000000000280', 0, 0, '', '', 18, NULL, 1, '2022-03-08 01:49:01', NULL, NULL);
INSERT INTO `tblitem` VALUES (282, 1, 1, '9000000000281', 'Queen Food Tori Egg Roll 400gr ', '1000000000281', 0, 0, '', '', 18, NULL, 1, '2022-03-08 01:49:01', NULL, NULL);
INSERT INTO `tblitem` VALUES (283, 1, 1, '9000000000282', 'Queen Food Pangsit Udang Mayo 225gr', '1000000000282', 0, 0, '', '', 18, NULL, 1, '2022-03-08 01:49:01', NULL, NULL);
INSERT INTO `tblitem` VALUES (284, 1, 1, '9000000000283', 'Queen Food Chicken Strip 500gr', '1000000000283', 0, 0, '', '', 18, NULL, 1, '2022-03-08 01:49:01', NULL, NULL);
INSERT INTO `tblitem` VALUES (285, 1, 1, '9000000000284', 'Maxchoice Sosbak Sapi ORI JUMBO 6s 500gr', '1000000000284', 0, 0, '', '', 19, NULL, 1, '2022-03-08 01:49:01', NULL, NULL);
INSERT INTO `tblitem` VALUES (286, 1, 1, '9000000000285', 'MAxchoice Sosbak Sapi Mini Ori 10s 500gr', '1000000000285', 0, 0, '', '', 19, NULL, 1, '2022-03-08 01:49:01', NULL, NULL);
INSERT INTO `tblitem` VALUES (287, 1, 1, '9000000000286', 'Maxchoice Sosbak Ayam ORI JUMBO 6s 500gr', '1000000000286', 0, 0, '', '', 19, NULL, 1, '2022-03-08 01:49:01', NULL, NULL);
INSERT INTO `tblitem` VALUES (288, 1, 1, '9000000000287', 'MAxchoice Sosbak Ayam Mini Ori 10s 500gr', '1000000000287', 0, 0, '', '', 19, NULL, 1, '2022-03-08 01:49:01', NULL, NULL);
INSERT INTO `tblitem` VALUES (289, 1, 1, '9000000000288', 'Delimax Smoked Beef 200gr', '1000000000288', 0, 0, '', '', 20, NULL, 1, '2022-03-08 01:49:01', NULL, NULL);
INSERT INTO `tblitem` VALUES (290, 1, 1, '9000000000289', 'Delimax Smoked Beef 500gr', '1000000000289', 0, 0, '', '', 20, NULL, 1, '2022-03-08 01:49:01', NULL, NULL);
INSERT INTO `tblitem` VALUES (291, 1, 1, '9000000000290', 'Delimax Spicy Wing 500gr', '1000000000290', 0, 0, '', '', 20, NULL, 1, '2022-03-08 01:49:01', NULL, NULL);
INSERT INTO `tblitem` VALUES (292, 1, 1, '9000000000291', 'Minaku Scallop 200gr (Kecil)', '1000000000291', 0, 0, '', '', 21, NULL, 1, '2022-03-08 01:49:01', NULL, NULL);
INSERT INTO `tblitem` VALUES (293, 1, 1, '9000000000292', 'Minaku Scallop 500gr ', '1000000000292', 0, 0, '', '', 21, NULL, 1, '2022-03-08 01:49:01', NULL, NULL);
INSERT INTO `tblitem` VALUES (294, 1, 1, '9000000000293', 'Minaku Kaki Naga 200gr (Kecil)', '1000000000293', 0, 0, '', '', 21, NULL, 1, '2022-03-08 01:49:01', NULL, NULL);
INSERT INTO `tblitem` VALUES (295, 1, 1, '9000000000294', 'Minaku Kaki Naga 500gr ', '1000000000294', 0, 0, '', '', 21, NULL, 1, '2022-03-08 01:49:01', NULL, NULL);
INSERT INTO `tblitem` VALUES (296, 1, 1, '9000000000295', 'Minaku Nugget Ice Cream 500gr', '1000000000295', 0, 0, '', '', 21, NULL, 1, '2022-03-08 01:49:01', NULL, NULL);
INSERT INTO `tblitem` VALUES (297, 1, 1, '9000000000296', 'Minaku Otak Otak 200gr (Kecil)', '1000000000296', 0, 0, '', '', 21, NULL, 1, '2022-03-08 01:49:01', NULL, NULL);
INSERT INTO `tblitem` VALUES (298, 1, 1, '9000000000297', 'Minaku Otak Otak 500gr', '1000000000297', 0, 0, '', '', 21, NULL, 1, '2022-03-08 01:49:01', NULL, NULL);
INSERT INTO `tblitem` VALUES (299, 1, 1, '9000000000298', 'Minaku Bola Ikan 200gr (Kecil)', '1000000000298', 0, 0, '', '', 21, NULL, 1, '2022-03-08 01:49:01', NULL, NULL);
INSERT INTO `tblitem` VALUES (300, 1, 1, '9000000000299', 'Minaku Bola Ikan 500gr', '1000000000299', 0, 0, '', '', 21, NULL, 1, '2022-03-08 01:49:01', NULL, NULL);
INSERT INTO `tblitem` VALUES (301, 1, 1, '9000000000300', 'Minaku Bola Udang 200gr (Kecil)', '1000000000300', 0, 0, '', '', 21, NULL, 1, '2022-03-08 01:49:01', NULL, NULL);
INSERT INTO `tblitem` VALUES (302, 1, 1, '9000000000301', 'Minaku Bola Udang 500gr', '1000000000301', 0, 0, '', '', 21, NULL, 1, '2022-03-08 01:49:01', NULL, NULL);
INSERT INTO `tblitem` VALUES (303, 1, 1, '9000000000302', 'Minaku Bola Cumi 200gr (Kecil)', '1000000000302', 0, 0, '', '', 21, NULL, 1, '2022-03-08 01:49:01', NULL, NULL);
INSERT INTO `tblitem` VALUES (304, 1, 1, '9000000000303', 'Minaku Bola Cumi 500gr', '1000000000303', 0, 0, '', '', 21, NULL, 1, '2022-03-08 01:49:01', NULL, NULL);
INSERT INTO `tblitem` VALUES (305, 1, 1, '9000000000304', 'Minaku Bola Salmon 200gr (Kecil)', '1000000000304', 0, 0, '', '', 21, NULL, 1, '2022-03-08 01:49:01', NULL, NULL);
INSERT INTO `tblitem` VALUES (306, 1, 1, '9000000000305', 'Minaku Bola Salmon 500gr', '1000000000305', 0, 0, '', '', 21, NULL, 1, '2022-03-08 01:49:01', NULL, NULL);
INSERT INTO `tblitem` VALUES (307, 1, 1, '9000000000306', 'Minaku Bola Lobster 200gr (Kecil)', '1000000000306', 0, 0, '', '', 21, NULL, 1, '2022-03-08 01:49:01', NULL, NULL);
INSERT INTO `tblitem` VALUES (308, 1, 1, '9000000000307', 'Minaku Bola Lobster 500gr', '1000000000307', 0, 0, '', '', 21, NULL, 1, '2022-03-08 01:49:01', NULL, NULL);
INSERT INTO `tblitem` VALUES (309, 1, 1, '9000000000308', 'Minaku Bola Kepiting 200gr (Kecil)', '1000000000308', 0, 0, '', '', 21, NULL, 1, '2022-03-08 01:49:01', NULL, NULL);
INSERT INTO `tblitem` VALUES (310, 1, 1, '9000000000309', 'Minaku Bola Kepiting  500gr', '1000000000309', 0, 0, '', '', 21, NULL, 1, '2022-03-08 01:49:01', NULL, NULL);
INSERT INTO `tblitem` VALUES (311, 1, 1, '9000000000310', 'Minaku Kentang 500gr', '1000000000310', 0, 0, '', '', 21, NULL, 1, '2022-03-08 01:49:01', NULL, NULL);
INSERT INTO `tblitem` VALUES (312, 1, 1, '9000000000311', 'Minaku Crab Stik 250gr', '1000000000311', 0, 0, '', '', 21, NULL, 1, '2022-03-08 01:49:01', NULL, NULL);
INSERT INTO `tblitem` VALUES (313, 1, 1, '9000000000312', 'Minaku Crab Stik 500gr', '1000000000312', 0, 0, '', '', 21, NULL, 1, '2022-03-08 01:49:01', NULL, NULL);
INSERT INTO `tblitem` VALUES (314, 1, 1, '9000000000313', 'Minaku Crab Stik 1kg', '1000000000313', 0, 0, '', '', 21, NULL, 1, '2022-03-08 01:49:01', NULL, NULL);
INSERT INTO `tblitem` VALUES (315, 1, 1, '9000000000314', 'Minaku Edamame 500gr ', '1000000000314', 0, 0, '', '', 21, NULL, 1, '2022-03-08 01:49:01', NULL, NULL);
INSERT INTO `tblitem` VALUES (316, 1, 1, '9000000000315', 'Sunfish Bakso Ikan Rebus 500gr', '1000000000315', 0, 0, '', '', 22, NULL, 1, '2022-03-08 01:49:01', NULL, NULL);
INSERT INTO `tblitem` VALUES (317, 1, 1, '9000000000316', 'Sunfish Bakso Ikan n Udang 500gr', '1000000000316', 0, 0, '', '', 22, NULL, 1, '2022-03-08 01:49:01', NULL, NULL);
INSERT INTO `tblitem` VALUES (318, 1, 1, '9000000000317', 'Sunfish Bolado 250gr (Kecil)', '1000000000317', 0, 0, '', '', 22, NULL, 1, '2022-03-08 01:49:01', NULL, NULL);
INSERT INTO `tblitem` VALUES (319, 1, 1, '9000000000318', 'Sunfish Bolado 1kg', '1000000000318', 0, 0, '', '', 22, NULL, 1, '2022-03-08 01:49:01', NULL, NULL);
INSERT INTO `tblitem` VALUES (320, 1, 1, '9000000000319', 'Sunfish Fish Roll 250gr (Kecil)', '1000000000319', 0, 0, '', '', 22, NULL, 1, '2022-03-08 01:49:01', NULL, NULL);
INSERT INTO `tblitem` VALUES (321, 1, 1, '9000000000320', 'Sunfish Fish Roll 500gr', '1000000000320', 0, 0, '', '', 22, NULL, 1, '2022-03-08 01:49:01', NULL, NULL);
INSERT INTO `tblitem` VALUES (322, 1, 1, '9000000000321', 'Sunfish Fish Roll 1kg', '1000000000321', 0, 0, '', '', 22, NULL, 1, '2022-03-08 01:49:01', NULL, NULL);
INSERT INTO `tblitem` VALUES (323, 1, 1, '9000000000322', 'Sunfish Scallop Ikan 500gr', '1000000000322', 0, 0, '', '', 22, NULL, 1, '2022-03-08 01:49:01', NULL, NULL);
INSERT INTO `tblitem` VALUES (324, 1, 1, '9000000000323', 'Sunfish Hati Ikan 500gr', '1000000000323', 0, 0, '', '', 22, NULL, 1, '2022-03-08 01:49:01', NULL, NULL);
INSERT INTO `tblitem` VALUES (325, 1, 1, '9000000000324', 'Sunfish Fish Tofu 500gr', '1000000000324', 0, 0, '', '', 22, NULL, 1, '2022-03-08 01:49:01', NULL, NULL);
INSERT INTO `tblitem` VALUES (326, 1, 1, '9000000000325', 'Sunfish Nugget Stik 250gr', '1000000000325', 0, 0, '', '', 22, NULL, 1, '2022-03-08 01:49:01', NULL, NULL);
INSERT INTO `tblitem` VALUES (327, 1, 1, '9000000000326', 'Sunfish Otak Otak 10s 500gr', '1000000000326', 0, 0, '', '', 22, NULL, 1, '2022-03-08 01:49:01', NULL, NULL);
INSERT INTO `tblitem` VALUES (328, 1, 1, '9000000000327', 'Sunfish Otak Lancip 20S 500gr', '1000000000327', 0, 0, '', '', 22, NULL, 1, '2022-03-08 01:49:01', NULL, NULL);
INSERT INTO `tblitem` VALUES (329, 1, 1, '9000000000328', 'Sunfish Otak Lancip 40S 500gr', '1000000000328', 0, 0, '', '', 22, NULL, 1, '2022-03-08 01:49:01', NULL, NULL);
INSERT INTO `tblitem` VALUES (330, 1, 1, '9000000000329', 'Sunfish Vegetable Fish Cake 500gr', '1000000000329', 0, 0, '', '', 22, NULL, 1, '2022-03-08 01:49:01', NULL, NULL);
INSERT INTO `tblitem` VALUES (331, 1, 1, '9000000000330', 'Sunfish Dumpling Cheese 500gr', '1000000000330', 0, 0, '', '', 22, NULL, 1, '2022-03-08 01:49:01', NULL, NULL);
INSERT INTO `tblitem` VALUES (332, 1, 1, '9000000000331', 'Sunfish Chikuwa MINI 1KG', '1000000000331', 0, 0, '', '', 22, NULL, 1, '2022-03-08 01:49:01', NULL, NULL);
INSERT INTO `tblitem` VALUES (333, 1, 1, '9000000000332', 'Sunfish Chikuwa Mini 500gr', '1000000000332', 0, 0, '', '', 22, NULL, 1, '2022-03-08 01:49:01', NULL, NULL);
INSERT INTO `tblitem` VALUES (334, 1, 1, '9000000000333', 'Sunfish Chikuwa LONG 1KG', '1000000000333', 0, 0, '', '', 22, NULL, 1, '2022-03-08 01:49:01', NULL, NULL);
INSERT INTO `tblitem` VALUES (335, 1, 1, '9000000000334', 'Sunfish Chikuwa Long 500gr', '1000000000334', 0, 0, '', '', 22, NULL, 1, '2022-03-08 01:49:01', NULL, NULL);
INSERT INTO `tblitem` VALUES (336, 1, 1, '9000000000335', 'Sunfish Kembang Cumi 500gr', '1000000000335', 0, 0, '', '', 22, NULL, 1, '2022-03-08 01:49:01', NULL, NULL);
INSERT INTO `tblitem` VALUES (337, 1, 1, '9000000000336', 'Sunfish Baso Ikan Cumi 500gr', '1000000000336', 0, 0, '', '', 22, NULL, 1, '2022-03-08 01:49:01', NULL, NULL);
INSERT INTO `tblitem` VALUES (338, 1, 1, '9000000000337', 'Sunfish Fish N Soy 500gr', '1000000000337', 0, 0, '', '', 22, NULL, 1, '2022-03-08 01:49:01', NULL, NULL);
INSERT INTO `tblitem` VALUES (339, 1, 1, '9000000000338', 'Sunfish Dumpling Chicken 500gr', '1000000000338', 0, 0, '', '', 22, NULL, 1, '2022-03-08 01:49:01', NULL, NULL);
INSERT INTO `tblitem` VALUES (340, 1, 1, '9000000000339', 'Sunfish Banana Fish Cake 500gr (Otak Sgpr)', '1000000000339', 0, 0, '', '', 22, NULL, 1, '2022-03-08 01:49:01', NULL, NULL);
INSERT INTO `tblitem` VALUES (341, 1, 1, '9000000000340', 'Sunfish Kue Ikan Pedas 500gr', '1000000000340', 0, 0, '', '', 22, NULL, 1, '2022-03-08 01:49:01', NULL, NULL);
INSERT INTO `tblitem` VALUES (342, 1, 1, '9000000000341', 'Sunfish Kue Ikan Sayur Model Bulat 500gr', '1000000000341', 0, 0, '', '', 22, NULL, 1, '2022-03-08 01:49:01', NULL, NULL);
INSERT INTO `tblitem` VALUES (343, 1, 1, '9000000000342', 'Sunfish Crab Stik 250gr (Kecil)', '1000000000342', 0, 0, '', '', 22, NULL, 1, '2022-03-08 01:49:01', NULL, NULL);
INSERT INTO `tblitem` VALUES (344, 1, 1, '9000000000343', 'Sunfish Crab Stik 1KG', '1000000000343', 0, 0, '', '', 22, NULL, 1, '2022-03-08 01:49:01', NULL, NULL);
INSERT INTO `tblitem` VALUES (345, 1, 1, '9000000000344', 'Sunfish Baso Mix 500gr ', '1000000000344', 0, 0, '', '', 22, NULL, 1, '2022-03-08 01:49:01', NULL, NULL);
INSERT INTO `tblitem` VALUES (346, 1, 1, '9000000000345', 'Sunfish Baso Mix 1KG', '1000000000345', 0, 0, '', '', 22, NULL, 1, '2022-03-08 01:49:01', NULL, NULL);
INSERT INTO `tblitem` VALUES (347, 1, 1, '9000000000346', 'Sunfish Salmon Ball 500gr', '1000000000346', 0, 0, '', '', 22, NULL, 1, '2022-03-08 01:49:01', NULL, NULL);
INSERT INTO `tblitem` VALUES (348, 1, 1, '9000000000347', 'Sunfish Shrimp Roll 500gr', '1000000000347', 0, 0, '', '', 22, NULL, 1, '2022-03-08 01:49:01', NULL, NULL);
INSERT INTO `tblitem` VALUES (349, 1, 1, '9000000000348', 'Sunfish Ekor Udang 450gr', '1000000000348', 0, 0, '', '', 22, NULL, 1, '2022-03-08 01:49:01', NULL, NULL);
INSERT INTO `tblitem` VALUES (350, 1, 1, '9000000000349', 'Sunfish Baso Lobster 500gr ', '1000000000349', 0, 0, '', '', 22, NULL, 1, '2022-03-08 01:49:01', NULL, NULL);
INSERT INTO `tblitem` VALUES (351, 1, 1, '9000000000350', 'Sunfish Bakso Kepiting 500gr', '1000000000350', 0, 0, '', '', 22, NULL, 1, '2022-03-08 01:49:01', NULL, NULL);
INSERT INTO `tblitem` VALUES (352, 1, 1, '9000000000351', 'Delmonte Tomat Scht 9gr 24s', '1000000000351', 0, 0, '', '', 23, NULL, 1, '2022-03-08 01:49:01', NULL, NULL);
INSERT INTO `tblitem` VALUES (353, 1, 1, '9000000000352', 'Delmonte Tomat 140ml Btl', '1000000000352', 0, 0, '', '', 23, NULL, 1, '2022-03-08 01:49:01', NULL, NULL);
INSERT INTO `tblitem` VALUES (354, 1, 1, '9000000000353', 'Delmonte Tomat 340ml Btl', '1000000000353', 0, 0, '', '', 23, NULL, 1, '2022-03-08 01:49:01', NULL, NULL);
INSERT INTO `tblitem` VALUES (355, 1, 1, '9000000000354', 'Delmonte Tomat 200gr Pouch', '1000000000354', 0, 0, '', '', 23, NULL, 1, '2022-03-08 01:49:01', NULL, NULL);
INSERT INTO `tblitem` VALUES (356, 1, 1, '9000000000355', 'Delmonte Tomat Pouch 1kg', '1000000000355', 0, 0, '', '', 23, NULL, 1, '2022-03-08 01:49:01', NULL, NULL);
INSERT INTO `tblitem` VALUES (357, 1, 1, '9000000000356', 'Delmonte Tomat Jrgn 5,7kg', '1000000000356', 0, 0, '', '', 23, NULL, 1, '2022-03-08 01:49:01', NULL, NULL);
INSERT INTO `tblitem` VALUES (358, 1, 1, '9000000000357', 'Delmonte Extra Hot Scht  9gr 24S', '1000000000357', 0, 0, '', '', 23, NULL, 1, '2022-03-08 01:49:01', NULL, NULL);
INSERT INTO `tblitem` VALUES (359, 1, 1, '9000000000358', 'Delmonte Extra HOT 140ml Btl', '1000000000358', 0, 0, '', '', 23, NULL, 1, '2022-03-08 01:49:01', NULL, NULL);
INSERT INTO `tblitem` VALUES (360, 1, 1, '9000000000359', 'Delmonte Extra HOT 340ml Btl', '1000000000359', 0, 0, '', '', 23, NULL, 1, '2022-03-08 01:49:01', NULL, NULL);
INSERT INTO `tblitem` VALUES (361, 1, 1, '9000000000360', 'Delmonte Extra HOT 200gr Pouch', '1000000000360', 0, 0, '', '', 23, NULL, 1, '2022-03-08 01:49:01', NULL, NULL);
INSERT INTO `tblitem` VALUES (362, 1, 1, '9000000000361', 'Delmonte Extra HOT Pouch 1kg', '1000000000361', 0, 0, '', '', 23, NULL, 1, '2022-03-08 01:49:01', NULL, NULL);
INSERT INTO `tblitem` VALUES (363, 1, 1, '9000000000362', 'Delmonte Extra HOT Jrgn 5,7kg', '1000000000362', 0, 0, '', '', 23, NULL, 1, '2022-03-08 01:49:01', NULL, NULL);
INSERT INTO `tblitem` VALUES (364, 1, 1, '9000000000363', 'Delmonte BBQ 250gr (Kecil)', '1000000000363', 0, 0, '', '', 23, NULL, 1, '2022-03-08 01:49:01', NULL, NULL);
INSERT INTO `tblitem` VALUES (365, 1, 1, '9000000000364', 'Delmonte BBQ 1kg', '1000000000364', 0, 0, '', '', 23, NULL, 1, '2022-03-08 01:49:01', NULL, NULL);
INSERT INTO `tblitem` VALUES (366, 1, 1, '9000000000365', 'Delmonte Spaghetti 250gr', '1000000000365', 0, 0, '', '', 23, NULL, 1, '2022-03-08 01:49:01', NULL, NULL);
INSERT INTO `tblitem` VALUES (367, 1, 1, '9000000000366', 'Maestro Mayonaise 1kg ', '1000000000366', 0, 0, '', '', 24, NULL, 1, '2022-03-08 01:49:01', NULL, NULL);
INSERT INTO `tblitem` VALUES (368, 1, 1, '9000000000367', 'Maestro Mayonaise Scht 100gr', '1000000000367', 0, 0, '', '', 24, NULL, 1, '2022-03-08 01:49:01', NULL, NULL);
INSERT INTO `tblitem` VALUES (369, 1, 1, '9000000000368', 'Maestro Mayonaise PCH 180gr ', '1000000000368', 0, 0, '', '', 24, NULL, 1, '2022-03-08 01:49:01', NULL, NULL);
INSERT INTO `tblitem` VALUES (370, 1, 1, '9000000000369', 'Maestro Mayonaise Pedas SCHT 100gr ', '1000000000369', 0, 0, '', '', 24, NULL, 1, '2022-03-08 01:49:01', NULL, NULL);
INSERT INTO `tblitem` VALUES (371, 1, 1, '9000000000370', 'Maestro Thousand Island 1kg', '1000000000370', 0, 0, '', '', 24, NULL, 1, '2022-03-08 01:49:01', NULL, NULL);
INSERT INTO `tblitem` VALUES (372, 1, 1, '9000000000371', 'Maestro Thousand Island SCHT 100gr', '1000000000371', 0, 0, '', '', 24, NULL, 1, '2022-03-08 01:49:01', NULL, NULL);
INSERT INTO `tblitem` VALUES (373, 1, 1, '9000000000372', 'Maestro Thousand Island 180gr', '1000000000372', 0, 0, '', '', 24, NULL, 1, '2022-03-08 01:49:01', NULL, NULL);
INSERT INTO `tblitem` VALUES (374, 1, 1, '9000000000373', 'Maestro Roasted Sesame SCHT (Wijen) 100gr', '1000000000373', 0, 0, '', '', 24, NULL, 1, '2022-03-08 01:49:01', NULL, NULL);
INSERT INTO `tblitem` VALUES (375, 1, 1, '9000000000374', 'Primaagung Mayonaise ORI 900gr', '1000000000374', 0, 0, '', '', 25, NULL, 1, '2022-03-08 01:49:01', NULL, NULL);
INSERT INTO `tblitem` VALUES (376, 1, 1, '9000000000375', 'Primaagung Mayonaise ORI 500gr', '1000000000375', 0, 0, '', '', 25, NULL, 1, '2022-03-08 01:49:01', NULL, NULL);
INSERT INTO `tblitem` VALUES (377, 1, 1, '9000000000376', 'Primaagung Mayonaise ORI 250gr (Kecil)', '1000000000376', 0, 0, '', '', 25, NULL, 1, '2022-03-08 01:49:01', NULL, NULL);
INSERT INTO `tblitem` VALUES (378, 1, 1, '9000000000377', 'Primaagung Saus Keju 1kg', '1000000000377', 0, 0, '', '', 25, NULL, 1, '2022-03-08 01:49:01', NULL, NULL);
INSERT INTO `tblitem` VALUES (379, 1, 1, '9000000000378', 'Primaagung Saus Keju 500GR', '1000000000378', 0, 0, '', '', 25, NULL, 1, '2022-03-08 01:49:01', NULL, NULL);
INSERT INTO `tblitem` VALUES (380, 1, 1, '9000000000379', 'Primaagung Saus Keju 250GR  (Kecil)', '1000000000379', 0, 0, '', '', 25, NULL, 1, '2022-03-08 01:49:01', NULL, NULL);
INSERT INTO `tblitem` VALUES (381, 1, 1, '9000000000380', 'Primaagung Saus Mentai 1KG', '1000000000380', 0, 0, '', '', 25, NULL, 1, '2022-03-08 01:49:01', NULL, NULL);
INSERT INTO `tblitem` VALUES (382, 1, 1, '9000000000381', 'Primaagung Saus Mentai 500GR', '1000000000381', 0, 0, '', '', 25, NULL, 1, '2022-03-08 01:49:01', NULL, NULL);
INSERT INTO `tblitem` VALUES (383, 1, 1, '9000000000382', 'Primaagung Saus Mentai 250gr  (Kecil)', '1000000000382', 0, 0, '', '', 25, NULL, 1, '2022-03-08 01:49:01', NULL, NULL);
INSERT INTO `tblitem` VALUES (384, 1, 1, '9000000000383', 'Primaagung Mayonaise Pedas 1kg', '1000000000383', 0, 0, '', '', 25, NULL, 1, '2022-03-08 01:49:01', NULL, NULL);
INSERT INTO `tblitem` VALUES (385, 1, 1, '9000000000384', 'Primaagung Mayonaise Pedas 500GR', '1000000000384', 0, 0, '', '', 25, NULL, 1, '2022-03-08 01:49:01', NULL, NULL);
INSERT INTO `tblitem` VALUES (386, 1, 1, '9000000000385', 'Primaagung Mayonaise Pedas 250GR  (Kecil)', '1000000000385', 0, 0, '', '', 25, NULL, 1, '2022-03-08 01:49:01', NULL, NULL);
INSERT INTO `tblitem` VALUES (387, 1, 1, '9000000000386', 'Primaagung Thousand Island 1kg', '1000000000386', 0, 0, '', '', 25, NULL, 1, '2022-03-08 01:49:01', NULL, NULL);
INSERT INTO `tblitem` VALUES (388, 1, 1, '9000000000387', 'Primaagung Thousand Island 500GR', '1000000000387', 0, 0, '', '', 25, NULL, 1, '2022-03-08 01:49:01', NULL, NULL);
INSERT INTO `tblitem` VALUES (389, 1, 1, '9000000000388', 'Primaagung Thousand Island 250GR  (Kecil)', '1000000000388', 0, 0, '', '', 25, NULL, 1, '2022-03-08 01:49:01', NULL, NULL);
INSERT INTO `tblitem` VALUES (390, 1, 1, '9000000000389', 'KK Shoestring 1kg', '1000000000389', 0, 0, '', '', 26, NULL, 1, '2022-03-08 01:49:01', NULL, NULL);
INSERT INTO `tblitem` VALUES (391, 1, 1, '9000000000390', 'KK STRAIGHT CUT 1KG', '1000000000390', 0, 0, '', '', 26, NULL, 1, '2022-03-08 01:49:01', NULL, NULL);
INSERT INTO `tblitem` VALUES (392, 1, 1, '9000000000391', 'KK Crincle Cut 1kg', '1000000000391', 0, 0, '', '', 26, NULL, 1, '2022-03-08 01:49:01', NULL, NULL);
INSERT INTO `tblitem` VALUES (393, 1, 1, '9000000000392', 'KING Shoestring 2,5kg', '1000000000392', 0, 0, '', '', 26, NULL, 1, '2022-03-08 01:49:01', NULL, NULL);
INSERT INTO `tblitem` VALUES (394, 1, 1, '9000000000393', 'KING Crincle 2,5kg', '1000000000393', 0, 0, '', '', 26, NULL, 1, '2022-03-08 01:49:01', NULL, NULL);
INSERT INTO `tblitem` VALUES (395, 1, 1, '9000000000394', 'KK MIX Vegetable 1kg 3Ways', '1000000000394', 0, 0, '', '', 26, NULL, 1, '2022-03-08 01:49:01', NULL, NULL);
INSERT INTO `tblitem` VALUES (396, 1, 1, '9000000000395', 'KK MIX Vegetable 1kg 4Ways', '1000000000395', 0, 0, '', '', 26, NULL, 1, '2022-03-08 01:49:01', NULL, NULL);
INSERT INTO `tblitem` VALUES (397, 1, 1, '9000000000396', 'KK Sweet Corn 1kg', '1000000000396', 0, 0, '', '', 26, NULL, 1, '2022-03-08 01:49:01', NULL, NULL);
INSERT INTO `tblitem` VALUES (398, 1, 1, '9000000000397', 'KK GREEN PEAS 1KG', '1000000000397', 0, 0, '', '', 26, NULL, 1, '2022-03-08 01:49:01', NULL, NULL);
INSERT INTO `tblitem` VALUES (399, 1, 1, '9000000000398', 'Muantap Sosbak Jumbo Ori 6s', '1000000000398', 0, 0, '', '', 27, NULL, 1, '2022-03-08 01:49:01', NULL, NULL);
INSERT INTO `tblitem` VALUES (400, 1, 1, '9000000000399', 'Muantap Sosis Sapi 1kg', '1000000000399', 0, 0, '', '', 27, NULL, 1, '2022-03-08 01:49:01', NULL, NULL);
INSERT INTO `tblitem` VALUES (401, 1, 1, '9000000000400', 'Muantap Sosis Sapi Short 750gr', '1000000000400', 0, 0, '', '', 27, NULL, 1, '2022-03-08 01:49:01', NULL, NULL);
INSERT INTO `tblitem` VALUES (402, 1, 1, '9000000000401', 'Bartoz Spicy Wing 1kg', '1000000000401', 0, 0, '', '', 28, NULL, 1, '2022-03-08 01:49:01', NULL, NULL);
INSERT INTO `tblitem` VALUES (403, 1, 1, '9000000000402', 'Mitraku Bakso Ikan 200gr (Kecil)', '1000000000402', 0, 0, '', '', 29, NULL, 1, '2022-03-08 01:49:01', NULL, NULL);
INSERT INTO `tblitem` VALUES (404, 1, 1, '9000000000403', 'Mitraku Bakso Ikan 500gr', '1000000000403', 0, 0, '', '', 29, NULL, 1, '2022-03-08 01:49:01', NULL, NULL);
INSERT INTO `tblitem` VALUES (405, 1, 1, '9000000000404', 'Mitraku Bakso Isi Ayam 250gr (Kecil)', '1000000000404', 0, 0, '', '', 29, NULL, 1, '2022-03-08 01:49:01', NULL, NULL);
INSERT INTO `tblitem` VALUES (406, 1, 1, '9000000000405', 'Mitraku Bakso Isi TUNA 250gr (Kecil)', '1000000000405', 0, 0, '', '', 29, NULL, 1, '2022-03-08 01:49:01', NULL, NULL);
INSERT INTO `tblitem` VALUES (407, 1, 1, '9000000000406', 'Mitraku Bakso Isi Keju 250gr (Kecil)', '1000000000406', 0, 0, '', '', 29, NULL, 1, '2022-03-08 01:49:01', NULL, NULL);
INSERT INTO `tblitem` VALUES (408, 1, 1, '9000000000407', 'Mitraku Dumpling Ayam 250gr (Kecil)', '1000000000407', 0, 0, '', '', 29, NULL, 1, '2022-03-08 01:49:01', NULL, NULL);
INSERT INTO `tblitem` VALUES (409, 1, 1, '9000000000408', 'Mitraku Dumpling Ayam 500gr ', '1000000000408', 0, 0, '', '', 29, NULL, 1, '2022-03-08 01:49:01', NULL, NULL);
INSERT INTO `tblitem` VALUES (410, 1, 1, '9000000000409', 'Mitraku Dumpling Keju 250gr (Kecil)', '1000000000409', 0, 0, '', '', 29, NULL, 1, '2022-03-08 01:49:01', NULL, NULL);
INSERT INTO `tblitem` VALUES (411, 1, 1, '9000000000410', 'Mitraku Dumpling Keju 500gr ', '1000000000410', 0, 0, '', '', 29, NULL, 1, '2022-03-08 01:49:01', NULL, NULL);
INSERT INTO `tblitem` VALUES (412, 1, 1, '9000000000411', 'Mitraku Bakso MIX 250gr (Kecil)', '1000000000411', 0, 0, '', '', 29, NULL, 1, '2022-03-08 01:49:01', NULL, NULL);
INSERT INTO `tblitem` VALUES (413, 1, 1, '9000000000412', 'Mitraku Bakso MIX 500gr', '1000000000412', 0, 0, '', '', 29, NULL, 1, '2022-03-08 01:49:01', NULL, NULL);
INSERT INTO `tblitem` VALUES (414, 1, 1, '9000000000413', 'Mitraku Fish Tofu 500gr', '1000000000413', 0, 0, '', '', 29, NULL, 1, '2022-03-08 01:49:01', NULL, NULL);
INSERT INTO `tblitem` VALUES (415, 1, 1, '9000000000414', 'Mitraku Fish Roll 250gr (Kecil)', '1000000000414', 0, 0, '', '', 29, NULL, 1, '2022-03-08 01:49:01', NULL, NULL);
INSERT INTO `tblitem` VALUES (416, 1, 1, '9000000000415', 'Mitraku Fish Roll 500gr', '1000000000415', 0, 0, '', '', 29, NULL, 1, '2022-03-08 01:49:01', NULL, NULL);
INSERT INTO `tblitem` VALUES (417, 1, 1, '9000000000416', 'Mitraku Fish Roll 1KG', '1000000000416', 0, 0, '', '', 29, NULL, 1, '2022-03-08 01:49:01', NULL, NULL);
INSERT INTO `tblitem` VALUES (418, 1, 1, '9000000000417', 'Mitraku Scallop 200gr (kecil)', '1000000000417', 0, 0, '', '', 29, NULL, 1, '2022-03-08 01:49:01', NULL, NULL);
INSERT INTO `tblitem` VALUES (419, 1, 1, '9000000000418', 'Mitraku Scallop 500gr ', '1000000000418', 0, 0, '', '', 29, NULL, 1, '2022-03-08 01:49:01', NULL, NULL);
INSERT INTO `tblitem` VALUES (420, 1, 1, '9000000000419', 'Mitraku Fish Roll Jagung 250gr', '1000000000419', 0, 0, '', '', 29, NULL, 1, '2022-03-08 01:49:01', NULL, NULL);
INSERT INTO `tblitem` VALUES (421, 1, 1, '9000000000420', 'Mitraku Fish Roll Barbque 250gr', '1000000000420', 0, 0, '', '', 29, NULL, 1, '2022-03-08 01:49:01', NULL, NULL);
INSERT INTO `tblitem` VALUES (422, 1, 1, '9000000000421', 'Mitraku Fish Roll Blackpapper 250gr', '1000000000421', 0, 0, '', '', 29, NULL, 1, '2022-03-08 01:49:01', NULL, NULL);
INSERT INTO `tblitem` VALUES (423, 1, 1, '9000000000422', 'Bumifood Crispy Mix SFD 210gr', '1000000000422', 0, 0, '', '', 30, NULL, 1, '2022-03-08 01:49:01', NULL, NULL);
INSERT INTO `tblitem` VALUES (424, 1, 1, '9000000000423', 'Bumifood Dimsum Siomay Reg 200gr', '1000000000423', 0, 0, '', '', 30, NULL, 1, '2022-03-08 01:49:01', NULL, NULL);
INSERT INTO `tblitem` VALUES (425, 1, 1, '9000000000424', 'Bumifood Hakau Udang 222gr', '1000000000424', 0, 0, '', '', 30, NULL, 1, '2022-03-08 01:49:01', NULL, NULL);
INSERT INTO `tblitem` VALUES (426, 1, 1, '9000000000425', 'Bumifood Lumpia Ayam 210gr', '1000000000425', 0, 0, '', '', 30, NULL, 1, '2022-03-08 01:49:01', NULL, NULL);
INSERT INTO `tblitem` VALUES (427, 1, 1, '9000000000426', 'Bumifood Lumpia Sayur 210gr', '1000000000426', 0, 0, '', '', 30, NULL, 1, '2022-03-08 01:49:01', NULL, NULL);
INSERT INTO `tblitem` VALUES (428, 1, 1, '9000000000427', 'Bumifood Martabak Ayam 222gr', '1000000000427', 0, 0, '', '', 30, NULL, 1, '2022-03-08 01:49:01', NULL, NULL);
INSERT INTO `tblitem` VALUES (429, 1, 1, '9000000000428', 'Bumifood Mini Wonton 350gr', '1000000000428', 0, 0, '', '', 30, NULL, 1, '2022-03-08 01:49:01', NULL, NULL);
INSERT INTO `tblitem` VALUES (430, 1, 1, '9000000000429', 'Bumifood Ebi Furai 220gr', '1000000000429', 0, 0, '', '', 30, NULL, 1, '2022-03-08 01:49:01', NULL, NULL);
INSERT INTO `tblitem` VALUES (431, 1, 1, '9000000000430', 'Mantul Bakso Ikan 200gr (Kecil)', '1000000000430', 0, 0, '', '', 31, NULL, 1, '2022-03-08 01:49:01', NULL, NULL);
INSERT INTO `tblitem` VALUES (432, 1, 1, '9000000000431', 'Mantul Bakso Ikan 500gr', '1000000000431', 0, 0, '', '', 31, NULL, 1, '2022-03-08 01:49:01', NULL, NULL);
INSERT INTO `tblitem` VALUES (433, 1, 1, '9000000000432', 'Mantul Bakso Cumi 200gr', '1000000000432', 0, 0, '', '', 31, NULL, 1, '2022-03-08 01:49:01', NULL, NULL);
INSERT INTO `tblitem` VALUES (434, 1, 1, '9000000000433', 'Mantul Bakso Udang 200gr', '1000000000433', 0, 0, '', '', 31, NULL, 1, '2022-03-08 01:49:01', NULL, NULL);
INSERT INTO `tblitem` VALUES (435, 1, 1, '9000000000434', 'Mantul Fish Roll Balado 200gr (Kecil)', '1000000000434', 0, 0, '', '', 31, NULL, 1, '2022-03-08 01:49:01', NULL, NULL);
INSERT INTO `tblitem` VALUES (436, 1, 1, '9000000000435', 'Mantul Fish Roll Balado 500gr', '1000000000435', 0, 0, '', '', 31, NULL, 1, '2022-03-08 01:49:01', NULL, NULL);
INSERT INTO `tblitem` VALUES (437, 1, 1, '9000000000436', 'Mantul Otak Otak 200gr (kecil)', '1000000000436', 0, 0, '', '', 31, NULL, 1, '2022-03-08 01:49:01', NULL, NULL);
INSERT INTO `tblitem` VALUES (438, 1, 1, '9000000000437', 'Mantul Otak Otak 500gr', '1000000000437', 0, 0, '', '', 31, NULL, 1, '2022-03-08 01:49:01', NULL, NULL);
INSERT INTO `tblitem` VALUES (439, 1, 1, '9000000000438', 'Sedani PIPA 1KG', '1000000000438', 0, 0, '', '', 32, NULL, 1, '2022-03-08 01:49:01', NULL, NULL);
INSERT INTO `tblitem` VALUES (440, 1, 1, '9000000000439', 'Sedani Kerang 1KG', '1000000000439', 0, 0, '', '', 32, NULL, 1, '2022-03-08 01:49:01', NULL, NULL);
INSERT INTO `tblitem` VALUES (441, 1, 1, '9000000000440', 'Sedani SPIRAL 1KG', '1000000000440', 0, 0, '', '', 32, NULL, 1, '2022-03-08 01:49:01', NULL, NULL);
INSERT INTO `tblitem` VALUES (442, 1, 1, '9000000000441', 'Sedani SPAGHETTI 1KG', '1000000000441', 0, 0, '', '', 32, NULL, 1, '2022-03-08 01:49:01', NULL, NULL);
INSERT INTO `tblitem` VALUES (443, 1, 1, '9000000000442', 'Lafonte Spaghetti 225gr (Kecil)', '1000000000442', 0, 0, '', '', 33, NULL, 1, '2022-03-08 01:49:01', NULL, NULL);
INSERT INTO `tblitem` VALUES (444, 1, 1, '9000000000443', 'Lafonte Spaghetti 450gr', '1000000000443', 0, 0, '', '', 33, NULL, 1, '2022-03-08 01:49:01', NULL, NULL);
INSERT INTO `tblitem` VALUES (445, 1, 1, '9000000000444', 'Lafonte Spaghetti 1kg', '1000000000444', 0, 0, '', '', 33, NULL, 1, '2022-03-08 01:49:01', NULL, NULL);
INSERT INTO `tblitem` VALUES (446, 1, 1, '9000000000445', 'Lafonte Fettucini 750gr', '1000000000445', 0, 0, '', '', 33, NULL, 1, '2022-03-08 01:49:01', NULL, NULL);
INSERT INTO `tblitem` VALUES (447, 1, 1, '9000000000446', 'Lafonte Saus Bolognase 315gr', '1000000000446', 0, 0, '', '', 33, NULL, 1, '2022-03-08 01:49:01', NULL, NULL);
INSERT INTO `tblitem` VALUES (448, 1, 1, '9000000000447', 'King F Rolade Sapi 225gr', '1000000000447', 0, 0, '', '', 34, NULL, 1, '2022-03-08 01:49:01', NULL, NULL);
INSERT INTO `tblitem` VALUES (449, 1, 1, '9000000000448', 'King F Rolade Sapi 1kg', '1000000000448', 0, 0, '', '', 34, NULL, 1, '2022-03-08 01:49:01', NULL, NULL);
INSERT INTO `tblitem` VALUES (450, 1, 1, '9000000000449', 'King F Rolade Ayam 225gr', '1000000000449', 0, 0, '', '', 34, NULL, 1, '2022-03-08 01:49:01', NULL, NULL);
INSERT INTO `tblitem` VALUES (451, 1, 1, '9000000000450', 'King F Rolade Ayam 1kg', '1000000000450', 0, 0, '', '', 34, NULL, 1, '2022-03-08 01:49:01', NULL, NULL);
INSERT INTO `tblitem` VALUES (452, 1, 1, '9000000000451', 'King F Kornet Sapi 1kg', '1000000000451', 0, 0, '', '', 34, NULL, 1, '2022-03-08 01:49:01', NULL, NULL);
INSERT INTO `tblitem` VALUES (453, 1, 1, '9000000000452', 'King F Kornet Ayam 1kg', '1000000000452', 0, 0, '', '', 34, NULL, 1, '2022-03-08 01:49:01', NULL, NULL);
INSERT INTO `tblitem` VALUES (454, 1, 1, '9000000000453', 'King F Kornet Ayam EKO 450gr', '1000000000453', 0, 0, '', '', 34, NULL, 1, '2022-03-08 01:49:01', NULL, NULL);
INSERT INTO `tblitem` VALUES (455, 1, 1, '9000000000454', 'King F Kornet Koin 450gr', '1000000000454', 0, 0, '', '', 34, NULL, 1, '2022-03-08 01:49:01', NULL, NULL);
INSERT INTO `tblitem` VALUES (456, 1, 1, '9000000000455', 'King F Burger ORI 10s 250gr', '1000000000455', 0, 0, '', '', 34, NULL, 1, '2022-03-08 01:49:01', NULL, NULL);
INSERT INTO `tblitem` VALUES (457, 1, 1, '9000000000456', 'King F Burger MINI 20s 280gr', '1000000000456', 0, 0, '', '', 34, NULL, 1, '2022-03-08 01:49:01', NULL, NULL);
INSERT INTO `tblitem` VALUES (458, 1, 1, '9000000000457', 'King F Sosbak Sapi JUMBO 6s 500gr', '1000000000457', 0, 0, '', '', 34, NULL, 1, '2022-03-08 01:49:01', NULL, NULL);
INSERT INTO `tblitem` VALUES (459, 1, 1, '9000000000458', 'King F Sosbak KEJU 500gr 6s', '1000000000458', 0, 0, '', '', 34, NULL, 1, '2022-03-08 01:49:01', NULL, NULL);
INSERT INTO `tblitem` VALUES (460, 1, 1, '9000000000459', 'King F Sosbak LADA HITAM 500gr 6s', '1000000000459', 0, 0, '', '', 34, NULL, 1, '2022-03-08 01:49:01', NULL, NULL);
INSERT INTO `tblitem` VALUES (461, 1, 1, '9000000000460', 'KING F Basis Putih 21s 500gr', '1000000000460', 0, 0, '', '', 34, NULL, 1, '2022-03-08 01:49:01', NULL, NULL);
INSERT INTO `tblitem` VALUES (462, 1, 1, '9000000000461', 'KING F Basis Merah 21s 500gr', '1000000000461', 0, 0, '', '', 34, NULL, 1, '2022-03-08 01:49:01', NULL, NULL);
INSERT INTO `tblitem` VALUES (463, 1, 1, '9000000000462', 'King F Sosis Sapi Hocky 375gr', '1000000000462', 0, 0, '', '', 34, NULL, 1, '2022-03-08 01:49:01', NULL, NULL);
INSERT INTO `tblitem` VALUES (464, 1, 1, '9000000000463', 'King F Sosis Sapi Hocky 500gr', '1000000000463', 0, 0, '', '', 34, NULL, 1, '2022-03-08 01:49:01', NULL, NULL);
INSERT INTO `tblitem` VALUES (465, 1, 1, '9000000000464', 'King F Sosbak Pendekar 10s 500gr', '1000000000464', 0, 0, '', '', 34, NULL, 1, '2022-03-08 01:49:01', NULL, NULL);
INSERT INTO `tblitem` VALUES (466, 1, 1, '9000000000465', 'King F Fries Kentang 500gr', '1000000000465', 0, 0, '', '', 34, NULL, 1, '2022-03-08 01:49:01', NULL, NULL);
INSERT INTO `tblitem` VALUES (467, 1, 1, '9000000000466', 'King F Fries Kentang 1kg', '1000000000466', 0, 0, '', '', 34, NULL, 1, '2022-03-08 01:49:01', NULL, NULL);
INSERT INTO `tblitem` VALUES (468, 1, 1, '9000000000467', 'Kipao Coklat 25s', '1000000000467', 0, 0, '', '', 35, NULL, 1, '2022-03-08 01:49:01', NULL, NULL);
INSERT INTO `tblitem` VALUES (469, 1, 1, '9000000000468', 'Kipao Sapi 25s', '1000000000468', 0, 0, '', '', 35, NULL, 1, '2022-03-08 01:49:01', NULL, NULL);
INSERT INTO `tblitem` VALUES (470, 1, 1, '9000000000469', 'Kipao Strawberry 25s', '1000000000469', 0, 0, '', '', 35, NULL, 1, '2022-03-08 01:49:01', NULL, NULL);
INSERT INTO `tblitem` VALUES (471, 1, 1, '9000000000470', 'Kipao Keju 25s', '1000000000470', 0, 0, '', '', 35, NULL, 1, '2022-03-08 01:49:01', NULL, NULL);
INSERT INTO `tblitem` VALUES (472, 1, 1, '9000000000471', 'Kipao Ayam 25s', '1000000000471', 0, 0, '', '', 35, NULL, 1, '2022-03-08 01:49:01', NULL, NULL);
INSERT INTO `tblitem` VALUES (473, 1, 1, '9000000000472', 'Kipao Kacang Merah 25s', '1000000000472', 0, 0, '', '', 35, NULL, 1, '2022-03-08 01:49:01', NULL, NULL);
INSERT INTO `tblitem` VALUES (474, 1, 1, '9000000000473', 'Kipao Premium Coffe 12s', '1000000000473', 0, 0, '', '', 35, NULL, 1, '2022-03-08 01:49:01', NULL, NULL);
INSERT INTO `tblitem` VALUES (475, 1, 1, '9000000000474', 'Kipao Premium Salted Egg 12s', '1000000000474', 0, 0, '', '', 35, NULL, 1, '2022-03-08 01:49:01', NULL, NULL);
INSERT INTO `tblitem` VALUES (476, 1, 1, '9000000000475', 'Kipao Premium Matcha 12s', '1000000000475', 0, 0, '', '', 35, NULL, 1, '2022-03-08 01:49:01', NULL, NULL);
INSERT INTO `tblitem` VALUES (477, 1, 1, '9000000000476', 'Kipao Premium Huzelnut 12s', '1000000000476', 0, 0, '', '', 35, NULL, 1, '2022-03-08 01:49:01', NULL, NULL);
INSERT INTO `tblitem` VALUES (478, 1, 1, '9000000000477', 'Boss Sosis Ayam 375gr 15s', '1000000000477', 0, 0, '', '', 36, NULL, 1, '2022-03-08 01:49:01', NULL, NULL);
INSERT INTO `tblitem` VALUES (479, 1, 1, '9000000000478', 'Boss Sosis Ayam 1kg 40s', '1000000000478', 0, 0, '', '', 36, NULL, 1, '2022-03-08 01:49:01', NULL, NULL);
INSERT INTO `tblitem` VALUES (480, 1, 1, '9000000000479', 'Boss Baso Sapi 10s 130gr', '1000000000479', 0, 0, '', '', 36, NULL, 1, '2022-03-08 01:49:01', NULL, NULL);
INSERT INTO `tblitem` VALUES (481, 1, 1, '9000000000480', 'Boss Baso Sapi 25s 325gr', '1000000000480', 0, 0, '', '', 36, NULL, 1, '2022-03-08 01:49:01', NULL, NULL);
INSERT INTO `tblitem` VALUES (482, 1, 1, '9000000000481', 'Boss Sosbak Sapi JUMBO 6s 500gr', '1000000000481', 0, 0, '', '', 36, NULL, 1, '2022-03-08 01:49:01', NULL, NULL);
INSERT INTO `tblitem` VALUES (483, 1, 1, '9000000000482', 'Boss Sosbak Sapi MIni 10s 500gr', '1000000000482', 0, 0, '', '', 36, NULL, 1, '2022-03-08 01:49:01', NULL, NULL);
INSERT INTO `tblitem` VALUES (484, 1, 1, '9000000000483', 'Boss Basis Putih 27s 530gr', '1000000000483', 0, 0, '', '', 36, NULL, 1, '2022-03-08 01:49:01', NULL, NULL);
INSERT INTO `tblitem` VALUES (485, 1, 1, '9000000000484', 'Boss Basis Merah 27s 530gr', '1000000000484', 0, 0, '', '', 36, NULL, 1, '2022-03-08 01:49:01', NULL, NULL);
INSERT INTO `tblitem` VALUES (486, 1, 1, '9000000000485', 'Boss Smoke Beef 250gr', '1000000000485', 0, 0, '', '', 36, NULL, 1, '2022-03-08 01:49:01', NULL, NULL);
INSERT INTO `tblitem` VALUES (487, 1, 1, '9000000000486', 'Boss Burger 10s 250gr', '1000000000486', 0, 0, '', '', 36, NULL, 1, '2022-03-08 01:49:01', NULL, NULL);
INSERT INTO `tblitem` VALUES (488, 1, 1, '9000000000487', 'Kibif Bakso Sapi 50s 600gr', '1000000000487', 0, 0, '', '', 37, NULL, 1, '2022-03-08 01:49:01', NULL, NULL);
INSERT INTO `tblitem` VALUES (489, 1, 1, '9000000000488', 'Kibif Smoke Beef 250gr', '1000000000488', 0, 0, '', '', 37, NULL, 1, '2022-03-08 01:49:01', NULL, NULL);
INSERT INTO `tblitem` VALUES (490, 1, 1, '9000000000489', 'Kibif Daging Rendang 1kg', '1000000000489', 0, 0, '', '', 37, NULL, 1, '2022-03-08 01:49:01', NULL, NULL);
INSERT INTO `tblitem` VALUES (491, 1, 1, '9000000000490', 'Kibif Daging Sapi 500gr', '1000000000490', 0, 0, '', '', 37, NULL, 1, '2022-03-08 01:49:01', NULL, NULL);
INSERT INTO `tblitem` VALUES (492, 1, 1, '9000000000491', 'Kibif Yakiniku 250gr', '1000000000491', 0, 0, '', '', 37, NULL, 1, '2022-03-08 01:49:01', NULL, NULL);
INSERT INTO `tblitem` VALUES (493, 1, 1, '9000000000492', 'Pelangi Donut Besar 10s ', '1000000000492', 0, 0, '', '', 38, NULL, 1, '2022-03-08 01:49:01', NULL, NULL);
INSERT INTO `tblitem` VALUES (494, 1, 1, '9000000000493', 'Pelangi Donut MINI 21s', '1000000000493', 0, 0, '', '', 38, NULL, 1, '2022-03-08 01:49:01', NULL, NULL);
INSERT INTO `tblitem` VALUES (495, 1, 1, '9000000000494', 'Pelangi Donat Mini 10s 300gr', '1000000000494', 0, 0, '', '', 38, NULL, 1, '2022-03-08 01:49:01', NULL, NULL);
INSERT INTO `tblitem` VALUES (496, 1, 1, '9000000000495', 'Pelangi Donat UNYIL 30s 300gr', '1000000000495', 0, 0, '', '', 38, NULL, 1, '2022-03-08 01:49:01', NULL, NULL);
INSERT INTO `tblitem` VALUES (497, 1, 1, '9000000000496', 'Pelangi Donat Coklat 12s 300gr', '1000000000496', 0, 0, '', '', 38, NULL, 1, '2022-03-08 01:49:01', NULL, NULL);
INSERT INTO `tblitem` VALUES (498, 1, 1, '9000000000497', 'Pelangi Donat Coklat 24s ', '1000000000497', 0, 0, '', '', 38, NULL, 1, '2022-03-08 01:49:01', NULL, NULL);
INSERT INTO `tblitem` VALUES (499, 1, 1, '9000000000498', 'Pelangi Mipao Pandan 30s', '1000000000498', 0, 0, '', '', 38, NULL, 1, '2022-03-08 01:49:01', NULL, NULL);
INSERT INTO `tblitem` VALUES (500, 1, 1, '9000000000499', 'Pelangi Mipao Coklat 30s', '1000000000499', 0, 0, '', '', 38, NULL, 1, '2022-03-08 01:49:01', NULL, NULL);
INSERT INTO `tblitem` VALUES (501, 1, 1, '9000000000500', 'Pelangi Mipao Vanilla 30s', '1000000000500', 0, 0, '', '', 38, NULL, 1, '2022-03-08 01:49:01', NULL, NULL);
INSERT INTO `tblitem` VALUES (502, 1, 1, '9000000000501', 'Pelangi Mipao Strawberry 30s', '1000000000501', 0, 0, '', '', 38, NULL, 1, '2022-03-08 01:49:01', NULL, NULL);
INSERT INTO `tblitem` VALUES (503, 1, 1, '9000000000502', 'PELANGI Ubi Ungu Besar 10s ', '1000000000502', 0, 0, '', '', 38, NULL, 1, '2022-03-08 01:49:01', NULL, NULL);
INSERT INTO `tblitem` VALUES (504, 1, 1, '9000000000503', 'PELANGI Ubi Ungu MINI 21s ', '1000000000503', 0, 0, '', '', 38, NULL, 1, '2022-03-08 01:49:01', NULL, NULL);
INSERT INTO `tblitem` VALUES (505, 1, 1, '9000000000504', 'PELANGI Ubi Ungu Mini 10s ', '1000000000504', 0, 0, '', '', 38, NULL, 1, '2022-03-08 01:49:01', NULL, NULL);
INSERT INTO `tblitem` VALUES (506, 1, 1, '9000000000505', 'Pelangi Jelly 500gr', '1000000000505', 0, 0, '', '', 38, NULL, 1, '2022-03-08 01:49:01', NULL, NULL);
INSERT INTO `tblitem` VALUES (507, 1, 1, '9000000000506', 'Pelangi Jelly 1kg', '1000000000506', 0, 0, '', '', 38, NULL, 1, '2022-03-08 01:49:01', NULL, NULL);
INSERT INTO `tblitem` VALUES (508, 1, 1, '9000000000507', 'JOLIN PISCOK', '1000000000507', 0, 0, '', '', 39, NULL, 1, '2022-03-08 01:49:01', NULL, NULL);
INSERT INTO `tblitem` VALUES (509, 1, 1, '9000000000508', 'JOLIN PISCOK KEJU', '1000000000508', 0, 0, '', '', 39, NULL, 1, '2022-03-08 01:49:01', NULL, NULL);
INSERT INTO `tblitem` VALUES (510, 1, 1, '9000000000509', 'JOLIN NANGKA COKLAT', '1000000000509', 0, 0, '', '', 39, NULL, 1, '2022-03-08 01:49:01', NULL, NULL);
INSERT INTO `tblitem` VALUES (511, 1, 1, '9000000000510', 'JOLIN NANAS COKLAT', '1000000000510', 0, 0, '', '', 39, NULL, 1, '2022-03-08 01:49:01', NULL, NULL);
INSERT INTO `tblitem` VALUES (512, 1, 1, '9000000000511', 'JOLIN TAPE COKLAT', '1000000000511', 0, 0, '', '', 39, NULL, 1, '2022-03-08 01:49:01', NULL, NULL);
INSERT INTO `tblitem` VALUES (513, 1, 1, '9000000000512', 'CIRENG BREXCELLE', '1000000000512', 0, 0, '', '', 40, NULL, 1, '2022-03-08 01:49:01', NULL, NULL);
INSERT INTO `tblitem` VALUES (514, 1, 1, '9000000000513', 'CIRENG KHARISMA', '1000000000513', 0, 0, '', '', 40, NULL, 1, '2022-03-08 01:49:01', NULL, NULL);
INSERT INTO `tblitem` VALUES (515, 1, 1, '9000000000514', 'CIRENG MERCON AYAM', '1000000000514', 0, 0, '', '', 40, NULL, 1, '2022-03-08 01:49:01', NULL, NULL);
INSERT INTO `tblitem` VALUES (516, 1, 1, '9000000000515', 'CIRENG MERCON BAKSO', '1000000000515', 0, 0, '', '', 40, NULL, 1, '2022-03-08 01:49:01', NULL, NULL);
INSERT INTO `tblitem` VALUES (517, 1, 1, '9000000000516', 'CIRENG MERCON CAKALANG', '1000000000516', 0, 0, '', '', 40, NULL, 1, '2022-03-08 01:49:01', NULL, NULL);
INSERT INTO `tblitem` VALUES (518, 1, 1, '9000000000517', 'BEN\'S TOPPOKI ORI', '1000000000517', 0, 0, '', '', 41, NULL, 1, '2022-03-08 01:49:01', NULL, NULL);
INSERT INTO `tblitem` VALUES (519, 1, 1, '9000000000518', 'BEN\'S RABBOKI', '1000000000518', 0, 0, '', '', 41, NULL, 1, '2022-03-08 01:49:01', NULL, NULL);
INSERT INTO `tblitem` VALUES (520, 1, 1, '9000000000519', 'BEN\'S TOPPOKI MOZARELLA', '1000000000519', 0, 0, '', '', 41, NULL, 1, '2022-03-08 01:49:01', NULL, NULL);
INSERT INTO `tblitem` VALUES (521, 1, 1, '9000000000520', 'BAWANG MERAH GORENG', '1000000000520', 0, 0, '', '', 42, NULL, 1, '2022-03-08 01:49:01', NULL, NULL);
INSERT INTO `tblitem` VALUES (522, 1, 1, '9000000000521', 'WARISAN BASO 50S', '1000000000521', 0, 0, '', '', 43, NULL, 1, '2022-03-08 01:49:01', NULL, NULL);
INSERT INTO `tblitem` VALUES (523, 1, 1, '9000000000522', 'FROZENLAND Shoestring 500gr', '1000000000522', 0, 0, '', '', 44, NULL, 1, '2022-03-08 01:49:01', NULL, NULL);
INSERT INTO `tblitem` VALUES (524, 1, 1, '9000000000523', 'FROZENLAND Shoestring 1KG', '1000000000523', 0, 0, '', '', 44, NULL, 1, '2022-03-08 01:49:01', NULL, NULL);
INSERT INTO `tblitem` VALUES (525, 1, 1, '9000000000524', 'FROZENLAND Straight Cut 500gr', '1000000000524', 0, 0, '', '', 44, NULL, 1, '2022-03-08 01:49:01', NULL, NULL);
INSERT INTO `tblitem` VALUES (526, 1, 1, '9000000000525', 'FROZENLAND Straight Cut 1KG', '1000000000525', 0, 0, '', '', 44, NULL, 1, '2022-03-08 01:49:01', NULL, NULL);
INSERT INTO `tblitem` VALUES (527, 1, 1, '9000000000526', 'FROZENLAND Crincle Cut 500gr', '1000000000526', 0, 0, '', '', 44, NULL, 1, '2022-03-08 01:49:01', NULL, NULL);
INSERT INTO `tblitem` VALUES (528, 1, 1, '9000000000527', 'FROZENLAND Crincle Cut 1kg', '1000000000527', 0, 0, '', '', 44, NULL, 1, '2022-03-08 01:49:01', NULL, NULL);
INSERT INTO `tblitem` VALUES (529, 1, 1, '9000000000528', 'FROZENLAND Batter Coated 500gr', '1000000000528', 0, 0, '', '', 44, NULL, 1, '2022-03-08 01:49:01', NULL, NULL);
INSERT INTO `tblitem` VALUES (530, 1, 1, '9000000000529', 'FROZENLAND Batter Coated 1kg', '1000000000529', 0, 0, '', '', 44, NULL, 1, '2022-03-08 01:49:01', NULL, NULL);
INSERT INTO `tblitem` VALUES (531, 1, 1, '9000000000530', 'FROZENLAND Batter Coated 2,5kg', '1000000000530', 0, 0, '', '', 44, NULL, 1, '2022-03-08 01:49:01', NULL, NULL);
INSERT INTO `tblitem` VALUES (532, 1, 1, '9000000000531', 'FROZENLAND MIX Vege 4ways 1kg', '1000000000531', 0, 0, '', '', 44, NULL, 1, '2022-03-08 01:49:01', NULL, NULL);
INSERT INTO `tblitem` VALUES (533, 1, 1, '9000000000532', 'AVIKO SHOESTRING 2,5KG', '9000000000532', 0, 0, 'AVIKO_SHOESTRING_2,5KG.jpg', '<img src=\"http://localhost/pos_muezza/upload/item/AVIKO_SHOESTRING_2,5KG.jpg\" width=\"150\" height=\"250\" class=\"img-thumbnail\" />', 45, NULL, 1, '2022-03-08 01:49:01', 1, '2022-03-07 20:31:53');
INSERT INTO `tblitem` VALUES (534, 1, 1, '9000000000533', 'FARM FRITES SHOESTRING 2,5KG', '1000000000533', 0, 0, '', '', 46, NULL, 1, '2022-03-08 01:49:01', NULL, NULL);
INSERT INTO `tblitem` VALUES (535, 1, 1, '9000000000534', 'FARM FRITES Straight Cut 2,5KG', '1000000000534', 0, 0, '', '', 46, NULL, 1, '2022-03-08 01:49:01', NULL, NULL);
INSERT INTO `tblitem` VALUES (536, 1, 1, '9000000000535', 'FARM FRITES Crincle CUT 2,5KG', '1000000000535', 0, 0, '', '', 46, NULL, 1, '2022-03-08 01:49:01', NULL, NULL);
INSERT INTO `tblitem` VALUES (537, 1, 1, '9000000000536', 'PERFETTO MOZARELLA 250GR', '1000000000536', 0, 0, '', '', 47, NULL, 1, '2022-03-08 01:49:01', NULL, NULL);
INSERT INTO `tblitem` VALUES (538, 1, 1, '9000000000537', 'SHIFUDO Chikuwa Mini 500gr', '1000000000537', 0, 0, '', '', 48, NULL, 1, '2022-03-08 01:49:01', NULL, NULL);
INSERT INTO `tblitem` VALUES (539, 1, 1, '9000000000538', 'SHIFUDO Chikuwa Mini 1kg', '1000000000538', 0, 0, '', '', 48, NULL, 1, '2022-03-08 01:49:01', NULL, NULL);
INSERT INTO `tblitem` VALUES (540, 1, 1, '9000000000539', 'SHIFUDO Chikuwa Long 500gr', '1000000000539', 0, 0, '', '', 48, NULL, 1, '2022-03-08 01:49:01', NULL, NULL);
INSERT INTO `tblitem` VALUES (541, 1, 1, '9000000000540', 'SHIFUDO Chikuwa Long 1kg', '1000000000540', 0, 0, '', '', 48, NULL, 1, '2022-03-08 01:49:01', NULL, NULL);
INSERT INTO `tblitem` VALUES (542, 1, 1, '9000000000541', 'SHIFUDO Cumi Flower 500gr', '1000000000541', 0, 0, '', '', 48, NULL, 1, '2022-03-08 01:49:01', NULL, NULL);
INSERT INTO `tblitem` VALUES (543, 1, 1, '9000000000542', 'SHIFUDO Bakso Cumi 500gr', '1000000000542', 0, 0, '', '', 48, NULL, 1, '2022-03-08 01:49:01', NULL, NULL);
INSERT INTO `tblitem` VALUES (544, 1, 1, '9000000000543', 'SHIFUDO Bakso Ikan 500GR', '1000000000543', 0, 0, '', '', 48, NULL, 1, '2022-03-08 01:49:01', NULL, NULL);
INSERT INTO `tblitem` VALUES (545, 1, 1, '9000000000544', 'SHIFUDO Bakso Udang 500GR', '1000000000544', 0, 0, '', '', 48, NULL, 1, '2022-03-08 01:49:01', NULL, NULL);
INSERT INTO `tblitem` VALUES (546, 1, 1, '9000000000545', 'SHIFUDO Otak Fish Roll 250GR', '1000000000545', 0, 0, '', '', 48, NULL, 1, '2022-03-08 01:49:01', NULL, NULL);
INSERT INTO `tblitem` VALUES (547, 1, 1, '9000000000546', 'SHIFUDO Otak Kotak 500gr', '1000000000546', 0, 0, '', '', 48, NULL, 1, '2022-03-08 01:49:01', NULL, NULL);
INSERT INTO `tblitem` VALUES (548, 1, 1, '9000000000547', 'Fiesta SFD Ebi Furai 160gr', '1000000000547', 0, 0, '', '', 49, NULL, 1, '2022-03-08 01:49:01', NULL, NULL);
INSERT INTO `tblitem` VALUES (549, 1, 1, '9000000000548', 'Fiesta SFD Dory Stik 200gr', '1000000000548', 0, 0, '', '', 49, NULL, 1, '2022-03-08 01:49:01', NULL, NULL);
INSERT INTO `tblitem` VALUES (550, 1, 1, '9000000000549', 'Fiesta SFD Shrimp Shumai 200gr', '1000000000549', 0, 0, '', '', 49, NULL, 1, '2022-03-08 01:49:01', NULL, NULL);
INSERT INTO `tblitem` VALUES (551, 1, 1, '9000000000550', 'MY TASTE Blackpapper 100GR (Kecil)', '1000000000550', 0, 0, '', '', 50, NULL, 1, '2022-03-08 01:49:01', NULL, NULL);
INSERT INTO `tblitem` VALUES (552, 1, 1, '9000000000551', 'MY TASTE Blackpapper 500GR', '1000000000551', 0, 0, '', '', 50, NULL, 1, '2022-03-08 01:49:01', NULL, NULL);
INSERT INTO `tblitem` VALUES (553, 1, 1, '9000000000552', 'MY TASTE Blackpapper 1kg', '1000000000552', 0, 0, '', '', 50, NULL, 1, '2022-03-08 01:49:01', NULL, NULL);
INSERT INTO `tblitem` VALUES (554, 1, 1, '9000000000553', 'MY TASTE BBQ 100GR (Kecil)', '1000000000553', 0, 0, '', '', 50, NULL, 1, '2022-03-08 01:49:01', NULL, NULL);
INSERT INTO `tblitem` VALUES (555, 1, 1, '9000000000554', 'MY TASTE BBQ 500GR', '1000000000554', 0, 0, '', '', 50, NULL, 1, '2022-03-08 01:49:01', NULL, NULL);
INSERT INTO `tblitem` VALUES (556, 1, 1, '9000000000555', 'MY TASTE BBQ 1kg', '1000000000555', 0, 0, '', '', 50, NULL, 1, '2022-03-08 01:49:01', NULL, NULL);
INSERT INTO `tblitem` VALUES (557, 1, 1, '9000000000556', 'MY TASTE BBQ Spicy LVL 3 500gr', '1000000000556', 0, 0, '', '', 50, NULL, 1, '2022-03-08 01:49:01', NULL, NULL);
INSERT INTO `tblitem` VALUES (558, 1, 1, '9000000000557', 'MY TASTE Mushroom sauce 500gr', '1000000000557', 0, 0, '', '', 50, NULL, 1, '2022-03-08 01:49:01', NULL, NULL);
INSERT INTO `tblitem` VALUES (559, 1, 1, '9000000000558', 'MY TASTE Teriyaki sauce 500gr', '1000000000558', 0, 0, '', '', 50, NULL, 1, '2022-03-08 01:49:01', NULL, NULL);
INSERT INTO `tblitem` VALUES (560, 1, 1, '9000000000559', 'MY TASTE Bolognase sauce 500gr', '1000000000559', 0, 0, '', '', 50, NULL, 1, '2022-03-08 01:49:01', NULL, NULL);
INSERT INTO `tblitem` VALUES (561, 1, 1, '9000000000560', 'MY TASTE Bulgogi sauce 500gr', '1000000000560', 0, 0, '', '', 50, NULL, 1, '2022-03-08 01:49:01', NULL, NULL);
INSERT INTO `tblitem` VALUES (562, 1, 1, '9000000000561', 'MY TASTE Cheese sauce 500gr', '1000000000561', 0, 0, '', '', 50, NULL, 1, '2022-03-08 01:49:01', NULL, NULL);
INSERT INTO `tblitem` VALUES (563, 1, 1, '9000000000562', 'MY TASTE Saus Mayo sauce 500gr', '1000000000562', 0, 0, '', '', 50, NULL, 1, '2022-03-08 01:49:01', NULL, NULL);
INSERT INTO `tblitem` VALUES (564, 1, 1, '9000000000563', 'MY TASTE Chilli Sauce 500GR', '1000000000563', 0, 0, '', '', 50, NULL, 1, '2022-03-08 01:49:01', NULL, NULL);
INSERT INTO `tblitem` VALUES (565, 1, 1, '9000000000564', 'MY TASTE XO SAUCE 175GR', '1000000000564', 0, 0, '', '', 50, NULL, 1, '2022-03-08 01:49:01', NULL, NULL);
INSERT INTO `tblitem` VALUES (566, 1, 1, '9000000000565', 'MY TASTE Fish Sauce 200gr', '1000000000565', 0, 0, '', '', 50, NULL, 1, '2022-03-08 01:49:01', NULL, NULL);
INSERT INTO `tblitem` VALUES (567, 1, 1, '9000000000566', 'MY TASTE Kuah Bakso 8gr', '1000000000566', 0, 0, '', '', 50, NULL, 1, '2022-03-08 01:49:01', NULL, NULL);
INSERT INTO `tblitem` VALUES (568, 1, 1, '9000000000567', 'MY TASTE Jagung Kaleng 410GR', '1000000000567', 0, 0, '', '', 50, NULL, 1, '2022-03-08 01:49:01', NULL, NULL);
INSERT INTO `tblitem` VALUES (569, 1, 1, '9000000000568', 'Belibis Cabe Sachet 9gr', '1000000000568', 0, 0, '', '', 51, NULL, 1, '2022-03-08 01:49:01', NULL, NULL);
INSERT INTO `tblitem` VALUES (570, 1, 1, '9000000000569', 'Belibis Cabe Btl 135ml', '1000000000569', 0, 0, '', '', 51, NULL, 1, '2022-03-08 01:49:01', NULL, NULL);
INSERT INTO `tblitem` VALUES (571, 1, 1, '9000000000570', 'Belibis Cabe Btl 340ml ', '1000000000570', 0, 0, '', '', 51, NULL, 1, '2022-03-08 01:49:01', NULL, NULL);
INSERT INTO `tblitem` VALUES (572, 1, 1, '9000000000571', 'Belibis Cabe Btl Beling 650ml', '1000000000571', 0, 0, '', '', 51, NULL, 1, '2022-03-08 01:49:01', NULL, NULL);
INSERT INTO `tblitem` VALUES (573, 1, 1, '9000000000572', 'Belibis Cabe Btl Dot 535ml', '1000000000572', 0, 0, '', '', 51, NULL, 1, '2022-03-08 01:49:01', NULL, NULL);
INSERT INTO `tblitem` VALUES (574, 1, 1, '9000000000573', 'Belibis Cabe POUCH 1kg', '1000000000573', 0, 0, '', '', 51, NULL, 1, '2022-03-08 01:49:01', NULL, NULL);
INSERT INTO `tblitem` VALUES (575, 1, 1, '9000000000574', 'BelibisValue 1kg Bantal', '1000000000574', 0, 0, '', '', 51, NULL, 1, '2022-03-08 01:49:01', NULL, NULL);
INSERT INTO `tblitem` VALUES (576, 1, 1, '9000000000575', 'Belibis Tomat Sachet 9gr', '1000000000575', 0, 0, '', '', 51, NULL, 1, '2022-03-08 01:49:01', NULL, NULL);
INSERT INTO `tblitem` VALUES (577, 1, 1, '9000000000576', 'Belibis Tomat Btl 135ml', '1000000000576', 0, 0, '', '', 51, NULL, 1, '2022-03-08 01:49:01', NULL, NULL);
INSERT INTO `tblitem` VALUES (578, 1, 1, '9000000000577', 'Belibis Tomat Btl 340ml ', '1000000000577', 0, 0, '', '', 51, NULL, 1, '2022-03-08 01:49:01', NULL, NULL);
INSERT INTO `tblitem` VALUES (579, 1, 1, '9000000000578', 'Belibis Tomat Btl Beling 650ml', '1000000000578', 0, 0, '', '', 51, NULL, 1, '2022-03-08 01:49:01', NULL, NULL);
INSERT INTO `tblitem` VALUES (580, 1, 1, '9000000000579', 'Belibis Tomat POUCH 1kg', '1000000000579', 0, 0, '', '', 51, NULL, 1, '2022-03-08 01:49:01', NULL, NULL);
INSERT INTO `tblitem` VALUES (581, 1, 1, '9000000000580', 'Mc Lewis Sambal Value 1kg', '1000000000580', 0, 0, '', '', 52, NULL, 1, '2022-03-08 01:49:01', NULL, NULL);
INSERT INTO `tblitem` VALUES (582, 1, 1, '9000000000581', 'Mc Lewis Tomat Value 1kg ', '1000000000581', 0, 0, '', '', 52, NULL, 1, '2022-03-08 01:49:01', NULL, NULL);
INSERT INTO `tblitem` VALUES (583, 1, 1, '9000000000582', 'Mc Lewis Sweet Mayo 1kg', '1000000000582', 0, 0, '', '', 52, NULL, 1, '2022-03-08 01:49:01', NULL, NULL);
INSERT INTO `tblitem` VALUES (584, 1, 1, '9000000000583', 'Mc Lewis ORIGINAL Mayo 1kg', '1000000000583', 0, 0, '', '', 52, NULL, 1, '2022-03-08 01:49:01', NULL, NULL);
INSERT INTO `tblitem` VALUES (585, 1, 1, '9000000000584', 'Mc Lewis Thousand Island 1kg', '1000000000584', 0, 0, '', '', 52, NULL, 1, '2022-03-08 01:49:01', NULL, NULL);
INSERT INTO `tblitem` VALUES (586, 1, 1, '9000000000585', 'Mc Lewis BBQ Sauce 1kg', '1000000000585', 0, 0, '', '', 52, NULL, 1, '2022-03-08 01:49:01', NULL, NULL);
INSERT INTO `tblitem` VALUES (587, 1, 1, '9000000000586', 'Mc Lewis BPP 310gr', '1000000000586', 0, 0, '', '', 52, NULL, 1, '2022-03-08 01:49:01', NULL, NULL);
INSERT INTO `tblitem` VALUES (588, 1, 1, '9000000000587', 'Mc Lewis Bolognase Sauce 1kg', '1000000000587', 0, 0, '', '', 52, NULL, 1, '2022-03-08 01:49:01', NULL, NULL);
INSERT INTO `tblitem` VALUES (589, 1, 1, '9000000000588', 'Mc Lewis Cheese Sauce 1kg ', '1000000000588', 0, 0, '', '', 52, NULL, 1, '2022-03-08 01:49:01', NULL, NULL);
INSERT INTO `tblitem` VALUES (590, 1, 1, '9000000000589', 'Mc Lewis Cheese Sauce 250gr', '1000000000589', 0, 0, '', '', 52, NULL, 1, '2022-03-08 01:49:01', NULL, NULL);
INSERT INTO `tblitem` VALUES (591, 1, 1, '9000000000590', 'Kimbo Mini Original 10s 500gr', '1000000000590', 0, 0, '', '', 53, NULL, 1, '2022-03-08 01:49:01', NULL, NULL);
INSERT INTO `tblitem` VALUES (592, 1, 1, '9000000000591', 'Kimbo JUMBO Original 6s 500gr', '1000000000591', 0, 0, '', '', 53, NULL, 1, '2022-03-08 01:49:01', NULL, NULL);
INSERT INTO `tblitem` VALUES (593, 1, 1, '9000000000592', 'Kimbo Mini Keju 10s 500gr', '1000000000592', 0, 0, '', '', 53, NULL, 1, '2022-03-08 01:49:01', NULL, NULL);
INSERT INTO `tblitem` VALUES (594, 1, 1, '9000000000593', 'Kimbo JUMBO Keju 6s 500gr', '1000000000593', 0, 0, '', '', 53, NULL, 1, '2022-03-08 01:49:01', NULL, NULL);
INSERT INTO `tblitem` VALUES (595, 1, 1, '9000000000594', 'Kimbo Mini Lada Hitam 10s 500gr', '1000000000594', 0, 0, '', '', 53, NULL, 1, '2022-03-08 01:49:01', NULL, NULL);
INSERT INTO `tblitem` VALUES (596, 1, 1, '9000000000595', 'Kimbo JUMBO Lada Hitam 6s 500gr', '1000000000595', 0, 0, '', '', 53, NULL, 1, '2022-03-08 01:49:01', NULL, NULL);
INSERT INTO `tblitem` VALUES (597, 1, 1, '9000000000596', 'Kimbo Sosis Cocktail 450gr', '1000000000596', 0, 0, '', '', 53, NULL, 1, '2022-03-08 01:49:01', NULL, NULL);
INSERT INTO `tblitem` VALUES (598, 1, 1, '9000000000597', 'Vigo Sosbak Sapi 12s 500gr', '1000000000597', 0, 0, '', '', 54, NULL, 1, '2022-03-08 01:49:01', NULL, NULL);
INSERT INTO `tblitem` VALUES (599, 1, 1, '9000000000598', 'Vigo Sosis Sapi Merah 15s 345gr', '1000000000598', 0, 0, '', '', 54, NULL, 1, '2022-03-08 01:49:01', NULL, NULL);
INSERT INTO `tblitem` VALUES (600, 1, 1, '9000000000599', 'Vigo Sosis Sapi 30s 690gr', '1000000000599', 0, 0, '', '', 54, NULL, 1, '2022-03-08 01:49:01', NULL, NULL);
INSERT INTO `tblitem` VALUES (601, 1, 1, '9000000000600', 'Vigo Kornet 450gr', '1000000000600', 0, 0, '', '', 54, NULL, 1, '2022-03-08 01:49:01', NULL, NULL);
INSERT INTO `tblitem` VALUES (602, 1, 1, '9000000000601', 'Kanzler Bockwurst 360gr', '1000000000601', 0, 0, '', '', 55, NULL, 1, '2022-03-08 01:49:01', NULL, NULL);
INSERT INTO `tblitem` VALUES (603, 1, 1, '9000000000602', 'Kanzler Cheese Frank 360gr ', '1000000000602', 0, 0, '', '', 55, NULL, 1, '2022-03-08 01:49:01', NULL, NULL);
INSERT INTO `tblitem` VALUES (604, 1, 1, '9000000000603', 'Kanzler Garlic Frank 300gr', '1000000000603', 0, 0, '', '', 55, NULL, 1, '2022-03-08 01:49:01', NULL, NULL);
INSERT INTO `tblitem` VALUES (605, 1, 1, '9000000000604', 'Kanzler BPP Frank 300gr', '1000000000604', 0, 0, '', '', 55, NULL, 1, '2022-03-08 01:49:01', NULL, NULL);
INSERT INTO `tblitem` VALUES (606, 1, 1, '9000000000605', 'Kanzler Cheese Cocktail 500gr', '1000000000605', 0, 0, '', '', 55, NULL, 1, '2022-03-08 01:49:01', NULL, NULL);
INSERT INTO `tblitem` VALUES (607, 1, 1, '9000000000606', 'Kanzler Beef Cocktail 500gr', '1000000000606', 0, 0, '', '', 55, NULL, 1, '2022-03-08 01:49:01', NULL, NULL);
INSERT INTO `tblitem` VALUES (608, 1, 1, '9000000000607', 'Kanzler Beef Cocktail 250gr', '1000000000607', 0, 0, '', '', 55, NULL, 1, '2022-03-08 01:49:01', NULL, NULL);
INSERT INTO `tblitem` VALUES (609, 1, 1, '9000000000608', 'Kanzler Beef Wiener 500gr', '1000000000608', 0, 0, '', '', 55, NULL, 1, '2022-03-08 01:49:01', NULL, NULL);
INSERT INTO `tblitem` VALUES (610, 1, 1, '9000000000609', 'Kanzler Beef Bratwurst 360gr ', '1000000000609', 0, 0, '', '', 55, NULL, 1, '2022-03-08 01:49:01', NULL, NULL);
INSERT INTO `tblitem` VALUES (611, 1, 1, '9000000000610', 'Kanzler Crispy Nugget 450gr', '1000000000610', 0, 0, '', '', 55, NULL, 1, '2022-03-08 01:49:01', NULL, NULL);
INSERT INTO `tblitem` VALUES (612, 1, 1, '9000000000611', 'Kanzler Nugget Premium 450gr', '1000000000611', 0, 0, '', '', 55, NULL, 1, '2022-03-08 01:49:01', NULL, NULL);
INSERT INTO `tblitem` VALUES (613, 1, 1, '9000000000612', 'Kanzler Singles 1s ', '1000000000612', 0, 0, '', '', 55, NULL, 1, '2022-03-08 01:49:01', NULL, NULL);
INSERT INTO `tblitem` VALUES (614, 1, 1, '9000000000613', 'Kanzler Cheese Bratwurst 360gr', '1000000000613', 0, 0, '', '', 55, NULL, 1, '2022-03-08 01:49:01', NULL, NULL);
INSERT INTO `tblitem` VALUES (615, 1, 1, '9000000000614', 'Kanzler Chicken BW Coarse 360gr', '1000000000614', 0, 0, '', '', 55, NULL, 1, '2022-03-08 01:49:01', NULL, NULL);
INSERT INTO `tblitem` VALUES (616, 1, 1, '9000000000615', 'Kanzler Beef Cocktail 1KG', '1000000000615', 0, 0, '', '', 55, NULL, 1, '2022-03-08 01:49:01', NULL, NULL);
INSERT INTO `tblitem` VALUES (617, 1, 1, '9000000000616', 'Kanzler Frank Cocktail 1kg', '1000000000616', 0, 0, '', '', 55, NULL, 1, '2022-03-08 01:49:01', NULL, NULL);
INSERT INTO `tblitem` VALUES (618, 1, 1, '9000000000617', 'Kanzler Cheese Cocktail 1kg', '1000000000617', 0, 0, '', '', 55, NULL, 1, '2022-03-08 01:49:01', NULL, NULL);
INSERT INTO `tblitem` VALUES (619, 1, 1, '9000000000618', 'Kanzler Bockwurst 1kg 14s', '1000000000618', 0, 0, '', '', 55, NULL, 1, '2022-03-08 01:49:01', NULL, NULL);
INSERT INTO `tblitem` VALUES (620, 1, 1, '9000000000619', 'Kanzler Smoke Beef 250gr', '1000000000619', 0, 0, '', '', 55, NULL, 1, '2022-03-08 01:49:01', NULL, NULL);
INSERT INTO `tblitem` VALUES (621, 1, 1, '9000000000620', 'JURAGAN Sosbak ORI Jumbo 6s 500gr', '1000000000620', 0, 0, '', '', 56, NULL, 1, '2022-03-08 01:49:01', NULL, NULL);
INSERT INTO `tblitem` VALUES (622, 1, 1, '9000000000621', 'JURAGAN Sosbak MINI 10s 500gr', '1000000000621', 0, 0, '', '', 56, NULL, 1, '2022-03-08 01:49:01', NULL, NULL);
INSERT INTO `tblitem` VALUES (623, 1, 1, '9000000000622', 'JURAGAN Sosbak ORI Jumbo 12s 1kg', '1000000000622', 0, 0, '', '', 56, NULL, 1, '2022-03-08 01:49:01', NULL, NULL);
INSERT INTO `tblitem` VALUES (624, 1, 1, '9000000000623', 'JURAGAN Sosbak MINI 20s 1kg', '1000000000623', 0, 0, '', '', 56, NULL, 1, '2022-03-08 01:49:01', NULL, NULL);
INSERT INTO `tblitem` VALUES (625, 1, 1, '9000000000624', 'EURO Sambal 1kg', '1000000000624', 0, 0, '', '', 57, NULL, 1, '2022-03-08 01:49:01', NULL, NULL);
INSERT INTO `tblitem` VALUES (626, 1, 1, '9000000000625', 'EURO Tomat 1kg', '1000000000625', 0, 0, '', '', 57, NULL, 1, '2022-03-08 01:49:01', NULL, NULL);
INSERT INTO `tblitem` VALUES (627, 1, 1, '9000000000626', 'EURO Sambal Extra Pedas 1kg', '1000000000626', 0, 0, '', '', 57, NULL, 1, '2022-03-08 01:49:01', NULL, NULL);
INSERT INTO `tblitem` VALUES (628, 1, 1, '9000000000627', 'EURO BBQ 500GR', '1000000000627', 0, 0, '', '', 57, NULL, 1, '2022-03-08 01:49:01', NULL, NULL);
INSERT INTO `tblitem` VALUES (629, 1, 1, '9000000000628', 'EURO Saus Keju 500gr', '1000000000628', 0, 0, '', '', 57, NULL, 1, '2022-03-08 01:49:01', NULL, NULL);
INSERT INTO `tblitem` VALUES (630, 1, 1, '9000000000629', 'EURO Mayonaise ORI 1kg', '1000000000629', 0, 0, '', '', 57, NULL, 1, '2022-03-08 01:49:01', NULL, NULL);
INSERT INTO `tblitem` VALUES (631, 1, 1, '9000000000630', 'EURO Mayonaise BTL 290ML', '1000000000630', 0, 0, '', '', 57, NULL, 1, '2022-03-08 01:49:01', NULL, NULL);
INSERT INTO `tblitem` VALUES (632, 1, 1, '9000000000631', 'EURO Mayonaise PEDAS 290ML', '1000000000631', 0, 0, '', '', 57, NULL, 1, '2022-03-08 01:49:01', NULL, NULL);
INSERT INTO `tblitem` VALUES (633, 1, 1, '9000000000632', 'EURO Mayonaise Thousand Island 290ML', '1000000000632', 0, 0, '', '', 57, NULL, 1, '2022-03-08 01:49:01', NULL, NULL);
INSERT INTO `tblitem` VALUES (634, 1, 1, '9000000000633', 'EURO Sambal SCHT 9gr', '1000000000633', 0, 0, '', '', 57, NULL, 1, '2022-03-08 01:49:01', NULL, NULL);
INSERT INTO `tblitem` VALUES (635, 1, 1, '9000000000634', 'EURO Tomat SCHT 9gr', '1000000000634', 0, 0, '', '', 57, NULL, 1, '2022-03-08 01:49:01', NULL, NULL);
INSERT INTO `tblitem` VALUES (636, 1, 1, '9000000000635', 'Best Chicken Sosis Ayam 1kg', '1000000000635', 0, 0, '', '', 58, NULL, 1, '2022-03-08 01:49:01', NULL, NULL);
INSERT INTO `tblitem` VALUES (637, 1, 1, '9000000000636', 'Dosuka Spicy Wing 500gr ', '1000000000636', 0, 0, '', '', 59, NULL, 1, '2022-03-08 01:49:01', NULL, NULL);
INSERT INTO `tblitem` VALUES (638, 1, 1, '9000000000637', 'Dosuka Sosis Ayam 375gr', '1000000000637', 0, 0, '', '', 59, NULL, 1, '2022-03-08 01:49:01', NULL, NULL);
INSERT INTO `tblitem` VALUES (639, 1, 1, '9000000000638', 'Dosuka Scallop 500gr ', '1000000000638', 0, 0, '', '', 59, NULL, 1, '2022-03-08 01:49:01', NULL, NULL);
INSERT INTO `tblitem` VALUES (640, 1, 1, '9000000000639', 'Dosuka Bakso 500gr', '1000000000639', 0, 0, '', '', 59, NULL, 1, '2022-03-08 01:49:01', NULL, NULL);
INSERT INTO `tblitem` VALUES (641, 1, 1, '9000000000640', 'Dosuka Nugget 250gr', '1000000000640', 0, 0, '', '', 59, NULL, 1, '2022-03-08 01:49:01', NULL, NULL);
INSERT INTO `tblitem` VALUES (642, 1, 1, '9000000000641', 'Dosuka Spicy Chick 500gr', '1000000000641', 0, 0, '', '', 59, NULL, 1, '2022-03-08 01:49:01', NULL, NULL);
INSERT INTO `tblitem` VALUES (643, 1, 1, '9000000000642', 'Dosuka Crispy Burger 235gr ', '1000000000642', 0, 0, '', '', 59, NULL, 1, '2022-03-08 01:49:01', NULL, NULL);
INSERT INTO `tblitem` VALUES (644, 1, 1, '9000000000643', 'Bon Bon Sosis Coklat 50s 1kg', '1000000000643', 0, 0, '', '', 60, NULL, 1, '2022-03-08 01:49:01', NULL, NULL);
INSERT INTO `tblitem` VALUES (645, 1, 1, '9000000000644', 'Bon Bon Sosis Coklat 25s 500gr', '1000000000644', 0, 0, '', '', 60, NULL, 1, '2022-03-08 01:49:01', NULL, NULL);
INSERT INTO `tblitem` VALUES (646, 1, 1, '9000000000645', 'Bon Bon Sosis Coklat 15cm 1kg', '1000000000645', 0, 0, '', '', 60, NULL, 1, '2022-03-08 01:49:01', NULL, NULL);
INSERT INTO `tblitem` VALUES (647, 1, 1, '9000000000646', 'Bon Bon Sosis Merah 50s 1kg', '1000000000646', 0, 0, '', '', 60, NULL, 1, '2022-03-08 01:49:01', NULL, NULL);
INSERT INTO `tblitem` VALUES (648, 1, 1, '9000000000647', 'Bon Bon Sosis Merah 25s 500gr', '1000000000647', 0, 0, '', '', 60, NULL, 1, '2022-03-08 01:49:01', NULL, NULL);
INSERT INTO `tblitem` VALUES (649, 1, 1, '9000000000648', 'Yomas Rolade Sapi 250gr ', '1000000000648', 0, 0, '', '', 61, NULL, 1, '2022-03-08 01:49:01', NULL, NULL);
INSERT INTO `tblitem` VALUES (650, 1, 1, '9000000000649', 'Yomas Rolade Sapi 500gr ', '1000000000649', 0, 0, '', '', 61, NULL, 1, '2022-03-08 01:49:01', NULL, NULL);
INSERT INTO `tblitem` VALUES (651, 1, 1, '9000000000650', 'Yomas Sosbak Sapi Jumbo Ori 6s 500gr', '1000000000650', 0, 0, '', '', 61, NULL, 1, '2022-03-08 01:49:01', NULL, NULL);
INSERT INTO `tblitem` VALUES (652, 1, 1, '9000000000651', 'Yomas Sosbak Sapi Mini Ori 12s 500gr', '1000000000651', 0, 0, '', '', 61, NULL, 1, '2022-03-08 01:49:01', NULL, NULL);
INSERT INTO `tblitem` VALUES (653, 1, 1, '9000000000652', 'Yomas Kornet Ayam 1kg ', '1000000000652', 0, 0, '', '', 61, NULL, 1, '2022-03-08 01:49:01', NULL, NULL);
INSERT INTO `tblitem` VALUES (654, 1, 1, '9000000000653', 'Yomas Kornet Ayam Kotak 500gr', '1000000000653', 0, 0, '', '', 61, NULL, 1, '2022-03-08 01:49:01', NULL, NULL);
INSERT INTO `tblitem` VALUES (655, 1, 1, '9000000000654', 'Yomas Saikoro 250gr', '1000000000654', 0, 0, '', '', 61, NULL, 1, '2022-03-08 01:49:01', NULL, NULL);
INSERT INTO `tblitem` VALUES (656, 1, 1, '9000000000655', 'Yomas Beef Steak 250gr ', '1000000000655', 0, 0, '', '', 61, NULL, 1, '2022-03-08 01:49:01', NULL, NULL);
INSERT INTO `tblitem` VALUES (657, 1, 1, '9000000000656', 'Yomas Cocktail 500gr', '1000000000656', 0, 0, '', '', 61, NULL, 1, '2022-03-08 01:49:01', NULL, NULL);
INSERT INTO `tblitem` VALUES (658, 1, 1, '9000000000657', 'ESSEM BASIS PUTIH 25S', '1000000000657', 0, 0, '', '', 62, NULL, 1, '2022-03-08 01:49:01', NULL, NULL);
INSERT INTO `tblitem` VALUES (659, 1, 1, '9000000000658', 'ESSEM BASIS MERAH 25S', '1000000000658', 0, 0, '', '', 62, NULL, 1, '2022-03-08 01:49:01', NULL, NULL);
INSERT INTO `tblitem` VALUES (660, 1, 1, '9000000000659', 'ESSEM BASO POLOS TM 50S ', '1000000000659', 0, 0, '', '', 62, NULL, 1, '2022-03-08 01:49:01', NULL, NULL);
INSERT INTO `tblitem` VALUES (661, 1, 1, '9000000000660', 'ESSEM BASO BIRU TM 50S', '1000000000660', 0, 0, '', '', 62, NULL, 1, '2022-03-08 01:49:01', NULL, NULL);
INSERT INTO `tblitem` VALUES (662, 1, 1, '9000000000661', 'Sunnygold Nugget 500gr ', '1000000000661', 0, 0, '', '', 63, NULL, 1, '2022-03-08 01:49:01', NULL, NULL);
INSERT INTO `tblitem` VALUES (663, 1, 1, '9000000000662', 'Sunnygold Stik 500gr ', '1000000000662', 0, 0, '', '', 63, NULL, 1, '2022-03-08 01:49:01', NULL, NULL);
INSERT INTO `tblitem` VALUES (664, 1, 1, '9000000000663', 'Sunnygold Karage 500gr', '1000000000663', 0, 0, '', '', 63, NULL, 1, '2022-03-08 01:49:01', NULL, NULL);
INSERT INTO `tblitem` VALUES (665, 1, 1, '9000000000664', 'Sunnygold Tempura 500gr', '1000000000664', 0, 0, '', '', 63, NULL, 1, '2022-03-08 01:49:01', NULL, NULL);
INSERT INTO `tblitem` VALUES (666, 1, 1, '9000000000665', 'Sunnygold Spicy Wing 500gr', '1000000000665', 0, 0, '', '', 63, NULL, 1, '2022-03-08 01:49:01', NULL, NULL);
INSERT INTO `tblitem` VALUES (667, 1, 1, '9000000000666', 'Sunnygold Sosis Ayam 400gr ', '1000000000666', 0, 0, '', '', 63, NULL, 1, '2022-03-08 01:49:01', NULL, NULL);
INSERT INTO `tblitem` VALUES (668, 1, 1, '9000000000667', 'Sunnygold Crispy Crunch 500gr ', '1000000000667', 0, 0, '', '', 63, NULL, 1, '2022-03-08 01:49:01', NULL, NULL);
INSERT INTO `tblitem` VALUES (669, 1, 1, '9000000000668', 'Cikiwiki Nugget Ori 250gr', '1000000000668', 0, 0, '', '', 64, NULL, 1, '2022-03-08 01:49:01', NULL, NULL);
INSERT INTO `tblitem` VALUES (670, 1, 1, '9000000000669', 'Cikiwiki Nugget Dino 250gr', '1000000000669', 0, 0, '', '', 64, NULL, 1, '2022-03-08 01:49:01', NULL, NULL);
INSERT INTO `tblitem` VALUES (671, 1, 1, '9000000000670', 'Cikiwiki Sosis Ayam 375gr ', '1000000000670', 0, 0, '', '', 64, NULL, 1, '2022-03-08 01:49:01', NULL, NULL);
INSERT INTO `tblitem` VALUES (672, 1, 1, '9000000000671', 'Geboooy Basis 999 Merah ', '1000000000671', 0, 0, '', '', 65, NULL, 1, '2022-03-08 01:49:01', NULL, NULL);
INSERT INTO `tblitem` VALUES (673, 1, 1, '9000000000672', 'Geboooy Basis 999 PUTIH', '1000000000672', 0, 0, '', '', 65, NULL, 1, '2022-03-08 01:49:01', NULL, NULL);
INSERT INTO `tblitem` VALUES (674, 1, 1, '9000000000673', 'Geboooyku Sosis Ayam 1kg', '1000000000673', 0, 0, '', '', 65, NULL, 1, '2022-03-08 01:49:01', NULL, NULL);
INSERT INTO `tblitem` VALUES (675, 1, 1, '9000000000674', 'Geboooyku Sosis Ayam 730gr Merah', '1000000000674', 0, 0, '', '', 65, NULL, 1, '2022-03-08 01:49:01', NULL, NULL);

-- ----------------------------
-- Table structure for tblitem_bundling
-- ----------------------------
DROP TABLE IF EXISTS `tblitem_bundling`;
CREATE TABLE `tblitem_bundling`  (
  `item_bundling_id` int NOT NULL AUTO_INCREMENT,
  `branch_id` int NOT NULL,
  `bundling_code` varchar(12) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `bundling_name` varchar(1000) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `start_period` date NOT NULL,
  `end_period` date NOT NULL,
  `information` varchar(2000) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `status` int NOT NULL,
  `creator_id` int NULL DEFAULT NULL,
  `created_date` datetime NULL DEFAULT NULL,
  `modificator_id` int NULL DEFAULT NULL,
  `modified_date` datetime NULL DEFAULT NULL,
  PRIMARY KEY (`item_bundling_id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 11 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tblitem_bundling
-- ----------------------------

-- ----------------------------
-- Table structure for tblitem_bundling_prize
-- ----------------------------
DROP TABLE IF EXISTS `tblitem_bundling_prize`;
CREATE TABLE `tblitem_bundling_prize`  (
  `item_bundling_prize_id` int NOT NULL AUTO_INCREMENT,
  `item_bundling_id` int NOT NULL,
  `remark` varchar(5) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `item_id` int NOT NULL,
  `qty` int NOT NULL,
  `disc_percentage` decimal(5, 2) NOT NULL,
  `disc_amount` decimal(18, 2) NOT NULL,
  `fix_price` decimal(18, 2) NOT NULL,
  `creator_id` int NULL DEFAULT NULL,
  `created_date` datetime NULL DEFAULT NULL,
  `modificator_id` int NULL DEFAULT NULL,
  `modified_date` datetime NULL DEFAULT NULL,
  PRIMARY KEY (`item_bundling_prize_id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 5 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tblitem_bundling_prize
-- ----------------------------

-- ----------------------------
-- Table structure for tblitem_bundling_promo
-- ----------------------------
DROP TABLE IF EXISTS `tblitem_bundling_promo`;
CREATE TABLE `tblitem_bundling_promo`  (
  `item_bundling_promo_id` int NOT NULL AUTO_INCREMENT,
  `item_bundling_id` int NOT NULL,
  `remark` varchar(5) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `item_id` int NOT NULL,
  `qty` int NOT NULL,
  `creator_id` int NULL DEFAULT NULL,
  `created_date` datetime NULL DEFAULT NULL,
  `modificator_id` int NULL DEFAULT NULL,
  `modified_date` datetime NULL DEFAULT NULL,
  PRIMARY KEY (`item_bundling_promo_id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 13 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tblitem_bundling_promo
-- ----------------------------

-- ----------------------------
-- Table structure for tblitem_price
-- ----------------------------
DROP TABLE IF EXISTS `tblitem_price`;
CREATE TABLE `tblitem_price`  (
  `item_price_id` int NOT NULL AUTO_INCREMENT,
  `branch_id` int NOT NULL,
  `item_id` int NOT NULL,
  `start_period` date NULL DEFAULT NULL,
  `buying_price` decimal(18, 0) NOT NULL,
  `selling_price` decimal(18, 0) NOT NULL,
  `creator_id` int NULL DEFAULT NULL,
  `created_date` datetime NULL DEFAULT NULL,
  `modificator_id` int NULL DEFAULT NULL,
  `modified_date` datetime NULL DEFAULT NULL,
  PRIMARY KEY (`item_price_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 676 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tblitem_price
-- ----------------------------
INSERT INTO `tblitem_price` VALUES (1, 11, 1, '2022-02-21', 32850, 36500, 1, '2020-05-15 23:09:39', NULL, NULL);
INSERT INTO `tblitem_price` VALUES (2, 11, 2, '2022-02-21', 32400, 36000, 1, '2020-05-15 23:09:39', NULL, NULL);
INSERT INTO `tblitem_price` VALUES (3, 11, 3, '2022-02-21', 30420, 33800, 1, '2020-05-15 23:09:39', NULL, NULL);
INSERT INTO `tblitem_price` VALUES (4, 11, 4, '2022-02-21', 30420, 33800, 1, '2020-05-15 23:09:39', NULL, NULL);
INSERT INTO `tblitem_price` VALUES (5, 11, 5, '2022-02-21', 28080, 31200, 1, '2020-05-15 23:09:39', NULL, NULL);
INSERT INTO `tblitem_price` VALUES (6, 11, 6, '2022-02-21', 27630, 30700, 1, '2020-05-15 23:09:39', NULL, NULL);
INSERT INTO `tblitem_price` VALUES (7, 11, 7, '2022-02-21', 28080, 31200, 1, '2020-05-15 23:09:39', NULL, NULL);
INSERT INTO `tblitem_price` VALUES (8, 11, 8, '2022-02-21', 29520, 32800, 1, '2020-05-15 23:09:39', NULL, NULL);
INSERT INTO `tblitem_price` VALUES (9, 11, 9, '2022-02-21', 12330, 13700, 1, '2020-05-15 23:09:39', NULL, NULL);
INSERT INTO `tblitem_price` VALUES (10, 11, 10, '2022-02-21', 7290, 8100, 1, '2020-05-15 23:09:39', NULL, NULL);
INSERT INTO `tblitem_price` VALUES (11, 11, 11, '2022-02-21', 13140, 14600, 1, '2020-05-15 23:09:39', NULL, NULL);
INSERT INTO `tblitem_price` VALUES (12, 11, 12, '2022-02-21', 26190, 29100, 1, '2020-05-15 23:09:39', NULL, NULL);
INSERT INTO `tblitem_price` VALUES (13, 11, 13, '2022-02-21', 10080, 11200, 1, '2020-05-15 23:09:39', NULL, NULL);
INSERT INTO `tblitem_price` VALUES (14, 11, 14, '2022-02-21', 26460, 29400, 1, '2020-05-15 23:09:39', NULL, NULL);
INSERT INTO `tblitem_price` VALUES (15, 11, 15, '2022-02-21', 26370, 29300, 1, '2020-05-15 23:09:39', NULL, NULL);
INSERT INTO `tblitem_price` VALUES (16, 11, 16, '2022-02-21', 9810, 10900, 1, '2020-05-15 23:09:39', NULL, NULL);
INSERT INTO `tblitem_price` VALUES (17, 11, 17, '2022-02-21', 25380, 28200, 1, '2020-05-15 23:09:39', NULL, NULL);
INSERT INTO `tblitem_price` VALUES (18, 11, 18, '2022-02-21', 25560, 28400, 1, '2020-05-15 23:09:39', NULL, NULL);
INSERT INTO `tblitem_price` VALUES (19, 11, 19, '2022-02-21', 6390, 7100, 1, '2020-05-15 23:09:39', NULL, NULL);
INSERT INTO `tblitem_price` VALUES (20, 11, 20, '2022-02-21', 7200, 8000, 1, '2020-05-15 23:09:39', NULL, NULL);
INSERT INTO `tblitem_price` VALUES (21, 11, 21, '2022-02-21', 11790, 13100, 1, '2020-05-15 23:09:39', NULL, NULL);
INSERT INTO `tblitem_price` VALUES (22, 11, 22, '2022-02-21', 11790, 13100, 1, '2020-05-15 23:09:39', NULL, NULL);
INSERT INTO `tblitem_price` VALUES (23, 11, 23, '2022-02-21', 26190, 29100, 1, '2020-05-15 23:09:39', NULL, NULL);
INSERT INTO `tblitem_price` VALUES (24, 11, 24, '2022-02-21', 13140, 14600, 1, '2020-05-15 23:09:39', NULL, NULL);
INSERT INTO `tblitem_price` VALUES (25, 11, 25, '2022-02-21', 13230, 14700, 1, '2020-05-15 23:09:39', NULL, NULL);
INSERT INTO `tblitem_price` VALUES (26, 11, 26, '2022-02-21', 12780, 14200, 1, '2020-05-15 23:09:39', NULL, NULL);
INSERT INTO `tblitem_price` VALUES (27, 11, 27, '2022-02-21', 25110, 27900, 1, '2020-05-15 23:09:39', NULL, NULL);
INSERT INTO `tblitem_price` VALUES (28, 11, 28, '2022-02-21', 25110, 27900, 1, '2020-05-15 23:09:39', NULL, NULL);
INSERT INTO `tblitem_price` VALUES (29, 11, 29, '2022-02-21', 21690, 24100, 1, '2020-05-15 23:09:39', NULL, NULL);
INSERT INTO `tblitem_price` VALUES (30, 11, 30, '2022-02-21', 43020, 47800, 1, '2020-05-15 23:09:39', NULL, NULL);
INSERT INTO `tblitem_price` VALUES (31, 11, 31, '2022-02-21', 28530, 31700, 1, '2020-05-15 23:09:39', NULL, NULL);
INSERT INTO `tblitem_price` VALUES (32, 11, 32, '2022-02-21', 56610, 62900, 1, '2020-05-15 23:09:39', NULL, NULL);
INSERT INTO `tblitem_price` VALUES (33, 11, 33, '2022-02-21', 22680, 25200, 1, '2020-05-15 23:09:39', NULL, NULL);
INSERT INTO `tblitem_price` VALUES (34, 11, 34, '2022-02-21', 39600, 44000, 1, '2020-05-15 23:09:39', NULL, NULL);
INSERT INTO `tblitem_price` VALUES (35, 11, 35, '2022-02-21', 25650, 28500, 1, '2020-05-15 23:09:39', NULL, NULL);
INSERT INTO `tblitem_price` VALUES (36, 11, 36, '2022-02-21', 28710, 31900, 1, '2020-05-15 23:09:39', NULL, NULL);
INSERT INTO `tblitem_price` VALUES (37, 11, 37, '2022-02-21', 3510, 3900, 1, '2020-05-15 23:09:39', NULL, NULL);
INSERT INTO `tblitem_price` VALUES (38, 11, 38, '2022-02-21', 7110, 7900, 1, '2020-05-15 23:09:39', NULL, NULL);
INSERT INTO `tblitem_price` VALUES (39, 11, 39, '2022-02-21', 13500, 15000, 1, '2020-05-15 23:09:39', NULL, NULL);
INSERT INTO `tblitem_price` VALUES (40, 11, 40, '2022-02-21', 26370, 29300, 1, '2020-05-15 23:09:39', NULL, NULL);
INSERT INTO `tblitem_price` VALUES (41, 11, 41, '2022-02-21', 13500, 15000, 1, '2020-05-15 23:09:39', NULL, NULL);
INSERT INTO `tblitem_price` VALUES (42, 11, 42, '2022-02-21', 26370, 29300, 1, '2020-05-15 23:09:39', NULL, NULL);
INSERT INTO `tblitem_price` VALUES (43, 11, 43, '2022-02-21', 13410, 14900, 1, '2020-05-15 23:09:39', NULL, NULL);
INSERT INTO `tblitem_price` VALUES (44, 11, 44, '2022-02-21', 26370, 29300, 1, '2020-05-15 23:09:39', NULL, NULL);
INSERT INTO `tblitem_price` VALUES (45, 11, 45, '2022-02-21', 9090, 10100, 1, '2020-05-15 23:09:39', NULL, NULL);
INSERT INTO `tblitem_price` VALUES (46, 11, 46, '2022-02-21', 9720, 10800, 1, '2020-05-15 23:09:39', NULL, NULL);
INSERT INTO `tblitem_price` VALUES (47, 11, 47, '2022-02-21', 12870, 14300, 1, '2020-05-15 23:09:39', NULL, NULL);
INSERT INTO `tblitem_price` VALUES (48, 11, 48, '2022-02-21', 8100, 9000, 1, '2020-05-15 23:09:39', NULL, NULL);
INSERT INTO `tblitem_price` VALUES (49, 11, 49, '2022-02-21', 15480, 17200, 1, '2020-05-15 23:09:39', NULL, NULL);
INSERT INTO `tblitem_price` VALUES (50, 11, 50, '2022-02-21', 19080, 21200, 1, '2020-05-15 23:09:39', NULL, NULL);
INSERT INTO `tblitem_price` VALUES (51, 11, 51, '2022-02-21', 9990, 11100, 1, '2020-05-15 23:09:39', NULL, NULL);
INSERT INTO `tblitem_price` VALUES (52, 11, 52, '2022-02-21', 23670, 26300, 1, '2020-05-15 23:09:39', NULL, NULL);
INSERT INTO `tblitem_price` VALUES (53, 11, 53, '2022-02-21', 36360, 40400, 1, '2020-05-15 23:09:39', NULL, NULL);
INSERT INTO `tblitem_price` VALUES (54, 11, 54, '2022-02-21', 29520, 32800, 1, '2020-05-15 23:09:39', NULL, NULL);
INSERT INTO `tblitem_price` VALUES (55, 11, 55, '2022-02-21', 32130, 35700, 1, '2020-05-15 23:09:39', NULL, NULL);
INSERT INTO `tblitem_price` VALUES (56, 11, 56, '2022-02-21', 20700, 23000, 1, '2020-05-15 23:09:39', NULL, NULL);
INSERT INTO `tblitem_price` VALUES (57, 11, 57, '2022-02-21', 21060, 23400, 1, '2020-05-15 23:09:39', NULL, NULL);
INSERT INTO `tblitem_price` VALUES (58, 11, 58, '2022-02-21', 40140, 44600, 1, '2020-05-15 23:09:39', NULL, NULL);
INSERT INTO `tblitem_price` VALUES (59, 11, 59, '2022-02-21', 21960, 24400, 1, '2020-05-15 23:09:39', NULL, NULL);
INSERT INTO `tblitem_price` VALUES (60, 11, 60, '2022-02-21', 22410, 24900, 1, '2020-05-15 23:09:39', NULL, NULL);
INSERT INTO `tblitem_price` VALUES (61, 11, 61, '2022-02-21', 41490, 46100, 1, '2020-05-15 23:09:39', NULL, NULL);
INSERT INTO `tblitem_price` VALUES (62, 11, 62, '2022-02-21', 22410, 24900, 1, '2020-05-15 23:09:39', NULL, NULL);
INSERT INTO `tblitem_price` VALUES (63, 11, 63, '2022-02-21', 21060, 23400, 1, '2020-05-15 23:09:39', NULL, NULL);
INSERT INTO `tblitem_price` VALUES (64, 11, 64, '2022-02-21', 21060, 23400, 1, '2020-05-15 23:09:39', NULL, NULL);
INSERT INTO `tblitem_price` VALUES (65, 11, 65, '2022-02-21', 22410, 24900, 1, '2020-05-15 23:09:39', NULL, NULL);
INSERT INTO `tblitem_price` VALUES (66, 11, 66, '2022-02-21', 18540, 20600, 1, '2020-05-15 23:09:39', NULL, NULL);
INSERT INTO `tblitem_price` VALUES (67, 11, 67, '2022-02-21', 18540, 20600, 1, '2020-05-15 23:09:39', NULL, NULL);
INSERT INTO `tblitem_price` VALUES (68, 11, 68, '2022-02-21', 19440, 21600, 1, '2020-05-15 23:09:39', NULL, NULL);
INSERT INTO `tblitem_price` VALUES (69, 11, 69, '2022-02-21', 19440, 21600, 1, '2020-05-15 23:09:39', NULL, NULL);
INSERT INTO `tblitem_price` VALUES (70, 11, 70, '2022-02-21', 18270, 20300, 1, '2020-05-15 23:09:39', NULL, NULL);
INSERT INTO `tblitem_price` VALUES (71, 11, 71, '2022-02-21', 18270, 20300, 1, '2020-05-15 23:09:39', NULL, NULL);
INSERT INTO `tblitem_price` VALUES (72, 11, 72, '2022-02-21', 6120, 6800, 1, '2020-05-15 23:09:39', NULL, NULL);
INSERT INTO `tblitem_price` VALUES (73, 11, 73, '2022-02-21', 7830, 8700, 1, '2020-05-15 23:09:39', NULL, NULL);
INSERT INTO `tblitem_price` VALUES (74, 11, 74, '2022-02-21', 10980, 12200, 1, '2020-05-15 23:09:39', NULL, NULL);
INSERT INTO `tblitem_price` VALUES (75, 11, 75, '2022-02-21', 10980, 12200, 1, '2020-05-15 23:09:39', NULL, NULL);
INSERT INTO `tblitem_price` VALUES (76, 11, 76, '2022-02-21', 9630, 10700, 1, '2020-05-15 23:09:39', NULL, NULL);
INSERT INTO `tblitem_price` VALUES (77, 11, 77, '2022-02-21', 8640, 9600, 1, '2020-05-15 23:09:39', NULL, NULL);
INSERT INTO `tblitem_price` VALUES (78, 11, 78, '2022-02-21', 17550, 19500, 1, '2020-05-15 23:09:39', NULL, NULL);
INSERT INTO `tblitem_price` VALUES (79, 11, 79, '2022-02-21', 8640, 9600, 1, '2020-05-15 23:09:39', NULL, NULL);
INSERT INTO `tblitem_price` VALUES (80, 11, 80, '2022-02-21', 17550, 19500, 1, '2020-05-15 23:09:39', NULL, NULL);
INSERT INTO `tblitem_price` VALUES (81, 11, 81, '2022-02-21', 25650, 28500, 1, '2020-05-15 23:09:39', NULL, NULL);
INSERT INTO `tblitem_price` VALUES (82, 11, 82, '2022-02-21', 44910, 49900, 1, '2020-05-15 23:09:39', NULL, NULL);
INSERT INTO `tblitem_price` VALUES (83, 11, 83, '2022-02-21', 43020, 47800, 1, '2020-05-15 23:09:39', NULL, NULL);
INSERT INTO `tblitem_price` VALUES (84, 11, 84, '2022-02-21', 37980, 42200, 1, '2020-05-15 23:09:39', NULL, NULL);
INSERT INTO `tblitem_price` VALUES (85, 11, 85, '2022-02-21', 86670, 96300, 1, '2020-05-15 23:09:39', NULL, NULL);
INSERT INTO `tblitem_price` VALUES (86, 11, 86, '2022-02-21', 41760, 46400, 1, '2020-05-15 23:09:39', NULL, NULL);
INSERT INTO `tblitem_price` VALUES (87, 11, 87, '2022-02-21', 93420, 103800, 1, '2020-05-15 23:09:39', NULL, NULL);
INSERT INTO `tblitem_price` VALUES (88, 11, 88, '2022-02-21', 16200, 18000, 1, '2020-05-15 23:09:39', NULL, NULL);
INSERT INTO `tblitem_price` VALUES (89, 11, 89, '2022-02-21', 29070, 32300, 1, '2020-05-15 23:09:39', NULL, NULL);
INSERT INTO `tblitem_price` VALUES (90, 11, 90, '2022-02-21', 33210, 36900, 1, '2020-05-15 23:09:39', NULL, NULL);
INSERT INTO `tblitem_price` VALUES (91, 11, 91, '2022-02-21', 31140, 34600, 1, '2020-05-15 23:09:39', NULL, NULL);
INSERT INTO `tblitem_price` VALUES (92, 11, 92, '2022-02-21', 33210, 36900, 1, '2020-05-15 23:09:39', NULL, NULL);
INSERT INTO `tblitem_price` VALUES (93, 11, 93, '2022-02-21', 8370, 9300, 1, '2020-05-15 23:09:39', NULL, NULL);
INSERT INTO `tblitem_price` VALUES (94, 11, 94, '2022-02-21', 7200, 8000, 1, '2020-05-15 23:09:39', NULL, NULL);
INSERT INTO `tblitem_price` VALUES (95, 11, 95, '2022-02-21', 53730, 59700, 1, '2020-05-15 23:09:39', NULL, NULL);
INSERT INTO `tblitem_price` VALUES (96, 11, 96, '2022-02-21', 25380, 28200, 1, '2020-05-15 23:09:39', NULL, NULL);
INSERT INTO `tblitem_price` VALUES (97, 11, 97, '2022-02-21', 64710, 71900, 1, '2020-05-15 23:09:39', NULL, NULL);
INSERT INTO `tblitem_price` VALUES (98, 11, 98, '2022-02-21', 58500, 65000, 1, '2020-05-15 23:09:39', NULL, NULL);
INSERT INTO `tblitem_price` VALUES (99, 11, 99, '2022-02-21', 43920, 48800, 1, '2020-05-15 23:09:39', NULL, NULL);
INSERT INTO `tblitem_price` VALUES (100, 11, 100, '2022-02-21', 23850, 26500, 1, '2020-05-15 23:09:39', NULL, NULL);
INSERT INTO `tblitem_price` VALUES (101, 11, 101, '2022-02-21', 23850, 26500, 1, '2020-05-15 23:09:39', NULL, NULL);
INSERT INTO `tblitem_price` VALUES (102, 11, 102, '2022-02-21', 23850, 26500, 1, '2020-05-15 23:09:39', NULL, NULL);
INSERT INTO `tblitem_price` VALUES (103, 11, 103, '2022-02-21', 25830, 28700, 1, '2020-05-15 23:09:39', NULL, NULL);
INSERT INTO `tblitem_price` VALUES (104, 11, 104, '2022-02-21', 9450, 10500, 1, '2020-05-15 23:09:39', NULL, NULL);
INSERT INTO `tblitem_price` VALUES (105, 11, 105, '2022-02-21', 9450, 10500, 1, '2020-05-15 23:09:39', NULL, NULL);
INSERT INTO `tblitem_price` VALUES (106, 11, 106, '2022-02-21', 9450, 10500, 1, '2020-05-15 23:09:39', NULL, NULL);
INSERT INTO `tblitem_price` VALUES (107, 11, 107, '2022-02-21', 12780, 14200, 1, '2020-05-15 23:09:39', NULL, NULL);
INSERT INTO `tblitem_price` VALUES (108, 11, 108, '2022-02-21', 12780, 14200, 1, '2020-05-15 23:09:39', NULL, NULL);
INSERT INTO `tblitem_price` VALUES (109, 11, 109, '2022-02-21', 13230, 14700, 1, '2020-05-15 23:09:39', NULL, NULL);
INSERT INTO `tblitem_price` VALUES (110, 11, 110, '2022-02-21', 13230, 14700, 1, '2020-05-15 23:09:39', NULL, NULL);
INSERT INTO `tblitem_price` VALUES (111, 11, 111, '2022-02-21', 7110, 7900, 1, '2020-05-15 23:09:39', NULL, NULL);
INSERT INTO `tblitem_price` VALUES (112, 11, 112, '2022-02-21', 11430, 12700, 1, '2020-05-15 23:09:39', NULL, NULL);
INSERT INTO `tblitem_price` VALUES (113, 11, 113, '2022-02-21', 14850, 16500, 1, '2020-05-15 23:09:39', NULL, NULL);
INSERT INTO `tblitem_price` VALUES (114, 11, 114, '2022-02-21', 30780, 34200, 1, '2020-05-15 23:09:39', NULL, NULL);
INSERT INTO `tblitem_price` VALUES (115, 11, 115, '2022-02-21', 14850, 16500, 1, '2020-05-15 23:09:39', NULL, NULL);
INSERT INTO `tblitem_price` VALUES (116, 11, 116, '2022-02-21', 10620, 11800, 1, '2020-05-15 23:09:39', NULL, NULL);
INSERT INTO `tblitem_price` VALUES (117, 11, 117, '2022-02-21', 10620, 11800, 1, '2020-05-15 23:09:39', NULL, NULL);
INSERT INTO `tblitem_price` VALUES (118, 11, 118, '2022-02-21', 10620, 11800, 1, '2020-05-15 23:09:39', NULL, NULL);
INSERT INTO `tblitem_price` VALUES (119, 11, 119, '2022-02-21', 7740, 8600, 1, '2020-05-15 23:09:39', NULL, NULL);
INSERT INTO `tblitem_price` VALUES (120, 11, 120, '2022-02-21', 15300, 17000, 1, '2020-05-15 23:09:39', NULL, NULL);
INSERT INTO `tblitem_price` VALUES (121, 11, 121, '2022-02-21', 12690, 14100, 1, '2020-05-15 23:09:39', NULL, NULL);
INSERT INTO `tblitem_price` VALUES (122, 11, 122, '2022-02-21', 14400, 16000, 1, '2020-05-15 23:09:39', NULL, NULL);
INSERT INTO `tblitem_price` VALUES (123, 11, 123, '2022-02-21', 6300, 7000, 1, '2020-05-15 23:09:39', NULL, NULL);
INSERT INTO `tblitem_price` VALUES (124, 11, 124, '2022-02-21', 7020, 7800, 1, '2020-05-15 23:09:39', NULL, NULL);
INSERT INTO `tblitem_price` VALUES (125, 11, 125, '2022-02-21', 11970, 13300, 1, '2020-05-15 23:09:39', NULL, NULL);
INSERT INTO `tblitem_price` VALUES (126, 11, 126, '2022-02-21', 5040, 5600, 1, '2020-05-15 23:09:39', NULL, NULL);
INSERT INTO `tblitem_price` VALUES (127, 11, 127, '2022-02-21', 19800, 22000, 1, '2020-05-15 23:09:39', NULL, NULL);
INSERT INTO `tblitem_price` VALUES (128, 11, 128, '2022-02-21', 22770, 25300, 1, '2020-05-15 23:09:39', NULL, NULL);
INSERT INTO `tblitem_price` VALUES (129, 11, 129, '2022-02-21', 22770, 25300, 1, '2020-05-15 23:09:39', NULL, NULL);
INSERT INTO `tblitem_price` VALUES (130, 11, 130, '2022-02-21', 25830, 28700, 1, '2020-05-15 23:09:39', NULL, NULL);
INSERT INTO `tblitem_price` VALUES (131, 11, 131, '2022-02-21', 25830, 28700, 1, '2020-05-15 23:09:39', NULL, NULL);
INSERT INTO `tblitem_price` VALUES (132, 11, 132, '2022-02-21', 15750, 17500, 1, '2020-05-15 23:09:39', NULL, NULL);
INSERT INTO `tblitem_price` VALUES (133, 11, 133, '2022-02-21', 15750, 17500, 1, '2020-05-15 23:09:39', NULL, NULL);
INSERT INTO `tblitem_price` VALUES (134, 11, 134, '2022-02-21', 8730, 9700, 1, '2020-05-15 23:09:39', NULL, NULL);
INSERT INTO `tblitem_price` VALUES (135, 11, 135, '2022-02-21', 14940, 16600, 1, '2020-05-15 23:09:39', NULL, NULL);
INSERT INTO `tblitem_price` VALUES (136, 11, 136, '2022-02-21', 8730, 9700, 1, '2020-05-15 23:09:39', NULL, NULL);
INSERT INTO `tblitem_price` VALUES (137, 11, 137, '2022-02-21', 14760, 16400, 1, '2020-05-15 23:09:39', NULL, NULL);
INSERT INTO `tblitem_price` VALUES (138, 11, 138, '2022-02-21', 3690, 4100, 1, '2020-05-15 23:09:39', NULL, NULL);
INSERT INTO `tblitem_price` VALUES (139, 11, 139, '2022-02-21', 8820, 9800, 1, '2020-05-15 23:09:39', NULL, NULL);
INSERT INTO `tblitem_price` VALUES (140, 11, 140, '2022-02-21', 15300, 17000, 1, '2020-05-15 23:09:39', NULL, NULL);
INSERT INTO `tblitem_price` VALUES (141, 11, 141, '2022-02-21', 2520, 2800, 1, '2020-05-15 23:09:39', NULL, NULL);
INSERT INTO `tblitem_price` VALUES (142, 11, 142, '2022-02-21', 11160, 12400, 1, '2020-05-15 23:09:39', NULL, NULL);
INSERT INTO `tblitem_price` VALUES (143, 11, 143, '2022-02-21', 13680, 15200, 1, '2020-05-15 23:09:39', NULL, NULL);
INSERT INTO `tblitem_price` VALUES (144, 11, 144, '2022-02-21', 26370, 29300, 1, '2020-05-15 23:09:39', NULL, NULL);
INSERT INTO `tblitem_price` VALUES (145, 11, 145, '2022-02-21', 26370, 29300, 1, '2020-05-15 23:09:39', NULL, NULL);
INSERT INTO `tblitem_price` VALUES (146, 11, 146, '2022-02-21', 10530, 11700, 1, '2020-05-15 23:09:39', NULL, NULL);
INSERT INTO `tblitem_price` VALUES (147, 11, 147, '2022-02-21', 12780, 14200, 1, '2020-05-15 23:09:39', NULL, NULL);
INSERT INTO `tblitem_price` VALUES (148, 11, 148, '2022-02-21', 11610, 12900, 1, '2020-05-15 23:09:39', NULL, NULL);
INSERT INTO `tblitem_price` VALUES (149, 11, 149, '2022-02-21', 21150, 23500, 1, '2020-05-15 23:09:39', NULL, NULL);
INSERT INTO `tblitem_price` VALUES (150, 11, 150, '2022-02-21', 11250, 12500, 1, '2020-05-15 23:09:39', NULL, NULL);
INSERT INTO `tblitem_price` VALUES (151, 11, 151, '2022-02-21', 23940, 26600, 1, '2020-05-15 23:09:39', NULL, NULL);
INSERT INTO `tblitem_price` VALUES (152, 11, 152, '2022-02-21', 44100, 49000, 1, '2020-05-15 23:09:39', NULL, NULL);
INSERT INTO `tblitem_price` VALUES (153, 11, 153, '2022-02-21', 12420, 13800, 1, '2020-05-15 23:09:39', NULL, NULL);
INSERT INTO `tblitem_price` VALUES (154, 11, 154, '2022-02-21', 23940, 26600, 1, '2020-05-15 23:09:39', NULL, NULL);
INSERT INTO `tblitem_price` VALUES (155, 11, 155, '2022-02-21', 16380, 18200, 1, '2020-05-15 23:09:39', NULL, NULL);
INSERT INTO `tblitem_price` VALUES (156, 11, 156, '2022-02-21', 31050, 34500, 1, '2020-05-15 23:09:39', NULL, NULL);
INSERT INTO `tblitem_price` VALUES (157, 11, 157, '2022-02-21', 30780, 34200, 1, '2020-05-15 23:09:39', NULL, NULL);
INSERT INTO `tblitem_price` VALUES (158, 11, 158, '2022-02-21', 29970, 33300, 1, '2020-05-15 23:09:39', NULL, NULL);
INSERT INTO `tblitem_price` VALUES (159, 11, 159, '2022-02-21', 34470, 38300, 1, '2020-05-15 23:09:39', NULL, NULL);
INSERT INTO `tblitem_price` VALUES (160, 11, 160, '2022-02-21', 41040, 45600, 1, '2020-05-15 23:09:39', NULL, NULL);
INSERT INTO `tblitem_price` VALUES (161, 11, 161, '2022-02-21', 30420, 33800, 1, '2020-05-15 23:09:39', NULL, NULL);
INSERT INTO `tblitem_price` VALUES (162, 11, 162, '2022-02-21', 12420, 13800, 1, '2020-05-15 23:09:39', NULL, NULL);
INSERT INTO `tblitem_price` VALUES (163, 11, 163, '2022-02-21', 15390, 17100, 1, '2020-05-15 23:09:39', NULL, NULL);
INSERT INTO `tblitem_price` VALUES (164, 11, 164, '2022-02-21', 7290, 8100, 1, '2020-05-15 23:09:39', NULL, NULL);
INSERT INTO `tblitem_price` VALUES (165, 11, 165, '2022-02-21', 7290, 8100, 1, '2020-05-15 23:09:39', NULL, NULL);
INSERT INTO `tblitem_price` VALUES (166, 11, 166, '2022-02-21', 7290, 8100, 1, '2020-05-15 23:09:39', NULL, NULL);
INSERT INTO `tblitem_price` VALUES (167, 11, 167, '2022-02-21', 7290, 8100, 1, '2020-05-15 23:09:39', NULL, NULL);
INSERT INTO `tblitem_price` VALUES (168, 11, 168, '2022-02-21', 7290, 8100, 1, '2020-05-15 23:09:39', NULL, NULL);
INSERT INTO `tblitem_price` VALUES (169, 11, 169, '2022-02-21', 29340, 32600, 1, '2020-05-15 23:09:39', NULL, NULL);
INSERT INTO `tblitem_price` VALUES (170, 11, 170, '2022-02-21', 33840, 37600, 1, '2020-05-15 23:09:39', NULL, NULL);
INSERT INTO `tblitem_price` VALUES (171, 11, 171, '2022-02-21', 22680, 25200, 1, '2020-05-15 23:09:39', NULL, NULL);
INSERT INTO `tblitem_price` VALUES (172, 11, 172, '2022-02-21', 45360, 50400, 1, '2020-05-15 23:09:39', NULL, NULL);
INSERT INTO `tblitem_price` VALUES (173, 11, 173, '2022-02-21', 39330, 43700, 1, '2020-05-15 23:09:39', NULL, NULL);
INSERT INTO `tblitem_price` VALUES (174, 11, 174, '2022-02-21', 33840, 37600, 1, '2020-05-15 23:09:39', NULL, NULL);
INSERT INTO `tblitem_price` VALUES (175, 11, 175, '2022-02-21', 44460, 49400, 1, '2020-05-15 23:09:39', NULL, NULL);
INSERT INTO `tblitem_price` VALUES (176, 11, 176, '2022-02-21', 20340, 22600, 1, '2020-05-15 23:09:39', NULL, NULL);
INSERT INTO `tblitem_price` VALUES (177, 11, 177, '2022-02-21', 19260, 21400, 1, '2020-05-15 23:09:39', NULL, NULL);
INSERT INTO `tblitem_price` VALUES (178, 11, 178, '2022-02-21', 19260, 21400, 1, '2020-05-15 23:09:39', NULL, NULL);
INSERT INTO `tblitem_price` VALUES (179, 11, 179, '2022-02-21', 36090, 40100, 1, '2020-05-15 23:09:39', NULL, NULL);
INSERT INTO `tblitem_price` VALUES (180, 11, 180, '2022-02-21', 19260, 21400, 1, '2020-05-15 23:09:39', NULL, NULL);
INSERT INTO `tblitem_price` VALUES (181, 11, 181, '2022-02-21', 19260, 21400, 1, '2020-05-15 23:09:39', NULL, NULL);
INSERT INTO `tblitem_price` VALUES (182, 11, 182, '2022-02-21', 19260, 21400, 1, '2020-05-15 23:09:39', NULL, NULL);
INSERT INTO `tblitem_price` VALUES (183, 11, 183, '2022-02-21', 19260, 21400, 1, '2020-05-15 23:09:39', NULL, NULL);
INSERT INTO `tblitem_price` VALUES (184, 11, 184, '2022-02-21', 22140, 24600, 1, '2020-05-15 23:09:39', NULL, NULL);
INSERT INTO `tblitem_price` VALUES (185, 11, 185, '2022-02-21', 19260, 21400, 1, '2020-05-15 23:09:39', NULL, NULL);
INSERT INTO `tblitem_price` VALUES (186, 11, 186, '2022-02-21', 22140, 24600, 1, '2020-05-15 23:09:39', NULL, NULL);
INSERT INTO `tblitem_price` VALUES (187, 11, 187, '2022-02-21', 42660, 47400, 1, '2020-05-15 23:09:39', NULL, NULL);
INSERT INTO `tblitem_price` VALUES (188, 11, 188, '2022-02-21', 12330, 13700, 1, '2020-05-15 23:09:39', NULL, NULL);
INSERT INTO `tblitem_price` VALUES (189, 11, 189, '2022-02-21', 42660, 47400, 1, '2020-05-15 23:09:39', NULL, NULL);
INSERT INTO `tblitem_price` VALUES (190, 11, 190, '2022-02-21', 13140, 14600, 1, '2020-05-15 23:09:39', NULL, NULL);
INSERT INTO `tblitem_price` VALUES (191, 11, 191, '2022-02-21', 23760, 26400, 1, '2020-05-15 23:09:39', NULL, NULL);
INSERT INTO `tblitem_price` VALUES (192, 11, 192, '2022-02-21', 11070, 12300, 1, '2020-05-15 23:09:39', NULL, NULL);
INSERT INTO `tblitem_price` VALUES (193, 11, 193, '2022-02-21', 38790, 43100, 1, '2020-05-15 23:09:39', NULL, NULL);
INSERT INTO `tblitem_price` VALUES (194, 11, 194, '2022-02-21', 19260, 21400, 1, '2020-05-15 23:09:39', NULL, NULL);
INSERT INTO `tblitem_price` VALUES (195, 11, 195, '2022-02-21', 19260, 21400, 1, '2020-05-15 23:09:39', NULL, NULL);
INSERT INTO `tblitem_price` VALUES (196, 11, 196, '2022-02-21', 19260, 21400, 1, '2020-05-15 23:09:39', NULL, NULL);
INSERT INTO `tblitem_price` VALUES (197, 11, 197, '2022-02-21', 8010, 8900, 1, '2020-05-15 23:09:39', NULL, NULL);
INSERT INTO `tblitem_price` VALUES (198, 11, 198, '2022-02-21', 19260, 21400, 1, '2020-05-15 23:09:39', NULL, NULL);
INSERT INTO `tblitem_price` VALUES (199, 11, 199, '2022-02-21', 19260, 21400, 1, '2020-05-15 23:09:39', NULL, NULL);
INSERT INTO `tblitem_price` VALUES (200, 11, 200, '2022-02-21', 19260, 21400, 1, '2020-05-15 23:09:39', NULL, NULL);
INSERT INTO `tblitem_price` VALUES (201, 11, 201, '2022-02-21', 36270, 40300, 1, '2020-05-15 23:09:39', NULL, NULL);
INSERT INTO `tblitem_price` VALUES (202, 11, 202, '2022-02-21', 38340, 42600, 1, '2020-05-15 23:09:39', NULL, NULL);
INSERT INTO `tblitem_price` VALUES (203, 11, 203, '2022-02-21', 22140, 24600, 1, '2020-05-15 23:09:39', NULL, NULL);
INSERT INTO `tblitem_price` VALUES (204, 11, 204, '2022-02-21', 9270, 10300, 1, '2020-05-15 23:09:39', NULL, NULL);
INSERT INTO `tblitem_price` VALUES (205, 11, 205, '2022-02-21', 22140, 24600, 1, '2020-05-15 23:09:39', NULL, NULL);
INSERT INTO `tblitem_price` VALUES (206, 11, 206, '2022-02-21', 9270, 10300, 1, '2020-05-15 23:09:39', NULL, NULL);
INSERT INTO `tblitem_price` VALUES (207, 11, 207, '2022-02-21', 41850, 46500, 1, '2020-05-15 23:09:39', NULL, NULL);
INSERT INTO `tblitem_price` VALUES (208, 11, 208, '2022-02-21', 21330, 23700, 1, '2020-05-15 23:09:39', NULL, NULL);
INSERT INTO `tblitem_price` VALUES (209, 11, 209, '2022-02-21', 21330, 23700, 1, '2020-05-15 23:09:39', NULL, NULL);
INSERT INTO `tblitem_price` VALUES (210, 11, 210, '2022-02-21', 22140, 24600, 1, '2020-05-15 23:09:39', NULL, NULL);
INSERT INTO `tblitem_price` VALUES (211, 11, 211, '2022-02-21', 21780, 24200, 1, '2020-05-15 23:09:39', NULL, NULL);
INSERT INTO `tblitem_price` VALUES (212, 11, 212, '2022-02-21', 39330, 43700, 1, '2020-05-15 23:09:39', NULL, NULL);
INSERT INTO `tblitem_price` VALUES (213, 11, 213, '2022-02-21', 41850, 46500, 1, '2020-05-15 23:09:39', NULL, NULL);
INSERT INTO `tblitem_price` VALUES (214, 11, 214, '2022-02-21', 21330, 23700, 1, '2020-05-15 23:09:39', NULL, NULL);
INSERT INTO `tblitem_price` VALUES (215, 11, 215, '2022-02-21', 22140, 24600, 1, '2020-05-15 23:09:39', NULL, NULL);
INSERT INTO `tblitem_price` VALUES (216, 11, 216, '2022-02-21', 9270, 10300, 1, '2020-05-15 23:09:39', NULL, NULL);
INSERT INTO `tblitem_price` VALUES (217, 11, 217, '2022-02-21', 40590, 45100, 1, '2020-05-15 23:09:39', NULL, NULL);
INSERT INTO `tblitem_price` VALUES (218, 11, 218, '2022-02-21', 22140, 24600, 1, '2020-05-15 23:09:39', NULL, NULL);
INSERT INTO `tblitem_price` VALUES (219, 11, 219, '2022-02-21', 22590, 25100, 1, '2020-05-15 23:09:39', NULL, NULL);
INSERT INTO `tblitem_price` VALUES (220, 11, 220, '2022-02-21', 10170, 11300, 1, '2020-05-15 23:09:39', NULL, NULL);
INSERT INTO `tblitem_price` VALUES (221, 11, 221, '2022-02-21', 37080, 41200, 1, '2020-05-15 23:09:39', NULL, NULL);
INSERT INTO `tblitem_price` VALUES (222, 11, 222, '2022-02-21', 22140, 24600, 1, '2020-05-15 23:09:39', NULL, NULL);
INSERT INTO `tblitem_price` VALUES (223, 11, 223, '2022-02-21', 36090, 40100, 1, '2020-05-15 23:09:39', NULL, NULL);
INSERT INTO `tblitem_price` VALUES (224, 11, 224, '2022-02-21', 18450, 20500, 1, '2020-05-15 23:09:39', NULL, NULL);
INSERT INTO `tblitem_price` VALUES (225, 11, 225, '2022-02-21', 18090, 20100, 1, '2020-05-15 23:09:39', NULL, NULL);
INSERT INTO `tblitem_price` VALUES (226, 11, 226, '2022-02-21', 28710, 31900, 1, '2020-05-15 23:09:39', NULL, NULL);
INSERT INTO `tblitem_price` VALUES (227, 11, 227, '2022-02-21', 18090, 20100, 1, '2020-05-15 23:09:39', NULL, NULL);
INSERT INTO `tblitem_price` VALUES (228, 11, 228, '2022-02-21', 37080, 41200, 1, '2020-05-15 23:09:39', NULL, NULL);
INSERT INTO `tblitem_price` VALUES (229, 11, 229, '2022-02-21', 37080, 41200, 1, '2020-05-15 23:09:39', NULL, NULL);
INSERT INTO `tblitem_price` VALUES (230, 11, 230, '2022-02-21', 6210, 6900, 1, '2020-05-15 23:09:39', NULL, NULL);
INSERT INTO `tblitem_price` VALUES (231, 11, 231, '2022-02-21', 14400, 16000, 1, '2020-05-15 23:09:39', NULL, NULL);
INSERT INTO `tblitem_price` VALUES (232, 11, 232, '2022-02-21', 6210, 6900, 1, '2020-05-15 23:09:39', NULL, NULL);
INSERT INTO `tblitem_price` VALUES (233, 11, 233, '2022-02-21', 14400, 16000, 1, '2020-05-15 23:09:39', NULL, NULL);
INSERT INTO `tblitem_price` VALUES (234, 11, 234, '2022-02-21', 6210, 6900, 1, '2020-05-15 23:09:39', NULL, NULL);
INSERT INTO `tblitem_price` VALUES (235, 11, 235, '2022-02-21', 14400, 16000, 1, '2020-05-15 23:09:39', NULL, NULL);
INSERT INTO `tblitem_price` VALUES (236, 11, 236, '2022-02-21', 6390, 7100, 1, '2020-05-15 23:09:39', NULL, NULL);
INSERT INTO `tblitem_price` VALUES (237, 11, 237, '2022-02-21', 15030, 16700, 1, '2020-05-15 23:09:39', NULL, NULL);
INSERT INTO `tblitem_price` VALUES (238, 11, 238, '2022-02-21', 7020, 7800, 1, '2020-05-15 23:09:39', NULL, NULL);
INSERT INTO `tblitem_price` VALUES (239, 11, 239, '2022-02-21', 15570, 17300, 1, '2020-05-15 23:09:39', NULL, NULL);
INSERT INTO `tblitem_price` VALUES (240, 11, 240, '2022-02-21', 7020, 7800, 1, '2020-05-15 23:09:39', NULL, NULL);
INSERT INTO `tblitem_price` VALUES (241, 11, 241, '2022-02-21', 15570, 17300, 1, '2020-05-15 23:09:39', NULL, NULL);
INSERT INTO `tblitem_price` VALUES (242, 11, 242, '2022-02-21', 29700, 33000, 1, '2020-05-15 23:09:39', NULL, NULL);
INSERT INTO `tblitem_price` VALUES (243, 11, 243, '2022-02-21', 29700, 33000, 1, '2020-05-15 23:09:39', NULL, NULL);
INSERT INTO `tblitem_price` VALUES (244, 11, 244, '2022-02-21', 30330, 33700, 1, '2020-05-15 23:09:39', NULL, NULL);
INSERT INTO `tblitem_price` VALUES (245, 11, 245, '2022-02-21', 30330, 33700, 1, '2020-05-15 23:09:39', NULL, NULL);
INSERT INTO `tblitem_price` VALUES (246, 11, 246, '2022-02-21', 30330, 33700, 1, '2020-05-15 23:09:39', NULL, NULL);
INSERT INTO `tblitem_price` VALUES (247, 11, 247, '2022-02-21', 32670, 36300, 1, '2020-05-15 23:09:39', NULL, NULL);
INSERT INTO `tblitem_price` VALUES (248, 11, 248, '2022-02-21', 34290, 38100, 1, '2020-05-15 23:09:39', NULL, NULL);
INSERT INTO `tblitem_price` VALUES (249, 11, 249, '2022-02-21', 32670, 36300, 1, '2020-05-15 23:09:39', NULL, NULL);
INSERT INTO `tblitem_price` VALUES (250, 11, 250, '2022-02-21', 36720, 40800, 1, '2020-05-15 23:09:39', NULL, NULL);
INSERT INTO `tblitem_price` VALUES (251, 11, 251, '2022-02-21', 30330, 33700, 1, '2020-05-15 23:09:39', NULL, NULL);
INSERT INTO `tblitem_price` VALUES (252, 11, 252, '2022-02-21', 25470, 28300, 1, '2020-05-15 23:09:39', NULL, NULL);
INSERT INTO `tblitem_price` VALUES (253, 11, 253, '2022-02-21', 26550, 29500, 1, '2020-05-15 23:09:39', NULL, NULL);
INSERT INTO `tblitem_price` VALUES (254, 11, 254, '2022-02-21', 29790, 33100, 1, '2020-05-15 23:09:39', NULL, NULL);
INSERT INTO `tblitem_price` VALUES (255, 11, 255, '2022-02-21', 15570, 17300, 1, '2020-05-15 23:09:39', NULL, NULL);
INSERT INTO `tblitem_price` VALUES (256, 11, 256, '2022-02-21', 23760, 26400, 1, '2020-05-15 23:09:39', NULL, NULL);
INSERT INTO `tblitem_price` VALUES (257, 11, 257, '2022-02-21', 23760, 26400, 1, '2020-05-15 23:09:39', NULL, NULL);
INSERT INTO `tblitem_price` VALUES (258, 11, 258, '2022-02-21', 11970, 13300, 1, '2020-05-15 23:09:39', NULL, NULL);
INSERT INTO `tblitem_price` VALUES (259, 11, 259, '2022-02-21', 9540, 10600, 1, '2020-05-15 23:09:39', NULL, NULL);
INSERT INTO `tblitem_price` VALUES (260, 11, 260, '2022-02-21', 18540, 20600, 1, '2020-05-15 23:09:39', NULL, NULL);
INSERT INTO `tblitem_price` VALUES (261, 11, 261, '2022-02-21', 35190, 39100, 1, '2020-05-15 23:09:39', NULL, NULL);
INSERT INTO `tblitem_price` VALUES (262, 11, 262, '2022-02-21', 9540, 10600, 1, '2020-05-15 23:09:39', NULL, NULL);
INSERT INTO `tblitem_price` VALUES (263, 11, 263, '2022-02-21', 18540, 20600, 1, '2020-05-15 23:09:39', NULL, NULL);
INSERT INTO `tblitem_price` VALUES (264, 11, 264, '2022-02-21', 35190, 39100, 1, '2020-05-15 23:09:39', NULL, NULL);
INSERT INTO `tblitem_price` VALUES (265, 11, 265, '2022-02-21', 10710, 11900, 1, '2020-05-15 23:09:39', NULL, NULL);
INSERT INTO `tblitem_price` VALUES (266, 11, 266, '2022-02-21', 2520, 2800, 1, '2020-05-15 23:09:39', NULL, NULL);
INSERT INTO `tblitem_price` VALUES (267, 11, 267, '2022-02-21', 26100, 29000, 1, '2020-05-15 23:09:39', NULL, NULL);
INSERT INTO `tblitem_price` VALUES (268, 11, 268, '2022-02-21', 26910, 29900, 1, '2020-05-15 23:09:39', NULL, NULL);
INSERT INTO `tblitem_price` VALUES (269, 11, 269, '2022-02-21', 24570, 27300, 1, '2020-05-15 23:09:39', NULL, NULL);
INSERT INTO `tblitem_price` VALUES (270, 11, 270, '2022-02-21', 24210, 26900, 1, '2020-05-15 23:09:39', NULL, NULL);
INSERT INTO `tblitem_price` VALUES (271, 11, 271, '2022-02-21', 20430, 22700, 1, '2020-05-15 23:09:39', NULL, NULL);
INSERT INTO `tblitem_price` VALUES (272, 11, 272, '2022-02-21', 20790, 23100, 1, '2020-05-15 23:09:39', NULL, NULL);
INSERT INTO `tblitem_price` VALUES (273, 11, 273, '2022-02-21', 37710, 41900, 1, '2020-05-15 23:09:39', NULL, NULL);
INSERT INTO `tblitem_price` VALUES (274, 11, 274, '2022-02-21', 25020, 27800, 1, '2020-05-15 23:09:39', NULL, NULL);
INSERT INTO `tblitem_price` VALUES (275, 11, 275, '2022-02-21', 27360, 30400, 1, '2020-05-15 23:09:39', NULL, NULL);
INSERT INTO `tblitem_price` VALUES (276, 11, 276, '2022-02-21', 23940, 26600, 1, '2020-05-15 23:09:39', NULL, NULL);
INSERT INTO `tblitem_price` VALUES (277, 11, 277, '2022-02-21', 26010, 28900, 1, '2020-05-15 23:09:39', NULL, NULL);
INSERT INTO `tblitem_price` VALUES (278, 11, 278, '2022-02-21', 27360, 30400, 1, '2020-05-15 23:09:39', NULL, NULL);
INSERT INTO `tblitem_price` VALUES (279, 11, 279, '2022-02-21', 24210, 26900, 1, '2020-05-15 23:09:39', NULL, NULL);
INSERT INTO `tblitem_price` VALUES (280, 11, 280, '2022-02-21', 23580, 26200, 1, '2020-05-15 23:09:39', NULL, NULL);
INSERT INTO `tblitem_price` VALUES (281, 11, 281, '2022-02-21', 23400, 26000, 1, '2020-05-15 23:09:39', NULL, NULL);
INSERT INTO `tblitem_price` VALUES (282, 11, 282, '2022-02-21', 25470, 28300, 1, '2020-05-15 23:09:39', NULL, NULL);
INSERT INTO `tblitem_price` VALUES (283, 11, 283, '2022-02-21', 20700, 23000, 1, '2020-05-15 23:09:39', NULL, NULL);
INSERT INTO `tblitem_price` VALUES (284, 11, 284, '2022-02-21', 28260, 31400, 1, '2020-05-15 23:09:39', NULL, NULL);
INSERT INTO `tblitem_price` VALUES (285, 11, 285, '2022-02-21', 19980, 22200, 1, '2020-05-15 23:09:39', NULL, NULL);
INSERT INTO `tblitem_price` VALUES (286, 11, 286, '2022-02-21', 19980, 22200, 1, '2020-05-15 23:09:39', NULL, NULL);
INSERT INTO `tblitem_price` VALUES (287, 11, 287, '2022-02-21', 18450, 20500, 1, '2020-05-15 23:09:39', NULL, NULL);
INSERT INTO `tblitem_price` VALUES (288, 11, 288, '2022-02-21', 18450, 20500, 1, '2020-05-15 23:09:39', NULL, NULL);
INSERT INTO `tblitem_price` VALUES (289, 11, 289, '2022-02-21', 13230, 14700, 1, '2020-05-15 23:09:39', NULL, NULL);
INSERT INTO `tblitem_price` VALUES (290, 11, 290, '2022-02-21', 30420, 33800, 1, '2020-05-15 23:09:39', NULL, NULL);
INSERT INTO `tblitem_price` VALUES (291, 11, 291, '2022-02-21', 32040, 35600, 1, '2020-05-15 23:09:39', NULL, NULL);
INSERT INTO `tblitem_price` VALUES (292, 11, 292, '2022-02-21', 7110, 7900, 1, '2020-05-15 23:09:39', NULL, NULL);
INSERT INTO `tblitem_price` VALUES (293, 11, 293, '2022-02-21', 16920, 18800, 1, '2020-05-15 23:09:39', NULL, NULL);
INSERT INTO `tblitem_price` VALUES (294, 11, 294, '2022-02-21', 5130, 5700, 1, '2020-05-15 23:09:39', NULL, NULL);
INSERT INTO `tblitem_price` VALUES (295, 11, 295, '2022-02-21', 12150, 13500, 1, '2020-05-15 23:09:39', NULL, NULL);
INSERT INTO `tblitem_price` VALUES (296, 11, 296, '2022-02-21', 11520, 12800, 1, '2020-05-15 23:09:39', NULL, NULL);
INSERT INTO `tblitem_price` VALUES (297, 11, 297, '2022-02-21', 6030, 6700, 1, '2020-05-15 23:09:39', NULL, NULL);
INSERT INTO `tblitem_price` VALUES (298, 11, 298, '2022-02-21', 14310, 15900, 1, '2020-05-15 23:09:39', NULL, NULL);
INSERT INTO `tblitem_price` VALUES (299, 11, 299, '2022-02-21', 7380, 8200, 1, '2020-05-15 23:09:39', NULL, NULL);
INSERT INTO `tblitem_price` VALUES (300, 11, 300, '2022-02-21', 17730, 19700, 1, '2020-05-15 23:09:39', NULL, NULL);
INSERT INTO `tblitem_price` VALUES (301, 11, 301, '2022-02-21', 8370, 9300, 1, '2020-05-15 23:09:39', NULL, NULL);
INSERT INTO `tblitem_price` VALUES (302, 11, 302, '2022-02-21', 20160, 22400, 1, '2020-05-15 23:09:39', NULL, NULL);
INSERT INTO `tblitem_price` VALUES (303, 11, 303, '2022-02-21', 8370, 9300, 1, '2020-05-15 23:09:39', NULL, NULL);
INSERT INTO `tblitem_price` VALUES (304, 11, 304, '2022-02-21', 20160, 22400, 1, '2020-05-15 23:09:39', NULL, NULL);
INSERT INTO `tblitem_price` VALUES (305, 11, 305, '2022-02-21', 8370, 9300, 1, '2020-05-15 23:09:39', NULL, NULL);
INSERT INTO `tblitem_price` VALUES (306, 11, 306, '2022-02-21', 20160, 22400, 1, '2020-05-15 23:09:39', NULL, NULL);
INSERT INTO `tblitem_price` VALUES (307, 11, 307, '2022-02-21', 8370, 9300, 1, '2020-05-15 23:09:39', NULL, NULL);
INSERT INTO `tblitem_price` VALUES (308, 11, 308, '2022-02-21', 20160, 22400, 1, '2020-05-15 23:09:39', NULL, NULL);
INSERT INTO `tblitem_price` VALUES (309, 11, 309, '2022-02-21', 8370, 9300, 1, '2020-05-15 23:09:39', NULL, NULL);
INSERT INTO `tblitem_price` VALUES (310, 11, 310, '2022-02-21', 20160, 22400, 1, '2020-05-15 23:09:39', NULL, NULL);
INSERT INTO `tblitem_price` VALUES (311, 11, 311, '2022-02-21', 11970, 13300, 1, '2020-05-15 23:09:39', NULL, NULL);
INSERT INTO `tblitem_price` VALUES (312, 11, 312, '2022-02-21', 10080, 11200, 1, '2020-05-15 23:09:39', NULL, NULL);
INSERT INTO `tblitem_price` VALUES (313, 11, 313, '2022-02-21', 18450, 20500, 1, '2020-05-15 23:09:39', NULL, NULL);
INSERT INTO `tblitem_price` VALUES (314, 11, 314, '2022-02-21', 35730, 39700, 1, '2020-05-15 23:09:39', NULL, NULL);
INSERT INTO `tblitem_price` VALUES (315, 11, 315, '2022-02-21', 12330, 13700, 1, '2020-05-15 23:09:39', NULL, NULL);
INSERT INTO `tblitem_price` VALUES (316, 11, 316, '2022-02-21', 17190, 19100, 1, '2020-05-15 23:09:39', NULL, NULL);
INSERT INTO `tblitem_price` VALUES (317, 11, 317, '2022-02-21', 18810, 20900, 1, '2020-05-15 23:09:39', NULL, NULL);
INSERT INTO `tblitem_price` VALUES (318, 11, 318, '2022-02-21', 10710, 11900, 1, '2020-05-15 23:09:39', NULL, NULL);
INSERT INTO `tblitem_price` VALUES (319, 11, 319, '2022-02-21', 39330, 43700, 1, '2020-05-15 23:09:39', NULL, NULL);
INSERT INTO `tblitem_price` VALUES (320, 11, 320, '2022-02-21', 9450, 10500, 1, '2020-05-15 23:09:39', NULL, NULL);
INSERT INTO `tblitem_price` VALUES (321, 11, 321, '2022-02-21', 18450, 20500, 1, '2020-05-15 23:09:39', NULL, NULL);
INSERT INTO `tblitem_price` VALUES (322, 11, 322, '2022-02-21', 36000, 40000, 1, '2020-05-15 23:09:39', NULL, NULL);
INSERT INTO `tblitem_price` VALUES (323, 11, 323, '2022-02-21', 14310, 15900, 1, '2020-05-15 23:09:39', NULL, NULL);
INSERT INTO `tblitem_price` VALUES (324, 11, 324, '2022-02-21', 15570, 17300, 1, '2020-05-15 23:09:39', NULL, NULL);
INSERT INTO `tblitem_price` VALUES (325, 11, 325, '2022-02-21', 15570, 17300, 1, '2020-05-15 23:09:39', NULL, NULL);
INSERT INTO `tblitem_price` VALUES (326, 11, 326, '2022-02-21', 7830, 8700, 1, '2020-05-15 23:09:39', NULL, NULL);
INSERT INTO `tblitem_price` VALUES (327, 11, 327, '2022-02-21', 15030, 16700, 1, '2020-05-15 23:09:39', NULL, NULL);
INSERT INTO `tblitem_price` VALUES (328, 11, 328, '2022-02-21', 15570, 17300, 1, '2020-05-15 23:09:39', NULL, NULL);
INSERT INTO `tblitem_price` VALUES (329, 11, 329, '2022-02-21', 15570, 17300, 1, '2020-05-15 23:09:39', NULL, NULL);
INSERT INTO `tblitem_price` VALUES (330, 11, 330, '2022-02-21', 15570, 17300, 1, '2020-05-15 23:09:39', NULL, NULL);
INSERT INTO `tblitem_price` VALUES (331, 11, 331, '2022-02-21', 20520, 22800, 1, '2020-05-15 23:09:39', NULL, NULL);
INSERT INTO `tblitem_price` VALUES (332, 11, 332, '2022-02-21', 40950, 45500, 1, '2020-05-15 23:09:39', NULL, NULL);
INSERT INTO `tblitem_price` VALUES (333, 11, 333, '2022-02-21', 21330, 23700, 1, '2020-05-15 23:09:39', NULL, NULL);
INSERT INTO `tblitem_price` VALUES (334, 11, 334, '2022-02-21', 40950, 45500, 1, '2020-05-15 23:09:39', NULL, NULL);
INSERT INTO `tblitem_price` VALUES (335, 11, 335, '2022-02-21', 20700, 23000, 1, '2020-05-15 23:09:39', NULL, NULL);
INSERT INTO `tblitem_price` VALUES (336, 11, 336, '2022-02-21', 21690, 24100, 1, '2020-05-15 23:09:39', NULL, NULL);
INSERT INTO `tblitem_price` VALUES (337, 11, 337, '2022-02-21', 18270, 20300, 1, '2020-05-15 23:09:39', NULL, NULL);
INSERT INTO `tblitem_price` VALUES (338, 11, 338, '2022-02-21', 15570, 17300, 1, '2020-05-15 23:09:39', NULL, NULL);
INSERT INTO `tblitem_price` VALUES (339, 11, 339, '2022-02-21', 20520, 22800, 1, '2020-05-15 23:09:39', NULL, NULL);
INSERT INTO `tblitem_price` VALUES (340, 11, 340, '2022-02-21', 15570, 17300, 1, '2020-05-15 23:09:39', NULL, NULL);
INSERT INTO `tblitem_price` VALUES (341, 11, 341, '2022-02-21', 18000, 20000, 1, '2020-05-15 23:09:39', NULL, NULL);
INSERT INTO `tblitem_price` VALUES (342, 11, 342, '2022-02-21', 15570, 17300, 1, '2020-05-15 23:09:39', NULL, NULL);
INSERT INTO `tblitem_price` VALUES (343, 11, 343, '2022-02-21', 11070, 12300, 1, '2020-05-15 23:09:39', NULL, NULL);
INSERT INTO `tblitem_price` VALUES (344, 11, 344, '2022-02-21', 38520, 42800, 1, '2020-05-15 23:09:39', NULL, NULL);
INSERT INTO `tblitem_price` VALUES (345, 11, 345, '2022-02-21', 21330, 23700, 1, '2020-05-15 23:09:39', NULL, NULL);
INSERT INTO `tblitem_price` VALUES (346, 11, 346, '2022-02-21', 40140, 44600, 1, '2020-05-15 23:09:39', NULL, NULL);
INSERT INTO `tblitem_price` VALUES (347, 11, 347, '2022-02-21', 18900, 21000, 1, '2020-05-15 23:09:39', NULL, NULL);
INSERT INTO `tblitem_price` VALUES (348, 11, 348, '2022-02-21', 18900, 21000, 1, '2020-05-15 23:09:39', NULL, NULL);
INSERT INTO `tblitem_price` VALUES (349, 11, 349, '2022-02-21', 22950, 25500, 1, '2020-05-15 23:09:39', NULL, NULL);
INSERT INTO `tblitem_price` VALUES (350, 11, 350, '2022-02-21', 18270, 20300, 1, '2020-05-15 23:09:39', NULL, NULL);
INSERT INTO `tblitem_price` VALUES (351, 11, 351, '2022-02-21', 18900, 21000, 1, '2020-05-15 23:09:39', NULL, NULL);
INSERT INTO `tblitem_price` VALUES (352, 11, 352, '2022-02-21', 4140, 4600, 1, '2020-05-15 23:09:39', NULL, NULL);
INSERT INTO `tblitem_price` VALUES (353, 11, 353, '2022-02-21', 3960, 4400, 1, '2020-05-15 23:09:39', NULL, NULL);
INSERT INTO `tblitem_price` VALUES (354, 11, 354, '2022-02-21', 8910, 9900, 1, '2020-05-15 23:09:39', NULL, NULL);
INSERT INTO `tblitem_price` VALUES (355, 11, 355, '2022-02-21', 3960, 4400, 1, '2020-05-15 23:09:39', NULL, NULL);
INSERT INTO `tblitem_price` VALUES (356, 11, 356, '2022-02-21', 11520, 12800, 1, '2020-05-15 23:09:39', NULL, NULL);
INSERT INTO `tblitem_price` VALUES (357, 11, 357, '2022-02-21', 64620, 71800, 1, '2020-05-15 23:09:39', NULL, NULL);
INSERT INTO `tblitem_price` VALUES (358, 11, 358, '2022-02-21', 4950, 5500, 1, '2020-05-15 23:09:39', NULL, NULL);
INSERT INTO `tblitem_price` VALUES (359, 11, 359, '2022-02-21', 4500, 5000, 1, '2020-05-15 23:09:39', NULL, NULL);
INSERT INTO `tblitem_price` VALUES (360, 11, 360, '2022-02-21', 9630, 10700, 1, '2020-05-15 23:09:39', NULL, NULL);
INSERT INTO `tblitem_price` VALUES (361, 11, 361, '2022-02-21', 4410, 4900, 1, '2020-05-15 23:09:39', NULL, NULL);
INSERT INTO `tblitem_price` VALUES (362, 11, 362, '2022-02-21', 16920, 18800, 1, '2020-05-15 23:09:39', NULL, NULL);
INSERT INTO `tblitem_price` VALUES (363, 11, 363, '2022-02-21', 79920, 88800, 1, '2020-05-15 23:09:39', NULL, NULL);
INSERT INTO `tblitem_price` VALUES (364, 11, 364, '2022-02-21', 7020, 7800, 1, '2020-05-15 23:09:39', NULL, NULL);
INSERT INTO `tblitem_price` VALUES (365, 11, 365, '2022-02-21', 23760, 26400, 1, '2020-05-15 23:09:39', NULL, NULL);
INSERT INTO `tblitem_price` VALUES (366, 11, 366, '2022-02-21', 7020, 7800, 1, '2020-05-15 23:09:39', NULL, NULL);
INSERT INTO `tblitem_price` VALUES (367, 11, 367, '2022-02-21', 23040, 25600, 1, '2020-05-15 23:09:39', NULL, NULL);
INSERT INTO `tblitem_price` VALUES (368, 11, 368, '2022-02-21', 3600, 4000, 1, '2020-05-15 23:09:39', NULL, NULL);
INSERT INTO `tblitem_price` VALUES (369, 11, 369, '2022-02-21', 5940, 6600, 1, '2020-05-15 23:09:39', NULL, NULL);
INSERT INTO `tblitem_price` VALUES (370, 11, 370, '2022-02-21', 3600, 4000, 1, '2020-05-15 23:09:39', NULL, NULL);
INSERT INTO `tblitem_price` VALUES (371, 11, 371, '2022-02-21', 22320, 24800, 1, '2020-05-15 23:09:39', NULL, NULL);
INSERT INTO `tblitem_price` VALUES (372, 11, 372, '2022-02-21', 3600, 4000, 1, '2020-05-15 23:09:39', NULL, NULL);
INSERT INTO `tblitem_price` VALUES (373, 11, 373, '2022-02-21', 5940, 6600, 1, '2020-05-15 23:09:39', NULL, NULL);
INSERT INTO `tblitem_price` VALUES (374, 11, 374, '2022-02-21', 3690, 4100, 1, '2020-05-15 23:09:39', NULL, NULL);
INSERT INTO `tblitem_price` VALUES (375, 11, 375, '2022-02-21', 25920, 28800, 1, '2020-05-15 23:09:39', NULL, NULL);
INSERT INTO `tblitem_price` VALUES (376, 11, 376, '2022-02-21', 15210, 16900, 1, '2020-05-15 23:09:39', NULL, NULL);
INSERT INTO `tblitem_price` VALUES (377, 11, 377, '2022-02-21', 9270, 10300, 1, '2020-05-15 23:09:39', NULL, NULL);
INSERT INTO `tblitem_price` VALUES (378, 11, 378, '2022-02-21', 21420, 23800, 1, '2020-05-15 23:09:39', NULL, NULL);
INSERT INTO `tblitem_price` VALUES (379, 11, 379, '2022-02-21', 11700, 13000, 1, '2020-05-15 23:09:39', NULL, NULL);
INSERT INTO `tblitem_price` VALUES (380, 11, 380, '2022-02-21', 6840, 7600, 1, '2020-05-15 23:09:39', NULL, NULL);
INSERT INTO `tblitem_price` VALUES (381, 11, 381, '2022-02-21', 36270, 40300, 1, '2020-05-15 23:09:39', NULL, NULL);
INSERT INTO `tblitem_price` VALUES (382, 11, 382, '2022-02-21', 19620, 21800, 1, '2020-05-15 23:09:39', NULL, NULL);
INSERT INTO `tblitem_price` VALUES (383, 11, 383, '2022-02-21', 12780, 14200, 1, '2020-05-15 23:09:39', NULL, NULL);
INSERT INTO `tblitem_price` VALUES (384, 11, 384, '2022-02-21', 31050, 34500, 1, '2020-05-15 23:09:39', NULL, NULL);
INSERT INTO `tblitem_price` VALUES (385, 11, 385, '2022-02-21', 17910, 19900, 1, '2020-05-15 23:09:39', NULL, NULL);
INSERT INTO `tblitem_price` VALUES (386, 11, 386, '2022-02-21', 10620, 11800, 1, '2020-05-15 23:09:39', NULL, NULL);
INSERT INTO `tblitem_price` VALUES (387, 11, 387, '2022-02-21', 26460, 29400, 1, '2020-05-15 23:09:39', NULL, NULL);
INSERT INTO `tblitem_price` VALUES (388, 11, 388, '2022-02-21', 14490, 16100, 1, '2020-05-15 23:09:39', NULL, NULL);
INSERT INTO `tblitem_price` VALUES (389, 11, 389, '2022-02-21', 7740, 8600, 1, '2020-05-15 23:09:39', NULL, NULL);
INSERT INTO `tblitem_price` VALUES (390, 11, 390, '2022-02-21', 19170, 21300, 1, '2020-05-15 23:09:39', NULL, NULL);
INSERT INTO `tblitem_price` VALUES (391, 11, 391, '2022-02-21', 19170, 21300, 1, '2020-05-15 23:09:39', NULL, NULL);
INSERT INTO `tblitem_price` VALUES (392, 11, 392, '2022-02-21', 19170, 21300, 1, '2020-05-15 23:09:39', NULL, NULL);
INSERT INTO `tblitem_price` VALUES (393, 11, 393, '2022-02-21', 41400, 46000, 1, '2020-05-15 23:09:39', NULL, NULL);
INSERT INTO `tblitem_price` VALUES (394, 11, 394, '2022-02-21', 41400, 46000, 1, '2020-05-15 23:09:39', NULL, NULL);
INSERT INTO `tblitem_price` VALUES (395, 11, 395, '2022-02-21', 17550, 19500, 1, '2020-05-15 23:09:39', NULL, NULL);
INSERT INTO `tblitem_price` VALUES (396, 11, 396, '2022-02-21', 18000, 20000, 1, '2020-05-15 23:09:39', NULL, NULL);
INSERT INTO `tblitem_price` VALUES (397, 11, 397, '2022-02-21', 17550, 19500, 1, '2020-05-15 23:09:39', NULL, NULL);
INSERT INTO `tblitem_price` VALUES (398, 11, 398, '2022-02-21', 21600, 24000, 1, '2020-05-15 23:09:39', NULL, NULL);
INSERT INTO `tblitem_price` VALUES (399, 11, 399, '2022-02-21', 20250, 22500, 1, '2020-05-15 23:09:39', NULL, NULL);
INSERT INTO `tblitem_price` VALUES (400, 11, 400, '2022-02-21', 25110, 27900, 1, '2020-05-15 23:09:39', NULL, NULL);
INSERT INTO `tblitem_price` VALUES (401, 11, 401, '2022-02-21', 18090, 20100, 1, '2020-05-15 23:09:39', NULL, NULL);
INSERT INTO `tblitem_price` VALUES (402, 11, 402, '2022-02-21', 58230, 64700, 1, '2020-05-15 23:09:39', NULL, NULL);
INSERT INTO `tblitem_price` VALUES (403, 11, 403, '2022-02-21', 7020, 7800, 1, '2020-05-15 23:09:39', NULL, NULL);
INSERT INTO `tblitem_price` VALUES (404, 11, 404, '2022-02-21', 16200, 18000, 1, '2020-05-15 23:09:39', NULL, NULL);
INSERT INTO `tblitem_price` VALUES (405, 11, 405, '2022-02-21', 11340, 12600, 1, '2020-05-15 23:09:39', NULL, NULL);
INSERT INTO `tblitem_price` VALUES (406, 11, 406, '2022-02-21', 11340, 12600, 1, '2020-05-15 23:09:39', NULL, NULL);
INSERT INTO `tblitem_price` VALUES (407, 11, 407, '2022-02-21', 11340, 12600, 1, '2020-05-15 23:09:39', NULL, NULL);
INSERT INTO `tblitem_price` VALUES (408, 11, 408, '2022-02-21', 11340, 12600, 1, '2020-05-15 23:09:39', NULL, NULL);
INSERT INTO `tblitem_price` VALUES (409, 11, 409, '2022-02-21', 21420, 23800, 1, '2020-05-15 23:09:39', NULL, NULL);
INSERT INTO `tblitem_price` VALUES (410, 11, 410, '2022-02-21', 11340, 12600, 1, '2020-05-15 23:09:39', NULL, NULL);
INSERT INTO `tblitem_price` VALUES (411, 11, 411, '2022-02-21', 21420, 23800, 1, '2020-05-15 23:09:39', NULL, NULL);
INSERT INTO `tblitem_price` VALUES (412, 11, 412, '2022-02-21', 10530, 11700, 1, '2020-05-15 23:09:39', NULL, NULL);
INSERT INTO `tblitem_price` VALUES (413, 11, 413, '2022-02-21', 19710, 21900, 1, '2020-05-15 23:09:39', NULL, NULL);
INSERT INTO `tblitem_price` VALUES (414, 11, 414, '2022-02-21', 20160, 22400, 1, '2020-05-15 23:09:39', NULL, NULL);
INSERT INTO `tblitem_price` VALUES (415, 11, 415, '2022-02-21', 9000, 10000, 1, '2020-05-15 23:09:39', NULL, NULL);
INSERT INTO `tblitem_price` VALUES (416, 11, 416, '2022-02-21', 17730, 19700, 1, '2020-05-15 23:09:39', NULL, NULL);
INSERT INTO `tblitem_price` VALUES (417, 11, 417, '2022-02-21', 35190, 39100, 1, '2020-05-15 23:09:39', NULL, NULL);
INSERT INTO `tblitem_price` VALUES (418, 11, 418, '2022-02-21', 6750, 7500, 1, '2020-05-15 23:09:39', NULL, NULL);
INSERT INTO `tblitem_price` VALUES (419, 11, 419, '2022-02-21', 15930, 17700, 1, '2020-05-15 23:09:39', NULL, NULL);
INSERT INTO `tblitem_price` VALUES (420, 11, 420, '2022-02-21', 9000, 10000, 1, '2020-05-15 23:09:39', NULL, NULL);
INSERT INTO `tblitem_price` VALUES (421, 11, 421, '2022-02-21', 9000, 10000, 1, '2020-05-15 23:09:39', NULL, NULL);
INSERT INTO `tblitem_price` VALUES (422, 11, 422, '2022-02-21', 9000, 10000, 1, '2020-05-15 23:09:39', NULL, NULL);
INSERT INTO `tblitem_price` VALUES (423, 11, 423, '2022-02-21', 20520, 22800, 1, '2020-05-15 23:09:39', NULL, NULL);
INSERT INTO `tblitem_price` VALUES (424, 11, 424, '2022-02-21', 14940, 16600, 1, '2020-05-15 23:09:39', NULL, NULL);
INSERT INTO `tblitem_price` VALUES (425, 11, 425, '2022-02-21', 22590, 25100, 1, '2020-05-15 23:09:39', NULL, NULL);
INSERT INTO `tblitem_price` VALUES (426, 11, 426, '2022-02-21', 17820, 19800, 1, '2020-05-15 23:09:39', NULL, NULL);
INSERT INTO `tblitem_price` VALUES (427, 11, 427, '2022-02-21', 16200, 18000, 1, '2020-05-15 23:09:39', NULL, NULL);
INSERT INTO `tblitem_price` VALUES (428, 11, 428, '2022-02-21', 14310, 15900, 1, '2020-05-15 23:09:39', NULL, NULL);
INSERT INTO `tblitem_price` VALUES (429, 11, 429, '2022-02-21', 30150, 33500, 1, '2020-05-15 23:09:39', NULL, NULL);
INSERT INTO `tblitem_price` VALUES (430, 11, 430, '2022-02-21', 20520, 22800, 1, '2020-05-15 23:09:39', NULL, NULL);
INSERT INTO `tblitem_price` VALUES (431, 11, 431, '2022-02-21', 5760, 6400, 1, '2020-05-15 23:09:39', NULL, NULL);
INSERT INTO `tblitem_price` VALUES (432, 11, 432, '2022-02-21', 13140, 14600, 1, '2020-05-15 23:09:39', NULL, NULL);
INSERT INTO `tblitem_price` VALUES (433, 11, 433, '2022-02-21', 5760, 6400, 1, '2020-05-15 23:09:39', NULL, NULL);
INSERT INTO `tblitem_price` VALUES (434, 11, 434, '2022-02-21', 5760, 6400, 1, '2020-05-15 23:09:39', NULL, NULL);
INSERT INTO `tblitem_price` VALUES (435, 11, 435, '2022-02-21', 7560, 8400, 1, '2020-05-15 23:09:39', NULL, NULL);
INSERT INTO `tblitem_price` VALUES (436, 11, 436, '2022-02-21', 16740, 18600, 1, '2020-05-15 23:09:39', NULL, NULL);
INSERT INTO `tblitem_price` VALUES (437, 11, 437, '2022-02-21', 6120, 6800, 1, '2020-05-15 23:09:39', NULL, NULL);
INSERT INTO `tblitem_price` VALUES (438, 11, 438, '2022-02-21', 14040, 15600, 1, '2020-05-15 23:09:39', NULL, NULL);
INSERT INTO `tblitem_price` VALUES (439, 11, 439, '2022-02-21', 13500, 15000, 1, '2020-05-15 23:09:39', NULL, NULL);
INSERT INTO `tblitem_price` VALUES (440, 11, 440, '2022-02-21', 13500, 15000, 1, '2020-05-15 23:09:39', NULL, NULL);
INSERT INTO `tblitem_price` VALUES (441, 11, 441, '2022-02-21', 13500, 15000, 1, '2020-05-15 23:09:39', NULL, NULL);
INSERT INTO `tblitem_price` VALUES (442, 11, 442, '2022-02-21', 17820, 19800, 1, '2020-05-15 23:09:39', NULL, NULL);
INSERT INTO `tblitem_price` VALUES (443, 11, 443, '2022-02-21', 6480, 7200, 1, '2020-05-15 23:09:39', NULL, NULL);
INSERT INTO `tblitem_price` VALUES (444, 11, 444, '2022-02-21', 12510, 13900, 1, '2020-05-15 23:09:39', NULL, NULL);
INSERT INTO `tblitem_price` VALUES (445, 11, 445, '2022-02-21', 22500, 25000, 1, '2020-05-15 23:09:39', NULL, NULL);
INSERT INTO `tblitem_price` VALUES (446, 11, 446, '2022-02-21', 15660, 17400, 1, '2020-05-15 23:09:39', NULL, NULL);
INSERT INTO `tblitem_price` VALUES (447, 11, 447, '2022-02-21', 14130, 15700, 1, '2020-05-15 23:09:39', NULL, NULL);
INSERT INTO `tblitem_price` VALUES (448, 11, 448, '2022-02-21', 6930, 7700, 1, '2020-05-15 23:09:39', NULL, NULL);
INSERT INTO `tblitem_price` VALUES (449, 11, 449, '2022-02-21', 29160, 32400, 1, '2020-05-15 23:09:39', NULL, NULL);
INSERT INTO `tblitem_price` VALUES (450, 11, 450, '2022-02-21', 6120, 6800, 1, '2020-05-15 23:09:39', NULL, NULL);
INSERT INTO `tblitem_price` VALUES (451, 11, 451, '2022-02-21', 23580, 26200, 1, '2020-05-15 23:09:39', NULL, NULL);
INSERT INTO `tblitem_price` VALUES (452, 11, 452, '2022-02-21', 19440, 21600, 1, '2020-05-15 23:09:39', NULL, NULL);
INSERT INTO `tblitem_price` VALUES (453, 11, 453, '2022-02-21', 19620, 21800, 1, '2020-05-15 23:09:39', NULL, NULL);
INSERT INTO `tblitem_price` VALUES (454, 11, 454, '2022-02-21', 9000, 10000, 1, '2020-05-15 23:09:39', NULL, NULL);
INSERT INTO `tblitem_price` VALUES (455, 11, 455, '2022-02-21', 9900, 11000, 1, '2020-05-15 23:09:39', NULL, NULL);
INSERT INTO `tblitem_price` VALUES (456, 11, 456, '2022-02-21', 6030, 6700, 1, '2020-05-15 23:09:39', NULL, NULL);
INSERT INTO `tblitem_price` VALUES (457, 11, 457, '2022-02-21', 6390, 7100, 1, '2020-05-15 23:09:39', NULL, NULL);
INSERT INTO `tblitem_price` VALUES (458, 11, 458, '2022-02-21', 21330, 23700, 1, '2020-05-15 23:09:39', NULL, NULL);
INSERT INTO `tblitem_price` VALUES (459, 11, 459, '2022-02-21', 22230, 24700, 1, '2020-05-15 23:09:39', NULL, NULL);
INSERT INTO `tblitem_price` VALUES (460, 11, 460, '2022-02-21', 22230, 24700, 1, '2020-05-15 23:09:39', NULL, NULL);
INSERT INTO `tblitem_price` VALUES (461, 11, 461, '2022-02-21', 9090, 10100, 1, '2020-05-15 23:09:39', NULL, NULL);
INSERT INTO `tblitem_price` VALUES (462, 11, 462, '2022-02-21', 9090, 10100, 1, '2020-05-15 23:09:39', NULL, NULL);
INSERT INTO `tblitem_price` VALUES (463, 11, 463, '2022-02-21', 9090, 10100, 1, '2020-05-15 23:09:39', NULL, NULL);
INSERT INTO `tblitem_price` VALUES (464, 11, 464, '2022-02-21', 11970, 13300, 1, '2020-05-15 23:09:39', NULL, NULL);
INSERT INTO `tblitem_price` VALUES (465, 11, 465, '2022-02-21', 18270, 20300, 1, '2020-05-15 23:09:39', NULL, NULL);
INSERT INTO `tblitem_price` VALUES (466, 11, 466, '2022-02-21', 10710, 11900, 1, '2020-05-15 23:09:39', NULL, NULL);
INSERT INTO `tblitem_price` VALUES (467, 11, 467, '2022-02-21', 19080, 21200, 1, '2020-05-15 23:09:39', NULL, NULL);
INSERT INTO `tblitem_price` VALUES (468, 11, 468, '2022-02-21', 12600, 14000, 1, '2020-05-15 23:09:39', NULL, NULL);
INSERT INTO `tblitem_price` VALUES (469, 11, 469, '2022-02-21', 12600, 14000, 1, '2020-05-15 23:09:39', NULL, NULL);
INSERT INTO `tblitem_price` VALUES (470, 11, 470, '2022-02-21', 12600, 14000, 1, '2020-05-15 23:09:39', NULL, NULL);
INSERT INTO `tblitem_price` VALUES (471, 11, 471, '2022-02-21', 12600, 14000, 1, '2020-05-15 23:09:39', NULL, NULL);
INSERT INTO `tblitem_price` VALUES (472, 11, 472, '2022-02-21', 12600, 14000, 1, '2020-05-15 23:09:39', NULL, NULL);
INSERT INTO `tblitem_price` VALUES (473, 11, 473, '2022-02-21', 12600, 14000, 1, '2020-05-15 23:09:39', NULL, NULL);
INSERT INTO `tblitem_price` VALUES (474, 11, 474, '2022-02-21', 7920, 8800, 1, '2020-05-15 23:09:39', NULL, NULL);
INSERT INTO `tblitem_price` VALUES (475, 11, 475, '2022-02-21', 7920, 8800, 1, '2020-05-15 23:09:39', NULL, NULL);
INSERT INTO `tblitem_price` VALUES (476, 11, 476, '2022-02-21', 7920, 8800, 1, '2020-05-15 23:09:39', NULL, NULL);
INSERT INTO `tblitem_price` VALUES (477, 11, 477, '2022-02-21', 7920, 8800, 1, '2020-05-15 23:09:39', NULL, NULL);
INSERT INTO `tblitem_price` VALUES (478, 11, 478, '2022-02-21', 10620, 11800, 1, '2020-05-15 23:09:39', NULL, NULL);
INSERT INTO `tblitem_price` VALUES (479, 11, 479, '2022-02-21', 27090, 30100, 1, '2020-05-15 23:09:39', NULL, NULL);
INSERT INTO `tblitem_price` VALUES (480, 11, 480, '2022-02-21', 5580, 6200, 1, '2020-05-15 23:09:39', NULL, NULL);
INSERT INTO `tblitem_price` VALUES (481, 11, 481, '2022-02-21', 13950, 15500, 1, '2020-05-15 23:09:39', NULL, NULL);
INSERT INTO `tblitem_price` VALUES (482, 11, 482, '2022-02-21', 22050, 24500, 1, '2020-05-15 23:09:39', NULL, NULL);
INSERT INTO `tblitem_price` VALUES (483, 11, 483, '2022-02-21', 22050, 24500, 1, '2020-05-15 23:09:39', NULL, NULL);
INSERT INTO `tblitem_price` VALUES (484, 11, 484, '2022-02-21', 12150, 13500, 1, '2020-05-15 23:09:39', NULL, NULL);
INSERT INTO `tblitem_price` VALUES (485, 11, 485, '2022-02-21', 12150, 13500, 1, '2020-05-15 23:09:39', NULL, NULL);
INSERT INTO `tblitem_price` VALUES (486, 11, 486, '2022-02-21', 20250, 22500, 1, '2020-05-15 23:09:39', NULL, NULL);
INSERT INTO `tblitem_price` VALUES (487, 11, 487, '2022-02-21', 9720, 10800, 1, '2020-05-15 23:09:39', NULL, NULL);
INSERT INTO `tblitem_price` VALUES (488, 11, 488, '2022-02-21', 34470, 38300, 1, '2020-05-15 23:09:39', NULL, NULL);
INSERT INTO `tblitem_price` VALUES (489, 11, 489, '2022-02-21', 27540, 30600, 1, '2020-05-15 23:09:39', NULL, NULL);
INSERT INTO `tblitem_price` VALUES (490, 11, 490, '2022-02-21', 96750, 107500, 1, '2020-05-15 23:09:39', NULL, NULL);
INSERT INTO `tblitem_price` VALUES (491, 11, 491, '2022-02-21', 41490, 46100, 1, '2020-05-15 23:09:39', NULL, NULL);
INSERT INTO `tblitem_price` VALUES (492, 11, 492, '2022-02-21', 28620, 31800, 1, '2020-05-15 23:09:39', NULL, NULL);
INSERT INTO `tblitem_price` VALUES (493, 11, 493, '2022-02-21', 10800, 12000, 1, '2020-05-15 23:09:39', NULL, NULL);
INSERT INTO `tblitem_price` VALUES (494, 11, 494, '2022-02-21', 13140, 14600, 1, '2020-05-15 23:09:39', NULL, NULL);
INSERT INTO `tblitem_price` VALUES (495, 11, 495, '2022-02-21', 7740, 8600, 1, '2020-05-15 23:09:39', NULL, NULL);
INSERT INTO `tblitem_price` VALUES (496, 11, 496, '2022-02-21', 9000, 10000, 1, '2020-05-15 23:09:39', NULL, NULL);
INSERT INTO `tblitem_price` VALUES (497, 11, 497, '2022-02-21', 7650, 8500, 1, '2020-05-15 23:09:39', NULL, NULL);
INSERT INTO `tblitem_price` VALUES (498, 11, 498, '2022-02-21', 12780, 14200, 1, '2020-05-15 23:09:39', NULL, NULL);
INSERT INTO `tblitem_price` VALUES (499, 11, 499, '2022-02-21', 9360, 10400, 1, '2020-05-15 23:09:39', NULL, NULL);
INSERT INTO `tblitem_price` VALUES (500, 11, 500, '2022-02-21', 9360, 10400, 1, '2020-05-15 23:09:39', NULL, NULL);
INSERT INTO `tblitem_price` VALUES (501, 11, 501, '2022-02-21', 9360, 10400, 1, '2020-05-15 23:09:39', NULL, NULL);
INSERT INTO `tblitem_price` VALUES (502, 11, 502, '2022-02-21', 9360, 10400, 1, '2020-05-15 23:09:39', NULL, NULL);
INSERT INTO `tblitem_price` VALUES (503, 11, 503, '2022-02-21', 10800, 12000, 1, '2020-05-15 23:09:39', NULL, NULL);
INSERT INTO `tblitem_price` VALUES (504, 11, 504, '2022-02-21', 13050, 14500, 1, '2020-05-15 23:09:39', NULL, NULL);
INSERT INTO `tblitem_price` VALUES (505, 11, 505, '2022-02-21', 7650, 8500, 1, '2020-05-15 23:09:39', NULL, NULL);
INSERT INTO `tblitem_price` VALUES (506, 11, 506, '2022-02-21', 5040, 5600, 1, '2020-05-15 23:09:39', NULL, NULL);
INSERT INTO `tblitem_price` VALUES (507, 11, 507, '2022-02-21', 9720, 10800, 1, '2020-05-15 23:09:39', NULL, NULL);
INSERT INTO `tblitem_price` VALUES (508, 11, 508, '2022-02-21', 8550, 9500, 1, '2020-05-15 23:09:39', NULL, NULL);
INSERT INTO `tblitem_price` VALUES (509, 11, 509, '2022-02-21', 9450, 10500, 1, '2020-05-15 23:09:39', NULL, NULL);
INSERT INTO `tblitem_price` VALUES (510, 11, 510, '2022-02-21', 8550, 9500, 1, '2020-05-15 23:09:39', NULL, NULL);
INSERT INTO `tblitem_price` VALUES (511, 11, 511, '2022-02-21', 8550, 9500, 1, '2020-05-15 23:09:39', NULL, NULL);
INSERT INTO `tblitem_price` VALUES (512, 11, 512, '2022-02-21', 9450, 10500, 1, '2020-05-15 23:09:39', NULL, NULL);
INSERT INTO `tblitem_price` VALUES (513, 11, 513, '2022-02-21', 8820, 9800, 1, '2020-05-15 23:09:39', NULL, NULL);
INSERT INTO `tblitem_price` VALUES (514, 11, 514, '2022-02-21', 8550, 9500, 1, '2020-05-15 23:09:39', NULL, NULL);
INSERT INTO `tblitem_price` VALUES (515, 11, 515, '2022-02-21', 10350, 11500, 1, '2020-05-15 23:09:39', NULL, NULL);
INSERT INTO `tblitem_price` VALUES (516, 11, 516, '2022-02-21', 10350, 11500, 1, '2020-05-15 23:09:39', NULL, NULL);
INSERT INTO `tblitem_price` VALUES (517, 11, 517, '2022-02-21', 10350, 11500, 1, '2020-05-15 23:09:39', NULL, NULL);
INSERT INTO `tblitem_price` VALUES (518, 11, 518, '2022-02-21', 9000, 10000, 1, '2020-05-15 23:09:39', NULL, NULL);
INSERT INTO `tblitem_price` VALUES (519, 11, 519, '2022-02-21', 9900, 11000, 1, '2020-05-15 23:09:39', NULL, NULL);
INSERT INTO `tblitem_price` VALUES (520, 11, 520, '2022-02-21', 12600, 14000, 1, '2020-05-15 23:09:39', NULL, NULL);
INSERT INTO `tblitem_price` VALUES (521, 11, 521, '2022-02-21', 9450, 10500, 1, '2020-05-15 23:09:39', NULL, NULL);
INSERT INTO `tblitem_price` VALUES (522, 11, 522, '2022-02-21', 22050, 24500, 1, '2020-05-15 23:09:39', NULL, NULL);
INSERT INTO `tblitem_price` VALUES (523, 11, 523, '2022-02-21', 11520, 12800, 1, '2020-05-15 23:09:39', NULL, NULL);
INSERT INTO `tblitem_price` VALUES (524, 11, 524, '2022-02-21', 19620, 21800, 1, '2020-05-15 23:09:39', NULL, NULL);
INSERT INTO `tblitem_price` VALUES (525, 11, 525, '2022-02-21', 11520, 12800, 1, '2020-05-15 23:09:39', NULL, NULL);
INSERT INTO `tblitem_price` VALUES (526, 11, 526, '2022-02-21', 19620, 21800, 1, '2020-05-15 23:09:39', NULL, NULL);
INSERT INTO `tblitem_price` VALUES (527, 11, 527, '2022-02-21', 11520, 12800, 1, '2020-05-15 23:09:39', NULL, NULL);
INSERT INTO `tblitem_price` VALUES (528, 11, 528, '2022-02-21', 19620, 21800, 1, '2020-05-15 23:09:39', NULL, NULL);
INSERT INTO `tblitem_price` VALUES (529, 11, 529, '2022-02-21', 14310, 15900, 1, '2020-05-15 23:09:39', NULL, NULL);
INSERT INTO `tblitem_price` VALUES (530, 11, 530, '2022-02-21', 24300, 27000, 1, '2020-05-15 23:09:39', NULL, NULL);
INSERT INTO `tblitem_price` VALUES (531, 11, 531, '2022-02-21', 59670, 66300, 1, '2020-05-15 23:09:39', NULL, NULL);
INSERT INTO `tblitem_price` VALUES (532, 11, 532, '2022-02-21', 18900, 21000, 1, '2020-05-15 23:09:39', NULL, NULL);
INSERT INTO `tblitem_price` VALUES (533, 11, 533, '2022-02-21', 40500, 45000, 1, '2020-05-15 23:09:39', NULL, NULL);
INSERT INTO `tblitem_price` VALUES (534, 11, 534, '2022-02-21', 50400, 56000, 1, '2020-05-15 23:09:39', NULL, NULL);
INSERT INTO `tblitem_price` VALUES (535, 11, 535, '2022-02-21', 50400, 56000, 1, '2020-05-15 23:09:39', NULL, NULL);
INSERT INTO `tblitem_price` VALUES (536, 11, 536, '2022-02-21', 50400, 56000, 1, '2020-05-15 23:09:39', NULL, NULL);
INSERT INTO `tblitem_price` VALUES (537, 11, 537, '2022-02-21', 25650, 28500, 1, '2020-05-15 23:09:39', NULL, NULL);
INSERT INTO `tblitem_price` VALUES (538, 11, 538, '2022-02-21', 21870, 24300, 1, '2020-05-15 23:09:39', NULL, NULL);
INSERT INTO `tblitem_price` VALUES (539, 11, 539, '2022-02-21', 42930, 47700, 1, '2020-05-15 23:09:39', NULL, NULL);
INSERT INTO `tblitem_price` VALUES (540, 11, 540, '2022-02-21', 21870, 24300, 1, '2020-05-15 23:09:39', NULL, NULL);
INSERT INTO `tblitem_price` VALUES (541, 11, 541, '2022-02-21', 42930, 47700, 1, '2020-05-15 23:09:39', NULL, NULL);
INSERT INTO `tblitem_price` VALUES (542, 11, 542, '2022-02-21', 22320, 24800, 1, '2020-05-15 23:09:39', NULL, NULL);
INSERT INTO `tblitem_price` VALUES (543, 11, 543, '2022-02-21', 19890, 22100, 1, '2020-05-15 23:09:39', NULL, NULL);
INSERT INTO `tblitem_price` VALUES (544, 11, 544, '2022-02-21', 17010, 18900, 1, '2020-05-15 23:09:39', NULL, NULL);
INSERT INTO `tblitem_price` VALUES (545, 11, 545, '2022-02-21', 17820, 19800, 1, '2020-05-15 23:09:39', NULL, NULL);
INSERT INTO `tblitem_price` VALUES (546, 11, 546, '2022-02-21', 9360, 10400, 1, '2020-05-15 23:09:39', NULL, NULL);
INSERT INTO `tblitem_price` VALUES (547, 11, 547, '2022-02-21', 17010, 18900, 1, '2020-05-15 23:09:39', NULL, NULL);
INSERT INTO `tblitem_price` VALUES (548, 11, 548, '2022-02-21', 24210, 26900, 1, '2020-05-15 23:09:39', NULL, NULL);
INSERT INTO `tblitem_price` VALUES (549, 11, 549, '2022-02-21', 20430, 22700, 1, '2020-05-15 23:09:39', NULL, NULL);
INSERT INTO `tblitem_price` VALUES (550, 11, 550, '2022-02-21', 17460, 19400, 1, '2020-05-15 23:09:39', NULL, NULL);
INSERT INTO `tblitem_price` VALUES (551, 11, 551, '2022-02-21', 5850, 6500, 1, '2020-05-15 23:09:39', NULL, NULL);
INSERT INTO `tblitem_price` VALUES (552, 11, 552, '2022-02-21', 13500, 15000, 1, '2020-05-15 23:09:39', NULL, NULL);
INSERT INTO `tblitem_price` VALUES (553, 11, 553, '2022-02-21', 27000, 30000, 1, '2020-05-15 23:09:39', NULL, NULL);
INSERT INTO `tblitem_price` VALUES (554, 11, 554, '2022-02-21', 5850, 6500, 1, '2020-05-15 23:09:39', NULL, NULL);
INSERT INTO `tblitem_price` VALUES (555, 11, 555, '2022-02-21', 13500, 15000, 1, '2020-05-15 23:09:39', NULL, NULL);
INSERT INTO `tblitem_price` VALUES (556, 11, 556, '2022-02-21', 27000, 30000, 1, '2020-05-15 23:09:39', NULL, NULL);
INSERT INTO `tblitem_price` VALUES (557, 11, 557, '2022-02-21', 13500, 15000, 1, '2020-05-15 23:09:39', NULL, NULL);
INSERT INTO `tblitem_price` VALUES (558, 11, 558, '2022-02-21', 13500, 15000, 1, '2020-05-15 23:09:39', NULL, NULL);
INSERT INTO `tblitem_price` VALUES (559, 11, 559, '2022-02-21', 13500, 15000, 1, '2020-05-15 23:09:39', NULL, NULL);
INSERT INTO `tblitem_price` VALUES (560, 11, 560, '2022-02-21', 14310, 15900, 1, '2020-05-15 23:09:39', NULL, NULL);
INSERT INTO `tblitem_price` VALUES (561, 11, 561, '2022-02-21', 19350, 21500, 1, '2020-05-15 23:09:39', NULL, NULL);
INSERT INTO `tblitem_price` VALUES (562, 11, 562, '2022-02-21', 26550, 29500, 1, '2020-05-15 23:09:39', NULL, NULL);
INSERT INTO `tblitem_price` VALUES (563, 11, 563, '2022-02-21', 13050, 14500, 1, '2020-05-15 23:09:39', NULL, NULL);
INSERT INTO `tblitem_price` VALUES (564, 11, 564, '2022-02-21', 13500, 15000, 1, '2020-05-15 23:09:39', NULL, NULL);
INSERT INTO `tblitem_price` VALUES (565, 11, 565, '2022-02-21', 33840, 37600, 1, '2020-05-15 23:09:39', NULL, NULL);
INSERT INTO `tblitem_price` VALUES (566, 11, 566, '2022-02-21', 10890, 12100, 1, '2020-05-15 23:09:39', NULL, NULL);
INSERT INTO `tblitem_price` VALUES (567, 11, 567, '2022-02-21', 5310, 5900, 1, '2020-05-15 23:09:39', NULL, NULL);
INSERT INTO `tblitem_price` VALUES (568, 11, 568, '2022-02-21', 9630, 10700, 1, '2020-05-15 23:09:39', NULL, NULL);
INSERT INTO `tblitem_price` VALUES (569, 11, 569, '2022-02-21', 7740, 8600, 1, '2020-05-15 23:09:39', NULL, NULL);
INSERT INTO `tblitem_price` VALUES (570, 11, 570, '2022-02-21', 5310, 5900, 1, '2020-05-15 23:09:39', NULL, NULL);
INSERT INTO `tblitem_price` VALUES (571, 11, 571, '2022-02-21', 13590, 15100, 1, '2020-05-15 23:09:39', NULL, NULL);
INSERT INTO `tblitem_price` VALUES (572, 11, 572, '2022-02-21', 21690, 24100, 1, '2020-05-15 23:09:39', NULL, NULL);
INSERT INTO `tblitem_price` VALUES (573, 11, 573, '2022-02-21', 19800, 22000, 1, '2020-05-15 23:09:39', NULL, NULL);
INSERT INTO `tblitem_price` VALUES (574, 11, 574, '2022-02-21', 25380, 28200, 1, '2020-05-15 23:09:39', NULL, NULL);
INSERT INTO `tblitem_price` VALUES (575, 11, 575, '2022-02-21', 17100, 19000, 1, '2020-05-15 23:09:39', NULL, NULL);
INSERT INTO `tblitem_price` VALUES (576, 11, 576, '2022-02-21', 4320, 4800, 1, '2020-05-15 23:09:39', NULL, NULL);
INSERT INTO `tblitem_price` VALUES (577, 11, 577, '2022-02-21', 3150, 3500, 1, '2020-05-15 23:09:39', NULL, NULL);
INSERT INTO `tblitem_price` VALUES (578, 11, 578, '2022-02-21', 7380, 8200, 1, '2020-05-15 23:09:39', NULL, NULL);
INSERT INTO `tblitem_price` VALUES (579, 11, 579, '2022-02-21', 11340, 12600, 1, '2020-05-15 23:09:39', NULL, NULL);
INSERT INTO `tblitem_price` VALUES (580, 11, 580, '2022-02-21', 12780, 14200, 1, '2020-05-15 23:09:39', NULL, NULL);
INSERT INTO `tblitem_price` VALUES (581, 11, 581, '2022-02-21', 9540, 10600, 1, '2020-05-15 23:09:39', NULL, NULL);
INSERT INTO `tblitem_price` VALUES (582, 11, 582, '2022-02-21', 9450, 10500, 1, '2020-05-15 23:09:39', NULL, NULL);
INSERT INTO `tblitem_price` VALUES (583, 11, 583, '2022-02-21', 18270, 20300, 1, '2020-05-15 23:09:39', NULL, NULL);
INSERT INTO `tblitem_price` VALUES (584, 11, 584, '2022-02-21', 19800, 22000, 1, '2020-05-15 23:09:39', NULL, NULL);
INSERT INTO `tblitem_price` VALUES (585, 11, 585, '2022-02-21', 19800, 22000, 1, '2020-05-15 23:09:39', NULL, NULL);
INSERT INTO `tblitem_price` VALUES (586, 11, 586, '2022-02-21', 26550, 29500, 1, '2020-05-15 23:09:39', NULL, NULL);
INSERT INTO `tblitem_price` VALUES (587, 11, 587, '2022-02-21', 8100, 9000, 1, '2020-05-15 23:09:39', NULL, NULL);
INSERT INTO `tblitem_price` VALUES (588, 11, 588, '2022-02-21', 24840, 27600, 1, '2020-05-15 23:09:39', NULL, NULL);
INSERT INTO `tblitem_price` VALUES (589, 11, 589, '2022-02-21', 44820, 49800, 1, '2020-05-15 23:09:39', NULL, NULL);
INSERT INTO `tblitem_price` VALUES (590, 11, 590, '2022-02-21', 11430, 12700, 1, '2020-05-15 23:09:39', NULL, NULL);
INSERT INTO `tblitem_price` VALUES (591, 11, 591, '2022-02-21', 22950, 25500, 1, '2020-05-15 23:09:39', NULL, NULL);
INSERT INTO `tblitem_price` VALUES (592, 11, 592, '2022-02-21', 22950, 25500, 1, '2020-05-15 23:09:39', NULL, NULL);
INSERT INTO `tblitem_price` VALUES (593, 11, 593, '2022-02-21', 22950, 25500, 1, '2020-05-15 23:09:39', NULL, NULL);
INSERT INTO `tblitem_price` VALUES (594, 11, 594, '2022-02-21', 22950, 25500, 1, '2020-05-15 23:09:39', NULL, NULL);
INSERT INTO `tblitem_price` VALUES (595, 11, 595, '2022-02-21', 22950, 25500, 1, '2020-05-15 23:09:39', NULL, NULL);
INSERT INTO `tblitem_price` VALUES (596, 11, 596, '2022-02-21', 22950, 25500, 1, '2020-05-15 23:09:39', NULL, NULL);
INSERT INTO `tblitem_price` VALUES (597, 11, 597, '2022-02-21', 24750, 27500, 1, '2020-05-15 23:09:39', NULL, NULL);
INSERT INTO `tblitem_price` VALUES (598, 11, 598, '2022-02-21', 18360, 20400, 1, '2020-05-15 23:09:39', NULL, NULL);
INSERT INTO `tblitem_price` VALUES (599, 11, 599, '2022-02-21', 8820, 9800, 1, '2020-05-15 23:09:39', NULL, NULL);
INSERT INTO `tblitem_price` VALUES (600, 11, 600, '2022-02-21', 17460, 19400, 1, '2020-05-15 23:09:39', NULL, NULL);
INSERT INTO `tblitem_price` VALUES (601, 11, 601, '2022-02-21', 11880, 13200, 1, '2020-05-15 23:09:39', NULL, NULL);
INSERT INTO `tblitem_price` VALUES (602, 11, 602, '2022-02-21', 36000, 40000, 1, '2020-05-15 23:09:39', NULL, NULL);
INSERT INTO `tblitem_price` VALUES (603, 11, 603, '2022-02-21', 36900, 41000, 1, '2020-05-15 23:09:39', NULL, NULL);
INSERT INTO `tblitem_price` VALUES (604, 11, 604, '2022-02-21', 31500, 35000, 1, '2020-05-15 23:09:39', NULL, NULL);
INSERT INTO `tblitem_price` VALUES (605, 11, 605, '2022-02-21', 32220, 35800, 1, '2020-05-15 23:09:39', NULL, NULL);
INSERT INTO `tblitem_price` VALUES (606, 11, 606, '2022-02-21', 43200, 48000, 1, '2020-05-15 23:09:39', NULL, NULL);
INSERT INTO `tblitem_price` VALUES (607, 11, 607, '2022-02-21', 41220, 45800, 1, '2020-05-15 23:09:39', NULL, NULL);
INSERT INTO `tblitem_price` VALUES (608, 11, 608, '2022-02-21', 20880, 23200, 1, '2020-05-15 23:09:39', NULL, NULL);
INSERT INTO `tblitem_price` VALUES (609, 11, 609, '2022-02-21', 34200, 38000, 1, '2020-05-15 23:09:39', NULL, NULL);
INSERT INTO `tblitem_price` VALUES (610, 11, 610, '2022-02-21', 35640, 39600, 1, '2020-05-15 23:09:39', NULL, NULL);
INSERT INTO `tblitem_price` VALUES (611, 11, 611, '2022-02-21', 33300, 37000, 1, '2020-05-15 23:09:39', NULL, NULL);
INSERT INTO `tblitem_price` VALUES (612, 11, 612, '2022-02-21', 32670, 36300, 1, '2020-05-15 23:09:39', NULL, NULL);
INSERT INTO `tblitem_price` VALUES (613, 11, 613, '2022-02-21', 6030, 6700, 1, '2020-05-15 23:09:39', NULL, NULL);
INSERT INTO `tblitem_price` VALUES (614, 11, 614, '2022-02-21', 36900, 41000, 1, '2020-05-15 23:09:39', NULL, NULL);
INSERT INTO `tblitem_price` VALUES (615, 11, 615, '2022-02-21', 33030, 36700, 1, '2020-05-15 23:09:39', NULL, NULL);
INSERT INTO `tblitem_price` VALUES (616, 11, 616, '2022-02-21', 90900, 101000, 1, '2020-05-15 23:09:39', NULL, NULL);
INSERT INTO `tblitem_price` VALUES (617, 11, 617, '2022-02-21', 79560, 88400, 1, '2020-05-15 23:09:39', NULL, NULL);
INSERT INTO `tblitem_price` VALUES (618, 11, 618, '2022-02-21', 87840, 97600, 1, '2020-05-15 23:09:39', NULL, NULL);
INSERT INTO `tblitem_price` VALUES (619, 11, 619, '2022-02-21', 95850, 106500, 1, '2020-05-15 23:09:39', NULL, NULL);
INSERT INTO `tblitem_price` VALUES (620, 11, 620, '2022-02-21', 29700, 33000, 1, '2020-05-15 23:09:39', NULL, NULL);
INSERT INTO `tblitem_price` VALUES (621, 11, 621, '2022-02-21', 21600, 24000, 1, '2020-05-15 23:09:39', NULL, NULL);
INSERT INTO `tblitem_price` VALUES (622, 11, 622, '2022-02-21', 21600, 24000, 1, '2020-05-15 23:09:39', NULL, NULL);
INSERT INTO `tblitem_price` VALUES (623, 11, 623, '2022-02-21', 40950, 45500, 1, '2020-05-15 23:09:39', NULL, NULL);
INSERT INTO `tblitem_price` VALUES (624, 11, 624, '2022-02-21', 40950, 45500, 1, '2020-05-15 23:09:39', NULL, NULL);
INSERT INTO `tblitem_price` VALUES (625, 11, 625, '2022-02-21', 8550, 9500, 1, '2020-05-15 23:09:39', NULL, NULL);
INSERT INTO `tblitem_price` VALUES (626, 11, 626, '2022-02-21', 8640, 9600, 1, '2020-05-15 23:09:39', NULL, NULL);
INSERT INTO `tblitem_price` VALUES (627, 11, 627, '2022-02-21', 9900, 11000, 1, '2020-05-15 23:09:39', NULL, NULL);
INSERT INTO `tblitem_price` VALUES (628, 11, 628, '2022-02-21', 12420, 13800, 1, '2020-05-15 23:09:39', NULL, NULL);
INSERT INTO `tblitem_price` VALUES (629, 11, 629, '2022-02-21', 15840, 17600, 1, '2020-05-15 23:09:39', NULL, NULL);
INSERT INTO `tblitem_price` VALUES (630, 11, 630, '2022-02-21', 20160, 22400, 1, '2020-05-15 23:09:39', NULL, NULL);
INSERT INTO `tblitem_price` VALUES (631, 11, 631, '2022-02-21', 13950, 15500, 1, '2020-05-15 23:09:39', NULL, NULL);
INSERT INTO `tblitem_price` VALUES (632, 11, 632, '2022-02-21', 14670, 16300, 1, '2020-05-15 23:09:39', NULL, NULL);
INSERT INTO `tblitem_price` VALUES (633, 11, 633, '2022-02-21', 16830, 18700, 1, '2020-05-15 23:09:39', NULL, NULL);
INSERT INTO `tblitem_price` VALUES (634, 11, 634, '2022-02-21', 4500, 5000, 1, '2020-05-15 23:09:39', NULL, NULL);
INSERT INTO `tblitem_price` VALUES (635, 11, 635, '2022-02-21', 4500, 5000, 1, '2020-05-15 23:09:39', NULL, NULL);
INSERT INTO `tblitem_price` VALUES (636, 11, 636, '2022-02-21', 31320, 34800, 1, '2020-05-15 23:09:39', NULL, NULL);
INSERT INTO `tblitem_price` VALUES (637, 11, 637, '2022-02-21', 35550, 39500, 1, '2020-05-15 23:09:39', NULL, NULL);
INSERT INTO `tblitem_price` VALUES (638, 11, 638, '2022-02-21', 11160, 12400, 1, '2020-05-15 23:09:39', NULL, NULL);
INSERT INTO `tblitem_price` VALUES (639, 11, 639, '2022-02-21', 15300, 17000, 1, '2020-05-15 23:09:39', NULL, NULL);
INSERT INTO `tblitem_price` VALUES (640, 11, 640, '2022-02-21', 16740, 18600, 1, '2020-05-15 23:09:39', NULL, NULL);
INSERT INTO `tblitem_price` VALUES (641, 11, 641, '2022-02-21', 11520, 12800, 1, '2020-05-15 23:09:39', NULL, NULL);
INSERT INTO `tblitem_price` VALUES (642, 11, 642, '2022-02-21', 31860, 35400, 1, '2020-05-15 23:09:39', NULL, NULL);
INSERT INTO `tblitem_price` VALUES (643, 11, 643, '2022-02-21', 12330, 13700, 1, '2020-05-15 23:09:39', NULL, NULL);
INSERT INTO `tblitem_price` VALUES (644, 11, 644, '2022-02-21', 26730, 29700, 1, '2020-05-15 23:09:39', NULL, NULL);
INSERT INTO `tblitem_price` VALUES (645, 11, 645, '2022-02-21', 13410, 14900, 1, '2020-05-15 23:09:39', NULL, NULL);
INSERT INTO `tblitem_price` VALUES (646, 11, 646, '2022-02-21', 24660, 27400, 1, '2020-05-15 23:09:39', NULL, NULL);
INSERT INTO `tblitem_price` VALUES (647, 11, 647, '2022-02-21', 26730, 29700, 1, '2020-05-15 23:09:39', NULL, NULL);
INSERT INTO `tblitem_price` VALUES (648, 11, 648, '2022-02-21', 13410, 14900, 1, '2020-05-15 23:09:39', NULL, NULL);
INSERT INTO `tblitem_price` VALUES (649, 11, 649, '2022-02-21', 7110, 7900, 1, '2020-05-15 23:09:39', NULL, NULL);
INSERT INTO `tblitem_price` VALUES (650, 11, 650, '2022-02-21', 13500, 15000, 1, '2020-05-15 23:09:39', NULL, NULL);
INSERT INTO `tblitem_price` VALUES (651, 11, 651, '2022-02-21', 18270, 20300, 1, '2020-05-15 23:09:39', NULL, NULL);
INSERT INTO `tblitem_price` VALUES (652, 11, 652, '2022-02-21', 18270, 20300, 1, '2020-05-15 23:09:39', NULL, NULL);
INSERT INTO `tblitem_price` VALUES (653, 11, 653, '2022-02-21', 17640, 19600, 1, '2020-05-15 23:09:39', NULL, NULL);
INSERT INTO `tblitem_price` VALUES (654, 11, 654, '2022-02-21', 10260, 11400, 1, '2020-05-15 23:09:39', NULL, NULL);
INSERT INTO `tblitem_price` VALUES (655, 11, 655, '2022-02-21', 27900, 31000, 1, '2020-05-15 23:09:39', NULL, NULL);
INSERT INTO `tblitem_price` VALUES (656, 11, 656, '2022-02-21', 30600, 34000, 1, '2020-05-15 23:09:39', NULL, NULL);
INSERT INTO `tblitem_price` VALUES (657, 11, 657, '2022-02-21', 23670, 26300, 1, '2020-05-15 23:09:39', NULL, NULL);
INSERT INTO `tblitem_price` VALUES (658, 11, 658, '2022-02-21', 9720, 10800, 1, '2020-05-15 23:09:39', NULL, NULL);
INSERT INTO `tblitem_price` VALUES (659, 11, 659, '2022-02-21', 10440, 11600, 1, '2020-05-15 23:09:39', NULL, NULL);
INSERT INTO `tblitem_price` VALUES (660, 11, 660, '2022-02-21', 37350, 41500, 1, '2020-05-15 23:09:39', NULL, NULL);
INSERT INTO `tblitem_price` VALUES (661, 11, 661, '2022-02-21', 37350, 41500, 1, '2020-05-15 23:09:39', NULL, NULL);
INSERT INTO `tblitem_price` VALUES (662, 11, 662, '2022-02-21', 32040, 35600, 1, '2020-05-15 23:09:39', NULL, NULL);
INSERT INTO `tblitem_price` VALUES (663, 11, 663, '2022-02-21', 32040, 35600, 1, '2020-05-15 23:09:39', NULL, NULL);
INSERT INTO `tblitem_price` VALUES (664, 11, 664, '2022-02-21', 34650, 38500, 1, '2020-05-15 23:09:39', NULL, NULL);
INSERT INTO `tblitem_price` VALUES (665, 11, 665, '2022-02-21', 31950, 35500, 1, '2020-05-15 23:09:39', NULL, NULL);
INSERT INTO `tblitem_price` VALUES (666, 11, 666, '2022-02-21', 42750, 47500, 1, '2020-05-15 23:09:39', NULL, NULL);
INSERT INTO `tblitem_price` VALUES (667, 11, 667, '2022-02-21', 24210, 26900, 1, '2020-05-15 23:09:39', NULL, NULL);
INSERT INTO `tblitem_price` VALUES (668, 11, 668, '2022-02-21', 39960, 44400, 1, '2020-05-15 23:09:39', NULL, NULL);
INSERT INTO `tblitem_price` VALUES (669, 11, 669, '2022-02-21', 13500, 15000, 1, '2020-05-15 23:09:39', NULL, NULL);
INSERT INTO `tblitem_price` VALUES (670, 11, 670, '2022-02-21', 13500, 15000, 1, '2020-05-15 23:09:39', NULL, NULL);
INSERT INTO `tblitem_price` VALUES (671, 11, 671, '2022-02-21', 14850, 16500, 1, '2020-05-15 23:09:39', NULL, NULL);
INSERT INTO `tblitem_price` VALUES (672, 11, 672, '2022-02-21', 9450, 10500, 1, '2020-05-15 23:09:39', NULL, NULL);
INSERT INTO `tblitem_price` VALUES (673, 11, 673, '2022-02-21', 9450, 10500, 1, '2020-05-15 23:09:39', NULL, NULL);
INSERT INTO `tblitem_price` VALUES (674, 11, 674, '2022-02-21', 24570, 27300, 1, '2020-05-15 23:09:39', NULL, NULL);
INSERT INTO `tblitem_price` VALUES (675, 11, 675, '2022-02-21', 17820, 19800, 1, '2020-05-15 23:09:39', NULL, NULL);

-- ----------------------------
-- Table structure for tblitem_promo
-- ----------------------------
DROP TABLE IF EXISTS `tblitem_promo`;
CREATE TABLE `tblitem_promo`  (
  `item_promo_id` int NOT NULL AUTO_INCREMENT,
  `promo_code` varchar(10) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `promo_name` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `branch_id` int NOT NULL,
  `stock_category_id` int NOT NULL,
  `item_id` int NOT NULL,
  `start_period` date NULL DEFAULT NULL,
  `end_period` date NULL DEFAULT NULL,
  `disc_percentage` decimal(4, 2) NULL DEFAULT NULL,
  `disc_amount` decimal(18, 2) NULL DEFAULT NULL,
  `creator_id` int NULL DEFAULT NULL,
  `created_date` datetime NULL DEFAULT NULL,
  `modificator_id` int NULL DEFAULT NULL,
  `modified_date` datetime NULL DEFAULT NULL,
  PRIMARY KEY (`item_promo_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tblitem_promo
-- ----------------------------

-- ----------------------------
-- Table structure for tblitem_stock
-- ----------------------------
DROP TABLE IF EXISTS `tblitem_stock`;
CREATE TABLE `tblitem_stock`  (
  `item_stock_id` int NOT NULL AUTO_INCREMENT,
  `branch_id` int NOT NULL,
  `item_id` int NOT NULL,
  `qty` int NOT NULL,
  PRIMARY KEY (`item_stock_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 679 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tblitem_stock
-- ----------------------------
INSERT INTO `tblitem_stock` VALUES (1, 11, 1, 0);
INSERT INTO `tblitem_stock` VALUES (2, 11, 2, 0);
INSERT INTO `tblitem_stock` VALUES (3, 11, 3, 0);
INSERT INTO `tblitem_stock` VALUES (4, 11, 4, 0);
INSERT INTO `tblitem_stock` VALUES (5, 11, 5, 0);
INSERT INTO `tblitem_stock` VALUES (6, 11, 6, 0);
INSERT INTO `tblitem_stock` VALUES (7, 11, 7, 0);
INSERT INTO `tblitem_stock` VALUES (8, 11, 8, 0);
INSERT INTO `tblitem_stock` VALUES (9, 11, 9, 0);
INSERT INTO `tblitem_stock` VALUES (10, 11, 10, 0);
INSERT INTO `tblitem_stock` VALUES (11, 11, 11, 0);
INSERT INTO `tblitem_stock` VALUES (12, 11, 12, 0);
INSERT INTO `tblitem_stock` VALUES (13, 11, 13, 0);
INSERT INTO `tblitem_stock` VALUES (14, 11, 14, 0);
INSERT INTO `tblitem_stock` VALUES (15, 11, 15, 0);
INSERT INTO `tblitem_stock` VALUES (16, 11, 16, 0);
INSERT INTO `tblitem_stock` VALUES (17, 11, 17, 0);
INSERT INTO `tblitem_stock` VALUES (18, 11, 18, 0);
INSERT INTO `tblitem_stock` VALUES (19, 11, 19, 0);
INSERT INTO `tblitem_stock` VALUES (20, 11, 20, 0);
INSERT INTO `tblitem_stock` VALUES (21, 11, 21, 0);
INSERT INTO `tblitem_stock` VALUES (22, 11, 22, 0);
INSERT INTO `tblitem_stock` VALUES (23, 11, 23, 0);
INSERT INTO `tblitem_stock` VALUES (24, 11, 24, 0);
INSERT INTO `tblitem_stock` VALUES (25, 11, 25, 0);
INSERT INTO `tblitem_stock` VALUES (26, 11, 26, 0);
INSERT INTO `tblitem_stock` VALUES (27, 11, 27, 0);
INSERT INTO `tblitem_stock` VALUES (28, 11, 28, 0);
INSERT INTO `tblitem_stock` VALUES (29, 11, 29, 0);
INSERT INTO `tblitem_stock` VALUES (30, 11, 30, 0);
INSERT INTO `tblitem_stock` VALUES (31, 11, 31, 0);
INSERT INTO `tblitem_stock` VALUES (32, 11, 32, 0);
INSERT INTO `tblitem_stock` VALUES (33, 11, 33, 0);
INSERT INTO `tblitem_stock` VALUES (34, 11, 34, 0);
INSERT INTO `tblitem_stock` VALUES (35, 11, 35, 0);
INSERT INTO `tblitem_stock` VALUES (36, 11, 36, 0);
INSERT INTO `tblitem_stock` VALUES (37, 11, 37, 0);
INSERT INTO `tblitem_stock` VALUES (38, 11, 38, 0);
INSERT INTO `tblitem_stock` VALUES (39, 11, 39, 0);
INSERT INTO `tblitem_stock` VALUES (40, 11, 40, 0);
INSERT INTO `tblitem_stock` VALUES (41, 11, 41, 0);
INSERT INTO `tblitem_stock` VALUES (42, 11, 42, 0);
INSERT INTO `tblitem_stock` VALUES (43, 11, 43, 0);
INSERT INTO `tblitem_stock` VALUES (44, 11, 44, 0);
INSERT INTO `tblitem_stock` VALUES (45, 11, 45, 0);
INSERT INTO `tblitem_stock` VALUES (46, 11, 46, 0);
INSERT INTO `tblitem_stock` VALUES (47, 11, 47, 0);
INSERT INTO `tblitem_stock` VALUES (48, 11, 48, 0);
INSERT INTO `tblitem_stock` VALUES (49, 11, 49, 0);
INSERT INTO `tblitem_stock` VALUES (50, 11, 50, 0);
INSERT INTO `tblitem_stock` VALUES (51, 11, 51, 0);
INSERT INTO `tblitem_stock` VALUES (52, 11, 52, 0);
INSERT INTO `tblitem_stock` VALUES (53, 11, 53, 0);
INSERT INTO `tblitem_stock` VALUES (54, 11, 54, 0);
INSERT INTO `tblitem_stock` VALUES (55, 11, 55, 0);
INSERT INTO `tblitem_stock` VALUES (56, 11, 56, 0);
INSERT INTO `tblitem_stock` VALUES (57, 11, 57, 0);
INSERT INTO `tblitem_stock` VALUES (58, 11, 58, 0);
INSERT INTO `tblitem_stock` VALUES (59, 11, 59, 0);
INSERT INTO `tblitem_stock` VALUES (60, 11, 60, 0);
INSERT INTO `tblitem_stock` VALUES (61, 11, 61, 0);
INSERT INTO `tblitem_stock` VALUES (62, 11, 62, 0);
INSERT INTO `tblitem_stock` VALUES (63, 11, 63, 0);
INSERT INTO `tblitem_stock` VALUES (64, 11, 64, 0);
INSERT INTO `tblitem_stock` VALUES (65, 11, 65, 0);
INSERT INTO `tblitem_stock` VALUES (66, 11, 66, 0);
INSERT INTO `tblitem_stock` VALUES (67, 11, 67, 0);
INSERT INTO `tblitem_stock` VALUES (68, 11, 68, 0);
INSERT INTO `tblitem_stock` VALUES (69, 11, 69, 0);
INSERT INTO `tblitem_stock` VALUES (70, 11, 70, 0);
INSERT INTO `tblitem_stock` VALUES (71, 11, 71, 0);
INSERT INTO `tblitem_stock` VALUES (72, 11, 72, 0);
INSERT INTO `tblitem_stock` VALUES (73, 11, 73, 0);
INSERT INTO `tblitem_stock` VALUES (74, 11, 74, 0);
INSERT INTO `tblitem_stock` VALUES (75, 11, 75, 0);
INSERT INTO `tblitem_stock` VALUES (76, 11, 76, 0);
INSERT INTO `tblitem_stock` VALUES (77, 11, 77, 0);
INSERT INTO `tblitem_stock` VALUES (78, 11, 78, 0);
INSERT INTO `tblitem_stock` VALUES (79, 11, 79, 0);
INSERT INTO `tblitem_stock` VALUES (80, 11, 80, 0);
INSERT INTO `tblitem_stock` VALUES (81, 11, 81, 0);
INSERT INTO `tblitem_stock` VALUES (82, 11, 82, 0);
INSERT INTO `tblitem_stock` VALUES (83, 11, 83, 0);
INSERT INTO `tblitem_stock` VALUES (84, 11, 84, 0);
INSERT INTO `tblitem_stock` VALUES (85, 11, 85, 0);
INSERT INTO `tblitem_stock` VALUES (86, 11, 86, 0);
INSERT INTO `tblitem_stock` VALUES (87, 11, 87, 0);
INSERT INTO `tblitem_stock` VALUES (88, 11, 88, 0);
INSERT INTO `tblitem_stock` VALUES (89, 11, 89, 0);
INSERT INTO `tblitem_stock` VALUES (90, 11, 90, 0);
INSERT INTO `tblitem_stock` VALUES (91, 11, 91, 0);
INSERT INTO `tblitem_stock` VALUES (92, 11, 92, 0);
INSERT INTO `tblitem_stock` VALUES (93, 11, 93, 0);
INSERT INTO `tblitem_stock` VALUES (94, 11, 94, 0);
INSERT INTO `tblitem_stock` VALUES (95, 11, 95, 0);
INSERT INTO `tblitem_stock` VALUES (96, 11, 96, 0);
INSERT INTO `tblitem_stock` VALUES (97, 11, 97, 0);
INSERT INTO `tblitem_stock` VALUES (98, 11, 98, 0);
INSERT INTO `tblitem_stock` VALUES (99, 11, 99, 0);
INSERT INTO `tblitem_stock` VALUES (100, 11, 100, 0);
INSERT INTO `tblitem_stock` VALUES (101, 11, 101, 0);
INSERT INTO `tblitem_stock` VALUES (102, 11, 102, 0);
INSERT INTO `tblitem_stock` VALUES (103, 11, 103, 0);
INSERT INTO `tblitem_stock` VALUES (104, 11, 104, 0);
INSERT INTO `tblitem_stock` VALUES (105, 11, 105, 0);
INSERT INTO `tblitem_stock` VALUES (106, 11, 106, 0);
INSERT INTO `tblitem_stock` VALUES (107, 11, 107, 0);
INSERT INTO `tblitem_stock` VALUES (108, 11, 108, 0);
INSERT INTO `tblitem_stock` VALUES (109, 11, 109, 0);
INSERT INTO `tblitem_stock` VALUES (110, 11, 110, 0);
INSERT INTO `tblitem_stock` VALUES (111, 11, 111, 0);
INSERT INTO `tblitem_stock` VALUES (112, 11, 112, 0);
INSERT INTO `tblitem_stock` VALUES (113, 11, 113, 0);
INSERT INTO `tblitem_stock` VALUES (114, 11, 114, 0);
INSERT INTO `tblitem_stock` VALUES (115, 11, 115, 0);
INSERT INTO `tblitem_stock` VALUES (116, 11, 116, 0);
INSERT INTO `tblitem_stock` VALUES (117, 11, 117, 0);
INSERT INTO `tblitem_stock` VALUES (118, 11, 118, 0);
INSERT INTO `tblitem_stock` VALUES (119, 11, 119, 0);
INSERT INTO `tblitem_stock` VALUES (120, 11, 120, 0);
INSERT INTO `tblitem_stock` VALUES (121, 11, 121, 0);
INSERT INTO `tblitem_stock` VALUES (122, 11, 122, 0);
INSERT INTO `tblitem_stock` VALUES (123, 11, 123, 0);
INSERT INTO `tblitem_stock` VALUES (124, 11, 124, 0);
INSERT INTO `tblitem_stock` VALUES (125, 11, 125, 0);
INSERT INTO `tblitem_stock` VALUES (126, 11, 126, 0);
INSERT INTO `tblitem_stock` VALUES (127, 11, 127, 0);
INSERT INTO `tblitem_stock` VALUES (128, 11, 128, 0);
INSERT INTO `tblitem_stock` VALUES (129, 11, 129, 0);
INSERT INTO `tblitem_stock` VALUES (130, 11, 130, 0);
INSERT INTO `tblitem_stock` VALUES (131, 11, 131, 0);
INSERT INTO `tblitem_stock` VALUES (132, 11, 132, 0);
INSERT INTO `tblitem_stock` VALUES (133, 11, 133, 0);
INSERT INTO `tblitem_stock` VALUES (134, 11, 134, 0);
INSERT INTO `tblitem_stock` VALUES (135, 11, 135, 0);
INSERT INTO `tblitem_stock` VALUES (136, 11, 136, 0);
INSERT INTO `tblitem_stock` VALUES (137, 11, 137, 0);
INSERT INTO `tblitem_stock` VALUES (138, 11, 138, 0);
INSERT INTO `tblitem_stock` VALUES (139, 11, 139, 0);
INSERT INTO `tblitem_stock` VALUES (140, 11, 140, 0);
INSERT INTO `tblitem_stock` VALUES (141, 11, 141, 0);
INSERT INTO `tblitem_stock` VALUES (142, 11, 142, 0);
INSERT INTO `tblitem_stock` VALUES (143, 11, 143, 0);
INSERT INTO `tblitem_stock` VALUES (144, 11, 144, 0);
INSERT INTO `tblitem_stock` VALUES (145, 11, 145, 0);
INSERT INTO `tblitem_stock` VALUES (146, 11, 146, 0);
INSERT INTO `tblitem_stock` VALUES (147, 11, 147, 0);
INSERT INTO `tblitem_stock` VALUES (148, 11, 148, 0);
INSERT INTO `tblitem_stock` VALUES (149, 11, 149, 0);
INSERT INTO `tblitem_stock` VALUES (150, 11, 150, 0);
INSERT INTO `tblitem_stock` VALUES (151, 11, 151, 0);
INSERT INTO `tblitem_stock` VALUES (152, 11, 152, 0);
INSERT INTO `tblitem_stock` VALUES (153, 11, 153, 0);
INSERT INTO `tblitem_stock` VALUES (154, 11, 154, 0);
INSERT INTO `tblitem_stock` VALUES (155, 11, 155, 0);
INSERT INTO `tblitem_stock` VALUES (156, 11, 156, 0);
INSERT INTO `tblitem_stock` VALUES (157, 11, 157, 0);
INSERT INTO `tblitem_stock` VALUES (158, 11, 158, 0);
INSERT INTO `tblitem_stock` VALUES (159, 11, 159, 0);
INSERT INTO `tblitem_stock` VALUES (160, 11, 160, 0);
INSERT INTO `tblitem_stock` VALUES (161, 11, 161, 0);
INSERT INTO `tblitem_stock` VALUES (162, 11, 162, 0);
INSERT INTO `tblitem_stock` VALUES (163, 11, 163, 0);
INSERT INTO `tblitem_stock` VALUES (164, 11, 164, 0);
INSERT INTO `tblitem_stock` VALUES (165, 11, 165, 0);
INSERT INTO `tblitem_stock` VALUES (166, 11, 166, 0);
INSERT INTO `tblitem_stock` VALUES (167, 11, 167, 0);
INSERT INTO `tblitem_stock` VALUES (168, 11, 168, 0);
INSERT INTO `tblitem_stock` VALUES (169, 11, 169, 0);
INSERT INTO `tblitem_stock` VALUES (170, 11, 170, 0);
INSERT INTO `tblitem_stock` VALUES (171, 11, 171, 0);
INSERT INTO `tblitem_stock` VALUES (172, 11, 172, 0);
INSERT INTO `tblitem_stock` VALUES (173, 11, 173, 0);
INSERT INTO `tblitem_stock` VALUES (174, 11, 174, 0);
INSERT INTO `tblitem_stock` VALUES (175, 11, 175, 0);
INSERT INTO `tblitem_stock` VALUES (176, 11, 176, 0);
INSERT INTO `tblitem_stock` VALUES (177, 11, 177, 0);
INSERT INTO `tblitem_stock` VALUES (178, 11, 178, 0);
INSERT INTO `tblitem_stock` VALUES (179, 11, 179, 0);
INSERT INTO `tblitem_stock` VALUES (180, 11, 180, 0);
INSERT INTO `tblitem_stock` VALUES (181, 11, 181, 0);
INSERT INTO `tblitem_stock` VALUES (182, 11, 182, 0);
INSERT INTO `tblitem_stock` VALUES (183, 11, 183, 0);
INSERT INTO `tblitem_stock` VALUES (184, 11, 184, 0);
INSERT INTO `tblitem_stock` VALUES (185, 11, 185, 0);
INSERT INTO `tblitem_stock` VALUES (186, 11, 186, 0);
INSERT INTO `tblitem_stock` VALUES (187, 11, 187, 0);
INSERT INTO `tblitem_stock` VALUES (188, 11, 188, 0);
INSERT INTO `tblitem_stock` VALUES (189, 11, 189, 0);
INSERT INTO `tblitem_stock` VALUES (190, 11, 190, 0);
INSERT INTO `tblitem_stock` VALUES (191, 11, 191, 0);
INSERT INTO `tblitem_stock` VALUES (192, 11, 192, 0);
INSERT INTO `tblitem_stock` VALUES (193, 11, 193, 0);
INSERT INTO `tblitem_stock` VALUES (194, 11, 194, 0);
INSERT INTO `tblitem_stock` VALUES (195, 11, 195, 0);
INSERT INTO `tblitem_stock` VALUES (196, 11, 196, 0);
INSERT INTO `tblitem_stock` VALUES (197, 11, 197, 0);
INSERT INTO `tblitem_stock` VALUES (198, 11, 198, 0);
INSERT INTO `tblitem_stock` VALUES (199, 11, 199, 0);
INSERT INTO `tblitem_stock` VALUES (200, 11, 200, 0);
INSERT INTO `tblitem_stock` VALUES (201, 11, 201, 0);
INSERT INTO `tblitem_stock` VALUES (202, 11, 202, 0);
INSERT INTO `tblitem_stock` VALUES (203, 11, 203, 0);
INSERT INTO `tblitem_stock` VALUES (204, 11, 204, 0);
INSERT INTO `tblitem_stock` VALUES (205, 11, 205, 0);
INSERT INTO `tblitem_stock` VALUES (206, 11, 206, 0);
INSERT INTO `tblitem_stock` VALUES (207, 11, 207, 0);
INSERT INTO `tblitem_stock` VALUES (208, 11, 208, 0);
INSERT INTO `tblitem_stock` VALUES (209, 11, 209, 0);
INSERT INTO `tblitem_stock` VALUES (210, 11, 210, 0);
INSERT INTO `tblitem_stock` VALUES (211, 11, 211, 0);
INSERT INTO `tblitem_stock` VALUES (212, 11, 212, 0);
INSERT INTO `tblitem_stock` VALUES (213, 11, 213, 0);
INSERT INTO `tblitem_stock` VALUES (214, 11, 214, 0);
INSERT INTO `tblitem_stock` VALUES (215, 11, 215, 0);
INSERT INTO `tblitem_stock` VALUES (216, 11, 216, 0);
INSERT INTO `tblitem_stock` VALUES (217, 11, 217, 0);
INSERT INTO `tblitem_stock` VALUES (218, 11, 218, 0);
INSERT INTO `tblitem_stock` VALUES (219, 11, 219, 0);
INSERT INTO `tblitem_stock` VALUES (220, 11, 220, 0);
INSERT INTO `tblitem_stock` VALUES (221, 11, 221, 0);
INSERT INTO `tblitem_stock` VALUES (222, 11, 222, 0);
INSERT INTO `tblitem_stock` VALUES (223, 11, 223, 0);
INSERT INTO `tblitem_stock` VALUES (224, 11, 224, 0);
INSERT INTO `tblitem_stock` VALUES (225, 11, 225, 0);
INSERT INTO `tblitem_stock` VALUES (226, 11, 226, 0);
INSERT INTO `tblitem_stock` VALUES (227, 11, 227, 0);
INSERT INTO `tblitem_stock` VALUES (228, 11, 228, 0);
INSERT INTO `tblitem_stock` VALUES (229, 11, 229, 0);
INSERT INTO `tblitem_stock` VALUES (230, 11, 230, 0);
INSERT INTO `tblitem_stock` VALUES (231, 11, 231, 0);
INSERT INTO `tblitem_stock` VALUES (232, 11, 232, 0);
INSERT INTO `tblitem_stock` VALUES (233, 11, 233, 0);
INSERT INTO `tblitem_stock` VALUES (234, 11, 234, 0);
INSERT INTO `tblitem_stock` VALUES (235, 11, 235, 0);
INSERT INTO `tblitem_stock` VALUES (236, 11, 236, 0);
INSERT INTO `tblitem_stock` VALUES (237, 11, 237, 0);
INSERT INTO `tblitem_stock` VALUES (238, 11, 238, 0);
INSERT INTO `tblitem_stock` VALUES (239, 11, 239, 0);
INSERT INTO `tblitem_stock` VALUES (240, 11, 240, 0);
INSERT INTO `tblitem_stock` VALUES (241, 11, 241, 0);
INSERT INTO `tblitem_stock` VALUES (242, 11, 242, 0);
INSERT INTO `tblitem_stock` VALUES (243, 11, 243, 0);
INSERT INTO `tblitem_stock` VALUES (244, 11, 244, 0);
INSERT INTO `tblitem_stock` VALUES (245, 11, 245, 0);
INSERT INTO `tblitem_stock` VALUES (246, 11, 246, 0);
INSERT INTO `tblitem_stock` VALUES (247, 11, 247, 0);
INSERT INTO `tblitem_stock` VALUES (248, 11, 248, 0);
INSERT INTO `tblitem_stock` VALUES (249, 11, 249, 0);
INSERT INTO `tblitem_stock` VALUES (250, 11, 250, 0);
INSERT INTO `tblitem_stock` VALUES (251, 11, 251, 0);
INSERT INTO `tblitem_stock` VALUES (252, 11, 252, 0);
INSERT INTO `tblitem_stock` VALUES (253, 11, 253, 0);
INSERT INTO `tblitem_stock` VALUES (254, 11, 254, 0);
INSERT INTO `tblitem_stock` VALUES (255, 11, 255, 0);
INSERT INTO `tblitem_stock` VALUES (256, 11, 256, 0);
INSERT INTO `tblitem_stock` VALUES (257, 11, 257, 0);
INSERT INTO `tblitem_stock` VALUES (258, 11, 258, 0);
INSERT INTO `tblitem_stock` VALUES (259, 11, 259, 0);
INSERT INTO `tblitem_stock` VALUES (260, 11, 260, 0);
INSERT INTO `tblitem_stock` VALUES (261, 11, 261, 0);
INSERT INTO `tblitem_stock` VALUES (262, 11, 262, 0);
INSERT INTO `tblitem_stock` VALUES (263, 11, 263, 0);
INSERT INTO `tblitem_stock` VALUES (264, 11, 264, 0);
INSERT INTO `tblitem_stock` VALUES (265, 11, 265, 0);
INSERT INTO `tblitem_stock` VALUES (266, 11, 266, 0);
INSERT INTO `tblitem_stock` VALUES (267, 11, 267, 0);
INSERT INTO `tblitem_stock` VALUES (268, 11, 268, 0);
INSERT INTO `tblitem_stock` VALUES (269, 11, 269, 0);
INSERT INTO `tblitem_stock` VALUES (270, 11, 270, 0);
INSERT INTO `tblitem_stock` VALUES (271, 11, 271, 0);
INSERT INTO `tblitem_stock` VALUES (272, 11, 272, 0);
INSERT INTO `tblitem_stock` VALUES (273, 11, 273, 0);
INSERT INTO `tblitem_stock` VALUES (274, 11, 274, 0);
INSERT INTO `tblitem_stock` VALUES (275, 11, 275, 0);
INSERT INTO `tblitem_stock` VALUES (276, 11, 276, 0);
INSERT INTO `tblitem_stock` VALUES (277, 11, 277, 0);
INSERT INTO `tblitem_stock` VALUES (278, 11, 278, 0);
INSERT INTO `tblitem_stock` VALUES (279, 11, 279, 0);
INSERT INTO `tblitem_stock` VALUES (280, 11, 280, 0);
INSERT INTO `tblitem_stock` VALUES (281, 11, 281, 0);
INSERT INTO `tblitem_stock` VALUES (282, 11, 282, 0);
INSERT INTO `tblitem_stock` VALUES (283, 11, 283, 0);
INSERT INTO `tblitem_stock` VALUES (284, 11, 284, 0);
INSERT INTO `tblitem_stock` VALUES (285, 11, 285, 0);
INSERT INTO `tblitem_stock` VALUES (286, 11, 286, 0);
INSERT INTO `tblitem_stock` VALUES (287, 11, 287, 0);
INSERT INTO `tblitem_stock` VALUES (288, 11, 288, 0);
INSERT INTO `tblitem_stock` VALUES (289, 11, 289, 0);
INSERT INTO `tblitem_stock` VALUES (290, 11, 290, 0);
INSERT INTO `tblitem_stock` VALUES (291, 11, 291, 0);
INSERT INTO `tblitem_stock` VALUES (292, 11, 292, 0);
INSERT INTO `tblitem_stock` VALUES (293, 11, 293, 0);
INSERT INTO `tblitem_stock` VALUES (294, 11, 294, 0);
INSERT INTO `tblitem_stock` VALUES (295, 11, 295, 0);
INSERT INTO `tblitem_stock` VALUES (296, 11, 296, 0);
INSERT INTO `tblitem_stock` VALUES (297, 11, 297, 0);
INSERT INTO `tblitem_stock` VALUES (298, 11, 298, 0);
INSERT INTO `tblitem_stock` VALUES (299, 11, 299, 0);
INSERT INTO `tblitem_stock` VALUES (300, 11, 300, 0);
INSERT INTO `tblitem_stock` VALUES (301, 11, 301, 0);
INSERT INTO `tblitem_stock` VALUES (302, 11, 302, 0);
INSERT INTO `tblitem_stock` VALUES (303, 11, 303, 0);
INSERT INTO `tblitem_stock` VALUES (304, 11, 304, 0);
INSERT INTO `tblitem_stock` VALUES (305, 11, 305, 0);
INSERT INTO `tblitem_stock` VALUES (306, 11, 306, 0);
INSERT INTO `tblitem_stock` VALUES (307, 11, 307, 0);
INSERT INTO `tblitem_stock` VALUES (308, 11, 308, 0);
INSERT INTO `tblitem_stock` VALUES (309, 11, 309, 0);
INSERT INTO `tblitem_stock` VALUES (310, 11, 310, 0);
INSERT INTO `tblitem_stock` VALUES (311, 11, 311, 0);
INSERT INTO `tblitem_stock` VALUES (312, 11, 312, 0);
INSERT INTO `tblitem_stock` VALUES (313, 11, 313, 0);
INSERT INTO `tblitem_stock` VALUES (314, 11, 314, 0);
INSERT INTO `tblitem_stock` VALUES (315, 11, 315, 0);
INSERT INTO `tblitem_stock` VALUES (316, 11, 316, 0);
INSERT INTO `tblitem_stock` VALUES (317, 11, 317, 0);
INSERT INTO `tblitem_stock` VALUES (318, 11, 318, 0);
INSERT INTO `tblitem_stock` VALUES (319, 11, 319, 0);
INSERT INTO `tblitem_stock` VALUES (320, 11, 320, 0);
INSERT INTO `tblitem_stock` VALUES (321, 11, 321, 0);
INSERT INTO `tblitem_stock` VALUES (322, 11, 322, 0);
INSERT INTO `tblitem_stock` VALUES (323, 11, 323, 0);
INSERT INTO `tblitem_stock` VALUES (324, 11, 324, 0);
INSERT INTO `tblitem_stock` VALUES (325, 11, 325, 0);
INSERT INTO `tblitem_stock` VALUES (326, 11, 326, 0);
INSERT INTO `tblitem_stock` VALUES (327, 11, 327, 0);
INSERT INTO `tblitem_stock` VALUES (328, 11, 328, 0);
INSERT INTO `tblitem_stock` VALUES (329, 11, 329, 0);
INSERT INTO `tblitem_stock` VALUES (330, 11, 330, 0);
INSERT INTO `tblitem_stock` VALUES (331, 11, 331, 0);
INSERT INTO `tblitem_stock` VALUES (332, 11, 332, 0);
INSERT INTO `tblitem_stock` VALUES (333, 11, 333, 0);
INSERT INTO `tblitem_stock` VALUES (334, 11, 334, 0);
INSERT INTO `tblitem_stock` VALUES (335, 11, 335, 0);
INSERT INTO `tblitem_stock` VALUES (336, 11, 336, 0);
INSERT INTO `tblitem_stock` VALUES (337, 11, 337, 0);
INSERT INTO `tblitem_stock` VALUES (338, 11, 338, 0);
INSERT INTO `tblitem_stock` VALUES (339, 11, 339, 0);
INSERT INTO `tblitem_stock` VALUES (340, 11, 340, 0);
INSERT INTO `tblitem_stock` VALUES (341, 11, 341, 0);
INSERT INTO `tblitem_stock` VALUES (342, 11, 342, 0);
INSERT INTO `tblitem_stock` VALUES (343, 11, 343, 0);
INSERT INTO `tblitem_stock` VALUES (344, 11, 344, 0);
INSERT INTO `tblitem_stock` VALUES (345, 11, 345, 0);
INSERT INTO `tblitem_stock` VALUES (346, 11, 346, 0);
INSERT INTO `tblitem_stock` VALUES (347, 11, 347, 0);
INSERT INTO `tblitem_stock` VALUES (348, 11, 348, 0);
INSERT INTO `tblitem_stock` VALUES (349, 11, 349, 0);
INSERT INTO `tblitem_stock` VALUES (350, 11, 350, 0);
INSERT INTO `tblitem_stock` VALUES (351, 11, 351, 0);
INSERT INTO `tblitem_stock` VALUES (352, 11, 352, 0);
INSERT INTO `tblitem_stock` VALUES (353, 11, 353, 0);
INSERT INTO `tblitem_stock` VALUES (354, 11, 354, 0);
INSERT INTO `tblitem_stock` VALUES (355, 11, 355, 0);
INSERT INTO `tblitem_stock` VALUES (356, 11, 356, 0);
INSERT INTO `tblitem_stock` VALUES (357, 11, 357, 0);
INSERT INTO `tblitem_stock` VALUES (358, 11, 358, 0);
INSERT INTO `tblitem_stock` VALUES (359, 11, 359, 0);
INSERT INTO `tblitem_stock` VALUES (360, 11, 360, 0);
INSERT INTO `tblitem_stock` VALUES (361, 11, 361, 0);
INSERT INTO `tblitem_stock` VALUES (362, 11, 362, 0);
INSERT INTO `tblitem_stock` VALUES (363, 11, 363, 0);
INSERT INTO `tblitem_stock` VALUES (364, 11, 364, 0);
INSERT INTO `tblitem_stock` VALUES (365, 11, 365, 0);
INSERT INTO `tblitem_stock` VALUES (366, 11, 366, 0);
INSERT INTO `tblitem_stock` VALUES (367, 11, 367, 0);
INSERT INTO `tblitem_stock` VALUES (368, 11, 368, 0);
INSERT INTO `tblitem_stock` VALUES (369, 11, 369, 0);
INSERT INTO `tblitem_stock` VALUES (370, 11, 370, 0);
INSERT INTO `tblitem_stock` VALUES (371, 11, 371, 0);
INSERT INTO `tblitem_stock` VALUES (372, 11, 372, 0);
INSERT INTO `tblitem_stock` VALUES (373, 11, 373, 0);
INSERT INTO `tblitem_stock` VALUES (374, 11, 374, 0);
INSERT INTO `tblitem_stock` VALUES (375, 11, 375, 0);
INSERT INTO `tblitem_stock` VALUES (376, 11, 376, 0);
INSERT INTO `tblitem_stock` VALUES (377, 11, 377, 0);
INSERT INTO `tblitem_stock` VALUES (378, 11, 378, 0);
INSERT INTO `tblitem_stock` VALUES (379, 11, 379, 0);
INSERT INTO `tblitem_stock` VALUES (380, 11, 380, 0);
INSERT INTO `tblitem_stock` VALUES (381, 11, 381, 0);
INSERT INTO `tblitem_stock` VALUES (382, 11, 382, 0);
INSERT INTO `tblitem_stock` VALUES (383, 11, 383, 0);
INSERT INTO `tblitem_stock` VALUES (384, 11, 384, 0);
INSERT INTO `tblitem_stock` VALUES (385, 11, 385, 0);
INSERT INTO `tblitem_stock` VALUES (386, 11, 386, 0);
INSERT INTO `tblitem_stock` VALUES (387, 11, 387, 0);
INSERT INTO `tblitem_stock` VALUES (388, 11, 388, 0);
INSERT INTO `tblitem_stock` VALUES (389, 11, 389, 0);
INSERT INTO `tblitem_stock` VALUES (390, 11, 390, 0);
INSERT INTO `tblitem_stock` VALUES (391, 11, 391, 0);
INSERT INTO `tblitem_stock` VALUES (392, 11, 392, 0);
INSERT INTO `tblitem_stock` VALUES (393, 11, 393, 0);
INSERT INTO `tblitem_stock` VALUES (394, 11, 394, 0);
INSERT INTO `tblitem_stock` VALUES (395, 11, 395, 0);
INSERT INTO `tblitem_stock` VALUES (396, 11, 396, 0);
INSERT INTO `tblitem_stock` VALUES (397, 11, 397, 0);
INSERT INTO `tblitem_stock` VALUES (398, 11, 398, 0);
INSERT INTO `tblitem_stock` VALUES (399, 11, 399, 0);
INSERT INTO `tblitem_stock` VALUES (400, 11, 400, 0);
INSERT INTO `tblitem_stock` VALUES (401, 11, 401, 0);
INSERT INTO `tblitem_stock` VALUES (402, 11, 402, 0);
INSERT INTO `tblitem_stock` VALUES (403, 11, 403, 0);
INSERT INTO `tblitem_stock` VALUES (404, 11, 404, 0);
INSERT INTO `tblitem_stock` VALUES (405, 11, 405, 0);
INSERT INTO `tblitem_stock` VALUES (406, 11, 406, 0);
INSERT INTO `tblitem_stock` VALUES (407, 11, 407, 0);
INSERT INTO `tblitem_stock` VALUES (408, 11, 408, 0);
INSERT INTO `tblitem_stock` VALUES (409, 11, 409, 0);
INSERT INTO `tblitem_stock` VALUES (410, 11, 410, 0);
INSERT INTO `tblitem_stock` VALUES (411, 11, 411, 0);
INSERT INTO `tblitem_stock` VALUES (412, 11, 412, 0);
INSERT INTO `tblitem_stock` VALUES (413, 11, 413, 0);
INSERT INTO `tblitem_stock` VALUES (414, 11, 414, 0);
INSERT INTO `tblitem_stock` VALUES (415, 11, 415, 0);
INSERT INTO `tblitem_stock` VALUES (416, 11, 416, 0);
INSERT INTO `tblitem_stock` VALUES (417, 11, 417, 0);
INSERT INTO `tblitem_stock` VALUES (418, 11, 418, 0);
INSERT INTO `tblitem_stock` VALUES (419, 11, 419, 0);
INSERT INTO `tblitem_stock` VALUES (420, 11, 420, 0);
INSERT INTO `tblitem_stock` VALUES (421, 11, 421, 0);
INSERT INTO `tblitem_stock` VALUES (422, 11, 422, 0);
INSERT INTO `tblitem_stock` VALUES (423, 11, 423, 0);
INSERT INTO `tblitem_stock` VALUES (424, 11, 424, 0);
INSERT INTO `tblitem_stock` VALUES (425, 11, 425, 0);
INSERT INTO `tblitem_stock` VALUES (426, 11, 426, 0);
INSERT INTO `tblitem_stock` VALUES (427, 11, 427, 0);
INSERT INTO `tblitem_stock` VALUES (428, 11, 428, 0);
INSERT INTO `tblitem_stock` VALUES (429, 11, 429, 0);
INSERT INTO `tblitem_stock` VALUES (430, 11, 430, 0);
INSERT INTO `tblitem_stock` VALUES (431, 11, 431, 0);
INSERT INTO `tblitem_stock` VALUES (432, 11, 432, 0);
INSERT INTO `tblitem_stock` VALUES (433, 11, 433, 0);
INSERT INTO `tblitem_stock` VALUES (434, 11, 434, 0);
INSERT INTO `tblitem_stock` VALUES (435, 11, 435, 0);
INSERT INTO `tblitem_stock` VALUES (436, 11, 436, 0);
INSERT INTO `tblitem_stock` VALUES (437, 11, 437, 0);
INSERT INTO `tblitem_stock` VALUES (438, 11, 438, 0);
INSERT INTO `tblitem_stock` VALUES (439, 11, 439, 0);
INSERT INTO `tblitem_stock` VALUES (440, 11, 440, 0);
INSERT INTO `tblitem_stock` VALUES (441, 11, 441, 0);
INSERT INTO `tblitem_stock` VALUES (442, 11, 442, 0);
INSERT INTO `tblitem_stock` VALUES (443, 11, 443, 0);
INSERT INTO `tblitem_stock` VALUES (444, 11, 444, 0);
INSERT INTO `tblitem_stock` VALUES (445, 11, 445, 0);
INSERT INTO `tblitem_stock` VALUES (446, 11, 446, 0);
INSERT INTO `tblitem_stock` VALUES (447, 11, 447, 0);
INSERT INTO `tblitem_stock` VALUES (448, 11, 448, 0);
INSERT INTO `tblitem_stock` VALUES (449, 11, 449, 0);
INSERT INTO `tblitem_stock` VALUES (450, 11, 450, 0);
INSERT INTO `tblitem_stock` VALUES (451, 11, 451, 0);
INSERT INTO `tblitem_stock` VALUES (452, 11, 452, 0);
INSERT INTO `tblitem_stock` VALUES (453, 11, 453, 0);
INSERT INTO `tblitem_stock` VALUES (454, 11, 454, 0);
INSERT INTO `tblitem_stock` VALUES (455, 11, 455, 0);
INSERT INTO `tblitem_stock` VALUES (456, 11, 456, 0);
INSERT INTO `tblitem_stock` VALUES (457, 11, 457, 0);
INSERT INTO `tblitem_stock` VALUES (458, 11, 458, 0);
INSERT INTO `tblitem_stock` VALUES (459, 11, 459, 0);
INSERT INTO `tblitem_stock` VALUES (460, 11, 460, 0);
INSERT INTO `tblitem_stock` VALUES (461, 11, 461, 0);
INSERT INTO `tblitem_stock` VALUES (462, 11, 462, 0);
INSERT INTO `tblitem_stock` VALUES (463, 11, 463, 0);
INSERT INTO `tblitem_stock` VALUES (464, 11, 464, 0);
INSERT INTO `tblitem_stock` VALUES (465, 11, 465, 0);
INSERT INTO `tblitem_stock` VALUES (466, 11, 466, 0);
INSERT INTO `tblitem_stock` VALUES (467, 11, 467, 0);
INSERT INTO `tblitem_stock` VALUES (468, 11, 468, 0);
INSERT INTO `tblitem_stock` VALUES (469, 11, 469, 0);
INSERT INTO `tblitem_stock` VALUES (470, 11, 470, 0);
INSERT INTO `tblitem_stock` VALUES (471, 11, 471, 0);
INSERT INTO `tblitem_stock` VALUES (472, 11, 472, 0);
INSERT INTO `tblitem_stock` VALUES (473, 11, 473, 0);
INSERT INTO `tblitem_stock` VALUES (474, 11, 474, 0);
INSERT INTO `tblitem_stock` VALUES (475, 11, 475, 0);
INSERT INTO `tblitem_stock` VALUES (476, 11, 476, 0);
INSERT INTO `tblitem_stock` VALUES (477, 11, 477, 0);
INSERT INTO `tblitem_stock` VALUES (478, 11, 478, 0);
INSERT INTO `tblitem_stock` VALUES (479, 11, 479, 0);
INSERT INTO `tblitem_stock` VALUES (480, 11, 480, 0);
INSERT INTO `tblitem_stock` VALUES (481, 11, 481, 0);
INSERT INTO `tblitem_stock` VALUES (482, 11, 482, 0);
INSERT INTO `tblitem_stock` VALUES (483, 11, 483, 0);
INSERT INTO `tblitem_stock` VALUES (484, 11, 484, 0);
INSERT INTO `tblitem_stock` VALUES (485, 11, 485, 0);
INSERT INTO `tblitem_stock` VALUES (486, 11, 486, 0);
INSERT INTO `tblitem_stock` VALUES (487, 11, 487, 0);
INSERT INTO `tblitem_stock` VALUES (488, 11, 488, 0);
INSERT INTO `tblitem_stock` VALUES (489, 11, 489, 0);
INSERT INTO `tblitem_stock` VALUES (490, 11, 490, 0);
INSERT INTO `tblitem_stock` VALUES (491, 11, 491, 0);
INSERT INTO `tblitem_stock` VALUES (492, 11, 492, 0);
INSERT INTO `tblitem_stock` VALUES (493, 11, 493, 0);
INSERT INTO `tblitem_stock` VALUES (494, 11, 494, 0);
INSERT INTO `tblitem_stock` VALUES (495, 11, 495, 0);
INSERT INTO `tblitem_stock` VALUES (496, 11, 496, 0);
INSERT INTO `tblitem_stock` VALUES (497, 11, 497, 0);
INSERT INTO `tblitem_stock` VALUES (498, 11, 498, 0);
INSERT INTO `tblitem_stock` VALUES (499, 11, 499, 0);
INSERT INTO `tblitem_stock` VALUES (500, 11, 500, 0);
INSERT INTO `tblitem_stock` VALUES (501, 11, 501, 0);
INSERT INTO `tblitem_stock` VALUES (502, 11, 502, 0);
INSERT INTO `tblitem_stock` VALUES (503, 11, 503, 0);
INSERT INTO `tblitem_stock` VALUES (504, 11, 504, 0);
INSERT INTO `tblitem_stock` VALUES (505, 11, 505, 0);
INSERT INTO `tblitem_stock` VALUES (506, 11, 506, 0);
INSERT INTO `tblitem_stock` VALUES (507, 11, 507, 0);
INSERT INTO `tblitem_stock` VALUES (508, 11, 508, 0);
INSERT INTO `tblitem_stock` VALUES (509, 11, 509, 0);
INSERT INTO `tblitem_stock` VALUES (510, 11, 510, 0);
INSERT INTO `tblitem_stock` VALUES (511, 11, 511, 0);
INSERT INTO `tblitem_stock` VALUES (512, 11, 512, 0);
INSERT INTO `tblitem_stock` VALUES (513, 11, 513, 0);
INSERT INTO `tblitem_stock` VALUES (514, 11, 514, 0);
INSERT INTO `tblitem_stock` VALUES (515, 11, 515, 0);
INSERT INTO `tblitem_stock` VALUES (516, 11, 516, 0);
INSERT INTO `tblitem_stock` VALUES (517, 11, 517, 0);
INSERT INTO `tblitem_stock` VALUES (518, 11, 518, 0);
INSERT INTO `tblitem_stock` VALUES (519, 11, 519, 0);
INSERT INTO `tblitem_stock` VALUES (520, 11, 520, 0);
INSERT INTO `tblitem_stock` VALUES (521, 11, 521, 0);
INSERT INTO `tblitem_stock` VALUES (522, 11, 522, 0);
INSERT INTO `tblitem_stock` VALUES (523, 11, 523, 0);
INSERT INTO `tblitem_stock` VALUES (524, 11, 524, 0);
INSERT INTO `tblitem_stock` VALUES (525, 11, 525, 0);
INSERT INTO `tblitem_stock` VALUES (526, 11, 526, 0);
INSERT INTO `tblitem_stock` VALUES (527, 11, 527, 0);
INSERT INTO `tblitem_stock` VALUES (528, 11, 528, 0);
INSERT INTO `tblitem_stock` VALUES (529, 11, 529, 0);
INSERT INTO `tblitem_stock` VALUES (530, 11, 530, 0);
INSERT INTO `tblitem_stock` VALUES (531, 11, 531, 0);
INSERT INTO `tblitem_stock` VALUES (532, 11, 532, 0);
INSERT INTO `tblitem_stock` VALUES (533, 11, 533, 0);
INSERT INTO `tblitem_stock` VALUES (534, 11, 534, 0);
INSERT INTO `tblitem_stock` VALUES (535, 11, 535, 0);
INSERT INTO `tblitem_stock` VALUES (536, 11, 536, 0);
INSERT INTO `tblitem_stock` VALUES (537, 11, 537, 0);
INSERT INTO `tblitem_stock` VALUES (538, 11, 538, 0);
INSERT INTO `tblitem_stock` VALUES (539, 11, 539, 0);
INSERT INTO `tblitem_stock` VALUES (540, 11, 540, 0);
INSERT INTO `tblitem_stock` VALUES (541, 11, 541, 0);
INSERT INTO `tblitem_stock` VALUES (542, 11, 542, 0);
INSERT INTO `tblitem_stock` VALUES (543, 11, 543, 0);
INSERT INTO `tblitem_stock` VALUES (544, 11, 544, 0);
INSERT INTO `tblitem_stock` VALUES (545, 11, 545, 0);
INSERT INTO `tblitem_stock` VALUES (546, 11, 546, 0);
INSERT INTO `tblitem_stock` VALUES (547, 11, 547, 0);
INSERT INTO `tblitem_stock` VALUES (548, 11, 548, 0);
INSERT INTO `tblitem_stock` VALUES (549, 11, 549, 0);
INSERT INTO `tblitem_stock` VALUES (550, 11, 550, 0);
INSERT INTO `tblitem_stock` VALUES (551, 11, 551, 0);
INSERT INTO `tblitem_stock` VALUES (552, 11, 552, 0);
INSERT INTO `tblitem_stock` VALUES (553, 11, 553, 0);
INSERT INTO `tblitem_stock` VALUES (554, 11, 554, 0);
INSERT INTO `tblitem_stock` VALUES (555, 11, 555, 0);
INSERT INTO `tblitem_stock` VALUES (556, 11, 556, 0);
INSERT INTO `tblitem_stock` VALUES (557, 11, 557, 0);
INSERT INTO `tblitem_stock` VALUES (558, 11, 558, 0);
INSERT INTO `tblitem_stock` VALUES (559, 11, 559, 0);
INSERT INTO `tblitem_stock` VALUES (560, 11, 560, 0);
INSERT INTO `tblitem_stock` VALUES (561, 11, 561, 0);
INSERT INTO `tblitem_stock` VALUES (562, 11, 562, 0);
INSERT INTO `tblitem_stock` VALUES (563, 11, 563, 0);
INSERT INTO `tblitem_stock` VALUES (564, 11, 564, 0);
INSERT INTO `tblitem_stock` VALUES (565, 11, 565, 0);
INSERT INTO `tblitem_stock` VALUES (566, 11, 566, 0);
INSERT INTO `tblitem_stock` VALUES (567, 11, 567, 0);
INSERT INTO `tblitem_stock` VALUES (568, 11, 568, 0);
INSERT INTO `tblitem_stock` VALUES (569, 11, 569, 0);
INSERT INTO `tblitem_stock` VALUES (570, 11, 570, 0);
INSERT INTO `tblitem_stock` VALUES (571, 11, 571, 0);
INSERT INTO `tblitem_stock` VALUES (572, 11, 572, 0);
INSERT INTO `tblitem_stock` VALUES (573, 11, 573, 0);
INSERT INTO `tblitem_stock` VALUES (574, 11, 574, 0);
INSERT INTO `tblitem_stock` VALUES (575, 11, 575, 0);
INSERT INTO `tblitem_stock` VALUES (576, 11, 576, 0);
INSERT INTO `tblitem_stock` VALUES (577, 11, 577, 0);
INSERT INTO `tblitem_stock` VALUES (578, 11, 578, 0);
INSERT INTO `tblitem_stock` VALUES (579, 11, 579, 0);
INSERT INTO `tblitem_stock` VALUES (580, 11, 580, 0);
INSERT INTO `tblitem_stock` VALUES (581, 11, 581, 0);
INSERT INTO `tblitem_stock` VALUES (582, 11, 582, 0);
INSERT INTO `tblitem_stock` VALUES (583, 11, 583, 0);
INSERT INTO `tblitem_stock` VALUES (584, 11, 584, 0);
INSERT INTO `tblitem_stock` VALUES (585, 11, 585, 0);
INSERT INTO `tblitem_stock` VALUES (586, 11, 586, 0);
INSERT INTO `tblitem_stock` VALUES (587, 11, 587, 0);
INSERT INTO `tblitem_stock` VALUES (588, 11, 588, 0);
INSERT INTO `tblitem_stock` VALUES (589, 11, 589, 0);
INSERT INTO `tblitem_stock` VALUES (590, 11, 590, 0);
INSERT INTO `tblitem_stock` VALUES (591, 11, 591, 0);
INSERT INTO `tblitem_stock` VALUES (592, 11, 592, 0);
INSERT INTO `tblitem_stock` VALUES (593, 11, 593, 0);
INSERT INTO `tblitem_stock` VALUES (594, 11, 594, 0);
INSERT INTO `tblitem_stock` VALUES (595, 11, 595, 0);
INSERT INTO `tblitem_stock` VALUES (596, 11, 596, 0);
INSERT INTO `tblitem_stock` VALUES (597, 11, 597, 0);
INSERT INTO `tblitem_stock` VALUES (598, 11, 598, 0);
INSERT INTO `tblitem_stock` VALUES (599, 11, 599, 0);
INSERT INTO `tblitem_stock` VALUES (600, 11, 600, 0);
INSERT INTO `tblitem_stock` VALUES (601, 11, 601, 0);
INSERT INTO `tblitem_stock` VALUES (602, 11, 602, 0);
INSERT INTO `tblitem_stock` VALUES (603, 11, 603, 0);
INSERT INTO `tblitem_stock` VALUES (604, 11, 604, 0);
INSERT INTO `tblitem_stock` VALUES (605, 11, 605, 0);
INSERT INTO `tblitem_stock` VALUES (606, 11, 606, 0);
INSERT INTO `tblitem_stock` VALUES (607, 11, 607, 0);
INSERT INTO `tblitem_stock` VALUES (608, 11, 608, 0);
INSERT INTO `tblitem_stock` VALUES (609, 11, 609, 0);
INSERT INTO `tblitem_stock` VALUES (610, 11, 610, 0);
INSERT INTO `tblitem_stock` VALUES (611, 11, 611, 0);
INSERT INTO `tblitem_stock` VALUES (612, 11, 612, 0);
INSERT INTO `tblitem_stock` VALUES (613, 11, 613, 0);
INSERT INTO `tblitem_stock` VALUES (614, 11, 614, 0);
INSERT INTO `tblitem_stock` VALUES (615, 11, 615, 0);
INSERT INTO `tblitem_stock` VALUES (616, 11, 616, 0);
INSERT INTO `tblitem_stock` VALUES (617, 11, 617, 0);
INSERT INTO `tblitem_stock` VALUES (618, 11, 618, 0);
INSERT INTO `tblitem_stock` VALUES (619, 11, 619, 0);
INSERT INTO `tblitem_stock` VALUES (620, 11, 620, 0);
INSERT INTO `tblitem_stock` VALUES (621, 11, 621, 0);
INSERT INTO `tblitem_stock` VALUES (622, 11, 622, 0);
INSERT INTO `tblitem_stock` VALUES (623, 11, 623, 0);
INSERT INTO `tblitem_stock` VALUES (624, 11, 624, 0);
INSERT INTO `tblitem_stock` VALUES (625, 11, 625, 0);
INSERT INTO `tblitem_stock` VALUES (626, 11, 626, 0);
INSERT INTO `tblitem_stock` VALUES (627, 11, 627, 0);
INSERT INTO `tblitem_stock` VALUES (628, 11, 628, 0);
INSERT INTO `tblitem_stock` VALUES (629, 11, 629, 0);
INSERT INTO `tblitem_stock` VALUES (630, 11, 630, 0);
INSERT INTO `tblitem_stock` VALUES (631, 11, 631, 0);
INSERT INTO `tblitem_stock` VALUES (632, 11, 632, 0);
INSERT INTO `tblitem_stock` VALUES (633, 11, 633, 0);
INSERT INTO `tblitem_stock` VALUES (634, 11, 634, 0);
INSERT INTO `tblitem_stock` VALUES (635, 11, 635, 0);
INSERT INTO `tblitem_stock` VALUES (636, 11, 636, 0);
INSERT INTO `tblitem_stock` VALUES (637, 11, 637, 0);
INSERT INTO `tblitem_stock` VALUES (638, 11, 638, 0);
INSERT INTO `tblitem_stock` VALUES (639, 11, 639, 0);
INSERT INTO `tblitem_stock` VALUES (640, 11, 640, 0);
INSERT INTO `tblitem_stock` VALUES (641, 11, 641, 0);
INSERT INTO `tblitem_stock` VALUES (642, 11, 642, 0);
INSERT INTO `tblitem_stock` VALUES (643, 11, 643, 0);
INSERT INTO `tblitem_stock` VALUES (644, 11, 644, 0);
INSERT INTO `tblitem_stock` VALUES (645, 11, 645, 0);
INSERT INTO `tblitem_stock` VALUES (646, 11, 646, 0);
INSERT INTO `tblitem_stock` VALUES (647, 11, 647, 0);
INSERT INTO `tblitem_stock` VALUES (648, 11, 648, 0);
INSERT INTO `tblitem_stock` VALUES (649, 11, 649, 0);
INSERT INTO `tblitem_stock` VALUES (650, 11, 650, 0);
INSERT INTO `tblitem_stock` VALUES (651, 11, 651, 0);
INSERT INTO `tblitem_stock` VALUES (652, 11, 652, 0);
INSERT INTO `tblitem_stock` VALUES (653, 11, 653, 0);
INSERT INTO `tblitem_stock` VALUES (654, 11, 654, 0);
INSERT INTO `tblitem_stock` VALUES (655, 11, 655, 0);
INSERT INTO `tblitem_stock` VALUES (656, 11, 656, 0);
INSERT INTO `tblitem_stock` VALUES (657, 11, 657, 0);
INSERT INTO `tblitem_stock` VALUES (658, 11, 658, 0);
INSERT INTO `tblitem_stock` VALUES (659, 11, 659, 0);
INSERT INTO `tblitem_stock` VALUES (660, 11, 660, 0);
INSERT INTO `tblitem_stock` VALUES (661, 11, 661, 0);
INSERT INTO `tblitem_stock` VALUES (662, 11, 662, 0);
INSERT INTO `tblitem_stock` VALUES (663, 11, 663, 0);
INSERT INTO `tblitem_stock` VALUES (664, 11, 664, 0);
INSERT INTO `tblitem_stock` VALUES (665, 11, 665, 0);
INSERT INTO `tblitem_stock` VALUES (666, 11, 666, 0);
INSERT INTO `tblitem_stock` VALUES (667, 11, 667, 0);
INSERT INTO `tblitem_stock` VALUES (668, 11, 668, 0);
INSERT INTO `tblitem_stock` VALUES (669, 11, 669, 0);
INSERT INTO `tblitem_stock` VALUES (670, 11, 670, 0);
INSERT INTO `tblitem_stock` VALUES (671, 11, 671, 0);
INSERT INTO `tblitem_stock` VALUES (672, 11, 672, 0);
INSERT INTO `tblitem_stock` VALUES (673, 11, 673, 0);
INSERT INTO `tblitem_stock` VALUES (674, 11, 674, 0);
INSERT INTO `tblitem_stock` VALUES (675, 11, 675, 0);
INSERT INTO `tblitem_stock` VALUES (678, 11, 681, 0);

-- ----------------------------
-- Table structure for tblmember
-- ----------------------------
DROP TABLE IF EXISTS `tblmember`;
CREATE TABLE `tblmember`  (
  `member_id` int NOT NULL AUTO_INCREMENT,
  `member_code` varchar(20) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `fullname` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `phone` varchar(20) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `email` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `address` varchar(500) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `identity_type` int NULL DEFAULT NULL,
  `identity_id` varchar(20) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `status` int NOT NULL,
  `creator_id` int NULL DEFAULT NULL,
  `created_date` datetime NULL DEFAULT NULL,
  `modificator_id` int NULL DEFAULT NULL,
  `modified_date` datetime NULL DEFAULT NULL,
  PRIMARY KEY (`member_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tblmember
-- ----------------------------

-- ----------------------------
-- Table structure for tblmenu
-- ----------------------------
DROP TABLE IF EXISTS `tblmenu`;
CREATE TABLE `tblmenu`  (
  `menu_id` int NOT NULL AUTO_INCREMENT,
  `module_id` int NOT NULL,
  `menu_name` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `menu_url` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `status` int NOT NULL,
  `data_order` int NOT NULL,
  PRIMARY KEY (`menu_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 32 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tblmenu
-- ----------------------------
INSERT INTO `tblmenu` VALUES (1, 1, 'Cabang', 'user_management/branch', 0, 1);
INSERT INTO `tblmenu` VALUES (2, 1, 'Kategori Pengguna', 'user_management/user_group', 0, 2);
INSERT INTO `tblmenu` VALUES (3, 1, 'Pengguna', 'user_management/user', 1, 3);
INSERT INTO `tblmenu` VALUES (4, 1, 'Hak Akses', 'user_management/user_access', 0, 4);
INSERT INTO `tblmenu` VALUES (5, 1, 'Setting Perusahaan', 'user_management/settings', 1, 5);
INSERT INTO `tblmenu` VALUES (6, 2, 'Anggota', 'master/member', 0, 1);
INSERT INTO `tblmenu` VALUES (7, 2, 'Supplier', 'master/supplier', 1, 2);
INSERT INTO `tblmenu` VALUES (8, 2, 'Kategori Barang', 'master/stock_category', 1, 3);
INSERT INTO `tblmenu` VALUES (9, 2, 'Satuan Barang', 'master/stock_unit', 1, 4);
INSERT INTO `tblmenu` VALUES (10, 2, 'Barang', 'master/stock_item', 1, 5);
INSERT INTO `tblmenu` VALUES (11, 2, 'Harga', 'master/price', 1, 6);
INSERT INTO `tblmenu` VALUES (12, 2, 'Promo', 'master/promo', 0, 7);
INSERT INTO `tblmenu` VALUES (13, 3, 'Stok Barang', 'inventory/item_stock', 1, 1);
INSERT INTO `tblmenu` VALUES (14, 3, 'Stok Masuk', 'inventory/stock_in', 1, 2);
INSERT INTO `tblmenu` VALUES (15, 3, 'Stok Keluar', 'inventory/stock_out', 1, 3);
INSERT INTO `tblmenu` VALUES (16, 3, 'Penyesuaian Stok', 'inventory/stock_adj', 1, 4);
INSERT INTO `tblmenu` VALUES (17, 4, 'POS', 'sales/sales', 1, 1);
INSERT INTO `tblmenu` VALUES (18, 4, 'Riwayat Penjualan', 'sales/sales_hist', 1, 2);
INSERT INTO `tblmenu` VALUES (19, 4, 'Pengembalian Barang', 'sales/retur', 0, 3);
INSERT INTO `tblmenu` VALUES (20, 4, 'Penukaran Barang', 'sales/sales_exchange', 0, 4);
INSERT INTO `tblmenu` VALUES (21, 5, 'Rekap Penjualan', 'report/summary_sales_report', 1, 1);
INSERT INTO `tblmenu` VALUES (22, 5, 'Detail Penjualan', 'report/detail_sales_report', 1, 2);
INSERT INTO `tblmenu` VALUES (23, 5, 'Rekap Barang', 'report/summary_recap_stock_report', 1, 3);
INSERT INTO `tblmenu` VALUES (24, 5, 'Detail Rekap Barang', 'report/detail_recap_stock_report', 1, 4);
INSERT INTO `tblmenu` VALUES (25, 0, 'Dashboard', 'dashboard/dashboard', 1, 1);
INSERT INTO `tblmenu` VALUES (26, 2, 'Bundling', 'master/bundling', 0, 8);
INSERT INTO `tblmenu` VALUES (27, 3, 'Pindah Stok', 'inventory/stock_switch', 0, 5);
INSERT INTO `tblmenu` VALUES (28, 5, 'Keuntungan Penjualan', 'report/profit_report', 1, 5);
INSERT INTO `tblmenu` VALUES (29, 4, 'Cek Harga', 'sales/check_price', 1, 5);
INSERT INTO `tblmenu` VALUES (30, 2, 'Merk', 'master/merk', 1, 7);

-- ----------------------------
-- Table structure for tblmerk
-- ----------------------------
DROP TABLE IF EXISTS `tblmerk`;
CREATE TABLE `tblmerk`  (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 66 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tblmerk
-- ----------------------------
INSERT INTO `tblmerk` VALUES (1, 'GOLDSTAR');
INSERT INTO `tblmerk` VALUES (2, 'NGETOP');
INSERT INTO `tblmerk` VALUES (3, 'HEMATO');
INSERT INTO `tblmerk` VALUES (4, 'YONA');
INSERT INTO `tblmerk` VALUES (5, 'JOFRANS');
INSERT INTO `tblmerk` VALUES (6, 'CHOP-CHOP');
INSERT INTO `tblmerk` VALUES (7, 'BERNADI');
INSERT INTO `tblmerk` VALUES (8, 'VITALIA');
INSERT INTO `tblmerk` VALUES (9, 'WEIWAYANG');
INSERT INTO `tblmerk` VALUES (10, 'UMIAMI');
INSERT INTO `tblmerk` VALUES (11, 'RIOUS');
INSERT INTO `tblmerk` VALUES (12, 'BELFOODS');
INSERT INTO `tblmerk` VALUES (13, 'CEDEA');
INSERT INTO `tblmerk` VALUES (14, 'TEMAN LAUT');
INSERT INTO `tblmerk` VALUES (15, 'SO GOOD');
INSERT INTO `tblmerk` VALUES (16, 'SO NICE');
INSERT INTO `tblmerk` VALUES (17, 'SO ECO');
INSERT INTO `tblmerk` VALUES (18, 'QUEEN FOOD');
INSERT INTO `tblmerk` VALUES (19, 'MAXCHOICE');
INSERT INTO `tblmerk` VALUES (20, 'DELIMAX');
INSERT INTO `tblmerk` VALUES (21, 'MINAKU');
INSERT INTO `tblmerk` VALUES (22, 'SUNFISH');
INSERT INTO `tblmerk` VALUES (23, 'DELMONTE');
INSERT INTO `tblmerk` VALUES (24, 'MAESTRO');
INSERT INTO `tblmerk` VALUES (25, 'PRIMAAGUNG');
INSERT INTO `tblmerk` VALUES (26, 'KK');
INSERT INTO `tblmerk` VALUES (27, 'MUANTAP');
INSERT INTO `tblmerk` VALUES (28, 'BARTOZ');
INSERT INTO `tblmerk` VALUES (29, 'MITRAKU');
INSERT INTO `tblmerk` VALUES (30, 'BUMIFOOD');
INSERT INTO `tblmerk` VALUES (31, 'MANTUL');
INSERT INTO `tblmerk` VALUES (32, 'SEDANI');
INSERT INTO `tblmerk` VALUES (33, 'LAFONTE');
INSERT INTO `tblmerk` VALUES (34, 'KING FOOD');
INSERT INTO `tblmerk` VALUES (35, 'KIPAO');
INSERT INTO `tblmerk` VALUES (36, 'BOSS');
INSERT INTO `tblmerk` VALUES (37, 'KIBIF');
INSERT INTO `tblmerk` VALUES (38, 'PELANGI');
INSERT INTO `tblmerk` VALUES (39, 'JOLIN');
INSERT INTO `tblmerk` VALUES (40, 'CIRENG');
INSERT INTO `tblmerk` VALUES (41, 'BEN\'S');
INSERT INTO `tblmerk` VALUES (42, 'BAWANG');
INSERT INTO `tblmerk` VALUES (43, 'WARISAN');
INSERT INTO `tblmerk` VALUES (44, 'FROZENLAND');
INSERT INTO `tblmerk` VALUES (45, 'AVIKO');
INSERT INTO `tblmerk` VALUES (46, 'FARM FRITES');
INSERT INTO `tblmerk` VALUES (47, 'PERFECTO');
INSERT INTO `tblmerk` VALUES (48, 'SHIFUDO');
INSERT INTO `tblmerk` VALUES (49, 'FIESTA');
INSERT INTO `tblmerk` VALUES (50, 'MY TASTE');
INSERT INTO `tblmerk` VALUES (51, 'BELIBIS');
INSERT INTO `tblmerk` VALUES (52, 'MC LEWIS');
INSERT INTO `tblmerk` VALUES (53, 'KIMBO');
INSERT INTO `tblmerk` VALUES (54, 'VIGO');
INSERT INTO `tblmerk` VALUES (55, 'KANZLER');
INSERT INTO `tblmerk` VALUES (56, 'JURAGAN');
INSERT INTO `tblmerk` VALUES (57, 'EURO');
INSERT INTO `tblmerk` VALUES (58, 'BEST');
INSERT INTO `tblmerk` VALUES (59, 'DOSUKA');
INSERT INTO `tblmerk` VALUES (60, 'BON BON');
INSERT INTO `tblmerk` VALUES (61, 'YOMAS');
INSERT INTO `tblmerk` VALUES (62, 'ESSEM');
INSERT INTO `tblmerk` VALUES (63, 'SUNNYGOLD');
INSERT INTO `tblmerk` VALUES (64, 'CIKIWIKI');
INSERT INTO `tblmerk` VALUES (65, 'GEBOOOY');

-- ----------------------------
-- Table structure for tblmodule
-- ----------------------------
DROP TABLE IF EXISTS `tblmodule`;
CREATE TABLE `tblmodule`  (
  `module_id` int NOT NULL AUTO_INCREMENT,
  `module_name` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `module_icon` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `data_order` int NOT NULL,
  PRIMARY KEY (`module_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tblmodule
-- ----------------------------
INSERT INTO `tblmodule` VALUES (1, 'Manajemen Pengguna', '<i class=\"fa fa-users\"></i>', 1);
INSERT INTO `tblmodule` VALUES (2, 'Data Utama', '<i class=\"fa fa-tags\"></i>', 2);
INSERT INTO `tblmodule` VALUES (3, 'Inventory', '<i class=\"fa fa-cubes\"></i>', 3);
INSERT INTO `tblmodule` VALUES (4, 'Transaksi', '<i class=\"fa fa-usd\"></i>', 4);
INSERT INTO `tblmodule` VALUES (5, 'Laporan', '<i class=\"fa fa-file-o\"></i>', 5);

-- ----------------------------
-- Table structure for tblsales
-- ----------------------------
DROP TABLE IF EXISTS `tblsales`;
CREATE TABLE `tblsales`  (
  `sales_id` int NOT NULL AUTO_INCREMENT,
  `branch_id` int NOT NULL,
  `sales_number` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `total_price` decimal(18, 2) NULL DEFAULT NULL,
  `total_disc` decimal(18, 2) NULL DEFAULT NULL,
  `total_transaction` decimal(18, 2) NULL DEFAULT NULL,
  `payment_type` int NOT NULL,
  `bank_id` int NOT NULL,
  `card_holder` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `card_number` varchar(20) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `payment` decimal(18, 2) NULL DEFAULT NULL,
  `exchange` decimal(18, 2) NULL DEFAULT NULL,
  `notes` varchar(2000) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `creator_id` int NULL DEFAULT NULL,
  `created_date` datetime NULL DEFAULT NULL,
  `modificator_id` int NULL DEFAULT NULL,
  `modified_date` datetime NULL DEFAULT NULL,
  PRIMARY KEY (`sales_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tblsales
-- ----------------------------

-- ----------------------------
-- Table structure for tblsales_det
-- ----------------------------
DROP TABLE IF EXISTS `tblsales_det`;
CREATE TABLE `tblsales_det`  (
  `sales_det_id` int NOT NULL AUTO_INCREMENT,
  `sales_id` int NOT NULL,
  `item_id` int NOT NULL,
  `price` decimal(18, 0) NULL DEFAULT NULL,
  `disc` decimal(18, 0) NULL DEFAULT NULL,
  `extra_disc` decimal(18, 0) NOT NULL,
  `qty` int NOT NULL,
  `subtotal` decimal(18, 0) NULL DEFAULT NULL,
  `creator_id` int NULL DEFAULT NULL,
  `created_date` datetime NULL DEFAULT NULL,
  `modificator_id` int NULL DEFAULT NULL,
  `modified_date` datetime NULL DEFAULT NULL,
  PRIMARY KEY (`sales_det_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tblsales_det
-- ----------------------------

-- ----------------------------
-- Table structure for tblsales_exchange
-- ----------------------------
DROP TABLE IF EXISTS `tblsales_exchange`;
CREATE TABLE `tblsales_exchange`  (
  `sales_exchange_id` int NOT NULL AUTO_INCREMENT,
  `branch_id` int NOT NULL,
  `sales_exchange_number` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `sales_number` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `total_transaction` decimal(18, 0) NOT NULL,
  `payment` decimal(18, 0) NOT NULL,
  `exchange` decimal(18, 0) NOT NULL,
  `description` varchar(2000) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `creator_id` int NOT NULL,
  `created_date` datetime NOT NULL,
  `modificator_id` int NULL DEFAULT NULL,
  `modified_date` datetime NULL DEFAULT NULL,
  PRIMARY KEY (`sales_exchange_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 24 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tblsales_exchange
-- ----------------------------

-- ----------------------------
-- Table structure for tblsales_exchange_det
-- ----------------------------
DROP TABLE IF EXISTS `tblsales_exchange_det`;
CREATE TABLE `tblsales_exchange_det`  (
  `sales_exchange_det_id` int NOT NULL AUTO_INCREMENT,
  `sales_exchange_id` int NOT NULL,
  `sales_det_id` int NOT NULL,
  `item_origin` int NOT NULL,
  `buying_price` decimal(18, 0) NOT NULL,
  `qty_origin` int NOT NULL,
  `buying_disc` decimal(18, 0) NOT NULL,
  `item_exchange` int NOT NULL,
  `qty_stock` int NOT NULL,
  `qty_exchange` int NOT NULL,
  `extra_payment` decimal(18, 0) NOT NULL,
  `creator_id` int NOT NULL,
  `created_date` datetime NOT NULL,
  `modificator_id` int NULL DEFAULT NULL,
  `modified_date` datetime NULL DEFAULT NULL,
  PRIMARY KEY (`sales_exchange_det_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 31 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tblsales_exchange_det
-- ----------------------------

-- ----------------------------
-- Table structure for tblstock_adj
-- ----------------------------
DROP TABLE IF EXISTS `tblstock_adj`;
CREATE TABLE `tblstock_adj`  (
  `stock_adj_id` int NOT NULL AUTO_INCREMENT,
  `branch_id` int NOT NULL,
  `item_id` int NOT NULL,
  `adj_number` int NOT NULL,
  `adj_type` int NOT NULL,
  `buying_price` decimal(18, 0) NOT NULL,
  `description` varchar(2000) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `creator_id` int NULL DEFAULT NULL,
  `created_date` datetime NULL DEFAULT NULL,
  `modificator_id` int NULL DEFAULT NULL,
  `modified_date` datetime NULL DEFAULT NULL,
  PRIMARY KEY (`stock_adj_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tblstock_adj
-- ----------------------------

-- ----------------------------
-- Table structure for tblstock_category
-- ----------------------------
DROP TABLE IF EXISTS `tblstock_category`;
CREATE TABLE `tblstock_category`  (
  `stock_category_id` int NOT NULL AUTO_INCREMENT,
  `stock_category_code` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `stock_category_name` varchar(500) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `creator_id` int NULL DEFAULT NULL,
  `created_date` datetime NULL DEFAULT NULL,
  `modificator_id` int NULL DEFAULT NULL,
  `modified_date` datetime NULL DEFAULT NULL,
  PRIMARY KEY (`stock_category_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tblstock_category
-- ----------------------------
INSERT INTO `tblstock_category` VALUES (1, 'CG2022020001', 'MAKANAN', 1, '2020-05-15 23:09:39', NULL, NULL);
INSERT INTO `tblstock_category` VALUES (2, 'CG2022020002', 'MINUMAN', 1, '2020-05-15 23:09:39', NULL, NULL);

-- ----------------------------
-- Table structure for tblstock_flow
-- ----------------------------
DROP TABLE IF EXISTS `tblstock_flow`;
CREATE TABLE `tblstock_flow`  (
  `stock_flow_id` int NOT NULL AUTO_INCREMENT,
  `branch_id` int NOT NULL,
  `item_id` int NULL DEFAULT NULL,
  `flow_type` int NULL DEFAULT NULL,
  `flow_date` datetime NULL DEFAULT NULL,
  `qty_trx` int NULL DEFAULT NULL,
  `qty_now` int NULL DEFAULT NULL,
  `price` decimal(18, 2) NULL DEFAULT NULL,
  `information` varchar(2000) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `reff_id` int NULL DEFAULT NULL,
  `reff_trx` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  PRIMARY KEY (`stock_flow_id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 1 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tblstock_flow
-- ----------------------------

-- ----------------------------
-- Table structure for tblstock_in
-- ----------------------------
DROP TABLE IF EXISTS `tblstock_in`;
CREATE TABLE `tblstock_in`  (
  `stock_in_id` int NOT NULL AUTO_INCREMENT,
  `branch_id` int NOT NULL,
  `supplier_id` int NOT NULL,
  `doc_number` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `stock_date` date NULL DEFAULT NULL,
  `status` int NULL DEFAULT NULL,
  `description` varchar(2000) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `creator_id` int NULL DEFAULT NULL,
  `created_date` datetime NULL DEFAULT NULL,
  `modificator_id` int NULL DEFAULT NULL,
  `modified_date` datetime NULL DEFAULT NULL,
  PRIMARY KEY (`stock_in_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tblstock_in
-- ----------------------------

-- ----------------------------
-- Table structure for tblstock_in_det
-- ----------------------------
DROP TABLE IF EXISTS `tblstock_in_det`;
CREATE TABLE `tblstock_in_det`  (
  `stock_in_det_id` int NOT NULL AUTO_INCREMENT,
  `stock_in_id` int NOT NULL,
  `item_id` int NOT NULL,
  `qty` int NULL DEFAULT NULL,
  `creator_id` int NULL DEFAULT NULL,
  `created_date` datetime NULL DEFAULT NULL,
  `modificator_id` int NULL DEFAULT NULL,
  `modified_date` datetime NULL DEFAULT NULL,
  PRIMARY KEY (`stock_in_det_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tblstock_in_det
-- ----------------------------

-- ----------------------------
-- Table structure for tblstock_out
-- ----------------------------
DROP TABLE IF EXISTS `tblstock_out`;
CREATE TABLE `tblstock_out`  (
  `stock_out_id` int NOT NULL AUTO_INCREMENT,
  `branch_id` int NOT NULL,
  `doc_number` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `stock_date` datetime NULL DEFAULT NULL,
  `status` int NULL DEFAULT NULL,
  `description` varchar(2000) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `creator_id` int NULL DEFAULT NULL,
  `created_date` datetime NULL DEFAULT NULL,
  `modificator_id` int NULL DEFAULT NULL,
  `modified_date` datetime NULL DEFAULT NULL,
  PRIMARY KEY (`stock_out_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tblstock_out
-- ----------------------------

-- ----------------------------
-- Table structure for tblstock_out_det
-- ----------------------------
DROP TABLE IF EXISTS `tblstock_out_det`;
CREATE TABLE `tblstock_out_det`  (
  `stock_out_det_id` int NOT NULL AUTO_INCREMENT,
  `stock_out_id` int NOT NULL,
  `item_id` int NOT NULL,
  `qty` int NULL DEFAULT NULL,
  `information` varchar(2000) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `creator_id` int NULL DEFAULT NULL,
  `created_date` datetime NULL DEFAULT NULL,
  `modificator_id` int NULL DEFAULT NULL,
  `modified_date` datetime NULL DEFAULT NULL,
  PRIMARY KEY (`stock_out_det_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tblstock_out_det
-- ----------------------------

-- ----------------------------
-- Table structure for tblstock_switch
-- ----------------------------
DROP TABLE IF EXISTS `tblstock_switch`;
CREATE TABLE `tblstock_switch`  (
  `stock_switch_id` int NOT NULL AUTO_INCREMENT,
  `branch_origin` int NOT NULL,
  `branch_destination` int NOT NULL,
  `switch_date` date NOT NULL,
  `status` int NOT NULL,
  `description` varchar(2000) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `creator_id` int NOT NULL,
  `created_date` datetime NOT NULL,
  `modificator_id` int NULL DEFAULT NULL,
  `modified_date` datetime NULL DEFAULT NULL,
  PRIMARY KEY (`stock_switch_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 13 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tblstock_switch
-- ----------------------------

-- ----------------------------
-- Table structure for tblstock_switch_det
-- ----------------------------
DROP TABLE IF EXISTS `tblstock_switch_det`;
CREATE TABLE `tblstock_switch_det`  (
  `stock_switch_det_id` int NOT NULL AUTO_INCREMENT,
  `stock_switch_id` int NOT NULL,
  `item_id` int NOT NULL,
  `qty_available` int NOT NULL,
  `qty_switch` int NOT NULL,
  `creator_id` int NOT NULL,
  `created_date` datetime NOT NULL,
  `modificator_id` int NULL DEFAULT NULL,
  `modified_date` datetime NULL DEFAULT NULL,
  PRIMARY KEY (`stock_switch_det_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 22 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tblstock_switch_det
-- ----------------------------

-- ----------------------------
-- Table structure for tblsupplier
-- ----------------------------
DROP TABLE IF EXISTS `tblsupplier`;
CREATE TABLE `tblsupplier`  (
  `supplier_id` int NOT NULL AUTO_INCREMENT,
  `supplier_code` varchar(20) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `supplier_name` varchar(500) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `contact_name` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `phone` varchar(20) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `handphone` varchar(20) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `email` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `city` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `address` varchar(1000) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `description` varchar(1000) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `creator_id` int NULL DEFAULT NULL,
  `created_date` datetime NULL DEFAULT NULL,
  `modificator_id` int NULL DEFAULT NULL,
  `modified_date` datetime NULL DEFAULT NULL,
  PRIMARY KEY (`supplier_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 28 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tblsupplier
-- ----------------------------
INSERT INTO `tblsupplier` VALUES (1, 'SP2022020001', 'BRAND WONOKOYO', '', '', '', '', '', '', '', 1, '2020-05-15 23:09:39', NULL, NULL);
INSERT INTO `tblsupplier` VALUES (2, 'SP2022020002', 'DAGSAP ENDURA', '', '', '', '', '', '', '', 1, '2020-05-15 23:09:39', NULL, NULL);
INSERT INTO `tblsupplier` VALUES (3, 'SP2022020003', 'ADILMART', '', '', '', '', '', '', '', 1, '2020-05-15 23:09:39', NULL, NULL);
INSERT INTO `tblsupplier` VALUES (4, 'SP2022020004', 'BRAND ELODA MITRA (BERNARDI)', '', '', '', '', '', '', '', 1, '2020-05-15 23:09:39', NULL, NULL);
INSERT INTO `tblsupplier` VALUES (5, 'SP2022020005', 'BRAND BELFOODS ', '', '', '', '', '', '', '', 1, '2020-05-15 23:09:39', NULL, NULL);
INSERT INTO `tblsupplier` VALUES (6, 'SP2022020006', 'BRAND CITRA DIMENSI ARTHALI (CDA)', '', '', '', '', '', '', '', 1, '2020-05-15 23:09:39', NULL, NULL);
INSERT INTO `tblsupplier` VALUES (7, 'SP2022020007', 'BRAND JAPFA FOOD', '', '', '', '', '', '', '', 1, '2020-05-15 23:09:39', NULL, NULL);
INSERT INTO `tblsupplier` VALUES (8, 'SP2022020008', 'BRAND QUUEN FOOD', '', '', '', '', '', '', '', 1, '2020-05-15 23:09:39', NULL, NULL);
INSERT INTO `tblsupplier` VALUES (9, 'SP2022020009', 'BRAND BOLESCA', '', '', '', '', '', '', '', 1, '2020-05-15 23:09:39', NULL, NULL);
INSERT INTO `tblsupplier` VALUES (10, 'SP2022020010', 'BRAND MINAKU FOOD', '', '', '', '', '', '', '', 1, '2020-05-15 23:09:39', NULL, NULL);
INSERT INTO `tblsupplier` VALUES (11, 'SP2022020011', 'BRAND INDOSEAFOOD', '', '', '', '', '', '', '', 1, '2020-05-15 23:09:39', NULL, NULL);
INSERT INTO `tblsupplier` VALUES (12, 'SP2022020012', 'BRAND DELMONTE MAESTRO', '', '', '', '', '', '', '', 1, '2020-05-15 23:09:39', NULL, NULL);
INSERT INTO `tblsupplier` VALUES (13, 'SP2022020013', 'BRAND PRIMAAGUNG', '', '', '', '', '', '', '', 1, '2020-05-15 23:09:39', NULL, NULL);
INSERT INTO `tblsupplier` VALUES (14, 'SP2022020014', 'BRAND MALINDO FOOD', '', '', '', '', '', '', '', 1, '2020-05-15 23:09:39', NULL, NULL);
INSERT INTO `tblsupplier` VALUES (15, 'SP2022020015', 'BRAND PORTO FOOD', '', '', '', '', '', '', '', 1, '2020-05-15 23:09:39', NULL, NULL);
INSERT INTO `tblsupplier` VALUES (16, 'SP2022020016', 'BRAND SEKAR BUMI', '', '', '', '', '', '', '', 1, '2020-05-15 23:09:39', NULL, NULL);
INSERT INTO `tblsupplier` VALUES (17, 'SP2022020017', 'BRAND LAFONTE SEDANI', '', '', '', '', '', '', '', 1, '2020-05-15 23:09:39', NULL, NULL);
INSERT INTO `tblsupplier` VALUES (18, 'SP2022020018', 'BRAND KING FOOD', '', '', '', '', '', '', '', 1, '2020-05-15 23:09:39', NULL, NULL);
INSERT INTO `tblsupplier` VALUES (19, 'SP2022020019', 'BRAND KIBIF', '', '', '', '', '', '', '', 1, '2020-05-15 23:09:39', NULL, NULL);
INSERT INTO `tblsupplier` VALUES (20, 'SP2022020020', 'BRAND PELANGI ', '', '', '', '', '', '', '', 1, '2020-05-15 23:09:39', NULL, NULL);
INSERT INTO `tblsupplier` VALUES (21, 'SP2022020021', 'FROZEN MIX', '', '', '', '', '', '', '', 1, '2020-05-15 23:09:39', NULL, NULL);
INSERT INTO `tblsupplier` VALUES (22, 'SP2022020022', 'DRY MIX', '', '', '', '', '', '', '', 1, '2020-05-15 23:09:39', NULL, NULL);
INSERT INTO `tblsupplier` VALUES (23, 'SP2022020023', 'BRAND PANGAN SEHAT', '', '', '', '', '', '', '', 1, '2020-05-15 23:09:39', NULL, NULL);
INSERT INTO `tblsupplier` VALUES (24, 'SP2022020024', 'BRAND MACROSENTRA', '', '', '', '', '', '', '', 1, '2020-05-15 23:09:39', NULL, NULL);
INSERT INTO `tblsupplier` VALUES (25, 'SP2022020025', 'BRAND CIOMAS', '', '', '', '', '', '', '', 1, '2020-05-15 23:09:39', NULL, NULL);
INSERT INTO `tblsupplier` VALUES (26, 'SP2022020026', 'BRAND MALINDO', '', '', '', '', '', '', '', 1, '2020-05-15 23:09:39', NULL, NULL);
INSERT INTO `tblsupplier` VALUES (27, 'SP2022020027', 'BRAND GEBOOY', '', '', '', '', '', '', '', 1, '2020-05-15 23:09:39', NULL, NULL);

-- ----------------------------
-- Table structure for tblunit
-- ----------------------------
DROP TABLE IF EXISTS `tblunit`;
CREATE TABLE `tblunit`  (
  `unit_id` int NOT NULL AUTO_INCREMENT,
  `unit_code` varchar(10) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `unit_name` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `creator_id` int NULL DEFAULT NULL,
  `created_date` datetime NULL DEFAULT NULL,
  `modificator_id` int NULL DEFAULT NULL,
  `modified_date` datetime NULL DEFAULT NULL,
  PRIMARY KEY (`unit_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tblunit
-- ----------------------------
INSERT INTO `tblunit` VALUES (1, 'SU22020001', 'pcs', 1, '0000-00-00 00:00:00', 2020, NULL);
INSERT INTO `tblunit` VALUES (2, 'SU22020002', 'box', 1, '0000-00-00 00:00:00', 2020, NULL);

-- ----------------------------
-- Table structure for tbluser
-- ----------------------------
DROP TABLE IF EXISTS `tbluser`;
CREATE TABLE `tbluser`  (
  `user_id` int NOT NULL AUTO_INCREMENT,
  `user_group_id` int NOT NULL,
  `branch_id` int NOT NULL,
  `fullname` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `phone` varchar(20) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `email` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `address` varchar(500) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `username` varchar(20) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `password` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `login_code` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `status` int NULL DEFAULT NULL,
  `creator_id` int NULL DEFAULT NULL,
  `created_date` datetime NULL DEFAULT NULL,
  `modificator_id` int NULL DEFAULT NULL,
  `modified_date` datetime NULL DEFAULT NULL,
  PRIMARY KEY (`user_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 47 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tbluser
-- ----------------------------
INSERT INTO `tbluser` VALUES (1, 1, 11, 'Windy', '081510810631', 'muezzapetshop@yahoo.com', '                                                                                                                                                                                                                                ', 'admin', 'admin', '12345', 1, NULL, NULL, 1, '2022-03-03 13:00:12');
INSERT INTO `tbluser` VALUES (44, 9, 11, 'OPPIE', '08151623409', 'supervisor@muezzapetshop.com', '', 'spv', 'spv', '12345', 1, 1, '2020-05-15 23:09:39', 1, '2020-08-22 23:26:51');
INSERT INTO `tbluser` VALUES (45, 10, 11, 'Lia Fahlevi', '085716664248', 'muezzapetshop@yahoo.com', '                                                                                    Paradise Serpong City\r\n                                                                                                   ', 'kasir', 'kasir', '12345', 1, 1, '2020-05-15 23:24:28', 1, '2020-06-12 20:30:08');
INSERT INTO `tbluser` VALUES (46, 10, 11, 'Windy', '081270787412', 'muezzapetshop@yahoo.com', '                                ', 'Kasir 2', '67891', '', 1, 1, '2020-05-20 14:30:13', 1, '2020-08-22 23:28:03');

-- ----------------------------
-- Table structure for tbluser_access
-- ----------------------------
DROP TABLE IF EXISTS `tbluser_access`;
CREATE TABLE `tbluser_access`  (
  `user_access_id` int NOT NULL AUTO_INCREMENT,
  `user_group_id` int NOT NULL,
  `menu_id` int NOT NULL,
  `is_access` tinyint NULL DEFAULT NULL,
  `creator_id` int NULL DEFAULT NULL,
  `created_date` datetime NULL DEFAULT NULL,
  `modificator_id` int NULL DEFAULT NULL,
  `modified_date` datetime NULL DEFAULT NULL,
  PRIMARY KEY (`user_access_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 190 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tbluser_access
-- ----------------------------
INSERT INTO `tbluser_access` VALUES (1, 1, 1, 1, 1, '2019-09-11 23:57:42', 1, '2019-10-07 09:41:35');
INSERT INTO `tbluser_access` VALUES (2, 1, 2, 1, 1, '2019-09-11 23:57:42', 1, '2019-10-07 09:41:35');
INSERT INTO `tbluser_access` VALUES (3, 1, 3, 1, 1, '2019-09-11 23:57:42', 1, '2019-10-07 09:41:35');
INSERT INTO `tbluser_access` VALUES (4, 1, 4, 1, 1, '2019-09-11 23:57:42', 1, '2019-10-07 09:41:35');
INSERT INTO `tbluser_access` VALUES (5, 1, 5, 1, 1, '2019-09-11 23:57:42', 1, '2019-10-07 09:41:35');
INSERT INTO `tbluser_access` VALUES (6, 1, 6, 0, 1, '2019-09-11 23:57:42', 1, '2019-10-07 09:41:35');
INSERT INTO `tbluser_access` VALUES (7, 1, 7, 1, 1, '2019-09-11 23:57:42', 1, '2019-10-07 09:41:35');
INSERT INTO `tbluser_access` VALUES (8, 1, 8, 1, 1, '2019-09-11 23:57:42', 1, '2019-10-07 09:41:35');
INSERT INTO `tbluser_access` VALUES (9, 1, 9, 1, 1, '2019-09-11 23:57:43', 1, '2019-10-07 09:41:35');
INSERT INTO `tbluser_access` VALUES (10, 1, 10, 1, 1, '2019-09-11 23:57:43', 1, '2019-10-07 09:41:35');
INSERT INTO `tbluser_access` VALUES (11, 1, 11, 1, 1, '2019-09-11 23:57:43', 1, '2019-10-07 09:41:35');
INSERT INTO `tbluser_access` VALUES (12, 1, 12, 1, 1, '2019-09-11 23:57:43', 1, '2019-10-07 09:41:35');
INSERT INTO `tbluser_access` VALUES (13, 1, 13, 1, 1, '2019-09-11 23:57:43', 1, '2019-10-07 09:41:35');
INSERT INTO `tbluser_access` VALUES (14, 1, 14, 1, 1, '2019-09-11 23:57:43', 1, '2019-10-07 09:41:35');
INSERT INTO `tbluser_access` VALUES (15, 1, 15, 1, 1, '2019-09-11 23:57:43', 1, '2019-10-07 09:41:35');
INSERT INTO `tbluser_access` VALUES (16, 1, 16, 1, 1, '2019-09-11 23:57:43', 1, '2019-10-07 09:41:35');
INSERT INTO `tbluser_access` VALUES (17, 1, 17, 0, 1, '2019-09-11 23:57:43', 1, '2019-10-07 09:41:35');
INSERT INTO `tbluser_access` VALUES (18, 1, 18, 1, 1, '2019-09-11 23:57:43', 1, '2019-10-07 09:41:35');
INSERT INTO `tbluser_access` VALUES (19, 1, 19, 0, 1, '2019-09-11 23:57:43', 1, '2019-10-07 09:41:35');
INSERT INTO `tbluser_access` VALUES (20, 1, 20, 0, 1, '2019-09-11 23:57:43', 1, '2019-10-07 09:41:35');
INSERT INTO `tbluser_access` VALUES (21, 1, 21, 1, 1, '2019-09-11 23:57:43', 1, '2019-10-07 09:41:35');
INSERT INTO `tbluser_access` VALUES (22, 1, 22, 1, 1, '2019-09-11 23:57:43', 1, '2019-10-07 09:41:35');
INSERT INTO `tbluser_access` VALUES (23, 1, 23, 1, 1, '2019-09-11 23:57:43', 1, '2019-10-07 09:41:35');
INSERT INTO `tbluser_access` VALUES (24, 1, 24, 1, 1, '2019-09-11 23:57:43', 1, '2019-10-07 09:41:35');
INSERT INTO `tbluser_access` VALUES (97, 9, 1, 0, 1, '2019-09-17 01:09:30', 1, '2019-10-17 13:32:08');
INSERT INTO `tbluser_access` VALUES (98, 9, 2, 0, 1, '2019-09-17 01:09:30', 1, '2019-10-17 13:32:08');
INSERT INTO `tbluser_access` VALUES (99, 9, 3, 0, 1, '2019-09-17 01:09:31', 1, '2019-10-17 13:32:08');
INSERT INTO `tbluser_access` VALUES (100, 9, 4, 0, 1, '2019-09-17 01:09:31', 1, '2019-10-17 13:32:08');
INSERT INTO `tbluser_access` VALUES (101, 9, 5, 0, 1, '2019-09-17 01:09:31', 1, '2019-10-17 13:32:08');
INSERT INTO `tbluser_access` VALUES (102, 9, 6, 0, 1, '2019-09-17 01:09:31', 1, '2019-10-17 13:32:08');
INSERT INTO `tbluser_access` VALUES (103, 9, 7, 0, 1, '2019-09-17 01:09:31', 1, '2019-10-17 13:32:08');
INSERT INTO `tbluser_access` VALUES (104, 9, 8, 0, 1, '2019-09-17 01:09:31', 1, '2019-10-17 13:32:08');
INSERT INTO `tbluser_access` VALUES (105, 9, 9, 0, 1, '2019-09-17 01:09:31', 1, '2019-10-17 13:32:08');
INSERT INTO `tbluser_access` VALUES (106, 9, 10, 0, 1, '2019-09-17 01:09:31', 1, '2019-10-17 13:32:08');
INSERT INTO `tbluser_access` VALUES (107, 9, 11, 0, 1, '2019-09-17 01:09:31', 1, '2019-10-17 13:32:08');
INSERT INTO `tbluser_access` VALUES (108, 9, 12, 0, 1, '2019-09-17 01:09:31', 1, '2019-10-17 13:32:08');
INSERT INTO `tbluser_access` VALUES (109, 9, 13, 1, 1, '2019-09-17 01:09:31', 1, '2019-10-17 13:32:08');
INSERT INTO `tbluser_access` VALUES (110, 9, 14, 1, 1, '2019-09-17 01:09:31', 1, '2019-10-17 13:32:08');
INSERT INTO `tbluser_access` VALUES (111, 9, 15, 1, 1, '2019-09-17 01:09:31', 1, '2019-10-17 13:32:08');
INSERT INTO `tbluser_access` VALUES (112, 9, 16, 1, 1, '2019-09-17 01:09:31', 1, '2019-10-17 13:32:08');
INSERT INTO `tbluser_access` VALUES (113, 9, 17, 0, 1, '2019-09-17 01:09:31', 1, '2019-10-17 13:32:08');
INSERT INTO `tbluser_access` VALUES (114, 9, 18, 1, 1, '2019-09-17 01:09:31', 1, '2019-10-17 13:32:08');
INSERT INTO `tbluser_access` VALUES (115, 9, 19, 0, 1, '2019-09-17 01:09:31', 1, '2019-10-17 13:32:08');
INSERT INTO `tbluser_access` VALUES (116, 9, 20, 0, 1, '2019-09-17 01:09:31', 1, '2019-10-17 13:32:08');
INSERT INTO `tbluser_access` VALUES (117, 9, 21, 1, 1, '2019-09-17 01:09:31', 1, '2019-10-17 13:32:08');
INSERT INTO `tbluser_access` VALUES (118, 9, 22, 1, 1, '2019-09-17 01:09:31', 1, '2019-10-17 13:32:08');
INSERT INTO `tbluser_access` VALUES (119, 9, 23, 1, 1, '2019-09-17 01:09:31', 1, '2019-10-17 13:32:08');
INSERT INTO `tbluser_access` VALUES (120, 9, 24, 1, 1, '2019-09-17 01:09:32', 1, '2019-10-17 13:32:08');
INSERT INTO `tbluser_access` VALUES (121, 10, 1, 0, 1, '2019-09-17 01:10:32', 1, '2019-10-07 10:03:51');
INSERT INTO `tbluser_access` VALUES (122, 10, 2, 0, 1, '2019-09-17 01:10:32', 1, '2019-10-07 10:03:51');
INSERT INTO `tbluser_access` VALUES (123, 10, 3, 0, 1, '2019-09-17 01:10:32', 1, '2019-10-07 10:03:51');
INSERT INTO `tbluser_access` VALUES (124, 10, 4, 0, 1, '2019-09-17 01:10:32', 1, '2019-10-07 10:03:51');
INSERT INTO `tbluser_access` VALUES (125, 10, 5, 0, 1, '2019-09-17 01:10:32', 1, '2019-10-07 10:03:51');
INSERT INTO `tbluser_access` VALUES (126, 10, 6, 0, 1, '2019-09-17 01:10:32', 1, '2019-10-07 10:03:51');
INSERT INTO `tbluser_access` VALUES (127, 10, 7, 0, 1, '2019-09-17 01:10:32', 1, '2019-10-07 10:03:51');
INSERT INTO `tbluser_access` VALUES (128, 10, 8, 0, 1, '2019-09-17 01:10:32', 1, '2019-10-07 10:03:51');
INSERT INTO `tbluser_access` VALUES (129, 10, 9, 0, 1, '2019-09-17 01:10:32', 1, '2019-10-07 10:03:51');
INSERT INTO `tbluser_access` VALUES (130, 10, 10, 0, 1, '2019-09-17 01:10:32', 1, '2019-10-07 10:03:51');
INSERT INTO `tbluser_access` VALUES (131, 10, 11, 0, 1, '2019-09-17 01:10:32', 1, '2019-10-07 10:03:51');
INSERT INTO `tbluser_access` VALUES (132, 10, 12, 0, 1, '2019-09-17 01:10:33', 1, '2019-10-07 10:03:51');
INSERT INTO `tbluser_access` VALUES (133, 10, 13, 0, 1, '2019-09-17 01:10:33', 1, '2019-10-07 10:03:51');
INSERT INTO `tbluser_access` VALUES (134, 10, 14, 0, 1, '2019-09-17 01:10:33', 1, '2019-10-07 10:03:51');
INSERT INTO `tbluser_access` VALUES (135, 10, 15, 0, 1, '2019-09-17 01:10:33', 1, '2019-10-07 10:03:51');
INSERT INTO `tbluser_access` VALUES (136, 10, 16, 0, 1, '2019-09-17 01:10:33', 1, '2019-10-07 10:03:51');
INSERT INTO `tbluser_access` VALUES (137, 10, 17, 1, 1, '2019-09-17 01:10:33', 1, '2019-10-07 10:03:51');
INSERT INTO `tbluser_access` VALUES (138, 10, 18, 0, 1, '2019-09-17 01:10:33', 1, '2019-10-07 10:03:51');
INSERT INTO `tbluser_access` VALUES (139, 10, 19, 0, 1, '2019-09-17 01:10:33', 1, '2019-10-07 10:03:51');
INSERT INTO `tbluser_access` VALUES (140, 10, 20, 1, 1, '2019-09-17 01:10:33', 1, '2019-10-07 10:03:51');
INSERT INTO `tbluser_access` VALUES (141, 10, 21, 0, 1, '2019-09-17 01:10:33', 1, '2019-10-07 10:03:51');
INSERT INTO `tbluser_access` VALUES (142, 10, 22, 0, 1, '2019-09-17 01:10:33', 1, '2019-10-07 10:03:51');
INSERT INTO `tbluser_access` VALUES (143, 10, 23, 0, 1, '2019-09-17 01:10:33', 1, '2019-10-07 10:03:51');
INSERT INTO `tbluser_access` VALUES (144, 10, 24, 0, 1, '2019-09-17 01:10:33', 1, '2019-10-07 10:03:51');
INSERT INTO `tbluser_access` VALUES (145, 9, 25, 1, 1, '2019-09-17 10:37:11', 1, '2019-10-17 13:32:08');
INSERT INTO `tbluser_access` VALUES (146, 10, 25, 0, 1, '2019-09-17 10:37:25', 1, '2019-10-07 10:03:51');
INSERT INTO `tbluser_access` VALUES (147, 1, 25, 1, 1, '2019-09-17 11:09:46', 1, '2019-10-07 09:41:35');
INSERT INTO `tbluser_access` VALUES (148, 1, 26, 0, 1, '2019-09-19 22:55:10', 1, '2019-10-07 09:41:35');
INSERT INTO `tbluser_access` VALUES (149, 9, 26, 0, 1, '2019-09-19 22:55:23', 1, '2019-10-17 13:32:08');
INSERT INTO `tbluser_access` VALUES (150, 10, 26, 0, 1, '2019-09-19 22:55:33', 1, '2019-10-07 10:03:51');
INSERT INTO `tbluser_access` VALUES (151, 1, 27, 1, 1, '2019-09-23 16:46:31', 1, '2019-10-07 09:41:35');
INSERT INTO `tbluser_access` VALUES (152, 9, 27, 1, 1, '2019-09-23 16:46:31', 1, '2019-10-17 13:32:08');
INSERT INTO `tbluser_access` VALUES (153, 10, 27, 0, 1, '2019-09-23 16:46:31', 1, '2019-10-07 10:03:51');
INSERT INTO `tbluser_access` VALUES (154, 1, 28, 1, 1, '2019-09-29 00:51:58', 1, '2019-10-07 09:41:35');
INSERT INTO `tbluser_access` VALUES (155, 9, 28, 1, 1, '2019-09-29 00:51:58', 1, '2019-10-17 13:32:08');
INSERT INTO `tbluser_access` VALUES (156, 10, 28, 0, 1, '2019-09-29 00:51:58', 1, '2019-10-07 10:03:51');
INSERT INTO `tbluser_access` VALUES (157, 1, 29, 1, 1, '2019-10-07 09:38:46', 1, '2019-10-07 09:41:35');
INSERT INTO `tbluser_access` VALUES (158, 9, 29, 1, 1, '2019-10-07 09:38:46', 1, '2019-10-17 13:32:08');
INSERT INTO `tbluser_access` VALUES (159, 10, 29, 0, 1, '2019-10-07 09:38:46', 1, '2019-10-07 10:03:51');
INSERT INTO `tbluser_access` VALUES (189, 1, 30, 1, 1, '2022-02-28 16:46:26', 1, '2022-02-28 16:46:26');

-- ----------------------------
-- Table structure for tbluser_group
-- ----------------------------
DROP TABLE IF EXISTS `tbluser_group`;
CREATE TABLE `tbluser_group`  (
  `user_group_id` int NOT NULL AUTO_INCREMENT,
  `user_group_code` varchar(10) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `user_group_name` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `is_cashier` int NOT NULL,
  `user_group_status` int NOT NULL,
  `creator_id` int NULL DEFAULT NULL,
  `created_date` datetime NULL DEFAULT NULL,
  `modificator_id` int NULL DEFAULT NULL,
  `modified_date` datetime NULL DEFAULT NULL,
  PRIMARY KEY (`user_group_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 12 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tbluser_group
-- ----------------------------
INSERT INTO `tbluser_group` VALUES (1, 'UG19090001', 'Administrator', 0, 1, NULL, NULL, 1, '2019-09-29 15:40:09');
INSERT INTO `tbluser_group` VALUES (9, 'UG19090002', 'Supervisor Toko', 0, 1, 1, '2019-09-17 01:09:30', NULL, NULL);
INSERT INTO `tbluser_group` VALUES (10, 'UG19090003', 'Kasir', 1, 1, 1, '2019-09-17 01:10:32', NULL, NULL);

SET FOREIGN_KEY_CHECKS = 1;
