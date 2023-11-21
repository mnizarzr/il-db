-- Create "schedules" table
CREATE TABLE `schedules` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `start_date` date NOT NULL,
  `end_date` date NOT NULL,
  `visitor_qty` int NOT NULL,
  PRIMARY KEY (`id`)
) CHARSET utf8mb4 COLLATE utf8mb4_general_ci;
-- Create "visitors" table
CREATE TABLE `visitors` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `phone_number` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `idx_email` (`email`),
  UNIQUE INDEX `idx_phone` (`phone_number`)
) CHARSET utf8mb4 COLLATE utf8mb4_general_ci;
-- Create "visits" table
CREATE TABLE `visits` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `visitor_id` bigint NOT NULL,
  `schedule_id` bigint NOT NULL,
  `time_in` time NOT NULL,
  `time_out` time NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_schedule_id` (`schedule_id`),
  INDEX `fk_visitor_id` (`visitor_id`),
  CONSTRAINT `fk_schedule_id` FOREIGN KEY (`schedule_id`) REFERENCES `schedules` (`id`) ON UPDATE CASCADE ON DELETE CASCADE,
  CONSTRAINT `fk_visitor_id` FOREIGN KEY (`visitor_id`) REFERENCES `visitors` (`id`) ON UPDATE CASCADE ON DELETE CASCADE
) CHARSET utf8mb4 COLLATE utf8mb4_general_ci;
