DROP TABLE IF EXISTS `whitelist`;
CREATE TABLE `whitelist`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `identifier` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `identifier`(`identifier`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 10 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = DYNAMIC;

CREATE TABLE IF NOT EXISTS `users` (
  `identifier` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `group` varchar(50) DEFAULT 'user',
  `warnings` int(11) DEFAULT 0,
  `banned` tinyint(4) DEFAULT 0,
  PRIMARY KEY (`identifier`),
  UNIQUE KEY `identifier` (`identifier`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;


DROP TABLE IF EXISTS `characters`;
CREATE TABLE `characters`  (
  `identifier` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL DEFAULT '',
  `charidentifier` int(11) NOT NULL AUTO_INCREMENT,
  `group` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT 'user',
  `money` double(11, 2) NULL DEFAULT 0,
  `gold` double(11, 2) NULL DEFAULT 0,
  `rol` double(11, 2) NOT NULL DEFAULT 0,
  `xp` int(11) NULL DEFAULT 0,
  `inventory` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL,
  `job` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT 'unemployed',
  `status` varchar(140) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT '{}',
  `firstname` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT ' ',
  `lastname` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT ' ',
  `skinPlayer` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL,
  `compPlayer` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL,
  `jobgrade` int(11) NULL DEFAULT 0,
  `coords` varchar(75) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT '{}',
  `isdead` tinyint(1) NULL DEFAULT 0,
  UNIQUE INDEX `identifier_charidentifier`(`identifier`, `charidentifier`) USING BTREE,
  INDEX `charidentifier`(`charidentifier`) USING BTREE,
  CONSTRAINT `FK_characters_users` FOREIGN KEY (`identifier`) REFERENCES `users` (`identifier`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_bin ROW_FORMAT = DYNAMIC;

DROP TABLE IF EXISTS `loadout`;
CREATE TABLE `loadout` (
	`id` INT(11) NOT NULL AUTO_INCREMENT,
	`identifier` VARCHAR(50) NOT NULL,
	`charidentifier` INT(11) NULL,
	`name` VARCHAR(50) NULL DEFAULT NULL,
	`ammo` VARCHAR(255) NOT NULL DEFAULT '{}',
	`components` VARCHAR(255) NOT NULL DEFAULT '[]',
	`dirtlevel` DOUBLE NULL DEFAULT 0,
	`mudlevel` DOUBLE NULL DEFAULT 0,
	`conditionlevel` DOUBLE NULL DEFAULT 0,
	`rustlevel` DOUBLE NULL DEFAULT 0,
	`used` TINYINT(4) NULL DEFAULT 0,
	PRIMARY KEY (`id`),
	INDEX `id` (`id`)
)
COLLATE='utf8mb4_general_ci'
ENGINE=InnoDB
AUTO_INCREMENT=2
;

DROP TABLE IF EXISTS `items`;
CREATE TABLE `items` (
	`item` VARCHAR(50) NOT NULL,
	`label` VARCHAR(50) NOT NULL,
	`limit` INT(11) NOT NULL DEFAULT 1,
	`can_remove` TINYINT(1) NOT NULL DEFAULT 1,
	`type` VARCHAR(50) NULL DEFAULT NULL,
	`usable` TINYINT(1) NULL DEFAULT NULL,
	PRIMARY KEY (`item`) USING BTREE
)
COLLATE='utf8mb4_general_ci'
ENGINE=InnoDB
ROW_FORMAT=DYNAMIC
;