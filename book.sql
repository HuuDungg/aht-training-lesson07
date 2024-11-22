CREATE TABLE `book`(
    `id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `name` VARCHAR(255) NOT NULL,
    `price` BIGINT NOT NULL,
    `image` VARCHAR(255) NOT NULL,
    `publisher` VARCHAR(255) NOT NULL,
    `public_date` DATE NOT NULL,
    `public_count` BIGINT NOT NULL,
    `author_id` BIGINT NOT NULL,
    `category_id` BIGINT NOT NULL
);
CREATE TABLE `author`(
    `id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `name` VARCHAR(255) NOT NULL
);
CREATE TABLE `student`(
    `id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `name` BIGINT NOT NULL,
    `information` VARCHAR(255) NOT NULL,
    `student_card_id` BIGINT NOT NULL
);
CREATE TABLE `student_card`(
    `id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `student_name` VARCHAR(255) NOT NULL,
    `birth` DATE NOT NULL,
    `address` VARCHAR(255) NOT NULL,
    `email` VARCHAR(255) NOT NULL,
    `phone` VARCHAR(255) NOT NULL,
    `image` VARCHAR(255) NOT NULL
);
CREATE TABLE `librarian`(
    `id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `name` BIGINT NOT NULL
);
CREATE TABLE `borrow`(
    `id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `librarian_id` BIGINT NOT NULL,
    `student_card_id` BIGINT NOT NULL,
    `borrowing_date` DATE NOT NULL,
    `return_date` DATE NOT NULL,
    `book_id` BIGINT NOT NULL,
    `status` BIGINT NOT NULL
);
CREATE TABLE `category`(
    `id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `name` BIGINT NOT NULL
);
ALTER TABLE
    `student` ADD CONSTRAINT `student_student_card_id_foreign` FOREIGN KEY(`student_card_id`) REFERENCES `student_card`(`id`);
ALTER TABLE
    `book` ADD CONSTRAINT `book_category_id_foreign` FOREIGN KEY(`category_id`) REFERENCES `category`(`id`);
ALTER TABLE
    `borrow` ADD CONSTRAINT `borrow_librarian_id_foreign` FOREIGN KEY(`librarian_id`) REFERENCES `librarian`(`id`);
ALTER TABLE
    `borrow` ADD CONSTRAINT `borrow_book_id_foreign` FOREIGN KEY(`book_id`) REFERENCES `book`(`id`);
ALTER TABLE
    `borrow` ADD CONSTRAINT `borrow_student_card_id_foreign` FOREIGN KEY(`student_card_id`) REFERENCES `student_card`(`id`);
ALTER TABLE
    `book` ADD CONSTRAINT `book_author_id_foreign` FOREIGN KEY(`author_id`) REFERENCES `author`(`id`);