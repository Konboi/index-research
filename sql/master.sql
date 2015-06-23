DROP TABLE IF EXISTS `no_index`;

CREATE TABLE `no_index` (
  `id` INTEGER unsigned NOT NULL auto_increment,
  `player_id` INTEGER unsigned NOT NULL DEFAULT 0,
  `index_id` INTEGER unsigned NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARACTER SET utf8mb4;

DROP TABLE IF EXISTS `one_index`;

CREATE TABLE `one_index` (
  `id` INTEGER unsigned NOT NULL auto_increment,
  `player_id` INTEGER unsigned NOT NULL DEFAULT 0,
  `index_id` INTEGER unsigned NOT NULL DEFAULT 0,
  INDEX `player_id_idx` (`player_id`),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARACTER SET utf8mb4;

DROP TABLE IF EXISTS `both_index`;

CREATE TABLE `both_index` (
  `id` INTEGER unsigned NOT NULL auto_increment,
  `player_id` INTEGER unsigned NOT NULL DEFAULT 0,
  `index_id` INTEGER unsigned NOT NULL DEFAULT 0,
  INDEX `player_id_index_id_idx` (`player_id`, `index_id`),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARACTER SET utf8mb4;

DROP TABLE IF EXISTS `uniq_index`;

CREATE TABLE `uniq_index` (
  `id` INTEGER unsigned NOT NULL auto_increment,
  `player_id` INTEGER unsigned NOT NULL DEFAULT 0,
  `index_id` INTEGER unsigned NOT NULL DEFAULT 0,
  UNIQUE `uniq_index_player_id_index_id` (`player_id`, `index_id`),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARACTER SET utf8mb4;
