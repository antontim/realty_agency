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

/* MAH */
CREATE  TABLE `agency`.`measure_target` (
  `id` INT NOT NULL ,
  `target` VARCHAR(15) NOT NULL ,
  PRIMARY KEY (`id`) )
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1;
INSERT INTO `agency`.`measure_target` (`id`, `target`) VALUES (0, 'employee');
INSERT INTO `agency`.`measure_target` (`id`, `target`) VALUES (1, 'dept');
INSERT INTO `agency`.`measure_target` (`id`, `target`) VALUES (2, 'company');
ALTER TABLE `agency`.`measures` ADD COLUMN `measure_target` INT NOT NULL DEFAULT 1 AFTER `name` ;

ALTER TABLE `agency`.`measures` 
  ADD CONSTRAINT `fk_measures_2`
  FOREIGN KEY (`measure_target_id` )
  REFERENCES `agency`.`measure_target` (`id` )
  ON DELETE NO ACTION
  ON UPDATE NO ACTION
, ADD INDEX `fk_measures_2` (`measure_target_id` ASC) ;

INSERT INTO `agency`.`measures` (`id`, `measure_type_id`, `name`, `measure_target_id`) VALUES (6, 1, 'earnings', 1);
INSERT INTO `agency`.`measures` (`id`, `measure_type_id`, `name`, `measure_target_id`) VALUES (7, 1, 'orders amount', 1);
INSERT INTO `agency`.`measures` (`id`, `measure_type_id`, `name`, `measure_target_id`) VALUES (8, 1, 'emp amount', 1);
INSERT INTO `agency`.`measures` (`id`, `measure_type_id`, `name`, `measure_target_id`) VALUES (9, 1, 'avg efficiency', 1);

INSERT INTO `agency`.`measures` (`id`, `measure_type_id`, `name`, `measure_target_id`) VALUES (10, 1, 'depts efficiency', 2);
INSERT INTO `agency`.`measures` (`id`, `measure_type_id`, `name`, `measure_target_id`) VALUES (11, 1, 'new entities amount', 2);
INSERT INTO `agency`.`measures` (`id`, `measure_type_id`, `name`, `measure_target_id`) VALUES (12, 1, 'earnings', 2);


ALTER TABLE `agency`.`entities` ADD COLUMN `created` DATETIME NOT NULL  AFTER `addr_city` ;



