/*
 Navicat Premium Data Transfer

 Source Server         : DB server Vinh ca
 Source Server Type    : MySQL
 Source Server Version : 100129
 Source Host           : 10.97.29.203:3306
 Source Schema         : phanmem_gdnghenghiep

 Target Server Type    : MySQL
 Target Server Version : 100129
 File Encoding         : 65001

 Date: 18/06/2024 08:21:51
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for account_administrators
-- ----------------------------
DROP TABLE IF EXISTS `account_administrators`;
CREATE TABLE `account_administrators`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `account` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `password` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `email` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `role` int UNSIGNED NULL DEFAULT NULL,
  `numberphone` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `avatar_path` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `active` bit(1) NULL DEFAULT NULL,
  `remember_token` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`, `account`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of account_administrators
-- ----------------------------
INSERT INTO `account_administrators` VALUES (1, 'administrator', '$2y$10$WsOV9QULyB6EM95Kv7i0LOH406GaBc5ZJWmkmSPA1qi/Z2tGsO8.e', 'Thái Đình Cẩn1saddsa', 'super.administrator@gmail.com', 1, '08541452422sdaadsdsa', '/upload/avatar_account/logo-vnpt-app.jpg', b'1', NULL, NULL, '2022-08-30 14:24:54');

-- ----------------------------
-- Table structure for account_users
-- ----------------------------
DROP TABLE IF EXISTS `account_users`;
CREATE TABLE `account_users`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `account` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `password` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `email` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `numberphone` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `avatar_path` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `active` int NULL DEFAULT NULL,
  `remember_token` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `id_site` int NOT NULL,
  `level` int NOT NULL,
  PRIMARY KEY (`id`, `account`) USING BTREE,
  INDEX `id`(`id` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 33 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of account_users
-- ----------------------------
INSERT INTO `account_users` VALUES (31, 'admin_ttgdnncth', '$2y$10$jb/wDi99isY5Ge4l18Z6Iu/e/3sg7V4uKgox0tNzB4rZrWZd4Xt/a', 'Quản trị viên', NULL, NULL, NULL, 1, NULL, '2023-10-06 09:38:02', '2023-10-06 09:38:02', 25, 1);
INSERT INTO `account_users` VALUES (32, 'admin_ttgdnncth2', '$2y$10$eLFfhK75892mqSV/upys1O/GEjuhuoFKMmFRlkn/ahfIkfVXZmLtm', 'admin_ttgdnncth2', NULL, NULL, NULL, 1, NULL, '2023-10-06 09:40:07', '2023-10-06 09:40:07', 25, 0);

-- ----------------------------
-- Table structure for module_attendances
-- ----------------------------
DROP TABLE IF EXISTS `module_attendances`;
CREATE TABLE `module_attendances`  (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `id_site` int NOT NULL,
  `id_student` int NOT NULL,
  `id_course` int NOT NULL,
  `attendance` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `id_student`(`id_student` ASC) USING BTREE,
  INDEX `id_course`(`id_course` ASC) USING BTREE,
  CONSTRAINT `module_attendances_ibfk_2` FOREIGN KEY (`id_course`) REFERENCES `module_type_of_courses` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `module_attendances_ibfk_3` FOREIGN KEY (`id_student`) REFERENCES `module_manage_students` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 205 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of module_attendances
-- ----------------------------
INSERT INTO `module_attendances` VALUES (135, 25, 199, 25, '0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0', '2024-05-07 09:20:04', '2024-05-07 09:20:04');
INSERT INTO `module_attendances` VALUES (136, 25, 200, 25, '0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0', '2024-05-07 13:17:18', '2024-05-07 13:17:18');
INSERT INTO `module_attendances` VALUES (137, 25, 201, 25, '0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0', '2024-05-07 13:24:49', '2024-05-07 13:24:49');
INSERT INTO `module_attendances` VALUES (138, 25, 202, 25, '0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0', '2024-05-07 13:26:46', '2024-05-07 13:26:46');
INSERT INTO `module_attendances` VALUES (139, 25, 203, 25, '0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0', '2024-05-07 13:28:41', '2024-05-07 13:28:41');
INSERT INTO `module_attendances` VALUES (140, 25, 204, 25, '0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0', '2024-05-07 13:30:18', '2024-05-07 13:30:18');
INSERT INTO `module_attendances` VALUES (141, 25, 205, 25, '0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0', '2024-05-07 13:32:16', '2024-05-07 13:32:16');
INSERT INTO `module_attendances` VALUES (142, 25, 206, 25, '0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0', '2024-05-07 13:34:18', '2024-05-07 13:34:18');
INSERT INTO `module_attendances` VALUES (143, 25, 207, 25, '0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0', '2024-05-07 13:41:36', '2024-05-07 13:41:36');
INSERT INTO `module_attendances` VALUES (144, 25, 208, 25, '0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0', '2024-05-07 13:43:04', '2024-05-07 13:43:04');
INSERT INTO `module_attendances` VALUES (145, 25, 209, 25, '0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0', '2024-05-07 13:44:52', '2024-05-07 13:44:52');
INSERT INTO `module_attendances` VALUES (146, 25, 210, 25, '0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0', '2024-05-07 13:46:39', '2024-05-07 13:46:39');
INSERT INTO `module_attendances` VALUES (147, 25, 211, 25, '0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0', '2024-05-07 13:48:24', '2024-05-07 13:48:24');
INSERT INTO `module_attendances` VALUES (148, 25, 212, 25, '0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0', '2024-05-07 13:50:12', '2024-05-07 13:50:12');
INSERT INTO `module_attendances` VALUES (149, 25, 213, 25, '0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0', '2024-05-07 13:52:09', '2024-05-07 13:52:09');
INSERT INTO `module_attendances` VALUES (150, 25, 214, 25, '0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0', '2024-05-07 14:08:33', '2024-05-07 14:08:33');
INSERT INTO `module_attendances` VALUES (151, 25, 215, 25, '0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0', '2024-05-07 14:10:08', '2024-05-07 14:10:08');
INSERT INTO `module_attendances` VALUES (152, 25, 216, 25, '0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0', '2024-05-07 14:14:08', '2024-05-07 14:14:08');
INSERT INTO `module_attendances` VALUES (153, 25, 217, 26, '0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0', '2024-05-15 09:37:17', '2024-05-15 09:37:17');
INSERT INTO `module_attendances` VALUES (154, 25, 218, 26, '0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0', '2024-05-15 09:39:39', '2024-05-15 09:39:39');
INSERT INTO `module_attendances` VALUES (155, 25, 219, 26, '0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0', '2024-05-15 09:41:18', '2024-05-15 09:41:18');
INSERT INTO `module_attendances` VALUES (156, 25, 220, 26, '0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0', '2024-05-15 09:43:37', '2024-05-15 09:43:37');
INSERT INTO `module_attendances` VALUES (157, 25, 221, 26, '0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0', '2024-05-15 09:45:04', '2024-05-15 09:45:04');
INSERT INTO `module_attendances` VALUES (158, 25, 222, 26, '0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0', '2024-05-15 09:49:07', '2024-05-15 09:49:07');
INSERT INTO `module_attendances` VALUES (159, 25, 223, 26, '0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0', '2024-05-15 09:52:24', '2024-05-15 09:52:24');
INSERT INTO `module_attendances` VALUES (160, 25, 224, 26, '0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0', '2024-05-15 09:54:16', '2024-05-15 09:54:16');
INSERT INTO `module_attendances` VALUES (161, 25, 225, 26, '0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0', '2024-05-15 09:56:58', '2024-05-15 09:56:58');
INSERT INTO `module_attendances` VALUES (162, 25, 226, 26, '0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0', '2024-05-15 09:59:41', '2024-05-15 09:59:41');
INSERT INTO `module_attendances` VALUES (163, 25, 227, 26, '0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0', '2024-05-15 10:01:05', '2024-05-15 10:01:05');
INSERT INTO `module_attendances` VALUES (164, 25, 228, 26, '0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0', '2024-05-15 10:02:38', '2024-05-15 10:02:38');
INSERT INTO `module_attendances` VALUES (165, 25, 229, 26, '0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0', '2024-05-15 10:05:26', '2024-05-15 10:05:26');
INSERT INTO `module_attendances` VALUES (166, 25, 230, 26, '0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0', '2024-05-15 10:06:46', '2024-05-15 10:06:46');
INSERT INTO `module_attendances` VALUES (168, 25, 232, 26, '0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0', '2024-05-15 10:11:57', '2024-05-15 10:11:57');
INSERT INTO `module_attendances` VALUES (169, 25, 233, 27, '0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0', '2024-05-20 08:51:14', '2024-05-20 08:51:14');
INSERT INTO `module_attendances` VALUES (170, 25, 234, 27, '0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0', '2024-05-20 08:52:33', '2024-05-20 08:52:33');
INSERT INTO `module_attendances` VALUES (171, 25, 235, 27, '0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0', '2024-05-20 08:53:41', '2024-05-20 08:53:41');
INSERT INTO `module_attendances` VALUES (172, 25, 236, 27, '0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0', '2024-05-20 08:55:59', '2024-05-20 08:55:59');
INSERT INTO `module_attendances` VALUES (173, 25, 237, 27, '0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0', '2024-05-20 08:57:45', '2024-05-20 08:57:45');
INSERT INTO `module_attendances` VALUES (174, 25, 238, 27, '0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0', '2024-05-20 08:59:20', '2024-05-20 08:59:20');
INSERT INTO `module_attendances` VALUES (175, 25, 239, 27, '0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0', '2024-05-20 09:00:14', '2024-05-20 09:00:14');
INSERT INTO `module_attendances` VALUES (176, 25, 240, 27, '0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0', '2024-05-20 09:02:41', '2024-05-20 09:02:41');
INSERT INTO `module_attendances` VALUES (177, 25, 241, 27, '0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0', '2024-05-20 09:03:55', '2024-05-20 09:03:55');
INSERT INTO `module_attendances` VALUES (178, 25, 242, 27, '0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0', '2024-05-20 09:05:12', '2024-05-20 09:05:12');
INSERT INTO `module_attendances` VALUES (179, 25, 243, 27, '0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0', '2024-05-20 09:08:45', '2024-05-20 09:08:45');
INSERT INTO `module_attendances` VALUES (180, 25, 244, 27, '0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0', '2024-05-20 09:10:03', '2024-05-20 09:10:03');
INSERT INTO `module_attendances` VALUES (181, 25, 245, 27, '0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0', '2024-05-20 09:11:55', '2024-05-20 09:11:55');
INSERT INTO `module_attendances` VALUES (182, 25, 246, 27, '0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0', '2024-05-20 09:13:04', '2024-05-20 09:13:04');
INSERT INTO `module_attendances` VALUES (183, 25, 247, 27, '0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0', '2024-05-20 09:15:39', '2024-05-20 09:15:39');
INSERT INTO `module_attendances` VALUES (184, 25, 248, 27, '0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0', '2024-05-20 09:24:29', '2024-05-20 09:24:29');
INSERT INTO `module_attendances` VALUES (185, 25, 249, 27, '0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0', '2024-05-20 09:26:22', '2024-05-20 09:26:22');
INSERT INTO `module_attendances` VALUES (186, 25, 250, 27, '0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0', '2024-05-20 09:27:36', '2024-05-20 09:27:36');
INSERT INTO `module_attendances` VALUES (187, 25, 251, 28, '0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0', '2024-05-28 14:56:28', '2024-05-28 14:56:28');
INSERT INTO `module_attendances` VALUES (188, 25, 252, 28, '0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0', '2024-05-28 15:02:40', '2024-05-28 15:02:40');
INSERT INTO `module_attendances` VALUES (189, 25, 253, 28, '0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0', '2024-05-28 15:08:31', '2024-05-28 15:08:31');
INSERT INTO `module_attendances` VALUES (190, 25, 254, 28, '0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0', '2024-05-28 15:11:48', '2024-05-28 15:11:48');
INSERT INTO `module_attendances` VALUES (191, 25, 255, 28, '0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0', '2024-05-28 15:15:35', '2024-05-28 15:15:35');
INSERT INTO `module_attendances` VALUES (192, 25, 256, 28, '0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0', '2024-05-28 15:24:00', '2024-05-28 15:24:00');
INSERT INTO `module_attendances` VALUES (193, 25, 257, 28, '0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0', '2024-05-28 15:25:38', '2024-05-28 15:25:38');
INSERT INTO `module_attendances` VALUES (194, 25, 258, 28, '0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0', '2024-05-28 15:28:55', '2024-05-28 15:28:55');
INSERT INTO `module_attendances` VALUES (195, 25, 259, 28, '0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0', '2024-05-28 15:30:52', '2024-05-28 15:30:52');
INSERT INTO `module_attendances` VALUES (196, 25, 260, 28, '0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0', '2024-05-28 15:35:04', '2024-05-28 15:35:04');
INSERT INTO `module_attendances` VALUES (197, 25, 261, 28, '0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0', '2024-05-28 15:37:06', '2024-05-28 15:37:06');
INSERT INTO `module_attendances` VALUES (198, 25, 262, 28, '0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0', '2024-05-28 15:38:49', '2024-05-28 15:38:49');
INSERT INTO `module_attendances` VALUES (199, 25, 263, 28, '0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0', '2024-05-28 15:48:07', '2024-05-28 15:48:07');
INSERT INTO `module_attendances` VALUES (200, 25, 264, 28, '0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0', '2024-05-28 16:06:21', '2024-05-28 16:06:21');
INSERT INTO `module_attendances` VALUES (201, 25, 265, 28, '0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0', '2024-05-28 16:09:53', '2024-05-28 16:09:53');
INSERT INTO `module_attendances` VALUES (202, 25, 266, 28, '0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0', '2024-05-28 16:12:51', '2024-05-28 16:12:51');
INSERT INTO `module_attendances` VALUES (203, 25, 267, 28, '0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0', '2024-05-28 16:14:33', '2024-05-28 16:14:33');
INSERT INTO `module_attendances` VALUES (204, 25, 268, 28, '0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0', '2024-05-28 16:16:00', '2024-05-28 16:16:00');

-- ----------------------------
-- Table structure for module_certification_lists
-- ----------------------------
DROP TABLE IF EXISTS `module_certification_lists`;
CREATE TABLE `module_certification_lists`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `description` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `path` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `id_course` int NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `library_id`(`id_course` ASC) USING BTREE,
  CONSTRAINT `module_certification_lists_ibfk_1` FOREIGN KEY (`id_course`) REFERENCES `module_type_of_courses` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of module_certification_lists
-- ----------------------------

-- ----------------------------
-- Table structure for module_config_print_documents
-- ----------------------------
DROP TABLE IF EXISTS `module_config_print_documents`;
CREATE TABLE `module_config_print_documents`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `id_user` int NOT NULL,
  `type` int NOT NULL,
  `config` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `id_user`(`id_user` ASC) USING BTREE,
  CONSTRAINT `module_config_print_documents_ibfk_1` FOREIGN KEY (`id_user`) REFERENCES `account_users` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of module_config_print_documents
-- ----------------------------

-- ----------------------------
-- Table structure for module_employment_wishes
-- ----------------------------
DROP TABLE IF EXISTS `module_employment_wishes`;
CREATE TABLE `module_employment_wishes`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `id_site` int NOT NULL,
  `name` int NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 28 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of module_employment_wishes
-- ----------------------------
INSERT INTO `module_employment_wishes` VALUES (25, 25, 11);
INSERT INTO `module_employment_wishes` VALUES (26, 25, 1);
INSERT INTO `module_employment_wishes` VALUES (27, 25, 1);

-- ----------------------------
-- Table structure for module_graduation_score_informations
-- ----------------------------
DROP TABLE IF EXISTS `module_graduation_score_informations`;
CREATE TABLE `module_graduation_score_informations`  (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `id_site` int NOT NULL,
  `id_student` int NOT NULL,
  `id_course` int NOT NULL,
  `subject_1` smallint NULL DEFAULT NULL,
  `subject_2` smallint NULL DEFAULT NULL,
  `subject_3` smallint NULL DEFAULT NULL,
  `subject_4` smallint NULL DEFAULT NULL,
  `subject_5` smallint NULL DEFAULT NULL,
  `subject_6` smallint NULL DEFAULT NULL,
  `theory` smallint NULL DEFAULT NULL,
  `practice` smallint NULL DEFAULT NULL,
  `final_score` smallint NULL DEFAULT NULL,
  `average` smallint NULL DEFAULT NULL,
  `classification` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `note` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `id_student`(`id_student` ASC) USING BTREE,
  INDEX `id_course`(`id_course` ASC) USING BTREE,
  CONSTRAINT `module_graduation_score_informations_ibfk_2` FOREIGN KEY (`id_course`) REFERENCES `module_type_of_courses` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `module_graduation_score_informations_ibfk_3` FOREIGN KEY (`id_student`) REFERENCES `module_manage_students` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE = InnoDB AUTO_INCREMENT = 185 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of module_graduation_score_informations
-- ----------------------------
INSERT INTO `module_graduation_score_informations` VALUES (115, 25, 199, 25, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-05-07 09:20:04', '2024-05-07 09:20:04');
INSERT INTO `module_graduation_score_informations` VALUES (116, 25, 200, 25, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-05-07 13:17:18', '2024-05-07 13:17:18');
INSERT INTO `module_graduation_score_informations` VALUES (117, 25, 201, 25, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-05-07 13:24:49', '2024-05-07 13:24:49');
INSERT INTO `module_graduation_score_informations` VALUES (118, 25, 202, 25, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-05-07 13:26:46', '2024-05-07 13:26:46');
INSERT INTO `module_graduation_score_informations` VALUES (119, 25, 203, 25, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-05-07 13:28:41', '2024-05-07 13:28:41');
INSERT INTO `module_graduation_score_informations` VALUES (120, 25, 204, 25, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-05-07 13:30:18', '2024-05-07 13:30:18');
INSERT INTO `module_graduation_score_informations` VALUES (121, 25, 205, 25, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-05-07 13:32:16', '2024-05-07 13:32:16');
INSERT INTO `module_graduation_score_informations` VALUES (122, 25, 206, 25, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-05-07 13:34:18', '2024-05-07 13:34:18');
INSERT INTO `module_graduation_score_informations` VALUES (123, 25, 207, 25, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-05-07 13:41:36', '2024-05-07 13:41:36');
INSERT INTO `module_graduation_score_informations` VALUES (124, 25, 208, 25, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-05-07 13:43:04', '2024-05-07 13:43:04');
INSERT INTO `module_graduation_score_informations` VALUES (125, 25, 209, 25, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-05-07 13:44:52', '2024-05-07 13:44:52');
INSERT INTO `module_graduation_score_informations` VALUES (126, 25, 210, 25, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-05-07 13:46:39', '2024-05-07 13:46:39');
INSERT INTO `module_graduation_score_informations` VALUES (127, 25, 211, 25, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-05-07 13:48:24', '2024-05-07 13:48:24');
INSERT INTO `module_graduation_score_informations` VALUES (128, 25, 212, 25, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-05-07 13:50:12', '2024-05-07 13:50:12');
INSERT INTO `module_graduation_score_informations` VALUES (129, 25, 213, 25, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-05-07 13:52:09', '2024-05-07 13:52:09');
INSERT INTO `module_graduation_score_informations` VALUES (130, 25, 214, 25, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-05-07 14:08:33', '2024-05-07 14:08:33');
INSERT INTO `module_graduation_score_informations` VALUES (131, 25, 215, 25, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-05-07 14:10:08', '2024-05-07 14:10:08');
INSERT INTO `module_graduation_score_informations` VALUES (132, 25, 216, 25, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-05-07 14:14:08', '2024-05-07 14:14:08');
INSERT INTO `module_graduation_score_informations` VALUES (133, 25, 217, 26, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-05-15 09:37:17', '2024-05-15 09:37:17');
INSERT INTO `module_graduation_score_informations` VALUES (134, 25, 218, 26, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-05-15 09:39:39', '2024-05-15 09:39:39');
INSERT INTO `module_graduation_score_informations` VALUES (135, 25, 219, 26, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-05-15 09:41:18', '2024-05-15 09:41:18');
INSERT INTO `module_graduation_score_informations` VALUES (136, 25, 220, 26, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-05-15 09:43:37', '2024-05-15 09:43:37');
INSERT INTO `module_graduation_score_informations` VALUES (137, 25, 221, 26, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-05-15 09:45:04', '2024-05-15 09:45:04');
INSERT INTO `module_graduation_score_informations` VALUES (138, 25, 222, 26, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-05-15 09:49:07', '2024-05-15 09:49:07');
INSERT INTO `module_graduation_score_informations` VALUES (139, 25, 223, 26, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-05-15 09:52:24', '2024-05-15 09:52:24');
INSERT INTO `module_graduation_score_informations` VALUES (140, 25, 224, 26, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-05-15 09:54:16', '2024-05-15 09:54:16');
INSERT INTO `module_graduation_score_informations` VALUES (141, 25, 225, 26, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-05-15 09:56:58', '2024-05-15 09:56:58');
INSERT INTO `module_graduation_score_informations` VALUES (142, 25, 226, 26, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-05-15 09:59:41', '2024-05-15 09:59:41');
INSERT INTO `module_graduation_score_informations` VALUES (143, 25, 227, 26, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-05-15 10:01:05', '2024-05-15 10:01:05');
INSERT INTO `module_graduation_score_informations` VALUES (144, 25, 228, 26, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-05-15 10:02:38', '2024-05-15 10:02:38');
INSERT INTO `module_graduation_score_informations` VALUES (145, 25, 229, 26, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-05-15 10:05:26', '2024-05-15 10:05:26');
INSERT INTO `module_graduation_score_informations` VALUES (146, 25, 230, 26, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-05-15 10:06:46', '2024-05-15 10:06:46');
INSERT INTO `module_graduation_score_informations` VALUES (148, 25, 232, 26, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-05-15 10:11:57', '2024-05-15 10:11:57');
INSERT INTO `module_graduation_score_informations` VALUES (149, 25, 233, 27, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-05-20 08:51:14', '2024-05-20 08:51:14');
INSERT INTO `module_graduation_score_informations` VALUES (150, 25, 234, 27, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-05-20 08:52:33', '2024-05-20 08:52:33');
INSERT INTO `module_graduation_score_informations` VALUES (151, 25, 235, 27, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-05-20 08:53:41', '2024-05-20 08:53:41');
INSERT INTO `module_graduation_score_informations` VALUES (152, 25, 236, 27, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-05-20 08:55:59', '2024-05-20 08:55:59');
INSERT INTO `module_graduation_score_informations` VALUES (153, 25, 237, 27, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-05-20 08:57:45', '2024-05-20 08:57:45');
INSERT INTO `module_graduation_score_informations` VALUES (154, 25, 238, 27, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-05-20 08:59:20', '2024-05-20 08:59:20');
INSERT INTO `module_graduation_score_informations` VALUES (155, 25, 239, 27, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-05-20 09:00:14', '2024-05-20 09:00:14');
INSERT INTO `module_graduation_score_informations` VALUES (156, 25, 240, 27, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-05-20 09:02:41', '2024-05-20 09:02:41');
INSERT INTO `module_graduation_score_informations` VALUES (157, 25, 241, 27, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-05-20 09:03:55', '2024-05-20 09:03:55');
INSERT INTO `module_graduation_score_informations` VALUES (158, 25, 242, 27, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-05-20 09:05:11', '2024-05-20 09:05:11');
INSERT INTO `module_graduation_score_informations` VALUES (159, 25, 243, 27, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-05-20 09:08:45', '2024-05-20 09:08:45');
INSERT INTO `module_graduation_score_informations` VALUES (160, 25, 244, 27, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-05-20 09:10:03', '2024-05-20 09:10:03');
INSERT INTO `module_graduation_score_informations` VALUES (161, 25, 245, 27, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-05-20 09:11:55', '2024-05-20 09:11:55');
INSERT INTO `module_graduation_score_informations` VALUES (162, 25, 246, 27, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-05-20 09:13:04', '2024-05-20 09:13:04');
INSERT INTO `module_graduation_score_informations` VALUES (163, 25, 247, 27, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-05-20 09:15:39', '2024-05-20 09:15:39');
INSERT INTO `module_graduation_score_informations` VALUES (164, 25, 248, 27, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-05-20 09:24:29', '2024-05-20 09:24:29');
INSERT INTO `module_graduation_score_informations` VALUES (165, 25, 249, 27, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-05-20 09:26:22', '2024-05-20 09:26:22');
INSERT INTO `module_graduation_score_informations` VALUES (166, 25, 250, 27, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-05-20 09:27:36', '2024-05-20 09:27:36');
INSERT INTO `module_graduation_score_informations` VALUES (167, 25, 251, 28, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-05-28 14:56:28', '2024-05-28 14:56:28');
INSERT INTO `module_graduation_score_informations` VALUES (168, 25, 252, 28, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-05-28 15:02:40', '2024-05-28 15:02:40');
INSERT INTO `module_graduation_score_informations` VALUES (169, 25, 253, 28, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-05-28 15:08:31', '2024-05-28 15:08:31');
INSERT INTO `module_graduation_score_informations` VALUES (170, 25, 254, 28, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-05-28 15:11:48', '2024-05-28 15:11:48');
INSERT INTO `module_graduation_score_informations` VALUES (171, 25, 255, 28, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-05-28 15:15:35', '2024-05-28 15:15:35');
INSERT INTO `module_graduation_score_informations` VALUES (172, 25, 256, 28, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-05-28 15:24:00', '2024-05-28 15:24:00');
INSERT INTO `module_graduation_score_informations` VALUES (173, 25, 257, 28, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-05-28 15:25:38', '2024-05-28 15:25:38');
INSERT INTO `module_graduation_score_informations` VALUES (174, 25, 258, 28, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-05-28 15:28:55', '2024-05-28 15:28:55');
INSERT INTO `module_graduation_score_informations` VALUES (175, 25, 259, 28, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-05-28 15:30:52', '2024-05-28 15:30:52');
INSERT INTO `module_graduation_score_informations` VALUES (176, 25, 260, 28, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-05-28 15:35:04', '2024-05-28 15:35:04');
INSERT INTO `module_graduation_score_informations` VALUES (177, 25, 261, 28, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-05-28 15:37:06', '2024-05-28 15:37:06');
INSERT INTO `module_graduation_score_informations` VALUES (178, 25, 262, 28, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-05-28 15:38:49', '2024-05-28 15:38:49');
INSERT INTO `module_graduation_score_informations` VALUES (179, 25, 263, 28, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-05-28 15:48:07', '2024-05-28 15:48:07');
INSERT INTO `module_graduation_score_informations` VALUES (180, 25, 264, 28, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-05-28 16:06:21', '2024-05-28 16:06:21');
INSERT INTO `module_graduation_score_informations` VALUES (181, 25, 265, 28, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-05-28 16:09:53', '2024-05-28 16:09:53');
INSERT INTO `module_graduation_score_informations` VALUES (182, 25, 266, 28, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-05-28 16:12:51', '2024-05-28 16:12:51');
INSERT INTO `module_graduation_score_informations` VALUES (183, 25, 267, 28, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-05-28 16:14:33', '2024-05-28 16:14:33');
INSERT INTO `module_graduation_score_informations` VALUES (184, 25, 268, 28, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-05-28 16:16:00', '2024-05-28 16:16:00');

-- ----------------------------
-- Table structure for module_manage_students
-- ----------------------------
DROP TABLE IF EXISTS `module_manage_students`;
CREATE TABLE `module_manage_students`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `id_site` int NOT NULL,
  `name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `date_of_birth` date NULL DEFAULT NULL COMMENT 'Ngày sinh',
  `numberphone` varchar(11) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT 'Số điện thoại',
  `identification_id_card` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT 'CMND/CCCD',
  `date_of_issue` date NULL DEFAULT NULL COMMENT 'Ngày cấp',
  `department_of_issue` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT 'Cơ quan cấp',
  `permanent_residence` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT 'Hộ khẩu thường trú',
  `place_of_live` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT 'Nơi sống',
  `id_ethnic` int NULL DEFAULT NULL COMMENT 'Dân tộc',
  `region` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT 'Tôn giáo',
  `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `state_of_health` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT 'Tình trạng sức khỏe',
  `blood_group` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `height` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `weight` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `gender` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `family_composition` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `is_active` bit(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `id_course` int NOT NULL,
  `class` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `policy` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `id_employment_wishes` int NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `id_site`(`id_site` ASC) USING BTREE,
  INDEX `id_course`(`id_course` ASC) USING BTREE,
  INDEX `id_employment_wishes`(`id_employment_wishes` ASC) USING BTREE,
  CONSTRAINT `module_manage_students_ibfk_1` FOREIGN KEY (`id_site`) REFERENCES `sys_sites` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE,
  CONSTRAINT `module_manage_students_ibfk_3` FOREIGN KEY (`id_course`) REFERENCES `module_type_of_courses` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE,
  CONSTRAINT `module_manage_students_ibfk_4` FOREIGN KEY (`id_employment_wishes`) REFERENCES `module_employment_wishes` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE = InnoDB AUTO_INCREMENT = 269 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of module_manage_students
-- ----------------------------
INSERT INTO `module_manage_students` VALUES (199, 25, 'Tăng Thị Chial', '1972-01-01', NULL, '094172004277', '2021-06-28', 'Cục trưởng cục CS QLHC về TTXH', 'Ấp Phú Bình, xã Phú Tâm', 'Ấp Phú Bình, xã Phú Tâm', 19, '17', NULL, NULL, NULL, NULL, NULL, 'nu', NULL, b'0', '2024-05-07 09:20:04', '2024-05-07 09:20:04', 25, '7', '20', NULL);
INSERT INTO `module_manage_students` VALUES (200, 25, 'Lý Thị Khánh Dư', '1971-01-01', NULL, '094171007622', '2021-09-21', 'Cục trưởng cục CS QLHC về TTXH', 'Ấp Phú Bình, xã Phú Tâm', 'Ấp Phú Bình, xã Phú Tâm', 19, '17', NULL, NULL, NULL, NULL, NULL, 'nu', NULL, b'0', '2024-05-07 13:17:18', '2024-05-07 13:17:38', 25, '3', '24', NULL);
INSERT INTO `module_manage_students` VALUES (201, 25, 'Lâm Thị Miên', '1997-08-30', NULL, '094197000594', '2021-04-13', 'Cục trưởng cục CS QLHC về TTXH', 'Ấp Phú Bình, xã Phú Tâm', 'Ấp Phú Bình, xã Phú Tâm', 19, '17', NULL, NULL, NULL, NULL, NULL, 'nu', NULL, b'0', '2024-05-07 13:24:48', '2024-05-07 13:24:48', 25, '7', '24', NULL);
INSERT INTO `module_manage_students` VALUES (202, 25, 'Trần Thị Hồng Thúy', '1988-01-01', NULL, '094188014958', '2021-09-21', 'Cục trưởng cục CS QLHC về TTXH', 'Ấp Phú Bình, xã Phú Tâm', NULL, 19, '17', NULL, NULL, NULL, NULL, NULL, 'nu', NULL, b'0', '2024-05-07 13:26:46', '2024-05-07 13:26:46', 25, '5', '20', NULL);
INSERT INTO `module_manage_students` VALUES (203, 25, 'Huỳnh Thị Mộng', '1976-01-01', NULL, '094176013151', '2022-03-23', 'Cục trưởng cục CS QLHC về TTXH', 'Ấp Phú Bình, xã Phú Tâm', 'Ấp Phú Bình, xã Phú Tâm', 19, '17', NULL, NULL, NULL, NULL, NULL, 'nu', NULL, b'0', '2024-05-07 13:28:41', '2024-05-07 13:30:27', 25, '1', '41', NULL);
INSERT INTO `module_manage_students` VALUES (204, 25, 'Ngô Thị Thúy Oanh', '1973-01-01', NULL, '094173002876', '2021-08-13', 'Cục trưởng cục CS QLHC về TTXH', 'Ấp Phú Bình, xã Phú Tâm', 'Ấp Phú Bình, xã Phú Tâm', 15, '17', NULL, NULL, NULL, NULL, NULL, 'nu', NULL, b'0', '2024-05-07 13:30:18', '2024-05-07 13:30:35', 25, '1', '24', NULL);
INSERT INTO `module_manage_students` VALUES (205, 25, 'Thạch Thị Mỹ Nhung', '1985-01-01', NULL, '094185006029', '2022-09-21', 'Cục trưởng cục CS QLHC về TTXH', 'Ấp Phú Bình, xã Phú Tâm', 'Ấp Phú Bình, xã Phú Tâm', 19, '17', NULL, NULL, NULL, NULL, NULL, 'nu', NULL, b'0', '2024-05-07 13:32:16', '2024-05-07 13:39:44', 25, '1', '20', NULL);
INSERT INTO `module_manage_students` VALUES (206, 25, 'Lý Thị Thu Thảo', '1994-11-04', NULL, '094194001378', '2021-06-28', 'Cục trưởng cục CS QLHC về TTXH', 'Ấp Phú Hữu, xã Phú Tâm', 'Ấp Phú Hữu, xã Phú Tâm', 19, '17', NULL, NULL, NULL, NULL, NULL, 'nu', NULL, b'0', '2024-05-07 13:34:18', '2024-05-07 13:34:18', 25, '10', '20', NULL);
INSERT INTO `module_manage_students` VALUES (207, 25, 'Nguyễn Thị Thu Trang', '1985-06-02', NULL, '094185009533', '2021-07-09', 'Cục trưởng cục CS QLHC về TTXH', 'Ấp Phú Thành A, xã Phú Tâm', 'Ấp Phú Thành A, xã Phú Tâm', 15, '17', NULL, NULL, NULL, NULL, NULL, 'nu', NULL, b'0', '2024-05-07 13:41:36', '2024-05-07 13:41:36', 25, '3', '20', NULL);
INSERT INTO `module_manage_students` VALUES (208, 25, 'Kim Tuấn', '1970-08-12', NULL, '094070023209', '2023-06-13', 'Cục trưởng cục CS QLHC về TTXH', 'Ấp Phú Bình, xã Phú Tâm', 'Ấp Phú Bình, xã Phú Tâm', 19, '17', NULL, NULL, NULL, NULL, NULL, 'nam', NULL, b'0', '2024-05-07 13:43:04', '2024-05-07 13:43:04', 25, '1', '20', NULL);
INSERT INTO `module_manage_students` VALUES (209, 25, 'Nguyễn Văn Giang', '2006-10-12', NULL, '094206010890', '2022-10-19', 'Cục trưởng cục CS QLHC về TTXH', 'Ấp Phú Bình, xã Phú Tâm', 'Ấp Phú Bình, xã Phú Tâm', 19, '17', NULL, NULL, NULL, NULL, NULL, 'nam', NULL, b'0', '2024-05-07 13:44:52', '2024-05-07 13:44:52', 25, '6', '41', NULL);
INSERT INTO `module_manage_students` VALUES (210, 25, 'Thạch Phương', '1980-01-01', NULL, '094080015000', '2022-03-21', 'Cục trưởng cục CS QLHC về TTXH', 'Ấp Phú Bình, xã Phú Tâm', 'Ấp Phú Bình, xã Phú Tâm', 19, '17', NULL, NULL, NULL, NULL, NULL, 'nam', NULL, b'0', '2024-05-07 13:46:39', '2024-05-07 13:46:39', 25, '1', '41', NULL);
INSERT INTO `module_manage_students` VALUES (211, 25, 'Ngô Văn Hiếu', '1987-01-01', NULL, '094087012173', '2022-07-18', 'Cục trưởng cục CS QLHC về TTXH', 'Ấp Phú Bình, xã Phú Tâm', 'Ấp Phú Bình, xã Phú Tâm', 19, '17', NULL, NULL, NULL, NULL, NULL, 'nam', NULL, b'0', '2024-05-07 13:48:24', '2024-05-07 13:52:33', 25, '3', '20', NULL);
INSERT INTO `module_manage_students` VALUES (212, 25, 'Thạch Minh Dũng', '1978-02-10', NULL, '094078001020', '2021-04-13', 'Cục trưởng cục CS QLHC về TTXH', 'Ấp Phú Bình, xã Phú Tâm', 'Ấp Phú Bình, xã Phú Tâm', 19, '17', NULL, NULL, NULL, NULL, NULL, 'nam', NULL, b'0', '2024-05-07 13:50:12', '2024-05-07 13:50:12', 25, '1', '41', NULL);
INSERT INTO `module_manage_students` VALUES (213, 25, 'Huỳnh Văn Hùng', '1985-02-06', NULL, '094085001226', '2021-04-13', 'Cục trưởng cục CS QLHC về TTXH', 'Ấp Phú Bình, xã Phú Tâm', 'Ấp Phú Bình, xã Phú Tâm', 19, '17', NULL, NULL, NULL, NULL, NULL, 'nam', NULL, b'0', '2024-05-07 13:52:09', '2024-05-07 13:52:09', 25, '4', '24', NULL);
INSERT INTO `module_manage_students` VALUES (214, 25, 'Lâm Minh Tú', '1993-06-06', NULL, '094093013047', '2021-08-10', 'Cục trưởng cục CS QLHC về TTXH', 'Ấp Phú Bình, xã Phú Tâm', 'Ấp Phú Bình, xã Phú Tâm', 19, '17', NULL, NULL, NULL, NULL, NULL, 'nam', NULL, b'0', '2024-05-07 14:08:33', '2024-05-07 14:08:33', 25, '6', '24', NULL);
INSERT INTO `module_manage_students` VALUES (215, 25, 'Lâm Thiện', '1989-01-01', NULL, '094089010674', '2022-10-05', 'Cục trưởng cục CS QLHC về TTXH', 'Ấp Phú Bình, xã Phú Tâm', 'Ấp Phú Bình, xã Phú Tâm', 19, '17', NULL, NULL, NULL, NULL, NULL, 'nam', NULL, b'1', '2024-05-07 14:10:08', '2024-05-07 14:10:08', 25, '1', '20', NULL);
INSERT INTO `module_manage_students` VALUES (216, 25, 'Thạch Sọnh', '1967-01-01', NULL, '094067000714', '2021-04-13', 'Cục trưởng cục CS QLHC về TTXH', 'Ấp Phú Hữu, xã Phú Tâm', 'Ấp Phú Hữu, xã Phú Tâm', 19, '17', NULL, NULL, NULL, NULL, NULL, 'nam', NULL, b'1', '2024-05-07 14:14:08', '2024-05-07 14:14:08', 25, '1', '24', NULL);
INSERT INTO `module_manage_students` VALUES (217, 25, 'Lý Thị Bé Ngọc', '2008-04-06', NULL, '094308005899', '2023-05-18', 'Cục QLHC về TTXH', 'ấp Phú Ninh, xã An Ninh, huyện Châu Thành, tỉnh Sóc Trăng', 'ấp Phú Ninh, xã An Ninh, huyện Châu Thành, tỉnh Sóc Trăng', 19, '17', NULL, NULL, NULL, NULL, NULL, 'nu', NULL, b'1', '2024-05-15 09:37:17', '2024-05-15 09:37:17', 26, '6', '21', NULL);
INSERT INTO `module_manage_students` VALUES (218, 25, 'Đinh Thị Sà Lượl', '1989-06-12', NULL, '094189006533', '2021-08-17', 'Cục QLHC về TTXH', 'ấp Phú Ninh, xã An Ninh, huyện Châu Thành, tỉnh Sóc Trăng', 'ấp Phú Ninh, xã An Ninh, huyện Châu Thành, tỉnh Sóc Trăng', 19, '17', NULL, NULL, NULL, NULL, NULL, 'nu', NULL, b'1', '2024-05-15 09:39:39', '2024-05-15 09:39:39', 26, '5', '21', NULL);
INSERT INTO `module_manage_students` VALUES (219, 25, 'Thạch Thị Ngọc Ái', '2007-03-27', NULL, '094307011835', '2022-08-31', 'Cục QLHC về TTXH', 'ấp Phú Ninh, xã An Ninh, huyện Châu Thành, tỉnh Sóc Trăng', 'ấp Phú Ninh, xã An Ninh, huyện Châu Thành, tỉnh Sóc Trăng', 19, '17', NULL, NULL, NULL, NULL, NULL, 'nu', NULL, b'1', '2024-05-15 09:41:18', '2024-05-15 09:41:18', 26, '10', '21', NULL);
INSERT INTO `module_manage_students` VALUES (220, 25, 'Lâm Thị Phương Thì', '2006-10-14', NULL, '094306000388', '2022-08-25', 'Cục QLHC về TTXH', 'ấp Trà Lây 2, xã Thuận Hưng, huyện Mỹ Tú, tỉnh Sóc Trăng', 'ấp Trà Lây 2, xã Thuận Hưng, huyện Mỹ Tú, tỉnh Sóc Trăng', 19, '17', NULL, NULL, NULL, NULL, NULL, 'nu', NULL, b'1', '2024-05-15 09:43:37', '2024-05-15 09:43:37', 26, '7', '21', NULL);
INSERT INTO `module_manage_students` VALUES (221, 25, 'Lý Thị Pu', '1988-02-07', NULL, '094183002705', '2022-06-06', 'Cục QLHC về TTXH', 'ấp Phú Ninh, xã An Ninh, huyện Châu Thành, tỉnh Sóc Trăng', 'ấp Phú Ninh, xã An Ninh, huyện Châu Thành, tỉnh Sóc Trăng', 19, '17', NULL, NULL, NULL, NULL, NULL, 'nu', NULL, b'1', '2024-05-15 09:45:04', '2024-05-15 09:45:04', 26, '5', '21', NULL);
INSERT INTO `module_manage_students` VALUES (222, 25, 'Trần Thị Huỳnh Như', '2008-08-04', NULL, '094308009572', '2022-09-21', 'Cục QLHC về TTXH', 'ấp Phú Ninh, xã An Ninh, huyện Châu Thành, tỉnh Sóc Trăng', 'ấp Phú Ninh, xã An Ninh, huyện Châu Thành, tỉnh Sóc Trăng', 19, '17', NULL, NULL, NULL, NULL, NULL, 'nu', NULL, b'1', '2024-05-15 09:49:07', '2024-05-15 09:49:07', 26, '7', '21', NULL);
INSERT INTO `module_manage_students` VALUES (223, 25, 'Hàng Thị Mỹ Liễu', '2000-08-28', NULL, '094300012683', '2021-08-04', 'Cục QLHC về TTXH', 'ấp Sóc Vồ, Phường 7, TP Sóc Trăng, tỉnh Sóc Trăng', 'ấp Sóc Vồ, Phường 7, TP Sóc Trăng, tỉnh Sóc Trăng', 19, '17', NULL, NULL, NULL, NULL, NULL, 'nu', NULL, b'1', '2024-05-15 09:52:24', '2024-05-15 09:52:24', 26, '8', '21', NULL);
INSERT INTO `module_manage_students` VALUES (224, 25, 'Lưu Thị Kim Thoa', '2007-09-21', NULL, '094307009780', '2023-03-01', 'Cục QLHC về TTXH', 'ấp Phú Ninh, xã An Ninh, huyện Châu Thành, tỉnh Sóc Trăng', 'ấp Phú Ninh, xã An Ninh, huyện Châu Thành, tỉnh Sóc Trăng', 19, '17', NULL, NULL, NULL, NULL, NULL, 'nu', NULL, b'1', '2024-05-15 09:54:16', '2024-05-15 09:54:16', 26, '7', '21', NULL);
INSERT INTO `module_manage_students` VALUES (225, 25, 'Lý Thị Thảo', '1988-01-01', NULL, '094188007937', '2022-08-17', 'Cục QLHC về TTXH', NULL, NULL, 19, '17', NULL, NULL, NULL, NULL, NULL, 'nu', NULL, b'1', '2024-05-15 09:56:58', '2024-05-15 09:56:58', 26, '7', '21', NULL);
INSERT INTO `module_manage_students` VALUES (226, 25, 'Sơn Thị Diễm', '2008-03-13', NULL, '094308010304', '2022-09-23', 'Cục QLHC về TTXH', 'ấp Bưng Tróp B, xã An Hiệp, huyện Châu Thành, tỉnh Sóc Trăng', 'ấp Bưng Tróp B, xã An Hiệp, huyện Châu Thành, tỉnh Sóc Trăng', 19, '17', NULL, NULL, NULL, NULL, NULL, 'nu', NULL, b'1', '2024-05-15 09:59:41', '2024-05-15 09:59:41', 26, '6', '21', NULL);
INSERT INTO `module_manage_students` VALUES (227, 25, 'Danh Thị Thanh Tài', '2001-05-09', NULL, '094301002441', '2021-05-10', 'Cục QLHC về TTXH', 'ấp Phú Ninh, xã An Ninh, huyện Châu Thành, tỉnh Sóc Trăng', 'ấp Phú Ninh, xã An Ninh, huyện Châu Thành, tỉnh Sóc Trăng', 19, '17', NULL, NULL, NULL, NULL, NULL, 'nu', NULL, b'1', '2024-05-15 10:01:05', '2024-05-15 10:01:05', 26, '6', '21', NULL);
INSERT INTO `module_manage_students` VALUES (228, 25, 'Liêng Diễm Trinh', '2008-12-17', NULL, '094308002973', '2023-05-31', 'Cục QLHC về TTXH', 'ấp Phú Ninh A, xã An Ninh, huyện Châu Thành, tỉnh Sóc Trăng', 'ấp Phú Ninh A, xã An Ninh, huyện Châu Thành, tỉnh Sóc Trăng', 19, '17', NULL, NULL, NULL, NULL, NULL, 'nu', NULL, b'1', '2024-05-15 10:02:38', '2024-05-15 10:02:38', 26, '5', '21', NULL);
INSERT INTO `module_manage_students` VALUES (229, 25, 'Triệu Thị Kim Cúc', '1990-03-09', NULL, '094190014992', '2021-08-09', 'Cục QLHC về TTXH', 'ấp Phú Ninh A, xã An Ninh, huyện Châu Thành, tỉnh Sóc Trăng', 'ấp Phú Ninh A, xã An Ninh, huyện Châu Thành, tỉnh Sóc Trăng', 19, '17', NULL, NULL, NULL, NULL, NULL, 'nu', NULL, b'1', '2024-05-15 10:05:25', '2024-05-15 10:05:25', 26, '9', '21', NULL);
INSERT INTO `module_manage_students` VALUES (230, 25, 'Triệu Kiều Phương', '2007-06-11', NULL, '094307001462', '2023-08-13', 'Cục QLHC về TTXH', 'ấp Phú Ninh A, xã An Ninh, huyện Châu Thành, tỉnh Sóc Trăng', 'ấp Phú Ninh A, xã An Ninh, huyện Châu Thành, tỉnh Sóc Trăng', 19, '17', NULL, NULL, NULL, NULL, NULL, 'nu', NULL, b'1', '2024-05-15 10:06:46', '2024-05-15 10:06:46', 26, '9', '21', NULL);
INSERT INTO `module_manage_students` VALUES (232, 25, 'Đào Thị Simonne', '1974-01-01', NULL, '094174009840', '2022-09-29', 'Cục QLHC về TTXH', 'ấp Phú Ninh, xã An Ninh, huyện Châu Thành, tỉnh Sóc Trăng', 'ấp Phú Ninh, xã An Ninh, huyện Châu Thành, tỉnh Sóc Trăng', 19, '17', NULL, NULL, NULL, NULL, NULL, 'nu', NULL, b'1', '2024-05-15 10:11:57', '2024-05-20 08:42:47', 26, '6', '21', NULL);
INSERT INTO `module_manage_students` VALUES (233, 25, 'Trịnh Thanh Tường', '2008-10-03', NULL, '094208004070', '2023-02-28', 'Cục QLHC về TTXH', 'ấp Phú Ninh, xã An Ninh, huyện Châu Thành, tỉnh Sóc Trăng', 'ấp Phú Ninh, xã An Ninh, huyện Châu Thành, tỉnh Sóc Trăng', 19, '17', NULL, NULL, NULL, NULL, NULL, 'nam', NULL, b'1', '2024-05-20 08:51:14', '2024-05-20 08:51:14', 27, '9', '21', NULL);
INSERT INTO `module_manage_students` VALUES (234, 25, 'Liêu Huỳnh Nghi', '1980-01-01', NULL, '094080019321', '2021-08-10', 'Cục QLHC về TTXH', 'ấp Phú Ninh, xã An Ninh, huyện Châu Thành, tỉnh Sóc Trăng', 'ấp Phú Ninh, xã An Ninh, huyện Châu Thành, tỉnh Sóc Trăng', 19, '17', NULL, NULL, NULL, NULL, NULL, 'nam', NULL, b'1', '2024-05-20 08:52:33', '2024-05-20 08:52:33', 27, '6', '21', NULL);
INSERT INTO `module_manage_students` VALUES (235, 25, 'Liêu Lâm Hoài', '2009-02-20', NULL, '094209013481', '2021-11-20', 'Cục QLHC về TTXH', 'ấp Phú Ninh, xã An Ninh, huyện Châu Thành, tỉnh Sóc Trăng', 'ấp Phú Ninh, xã An Ninh, huyện Châu Thành, tỉnh Sóc Trăng', 19, '17', NULL, NULL, NULL, NULL, NULL, 'nam', NULL, b'1', '2024-05-20 08:53:41', '2024-05-20 08:53:41', 27, '8', '21', NULL);
INSERT INTO `module_manage_students` VALUES (236, 25, 'Dương Văn Đường', '1992-01-01', NULL, '094092008218', '2022-04-14', 'Cục QLHC về TTXH', '383/114 Đường 30/04, P9, TP. Sóc Trăng, tỉnh Sóc Trăng', '383/114 Đường 30/04, P9, TP. Sóc Trăng, tỉnh Sóc Trăng', 19, '17', NULL, NULL, NULL, NULL, NULL, 'nam', NULL, b'1', '2024-05-20 08:55:58', '2024-05-20 08:55:58', 27, '6', '21', NULL);
INSERT INTO `module_manage_students` VALUES (237, 25, 'Lâm Lai', '1992-12-03', NULL, '094092005758', '2021-08-06', 'Cục QLHC về TTXH', '658/12A Tôn Đức Thắng, P5, TP Sóc Trăng, tỉnh Sóc Trăng', '658/12A Tôn Đức Thắng, P5, TP Sóc Trăng, tỉnh Sóc Trăng', 19, '17', NULL, NULL, NULL, NULL, NULL, 'nam', NULL, b'1', '2024-05-20 08:57:45', '2024-05-20 09:18:37', 27, '8', '21', NULL);
INSERT INTO `module_manage_students` VALUES (238, 25, 'Danh Út Tài', '1995-01-12', NULL, '094095011531', '2022-09-06', 'Cục QLHC về TTXH', 'ấp Phú Ninh, xã An Ninh, huyện Châu Thành, tỉnh Sóc Trăng', 'ấp Phú Ninh, xã An Ninh, huyện Châu Thành, tỉnh Sóc Trăng', 19, '17', NULL, NULL, NULL, NULL, NULL, 'nam', NULL, b'1', '2024-05-20 08:59:20', '2024-05-20 08:59:20', 27, '9', '21', NULL);
INSERT INTO `module_manage_students` VALUES (239, 25, 'Lý Phi Rinh', '1998-10-11', NULL, '094098009497', '2023-12-11', 'Cục QLHC về TTXH', 'ấp Chông Nô, xã An Ninh, huyện Châu Thành, tỉnh Sóc Trăng', 'ấp Chông Nô, xã An Ninh, huyện Châu Thành, tỉnh Sóc Trăng', 19, '17', NULL, NULL, NULL, NULL, NULL, 'nam', NULL, b'1', '2024-05-20 09:00:14', '2024-05-20 09:01:13', 27, '6', '21', NULL);
INSERT INTO `module_manage_students` VALUES (240, 25, 'Lâm Sà Rinh', '1969-01-01', NULL, '094069012809', '2022-09-16', 'Cục QLHC về TTXH', 'ấp Phú Ninh, xã An Ninh, huyện Châu Thành, tỉnh Sóc Trăng', 'ấp Phú Ninh, xã An Ninh, huyện Châu Thành, tỉnh Sóc Trăng', 19, '17', NULL, NULL, NULL, NULL, NULL, 'nam', NULL, b'1', '2024-05-20 09:02:41', '2024-05-20 09:02:41', 27, '6', '21', NULL);
INSERT INTO `module_manage_students` VALUES (241, 25, 'Lâm Hùng', '1991-10-20', NULL, '094091005034', '2021-08-10', 'Cục QLHC về TTXH', 'ấp Phú Ninh, xã An Ninh, huyện Châu Thành, tỉnh Sóc Trăng', 'ấp Phú Ninh, xã An Ninh, huyện Châu Thành, tỉnh Sóc Trăng', 19, '17', NULL, NULL, NULL, NULL, NULL, 'nam', NULL, b'1', '2024-05-20 09:03:55', '2024-05-20 09:03:55', 27, '6', '21', NULL);
INSERT INTO `module_manage_students` VALUES (242, 25, 'Trịnh Thanh Tâm', '2007-03-11', NULL, '094207004400', '2021-06-10', 'Cục QLHC về TTXH', 'ấp Phú Ninh, xã An Ninh, huyện Châu Thành, tỉnh Sóc Trăng', 'ấp Phú Ninh, xã An Ninh, huyện Châu Thành, tỉnh Sóc Trăng', 19, '17', NULL, NULL, NULL, NULL, NULL, 'nam', NULL, b'1', '2024-05-20 09:05:11', '2024-05-20 09:05:11', 27, '8', '21', NULL);
INSERT INTO `module_manage_students` VALUES (243, 25, 'Trần Giang', '1984-01-01', NULL, '094084008242', '2021-08-19', 'Cục QLHC về TTXH', '239A Sóc Vồ, P7, TP Sóc Trăng, tỉnh Sóc Trăng', '239A Sóc Vồ, P7, TP Sóc Trăng, tỉnh Sóc Trăng', 19, '17', NULL, NULL, NULL, NULL, NULL, 'nam', NULL, b'1', '2024-05-20 09:08:45', '2024-05-20 09:08:45', 27, '6', '21', NULL);
INSERT INTO `module_manage_students` VALUES (244, 25, 'Kim Minh Đạo', '1976-01-01', NULL, '094076008053', '2022-10-05', 'Cục QLHC về TTXH', 'ấp Phú Ninh, xã An Ninh, huyện Châu Thành, tỉnh Sóc Trăng', 'ấp Phú Ninh, xã An Ninh, huyện Châu Thành, tỉnh Sóc Trăng', 19, '17', NULL, NULL, NULL, NULL, NULL, 'nam', NULL, b'1', '2024-05-20 09:10:03', '2024-05-20 09:10:03', 27, '6', '21', NULL);
INSERT INTO `module_manage_students` VALUES (245, 25, 'Thạch Chươl', '1992-12-13', NULL, '094092013272', '2023-11-24', 'Cục QLHC về TTXH', 'ấp Tam Sóc C1, Xã Mỹ Thuận, huyện Mỹ Tú, tỉnh Sóc Trăng', 'ấp Tam Sóc C1, Xã Mỹ Thuận, huyện Mỹ Tú, tỉnh Sóc Trăng', 19, '17', NULL, NULL, NULL, NULL, NULL, 'nam', NULL, b'1', '2024-05-20 09:11:55', '2024-05-20 09:11:55', 27, '6', '21', NULL);
INSERT INTO `module_manage_students` VALUES (246, 25, 'La Hoàng Anh', '1982-11-10', NULL, '094082013733', '2021-11-18', 'Cục QLHC về TTXH', 'ấp Phú Ninh, xã An Ninh, huyện Châu Thành, tỉnh Sóc Trăng', 'ấp Phú Ninh, xã An Ninh, huyện Châu Thành, tỉnh Sóc Trăng', 19, '17', NULL, NULL, NULL, NULL, NULL, 'nam', NULL, b'1', '2024-05-20 09:13:04', '2024-05-20 09:13:04', 27, '6', '21', NULL);
INSERT INTO `module_manage_students` VALUES (247, 25, 'Trần Thuỷ', '1993-09-10', NULL, '094093009959', '2022-10-05', 'Cục QLHC về TTXH', 'ấp Phú Ninh, xã An Ninh, huyện Châu Thành, tỉnh Sóc Trăng', 'ấp Phú Ninh, xã An Ninh, huyện Châu Thành, tỉnh Sóc Trăng', 19, '17', NULL, NULL, NULL, NULL, NULL, 'nam', NULL, b'1', '2024-05-20 09:15:39', '2024-05-20 09:15:39', 27, '6', '21', NULL);
INSERT INTO `module_manage_students` VALUES (248, 25, 'Lâm Hùng 2', '1990-11-28', NULL, '094090019383', '2021-06-10', 'Cục QLHC về TTXH', 'ấp Phú Ninh, xã An Ninh, huyện Châu Thành, tỉnh Sóc Trăng', 'ấp Phú Ninh, xã An Ninh, huyện Châu Thành, tỉnh Sóc Trăng', 19, '17', NULL, NULL, NULL, NULL, NULL, 'nam', NULL, b'1', '2024-05-20 09:24:29', '2024-05-20 09:24:29', 27, '6', '21', NULL);
INSERT INTO `module_manage_students` VALUES (249, 25, 'Dương Khe', '1965-01-25', NULL, '094065010078', '2021-05-10', 'Cục QLHC về TTXH', 'ấp Phú Ninh, xã An Ninh, huyện Châu Thành, tỉnh Sóc Trăng', 'ấp Phú Ninh, xã An Ninh, huyện Châu Thành, tỉnh Sóc Trăng', 19, '17', NULL, NULL, NULL, NULL, NULL, 'nam', NULL, b'1', '2024-05-20 09:26:22', '2024-05-20 09:26:22', 27, '12', '21', NULL);
INSERT INTO `module_manage_students` VALUES (250, 25, 'Lý Đơ', '1983-05-29', NULL, '094083004124', '1983-05-29', 'Cục QLHC về TTXH', 'ấp Phú Ninh, xã An Ninh, huyện Châu Thành, tỉnh Sóc Trăng', 'ấp Phú Ninh, xã An Ninh, huyện Châu Thành, tỉnh Sóc Trăng', 19, '17', NULL, NULL, NULL, NULL, NULL, 'nam', NULL, b'1', '2024-05-20 09:27:36', '2024-05-20 09:27:36', 27, '9', '21', NULL);
INSERT INTO `module_manage_students` VALUES (251, 25, 'Thạch Thùy Liên Như', '1999-01-07', '0377943623', '094199004431', '2022-01-09', 'Cục trưởng cục CS QLHC về TTXH', 'Ấp Thọ Hòa Đông A, xã Phú Tâm', 'Ấp Thọ Hòa Đông A, xã Phú Tâm', 19, '17', NULL, NULL, NULL, NULL, NULL, 'nu', NULL, b'1', '2024-05-28 14:56:28', '2024-05-28 15:08:52', 28, '6', '21', NULL);
INSERT INTO `module_manage_students` VALUES (252, 25, 'Thạch Thị Thảo', '1989-01-01', '0353974014', '094189011072', '2022-08-05', 'Cục trưởng cục CS QLHC về TTXH', 'Ấp Thọ Hòa Đông A, xã Phú Tâm', 'Ấp Thọ Hòa Đông A, xã Phú Tâm', 19, '17', NULL, NULL, NULL, NULL, NULL, 'nu', NULL, b'1', '2024-05-28 15:02:40', '2024-05-28 15:09:25', 28, '5', '21', NULL);
INSERT INTO `module_manage_students` VALUES (253, 25, 'Lý Thị Nhân', '1999-08-20', NULL, '094199010192', '2021-10-02', 'Cục trưởng cục CS QLHC về TTXH', 'Ấp Thọ Hòa Đông A, xã Phú Tâm', 'Ấp Thọ Hòa Đông A, xã Phú Tâm', 19, '17', NULL, NULL, NULL, NULL, NULL, 'nu', NULL, b'1', '2024-05-28 15:08:30', '2024-05-28 15:08:30', 28, '9', '21', NULL);
INSERT INTO `module_manage_students` VALUES (254, 25, 'Đào Thị Dung', '1985-01-01', '0967421103', '094185005727', '2022-08-02', 'Cục trưởng cục CS QLHC về TTXH', 'Ấp Thọ Hòa Đông A, xã Phú Tâm', 'Ấp Thọ Hòa Đông A, xã Phú Tâm', 19, '17', NULL, NULL, NULL, NULL, NULL, 'nu', NULL, b'1', '2024-05-28 15:11:47', '2024-05-28 15:11:47', 28, '9', '21', NULL);
INSERT INTO `module_manage_students` VALUES (255, 25, 'Phạm Thị Ngọc Huyền', '2008-01-06', NULL, '094308010561', '2023-06-07', 'Cục trưởng cục CS QLHC về TTXH', 'Ấp Sóc Tháo, xã Phú Tâm', 'Ấp Sóc Tháo, xã Phú Tâm', 19, '17', NULL, NULL, NULL, NULL, NULL, 'nu', NULL, b'1', '2024-05-28 15:15:35', '2024-05-28 15:15:35', 28, '9', '21', NULL);
INSERT INTO `module_manage_students` VALUES (256, 25, 'Trương Thị Ngọc Mai', '2007-10-19', '0783778651', '094307014440', '2022-04-15', 'Cục trưởng cục CS QLHC về TTXH', 'Ấp Phú Bình, xã Phú Tâm', 'Ấp Phú Bình, xã Phú Tâm', 19, '17', NULL, NULL, NULL, NULL, NULL, 'nu', NULL, b'1', '2024-05-28 15:24:00', '2024-05-28 15:24:00', 28, '11', '21', NULL);
INSERT INTO `module_manage_students` VALUES (257, 25, 'Ngô Thanh Tuyền', '2008-12-07', '0329537596', '094308009730', '2023-04-06', 'Cục trưởng cục CS QLHC về TTXH', 'Ấp Phú Bình, xã Phú Tâm', 'Ấp Phú Bình, xã Phú Tâm', 19, '17', NULL, NULL, NULL, NULL, NULL, 'nu', NULL, b'1', '2024-05-28 15:25:38', '2024-05-28 15:25:38', 28, '9', '21', NULL);
INSERT INTO `module_manage_students` VALUES (258, 25, 'Lâm Thúy Vy', '2007-10-10', '0345454002', '094307007277', '2022-04-27', 'Cục trưởng cục CS QLHC về TTXH', 'Ấp Phú Bình, xã Phú Tâm', 'Ấp Phú Bình, xã Phú Tâm', 19, '17', NULL, NULL, NULL, NULL, NULL, 'nu', NULL, b'1', '2024-05-28 15:28:55', '2024-05-28 15:28:55', 28, '11', '21', NULL);
INSERT INTO `module_manage_students` VALUES (259, 25, 'Lâm Thị Diệu', '2008-06-25', '0789559867', '094308009881', '2022-10-16', 'Cục trưởng cục CS QLHC về TTXH', 'Ấp Phú Bình, xã Phú Tâm', 'Ấp Phú Bình, xã Phú Tâm', 19, '17', NULL, NULL, NULL, NULL, NULL, 'nu', NULL, b'1', '2024-05-28 15:30:52', '2024-05-28 15:30:52', 28, '5', '21', NULL);
INSERT INTO `module_manage_students` VALUES (260, 25, 'Sơn Thị Ngọc Kiều', '1990-10-30', '0326364244', '094190003273', '2022-09-26', 'Cục trưởng cục CS QLHC về TTXH', 'Ấp Phú Bình, xã Phú Tâm', 'Ấp Phú Bình, xã Phú Tâm', 19, '17', NULL, NULL, NULL, NULL, NULL, 'nu', NULL, b'1', '2024-05-28 15:35:03', '2024-05-28 15:35:03', 28, '7', '21', NULL);
INSERT INTO `module_manage_students` VALUES (261, 25, 'Huỳnh Bích Vân', '1983-01-01', '0377932504', '094183003779', '2021-07-09', 'Cục trưởng cục CS QLHC về TTXH', 'Ấp Phú Bình, xã Phú Tâm', 'Ấp Phú Bình, xã Phú Tâm', 19, '17', NULL, NULL, NULL, NULL, NULL, 'nu', NULL, b'1', '2024-05-28 15:37:06', '2024-05-28 15:37:06', 28, '6', '21', NULL);
INSERT INTO `module_manage_students` VALUES (262, 25, 'Thạch Thị Mỹ Dung', '1987-04-17', '0383076421', '094187001335', '2021-04-13', 'Cục trưởng cục CS QLHC về TTXH', 'Ấp Phú Hữu, xã Phú Tâm', 'Ấp Phú Hữu, xã Phú Tâm', 19, '17', NULL, NULL, NULL, NULL, NULL, 'nu', NULL, b'1', '2024-05-28 15:38:49', '2024-05-28 15:38:49', 28, NULL, '21', NULL);
INSERT INTO `module_manage_students` VALUES (263, 25, 'Lâm Tâm Như', '2008-09-25', '0333953741', '094308014792', '2022-10-18', 'Cục trưởng cục CS QLHC về TTXH', 'Ấp Phú Bình, xã Phú Tâm', 'Ấp Phú Bình, xã Phú Tâm', 19, '17', NULL, NULL, NULL, NULL, NULL, 'nu', NULL, b'1', '2024-05-28 15:48:07', '2024-05-28 15:48:07', 28, NULL, '21', NULL);
INSERT INTO `module_manage_students` VALUES (264, 25, 'Lâm Ngọc Mai', '2004-06-15', '0342857644', '094304007955', '2021-08-13', 'Cục trưởng cục CS QLHC về TTXH', 'Ấp Phước An, xã Phú Tân', 'Ấp Phước An, xã Phú Tân', 19, '17', NULL, NULL, NULL, NULL, NULL, 'nu', NULL, b'1', '2024-05-28 16:06:21', '2024-05-28 16:06:21', 28, '12', '21', NULL);
INSERT INTO `module_manage_students` VALUES (265, 25, 'Trần Thị Bích Phượng', '2007-07-20', '0347145604', '094307003276', '2022-12-13', 'Cục trưởng cục CS QLHC về TTXH', 'Ấp Xây Đá A, xã Hồ Đắc Kiện', 'Ấp Xây Đá A, xã Hồ Đắc Kiện', 19, '17', NULL, NULL, NULL, NULL, NULL, 'nu', NULL, b'1', '2024-05-28 16:09:53', '2024-05-28 16:09:53', 28, '10', '21', NULL);
INSERT INTO `module_manage_students` VALUES (266, 25, 'Huỳnh Quốc Phong', '2008-04-25', '0359627697', '094208013157', '2022-09-15', 'Cục trưởng cục CS QLHC về TTXH', 'Ấp Phú Hữu, xã Phú Tâm', 'Ấp Phú Hữu, xã Phú Tâm', 19, '17', NULL, NULL, NULL, NULL, NULL, 'nam', NULL, b'1', '2024-05-28 16:12:51', '2024-05-28 16:12:51', 28, NULL, '21', NULL);
INSERT INTO `module_manage_students` VALUES (267, 25, 'Danh Hiền', '1987-01-01', '0373852272', '094087003915', '2022-09-23', 'Cục trưởng cục CS QLHC về TTXH', 'Ấp Thọ Hòa Đông A, xã Phú Tâm', 'Ấp Thọ Hòa Đông A, xã Phú Tâm', 19, '17', NULL, NULL, NULL, NULL, NULL, 'nam', NULL, b'1', '2024-05-28 16:14:33', '2024-05-28 16:14:33', 28, '6', '21', NULL);
INSERT INTO `module_manage_students` VALUES (268, 25, 'Nguyễn La Hoài Nam', '2005-03-11', '0865429614', '094205001762', NULL, 'Cục trưởng cục CS QLHC về TTXH', 'Ấp Thọ Hòa Đông A, xã Phú Tâm', 'Ấp Thọ Hòa Đông A, xã Phú Tâm', 18, '17', NULL, NULL, NULL, NULL, NULL, 'nam', NULL, b'1', '2024-05-28 16:15:59', '2024-05-28 16:15:59', 28, NULL, '21', NULL);

-- ----------------------------
-- Table structure for module_officer_assessment_processes
-- ----------------------------
DROP TABLE IF EXISTS `module_officer_assessment_processes`;
CREATE TABLE `module_officer_assessment_processes`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `id_officer` int NOT NULL,
  `health_assessment` int NOT NULL,
  `moral_assessment` int NOT NULL,
  `professional_assessment` int NOT NULL,
  `general_assessment` int NOT NULL,
  `id_course` int NOT NULL,
  `id_semester` int NOT NULL,
  `note` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `id_officer`(`id_officer` ASC) USING BTREE,
  INDEX `module_officer_assessment_processes_ibfk_2`(`id_course` ASC) USING BTREE,
  INDEX `module_officer_assessment_processes_ibfk_3`(`id_semester` ASC) USING BTREE,
  CONSTRAINT `module_officer_assessment_processes_ibfk_1` FOREIGN KEY (`id_officer`) REFERENCES `module_officer_informations` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `module_officer_assessment_processes_ibfk_2` FOREIGN KEY (`id_course`) REFERENCES `module_type_of_courses` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `module_officer_assessment_processes_ibfk_3` FOREIGN KEY (`id_semester`) REFERENCES `module_type_of_semesters` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of module_officer_assessment_processes
-- ----------------------------

-- ----------------------------
-- Table structure for module_officer_informations
-- ----------------------------
DROP TABLE IF EXISTS `module_officer_informations`;
CREATE TABLE `module_officer_informations`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `id_site` int NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `date_of_birth` date NULL DEFAULT NULL COMMENT 'Ngày sinh',
  `numberphone` varchar(11) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT 'Số điện thoại',
  `identification_id_card` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT 'CMND/CCCD',
  `date_of_issue` date NULL DEFAULT NULL COMMENT 'Ngày cấp',
  `department_of_issue` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT 'Cơ quan cấp',
  `educational_level` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT 'Trình độ học vấn',
  `teaching_level` int NOT NULL COMMENT 'Trình độ giảng dạy',
  `permanent_residence` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT 'Hộ khẩu thường trú',
  `place_of_live` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT 'Nơi sống',
  `ethnic` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT 'Dân tộc',
  `region` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT 'Tôn giáo',
  `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `state_of_health` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT 'Tình trạng sức khỏe',
  `blood_group` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `height` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `weight` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `gender` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `family_composition` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `name`(`name`(191) ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of module_officer_informations
-- ----------------------------

-- ----------------------------
-- Table structure for module_officer_professional_training_processes
-- ----------------------------
DROP TABLE IF EXISTS `module_officer_professional_training_processes`;
CREATE TABLE `module_officer_professional_training_processes`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `id_officer` int NOT NULL,
  `school_name` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `specialized` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `from_the_time` date NULL DEFAULT NULL,
  `till_the_time` date NULL DEFAULT NULL,
  `id_training_form` int NOT NULL,
  `id_certificate` int NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `id_training_form`(`id_training_form` ASC) USING BTREE,
  INDEX `id_certificate`(`id_certificate` ASC) USING BTREE,
  CONSTRAINT `module_officer_professional_training_processes_ibfk_1` FOREIGN KEY (`id_training_form`) REFERENCES `module_type_of_training_forms` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `module_officer_professional_training_processes_ibfk_2` FOREIGN KEY (`id_certificate`) REFERENCES `module_type_of_certificates` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of module_officer_professional_training_processes
-- ----------------------------

-- ----------------------------
-- Table structure for module_officer_work_processes
-- ----------------------------
DROP TABLE IF EXISTS `module_officer_work_processes`;
CREATE TABLE `module_officer_work_processes`  (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `information` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `from_the_time` date NOT NULL,
  `till_the_time` date NOT NULL,
  `id_officer` bigint UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `id_officer`(`id_officer` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of module_officer_work_processes
-- ----------------------------

-- ----------------------------
-- Table structure for module_review_processes
-- ----------------------------
DROP TABLE IF EXISTS `module_review_processes`;
CREATE TABLE `module_review_processes`  (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `id_site` int NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `id_activity` int NOT NULL,
  `id_type` int NOT NULL,
  `id_training_specialty` int NOT NULL,
  `id_course` int NOT NULL,
  `start_time` date NULL DEFAULT NULL,
  `end_time` date NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `week` int NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `id_course`(`id_course` ASC) USING BTREE,
  INDEX `id_training_specialty`(`id_training_specialty` ASC) USING BTREE,
  INDEX `id_officer`(`id_activity` ASC) USING BTREE,
  INDEX `id_type`(`id_type` ASC) USING BTREE,
  CONSTRAINT `module_review_processes_ibfk_1` FOREIGN KEY (`id_course`) REFERENCES `module_type_of_courses` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `module_review_processes_ibfk_2` FOREIGN KEY (`id_training_specialty`) REFERENCES `module_training_specialties` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `module_review_processes_ibfk_3` FOREIGN KEY (`id_activity`) REFERENCES `partial_module_review_processes_categories` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `module_review_processes_ibfk_4` FOREIGN KEY (`id_type`) REFERENCES `partial_module_review_processes_categories` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of module_review_processes
-- ----------------------------

-- ----------------------------
-- Table structure for module_teaching_assignments
-- ----------------------------
DROP TABLE IF EXISTS `module_teaching_assignments`;
CREATE TABLE `module_teaching_assignments`  (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `id_site` int NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `id_officer` int NOT NULL,
  `id_course` int NOT NULL,
  `start_time` date NULL DEFAULT NULL,
  `end_time` date NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `id_course`(`id_course` ASC) USING BTREE,
  INDEX `id_officer`(`id_officer` ASC) USING BTREE,
  CONSTRAINT `module_teaching_assignments_ibfk_1` FOREIGN KEY (`id_course`) REFERENCES `module_type_of_courses` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `module_teaching_assignments_ibfk_3` FOREIGN KEY (`id_officer`) REFERENCES `module_officer_informations` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of module_teaching_assignments
-- ----------------------------

-- ----------------------------
-- Table structure for module_training_program_informations
-- ----------------------------
DROP TABLE IF EXISTS `module_training_program_informations`;
CREATE TABLE `module_training_program_informations`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `id_site` int NOT NULL,
  `name` varchar(11) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `id_training_specialty` int NOT NULL,
  `year` year NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `id_training_specialty`(`id_training_specialty` ASC) USING BTREE,
  CONSTRAINT `module_training_program_informations_ibfk_1` FOREIGN KEY (`id_training_specialty`) REFERENCES `module_training_specialties` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of module_training_program_informations
-- ----------------------------

-- ----------------------------
-- Table structure for module_training_specialties
-- ----------------------------
DROP TABLE IF EXISTS `module_training_specialties`;
CREATE TABLE `module_training_specialties`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `id_site` int NOT NULL,
  `name` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `type_1` int NOT NULL COMMENT '1: đào tạo dưới 3 tháng; 2: đào tạo sơ cấp',
  `type_2` int NOT NULL COMMENT '1: phi nông nghiệp; 2: nông nghiệp',
  `duration_by_month` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `duration_by_day` int NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 33 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of module_training_specialties
-- ----------------------------
INSERT INTO `module_training_specialties` VALUES (18, 25, 'Đan đát hàng thủ công mỹ nghệ ( đan ghế dây nhựa, đan giỏ nilon, kết lông mi giả, đan giỏ quà )', 1, 1, '1', 22, '2023-07-30 00:20:03', '2023-08-16 10:38:53');
INSERT INTO `module_training_specialties` VALUES (20, 25, 'May công nghiệp', 1, 1, '1.5', 33, '2023-07-30 00:40:36', '2023-08-16 10:35:32');
INSERT INTO `module_training_specialties` VALUES (21, 25, 'Trồng màu ( rau an toàn, rau hữu cơ )', 1, 2, '1', 22, '2023-07-30 00:40:57', '2023-08-16 10:35:39');
INSERT INTO `module_training_specialties` VALUES (22, 25, 'Chăm sóc hoa kiểng, cây cảnh', 1, 2, '1', 22, '2023-07-30 00:41:13', '2023-08-16 10:35:43');
INSERT INTO `module_training_specialties` VALUES (23, 25, 'Chăn nuôi bò', 1, 2, '1', 22, '2023-07-30 00:41:48', '2024-04-09 08:26:01');
INSERT INTO `module_training_specialties` VALUES (24, 25, 'Nuôi thủy sản (tôm, cá, cua, ếch, rắn…)', 1, 2, '1', 22, '2023-07-30 00:41:59', '2023-08-16 10:35:52');
INSERT INTO `module_training_specialties` VALUES (25, 25, 'Tin học văn phòng', 2, 1, '3', 66, '2023-07-30 00:42:18', '2023-08-16 10:36:02');
INSERT INTO `module_training_specialties` VALUES (26, 25, 'Trang điểm', 2, 1, '3', 66, '2023-07-30 00:42:37', '2023-08-16 10:36:06');
INSERT INTO `module_training_specialties` VALUES (27, 25, 'Kỹ thuật làm Nail', 2, 1, '3', 66, '2023-07-30 00:43:06', '2023-08-16 10:36:11');
INSERT INTO `module_training_specialties` VALUES (28, 25, 'Kỹ thuật xây dựng cơ bản', 2, 1, '3', 66, '2023-07-30 00:43:23', '2023-08-16 10:36:16');
INSERT INTO `module_training_specialties` VALUES (29, 25, 'Nhạc công ngũ âm', 2, 1, '3', 66, '2023-07-30 00:43:40', '2023-08-16 10:36:23');
INSERT INTO `module_training_specialties` VALUES (30, 25, 'Cắt, uốn tóc', 2, 1, '4', 88, '2023-07-30 00:43:53', '2023-08-16 10:36:40');
INSERT INTO `module_training_specialties` VALUES (31, 25, 'Điện gia dụng', 2, 1, '4', 88, '2023-07-30 00:44:02', '2023-08-16 10:36:46');
INSERT INTO `module_training_specialties` VALUES (32, 25, 'Bonsai cây kiểng', 2, 2, '3', 66, '2023-07-30 00:44:43', '2023-08-16 10:36:54');

-- ----------------------------
-- Table structure for module_type_of_certificates
-- ----------------------------
DROP TABLE IF EXISTS `module_type_of_certificates`;
CREATE TABLE `module_type_of_certificates`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `id_site` int NOT NULL,
  `name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 25 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of module_type_of_certificates
-- ----------------------------
INSERT INTO `module_type_of_certificates` VALUES (15, 25, 'TSKH', '2023-06-30 16:51:38', '2023-07-04 10:12:50');
INSERT INTO `module_type_of_certificates` VALUES (16, 25, 'Tiến sĩ', '2023-06-30 16:51:54', '2023-07-03 15:03:07');
INSERT INTO `module_type_of_certificates` VALUES (18, 25, 'Thạc sĩ', '2023-06-30 16:51:54', '2023-07-03 15:03:07');
INSERT INTO `module_type_of_certificates` VALUES (19, 25, 'Đại học', '2023-06-30 16:51:54', '2023-07-03 15:03:07');
INSERT INTO `module_type_of_certificates` VALUES (20, 25, 'Cao đẳng', '2023-06-30 16:51:54', '2023-07-03 15:03:07');
INSERT INTO `module_type_of_certificates` VALUES (21, 25, 'Trung cấp', '2023-06-30 16:51:54', '2023-07-03 15:03:07');
INSERT INTO `module_type_of_certificates` VALUES (22, 25, 'Sơ cấp', '2023-06-30 16:51:54', '2023-07-03 15:03:07');
INSERT INTO `module_type_of_certificates` VALUES (23, 25, 'Chứng chỉ', '2023-06-30 16:51:54', '2023-07-03 15:03:07');
INSERT INTO `module_type_of_certificates` VALUES (24, 25, 'Chuyên ngành khác', '2023-06-30 16:51:54', '2023-07-03 15:03:07');

-- ----------------------------
-- Table structure for module_type_of_courses
-- ----------------------------
DROP TABLE IF EXISTS `module_type_of_courses`;
CREATE TABLE `module_type_of_courses`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `id_site` int NOT NULL,
  `name` int NOT NULL,
  `id_training_specialty` int NOT NULL,
  `year` year NOT NULL,
  `exam_date` date NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `from_the_time` date NOT NULL,
  `till_the_time` date NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `id_training_specialty`(`id_training_specialty` ASC) USING BTREE,
  CONSTRAINT `module_type_of_courses_ibfk_1` FOREIGN KEY (`id_training_specialty`) REFERENCES `module_training_specialties` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE = InnoDB AUTO_INCREMENT = 29 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of module_type_of_courses
-- ----------------------------
INSERT INTO `module_type_of_courses` VALUES (25, 25, 11, 23, 2023, '2023-12-05', '2024-05-07 09:14:29', '2024-05-07 13:14:05', '2023-11-10', '2023-12-05');
INSERT INTO `module_type_of_courses` VALUES (26, 25, 1, 20, 2024, '2024-05-30', '2024-05-07 10:10:43', '2024-05-28 14:50:32', '2024-04-26', '2024-05-30');
INSERT INTO `module_type_of_courses` VALUES (27, 25, 1, 31, 2024, '2024-08-09', '2024-05-15 08:59:39', '2024-05-15 08:59:39', '2024-04-26', '2024-08-09');
INSERT INTO `module_type_of_courses` VALUES (28, 25, 2, 20, 2024, '2024-06-04', '2024-05-28 14:50:25', '2024-05-28 14:50:25', '2024-05-03', '2024-06-04');

-- ----------------------------
-- Table structure for module_type_of_departments
-- ----------------------------
DROP TABLE IF EXISTS `module_type_of_departments`;
CREATE TABLE `module_type_of_departments`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `id_site` int NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `code` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `short_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `address` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `founding_date` date NULL DEFAULT NULL,
  `numberphone` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `note` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 20 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of module_type_of_departments
-- ----------------------------
INSERT INTO `module_type_of_departments` VALUES (15, 25, 'Khóa 1', '', NULL, NULL, NULL, NULL, NULL, NULL, '2023-06-30 16:51:38', '2023-07-23 22:30:44');
INSERT INTO `module_type_of_departments` VALUES (16, 25, 'Khóa 2', '', NULL, NULL, NULL, NULL, NULL, NULL, '2023-06-30 16:51:54', '2023-07-23 22:30:38');
INSERT INTO `module_type_of_departments` VALUES (19, 25, 'Khóa 3', 'Khóa 3', 'K3', NULL, '2024-01-31', NULL, NULL, NULL, '2024-01-31 16:12:11', '2024-01-31 16:12:11');

-- ----------------------------
-- Table structure for module_type_of_ethnics
-- ----------------------------
DROP TABLE IF EXISTS `module_type_of_ethnics`;
CREATE TABLE `module_type_of_ethnics`  (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `id_site` int NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 71 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of module_type_of_ethnics
-- ----------------------------
INSERT INTO `module_type_of_ethnics` VALUES (15, 25, 'Kinh', '2023-06-30 16:51:38', '2023-07-05 15:49:04');
INSERT INTO `module_type_of_ethnics` VALUES (16, 25, 'Tày', '2023-06-30 16:51:54', '2023-07-05 16:18:55');
INSERT INTO `module_type_of_ethnics` VALUES (17, 25, 'Thái', '2023-07-05 16:19:00', '2023-07-05 16:19:00');
INSERT INTO `module_type_of_ethnics` VALUES (18, 25, 'Hoa', '2023-07-05 16:19:05', '2023-07-05 16:19:05');
INSERT INTO `module_type_of_ethnics` VALUES (19, 25, 'Khơ-me', '2023-07-05 16:19:10', '2023-07-05 16:19:10');
INSERT INTO `module_type_of_ethnics` VALUES (20, 25, 'Mường', '2023-07-05 16:19:16', '2023-07-05 16:19:16');
INSERT INTO `module_type_of_ethnics` VALUES (21, 25, 'Nùng', '2023-07-05 16:19:26', '2023-07-05 16:19:26');
INSERT INTO `module_type_of_ethnics` VALUES (22, 25, 'HMông', '2023-07-05 16:19:36', '2023-07-05 16:19:36');
INSERT INTO `module_type_of_ethnics` VALUES (23, 25, 'Dao', '2023-07-05 16:19:41', '2023-07-05 16:19:41');
INSERT INTO `module_type_of_ethnics` VALUES (24, 25, 'Gia-rai', '2023-07-05 16:19:46', '2023-07-05 16:19:46');
INSERT INTO `module_type_of_ethnics` VALUES (25, 25, 'Ngái', '2023-07-05 16:20:04', '2023-07-05 16:20:04');
INSERT INTO `module_type_of_ethnics` VALUES (26, 25, 'Ê-đê', '2023-07-05 16:20:07', '2023-07-05 16:20:07');
INSERT INTO `module_type_of_ethnics` VALUES (27, 25, 'Ba na', '2023-07-05 16:20:11', '2023-07-05 16:20:11');
INSERT INTO `module_type_of_ethnics` VALUES (28, 25, 'Xơ-Đăng', '2023-07-05 16:20:14', '2023-07-05 16:20:14');
INSERT INTO `module_type_of_ethnics` VALUES (29, 25, 'Sán Chay', '2023-07-05 16:20:18', '2023-07-05 16:20:18');
INSERT INTO `module_type_of_ethnics` VALUES (30, 25, 'Cơ-ho', '2023-07-05 16:20:46', '2023-07-05 16:20:46');
INSERT INTO `module_type_of_ethnics` VALUES (31, 25, 'Chăm', '2023-07-05 16:20:49', '2023-07-05 16:20:49');
INSERT INTO `module_type_of_ethnics` VALUES (32, 25, 'Sán Dìu', '2023-07-05 16:20:51', '2023-07-05 16:20:51');
INSERT INTO `module_type_of_ethnics` VALUES (33, 25, 'Hrê', '2023-07-05 16:20:55', '2023-07-05 16:20:55');
INSERT INTO `module_type_of_ethnics` VALUES (34, 25, 'Mnông', '2023-07-05 16:20:58', '2023-07-05 16:20:58');
INSERT INTO `module_type_of_ethnics` VALUES (35, 25, 'Ra-glai', '2023-07-05 16:21:02', '2023-07-05 16:21:02');
INSERT INTO `module_type_of_ethnics` VALUES (36, 25, 'Xtiêng', '2023-07-05 16:21:06', '2023-07-05 16:21:06');
INSERT INTO `module_type_of_ethnics` VALUES (37, 25, 'Bru-Vân Kiều', '2023-07-05 16:21:13', '2023-07-05 16:21:13');
INSERT INTO `module_type_of_ethnics` VALUES (38, 25, 'Thổ', '2023-07-05 16:21:17', '2023-07-05 16:21:17');
INSERT INTO `module_type_of_ethnics` VALUES (39, 25, 'Giáy', '2023-07-05 16:21:20', '2023-07-05 16:21:20');
INSERT INTO `module_type_of_ethnics` VALUES (40, 25, 'Cơ-tu', '2023-07-05 16:21:23', '2023-07-05 16:21:23');
INSERT INTO `module_type_of_ethnics` VALUES (41, 25, 'Gié Triêng', '2023-07-05 16:21:26', '2023-07-05 16:21:26');
INSERT INTO `module_type_of_ethnics` VALUES (42, 25, 'Mạ', '2023-07-05 16:21:30', '2023-07-05 16:21:30');
INSERT INTO `module_type_of_ethnics` VALUES (43, 25, 'Khơ-mú', '2023-07-05 16:21:33', '2023-07-05 16:21:33');
INSERT INTO `module_type_of_ethnics` VALUES (44, 25, 'Co', '2023-07-05 16:21:36', '2023-07-05 16:21:36');
INSERT INTO `module_type_of_ethnics` VALUES (45, 25, 'Tà-ôi', '2023-07-05 16:21:39', '2023-07-05 16:21:39');
INSERT INTO `module_type_of_ethnics` VALUES (46, 25, 'Chơ-ro', '2023-07-05 16:21:43', '2023-07-05 16:21:43');
INSERT INTO `module_type_of_ethnics` VALUES (47, 25, 'Kháng', '2023-07-05 16:21:46', '2023-07-05 16:21:46');
INSERT INTO `module_type_of_ethnics` VALUES (48, 25, 'Xinh-mun', '2023-07-05 16:21:50', '2023-07-05 16:21:50');
INSERT INTO `module_type_of_ethnics` VALUES (49, 25, 'Hà Nhì', '2023-07-05 16:21:53', '2023-07-05 16:21:53');
INSERT INTO `module_type_of_ethnics` VALUES (50, 25, 'Chu ru', '2023-07-05 16:21:56', '2023-07-05 16:21:56');
INSERT INTO `module_type_of_ethnics` VALUES (51, 25, 'Lào', '2023-07-05 16:21:59', '2023-07-05 16:21:59');
INSERT INTO `module_type_of_ethnics` VALUES (52, 25, 'La Chí', '2023-07-05 16:22:04', '2023-07-05 16:22:04');
INSERT INTO `module_type_of_ethnics` VALUES (53, 25, 'La Ha', '2023-07-05 16:22:08', '2023-07-05 16:22:08');
INSERT INTO `module_type_of_ethnics` VALUES (54, 25, 'Phù Lá', '2023-07-05 16:22:54', '2023-07-05 16:22:54');
INSERT INTO `module_type_of_ethnics` VALUES (55, 25, 'La Hủ', '2023-07-05 16:22:58', '2023-07-05 16:22:58');
INSERT INTO `module_type_of_ethnics` VALUES (56, 25, 'Lự', '2023-07-05 16:23:01', '2023-07-05 16:23:01');
INSERT INTO `module_type_of_ethnics` VALUES (57, 25, 'Lô Lô', '2023-07-05 16:23:05', '2023-07-05 16:23:05');
INSERT INTO `module_type_of_ethnics` VALUES (58, 25, 'Chứt', '2023-07-05 16:23:09', '2023-07-05 16:23:09');
INSERT INTO `module_type_of_ethnics` VALUES (59, 25, 'Mảng', '2023-07-05 16:23:12', '2023-07-05 16:23:12');
INSERT INTO `module_type_of_ethnics` VALUES (60, 25, 'Pà Thẻn', '2023-07-05 16:23:16', '2023-07-05 16:23:16');
INSERT INTO `module_type_of_ethnics` VALUES (61, 25, 'Co Lao', '2023-07-05 16:23:20', '2023-07-05 16:23:20');
INSERT INTO `module_type_of_ethnics` VALUES (62, 25, 'Cống', '2023-07-05 16:25:12', '2023-07-05 16:25:12');
INSERT INTO `module_type_of_ethnics` VALUES (63, 25, 'Bố Y', '2023-07-05 16:25:16', '2023-07-05 16:25:16');
INSERT INTO `module_type_of_ethnics` VALUES (64, 25, 'Si La', '2023-07-05 16:25:21', '2023-07-05 16:25:21');
INSERT INTO `module_type_of_ethnics` VALUES (65, 25, 'Pu Péo', '2023-07-05 16:25:25', '2023-07-05 16:25:25');
INSERT INTO `module_type_of_ethnics` VALUES (66, 25, 'Brâu', '2023-07-05 16:25:27', '2023-07-05 16:25:27');
INSERT INTO `module_type_of_ethnics` VALUES (67, 25, 'Ơ Đu', '2023-07-05 16:25:32', '2023-07-05 16:25:32');
INSERT INTO `module_type_of_ethnics` VALUES (68, 25, 'Rơ măm', '2023-07-05 16:25:36', '2023-07-05 16:25:36');
INSERT INTO `module_type_of_ethnics` VALUES (70, 25, 'test', '2024-01-31 15:57:04', '2024-01-31 15:57:04');

-- ----------------------------
-- Table structure for module_type_of_family_compositions
-- ----------------------------
DROP TABLE IF EXISTS `module_type_of_family_compositions`;
CREATE TABLE `module_type_of_family_compositions`  (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `id_site` int NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 32 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of module_type_of_family_compositions
-- ----------------------------
INSERT INTO `module_type_of_family_compositions` VALUES (17, 25, '---', '2023-06-30 17:02:00', '2023-07-05 16:26:12');
INSERT INTO `module_type_of_family_compositions` VALUES (18, 25, 'Cán bộ', '2023-07-03 14:03:41', '2023-07-05 16:26:21');
INSERT INTO `module_type_of_family_compositions` VALUES (19, 25, 'Công chức (Chế độ cũ)', '2023-07-05 16:26:30', '2023-07-05 16:26:30');
INSERT INTO `module_type_of_family_compositions` VALUES (20, 25, 'Công chức NN', '2023-07-05 16:26:37', '2023-07-05 16:26:37');
INSERT INTO `module_type_of_family_compositions` VALUES (21, 25, 'Công nhân', '2023-07-05 16:26:42', '2023-07-05 16:26:42');
INSERT INTO `module_type_of_family_compositions` VALUES (22, 25, 'Dân nghèo thành thị', '2023-07-05 16:26:57', '2023-07-05 16:26:57');
INSERT INTO `module_type_of_family_compositions` VALUES (23, 25, 'Nông dân', '2023-07-05 16:27:06', '2023-07-05 16:27:06');
INSERT INTO `module_type_of_family_compositions` VALUES (24, 25, 'Quân nhân (Chế độ cũ)', '2023-07-05 16:27:15', '2023-07-05 16:27:15');
INSERT INTO `module_type_of_family_compositions` VALUES (25, 25, 'Quân nhân', '2023-07-05 16:27:21', '2023-07-05 16:27:21');
INSERT INTO `module_type_of_family_compositions` VALUES (26, 25, 'Thợ thủ công', '2023-07-05 16:27:35', '2023-07-05 16:27:35');
INSERT INTO `module_type_of_family_compositions` VALUES (27, 25, 'Tiểu chủ', '2023-07-05 16:27:44', '2023-07-05 16:27:44');
INSERT INTO `module_type_of_family_compositions` VALUES (28, 25, 'Tiểu thương', '2023-07-05 16:27:49', '2023-07-05 16:27:49');
INSERT INTO `module_type_of_family_compositions` VALUES (29, 25, 'Tiểu tư sản', '2023-07-05 16:27:53', '2023-07-05 16:27:53');
INSERT INTO `module_type_of_family_compositions` VALUES (30, 25, 'Tư sản', '2023-07-05 16:28:01', '2023-07-05 16:28:01');
INSERT INTO `module_type_of_family_compositions` VALUES (31, 25, 'Viên chức', '2023-07-05 16:28:04', '2023-07-05 16:28:04');

-- ----------------------------
-- Table structure for module_type_of_officer_titles
-- ----------------------------
DROP TABLE IF EXISTS `module_type_of_officer_titles`;
CREATE TABLE `module_type_of_officer_titles`  (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `id_site` int NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 26 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of module_type_of_officer_titles
-- ----------------------------
INSERT INTO `module_type_of_officer_titles` VALUES (5, 25, 'Không có', '2023-06-29 16:57:56', '2023-07-24 09:07:05');
INSERT INTO `module_type_of_officer_titles` VALUES (15, 25, 'Hiệu trưởng', '2023-06-30 16:51:38', '2023-07-05 10:02:47');
INSERT INTO `module_type_of_officer_titles` VALUES (16, 25, 'test3', '2023-06-30 16:51:54', '2023-07-03 15:03:07');
INSERT INTO `module_type_of_officer_titles` VALUES (18, 25, 'Hiệu trưởng/Giám đốc', '2023-07-24 09:07:13', '2023-07-24 09:07:13');
INSERT INTO `module_type_of_officer_titles` VALUES (19, 25, 'Phó hiệu trưởng/Phó giám đốc', '2023-07-24 09:07:19', '2023-07-24 09:07:19');
INSERT INTO `module_type_of_officer_titles` VALUES (20, 25, 'Trưởng khoa', '2023-07-24 09:07:26', '2023-07-24 09:07:26');
INSERT INTO `module_type_of_officer_titles` VALUES (21, 25, 'Phó trưởng khoa', '2023-07-24 09:07:34', '2023-07-24 09:07:34');
INSERT INTO `module_type_of_officer_titles` VALUES (22, 25, 'Trưởng bộ môn', '2023-07-24 09:07:41', '2023-07-24 09:07:41');
INSERT INTO `module_type_of_officer_titles` VALUES (23, 25, 'Phó trưởng bộ môn', '2023-07-24 09:07:48', '2023-07-24 09:07:48');
INSERT INTO `module_type_of_officer_titles` VALUES (24, 25, 'Trưởng phòng', '2023-07-24 09:07:53', '2023-07-24 09:07:53');
INSERT INTO `module_type_of_officer_titles` VALUES (25, 25, 'Phó trưởng phòng', '2023-07-24 09:08:03', '2023-07-24 09:08:03');

-- ----------------------------
-- Table structure for module_type_of_recruitment_forms
-- ----------------------------
DROP TABLE IF EXISTS `module_type_of_recruitment_forms`;
CREATE TABLE `module_type_of_recruitment_forms`  (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `id_site` int NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of module_type_of_recruitment_forms
-- ----------------------------

-- ----------------------------
-- Table structure for module_type_of_recruitments
-- ----------------------------
DROP TABLE IF EXISTS `module_type_of_recruitments`;
CREATE TABLE `module_type_of_recruitments`  (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `id_site` int NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of module_type_of_recruitments
-- ----------------------------

-- ----------------------------
-- Table structure for module_type_of_religions
-- ----------------------------
DROP TABLE IF EXISTS `module_type_of_religions`;
CREATE TABLE `module_type_of_religions`  (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `id_site` int NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 34 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of module_type_of_religions
-- ----------------------------
INSERT INTO `module_type_of_religions` VALUES (17, 25, 'Không', '2023-07-03 14:17:59', '2023-07-05 16:30:53');
INSERT INTO `module_type_of_religions` VALUES (18, 25, 'Phật giáo', '2023-07-05 16:31:00', '2023-07-05 16:31:00');
INSERT INTO `module_type_of_religions` VALUES (19, 25, 'Công giáo', '2023-07-05 16:31:04', '2023-07-05 16:31:04');
INSERT INTO `module_type_of_religions` VALUES (20, 25, 'Cao đài', '2023-07-05 16:31:08', '2023-07-05 16:31:08');
INSERT INTO `module_type_of_religions` VALUES (21, 25, 'Hòa hảo', '2023-07-05 16:31:12', '2023-07-05 16:31:12');
INSERT INTO `module_type_of_religions` VALUES (22, 25, 'Tin lành', '2023-07-05 16:31:26', '2023-07-05 16:31:26');
INSERT INTO `module_type_of_religions` VALUES (23, 25, 'Hồi giáo', '2023-07-05 16:31:30', '2023-07-05 16:31:30');
INSERT INTO `module_type_of_religions` VALUES (24, 25, 'Bà La môn', '2023-07-05 16:31:34', '2023-07-05 16:33:10');
INSERT INTO `module_type_of_religions` VALUES (25, 25, 'Bà Ni', '2023-07-05 16:31:45', '2023-07-05 16:31:45');
INSERT INTO `module_type_of_religions` VALUES (26, 25, 'Minh Sư đạo', '2023-07-05 16:31:50', '2023-07-05 16:32:59');
INSERT INTO `module_type_of_religions` VALUES (27, 25, 'Minh Lý đạo', '2023-07-05 16:32:01', '2023-07-05 16:32:01');
INSERT INTO `module_type_of_religions` VALUES (28, 25, 'Tịnh độ cư sĩ Phật hồi Việt Nam', '2023-07-05 16:32:11', '2023-07-05 16:32:11');
INSERT INTO `module_type_of_religions` VALUES (29, 25, 'Đạo tứ ấn hiếu nghĩa', '2023-07-05 16:32:22', '2023-07-05 16:32:22');
INSERT INTO `module_type_of_religions` VALUES (30, 25, 'Bửu sơn Kỳ hương', '2023-07-05 16:32:33', '2023-07-05 16:32:33');
INSERT INTO `module_type_of_religions` VALUES (31, 25, 'Ba Ha\'i', '2023-07-05 16:32:43', '2023-07-05 16:32:43');
INSERT INTO `module_type_of_religions` VALUES (32, 25, 'Tôn giáo khác', '2023-07-05 16:32:49', '2023-07-05 16:32:49');
INSERT INTO `module_type_of_religions` VALUES (33, 25, 'test', '2024-01-31 16:09:50', '2024-01-31 16:09:50');

-- ----------------------------
-- Table structure for module_type_of_semesters
-- ----------------------------
DROP TABLE IF EXISTS `module_type_of_semesters`;
CREATE TABLE `module_type_of_semesters`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `id_site` int NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 17 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of module_type_of_semesters
-- ----------------------------
INSERT INTO `module_type_of_semesters` VALUES (15, 25, 'Học kỳ 1', '2023-06-30 16:51:38', '2023-07-05 10:10:27');
INSERT INTO `module_type_of_semesters` VALUES (16, 25, 'Học kỳ 2', '2023-06-30 16:51:54', '2023-07-23 22:31:06');

-- ----------------------------
-- Table structure for module_type_of_subject_teams
-- ----------------------------
DROP TABLE IF EXISTS `module_type_of_subject_teams`;
CREATE TABLE `module_type_of_subject_teams`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `id_site` int NOT NULL,
  `name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 17 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of module_type_of_subject_teams
-- ----------------------------
INSERT INTO `module_type_of_subject_teams` VALUES (15, 25, 'Khóa 1', '2023-06-30 16:51:38', '2023-07-23 22:30:44');
INSERT INTO `module_type_of_subject_teams` VALUES (16, 25, 'Khóa 2', '2023-06-30 16:51:54', '2023-07-23 22:30:38');

-- ----------------------------
-- Table structure for module_type_of_teaching_levels
-- ----------------------------
DROP TABLE IF EXISTS `module_type_of_teaching_levels`;
CREATE TABLE `module_type_of_teaching_levels`  (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `id_site` int NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 26 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of module_type_of_teaching_levels
-- ----------------------------
INSERT INTO `module_type_of_teaching_levels` VALUES (18, 25, 'Chưa qua đào tạo', '2023-07-06 16:40:02', '2023-07-06 16:40:02');
INSERT INTO `module_type_of_teaching_levels` VALUES (19, 25, 'Dưới trung cấp', '2023-07-06 16:40:15', '2023-07-06 16:40:15');
INSERT INTO `module_type_of_teaching_levels` VALUES (20, 25, 'Cao đẳng', '2023-07-06 16:40:23', '2023-07-06 16:40:23');
INSERT INTO `module_type_of_teaching_levels` VALUES (21, 25, 'Đại học', '2023-07-06 16:40:26', '2023-07-06 16:40:26');
INSERT INTO `module_type_of_teaching_levels` VALUES (22, 25, 'Sau đại học', '2023-07-06 16:40:31', '2023-07-06 16:40:31');
INSERT INTO `module_type_of_teaching_levels` VALUES (23, 25, 'Thạc sĩ', '2023-07-06 16:40:47', '2023-07-06 16:40:47');
INSERT INTO `module_type_of_teaching_levels` VALUES (24, 25, 'Tiến sĩ', '2023-07-06 16:40:51', '2023-07-06 16:40:51');
INSERT INTO `module_type_of_teaching_levels` VALUES (25, 25, 'Trung cấp', '2023-07-06 16:40:54', '2023-07-06 16:40:54');

-- ----------------------------
-- Table structure for module_type_of_training_forms
-- ----------------------------
DROP TABLE IF EXISTS `module_type_of_training_forms`;
CREATE TABLE `module_type_of_training_forms`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `id_site` int NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 27 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of module_type_of_training_forms
-- ----------------------------
INSERT INTO `module_type_of_training_forms` VALUES (18, 25, 'Chính quy', '2023-07-03 16:35:26', '2023-07-23 18:29:38');
INSERT INTO `module_type_of_training_forms` VALUES (19, 25, 'Tại chức', '2023-07-03 17:07:37', '2023-07-23 18:29:52');
INSERT INTO `module_type_of_training_forms` VALUES (20, 25, 'Mở rộng', '2023-07-23 18:29:56', '2023-07-23 18:29:56');
INSERT INTO `module_type_of_training_forms` VALUES (21, 25, 'Từ xa', '2023-07-23 18:30:03', '2023-07-23 18:30:03');
INSERT INTO `module_type_of_training_forms` VALUES (22, 25, 'Chuyên tu', '2023-07-23 18:30:07', '2023-07-23 18:30:07');
INSERT INTO `module_type_of_training_forms` VALUES (23, 25, 'Đặc cách', '2023-07-23 18:30:11', '2023-07-23 18:30:11');
INSERT INTO `module_type_of_training_forms` VALUES (24, 25, 'Tự học', '2023-07-23 18:30:19', '2023-07-23 18:30:19');
INSERT INTO `module_type_of_training_forms` VALUES (25, 25, 'Vừa học - vừa làm', '2023-07-23 18:30:24', '2023-07-23 18:30:28');
INSERT INTO `module_type_of_training_forms` VALUES (26, 25, 'Bằng 2', '2023-07-23 18:30:34', '2023-07-23 18:30:34');

-- ----------------------------
-- Table structure for module_type_of_training_levels
-- ----------------------------
DROP TABLE IF EXISTS `module_type_of_training_levels`;
CREATE TABLE `module_type_of_training_levels`  (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `id_site` int NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of module_type_of_training_levels
-- ----------------------------

-- ----------------------------
-- Table structure for module_type_of_training_programs
-- ----------------------------
DROP TABLE IF EXISTS `module_type_of_training_programs`;
CREATE TABLE `module_type_of_training_programs`  (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `id_site` int NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of module_type_of_training_programs
-- ----------------------------

-- ----------------------------
-- Table structure for module_type_of_training_subsystems
-- ----------------------------
DROP TABLE IF EXISTS `module_type_of_training_subsystems`;
CREATE TABLE `module_type_of_training_subsystems`  (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `id_site` int NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of module_type_of_training_subsystems
-- ----------------------------

-- ----------------------------
-- Table structure for module_vocational_education_policities
-- ----------------------------
DROP TABLE IF EXISTS `module_vocational_education_policities`;
CREATE TABLE `module_vocational_education_policities`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `id_site` int NOT NULL,
  `name` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` int NOT NULL COMMENT '1: đào tạo dưới 3 tháng; 2: đào tạo sơ cấp',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 42 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of module_vocational_education_policities
-- ----------------------------
INSERT INTO `module_vocational_education_policities` VALUES (18, 25, 'Người có công Cách mạng', 1, '2023-07-30 00:20:03', '2023-08-24 15:14:11');
INSERT INTO `module_vocational_education_policities` VALUES (20, 25, 'Hộ nghèo', 1, '2023-07-30 00:40:36', '2023-07-30 00:40:36');
INSERT INTO `module_vocational_education_policities` VALUES (21, 25, 'Dân tộc thiểu số', 1, '2023-07-30 00:40:57', '2023-07-30 00:40:57');
INSERT INTO `module_vocational_education_policities` VALUES (22, 25, 'Người tàn tật', 1, '2023-07-30 00:41:13', '2023-07-30 00:41:13');
INSERT INTO `module_vocational_education_policities` VALUES (23, 25, 'Lao động nữ bị mất việc làm', 1, '2023-07-30 00:41:48', '2023-07-30 00:41:48');
INSERT INTO `module_vocational_education_policities` VALUES (24, 25, 'Đối tượng cận nghèo(Thu nhập tối đa bằng 150% thu nhập hộ nghèo)', 2, '2023-07-30 00:41:59', '2023-07-30 00:41:59');
INSERT INTO `module_vocational_education_policities` VALUES (25, 25, 'Lao động nông thôn khác', 3, '2023-07-30 00:42:18', '2023-07-30 00:45:50');
INSERT INTO `module_vocational_education_policities` VALUES (36, 25, 'Trợ cấp bảo trợ xã hội', 1, '2023-08-24 15:14:41', '2023-08-24 15:14:41');
INSERT INTO `module_vocational_education_policities` VALUES (37, 25, 'Người thuộc hộ bị thu hồi đất', 1, NULL, NULL);
INSERT INTO `module_vocational_education_policities` VALUES (38, 25, 'Ngư dân', 1, NULL, NULL);
INSERT INTO `module_vocational_education_policities` VALUES (39, 25, 'Thanh niên hoàn thành nghĩa vụ', 1, NULL, NULL);
INSERT INTO `module_vocational_education_policities` VALUES (41, 25, 'Thoát nghèo dưới 36 tháng', 1, '2024-05-07 09:07:51', '2024-05-07 09:07:51');

-- ----------------------------
-- Table structure for partial_module_review_processes_categories
-- ----------------------------
DROP TABLE IF EXISTS `partial_module_review_processes_categories`;
CREATE TABLE `partial_module_review_processes_categories`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `id_site` int NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `order` int NULL DEFAULT NULL,
  `id_training_specialty` int NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 42 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of partial_module_review_processes_categories
-- ----------------------------
INSERT INTO `partial_module_review_processes_categories` VALUES (15, 25, 'Khai giảng, bế giảng', 'types', '2023-06-30 16:51:38', '2023-09-28 14:16:09', 1, 28);
INSERT INTO `partial_module_review_processes_categories` VALUES (16, 25, 'Hoạt động chung', 'types', '2023-06-30 16:51:54', '2023-09-28 14:16:11', 2, 28);
INSERT INTO `partial_module_review_processes_categories` VALUES (25, 25, 'Tổ chức khai giảng', 'activities', '2023-09-28 14:13:34', '2023-09-28 14:15:02', 1, 28);
INSERT INTO `partial_module_review_processes_categories` VALUES (26, 25, 'Sinh hoạt nội quy, giới thiệu các yêu cầu về vật liệu', 'activities', '2023-09-28 14:14:45', '2023-09-28 14:15:04', 2, 28);
INSERT INTO `partial_module_review_processes_categories` VALUES (27, 25, 'Xây tường gạch', 'activities', '2023-09-28 14:14:55', '2023-09-28 14:15:07', 3, 28);
INSERT INTO `partial_module_review_processes_categories` VALUES (28, 25, 'Xây trụ gạch', 'activities', '2023-09-28 14:15:13', '2023-09-28 14:15:13', 4, 28);
INSERT INTO `partial_module_review_processes_categories` VALUES (29, 25, 'Xây lanh tô gạch', 'activities', '2023-09-28 14:15:19', '2023-09-28 14:15:19', 5, 28);
INSERT INTO `partial_module_review_processes_categories` VALUES (30, 25, 'Trát tường phẳng', 'activities', '2023-09-28 14:15:27', '2023-09-28 14:15:27', 6, 28);
INSERT INTO `partial_module_review_processes_categories` VALUES (31, 25, 'Láng, lát, ốp', 'activities', '2023-09-28 14:15:33', '2023-09-28 14:15:33', 7, 28);
INSERT INTO `partial_module_review_processes_categories` VALUES (32, 25, 'Đọc bản vẽ, tính khối lượng, nhân công, vật liệu', 'activities', '2023-09-28 14:15:38', '2023-09-28 14:15:38', 8, 28);
INSERT INTO `partial_module_review_processes_categories` VALUES (33, 25, 'Ôn tập', 'activities', '2023-09-28 14:15:45', '2023-09-28 14:15:45', 9, 28);
INSERT INTO `partial_module_review_processes_categories` VALUES (34, 25, 'Thi', 'activities', '2023-09-28 14:15:50', '2023-09-28 14:15:50', 10, 28);
INSERT INTO `partial_module_review_processes_categories` VALUES (35, 25, 'Tổ chức bế giảng', 'activities', '2023-09-28 14:15:54', '2023-09-28 14:15:54', 11, 28);
INSERT INTO `partial_module_review_processes_categories` VALUES (36, 25, 'Mô đun đào tào nghề', 'types', '2023-09-28 14:16:18', '2023-09-28 14:16:18', 3, 28);
INSERT INTO `partial_module_review_processes_categories` VALUES (37, 25, 'Thực tập doanh nghiệp', 'types', '2023-09-28 14:16:27', '2023-09-28 14:16:27', 4, 28);
INSERT INTO `partial_module_review_processes_categories` VALUES (38, 25, 'Kiểm tra, thi kết thúc khóa học', 'types', '2023-09-28 14:16:32', '2023-09-28 14:16:32', 5, 28);
INSERT INTO `partial_module_review_processes_categories` VALUES (39, 25, 'Nghỉ lễ', 'types', '2023-09-28 14:16:37', '2023-09-28 14:16:37', 6, 28);
INSERT INTO `partial_module_review_processes_categories` VALUES (40, 25, 'Lao động/ngoại khóa', 'types', '2023-09-28 14:16:43', '2023-09-28 14:16:43', 7, 28);
INSERT INTO `partial_module_review_processes_categories` VALUES (41, 25, 'Ôn tập', 'types', '2023-09-28 14:16:48', '2023-09-28 14:16:48', 8, 28);

-- ----------------------------
-- Table structure for partial_module_training_program_informations_files
-- ----------------------------
DROP TABLE IF EXISTS `partial_module_training_program_informations_files`;
CREATE TABLE `partial_module_training_program_informations_files`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `description` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `path` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `id_program` int UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `library_id`(`id_program` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of partial_module_training_program_informations_files
-- ----------------------------

-- ----------------------------
-- Table structure for sys_function_of_controllers
-- ----------------------------
DROP TABLE IF EXISTS `sys_function_of_controllers`;
CREATE TABLE `sys_function_of_controllers`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `function` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `id_module` int NOT NULL,
  `description` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `method` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '1: GET; 2: Post',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `id_id_module`(`id_module` ASC) USING BTREE,
  CONSTRAINT `sys_function_of_controllers_ibfk_1` FOREIGN KEY (`id_module`) REFERENCES `sys_list_modules` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE = InnoDB AUTO_INCREMENT = 182 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of sys_function_of_controllers
-- ----------------------------
INSERT INTO `sys_function_of_controllers` VALUES (100, 'index', 52, NULL, '1', '2023-06-27 10:23:13', '2023-06-27 10:23:13');
INSERT INTO `sys_function_of_controllers` VALUES (101, 'ajax', 52, NULL, '2', '2023-06-27 10:23:17', '2023-06-27 10:23:17');
INSERT INTO `sys_function_of_controllers` VALUES (102, 'ajaxImports', 52, NULL, '2', '2023-06-27 10:44:06', '2023-09-29 08:17:34');
INSERT INTO `sys_function_of_controllers` VALUES (103, 'index', 53, NULL, '1', '2023-06-29 15:55:32', '2023-06-29 15:55:32');
INSERT INTO `sys_function_of_controllers` VALUES (104, 'ajax', 53, NULL, '2', '2023-06-29 15:55:35', '2023-06-29 15:55:35');
INSERT INTO `sys_function_of_controllers` VALUES (105, 'index', 54, NULL, '1', '2023-06-30 16:57:22', '2023-06-30 16:57:22');
INSERT INTO `sys_function_of_controllers` VALUES (106, 'ajax', 54, NULL, '2', '2023-06-30 16:57:25', '2023-06-30 16:57:25');
INSERT INTO `sys_function_of_controllers` VALUES (107, 'index', 55, NULL, '1', '2023-07-03 14:09:22', '2023-07-03 14:09:22');
INSERT INTO `sys_function_of_controllers` VALUES (108, 'ajax', 55, NULL, '2', '2023-07-03 14:09:25', '2023-07-03 14:09:25');
INSERT INTO `sys_function_of_controllers` VALUES (109, 'index', 56, NULL, '1', '2023-07-03 14:42:47', '2023-07-03 14:42:47');
INSERT INTO `sys_function_of_controllers` VALUES (110, 'ajax', 56, NULL, '2', '2023-07-03 14:42:50', '2023-07-03 14:42:50');
INSERT INTO `sys_function_of_controllers` VALUES (111, 'index', 57, NULL, '1', '2023-07-03 15:53:30', '2023-07-03 15:53:30');
INSERT INTO `sys_function_of_controllers` VALUES (112, 'ajax', 57, NULL, '2', '2023-07-03 15:53:38', '2023-07-03 15:53:38');
INSERT INTO `sys_function_of_controllers` VALUES (113, 'index', 58, NULL, '1', '2023-07-03 17:02:32', '2023-07-03 17:02:32');
INSERT INTO `sys_function_of_controllers` VALUES (114, 'ajax', 58, NULL, '2', '2023-07-03 17:02:36', '2023-07-03 17:02:36');
INSERT INTO `sys_function_of_controllers` VALUES (115, 'index', 59, NULL, '1', '2023-07-04 09:53:46', '2023-07-04 09:53:46');
INSERT INTO `sys_function_of_controllers` VALUES (116, 'ajax', 59, NULL, '2', '2023-07-04 09:53:50', '2023-07-04 09:53:50');
INSERT INTO `sys_function_of_controllers` VALUES (117, 'index', 60, NULL, '1', '2023-07-04 21:49:36', '2023-07-04 21:49:36');
INSERT INTO `sys_function_of_controllers` VALUES (118, 'ajax', 60, NULL, '2', '2023-07-04 21:49:40', '2023-07-04 21:49:40');
INSERT INTO `sys_function_of_controllers` VALUES (119, 'index', 61, NULL, '1', '2023-07-04 22:08:23', '2023-07-04 22:08:23');
INSERT INTO `sys_function_of_controllers` VALUES (120, 'ajax', 61, NULL, '2', '2023-07-04 22:08:26', '2023-07-04 22:08:26');
INSERT INTO `sys_function_of_controllers` VALUES (121, 'index', 62, NULL, '1', '2023-07-04 22:26:32', '2023-07-04 22:26:32');
INSERT INTO `sys_function_of_controllers` VALUES (122, 'ajax', 62, NULL, '2', '2023-07-04 22:26:35', '2023-07-04 22:26:35');
INSERT INTO `sys_function_of_controllers` VALUES (123, 'index', 63, NULL, '1', '2023-07-05 09:57:25', '2023-07-05 09:57:25');
INSERT INTO `sys_function_of_controllers` VALUES (124, 'ajax', 63, NULL, '2', '2023-07-05 09:57:28', '2023-07-05 09:57:28');
INSERT INTO `sys_function_of_controllers` VALUES (125, 'index', 64, NULL, '1', '2023-07-05 10:06:01', '2023-07-05 10:06:01');
INSERT INTO `sys_function_of_controllers` VALUES (126, 'ajax', 64, NULL, '2', '2023-07-05 10:06:04', '2023-07-05 10:06:04');
INSERT INTO `sys_function_of_controllers` VALUES (127, 'index', 65, NULL, '1', '2023-07-05 10:13:35', '2023-07-05 10:13:35');
INSERT INTO `sys_function_of_controllers` VALUES (128, 'ajax', 65, NULL, '2', '2023-07-05 10:13:38', '2023-07-05 10:13:38');
INSERT INTO `sys_function_of_controllers` VALUES (129, 'index', 66, NULL, '1', '2023-07-05 11:07:41', '2023-07-05 11:07:41');
INSERT INTO `sys_function_of_controllers` VALUES (130, 'ajax', 66, NULL, '2', '2023-07-05 11:07:47', '2023-07-05 11:07:47');
INSERT INTO `sys_function_of_controllers` VALUES (131, 'index', 67, NULL, '1', '2023-07-20 14:46:03', '2023-07-20 14:46:03');
INSERT INTO `sys_function_of_controllers` VALUES (132, 'index', 68, NULL, '1', '2023-07-20 14:46:10', '2023-07-20 14:46:10');
INSERT INTO `sys_function_of_controllers` VALUES (133, 'index', 69, NULL, '1', '2023-07-20 14:46:15', '2023-07-20 14:46:15');
INSERT INTO `sys_function_of_controllers` VALUES (134, 'ajax', 67, NULL, '2', '2023-07-20 14:55:14', '2023-07-20 14:55:14');
INSERT INTO `sys_function_of_controllers` VALUES (135, 'ajax', 68, NULL, '2', '2023-07-23 17:52:45', '2023-07-23 17:52:45');
INSERT INTO `sys_function_of_controllers` VALUES (136, 'index', 70, NULL, '1', '2023-07-23 21:41:24', '2023-07-23 21:41:24');
INSERT INTO `sys_function_of_controllers` VALUES (137, 'index', 71, NULL, '1', '2023-07-23 21:41:30', '2023-07-23 21:41:30');
INSERT INTO `sys_function_of_controllers` VALUES (138, 'ajax', 69, NULL, '2', '2023-07-23 21:45:13', '2023-07-23 21:45:13');
INSERT INTO `sys_function_of_controllers` VALUES (139, 'ajax', 70, NULL, '2', '2023-07-24 08:40:37', '2023-07-24 08:40:37');
INSERT INTO `sys_function_of_controllers` VALUES (140, 'index', 72, NULL, '1', '2023-07-24 09:16:17', '2023-07-24 09:16:17');
INSERT INTO `sys_function_of_controllers` VALUES (141, 'ajax', 72, NULL, '2', '2023-07-24 09:16:20', '2023-07-24 09:16:20');
INSERT INTO `sys_function_of_controllers` VALUES (142, 'index', 73, NULL, '1', '2023-07-24 09:36:22', '2023-07-24 09:36:22');
INSERT INTO `sys_function_of_controllers` VALUES (143, 'index', 74, NULL, '1', '2023-07-24 09:45:07', '2023-07-24 09:45:07');
INSERT INTO `sys_function_of_controllers` VALUES (144, 'index', 75, NULL, '1', '2023-07-24 09:45:13', '2023-07-24 09:45:13');
INSERT INTO `sys_function_of_controllers` VALUES (145, 'index', 76, NULL, '1', '2023-07-24 09:45:18', '2023-07-24 09:45:18');
INSERT INTO `sys_function_of_controllers` VALUES (146, 'index', 77, NULL, '1', '2023-07-24 09:45:24', '2023-07-24 09:45:24');
INSERT INTO `sys_function_of_controllers` VALUES (147, 'index', 78, NULL, '1', '2023-07-24 09:45:28', '2023-07-24 09:45:28');
INSERT INTO `sys_function_of_controllers` VALUES (148, 'index', 79, NULL, '1', '2023-07-24 09:45:34', '2023-07-24 09:45:34');
INSERT INTO `sys_function_of_controllers` VALUES (149, 'index', 80, NULL, '1', '2023-07-24 09:53:22', '2023-07-24 09:53:22');
INSERT INTO `sys_function_of_controllers` VALUES (150, 'index', 81, NULL, '1', '2023-07-24 09:53:30', '2023-07-24 09:53:30');
INSERT INTO `sys_function_of_controllers` VALUES (151, 'index', 82, NULL, '1', '2023-07-24 09:53:35', '2023-07-24 09:53:35');
INSERT INTO `sys_function_of_controllers` VALUES (152, 'index', 83, NULL, '1', '2023-07-24 09:53:40', '2023-07-24 09:53:40');
INSERT INTO `sys_function_of_controllers` VALUES (153, 'index', 84, NULL, '1', '2023-07-24 09:53:44', '2023-07-24 09:53:44');
INSERT INTO `sys_function_of_controllers` VALUES (154, 'index', 85, NULL, '1', '2023-07-24 09:53:48', '2023-07-24 09:53:48');
INSERT INTO `sys_function_of_controllers` VALUES (155, 'index', 86, NULL, '1', '2023-07-24 09:53:53', '2023-07-24 09:53:53');
INSERT INTO `sys_function_of_controllers` VALUES (156, 'index', 87, NULL, '1', '2023-07-24 10:06:18', '2023-07-24 10:06:18');
INSERT INTO `sys_function_of_controllers` VALUES (157, 'index', 88, NULL, '1', '2023-07-24 10:06:22', '2023-07-24 10:06:22');
INSERT INTO `sys_function_of_controllers` VALUES (158, 'index', 89, NULL, '1', '2023-07-24 10:06:26', '2023-07-24 10:06:26');
INSERT INTO `sys_function_of_controllers` VALUES (159, 'index', 90, NULL, '1', '2023-07-24 10:06:30', '2023-07-24 10:06:30');
INSERT INTO `sys_function_of_controllers` VALUES (160, 'index', 91, NULL, '1', '2023-07-24 10:06:35', '2023-07-24 10:06:35');
INSERT INTO `sys_function_of_controllers` VALUES (161, 'index', 93, NULL, '1', '2023-07-24 10:06:43', '2023-07-24 10:06:43');
INSERT INTO `sys_function_of_controllers` VALUES (162, 'index', 94, NULL, '1', '2023-07-24 10:06:52', '2023-07-24 10:06:52');
INSERT INTO `sys_function_of_controllers` VALUES (163, 'index', 95, NULL, '1', '2023-07-24 10:06:58', '2023-07-24 10:06:58');
INSERT INTO `sys_function_of_controllers` VALUES (164, 'index', 96, NULL, '1', '2023-07-24 10:07:03', '2023-07-24 10:07:03');
INSERT INTO `sys_function_of_controllers` VALUES (165, 'index', 92, NULL, '1', '2023-07-24 10:07:15', '2023-07-24 10:07:15');
INSERT INTO `sys_function_of_controllers` VALUES (166, 'ajax', 71, NULL, '2', '2023-07-24 10:11:45', '2023-07-24 10:11:45');
INSERT INTO `sys_function_of_controllers` VALUES (167, 'ajax', 74, NULL, '2', '2023-07-29 23:28:41', '2023-07-29 23:28:41');
INSERT INTO `sys_function_of_controllers` VALUES (168, 'ajax', 85, NULL, '2', '2023-08-01 10:49:05', '2023-08-01 10:49:05');
INSERT INTO `sys_function_of_controllers` VALUES (169, 'ajax', 73, NULL, '2', '2023-08-14 15:02:48', '2023-08-14 15:03:29');
INSERT INTO `sys_function_of_controllers` VALUES (170, 'ajaxFile', 73, NULL, '2', '2023-08-14 15:45:35', '2023-08-14 15:45:35');
INSERT INTO `sys_function_of_controllers` VALUES (171, 'ajaxEvent', 81, NULL, '2', '2023-08-16 14:52:31', '2023-09-28 09:03:36');
INSERT INTO `sys_function_of_controllers` VALUES (172, 'index', 97, NULL, '1', '2023-08-17 14:50:13', '2023-08-17 14:50:13');
INSERT INTO `sys_function_of_controllers` VALUES (173, 'ajax', 97, NULL, '2', '2023-08-17 15:03:00', '2023-08-17 15:03:00');
INSERT INTO `sys_function_of_controllers` VALUES (174, 'ajax', 82, NULL, '2', '2023-08-24 09:05:40', '2023-08-24 09:05:40');
INSERT INTO `sys_function_of_controllers` VALUES (175, 'ajax', 86, NULL, '2', '2023-08-24 10:14:17', '2023-08-24 10:14:17');
INSERT INTO `sys_function_of_controllers` VALUES (176, 'ajaxFile', 86, NULL, '2', '2023-08-24 10:14:27', '2023-08-24 10:14:27');
INSERT INTO `sys_function_of_controllers` VALUES (177, 'ajax', 76, NULL, '2', '2023-09-12 14:18:44', '2023-09-13 10:25:17');
INSERT INTO `sys_function_of_controllers` VALUES (178, 'ajaxPartial', 81, NULL, '2', '2023-09-28 08:53:09', '2023-09-28 08:53:09');
INSERT INTO `sys_function_of_controllers` VALUES (179, 'downloadTemplate', 52, NULL, '1', '2024-05-29 16:23:34', '2024-05-29 17:06:10');
INSERT INTO `sys_function_of_controllers` VALUES (180, 'index', 98, NULL, '1', '2024-06-04 17:01:25', '2024-06-04 17:01:25');
INSERT INTO `sys_function_of_controllers` VALUES (181, 'ajax', 98, NULL, '2', '2024-06-04 17:01:29', '2024-06-04 17:01:29');

-- ----------------------------
-- Table structure for sys_function_permissions_according_to_users
-- ----------------------------
DROP TABLE IF EXISTS `sys_function_permissions_according_to_users`;
CREATE TABLE `sys_function_permissions_according_to_users`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `function_permissions` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `action` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 25 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of sys_function_permissions_according_to_users
-- ----------------------------
INSERT INTO `sys_function_permissions_according_to_users` VALUES (1, 1, '100,200,300,301,302,400', 'view');
INSERT INTO `sys_function_permissions_according_to_users` VALUES (2, 1, '100,200,300,301,302,400', 'edit');
INSERT INTO `sys_function_permissions_according_to_users` VALUES (3, 1, '100,200,300,301,302,400', 'delete');
INSERT INTO `sys_function_permissions_according_to_users` VALUES (16, 2, '200,300,301,302,400', 'view');
INSERT INTO `sys_function_permissions_according_to_users` VALUES (17, 2, '200,300,301,302,400', 'edit');
INSERT INTO `sys_function_permissions_according_to_users` VALUES (18, 2, '200,300,301,302,400', 'delete');
INSERT INTO `sys_function_permissions_according_to_users` VALUES (19, 31, '100,200,300,301,302', 'view');
INSERT INTO `sys_function_permissions_according_to_users` VALUES (20, 31, '100,200,300,301,302', 'edit');
INSERT INTO `sys_function_permissions_according_to_users` VALUES (21, 31, '100,200,300,301,302', 'delete');
INSERT INTO `sys_function_permissions_according_to_users` VALUES (22, 32, '100,200,300', 'view');
INSERT INTO `sys_function_permissions_according_to_users` VALUES (23, 32, '100,200', 'edit');
INSERT INTO `sys_function_permissions_according_to_users` VALUES (24, 32, '100,200', 'delete');

-- ----------------------------
-- Table structure for sys_groups_modules
-- ----------------------------
DROP TABLE IF EXISTS `sys_groups_modules`;
CREATE TABLE `sys_groups_modules`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `order` int NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 21 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of sys_groups_modules
-- ----------------------------
INSERT INTO `sys_groups_modules` VALUES (14, 'Quản lý tuyển sinh', 3);
INSERT INTO `sys_groups_modules` VALUES (17, 'Danh mục', 0);
INSERT INTO `sys_groups_modules` VALUES (18, 'Quản lý nhân sự', 1);
INSERT INTO `sys_groups_modules` VALUES (19, 'Quản lý đào tạo', 2);
INSERT INTO `sys_groups_modules` VALUES (20, 'Báo cáo thống kê', 4);

-- ----------------------------
-- Table structure for sys_list_modules
-- ----------------------------
DROP TABLE IF EXISTS `sys_list_modules`;
CREATE TABLE `sys_list_modules`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `slug` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `path_controller` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `path_view` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `type` int NOT NULL COMMENT '1: Admin Interface;\r\n2: Guest Interface',
  `order` int NOT NULL DEFAULT 0,
  `id_group` int NOT NULL,
  `content_config` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `avatar` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `controller` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `description` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `active` int NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `foreign_key_module_group`(`id_group` ASC) USING BTREE,
  CONSTRAINT `sys_list_modules_ibfk_1` FOREIGN KEY (`id_group`) REFERENCES `sys_groups_modules` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE = InnoDB AUTO_INCREMENT = 100 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of sys_list_modules
-- ----------------------------
INSERT INTO `sys_list_modules` VALUES (52, 'Danh sách học viên', 'danh-sach-hoc-vien', 'Modules\\AIManageStudents\\AIManageStudentsController', 'modules.AIManageStudents', 1, 1, 14, NULL, '/upload/mainstructure/icon/module/AIManageStudents.png', '2023-06-27 10:22:40', '2023-07-24 10:01:39', 'AIManageStudents', NULL, 1);
INSERT INTO `sys_list_modules` VALUES (53, 'Danh mục dân tộc', 'danh-muc-dan-toc', 'Modules\\AITypeOfEthnics\\AITypeOfEthnicsController', 'modules.AITypeOfEthnics', 1, 1, 17, NULL, '/upload/mainstructure/icon/module/AITypeOfPeoples.png', '2023-06-29 15:53:25', '2023-07-20 14:47:46', 'AITypeOfEthnics', NULL, 1);
INSERT INTO `sys_list_modules` VALUES (54, 'Danh mục thành phần gia đình', 'danh-muc-thanh-phan-gia-dinh', 'Modules\\AITypeOfFamilyCompositions\\AITypeOfFamilyCompositionsController', 'modules.AITypeOfFamilyCompositions', 1, 2, 17, NULL, '/upload/mainstructure/icon/module/AITypeOfFamilyMembers.png', '2023-06-30 16:55:52', '2024-06-04 15:35:04', 'AITypeOfFamilyCompositions', NULL, 0);
INSERT INTO `sys_list_modules` VALUES (55, 'Danh mục tôn giáo', 'danh-muc-ton-giao', 'Modules\\AITypeOfReligions\\AITypeOfReligionsController', 'modules.AITypeOfReligions', 1, 3, 17, NULL, '/upload/mainstructure/icon/module/AITypeOfReligions.png', '2023-07-03 14:08:03', '2023-07-20 14:47:54', 'AITypeOfReligions', NULL, 1);
INSERT INTO `sys_list_modules` VALUES (56, 'Khóa học', 'khoa-hoc', 'Modules\\AITypeOfCourses\\AITypeOfCoursesController', 'modules.AITypeOfCourses', 1, 1, 19, NULL, '/upload/mainstructure/icon/module/AITypeOfCourses.png', '2023-07-03 14:42:01', '2024-06-04 15:35:58', 'AITypeOfCourses', NULL, 1);
INSERT INTO `sys_list_modules` VALUES (57, 'Danh mục đối tượng tuyển sinh / ưu tiên', 'danh-muc-doi-tuong-tuyen-sinh-uu-tien', 'Modules\\AITypeOfRecruitments\\AITypeOfRecruitmentsController', 'modules.AITypeOfRecruitments', 1, 6, 17, NULL, '/upload/mainstructure/icon/module/AITypeOfRecruitments.png', '2023-07-03 15:52:06', '2023-07-20 14:48:19', 'AITypeOfRecruitments', NULL, 1);
INSERT INTO `sys_list_modules` VALUES (58, 'Danh mục hình thức đào tạo', 'danh-muc-hinh-thuc-dao-tao', 'Modules\\AITypeOfTrainingForms\\AITypeOfTrainingFormsController', 'modules.AITypeOfTrainingForms', 1, 6, 17, NULL, '/upload/mainstructure/icon/module/AITypeOfTrainingForms.png', '2023-07-03 17:02:09', '2024-06-04 15:37:57', 'AITypeOfTrainingForms', NULL, 0);
INSERT INTO `sys_list_modules` VALUES (59, 'Danh mục chương trình đào tạo', 'danh-muc-chuong-trinh-dao-tao', 'Modules\\AITypeOfTrainingPrograms\\AITypeOfTrainingProgramsController', 'modules.AITypeOfTrainingPrograms', 1, 7, 17, NULL, '/upload/mainstructure/icon/module/AITypeOfTrainingPrograms.png', '2023-07-04 09:53:06', '2023-07-20 14:48:11', 'AITypeOfTrainingPrograms', NULL, 1);
INSERT INTO `sys_list_modules` VALUES (60, 'Danh mục hình thức tuyển dụng', 'danh-muc-hinh-thuc-tuyen-dung', 'Modules\\AITypeOfRecruitmentForms\\AITypeOfRecruitmentFormsController', 'modules.AITypeOfRecruitmentForms', 1, 8, 17, NULL, '/upload/mainstructure/icon/module/AITypeOfRecruitmentForms.png', '2023-07-04 21:49:21', '2023-08-02 10:56:51', 'AITypeOfRecruitmentForms', NULL, 0);
INSERT INTO `sys_list_modules` VALUES (61, 'Danh mục trình độ giảng dạy', 'danh-muc-trinh-do-giang-day', 'Modules\\AITypeOfTeachingLevels\\AITypeOfTeachingLevelsController', 'modules.AITypeOfTeachingLevels', 1, 9, 17, NULL, '/upload/mainstructure/icon/module/AITypeOfTeachingLevels.png', '2023-07-04 22:06:36', '2024-06-04 15:37:01', 'AITypeOfTeachingLevels', NULL, 0);
INSERT INTO `sys_list_modules` VALUES (62, 'Danh mục hệ đào tạo', 'danh-muc-he-dao-tao', 'Modules\\AITypeOfTrainingSubsystems\\AITypeOfTrainingSubsystemsController', 'modules.AITypeOfTrainingSubsystems', 1, 10, 17, NULL, '/upload/mainstructure/icon/module/AITypeOfTrainingSubsystems.png', '2023-07-04 22:24:10', '2024-06-04 15:37:11', 'AITypeOfTrainingSubsystems', NULL, 0);
INSERT INTO `sys_list_modules` VALUES (63, 'Danh mục chức vụ cán bộ', 'danh-muc-chuc-vu-can-bo', 'Modules\\AITypeOfOfficerTitles\\AITypeOfOfficerTitlesController', 'modules.AITypeOfOfficerTitles', 1, 11, 17, NULL, '/upload/mainstructure/icon/module/AITypeOfOfficerTitles.png', '2023-07-05 09:56:17', '2024-06-04 16:00:26', 'AITypeOfOfficerTitles', NULL, 0);
INSERT INTO `sys_list_modules` VALUES (64, 'Danh mục học kỳ', 'danh-muc-hoc-ky', 'Modules\\AITypeOfSemesters\\AITypeOfSemestersController', 'modules.AITypeOfSemesters', 1, 12, 17, NULL, '/upload/mainstructure/icon/module/AITypeOfSemesters.png', '2023-07-05 10:05:48', '2023-07-30 01:04:06', 'AITypeOfSemesters', NULL, 0);
INSERT INTO `sys_list_modules` VALUES (65, 'Danh mục bậc đào tạo', 'danh-muc-bac-dao-tao', 'Modules\\AITypeOfTrainingLevels\\AITypeOfTrainingLevelsController', 'modules.AITypeOfTrainingLevels', 1, 13, 17, NULL, '/upload/mainstructure/icon/module/AITypeOfTrainingLevels.png', '2023-07-05 10:13:10', '2024-06-04 15:37:21', 'AITypeOfTrainingLevels', NULL, 0);
INSERT INTO `sys_list_modules` VALUES (66, 'Thông tin cán bộ, giáo viên', 'thong-tin-can-bo-giao-vien', 'Modules\\AIOfficerInformations\\AIOfficerInformationsController', 'modules.AIOfficerInformations', 1, 1, 18, NULL, '/upload/mainstructure/icon/module/AIOfficerInformations.png', '2023-07-05 11:06:35', '2023-07-05 11:07:04', 'AIOfficerInformations', NULL, 1);
INSERT INTO `sys_list_modules` VALUES (67, 'Quá trình công tác', 'qua-trinh-cong-tac', 'Modules\\AIOfficerWorkProcess\\AIOfficerWorkProcessController', 'modules.AIOfficerWorkProcess', 1, 2, 18, NULL, '/upload/mainstructure/icon/module/AIOfficerWorkProcess.png', '2023-07-20 14:39:53', '2023-07-23 17:32:02', 'AIOfficerWorkProcess', NULL, 1);
INSERT INTO `sys_list_modules` VALUES (68, 'Quá trình đào tạo chuyên môn nghiệp vụ', 'qua-trinh-dao-tao-chuyen-mon-nghiep-vu', 'Modules\\AIOfficerProfessionalTrainingProcess\\AIOfficerProfessionalTrainingProcessController', 'modules.AIOfficerProfessionalTrainingProcess', 1, 3, 18, NULL, '/upload/mainstructure/icon/module/AIOfficerProfessionalTrainingProcess.png', '2023-07-20 14:43:51', '2023-07-23 21:37:10', 'AIOfficerProfessionalTrainingProcess', NULL, 1);
INSERT INTO `sys_list_modules` VALUES (69, 'Quá trình đánh giá xếp loại giáo viên', 'qua-trinh-danh-gia-xep-loai-giao-vien', 'Modules\\AIOfficerAssessmentProcess\\AIOfficerAssessmentProcessController', 'modules.AIOfficerAssessmentProcess', 1, 4, 18, NULL, '/upload/mainstructure/icon/module/AIOfficerAssessmentProcess.png', '2023-07-20 14:44:53', '2023-07-23 23:36:59', 'AIOfficerAssessmentProcess', NULL, 1);
INSERT INTO `sys_list_modules` VALUES (70, 'Danh mục khoa/phòng', 'danh-muc-khoaphong', 'Modules\\AITypeOfDepartments\\AITypeOfDepartmentsController', 'modules.AITypeOfDepartments', 1, 14, 17, NULL, '/upload/mainstructure/icon/module/AITypeOfDepartments.png', '2023-07-23 17:55:23', '2024-06-04 15:37:38', 'AITypeOfDepartments', NULL, 0);
INSERT INTO `sys_list_modules` VALUES (71, 'Danh mục tổ bộ môn', 'danh-muc-to-bo-mon', 'Modules\\AITypeOfSubjectTeams\\AITypeOfSubjectTeamsController', 'modules.AITypeOfSubjectTeams', 1, 15, 17, NULL, '/upload/mainstructure/icon/module/AITypeOfSubjectTeams.png', '2023-07-23 17:56:19', '2023-08-02 10:59:33', 'AITypeOfSubjectTeams', NULL, 0);
INSERT INTO `sys_list_modules` VALUES (72, 'Chính sách trong giáo dục nghề nghiệp', 'chinh-sach-trong-giao-duc-nghe-nghiep', 'Modules\\AIVocationalEducationPolicities\\AIVocationalEducationPolicitiesController', 'modules.AIVocationalEducationPolicities', 1, 5, 18, NULL, '/upload/mainstructure/icon/module/AIVocationalEducationPolicities.png', '2023-07-24 09:15:50', '2023-08-13 22:32:19', 'AIVocationalEducationPolicities', NULL, 1);
INSERT INTO `sys_list_modules` VALUES (73, 'Thông tin chương trình đào tạo', 'thong-tin-chuong-trinh-dao-tao', 'Modules\\AITrainingProgramInformations\\AITrainingProgramInformationsController', 'modules.AITrainingProgramInformations', 1, 4, 19, NULL, '/upload/mainstructure/icon/module/AITrainingProgramInformations.png', '2023-07-24 09:18:09', '2024-06-04 15:36:36', 'AITrainingProgramInformations', NULL, 1);
INSERT INTO `sys_list_modules` VALUES (74, 'Chuyên ngành đào tạo', 'chuyen-nganh-dao-tao', 'Modules\\AITrainingSpecialties\\AITrainingSpecialtiesController', 'modules.AITrainingSpecialties', 1, 0, 19, NULL, '/upload/mainstructure/icon/module/AITrainingSpecialties.png', '2023-07-24 09:36:55', '2024-06-04 15:36:07', 'AITrainingSpecialties', NULL, 1);
INSERT INTO `sys_list_modules` VALUES (75, 'Quản lý môn học', 'quan-ly-mon-hoc', 'Modules\\AITrainingSubjects\\AITrainingSubjectsController', 'modules.AITrainingSubjects', 1, 2, 19, NULL, NULL, '2023-07-24 09:38:14', '2023-08-02 10:56:40', 'AITrainingSubjects', NULL, 0);
INSERT INTO `sys_list_modules` VALUES (76, 'Phân công giảng dạy', 'phan-cong-giang-day', 'Modules\\AITeachingAssignment\\AITeachingAssignmentController', 'modules.AITeachingAssignment', 1, 4, 19, NULL, '/upload/mainstructure/icon/module/AITeachingAssignment.png', '2023-07-24 09:39:30', '2023-08-24 12:08:24', 'AITeachingAssignment', NULL, 1);
INSERT INTO `sys_list_modules` VALUES (77, 'Thông tin giáo trình đào tạo', 'thong-tin-giao-trinh-dao-tao', 'Modules\\AITrainingCurriculumInformations\\AITrainingCurriculumInformationsController', 'modules.AITrainingCurriculumInformations', 1, 5, 19, NULL, NULL, '2023-07-24 09:40:13', '2023-08-14 15:40:54', 'AITrainingCurriculumInformations', NULL, 0);
INSERT INTO `sys_list_modules` VALUES (78, 'Quản lý lớp dự thi', 'quan-ly-lop-du-thi', 'Modules\\AIExamClass\\AIExamClassController', 'modules.AIExamClass', 1, 6, 19, NULL, NULL, '2023-07-24 09:41:22', '2023-09-18 15:14:55', 'AIExamClass', NULL, 0);
INSERT INTO `sys_list_modules` VALUES (79, 'Quản lý sổ đầu bài', 'quan-ly-so-dau-bai', 'Modules\\AIManageHeadbooks\\AIManageHeadbooksController', 'modules.AIManageHeadbooks', 1, 7, 19, NULL, NULL, '2023-07-24 09:43:36', '2023-08-02 10:57:37', 'AIManageHeadbooks', NULL, 0);
INSERT INTO `sys_list_modules` VALUES (80, 'Quản lý chấm thi', 'quan-ly-cham-thi', 'Modules\\AIExaminationManagement\\AIExaminationManagementController', 'modules.AIExaminationManagement', 1, 8, 19, NULL, NULL, '2023-07-24 09:48:12', '2023-09-18 15:14:42', 'AIExaminationManagement', NULL, 0);
INSERT INTO `sys_list_modules` VALUES (81, 'Xét tiến độ', 'xet-tien-do', 'Modules\\AIReviewProcess\\AIReviewProcessController', 'modules.AIReviewProcess', 1, 9, 19, NULL, '/upload/mainstructure/icon/module/AIReviewProcess.png', '2023-07-24 09:49:21', '2024-02-01 01:51:17', 'AIReviewProcess', NULL, 0);
INSERT INTO `sys_list_modules` VALUES (82, 'Xét điều kiện dự thi tốt nghiệp', 'xet-dieu-kien-du-thi-tot-nghiep', 'Modules\\AIConsideringGraduationExamConditions\\AIConsideringGraduationExamConditionsController', 'modules.AIConsideringGraduationExamConditions', 1, 10, 19, NULL, '/upload/mainstructure/icon/module/AIConsideringGraduationExamConditions.png', '2023-07-24 09:50:02', '2023-08-24 10:13:34', 'AIConsideringGraduationExamConditions', NULL, 1);
INSERT INTO `sys_list_modules` VALUES (83, 'Xét tốt nghiệp', 'xet-tot-nghiep', 'Modules\\AIGraduationConsideration\\AIGraduationConsiderationController', 'modules.AIGraduationConsideration', 1, 11, 19, NULL, NULL, '2023-07-24 09:50:47', '2023-10-02 14:33:56', 'AIGraduationConsideration', NULL, 0);
INSERT INTO `sys_list_modules` VALUES (84, 'Thông tin môn thi tốt nghiệp', 'thong-tin-mon-thi-tot-nghiep', 'Modules\\AIGraduationExamInformation\\AIGraduationExamInformationController', 'modules.AIGraduationExamInformation', 1, 12, 19, NULL, NULL, '2023-07-24 09:51:33', '2023-08-02 10:57:57', 'AIGraduationExamInformation', NULL, 0);
INSERT INTO `sys_list_modules` VALUES (85, 'Thông tin điểm tốt nghiệp', 'thong-tin-diem-tot-nghiep', 'Modules\\AIGraduationScoreInformations\\AIGraduationScoreInformationsController', 'modules.AIGraduationScoreInformations', 1, 13, 19, NULL, '/upload/mainstructure/icon/module/AIGraduationScoreInformations.png', '2023-07-24 09:52:21', '2023-08-01 09:50:08', 'AIGraduationScoreInformations', NULL, 1);
INSERT INTO `sys_list_modules` VALUES (86, 'Danh sách cấp giấy chứng nhận', 'danh-sach-cap-giay-chung-nhan', 'Modules\\AICertificationList\\AICertificationListController', 'modules.AICertificationList', 1, 14, 19, NULL, '/upload/mainstructure/icon/module/AICertificationList.png', '2023-07-24 09:52:51', '2023-07-24 09:52:51', 'AICertificationList', NULL, 1);
INSERT INTO `sys_list_modules` VALUES (87, 'Quản lý đợt tuyển sinh', 'quan-ly-dot-tuyen-sinh', 'Modules\\AIManagementEnrollments\\AIManagementEnrollmentsController', 'modules.AIManagementEnrollments', 1, 2, 14, NULL, NULL, '2023-07-24 09:56:49', '2023-10-02 14:33:12', 'AIManagementEnrollments', NULL, 0);
INSERT INTO `sys_list_modules` VALUES (88, 'Quản lý tuyển sinh học viên mới', 'quan-ly-tuyen-sinh-hoc-vien-moi', 'Modules\\AIManagementEnrollmentNewStudents\\AIManagementEnrollmentNewStudentsController', 'modules.AIManagementEnrollmentNewStudents', 1, 3, 14, NULL, NULL, '2023-07-24 09:58:17', '2023-08-02 10:54:51', 'AIManagementEnrollmentNewStudents', NULL, 0);
INSERT INTO `sys_list_modules` VALUES (89, 'Quản lý tuyển sinh liên thông', 'quan-ly-tuyen-sinh-lien-thong', 'Modules\\AIManagementJointEnrollment \\AIManagementJointEnrollment Controller', 'modules.AIManagementJointEnrollment', 1, 4, 14, NULL, NULL, '2023-07-24 10:00:59', '2023-08-02 10:55:01', 'AIManagementJointEnrollment', NULL, 0);
INSERT INTO `sys_list_modules` VALUES (90, 'Bổ sung hồ sơ sinh viên', 'bo-sung-ho-so-sinh-vien', 'Modules\\AIAddStudentProfile\\AIAddStudentProfileController', 'modules.AIAddStudentProfile', 1, 5, 14, NULL, NULL, '2023-07-24 10:02:32', '2023-08-02 10:55:05', 'AIAddStudentProfile', NULL, 0);
INSERT INTO `sys_list_modules` VALUES (91, 'Lớp học', 'lop-hoc', 'Modules\\AIClass\\AIClassController', 'modules.AIClass', 1, 6, 14, NULL, NULL, '2023-07-24 10:02:49', '2023-08-02 10:55:22', 'AIClass', NULL, 0);
INSERT INTO `sys_list_modules` VALUES (92, 'Sắp lớp', 'sap-lop', 'Modules\\AIClassArrangement\\AIClassArrangementController', 'modules.AIClassArrangement', 1, 7, 14, NULL, NULL, '2023-07-24 10:03:22', '2023-08-02 10:55:28', 'AIClassArrangement', NULL, 0);
INSERT INTO `sys_list_modules` VALUES (93, 'Xét thi đua', 'xet-thi-dua', 'Modules\\AIExaminingCompetition\\AIExaminingCompetitionController', 'modules.AIExaminingCompetition', 1, 8, 14, NULL, NULL, '2023-07-24 10:03:49', '2023-10-02 14:33:20', 'AIExaminingCompetition', NULL, 0);
INSERT INTO `sys_list_modules` VALUES (94, 'Thống kê tổng hợp', 'thong-ke-tong-hop', 'Modules\\AIIntegratedStatistics\\AIIntegratedStatisticsController', 'modules.AIIntegratedStatistics', 1, 1, 20, NULL, '/upload/mainstructure/icon/module/AIIntegratedStatistics.png', '2023-07-24 10:04:46', '2023-08-16 10:23:55', 'AIIntegratedStatistics', NULL, 1);
INSERT INTO `sys_list_modules` VALUES (95, 'Báo cáo thông tin dạy nghề', 'bao-cao-thong-tin-day-nghe', 'Modules\\AIVocationalTrainingInformationReport\\AIVocationalTrainingInformationReportController', 'modules.AIVocationalTrainingInformationReport', 1, 2, 20, NULL, NULL, '2023-07-24 10:05:30', '2023-10-02 14:33:32', 'AIVocationalTrainingInformationReport', NULL, 0);
INSERT INTO `sys_list_modules` VALUES (96, 'Báo cáo học sinh sinh viên', 'bao-cao-hoc-sinh-sinh-vien', 'Modules\\AIStudentReport\\AIStudentReportController', 'modules.AIStudentReport', 1, 3, 20, NULL, NULL, '2023-07-24 10:05:59', '2023-10-02 14:33:43', 'AIStudentReport', NULL, 0);
INSERT INTO `sys_list_modules` VALUES (97, 'Quản lý điểm danh', 'quan-ly-diem-danh', 'Modules\\AIAttendance\\AIAttendanceController', 'modules.AIAttendance', 1, 2, 19, NULL, '/upload/mainstructure/icon/module/AIAttendance.png', '2023-08-17 14:50:00', '2023-08-17 16:27:51', 'AIAttendance', NULL, 1);
INSERT INTO `sys_list_modules` VALUES (98, 'In văn bản', 'in-van-ban', 'Modules\\AIPrintDocuments\\AIPrintDocumentsController', 'modules.AIPrintDocuments', 1, 1, 20, NULL, '/upload/mainstructure/icon/module/AIPrintDocuments.png', '2024-06-04 17:00:44', '2024-06-04 17:00:44', 'AIPrintDocuments', NULL, 1);
INSERT INTO `sys_list_modules` VALUES (99, 'Danh mục nguyện vọng việc làm', 'danh-muc-nguyen-vong-viec-lam', 'Modules\\AIEmploymentWishes\\AIEmploymentWishesController', 'modules.AIEmploymentWishes', 1, 5, 17, NULL, '/upload/mainstructure/icon/module/AIEmploymentWishes.png', '2024-06-04 17:25:07', '2024-06-04 17:25:07', 'AIEmploymentWishes', NULL, 1);

-- ----------------------------
-- Table structure for sys_logs
-- ----------------------------
DROP TABLE IF EXISTS `sys_logs`;
CREATE TABLE `sys_logs`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `module` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `action` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `user_id` int UNSIGNED NOT NULL,
  `detail` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `user_id`(`user_id` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1527 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of sys_logs
-- ----------------------------
INSERT INTO `sys_logs` VALUES (1491, 'AIManageStudents', 'Xoá', 31, 'Thông tin học viên: Nguyễn Văn A1', '2024-06-03 16:34:41', '2024-06-03 16:34:41');
INSERT INTO `sys_logs` VALUES (1492, 'AIManageStudents', 'Xoá', 31, 'Thông tin học viên: Nguyễn Văn A2', '2024-06-03 16:46:54', '2024-06-03 16:46:54');
INSERT INTO `sys_logs` VALUES (1493, 'AIManageStudents', 'Xoá', 31, 'Thông tin học viên: Nguyễn Văn A3', '2024-06-03 16:47:39', '2024-06-03 16:47:39');
INSERT INTO `sys_logs` VALUES (1494, 'AIManageStudents', 'Xoá', 31, 'Thông tin học viên: Nguyễn Văn A3', '2024-06-03 16:50:30', '2024-06-03 16:50:30');
INSERT INTO `sys_logs` VALUES (1495, 'AIManageStudents', 'Xoá', 31, 'Thông tin học viên: Nguyễn Văn A2', '2024-06-03 16:50:34', '2024-06-03 16:50:34');
INSERT INTO `sys_logs` VALUES (1496, 'AIManageStudents', 'Xoá', 31, 'Thông tin học viên: Nguyễn Văn A1', '2024-06-03 16:51:03', '2024-06-03 16:51:03');
INSERT INTO `sys_logs` VALUES (1497, 'AIManageStudents', 'Thêm', 31, 'Thông tin học viên: adssdaads', '2024-06-03 17:08:23', '2024-06-03 17:08:23');
INSERT INTO `sys_logs` VALUES (1498, 'AIManageStudents', 'Thêm', 31, 'Thông tin học viên: adasads', '2024-06-03 17:08:48', '2024-06-03 17:08:48');
INSERT INTO `sys_logs` VALUES (1499, 'Đăng nhập', 'Đăng nhập', 31, '', '2024-06-04 10:01:14', '2024-06-04 10:01:14');
INSERT INTO `sys_logs` VALUES (1500, 'Đăng nhập', 'Đăng nhập', 31, '', '2024-06-04 14:38:48', '2024-06-04 14:38:48');
INSERT INTO `sys_logs` VALUES (1501, 'Đăng nhập', 'Đăng nhập', 31, '', '2024-06-04 14:38:51', '2024-06-04 14:38:51');
INSERT INTO `sys_logs` VALUES (1502, 'AIManageStudents', 'Thêm', 31, 'Thông tin học viên: test', '2024-06-04 15:04:17', '2024-06-04 15:04:17');
INSERT INTO `sys_logs` VALUES (1503, 'AIManageStudents', 'Thêm', 31, 'Thông tin học viên: dsasaddsa', '2024-06-04 15:11:23', '2024-06-04 15:11:23');
INSERT INTO `sys_logs` VALUES (1504, 'AIManageStudents', 'Sửa', 31, 'Thông tin học viên: adasads111', '2024-06-04 15:11:30', '2024-06-04 15:11:30');
INSERT INTO `sys_logs` VALUES (1505, 'AIManageStudents', 'Sửa', 31, 'Thông tin học viên: adasads111', '2024-06-04 15:17:39', '2024-06-04 15:17:39');
INSERT INTO `sys_logs` VALUES (1506, 'AIManageStudents', 'Sửa', 31, 'Thông tin học viên: adasads111', '2024-06-04 15:19:03', '2024-06-04 15:19:03');
INSERT INTO `sys_logs` VALUES (1507, 'AIManageStudents', 'Xoá', 31, 'Thông tin học viên: adasads111', '2024-06-04 15:39:32', '2024-06-04 15:39:32');
INSERT INTO `sys_logs` VALUES (1508, 'AIManageStudents', 'Xoá', 31, 'Thông tin học viên: test', '2024-06-04 15:39:35', '2024-06-04 15:39:35');
INSERT INTO `sys_logs` VALUES (1509, 'AIManageStudents', 'Xoá', 31, 'Thông tin học viên: dsasaddsa', '2024-06-04 15:39:37', '2024-06-04 15:39:37');
INSERT INTO `sys_logs` VALUES (1510, 'AITypeOfCourses', 'Xoá', 31, 'Khóa học: 1', '2024-06-04 15:39:44', '2024-06-04 15:39:44');
INSERT INTO `sys_logs` VALUES (1511, 'Đăng nhập', 'Đăng nhập', 31, '', '2024-06-05 09:19:11', '2024-06-05 09:19:11');
INSERT INTO `sys_logs` VALUES (1512, 'Đăng nhập', 'Đăng nhập', 31, '', '2024-06-05 14:50:56', '2024-06-05 14:50:56');
INSERT INTO `sys_logs` VALUES (1513, 'Đăng nhập', 'Đăng nhập', 31, '', '2024-06-06 14:25:10', '2024-06-06 14:25:10');
INSERT INTO `sys_logs` VALUES (1514, 'Đăng nhập', 'Đăng nhập', 31, '', '2024-06-10 09:51:36', '2024-06-10 09:51:36');
INSERT INTO `sys_logs` VALUES (1515, 'Đăng nhập', 'Đăng nhập', 31, '', '2024-06-10 09:54:49', '2024-06-10 09:54:49');
INSERT INTO `sys_logs` VALUES (1516, 'Đăng nhập', 'Đăng nhập', 31, '', '2024-06-10 10:18:26', '2024-06-10 10:18:26');
INSERT INTO `sys_logs` VALUES (1517, 'Đăng nhập', 'Đăng nhập', 31, '', '2024-06-10 10:32:14', '2024-06-10 10:32:14');
INSERT INTO `sys_logs` VALUES (1518, 'Đăng nhập', 'Đăng nhập', 31, '', '2024-06-10 10:41:27', '2024-06-10 10:41:27');
INSERT INTO `sys_logs` VALUES (1519, 'Đăng nhập', 'Đăng nhập', 31, '', '2024-06-10 15:12:22', '2024-06-10 15:12:22');
INSERT INTO `sys_logs` VALUES (1520, 'Đăng nhập', 'Đăng nhập', 31, '', '2024-06-10 15:15:44', '2024-06-10 15:15:44');
INSERT INTO `sys_logs` VALUES (1521, 'Đăng nhập', 'Đăng nhập', 31, '', '2024-06-10 15:35:28', '2024-06-10 15:35:28');
INSERT INTO `sys_logs` VALUES (1522, 'Đăng nhập', 'Đăng nhập', 31, '', '2024-06-12 11:03:59', '2024-06-12 11:03:59');
INSERT INTO `sys_logs` VALUES (1523, 'Đăng nhập', 'Đăng nhập', 31, '', '2024-06-13 17:13:03', '2024-06-13 17:13:03');
INSERT INTO `sys_logs` VALUES (1524, 'Đăng nhập', 'Đăng nhập', 31, '', '2024-06-14 08:35:28', '2024-06-14 08:35:28');
INSERT INTO `sys_logs` VALUES (1525, 'Đăng nhập', 'Đăng nhập', 31, '', '2024-06-14 13:32:22', '2024-06-14 13:32:22');
INSERT INTO `sys_logs` VALUES (1526, 'Đăng nhập', 'Đăng nhập', 31, '', '2024-06-14 13:33:42', '2024-06-14 13:33:42');

-- ----------------------------
-- Table structure for sys_module_permissions_according_to_users
-- ----------------------------
DROP TABLE IF EXISTS `sys_module_permissions_according_to_users`;
CREATE TABLE `sys_module_permissions_according_to_users`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `module_permissions` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `action` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'view, edit, delete',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 76 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of sys_module_permissions_according_to_users
-- ----------------------------
INSERT INTO `sys_module_permissions_according_to_users` VALUES (1, 1, '', '');
INSERT INTO `sys_module_permissions_according_to_users` VALUES (64, 2, '74,53,54,55,56,57,58,59,61,62,63,65,70,66,67,68,69,72,73,97,76,78,80,81,82,83,85,86,52,87,93,94,95,96', 'view');
INSERT INTO `sys_module_permissions_according_to_users` VALUES (65, 2, '74,53,54,55,56,57,58,59,61,62,63,65,70,66,67,68,69,72,73,97,76,78,80,81,82,83,85,86,52,87,93,94,95,96', 'add');
INSERT INTO `sys_module_permissions_according_to_users` VALUES (66, 2, '74,53,54,55,56,57,58,59,61,62,63,65,70,66,67,68,69,72,73,97,76,78,80,81,82,83,85,86,52,87,93,94,95,96', 'edit');
INSERT INTO `sys_module_permissions_according_to_users` VALUES (67, 2, '74,53,54,55,56,57,58,59,61,62,63,65,70,66,67,68,69,72,73,97,76,78,80,81,82,83,85,86,52,87,93,94,95,96', 'delete');
INSERT INTO `sys_module_permissions_according_to_users` VALUES (68, 31, '53,55,57,59,66,67,68,69,72,74,56,97,73,76,82,85,86,52,94,98', 'view');
INSERT INTO `sys_module_permissions_according_to_users` VALUES (69, 31, '53,55,57,59,66,67,68,69,72,74,56,97,73,76,82,85,86,52,94,98', 'add');
INSERT INTO `sys_module_permissions_according_to_users` VALUES (70, 31, '53,55,57,59,66,67,68,69,72,74,56,97,73,76,82,85,86,52,94,98', 'edit');
INSERT INTO `sys_module_permissions_according_to_users` VALUES (71, 31, '53,55,57,59,66,67,68,69,72,74,56,97,73,76,82,85,86,52,94', 'delete');
INSERT INTO `sys_module_permissions_according_to_users` VALUES (72, 32, '74,53,54,55,66', 'view');
INSERT INTO `sys_module_permissions_according_to_users` VALUES (73, 32, '74', 'add');
INSERT INTO `sys_module_permissions_according_to_users` VALUES (74, 32, NULL, 'edit');
INSERT INTO `sys_module_permissions_according_to_users` VALUES (75, 32, NULL, 'delete');

-- ----------------------------
-- Table structure for sys_sites
-- ----------------------------
DROP TABLE IF EXISTS `sys_sites`;
CREATE TABLE `sys_sites`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `is_active` bit(1) NOT NULL,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `address` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `email` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `numberphone` varchar(11) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `domain_1` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `domain_2` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `folder_for_save` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `storage` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `till_the_time` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `theme` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `note` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `logo` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 26 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of sys_sites
-- ----------------------------
INSERT INTO `sys_sites` VALUES (25, b'1', 'Trung tâm GDNN - GDTX Châu Thành', NULL, NULL, NULL, NULL, NULL, 'cth', '1500', NULL, '1', NULL, NULL);

-- ----------------------------
-- Table structure for sys_themes
-- ----------------------------
DROP TABLE IF EXISTS `sys_themes`;
CREATE TABLE `sys_themes`  (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `code` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of sys_themes
-- ----------------------------
INSERT INTO `sys_themes` VALUES (1, 'Mặc định', 'default');
INSERT INTO `sys_themes` VALUES (2, 'Test', 'test');

-- ----------------------------
-- Table structure for sys_website_information
-- ----------------------------
DROP TABLE IF EXISTS `sys_website_information`;
CREATE TABLE `sys_website_information`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `address` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '',
  `logo` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `numberphone` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '',
  `fax` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '',
  `email` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '',
  `hotline` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `bussiness_code` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `color_gradient` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `color_background` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `color_font` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `color_font_hover` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `color_font_focus` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `meta_title` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `meta_description` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `keywords` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `author` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `country` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `meta_dc_title` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `meta_geo_region` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `meta_geo_placename` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `meta_geo_position` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `meta_icbm` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of sys_website_information
-- ----------------------------
INSERT INTO `sys_website_information` VALUES (1, 'TRUNG TÂM GDNN - GDTX HUYỆN CHÂU THÀNH', 'Châu Thành - Sóc Trăng', '/upload/mainstructure/logo/VNPT_Logo.svg.png', NULL, NULL, NULL, NULL, NULL, 'linear-gradient(45deg, #ffbd00, #ff3800)', '#d06800', '#d06800', 'red', 'red', 'Tiêu đề (meta_title):', 'sda', 'keywords', 'author', 'country', NULL, NULL, NULL, NULL, NULL);

SET FOREIGN_KEY_CHECKS = 1;
