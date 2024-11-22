CREATE TABLE `staff`(
    `id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `name` VARCHAR(255) NOT NULL
);
CREATE TABLE `manager`(
    `id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `name` BIGINT NOT NULL,
    `staff_id` BIGINT NOT NULL
);
CREATE TABLE `car`(
    `id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `name` BIGINT NOT NULL,
    `car_type_id` BIGINT NOT NULL
);
CREATE TABLE `car_type`(
    `id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `name` BIGINT NOT NULL,
    `color` BIGINT NOT NULL,
    `price` BIGINT NOT NULL
);
CREATE TABLE `customer`(
    `id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `name` BIGINT NOT NULL
);
CREATE TABLE `bill`(
    `id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `car_id` BIGINT NOT NULL,
    `customer_id` BIGINT NOT NULL,
    `staff_id` BIGINT NOT NULL,
    `purchase_id` BIGINT NOT NULL
);
CREATE TABLE `purchase`(
    `id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `total` BIGINT NOT NULL
);
ALTER TABLE
    `bill` ADD CONSTRAINT `bill_purchase_id_foreign` FOREIGN KEY(`purchase_id`) REFERENCES `purchase`(`id`);
ALTER TABLE
    `manager` ADD CONSTRAINT `manager_staff_id_foreign` FOREIGN KEY(`staff_id`) REFERENCES `staff`(`id`);
ALTER TABLE
    `bill` ADD CONSTRAINT `bill_customer_id_foreign` FOREIGN KEY(`customer_id`) REFERENCES `customer`(`id`);
ALTER TABLE
    `bill` ADD CONSTRAINT `bill_car_id_foreign` FOREIGN KEY(`car_id`) REFERENCES `car`(`id`);
ALTER TABLE
    `car` ADD CONSTRAINT `car_car_type_id_foreign` FOREIGN KEY(`car_type_id`) REFERENCES `car_type`(`id`);
ALTER TABLE
    `bill` ADD CONSTRAINT `bill_staff_id_foreign` FOREIGN KEY(`staff_id`) REFERENCES `staff`(`id`);