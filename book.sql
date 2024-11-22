CREATE TABLE `book` (
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

CREATE TABLE `author` (
    `id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `name` VARCHAR(255) NOT NULL
);

CREATE TABLE `student` (
    `id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `name` VARCHAR(255) NOT NULL,
    `information` VARCHAR(255) NOT NULL,
    `student_card_id` BIGINT NOT NULL
);

CREATE TABLE `student_card` (
    `id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `student_name` VARCHAR(255) NOT NULL,
    `birth` DATE NOT NULL,
    `address` VARCHAR(255) NOT NULL,
    `email` VARCHAR(255) NOT NULL,
    `phone` VARCHAR(255) NOT NULL,
    `image` VARCHAR(255) NOT NULL
);

CREATE TABLE `librarian` (
    `id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `name` VARCHAR(255) NOT NULL
);

CREATE TABLE `borrow` (
    `id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `librarian_id` BIGINT NOT NULL,
    `student_card_id` BIGINT NOT NULL,
    `borrowing_date` DATE NOT NULL,
    `return_date` DATE NOT NULL,
    `book_id` BIGINT NOT NULL,
    `status` TINYINT NOT NULL
);

CREATE TABLE `category` (
    `id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `name` VARCHAR(255) NOT NULL
);

ALTER TABLE `student`
ADD CONSTRAINT `student_student_card_id_foreign` FOREIGN KEY (`student_card_id`) REFERENCES `student_card`(`id`);

ALTER TABLE `book`
ADD CONSTRAINT `book_category_id_foreign` FOREIGN KEY (`category_id`) REFERENCES `category`(`id`),
ADD CONSTRAINT `book_author_id_foreign` FOREIGN KEY (`author_id`) REFERENCES `author`(`id`);

ALTER TABLE `borrow`
ADD CONSTRAINT `borrow_librarian_id_foreign` FOREIGN KEY (`librarian_id`) REFERENCES `librarian`(`id`),
ADD CONSTRAINT `borrow_book_id_foreign` FOREIGN KEY (`book_id`) REFERENCES `book`(`id`),
ADD CONSTRAINT `borrow_student_card_id_foreign` FOREIGN KEY (`student_card_id`) REFERENCES `student_card`(`id`);

-- Insert sample data for author
INSERT INTO `author` (`name`) VALUES
('J.K. Rowling'), ('George Orwell'), ('J.R.R. Tolkien'), ('Agatha Christie'), ('Stephen King');

-- Insert sample data for category
INSERT INTO `category` (`name`) VALUES
('Fiction'), ('Science Fiction'), ('Mystery'), ('Fantasy'), ('Horror');

-- Insert sample data for book
INSERT INTO `book` (`name`, `price`, `image`, `publisher`, `public_date`, `public_count`, `author_id`, `category_id`) VALUES
('Harry Potter', 50000, 'hp.jpg', 'Bloomsbury', '2001-06-26', 100, 1, 4),
('1984', 45000, '1984.jpg', 'Harcourt', '1949-06-08', 200, 2, 2),
('The Hobbit', 60000, 'hobbit.jpg', 'Allen & Unwin', '1937-09-21', 150, 3, 4),
('Murder on the Orient Express', 40000, 'orient_express.jpg', 'Collins Crime Club', '1934-01-01', 120, 4, 3),
('The Shining', 55000, 'shining.jpg', 'Doubleday', '1977-01-28', 90, 5, 5);

-- Insert sample data for student_card
INSERT INTO `student_card` (`student_name`, `birth`, `address`, `email`, `phone`, `image`) VALUES
('Alice', '2000-05-15', '123 Maple St', 'alice@example.com', '555-1234', 'alice.jpg'),
('Bob', '2001-07-22', '456 Elm St', 'bob@example.com', '555-5678', 'bob.jpg'),
('Charlie', '1999-10-02', '789 Pine St', 'charlie@example.com', '555-9101', 'charlie.jpg'),
('Diana', '2002-03-11', '101 Birch St', 'diana@example.com', '555-1123', 'diana.jpg'),
('Eve', '2003-08-30', '202 Oak St', 'eve@example.com', '555-3141', 'eve.jpg');

-- Insert sample data for student
INSERT INTO `student` (`name`, `information`, `student_card_id`) VALUES
('Alice', 'Sophomore', 1),
('Bob', 'Junior', 2),
('Charlie', 'Senior', 3),
('Diana', 'Freshman', 4),
('Eve', 'Graduate', 5);

-- Insert sample data for librarian
INSERT INTO `librarian` (`name`) VALUES
('John'), ('Mary'), ('Linda'), ('James'), ('Michael');

-- Insert sample data for borrow
INSERT INTO `borrow` (`librarian_id`, `student_card_id`, `borrowing_date`, `return_date`, `book_id`, `status`) VALUES
(1, 1, '2024-11-01', '2024-11-15', 1, 1),
(2, 2, '2024-11-02', '2024-11-16', 2, 0),
(3, 3, '2024-11-03', '2024-11-17', 3, 1),
(4, 4, '2024-11-04', '2024-11-18', 4, 0),
(5, 5, '2024-11-05', '2024-11-19', 5, 1);
