-- ---------------------------------------------------------------------------
-- SECURITY NOTE
-- ---------------------------------------------------------------------------
-- This file contains the SCHEMA only. Do NOT commit production data dumps,
-- user records, password hashes, PII, or any application secrets to version
-- control. Production dumps should be stored in a secured backup location
-- with access controls and rotation policies.
--
-- If a SQL dump containing real user data was previously committed to this
-- repository, treat all included password hashes as compromised and rotate
-- the affected credentials. Also consider running `git filter-repo` or
-- BFG Repo-Cleaner to purge historical copies from git history.
-- ---------------------------------------------------------------------------

-- MySQL schema example
--
-- Server version: 8.0.x

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

-- Use InnoDB (transactional, FK-aware) and utf8mb4 (full Unicode) instead of
-- MyISAM/latin1. Store password hashes in a column wide enough for modern
-- algorithms (e.g. bcrypt = 60 chars, argon2id can be longer).
CREATE TABLE IF NOT EXISTS `users` (
  `user_id` INT(11) NOT NULL AUTO_INCREMENT,
  `username` VARCHAR(255) NOT NULL,
  `password_hash` VARCHAR(255) NOT NULL,
  `flag` TINYINT(1) DEFAULT 0,
  PRIMARY KEY (`user_id`),
  UNIQUE KEY `uniq_username` (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Seed data intentionally omitted. Do not insert real user records or
-- password hashes here. Use fixtures or seed scripts that run in
-- non-production environments only.
