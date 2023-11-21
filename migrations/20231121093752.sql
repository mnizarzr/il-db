-- Modify "visitors" table
ALTER TABLE `visitors` ADD UNIQUE INDEX `idx_email` (`email`), ADD UNIQUE INDEX `idx_phone` (`phone_number`);
