-- --------------------------------------------------------
-- Servidor:                     127.0.0.1
-- Versão do servidor:           9.1.0 - MySQL Community Server - GPL
-- OS do Servidor:               Win64
-- HeidiSQL Versão:              12.8.0.6908
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


-- Copiando estrutura do banco de dados para database
CREATE DATABASE IF NOT EXISTS `database` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `database`;

-- Copiando estrutura para tabela database.accounts_group
CREATE TABLE IF NOT EXISTS `accounts_group` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `name` varchar(85) NOT NULL,
  `enterprise_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `accounts_group_enterprise_id_92f8118d_fk_companies_enterprise_id` (`enterprise_id`),
  CONSTRAINT `accounts_group_enterprise_id_92f8118d_fk_companies_enterprise_id` FOREIGN KEY (`enterprise_id`) REFERENCES `companies_enterprise` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Copiando dados para a tabela database.accounts_group: ~1 rows (aproximadamente)
INSERT INTO `accounts_group` (`id`, `name`, `enterprise_id`) VALUES
	(2, 'Estágiario', 1);

-- Copiando estrutura para tabela database.accounts_group_permissions
CREATE TABLE IF NOT EXISTS `accounts_group_permissions` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `group_id` bigint NOT NULL,
  `permission_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `accounts_group_permi_group_id_1894559e_fk_accounts_` (`group_id`),
  KEY `accounts_group_permi_permission_id_8baf0f0b_fk_auth_perm` (`permission_id`),
  CONSTRAINT `accounts_group_permi_group_id_1894559e_fk_accounts_` FOREIGN KEY (`group_id`) REFERENCES `accounts_group` (`id`),
  CONSTRAINT `accounts_group_permi_permission_id_8baf0f0b_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=33 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Copiando dados para a tabela database.accounts_group_permissions: ~8 rows (aproximadamente)
INSERT INTO `accounts_group_permissions` (`id`, `group_id`, `permission_id`) VALUES
	(25, 2, 52),
	(26, 2, 51),
	(27, 2, 50),
	(28, 2, 49),
	(29, 2, 44),
	(30, 2, 43),
	(31, 2, 42),
	(32, 2, 41);

-- Copiando estrutura para tabela database.accounts_user
CREATE TABLE IF NOT EXISTS `accounts_user` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `name` varchar(150) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_owner` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `email` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Copiando dados para a tabela database.accounts_user: ~3 rows (aproximadamente)
INSERT INTO `accounts_user` (`id`, `password`, `last_login`, `name`, `email`, `is_owner`) VALUES
	(1, 'pbkdf2_sha256$600000$0ylYho3XLEpRVbpNsvlDh7$pABmjjcFML+BsWybtfp2YSrbrJt1vQ/t5Aj6pB+Q8Po=', NULL, 'Wilian', 'Wilian@gmail.com', 1),
	(2, 'pbkdf2_sha256$600000$YF1LwnePZjaU22vZIqjuzs$0TmpCqUok0VWuABn4viJ6KCUgv5ORKV1imqlMtElrVY=', NULL, 'Wilian', 'teste@gmail.com', 1),
	(4, 'pbkdf2_sha256$600000$Y0unxUV1fx36ypotohVuWY$ScNrFbqJ0Uxyj1GNPxVTfPsU4ybMIOoVsxvwEEiBYXU=', NULL, 'joao teste', 'joao@gmail.com', 0);

-- Copiando estrutura para tabela database.accounts_user_groups
CREATE TABLE IF NOT EXISTS `accounts_user_groups` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `group_id` bigint NOT NULL,
  `user_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `accounts_user_groups_group_id_bd11a704_fk_accounts_group_id` (`group_id`),
  KEY `accounts_user_groups_user_id_52b62117_fk_accounts_user_id` (`user_id`),
  CONSTRAINT `accounts_user_groups_group_id_bd11a704_fk_accounts_group_id` FOREIGN KEY (`group_id`) REFERENCES `accounts_group` (`id`),
  CONSTRAINT `accounts_user_groups_user_id_52b62117_fk_accounts_user_id` FOREIGN KEY (`user_id`) REFERENCES `accounts_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Copiando dados para a tabela database.accounts_user_groups: ~1 rows (aproximadamente)
INSERT INTO `accounts_user_groups` (`id`, `group_id`, `user_id`) VALUES
	(2, 2, 4);

