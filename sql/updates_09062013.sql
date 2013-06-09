/* departments */
UPDATE `agency`.`depts` SET `name`='sales' WHERE `id`='2';
INSERT INTO `agency`.`depts` (`id`, `name`) VALUES (5, 'rent');

/* apprtments */
ALTER TABLE `agency`.`entities` 
DROP INDEX `address_UNIQUE` ;

ALTER TABLE `agency`.`entities` ADD COLUMN `addr_house` VARCHAR(10) NOT NULL  AFTER `active` , ADD COLUMN `addr_appartment` VARCHAR(10) NOT NULL  AFTER `addr_house` , ADD COLUMN `addr_city` VARCHAR(20) NOT NULL  AFTER `addr_appartment` , CHANGE COLUMN `address` `addr_street` VARCHAR(25) NOT NULL  ;

ALTER TABLE `agency`.`entities` 
ADD UNIQUE INDEX `addr_uniq` (`addr_street` ASC, `addr_house` ASC, `addr_appartment` ASC, `addr_city` ASC) ;

/* depts */
ALTER TABLE `agency`.`depts` ADD COLUMN `mah_result` FLOAT NOT NULL  AFTER `name` ;

