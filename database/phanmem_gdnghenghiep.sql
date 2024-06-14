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

 Date: 04/06/2024 15:38:42
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
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = COMPACT;

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
) ENGINE = InnoDB AUTO_INCREMENT = 33 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = COMPACT;

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
  `id_training_specialty` int NOT NULL,
  `id_course` int NOT NULL,
  `attendance` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `id_student`(`id_student` ASC) USING BTREE,
  INDEX `id_training_specialty`(`id_training_specialty` ASC) USING BTREE,
  INDEX `id_course`(`id_course` ASC) USING BTREE,
  CONSTRAINT `module_attendances_ibfk_1` FOREIGN KEY (`id_training_specialty`) REFERENCES `module_training_specialties` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `module_attendances_ibfk_2` FOREIGN KEY (`id_course`) REFERENCES `module_type_of_courses` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `module_attendances_ibfk_3` FOREIGN KEY (`id_student`) REFERENCES `module_manage_students` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE = InnoDB AUTO_INCREMENT = 205 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = COMPACT;

-- ----------------------------
-- Records of module_attendances
-- ----------------------------
INSERT INTO `module_attendances` VALUES (135, 25, 199, 23, 25, '0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0', '2024-05-07 09:20:04', '2024-05-07 09:20:04');
INSERT INTO `module_attendances` VALUES (136, 25, 200, 23, 25, '0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0', '2024-05-07 13:17:18', '2024-05-07 13:17:18');
INSERT INTO `module_attendances` VALUES (137, 25, 201, 23, 25, '0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0', '2024-05-07 13:24:49', '2024-05-07 13:24:49');
INSERT INTO `module_attendances` VALUES (138, 25, 202, 23, 25, '0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0', '2024-05-07 13:26:46', '2024-05-07 13:26:46');
INSERT INTO `module_attendances` VALUES (139, 25, 203, 23, 25, '0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0', '2024-05-07 13:28:41', '2024-05-07 13:28:41');
INSERT INTO `module_attendances` VALUES (140, 25, 204, 23, 25, '0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0', '2024-05-07 13:30:18', '2024-05-07 13:30:18');
INSERT INTO `module_attendances` VALUES (141, 25, 205, 23, 25, '0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0', '2024-05-07 13:32:16', '2024-05-07 13:32:16');
INSERT INTO `module_attendances` VALUES (142, 25, 206, 23, 25, '0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0', '2024-05-07 13:34:18', '2024-05-07 13:34:18');
INSERT INTO `module_attendances` VALUES (143, 25, 207, 23, 25, '0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0', '2024-05-07 13:41:36', '2024-05-07 13:41:36');
INSERT INTO `module_attendances` VALUES (144, 25, 208, 23, 25, '0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0', '2024-05-07 13:43:04', '2024-05-07 13:43:04');
INSERT INTO `module_attendances` VALUES (145, 25, 209, 23, 25, '0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0', '2024-05-07 13:44:52', '2024-05-07 13:44:52');
INSERT INTO `module_attendances` VALUES (146, 25, 210, 23, 25, '0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0', '2024-05-07 13:46:39', '2024-05-07 13:46:39');
INSERT INTO `module_attendances` VALUES (147, 25, 211, 23, 25, '0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0', '2024-05-07 13:48:24', '2024-05-07 13:48:24');
INSERT INTO `module_attendances` VALUES (148, 25, 212, 23, 25, '0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0', '2024-05-07 13:50:12', '2024-05-07 13:50:12');
INSERT INTO `module_attendances` VALUES (149, 25, 213, 23, 25, '0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0', '2024-05-07 13:52:09', '2024-05-07 13:52:09');
INSERT INTO `module_attendances` VALUES (150, 25, 214, 23, 25, '0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0', '2024-05-07 14:08:33', '2024-05-07 14:08:33');
INSERT INTO `module_attendances` VALUES (151, 25, 215, 23, 25, '0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0', '2024-05-07 14:10:08', '2024-05-07 14:10:08');
INSERT INTO `module_attendances` VALUES (152, 25, 216, 23, 25, '0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0', '2024-05-07 14:14:08', '2024-05-07 14:14:08');
INSERT INTO `module_attendances` VALUES (153, 25, 217, 20, 26, '0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0', '2024-05-15 09:37:17', '2024-05-15 09:37:17');
INSERT INTO `module_attendances` VALUES (154, 25, 218, 20, 26, '0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0', '2024-05-15 09:39:39', '2024-05-15 09:39:39');
INSERT INTO `module_attendances` VALUES (155, 25, 219, 20, 26, '0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0', '2024-05-15 09:41:18', '2024-05-15 09:41:18');
INSERT INTO `module_attendances` VALUES (156, 25, 220, 20, 26, '0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0', '2024-05-15 09:43:37', '2024-05-15 09:43:37');
INSERT INTO `module_attendances` VALUES (157, 25, 221, 20, 26, '0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0', '2024-05-15 09:45:04', '2024-05-15 09:45:04');
INSERT INTO `module_attendances` VALUES (158, 25, 222, 20, 26, '0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0', '2024-05-15 09:49:07', '2024-05-15 09:49:07');
INSERT INTO `module_attendances` VALUES (159, 25, 223, 20, 26, '0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0', '2024-05-15 09:52:24', '2024-05-15 09:52:24');
INSERT INTO `module_attendances` VALUES (160, 25, 224, 20, 26, '0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0', '2024-05-15 09:54:16', '2024-05-15 09:54:16');
INSERT INTO `module_attendances` VALUES (161, 25, 225, 20, 26, '0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0', '2024-05-15 09:56:58', '2024-05-15 09:56:58');
INSERT INTO `module_attendances` VALUES (162, 25, 226, 20, 26, '0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0', '2024-05-15 09:59:41', '2024-05-15 09:59:41');
INSERT INTO `module_attendances` VALUES (163, 25, 227, 20, 26, '0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0', '2024-05-15 10:01:05', '2024-05-15 10:01:05');
INSERT INTO `module_attendances` VALUES (164, 25, 228, 20, 26, '0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0', '2024-05-15 10:02:38', '2024-05-15 10:02:38');
INSERT INTO `module_attendances` VALUES (165, 25, 229, 20, 26, '0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0', '2024-05-15 10:05:26', '2024-05-15 10:05:26');
INSERT INTO `module_attendances` VALUES (166, 25, 230, 20, 26, '0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0', '2024-05-15 10:06:46', '2024-05-15 10:06:46');
INSERT INTO `module_attendances` VALUES (168, 25, 232, 20, 26, '0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0', '2024-05-15 10:11:57', '2024-05-15 10:11:57');
INSERT INTO `module_attendances` VALUES (169, 25, 233, 31, 27, '0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0', '2024-05-20 08:51:14', '2024-05-20 08:51:14');
INSERT INTO `module_attendances` VALUES (170, 25, 234, 31, 27, '0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0', '2024-05-20 08:52:33', '2024-05-20 08:52:33');
INSERT INTO `module_attendances` VALUES (171, 25, 235, 31, 27, '0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0', '2024-05-20 08:53:41', '2024-05-20 08:53:41');
INSERT INTO `module_attendances` VALUES (172, 25, 236, 31, 27, '0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0', '2024-05-20 08:55:59', '2024-05-20 08:55:59');
INSERT INTO `module_attendances` VALUES (173, 25, 237, 31, 27, '0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0', '2024-05-20 08:57:45', '2024-05-20 08:57:45');
INSERT INTO `module_attendances` VALUES (174, 25, 238, 31, 27, '0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0', '2024-05-20 08:59:20', '2024-05-20 08:59:20');
INSERT INTO `module_attendances` VALUES (175, 25, 239, 31, 27, '0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0', '2024-05-20 09:00:14', '2024-05-20 09:00:14');
INSERT INTO `module_attendances` VALUES (176, 25, 240, 31, 27, '0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0', '2024-05-20 09:02:41', '2024-05-20 09:02:41');
INSERT INTO `module_attendances` VALUES (177, 25, 241, 31, 27, '0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0', '2024-05-20 09:03:55', '2024-05-20 09:03:55');
INSERT INTO `module_attendances` VALUES (178, 25, 242, 31, 27, '0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0', '2024-05-20 09:05:12', '2024-05-20 09:05:12');
INSERT INTO `module_attendances` VALUES (179, 25, 243, 31, 27, '0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0', '2024-05-20 09:08:45', '2024-05-20 09:08:45');
INSERT INTO `module_attendances` VALUES (180, 25, 244, 31, 27, '0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0', '2024-05-20 09:10:03', '2024-05-20 09:10:03');
INSERT INTO `module_attendances` VALUES (181, 25, 245, 31, 27, '0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0', '2024-05-20 09:11:55', '2024-05-20 09:11:55');
INSERT INTO `module_attendances` VALUES (182, 25, 246, 31, 27, '0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0', '2024-05-20 09:13:04', '2024-05-20 09:13:04');
INSERT INTO `module_attendances` VALUES (183, 25, 247, 31, 27, '0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0', '2024-05-20 09:15:39', '2024-05-20 09:15:39');
INSERT INTO `module_attendances` VALUES (184, 25, 248, 31, 27, '0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0', '2024-05-20 09:24:29', '2024-05-20 09:24:29');
INSERT INTO `module_attendances` VALUES (185, 25, 249, 31, 27, '0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0', '2024-05-20 09:26:22', '2024-05-20 09:26:22');
INSERT INTO `module_attendances` VALUES (186, 25, 250, 31, 27, '0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0', '2024-05-20 09:27:36', '2024-05-20 09:27:36');
INSERT INTO `module_attendances` VALUES (187, 25, 251, 20, 28, '0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0', '2024-05-28 14:56:28', '2024-05-28 14:56:28');
INSERT INTO `module_attendances` VALUES (188, 25, 252, 20, 28, '0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0', '2024-05-28 15:02:40', '2024-05-28 15:02:40');
INSERT INTO `module_attendances` VALUES (189, 25, 253, 20, 28, '0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0', '2024-05-28 15:08:31', '2024-05-28 15:08:31');
INSERT INTO `module_attendances` VALUES (190, 25, 254, 20, 28, '0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0', '2024-05-28 15:11:48', '2024-05-28 15:11:48');
INSERT INTO `module_attendances` VALUES (191, 25, 255, 20, 28, '0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0', '2024-05-28 15:15:35', '2024-05-28 15:15:35');
INSERT INTO `module_attendances` VALUES (192, 25, 256, 20, 28, '0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0', '2024-05-28 15:24:00', '2024-05-28 15:24:00');
INSERT INTO `module_attendances` VALUES (193, 25, 257, 20, 28, '0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0', '2024-05-28 15:25:38', '2024-05-28 15:25:38');
INSERT INTO `module_attendances` VALUES (194, 25, 258, 20, 28, '0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0', '2024-05-28 15:28:55', '2024-05-28 15:28:55');
INSERT INTO `module_attendances` VALUES (195, 25, 259, 20, 28, '0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0', '2024-05-28 15:30:52', '2024-05-28 15:30:52');
INSERT INTO `module_attendances` VALUES (196, 25, 260, 20, 28, '0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0', '2024-05-28 15:35:04', '2024-05-28 15:35:04');
INSERT INTO `module_attendances` VALUES (197, 25, 261, 20, 28, '0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0', '2024-05-28 15:37:06', '2024-05-28 15:37:06');
INSERT INTO `module_attendances` VALUES (198, 25, 262, 20, 28, '0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0', '2024-05-28 15:38:49', '2024-05-28 15:38:49');
INSERT INTO `module_attendances` VALUES (199, 25, 263, 20, 28, '0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0', '2024-05-28 15:48:07', '2024-05-28 15:48:07');
INSERT INTO `module_attendances` VALUES (200, 25, 264, 20, 28, '0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0', '2024-05-28 16:06:21', '2024-05-28 16:06:21');
INSERT INTO `module_attendances` VALUES (201, 25, 265, 20, 28, '0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0', '2024-05-28 16:09:53', '2024-05-28 16:09:53');
INSERT INTO `module_attendances` VALUES (202, 25, 266, 20, 28, '0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0', '2024-05-28 16:12:51', '2024-05-28 16:12:51');
INSERT INTO `module_attendances` VALUES (203, 25, 267, 20, 28, '0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0', '2024-05-28 16:14:33', '2024-05-28 16:14:33');
INSERT INTO `module_attendances` VALUES (204, 25, 268, 20, 28, '0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0', '2024-05-28 16:16:00', '2024-05-28 16:16:00');

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
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = COMPACT;

-- ----------------------------
-- Records of module_certification_lists
-- ----------------------------

-- ----------------------------
-- Table structure for module_graduation_score_informations
-- ----------------------------
DROP TABLE IF EXISTS `module_graduation_score_informations`;
CREATE TABLE `module_graduation_score_informations`  (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `id_site` int NOT NULL,
  `id_student` int NOT NULL,
  `id_training_specialty` int NOT NULL,
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
  INDEX `id_training_specialty`(`id_training_specialty` ASC) USING BTREE,
  INDEX `id_course`(`id_course` ASC) USING BTREE,
  CONSTRAINT `module_graduation_score_informations_ibfk_1` FOREIGN KEY (`id_training_specialty`) REFERENCES `module_training_specialties` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `module_graduation_score_informations_ibfk_2` FOREIGN KEY (`id_course`) REFERENCES `module_type_of_courses` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `module_graduation_score_informations_ibfk_3` FOREIGN KEY (`id_student`) REFERENCES `module_manage_students` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE = InnoDB AUTO_INCREMENT = 185 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = COMPACT;

-- ----------------------------
-- Records of module_graduation_score_informations
-- ----------------------------
INSERT INTO `module_graduation_score_informations` VALUES (115, 25, 199, 23, 25, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-05-07 09:20:04', '2024-05-07 09:20:04');
INSERT INTO `module_graduation_score_informations` VALUES (116, 25, 200, 23, 25, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-05-07 13:17:18', '2024-05-07 13:17:18');
INSERT INTO `module_graduation_score_informations` VALUES (117, 25, 201, 23, 25, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-05-07 13:24:49', '2024-05-07 13:24:49');
INSERT INTO `module_graduation_score_informations` VALUES (118, 25, 202, 23, 25, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-05-07 13:26:46', '2024-05-07 13:26:46');
INSERT INTO `module_graduation_score_informations` VALUES (119, 25, 203, 23, 25, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-05-07 13:28:41', '2024-05-07 13:28:41');
INSERT INTO `module_graduation_score_informations` VALUES (120, 25, 204, 23, 25, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-05-07 13:30:18', '2024-05-07 13:30:18');
INSERT INTO `module_graduation_score_informations` VALUES (121, 25, 205, 23, 25, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-05-07 13:32:16', '2024-05-07 13:32:16');
INSERT INTO `module_graduation_score_informations` VALUES (122, 25, 206, 23, 25, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-05-07 13:34:18', '2024-05-07 13:34:18');
INSERT INTO `module_graduation_score_informations` VALUES (123, 25, 207, 23, 25, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-05-07 13:41:36', '2024-05-07 13:41:36');
INSERT INTO `module_graduation_score_informations` VALUES (124, 25, 208, 23, 25, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-05-07 13:43:04', '2024-05-07 13:43:04');
INSERT INTO `module_graduation_score_informations` VALUES (125, 25, 209, 23, 25, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-05-07 13:44:52', '2024-05-07 13:44:52');
INSERT INTO `module_graduation_score_informations` VALUES (126, 25, 210, 23, 25, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-05-07 13:46:39', '2024-05-07 13:46:39');
INSERT INTO `module_graduation_score_informations` VALUES (127, 25, 211, 23, 25, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-05-07 13:48:24', '2024-05-07 13:48:24');
INSERT INTO `module_graduation_score_informations` VALUES (128, 25, 212, 23, 25, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-05-07 13:50:12', '2024-05-07 13:50:12');
INSERT INTO `module_graduation_score_informations` VALUES (129, 25, 213, 23, 25, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-05-07 13:52:09', '2024-05-07 13:52:09');
INSERT INTO `module_graduation_score_informations` VALUES (130, 25, 214, 23, 25, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-05-07 14:08:33', '2024-05-07 14:08:33');
INSERT INTO `module_graduation_score_informations` VALUES (131, 25, 215, 23, 25, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-05-07 14:10:08', '2024-05-07 14:10:08');
INSERT INTO `module_graduation_score_informations` VALUES (132, 25, 216, 23, 25, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-05-07 14:14:08', '2024-05-07 14:14:08');
INSERT INTO `module_graduation_score_informations` VALUES (133, 25, 217, 20, 26, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-05-15 09:37:17', '2024-05-15 09:37:17');
INSERT INTO `module_graduation_score_informations` VALUES (134, 25, 218, 20, 26, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-05-15 09:39:39', '2024-05-15 09:39:39');
INSERT INTO `module_graduation_score_informations` VALUES (135, 25, 219, 20, 26, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-05-15 09:41:18', '2024-05-15 09:41:18');
INSERT INTO `module_graduation_score_informations` VALUES (136, 25, 220, 20, 26, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-05-15 09:43:37', '2024-05-15 09:43:37');
INSERT INTO `module_graduation_score_informations` VALUES (137, 25, 221, 20, 26, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-05-15 09:45:04', '2024-05-15 09:45:04');
INSERT INTO `module_graduation_score_informations` VALUES (138, 25, 222, 20, 26, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-05-15 09:49:07', '2024-05-15 09:49:07');
INSERT INTO `module_graduation_score_informations` VALUES (139, 25, 223, 20, 26, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-05-15 09:52:24', '2024-05-15 09:52:24');
INSERT INTO `module_graduation_score_informations` VALUES (140, 25, 224, 20, 26, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-05-15 09:54:16', '2024-05-15 09:54:16');
INSERT INTO `module_graduation_score_informations` VALUES (141, 25, 225, 20, 26, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-05-15 09:56:58', '2024-05-15 09:56:58');
INSERT INTO `module_graduation_score_informations` VALUES (142, 25, 226, 20, 26, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-05-15 09:59:41', '2024-05-15 09:59:41');
INSERT INTO `module_graduation_score_informations` VALUES (143, 25, 227, 20, 26, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-05-15 10:01:05', '2024-05-15 10:01:05');
INSERT INTO `module_graduation_score_informations` VALUES (144, 25, 228, 20, 26, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-05-15 10:02:38', '2024-05-15 10:02:38');
INSERT INTO `module_graduation_score_informations` VALUES (145, 25, 229, 20, 26, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-05-15 10:05:26', '2024-05-15 10:05:26');
INSERT INTO `module_graduation_score_informations` VALUES (146, 25, 230, 20, 26, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-05-15 10:06:46', '2024-05-15 10:06:46');
INSERT INTO `module_graduation_score_informations` VALUES (148, 25, 232, 20, 26, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-05-15 10:11:57', '2024-05-15 10:11:57');
INSERT INTO `module_graduation_score_informations` VALUES (149, 25, 233, 31, 27, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-05-20 08:51:14', '2024-05-20 08:51:14');
INSERT INTO `module_graduation_score_informations` VALUES (150, 25, 234, 31, 27, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-05-20 08:52:33', '2024-05-20 08:52:33');
INSERT INTO `module_graduation_score_informations` VALUES (151, 25, 235, 31, 27, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-05-20 08:53:41', '2024-05-20 08:53:41');
INSERT INTO `module_graduation_score_informations` VALUES (152, 25, 236, 31, 27, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-05-20 08:55:59', '2024-05-20 08:55:59');
INSERT INTO `module_graduation_score_informations` VALUES (153, 25, 237, 31, 27, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-05-20 08:57:45', '2024-05-20 08:57:45');
INSERT INTO `module_graduation_score_informations` VALUES (154, 25, 238, 31, 27, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-05-20 08:59:20', '2024-05-20 08:59:20');
INSERT INTO `module_graduation_score_informations` VALUES (155, 25, 239, 31, 27, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-05-20 09:00:14', '2024-05-20 09:00:14');
INSERT INTO `module_graduation_score_informations` VALUES (156, 25, 240, 31, 27, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-05-20 09:02:41', '2024-05-20 09:02:41');
INSERT INTO `module_graduation_score_informations` VALUES (157, 25, 241, 31, 27, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-05-20 09:03:55', '2024-05-20 09:03:55');
INSERT INTO `module_graduation_score_informations` VALUES (158, 25, 242, 31, 27, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-05-20 09:05:11', '2024-05-20 09:05:11');
INSERT INTO `module_graduation_score_informations` VALUES (159, 25, 243, 31, 27, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-05-20 09:08:45', '2024-05-20 09:08:45');
INSERT INTO `module_graduation_score_informations` VALUES (160, 25, 244, 31, 27, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-05-20 09:10:03', '2024-05-20 09:10:03');
INSERT INTO `module_graduation_score_informations` VALUES (161, 25, 245, 31, 27, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-05-20 09:11:55', '2024-05-20 09:11:55');
INSERT INTO `module_graduation_score_informations` VALUES (162, 25, 246, 31, 27, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-05-20 09:13:04', '2024-05-20 09:13:04');
INSERT INTO `module_graduation_score_informations` VALUES (163, 25, 247, 31, 27, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-05-20 09:15:39', '2024-05-20 09:15:39');
INSERT INTO `module_graduation_score_informations` VALUES (164, 25, 248, 31, 27, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-05-20 09:24:29', '2024-05-20 09:24:29');
INSERT INTO `module_graduation_score_informations` VALUES (165, 25, 249, 31, 27, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-05-20 09:26:22', '2024-05-20 09:26:22');
INSERT INTO `module_graduation_score_informations` VALUES (166, 25, 250, 31, 27, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-05-20 09:27:36', '2024-05-20 09:27:36');
INSERT INTO `module_graduation_score_informations` VALUES (167, 25, 251, 20, 28, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-05-28 14:56:28', '2024-05-28 14:56:28');
INSERT INTO `module_graduation_score_informations` VALUES (168, 25, 252, 20, 28, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-05-28 15:02:40', '2024-05-28 15:02:40');
INSERT INTO `module_graduation_score_informations` VALUES (169, 25, 253, 20, 28, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-05-28 15:08:31', '2024-05-28 15:08:31');
INSERT INTO `module_graduation_score_informations` VALUES (170, 25, 254, 20, 28, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-05-28 15:11:48', '2024-05-28 15:11:48');
INSERT INTO `module_graduation_score_informations` VALUES (171, 25, 255, 20, 28, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-05-28 15:15:35', '2024-05-28 15:15:35');
INSERT INTO `module_graduation_score_informations` VALUES (172, 25, 256, 20, 28, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-05-28 15:24:00', '2024-05-28 15:24:00');
INSERT INTO `module_graduation_score_informations` VALUES (173, 25, 257, 20, 28, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-05-28 15:25:38', '2024-05-28 15:25:38');
INSERT INTO `module_graduation_score_informations` VALUES (174, 25, 258, 20, 28, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-05-28 15:28:55', '2024-05-28 15:28:55');
INSERT INTO `module_graduation_score_informations` VALUES (175, 25, 259, 20, 28, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-05-28 15:30:52', '2024-05-28 15:30:52');
INSERT INTO `module_graduation_score_informations` VALUES (176, 25, 260, 20, 28, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-05-28 15:35:04', '2024-05-28 15:35:04');
INSERT INTO `module_graduation_score_informations` VALUES (177, 25, 261, 20, 28, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-05-28 15:37:06', '2024-05-28 15:37:06');
INSERT INTO `module_graduation_score_informations` VALUES (178, 25, 262, 20, 28, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-05-28 15:38:49', '2024-05-28 15:38:49');
INSERT INTO `module_graduation_score_informations` VALUES (179, 25, 263, 20, 28, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-05-28 15:48:07', '2024-05-28 15:48:07');
INSERT INTO `module_graduation_score_informations` VALUES (180, 25, 264, 20, 28, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-05-28 16:06:21', '2024-05-28 16:06:21');
INSERT INTO `module_graduation_score_informations` VALUES (181, 25, 265, 20, 28, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-05-28 16:09:53', '2024-05-28 16:09:53');
INSERT INTO `module_graduation_score_informations` VALUES (182, 25, 266, 20, 28, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-05-28 16:12:51', '2024-05-28 16:12:51');
INSERT INTO `module_graduation_score_informations` VALUES (183, 25, 267, 20, 28, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-05-28 16:14:33', '2024-05-28 16:14:33');
INSERT INTO `module_graduation_score_informations` VALUES (184, 25, 268, 20, 28, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-05-28 16:16:00', '2024-05-28 16:16:00');

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
  `status` bit(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `id_training_specialty` int NOT NULL,
  `id_course` int NOT NULL,
  `type_1` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `type_2` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `type_3` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `class` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `id_site`(`id_site` ASC) USING BTREE,
  INDEX `id_training_specialty`(`id_training_specialty` ASC) USING BTREE,
  INDEX `id_course`(`id_course` ASC) USING BTREE,
  CONSTRAINT `module_manage_students_ibfk_1` FOREIGN KEY (`id_site`) REFERENCES `sys_sites` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE,
  CONSTRAINT `module_manage_students_ibfk_2` FOREIGN KEY (`id_training_specialty`) REFERENCES `module_training_specialties` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE,
  CONSTRAINT `module_manage_students_ibfk_3` FOREIGN KEY (`id_course`) REFERENCES `module_type_of_courses` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 269 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = COMPACT;

-- ----------------------------
-- Records of module_manage_students
-- ----------------------------
INSERT INTO `module_manage_students` VALUES (199, 25, 'Tăng Thị Chial', '1972-01-01', NULL, '094172004277', '2021-06-28', 'Cục trưởng cục CS QLHC về TTXH', 'Ấp Phú Bình, xã Phú Tâm', 'Ấp Phú Bình, xã Phú Tâm', 19, '17', NULL, NULL, NULL, NULL, NULL, 'nu', NULL, b'0', '2024-05-07 09:20:04', '2024-05-07 09:20:04', 23, 25, '20', NULL, NULL, '7');
INSERT INTO `module_manage_students` VALUES (200, 25, 'Lý Thị Khánh Dư', '1971-01-01', NULL, '094171007622', '2021-09-21', 'Cục trưởng cục CS QLHC về TTXH', 'Ấp Phú Bình, xã Phú Tâm', 'Ấp Phú Bình, xã Phú Tâm', 19, '17', NULL, NULL, NULL, NULL, NULL, 'nu', NULL, b'0', '2024-05-07 13:17:18', '2024-05-07 13:17:38', 23, 25, NULL, '24', NULL, '3');
INSERT INTO `module_manage_students` VALUES (201, 25, 'Lâm Thị Miên', '1997-08-30', NULL, '094197000594', '2021-04-13', 'Cục trưởng cục CS QLHC về TTXH', 'Ấp Phú Bình, xã Phú Tâm', 'Ấp Phú Bình, xã Phú Tâm', 19, '17', NULL, NULL, NULL, NULL, NULL, 'nu', NULL, b'0', '2024-05-07 13:24:48', '2024-05-07 13:24:48', 23, 25, NULL, '24', NULL, '7');
INSERT INTO `module_manage_students` VALUES (202, 25, 'Trần Thị Hồng Thúy', '1988-01-01', NULL, '094188014958', '2021-09-21', 'Cục trưởng cục CS QLHC về TTXH', 'Ấp Phú Bình, xã Phú Tâm', NULL, 19, '17', NULL, NULL, NULL, NULL, NULL, 'nu', NULL, b'0', '2024-05-07 13:26:46', '2024-05-07 13:26:46', 23, 25, '20', NULL, NULL, '5');
INSERT INTO `module_manage_students` VALUES (203, 25, 'Huỳnh Thị Mộng', '1976-01-01', NULL, '094176013151', '2022-03-23', 'Cục trưởng cục CS QLHC về TTXH', 'Ấp Phú Bình, xã Phú Tâm', 'Ấp Phú Bình, xã Phú Tâm', 19, '17', NULL, NULL, NULL, NULL, NULL, 'nu', NULL, b'0', '2024-05-07 13:28:41', '2024-05-07 13:30:27', 23, 25, '41', NULL, NULL, '1');
INSERT INTO `module_manage_students` VALUES (204, 25, 'Ngô Thị Thúy Oanh', '1973-01-01', NULL, '094173002876', '2021-08-13', 'Cục trưởng cục CS QLHC về TTXH', 'Ấp Phú Bình, xã Phú Tâm', 'Ấp Phú Bình, xã Phú Tâm', 15, '17', NULL, NULL, NULL, NULL, NULL, 'nu', NULL, b'0', '2024-05-07 13:30:18', '2024-05-07 13:30:35', 23, 25, NULL, '24', NULL, '1');
INSERT INTO `module_manage_students` VALUES (205, 25, 'Thạch Thị Mỹ Nhung', '1985-01-01', NULL, '094185006029', '2022-09-21', 'Cục trưởng cục CS QLHC về TTXH', 'Ấp Phú Bình, xã Phú Tâm', 'Ấp Phú Bình, xã Phú Tâm', 19, '17', NULL, NULL, NULL, NULL, NULL, 'nu', NULL, b'0', '2024-05-07 13:32:16', '2024-05-07 13:39:44', 23, 25, '20', NULL, NULL, '1');
INSERT INTO `module_manage_students` VALUES (206, 25, 'Lý Thị Thu Thảo', '1994-11-04', NULL, '094194001378', '2021-06-28', 'Cục trưởng cục CS QLHC về TTXH', 'Ấp Phú Hữu, xã Phú Tâm', 'Ấp Phú Hữu, xã Phú Tâm', 19, '17', NULL, NULL, NULL, NULL, NULL, 'nu', NULL, b'0', '2024-05-07 13:34:18', '2024-05-07 13:34:18', 23, 25, '20', NULL, NULL, '10');
INSERT INTO `module_manage_students` VALUES (207, 25, 'Nguyễn Thị Thu Trang', '1985-06-02', NULL, '094185009533', '2021-07-09', 'Cục trưởng cục CS QLHC về TTXH', 'Ấp Phú Thành A, xã Phú Tâm', 'Ấp Phú Thành A, xã Phú Tâm', 15, '17', NULL, NULL, NULL, NULL, NULL, 'nu', NULL, b'0', '2024-05-07 13:41:36', '2024-05-07 13:41:36', 23, 25, '20', NULL, NULL, '3');
INSERT INTO `module_manage_students` VALUES (208, 25, 'Kim Tuấn', '1970-08-12', NULL, '094070023209', '2023-06-13', 'Cục trưởng cục CS QLHC về TTXH', 'Ấp Phú Bình, xã Phú Tâm', 'Ấp Phú Bình, xã Phú Tâm', 19, '17', NULL, NULL, NULL, NULL, NULL, 'nam', NULL, b'0', '2024-05-07 13:43:04', '2024-05-07 13:43:04', 23, 25, '20', NULL, NULL, '1');
INSERT INTO `module_manage_students` VALUES (209, 25, 'Nguyễn Văn Giang', '2006-10-12', NULL, '094206010890', '2022-10-19', 'Cục trưởng cục CS QLHC về TTXH', 'Ấp Phú Bình, xã Phú Tâm', 'Ấp Phú Bình, xã Phú Tâm', 19, '17', NULL, NULL, NULL, NULL, NULL, 'nam', NULL, b'0', '2024-05-07 13:44:52', '2024-05-07 13:44:52', 23, 25, '41', NULL, NULL, '6');
INSERT INTO `module_manage_students` VALUES (210, 25, 'Thạch Phương', '1980-01-01', NULL, '094080015000', '2022-03-21', 'Cục trưởng cục CS QLHC về TTXH', 'Ấp Phú Bình, xã Phú Tâm', 'Ấp Phú Bình, xã Phú Tâm', 19, '17', NULL, NULL, NULL, NULL, NULL, 'nam', NULL, b'0', '2024-05-07 13:46:39', '2024-05-07 13:46:39', 23, 25, '41', NULL, NULL, '1');
INSERT INTO `module_manage_students` VALUES (211, 25, 'Ngô Văn Hiếu', '1987-01-01', NULL, '094087012173', '2022-07-18', 'Cục trưởng cục CS QLHC về TTXH', 'Ấp Phú Bình, xã Phú Tâm', 'Ấp Phú Bình, xã Phú Tâm', 19, '17', NULL, NULL, NULL, NULL, NULL, 'nam', NULL, b'0', '2024-05-07 13:48:24', '2024-05-07 13:52:33', 23, 25, '20', NULL, NULL, '3');
INSERT INTO `module_manage_students` VALUES (212, 25, 'Thạch Minh Dũng', '1978-02-10', NULL, '094078001020', '2021-04-13', 'Cục trưởng cục CS QLHC về TTXH', 'Ấp Phú Bình, xã Phú Tâm', 'Ấp Phú Bình, xã Phú Tâm', 19, '17', NULL, NULL, NULL, NULL, NULL, 'nam', NULL, b'0', '2024-05-07 13:50:12', '2024-05-07 13:50:12', 23, 25, '41', NULL, NULL, '1');
INSERT INTO `module_manage_students` VALUES (213, 25, 'Huỳnh Văn Hùng', '1985-02-06', NULL, '094085001226', '2021-04-13', 'Cục trưởng cục CS QLHC về TTXH', 'Ấp Phú Bình, xã Phú Tâm', 'Ấp Phú Bình, xã Phú Tâm', 19, '17', NULL, NULL, NULL, NULL, NULL, 'nam', NULL, b'0', '2024-05-07 13:52:09', '2024-05-07 13:52:09', 23, 25, NULL, '24', NULL, '4');
INSERT INTO `module_manage_students` VALUES (214, 25, 'Lâm Minh Tú', '1993-06-06', NULL, '094093013047', '2021-08-10', 'Cục trưởng cục CS QLHC về TTXH', 'Ấp Phú Bình, xã Phú Tâm', 'Ấp Phú Bình, xã Phú Tâm', 19, '17', NULL, NULL, NULL, NULL, NULL, 'nam', NULL, b'0', '2024-05-07 14:08:33', '2024-05-07 14:08:33', 23, 25, NULL, '24', NULL, '6');
INSERT INTO `module_manage_students` VALUES (215, 25, 'Lâm Thiện', '1989-01-01', NULL, '094089010674', '2022-10-05', 'Cục trưởng cục CS QLHC về TTXH', 'Ấp Phú Bình, xã Phú Tâm', 'Ấp Phú Bình, xã Phú Tâm', 19, '17', NULL, NULL, NULL, NULL, NULL, 'nam', NULL, b'1', '2024-05-07 14:10:08', '2024-05-07 14:10:08', 23, 25, '20', NULL, NULL, '1');
INSERT INTO `module_manage_students` VALUES (216, 25, 'Thạch Sọnh', '1967-01-01', NULL, '094067000714', '2021-04-13', 'Cục trưởng cục CS QLHC về TTXH', 'Ấp Phú Hữu, xã Phú Tâm', 'Ấp Phú Hữu, xã Phú Tâm', 19, '17', NULL, NULL, NULL, NULL, NULL, 'nam', NULL, b'1', '2024-05-07 14:14:08', '2024-05-07 14:14:08', 23, 25, NULL, '24', NULL, '1');
INSERT INTO `module_manage_students` VALUES (217, 25, 'Lý Thị Bé Ngọc', '2008-04-06', NULL, '094308005899', '2023-05-18', 'Cục QLHC về TTXH', 'ấp Phú Ninh, xã An Ninh, huyện Châu Thành, tỉnh Sóc Trăng', 'ấp Phú Ninh, xã An Ninh, huyện Châu Thành, tỉnh Sóc Trăng', 19, '17', NULL, NULL, NULL, NULL, NULL, 'nu', NULL, b'1', '2024-05-15 09:37:17', '2024-05-15 09:37:17', 20, 26, '21', NULL, NULL, '6');
INSERT INTO `module_manage_students` VALUES (218, 25, 'Đinh Thị Sà Lượl', '1989-06-12', NULL, '094189006533', '2021-08-17', 'Cục QLHC về TTXH', 'ấp Phú Ninh, xã An Ninh, huyện Châu Thành, tỉnh Sóc Trăng', 'ấp Phú Ninh, xã An Ninh, huyện Châu Thành, tỉnh Sóc Trăng', 19, '17', NULL, NULL, NULL, NULL, NULL, 'nu', NULL, b'1', '2024-05-15 09:39:39', '2024-05-15 09:39:39', 20, 26, '21', NULL, NULL, '5');
INSERT INTO `module_manage_students` VALUES (219, 25, 'Thạch Thị Ngọc Ái', '2007-03-27', NULL, '094307011835', '2022-08-31', 'Cục QLHC về TTXH', 'ấp Phú Ninh, xã An Ninh, huyện Châu Thành, tỉnh Sóc Trăng', 'ấp Phú Ninh, xã An Ninh, huyện Châu Thành, tỉnh Sóc Trăng', 19, '17', NULL, NULL, NULL, NULL, NULL, 'nu', NULL, b'1', '2024-05-15 09:41:18', '2024-05-15 09:41:18', 20, 26, '21', NULL, NULL, '10');
INSERT INTO `module_manage_students` VALUES (220, 25, 'Lâm Thị Phương Thì', '2006-10-14', NULL, '094306000388', '2022-08-25', 'Cục QLHC về TTXH', 'ấp Trà Lây 2, xã Thuận Hưng, huyện Mỹ Tú, tỉnh Sóc Trăng', 'ấp Trà Lây 2, xã Thuận Hưng, huyện Mỹ Tú, tỉnh Sóc Trăng', 19, '17', NULL, NULL, NULL, NULL, NULL, 'nu', NULL, b'1', '2024-05-15 09:43:37', '2024-05-15 09:43:37', 20, 26, '21', NULL, NULL, '7');
INSERT INTO `module_manage_students` VALUES (221, 25, 'Lý Thị Pu', '1988-02-07', NULL, '094183002705', '2022-06-06', 'Cục QLHC về TTXH', 'ấp Phú Ninh, xã An Ninh, huyện Châu Thành, tỉnh Sóc Trăng', 'ấp Phú Ninh, xã An Ninh, huyện Châu Thành, tỉnh Sóc Trăng', 19, '17', NULL, NULL, NULL, NULL, NULL, 'nu', NULL, b'1', '2024-05-15 09:45:04', '2024-05-15 09:45:04', 20, 26, '21', NULL, NULL, '5');
INSERT INTO `module_manage_students` VALUES (222, 25, 'Trần Thị Huỳnh Như', '2008-08-04', NULL, '094308009572', '2022-09-21', 'Cục QLHC về TTXH', 'ấp Phú Ninh, xã An Ninh, huyện Châu Thành, tỉnh Sóc Trăng', 'ấp Phú Ninh, xã An Ninh, huyện Châu Thành, tỉnh Sóc Trăng', 19, '17', NULL, NULL, NULL, NULL, NULL, 'nu', NULL, b'1', '2024-05-15 09:49:07', '2024-05-15 09:49:07', 20, 26, '21', NULL, NULL, '7');
INSERT INTO `module_manage_students` VALUES (223, 25, 'Hàng Thị Mỹ Liễu', '2000-08-28', NULL, '094300012683', '2021-08-04', 'Cục QLHC về TTXH', 'ấp Sóc Vồ, Phường 7, TP Sóc Trăng, tỉnh Sóc Trăng', 'ấp Sóc Vồ, Phường 7, TP Sóc Trăng, tỉnh Sóc Trăng', 19, '17', NULL, NULL, NULL, NULL, NULL, 'nu', NULL, b'1', '2024-05-15 09:52:24', '2024-05-15 09:52:24', 20, 26, '21', NULL, NULL, '8');
INSERT INTO `module_manage_students` VALUES (224, 25, 'Lưu Thị Kim Thoa', '2007-09-21', NULL, '094307009780', '2023-03-01', 'Cục QLHC về TTXH', 'ấp Phú Ninh, xã An Ninh, huyện Châu Thành, tỉnh Sóc Trăng', 'ấp Phú Ninh, xã An Ninh, huyện Châu Thành, tỉnh Sóc Trăng', 19, '17', NULL, NULL, NULL, NULL, NULL, 'nu', NULL, b'1', '2024-05-15 09:54:16', '2024-05-15 09:54:16', 20, 26, '21', NULL, NULL, '7');
INSERT INTO `module_manage_students` VALUES (225, 25, 'Lý Thị Thảo', '1988-01-01', NULL, '094188007937', '2022-08-17', 'Cục QLHC về TTXH', NULL, NULL, 19, '17', NULL, NULL, NULL, NULL, NULL, 'nu', NULL, b'1', '2024-05-15 09:56:58', '2024-05-15 09:56:58', 20, 26, '21', NULL, NULL, '7');
INSERT INTO `module_manage_students` VALUES (226, 25, 'Sơn Thị Diễm', '2008-03-13', NULL, '094308010304', '2022-09-23', 'Cục QLHC về TTXH', 'ấp Bưng Tróp B, xã An Hiệp, huyện Châu Thành, tỉnh Sóc Trăng', 'ấp Bưng Tróp B, xã An Hiệp, huyện Châu Thành, tỉnh Sóc Trăng', 19, '17', NULL, NULL, NULL, NULL, NULL, 'nu', NULL, b'1', '2024-05-15 09:59:41', '2024-05-15 09:59:41', 20, 26, '21', NULL, NULL, '6');
INSERT INTO `module_manage_students` VALUES (227, 25, 'Danh Thị Thanh Tài', '2001-05-09', NULL, '094301002441', '2021-05-10', 'Cục QLHC về TTXH', 'ấp Phú Ninh, xã An Ninh, huyện Châu Thành, tỉnh Sóc Trăng', 'ấp Phú Ninh, xã An Ninh, huyện Châu Thành, tỉnh Sóc Trăng', 19, '17', NULL, NULL, NULL, NULL, NULL, 'nu', NULL, b'1', '2024-05-15 10:01:05', '2024-05-15 10:01:05', 20, 26, '21', NULL, NULL, '6');
INSERT INTO `module_manage_students` VALUES (228, 25, 'Liêng Diễm Trinh', '2008-12-17', NULL, '094308002973', '2023-05-31', 'Cục QLHC về TTXH', 'ấp Phú Ninh A, xã An Ninh, huyện Châu Thành, tỉnh Sóc Trăng', 'ấp Phú Ninh A, xã An Ninh, huyện Châu Thành, tỉnh Sóc Trăng', 19, '17', NULL, NULL, NULL, NULL, NULL, 'nu', NULL, b'1', '2024-05-15 10:02:38', '2024-05-15 10:02:38', 20, 26, '21', NULL, NULL, '5');
INSERT INTO `module_manage_students` VALUES (229, 25, 'Triệu Thị Kim Cúc', '1990-03-09', NULL, '094190014992', '2021-08-09', 'Cục QLHC về TTXH', 'ấp Phú Ninh A, xã An Ninh, huyện Châu Thành, tỉnh Sóc Trăng', 'ấp Phú Ninh A, xã An Ninh, huyện Châu Thành, tỉnh Sóc Trăng', 19, '17', NULL, NULL, NULL, NULL, NULL, 'nu', NULL, b'1', '2024-05-15 10:05:25', '2024-05-15 10:05:25', 20, 26, '21', NULL, NULL, '9');
INSERT INTO `module_manage_students` VALUES (230, 25, 'Triệu Kiều Phương', '2007-06-11', NULL, '094307001462', '2023-08-13', 'Cục QLHC về TTXH', 'ấp Phú Ninh A, xã An Ninh, huyện Châu Thành, tỉnh Sóc Trăng', 'ấp Phú Ninh A, xã An Ninh, huyện Châu Thành, tỉnh Sóc Trăng', 19, '17', NULL, NULL, NULL, NULL, NULL, 'nu', NULL, b'1', '2024-05-15 10:06:46', '2024-05-15 10:06:46', 20, 26, '21', NULL, NULL, '9');
INSERT INTO `module_manage_students` VALUES (232, 25, 'Đào Thị Simonne', '1974-01-01', NULL, '094174009840', '2022-09-29', 'Cục QLHC về TTXH', 'ấp Phú Ninh, xã An Ninh, huyện Châu Thành, tỉnh Sóc Trăng', 'ấp Phú Ninh, xã An Ninh, huyện Châu Thành, tỉnh Sóc Trăng', 19, '17', NULL, NULL, NULL, NULL, NULL, 'nu', NULL, b'1', '2024-05-15 10:11:57', '2024-05-20 08:42:47', 20, 26, '21', NULL, NULL, '6');
INSERT INTO `module_manage_students` VALUES (233, 25, 'Trịnh Thanh Tường', '2008-10-03', NULL, '094208004070', '2023-02-28', 'Cục QLHC về TTXH', 'ấp Phú Ninh, xã An Ninh, huyện Châu Thành, tỉnh Sóc Trăng', 'ấp Phú Ninh, xã An Ninh, huyện Châu Thành, tỉnh Sóc Trăng', 19, '17', NULL, NULL, NULL, NULL, NULL, 'nam', NULL, b'1', '2024-05-20 08:51:14', '2024-05-20 08:51:14', 31, 27, '21', NULL, NULL, '9');
INSERT INTO `module_manage_students` VALUES (234, 25, 'Liêu Huỳnh Nghi', '1980-01-01', NULL, '094080019321', '2021-08-10', 'Cục QLHC về TTXH', 'ấp Phú Ninh, xã An Ninh, huyện Châu Thành, tỉnh Sóc Trăng', 'ấp Phú Ninh, xã An Ninh, huyện Châu Thành, tỉnh Sóc Trăng', 19, '17', NULL, NULL, NULL, NULL, NULL, 'nam', NULL, b'1', '2024-05-20 08:52:33', '2024-05-20 08:52:33', 31, 27, '21', NULL, NULL, '6');
INSERT INTO `module_manage_students` VALUES (235, 25, 'Liêu Lâm Hoài', '2009-02-20', NULL, '094209013481', '2021-11-20', 'Cục QLHC về TTXH', 'ấp Phú Ninh, xã An Ninh, huyện Châu Thành, tỉnh Sóc Trăng', 'ấp Phú Ninh, xã An Ninh, huyện Châu Thành, tỉnh Sóc Trăng', 19, '17', NULL, NULL, NULL, NULL, NULL, 'nam', NULL, b'1', '2024-05-20 08:53:41', '2024-05-20 08:53:41', 31, 27, '21', NULL, NULL, '8');
INSERT INTO `module_manage_students` VALUES (236, 25, 'Dương Văn Đường', '1992-01-01', NULL, '094092008218', '2022-04-14', 'Cục QLHC về TTXH', '383/114 Đường 30/04, P9, TP. Sóc Trăng, tỉnh Sóc Trăng', '383/114 Đường 30/04, P9, TP. Sóc Trăng, tỉnh Sóc Trăng', 19, '17', NULL, NULL, NULL, NULL, NULL, 'nam', NULL, b'1', '2024-05-20 08:55:58', '2024-05-20 08:55:58', 31, 27, '21', NULL, NULL, '6');
INSERT INTO `module_manage_students` VALUES (237, 25, 'Lâm Lai', '1992-12-03', NULL, '094092005758', '2021-08-06', 'Cục QLHC về TTXH', '658/12A Tôn Đức Thắng, P5, TP Sóc Trăng, tỉnh Sóc Trăng', '658/12A Tôn Đức Thắng, P5, TP Sóc Trăng, tỉnh Sóc Trăng', 19, '17', NULL, NULL, NULL, NULL, NULL, 'nam', NULL, b'1', '2024-05-20 08:57:45', '2024-05-20 09:18:37', 31, 27, '21', NULL, NULL, '8');
INSERT INTO `module_manage_students` VALUES (238, 25, 'Danh Út Tài', '1995-01-12', NULL, '094095011531', '2022-09-06', 'Cục QLHC về TTXH', 'ấp Phú Ninh, xã An Ninh, huyện Châu Thành, tỉnh Sóc Trăng', 'ấp Phú Ninh, xã An Ninh, huyện Châu Thành, tỉnh Sóc Trăng', 19, '17', NULL, NULL, NULL, NULL, NULL, 'nam', NULL, b'1', '2024-05-20 08:59:20', '2024-05-20 08:59:20', 31, 27, '21', NULL, NULL, '9');
INSERT INTO `module_manage_students` VALUES (239, 25, 'Lý Phi Rinh', '1998-10-11', NULL, '094098009497', '2023-12-11', 'Cục QLHC về TTXH', 'ấp Chông Nô, xã An Ninh, huyện Châu Thành, tỉnh Sóc Trăng', 'ấp Chông Nô, xã An Ninh, huyện Châu Thành, tỉnh Sóc Trăng', 19, '17', NULL, NULL, NULL, NULL, NULL, 'nam', NULL, b'1', '2024-05-20 09:00:14', '2024-05-20 09:01:13', 31, 27, '21', NULL, NULL, '6');
INSERT INTO `module_manage_students` VALUES (240, 25, 'Lâm Sà Rinh', '1969-01-01', NULL, '094069012809', '2022-09-16', 'Cục QLHC về TTXH', 'ấp Phú Ninh, xã An Ninh, huyện Châu Thành, tỉnh Sóc Trăng', 'ấp Phú Ninh, xã An Ninh, huyện Châu Thành, tỉnh Sóc Trăng', 19, '17', NULL, NULL, NULL, NULL, NULL, 'nam', NULL, b'1', '2024-05-20 09:02:41', '2024-05-20 09:02:41', 31, 27, '21', NULL, NULL, '6');
INSERT INTO `module_manage_students` VALUES (241, 25, 'Lâm Hùng', '1991-10-20', NULL, '094091005034', '2021-08-10', 'Cục QLHC về TTXH', 'ấp Phú Ninh, xã An Ninh, huyện Châu Thành, tỉnh Sóc Trăng', 'ấp Phú Ninh, xã An Ninh, huyện Châu Thành, tỉnh Sóc Trăng', 19, '17', NULL, NULL, NULL, NULL, NULL, 'nam', NULL, b'1', '2024-05-20 09:03:55', '2024-05-20 09:03:55', 31, 27, '21', NULL, NULL, '6');
INSERT INTO `module_manage_students` VALUES (242, 25, 'Trịnh Thanh Tâm', '2007-03-11', NULL, '094207004400', '2021-06-10', 'Cục QLHC về TTXH', 'ấp Phú Ninh, xã An Ninh, huyện Châu Thành, tỉnh Sóc Trăng', 'ấp Phú Ninh, xã An Ninh, huyện Châu Thành, tỉnh Sóc Trăng', 19, '17', NULL, NULL, NULL, NULL, NULL, 'nam', NULL, b'1', '2024-05-20 09:05:11', '2024-05-20 09:05:11', 31, 27, '21', NULL, NULL, '8');
INSERT INTO `module_manage_students` VALUES (243, 25, 'Trần Giang', '1984-01-01', NULL, '094084008242', '2021-08-19', 'Cục QLHC về TTXH', '239A Sóc Vồ, P7, TP Sóc Trăng, tỉnh Sóc Trăng', '239A Sóc Vồ, P7, TP Sóc Trăng, tỉnh Sóc Trăng', 19, '17', NULL, NULL, NULL, NULL, NULL, 'nam', NULL, b'1', '2024-05-20 09:08:45', '2024-05-20 09:08:45', 31, 27, '21', NULL, NULL, '6');
INSERT INTO `module_manage_students` VALUES (244, 25, 'Kim Minh Đạo', '1976-01-01', NULL, '094076008053', '2022-10-05', 'Cục QLHC về TTXH', 'ấp Phú Ninh, xã An Ninh, huyện Châu Thành, tỉnh Sóc Trăng', 'ấp Phú Ninh, xã An Ninh, huyện Châu Thành, tỉnh Sóc Trăng', 19, '17', NULL, NULL, NULL, NULL, NULL, 'nam', NULL, b'1', '2024-05-20 09:10:03', '2024-05-20 09:10:03', 31, 27, '21', NULL, NULL, '6');
INSERT INTO `module_manage_students` VALUES (245, 25, 'Thạch Chươl', '1992-12-13', NULL, '094092013272', '2023-11-24', 'Cục QLHC về TTXH', 'ấp Tam Sóc C1, Xã Mỹ Thuận, huyện Mỹ Tú, tỉnh Sóc Trăng', 'ấp Tam Sóc C1, Xã Mỹ Thuận, huyện Mỹ Tú, tỉnh Sóc Trăng', 19, '17', NULL, NULL, NULL, NULL, NULL, 'nam', NULL, b'1', '2024-05-20 09:11:55', '2024-05-20 09:11:55', 31, 27, '21', NULL, NULL, '6');
INSERT INTO `module_manage_students` VALUES (246, 25, 'La Hoàng Anh', '1982-11-10', NULL, '094082013733', '2021-11-18', 'Cục QLHC về TTXH', 'ấp Phú Ninh, xã An Ninh, huyện Châu Thành, tỉnh Sóc Trăng', 'ấp Phú Ninh, xã An Ninh, huyện Châu Thành, tỉnh Sóc Trăng', 19, '17', NULL, NULL, NULL, NULL, NULL, 'nam', NULL, b'1', '2024-05-20 09:13:04', '2024-05-20 09:13:04', 31, 27, '21', NULL, NULL, '6');
INSERT INTO `module_manage_students` VALUES (247, 25, 'Trần Thuỷ', '1993-09-10', NULL, '094093009959', '2022-10-05', 'Cục QLHC về TTXH', 'ấp Phú Ninh, xã An Ninh, huyện Châu Thành, tỉnh Sóc Trăng', 'ấp Phú Ninh, xã An Ninh, huyện Châu Thành, tỉnh Sóc Trăng', 19, '17', NULL, NULL, NULL, NULL, NULL, 'nam', NULL, b'1', '2024-05-20 09:15:39', '2024-05-20 09:15:39', 31, 27, '21', NULL, NULL, '6');
INSERT INTO `module_manage_students` VALUES (248, 25, 'Lâm Hùng 2', '1990-11-28', NULL, '094090019383', '2021-06-10', 'Cục QLHC về TTXH', 'ấp Phú Ninh, xã An Ninh, huyện Châu Thành, tỉnh Sóc Trăng', 'ấp Phú Ninh, xã An Ninh, huyện Châu Thành, tỉnh Sóc Trăng', 19, '17', NULL, NULL, NULL, NULL, NULL, 'nam', NULL, b'1', '2024-05-20 09:24:29', '2024-05-20 09:24:29', 31, 27, '21', NULL, NULL, '6');
INSERT INTO `module_manage_students` VALUES (249, 25, 'Dương Khe', '1965-01-25', NULL, '094065010078', '2021-05-10', 'Cục QLHC về TTXH', 'ấp Phú Ninh, xã An Ninh, huyện Châu Thành, tỉnh Sóc Trăng', 'ấp Phú Ninh, xã An Ninh, huyện Châu Thành, tỉnh Sóc Trăng', 19, '17', NULL, NULL, NULL, NULL, NULL, 'nam', NULL, b'1', '2024-05-20 09:26:22', '2024-05-20 09:26:22', 31, 27, '21', NULL, NULL, '12');
INSERT INTO `module_manage_students` VALUES (250, 25, 'Lý Đơ', '1983-05-29', NULL, '094083004124', '1983-05-29', 'Cục QLHC về TTXH', 'ấp Phú Ninh, xã An Ninh, huyện Châu Thành, tỉnh Sóc Trăng', 'ấp Phú Ninh, xã An Ninh, huyện Châu Thành, tỉnh Sóc Trăng', 19, '17', NULL, NULL, NULL, NULL, NULL, 'nam', NULL, b'1', '2024-05-20 09:27:36', '2024-05-20 09:27:36', 31, 27, '21', NULL, NULL, '9');
INSERT INTO `module_manage_students` VALUES (251, 25, 'Thạch Thùy Liên Như', '1999-01-07', '0377943623', '094199004431', '2022-01-09', 'Cục trưởng cục CS QLHC về TTXH', 'Ấp Thọ Hòa Đông A, xã Phú Tâm', 'Ấp Thọ Hòa Đông A, xã Phú Tâm', 19, '17', NULL, NULL, NULL, NULL, NULL, 'nu', NULL, b'1', '2024-05-28 14:56:28', '2024-05-28 15:08:52', 20, 28, '21', NULL, NULL, '6');
INSERT INTO `module_manage_students` VALUES (252, 25, 'Thạch Thị Thảo', '1989-01-01', '0353974014', '094189011072', '2022-08-05', 'Cục trưởng cục CS QLHC về TTXH', 'Ấp Thọ Hòa Đông A, xã Phú Tâm', 'Ấp Thọ Hòa Đông A, xã Phú Tâm', 19, '17', NULL, NULL, NULL, NULL, NULL, 'nu', NULL, b'1', '2024-05-28 15:02:40', '2024-05-28 15:09:25', 20, 28, '21', NULL, NULL, '5');
INSERT INTO `module_manage_students` VALUES (253, 25, 'Lý Thị Nhân', '1999-08-20', NULL, '094199010192', '2021-10-02', 'Cục trưởng cục CS QLHC về TTXH', 'Ấp Thọ Hòa Đông A, xã Phú Tâm', 'Ấp Thọ Hòa Đông A, xã Phú Tâm', 19, '17', NULL, NULL, NULL, NULL, NULL, 'nu', NULL, b'1', '2024-05-28 15:08:30', '2024-05-28 15:08:30', 20, 28, '21', NULL, NULL, '9');
INSERT INTO `module_manage_students` VALUES (254, 25, 'Đào Thị Dung', '1985-01-01', '0967421103', '094185005727', '2022-08-02', 'Cục trưởng cục CS QLHC về TTXH', 'Ấp Thọ Hòa Đông A, xã Phú Tâm', 'Ấp Thọ Hòa Đông A, xã Phú Tâm', 19, '17', NULL, NULL, NULL, NULL, NULL, 'nu', NULL, b'1', '2024-05-28 15:11:47', '2024-05-28 15:11:47', 20, 28, '21', NULL, NULL, '9');
INSERT INTO `module_manage_students` VALUES (255, 25, 'Phạm Thị Ngọc Huyền', '2008-01-06', NULL, '094308010561', '2023-06-07', 'Cục trưởng cục CS QLHC về TTXH', 'Ấp Sóc Tháo, xã Phú Tâm', 'Ấp Sóc Tháo, xã Phú Tâm', 19, '17', NULL, NULL, NULL, NULL, NULL, 'nu', NULL, b'1', '2024-05-28 15:15:35', '2024-05-28 15:15:35', 20, 28, '21', NULL, NULL, '9');
INSERT INTO `module_manage_students` VALUES (256, 25, 'Trương Thị Ngọc Mai', '2007-10-19', '0783778651', '094307014440', '2022-04-15', 'Cục trưởng cục CS QLHC về TTXH', 'Ấp Phú Bình, xã Phú Tâm', 'Ấp Phú Bình, xã Phú Tâm', 19, '17', NULL, NULL, NULL, NULL, NULL, 'nu', NULL, b'1', '2024-05-28 15:24:00', '2024-05-28 15:24:00', 20, 28, '21', NULL, NULL, '11');
INSERT INTO `module_manage_students` VALUES (257, 25, 'Ngô Thanh Tuyền', '2008-12-07', '0329537596', '094308009730', '2023-04-06', 'Cục trưởng cục CS QLHC về TTXH', 'Ấp Phú Bình, xã Phú Tâm', 'Ấp Phú Bình, xã Phú Tâm', 19, '17', NULL, NULL, NULL, NULL, NULL, 'nu', NULL, b'1', '2024-05-28 15:25:38', '2024-05-28 15:25:38', 20, 28, '21', NULL, NULL, '9');
INSERT INTO `module_manage_students` VALUES (258, 25, 'Lâm Thúy Vy', '2007-10-10', '0345454002', '094307007277', '2022-04-27', 'Cục trưởng cục CS QLHC về TTXH', 'Ấp Phú Bình, xã Phú Tâm', 'Ấp Phú Bình, xã Phú Tâm', 19, '17', NULL, NULL, NULL, NULL, NULL, 'nu', NULL, b'1', '2024-05-28 15:28:55', '2024-05-28 15:28:55', 20, 28, '21', NULL, NULL, '11');
INSERT INTO `module_manage_students` VALUES (259, 25, 'Lâm Thị Diệu', '2008-06-25', '0789559867', '094308009881', '2022-10-16', 'Cục trưởng cục CS QLHC về TTXH', 'Ấp Phú Bình, xã Phú Tâm', 'Ấp Phú Bình, xã Phú Tâm', 19, '17', NULL, NULL, NULL, NULL, NULL, 'nu', NULL, b'1', '2024-05-28 15:30:52', '2024-05-28 15:30:52', 20, 28, '21', NULL, NULL, '5');
INSERT INTO `module_manage_students` VALUES (260, 25, 'Sơn Thị Ngọc Kiều', '1990-10-30', '0326364244', '094190003273', '2022-09-26', 'Cục trưởng cục CS QLHC về TTXH', 'Ấp Phú Bình, xã Phú Tâm', 'Ấp Phú Bình, xã Phú Tâm', 19, '17', NULL, NULL, NULL, NULL, NULL, 'nu', NULL, b'1', '2024-05-28 15:35:03', '2024-05-28 15:35:03', 20, 28, '21', NULL, NULL, '7');
INSERT INTO `module_manage_students` VALUES (261, 25, 'Huỳnh Bích Vân', '1983-01-01', '0377932504', '094183003779', '2021-07-09', 'Cục trưởng cục CS QLHC về TTXH', 'Ấp Phú Bình, xã Phú Tâm', 'Ấp Phú Bình, xã Phú Tâm', 19, '17', NULL, NULL, NULL, NULL, NULL, 'nu', NULL, b'1', '2024-05-28 15:37:06', '2024-05-28 15:37:06', 20, 28, '21', NULL, NULL, '6');
INSERT INTO `module_manage_students` VALUES (262, 25, 'Thạch Thị Mỹ Dung', '1987-04-17', '0383076421', '094187001335', '2021-04-13', 'Cục trưởng cục CS QLHC về TTXH', 'Ấp Phú Hữu, xã Phú Tâm', 'Ấp Phú Hữu, xã Phú Tâm', 19, '17', NULL, NULL, NULL, NULL, NULL, 'nu', NULL, b'1', '2024-05-28 15:38:49', '2024-05-28 15:38:49', 20, 28, '21', NULL, NULL, NULL);
INSERT INTO `module_manage_students` VALUES (263, 25, 'Lâm Tâm Như', '2008-09-25', '0333953741', '094308014792', '2022-10-18', 'Cục trưởng cục CS QLHC về TTXH', 'Ấp Phú Bình, xã Phú Tâm', 'Ấp Phú Bình, xã Phú Tâm', 19, '17', NULL, NULL, NULL, NULL, NULL, 'nu', NULL, b'1', '2024-05-28 15:48:07', '2024-05-28 15:48:07', 20, 28, '21', NULL, NULL, NULL);
INSERT INTO `module_manage_students` VALUES (264, 25, 'Lâm Ngọc Mai', '2004-06-15', '0342857644', '094304007955', '2021-08-13', 'Cục trưởng cục CS QLHC về TTXH', 'Ấp Phước An, xã Phú Tân', 'Ấp Phước An, xã Phú Tân', 19, '17', NULL, NULL, NULL, NULL, NULL, 'nu', NULL, b'1', '2024-05-28 16:06:21', '2024-05-28 16:06:21', 20, 28, '21', NULL, NULL, '12');
INSERT INTO `module_manage_students` VALUES (265, 25, 'Trần Thị Bích Phượng', '2007-07-20', '0347145604', '094307003276', '2022-12-13', 'Cục trưởng cục CS QLHC về TTXH', 'Ấp Xây Đá A, xã Hồ Đắc Kiện', 'Ấp Xây Đá A, xã Hồ Đắc Kiện', 19, '17', NULL, NULL, NULL, NULL, NULL, 'nu', NULL, b'1', '2024-05-28 16:09:53', '2024-05-28 16:09:53', 20, 28, '21', NULL, NULL, '10');
INSERT INTO `module_manage_students` VALUES (266, 25, 'Huỳnh Quốc Phong', '2008-04-25', '0359627697', '094208013157', '2022-09-15', 'Cục trưởng cục CS QLHC về TTXH', 'Ấp Phú Hữu, xã Phú Tâm', 'Ấp Phú Hữu, xã Phú Tâm', 19, '17', NULL, NULL, NULL, NULL, NULL, 'nam', NULL, b'1', '2024-05-28 16:12:51', '2024-05-28 16:12:51', 20, 28, '21', NULL, NULL, NULL);
INSERT INTO `module_manage_students` VALUES (267, 25, 'Danh Hiền', '1987-01-01', '0373852272', '094087003915', '2022-09-23', 'Cục trưởng cục CS QLHC về TTXH', 'Ấp Thọ Hòa Đông A, xã Phú Tâm', 'Ấp Thọ Hòa Đông A, xã Phú Tâm', 19, '17', NULL, NULL, NULL, NULL, NULL, 'nam', NULL, b'1', '2024-05-28 16:14:33', '2024-05-28 16:14:33', 20, 28, '21', NULL, NULL, '6');
INSERT INTO `module_manage_students` VALUES (268, 25, 'Nguyễn La Hoài Nam', '2005-03-11', '0865429614', '094205001762', NULL, 'Cục trưởng cục CS QLHC về TTXH', 'Ấp Thọ Hòa Đông A, xã Phú Tâm', 'Ấp Thọ Hòa Đông A, xã Phú Tâm', 18, '17', NULL, NULL, NULL, NULL, NULL, 'nam', NULL, b'1', '2024-05-28 16:15:59', '2024-05-28 16:15:59', 20, 28, '21', NULL, NULL, NULL);

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
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = COMPACT;

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
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = COMPACT;

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
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = COMPACT;

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
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = COMPACT;

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
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = COMPACT;

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
  `id_training_specialty` int NOT NULL,
  `id_course` int NOT NULL,
  `start_time` date NULL DEFAULT NULL,
  `end_time` date NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `id_course`(`id_course` ASC) USING BTREE,
  INDEX `id_training_specialty`(`id_training_specialty` ASC) USING BTREE,
  INDEX `id_officer`(`id_officer` ASC) USING BTREE,
  CONSTRAINT `module_teaching_assignments_ibfk_1` FOREIGN KEY (`id_course`) REFERENCES `module_type_of_courses` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `module_teaching_assignments_ibfk_2` FOREIGN KEY (`id_training_specialty`) REFERENCES `module_training_specialties` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `module_teaching_assignments_ibfk_3` FOREIGN KEY (`id_officer`) REFERENCES `module_officer_informations` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = COMPACT;

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
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = COMPACT;

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
) ENGINE = InnoDB AUTO_INCREMENT = 33 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = COMPACT;

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
) ENGINE = InnoDB AUTO_INCREMENT = 25 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = COMPACT;

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
) ENGINE = InnoDB AUTO_INCREMENT = 29 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = COMPACT;

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
) ENGINE = InnoDB AUTO_INCREMENT = 20 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = COMPACT;

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
) ENGINE = InnoDB AUTO_INCREMENT = 71 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = COMPACT;

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
) ENGINE = InnoDB AUTO_INCREMENT = 32 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = COMPACT;

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
) ENGINE = InnoDB AUTO_INCREMENT = 26 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = COMPACT;

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
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = COMPACT;

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
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = COMPACT;

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
) ENGINE = InnoDB AUTO_INCREMENT = 34 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = COMPACT;

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
) ENGINE = InnoDB AUTO_INCREMENT = 17 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = COMPACT;

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
) ENGINE = InnoDB AUTO_INCREMENT = 17 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = COMPACT;

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
) ENGINE = InnoDB AUTO_INCREMENT = 26 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = COMPACT;

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
) ENGINE = InnoDB AUTO_INCREMENT = 27 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = COMPACT;

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
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = COMPACT;

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
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = COMPACT;

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
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = COMPACT;

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
) ENGINE = InnoDB AUTO_INCREMENT = 42 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = COMPACT;

-- ----------------------------
-- Records of module_vocational_education_policities
-- ----------------------------
INSERT INTO `module_vocational_education_policities` VALUES (18, 25, 'Người có công Cách mạng', 1, '2023-07-30 00:20:03', '2023-08-24 15:14:11');
INSERT INTO `module_vocational_education_policities` VALUES (20, 25, 'Hộ nghèo', 1, '2023-07-30 00:40:36', '2023-07-30 00:40:36');
INSERT INTO `module_vocational_education_policities` VALUES (21, 25, '\r\nDân tộc thiểu số', 1, '2023-07-30 00:40:57', '2023-07-30 00:40:57');
INSERT INTO `module_vocational_education_policities` VALUES (22, 25, '\r\nNgười tàn tật', 1, '2023-07-30 00:41:13', '2023-07-30 00:41:13');
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
) ENGINE = InnoDB AUTO_INCREMENT = 42 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = COMPACT;

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
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = COMPACT;

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
) ENGINE = InnoDB AUTO_INCREMENT = 179 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = COMPACT;

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
) ENGINE = InnoDB AUTO_INCREMENT = 25 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = COMPACT;

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
) ENGINE = InnoDB AUTO_INCREMENT = 22 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = COMPACT;

-- ----------------------------
-- Records of sys_groups_modules
-- ----------------------------
INSERT INTO `sys_groups_modules` VALUES (14, 'Quản lý tuyển sinh', 3);
INSERT INTO `sys_groups_modules` VALUES (17, 'Danh mục', 0);
INSERT INTO `sys_groups_modules` VALUES (18, 'Quản lý nhân sự', 1);
INSERT INTO `sys_groups_modules` VALUES (19, 'Quản lý đào tạo', 2);
INSERT INTO `sys_groups_modules` VALUES (20, 'Báo cáo thống kê', 4);
INSERT INTO `sys_groups_modules` VALUES (21, 'Chuyên ngành đào tạo', 5);

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
) ENGINE = InnoDB AUTO_INCREMENT = 98 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = COMPACT;

-- ----------------------------
-- Records of sys_list_modules
-- ----------------------------
INSERT INTO `sys_list_modules` VALUES (52, 'Danh sách học viên', 'danh-sach-hoc-vien', 'Modules\\AIManageStudents\\AIManageStudentsController', 'modules.AIManageStudents', 1, 1, 14, NULL, '/upload/mainstructure/icon/module/AIManageStudents.png', '2023-06-27 10:22:40', '2023-07-24 10:01:39', 'AIManageStudents', NULL, 1);
INSERT INTO `sys_list_modules` VALUES (53, 'Danh mục dân tộc', 'danh-muc-dan-toc', 'Modules\\AITypeOfEthnics\\AITypeOfEthnicsController', 'modules.AITypeOfEthnics', 1, 1, 17, NULL, '/upload/mainstructure/icon/module/AITypeOfPeoples.png', '2023-06-29 15:53:25', '2023-07-20 14:47:46', 'AITypeOfEthnics', NULL, 1);
INSERT INTO `sys_list_modules` VALUES (54, 'Danh mục thành phần gia đình', 'danh-muc-thanh-phan-gia-dinh', 'Modules\\AITypeOfFamilyCompositions\\AITypeOfFamilyCompositionsController', 'modules.AITypeOfFamilyCompositions', 1, 2, 17, NULL, '/upload/mainstructure/icon/module/AITypeOfFamilyMembers.png', '2023-06-30 16:55:52', '2023-07-20 14:47:50', 'AITypeOfFamilyCompositions', NULL, 1);
INSERT INTO `sys_list_modules` VALUES (55, 'Danh mục tôn giáo', 'danh-muc-ton-giao', 'Modules\\AITypeOfReligions\\AITypeOfReligionsController', 'modules.AITypeOfReligions', 1, 3, 17, NULL, '/upload/mainstructure/icon/module/AITypeOfReligions.png', '2023-07-03 14:08:03', '2023-07-20 14:47:54', 'AITypeOfReligions', NULL, 1);
INSERT INTO `sys_list_modules` VALUES (56, 'Danh mục khóa học', 'danh-muc-khoa-hoc', 'Modules\\AITypeOfCourses\\AITypeOfCoursesController', 'modules.AITypeOfCourses', 1, 4, 17, NULL, '/upload/mainstructure/icon/module/AITypeOfCourses.png', '2023-07-03 14:42:01', '2023-07-20 14:47:57', 'AITypeOfCourses', NULL, 1);
INSERT INTO `sys_list_modules` VALUES (57, 'Danh mục đối tượng tuyển sinh / ưu tiên', 'danh-muc-doi-tuong-tuyen-sinh-uu-tien', 'Modules\\AITypeOfRecruitments\\AITypeOfRecruitmentsController', 'modules.AITypeOfRecruitments', 1, 6, 17, NULL, '/upload/mainstructure/icon/module/AITypeOfRecruitments.png', '2023-07-03 15:52:06', '2023-07-20 14:48:19', 'AITypeOfRecruitments', NULL, 1);
INSERT INTO `sys_list_modules` VALUES (58, 'Danh mục hình thức đào tạo', 'danh-muc-hinh-thuc-dao-tao', 'Modules\\AITypeOfTrainingForms\\AITypeOfTrainingFormsController', 'modules.AITypeOfTrainingForms', 1, 6, 17, NULL, '/upload/mainstructure/icon/module/AITypeOfTrainingForms.png', '2023-07-03 17:02:09', '2023-07-20 14:48:14', 'AITypeOfTrainingForms', NULL, 1);
INSERT INTO `sys_list_modules` VALUES (59, 'Danh mục chương trình đào tạo', 'danh-muc-chuong-trinh-dao-tao', 'Modules\\AITypeOfTrainingPrograms\\AITypeOfTrainingProgramsController', 'modules.AITypeOfTrainingPrograms', 1, 7, 17, NULL, '/upload/mainstructure/icon/module/AITypeOfTrainingPrograms.png', '2023-07-04 09:53:06', '2023-07-20 14:48:11', 'AITypeOfTrainingPrograms', NULL, 1);
INSERT INTO `sys_list_modules` VALUES (60, 'Danh mục hình thức tuyển dụng', 'danh-muc-hinh-thuc-tuyen-dung', 'Modules\\AITypeOfRecruitmentForms\\AITypeOfRecruitmentFormsController', 'modules.AITypeOfRecruitmentForms', 1, 8, 17, NULL, '/upload/mainstructure/icon/module/AITypeOfRecruitmentForms.png', '2023-07-04 21:49:21', '2023-08-02 10:56:51', 'AITypeOfRecruitmentForms', NULL, 0);
INSERT INTO `sys_list_modules` VALUES (61, 'Danh mục trình độ giảng dạy', 'danh-muc-trinh-do-giang-day', 'Modules\\AITypeOfTeachingLevels\\AITypeOfTeachingLevelsController', 'modules.AITypeOfTeachingLevels', 1, 9, 17, NULL, '/upload/mainstructure/icon/module/AITypeOfTeachingLevels.png', '2023-07-04 22:06:36', '2023-07-20 14:48:04', 'AITypeOfTeachingLevels', NULL, 1);
INSERT INTO `sys_list_modules` VALUES (62, 'Danh mục hệ đào tạo', 'danh-muc-he-dao-tao', 'Modules\\AITypeOfTrainingSubsystems\\AITypeOfTrainingSubsystemsController', 'modules.AITypeOfTrainingSubsystems', 1, 10, 17, NULL, '/upload/mainstructure/icon/module/AITypeOfTrainingSubsystems.png', '2023-07-04 22:24:10', '2023-07-20 14:48:26', 'AITypeOfTrainingSubsystems', NULL, 1);
INSERT INTO `sys_list_modules` VALUES (63, 'Danh mục chức vụ cán bộ', 'danh-muc-chuc-vu-can-bo', 'Modules\\AITypeOfOfficerTitles\\AITypeOfOfficerTitlesController', 'modules.AITypeOfOfficerTitles', 1, 11, 17, NULL, '/upload/mainstructure/icon/module/AITypeOfOfficerTitles.png', '2023-07-05 09:56:17', '2023-07-20 14:48:30', 'AITypeOfOfficerTitles', NULL, 1);
INSERT INTO `sys_list_modules` VALUES (64, 'Danh mục học kỳ', 'danh-muc-hoc-ky', 'Modules\\AITypeOfSemesters\\AITypeOfSemestersController', 'modules.AITypeOfSemesters', 1, 12, 17, NULL, '/upload/mainstructure/icon/module/AITypeOfSemesters.png', '2023-07-05 10:05:48', '2023-07-30 01:04:06', 'AITypeOfSemesters', NULL, 0);
INSERT INTO `sys_list_modules` VALUES (65, 'Danh mục bậc đào tạo', 'danh-muc-bac-dao-tao', 'Modules\\AITypeOfTrainingLevels\\AITypeOfTrainingLevelsController', 'modules.AITypeOfTrainingLevels', 1, 13, 17, NULL, '/upload/mainstructure/icon/module/AITypeOfTrainingLevels.png', '2023-07-05 10:13:10', '2023-07-20 14:48:40', 'AITypeOfTrainingLevels', NULL, 1);
INSERT INTO `sys_list_modules` VALUES (66, 'Thông tin cán bộ, giáo viên', 'thong-tin-can-bo-giao-vien', 'Modules\\AIOfficerInformations\\AIOfficerInformationsController', 'modules.AIOfficerInformations', 1, 1, 18, NULL, '/upload/mainstructure/icon/module/AIOfficerInformations.png', '2023-07-05 11:06:35', '2023-07-05 11:07:04', 'AIOfficerInformations', NULL, 1);
INSERT INTO `sys_list_modules` VALUES (67, 'Quá trình công tác', 'qua-trinh-cong-tac', 'Modules\\AIOfficerWorkProcess\\AIOfficerWorkProcessController', 'modules.AIOfficerWorkProcess', 1, 2, 18, NULL, '/upload/mainstructure/icon/module/AIOfficerWorkProcess.png', '2023-07-20 14:39:53', '2023-07-23 17:32:02', 'AIOfficerWorkProcess', NULL, 1);
INSERT INTO `sys_list_modules` VALUES (68, 'Quá trình đào tạo chuyên môn nghiệp vụ', 'qua-trinh-dao-tao-chuyen-mon-nghiep-vu', 'Modules\\AIOfficerProfessionalTrainingProcess\\AIOfficerProfessionalTrainingProcessController', 'modules.AIOfficerProfessionalTrainingProcess', 1, 3, 18, NULL, '/upload/mainstructure/icon/module/AIOfficerProfessionalTrainingProcess.png', '2023-07-20 14:43:51', '2023-07-23 21:37:10', 'AIOfficerProfessionalTrainingProcess', NULL, 1);
INSERT INTO `sys_list_modules` VALUES (69, 'Quá trình đánh giá xếp loại giáo viên', 'qua-trinh-danh-gia-xep-loai-giao-vien', 'Modules\\AIOfficerAssessmentProcess\\AIOfficerAssessmentProcessController', 'modules.AIOfficerAssessmentProcess', 1, 4, 18, NULL, '/upload/mainstructure/icon/module/AIOfficerAssessmentProcess.png', '2023-07-20 14:44:53', '2023-07-23 23:36:59', 'AIOfficerAssessmentProcess', NULL, 1);
INSERT INTO `sys_list_modules` VALUES (70, 'Danh mục khoa/phòng', 'danh-muc-khoaphong', 'Modules\\AITypeOfDepartments\\AITypeOfDepartmentsController', 'modules.AITypeOfDepartments', 1, 14, 17, NULL, '/upload/mainstructure/icon/module/AITypeOfDepartments.png', '2023-07-23 17:55:23', '2023-07-24 09:10:10', 'AITypeOfDepartments', NULL, 1);
INSERT INTO `sys_list_modules` VALUES (71, 'Danh mục tổ bộ môn', 'danh-muc-to-bo-mon', 'Modules\\AITypeOfSubjectTeams\\AITypeOfSubjectTeamsController', 'modules.AITypeOfSubjectTeams', 1, 15, 17, NULL, '/upload/mainstructure/icon/module/AITypeOfSubjectTeams.png', '2023-07-23 17:56:19', '2023-08-02 10:59:33', 'AITypeOfSubjectTeams', NULL, 0);
INSERT INTO `sys_list_modules` VALUES (72, 'Chính sách trong giáo dục nghề nghiệp', 'chinh-sach-trong-giao-duc-nghe-nghiep', 'Modules\\AIVocationalEducationPolicities\\AIVocationalEducationPolicitiesController', 'modules.AIVocationalEducationPolicities', 1, 5, 18, NULL, '/upload/mainstructure/icon/module/AIVocationalEducationPolicities.png', '2023-07-24 09:15:50', '2023-08-13 22:32:19', 'AIVocationalEducationPolicities', NULL, 1);
INSERT INTO `sys_list_modules` VALUES (73, 'Thông tin chương trình đào tạo', 'thong-tin-chuong-trinh-dao-tao', 'Modules\\AITrainingProgramInformations\\AITrainingProgramInformationsController', 'modules.AITrainingProgramInformations', 1, 0, 19, NULL, '/upload/mainstructure/icon/module/AITrainingProgramInformations.png', '2023-07-24 09:18:09', '2023-08-14 15:44:47', 'AITrainingProgramInformations', NULL, 1);
INSERT INTO `sys_list_modules` VALUES (74, 'Chuyên ngành đào tạo', 'chuyen-nganh-dao-tao', 'Modules\\AITrainingSpecialties\\AITrainingSpecialtiesController', 'modules.AITrainingSpecialties', 1, 1, 17, NULL, '/upload/mainstructure/icon/module/AITrainingSpecialties.png', '2023-07-24 09:36:55', '2023-08-14 15:36:45', 'AITrainingSpecialties', NULL, 1);
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
) ENGINE = InnoDB AUTO_INCREMENT = 1485 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = COMPACT;

-- ----------------------------
-- Records of sys_logs
-- ----------------------------
INSERT INTO `sys_logs` VALUES (98, 'Đăng nhập', 'Đăng nhập thành công', 1, 'Tài khoản: admin', '2022-07-01 15:02:30', '2022-07-01 15:02:30');
INSERT INTO `sys_logs` VALUES (99, 'Đăng nhập', 'Đăng nhập', 1, '', '2022-07-01 15:04:05', '2022-07-01 15:04:05');
INSERT INTO `sys_logs` VALUES (100, 'Đăng nhập', 'Đăng nhập', 4, '', '2022-07-01 15:07:45', '2022-07-01 15:07:45');
INSERT INTO `sys_logs` VALUES (101, 'Đăng nhập', 'Đăng nhập', 1, '', '2022-07-01 15:07:58', '2022-07-01 15:07:58');
INSERT INTO `sys_logs` VALUES (102, 'Doanh nghiệp nông nghiệp', 'Thêm mới', 1, 'Doanh nghiệpsad', '2022-07-01 15:08:42', '2022-07-01 15:08:42');
INSERT INTO `sys_logs` VALUES (103, 'Doanh nghiệp nông nghiệp', 'Sửa', 1, 'Doanh nghiệpdoanh nghiệp abc', '2022-07-01 15:10:58', '2022-07-01 15:10:58');
INSERT INTO `sys_logs` VALUES (104, 'Đăng nhập', 'Đăng nhập', 4, '', '2022-07-01 15:15:22', '2022-07-01 15:15:22');
INSERT INTO `sys_logs` VALUES (105, 'Doanh nghiệp nông nghiệp', 'Sửa', 4, 'Doanh nghiệpdoanh nghiệp abc1', '2022-07-01 15:50:44', '2022-07-01 15:50:44');
INSERT INTO `sys_logs` VALUES (106, 'Doanh nghiệp nông nghiệp', 'Xoá', 4, 'Doanh nghiệpa', '2022-07-01 15:52:17', '2022-07-01 15:52:17');
INSERT INTO `sys_logs` VALUES (107, 'Đăng nhập', 'Đăng nhập', 1, '', '2022-07-01 16:38:41', '2022-07-01 16:38:41');
INSERT INTO `sys_logs` VALUES (108, 'Đăng nhập', 'Đăng nhập', 4, '', '2022-07-01 16:45:01', '2022-07-01 16:45:01');
INSERT INTO `sys_logs` VALUES (109, 'Sản phẩm nông nghiệp', 'Thêm mới', 4, 'Sản phẩm: 1111111', '2022-07-01 16:45:20', '2022-07-01 16:45:20');
INSERT INTO `sys_logs` VALUES (110, 'Sản phẩm nông nghiệp', 'Sửa', 4, 'Sản phẩm: TTT2', '2022-07-01 16:45:57', '2022-07-01 16:45:57');
INSERT INTO `sys_logs` VALUES (111, 'Sản phẩm nông nghiệp', 'Xoá', 4, 'Sản phẩm: 23', '2022-07-01 16:46:02', '2022-07-01 16:46:02');
INSERT INTO `sys_logs` VALUES (112, 'Sản phẩm nông nghiệp', 'Thêm mới', 4, 'Sản phẩm: 1122223333', '2022-07-01 16:49:34', '2022-07-01 16:49:34');
INSERT INTO `sys_logs` VALUES (113, 'Sản phẩm nông nghiệp', 'Thêm mới', 4, 'Sản phẩm: test1', '2022-07-01 16:50:44', '2022-07-01 16:50:44');
INSERT INTO `sys_logs` VALUES (114, 'Danh mục nông nghiệp', 'Thêm mới', 4, 'Danh mục: 1223', '2022-07-01 17:01:39', '2022-07-01 17:01:39');
INSERT INTO `sys_logs` VALUES (115, 'Danh mục nông nghiệp', 'Sửa', 4, 'Danh mục: 21631', '2022-07-01 17:03:12', '2022-07-01 17:03:12');
INSERT INTO `sys_logs` VALUES (116, 'Đăng nhập', 'Đăng nhập', 1, '', '2022-07-07 08:59:33', '2022-07-07 08:59:33');
INSERT INTO `sys_logs` VALUES (117, 'Đăng nhập', 'Đăng nhập', 4, '', '2022-07-07 09:20:55', '2022-07-07 09:20:55');
INSERT INTO `sys_logs` VALUES (118, 'Đăng nhập', 'Đăng nhập', 1, '', '2022-07-07 10:38:00', '2022-07-07 10:38:00');
INSERT INTO `sys_logs` VALUES (119, 'Đăng nhập', 'Đăng nhập', 1, '', '2022-07-11 08:18:42', '2022-07-11 08:18:42');
INSERT INTO `sys_logs` VALUES (120, 'Đăng nhập', 'Đăng nhập', 1, '', '2022-07-11 14:10:33', '2022-07-11 14:10:33');
INSERT INTO `sys_logs` VALUES (121, 'Đăng nhập', 'Đăng nhập', 4, '', '2022-07-11 14:32:16', '2022-07-11 14:32:16');
INSERT INTO `sys_logs` VALUES (122, 'Đăng nhập', 'Đăng nhập', 1, '', '2022-07-12 08:03:37', '2022-07-12 08:03:37');
INSERT INTO `sys_logs` VALUES (123, 'Đăng nhập', 'Đăng nhập', 1, '', '2022-07-12 08:03:44', '2022-07-12 08:03:44');
INSERT INTO `sys_logs` VALUES (124, 'Phân quyền chức năng', 'Sửa đổi', 1, 'Doanh nghiệp: test', '2022-07-12 08:17:33', '2022-07-12 08:17:33');
INSERT INTO `sys_logs` VALUES (125, 'Quản lý người dùng', 'Thêm mới', 1, 'Tài khoản: sss', '2022-07-12 08:42:23', '2022-07-12 08:42:23');
INSERT INTO `sys_logs` VALUES (126, 'Đăng nhập', 'Đăng nhập', 4, '', '2022-07-12 08:43:13', '2022-07-12 08:43:13');
INSERT INTO `sys_logs` VALUES (127, 'Quản lý người dùng', 'Thêm mới', 4, 'Tài khoản: admin2', '2022-07-12 08:43:27', '2022-07-12 08:43:27');
INSERT INTO `sys_logs` VALUES (128, 'Quản lý người dùng', 'Sửa đổi', 4, 'Tài khoản: admin3', '2022-07-12 08:44:56', '2022-07-12 08:44:56');
INSERT INTO `sys_logs` VALUES (129, 'Quản lý người dùng', 'Sửa đổi', 4, 'Tài khoản: admin3', '2022-07-12 08:45:14', '2022-07-12 08:45:14');
INSERT INTO `sys_logs` VALUES (130, 'Phân quyền module', 'Sửa đổi', 4, 'Phân quyền tài khoản: {\"id\":6,\"account\":\"test\",\"name\":\"test\",\"email\":null,\"numberphone\":null,\"active\":1,\"remember_token\":null,\"created_at\":\"2022-07-11T10:05:56.000000Z\",\"updated_at\":\"2022-07-11T10:05:56.000000Z\"}', '2022-07-12 09:08:12', '2022-07-12 09:08:12');
INSERT INTO `sys_logs` VALUES (131, 'Phân quyền module', 'Sửa đổi', 4, 'Phân quyền tài khoản: {\"id\":6,\"account\":\"test\",\"name\":\"test\",\"email\":null,\"numberphone\":null,\"active\":1,\"remember_token\":null,\"created_at\":\"2022-07-11T10:05:56.000000Z\",\"updated_at\":\"2022-07-11T10:05:56.000000Z\"}', '2022-07-12 09:08:40', '2022-07-12 09:08:40');
INSERT INTO `sys_logs` VALUES (132, 'Phân quyền chức năng', 'Sửa đổi', 4, 'Phân quyền tài khoản: {\"id\":6,\"account\":\"test\",\"name\":\"test\",\"email\":null,\"numberphone\":null,\"active\":1,\"remember_token\":null,\"created_at\":\"2022-07-11T10:05:56.000000Z\",\"updated_at\":\"2022-07-11T10:05:56.000000Z\"}', '2022-07-12 09:08:43', '2022-07-12 09:08:43');
INSERT INTO `sys_logs` VALUES (133, 'Phân quyền chức năng', 'Sửa đổi', 4, 'Phân quyền tài khoản: test', '2022-07-12 09:17:39', '2022-07-12 09:17:39');
INSERT INTO `sys_logs` VALUES (134, 'Đăng nhập', 'Đăng nhập', 1, '', '2022-07-12 15:13:35', '2022-07-12 15:13:35');
INSERT INTO `sys_logs` VALUES (135, 'Đăng nhập', 'Đăng nhập', 1, '', '2022-07-12 15:59:35', '2022-07-12 15:59:35');
INSERT INTO `sys_logs` VALUES (136, 'Đăng nhập', 'Đăng nhập', 1, '', '2022-07-12 16:02:32', '2022-07-12 16:02:32');
INSERT INTO `sys_logs` VALUES (137, 'Đăng nhập', 'Đăng nhập', 1, '', '2022-07-13 08:35:31', '2022-07-13 08:35:31');
INSERT INTO `sys_logs` VALUES (138, 'Đăng nhập', 'Đăng nhập', 1, '', '2022-07-13 08:42:29', '2022-07-13 08:42:29');
INSERT INTO `sys_logs` VALUES (139, 'Đăng nhập', 'Đăng nhập', 1, '', '2022-07-13 15:25:14', '2022-07-13 15:25:14');
INSERT INTO `sys_logs` VALUES (140, 'Đăng nhập', 'Đăng nhập', 1, '', '2022-07-18 10:57:46', '2022-07-18 10:57:46');
INSERT INTO `sys_logs` VALUES (141, 'Đăng nhập', 'Đăng nhập', 1, '', '2022-07-18 14:35:05', '2022-07-18 14:35:05');
INSERT INTO `sys_logs` VALUES (142, 'Đăng nhập', 'Đăng nhập', 1, '', '2022-07-18 14:35:17', '2022-07-18 14:35:17');
INSERT INTO `sys_logs` VALUES (143, 'Đăng nhập', 'Đăng nhập', 1, '', '2022-07-18 14:46:40', '2022-07-18 14:46:40');
INSERT INTO `sys_logs` VALUES (144, 'Đăng nhập', 'Đăng nhập', 1, '', '2022-07-18 14:47:02', '2022-07-18 14:47:02');
INSERT INTO `sys_logs` VALUES (145, 'Đăng nhập', 'Đăng nhập', 1, '', '2022-07-19 07:57:50', '2022-07-19 07:57:50');
INSERT INTO `sys_logs` VALUES (146, 'Đăng nhập', 'Đăng nhập', 1, '', '2022-07-19 10:16:39', '2022-07-19 10:16:39');
INSERT INTO `sys_logs` VALUES (147, 'Đăng nhập', 'Đăng nhập', 1, '', '2022-07-25 10:23:49', '2022-07-25 10:23:49');
INSERT INTO `sys_logs` VALUES (148, 'Đăng nhập', 'Đăng nhập', 1, '', '2022-07-25 10:38:45', '2022-07-25 10:38:45');
INSERT INTO `sys_logs` VALUES (149, 'Đăng nhập', 'Đăng nhập', 1, '', '2022-07-25 14:23:10', '2022-07-25 14:23:10');
INSERT INTO `sys_logs` VALUES (150, 'Đăng nhập', 'Đăng nhập', 1, '', '2022-07-25 14:24:23', '2022-07-25 14:24:23');
INSERT INTO `sys_logs` VALUES (151, 'Phân quyền chức năng', 'Sửa đổi', 1, 'Phân quyền tài khoản: admin3', '2022-07-25 14:24:51', '2022-07-25 14:24:51');
INSERT INTO `sys_logs` VALUES (152, 'Phân quyền chức năng', 'Sửa đổi', 1, 'Phân quyền tài khoản: admin3', '2022-07-25 14:24:52', '2022-07-25 14:24:52');
INSERT INTO `sys_logs` VALUES (153, 'Phân quyền chức năng', 'Sửa đổi', 1, 'Phân quyền tài khoản: admin3', '2022-07-25 14:24:53', '2022-07-25 14:24:53');
INSERT INTO `sys_logs` VALUES (154, 'Phân quyền chức năng', 'Sửa đổi', 1, 'Phân quyền tài khoản: admin3', '2022-07-25 14:24:54', '2022-07-25 14:24:54');
INSERT INTO `sys_logs` VALUES (155, 'Phân quyền chức năng', 'Sửa đổi', 1, 'Phân quyền tài khoản: admin3', '2022-07-25 14:24:54', '2022-07-25 14:24:54');
INSERT INTO `sys_logs` VALUES (156, 'Phân quyền chức năng', 'Sửa đổi', 1, 'Phân quyền tài khoản: admin3', '2022-07-25 14:24:54', '2022-07-25 14:24:54');
INSERT INTO `sys_logs` VALUES (157, 'Phân quyền chức năng', 'Sửa đổi', 1, 'Phân quyền tài khoản: admin3', '2022-07-25 14:24:54', '2022-07-25 14:24:54');
INSERT INTO `sys_logs` VALUES (158, 'Phân quyền chức năng', 'Sửa đổi', 1, 'Phân quyền tài khoản: admin3', '2022-07-25 14:24:55', '2022-07-25 14:24:55');
INSERT INTO `sys_logs` VALUES (159, 'Phân quyền module', 'Sửa đổi', 1, 'Phân quyền tài khoản: admin3', '2022-07-25 14:25:00', '2022-07-25 14:25:00');
INSERT INTO `sys_logs` VALUES (160, 'Phân quyền module', 'Sửa đổi', 1, 'Phân quyền tài khoản: admin3', '2022-07-25 14:25:02', '2022-07-25 14:25:02');
INSERT INTO `sys_logs` VALUES (161, 'Quản lý người dùng', 'Sửa đổi', 1, 'Tài khoản: test', '2022-07-25 14:35:19', '2022-07-25 14:35:19');
INSERT INTO `sys_logs` VALUES (162, 'Quản lý người dùng', 'Sửa đổi', 1, 'Tài khoản: test', '2022-07-25 14:54:24', '2022-07-25 14:54:24');
INSERT INTO `sys_logs` VALUES (163, 'Quản lý người dùng', 'Sửa đổi', 1, 'Tài khoản: test', '2022-07-25 14:57:40', '2022-07-25 14:57:40');
INSERT INTO `sys_logs` VALUES (164, 'Quản lý người dùng', 'Sửa đổi', 1, 'Tài khoản: test', '2022-07-25 14:58:01', '2022-07-25 14:58:01');
INSERT INTO `sys_logs` VALUES (165, 'Quản lý người dùng', 'Sửa đổi', 1, 'Tài khoản: test', '2022-07-25 14:58:23', '2022-07-25 14:58:23');
INSERT INTO `sys_logs` VALUES (166, 'Đăng nhập', 'Đăng nhập', 6, '', '2022-07-25 14:58:42', '2022-07-25 14:58:42');
INSERT INTO `sys_logs` VALUES (167, 'Quản lý người dùng', 'Sửa đổi', 1, 'Tài khoản: test', '2022-07-25 14:58:48', '2022-07-25 14:58:48');
INSERT INTO `sys_logs` VALUES (168, 'Quản lý người dùng', 'Sửa đổi', 1, 'Tài khoản: test', '2022-07-25 15:03:25', '2022-07-25 15:03:25');
INSERT INTO `sys_logs` VALUES (169, 'Quản lý người dùng', 'Sửa đổi', 1, 'Tài khoản: test', '2022-07-25 15:03:34', '2022-07-25 15:03:34');
INSERT INTO `sys_logs` VALUES (170, 'Đăng nhập', 'Đăng nhập', 6, '', '2022-07-25 15:03:40', '2022-07-25 15:03:40');
INSERT INTO `sys_logs` VALUES (171, 'Phân quyền chức năng', 'Sửa đổi', 1, 'Phân quyền tài khoản: admin3', '2022-07-25 15:04:22', '2022-07-25 15:04:22');
INSERT INTO `sys_logs` VALUES (172, 'Quản lý người dùng', 'Sửa đổi', 1, 'Tài khoản: test', '2022-07-25 15:04:49', '2022-07-25 15:04:49');
INSERT INTO `sys_logs` VALUES (173, 'Đăng nhập', 'Đăng nhập', 6, '', '2022-07-25 15:05:01', '2022-07-25 15:05:01');
INSERT INTO `sys_logs` VALUES (174, 'Quản lý người dùng', 'Sửa đổi', 1, 'Tài khoản: test', '2022-07-25 15:05:05', '2022-07-25 15:05:05');
INSERT INTO `sys_logs` VALUES (175, 'Phân quyền module', 'Sửa đổi', 1, 'Phân quyền tài khoản: admin3', '2022-07-25 15:05:50', '2022-07-25 15:05:50');
INSERT INTO `sys_logs` VALUES (176, 'Phân quyền chức năng', 'Sửa đổi', 1, 'Phân quyền tài khoản: test', '2022-07-25 15:06:39', '2022-07-25 15:06:39');
INSERT INTO `sys_logs` VALUES (177, 'Phân quyền module', 'Sửa đổi', 1, 'Phân quyền tài khoản: test', '2022-07-25 15:07:24', '2022-07-25 15:07:24');
INSERT INTO `sys_logs` VALUES (178, 'Phân quyền chức năng', 'Sửa đổi', 1, 'Phân quyền tài khoản: test', '2022-07-25 15:10:52', '2022-07-25 15:10:52');
INSERT INTO `sys_logs` VALUES (179, 'Phân quyền chức năng', 'Sửa đổi', 1, 'Phân quyền tài khoản: test', '2022-07-25 15:11:00', '2022-07-25 15:11:00');
INSERT INTO `sys_logs` VALUES (180, 'Phân quyền module', 'Sửa đổi', 1, 'Phân quyền tài khoản: test', '2022-07-25 15:12:36', '2022-07-25 15:12:36');
INSERT INTO `sys_logs` VALUES (181, 'Đăng nhập', 'Đăng nhập', 6, '', '2022-07-25 15:20:03', '2022-07-25 15:20:03');
INSERT INTO `sys_logs` VALUES (182, 'Đăng nhập', 'Đăng nhập', 1, '', '2022-07-25 15:20:13', '2022-07-25 15:20:13');
INSERT INTO `sys_logs` VALUES (183, 'Phân quyền module', 'Sửa đổi', 1, 'Phân quyền tài khoản: test', '2022-07-25 15:23:18', '2022-07-25 15:23:18');
INSERT INTO `sys_logs` VALUES (184, 'Phân quyền module', 'Sửa đổi', 1, 'Phân quyền tài khoản: test', '2022-07-25 15:24:21', '2022-07-25 15:24:21');
INSERT INTO `sys_logs` VALUES (185, 'Phân quyền chức năng', 'Sửa đổi', 1, 'Phân quyền tài khoản: test', '2022-07-25 15:50:02', '2022-07-25 15:50:02');
INSERT INTO `sys_logs` VALUES (186, 'Phân quyền module', 'Sửa đổi', 6, 'Phân quyền tài khoản: test3', '2022-07-25 15:50:16', '2022-07-25 15:50:16');
INSERT INTO `sys_logs` VALUES (187, 'Phân quyền module', 'Sửa đổi', 1, 'Phân quyền tài khoản: test', '2022-07-25 15:56:25', '2022-07-25 15:56:25');
INSERT INTO `sys_logs` VALUES (188, 'Phân quyền module', 'Sửa đổi', 1, 'Phân quyền tài khoản: test', '2022-07-25 15:57:15', '2022-07-25 15:57:15');
INSERT INTO `sys_logs` VALUES (189, 'Phân quyền module', 'Sửa đổi', 1, 'Phân quyền tài khoản: test', '2022-07-25 15:57:37', '2022-07-25 15:57:37');
INSERT INTO `sys_logs` VALUES (190, 'Phân quyền module', 'Sửa đổi', 1, 'Phân quyền tài khoản: test', '2022-07-25 15:59:04', '2022-07-25 15:59:04');
INSERT INTO `sys_logs` VALUES (191, 'Phân quyền module', 'Sửa đổi', 1, 'Phân quyền tài khoản: test', '2022-07-25 15:59:48', '2022-07-25 15:59:48');
INSERT INTO `sys_logs` VALUES (192, 'Phân quyền module', 'Sửa đổi', 1, 'Phân quyền tài khoản: test', '2022-07-25 16:00:01', '2022-07-25 16:00:01');
INSERT INTO `sys_logs` VALUES (193, 'Phân quyền module', 'Sửa đổi', 1, 'Phân quyền tài khoản: test', '2022-07-25 16:00:32', '2022-07-25 16:00:32');
INSERT INTO `sys_logs` VALUES (194, 'Phân quyền module', 'Sửa đổi', 1, 'Phân quyền tài khoản: test', '2022-07-25 16:01:21', '2022-07-25 16:01:21');
INSERT INTO `sys_logs` VALUES (195, 'Phân quyền module', 'Sửa đổi', 1, 'Phân quyền tài khoản: test', '2022-07-25 16:01:36', '2022-07-25 16:01:36');
INSERT INTO `sys_logs` VALUES (196, 'Phân quyền module', 'Sửa đổi', 1, 'Phân quyền tài khoản: test', '2022-07-25 16:01:51', '2022-07-25 16:01:51');
INSERT INTO `sys_logs` VALUES (197, 'Phân quyền module', 'Sửa đổi', 1, 'Phân quyền tài khoản: test', '2022-07-25 16:02:46', '2022-07-25 16:02:46');
INSERT INTO `sys_logs` VALUES (198, 'Phân quyền module', 'Sửa đổi', 1, 'Phân quyền tài khoản: test', '2022-07-25 16:03:02', '2022-07-25 16:03:02');
INSERT INTO `sys_logs` VALUES (199, 'Phân quyền module', 'Sửa đổi', 1, 'Phân quyền tài khoản: test', '2022-07-25 16:03:43', '2022-07-25 16:03:43');
INSERT INTO `sys_logs` VALUES (200, 'Phân quyền module', 'Sửa đổi', 1, 'Phân quyền tài khoản: test', '2022-07-25 16:03:54', '2022-07-25 16:03:54');
INSERT INTO `sys_logs` VALUES (201, 'Phân quyền module', 'Sửa đổi', 1, 'Phân quyền tài khoản: test', '2022-07-25 16:04:03', '2022-07-25 16:04:03');
INSERT INTO `sys_logs` VALUES (202, 'Phân quyền module', 'Sửa đổi', 1, 'Phân quyền tài khoản: test', '2022-07-25 16:04:19', '2022-07-25 16:04:19');
INSERT INTO `sys_logs` VALUES (203, 'Đăng nhập', 'Đăng nhập', 1, '', '2022-07-25 16:08:51', '2022-07-25 16:08:51');
INSERT INTO `sys_logs` VALUES (204, 'Phân quyền module', 'Sửa đổi', 1, 'Phân quyền tài khoản: test', '2022-07-25 16:11:12', '2022-07-25 16:11:12');
INSERT INTO `sys_logs` VALUES (205, 'Phân quyền chức năng', 'Sửa đổi', 1, 'Phân quyền tài khoản: test', '2022-07-25 16:56:23', '2022-07-25 16:56:23');
INSERT INTO `sys_logs` VALUES (206, 'Phân quyền module', 'Sửa đổi', 1, 'Phân quyền tài khoản: admin3', '2022-07-25 17:08:24', '2022-07-25 17:08:24');
INSERT INTO `sys_logs` VALUES (207, 'Đăng nhập', 'Đăng nhập', 1, '', '2022-07-26 14:59:13', '2022-07-26 14:59:13');
INSERT INTO `sys_logs` VALUES (208, 'Đăng nhập', 'Đăng nhập', 1, '', '2022-07-27 13:52:17', '2022-07-27 13:52:17');
INSERT INTO `sys_logs` VALUES (209, 'Phân quyền module', 'Sửa đổi', 1, 'Phân quyền tài khoản: admin3', '2022-07-27 14:17:54', '2022-07-27 14:17:54');
INSERT INTO `sys_logs` VALUES (210, 'Phân quyền module', 'Sửa đổi', 1, 'Phân quyền tài khoản: admin3', '2022-07-27 15:11:23', '2022-07-27 15:11:23');
INSERT INTO `sys_logs` VALUES (211, 'Phân quyền module', 'Sửa đổi', 1, 'Phân quyền tài khoản: test', '2022-07-27 15:11:30', '2022-07-27 15:11:30');
INSERT INTO `sys_logs` VALUES (212, 'Phân quyền module', 'Sửa đổi', 1, 'Phân quyền tài khoản: admin3', '2022-07-27 15:11:33', '2022-07-27 15:11:33');
INSERT INTO `sys_logs` VALUES (213, 'Phân quyền module', 'Sửa đổi', 1, 'Phân quyền tài khoản: sss', '2022-07-27 15:11:45', '2022-07-27 15:11:45');
INSERT INTO `sys_logs` VALUES (214, 'Đăng nhập', 'Đăng nhập', 6, '', '2022-07-27 15:15:54', '2022-07-27 15:15:54');
INSERT INTO `sys_logs` VALUES (215, 'Đăng nhập', 'Đăng nhập', 1, '', '2022-07-27 15:16:06', '2022-07-27 15:16:06');
INSERT INTO `sys_logs` VALUES (216, 'Phân quyền chức năng', 'Sửa đổi', 1, 'Phân quyền tài khoản: test', '2022-07-27 15:16:56', '2022-07-27 15:16:56');
INSERT INTO `sys_logs` VALUES (217, 'Phân quyền chức năng', 'Sửa đổi', 1, 'Phân quyền tài khoản: test', '2022-07-27 15:17:22', '2022-07-27 15:17:22');
INSERT INTO `sys_logs` VALUES (218, 'Phân quyền chức năng', 'Sửa đổi', 1, 'Phân quyền tài khoản: test', '2022-07-27 15:20:20', '2022-07-27 15:20:20');
INSERT INTO `sys_logs` VALUES (219, 'Phân quyền module', 'Sửa đổi', 1, 'Phân quyền tài khoản: test', '2022-07-27 15:20:59', '2022-07-27 15:20:59');
INSERT INTO `sys_logs` VALUES (220, 'Đăng nhập', 'Đăng nhập', 1, '', '2022-07-27 15:21:15', '2022-07-27 15:21:15');
INSERT INTO `sys_logs` VALUES (221, 'Phân quyền module', 'Sửa đổi', 1, 'Phân quyền tài khoản: test', '2022-07-27 15:21:23', '2022-07-27 15:21:23');
INSERT INTO `sys_logs` VALUES (222, 'Phân quyền module', 'Sửa đổi', 1, 'Phân quyền tài khoản: test', '2022-07-27 15:22:38', '2022-07-27 15:22:38');
INSERT INTO `sys_logs` VALUES (223, 'Phân quyền chức năng', 'Sửa đổi', 1, 'Phân quyền tài khoản: test', '2022-07-27 15:49:36', '2022-07-27 15:49:36');
INSERT INTO `sys_logs` VALUES (224, 'Phân quyền chức năng', 'Sửa đổi', 1, 'Phân quyền tài khoản: test', '2022-07-27 15:49:51', '2022-07-27 15:49:51');
INSERT INTO `sys_logs` VALUES (225, 'Phân quyền chức năng', 'Sửa đổi', 1, 'Phân quyền tài khoản: test', '2022-07-27 15:50:23', '2022-07-27 15:50:23');
INSERT INTO `sys_logs` VALUES (226, 'Phân quyền chức năng', 'Sửa đổi', 1, 'Phân quyền tài khoản: test', '2022-07-27 15:50:33', '2022-07-27 15:50:33');
INSERT INTO `sys_logs` VALUES (227, 'Đăng nhập', 'Đăng nhập', 6, '', '2022-07-27 15:50:50', '2022-07-27 15:50:50');
INSERT INTO `sys_logs` VALUES (228, 'Đăng nhập', 'Đăng nhập', 1, '', '2022-07-27 15:54:52', '2022-07-27 15:54:52');
INSERT INTO `sys_logs` VALUES (229, 'Phân quyền module', 'Sửa đổi', 1, 'Phân quyền tài khoản: test', '2022-07-27 15:55:04', '2022-07-27 15:55:04');
INSERT INTO `sys_logs` VALUES (230, 'Phân quyền module', 'Sửa đổi', 1, 'Phân quyền tài khoản: test', '2022-07-27 15:55:21', '2022-07-27 15:55:21');
INSERT INTO `sys_logs` VALUES (231, 'Phân quyền chức năng', 'Sửa đổi', 1, 'Phân quyền tài khoản: test', '2022-07-27 15:55:38', '2022-07-27 15:55:38');
INSERT INTO `sys_logs` VALUES (232, 'Phân quyền chức năng', 'Sửa đổi', 1, 'Phân quyền tài khoản: test', '2022-07-27 15:55:47', '2022-07-27 15:55:47');
INSERT INTO `sys_logs` VALUES (233, 'Phân quyền chức năng', 'Sửa đổi', 1, 'Phân quyền tài khoản: test', '2022-07-27 15:55:53', '2022-07-27 15:55:53');
INSERT INTO `sys_logs` VALUES (234, 'Phân quyền chức năng', 'Sửa đổi', 1, 'Phân quyền tài khoản: test', '2022-07-27 15:56:03', '2022-07-27 15:56:03');
INSERT INTO `sys_logs` VALUES (235, 'Đăng nhập', 'Đăng nhập', 1, '', '2022-07-27 15:56:16', '2022-07-27 15:56:16');
INSERT INTO `sys_logs` VALUES (236, 'Phân quyền chức năng', 'Sửa đổi', 1, 'Phân quyền tài khoản: test', '2022-07-27 15:56:40', '2022-07-27 15:56:40');
INSERT INTO `sys_logs` VALUES (237, 'Phân quyền module', 'Sửa đổi', 1, 'Phân quyền tài khoản: test', '2022-07-27 16:05:46', '2022-07-27 16:05:46');
INSERT INTO `sys_logs` VALUES (238, 'Phân quyền module', 'Sửa đổi', 1, 'Phân quyền tài khoản: test', '2022-07-27 16:05:55', '2022-07-27 16:05:55');
INSERT INTO `sys_logs` VALUES (239, 'Đăng nhập', 'Đăng nhập', 6, '', '2022-07-27 16:06:14', '2022-07-27 16:06:14');
INSERT INTO `sys_logs` VALUES (240, 'Phân quyền module', 'Sửa đổi', 1, 'Phân quyền tài khoản: test', '2022-07-27 16:06:36', '2022-07-27 16:06:36');
INSERT INTO `sys_logs` VALUES (241, 'Phân quyền chức năng', 'Sửa đổi', 1, 'Phân quyền tài khoản: test', '2022-07-27 16:08:49', '2022-07-27 16:08:49');
INSERT INTO `sys_logs` VALUES (242, 'Phân quyền chức năng', 'Sửa đổi', 1, 'Phân quyền tài khoản: test', '2022-07-27 16:08:57', '2022-07-27 16:08:57');
INSERT INTO `sys_logs` VALUES (243, 'Phân quyền module', 'Sửa đổi', 1, 'Phân quyền tài khoản: test', '2022-07-27 16:32:33', '2022-07-27 16:32:33');
INSERT INTO `sys_logs` VALUES (244, 'Doanh nghiệp nông nghiệp', 'Thêm mới', 6, 'Doanh nghiệp: Thái Đình Cẩn', '2022-07-27 16:32:46', '2022-07-27 16:32:46');
INSERT INTO `sys_logs` VALUES (245, 'Phân quyền module', 'Sửa đổi', 1, 'Phân quyền tài khoản: test', '2022-07-27 16:32:55', '2022-07-27 16:32:55');
INSERT INTO `sys_logs` VALUES (246, 'Doanh nghiệp nông nghiệp', 'Xoá', 6, 'Doanh nghiệp: sad', '2022-07-27 16:33:40', '2022-07-27 16:33:40');
INSERT INTO `sys_logs` VALUES (247, 'Doanh nghiệp nông nghiệp', 'Xoá', 6, 'Doanh nghiệp: Thái Đình Cẩn', '2022-07-27 16:33:50', '2022-07-27 16:33:50');
INSERT INTO `sys_logs` VALUES (248, 'Phân quyền module', 'Sửa đổi', 1, 'Phân quyền tài khoản: test', '2022-07-27 16:37:38', '2022-07-27 16:37:38');
INSERT INTO `sys_logs` VALUES (249, 'Doanh nghiệp nông nghiệp', 'Sửa', 6, 'Doanh nghiệp: fds', '2022-07-27 16:39:23', '2022-07-27 16:39:23');
INSERT INTO `sys_logs` VALUES (250, 'Doanh nghiệp nông nghiệp', 'Sửa', 6, 'Doanh nghiệp: fds', '2022-07-27 16:39:27', '2022-07-27 16:39:27');
INSERT INTO `sys_logs` VALUES (251, 'Phân quyền module', 'Sửa đổi', 1, 'Phân quyền tài khoản: test', '2022-07-27 16:40:56', '2022-07-27 16:40:56');
INSERT INTO `sys_logs` VALUES (252, 'Sản phẩm nông nghiệp', 'Thêm mới', 6, 'Sản phẩm: hjhn', '2022-07-27 16:41:12', '2022-07-27 16:41:12');
INSERT INTO `sys_logs` VALUES (253, 'Sản phẩm nông nghiệp', 'Thêm mới', 6, 'Sản phẩm: hhh', '2022-07-27 16:41:55', '2022-07-27 16:41:55');
INSERT INTO `sys_logs` VALUES (254, 'Phân quyền module', 'Sửa đổi', 1, 'Phân quyền tài khoản: test', '2022-07-27 16:42:46', '2022-07-27 16:42:46');
INSERT INTO `sys_logs` VALUES (255, 'Sản phẩm nông nghiệp', 'Sửa', 6, 'Sản phẩm: hhh1', '2022-07-27 16:42:57', '2022-07-27 16:42:57');
INSERT INTO `sys_logs` VALUES (256, 'Sản phẩm nông nghiệp', 'Thêm ảnh', 6, 'Sản phẩm: hjhn; Tên ảnh: Jd1a_25694.png', '2022-07-27 16:49:21', '2022-07-27 16:49:21');
INSERT INTO `sys_logs` VALUES (257, 'Sản phẩm nông nghiệp', 'Sửa ảnh', 6, 'Sản phẩm: hjhn; Tên ảnh: Jd1a_25694.png', '2022-07-27 16:54:53', '2022-07-27 16:54:53');
INSERT INTO `sys_logs` VALUES (258, 'Sản phẩm nông nghiệp', 'Sửa ảnh', 6, 'Sản phẩm: hjhn; Tên ảnh: Jd1a_25694.png', '2022-07-27 16:55:58', '2022-07-27 16:55:58');
INSERT INTO `sys_logs` VALUES (259, 'Sản phẩm nông nghiệp', 'Sửa', 6, 'Sản phẩm: hjhn2', '2022-07-27 16:56:31', '2022-07-27 16:56:31');
INSERT INTO `sys_logs` VALUES (260, 'Sản phẩm nông nghiệp', 'Sửa', 6, 'Sản phẩm: hjhn2', '2022-07-27 16:59:33', '2022-07-27 16:59:33');
INSERT INTO `sys_logs` VALUES (261, 'Sản phẩm nông nghiệp', 'Sửa', 6, 'Sản phẩm: hjhn2', '2022-07-27 16:59:53', '2022-07-27 16:59:53');
INSERT INTO `sys_logs` VALUES (262, 'Đăng nhập', 'Đăng nhập', 6, '', '2022-07-28 08:55:46', '2022-07-28 08:55:46');
INSERT INTO `sys_logs` VALUES (263, 'Đăng nhập', 'Đăng nhập', 1, '', '2022-07-28 09:00:57', '2022-07-28 09:00:57');
INSERT INTO `sys_logs` VALUES (264, 'Phân quyền module', 'Sửa đổi', 1, 'Phân quyền tài khoản: test', '2022-07-28 09:01:08', '2022-07-28 09:01:08');
INSERT INTO `sys_logs` VALUES (265, 'Sản phẩm nông nghiệp', 'Xoá', 6, 'Sản phẩm: a', '2022-07-28 09:01:15', '2022-07-28 09:01:15');
INSERT INTO `sys_logs` VALUES (266, 'Sản phẩm nông nghiệp', 'Xoá', 6, 'Sản phẩm: 111111', '2022-07-28 09:01:21', '2022-07-28 09:01:21');
INSERT INTO `sys_logs` VALUES (267, 'Phân quyền module', 'Sửa đổi', 1, 'Phân quyền tài khoản: test', '2022-07-28 09:04:36', '2022-07-28 09:04:36');
INSERT INTO `sys_logs` VALUES (268, 'Phân quyền module', 'Sửa đổi', 1, 'Phân quyền tài khoản: test', '2022-07-28 09:15:20', '2022-07-28 09:15:20');
INSERT INTO `sys_logs` VALUES (269, 'Phân quyền module', 'Sửa đổi', 1, 'Phân quyền tài khoản: test', '2022-07-28 09:15:38', '2022-07-28 09:15:38');
INSERT INTO `sys_logs` VALUES (270, 'Phân quyền module', 'Sửa đổi', 1, 'Phân quyền tài khoản: test', '2022-07-28 09:16:51', '2022-07-28 09:16:51');
INSERT INTO `sys_logs` VALUES (271, 'Phân quyền module', 'Sửa đổi', 1, 'Phân quyền tài khoản: test', '2022-07-28 09:23:13', '2022-07-28 09:23:13');
INSERT INTO `sys_logs` VALUES (272, 'Danh mục nông nghiệp', 'Thêm mới', 6, 'Danh mục: eee', '2022-07-28 09:25:20', '2022-07-28 09:25:20');
INSERT INTO `sys_logs` VALUES (273, 'Danh mục nông nghiệp', 'Sửa', 6, 'Danh mục: eee1', '2022-07-28 09:29:46', '2022-07-28 09:29:46');
INSERT INTO `sys_logs` VALUES (274, 'Doanh nghiệp nông nghiệp', 'Sửa', 6, 'Doanh nghiệp: doanh nghiệp abc1', '2022-07-28 09:35:14', '2022-07-28 09:35:14');
INSERT INTO `sys_logs` VALUES (275, 'Doanh nghiệp nông nghiệp', 'Xoá', 6, 'Doanh nghiệp: fds', '2022-07-28 09:35:21', '2022-07-28 09:35:21');
INSERT INTO `sys_logs` VALUES (276, 'Doanh nghiệp nông nghiệp', 'Sửa', 6, 'Doanh nghiệp: doanh nghiệp abc1', '2022-07-28 09:35:56', '2022-07-28 09:35:56');
INSERT INTO `sys_logs` VALUES (277, 'Doanh nghiệp nông nghiệp', 'Sửa', 6, 'Doanh nghiệp: doanh nghiệp abc1', '2022-07-28 09:41:43', '2022-07-28 09:41:43');
INSERT INTO `sys_logs` VALUES (278, 'Doanh nghiệp nông nghiệp', 'Sửa', 6, 'Doanh nghiệp: doanh nghiệp abc1', '2022-07-28 09:41:58', '2022-07-28 09:41:58');
INSERT INTO `sys_logs` VALUES (279, 'Phân quyền module', 'Sửa đổi', 1, 'Phân quyền tài khoản: test', '2022-07-28 09:50:57', '2022-07-28 09:50:57');
INSERT INTO `sys_logs` VALUES (280, 'Danh mục nông nghiệp', 'Xoá', 6, 'Danh mục: eee1', '2022-07-28 09:51:07', '2022-07-28 09:51:07');
INSERT INTO `sys_logs` VALUES (281, 'Đăng nhập', 'Đăng nhập', 1, '', '2022-07-28 10:10:19', '2022-07-28 10:10:19');
INSERT INTO `sys_logs` VALUES (282, 'Đăng nhập', 'Đăng nhập', 6, '', '2022-07-28 10:16:21', '2022-07-28 10:16:21');
INSERT INTO `sys_logs` VALUES (283, 'Đăng nhập', 'Đăng nhập', 6, '', '2022-07-28 14:56:45', '2022-07-28 14:56:45');
INSERT INTO `sys_logs` VALUES (284, 'Đăng nhập', 'Đăng nhập', 1, '', '2022-07-28 14:56:51', '2022-07-28 14:56:51');
INSERT INTO `sys_logs` VALUES (285, 'Phân quyền module', 'Sửa đổi', 1, 'Phân quyền tài khoản: test', '2022-07-28 14:57:12', '2022-07-28 14:57:12');
INSERT INTO `sys_logs` VALUES (286, 'Phân quyền module', 'Sửa đổi', 1, 'Phân quyền tài khoản: test', '2022-07-28 15:19:01', '2022-07-28 15:19:01');
INSERT INTO `sys_logs` VALUES (287, 'Phân quyền module', 'Sửa đổi', 1, 'Phân quyền tài khoản: test', '2022-07-28 15:25:26', '2022-07-28 15:25:26');
INSERT INTO `sys_logs` VALUES (288, 'Phân quyền module', 'Sửa đổi', 1, 'Phân quyền tài khoản: test', '2022-07-28 15:52:37', '2022-07-28 15:52:37');
INSERT INTO `sys_logs` VALUES (289, 'Phân quyền module', 'Sửa đổi', 1, 'Phân quyền tài khoản: test', '2022-07-28 15:52:57', '2022-07-28 15:52:57');
INSERT INTO `sys_logs` VALUES (290, 'Phân quyền module', 'Sửa đổi', 1, 'Phân quyền tài khoản: test', '2022-07-28 15:53:05', '2022-07-28 15:53:05');
INSERT INTO `sys_logs` VALUES (291, 'Phân quyền module', 'Sửa đổi', 1, 'Phân quyền tài khoản: test', '2022-07-28 15:56:31', '2022-07-28 15:56:31');
INSERT INTO `sys_logs` VALUES (292, 'Đăng nhập', 'Đăng nhập', 6, '', '2022-07-29 09:21:30', '2022-07-29 09:21:30');
INSERT INTO `sys_logs` VALUES (293, 'Đăng nhập', 'Đăng nhập', 1, '', '2022-07-29 09:21:58', '2022-07-29 09:21:58');
INSERT INTO `sys_logs` VALUES (294, 'Phân quyền module', 'Sửa đổi', 1, 'Phân quyền tài khoản: test', '2022-07-29 09:22:09', '2022-07-29 09:22:09');
INSERT INTO `sys_logs` VALUES (295, 'Phân quyền module', 'Sửa đổi', 1, 'Phân quyền tài khoản: test', '2022-07-29 09:22:29', '2022-07-29 09:22:29');
INSERT INTO `sys_logs` VALUES (296, 'Phân quyền module', 'Sửa đổi', 1, 'Phân quyền tài khoản: test', '2022-07-29 10:30:29', '2022-07-29 10:30:29');
INSERT INTO `sys_logs` VALUES (297, 'Phân quyền module', 'Sửa đổi', 1, 'Phân quyền tài khoản: test', '2022-07-29 10:40:02', '2022-07-29 10:40:02');
INSERT INTO `sys_logs` VALUES (298, 'Đăng nhập', 'Đăng nhập', 6, '', '2022-08-01 08:16:06', '2022-08-01 08:16:06');
INSERT INTO `sys_logs` VALUES (299, 'Đăng nhập', 'Đăng nhập', 1, '', '2022-08-01 09:27:51', '2022-08-01 09:27:51');
INSERT INTO `sys_logs` VALUES (300, 'Phân quyền module', 'Sửa đổi', 1, 'Phân quyền tài khoản: test', '2022-08-01 09:29:24', '2022-08-01 09:29:24');
INSERT INTO `sys_logs` VALUES (301, 'Phân quyền module', 'Sửa đổi', 1, 'Phân quyền tài khoản: test', '2022-08-01 09:35:21', '2022-08-01 09:35:21');
INSERT INTO `sys_logs` VALUES (302, 'Đăng nhập', 'Đăng nhập', 6, '', '2022-08-02 08:58:54', '2022-08-02 08:58:54');
INSERT INTO `sys_logs` VALUES (303, 'Đăng nhập', 'Đăng nhập', 1, '', '2022-08-02 09:00:04', '2022-08-02 09:00:04');
INSERT INTO `sys_logs` VALUES (304, 'Đăng nhập', 'Đăng nhập', 6, '', '2022-08-02 15:31:04', '2022-08-02 15:31:04');
INSERT INTO `sys_logs` VALUES (305, 'Đăng nhập', 'Đăng nhập', 1, '', '2022-08-02 15:32:06', '2022-08-02 15:32:06');
INSERT INTO `sys_logs` VALUES (306, 'Phân quyền module', 'Sửa đổi', 1, 'Phân quyền tài khoản: test', '2022-08-02 15:32:54', '2022-08-02 15:32:54');
INSERT INTO `sys_logs` VALUES (307, 'Phân quyền module', 'Sửa đổi', 1, 'Phân quyền tài khoản: test', '2022-08-02 15:33:03', '2022-08-02 15:33:03');
INSERT INTO `sys_logs` VALUES (308, 'Đăng nhập', 'Đăng nhập', 6, '', '2022-08-03 09:12:23', '2022-08-03 09:12:23');
INSERT INTO `sys_logs` VALUES (309, 'Đăng nhập', 'Đăng nhập', 1, '', '2022-08-03 09:16:57', '2022-08-03 09:16:57');
INSERT INTO `sys_logs` VALUES (310, 'Phân quyền module', 'Sửa đổi', 1, 'Phân quyền tài khoản: test', '2022-08-03 09:35:08', '2022-08-03 09:35:08');
INSERT INTO `sys_logs` VALUES (311, 'Phân quyền module', 'Sửa đổi', 1, 'Phân quyền tài khoản: test', '2022-08-03 09:37:11', '2022-08-03 09:37:11');
INSERT INTO `sys_logs` VALUES (312, 'Phân quyền module', 'Sửa đổi', 1, 'Phân quyền tài khoản: test', '2022-08-03 09:47:30', '2022-08-03 09:47:30');
INSERT INTO `sys_logs` VALUES (313, 'Phân quyền module', 'Sửa đổi', 1, 'Phân quyền tài khoản: test', '2022-08-03 09:52:44', '2022-08-03 09:52:44');
INSERT INTO `sys_logs` VALUES (314, 'Phân quyền module', 'Sửa đổi', 1, 'Phân quyền tài khoản: test', '2022-08-03 09:55:48', '2022-08-03 09:55:48');
INSERT INTO `sys_logs` VALUES (315, 'Phân quyền module', 'Sửa đổi', 1, 'Phân quyền tài khoản: test', '2022-08-03 10:11:00', '2022-08-03 10:11:00');
INSERT INTO `sys_logs` VALUES (316, 'Phân quyền module', 'Sửa đổi', 1, 'Phân quyền tài khoản: test', '2022-08-03 10:19:52', '2022-08-03 10:19:52');
INSERT INTO `sys_logs` VALUES (317, 'Phân quyền module', 'Sửa đổi', 1, 'Phân quyền tài khoản: test', '2022-08-03 10:22:02', '2022-08-03 10:22:02');
INSERT INTO `sys_logs` VALUES (318, 'Phân quyền module', 'Sửa đổi', 1, 'Phân quyền tài khoản: test', '2022-08-03 10:26:23', '2022-08-03 10:26:23');
INSERT INTO `sys_logs` VALUES (319, 'Phân quyền module', 'Sửa đổi', 1, 'Phân quyền tài khoản: test', '2022-08-03 10:26:29', '2022-08-03 10:26:29');
INSERT INTO `sys_logs` VALUES (320, 'Phân quyền module', 'Sửa đổi', 1, 'Phân quyền tài khoản: test', '2022-08-03 10:27:22', '2022-08-03 10:27:22');
INSERT INTO `sys_logs` VALUES (321, 'Phân quyền module', 'Sửa đổi', 1, 'Phân quyền tài khoản: test', '2022-08-03 10:47:05', '2022-08-03 10:47:05');
INSERT INTO `sys_logs` VALUES (322, 'Đăng nhập', 'Đăng nhập', 6, '', '2022-08-03 14:09:35', '2022-08-03 14:09:35');
INSERT INTO `sys_logs` VALUES (323, 'Đăng nhập', 'Đăng nhập', 1, '', '2022-08-03 14:35:21', '2022-08-03 14:35:21');
INSERT INTO `sys_logs` VALUES (324, 'Phân quyền module', 'Sửa đổi', 1, 'Phân quyền tài khoản: test', '2022-08-03 14:35:42', '2022-08-03 14:35:42');
INSERT INTO `sys_logs` VALUES (325, 'Phân quyền module', 'Sửa đổi', 1, 'Phân quyền tài khoản: test', '2022-08-03 14:45:10', '2022-08-03 14:45:10');
INSERT INTO `sys_logs` VALUES (326, 'Phân quyền module', 'Sửa đổi', 1, 'Phân quyền tài khoản: test', '2022-08-03 14:46:32', '2022-08-03 14:46:32');
INSERT INTO `sys_logs` VALUES (327, 'Phân quyền module', 'Sửa đổi', 1, 'Phân quyền tài khoản: test', '2022-08-03 14:48:17', '2022-08-03 14:48:17');
INSERT INTO `sys_logs` VALUES (328, 'Phân quyền module', 'Sửa đổi', 1, 'Phân quyền tài khoản: test', '2022-08-03 14:48:31', '2022-08-03 14:48:31');
INSERT INTO `sys_logs` VALUES (329, 'Phân quyền module', 'Sửa đổi', 1, 'Phân quyền tài khoản: test', '2022-08-03 14:51:45', '2022-08-03 14:51:45');
INSERT INTO `sys_logs` VALUES (330, 'Phân quyền module', 'Sửa đổi', 1, 'Phân quyền tài khoản: test', '2022-08-03 15:00:24', '2022-08-03 15:00:24');
INSERT INTO `sys_logs` VALUES (331, 'Phân quyền module', 'Sửa đổi', 1, 'Phân quyền tài khoản: test', '2022-08-03 15:01:32', '2022-08-03 15:01:32');
INSERT INTO `sys_logs` VALUES (332, 'Phân quyền module', 'Sửa đổi', 1, 'Phân quyền tài khoản: test', '2022-08-03 15:01:50', '2022-08-03 15:01:50');
INSERT INTO `sys_logs` VALUES (333, 'Phân quyền module', 'Sửa đổi', 1, 'Phân quyền tài khoản: test', '2022-08-03 15:04:30', '2022-08-03 15:04:30');
INSERT INTO `sys_logs` VALUES (334, 'Phân quyền module', 'Sửa đổi', 1, 'Phân quyền tài khoản: test', '2022-08-03 15:04:40', '2022-08-03 15:04:40');
INSERT INTO `sys_logs` VALUES (335, 'Phân quyền module', 'Sửa đổi', 1, 'Phân quyền tài khoản: test', '2022-08-03 15:05:09', '2022-08-03 15:05:09');
INSERT INTO `sys_logs` VALUES (336, 'Phân quyền module', 'Sửa đổi', 1, 'Phân quyền tài khoản: test', '2022-08-03 15:30:39', '2022-08-03 15:30:39');
INSERT INTO `sys_logs` VALUES (337, 'Phân quyền module', 'Sửa đổi', 1, 'Phân quyền tài khoản: test', '2022-08-03 15:54:36', '2022-08-03 15:54:36');
INSERT INTO `sys_logs` VALUES (338, 'Phân quyền module', 'Sửa đổi', 1, 'Phân quyền tài khoản: test', '2022-08-03 16:45:24', '2022-08-03 16:45:24');
INSERT INTO `sys_logs` VALUES (339, 'Đăng nhập', 'Đăng nhập', 6, '', '2022-08-04 08:47:58', '2022-08-04 08:47:58');
INSERT INTO `sys_logs` VALUES (340, 'Đăng nhập', 'Đăng nhập', 6, '', '2022-08-04 08:48:07', '2022-08-04 08:48:07');
INSERT INTO `sys_logs` VALUES (341, 'Đăng nhập', 'Đăng nhập', 1, '', '2022-08-04 08:54:27', '2022-08-04 08:54:27');
INSERT INTO `sys_logs` VALUES (342, 'Phân quyền module', 'Sửa đổi', 1, 'Phân quyền tài khoản: test', '2022-08-04 08:54:42', '2022-08-04 08:54:42');
INSERT INTO `sys_logs` VALUES (343, 'Phân quyền module', 'Sửa đổi', 1, 'Phân quyền tài khoản: test', '2022-08-04 08:56:20', '2022-08-04 08:56:20');
INSERT INTO `sys_logs` VALUES (344, 'Phân quyền module', 'Sửa đổi', 1, 'Phân quyền tài khoản: test', '2022-08-04 08:56:35', '2022-08-04 08:56:35');
INSERT INTO `sys_logs` VALUES (345, 'Phân quyền module', 'Sửa đổi', 1, 'Phân quyền tài khoản: test', '2022-08-04 09:00:08', '2022-08-04 09:00:08');
INSERT INTO `sys_logs` VALUES (346, 'Du lịch', 'Doanh nghiệp du lịch', 6, 'Thêm doanh nghiệp du lịch: asd', '2022-08-04 09:03:55', '2022-08-04 09:03:55');
INSERT INTO `sys_logs` VALUES (347, 'Phân quyền module', 'Sửa đổi', 1, 'Phân quyền tài khoản: test', '2022-08-04 09:09:01', '2022-08-04 09:09:01');
INSERT INTO `sys_logs` VALUES (348, 'Du lịch', 'Doanh nghiệp du lịch', 6, 'Sửa doanh nghiệp du lịch: asd thành asd2222', '2022-08-04 09:09:17', '2022-08-04 09:09:17');
INSERT INTO `sys_logs` VALUES (349, 'Du lịch', 'Doanh nghiệp du lịch', 6, 'Sửa doanh nghiệp du lịch: dsa thành dsa', '2022-08-04 09:38:06', '2022-08-04 09:38:06');
INSERT INTO `sys_logs` VALUES (350, 'Du lịch', 'Doanh nghiệp du lịch', 6, 'Sửa doanh nghiệp du lịch: doanh nghiệp abc2333323 thành doanh nghiệp abc2333323', '2022-08-04 09:38:15', '2022-08-04 09:38:15');
INSERT INTO `sys_logs` VALUES (351, 'Phân quyền module', 'Sửa đổi', 1, 'Phân quyền tài khoản: test', '2022-08-04 09:40:41', '2022-08-04 09:40:41');
INSERT INTO `sys_logs` VALUES (352, 'Du lịch', 'Doanh nghiệp du lịch', 6, 'Xóa doanh nghiệp du lịch: asd2222', '2022-08-04 09:40:51', '2022-08-04 09:40:51');
INSERT INTO `sys_logs` VALUES (353, 'Phân quyền module', 'Sửa đổi', 1, 'Phân quyền tài khoản: test', '2022-08-04 09:41:16', '2022-08-04 09:41:16');
INSERT INTO `sys_logs` VALUES (354, 'Phân quyền module', 'Sửa đổi', 1, 'Phân quyền tài khoản: test', '2022-08-04 10:04:24', '2022-08-04 10:04:24');
INSERT INTO `sys_logs` VALUES (355, 'Du lịch', 'Loại hình du lịch', 6, 'Thêm loại hình du lịch: sad', '2022-08-04 10:06:49', '2022-08-04 10:06:49');
INSERT INTO `sys_logs` VALUES (356, 'Phân quyền module', 'Sửa đổi', 1, 'Phân quyền tài khoản: test', '2022-08-04 10:09:16', '2022-08-04 10:09:16');
INSERT INTO `sys_logs` VALUES (357, 'Du lịch', 'Loại hình du lịch', 6, 'Sửa loại hình du lịch: sss thành sss2', '2022-08-04 10:11:18', '2022-08-04 10:11:18');
INSERT INTO `sys_logs` VALUES (358, 'Phân quyền module', 'Sửa đổi', 1, 'Phân quyền tài khoản: test', '2022-08-04 10:11:40', '2022-08-04 10:11:40');
INSERT INTO `sys_logs` VALUES (359, 'Phân quyền module', 'Sửa đổi', 1, 'Phân quyền tài khoản: test', '2022-08-04 10:46:53', '2022-08-04 10:46:53');
INSERT INTO `sys_logs` VALUES (360, 'Phân quyền module', 'Sửa đổi', 1, 'Phân quyền tài khoản: test', '2022-08-04 11:03:00', '2022-08-04 11:03:00');
INSERT INTO `sys_logs` VALUES (361, 'Đăng nhập', 'Đăng nhập', 6, '', '2022-08-04 13:44:34', '2022-08-04 13:44:34');
INSERT INTO `sys_logs` VALUES (362, 'Đăng nhập', 'Đăng nhập', 1, '', '2022-08-04 14:21:57', '2022-08-04 14:21:57');
INSERT INTO `sys_logs` VALUES (363, 'Phân quyền module', 'Sửa đổi', 1, 'Phân quyền tài khoản: test', '2022-08-04 14:24:21', '2022-08-04 14:24:21');
INSERT INTO `sys_logs` VALUES (364, 'Du lịch', 'Điểm đến du lịch', 6, 'Thêm điểm đến du lịch: 6545', '2022-08-04 14:41:22', '2022-08-04 14:41:22');
INSERT INTO `sys_logs` VALUES (365, 'Du lịch', 'Điểm đến du lịch', 6, 'Sửa điểm đến du lịch: 6545 thành 6545', '2022-08-04 14:42:32', '2022-08-04 14:42:32');
INSERT INTO `sys_logs` VALUES (366, 'Du lịch', 'Điểm đến du lịch', 6, 'Sửa điểm đến du lịch: 6545 thành 6545', '2022-08-04 14:46:35', '2022-08-04 14:46:35');
INSERT INTO `sys_logs` VALUES (367, 'Du lịch', 'Điểm đến du lịch', 6, 'Sửa điểm đến du lịch: 6545 thành 6545', '2022-08-04 14:47:30', '2022-08-04 14:47:30');
INSERT INTO `sys_logs` VALUES (368, 'Du lịch', 'Điểm đến du lịch', 6, 'Sửa điểm đến du lịch: 6545 thành 6545', '2022-08-04 14:48:26', '2022-08-04 14:48:26');
INSERT INTO `sys_logs` VALUES (369, 'Sản phẩm nông nghiệp', 'Thêm ảnh', 6, 'Sản phẩm: test1; Tên ảnh: R9Ru_296608743_2264175733734585_8089597942686195209_n.jpg', '2022-08-04 15:10:05', '2022-08-04 15:10:05');
INSERT INTO `sys_logs` VALUES (370, 'Điểm đến du lịch', 'Thêm ảnh', 6, 'Điểm đến: sadsda; Tên ảnh: ezTN_296608743_2264175733734585_8089597942686195209_n.jpg', '2022-08-04 15:12:40', '2022-08-04 15:12:40');
INSERT INTO `sys_logs` VALUES (371, 'Điểm đến du lịch', 'Sửa ảnh', 6, 'Điểm đến: sadsda; Tên ảnh: 22.jpg', '2022-08-04 15:14:26', '2022-08-04 15:14:26');
INSERT INTO `sys_logs` VALUES (372, 'Điểm đến du lịch', 'Xoá ảnh', 6, 'Điểm đến: sadsda; Tên ảnh: 22.jpg', '2022-08-04 15:15:17', '2022-08-04 15:15:17');
INSERT INTO `sys_logs` VALUES (373, 'Điểm đến du lịch', 'Thêm ảnh', 6, 'Điểm đến: sadsda; Tên ảnh: JbyU_296608743_2264175733734585_8089597942686195209_n.jpg', '2022-08-04 15:15:25', '2022-08-04 15:15:25');
INSERT INTO `sys_logs` VALUES (374, 'Điểm đến du lịch', 'Sửa ảnh', 6, 'Điểm đến: sadsda; Tên ảnh: 5.jpg', '2022-08-04 15:15:38', '2022-08-04 15:15:38');
INSERT INTO `sys_logs` VALUES (375, 'Điểm đến du lịch', 'Sửa ảnh', 6, 'Điểm đến: sadsda; Tên ảnh: 454.jpg', '2022-08-04 15:15:49', '2022-08-04 15:15:49');
INSERT INTO `sys_logs` VALUES (376, 'Điểm đến du lịch', 'Xoá ảnh', 6, 'Điểm đến: sadsda; Tên ảnh: 454.jpg', '2022-08-04 15:16:02', '2022-08-04 15:16:02');
INSERT INTO `sys_logs` VALUES (377, 'Phân quyền module', 'Sửa đổi', 1, 'Phân quyền tài khoản: test', '2022-08-04 15:26:56', '2022-08-04 15:26:56');
INSERT INTO `sys_logs` VALUES (378, 'Điểm đến du lịch', 'Thêm ảnh', 6, 'Điểm đến: 6545; Tên ảnh: 1PzH_296608743_2264175733734585_8089597942686195209_n.jpg', '2022-08-04 15:29:20', '2022-08-04 15:29:20');
INSERT INTO `sys_logs` VALUES (379, 'Phân quyền module', 'Sửa đổi', 1, 'Phân quyền tài khoản: test', '2022-08-04 15:30:47', '2022-08-04 15:30:47');
INSERT INTO `sys_logs` VALUES (380, 'Phân quyền module', 'Sửa đổi', 1, 'Phân quyền tài khoản: test', '2022-08-04 15:58:12', '2022-08-04 15:58:12');
INSERT INTO `sys_logs` VALUES (381, 'Phân quyền module', 'Sửa đổi', 1, 'Phân quyền tài khoản: test', '2022-08-04 15:59:49', '2022-08-04 15:59:49');
INSERT INTO `sys_logs` VALUES (382, 'Phân quyền module', 'Sửa đổi', 1, 'Phân quyền tài khoản: test', '2022-08-04 16:17:14', '2022-08-04 16:17:14');
INSERT INTO `sys_logs` VALUES (383, 'Phân quyền module', 'Sửa đổi', 1, 'Phân quyền tài khoản: test', '2022-08-04 16:17:31', '2022-08-04 16:17:31');
INSERT INTO `sys_logs` VALUES (384, 'Phân quyền module', 'Sửa đổi', 1, 'Phân quyền tài khoản: test', '2022-08-04 16:30:42', '2022-08-04 16:30:42');
INSERT INTO `sys_logs` VALUES (385, 'Phân quyền module', 'Sửa đổi', 1, 'Phân quyền tài khoản: test', '2022-08-04 16:35:15', '2022-08-04 16:35:15');
INSERT INTO `sys_logs` VALUES (386, 'Đặc sản', 'Thêm mới', 6, 'Sản phẩm: sss', '2022-08-04 16:39:50', '2022-08-04 16:39:50');
INSERT INTO `sys_logs` VALUES (387, 'Đặc sản', 'Sửa', 6, 'Sản phẩm: eee thành eees', '2022-08-04 16:41:26', '2022-08-04 16:41:26');
INSERT INTO `sys_logs` VALUES (388, 'Đặc sản', 'Thêm mới', 6, 'Sản phẩm: eeeèw', '2022-08-04 16:41:37', '2022-08-04 16:41:37');
INSERT INTO `sys_logs` VALUES (389, 'Đặc sản', 'Thêm ảnh', 6, 'Sản phẩm: sss; Tên ảnh: PsGI_296608743_2264175733734585_8089597942686195209_n.jpg', '2022-08-04 16:48:18', '2022-08-04 16:48:18');
INSERT INTO `sys_logs` VALUES (390, 'Đặc sản', 'Thêm ảnh', 6, 'Sản phẩm: sss; Tên ảnh: JfhI_296608743_2264175733734585_8089597942686195209_n.jpg', '2022-08-04 16:49:11', '2022-08-04 16:49:11');
INSERT INTO `sys_logs` VALUES (391, 'Đặc sản', 'Sửa ảnh', 6, 'Sản phẩm: sss; Tên ảnh: 3.jpg', '2022-08-04 16:49:15', '2022-08-04 16:49:15');
INSERT INTO `sys_logs` VALUES (392, 'Phân quyền module', 'Sửa đổi', 1, 'Phân quyền tài khoản: test', '2022-08-04 16:49:45', '2022-08-04 16:49:45');
INSERT INTO `sys_logs` VALUES (393, 'Đặc sản', 'Thêm ảnh', 6, 'Sản phẩm: eeeèw; Tên ảnh: 7igH_296608743_2264175733734585_8089597942686195209_n.jpg', '2022-08-04 16:50:46', '2022-08-04 16:50:46');
INSERT INTO `sys_logs` VALUES (394, 'Đặc sản', 'Xoá', 6, 'Sản phẩm: eees', '2022-08-04 16:51:59', '2022-08-04 16:51:59');
INSERT INTO `sys_logs` VALUES (395, 'Đặc sản', 'Thêm ảnh', 6, 'Sản phẩm: eeeèw; Tên ảnh: VICT_A23.jpg', '2022-08-04 16:52:04', '2022-08-04 16:52:04');
INSERT INTO `sys_logs` VALUES (396, 'Đăng nhập', 'Đăng nhập', 6, '', '2022-08-05 08:32:57', '2022-08-05 08:32:57');
INSERT INTO `sys_logs` VALUES (397, 'Đăng nhập', 'Đăng nhập', 1, '', '2022-08-05 08:56:36', '2022-08-05 08:56:36');
INSERT INTO `sys_logs` VALUES (398, 'Đăng nhập', 'Đăng nhập', 6, '', '2022-08-05 09:12:23', '2022-08-05 09:12:23');
INSERT INTO `sys_logs` VALUES (399, 'Phân quyền module', 'Sửa đổi', 1, 'Phân quyền tài khoản: test', '2022-08-05 10:21:32', '2022-08-05 10:21:32');
INSERT INTO `sys_logs` VALUES (400, 'Phân quyền module', 'Sửa đổi', 1, 'Phân quyền tài khoản: test', '2022-08-05 10:33:12', '2022-08-05 10:33:12');
INSERT INTO `sys_logs` VALUES (401, 'Doanh nghiệp nông nghiệp', 'Thêm mới', 6, 'Doanh nghiệp: sad', '2022-08-05 14:25:58', '2022-08-05 14:25:58');
INSERT INTO `sys_logs` VALUES (402, 'Doanh nghiệp nông nghiệp', 'Thêm mới', 6, 'Doanh nghiệp: asd', '2022-08-05 14:40:06', '2022-08-05 14:40:06');
INSERT INTO `sys_logs` VALUES (403, 'Doanh nghiệp nông nghiệp', 'Thêm mới', 6, 'Doanh nghiệp: asd', '2022-08-05 14:42:44', '2022-08-05 14:42:44');
INSERT INTO `sys_logs` VALUES (404, 'Doanh nghiệp nông nghiệp', 'Thêm mới', 6, 'Doanh nghiệp: asd2', '2022-08-05 14:43:31', '2022-08-05 14:43:31');
INSERT INTO `sys_logs` VALUES (405, 'Doanh nghiệp nông nghiệp', 'Thêm mới', 6, 'Doanh nghiệp: asd5', '2022-08-05 14:45:42', '2022-08-05 14:45:42');
INSERT INTO `sys_logs` VALUES (406, 'Đăng nhập', 'Đăng nhập', 1, '', '2022-08-05 14:47:16', '2022-08-05 14:47:16');
INSERT INTO `sys_logs` VALUES (407, 'Phân quyền module', 'Sửa đổi', 1, 'Phân quyền tài khoản: test', '2022-08-05 14:47:38', '2022-08-05 14:47:38');
INSERT INTO `sys_logs` VALUES (408, 'Doanh nghiệp nông nghiệp', 'Sửa', 6, 'Doanh nghiệp: asd5', '2022-08-05 15:04:03', '2022-08-05 15:04:03');
INSERT INTO `sys_logs` VALUES (409, 'Doanh nghiệp nông nghiệp', 'Sửa', 6, 'Doanh nghiệp: asd5', '2022-08-05 15:04:19', '2022-08-05 15:04:19');
INSERT INTO `sys_logs` VALUES (410, 'Phân quyền module', 'Sửa đổi', 1, 'Phân quyền tài khoản: test', '2022-08-05 15:04:59', '2022-08-05 15:04:59');
INSERT INTO `sys_logs` VALUES (411, 'Video Youtube', 'Sửa', 6, 'Tên Video: asd5 thành asd5', '2022-08-05 15:08:47', '2022-08-05 15:08:47');
INSERT INTO `sys_logs` VALUES (412, 'Video Youtube', 'Sửa', 6, 'Tên Video: asd5 thành asd5', '2022-08-05 15:27:27', '2022-08-05 15:27:27');
INSERT INTO `sys_logs` VALUES (413, 'Video Youtube', 'Sửa', 6, 'Tên Video: asd5 thành asd5', '2022-08-05 15:27:34', '2022-08-05 15:27:34');
INSERT INTO `sys_logs` VALUES (414, 'Video Youtube', 'Sửa', 6, 'Tên Video: asd thành asd1', '2022-08-05 15:28:47', '2022-08-05 15:28:47');
INSERT INTO `sys_logs` VALUES (415, 'Video Youtube', 'Sửa', 6, 'Tên Video: asd1 thành asd1', '2022-08-05 15:29:26', '2022-08-05 15:29:26');
INSERT INTO `sys_logs` VALUES (416, 'Video Youtube', 'Sửa', 6, 'Tên Video: asd1 thành asd1', '2022-08-05 15:30:21', '2022-08-05 15:30:21');
INSERT INTO `sys_logs` VALUES (417, 'Chủ đề video youtube', 'Xoá', 6, 'Tên video youtube: sad232', '2022-08-05 15:30:32', '2022-08-05 15:30:32');
INSERT INTO `sys_logs` VALUES (418, 'Video Youtube', 'Sửa', 6, 'Tên Video: asd1 thành asd1', '2022-08-05 15:31:08', '2022-08-05 15:31:08');
INSERT INTO `sys_logs` VALUES (419, 'Chủ đề video youtube', 'Xoá', 6, 'Tên video youtube: sad232', '2022-08-05 15:31:16', '2022-08-05 15:31:16');
INSERT INTO `sys_logs` VALUES (420, 'Chủ đề video youtube', 'Xoá', 6, 'Tên video youtube: sad232', '2022-08-05 15:31:49', '2022-08-05 15:31:49');
INSERT INTO `sys_logs` VALUES (421, 'Chủ đề video youtube', 'Xoá', 6, 'Tên video youtube: sad232', '2022-08-05 15:31:52', '2022-08-05 15:31:52');
INSERT INTO `sys_logs` VALUES (422, 'Chủ đề video youtube', 'Xoá', 6, 'Tên video youtube: sad232', '2022-08-05 15:31:58', '2022-08-05 15:31:58');
INSERT INTO `sys_logs` VALUES (423, 'Video Youtube', 'Sửa', 6, 'Tên Video: asd1 thành asd1', '2022-08-05 15:33:50', '2022-08-05 15:33:50');
INSERT INTO `sys_logs` VALUES (424, 'Chủ đề video youtube', 'Xoá', 6, 'Tên video youtube: sad', '2022-08-05 15:41:21', '2022-08-05 15:41:21');
INSERT INTO `sys_logs` VALUES (425, 'Chủ đề video youtube', 'Xoá', 6, 'Tên video youtube: 545', '2022-08-05 15:42:12', '2022-08-05 15:42:12');
INSERT INTO `sys_logs` VALUES (426, 'Video Youtube', 'Thêm mới', 6, 'Tên Video: sad', '2022-08-05 15:43:02', '2022-08-05 15:43:02');
INSERT INTO `sys_logs` VALUES (427, 'Đăng nhập', 'Đăng nhập', 1, '', '2022-08-05 16:23:59', '2022-08-05 16:23:59');
INSERT INTO `sys_logs` VALUES (428, 'Đăng nhập', 'Đăng nhập', 1, '', '2022-08-12 09:21:08', '2022-08-12 09:21:08');
INSERT INTO `sys_logs` VALUES (429, 'Đăng nhập', 'Đăng nhập', 1, '', '2022-08-17 10:29:45', '2022-08-17 10:29:45');
INSERT INTO `sys_logs` VALUES (430, 'AIBannerFooter', 'Thêm', 1, 'Banner: banner', '2022-08-17 11:02:11', '2022-08-17 11:02:11');
INSERT INTO `sys_logs` VALUES (431, 'Doanh nghiệp nông nghiệp', 'Sửa', 1, 'Doanh nghiệp: banner', '2022-08-17 12:49:42', '2022-08-17 12:49:42');
INSERT INTO `sys_logs` VALUES (432, 'Doanh nghiệp nông nghiệp', 'Sửa', 1, 'Doanh nghiệp: banner', '2022-08-17 12:50:08', '2022-08-17 12:50:08');
INSERT INTO `sys_logs` VALUES (433, 'Doanh nghiệp nông nghiệp', 'Sửa', 1, 'Doanh nghiệp: banner', '2022-08-17 12:50:45', '2022-08-17 12:50:45');
INSERT INTO `sys_logs` VALUES (434, 'AIBannerFooter', 'Thêm', 1, 'Banner: Footer', '2022-08-17 13:54:52', '2022-08-17 13:54:52');
INSERT INTO `sys_logs` VALUES (435, 'Đăng nhập', 'Đăng nhập', 6, '', '2022-08-17 14:51:37', '2022-08-17 14:51:37');
INSERT INTO `sys_logs` VALUES (436, 'AIBannerFooter', 'Thêm', 1, 'Banner: test', '2022-08-17 15:41:33', '2022-08-17 15:41:33');
INSERT INTO `sys_logs` VALUES (437, 'AIAdvertisement', 'Thêm', 1, 'Quảng cáo: test', '2022-08-17 15:45:37', '2022-08-17 15:45:37');
INSERT INTO `sys_logs` VALUES (438, 'AIAdvertisement', 'Sửa', 1, 'Quảng cáo: test', '2022-08-17 15:46:48', '2022-08-17 15:46:48');
INSERT INTO `sys_logs` VALUES (439, 'AIAdvertisement', 'Xoá', 1, 'Quảng cáo: test', '2022-08-17 15:54:21', '2022-08-17 15:54:21');
INSERT INTO `sys_logs` VALUES (440, 'AIBannerFooter', 'Xoá', 1, 'Banner: test', '2022-08-17 15:55:30', '2022-08-17 15:55:30');
INSERT INTO `sys_logs` VALUES (441, 'Đăng nhập', 'Đăng nhập', 1, '', '2022-08-27 11:09:43', '2022-08-27 11:09:43');
INSERT INTO `sys_logs` VALUES (442, 'Đăng nhập', 'Đăng nhập', 1, '', '2022-08-30 09:44:58', '2022-08-30 09:44:58');
INSERT INTO `sys_logs` VALUES (443, 'Đăng nhập', 'Đăng nhập', 1, '', '2022-08-30 14:12:56', '2022-08-30 14:12:56');
INSERT INTO `sys_logs` VALUES (444, 'Đăng nhập', 'Đăng nhập', 1, '', '2022-08-30 16:54:49', '2022-08-30 16:54:49');
INSERT INTO `sys_logs` VALUES (445, 'Đăng nhập', 'Đăng nhập', 1, '', '2022-08-31 08:48:22', '2022-08-31 08:48:22');
INSERT INTO `sys_logs` VALUES (446, 'Đăng nhập', 'Đăng nhập', 1, '', '2022-08-31 13:56:51', '2022-08-31 13:56:51');
INSERT INTO `sys_logs` VALUES (447, 'Danh mục nông nghiệp', 'Thêm mới', 1, 'Danh mục: test', '2022-08-31 14:12:13', '2022-08-31 14:12:13');
INSERT INTO `sys_logs` VALUES (448, 'Danh mục nông nghiệp', 'Sửa', 1, 'Danh mục: Bất động sản', '2022-08-31 14:13:47', '2022-08-31 14:13:47');
INSERT INTO `sys_logs` VALUES (449, 'Danh mục nông nghiệp', 'Thêm mới', 1, 'Danh mục: Động sản', '2022-08-31 14:13:52', '2022-08-31 14:13:52');
INSERT INTO `sys_logs` VALUES (450, 'Đăng nhập', 'Đăng nhập', 1, '', '2022-09-05 14:08:04', '2022-09-05 14:08:04');
INSERT INTO `sys_logs` VALUES (451, 'Đăng nhập', 'Đăng nhập', 1, '', '2022-09-06 08:56:54', '2022-09-06 08:56:54');
INSERT INTO `sys_logs` VALUES (452, 'Đăng nhập', 'Đăng nhập', 1, '', '2022-09-12 14:41:25', '2022-09-12 14:41:25');
INSERT INTO `sys_logs` VALUES (453, 'Đăng nhập', 'Đăng nhập', 1, '', '2022-09-12 15:03:22', '2022-09-12 15:03:22');
INSERT INTO `sys_logs` VALUES (454, 'Đăng nhập', 'Đăng nhập', 1, '', '2022-09-12 15:04:11', '2022-09-12 15:04:11');
INSERT INTO `sys_logs` VALUES (455, 'Sản phẩm nông nghiệp', 'Sửa', 1, 'Sản phẩm: test1 thành test1', '2022-09-12 16:18:42', '2022-09-12 16:18:42');
INSERT INTO `sys_logs` VALUES (456, 'Sản phẩm nông nghiệp', 'Sửa', 1, 'Sản phẩm: test1 thành test1', '2022-09-12 16:18:43', '2022-09-12 16:18:43');
INSERT INTO `sys_logs` VALUES (457, 'Sản phẩm nông nghiệp', 'Sửa', 1, 'Sản phẩm: test1 thành test1', '2022-09-12 16:19:02', '2022-09-12 16:19:02');
INSERT INTO `sys_logs` VALUES (458, 'Sản phẩm nông nghiệp', 'Sửa', 1, 'Sản phẩm: test1 thành test1', '2022-09-12 16:22:46', '2022-09-12 16:22:46');
INSERT INTO `sys_logs` VALUES (459, 'Sản phẩm nông nghiệp', 'Sửa', 1, 'Sản phẩm: test1 thành test1', '2022-09-12 16:24:14', '2022-09-12 16:24:14');
INSERT INTO `sys_logs` VALUES (460, 'Sản phẩm nông nghiệp', 'Sửa', 1, 'Sản phẩm: test1 thành test1', '2022-09-12 16:24:24', '2022-09-12 16:24:24');
INSERT INTO `sys_logs` VALUES (461, 'Sản phẩm nông nghiệp', 'Sửa', 1, 'Sản phẩm: test1 thành test1', '2022-09-12 16:27:16', '2022-09-12 16:27:16');
INSERT INTO `sys_logs` VALUES (462, 'AIServicesBusinesses', 'Sửa', 1, 'Dịch vụ: test1 thành test1', '2022-09-12 16:29:56', '2022-09-12 16:29:56');
INSERT INTO `sys_logs` VALUES (463, 'AIServicesBusinesses', 'Thêm ảnh', 1, 'Dịch vụ: dsadsadsa; Tên ảnh: mRGb_7656536.png', '2022-09-12 16:39:45', '2022-09-12 16:39:45');
INSERT INTO `sys_logs` VALUES (464, 'AIServicesBusinesses', 'Sửa ảnh', 1, 'Dịch vụ: dsadsadsa; Tên ảnh: mRGb_765656.png', '2022-09-12 16:39:56', '2022-09-12 16:39:56');
INSERT INTO `sys_logs` VALUES (465, 'AIServicesBusinesses', 'Sửa ảnh', 1, 'Dịch vụ: dsadsadsa; Tên ảnh: test.png', '2022-09-12 16:40:02', '2022-09-12 16:40:02');
INSERT INTO `sys_logs` VALUES (466, 'AIServicesBusinesses', 'Xoá ảnh', 1, 'Dịch vụ: dsadsadsa; Tên ảnh: test.png', '2022-09-12 16:40:56', '2022-09-12 16:40:56');
INSERT INTO `sys_logs` VALUES (467, 'AIServicesBusinesses', 'Xoá', 1, 'Dịch vụ: dsadsadsa', '2022-09-12 16:48:27', '2022-09-12 16:48:27');
INSERT INTO `sys_logs` VALUES (468, 'AIServicesBusinesses', 'Xoá', 1, 'Dịch vụ: asd', '2022-09-12 16:49:40', '2022-09-12 16:49:40');
INSERT INTO `sys_logs` VALUES (469, 'AIServicesBusinesses', 'Xoá', 1, 'Dịch vụ: sad', '2022-09-12 16:49:44', '2022-09-12 16:49:44');
INSERT INTO `sys_logs` VALUES (470, 'AIServicesBusinesses', 'Xoá', 1, 'Dịch vụ: dsa', '2022-09-12 16:50:33', '2022-09-12 16:50:33');
INSERT INTO `sys_logs` VALUES (471, 'AIServicesBusinesses', 'Xoá', 1, 'Dịch vụ: asd', '2022-09-12 16:56:07', '2022-09-12 16:56:07');
INSERT INTO `sys_logs` VALUES (472, 'Đăng nhập', 'Đăng nhập', 1, '', '2022-09-12 19:30:29', '2022-09-12 19:30:29');
INSERT INTO `sys_logs` VALUES (473, 'Đăng nhập', 'Đăng nhập', 1, '', '2022-09-13 09:12:46', '2022-09-13 09:12:46');
INSERT INTO `sys_logs` VALUES (474, 'AIImageLibraries', 'Thêm ảnh', 1, 'Thư viện ảnh: Slider trang chủ; Tên ảnh: gqm6_7656536.png', '2022-09-13 09:23:38', '2022-09-13 09:23:38');
INSERT INTO `sys_logs` VALUES (475, 'AIImageLibraries', 'Xoá ảnh', 1, 'Thư viện ảnh: Slider trang chủ; Tên ảnh: bzzh_7656536.png', '2022-09-13 09:23:42', '2022-09-13 09:23:42');
INSERT INTO `sys_logs` VALUES (476, 'AIImageLibraries', 'Xoá ảnh', 1, 'Thư viện ảnh: Slider trang chủ; Tên ảnh: OObg_7656536.png', '2022-09-13 09:23:47', '2022-09-13 09:23:47');
INSERT INTO `sys_logs` VALUES (477, 'AIImageLibraries', 'Xoá ảnh', 1, 'Thư viện ảnh: Slider trang chủ; Tên ảnh: UmQo_7656536.png', '2022-09-13 09:23:54', '2022-09-13 09:23:54');
INSERT INTO `sys_logs` VALUES (478, 'Đăng nhập', 'Đăng nhập', 1, '', '2022-09-13 14:01:27', '2022-09-13 14:01:27');
INSERT INTO `sys_logs` VALUES (479, 'AIImageLibraries', 'Thêm ảnh', 1, 'Thư viện ảnh: Slider trang chủ; Tên ảnh: JOAK_7656536.png', '2022-09-13 14:01:50', '2022-09-13 14:01:50');
INSERT INTO `sys_logs` VALUES (480, 'AIImageLibraries', 'Xoá ảnh', 1, 'Thư viện ảnh: Slider trang chủ; Tên ảnh: gqm6_7656536.png', '2022-09-13 14:01:57', '2022-09-13 14:01:57');
INSERT INTO `sys_logs` VALUES (481, 'AIImageLibraries', 'Xoá ảnh', 1, 'Thư viện ảnh: Slider trang chủ; Tên ảnh: JOAK_7656536.png', '2022-09-13 14:02:45', '2022-09-13 14:02:45');
INSERT INTO `sys_logs` VALUES (482, 'AIImageLibraries', 'Thêm ảnh', 1, 'Thư viện ảnh: Slider trang chủ; Tên ảnh: W7uk_7656536.png', '2022-09-13 14:02:50', '2022-09-13 14:02:50');
INSERT INTO `sys_logs` VALUES (483, 'AIImageLibraries', 'Xoá ảnh', 1, 'Thư viện ảnh: Slider trang chủ; Tên ảnh: W7uk_76565362444.png', '2022-09-13 14:03:29', '2022-09-13 14:03:29');
INSERT INTO `sys_logs` VALUES (484, 'AIImageLibraries', 'Xoá ảnh', 1, 'Thư viện ảnh: Slider trang chủ; Tên ảnh: W7uk_76565362444.png', '2022-09-13 14:04:07', '2022-09-13 14:04:07');
INSERT INTO `sys_logs` VALUES (485, 'AIImageLibraries', 'Xoá ảnh', 1, 'Thư viện ảnh: Slider trang chủ; Tên ảnh: W7uk_76565362444.png', '2022-09-13 14:04:43', '2022-09-13 14:04:43');
INSERT INTO `sys_logs` VALUES (486, 'AIImageLibraries', 'Xoá ảnh', 1, 'Thư viện ảnh: Slider trang chủ; Tên ảnh: W7uk_76565362444.png', '2022-09-13 14:04:51', '2022-09-13 14:04:51');
INSERT INTO `sys_logs` VALUES (487, 'AIImageLibraries', 'Xoá ảnh', 1, 'Thư viện ảnh: Slider trang chủ; Tên ảnh: W7uk_76565362444.png', '2022-09-13 14:09:54', '2022-09-13 14:09:54');
INSERT INTO `sys_logs` VALUES (488, 'AIRealEstateProducts', 'Sửa ảnh', 1, 'Sản phẩm: d1; Tên ảnh: 12.jpg', '2022-09-13 15:10:29', '2022-09-13 15:10:29');
INSERT INTO `sys_logs` VALUES (489, 'AIRealEstateProducts', 'Xoá ảnh', 1, 'Sản phẩm: d1; Tên ảnh: 12.jpg', '2022-09-13 15:10:33', '2022-09-13 15:10:33');
INSERT INTO `sys_logs` VALUES (490, 'Đăng nhập', 'Đăng nhập', 1, '', '2022-09-13 16:31:12', '2022-09-13 16:31:12');
INSERT INTO `sys_logs` VALUES (491, 'Đăng nhập', 'Đăng nhập', 1, '', '2022-09-19 14:26:15', '2022-09-19 14:26:15');
INSERT INTO `sys_logs` VALUES (492, 'Đăng nhập', 'Đăng nhập', 1, '', '2022-09-22 14:56:23', '2022-09-22 14:56:23');
INSERT INTO `sys_logs` VALUES (493, 'Đăng nhập', 'Đăng nhập', 1, '', '2022-11-03 16:09:22', '2022-11-03 16:09:22');
INSERT INTO `sys_logs` VALUES (494, 'Đăng nhập', 'Đăng nhập', 1, '', '2022-11-03 16:09:39', '2022-11-03 16:09:39');
INSERT INTO `sys_logs` VALUES (495, 'Đăng nhập', 'Đăng nhập', 1, '', '2022-11-04 08:36:34', '2022-11-04 08:36:34');
INSERT INTO `sys_logs` VALUES (496, 'Đăng nhập', 'Đăng nhập', 1, '', '2022-11-04 08:38:58', '2022-11-04 08:38:58');
INSERT INTO `sys_logs` VALUES (497, 'Đăng nhập', 'Đăng nhập', 1, '', '2022-11-04 10:05:43', '2022-11-04 10:05:43');
INSERT INTO `sys_logs` VALUES (498, 'Đăng nhập', 'Đăng nhập', 1, '', '2022-11-04 15:35:30', '2022-11-04 15:35:30');
INSERT INTO `sys_logs` VALUES (499, 'Đăng nhập', 'Đăng nhập', 1, '', '2022-11-28 14:16:14', '2022-11-28 14:16:14');
INSERT INTO `sys_logs` VALUES (500, 'Đăng nhập', 'Đăng nhập', 1, '', '2022-11-28 15:06:43', '2022-11-28 15:06:43');
INSERT INTO `sys_logs` VALUES (501, 'Đăng nhập', 'Đăng nhập', 1, '', '2022-11-28 15:10:12', '2022-11-28 15:10:12');
INSERT INTO `sys_logs` VALUES (502, 'Đăng nhập', 'Đăng nhập', 1, '', '2022-11-28 15:53:44', '2022-11-28 15:53:44');
INSERT INTO `sys_logs` VALUES (503, 'Đăng nhập', 'Đăng nhập', 1, '', '2022-11-28 15:54:14', '2022-11-28 15:54:14');
INSERT INTO `sys_logs` VALUES (504, 'Đăng nhập', 'Đăng nhập', 1, '', '2022-11-28 16:03:45', '2022-11-28 16:03:45');
INSERT INTO `sys_logs` VALUES (505, 'Đăng nhập', 'Đăng nhập', 1, '', '2022-11-28 16:03:52', '2022-11-28 16:03:52');
INSERT INTO `sys_logs` VALUES (506, 'Đăng nhập', 'Đăng nhập', 1, '', '2022-11-28 16:04:52', '2022-11-28 16:04:52');
INSERT INTO `sys_logs` VALUES (507, 'Đăng nhập', 'Đăng nhập', 1, '', '2022-11-28 16:05:10', '2022-11-28 16:05:10');
INSERT INTO `sys_logs` VALUES (508, 'Đăng nhập', 'Đăng nhập', 1, '', '2022-11-28 16:19:21', '2022-11-28 16:19:21');
INSERT INTO `sys_logs` VALUES (509, 'Đăng nhập', 'Đăng nhập', 1, '', '2022-11-28 16:21:35', '2022-11-28 16:21:35');
INSERT INTO `sys_logs` VALUES (510, 'Đăng nhập', 'Đăng nhập', 1, '', '2022-11-28 16:32:33', '2022-11-28 16:32:33');
INSERT INTO `sys_logs` VALUES (511, 'Đăng nhập', 'Đăng nhập', 1, '', '2022-11-29 14:09:13', '2022-11-29 14:09:13');
INSERT INTO `sys_logs` VALUES (512, 'Đăng nhập', 'Đăng nhập', 1, '', '2022-11-29 15:06:05', '2022-11-29 15:06:05');
INSERT INTO `sys_logs` VALUES (513, 'AIBannerFooter', 'Sửa', 1, 'Banner: Banner', '2022-11-29 16:53:44', '2022-11-29 16:53:44');
INSERT INTO `sys_logs` VALUES (514, 'Đăng nhập', 'Đăng nhập', 1, '', '2022-12-15 16:40:03', '2022-12-15 16:40:03');
INSERT INTO `sys_logs` VALUES (515, 'Đăng nhập', 'Đăng nhập', 1, '', '2023-02-06 16:47:39', '2023-02-06 16:47:39');
INSERT INTO `sys_logs` VALUES (516, 'Đăng nhập', 'Đăng nhập', 1, '', '2023-02-07 08:43:43', '2023-02-07 08:43:43');
INSERT INTO `sys_logs` VALUES (517, 'AITourismDestination', 'Xoá', 1, 'Xóa điểm đến: 666', '2023-02-07 08:59:37', '2023-02-07 08:59:37');
INSERT INTO `sys_logs` VALUES (518, 'AITourismDestination', 'Sửa', 1, 'Sửa điểm đến du lịch: adssdadsa thành adssdadsa', '2023-02-07 08:59:42', '2023-02-07 08:59:42');
INSERT INTO `sys_logs` VALUES (519, 'AITourismDestination', 'Thêm', 1, 'Thêm điểm đến du lịch: 1', '2023-02-07 09:00:12', '2023-02-07 09:00:12');
INSERT INTO `sys_logs` VALUES (520, 'AIAgriculturalProduct', 'Xoá', 1, 'Sản phẩm: dsadsadsa', '2023-02-07 09:08:12', '2023-02-07 09:08:12');
INSERT INTO `sys_logs` VALUES (521, 'AIAgriculturalProduct', 'Xoá', 1, 'Sản phẩm: asd', '2023-02-07 09:08:14', '2023-02-07 09:08:14');
INSERT INTO `sys_logs` VALUES (522, 'AIAgriculturalProduct', 'Xoá', 1, 'Sản phẩm: sad', '2023-02-07 09:08:17', '2023-02-07 09:08:17');
INSERT INTO `sys_logs` VALUES (523, 'Đăng nhập', 'Đăng nhập', 1, '', '2023-02-07 15:47:48', '2023-02-07 15:47:48');
INSERT INTO `sys_logs` VALUES (524, 'Đăng nhập', 'Đăng nhập', 1, '', '2023-02-25 20:54:54', '2023-02-25 20:54:54');
INSERT INTO `sys_logs` VALUES (525, 'AIAuctionProduct', 'Thêm mới', 1, 'Tài sản: test', '2023-02-25 23:48:09', '2023-02-25 23:48:09');
INSERT INTO `sys_logs` VALUES (526, 'AIAuctionProduct', 'Sửa', 1, 'Tài sản: test thành test', '2023-02-25 23:48:16', '2023-02-25 23:48:16');
INSERT INTO `sys_logs` VALUES (527, 'Đăng nhập', 'Đăng nhập', 1, '', '2023-02-26 09:32:18', '2023-02-26 09:32:18');
INSERT INTO `sys_logs` VALUES (528, 'AIAuctionProduct', 'Thêm ảnh', 1, 'Tài sản: test; Tên ảnh: BT8l_z3958758873053_fa925e7786ef7e6ee4ddeef26935a8b0_884408828.jpg', '2023-02-26 09:33:57', '2023-02-26 09:33:57');
INSERT INTO `sys_logs` VALUES (529, 'AIAuctionProduct', 'Thêm file', 1, 'Tài sản: test; Tên file: TYUt_20220518105703880882_TAP_II5_SOC_TRANG_20220518091515390390.pdf', '2023-02-26 09:34:16', '2023-02-26 09:34:16');
INSERT INTO `sys_logs` VALUES (530, 'AIAuctionProduct', 'Thêm quy chế', 1, 'Tài sản: test; Tên quy chế: 5LWi_ThuMoi_0001.pdf', '2023-02-26 09:35:49', '2023-02-26 09:35:49');
INSERT INTO `sys_logs` VALUES (531, 'Đăng nhập', 'Đăng nhập', 1, '', '2023-02-27 20:54:39', '2023-02-27 20:54:39');
INSERT INTO `sys_logs` VALUES (532, 'AIServicesBusinesses', 'Thêm ảnh', 1, 'Dịch vụ: sda; Tên ảnh: k25N_z3958758873053_fa925e7786ef7e6ee4ddeef26935a8b0_884408828.jpg', '2023-02-27 21:27:09', '2023-02-27 21:27:09');
INSERT INTO `sys_logs` VALUES (533, 'Đăng nhập', 'Đăng nhập', 1, '', '2023-03-04 23:55:18', '2023-03-04 23:55:18');
INSERT INTO `sys_logs` VALUES (534, 'AISteeringDocument', 'Sửa', 1, 'Văn bản: test12', '2023-03-05 01:25:12', '2023-03-05 01:25:12');
INSERT INTO `sys_logs` VALUES (535, 'Đăng nhập', 'Đăng nhập', 1, '', '2023-03-05 08:56:48', '2023-03-05 08:56:48');
INSERT INTO `sys_logs` VALUES (536, 'Đăng nhập', 'Đăng nhập', 1, '', '2023-03-05 13:43:23', '2023-03-05 13:43:23');
INSERT INTO `sys_logs` VALUES (537, 'Đăng nhập', 'Đăng nhập', 1, '', '2023-03-05 15:51:43', '2023-03-05 15:51:43');
INSERT INTO `sys_logs` VALUES (538, 'Đăng nhập', 'Đăng nhập', 1, '', '2023-03-05 16:23:01', '2023-03-05 16:23:01');
INSERT INTO `sys_logs` VALUES (539, 'Đăng nhập', 'Đăng nhập', 1, '', '2023-03-05 22:24:47', '2023-03-05 22:24:47');
INSERT INTO `sys_logs` VALUES (540, 'Đăng nhập', 'Đăng nhập', 1, '', '2023-03-06 11:13:28', '2023-03-06 11:13:28');
INSERT INTO `sys_logs` VALUES (541, 'Đăng nhập', 'Đăng nhập', 1, '', '2023-03-06 16:36:48', '2023-03-06 16:36:48');
INSERT INTO `sys_logs` VALUES (542, 'Đăng nhập', 'Đăng nhập', 1, '', '2023-03-07 09:02:51', '2023-03-07 09:02:51');
INSERT INTO `sys_logs` VALUES (543, 'Đăng nhập', 'Đăng nhập', 1, '', '2023-03-07 14:24:26', '2023-03-07 14:24:26');
INSERT INTO `sys_logs` VALUES (544, 'Phân quyền module', 'Sửa đổi', 1, 'Phân quyền tài khoản: admin3', '2023-03-07 15:17:15', '2023-03-07 15:17:15');
INSERT INTO `sys_logs` VALUES (545, 'Đăng nhập', 'Đăng nhập', 1, '', '2023-03-08 08:26:17', '2023-03-08 08:26:17');
INSERT INTO `sys_logs` VALUES (546, 'Đăng nhập', 'Đăng nhập', 1, '', '2023-03-08 09:50:07', '2023-03-08 09:50:07');
INSERT INTO `sys_logs` VALUES (547, 'Đăng nhập', 'Đăng nhập', 1, '', '2023-03-08 15:15:09', '2023-03-08 15:15:09');
INSERT INTO `sys_logs` VALUES (548, 'Đăng nhập', 'Đăng nhập', 1, '', '2023-03-09 14:23:11', '2023-03-09 14:23:11');
INSERT INTO `sys_logs` VALUES (549, 'Đăng nhập', 'Đăng nhập', 1, '', '2023-03-10 09:08:37', '2023-03-10 09:08:37');
INSERT INTO `sys_logs` VALUES (550, 'Đăng nhập', 'Đăng nhập', 1, '', '2023-03-10 13:50:14', '2023-03-10 13:50:14');
INSERT INTO `sys_logs` VALUES (551, 'AIArticleByMenu', 'Sửa đổi', 1, 'Phân quyền tài khoản: admin2', '2023-03-10 15:46:23', '2023-03-10 15:46:23');
INSERT INTO `sys_logs` VALUES (552, 'AIArticleByMenu', 'Sửa đổi', 1, 'Phân quyền tài khoản: admin3', '2023-03-10 15:57:19', '2023-03-10 15:57:19');
INSERT INTO `sys_logs` VALUES (553, 'AIArticleByMenu', 'Sửa đổi', 1, 'Phân quyền tài khoản: admin3', '2023-03-10 16:21:33', '2023-03-10 16:21:33');
INSERT INTO `sys_logs` VALUES (554, 'Đăng nhập', 'Đăng nhập', 1, '', '2023-03-13 08:47:16', '2023-03-13 08:47:16');
INSERT INTO `sys_logs` VALUES (555, 'Đăng nhập', 'Đăng nhập', 1, '', '2023-03-16 16:49:25', '2023-03-16 16:49:25');
INSERT INTO `sys_logs` VALUES (556, 'AIVideoYoutube', 'Thêm', 1, 'Tên chủ đề: tes', '2023-03-16 16:54:36', '2023-03-16 16:54:36');
INSERT INTO `sys_logs` VALUES (557, 'AIVideoYoutube', 'Thêm', 1, 'Tên chủ đề: wew', '2023-03-16 16:55:40', '2023-03-16 16:55:40');
INSERT INTO `sys_logs` VALUES (558, 'AIVideoYoutube', 'Sửa', 1, 'Tên chủ đề: {\"language_id\":\"2\",\"id\":4,\"name\":\"tes3\",\"sort\":null,\"url\":null,\"content\":null,\"created_at\":\"2023-03-16T09:54:36.000000Z\",\"updated_at\":\"2023-03-16T09:55:46.000000Z\"} thành tes3', '2023-03-16 16:55:46', '2023-03-16 16:55:46');
INSERT INTO `sys_logs` VALUES (559, 'Đăng nhập', 'Đăng nhập', 1, '', '2023-03-17 09:01:55', '2023-03-17 09:01:55');
INSERT INTO `sys_logs` VALUES (560, 'Quản lý người dùng', 'Thêm mới', 1, 'Tài khoản: sadasdwww', '2023-03-17 09:22:31', '2023-03-17 09:22:31');
INSERT INTO `sys_logs` VALUES (561, 'Phân quyền chức năng', 'Sửa đổi', 1, 'Phân quyền tài khoản: admin3', '2023-03-17 09:22:44', '2023-03-17 09:22:44');
INSERT INTO `sys_logs` VALUES (562, 'AIImageLibraries', 'Xoá ảnh', 1, 'Thư viện ảnh: test; Tên ảnh: nncu_DSC_0292.jpg', '2023-03-17 09:22:58', '2023-03-17 09:22:58');
INSERT INTO `sys_logs` VALUES (563, 'AIImageLibraries', 'Xoá ảnh', 1, 'Thư viện ảnh: test; Tên ảnh: 2P7L_DSC_0295.jpg', '2023-03-17 09:22:59', '2023-03-17 09:22:59');
INSERT INTO `sys_logs` VALUES (564, 'AIImageLibraries', 'Thêm ảnh', 1, 'Thư viện ảnh: test; Tên ảnh: b490_hoisv1.jpg', '2023-03-17 09:23:04', '2023-03-17 09:23:04');
INSERT INTO `sys_logs` VALUES (565, 'AIBannerFooter', 'Thêm', 1, 'Banner: dsa', '2023-03-17 10:20:48', '2023-03-17 10:20:48');
INSERT INTO `sys_logs` VALUES (566, 'AIBannerFooter', 'Sửa', 1, 'Banner: dsa', '2023-03-17 10:20:58', '2023-03-17 10:20:58');
INSERT INTO `sys_logs` VALUES (567, 'AIBannerFooter', 'Xoá', 1, 'Banner: dsa', '2023-03-17 10:33:43', '2023-03-17 10:33:43');
INSERT INTO `sys_logs` VALUES (568, 'AIServicesBusinesses', 'Xoá ảnh', 1, 'Dịch vụ: sda; Tên ảnh: FdMW_z3958758232731_5bb95e41c9b3ab949e424524729d1cc6_683315668.jpg', '2023-03-17 10:38:10', '2023-03-17 10:38:10');
INSERT INTO `sys_logs` VALUES (569, 'AIServicesBusinesses', 'Xoá ảnh', 1, 'Dịch vụ: sda; Tên ảnh: Oz2p_z3958758848377_ffc1bd02e2891fd4ebb9a30ed2d23593_42332462.jpg', '2023-03-17 10:38:11', '2023-03-17 10:38:11');
INSERT INTO `sys_logs` VALUES (570, 'AIServicesBusinesses', 'Xoá ảnh', 1, 'Dịch vụ: sda; Tên ảnh: k25N_z3958758873053_fa925e7786ef7e6ee4ddeef26935a8b0_884408828.jpg', '2023-03-17 10:38:12', '2023-03-17 10:38:12');
INSERT INTO `sys_logs` VALUES (571, 'AIServicesBusinesses', 'Sửa', 1, 'Dịch vụ: 1122223333 thành 1122223333', '2023-03-17 10:41:35', '2023-03-17 10:41:35');
INSERT INTO `sys_logs` VALUES (572, 'AIServicesBusinesses', 'Thêm ảnh', 1, 'Dịch vụ: sda; Tên ảnh: Z3E3_THUVIENTRUONG.png', '2023-03-17 10:41:49', '2023-03-17 10:41:49');
INSERT INTO `sys_logs` VALUES (573, 'AIServicesBusinesses', 'Thêm mới', 1, 'Dịch vụ: sadsadwww', '2023-03-17 10:54:10', '2023-03-17 10:54:10');
INSERT INTO `sys_logs` VALUES (574, 'AIServicesBusinesses', 'Thêm mới', 1, 'Dịch vụ: 111', '2023-03-17 10:54:30', '2023-03-17 10:54:30');
INSERT INTO `sys_logs` VALUES (575, 'AIServicesBusinesses', 'Thêm mới', 1, 'Dịch vụ: 23322', '2023-03-17 10:54:54', '2023-03-17 10:54:54');
INSERT INTO `sys_logs` VALUES (576, 'AIServicesBusinesses', 'Thêm mới', 1, 'Dịch vụ: 3333333333333333333333333333333', '2023-03-17 10:55:13', '2023-03-17 10:55:13');
INSERT INTO `sys_logs` VALUES (577, 'AIServicesBusinesses', 'Xoá', 1, 'Dịch vụ: 23322', '2023-03-17 10:55:19', '2023-03-17 10:55:19');
INSERT INTO `sys_logs` VALUES (578, 'AIServicesBusinesses', 'Xoá', 1, 'Dịch vụ: www', '2023-03-17 10:55:27', '2023-03-17 10:55:27');
INSERT INTO `sys_logs` VALUES (579, 'AIServicesBusinesses', 'Thêm mới', 1, 'Dịch vụ: Thái Đình Cẩn', '2023-03-17 10:55:41', '2023-03-17 10:55:41');
INSERT INTO `sys_logs` VALUES (580, 'Đăng nhập', 'Đăng nhập', 1, '', '2023-03-17 14:34:11', '2023-03-17 14:34:11');
INSERT INTO `sys_logs` VALUES (581, 'Đăng nhập', 'Đăng nhập', 1, '', '2023-03-20 16:11:38', '2023-03-20 16:11:38');
INSERT INTO `sys_logs` VALUES (582, 'Đăng nhập', 'Đăng nhập', 1, '', '2023-03-20 17:08:09', '2023-03-20 17:08:09');
INSERT INTO `sys_logs` VALUES (583, 'Đăng nhập', 'Đăng nhập', 1, '', '2023-03-21 07:54:05', '2023-03-21 07:54:05');
INSERT INTO `sys_logs` VALUES (584, 'AIAdvertisement', 'Thêm', 1, 'Quảng cáo: 111111', '2023-03-21 09:33:34', '2023-03-21 09:33:34');
INSERT INTO `sys_logs` VALUES (585, 'AIAdvertisement', 'Thêm', 1, 'Quảng cáo: 22222', '2023-03-21 09:38:00', '2023-03-21 09:38:00');
INSERT INTO `sys_logs` VALUES (586, 'AIAdvertisement', 'Thêm', 1, 'Quảng cáo: test', '2023-03-21 09:38:07', '2023-03-21 09:38:07');
INSERT INTO `sys_logs` VALUES (587, 'AISteeringDocument', 'Xoá', 1, 'Lĩnh vực: ', '2023-03-21 09:40:20', '2023-03-21 09:40:20');
INSERT INTO `sys_logs` VALUES (588, 'AIAdvertisement', 'Sửa', 1, 'Quảng cáo: test', '2023-03-21 09:47:11', '2023-03-21 09:47:11');
INSERT INTO `sys_logs` VALUES (589, 'Đăng nhập', 'Đăng nhập', 1, '', '2023-03-21 14:19:55', '2023-03-21 14:19:55');
INSERT INTO `sys_logs` VALUES (590, 'AISchoolForms', 'Thêm file', 1, 'Biểu mẫu: test1; Tên file: fzj0_HĐ WEB.pdf', '2023-03-21 15:16:03', '2023-03-21 15:16:03');
INSERT INTO `sys_logs` VALUES (591, 'AISchoolForms', 'Xoá ảnh', 1, 'Thư viện ảnh: test1; Tên ảnh: RE8u_VNPT-IT KV3_Baocaokhaosat_So VHTTDL_STG_06092022.doc', '2023-03-21 15:32:53', '2023-03-21 15:32:53');
INSERT INTO `sys_logs` VALUES (592, 'AISchoolForms', 'Xoá ảnh', 1, 'Thư viện ảnh: test1; Tên ảnh: 9CI0_soctrang.gov.vn.pdf', '2023-03-21 15:34:15', '2023-03-21 15:34:15');
INSERT INTO `sys_logs` VALUES (593, 'AISchoolForms', 'Xoá ảnh', 1, 'Thư viện ảnh: test1; Tên ảnh: BKKe_soctrang.gov.vn.pdf', '2023-03-21 15:34:31', '2023-03-21 15:34:31');
INSERT INTO `sys_logs` VALUES (594, 'AISchoolForms', 'Xoá ảnh', 1, 'Thư viện ảnh: test1; Tên ảnh: fni3_HĐ WEB.pdf', '2023-03-21 15:34:33', '2023-03-21 15:34:33');
INSERT INTO `sys_logs` VALUES (595, 'AISchoolForms', 'Xoá ảnh', 1, 'Thư viện ảnh: test1; Tên ảnh: b490_hoisv1tttt.jpg', '2023-03-21 15:34:35', '2023-03-21 15:34:35');
INSERT INTO `sys_logs` VALUES (596, 'AISchoolForms', 'Xoá ảnh', 1, 'Thư viện ảnh: test1; Tên ảnh: fzj0_HĐ WEB.pdf', '2023-03-21 15:34:37', '2023-03-21 15:34:37');
INSERT INTO `sys_logs` VALUES (597, 'AISchoolForms', 'Thêm file', 1, 'Biểu mẫu: test1; Tên file: eUQU_HĐ WEB.pdf', '2023-03-21 15:34:51', '2023-03-21 15:34:51');
INSERT INTO `sys_logs` VALUES (598, 'AISchoolForms', 'Xoá ảnh', 1, 'Thư viện ảnh: test1; Tên ảnh: eUQU_HĐ WEB.pdf', '2023-03-21 15:35:48', '2023-03-21 15:35:48');
INSERT INTO `sys_logs` VALUES (599, 'AISchoolForms', 'Thêm file', 1, 'Biểu mẫu: test1; Tên file: 5Bs3_HĐ WEB (1).pdf', '2023-03-21 15:35:55', '2023-03-21 15:35:55');
INSERT INTO `sys_logs` VALUES (600, 'AISchoolForms', 'Thêm file', 1, 'Biểu mẫu: test1; Tên file: novf_VNPT-IT KV3_Baocaokhaosat_So VHTTDL_STG_06092022.doc', '2023-03-21 15:38:09', '2023-03-21 15:38:09');
INSERT INTO `sys_logs` VALUES (601, 'AISchoolForms', 'Thêm file', 1, 'Biểu mẫu: test1; Tên file: fnyA_5569750.pdf', '2023-03-21 15:39:50', '2023-03-21 15:39:50');
INSERT INTO `sys_logs` VALUES (602, 'AISchoolForms', 'Xoá ảnh', 1, 'Thư viện ảnh: test1; Tên ảnh: fnyA_5569750.pdf', '2023-03-21 15:59:50', '2023-03-21 15:59:50');
INSERT INTO `sys_logs` VALUES (603, 'AISchoolForms', 'Thêm file', 1, 'Biểu mẫu: test1; Tên file: vJHR_', '2023-03-21 16:01:09', '2023-03-21 16:01:09');
INSERT INTO `sys_logs` VALUES (604, 'AISchoolForms', 'Xoá ảnh', 1, 'Thư viện ảnh: test1; Tên ảnh: vJHR_', '2023-03-21 16:01:26', '2023-03-21 16:01:26');
INSERT INTO `sys_logs` VALUES (605, 'AISchoolForms', 'Thêm file', 1, 'Biểu mẫu: test1; Tên file: kuVT_', '2023-03-21 16:01:29', '2023-03-21 16:01:29');
INSERT INTO `sys_logs` VALUES (606, 'AISchoolForms', 'Xoá ảnh', 1, 'Thư viện ảnh: test1; Tên ảnh: kuVT_', '2023-03-21 16:01:31', '2023-03-21 16:01:31');
INSERT INTO `sys_logs` VALUES (607, 'AISchoolForms', 'Thêm file', 1, 'Biểu mẫu: test1; Tên file: 7HlK_HĐ WEB.pdf', '2023-03-21 16:01:51', '2023-03-21 16:01:51');
INSERT INTO `sys_logs` VALUES (608, 'AISchoolForms', 'Xoá ảnh', 1, 'Thư viện ảnh: test1; Tên ảnh: 7HlK_HĐ WEB.pdf', '2023-03-21 16:01:57', '2023-03-21 16:01:57');
INSERT INTO `sys_logs` VALUES (609, 'AISchoolForms', 'Xoá ảnh', 1, 'Thư viện ảnh: test1; Tên ảnh: novf_VNPT-IT KV3_Baocaokhaosat_So VHTTDL_STG_06092022.doc', '2023-03-21 16:02:40', '2023-03-21 16:02:40');
INSERT INTO `sys_logs` VALUES (610, 'AISchoolForms', 'Xoá ảnh', 1, 'Thư viện ảnh: test1; Tên ảnh: 5Bs3_HĐ WEB.pdf', '2023-03-21 16:04:01', '2023-03-21 16:04:01');
INSERT INTO `sys_logs` VALUES (611, 'AISchoolForms', 'Thêm file', 1, 'Biểu mẫu: test1; Tên file: VKep_HĐ WEB.pdf', '2023-03-21 16:15:23', '2023-03-21 16:15:23');
INSERT INTO `sys_logs` VALUES (612, 'AISchoolForms', 'Xoá ảnh', 1, 'Thư viện ảnh: test1; Tên ảnh: VKep_HĐ WEB.pdf', '2023-03-21 16:15:24', '2023-03-21 16:15:24');
INSERT INTO `sys_logs` VALUES (613, 'AISchoolForms', 'Thêm file', 1, 'Biểu mẫu: test1; Tên file: tx6V_HĐ WEB.pdf', '2023-03-21 16:26:48', '2023-03-21 16:26:48');
INSERT INTO `sys_logs` VALUES (614, 'AISchoolForms', 'Thêm file', 1, 'Biểu mẫu: test1; Tên file: QLhO_HĐ WEB (1).pdf', '2023-03-21 16:26:58', '2023-03-21 16:26:58');
INSERT INTO `sys_logs` VALUES (615, 'AISchoolForms', 'Thêm file', 1, 'Biểu mẫu: test1; Tên file: DFmp_soctrang.gov.vn.pdf', '2023-03-21 16:27:44', '2023-03-21 16:27:44');
INSERT INTO `sys_logs` VALUES (616, 'AISchoolForms', 'Xoá ảnh', 1, 'Thư viện ảnh: test1; Tên ảnh: QLhO_HĐ WEB (1).pdf', '2023-03-21 16:29:28', '2023-03-21 16:29:28');
INSERT INTO `sys_logs` VALUES (617, 'AISchoolForms', 'Xoá ảnh', 1, 'Thư viện ảnh: test1; Tên ảnh: DFmp_soctrang.gov.vn.pdf', '2023-03-21 16:29:29', '2023-03-21 16:29:29');
INSERT INTO `sys_logs` VALUES (618, 'AISchoolForms', 'Xoá ảnh', 1, 'Thư viện ảnh: test1; Tên ảnh: tx6V_HĐ WEB.pdf', '2023-03-21 16:29:30', '2023-03-21 16:29:30');
INSERT INTO `sys_logs` VALUES (619, 'AISchoolForms', 'Thêm file', 1, 'Biểu mẫu: test1; Tên file: LkfF_HĐ WEB.pdf', '2023-03-21 16:29:37', '2023-03-21 16:29:37');
INSERT INTO `sys_logs` VALUES (620, 'AISchoolForms', 'Thêm file', 1, 'Biểu mẫu: test1; Tên file: quGG_HĐ WEB (1).pdf', '2023-03-21 16:29:41', '2023-03-21 16:29:41');
INSERT INTO `sys_logs` VALUES (621, 'AISchoolForms', 'Thêm file', 1, 'Biểu mẫu: test1; Tên file: dRIA_VNPT-IT KV3_Baocaokhaosat_So VHTTDL_STG_06092022.doc', '2023-03-21 16:29:46', '2023-03-21 16:29:46');
INSERT INTO `sys_logs` VALUES (622, 'AISchoolForms', 'Xoá ảnh', 1, 'Thư viện ảnh: test1; Tên ảnh: LkfF_HĐ WEB.pdf', '2023-03-21 16:29:48', '2023-03-21 16:29:48');
INSERT INTO `sys_logs` VALUES (623, 'AISchoolForms', 'Xoá ảnh', 1, 'Thư viện ảnh: test1; Tên ảnh: quGG_HĐ WEB (1).pdf', '2023-03-21 16:29:48', '2023-03-21 16:29:48');
INSERT INTO `sys_logs` VALUES (624, 'AISchoolForms', 'Xoá ảnh', 1, 'Thư viện ảnh: test1; Tên ảnh: dRIA_VNPT-IT KV3_Baocaokhaosat_So VHTTDL_STG_06092022.doc', '2023-03-21 16:29:49', '2023-03-21 16:29:49');
INSERT INTO `sys_logs` VALUES (625, 'AISchoolForms', 'Thêm file', 1, 'Biểu mẫu: test1; Tên file: 1GCu_HĐ WEB.pdf', '2023-03-21 16:31:48', '2023-03-21 16:31:48');
INSERT INTO `sys_logs` VALUES (626, 'AISchoolForms', 'Xoá ảnh', 1, 'Thư viện ảnh: test1; Tên ảnh: lawe_HĐ WEB (1).pdf', '2023-03-21 16:37:50', '2023-03-21 16:37:50');
INSERT INTO `sys_logs` VALUES (627, 'AISchoolForms', 'Xoá ảnh', 1, 'Thư viện ảnh: test1; Tên ảnh: 1GCu_HĐ WEB.pdf', '2023-03-21 16:37:51', '2023-03-21 16:37:51');
INSERT INTO `sys_logs` VALUES (628, 'Đăng nhập', 'Đăng nhập', 1, '', '2023-03-24 09:19:42', '2023-03-24 09:19:42');
INSERT INTO `sys_logs` VALUES (629, 'Đăng nhập', 'Đăng nhập', 1, '', '2023-03-24 14:32:05', '2023-03-24 14:32:05');
INSERT INTO `sys_logs` VALUES (630, 'Điểm đến du lịch', 'Thêm ảnh', 1, 'Điểm đến: Sóc Trăngasd; Tên ảnh: YVfw_81344171.jpg', '2023-03-24 15:16:50', '2023-03-24 15:16:50');
INSERT INTO `sys_logs` VALUES (631, 'Đăng nhập', 'Đăng nhập', 1, '', '2023-03-27 16:49:36', '2023-03-27 16:49:36');
INSERT INTO `sys_logs` VALUES (632, 'Đăng nhập', 'Đăng nhập', 1, '', '2023-04-05 15:55:22', '2023-04-05 15:55:22');
INSERT INTO `sys_logs` VALUES (633, 'Đăng nhập', 'Đăng nhập', 1, '', '2023-04-21 10:36:20', '2023-04-21 10:36:20');
INSERT INTO `sys_logs` VALUES (634, 'Đăng nhập', 'Đăng nhập', 4, '', '2023-04-21 11:07:51', '2023-04-21 11:07:51');
INSERT INTO `sys_logs` VALUES (635, 'Đăng nhập', 'Đăng nhập', 1, '', '2023-04-21 11:12:01', '2023-04-21 11:12:01');
INSERT INTO `sys_logs` VALUES (636, 'Quản lý người dùng', 'Thêm mới', 1, 'Tài khoản: phonggdmytu', '2023-04-21 15:43:19', '2023-04-21 15:43:19');
INSERT INTO `sys_logs` VALUES (637, 'Quản lý người dùng', 'Sửa đổi', 1, 'Tài khoản: sadasdwww5454', '2023-04-21 15:49:18', '2023-04-21 15:49:18');
INSERT INTO `sys_logs` VALUES (638, 'Quản lý người dùng', 'Thêm mới', 1, 'Tài khoản: thmyquoi2', '2023-04-21 15:49:44', '2023-04-21 15:49:44');
INSERT INTO `sys_logs` VALUES (639, 'Quản lý người dùng', 'Thêm mới', 1, 'Tài khoản: nguyenvana', '2023-04-21 15:59:48', '2023-04-21 15:59:48');
INSERT INTO `sys_logs` VALUES (640, 'Quản lý người dùng', 'Thêm mới', 1, 'Tài khoản: nguyenvana', '2023-04-21 15:59:59', '2023-04-21 15:59:59');
INSERT INTO `sys_logs` VALUES (641, 'Quản lý người dùng', 'Thêm mới', 1, 'Tài khoản: nguyenvana', '2023-04-21 16:00:20', '2023-04-21 16:00:20');
INSERT INTO `sys_logs` VALUES (642, 'Quản lý người dùng', 'Thêm mới', 1, 'Tài khoản: nguyenvana', '2023-04-21 16:00:39', '2023-04-21 16:00:39');
INSERT INTO `sys_logs` VALUES (643, 'Quản lý người dùng', 'Thêm mới', 1, 'Tài khoản: nguyenvana', '2023-04-21 16:01:02', '2023-04-21 16:01:02');
INSERT INTO `sys_logs` VALUES (644, 'Quản lý người dùng', 'Thêm mới', 1, 'Tài khoản: nguyenvana', '2023-04-21 16:02:03', '2023-04-21 16:02:03');
INSERT INTO `sys_logs` VALUES (645, 'Quản lý người dùng', 'Thêm mới', 1, 'Tài khoản: nguyenvana', '2023-04-21 16:06:09', '2023-04-21 16:06:09');
INSERT INTO `sys_logs` VALUES (646, 'Quản lý người dùng', 'Thêm mới', 1, 'Tài khoản: nguyenvana', '2023-04-21 16:08:04', '2023-04-21 16:08:04');
INSERT INTO `sys_logs` VALUES (647, 'Quản lý người dùng', 'Thêm mới', 1, 'Tài khoản: phonggdmytu', '2023-04-21 16:08:57', '2023-04-21 16:08:57');
INSERT INTO `sys_logs` VALUES (648, 'Quản lý người dùng', 'Thêm mới', 1, 'Tài khoản: nguyenvana', '2023-04-21 16:13:58', '2023-04-21 16:13:58');
INSERT INTO `sys_logs` VALUES (649, 'Đăng nhập', 'Đăng nhập', 1, '', '2023-05-04 16:34:47', '2023-05-04 16:34:47');
INSERT INTO `sys_logs` VALUES (650, 'Phân quyền chức năng', 'Sửa đổi', 1, 'Phân quyền tài khoản: admin3', '2023-05-04 16:48:36', '2023-05-04 16:48:36');
INSERT INTO `sys_logs` VALUES (651, 'Đăng nhập', 'Đăng nhập', 1, '', '2023-05-05 15:53:49', '2023-05-05 15:53:49');
INSERT INTO `sys_logs` VALUES (652, 'Đăng nhập', 'Đăng nhập', 1, '', '2023-05-08 15:07:31', '2023-05-08 15:07:31');
INSERT INTO `sys_logs` VALUES (653, 'AITourismDestination', 'Thêm', 1, 'Thêm điểm đến du lịch: Thái Đình Cẩn11', '2023-05-08 16:03:10', '2023-05-08 16:03:10');
INSERT INTO `sys_logs` VALUES (654, 'AITourismDestination', 'Sửa', 1, 'Sửa điểm đến du lịch: Thái Đình Cẩn11 thành Thái Đình Cẩn11', '2023-05-08 16:07:09', '2023-05-08 16:07:09');
INSERT INTO `sys_logs` VALUES (655, 'AITourismDestination', 'Thêm ảnh', 1, 'Điểm đến: Thái Đình Cẩn; Tên ảnh: 38wY_signature_sep_Thai.png', '2023-05-08 16:07:20', '2023-05-08 16:07:20');
INSERT INTO `sys_logs` VALUES (656, 'AITourismDestination', 'Xoá ảnh', 1, 'Điểm đến: Thái Đình Cẩn; Tên ảnh: 7ZeZ_logo (1).png', '2023-05-08 16:07:25', '2023-05-08 16:07:25');
INSERT INTO `sys_logs` VALUES (657, 'AITourismDestination', 'Xoá ảnh', 1, 'Điểm đến: Thái Đình Cẩn; Tên ảnh: 38wY_signature_sep_Thai.png', '2023-05-08 16:07:45', '2023-05-08 16:07:45');
INSERT INTO `sys_logs` VALUES (658, 'AITourismDestination', 'Xoá ảnh', 1, 'Điểm đến: Thái Đình Cẩn; Tên ảnh: xIC4_logo.jpg', '2023-05-08 16:07:46', '2023-05-08 16:07:46');
INSERT INTO `sys_logs` VALUES (659, 'AITourismDestination', 'Xoá ảnh', 1, 'Điểm đến: Thái Đình Cẩn; Tên ảnh: bqwo_logo (2).png', '2023-05-08 16:07:47', '2023-05-08 16:07:47');
INSERT INTO `sys_logs` VALUES (660, 'AITourismDestination', 'Xoá', 1, 'Xóa điểm đến: Thái Đình Cẩn', '2023-05-08 16:09:12', '2023-05-08 16:09:12');
INSERT INTO `sys_logs` VALUES (661, 'Đăng nhập', 'Đăng nhập', 1, '', '2023-05-09 09:12:11', '2023-05-09 09:12:11');
INSERT INTO `sys_logs` VALUES (662, 'Đăng nhập', 'Đăng nhập', 1, '', '2023-05-09 14:46:27', '2023-05-09 14:46:27');
INSERT INTO `sys_logs` VALUES (663, 'Đăng nhập', 'Đăng nhập', 1, '', '2023-05-09 14:51:14', '2023-05-09 14:51:14');
INSERT INTO `sys_logs` VALUES (664, 'Đăng nhập', 'Đăng nhập', 1, '', '2023-06-05 13:58:23', '2023-06-05 13:58:23');
INSERT INTO `sys_logs` VALUES (665, 'Phân quyền chức năng', 'Sửa đổi', 1, 'Phân quyền tài khoản: admin3', '2023-06-05 16:42:24', '2023-06-05 16:42:24');
INSERT INTO `sys_logs` VALUES (666, 'Phân quyền chức năng', 'Sửa đổi', 1, 'Phân quyền tài khoản: admin3', '2023-06-05 16:42:50', '2023-06-05 16:42:50');
INSERT INTO `sys_logs` VALUES (667, 'Đăng nhập', 'Đăng nhập', 4, '', '2023-06-05 16:44:14', '2023-06-05 16:44:14');
INSERT INTO `sys_logs` VALUES (668, 'Đăng nhập', 'Đăng nhập', 1, '', '2023-06-06 09:24:06', '2023-06-06 09:24:06');
INSERT INTO `sys_logs` VALUES (669, 'Đăng nhập', 'Đăng nhập', 1, '', '2023-06-06 14:57:57', '2023-06-06 14:57:57');
INSERT INTO `sys_logs` VALUES (670, 'Đăng nhập', 'Đăng nhập', 1, '', '2023-06-07 09:11:09', '2023-06-07 09:11:09');
INSERT INTO `sys_logs` VALUES (671, 'Đăng nhập', 'Đăng nhập', 1, '', '2023-06-07 15:00:50', '2023-06-07 15:00:50');
INSERT INTO `sys_logs` VALUES (672, 'Đăng nhập', 'Đăng nhập', 1, '', '2023-06-08 09:13:01', '2023-06-08 09:13:01');
INSERT INTO `sys_logs` VALUES (673, 'Đăng nhập', 'Đăng nhập', 1, '', '2023-06-08 14:38:41', '2023-06-08 14:38:41');
INSERT INTO `sys_logs` VALUES (674, 'Đăng nhập', 'Đăng nhập', 1, '', '2023-06-09 08:54:08', '2023-06-09 08:54:08');
INSERT INTO `sys_logs` VALUES (675, 'Đăng nhập', 'Đăng nhập', 1, '', '2023-06-09 15:06:26', '2023-06-09 15:06:26');
INSERT INTO `sys_logs` VALUES (676, 'Đăng nhập', 'Đăng nhập', 1, '', '2023-06-12 09:41:04', '2023-06-12 09:41:04');
INSERT INTO `sys_logs` VALUES (677, 'Đăng nhập', 'Đăng nhập', 1, '', '2023-06-12 14:24:57', '2023-06-12 14:24:57');
INSERT INTO `sys_logs` VALUES (678, 'Đăng nhập', 'Đăng nhập', 1, '', '2023-06-13 09:13:05', '2023-06-13 09:13:05');
INSERT INTO `sys_logs` VALUES (679, 'Đăng nhập', 'Đăng nhập', 1, '', '2023-06-13 14:24:52', '2023-06-13 14:24:52');
INSERT INTO `sys_logs` VALUES (680, 'Đăng nhập', 'Đăng nhập', 1, '', '2023-06-14 09:42:15', '2023-06-14 09:42:15');
INSERT INTO `sys_logs` VALUES (681, 'Đăng nhập', 'Đăng nhập', 1, '', '2023-06-14 15:13:33', '2023-06-14 15:13:33');
INSERT INTO `sys_logs` VALUES (682, 'Đăng nhập', 'Đăng nhập', 1, '', '2023-06-16 09:09:21', '2023-06-16 09:09:21');
INSERT INTO `sys_logs` VALUES (683, 'Đăng nhập', 'Đăng nhập', 1, '', '2023-06-16 14:48:29', '2023-06-16 14:48:29');
INSERT INTO `sys_logs` VALUES (684, 'Đăng nhập', 'Đăng nhập', 1, '', '2023-06-19 10:34:54', '2023-06-19 10:34:54');
INSERT INTO `sys_logs` VALUES (685, 'Đăng nhập', 'Đăng nhập', 1, '', '2023-06-19 14:25:06', '2023-06-19 14:25:06');
INSERT INTO `sys_logs` VALUES (686, 'Đăng nhập', 'Đăng nhập', 1, '', '2023-06-20 09:00:32', '2023-06-20 09:00:32');
INSERT INTO `sys_logs` VALUES (687, 'Đăng nhập', 'Đăng nhập', 1, '', '2023-06-21 09:27:58', '2023-06-21 09:27:58');
INSERT INTO `sys_logs` VALUES (688, 'Đăng nhập', 'Đăng nhập', 1, '', '2023-06-21 14:07:19', '2023-06-21 14:07:19');
INSERT INTO `sys_logs` VALUES (689, 'Đăng nhập', 'Đăng nhập', 1, '', '2023-06-22 09:57:58', '2023-06-22 09:57:58');
INSERT INTO `sys_logs` VALUES (690, 'Đăng nhập', 'Đăng nhập', 1, '', '2023-06-22 10:29:14', '2023-06-22 10:29:14');
INSERT INTO `sys_logs` VALUES (691, 'AIManageStudents', 'Thêm mới', 1, 'Dịch vụ: Tên học sinh *', '2023-06-27 10:51:40', '2023-06-27 10:51:40');
INSERT INTO `sys_logs` VALUES (692, 'Đăng nhập', 'Đăng nhập', 1, '', '2023-06-27 15:21:28', '2023-06-27 15:21:28');
INSERT INTO `sys_logs` VALUES (693, 'Đăng nhập', 'Đăng nhập', 1, '', '2023-06-28 08:54:55', '2023-06-28 08:54:55');
INSERT INTO `sys_logs` VALUES (694, 'Đăng nhập', 'Đăng nhập', 1, '', '2023-06-28 14:02:13', '2023-06-28 14:02:13');
INSERT INTO `sys_logs` VALUES (695, 'Đăng nhập', 'Đăng nhập', 1, '', '2023-06-28 15:37:07', '2023-06-28 15:37:07');
INSERT INTO `sys_logs` VALUES (696, 'Đăng nhập', 'Đăng nhập', 1, '', '2023-06-28 15:37:22', '2023-06-28 15:37:22');
INSERT INTO `sys_logs` VALUES (697, 'Đăng nhập', 'Đăng nhập', 1, '', '2023-06-28 15:47:11', '2023-06-28 15:47:11');
INSERT INTO `sys_logs` VALUES (698, 'Đăng nhập', 'Đăng nhập', 1, '', '2023-06-28 16:01:41', '2023-06-28 16:01:41');
INSERT INTO `sys_logs` VALUES (699, 'Đăng nhập', 'Đăng nhập', 1, '', '2023-06-28 16:03:29', '2023-06-28 16:03:29');
INSERT INTO `sys_logs` VALUES (700, 'Đăng nhập', 'Đăng nhập', 1, '', '2023-06-28 16:43:34', '2023-06-28 16:43:34');
INSERT INTO `sys_logs` VALUES (701, 'Đăng nhập', 'Đăng nhập', 1, '', '2023-06-29 09:09:58', '2023-06-29 09:09:58');
INSERT INTO `sys_logs` VALUES (702, 'Quản lý người dùng', 'Thêm mới', 1, 'Tài khoản: TTGDNN Châu Thành', '2023-06-29 09:41:33', '2023-06-29 09:41:33');
INSERT INTO `sys_logs` VALUES (703, 'Đăng nhập', 'Đăng nhập', 13, '', '2023-06-29 10:34:05', '2023-06-29 10:34:05');
INSERT INTO `sys_logs` VALUES (704, 'Đăng nhập', 'Đăng nhập', 1, '', '2023-06-29 10:35:43', '2023-06-29 10:35:43');
INSERT INTO `sys_logs` VALUES (705, 'Phân quyền chức năng', 'Sửa đổi', 1, 'Phân quyền tài khoản: admin_ttgdnncth', '2023-06-29 10:35:58', '2023-06-29 10:35:58');
INSERT INTO `sys_logs` VALUES (706, 'Đăng nhập', 'Đăng nhập', 2, '', '2023-06-29 10:36:47', '2023-06-29 10:36:47');
INSERT INTO `sys_logs` VALUES (707, 'Đăng nhập', 'Đăng nhập', 1, '', '2023-06-29 10:37:02', '2023-06-29 10:37:02');
INSERT INTO `sys_logs` VALUES (708, 'Phân quyền module', 'Sửa đổi', 1, 'Phân quyền tài khoản: admin_ttgdnncth', '2023-06-29 10:37:09', '2023-06-29 10:37:09');
INSERT INTO `sys_logs` VALUES (709, 'Đăng nhập', 'Đăng nhập', 2, '', '2023-06-29 10:37:51', '2023-06-29 10:37:51');
INSERT INTO `sys_logs` VALUES (710, 'Đăng nhập', 'Đăng nhập', 1, '', '2023-06-29 14:08:08', '2023-06-29 14:08:08');
INSERT INTO `sys_logs` VALUES (711, 'Đăng nhập', 'Đăng nhập', 1, '', '2023-06-29 14:21:19', '2023-06-29 14:21:19');
INSERT INTO `sys_logs` VALUES (712, 'Đăng nhập', 'Đăng nhập', 2, '', '2023-06-29 14:21:25', '2023-06-29 14:21:25');
INSERT INTO `sys_logs` VALUES (713, 'Quản lý người dùng', 'Thêm mới', 2, 'Tài khoản: test_admin_cth', '2023-06-29 14:53:07', '2023-06-29 14:53:07');
INSERT INTO `sys_logs` VALUES (714, 'Quản lý người dùng', 'Thêm mới', 2, 'Tài khoản: test_admin_cth', '2023-06-29 14:54:05', '2023-06-29 14:54:05');
INSERT INTO `sys_logs` VALUES (715, 'Quản lý người dùng', 'Thêm mới', 2, 'Tài khoản: test_admin_cth1', '2023-06-29 15:08:27', '2023-06-29 15:08:27');
INSERT INTO `sys_logs` VALUES (716, 'Đăng nhập', 'Đăng nhập', 1, '', '2023-06-29 15:10:26', '2023-06-29 15:10:26');
INSERT INTO `sys_logs` VALUES (717, 'Đăng nhập', 'Đăng nhập', 2, '', '2023-06-29 15:10:45', '2023-06-29 15:10:45');
INSERT INTO `sys_logs` VALUES (718, 'Đăng nhập', 'Đăng nhập', 1, '', '2023-06-29 15:21:33', '2023-06-29 15:21:33');
INSERT INTO `sys_logs` VALUES (719, 'Đăng nhập', 'Đăng nhập', 2, '', '2023-06-29 15:22:43', '2023-06-29 15:22:43');
INSERT INTO `sys_logs` VALUES (720, 'Đăng nhập', 'Đăng nhập', 1, '', '2023-06-29 15:55:14', '2023-06-29 15:55:14');
INSERT INTO `sys_logs` VALUES (721, 'AIListOfPeoples', 'Thêm', 1, 'Quảng cáo: test', '2023-06-29 16:57:56', '2023-06-29 16:57:56');
INSERT INTO `sys_logs` VALUES (722, 'AIListOfPeoples', 'Thêm', 1, 'Quảng cáo: rwar', '2023-06-29 16:59:58', '2023-06-29 16:59:58');
INSERT INTO `sys_logs` VALUES (723, 'AIListOfPeoples', 'Xoá', 1, 'Quảng cáo: rwar', '2023-06-29 17:00:01', '2023-06-29 17:00:01');
INSERT INTO `sys_logs` VALUES (724, 'Phân quyền module', 'Sửa đổi', 1, 'Phân quyền tài khoản: admin_ttgdnncth', '2023-06-29 17:00:26', '2023-06-29 17:00:26');
INSERT INTO `sys_logs` VALUES (725, 'Đăng nhập', 'Đăng nhập', 1, '', '2023-06-29 17:00:34', '2023-06-29 17:00:34');
INSERT INTO `sys_logs` VALUES (726, 'Đăng nhập', 'Đăng nhập', 2, '', '2023-06-29 17:00:44', '2023-06-29 17:00:44');
INSERT INTO `sys_logs` VALUES (727, 'Đăng nhập', 'Đăng nhập', 1, '', '2023-06-30 08:11:30', '2023-06-30 08:11:30');
INSERT INTO `sys_logs` VALUES (728, 'Đăng nhập', 'Đăng nhập', 1, '', '2023-06-30 14:50:05', '2023-06-30 14:50:05');
INSERT INTO `sys_logs` VALUES (729, 'Đăng nhập', 'Đăng nhập', 2, '', '2023-06-30 14:50:35', '2023-06-30 14:50:35');
INSERT INTO `sys_logs` VALUES (730, 'AIListOfPeoples', 'Thêm', 2, 'Quảng cáo: test', '2023-06-30 15:26:52', '2023-06-30 15:26:52');
INSERT INTO `sys_logs` VALUES (731, 'AIListOfPeoples', 'Sửa', 2, 'Quảng cáo: test', '2023-06-30 15:30:13', '2023-06-30 15:30:13');
INSERT INTO `sys_logs` VALUES (732, 'AIListOfPeoples', 'Sửa', 2, 'Quảng cáo: test1', '2023-06-30 15:30:17', '2023-06-30 15:30:17');
INSERT INTO `sys_logs` VALUES (733, 'AIListOfPeoples', 'Sửa', 2, 'Quảng cáo: test', '2023-06-30 15:30:26', '2023-06-30 15:30:26');
INSERT INTO `sys_logs` VALUES (734, 'AIListOfPeoples', 'Thêm', 2, 'Quảng cáo: test', '2023-06-30 15:30:30', '2023-06-30 15:30:30');
INSERT INTO `sys_logs` VALUES (735, 'AIListOfPeoples', 'Sửa', 2, 'Quảng cáo: test1', '2023-06-30 15:31:27', '2023-06-30 15:31:27');
INSERT INTO `sys_logs` VALUES (736, 'AIListOfPeoples', 'Thêm', 2, 'Quảng cáo: test', '2023-06-30 15:31:33', '2023-06-30 15:31:33');
INSERT INTO `sys_logs` VALUES (737, 'AIListOfPeoples', 'Thêm', 2, 'Quảng cáo: test1', '2023-06-30 15:31:37', '2023-06-30 15:31:37');
INSERT INTO `sys_logs` VALUES (738, 'AIListOfPeoples', 'Xoá', 2, 'Quảng cáo: test1', '2023-06-30 15:31:53', '2023-06-30 15:31:53');
INSERT INTO `sys_logs` VALUES (739, 'AIListOfPeoples', 'Thêm', 2, 'Quảng cáo: test1', '2023-06-30 15:32:16', '2023-06-30 15:32:16');
INSERT INTO `sys_logs` VALUES (740, 'AIListOfPeoples', 'Thêm', 2, 'Quảng cáo: test', '2023-06-30 15:32:21', '2023-06-30 15:32:21');
INSERT INTO `sys_logs` VALUES (741, 'AIListOfPeoples', 'Xoá', 2, 'Quảng cáo: test', '2023-06-30 15:32:29', '2023-06-30 15:32:29');
INSERT INTO `sys_logs` VALUES (742, 'AIListOfPeoples', 'Sửa', 2, 'Quảng cáo: test', '2023-06-30 15:32:32', '2023-06-30 15:32:32');
INSERT INTO `sys_logs` VALUES (743, 'AIListOfPeoples', 'Thêm', 2, 'Quảng cáo: test', '2023-06-30 15:32:36', '2023-06-30 15:32:36');
INSERT INTO `sys_logs` VALUES (744, 'AIListOfPeoples', 'Xoá', 2, 'Quảng cáo: test', '2023-06-30 15:32:53', '2023-06-30 15:32:53');
INSERT INTO `sys_logs` VALUES (745, 'AIListOfPeoples', 'Sửa', 2, 'Quảng cáo: test1', '2023-06-30 15:32:57', '2023-06-30 15:32:57');
INSERT INTO `sys_logs` VALUES (746, 'AIListOfPeoples', 'Thêm', 2, 'Quảng cáo: test', '2023-06-30 15:33:11', '2023-06-30 15:33:11');
INSERT INTO `sys_logs` VALUES (747, 'AIListOfPeoples', 'Xoá', 2, 'Quảng cáo: test', '2023-06-30 15:33:15', '2023-06-30 15:33:15');
INSERT INTO `sys_logs` VALUES (748, 'AIListOfPeoples', 'Sửa', 2, 'Quảng cáo: test', '2023-06-30 15:33:17', '2023-06-30 15:33:17');
INSERT INTO `sys_logs` VALUES (749, 'AITypeOfPeoples', 'Xoá', 2, 'Dân tộc: test', '2023-06-30 16:51:34', '2023-06-30 16:51:34');
INSERT INTO `sys_logs` VALUES (750, 'AITypeOfPeoples', 'Thêm', 2, 'Dân tộc: test', '2023-06-30 16:51:38', '2023-06-30 16:51:38');
INSERT INTO `sys_logs` VALUES (751, 'AITypeOfPeoples', 'Sửa', 2, 'Dân tộc: test1', '2023-06-30 16:51:42', '2023-06-30 16:51:42');
INSERT INTO `sys_logs` VALUES (752, 'AITypeOfPeoples', 'Sửa', 2, 'Dân tộc: test2', '2023-06-30 16:51:49', '2023-06-30 16:51:49');
INSERT INTO `sys_logs` VALUES (753, 'AITypeOfPeoples', 'Thêm', 2, 'Dân tộc: test', '2023-06-30 16:51:54', '2023-06-30 16:51:54');
INSERT INTO `sys_logs` VALUES (754, 'Đăng nhập', 'Đăng nhập', 1, '', '2023-06-30 16:56:34', '2023-06-30 16:56:34');
INSERT INTO `sys_logs` VALUES (755, 'Phân quyền module', 'Sửa đổi', 1, 'Phân quyền tài khoản: admin_ttgdnncth', '2023-06-30 16:56:53', '2023-06-30 16:56:53');
INSERT INTO `sys_logs` VALUES (756, 'Đăng nhập', 'Đăng nhập', 2, '', '2023-06-30 16:57:03', '2023-06-30 16:57:03');
INSERT INTO `sys_logs` VALUES (757, 'AITypeOfFamilyMembers', 'Xoá', 2, 'Dân tộc: test', '2023-06-30 17:01:28', '2023-06-30 17:01:28');
INSERT INTO `sys_logs` VALUES (758, 'AITypeOfFamilyMembers', 'Xoá', 2, 'Dân tộc: test2', '2023-06-30 17:01:31', '2023-06-30 17:01:31');
INSERT INTO `sys_logs` VALUES (759, 'AITypeOfFamilyMembers', 'Thêm', 2, 'Dân tộc: Địa chủ', '2023-06-30 17:02:00', '2023-06-30 17:02:00');
INSERT INTO `sys_logs` VALUES (760, 'Đăng nhập', 'Đăng nhập', 1, '', '2023-07-03 14:01:15', '2023-07-03 14:01:15');
INSERT INTO `sys_logs` VALUES (761, 'Đăng nhập', 'Đăng nhập', 2, '', '2023-07-03 14:03:23', '2023-07-03 14:03:23');
INSERT INTO `sys_logs` VALUES (762, 'AITypeOfFamilyMembers', 'Thêm', 2, 'Thành phần gia đình: Nông dân', '2023-07-03 14:03:41', '2023-07-03 14:03:41');
INSERT INTO `sys_logs` VALUES (763, 'Đăng nhập', 'Đăng nhập', 1, '', '2023-07-03 14:09:43', '2023-07-03 14:09:43');
INSERT INTO `sys_logs` VALUES (764, 'Phân quyền module', 'Sửa đổi', 1, 'Phân quyền tài khoản: admin_ttgdnncth', '2023-07-03 14:10:12', '2023-07-03 14:10:12');
INSERT INTO `sys_logs` VALUES (765, 'AITypeOfReligions', 'Thêm', 2, 'Tôn giáo: Phật giáo', '2023-07-03 14:17:59', '2023-07-03 14:17:59');
INSERT INTO `sys_logs` VALUES (766, 'Phân quyền module', 'Sửa đổi', 1, 'Phân quyền tài khoản: admin_ttgdnncth', '2023-07-03 14:43:10', '2023-07-03 14:43:10');
INSERT INTO `sys_logs` VALUES (767, 'AITypeOfCourses', 'Sửa', 2, 'Khóa học: test3', '2023-07-03 15:03:07', '2023-07-03 15:03:07');
INSERT INTO `sys_logs` VALUES (768, 'Phân quyền module', 'Sửa đổi', 1, 'Phân quyền tài khoản: admin_ttgdnncth', '2023-07-03 15:53:06', '2023-07-03 15:53:06');
INSERT INTO `sys_logs` VALUES (769, 'Phân quyền module', 'Sửa đổi', 1, 'Phân quyền tài khoản: admin_ttgdnncth', '2023-07-03 15:53:15', '2023-07-03 15:53:15');
INSERT INTO `sys_logs` VALUES (770, 'AITypeOfCourses', 'Thêm', 2, 'Khóa học: Thiểu số', '2023-07-03 16:33:10', '2023-07-03 16:33:10');
INSERT INTO `sys_logs` VALUES (771, 'AITypeOfRecruitments', 'Thêm', 2, 'Đối tượng tuyển sinh / ưu tiên: Thiểu số', '2023-07-03 16:35:26', '2023-07-03 16:35:26');
INSERT INTO `sys_logs` VALUES (772, 'Phân quyền module', 'Sửa đổi', 1, 'Phân quyền tài khoản: admin_ttgdnncth', '2023-07-03 17:02:22', '2023-07-03 17:02:22');
INSERT INTO `sys_logs` VALUES (773, 'AITypeOfTrainingForms', 'Thêm', 2, 'Hình thức đào tạo: Trực tuyến', '2023-07-03 17:07:37', '2023-07-03 17:07:37');
INSERT INTO `sys_logs` VALUES (774, 'Đăng nhập', 'Đăng nhập', 1, '', '2023-07-04 09:32:15', '2023-07-04 09:32:15');
INSERT INTO `sys_logs` VALUES (775, 'Đăng nhập', 'Đăng nhập', 2, '', '2023-07-04 09:32:42', '2023-07-04 09:32:42');
INSERT INTO `sys_logs` VALUES (776, 'Đăng nhập', 'Đăng nhập', 1, '', '2023-07-04 09:53:19', '2023-07-04 09:53:19');
INSERT INTO `sys_logs` VALUES (777, 'Phân quyền module', 'Sửa đổi', 1, 'Phân quyền tài khoản: admin_ttgdnncth', '2023-07-04 09:53:31', '2023-07-04 09:53:31');
INSERT INTO `sys_logs` VALUES (778, 'AITypeOfRecruitments', 'Xoá', 2, 'Đối tượng tuyển sinh / ưu tiên: Thiểu số', '2023-07-04 10:04:41', '2023-07-04 10:04:41');
INSERT INTO `sys_logs` VALUES (779, 'AITypeOfCourses', 'Xoá', 2, 'Khóa học: test2', '2023-07-04 10:12:50', '2023-07-04 10:12:50');
INSERT INTO `sys_logs` VALUES (780, 'Đăng nhập', 'Đăng nhập', 1, '', '2023-07-04 14:52:53', '2023-07-04 14:52:53');
INSERT INTO `sys_logs` VALUES (781, 'Đăng nhập', 'Đăng nhập', 2, '', '2023-07-04 14:55:17', '2023-07-04 14:55:17');
INSERT INTO `sys_logs` VALUES (782, 'Đăng nhập', 'Đăng nhập', 1, '', '2023-07-04 21:28:48', '2023-07-04 21:28:48');
INSERT INTO `sys_logs` VALUES (783, 'Đăng nhập', 'Đăng nhập', 2, '', '2023-07-04 21:30:15', '2023-07-04 21:30:15');
INSERT INTO `sys_logs` VALUES (784, 'Đăng nhập', 'Đăng nhập', 1, '', '2023-07-04 21:51:00', '2023-07-04 21:51:00');
INSERT INTO `sys_logs` VALUES (785, 'Phân quyền module', 'Sửa đổi', 1, 'Phân quyền tài khoản: admin_ttgdnncth', '2023-07-04 21:51:14', '2023-07-04 21:51:14');
INSERT INTO `sys_logs` VALUES (786, 'AITypeOfRecruitmentForms', 'Sửa', 2, 'Hình thức tuyển sinh: test22332', '2023-07-04 22:02:43', '2023-07-04 22:02:43');
INSERT INTO `sys_logs` VALUES (787, 'AITypeOfRecruitmentForms', 'Thêm', 2, 'Hình thức tuyển sinh: qweqwe', '2023-07-04 22:03:39', '2023-07-04 22:03:39');
INSERT INTO `sys_logs` VALUES (788, 'Phân quyền module', 'Sửa đổi', 1, 'Phân quyền tài khoản: admin_ttgdnncth', '2023-07-04 22:06:47', '2023-07-04 22:06:47');
INSERT INTO `sys_logs` VALUES (789, 'AITypeOfTeachingLevels', 'Sửa', 2, 'Trình độ giảng dạy: weqewqqwe', '2023-07-04 22:21:38', '2023-07-04 22:21:38');
INSERT INTO `sys_logs` VALUES (790, 'Phân quyền module', 'Sửa đổi', 1, 'Phân quyền tài khoản: admin_ttgdnncth', '2023-07-04 22:26:21', '2023-07-04 22:26:21');
INSERT INTO `sys_logs` VALUES (791, 'Đăng nhập', 'Đăng nhập', 1, '', '2023-07-05 09:56:54', '2023-07-05 09:56:54');
INSERT INTO `sys_logs` VALUES (792, 'Phân quyền module', 'Sửa đổi', 1, 'Phân quyền tài khoản: admin_ttgdnncth', '2023-07-05 09:57:15', '2023-07-05 09:57:15');
INSERT INTO `sys_logs` VALUES (793, 'AITypeOfOfficerTitles', 'Sửa', 2, 'Chức vụ cán bộ: Hiệu trưởng', '2023-07-05 10:02:47', '2023-07-05 10:02:47');
INSERT INTO `sys_logs` VALUES (794, 'Phân quyền module', 'Sửa đổi', 1, 'Phân quyền tài khoản: admin_ttgdnncth', '2023-07-05 10:06:14', '2023-07-05 10:06:14');
INSERT INTO `sys_logs` VALUES (795, 'AITypeOfSemesters', 'Sửa', 2, 'Học kỳ: Học kỳ 1', '2023-07-05 10:10:27', '2023-07-05 10:10:27');
INSERT INTO `sys_logs` VALUES (796, 'Phân quyền module', 'Sửa đổi', 1, 'Phân quyền tài khoản: admin_ttgdnncth', '2023-07-05 10:13:19', '2023-07-05 10:13:19');
INSERT INTO `sys_logs` VALUES (797, 'AITypeOfTrainingLevels', 'Thêm', 2, 'Bậc đào tạo: bậc 1', '2023-07-05 10:54:55', '2023-07-05 10:54:55');
INSERT INTO `sys_logs` VALUES (798, 'Phân quyền module', 'Sửa đổi', 1, 'Phân quyền tài khoản: admin_ttgdnncth', '2023-07-05 11:07:31', '2023-07-05 11:07:31');
INSERT INTO `sys_logs` VALUES (799, 'Đăng nhập', 'Đăng nhập', 1, '', '2023-07-05 14:59:34', '2023-07-05 14:59:34');
INSERT INTO `sys_logs` VALUES (800, 'Đăng nhập', 'Đăng nhập', 2, '', '2023-07-05 14:59:48', '2023-07-05 14:59:48');
INSERT INTO `sys_logs` VALUES (801, 'AITypeOfEthnics', 'Sửa', 2, 'Dân tộc: Kinh', '2023-07-05 15:49:04', '2023-07-05 15:49:04');
INSERT INTO `sys_logs` VALUES (802, 'AITypeOfEthnics', 'Sửa', 2, 'Dân tộc: Tày', '2023-07-05 16:18:55', '2023-07-05 16:18:55');
INSERT INTO `sys_logs` VALUES (803, 'AITypeOfEthnics', 'Thêm', 2, 'Dân tộc: Thái', '2023-07-05 16:19:00', '2023-07-05 16:19:00');
INSERT INTO `sys_logs` VALUES (804, 'AITypeOfEthnics', 'Thêm', 2, 'Dân tộc: Hoa', '2023-07-05 16:19:05', '2023-07-05 16:19:05');
INSERT INTO `sys_logs` VALUES (805, 'AITypeOfEthnics', 'Thêm', 2, 'Dân tộc: Khơ-me', '2023-07-05 16:19:10', '2023-07-05 16:19:10');
INSERT INTO `sys_logs` VALUES (806, 'AITypeOfEthnics', 'Thêm', 2, 'Dân tộc: Mường', '2023-07-05 16:19:16', '2023-07-05 16:19:16');
INSERT INTO `sys_logs` VALUES (807, 'AITypeOfEthnics', 'Thêm', 2, 'Dân tộc: Nùng', '2023-07-05 16:19:26', '2023-07-05 16:19:26');
INSERT INTO `sys_logs` VALUES (808, 'AITypeOfEthnics', 'Thêm', 2, 'Dân tộc: HMông', '2023-07-05 16:19:36', '2023-07-05 16:19:36');
INSERT INTO `sys_logs` VALUES (809, 'AITypeOfEthnics', 'Thêm', 2, 'Dân tộc: Dao', '2023-07-05 16:19:41', '2023-07-05 16:19:41');
INSERT INTO `sys_logs` VALUES (810, 'AITypeOfEthnics', 'Thêm', 2, 'Dân tộc: Gia-rai', '2023-07-05 16:19:46', '2023-07-05 16:19:46');
INSERT INTO `sys_logs` VALUES (811, 'AITypeOfEthnics', 'Thêm', 2, 'Dân tộc: Ngái', '2023-07-05 16:20:04', '2023-07-05 16:20:04');
INSERT INTO `sys_logs` VALUES (812, 'AITypeOfEthnics', 'Thêm', 2, 'Dân tộc: Ê-đê', '2023-07-05 16:20:07', '2023-07-05 16:20:07');
INSERT INTO `sys_logs` VALUES (813, 'AITypeOfEthnics', 'Thêm', 2, 'Dân tộc: Ba na', '2023-07-05 16:20:11', '2023-07-05 16:20:11');
INSERT INTO `sys_logs` VALUES (814, 'AITypeOfEthnics', 'Thêm', 2, 'Dân tộc: Xơ-Đăng', '2023-07-05 16:20:14', '2023-07-05 16:20:14');
INSERT INTO `sys_logs` VALUES (815, 'AITypeOfEthnics', 'Thêm', 2, 'Dân tộc: Sán Chay', '2023-07-05 16:20:18', '2023-07-05 16:20:18');
INSERT INTO `sys_logs` VALUES (816, 'AITypeOfEthnics', 'Thêm', 2, 'Dân tộc: Cơ-ho', '2023-07-05 16:20:46', '2023-07-05 16:20:46');
INSERT INTO `sys_logs` VALUES (817, 'AITypeOfEthnics', 'Thêm', 2, 'Dân tộc: Chăm', '2023-07-05 16:20:49', '2023-07-05 16:20:49');
INSERT INTO `sys_logs` VALUES (818, 'AITypeOfEthnics', 'Thêm', 2, 'Dân tộc: Sán Dìu', '2023-07-05 16:20:51', '2023-07-05 16:20:51');
INSERT INTO `sys_logs` VALUES (819, 'AITypeOfEthnics', 'Thêm', 2, 'Dân tộc: Hrê', '2023-07-05 16:20:55', '2023-07-05 16:20:55');
INSERT INTO `sys_logs` VALUES (820, 'AITypeOfEthnics', 'Thêm', 2, 'Dân tộc: Mnông', '2023-07-05 16:20:58', '2023-07-05 16:20:58');
INSERT INTO `sys_logs` VALUES (821, 'AITypeOfEthnics', 'Thêm', 2, 'Dân tộc: Ra-glai', '2023-07-05 16:21:02', '2023-07-05 16:21:02');
INSERT INTO `sys_logs` VALUES (822, 'AITypeOfEthnics', 'Thêm', 2, 'Dân tộc: Xtiêng', '2023-07-05 16:21:06', '2023-07-05 16:21:06');
INSERT INTO `sys_logs` VALUES (823, 'AITypeOfEthnics', 'Thêm', 2, 'Dân tộc: Bru-Vân Kiều', '2023-07-05 16:21:13', '2023-07-05 16:21:13');
INSERT INTO `sys_logs` VALUES (824, 'AITypeOfEthnics', 'Thêm', 2, 'Dân tộc: Thổ', '2023-07-05 16:21:17', '2023-07-05 16:21:17');
INSERT INTO `sys_logs` VALUES (825, 'AITypeOfEthnics', 'Thêm', 2, 'Dân tộc: Giáy', '2023-07-05 16:21:20', '2023-07-05 16:21:20');
INSERT INTO `sys_logs` VALUES (826, 'AITypeOfEthnics', 'Thêm', 2, 'Dân tộc: Cơ-tu', '2023-07-05 16:21:23', '2023-07-05 16:21:23');
INSERT INTO `sys_logs` VALUES (827, 'AITypeOfEthnics', 'Thêm', 2, 'Dân tộc: Gié Triêng', '2023-07-05 16:21:26', '2023-07-05 16:21:26');
INSERT INTO `sys_logs` VALUES (828, 'AITypeOfEthnics', 'Thêm', 2, 'Dân tộc: Mạ', '2023-07-05 16:21:30', '2023-07-05 16:21:30');
INSERT INTO `sys_logs` VALUES (829, 'AITypeOfEthnics', 'Thêm', 2, 'Dân tộc: Khơ-mú', '2023-07-05 16:21:33', '2023-07-05 16:21:33');
INSERT INTO `sys_logs` VALUES (830, 'AITypeOfEthnics', 'Thêm', 2, 'Dân tộc: Co', '2023-07-05 16:21:36', '2023-07-05 16:21:36');
INSERT INTO `sys_logs` VALUES (831, 'AITypeOfEthnics', 'Thêm', 2, 'Dân tộc: Tà-ôi', '2023-07-05 16:21:39', '2023-07-05 16:21:39');
INSERT INTO `sys_logs` VALUES (832, 'AITypeOfEthnics', 'Thêm', 2, 'Dân tộc: Chơ-ro', '2023-07-05 16:21:43', '2023-07-05 16:21:43');
INSERT INTO `sys_logs` VALUES (833, 'AITypeOfEthnics', 'Thêm', 2, 'Dân tộc: Kháng', '2023-07-05 16:21:46', '2023-07-05 16:21:46');
INSERT INTO `sys_logs` VALUES (834, 'AITypeOfEthnics', 'Thêm', 2, 'Dân tộc: Xinh-mun', '2023-07-05 16:21:50', '2023-07-05 16:21:50');
INSERT INTO `sys_logs` VALUES (835, 'AITypeOfEthnics', 'Thêm', 2, 'Dân tộc: Hà Nhì', '2023-07-05 16:21:53', '2023-07-05 16:21:53');
INSERT INTO `sys_logs` VALUES (836, 'AITypeOfEthnics', 'Thêm', 2, 'Dân tộc: Chu ru', '2023-07-05 16:21:56', '2023-07-05 16:21:56');
INSERT INTO `sys_logs` VALUES (837, 'AITypeOfEthnics', 'Thêm', 2, 'Dân tộc: Lào', '2023-07-05 16:22:00', '2023-07-05 16:22:00');
INSERT INTO `sys_logs` VALUES (838, 'AITypeOfEthnics', 'Thêm', 2, 'Dân tộc: La Chí', '2023-07-05 16:22:04', '2023-07-05 16:22:04');
INSERT INTO `sys_logs` VALUES (839, 'AITypeOfEthnics', 'Thêm', 2, 'Dân tộc: La Ha', '2023-07-05 16:22:08', '2023-07-05 16:22:08');
INSERT INTO `sys_logs` VALUES (840, 'AITypeOfEthnics', 'Thêm', 2, 'Dân tộc: Phù Lá', '2023-07-05 16:22:54', '2023-07-05 16:22:54');
INSERT INTO `sys_logs` VALUES (841, 'AITypeOfEthnics', 'Thêm', 2, 'Dân tộc: La Hủ', '2023-07-05 16:22:58', '2023-07-05 16:22:58');
INSERT INTO `sys_logs` VALUES (842, 'AITypeOfEthnics', 'Thêm', 2, 'Dân tộc: Lự', '2023-07-05 16:23:02', '2023-07-05 16:23:02');
INSERT INTO `sys_logs` VALUES (843, 'AITypeOfEthnics', 'Thêm', 2, 'Dân tộc: Lô Lô', '2023-07-05 16:23:05', '2023-07-05 16:23:05');
INSERT INTO `sys_logs` VALUES (844, 'AITypeOfEthnics', 'Thêm', 2, 'Dân tộc: Chứt', '2023-07-05 16:23:09', '2023-07-05 16:23:09');
INSERT INTO `sys_logs` VALUES (845, 'AITypeOfEthnics', 'Thêm', 2, 'Dân tộc: Mảng', '2023-07-05 16:23:12', '2023-07-05 16:23:12');
INSERT INTO `sys_logs` VALUES (846, 'AITypeOfEthnics', 'Thêm', 2, 'Dân tộc: Pà Thẻn', '2023-07-05 16:23:16', '2023-07-05 16:23:16');
INSERT INTO `sys_logs` VALUES (847, 'AITypeOfEthnics', 'Thêm', 2, 'Dân tộc: Co Lao', '2023-07-05 16:23:20', '2023-07-05 16:23:20');
INSERT INTO `sys_logs` VALUES (848, 'AITypeOfEthnics', 'Thêm', 2, 'Dân tộc: Cống', '2023-07-05 16:25:12', '2023-07-05 16:25:12');
INSERT INTO `sys_logs` VALUES (849, 'AITypeOfEthnics', 'Thêm', 2, 'Dân tộc: Bố Y', '2023-07-05 16:25:16', '2023-07-05 16:25:16');
INSERT INTO `sys_logs` VALUES (850, 'AITypeOfEthnics', 'Thêm', 2, 'Dân tộc: Si La', '2023-07-05 16:25:21', '2023-07-05 16:25:21');
INSERT INTO `sys_logs` VALUES (851, 'AITypeOfEthnics', 'Thêm', 2, 'Dân tộc: Pu Péo', '2023-07-05 16:25:25', '2023-07-05 16:25:25');
INSERT INTO `sys_logs` VALUES (852, 'AITypeOfEthnics', 'Thêm', 2, 'Dân tộc: Brâu', '2023-07-05 16:25:28', '2023-07-05 16:25:28');
INSERT INTO `sys_logs` VALUES (853, 'AITypeOfEthnics', 'Thêm', 2, 'Dân tộc: Ơ Đu', '2023-07-05 16:25:32', '2023-07-05 16:25:32');
INSERT INTO `sys_logs` VALUES (854, 'AITypeOfEthnics', 'Thêm', 2, 'Dân tộc: Rơ măm', '2023-07-05 16:25:36', '2023-07-05 16:25:36');
INSERT INTO `sys_logs` VALUES (855, 'AITypeOfFamilyMembers', 'Sửa', 2, 'Thành phần gia đình: ---', '2023-07-05 16:26:12', '2023-07-05 16:26:12');
INSERT INTO `sys_logs` VALUES (856, 'AITypeOfFamilyMembers', 'Sửa', 2, 'Thành phần gia đình: Cán bộ', '2023-07-05 16:26:21', '2023-07-05 16:26:21');
INSERT INTO `sys_logs` VALUES (857, 'AITypeOfFamilyMembers', 'Thêm', 2, 'Thành phần gia đình: Công chức (Chế độ cũ)', '2023-07-05 16:26:30', '2023-07-05 16:26:30');
INSERT INTO `sys_logs` VALUES (858, 'AITypeOfFamilyMembers', 'Thêm', 2, 'Thành phần gia đình: Công chức NN', '2023-07-05 16:26:37', '2023-07-05 16:26:37');
INSERT INTO `sys_logs` VALUES (859, 'AITypeOfFamilyMembers', 'Thêm', 2, 'Thành phần gia đình: Công nhân', '2023-07-05 16:26:42', '2023-07-05 16:26:42');
INSERT INTO `sys_logs` VALUES (860, 'AITypeOfFamilyMembers', 'Thêm', 2, 'Thành phần gia đình: Dân nghèo thành thị', '2023-07-05 16:26:57', '2023-07-05 16:26:57');
INSERT INTO `sys_logs` VALUES (861, 'AITypeOfFamilyMembers', 'Thêm', 2, 'Thành phần gia đình: Nông dân', '2023-07-05 16:27:06', '2023-07-05 16:27:06');
INSERT INTO `sys_logs` VALUES (862, 'AITypeOfFamilyMembers', 'Thêm', 2, 'Thành phần gia đình: Quân nhân (Chế độ cũ)', '2023-07-05 16:27:15', '2023-07-05 16:27:15');
INSERT INTO `sys_logs` VALUES (863, 'AITypeOfFamilyMembers', 'Thêm', 2, 'Thành phần gia đình: Quân nhân', '2023-07-05 16:27:21', '2023-07-05 16:27:21');
INSERT INTO `sys_logs` VALUES (864, 'AITypeOfFamilyMembers', 'Thêm', 2, 'Thành phần gia đình: Thợ thủ công', '2023-07-05 16:27:35', '2023-07-05 16:27:35');
INSERT INTO `sys_logs` VALUES (865, 'AITypeOfFamilyMembers', 'Thêm', 2, 'Thành phần gia đình: Tiểu chủ', '2023-07-05 16:27:44', '2023-07-05 16:27:44');
INSERT INTO `sys_logs` VALUES (866, 'AITypeOfFamilyMembers', 'Thêm', 2, 'Thành phần gia đình: Tiểu thương', '2023-07-05 16:27:49', '2023-07-05 16:27:49');
INSERT INTO `sys_logs` VALUES (867, 'AITypeOfFamilyMembers', 'Thêm', 2, 'Thành phần gia đình: Tiểu tư sản', '2023-07-05 16:27:53', '2023-07-05 16:27:53');
INSERT INTO `sys_logs` VALUES (868, 'AITypeOfFamilyMembers', 'Thêm', 2, 'Thành phần gia đình: Tư sản', '2023-07-05 16:28:01', '2023-07-05 16:28:01');
INSERT INTO `sys_logs` VALUES (869, 'AITypeOfFamilyMembers', 'Thêm', 2, 'Thành phần gia đình: Viên chức', '2023-07-05 16:28:04', '2023-07-05 16:28:04');
INSERT INTO `sys_logs` VALUES (870, 'AITypeOfReligions', 'Sửa', 2, 'Tôn giáo: Không', '2023-07-05 16:30:53', '2023-07-05 16:30:53');
INSERT INTO `sys_logs` VALUES (871, 'AITypeOfReligions', 'Thêm', 2, 'Tôn giáo: Phật giáo', '2023-07-05 16:31:00', '2023-07-05 16:31:00');
INSERT INTO `sys_logs` VALUES (872, 'AITypeOfReligions', 'Thêm', 2, 'Tôn giáo: Công giáo', '2023-07-05 16:31:04', '2023-07-05 16:31:04');
INSERT INTO `sys_logs` VALUES (873, 'AITypeOfReligions', 'Thêm', 2, 'Tôn giáo: Cao đài', '2023-07-05 16:31:08', '2023-07-05 16:31:08');
INSERT INTO `sys_logs` VALUES (874, 'AITypeOfReligions', 'Thêm', 2, 'Tôn giáo: Hòa hảo', '2023-07-05 16:31:12', '2023-07-05 16:31:12');
INSERT INTO `sys_logs` VALUES (875, 'AITypeOfReligions', 'Thêm', 2, 'Tôn giáo: Tin lành', '2023-07-05 16:31:26', '2023-07-05 16:31:26');
INSERT INTO `sys_logs` VALUES (876, 'AITypeOfReligions', 'Thêm', 2, 'Tôn giáo: Hồi giáo', '2023-07-05 16:31:30', '2023-07-05 16:31:30');
INSERT INTO `sys_logs` VALUES (877, 'AITypeOfReligions', 'Thêm', 2, 'Tôn giáo: Bà la môn', '2023-07-05 16:31:34', '2023-07-05 16:31:34');
INSERT INTO `sys_logs` VALUES (878, 'AITypeOfReligions', 'Thêm', 2, 'Tôn giáo: Bà Ni', '2023-07-05 16:31:45', '2023-07-05 16:31:45');
INSERT INTO `sys_logs` VALUES (879, 'AITypeOfReligions', 'Thêm', 2, 'Tôn giáo: Minh Sư Đạo', '2023-07-05 16:31:50', '2023-07-05 16:31:50');
INSERT INTO `sys_logs` VALUES (880, 'AITypeOfReligions', 'Thêm', 2, 'Tôn giáo: Minh Lý đạo', '2023-07-05 16:32:01', '2023-07-05 16:32:01');
INSERT INTO `sys_logs` VALUES (881, 'AITypeOfReligions', 'Thêm', 2, 'Tôn giáo: Tịnh độ cư sĩ Phật hồi Việt Nam', '2023-07-05 16:32:11', '2023-07-05 16:32:11');
INSERT INTO `sys_logs` VALUES (882, 'AITypeOfReligions', 'Thêm', 2, 'Tôn giáo: Đạo tứ ấn hiếu nghĩa', '2023-07-05 16:32:22', '2023-07-05 16:32:22');
INSERT INTO `sys_logs` VALUES (883, 'AITypeOfReligions', 'Thêm', 2, 'Tôn giáo: Bửu sơn Kỳ hương', '2023-07-05 16:32:33', '2023-07-05 16:32:33');
INSERT INTO `sys_logs` VALUES (884, 'AITypeOfReligions', 'Thêm', 2, 'Tôn giáo: Ba Ha\'i', '2023-07-05 16:32:43', '2023-07-05 16:32:43');
INSERT INTO `sys_logs` VALUES (885, 'AITypeOfReligions', 'Thêm', 2, 'Tôn giáo: Tôn giáo khác', '2023-07-05 16:32:49', '2023-07-05 16:32:49');
INSERT INTO `sys_logs` VALUES (886, 'AITypeOfReligions', 'Sửa', 2, 'Tôn giáo: Minh Sư dạo', '2023-07-05 16:32:55', '2023-07-05 16:32:55');
INSERT INTO `sys_logs` VALUES (887, 'AITypeOfReligions', 'Sửa', 2, 'Tôn giáo: Minh Sư đạo', '2023-07-05 16:32:59', '2023-07-05 16:32:59');
INSERT INTO `sys_logs` VALUES (888, 'AITypeOfReligions', 'Sửa', 2, 'Tôn giáo: Bà La môn1', '2023-07-05 16:33:07', '2023-07-05 16:33:07');
INSERT INTO `sys_logs` VALUES (889, 'AITypeOfReligions', 'Sửa', 2, 'Tôn giáo: Bà La môn', '2023-07-05 16:33:10', '2023-07-05 16:33:10');
INSERT INTO `sys_logs` VALUES (890, 'Đăng nhập', 'Đăng nhập', 1, '', '2023-07-06 09:55:26', '2023-07-06 09:55:26');
INSERT INTO `sys_logs` VALUES (891, 'Đăng nhập', 'Đăng nhập', 1, '', '2023-07-06 09:55:31', '2023-07-06 09:55:31');
INSERT INTO `sys_logs` VALUES (892, 'Đăng nhập', 'Đăng nhập', 2, '', '2023-07-06 09:55:43', '2023-07-06 09:55:43');
INSERT INTO `sys_logs` VALUES (893, 'Đăng nhập', 'Đăng nhập', 2, '', '2023-07-06 14:11:32', '2023-07-06 14:11:32');
INSERT INTO `sys_logs` VALUES (894, 'AIOfficerInformations', 'Xoá', 2, 'Thông tin cán bộ, giáo viên: test2', '2023-07-06 16:12:14', '2023-07-06 16:12:14');
INSERT INTO `sys_logs` VALUES (895, 'AIOfficerInformations', 'Xoá', 2, 'Thông tin cán bộ, giáo viên: test3', '2023-07-06 16:12:16', '2023-07-06 16:12:16');
INSERT INTO `sys_logs` VALUES (896, 'AIOfficerInformations', 'Thêm', 2, 'Thông tin cán bộ, giáo viên: Họ và tên *', '2023-07-06 16:13:07', '2023-07-06 16:13:07');
INSERT INTO `sys_logs` VALUES (897, 'AITypeOfTeachingLevels', 'Xoá', 2, 'Trình độ giảng dạy: weqewqqwe', '2023-07-06 16:39:16', '2023-07-06 16:39:16');
INSERT INTO `sys_logs` VALUES (898, 'AITypeOfTeachingLevels', 'Xoá', 2, 'Trình độ giảng dạy: test3', '2023-07-06 16:39:20', '2023-07-06 16:39:20');
INSERT INTO `sys_logs` VALUES (899, 'AITypeOfTeachingLevels', 'Thêm', 2, 'Trình độ giảng dạy: Chưa qua đào tạo', '2023-07-06 16:40:02', '2023-07-06 16:40:02');
INSERT INTO `sys_logs` VALUES (900, 'AITypeOfTeachingLevels', 'Thêm', 2, 'Trình độ giảng dạy: Dưới trung cấp', '2023-07-06 16:40:15', '2023-07-06 16:40:15');
INSERT INTO `sys_logs` VALUES (901, 'AITypeOfTeachingLevels', 'Thêm', 2, 'Trình độ giảng dạy: Cao đẳng', '2023-07-06 16:40:23', '2023-07-06 16:40:23');
INSERT INTO `sys_logs` VALUES (902, 'AITypeOfTeachingLevels', 'Thêm', 2, 'Trình độ giảng dạy: Đại học', '2023-07-06 16:40:26', '2023-07-06 16:40:26');
INSERT INTO `sys_logs` VALUES (903, 'AITypeOfTeachingLevels', 'Thêm', 2, 'Trình độ giảng dạy: Sau đại học', '2023-07-06 16:40:31', '2023-07-06 16:40:31');
INSERT INTO `sys_logs` VALUES (904, 'AITypeOfTeachingLevels', 'Thêm', 2, 'Trình độ giảng dạy: Thạc sĩ', '2023-07-06 16:40:47', '2023-07-06 16:40:47');
INSERT INTO `sys_logs` VALUES (905, 'AITypeOfTeachingLevels', 'Thêm', 2, 'Trình độ giảng dạy: Tiến sĩ', '2023-07-06 16:40:51', '2023-07-06 16:40:51');
INSERT INTO `sys_logs` VALUES (906, 'AITypeOfTeachingLevels', 'Thêm', 2, 'Trình độ giảng dạy: Trung cấp', '2023-07-06 16:40:54', '2023-07-06 16:40:54');
INSERT INTO `sys_logs` VALUES (907, 'Đăng nhập', 'Đăng nhập', 2, '', '2023-07-07 08:29:58', '2023-07-07 08:29:58');
INSERT INTO `sys_logs` VALUES (908, 'AIOfficerInformations', 'Sửa', 2, 'Thông tin cán bộ, giáo viên: Họ và tên *', '2023-07-07 09:55:35', '2023-07-07 09:55:35');
INSERT INTO `sys_logs` VALUES (909, 'AIOfficerInformations', 'Sửa', 2, 'Thông tin cán bộ, giáo viên: Họ và tên *', '2023-07-07 09:55:45', '2023-07-07 09:55:45');
INSERT INTO `sys_logs` VALUES (910, 'AIOfficerInformations', 'Sửa', 2, 'Thông tin cán bộ, giáo viên: Họ và tên *', '2023-07-07 09:56:06', '2023-07-07 09:56:06');
INSERT INTO `sys_logs` VALUES (911, 'Đăng nhập', 'Đăng nhập', 2, '', '2023-07-07 15:04:33', '2023-07-07 15:04:33');
INSERT INTO `sys_logs` VALUES (912, 'Đăng nhập', 'Đăng nhập', 2, '', '2023-07-10 09:13:55', '2023-07-10 09:13:55');
INSERT INTO `sys_logs` VALUES (913, 'AIManageStudents', 'Thêm', 2, 'Thông tin cán bộ, giáo viên: Thạch Minh Cường', '2023-07-10 10:06:00', '2023-07-10 10:06:00');
INSERT INTO `sys_logs` VALUES (914, 'AIManageStudents', 'Thêm', 2, 'Thông tin học viên: Thạch Minh Cường', '2023-07-10 10:31:10', '2023-07-10 10:31:10');
INSERT INTO `sys_logs` VALUES (915, 'AIManageStudents', 'Sửa', 2, 'Thông tin học viên: Thạch Minh Cường', '2023-07-10 10:46:20', '2023-07-10 10:46:20');
INSERT INTO `sys_logs` VALUES (916, 'AIManageStudents', 'Sửa', 2, 'Thông tin học viên: Thạch Minh Cường', '2023-07-10 10:46:42', '2023-07-10 10:46:42');
INSERT INTO `sys_logs` VALUES (917, 'AIManageStudents', 'Sửa', 2, 'Thông tin học viên: Thạch Minh Cường', '2023-07-10 10:49:40', '2023-07-10 10:49:40');
INSERT INTO `sys_logs` VALUES (918, 'AIManageStudents', 'Sửa', 2, 'Thông tin học viên: Thạch Minh Cường', '2023-07-10 10:50:02', '2023-07-10 10:50:02');
INSERT INTO `sys_logs` VALUES (919, 'AIManageStudents', 'Sửa', 2, 'Thông tin học viên: Thạch Minh Cường', '2023-07-10 10:50:19', '2023-07-10 10:50:19');
INSERT INTO `sys_logs` VALUES (920, 'Đăng nhập', 'Đăng nhập', 2, '', '2023-07-10 15:23:59', '2023-07-10 15:23:59');
INSERT INTO `sys_logs` VALUES (921, 'AIManageStudents', 'Sửa', 2, 'Thông tin học viên: Thạch Minh Cường', '2023-07-10 16:20:55', '2023-07-10 16:20:55');
INSERT INTO `sys_logs` VALUES (922, 'AIManageStudents', 'Sửa', 2, 'Thông tin học viên: Thạch Minh Cường', '2023-07-10 16:45:31', '2023-07-10 16:45:31');
INSERT INTO `sys_logs` VALUES (923, 'Đăng nhập', 'Đăng nhập', 1, '', '2023-07-11 08:10:43', '2023-07-11 08:10:43');
INSERT INTO `sys_logs` VALUES (924, 'Đăng nhập', 'Đăng nhập', 1, '', '2023-07-11 09:22:27', '2023-07-11 09:22:27');
INSERT INTO `sys_logs` VALUES (925, 'Đăng nhập', 'Đăng nhập', 1, '', '2023-07-20 10:43:22', '2023-07-20 10:43:22');
INSERT INTO `sys_logs` VALUES (926, 'Đăng nhập', 'Đăng nhập', 1, '', '2023-07-20 14:45:39', '2023-07-20 14:45:39');
INSERT INTO `sys_logs` VALUES (927, 'AIOfficerInformations', 'Sửa', 1, 'Thông tin cán bộ, giáo viên: Thái Đình Cẩn', '2023-07-20 15:42:06', '2023-07-20 15:42:06');
INSERT INTO `sys_logs` VALUES (928, 'Đăng nhập', 'Đăng nhập', 1, '', '2023-07-21 15:27:24', '2023-07-21 15:27:24');
INSERT INTO `sys_logs` VALUES (929, 'Đăng nhập', 'Đăng nhập', 2, '', '2023-07-21 15:41:18', '2023-07-21 15:41:18');
INSERT INTO `sys_logs` VALUES (930, 'Đăng nhập', 'Đăng nhập', 1, '', '2023-07-21 15:41:27', '2023-07-21 15:41:27');
INSERT INTO `sys_logs` VALUES (931, 'Phân quyền module', 'Sửa đổi', 1, 'Phân quyền tài khoản: admin_ttgdnncth', '2023-07-21 15:41:48', '2023-07-21 15:41:48');
INSERT INTO `sys_logs` VALUES (932, 'Đăng nhập', 'Đăng nhập', 2, '', '2023-07-21 15:41:55', '2023-07-21 15:41:55');
INSERT INTO `sys_logs` VALUES (933, 'AIOfficerInformations', 'Sửa', 2, 'Thông tin cán bộ, giáo viên: Thái Đình Cẩn', '2023-07-21 15:42:48', '2023-07-21 15:42:48');
INSERT INTO `sys_logs` VALUES (934, 'Đăng nhập', 'Đăng nhập', 1, '', '2023-07-22 20:09:41', '2023-07-22 20:09:41');
INSERT INTO `sys_logs` VALUES (935, 'Đăng nhập', 'Đăng nhập', 2, '', '2023-07-22 23:37:51', '2023-07-22 23:37:51');
INSERT INTO `sys_logs` VALUES (936, 'AITypeOfEthnics', 'Sửa', 2, 'Dân tộc: Kinh', '2023-07-22 23:50:09', '2023-07-22 23:50:09');
INSERT INTO `sys_logs` VALUES (937, 'Đăng nhập', 'Đăng nhập', 1, '', '2023-07-23 10:47:51', '2023-07-23 10:47:51');
INSERT INTO `sys_logs` VALUES (938, 'Đăng nhập', 'Đăng nhập', 2, '', '2023-07-23 11:01:30', '2023-07-23 11:01:30');
INSERT INTO `sys_logs` VALUES (939, 'AIOfficerWorkProcess', 'Thêm', 2, 'Quá trình công tác: esttscủa người dùng Thái Đình Cẩn', '2023-07-23 14:36:25', '2023-07-23 14:36:25');
INSERT INTO `sys_logs` VALUES (940, 'AIOfficerWorkProcess', 'Thêm', 2, 'Quá trình công tác: testqwecủa người dùng Thái Đình Cẩn', '2023-07-23 14:51:55', '2023-07-23 14:51:55');
INSERT INTO `sys_logs` VALUES (941, 'AIOfficerWorkProcess', 'Sửa', 2, 'Quả trình công tác: Thái Đình Cẩn', '2023-07-23 15:37:06', '2023-07-23 15:37:06');
INSERT INTO `sys_logs` VALUES (942, 'AIOfficerWorkProcess', 'Xoá', 2, 'Quá trình công tác: ', '2023-07-23 16:45:55', '2023-07-23 16:45:55');
INSERT INTO `sys_logs` VALUES (943, 'AIOfficerWorkProcess', 'Xoá', 2, 'Quá trình công tác: ', '2023-07-23 16:47:00', '2023-07-23 16:47:00');
INSERT INTO `sys_logs` VALUES (944, 'AIOfficerWorkProcess', 'Xoá', 2, 'Quá trình công tác: ', '2023-07-23 16:47:02', '2023-07-23 16:47:02');
INSERT INTO `sys_logs` VALUES (945, 'AIOfficerWorkProcess', 'Xoá', 2, 'Quá trình công tác: ', '2023-07-23 16:49:08', '2023-07-23 16:49:08');
INSERT INTO `sys_logs` VALUES (946, 'AIOfficerWorkProcess', 'Xoá', 2, 'Quá trình công tác: ', '2023-07-23 17:03:42', '2023-07-23 17:03:42');
INSERT INTO `sys_logs` VALUES (947, 'AIOfficerWorkProcess', 'Xoá', 2, 'Quá trình công tác: ', '2023-07-23 17:03:42', '2023-07-23 17:03:42');
INSERT INTO `sys_logs` VALUES (948, 'AIOfficerWorkProcess', 'Thêm', 2, 'Quá trình công tác: Giáo viêncủa người dùng Thái Đình Cẩn', '2023-07-23 17:58:57', '2023-07-23 17:58:57');
INSERT INTO `sys_logs` VALUES (949, 'AIOfficerWorkProcess', 'Thêm', 2, 'Quá trình công tác: Hiệu trưởngcủa người dùng Thái Đình Cẩn', '2023-07-23 18:15:55', '2023-07-23 18:15:55');
INSERT INTO `sys_logs` VALUES (950, 'AITypeOfTrainingForms', 'Sửa', 2, 'Hình thức đào tạo: Chính quy', '2023-07-23 18:29:38', '2023-07-23 18:29:38');
INSERT INTO `sys_logs` VALUES (951, 'AITypeOfTrainingForms', 'Sửa', 2, 'Hình thức đào tạo: Tại chực', '2023-07-23 18:29:46', '2023-07-23 18:29:46');
INSERT INTO `sys_logs` VALUES (952, 'AITypeOfTrainingForms', 'Sửa', 2, 'Hình thức đào tạo: Tại chức', '2023-07-23 18:29:52', '2023-07-23 18:29:52');
INSERT INTO `sys_logs` VALUES (953, 'AITypeOfTrainingForms', 'Thêm', 2, 'Hình thức đào tạo: Mở rộng', '2023-07-23 18:29:56', '2023-07-23 18:29:56');
INSERT INTO `sys_logs` VALUES (954, 'AITypeOfTrainingForms', 'Thêm', 2, 'Hình thức đào tạo: Từ xa', '2023-07-23 18:30:03', '2023-07-23 18:30:03');
INSERT INTO `sys_logs` VALUES (955, 'AITypeOfTrainingForms', 'Thêm', 2, 'Hình thức đào tạo: Chuyên tu', '2023-07-23 18:30:07', '2023-07-23 18:30:07');
INSERT INTO `sys_logs` VALUES (956, 'AITypeOfTrainingForms', 'Thêm', 2, 'Hình thức đào tạo: Đặc cách', '2023-07-23 18:30:11', '2023-07-23 18:30:11');
INSERT INTO `sys_logs` VALUES (957, 'AITypeOfTrainingForms', 'Thêm', 2, 'Hình thức đào tạo: Tự học', '2023-07-23 18:30:19', '2023-07-23 18:30:19');
INSERT INTO `sys_logs` VALUES (958, 'AITypeOfTrainingForms', 'Thêm', 2, 'Hình thức đào tạo: Vừa học vừa làm', '2023-07-23 18:30:24', '2023-07-23 18:30:24');
INSERT INTO `sys_logs` VALUES (959, 'AITypeOfTrainingForms', 'Sửa', 2, 'Hình thức đào tạo: Vừa học - vừa làm', '2023-07-23 18:30:28', '2023-07-23 18:30:28');
INSERT INTO `sys_logs` VALUES (960, 'AITypeOfTrainingForms', 'Thêm', 2, 'Hình thức đào tạo: Bằng 2', '2023-07-23 18:30:34', '2023-07-23 18:30:34');
INSERT INTO `sys_logs` VALUES (961, 'AIOfficerProfessionalTrainingProcess', 'Sửa', 2, 'Quả trình công tác: Thái Đình Cẩn', '2023-07-23 21:12:02', '2023-07-23 21:12:02');
INSERT INTO `sys_logs` VALUES (962, 'AIOfficerProfessionalTrainingProcess', 'Sửa', 2, 'Quả trình đào tạo chuyên môn nghiệp vụ: Thái Đình Cẩn', '2023-07-23 21:12:55', '2023-07-23 21:12:55');
INSERT INTO `sys_logs` VALUES (963, 'AIOfficerProfessionalTrainingProcess', 'Sửa', 2, 'Quả trình đào tạo chuyên môn nghiệp vụ: Thái Đình Cẩn', '2023-07-23 21:13:01', '2023-07-23 21:13:01');
INSERT INTO `sys_logs` VALUES (964, 'AIOfficerProfessionalTrainingProcess', 'Sửa', 2, 'Quả trình đào tạo chuyên môn nghiệp vụ: Thái Đình Cẩn', '2023-07-23 21:13:53', '2023-07-23 21:13:53');
INSERT INTO `sys_logs` VALUES (965, 'AIOfficerProfessionalTrainingProcess', 'Sửa', 2, 'Quả trình đào tạo chuyên môn nghiệp vụ: Thái Đình Cẩn', '2023-07-23 21:14:37', '2023-07-23 21:14:37');
INSERT INTO `sys_logs` VALUES (966, 'Đăng nhập', 'Đăng nhập', 1, '', '2023-07-23 21:40:46', '2023-07-23 21:40:46');
INSERT INTO `sys_logs` VALUES (967, 'Phân quyền module', 'Sửa đổi', 1, 'Phân quyền tài khoản: admin_ttgdnncth', '2023-07-23 21:41:06', '2023-07-23 21:41:06');
INSERT INTO `sys_logs` VALUES (968, 'AITypeOfCourses', 'Sửa', 2, 'Khóa học: Khóa 1', '2023-07-23 22:30:38', '2023-07-23 22:30:38');
INSERT INTO `sys_logs` VALUES (969, 'AITypeOfCourses', 'Sửa', 2, 'Khóa học: Khóa 2', '2023-07-23 22:30:44', '2023-07-23 22:30:44');
INSERT INTO `sys_logs` VALUES (970, 'AITypeOfSemesters', 'Sửa', 2, 'Học kỳ: Học kỳ 2', '2023-07-23 22:31:06', '2023-07-23 22:31:06');
INSERT INTO `sys_logs` VALUES (971, 'AIOfficerAssessmentProcess', 'Sửa', 2, 'Quả trình đào tạo chuyên môn nghiệp vụ: Thái Đình Cẩn', '2023-07-23 23:27:28', '2023-07-23 23:27:28');
INSERT INTO `sys_logs` VALUES (972, 'AIOfficerAssessmentProcess', 'Sửa', 2, 'Quả trình đào tạo chuyên môn nghiệp vụ: Thái Đình Cẩn', '2023-07-23 23:35:36', '2023-07-23 23:35:36');
INSERT INTO `sys_logs` VALUES (973, 'AITypeOfDepartments', 'Thêm', 1, 'Khoa/phòng: Toán - Tin', '2023-07-24 08:58:46', '2023-07-24 08:58:46');
INSERT INTO `sys_logs` VALUES (974, 'AITypeOfDepartments', 'Sửa', 1, 'Khoa/phòng: Thái Đình Cẩn', '2023-07-24 09:05:05', '2023-07-24 09:05:05');
INSERT INTO `sys_logs` VALUES (975, 'AITypeOfOfficerTitles', 'Sửa', 1, 'Chức vụ cán bộ: Không có', '2023-07-24 09:07:05', '2023-07-24 09:07:05');
INSERT INTO `sys_logs` VALUES (976, 'AITypeOfOfficerTitles', 'Thêm', 1, 'Chức vụ cán bộ: Hiệu trưởng/Giám đốc', '2023-07-24 09:07:13', '2023-07-24 09:07:13');
INSERT INTO `sys_logs` VALUES (977, 'AITypeOfOfficerTitles', 'Thêm', 1, 'Chức vụ cán bộ: Phó hiệu trưởng/Phó giám đốc', '2023-07-24 09:07:19', '2023-07-24 09:07:19');
INSERT INTO `sys_logs` VALUES (978, 'AITypeOfOfficerTitles', 'Thêm', 1, 'Chức vụ cán bộ: Trưởng khoa', '2023-07-24 09:07:26', '2023-07-24 09:07:26');
INSERT INTO `sys_logs` VALUES (979, 'AITypeOfOfficerTitles', 'Thêm', 1, 'Chức vụ cán bộ: Phó trưởng khoa', '2023-07-24 09:07:34', '2023-07-24 09:07:34');
INSERT INTO `sys_logs` VALUES (980, 'AITypeOfOfficerTitles', 'Thêm', 1, 'Chức vụ cán bộ: Trưởng bộ môn', '2023-07-24 09:07:41', '2023-07-24 09:07:41');
INSERT INTO `sys_logs` VALUES (981, 'AITypeOfOfficerTitles', 'Thêm', 1, 'Chức vụ cán bộ: Phó trưởng bộ môn', '2023-07-24 09:07:48', '2023-07-24 09:07:48');
INSERT INTO `sys_logs` VALUES (982, 'AITypeOfOfficerTitles', 'Thêm', 1, 'Chức vụ cán bộ: Trưởng phòng', '2023-07-24 09:07:53', '2023-07-24 09:07:53');
INSERT INTO `sys_logs` VALUES (983, 'AITypeOfOfficerTitles', 'Thêm', 1, 'Chức vụ cán bộ: Phó trưởng phòng', '2023-07-24 09:08:03', '2023-07-24 09:08:03');
INSERT INTO `sys_logs` VALUES (984, 'Đăng nhập', 'Đăng nhập', 1, '', '2023-07-24 09:35:36', '2023-07-24 09:35:36');
INSERT INTO `sys_logs` VALUES (985, 'AITypeOfSubjectTeams', 'Thêm', 1, 'Tổ bộ môn: Toán - Tin', '2023-07-24 10:12:53', '2023-07-24 10:12:53');
INSERT INTO `sys_logs` VALUES (986, 'AITypeOfSubjectTeams', 'Xoá', 1, 'Tổ bộ môn: test', '2023-07-24 10:12:56', '2023-07-24 10:12:56');
INSERT INTO `sys_logs` VALUES (987, 'Phân quyền module', 'Sửa đổi', 1, 'Phân quyền tài khoản: admin_ttgdnncth', '2023-07-24 10:14:24', '2023-07-24 10:14:24');
INSERT INTO `sys_logs` VALUES (988, 'Đăng nhập', 'Đăng nhập', 2, '', '2023-07-24 10:16:16', '2023-07-24 10:16:16');
INSERT INTO `sys_logs` VALUES (989, 'Đăng nhập', 'Đăng nhập', 1, '', '2023-07-24 13:41:02', '2023-07-24 13:41:02');
INSERT INTO `sys_logs` VALUES (990, 'Đăng nhập', 'Đăng nhập', 1, '', '2023-07-24 16:04:30', '2023-07-24 16:04:30');
INSERT INTO `sys_logs` VALUES (991, 'Đăng nhập', 'Đăng nhập', 1, '', '2023-07-25 09:42:54', '2023-07-25 09:42:54');
INSERT INTO `sys_logs` VALUES (992, 'Đăng nhập', 'Đăng nhập', 1, '', '2023-07-25 09:43:09', '2023-07-25 09:43:09');
INSERT INTO `sys_logs` VALUES (993, 'Đăng nhập', 'Đăng nhập', 1, '', '2023-07-25 09:44:59', '2023-07-25 09:44:59');
INSERT INTO `sys_logs` VALUES (994, 'Đăng nhập', 'Đăng nhập', 1, '', '2023-07-25 09:49:24', '2023-07-25 09:49:24');
INSERT INTO `sys_logs` VALUES (995, 'AIManageStudents', 'Thêm', 2, 'Thông tin học viên: La Kil', '2023-07-25 10:32:42', '2023-07-25 10:32:42');
INSERT INTO `sys_logs` VALUES (996, 'AIManageStudents', 'Sửa', 2, 'Thông tin học viên: La Kil', '2023-07-25 10:33:38', '2023-07-25 10:33:38');
INSERT INTO `sys_logs` VALUES (997, 'AIManageStudents', 'Sửa', 2, 'Thông tin học viên: Thạch Minh Cường', '2023-07-25 10:33:46', '2023-07-25 10:33:46');
INSERT INTO `sys_logs` VALUES (998, 'AIManageStudents', 'Thêm', 2, 'Thông tin học viên: Lý Văn Khen', '2023-07-25 10:34:38', '2023-07-25 10:34:38');
INSERT INTO `sys_logs` VALUES (999, 'AIManageStudents', 'Sửa', 2, 'Thông tin học viên: Lý Văn Khen', '2023-07-25 10:34:48', '2023-07-25 10:34:48');
INSERT INTO `sys_logs` VALUES (1000, 'AIManageStudents', 'Sửa', 2, 'Thông tin học viên: Lý Văn Khen', '2023-07-25 10:34:58', '2023-07-25 10:34:58');
INSERT INTO `sys_logs` VALUES (1001, 'AIManageStudents', 'Sửa', 2, 'Thông tin học viên: La Kil', '2023-07-25 10:35:04', '2023-07-25 10:35:04');
INSERT INTO `sys_logs` VALUES (1002, 'AIManageStudents', 'Sửa', 2, 'Thông tin học viên: Thạch Minh Cường', '2023-07-25 10:43:51', '2023-07-25 10:43:51');
INSERT INTO `sys_logs` VALUES (1003, 'AIManageStudents', 'Sửa', 2, 'Thông tin học viên: Thạch Minh Cường', '2023-07-25 10:44:09', '2023-07-25 10:44:09');
INSERT INTO `sys_logs` VALUES (1004, 'AIManageStudents', 'Sửa', 2, 'Thông tin học viên: Thạch Minh Cường', '2023-07-25 10:46:24', '2023-07-25 10:46:24');
INSERT INTO `sys_logs` VALUES (1005, 'AIManageStudents', 'Sửa', 2, 'Thông tin học viên: Thạch Minh Cường', '2023-07-25 10:46:34', '2023-07-25 10:46:34');
INSERT INTO `sys_logs` VALUES (1006, 'AIManageStudents', 'Sửa', 2, 'Thông tin học viên: La Kil', '2023-07-25 10:46:53', '2023-07-25 10:46:53');
INSERT INTO `sys_logs` VALUES (1007, 'AIManageStudents', 'Sửa', 2, 'Thông tin học viên: Lý Văn Khen', '2023-07-25 10:47:00', '2023-07-25 10:47:00');
INSERT INTO `sys_logs` VALUES (1008, 'AIManageStudents', 'Sửa', 2, 'Thông tin học viên: Thạch Minh Cường', '2023-07-25 10:47:04', '2023-07-25 10:47:04');
INSERT INTO `sys_logs` VALUES (1009, 'AIManageStudents', 'Sửa', 2, 'Thông tin học viên: Thạch Minh Cường', '2023-07-25 10:47:11', '2023-07-25 10:47:11');
INSERT INTO `sys_logs` VALUES (1010, 'Đăng nhập', 'Đăng nhập', 2, '', '2023-07-25 12:04:18', '2023-07-25 12:04:18');
INSERT INTO `sys_logs` VALUES (1011, 'Đăng nhập', 'Đăng nhập', 1, '', '2023-07-25 13:48:31', '2023-07-25 13:48:31');
INSERT INTO `sys_logs` VALUES (1012, 'Đăng nhập', 'Đăng nhập', 2, '', '2023-07-25 13:48:52', '2023-07-25 13:48:52');
INSERT INTO `sys_logs` VALUES (1013, 'Đăng nhập', 'Đăng nhập', 2, '', '2023-07-28 09:25:01', '2023-07-28 09:25:01');
INSERT INTO `sys_logs` VALUES (1014, 'Đăng nhập', 'Đăng nhập', 2, '', '2023-07-29 23:13:59', '2023-07-29 23:13:59');
INSERT INTO `sys_logs` VALUES (1015, 'AITrainingSpecialties', 'Xoá', 2, 'Khóa học: Khóa 1', '2023-07-30 00:15:01', '2023-07-30 00:15:01');
INSERT INTO `sys_logs` VALUES (1016, 'AITrainingSpecialties', 'Xoá', 2, 'Khóa học: Khóa 2', '2023-07-30 00:15:09', '2023-07-30 00:15:09');
INSERT INTO `sys_logs` VALUES (1017, 'AITrainingSpecialties', 'Thêm', 2, 'Khóa học: Đan đát hàng thủ công mỹ nghệ ( đan ghế dây nhựa, đan giỏ nilon, kết long mi giả, đan giỏ quà )', '2023-07-30 00:20:03', '2023-07-30 00:20:03');
INSERT INTO `sys_logs` VALUES (1018, 'AITrainingSpecialties', 'Thêm', 2, 'Khóa học: test', '2023-07-30 00:37:14', '2023-07-30 00:37:14');
INSERT INTO `sys_logs` VALUES (1019, 'AITrainingSpecialties', 'Xoá', 2, 'Khóa học: test', '2023-07-30 00:38:36', '2023-07-30 00:38:36');
INSERT INTO `sys_logs` VALUES (1020, 'AITrainingSpecialties', 'Thêm', 2, 'Khóa học: May công nghiệp', '2023-07-30 00:40:36', '2023-07-30 00:40:36');
INSERT INTO `sys_logs` VALUES (1021, 'AITrainingSpecialties', 'Thêm', 2, 'Khóa học: Trồng màu ( rau an toàn, rau hữu cơ )', '2023-07-30 00:40:57', '2023-07-30 00:40:57');
INSERT INTO `sys_logs` VALUES (1022, 'AITrainingSpecialties', 'Thêm', 2, 'Khóa học: Chăm sóc hoa kiểng, cây cảnh', '2023-07-30 00:41:13', '2023-07-30 00:41:13');
INSERT INTO `sys_logs` VALUES (1023, 'AITrainingSpecialties', 'Thêm', 2, 'Khóa học: Chăn nuôi (heo, gà, dê, thỏ, vịt…)', '2023-07-30 00:41:48', '2023-07-30 00:41:48');
INSERT INTO `sys_logs` VALUES (1024, 'AITrainingSpecialties', 'Thêm', 2, 'Khóa học: Nuôi thủy sản (tôm, cá, cua, ếch, rắn…)', '2023-07-30 00:41:59', '2023-07-30 00:41:59');
INSERT INTO `sys_logs` VALUES (1025, 'AITrainingSpecialties', 'Thêm', 2, 'Khóa học: Tin học văn phòng', '2023-07-30 00:42:18', '2023-07-30 00:42:18');
INSERT INTO `sys_logs` VALUES (1026, 'AITrainingSpecialties', 'Thêm', 2, 'Khóa học: Trang điểm', '2023-07-30 00:42:37', '2023-07-30 00:42:37');
INSERT INTO `sys_logs` VALUES (1027, 'AITrainingSpecialties', 'Thêm', 2, 'Khóa học: Kỹ thuật làm Nail', '2023-07-30 00:43:06', '2023-07-30 00:43:06');
INSERT INTO `sys_logs` VALUES (1028, 'AITrainingSpecialties', 'Thêm', 2, 'Khóa học: Kỹ thuật xây dựng cơ bản', '2023-07-30 00:43:24', '2023-07-30 00:43:24');
INSERT INTO `sys_logs` VALUES (1029, 'AITrainingSpecialties', 'Thêm', 2, 'Khóa học: Nhạc công ngũ âm', '2023-07-30 00:43:40', '2023-07-30 00:43:40');
INSERT INTO `sys_logs` VALUES (1030, 'AITrainingSpecialties', 'Thêm', 2, 'Khóa học: Cắt, uốn tóc', '2023-07-30 00:43:53', '2023-07-30 00:43:53');
INSERT INTO `sys_logs` VALUES (1031, 'AITrainingSpecialties', 'Thêm', 2, 'Khóa học: Điện gia dụng', '2023-07-30 00:44:03', '2023-07-30 00:44:03');
INSERT INTO `sys_logs` VALUES (1032, 'AITrainingSpecialties', 'Sửa', 2, 'Khóa học: Điện gia dụng', '2023-07-30 00:44:18', '2023-07-30 00:44:18');
INSERT INTO `sys_logs` VALUES (1033, 'AITrainingSpecialties', 'Sửa', 2, 'Khóa học: Cắt, uốn tóc', '2023-07-30 00:44:26', '2023-07-30 00:44:26');
INSERT INTO `sys_logs` VALUES (1034, 'AITrainingSpecialties', 'Thêm', 2, 'Khóa học: Bonsai cây kiểng', '2023-07-30 00:44:43', '2023-07-30 00:44:43');
INSERT INTO `sys_logs` VALUES (1035, 'AITrainingSpecialties', 'Sửa', 2, 'Khóa học: Tin học văn phòng', '2023-07-30 00:45:50', '2023-07-30 00:45:50');
INSERT INTO `sys_logs` VALUES (1036, 'Đăng nhập', 'Đăng nhập', 1, '', '2023-07-30 15:21:24', '2023-07-30 15:21:24');
INSERT INTO `sys_logs` VALUES (1037, 'Đăng nhập', 'Đăng nhập', 1, '', '2023-07-30 16:12:05', '2023-07-30 16:12:05');
INSERT INTO `sys_logs` VALUES (1038, 'Đăng nhập', 'Đăng nhập', 1, '', '2023-07-30 16:35:56', '2023-07-30 16:35:56');
INSERT INTO `sys_logs` VALUES (1039, 'Đăng nhập', 'Đăng nhập', 1, '', '2023-07-30 17:14:19', '2023-07-30 17:14:19');
INSERT INTO `sys_logs` VALUES (1040, 'Đăng nhập', 'Đăng nhập', 1, '', '2023-07-30 19:55:40', '2023-07-30 19:55:40');
INSERT INTO `sys_logs` VALUES (1041, 'Phân quyền chức năng', 'Sửa đổi', 1, 'Phân quyền tài khoản: admin_ttgdnncth', '2023-07-30 19:57:44', '2023-07-30 19:57:44');
INSERT INTO `sys_logs` VALUES (1042, 'Đăng nhập', 'Đăng nhập', 1, '', '2023-07-30 19:57:50', '2023-07-30 19:57:50');
INSERT INTO `sys_logs` VALUES (1043, 'Đăng nhập', 'Đăng nhập', 1, '', '2023-07-30 20:00:20', '2023-07-30 20:00:20');
INSERT INTO `sys_logs` VALUES (1044, 'Đăng nhập', 'Đăng nhập', 2, '', '2023-07-30 20:00:29', '2023-07-30 20:00:29');
INSERT INTO `sys_logs` VALUES (1045, 'AITypeOfCourses', 'Thêm', 2, 'Khóa học: 1', '2023-07-30 21:09:14', '2023-07-30 21:09:14');
INSERT INTO `sys_logs` VALUES (1046, 'AITypeOfCourses', 'Thêm', 2, 'Khóa học: 111', '2023-07-30 21:13:13', '2023-07-30 21:13:13');
INSERT INTO `sys_logs` VALUES (1047, 'AITypeOfCourses', 'Sửa', 2, 'Khóa học: 111', '2023-07-30 21:19:50', '2023-07-30 21:19:50');
INSERT INTO `sys_logs` VALUES (1048, 'AITypeOfCourses', 'Sửa', 2, 'Khóa học: 111', '2023-07-30 21:20:00', '2023-07-30 21:20:00');
INSERT INTO `sys_logs` VALUES (1049, 'AITypeOfCourses', 'Xoá', 2, 'Khóa học: 111', '2023-07-30 21:36:55', '2023-07-30 21:36:55');
INSERT INTO `sys_logs` VALUES (1050, 'Đăng nhập', 'Đăng nhập', 1, '', '2023-07-31 13:46:30', '2023-07-31 13:46:30');
INSERT INTO `sys_logs` VALUES (1051, 'Đăng nhập', 'Đăng nhập', 2, '', '2023-07-31 13:46:45', '2023-07-31 13:46:45');
INSERT INTO `sys_logs` VALUES (1052, 'Đăng nhập', 'Đăng nhập', 1, '', '2023-07-31 15:12:39', '2023-07-31 15:12:39');
INSERT INTO `sys_logs` VALUES (1053, 'Đăng nhập', 'Đăng nhập', 1, '', '2023-07-31 15:12:47', '2023-07-31 15:12:47');
INSERT INTO `sys_logs` VALUES (1054, 'Đăng nhập', 'Đăng nhập', 2, '', '2023-07-31 15:13:05', '2023-07-31 15:13:05');
INSERT INTO `sys_logs` VALUES (1055, 'AIManageStudents', 'Thêm', 2, 'Thông tin học viên: La Kil', '2023-07-31 22:08:00', '2023-07-31 22:08:00');
INSERT INTO `sys_logs` VALUES (1056, 'AIManageStudents', 'Thêm', 2, 'Thông tin học viên: Lý Văn Khen', '2023-07-31 22:09:04', '2023-07-31 22:09:04');
INSERT INTO `sys_logs` VALUES (1057, 'AIManageStudents', 'Sửa', 2, 'Thông tin học viên: Lý Văn Khen', '2023-07-31 22:12:41', '2023-07-31 22:12:41');
INSERT INTO `sys_logs` VALUES (1058, 'AIManageStudents', 'Thêm', 2, 'Thông tin học viên: test', '2023-07-31 22:52:05', '2023-07-31 22:52:05');
INSERT INTO `sys_logs` VALUES (1059, 'AIManageStudents', 'Xoá', 2, 'Thông tin học viên: test', '2023-07-31 22:59:01', '2023-07-31 22:59:01');
INSERT INTO `sys_logs` VALUES (1060, 'AIManageStudents', 'Thêm', 2, 'Thông tin học viên: testt', '2023-07-31 23:01:18', '2023-07-31 23:01:18');
INSERT INTO `sys_logs` VALUES (1061, 'AIManageStudents', 'Xoá', 2, 'Thông tin học viên: testt', '2023-07-31 23:01:22', '2023-07-31 23:01:22');
INSERT INTO `sys_logs` VALUES (1062, 'AIManageStudents', 'Thêm', 2, 'Thông tin học viên: Chau Si Khăn', '2023-07-31 23:08:50', '2023-07-31 23:08:50');
INSERT INTO `sys_logs` VALUES (1063, 'Đăng nhập', 'Đăng nhập', 2, '', '2023-08-01 08:23:27', '2023-08-01 08:23:27');
INSERT INTO `sys_logs` VALUES (1064, 'Đăng nhập', 'Đăng nhập', 2, '', '2023-08-01 08:05:45', '2023-08-01 08:05:45');
INSERT INTO `sys_logs` VALUES (1065, 'Đăng nhập', 'Đăng nhập', 2, '', '2023-08-01 09:09:28', '2023-08-01 09:09:28');
INSERT INTO `sys_logs` VALUES (1066, 'Đăng nhập', 'Đăng nhập', 2, '', '2023-08-01 09:12:09', '2023-08-01 09:12:09');
INSERT INTO `sys_logs` VALUES (1067, 'Đăng nhập', 'Đăng nhập', 2, '', '2023-08-01 09:52:55', '2023-08-01 09:52:55');
INSERT INTO `sys_logs` VALUES (1068, 'Đăng nhập', 'Đăng nhập', 2, '', '2023-08-01 09:56:04', '2023-08-01 09:56:04');
INSERT INTO `sys_logs` VALUES (1069, 'Đăng nhập', 'Đăng nhập', 2, '', '2023-08-01 09:56:33', '2023-08-01 09:56:33');
INSERT INTO `sys_logs` VALUES (1070, 'Đăng nhập', 'Đăng nhập', 2, '', '2023-08-01 14:38:07', '2023-08-01 14:38:07');
INSERT INTO `sys_logs` VALUES (1071, 'AIManageStudents', 'Xoá', 2, 'Thông tin học viên: test', '2023-08-01 16:02:32', '2023-08-01 16:02:32');
INSERT INTO `sys_logs` VALUES (1072, 'AIManageStudents', 'Xoá', 2, 'Thông tin học viên: test', '2023-08-01 16:13:05', '2023-08-01 16:13:05');
INSERT INTO `sys_logs` VALUES (1073, 'AIManageStudents', 'Thêm', 2, 'Thông tin học viên: etsts', '2023-08-01 16:13:13', '2023-08-01 16:13:13');
INSERT INTO `sys_logs` VALUES (1074, 'AIManageStudents', 'Xoá', 2, 'Thông tin học viên: etsts', '2023-08-01 16:38:26', '2023-08-01 16:38:26');
INSERT INTO `sys_logs` VALUES (1075, 'Đăng nhập', 'Đăng nhập', 2, '', '2023-08-01 16:52:19', '2023-08-01 16:52:19');
INSERT INTO `sys_logs` VALUES (1076, 'Đăng nhập', 'Đăng nhập', 2, '', '2023-08-02 08:25:11', '2023-08-02 08:25:11');
INSERT INTO `sys_logs` VALUES (1077, 'Đăng nhập', 'Đăng nhập', 2, '', '2023-08-02 08:25:29', '2023-08-02 08:25:29');
INSERT INTO `sys_logs` VALUES (1078, 'Đăng nhập', 'Đăng nhập', 2, '', '2023-08-02 08:54:11', '2023-08-02 08:54:11');
INSERT INTO `sys_logs` VALUES (1079, 'Đăng nhập', 'Đăng nhập', 1, '', '2023-08-02 10:28:26', '2023-08-02 10:28:26');
INSERT INTO `sys_logs` VALUES (1080, 'Phân quyền module', 'Sửa đổi', 1, 'Phân quyền tài khoản: admin_ttgdnncth', '2023-08-02 10:32:28', '2023-08-02 10:32:28');
INSERT INTO `sys_logs` VALUES (1081, 'Đăng nhập', 'Đăng nhập', 2, '', '2023-08-02 10:33:44', '2023-08-02 10:33:44');
INSERT INTO `sys_logs` VALUES (1082, 'Phân quyền module', 'Sửa đổi', 1, 'Phân quyền tài khoản: admin_ttgdnncth', '2023-08-02 10:58:51', '2023-08-02 10:58:51');
INSERT INTO `sys_logs` VALUES (1083, 'Đăng nhập', 'Đăng nhập', 2, '', '2023-08-02 15:18:24', '2023-08-02 15:18:24');
INSERT INTO `sys_logs` VALUES (1084, 'Đăng nhập', 'Đăng nhập', 2, '', '2023-08-09 13:29:45', '2023-08-09 13:29:45');
INSERT INTO `sys_logs` VALUES (1085, 'AIVocationalEducationPolicities', 'Sửa', 2, 'Chính sách: Kỹ thuật xây dựng cơ bản', '2023-08-13 22:26:33', '2023-08-13 22:26:33');
INSERT INTO `sys_logs` VALUES (1086, 'AIVocationalEducationPolicities', 'Thêm', 2, 'Chính sách: test', '2023-08-13 22:29:13', '2023-08-13 22:29:13');
INSERT INTO `sys_logs` VALUES (1087, 'AIVocationalEducationPolicities', 'Xoá', 2, 'Chính sách: test', '2023-08-13 23:05:03', '2023-08-13 23:05:03');
INSERT INTO `sys_logs` VALUES (1088, 'AIManageStudents', 'Sửa', 2, 'Thông tin học viên: Thạch Minh Cường', '2023-08-14 09:54:35', '2023-08-14 09:54:35');
INSERT INTO `sys_logs` VALUES (1089, 'AIManageStudents', 'Sửa', 2, 'Thông tin học viên: Thạch Minh Cường', '2023-08-14 10:40:52', '2023-08-14 10:40:52');
INSERT INTO `sys_logs` VALUES (1090, 'AIManageStudents', 'Thêm', 2, 'Thông tin học viên: test', '2023-08-14 10:46:09', '2023-08-14 10:46:09');
INSERT INTO `sys_logs` VALUES (1091, 'AIManageStudents', 'Xoá', 2, 'Thông tin học viên: test', '2023-08-14 10:46:33', '2023-08-14 10:46:33');
INSERT INTO `sys_logs` VALUES (1092, 'Đăng nhập', 'Đăng nhập', 2, '', '2023-08-14 13:55:02', '2023-08-14 13:55:02');
INSERT INTO `sys_logs` VALUES (1093, 'AITrainingProgramInformations', 'Thêm', 2, 'Chương trình đào tạo: test', '2023-08-14 15:19:25', '2023-08-14 15:19:25');
INSERT INTO `sys_logs` VALUES (1094, 'AIFileLibraries', 'Thêm ảnh', 2, 'Thư viện ảnh: 1; Tên ảnh: RYYS_HosoThacsi2023-dot2.doc', '2023-08-14 17:14:58', '2023-08-14 17:14:58');
INSERT INTO `sys_logs` VALUES (1095, 'Đăng nhập', 'Đăng nhập', 2, '', '2023-08-15 09:31:50', '2023-08-15 09:31:50');
INSERT INTO `sys_logs` VALUES (1096, 'AIFileLibraries', 'Thêm ảnh', 2, 'Thư viện ảnh: test; Tên ảnh: fYux_HosoThacsi2023-dot2.doc', '2023-08-15 09:33:10', '2023-08-15 09:33:10');
INSERT INTO `sys_logs` VALUES (1097, 'AIFileLibraries', 'Thêm ảnh', 2, 'Thư viện ảnh: 1; Tên ảnh: dCaA_HosoThacsi2023-dot2.doc', '2023-08-15 09:35:15', '2023-08-15 09:35:15');
INSERT INTO `sys_logs` VALUES (1098, 'AIFileLibraries', 'Xoá ảnh', 2, 'Thư viện ảnh: 1; Tên ảnh: dCaA_HosoThacsi2023-dot2.doc', '2023-08-15 09:35:44', '2023-08-15 09:35:44');
INSERT INTO `sys_logs` VALUES (1099, 'AIFileLibraries', 'Thêm ảnh', 2, 'Thư viện ảnh: 1; Tên ảnh: uwgX_HosoThacsi2023-dot2.doc', '2023-08-15 09:37:49', '2023-08-15 09:37:49');
INSERT INTO `sys_logs` VALUES (1100, 'AIFileLibraries', 'Thêm file', 2, 'Chương trình đào tạo file: 1; Tên file: cEht_TKB_SO4_HK2_2017.pdf', '2023-08-15 11:05:44', '2023-08-15 11:05:44');
INSERT INTO `sys_logs` VALUES (1101, 'Đăng nhập', 'Đăng nhập', 2, '', '2023-08-16 08:31:32', '2023-08-16 08:31:32');
INSERT INTO `sys_logs` VALUES (1102, 'AITrainingSpecialties', 'Sửa', 2, 'Khóa học: Đan đát hàng thủ công mỹ nghệ ( đan ghế dây nhựa, đan giỏ nilon, kết long mi giả, đan giỏ quà )', '2023-08-16 10:35:26', '2023-08-16 10:35:26');
INSERT INTO `sys_logs` VALUES (1103, 'AITrainingSpecialties', 'Sửa', 2, 'Khóa học: May công nghiệp', '2023-08-16 10:35:32', '2023-08-16 10:35:32');
INSERT INTO `sys_logs` VALUES (1104, 'AITrainingSpecialties', 'Sửa', 2, 'Khóa học: Trồng màu ( rau an toàn, rau hữu cơ )', '2023-08-16 10:35:39', '2023-08-16 10:35:39');
INSERT INTO `sys_logs` VALUES (1105, 'AITrainingSpecialties', 'Sửa', 2, 'Khóa học: Chăm sóc hoa kiểng, cây cảnh', '2023-08-16 10:35:44', '2023-08-16 10:35:44');
INSERT INTO `sys_logs` VALUES (1106, 'AITrainingSpecialties', 'Sửa', 2, 'Khóa học: Chăn nuôi (heo, gà, dê, thỏ, vịt…)', '2023-08-16 10:35:48', '2023-08-16 10:35:48');
INSERT INTO `sys_logs` VALUES (1107, 'AITrainingSpecialties', 'Sửa', 2, 'Khóa học: Nuôi thủy sản (tôm, cá, cua, ếch, rắn…)', '2023-08-16 10:35:52', '2023-08-16 10:35:52');
INSERT INTO `sys_logs` VALUES (1108, 'AITrainingSpecialties', 'Sửa', 2, 'Khóa học: Tin học văn phòng', '2023-08-16 10:36:02', '2023-08-16 10:36:02');
INSERT INTO `sys_logs` VALUES (1109, 'AITrainingSpecialties', 'Sửa', 2, 'Khóa học: Trang điểm', '2023-08-16 10:36:07', '2023-08-16 10:36:07');
INSERT INTO `sys_logs` VALUES (1110, 'AITrainingSpecialties', 'Sửa', 2, 'Khóa học: Kỹ thuật làm Nail', '2023-08-16 10:36:11', '2023-08-16 10:36:11');
INSERT INTO `sys_logs` VALUES (1111, 'AITrainingSpecialties', 'Sửa', 2, 'Khóa học: Kỹ thuật xây dựng cơ bản', '2023-08-16 10:36:16', '2023-08-16 10:36:16');
INSERT INTO `sys_logs` VALUES (1112, 'AITrainingSpecialties', 'Sửa', 2, 'Khóa học: Nhạc công ngũ âm', '2023-08-16 10:36:23', '2023-08-16 10:36:23');
INSERT INTO `sys_logs` VALUES (1113, 'AITrainingSpecialties', 'Sửa', 2, 'Khóa học: Cắt, uốn tóc', '2023-08-16 10:36:40', '2023-08-16 10:36:40');
INSERT INTO `sys_logs` VALUES (1114, 'AITrainingSpecialties', 'Sửa', 2, 'Khóa học: Điện gia dụng', '2023-08-16 10:36:46', '2023-08-16 10:36:46');
INSERT INTO `sys_logs` VALUES (1115, 'AITrainingSpecialties', 'Sửa', 2, 'Khóa học: Bonsai cây kiểng', '2023-08-16 10:36:54', '2023-08-16 10:36:54');
INSERT INTO `sys_logs` VALUES (1116, 'AITrainingSpecialties', 'Sửa', 2, 'Khóa học: Đan đát hàng thủ công mỹ nghệ ( đan ghế dây nhựa, đan giỏ nilon, kết lông mi giả, đan giỏ quà )', '2023-08-16 10:38:53', '2023-08-16 10:38:53');
INSERT INTO `sys_logs` VALUES (1117, 'Đăng nhập', 'Đăng nhập', 2, '', '2023-08-16 14:51:20', '2023-08-16 14:51:20');
INSERT INTO `sys_logs` VALUES (1118, 'Đăng nhập', 'Đăng nhập', 2, '', '2023-08-17 14:43:05', '2023-08-17 14:43:05');
INSERT INTO `sys_logs` VALUES (1119, 'Đăng nhập', 'Đăng nhập', 1, '', '2023-08-17 14:58:06', '2023-08-17 14:58:06');
INSERT INTO `sys_logs` VALUES (1120, 'Phân quyền module', 'Sửa đổi', 1, 'Phân quyền tài khoản: admin_ttgdnncth', '2023-08-17 14:58:30', '2023-08-17 14:58:30');
INSERT INTO `sys_logs` VALUES (1121, 'Đăng nhập', 'Đăng nhập', 2, '', '2023-08-17 15:02:56', '2023-08-17 15:02:56');
INSERT INTO `sys_logs` VALUES (1122, 'AITypeOfCourses', 'Sửa', 2, 'Khóa học: 1', '2023-08-17 17:09:26', '2023-08-17 17:09:26');
INSERT INTO `sys_logs` VALUES (1123, 'Đăng nhập', 'Đăng nhập', 2, '', '2023-08-18 08:50:21', '2023-08-18 08:50:21');
INSERT INTO `sys_logs` VALUES (1124, 'AIManageStudents', 'Thêm', 2, 'Thông tin học viên: test', '2023-08-18 10:33:55', '2023-08-18 10:33:55');
INSERT INTO `sys_logs` VALUES (1125, 'AIManageStudents', 'Xoá', 2, 'Thông tin học viên: test', '2023-08-18 10:34:13', '2023-08-18 10:34:13');
INSERT INTO `sys_logs` VALUES (1126, 'Đăng nhập', 'Đăng nhập', 2, '', '2023-08-18 14:12:38', '2023-08-18 14:12:38');
INSERT INTO `sys_logs` VALUES (1127, 'Đăng nhập', 'Đăng nhập', 2, '', '2023-08-18 14:10:11', '2023-08-18 14:10:11');
INSERT INTO `sys_logs` VALUES (1128, 'Đăng nhập', 'Đăng nhập', 2, '', '2023-08-18 14:10:16', '2023-08-18 14:10:16');
INSERT INTO `sys_logs` VALUES (1129, 'Đăng nhập', 'Đăng nhập', 2, '', '2023-08-18 14:10:42', '2023-08-18 14:10:42');
INSERT INTO `sys_logs` VALUES (1130, 'Đăng nhập', 'Đăng nhập', 2, '', '2023-08-18 16:22:45', '2023-08-18 16:22:45');
INSERT INTO `sys_logs` VALUES (1131, 'Đăng nhập', 'Đăng nhập', 2, '', '2023-08-21 15:58:13', '2023-08-21 15:58:13');
INSERT INTO `sys_logs` VALUES (1132, 'Đăng nhập', 'Đăng nhập', 2, '', '2023-08-22 13:17:24', '2023-08-22 13:17:24');
INSERT INTO `sys_logs` VALUES (1133, 'AIOfficerInformations', 'Thêm', 2, 'Thông tin cán bộ, giáo viên: test', '2023-08-22 13:37:58', '2023-08-22 13:37:58');
INSERT INTO `sys_logs` VALUES (1134, 'AIOfficerInformations', 'Thêm', 2, 'Thông tin cán bộ, giáo viên: test', '2023-08-22 13:38:07', '2023-08-22 13:38:07');
INSERT INTO `sys_logs` VALUES (1135, 'AIOfficerInformations', 'Thêm', 2, 'Thông tin cán bộ, giáo viên: test', '2023-08-22 13:38:45', '2023-08-22 13:38:45');
INSERT INTO `sys_logs` VALUES (1136, 'AIOfficerInformations', 'Thêm', 2, 'Thông tin cán bộ, giáo viên: test', '2023-08-22 13:50:11', '2023-08-22 13:50:11');
INSERT INTO `sys_logs` VALUES (1137, 'AIOfficerInformations', 'Thêm', 2, 'Thông tin cán bộ, giáo viên: abc', '2023-08-22 13:55:43', '2023-08-22 13:55:43');
INSERT INTO `sys_logs` VALUES (1138, 'AIOfficerInformations', 'Thêm', 2, 'Thông tin cán bộ, giáo viên: test', '2023-08-22 14:04:21', '2023-08-22 14:04:21');
INSERT INTO `sys_logs` VALUES (1139, 'AIOfficerInformations', 'Thêm', 2, 'Thông tin cán bộ, giáo viên: test', '2023-08-22 14:04:55', '2023-08-22 14:04:55');
INSERT INTO `sys_logs` VALUES (1140, 'Đăng nhập', 'Đăng nhập', 2, '', '2023-08-22 14:08:02', '2023-08-22 14:08:02');
INSERT INTO `sys_logs` VALUES (1141, 'AIOfficerInformations', 'Thêm', 2, 'Thông tin cán bộ, giáo viên: Thái Đình Cẩn', '2023-08-22 14:08:11', '2023-08-22 14:08:11');
INSERT INTO `sys_logs` VALUES (1142, 'AIOfficerInformations', 'Thêm', 2, 'Thông tin cán bộ, giáo viên: test', '2023-08-22 14:11:09', '2023-08-22 14:11:09');
INSERT INTO `sys_logs` VALUES (1143, 'AIOfficerInformations', 'Thêm', 2, 'Thông tin cán bộ, giáo viên: test', '2023-08-22 14:11:12', '2023-08-22 14:11:12');
INSERT INTO `sys_logs` VALUES (1144, 'Đăng nhập', 'Đăng nhập', 2, '', '2023-08-22 15:15:18', '2023-08-22 15:15:18');
INSERT INTO `sys_logs` VALUES (1145, 'Đăng nhập', 'Đăng nhập', 2, '', '2023-08-23 10:02:18', '2023-08-23 10:02:18');
INSERT INTO `sys_logs` VALUES (1146, 'Đăng nhập', 'Đăng nhập', 2, '', '2023-08-23 13:43:46', '2023-08-23 13:43:46');
INSERT INTO `sys_logs` VALUES (1147, 'AIOfficerInformations', 'Xoá', 2, 'Thông tin cán bộ, giáo viên: test', '2023-08-23 14:40:25', '2023-08-23 14:40:25');
INSERT INTO `sys_logs` VALUES (1148, 'AIOfficerInformations', 'Xoá', 2, 'Thông tin cán bộ, giáo viên: test', '2023-08-23 14:40:29', '2023-08-23 14:40:29');
INSERT INTO `sys_logs` VALUES (1149, 'AIOfficerInformations', 'Xoá', 2, 'Thông tin cán bộ, giáo viên: Thái Đình Cẩn', '2023-08-23 14:40:33', '2023-08-23 14:40:33');
INSERT INTO `sys_logs` VALUES (1150, 'AIOfficerInformations', 'Thêm', 2, 'Thông tin cán bộ, giáo viên: Huỳnh Thế Lưỡng', '2023-08-23 14:40:48', '2023-08-23 14:40:48');
INSERT INTO `sys_logs` VALUES (1151, 'Đăng nhập', 'Đăng nhập', 2, '', '2023-08-24 00:56:47', '2023-08-24 00:56:47');
INSERT INTO `sys_logs` VALUES (1152, 'Đăng nhập', 'Đăng nhập', 2, '', '2023-08-24 08:49:46', '2023-08-24 08:49:46');
INSERT INTO `sys_logs` VALUES (1153, 'AITypeOfCourses', 'Thêm', 2, 'Khóa học: 2', '2023-08-24 09:10:34', '2023-08-24 09:10:34');
INSERT INTO `sys_logs` VALUES (1154, 'AITypeOfCourses', 'Sửa', 2, 'Khóa học: 1', '2023-08-24 10:42:31', '2023-08-24 10:42:31');
INSERT INTO `sys_logs` VALUES (1155, 'AITypeOfCourses', 'Sửa', 2, 'Khóa học: 2', '2023-08-24 10:43:21', '2023-08-24 10:43:21');
INSERT INTO `sys_logs` VALUES (1156, 'AIManageStudents', 'Xoá', 2, 'Thông tin học viên: Thái Đình Cẩn', '2023-08-24 12:17:51', '2023-08-24 12:17:51');
INSERT INTO `sys_logs` VALUES (1157, 'AIManageStudents', 'Thêm', 2, 'Thông tin học viên: test', '2023-08-24 12:19:21', '2023-08-24 12:19:21');
INSERT INTO `sys_logs` VALUES (1158, 'AIManageStudents', 'Thêm', 2, 'Thông tin học viên: test', '2023-08-24 12:20:07', '2023-08-24 12:20:07');
INSERT INTO `sys_logs` VALUES (1159, 'AIManageStudents', 'Xoá', 2, 'Thông tin học viên: test', '2023-08-24 12:20:17', '2023-08-24 12:20:17');
INSERT INTO `sys_logs` VALUES (1160, 'AIManageStudents', 'Thêm', 2, 'Thông tin học viên: Thái Đình Cẩn', '2023-08-24 12:22:22', '2023-08-24 12:22:22');
INSERT INTO `sys_logs` VALUES (1161, 'AIVocationalEducationPolicities', 'Thêm', 2, 'Chính sách: test', '2023-08-24 12:24:18', '2023-08-24 12:24:18');
INSERT INTO `sys_logs` VALUES (1162, 'AIVocationalEducationPolicities', 'Xoá', 2, 'Chính sách: test', '2023-08-24 12:24:26', '2023-08-24 12:24:26');
INSERT INTO `sys_logs` VALUES (1163, 'Đăng nhập', 'Đăng nhập', 2, '', '2023-08-24 12:08:33', '2023-08-24 12:08:33');
INSERT INTO `sys_logs` VALUES (1164, 'AIManageStudents', 'Thêm', 2, 'Thông tin học viên: test', '2023-08-24 12:08:45', '2023-08-24 12:08:45');
INSERT INTO `sys_logs` VALUES (1165, 'AITrainingProgramInformations', 'Thêm', 2, 'Chương trình đào tạo: Kỹ thuật xây dựng cơ bản', '2023-08-24 12:09:09', '2023-08-24 12:09:09');
INSERT INTO `sys_logs` VALUES (1166, 'AITrainingProgramInformations', 'Xoá', 2, 'Chương trình đào tạo: Kỹ thuật xâ', '2023-08-24 12:09:17', '2023-08-24 12:09:17');
INSERT INTO `sys_logs` VALUES (1167, 'Đăng nhập', 'Đăng nhập', 2, '', '2023-08-24 13:41:46', '2023-08-24 13:41:46');
INSERT INTO `sys_logs` VALUES (1168, 'AIVocationalEducationPolicities', 'Thêm', 2, 'Chính sách: Cận nghèo', '2023-08-24 15:13:44', '2023-08-24 15:13:44');
INSERT INTO `sys_logs` VALUES (1169, 'AIVocationalEducationPolicities', 'Sửa', 2, 'Chính sách: Người có công Cách mạng', '2023-08-24 15:14:11', '2023-08-24 15:14:11');
INSERT INTO `sys_logs` VALUES (1170, 'AIVocationalEducationPolicities', 'Thêm', 2, 'Chính sách: Trợ cấp bảo trợ xã hội', '2023-08-24 15:14:41', '2023-08-24 15:14:41');
INSERT INTO `sys_logs` VALUES (1171, 'Đăng nhập', 'Đăng nhập', 2, '', '2023-09-12 08:39:50', '2023-09-12 08:39:50');
INSERT INTO `sys_logs` VALUES (1172, 'AIOfficerWorkProcess', 'Xoá', 2, 'Quá trình công tác: ', '2023-09-12 08:40:12', '2023-09-12 08:40:12');
INSERT INTO `sys_logs` VALUES (1173, 'AIOfficerWorkProcess', 'Xoá', 2, 'Quá trình công tác: ', '2023-09-12 08:40:14', '2023-09-12 08:40:14');
INSERT INTO `sys_logs` VALUES (1174, 'AIOfficerInformations', 'Xoá', 2, 'Thông tin cán bộ, giáo viên: Thái Đình Cẩn', '2023-09-12 08:40:25', '2023-09-12 08:40:25');
INSERT INTO `sys_logs` VALUES (1175, 'AIOfficerInformations', 'Sửa', 2, 'Thông tin cán bộ, giáo viên: Huỳnh Thế Lưỡng', '2023-09-12 08:40:40', '2023-09-12 08:40:40');
INSERT INTO `sys_logs` VALUES (1176, 'AIOfficerInformations', 'Sửa', 2, 'Thông tin cán bộ, giáo viên: Huỳnh Thế Lưỡng', '2023-09-12 08:40:45', '2023-09-12 08:40:45');
INSERT INTO `sys_logs` VALUES (1177, 'Đăng nhập', 'Đăng nhập', 2, '', '2023-09-13 09:07:38', '2023-09-13 09:07:38');
INSERT INTO `sys_logs` VALUES (1178, 'Đăng nhập', 'Đăng nhập', 2, '', '2023-09-14 08:31:36', '2023-09-14 08:31:36');
INSERT INTO `sys_logs` VALUES (1179, 'Đăng nhập', 'Đăng nhập', 2, '', '2023-09-15 15:11:12', '2023-09-15 15:11:12');
INSERT INTO `sys_logs` VALUES (1180, 'Đăng nhập', 'Đăng nhập', 2, '', '2023-09-16 21:16:17', '2023-09-16 21:16:17');
INSERT INTO `sys_logs` VALUES (1181, 'Đăng nhập', 'Đăng nhập', 2, '', '2023-09-17 21:25:25', '2023-09-17 21:25:25');
INSERT INTO `sys_logs` VALUES (1182, 'AIManageStudents', 'Xoá', 2, 'Thông tin học viên: Thái Đình Cẩn', '2023-09-18 14:53:04', '2023-09-18 14:53:04');
INSERT INTO `sys_logs` VALUES (1183, 'Đăng nhập', 'Đăng nhập', 2, '', '2023-09-19 08:09:53', '2023-09-19 08:09:53');
INSERT INTO `sys_logs` VALUES (1184, 'Đăng nhập', 'Đăng nhập', 2, '', '2023-09-19 16:52:46', '2023-09-19 16:52:46');
INSERT INTO `sys_logs` VALUES (1185, 'Đăng nhập', 'Đăng nhập', 2, '', '2023-09-22 00:46:13', '2023-09-22 00:46:13');
INSERT INTO `sys_logs` VALUES (1186, 'Đăng nhập', 'Đăng nhập', 2, '', '2023-09-22 01:57:52', '2023-09-22 01:57:52');
INSERT INTO `sys_logs` VALUES (1187, 'Đăng nhập', 'Đăng nhập', 2, '', '2023-09-28 08:03:22', '2023-09-28 08:03:22');
INSERT INTO `sys_logs` VALUES (1188, 'AIReviewProcess', 'Thêm', 2, 'Danh mục: test', '2023-09-28 11:12:36', '2023-09-28 11:12:36');
INSERT INTO `sys_logs` VALUES (1189, 'AIReviewProcess', 'Thêm', 2, 'Danh mục: test', '2023-09-28 11:13:04', '2023-09-28 11:13:04');
INSERT INTO `sys_logs` VALUES (1190, 'AIReviewProcess', 'Thêm', 2, 'Danh mục: test', '2023-09-28 11:14:14', '2023-09-28 11:14:14');
INSERT INTO `sys_logs` VALUES (1191, 'AIReviewProcess', 'Thêm', 2, 'Danh mục: test', '2023-09-28 11:17:54', '2023-09-28 11:17:54');
INSERT INTO `sys_logs` VALUES (1192, 'AIReviewProcess', 'Thêm', 2, 'Danh mục: test', '2023-09-28 11:19:13', '2023-09-28 11:19:13');
INSERT INTO `sys_logs` VALUES (1193, 'AIReviewProcess', 'Thêm', 2, 'Danh mục: test', '2023-09-28 12:28:22', '2023-09-28 12:28:22');
INSERT INTO `sys_logs` VALUES (1194, 'AIReviewProcess', 'Sửa', 2, 'Danh mục: test', '2023-09-28 13:41:03', '2023-09-28 13:41:03');
INSERT INTO `sys_logs` VALUES (1195, 'AIReviewProcess', 'Sửa', 2, 'Danh mục: test1', '2023-09-28 13:41:15', '2023-09-28 13:41:15');
INSERT INTO `sys_logs` VALUES (1196, 'AIReviewProcess', 'Xoá', 2, 'Danh mục: test1', '2023-09-28 14:11:35', '2023-09-28 14:11:35');
INSERT INTO `sys_logs` VALUES (1197, 'AIReviewProcess', 'Thêm', 2, 'Danh mục: Tổ chức khai giảng', '2023-09-28 14:13:34', '2023-09-28 14:13:34');
INSERT INTO `sys_logs` VALUES (1198, 'AIReviewProcess', 'Thêm', 2, 'Danh mục: Sinh hoạt nội quy, giới thiệu các yêu cầu về vật liệu', '2023-09-28 14:14:45', '2023-09-28 14:14:45');
INSERT INTO `sys_logs` VALUES (1199, 'AIReviewProcess', 'Thêm', 2, 'Danh mục: Xây tường gạch', '2023-09-28 14:14:55', '2023-09-28 14:14:55');
INSERT INTO `sys_logs` VALUES (1200, 'AIReviewProcess', 'Sửa', 2, 'Danh mục: Tổ chức khai giảng', '2023-09-28 14:15:02', '2023-09-28 14:15:02');
INSERT INTO `sys_logs` VALUES (1201, 'AIReviewProcess', 'Sửa', 2, 'Danh mục: Sinh hoạt nội quy, giới thiệu các yêu cầu về vật liệu', '2023-09-28 14:15:04', '2023-09-28 14:15:04');
INSERT INTO `sys_logs` VALUES (1202, 'AIReviewProcess', 'Sửa', 2, 'Danh mục: Xây tường gạch', '2023-09-28 14:15:07', '2023-09-28 14:15:07');
INSERT INTO `sys_logs` VALUES (1203, 'AIReviewProcess', 'Thêm', 2, 'Danh mục: Xây trụ gạch', '2023-09-28 14:15:13', '2023-09-28 14:15:13');
INSERT INTO `sys_logs` VALUES (1204, 'AIReviewProcess', 'Thêm', 2, 'Danh mục: Xây lanh tô gạch', '2023-09-28 14:15:19', '2023-09-28 14:15:19');
INSERT INTO `sys_logs` VALUES (1205, 'AIReviewProcess', 'Thêm', 2, 'Danh mục: Trát tường phẳng', '2023-09-28 14:15:27', '2023-09-28 14:15:27');
INSERT INTO `sys_logs` VALUES (1206, 'AIReviewProcess', 'Thêm', 2, 'Danh mục: Láng, lát, ốp', '2023-09-28 14:15:33', '2023-09-28 14:15:33');
INSERT INTO `sys_logs` VALUES (1207, 'AIReviewProcess', 'Thêm', 2, 'Danh mục: Đọc bản vẽ, tính khối lượng, nhân công, vật liệu', '2023-09-28 14:15:38', '2023-09-28 14:15:38');
INSERT INTO `sys_logs` VALUES (1208, 'AIReviewProcess', 'Thêm', 2, 'Danh mục: Ôn tập', '2023-09-28 14:15:45', '2023-09-28 14:15:45');
INSERT INTO `sys_logs` VALUES (1209, 'AIReviewProcess', 'Thêm', 2, 'Danh mục: Thi', '2023-09-28 14:15:50', '2023-09-28 14:15:50');
INSERT INTO `sys_logs` VALUES (1210, 'AIReviewProcess', 'Thêm', 2, 'Danh mục: Tổ chức bế giảng', '2023-09-28 14:15:54', '2023-09-28 14:15:54');
INSERT INTO `sys_logs` VALUES (1211, 'AIReviewProcess', 'Sửa', 2, 'Danh mục: Khai giảng, bế giảng', '2023-09-28 14:16:09', '2023-09-28 14:16:09');
INSERT INTO `sys_logs` VALUES (1212, 'AIReviewProcess', 'Sửa', 2, 'Danh mục: Hoạt động chung', '2023-09-28 14:16:11', '2023-09-28 14:16:11');
INSERT INTO `sys_logs` VALUES (1213, 'AIReviewProcess', 'Thêm', 2, 'Danh mục: Mô đun đào tào nghề', '2023-09-28 14:16:18', '2023-09-28 14:16:18');
INSERT INTO `sys_logs` VALUES (1214, 'AIReviewProcess', 'Thêm', 2, 'Danh mục: Thực tập doanh nghiệp', '2023-09-28 14:16:27', '2023-09-28 14:16:27');
INSERT INTO `sys_logs` VALUES (1215, 'AIReviewProcess', 'Thêm', 2, 'Danh mục: Kiểm tra, thi kết thúc khóa học', '2023-09-28 14:16:32', '2023-09-28 14:16:32');
INSERT INTO `sys_logs` VALUES (1216, 'AIReviewProcess', 'Thêm', 2, 'Danh mục: Nghỉ lễ', '2023-09-28 14:16:37', '2023-09-28 14:16:37');
INSERT INTO `sys_logs` VALUES (1217, 'AIReviewProcess', 'Thêm', 2, 'Danh mục: Lao động/ngoại khóa', '2023-09-28 14:16:43', '2023-09-28 14:16:43');
INSERT INTO `sys_logs` VALUES (1218, 'AIReviewProcess', 'Thêm', 2, 'Danh mục: Ôn tập', '2023-09-28 14:16:48', '2023-09-28 14:16:48');
INSERT INTO `sys_logs` VALUES (1219, 'AIManageStudents', 'Xoá', 2, 'Thông tin học viên: test', '2023-09-28 15:06:49', '2023-09-28 15:06:49');
INSERT INTO `sys_logs` VALUES (1220, 'AITypeOfCourses', 'Sửa', 2, 'Khóa học: 1', '2023-09-28 15:07:17', '2023-09-28 15:07:17');
INSERT INTO `sys_logs` VALUES (1221, 'AITypeOfCourses', 'Sửa', 2, 'Khóa học: 1', '2023-09-28 15:07:25', '2023-09-28 15:07:25');
INSERT INTO `sys_logs` VALUES (1222, 'Đăng nhập', 'Đăng nhập', 2, '', '2023-09-29 01:45:06', '2023-09-29 01:45:06');
INSERT INTO `sys_logs` VALUES (1223, 'Đăng nhập', 'Đăng nhập', 2, '', '2023-09-29 08:14:34', '2023-09-29 08:14:34');
INSERT INTO `sys_logs` VALUES (1224, 'Đăng nhập', 'Đăng nhập', 2, '', '2023-09-29 08:15:29', '2023-09-29 08:15:29');
INSERT INTO `sys_logs` VALUES (1225, 'Đăng nhập', 'Đăng nhập', 2, '', '2023-09-29 09:03:07', '2023-09-29 09:03:07');
INSERT INTO `sys_logs` VALUES (1226, 'Đăng nhập', 'Đăng nhập', 2, '', '2023-10-02 14:32:46', '2023-10-02 14:32:46');
INSERT INTO `sys_logs` VALUES (1227, 'Đăng nhập', 'Đăng nhập', 2, '', '2023-10-03 08:22:46', '2023-10-03 08:22:46');
INSERT INTO `sys_logs` VALUES (1228, 'AITypeOfCourses', 'Thêm', 2, 'Khóa học: 1', '2023-10-03 15:49:09', '2023-10-03 15:49:09');
INSERT INTO `sys_logs` VALUES (1229, 'Đăng nhập', 'Đăng nhập', 2, '', '2023-10-04 08:47:14', '2023-10-04 08:47:14');
INSERT INTO `sys_logs` VALUES (1230, 'Đăng nhập', 'Đăng nhập', 2, '', '2023-10-05 08:33:37', '2023-10-05 08:33:37');
INSERT INTO `sys_logs` VALUES (1231, 'Đăng nhập', 'Đăng nhập', 2, '', '2023-10-05 14:40:46', '2023-10-05 14:40:46');
INSERT INTO `sys_logs` VALUES (1232, 'AIManageStudents', 'Sửa', 2, 'Thông tin học viên: Trương Phú Quốc', '2023-10-05 16:27:25', '2023-10-05 16:27:25');
INSERT INTO `sys_logs` VALUES (1233, 'AIManageStudents', 'Sửa', 2, 'Thông tin học viên: Trà  Thanh Hoàng', '2023-10-05 16:28:39', '2023-10-05 16:28:39');
INSERT INTO `sys_logs` VALUES (1234, 'AIManageStudents', 'Sửa', 2, 'Thông tin học viên: Trà  Thanh Hoàng', '2023-10-05 16:29:30', '2023-10-05 16:29:30');
INSERT INTO `sys_logs` VALUES (1235, 'AIManageStudents', 'Sửa', 2, 'Thông tin học viên: Trương Phú Quốc', '2023-10-05 16:29:36', '2023-10-05 16:29:36');
INSERT INTO `sys_logs` VALUES (1236, 'AIManageStudents', 'Sửa', 2, 'Thông tin học viên: Trà  Thanh Hoàng', '2023-10-05 17:25:04', '2023-10-05 17:25:04');
INSERT INTO `sys_logs` VALUES (1237, 'Đăng nhập', 'Đăng nhập', 2, '', '2023-10-06 09:16:51', '2023-10-06 09:16:51');
INSERT INTO `sys_logs` VALUES (1238, 'AITypeOfEthnics', 'Sửa', 2, 'Dân tộc: Kinh', '2023-10-06 09:18:02', '2023-10-06 09:18:02');
INSERT INTO `sys_logs` VALUES (1239, 'Đăng nhập', 'Đăng nhập', 31, '', '2023-10-06 09:38:09', '2023-10-06 09:38:09');
INSERT INTO `sys_logs` VALUES (1240, 'Quản lý người dùng', 'Thêm mới', 31, 'Tài khoản: admin_ttgdnncth2', '2023-10-06 09:40:07', '2023-10-06 09:40:07');
INSERT INTO `sys_logs` VALUES (1241, 'Phân quyền chức năng', 'Sửa đổi', 31, 'Phân quyền tài khoản: admin_ttgdnncth2', '2023-10-06 09:40:33', '2023-10-06 09:40:33');
INSERT INTO `sys_logs` VALUES (1242, 'Phân quyền module', 'Sửa đổi', 31, 'Phân quyền tài khoản: admin_ttgdnncth2', '2023-10-06 09:40:45', '2023-10-06 09:40:45');
INSERT INTO `sys_logs` VALUES (1243, 'Đăng nhập', 'Đăng nhập', 32, '', '2023-10-06 09:40:51', '2023-10-06 09:40:51');
INSERT INTO `sys_logs` VALUES (1244, 'Đăng nhập', 'Đăng nhập', 31, '', '2023-10-06 09:41:07', '2023-10-06 09:41:07');
INSERT INTO `sys_logs` VALUES (1245, 'Đăng nhập', 'Đăng nhập', 31, '', '2023-10-06 12:34:00', '2023-10-06 12:34:00');
INSERT INTO `sys_logs` VALUES (1246, 'AITypeOfCourses', 'Thêm', 31, 'Khóa học: 3', '2023-10-06 16:44:59', '2023-10-06 16:44:59');
INSERT INTO `sys_logs` VALUES (1247, 'Đăng nhập', 'Đăng nhập', 31, '', '2023-10-24 16:24:06', '2023-10-24 16:24:06');
INSERT INTO `sys_logs` VALUES (1248, 'AITypeOfCourses', 'Sửa', 31, 'Khóa học: 1', '2023-11-14 17:08:18', '2023-11-14 17:08:18');
INSERT INTO `sys_logs` VALUES (1249, 'Đăng nhập', 'Đăng nhập', 31, '', '2023-11-15 08:32:43', '2023-11-15 08:32:43');
INSERT INTO `sys_logs` VALUES (1250, 'Đăng nhập', 'Đăng nhập', 31, '', '2023-11-15 15:56:26', '2023-11-15 15:56:26');
INSERT INTO `sys_logs` VALUES (1251, 'Đăng nhập', 'Đăng nhập', 31, '', '2023-11-16 08:41:56', '2023-11-16 08:41:56');
INSERT INTO `sys_logs` VALUES (1252, 'Đăng nhập', 'Đăng nhập', 31, '', '2023-11-16 09:08:44', '2023-11-16 09:08:44');
INSERT INTO `sys_logs` VALUES (1253, 'Đăng nhập', 'Đăng nhập', 31, '', '2023-11-16 09:31:35', '2023-11-16 09:31:35');
INSERT INTO `sys_logs` VALUES (1254, 'Đăng nhập', 'Đăng nhập', 31, '', '2023-11-16 10:56:52', '2023-11-16 10:56:52');
INSERT INTO `sys_logs` VALUES (1255, 'Đăng nhập', 'Đăng nhập', 31, '', '2023-11-16 13:21:26', '2023-11-16 13:21:26');
INSERT INTO `sys_logs` VALUES (1256, 'Đăng nhập', 'Đăng nhập', 31, '', '2023-11-16 13:33:56', '2023-11-16 13:33:56');
INSERT INTO `sys_logs` VALUES (1257, 'Đăng nhập', 'Đăng nhập', 31, '', '2023-11-16 13:34:11', '2023-11-16 13:34:11');
INSERT INTO `sys_logs` VALUES (1258, 'Đăng nhập', 'Đăng nhập', 31, '', '2023-11-16 14:22:20', '2023-11-16 14:22:20');
INSERT INTO `sys_logs` VALUES (1259, 'Đăng nhập', 'Đăng nhập', 31, '', '2023-11-16 16:05:50', '2023-11-16 16:05:50');
INSERT INTO `sys_logs` VALUES (1260, 'Đăng nhập', 'Đăng nhập', 31, '', '2023-11-16 16:06:26', '2023-11-16 16:06:26');
INSERT INTO `sys_logs` VALUES (1261, 'Đăng nhập', 'Đăng nhập', 31, '', '2023-11-16 16:07:12', '2023-11-16 16:07:12');
INSERT INTO `sys_logs` VALUES (1262, 'Đăng nhập', 'Đăng nhập', 31, '', '2023-11-16 16:07:51', '2023-11-16 16:07:51');
INSERT INTO `sys_logs` VALUES (1263, 'Đăng nhập', 'Đăng nhập', 31, '', '2023-11-16 16:10:28', '2023-11-16 16:10:28');
INSERT INTO `sys_logs` VALUES (1264, 'Đăng nhập', 'Đăng nhập', 31, '', '2023-11-17 10:19:17', '2023-11-17 10:19:17');
INSERT INTO `sys_logs` VALUES (1265, 'Đăng nhập', 'Đăng nhập', 31, '', '2023-11-17 10:47:58', '2023-11-17 10:47:58');
INSERT INTO `sys_logs` VALUES (1266, 'Đăng nhập', 'Đăng nhập', 31, '', '2023-11-17 14:47:47', '2023-11-17 14:47:47');
INSERT INTO `sys_logs` VALUES (1267, 'Đăng nhập', 'Đăng nhập', 31, '', '2023-11-30 15:20:32', '2023-11-30 15:20:32');
INSERT INTO `sys_logs` VALUES (1268, 'Đăng nhập', 'Đăng nhập', 31, '', '2023-11-30 16:15:05', '2023-11-30 16:15:05');
INSERT INTO `sys_logs` VALUES (1269, 'Đăng nhập', 'Đăng nhập', 31, '', '2023-12-01 09:26:53', '2023-12-01 09:26:53');
INSERT INTO `sys_logs` VALUES (1270, 'Đăng nhập', 'Đăng nhập', 31, '', '2023-12-01 14:25:08', '2023-12-01 14:25:08');
INSERT INTO `sys_logs` VALUES (1271, 'Đăng nhập', 'Đăng nhập', 31, '', '2023-12-04 08:24:07', '2023-12-04 08:24:07');
INSERT INTO `sys_logs` VALUES (1272, 'Đăng nhập', 'Đăng nhập', 31, '', '2023-12-04 09:28:38', '2023-12-04 09:28:38');
INSERT INTO `sys_logs` VALUES (1273, 'Đăng nhập', 'Đăng nhập', 31, '', '2023-12-04 12:49:33', '2023-12-04 12:49:33');
INSERT INTO `sys_logs` VALUES (1274, 'Đăng nhập', 'Đăng nhập', 31, '', '2023-12-04 13:39:22', '2023-12-04 13:39:22');
INSERT INTO `sys_logs` VALUES (1275, 'Đăng nhập', 'Đăng nhập', 31, '', '2023-12-04 13:41:53', '2023-12-04 13:41:53');
INSERT INTO `sys_logs` VALUES (1276, 'Đăng nhập', 'Đăng nhập', 31, '', '2023-12-04 15:12:15', '2023-12-04 15:12:15');
INSERT INTO `sys_logs` VALUES (1277, 'Đăng nhập', 'Đăng nhập', 31, '', '2023-12-04 14:57:40', '2023-12-04 14:57:40');
INSERT INTO `sys_logs` VALUES (1278, 'Đăng nhập', 'Đăng nhập', 31, '', '2023-12-05 14:01:35', '2023-12-05 14:01:35');
INSERT INTO `sys_logs` VALUES (1279, 'Đăng nhập', 'Đăng nhập', 31, '', '2023-12-06 10:53:41', '2023-12-06 10:53:41');
INSERT INTO `sys_logs` VALUES (1280, 'Đăng nhập', 'Đăng nhập', 31, '', '2023-12-06 14:59:21', '2023-12-06 14:59:21');
INSERT INTO `sys_logs` VALUES (1281, 'Đăng nhập', 'Đăng nhập', 31, '', '2023-12-07 08:39:39', '2023-12-07 08:39:39');
INSERT INTO `sys_logs` VALUES (1282, 'Đăng nhập', 'Đăng nhập', 31, '', '2023-12-08 09:59:07', '2023-12-08 09:59:07');
INSERT INTO `sys_logs` VALUES (1283, 'Đăng nhập', 'Đăng nhập', 31, '', '2024-01-31 09:24:52', '2024-01-31 09:24:52');
INSERT INTO `sys_logs` VALUES (1284, 'Đăng nhập', 'Đăng nhập', 31, '', '2024-01-31 09:29:42', '2024-01-31 09:29:42');
INSERT INTO `sys_logs` VALUES (1285, 'AITypeOfFamilyCompositions', 'Thêm', 31, 'Thành phần gia đình: test', '2024-01-31 09:32:01', '2024-01-31 09:32:01');
INSERT INTO `sys_logs` VALUES (1286, 'AITypeOfFamilyCompositions', 'Xoá', 31, 'Thành phần gia đình: test', '2024-01-31 09:32:10', '2024-01-31 09:32:10');
INSERT INTO `sys_logs` VALUES (1287, 'AITypeOfEthnics', 'Thêm', 31, 'Dân tộc: test', '2024-01-31 09:32:25', '2024-01-31 09:32:25');
INSERT INTO `sys_logs` VALUES (1288, 'AITypeOfEthnics', 'Sửa', 31, 'Dân tộc: test 1', '2024-01-31 09:32:34', '2024-01-31 09:32:34');
INSERT INTO `sys_logs` VALUES (1289, 'AITypeOfEthnics', 'Xoá', 31, 'Dân tộc: test 1', '2024-01-31 09:32:40', '2024-01-31 09:32:40');
INSERT INTO `sys_logs` VALUES (1290, 'Đăng nhập', 'Đăng nhập', 31, '', '2024-01-31 15:53:55', '2024-01-31 15:53:55');
INSERT INTO `sys_logs` VALUES (1291, 'AITypeOfRecruitments', 'Thêm', 31, 'Đối tượng tuyển sinh / ưu tiên: test', '2024-01-31 15:56:09', '2024-01-31 15:56:09');
INSERT INTO `sys_logs` VALUES (1292, 'AITypeOfRecruitments', 'Xoá', 31, 'Đối tượng tuyển sinh / ưu tiên: test', '2024-01-31 15:56:21', '2024-01-31 15:56:21');
INSERT INTO `sys_logs` VALUES (1293, 'AITypeOfEthnics', 'Thêm', 31, 'Dân tộc: test', '2024-01-31 15:57:04', '2024-01-31 15:57:04');
INSERT INTO `sys_logs` VALUES (1294, 'AITrainingSpecialties', 'Thêm', 31, 'Khóa học: test', '2024-01-31 15:57:28', '2024-01-31 15:57:28');
INSERT INTO `sys_logs` VALUES (1295, 'AITypeOfFamilyCompositions', 'Thêm', 31, 'Thành phần gia đình: test', '2024-01-31 16:07:10', '2024-01-31 16:07:10');
INSERT INTO `sys_logs` VALUES (1296, 'AITypeOfReligions', 'Thêm', 31, 'Tôn giáo: test', '2024-01-31 16:09:50', '2024-01-31 16:09:50');
INSERT INTO `sys_logs` VALUES (1297, 'AITypeOfCourses', 'Thêm', 31, 'Khóa học: 1', '2024-01-31 16:11:04', '2024-01-31 16:11:04');
INSERT INTO `sys_logs` VALUES (1298, 'AITypeOfDepartments', 'Thêm', 31, 'Khoa/phòng: Khóa 3', '2024-01-31 16:12:11', '2024-01-31 16:12:11');
INSERT INTO `sys_logs` VALUES (1299, 'AIOfficerInformations', 'Thêm', 31, 'Thông tin cán bộ, giáo viên: Nguyễn Hữu Nhân', '2024-01-31 16:12:54', '2024-01-31 16:12:54');
INSERT INTO `sys_logs` VALUES (1300, 'AITrainingProgramInformations', 'Thêm', 31, 'Chương trình đào tạo: test 1', '2024-01-31 16:15:39', '2024-01-31 16:15:39');
INSERT INTO `sys_logs` VALUES (1301, 'AITrainingProgramInformations', 'Sửa', 31, 'Chương trình đào tạo: test 1', '2024-01-31 16:22:21', '2024-01-31 16:22:21');
INSERT INTO `sys_logs` VALUES (1302, 'Đăng nhập', 'Đăng nhập', 31, '', '2024-01-31 16:25:27', '2024-01-31 16:25:27');
INSERT INTO `sys_logs` VALUES (1303, 'AITrainingProgramInformations', 'Sửa', 31, 'Chương trình đào tạo: test 1', '2024-01-31 16:27:34', '2024-01-31 16:27:34');
INSERT INTO `sys_logs` VALUES (1304, 'AITrainingProgramInformations', 'Sửa', 31, 'Chương trình đào tạo: test 1', '2024-01-31 16:30:14', '2024-01-31 16:30:14');
INSERT INTO `sys_logs` VALUES (1305, 'AITrainingProgramInformations', 'Sửa', 31, 'Chương trình đào tạo: 100', '2024-01-31 16:33:34', '2024-01-31 16:33:34');
INSERT INTO `sys_logs` VALUES (1306, 'Đăng nhập', 'Đăng nhập', 31, '', '2024-01-31 16:58:00', '2024-01-31 16:58:00');
INSERT INTO `sys_logs` VALUES (1307, 'Đăng nhập', 'Đăng nhập', 31, '', '2024-01-31 19:55:02', '2024-01-31 19:55:02');
INSERT INTO `sys_logs` VALUES (1308, 'Đăng nhập', 'Đăng nhập', 31, '', '2024-02-01 00:27:35', '2024-02-01 00:27:35');
INSERT INTO `sys_logs` VALUES (1309, 'AIManageStudents', 'Sửa', 31, 'Thông tin học viên: Nguyễn Văn A', '2024-02-01 01:09:14', '2024-02-01 01:09:14');
INSERT INTO `sys_logs` VALUES (1310, 'Đăng nhập', 'Đăng nhập', 31, '', '2024-02-01 07:45:18', '2024-02-01 07:45:18');
INSERT INTO `sys_logs` VALUES (1311, 'Đăng nhập', 'Đăng nhập', 31, '', '2024-02-01 07:49:58', '2024-02-01 07:49:58');
INSERT INTO `sys_logs` VALUES (1312, 'Quản lý người dùng', 'Sửa đổi', 31, 'Tài khoản: admin_ttgdnncth2', '2024-02-01 07:50:21', '2024-02-01 07:50:21');
INSERT INTO `sys_logs` VALUES (1313, 'Phân quyền chức năng', 'Sửa đổi', 31, 'Phân quyền tài khoản: admin_ttgdnncth2', '2024-02-01 07:50:27', '2024-02-01 07:50:27');
INSERT INTO `sys_logs` VALUES (1314, 'Phân quyền module', 'Sửa đổi', 31, 'Phân quyền tài khoản: admin_ttgdnncth2', '2024-02-01 07:50:35', '2024-02-01 07:50:35');
INSERT INTO `sys_logs` VALUES (1315, 'Đăng nhập', 'Đăng nhập', 31, '', '2024-02-01 08:20:43', '2024-02-01 08:20:43');
INSERT INTO `sys_logs` VALUES (1316, 'Đăng nhập', 'Đăng nhập', 31, '', '2024-02-01 08:24:05', '2024-02-01 08:24:05');
INSERT INTO `sys_logs` VALUES (1317, 'AIOfficerWorkProcess', 'Thêm', 31, 'Quá trình công tác: dsffdscủa người dùng Thái Đình Cẩn', '2024-02-01 08:26:38', '2024-02-01 08:26:38');
INSERT INTO `sys_logs` VALUES (1318, 'AIVocationalEducationPolicities', 'Thêm', 31, 'Chính sách: éttset', '2024-02-01 08:27:44', '2024-02-01 08:27:44');
INSERT INTO `sys_logs` VALUES (1319, 'Đăng nhập', 'Đăng nhập', 31, '', '2024-02-21 15:31:02', '2024-02-21 15:31:02');
INSERT INTO `sys_logs` VALUES (1320, 'Đăng nhập', 'Đăng nhập', 31, '', '2024-03-26 14:47:06', '2024-03-26 14:47:06');
INSERT INTO `sys_logs` VALUES (1321, 'Đăng nhập', 'Đăng nhập', 31, '', '2024-03-26 14:47:24', '2024-03-26 14:47:24');
INSERT INTO `sys_logs` VALUES (1322, 'Đăng nhập', 'Đăng nhập', 31, '', '2024-03-26 14:47:32', '2024-03-26 14:47:32');
INSERT INTO `sys_logs` VALUES (1323, 'Đăng nhập', 'Đăng nhập', 31, '', '2024-03-27 08:31:17', '2024-03-27 08:31:17');
INSERT INTO `sys_logs` VALUES (1324, 'Đăng nhập', 'Đăng nhập', 31, '', '2024-04-01 08:21:26', '2024-04-01 08:21:26');
INSERT INTO `sys_logs` VALUES (1325, 'AITypeOfCourses', 'Xoá', 31, 'Khóa học: 1', '2024-04-01 09:04:25', '2024-04-01 09:04:25');
INSERT INTO `sys_logs` VALUES (1326, 'AIOfficerInformations', 'Sửa', 31, 'Thông tin cán bộ, giáo viên: Thái Đình Cẩn', '2024-04-01 10:39:58', '2024-04-01 10:39:58');
INSERT INTO `sys_logs` VALUES (1327, 'AIOfficerWorkProcess', 'Sửa', 31, 'Quả trình công tác: Thái Đình Cẩn', '2024-04-01 10:43:20', '2024-04-01 10:43:20');
INSERT INTO `sys_logs` VALUES (1328, 'Đăng nhập', 'Đăng nhập', 31, '', '2024-04-01 13:23:49', '2024-04-01 13:23:49');
INSERT INTO `sys_logs` VALUES (1329, 'Đăng nhập', 'Đăng nhập', 31, '', '2024-04-08 15:03:33', '2024-04-08 15:03:33');
INSERT INTO `sys_logs` VALUES (1330, 'Đăng nhập', 'Đăng nhập', 31, '', '2024-04-09 08:09:06', '2024-04-09 08:09:06');
INSERT INTO `sys_logs` VALUES (1331, 'AITrainingSpecialties', 'Sửa', 31, 'Khóa học: Chăn nuôi bò', '2024-04-09 08:26:01', '2024-04-09 08:26:01');
INSERT INTO `sys_logs` VALUES (1332, 'Đăng nhập', 'Đăng nhập', 31, '', '2024-04-09 13:55:08', '2024-04-09 13:55:08');
INSERT INTO `sys_logs` VALUES (1333, 'Đăng nhập', 'Đăng nhập', 31, '', '2024-04-11 13:10:49', '2024-04-11 13:10:49');
INSERT INTO `sys_logs` VALUES (1334, 'AITypeOfCourses', 'Thêm', 31, 'Khóa học: 11', '2024-04-11 13:21:42', '2024-04-11 13:21:42');
INSERT INTO `sys_logs` VALUES (1335, 'AIManageStudents', 'Thêm', 31, 'Thông tin học viên: Tăng Thị Chial', '2024-04-11 13:24:45', '2024-04-11 13:24:45');
INSERT INTO `sys_logs` VALUES (1336, 'AIManageStudents', 'Thêm', 31, 'Thông tin học viên: Lý Thị Khánh Dư', '2024-04-11 13:25:58', '2024-04-11 13:25:58');
INSERT INTO `sys_logs` VALUES (1337, 'AIOfficerInformations', 'Thêm', 31, 'Thông tin cán bộ, giáo viên: Dương Tất Vũ Hiệp', '2024-04-11 13:28:28', '2024-04-11 13:28:28');
INSERT INTO `sys_logs` VALUES (1338, 'AITrainingSpecialties', 'Xoá', 31, 'Khóa học: test', '2024-04-11 13:40:19', '2024-04-11 13:40:19');
INSERT INTO `sys_logs` VALUES (1339, 'Đăng nhập', 'Đăng nhập', 31, '', '2024-04-17 13:39:10', '2024-04-17 13:39:10');
INSERT INTO `sys_logs` VALUES (1340, 'Đăng nhập', 'Đăng nhập', 31, '', '2024-04-24 08:07:35', '2024-04-24 08:07:35');
INSERT INTO `sys_logs` VALUES (1341, 'Đăng nhập', 'Đăng nhập', 31, '', '2024-04-25 07:40:37', '2024-04-25 07:40:37');
INSERT INTO `sys_logs` VALUES (1342, 'Đăng nhập', 'Đăng nhập', 31, '', '2024-04-25 14:26:25', '2024-04-25 14:26:25');
INSERT INTO `sys_logs` VALUES (1343, 'Đăng nhập', 'Đăng nhập', 31, '', '2024-05-07 09:06:40', '2024-05-07 09:06:40');
INSERT INTO `sys_logs` VALUES (1344, 'Đăng nhập', 'Đăng nhập', 31, '', '2024-05-07 09:06:56', '2024-05-07 09:06:56');
INSERT INTO `sys_logs` VALUES (1345, 'AIVocationalEducationPolicities', 'Thêm', 31, 'Chính sách: Thoát nghèo dưới 36 tháng', '2024-05-07 09:07:51', '2024-05-07 09:07:51');
INSERT INTO `sys_logs` VALUES (1346, 'AITypeOfCourses', 'Thêm', 31, 'Khóa học: 11', '2024-05-07 09:14:29', '2024-05-07 09:14:29');
INSERT INTO `sys_logs` VALUES (1347, 'AIManageStudents', 'Thêm', 31, 'Thông tin học viên: Tăng Thị Chial', '2024-05-07 09:20:04', '2024-05-07 09:20:04');
INSERT INTO `sys_logs` VALUES (1348, 'Đăng nhập', 'Đăng nhập', 31, '', '2024-05-07 09:38:07', '2024-05-07 09:38:07');
INSERT INTO `sys_logs` VALUES (1349, 'Đăng nhập', 'Đăng nhập', 31, '', '2024-05-07 09:44:18', '2024-05-07 09:44:18');
INSERT INTO `sys_logs` VALUES (1350, 'Đăng nhập', 'Đăng nhập', 31, '', '2024-05-07 09:44:40', '2024-05-07 09:44:40');
INSERT INTO `sys_logs` VALUES (1351, 'Đăng nhập', 'Đăng nhập', 31, '', '2024-05-07 09:51:17', '2024-05-07 09:51:17');
INSERT INTO `sys_logs` VALUES (1352, 'AIVocationalEducationPolicities', 'Xoá', 31, 'Chính sách: Cận nghèo', '2024-05-07 09:52:32', '2024-05-07 09:52:32');
INSERT INTO `sys_logs` VALUES (1353, 'AITypeOfCourses', 'Sửa', 31, 'Khóa học: 1', '2024-05-07 10:05:31', '2024-05-07 10:05:31');
INSERT INTO `sys_logs` VALUES (1354, 'AITypeOfCourses', 'Thêm', 31, 'Khóa học: 1', '2024-05-07 10:10:43', '2024-05-07 10:10:43');
INSERT INTO `sys_logs` VALUES (1355, 'Đăng nhập', 'Đăng nhập', 31, '', '2024-05-07 10:37:53', '2024-05-07 10:37:53');
INSERT INTO `sys_logs` VALUES (1356, 'Đăng nhập', 'Đăng nhập', 31, '', '2024-05-07 13:10:28', '2024-05-07 13:10:28');
INSERT INTO `sys_logs` VALUES (1357, 'AITypeOfCourses', 'Sửa', 31, 'Khóa học: 11', '2024-05-07 13:14:05', '2024-05-07 13:14:05');
INSERT INTO `sys_logs` VALUES (1358, 'AIManageStudents', 'Sửa', 31, 'Thông tin học viên: Tăng Thị Chial', '2024-05-07 13:15:41', '2024-05-07 13:15:41');
INSERT INTO `sys_logs` VALUES (1359, 'AIManageStudents', 'Thêm', 31, 'Thông tin học viên: Lý Thị Khánh Dư', '2024-05-07 13:17:18', '2024-05-07 13:17:18');
INSERT INTO `sys_logs` VALUES (1360, 'AIManageStudents', 'Sửa', 31, 'Thông tin học viên: Lý Thị Khánh Dư', '2024-05-07 13:17:38', '2024-05-07 13:17:38');
INSERT INTO `sys_logs` VALUES (1361, 'Đăng nhập', 'Đăng nhập', 31, '', '2024-05-07 13:23:10', '2024-05-07 13:23:10');
INSERT INTO `sys_logs` VALUES (1362, 'AIManageStudents', 'Thêm', 31, 'Thông tin học viên: Lâm Thị Miên', '2024-05-07 13:24:49', '2024-05-07 13:24:49');
INSERT INTO `sys_logs` VALUES (1363, 'AIManageStudents', 'Thêm', 31, 'Thông tin học viên: Trần Thị Hồng Thúy', '2024-05-07 13:26:46', '2024-05-07 13:26:46');
INSERT INTO `sys_logs` VALUES (1364, 'AIManageStudents', 'Thêm', 31, 'Thông tin học viên: Huỳnh Thị Mộng', '2024-05-07 13:28:41', '2024-05-07 13:28:41');
INSERT INTO `sys_logs` VALUES (1365, 'AIManageStudents', 'Thêm', 31, 'Thông tin học viên: Ngô Thị Thúy Oanh', '2024-05-07 13:30:18', '2024-05-07 13:30:18');
INSERT INTO `sys_logs` VALUES (1366, 'AIManageStudents', 'Sửa', 31, 'Thông tin học viên: Huỳnh Thị Mộng', '2024-05-07 13:30:27', '2024-05-07 13:30:27');
INSERT INTO `sys_logs` VALUES (1367, 'AIManageStudents', 'Sửa', 31, 'Thông tin học viên: Ngô Thị Thúy Oanh', '2024-05-07 13:30:35', '2024-05-07 13:30:35');
INSERT INTO `sys_logs` VALUES (1368, 'AIManageStudents', 'Thêm', 31, 'Thông tin học viên: Thạch Thị Mỹ Nhung', '2024-05-07 13:32:16', '2024-05-07 13:32:16');
INSERT INTO `sys_logs` VALUES (1369, 'AIManageStudents', 'Thêm', 31, 'Thông tin học viên: Lý Thị Thu Thảo', '2024-05-07 13:34:18', '2024-05-07 13:34:18');
INSERT INTO `sys_logs` VALUES (1370, 'AIManageStudents', 'Sửa', 31, 'Thông tin học viên: Thạch Thị Mỹ Nhung', '2024-05-07 13:39:44', '2024-05-07 13:39:44');
INSERT INTO `sys_logs` VALUES (1371, 'AIManageStudents', 'Thêm', 31, 'Thông tin học viên: Nguyễn Thị Thu Trang', '2024-05-07 13:41:36', '2024-05-07 13:41:36');
INSERT INTO `sys_logs` VALUES (1372, 'AIManageStudents', 'Thêm', 31, 'Thông tin học viên: Kim Tuấn', '2024-05-07 13:43:04', '2024-05-07 13:43:04');
INSERT INTO `sys_logs` VALUES (1373, 'AIManageStudents', 'Thêm', 31, 'Thông tin học viên: Nguyễn Văn Giang', '2024-05-07 13:44:52', '2024-05-07 13:44:52');
INSERT INTO `sys_logs` VALUES (1374, 'AIManageStudents', 'Thêm', 31, 'Thông tin học viên: Thạch Phương', '2024-05-07 13:46:39', '2024-05-07 13:46:39');
INSERT INTO `sys_logs` VALUES (1375, 'AIManageStudents', 'Thêm', 31, 'Thông tin học viên: Ngô Văn Hiếu', '2024-05-07 13:48:24', '2024-05-07 13:48:24');
INSERT INTO `sys_logs` VALUES (1376, 'AIManageStudents', 'Thêm', 31, 'Thông tin học viên: Thạch Minh Dũng', '2024-05-07 13:50:12', '2024-05-07 13:50:12');
INSERT INTO `sys_logs` VALUES (1377, 'AIManageStudents', 'Thêm', 31, 'Thông tin học viên: Huỳnh Văn Hùng', '2024-05-07 13:52:09', '2024-05-07 13:52:09');
INSERT INTO `sys_logs` VALUES (1378, 'AIManageStudents', 'Sửa', 31, 'Thông tin học viên: Ngô Văn Hiếu', '2024-05-07 13:52:33', '2024-05-07 13:52:33');
INSERT INTO `sys_logs` VALUES (1379, 'Đăng nhập', 'Đăng nhập', 31, '', '2024-05-07 14:04:26', '2024-05-07 14:04:26');
INSERT INTO `sys_logs` VALUES (1380, 'AIManageStudents', 'Thêm', 31, 'Thông tin học viên: Lâm Minh Tú', '2024-05-07 14:08:33', '2024-05-07 14:08:33');
INSERT INTO `sys_logs` VALUES (1381, 'AIManageStudents', 'Thêm', 31, 'Thông tin học viên: Lâm Thiện', '2024-05-07 14:10:08', '2024-05-07 14:10:08');
INSERT INTO `sys_logs` VALUES (1382, 'AIManageStudents', 'Thêm', 31, 'Thông tin học viên: Thạch Sọnh', '2024-05-07 14:14:08', '2024-05-07 14:14:08');
INSERT INTO `sys_logs` VALUES (1383, 'Đăng nhập', 'Đăng nhập', 31, '', '2024-05-07 14:16:31', '2024-05-07 14:16:31');
INSERT INTO `sys_logs` VALUES (1384, 'AIManageStudents', 'Sửa', 31, 'Thông tin học viên: Tăng Thị Chial', '2024-05-07 14:21:21', '2024-05-07 14:21:21');
INSERT INTO `sys_logs` VALUES (1385, 'Đăng nhập', 'Đăng nhập', 31, '', '2024-05-07 15:26:14', '2024-05-07 15:26:14');
INSERT INTO `sys_logs` VALUES (1386, 'Đăng nhập', 'Đăng nhập', 31, '', '2024-05-08 07:19:47', '2024-05-08 07:19:47');
INSERT INTO `sys_logs` VALUES (1387, 'Đăng nhập', 'Đăng nhập', 31, '', '2024-05-08 08:29:49', '2024-05-08 08:29:49');
INSERT INTO `sys_logs` VALUES (1388, 'Đăng nhập', 'Đăng nhập', 31, '', '2024-05-08 15:27:46', '2024-05-08 15:27:46');
INSERT INTO `sys_logs` VALUES (1389, 'Đăng nhập', 'Đăng nhập', 31, '', '2024-05-09 10:06:41', '2024-05-09 10:06:41');
INSERT INTO `sys_logs` VALUES (1390, 'Đăng nhập', 'Đăng nhập', 31, '', '2024-05-12 13:28:12', '2024-05-12 13:28:12');
INSERT INTO `sys_logs` VALUES (1391, 'Đăng nhập', 'Đăng nhập', 31, '', '2024-05-13 09:03:37', '2024-05-13 09:03:37');
INSERT INTO `sys_logs` VALUES (1392, 'Đăng nhập', 'Đăng nhập', 31, '', '2024-05-15 08:55:02', '2024-05-15 08:55:02');
INSERT INTO `sys_logs` VALUES (1393, 'Đăng nhập', 'Đăng nhập', 31, '', '2024-05-15 08:55:35', '2024-05-15 08:55:35');
INSERT INTO `sys_logs` VALUES (1394, 'Đăng nhập', 'Đăng nhập', 31, '', '2024-05-15 08:56:17', '2024-05-15 08:56:17');
INSERT INTO `sys_logs` VALUES (1395, 'AITypeOfCourses', 'Sửa', 31, 'Khóa học: 1', '2024-05-15 08:57:27', '2024-05-15 08:57:27');
INSERT INTO `sys_logs` VALUES (1396, 'AITypeOfCourses', 'Thêm', 31, 'Khóa học: 1', '2024-05-15 08:59:39', '2024-05-15 08:59:39');
INSERT INTO `sys_logs` VALUES (1397, 'AIManageStudents', 'Thêm', 31, 'Thông tin học viên: Lý Thị Bé Ngọc', '2024-05-15 09:37:17', '2024-05-15 09:37:17');
INSERT INTO `sys_logs` VALUES (1398, 'AIManageStudents', 'Thêm', 31, 'Thông tin học viên: Đinh Thị Sà Lượl', '2024-05-15 09:39:40', '2024-05-15 09:39:40');
INSERT INTO `sys_logs` VALUES (1399, 'AIManageStudents', 'Thêm', 31, 'Thông tin học viên: Thạch Thị Ngọc Ái', '2024-05-15 09:41:18', '2024-05-15 09:41:18');
INSERT INTO `sys_logs` VALUES (1400, 'AIManageStudents', 'Thêm', 31, 'Thông tin học viên: Lâm Thị Phương Thì', '2024-05-15 09:43:37', '2024-05-15 09:43:37');
INSERT INTO `sys_logs` VALUES (1401, 'AIManageStudents', 'Thêm', 31, 'Thông tin học viên: Lý Thị Pu', '2024-05-15 09:45:04', '2024-05-15 09:45:04');
INSERT INTO `sys_logs` VALUES (1402, 'AIManageStudents', 'Thêm', 31, 'Thông tin học viên: Trần Thị Huỳnh Như', '2024-05-15 09:49:07', '2024-05-15 09:49:07');
INSERT INTO `sys_logs` VALUES (1403, 'AIManageStudents', 'Thêm', 31, 'Thông tin học viên: Hàng Thị Mỹ Liễu', '2024-05-15 09:52:24', '2024-05-15 09:52:24');
INSERT INTO `sys_logs` VALUES (1404, 'AIManageStudents', 'Thêm', 31, 'Thông tin học viên: Lưu Thị Kim Thoa', '2024-05-15 09:54:16', '2024-05-15 09:54:16');
INSERT INTO `sys_logs` VALUES (1405, 'AIManageStudents', 'Thêm', 31, 'Thông tin học viên: Lý Thị Thảo', '2024-05-15 09:56:58', '2024-05-15 09:56:58');
INSERT INTO `sys_logs` VALUES (1406, 'AIManageStudents', 'Thêm', 31, 'Thông tin học viên: Sơn Thị Diễm', '2024-05-15 09:59:41', '2024-05-15 09:59:41');
INSERT INTO `sys_logs` VALUES (1407, 'AIManageStudents', 'Thêm', 31, 'Thông tin học viên: Danh Thị Thanh Tài', '2024-05-15 10:01:05', '2024-05-15 10:01:05');
INSERT INTO `sys_logs` VALUES (1408, 'AIManageStudents', 'Thêm', 31, 'Thông tin học viên: Liêng Diễm Trinh', '2024-05-15 10:02:38', '2024-05-15 10:02:38');
INSERT INTO `sys_logs` VALUES (1409, 'AIManageStudents', 'Thêm', 31, 'Thông tin học viên: Triệu Thị Kim Cúc', '2024-05-15 10:05:26', '2024-05-15 10:05:26');
INSERT INTO `sys_logs` VALUES (1410, 'AIManageStudents', 'Thêm', 31, 'Thông tin học viên: Triệu Kiều Phương', '2024-05-15 10:06:46', '2024-05-15 10:06:46');
INSERT INTO `sys_logs` VALUES (1411, 'AIManageStudents', 'Thêm', 31, 'Thông tin học viên: Đào Thanh Thuý', '2024-05-15 10:08:13', '2024-05-15 10:08:13');
INSERT INTO `sys_logs` VALUES (1412, 'AIManageStudents', 'Thêm', 31, 'Thông tin học viên: Dương Thị Giàu', '2024-05-15 10:11:57', '2024-05-15 10:11:57');
INSERT INTO `sys_logs` VALUES (1413, 'Đăng nhập', 'Đăng nhập', 31, '', '2024-05-15 10:37:22', '2024-05-15 10:37:22');
INSERT INTO `sys_logs` VALUES (1414, 'Đăng nhập', 'Đăng nhập', 31, '', '2024-05-16 08:25:35', '2024-05-16 08:25:35');
INSERT INTO `sys_logs` VALUES (1415, 'Đăng nhập', 'Đăng nhập', 31, '', '2024-05-16 08:32:20', '2024-05-16 08:32:20');
INSERT INTO `sys_logs` VALUES (1416, 'Đăng nhập', 'Đăng nhập', 31, '', '2024-05-16 08:36:06', '2024-05-16 08:36:06');
INSERT INTO `sys_logs` VALUES (1417, 'Đăng nhập', 'Đăng nhập', 31, '', '2024-05-16 15:49:40', '2024-05-16 15:49:40');
INSERT INTO `sys_logs` VALUES (1418, 'Đăng nhập', 'Đăng nhập', 31, '', '2024-05-16 15:53:52', '2024-05-16 15:53:52');
INSERT INTO `sys_logs` VALUES (1419, 'Đăng nhập', 'Đăng nhập', 31, '', '2024-05-17 07:57:33', '2024-05-17 07:57:33');
INSERT INTO `sys_logs` VALUES (1420, 'Đăng nhập', 'Đăng nhập', 31, '', '2024-05-17 10:03:34', '2024-05-17 10:03:34');
INSERT INTO `sys_logs` VALUES (1421, 'Đăng nhập', 'Đăng nhập', 31, '', '2024-05-17 10:06:40', '2024-05-17 10:06:40');
INSERT INTO `sys_logs` VALUES (1422, 'Đăng nhập', 'Đăng nhập', 31, '', '2024-05-20 08:40:43', '2024-05-20 08:40:43');
INSERT INTO `sys_logs` VALUES (1423, 'AIManageStudents', 'Sửa', 31, 'Thông tin học viên: Đào Thị Simonne', '2024-05-20 08:42:47', '2024-05-20 08:42:47');
INSERT INTO `sys_logs` VALUES (1424, 'AIManageStudents', 'Sửa', 31, 'Thông tin học viên: Lý Thị Bé Ngọc', '2024-05-20 08:46:56', '2024-05-20 08:46:56');
INSERT INTO `sys_logs` VALUES (1425, 'AITypeOfCourses', 'Sửa', 31, 'Khóa học: 1', '2024-05-20 08:47:46', '2024-05-20 08:47:46');
INSERT INTO `sys_logs` VALUES (1426, 'AIManageStudents', 'Thêm', 31, 'Thông tin học viên: Trịnh Thanh Tường', '2024-05-20 08:51:14', '2024-05-20 08:51:14');
INSERT INTO `sys_logs` VALUES (1427, 'AIManageStudents', 'Thêm', 31, 'Thông tin học viên: Liêu Huỳnh Nghi', '2024-05-20 08:52:33', '2024-05-20 08:52:33');
INSERT INTO `sys_logs` VALUES (1428, 'AIManageStudents', 'Thêm', 31, 'Thông tin học viên: Liêu Lâm Hoài', '2024-05-20 08:53:41', '2024-05-20 08:53:41');
INSERT INTO `sys_logs` VALUES (1429, 'AIManageStudents', 'Thêm', 31, 'Thông tin học viên: Dương Văn Đường', '2024-05-20 08:55:59', '2024-05-20 08:55:59');
INSERT INTO `sys_logs` VALUES (1430, 'AIManageStudents', 'Thêm', 31, 'Thông tin học viên: Lâm Ali', '2024-05-20 08:57:45', '2024-05-20 08:57:45');
INSERT INTO `sys_logs` VALUES (1431, 'AIManageStudents', 'Thêm', 31, 'Thông tin học viên: Danh Út Tài', '2024-05-20 08:59:20', '2024-05-20 08:59:20');
INSERT INTO `sys_logs` VALUES (1432, 'AIManageStudents', 'Thêm', 31, 'Thông tin học viên: Lý Phi Rinh', '2024-05-20 09:00:14', '2024-05-20 09:00:14');
INSERT INTO `sys_logs` VALUES (1433, 'AIManageStudents', 'Sửa', 31, 'Thông tin học viên: Lý Phi Rinh', '2024-05-20 09:01:13', '2024-05-20 09:01:13');
INSERT INTO `sys_logs` VALUES (1434, 'AIManageStudents', 'Thêm', 31, 'Thông tin học viên: Lâm Sà Rinh', '2024-05-20 09:02:41', '2024-05-20 09:02:41');
INSERT INTO `sys_logs` VALUES (1435, 'AIManageStudents', 'Thêm', 31, 'Thông tin học viên: Lâm Hùng', '2024-05-20 09:03:55', '2024-05-20 09:03:55');
INSERT INTO `sys_logs` VALUES (1436, 'AIManageStudents', 'Thêm', 31, 'Thông tin học viên: Trịnh Thanh Tâm', '2024-05-20 09:05:12', '2024-05-20 09:05:12');
INSERT INTO `sys_logs` VALUES (1437, 'AIManageStudents', 'Thêm', 31, 'Thông tin học viên: Trần Giang', '2024-05-20 09:08:45', '2024-05-20 09:08:45');
INSERT INTO `sys_logs` VALUES (1438, 'AIManageStudents', 'Thêm', 31, 'Thông tin học viên: Kim Minh Đạo', '2024-05-20 09:10:03', '2024-05-20 09:10:03');
INSERT INTO `sys_logs` VALUES (1439, 'AIManageStudents', 'Thêm', 31, 'Thông tin học viên: Thạch Chươl', '2024-05-20 09:11:55', '2024-05-20 09:11:55');
INSERT INTO `sys_logs` VALUES (1440, 'AIManageStudents', 'Thêm', 31, 'Thông tin học viên: La Hoàng Anh', '2024-05-20 09:13:04', '2024-05-20 09:13:04');
INSERT INTO `sys_logs` VALUES (1441, 'AIManageStudents', 'Thêm', 31, 'Thông tin học viên: Trần Thuỷ', '2024-05-20 09:15:39', '2024-05-20 09:15:39');
INSERT INTO `sys_logs` VALUES (1442, 'AIManageStudents', 'Sửa', 31, 'Thông tin học viên: Lâm Lai', '2024-05-20 09:18:37', '2024-05-20 09:18:37');
INSERT INTO `sys_logs` VALUES (1443, 'AIManageStudents', 'Thêm', 31, 'Thông tin học viên: Lâm Hùng 2', '2024-05-20 09:24:29', '2024-05-20 09:24:29');
INSERT INTO `sys_logs` VALUES (1444, 'AIManageStudents', 'Thêm', 31, 'Thông tin học viên: Dương Khe', '2024-05-20 09:26:22', '2024-05-20 09:26:22');
INSERT INTO `sys_logs` VALUES (1445, 'AIManageStudents', 'Thêm', 31, 'Thông tin học viên: Lý Đơ', '2024-05-20 09:27:36', '2024-05-20 09:27:36');
INSERT INTO `sys_logs` VALUES (1446, 'AIManageStudents', 'Sửa', 31, 'Thông tin học viên: Đào Thị Simonne', '2024-05-20 09:37:30', '2024-05-20 09:37:30');
INSERT INTO `sys_logs` VALUES (1447, 'Đăng nhập', 'Đăng nhập', 31, '', '2024-05-20 13:36:46', '2024-05-20 13:36:46');
INSERT INTO `sys_logs` VALUES (1448, 'Đăng nhập', 'Đăng nhập', 31, '', '2024-05-20 13:58:22', '2024-05-20 13:58:22');
INSERT INTO `sys_logs` VALUES (1449, 'Đăng nhập', 'Đăng nhập', 31, '', '2024-05-20 14:11:34', '2024-05-20 14:11:34');
INSERT INTO `sys_logs` VALUES (1450, 'Đăng nhập', 'Đăng nhập', 31, '', '2024-05-20 14:11:48', '2024-05-20 14:11:48');
INSERT INTO `sys_logs` VALUES (1451, 'Đăng nhập', 'Đăng nhập', 31, '', '2024-05-20 14:16:06', '2024-05-20 14:16:06');
INSERT INTO `sys_logs` VALUES (1452, 'AIManageStudents', 'Xoá', 31, 'Thông tin học viên: Đào Thanh Thuý', '2024-05-20 14:23:15', '2024-05-20 14:23:15');
INSERT INTO `sys_logs` VALUES (1453, 'Đăng nhập', 'Đăng nhập', 31, '', '2024-05-22 15:26:07', '2024-05-22 15:26:07');
INSERT INTO `sys_logs` VALUES (1454, 'Đăng nhập', 'Đăng nhập', 31, '', '2024-05-28 08:59:11', '2024-05-28 08:59:11');
INSERT INTO `sys_logs` VALUES (1455, 'Đăng nhập', 'Đăng nhập', 31, '', '2024-05-28 10:08:59', '2024-05-28 10:08:59');
INSERT INTO `sys_logs` VALUES (1456, 'Đăng nhập', 'Đăng nhập', 31, '', '2024-05-28 14:18:48', '2024-05-28 14:18:48');
INSERT INTO `sys_logs` VALUES (1457, 'Đăng nhập', 'Đăng nhập', 31, '', '2024-05-28 14:21:56', '2024-05-28 14:21:56');
INSERT INTO `sys_logs` VALUES (1458, 'AITypeOfCourses', 'Sửa', 31, 'Khóa học: 2', '2024-05-28 14:50:03', '2024-05-28 14:50:03');
INSERT INTO `sys_logs` VALUES (1459, 'AITypeOfCourses', 'Sửa', 31, 'Khóa học: 1', '2024-05-28 14:50:32', '2024-05-28 14:50:32');
INSERT INTO `sys_logs` VALUES (1460, 'AITypeOfCourses', 'Thêm', 31, 'Khóa học: 2', '2024-05-28 14:50:25', '2024-05-28 14:50:25');
INSERT INTO `sys_logs` VALUES (1461, 'AIManageStudents', 'Thêm', 31, 'Thông tin học viên: Thạch Thùy Liên Như', '2024-05-28 14:56:28', '2024-05-28 14:56:28');
INSERT INTO `sys_logs` VALUES (1462, 'AIManageStudents', 'Thêm', 31, 'Thông tin học viên: Thạch Thị Thảo', '2024-05-28 15:02:40', '2024-05-28 15:02:40');
INSERT INTO `sys_logs` VALUES (1463, 'AIManageStudents', 'Thêm', 31, 'Thông tin học viên: Lý Thị Nhân', '2024-05-28 15:08:31', '2024-05-28 15:08:31');
INSERT INTO `sys_logs` VALUES (1464, 'AIManageStudents', 'Sửa', 31, 'Thông tin học viên: Thạch Thùy Liên Như', '2024-05-28 15:08:52', '2024-05-28 15:08:52');
INSERT INTO `sys_logs` VALUES (1465, 'AIManageStudents', 'Sửa', 31, 'Thông tin học viên: Thạch Thị Thảo', '2024-05-28 15:09:25', '2024-05-28 15:09:25');
INSERT INTO `sys_logs` VALUES (1466, 'AIManageStudents', 'Sửa', 31, 'Thông tin học viên: Lý Thị Nhân', '2024-05-28 15:10:06', '2024-05-28 15:10:06');
INSERT INTO `sys_logs` VALUES (1467, 'AIManageStudents', 'Thêm', 31, 'Thông tin học viên: Đào Thị Dung', '2024-05-28 15:11:48', '2024-05-28 15:11:48');
INSERT INTO `sys_logs` VALUES (1468, 'AIManageStudents', 'Thêm', 31, 'Thông tin học viên: Phạm Thị Ngọc Huyền', '2024-05-28 15:15:35', '2024-05-28 15:15:35');
INSERT INTO `sys_logs` VALUES (1469, 'AIManageStudents', 'Thêm', 31, 'Thông tin học viên: Trương Thị Ngọc Mai', '2024-05-28 15:24:00', '2024-05-28 15:24:00');
INSERT INTO `sys_logs` VALUES (1470, 'AIManageStudents', 'Thêm', 31, 'Thông tin học viên: Ngô Thanh Tuyền', '2024-05-28 15:25:38', '2024-05-28 15:25:38');
INSERT INTO `sys_logs` VALUES (1471, 'AIManageStudents', 'Thêm', 31, 'Thông tin học viên: Lâm Thúy Vy', '2024-05-28 15:28:55', '2024-05-28 15:28:55');
INSERT INTO `sys_logs` VALUES (1472, 'AIManageStudents', 'Thêm', 31, 'Thông tin học viên: Lâm Thị Diệu', '2024-05-28 15:30:52', '2024-05-28 15:30:52');
INSERT INTO `sys_logs` VALUES (1473, 'AIManageStudents', 'Thêm', 31, 'Thông tin học viên: Sơn Thị Ngọc Kiều', '2024-05-28 15:35:04', '2024-05-28 15:35:04');
INSERT INTO `sys_logs` VALUES (1474, 'AIManageStudents', 'Thêm', 31, 'Thông tin học viên: Huỳnh Bích Vân', '2024-05-28 15:37:06', '2024-05-28 15:37:06');
INSERT INTO `sys_logs` VALUES (1475, 'AIManageStudents', 'Thêm', 31, 'Thông tin học viên: Thạch Thị Mỹ Dung', '2024-05-28 15:38:49', '2024-05-28 15:38:49');
INSERT INTO `sys_logs` VALUES (1476, 'AIManageStudents', 'Thêm', 31, 'Thông tin học viên: Lâm Tâm Như', '2024-05-28 15:48:07', '2024-05-28 15:48:07');
INSERT INTO `sys_logs` VALUES (1477, 'AIManageStudents', 'Thêm', 31, 'Thông tin học viên: Lâm Ngọc Mai', '2024-05-28 16:06:21', '2024-05-28 16:06:21');
INSERT INTO `sys_logs` VALUES (1478, 'AIManageStudents', 'Thêm', 31, 'Thông tin học viên: Trần Thị Bích Phượng', '2024-05-28 16:09:53', '2024-05-28 16:09:53');
INSERT INTO `sys_logs` VALUES (1479, 'AIManageStudents', 'Thêm', 31, 'Thông tin học viên: Huỳnh Quốc Phong', '2024-05-28 16:12:51', '2024-05-28 16:12:51');
INSERT INTO `sys_logs` VALUES (1480, 'AIManageStudents', 'Thêm', 31, 'Thông tin học viên: Danh Hiền', '2024-05-28 16:14:33', '2024-05-28 16:14:33');
INSERT INTO `sys_logs` VALUES (1481, 'AIManageStudents', 'Thêm', 31, 'Thông tin học viên: Nguyễn La Hoài Nam', '2024-05-28 16:16:00', '2024-05-28 16:16:00');
INSERT INTO `sys_logs` VALUES (1482, 'Đăng nhập', 'Đăng nhập', 31, '', '2024-05-29 08:14:15', '2024-05-29 08:14:15');
INSERT INTO `sys_logs` VALUES (1483, 'Đăng nhập', 'Đăng nhập', 31, '', '2024-05-29 10:17:01', '2024-05-29 10:17:01');
INSERT INTO `sys_logs` VALUES (1484, 'Đăng nhập', 'Đăng nhập', 31, '', '2024-05-29 13:36:06', '2024-05-29 13:36:06');

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
) ENGINE = InnoDB AUTO_INCREMENT = 76 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = COMPACT;

-- ----------------------------
-- Records of sys_module_permissions_according_to_users
-- ----------------------------
INSERT INTO `sys_module_permissions_according_to_users` VALUES (1, 1, '', '');
INSERT INTO `sys_module_permissions_according_to_users` VALUES (64, 2, '74,53,54,55,56,57,58,59,61,62,63,65,70,66,67,68,69,72,73,97,76,78,80,81,82,83,85,86,52,87,93,94,95,96', 'view');
INSERT INTO `sys_module_permissions_according_to_users` VALUES (65, 2, '74,53,54,55,56,57,58,59,61,62,63,65,70,66,67,68,69,72,73,97,76,78,80,81,82,83,85,86,52,87,93,94,95,96', 'add');
INSERT INTO `sys_module_permissions_according_to_users` VALUES (66, 2, '74,53,54,55,56,57,58,59,61,62,63,65,70,66,67,68,69,72,73,97,76,78,80,81,82,83,85,86,52,87,93,94,95,96', 'edit');
INSERT INTO `sys_module_permissions_according_to_users` VALUES (67, 2, '74,53,54,55,56,57,58,59,61,62,63,65,70,66,67,68,69,72,73,97,76,78,80,81,82,83,85,86,52,87,93,94,95,96', 'delete');
INSERT INTO `sys_module_permissions_according_to_users` VALUES (68, 31, '53,74,54,55,56,57,58,59,61,62,63,65,70,66,67,68,69,72,73,97,76,81,82,85,86,52,94', 'view');
INSERT INTO `sys_module_permissions_according_to_users` VALUES (69, 31, '53,74,54,55,56,57,58,59,61,62,63,65,70,66,67,68,69,72,73,97,76,81,82,85,86,52,94', 'add');
INSERT INTO `sys_module_permissions_according_to_users` VALUES (70, 31, '53,74,54,55,56,57,58,59,61,62,63,65,70,66,67,68,69,72,73,97,76,81,82,85,86,52,94', 'edit');
INSERT INTO `sys_module_permissions_according_to_users` VALUES (71, 31, '53,74,54,55,56,57,58,59,61,62,63,65,70,66,67,68,69,72,73,97,76,81,82,85,86,52,94', 'delete');
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
) ENGINE = InnoDB AUTO_INCREMENT = 26 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = COMPACT;

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
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = COMPACT;

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
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = COMPACT;

-- ----------------------------
-- Records of sys_website_information
-- ----------------------------
INSERT INTO `sys_website_information` VALUES (1, 'Tên doanh nghiệp:', 'Địa chỉ: *', '/upload/mainstructure/logo/VNPT_Logo.svg.png', 'Số điện thoại:', 'Fax', 'Email:', 'Hotline:', 'Mã số doanh nghiệp:', 'linear-gradient(45deg, #ffbd00, #ff3800)', '#d06800', '#d06800', 'red', 'red', 'Tiêu đề (meta_title):', 'sda', 'keywords', 'author', 'country', NULL, NULL, NULL, NULL, NULL);

SET FOREIGN_KEY_CHECKS = 1;