-- Copiando estrutura para tabela database.auth_group
CREATE TABLE IF NOT EXISTS `auth_group` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(150) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Copiando dados para a tabela database.auth_group: ~0 rows (aproximadamente)

-- Copiando estrutura para tabela database.auth_group_permissions
CREATE TABLE IF NOT EXISTS `auth_group_permissions` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `group_id` int NOT NULL,
  `permission_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Copiando dados para a tabela database.auth_group_permissions: ~0 rows (aproximadamente)

-- Copiando estrutura para tabela database.auth_permission
CREATE TABLE IF NOT EXISTS `auth_permission` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `content_type_id` int NOT NULL,
  `codename` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`),
  CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=53 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Copiando dados para a tabela database.auth_permission: ~52 rows (aproximadamente)
INSERT INTO `auth_permission` (`id`, `name`, `content_type_id`, `codename`) VALUES
	(1, 'Can add log entry', 1, 'add_logentry'),
	(2, 'Can change log entry', 1, 'change_logentry'),
	(3, 'Can delete log entry', 1, 'delete_logentry'),
	(4, 'Can view log entry', 1, 'view_logentry'),
	(5, 'Can add permission', 2, 'add_permission'),
	(6, 'Can change permission', 2, 'change_permission'),
	(7, 'Can delete permission', 2, 'delete_permission'),
	(8, 'Can view permission', 2, 'view_permission'),
	(9, 'Can add group', 3, 'add_group'),
	(10, 'Can change group', 3, 'change_group'),
	(11, 'Can delete group', 3, 'delete_group'),
	(12, 'Can view group', 3, 'view_group'),
	(13, 'Can add content type', 4, 'add_contenttype'),
	(14, 'Can change content type', 4, 'change_contenttype'),
	(15, 'Can delete content type', 4, 'delete_contenttype'),
	(16, 'Can view content type', 4, 'view_contenttype'),
	(17, 'Can add session', 5, 'add_session'),
	(18, 'Can change session', 5, 'change_session'),
	(19, 'Can delete session', 5, 'delete_session'),
	(20, 'Can view session', 5, 'view_session'),
	(21, 'Can add user', 6, 'add_user'),
	(22, 'Can change user', 6, 'change_user'),
	(23, 'Can delete user', 6, 'delete_user'),
	(24, 'Can view user', 6, 'view_user'),
	(25, 'Can add group', 7, 'add_group'),
	(26, 'Can change group', 7, 'change_group'),
	(27, 'Can delete group', 7, 'delete_group'),
	(28, 'Can view group', 7, 'view_group'),
	(29, 'Can add user_ groups', 8, 'add_user_groups'),
	(30, 'Can change user_ groups', 8, 'change_user_groups'),
	(31, 'Can delete user_ groups', 8, 'delete_user_groups'),
	(32, 'Can view user_ groups', 8, 'view_user_groups'),
	(33, 'Can add group_ permissions', 9, 'add_group_permissions'),
	(34, 'Can change group_ permissions', 9, 'change_group_permissions'),
	(35, 'Can delete group_ permissions', 9, 'delete_group_permissions'),
	(36, 'Can view group_ permissions', 9, 'view_group_permissions'),
	(37, 'Can add enterprise', 10, 'add_enterprise'),
	(38, 'Can change enterprise', 10, 'change_enterprise'),
	(39, 'Can delete enterprise', 10, 'delete_enterprise'),
	(40, 'Can view enterprise', 10, 'view_enterprise'),
	(41, 'Can add employee', 11, 'add_employee'),
	(42, 'Can change employee', 11, 'change_employee'),
	(43, 'Can delete employee', 11, 'delete_employee'),
	(44, 'Can view employee', 11, 'view_employee'),
	(45, 'Can add task status', 12, 'add_taskstatus'),
	(46, 'Can change task status', 12, 'change_taskstatus'),
	(47, 'Can delete task status', 12, 'delete_taskstatus'),
	(48, 'Can view task status', 12, 'view_taskstatus'),
	(49, 'Can add task', 13, 'add_task'),
	(50, 'Can change task', 13, 'change_task'),
	(51, 'Can delete task', 13, 'delete_task'),
	(52, 'Can view task', 13, 'view_task');

-- Copiando estrutura para tabela database.companies_employee
CREATE TABLE IF NOT EXISTS `companies_employee` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `enterprise_id` bigint NOT NULL,
  `user_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `companies_employee_enterprise_id_25b6883d_fk_companies` (`enterprise_id`),
  KEY `companies_employee_user_id_16686186_fk_accounts_user_id` (`user_id`),
  CONSTRAINT `companies_employee_enterprise_id_25b6883d_fk_companies` FOREIGN KEY (`enterprise_id`) REFERENCES `companies_enterprise` (`id`),
  CONSTRAINT `companies_employee_user_id_16686186_fk_accounts_user_id` FOREIGN KEY (`user_id`) REFERENCES `accounts_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Copiando dados para a tabela database.companies_employee: ~1 rows (aproximadamente)
INSERT INTO `companies_employee` (`id`, `enterprise_id`, `user_id`) VALUES
	(2, 1, 4);

-- Copiando estrutura para tabela database.companies_enterprise
CREATE TABLE IF NOT EXISTS `companies_enterprise` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `name` varchar(175) NOT NULL,
  `user_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `companies_enterprise_user_id_45f94d34_fk_accounts_user_id` (`user_id`),
  CONSTRAINT `companies_enterprise_user_id_45f94d34_fk_accounts_user_id` FOREIGN KEY (`user_id`) REFERENCES `accounts_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Copiando dados para a tabela database.companies_enterprise: ~2 rows (aproximadamente)
INSERT INTO `companies_enterprise` (`id`, `name`, `user_id`) VALUES
	(1, 'Nome da empresa', 1),
	(2, 'Nome da empresa', 2);

-- Copiando estrutura para tabela database.companies_task
CREATE TABLE IF NOT EXISTS `companies_task` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `title` longtext NOT NULL,
  `description` longtext,
  `due_date` datetime(6) DEFAULT NULL,
  `created_at` datetime(6) NOT NULL,
  `updated_at` datetime(6) DEFAULT NULL,
  `employee_id` bigint NOT NULL,
  `enterprise_id` bigint NOT NULL,
  `status_id` bigint NOT NULL,
  `code` varchar(50) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `code` (`code`),
  KEY `companies_task_employee_id_5cb9ef8d_fk_companies_employee_id` (`employee_id`),
  KEY `companies_task_enterprise_id_ec1c4fc2_fk_companies_enterprise_id` (`enterprise_id`),
  KEY `companies_task_status_id_fe2247d8_fk_companies_task_status_id` (`status_id`),
  CONSTRAINT `companies_task_employee_id_5cb9ef8d_fk_companies_employee_id` FOREIGN KEY (`employee_id`) REFERENCES `companies_employee` (`id`),
  CONSTRAINT `companies_task_enterprise_id_ec1c4fc2_fk_companies_enterprise_id` FOREIGN KEY (`enterprise_id`) REFERENCES `companies_enterprise` (`id`),
  CONSTRAINT `companies_task_status_id_fe2247d8_fk_companies_task_status_id` FOREIGN KEY (`status_id`) REFERENCES `companies_task_status` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Copiando dados para a tabela database.companies_task: ~0 rows (aproximadamente)
INSERT INTO `companies_task` (`id`, `title`, `description`, `due_date`, `created_at`, `updated_at`, `employee_id`, `enterprise_id`, `status_id`, `code`) VALUES
	(2, 'dsfmghdfug', 'gkndklgadfhl', '2025-01-27 03:24:00.000000', '2025-01-18 01:19:29.338935', NULL, 2, 1, 1, 'sfgjhsdkjhgfs');

-- Copiando estrutura para tabela database.companies_task_status
CREATE TABLE IF NOT EXISTS `companies_task_status` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `name` varchar(155) NOT NULL,
  `codename` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Copiando dados para a tabela database.companies_task_status: ~0 rows (aproximadamente)
INSERT INTO `companies_task_status` (`id`, `name`, `codename`) VALUES
	(1, 'Não Iniciado', 'Not_Start'),
	(2, 'Em Andamento', 'In_process'),
	(3, 'Concluido', 'done');

-- Copiando estrutura para tabela database.django_admin_log
CREATE TABLE IF NOT EXISTS `django_admin_log` (
  `id` int NOT NULL AUTO_INCREMENT,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint unsigned NOT NULL,
  `change_message` longtext NOT NULL,
  `content_type_id` int DEFAULT NULL,
  `user_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  KEY `django_admin_log_user_id_c564eba6_fk_accounts_user_id` (`user_id`),
  CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `django_admin_log_user_id_c564eba6_fk_accounts_user_id` FOREIGN KEY (`user_id`) REFERENCES `accounts_user` (`id`),
  CONSTRAINT `django_admin_log_chk_1` CHECK ((`action_flag` >= 0))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Copiando dados para a tabela database.django_admin_log: ~0 rows (aproximadamente)

-- Copiando estrutura para tabela database.django_content_type
CREATE TABLE IF NOT EXISTS `django_content_type` (
  `id` int NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Copiando dados para a tabela database.django_content_type: ~13 rows (aproximadamente)
INSERT INTO `django_content_type` (`id`, `app_label`, `model`) VALUES
	(7, 'accounts', 'group'),
	(9, 'accounts', 'group_permissions'),
	(6, 'accounts', 'user'),
	(8, 'accounts', 'user_groups'),
	(1, 'admin', 'logentry'),
	(3, 'auth', 'group'),
	(2, 'auth', 'permission'),
	(11, 'companies', 'employee'),
	(10, 'companies', 'enterprise'),
	(13, 'companies', 'task'),
	(12, 'companies', 'taskstatus'),
	(4, 'contenttypes', 'contenttype'),
	(5, 'sessions', 'session');

-- Copiando estrutura para tabela database.django_migrations
CREATE TABLE IF NOT EXISTS `django_migrations` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Copiando dados para a tabela database.django_migrations: ~24 rows (aproximadamente)
INSERT INTO `django_migrations` (`id`, `app`, `name`, `applied`) VALUES
	(1, 'accounts', '0001_initial', '2025-01-16 19:12:57.782108'),
	(2, 'companies', '0001_initial', '2025-01-16 19:12:57.953213'),
	(3, 'contenttypes', '0001_initial', '2025-01-16 19:12:58.034077'),
	(4, 'contenttypes', '0002_remove_content_type_name', '2025-01-16 19:12:58.311430'),
	(5, 'auth', '0001_initial', '2025-01-16 19:12:58.909397'),
	(6, 'auth', '0002_alter_permission_name_max_length', '2025-01-16 19:12:59.045505'),
	(7, 'auth', '0003_alter_user_email_max_length', '2025-01-16 19:12:59.058602'),
	(8, 'auth', '0004_alter_user_username_opts', '2025-01-16 19:12:59.072873'),
	(9, 'auth', '0005_alter_user_last_login_null', '2025-01-16 19:12:59.088820'),
	(10, 'auth', '0006_require_contenttypes_0002', '2025-01-16 19:12:59.099456'),
	(11, 'auth', '0007_alter_validators_add_error_messages', '2025-01-16 19:12:59.112890'),
	(12, 'auth', '0008_alter_user_username_max_length', '2025-01-16 19:12:59.125189'),
	(13, 'auth', '0009_alter_user_last_name_max_length', '2025-01-16 19:12:59.138688'),
	(14, 'auth', '0010_alter_group_name_max_length', '2025-01-16 19:12:59.169775'),
	(15, 'auth', '0011_update_proxy_permissions', '2025-01-16 19:12:59.184286'),
	(16, 'auth', '0012_alter_user_first_name_max_length', '2025-01-16 19:12:59.197609'),
	(17, 'accounts', '0002_group_user_groups_group_permissions', '2025-01-16 19:12:59.983250'),
	(18, 'admin', '0001_initial', '2025-01-16 19:13:00.334107'),
	(19, 'admin', '0002_logentry_remove_auto_add', '2025-01-16 19:13:00.347446'),
	(20, 'admin', '0003_logentry_add_action_flag_choices', '2025-01-16 19:13:00.362759'),
	(21, 'companies', '0002_employee', '2025-01-16 19:13:00.704289'),
	(22, 'companies', '0003_taskstatus_task', '2025-01-16 19:13:01.265051'),
	(23, 'sessions', '0001_initial', '2025-01-16 19:13:01.346065'),
	(24, 'companies', '0004_task_code', '2025-01-16 20:55:31.869648');

-- Copiando estrutura para tabela database.django_session
CREATE TABLE IF NOT EXISTS `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_expire_date_a5c62663` (`expire_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Copiando dados para a tabela database.django_session: ~0 rows (aproximadamente)

/*!40103 SET TIME_ZONE=IFNULL(@OLD_TIME_ZONE, 'system') */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
