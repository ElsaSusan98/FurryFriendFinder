-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: db
-- Generation Time: May 03, 2024 at 01:16 PM
-- Server version: 8.3.0
-- PHP Version: 8.2.8

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `furryfriendfinder`
--

-- --------------------------------------------------------

--
-- Table structure for table `appointment_table`
--

CREATE TABLE `appointment_table` (
  `appointment_id` int NOT NULL,
  `user_id` int NOT NULL,
  `trainer_id` int NOT NULL,
  `pet_name` varchar(100) NOT NULL,
  `pet_breed` varchar(100) NOT NULL,
  `appointment_date` date NOT NULL,
  `appointment_time` time NOT NULL,
  `query` text NOT NULL,
  `appointment_status` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `appointment_table`
--

INSERT INTO `appointment_table` (`appointment_id`, `user_id`, `trainer_id`, `pet_name`, `pet_breed`, `appointment_date`, `appointment_time`, `query`, `appointment_status`) VALUES
(100006, 4, 1009, '', '', '2024-04-03', '01:22:00', '', 'pending'),
(100007, 4, 1010, 's', 'ss', '2024-04-10', '10:57:00', 'sss', 'pending'),
(100008, 4, 1010, 'tes', 'Cat', '2024-04-10', '01:02:00', 'Availble', 'pending'),
(100010, 4, 1010, 'Tesa', 'Cat', '2024-04-05', '03:06:00', 'Availble', 'pending'),
(100012, 4, 1010, 'sera', 'Cat', '2024-04-05', '11:16:00', 's', 'pending'),
(100034, 4, 1009, 'Tesa', 'ss', '2024-04-10', '15:25:00', 'cgfc', 'pending'),
(100035, 4, 1009, 'Tesa', 'er', '2024-04-10', '12:30:00', 'ers', 'pending'),
(100036, 67, 1001, 'sera', 'Cat', '2024-05-08', '12:11:00', 'test', 'pending'),
(100037, 4, 1015, 'Lisa', 'Cat', '2024-05-16', '13:41:00', 'Messaging', 'pending'),
(100038, 4, 1015, 'sera', 'Cat', '2024-05-17', '13:42:00', 'Book appoinment', 'pending'),
(100039, 4, 1013, 'sera', 'Cat', '2024-05-03', '13:46:00', 's', 'pending'),
(100040, 4, 1010, 'seraa', 'Cat', '2024-05-29', '14:12:00', 'Message', 'pending');

-- --------------------------------------------------------

--
-- Table structure for table `enquiry_table`
--

CREATE TABLE `enquiry_table` (
  `enquiry_id` int NOT NULL,
  `name` varchar(50) NOT NULL,
  `email` varchar(50) NOT NULL,
  `phone_number` varchar(100) NOT NULL,
  `subject` text NOT NULL,
  `message` text NOT NULL,
  `enquiry_status` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `enquiry_table`
--

INSERT INTO `enquiry_table` (`enquiry_id`, `name`, `email`, `phone_number`, `subject`, `message`, `enquiry_status`) VALUES
(700001, 'mani', 'mani@gmail.com', '+00 1234567890', 'regarding offers', 'Is there any offer is going on now !', 'Pending'),
(700002, 'Tulasi', 'tulasi@gmail.com', '07990809462', 'Regarding your services', 'What services are you guys offering.', 'Pending'),
(700003, 'ram', 'ram@gmail.com', '7993403447', 'trainning', 'what type of pets are you guys accept.', 'Pending'),
(700004, 'Elsa Susan Aleyas', 'elsasusan98@gmail.com', '09526961835', 'test', 'test', 'Pending'),
(700005, 'Elsa Susan Aleyas', 'elsasusan98@gmail.com', '09526961835', 'test', 'test', 'Pending'),
(700006, 'Elsa Susa', 'elsa@gmail.com', '907867564', 's', 's', 'Pending'),
(700007, 'Elsa Susan Aleyas', 'elsasusan98@gmail.com', '09526961835', 'Testing', 'Testing', 'Pending'),
(700008, 'Elsa Susa', 'elsa@gmail.com', '9078675644', 'test', 'Test message', 'Pending'),
(700009, 'Elsa Susa', 'elsa@gmail.com', '9078675643', 'test Message', 'Test Message', 'Pending'),
(700010, 'Elsa', 'elsa@gmail.com', '9078675642', 'test', 'Testing', 'Pending'),
(700011, 'Elsa Susa', 'elsa@gmail.com', '907867564', 'Test', 'Message', 'Pending'),
(700012, 'Elsa Susa', 'elsa@gmail.com', '907867564', 'Mess', 'Message', 'Pending'),
(700013, 'Elsa Susa', 'elsa@gmail.com', '907867564', 'Mess', 'Message', 'Pending'),
(700014, 'Elsa Susan Aleyas', 'elsasusan98@gmail.com', '09526961835', 'test', 'messa', 'Pending'),
(700015, 'Elsa Susan Aleyas', 'elsasusan98@gmail.com', '09526961835', 'test', 'messa', 'Pending'),
(700016, 'Balamuralikrishna Perayil', 'balajne16@gmail.com', '07747235100', 'test mess', 'test', 'Pending'),
(700017, 'Balamuralikrishna Perayil', 'balajne16@gmail.com', '07747235100', 'test mess', 'test', 'Pending');

-- --------------------------------------------------------

--
-- Table structure for table `review`
--

CREATE TABLE `review` (
  `review_id` int NOT NULL,
  `user_id` int NOT NULL,
  `trainer_id` int NOT NULL,
  `rating` varchar(10) NOT NULL,
  `review_comment` text NOT NULL,
  `review_date` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `review`
--

INSERT INTO `review` (`review_id`, `user_id`, `trainer_id`, `rating`, `review_comment`, `review_date`) VALUES
(200001, 1, 1011, '5', 'Nice Work!!', '2024-03-19'),
(200002, 2, 1012, '4', 'good', '2024-03-20'),
(200003, 2, 1010, '4', 'Good Job!!', '2024-03-20');

-- --------------------------------------------------------

--
-- Table structure for table `trainer_table`
--

CREATE TABLE `trainer_table` (
  `trainer_id` int NOT NULL,
  `trainer_name` varchar(100) NOT NULL,
  `trainer_email` varchar(100) NOT NULL,
  `trainer_speciality` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `trainer_image` varchar(255) NOT NULL,
  `trainer_location` varchar(50) NOT NULL,
  `trainer_experience` int NOT NULL,
  `trainer_certificate` varchar(100) NOT NULL,
  `trainer_description` text,
  `user_id` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `trainer_table`
--

INSERT INTO `trainer_table` (`trainer_id`, `trainer_name`, `trainer_email`, `trainer_speciality`, `trainer_image`, `trainer_location`, `trainer_experience`, `trainer_certificate`, `trainer_description`, `user_id`) VALUES
(1001, 'Jack Daniel', 'elsasusan1998@gmail.com', 'Protection Training', 'img\\trainer.jpg', 'London', 3, 'null', 'There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour, or randomised words which don\'t look even slightly believable. If you are going to use a passage of Lorem Ipsum, you need to be sure there isn\'t anything embarrassing hidden in the middle of text. All the Lorem Ipsum generators on the Internet tend to repeat predefined chunks as necessary, making this the first true generator on the Internet. It uses a dictionary of over 200 Latin words, combined with a handful of model sentence structures, to generate Lorem Ipsum which looks reasonable.', 2),
(1009, 'wes london', 'paul@gmail.com', 'Dog trainer', 'img/testimonial-2.jpg', 'Manchaster', 8, '', 'There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour, or randomised words which don\'t look even slightly believable. If you are going to use a passage of Lorem Ipsum, you need to be sure there isn\'t anything embarrassing hidden in the middle of text. All the Lorem Ipsum generators on the Internet tend to repeat predefined chunks as necessary, making this the first true generator on the Internet. It uses a dictionary of over 200 Latin words, combined with a handful of model sentence structures, to generate Lorem Ipsum which looks reasonable.', 53),
(1010, 'Sara Mac', 'sara@gmail.com\r\n', 'Cat trainer', 'img/testimonial-1.jpg', 'Birmingham', 2, '', 'There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour, or randomised words which don\'t look even slightly believable. If you are going to use a passage of Lorem Ipsum, you need to be sure there isn\'t anything embarrassing hidden in the middle of text. All the Lorem Ipsum generators on the Internet tend to repeat predefined chunks as necessary, making this the first true generator on the Internet. It uses a dictionary of over 200 Latin words, combined with a handful of model sentence structures, to generate Lorem Ipsum which looks reasonable.', NULL),
(1011, 'Alice Johnson', 'alice@gmail.com\r\n', 'Cat trainer', 'img/testimonial-1.jpg', 'Crawley', 2, '', 'There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour, or randomised words which don\'t look even slightly believable. If you are going to use a passage of Lorem Ipsum, you need to be sure there isn\'t anything embarrassing hidden in the middle of text. All the Lorem Ipsum generators on the Internet tend to repeat predefined chunks as necessary, making this the first true generator on the Internet. It uses a dictionary of over 200 Latin words, combined with a handful of model sentence structures, to generate Lorem Ipsum which looks reasonable.', NULL),
(1012, 'Jane Smith', 'jane@gmail.com\r\n', 'Dog trainer', 'img/trainer.jpg', 'Scotland', 2, '', 'There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour, or randomised words which don\'t look even slightly believable. If you are going to use a passage of Lorem Ipsum, you need to be sure there isn\'t anything embarrassing hidden in the middle of text. All the Lorem Ipsum generators on the Internet tend to repeat predefined chunks as necessary, making this the first true generator on the Internet. It uses a dictionary of over 200 Latin words, combined with a handful of model sentence structures, to generate Lorem Ipsum which looks reasonable.', NULL),
(1013, 'John Doe', 'john@example.com', 'Senior Pet Trainer', 'img/testimonial-1.jpg', 'Putney', 4, 'null', 'There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour, or randomised words which don\'t look even slightly believable. If you are going to use a passage of Lorem Ipsum, you need to be sure there isn\'t anything embarrassing hidden in the middle of text. All the Lorem Ipsum generators on the Internet tend to repeat predefined chunks as necessary, making this the first true generator on the Internet. It uses a dictionary of over 200 Latin words, combined with a handful of model sentence structures, to generate Lorem Ipsum which looks reasonable.', NULL),
(1015, 'Elsa Susa', 'r@gmail.com', 'Dog trainer', 'img/trainer.jpg', 'Crawley', 1, 'null', 'There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour, or randomised words which don\'t look even slightly believable. If you are going to use a passage of Lorem Ipsum, you need to be sure there isn\'t anything embarrassing hidden in the middle of text. All the Lorem Ipsum generators on the Internet tend to repeat predefined chunks as necessary, making this the first true generator on the Internet. It uses a dictionary of over 200 Latin words, combined with a handful of model sentence structures, to generate Lorem Ipsum which looks reasonable.', 66);

-- --------------------------------------------------------

--
-- Table structure for table `user_sessions`
--

CREATE TABLE `user_sessions` (
  `session_id` varchar(255) COLLATE utf8mb4_bin NOT NULL,
  `expires` bigint NOT NULL,
  `data` text COLLATE utf8mb4_bin
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

-- --------------------------------------------------------

--
-- Table structure for table `user_table`
--

CREATE TABLE `user_table` (
  `user_id` int NOT NULL,
  `user_firstname` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `user_lastname` varchar(50) NOT NULL,
  `user_email` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `user_phonenumber` varchar(20) NOT NULL,
  `user_type` varchar(100) NOT NULL,
  `user_password` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `user_table`
--

INSERT INTO `user_table` (`user_id`, `user_firstname`, `user_lastname`, `user_email`, `user_phonenumber`, `user_type`, `user_password`) VALUES
(1, 'David', 'Pious', 'david@gmail.com', '9767564523', 'pet owner', 'David@123'),
(2, 'Elsa', 'Susan', 'elsa@gmail.com', '9767564523', 'petTrainer', 'Elsa@123'),
(3, 'Ambily', 'Preamkumar', 'ambly@gmail.com', '9764564523', 'pet owner', 'Ambly@123'),
(4, 'Ram', 'Thulasi', 'ram@gmail.com', '8767564523', 'petOwner', 'Ram@123'),
(5, 'Elsa', 'Susa', 'ajayjayaram@live.in', '9078675645', 'petOwner', '11234'),
(10, 'a', 'a', 'a@gmail.com', '9867452312', 'pet owner', '123'),
(17, 'Balamuralikrishna', 'Perayil', 'balajne16@gmail.com', '7747235100', 'petOwner', '123'),
(25, 'Elsa Susan', 'Aleyas', 'ajayj@live.in', '9526961835', 'petOwner', '123'),
(41, 'Elsa Susan', 'Aleyas', 'ajayjayarasm@live.in', '9526961835', 'petOwner', '123'),
(47, 'Elsa Susan', 'Aleyas', 'ajayjam@live.in', '9526961835', 'petOwner', '123'),
(49, 'Elsa', 'Susa', 'e@gmail.com', '9078675642', 'regularUser', '123'),
(50, 'Elsa Susan', 'Aleyas', 'elsa@live.in', '9526961835', 'regularUser', '123'),
(52, 'Elsa', 'Susa', 'a@live.in', '9078675642', 'regularUser', '123'),
(53, 'wes london', 'Test', 'paul@gmail.com', '9767564523', 'petTrainer', '123'),
(54, 'Elsa Susan', 'Aleyas', 'paul90@gmail.com', '9078675644', 'pettrainer', '123'),
(56, 'Elsa Susan', 'Aleyas', 'issac@gmail.com', '8952696183', 'pettrainer', '123'),
(58, 'Elsa Susan', 'Aleyas', 'issacc@gmail.com', '9526961835', 'pettrainer', '123'),
(59, 'jeni', 'jeni', 'jeni@gmail.com', '9078675643', 'petTrainer', '123'),
(60, 'Elsa', 'Susa', 'pau3l@gmail.com', '9078675643', 'petTrainer', '123'),
(61, 'Elsa Susan', 'Aleyas', 'paulyy@gmail.com', '9526961835', 'petTrainer', '123'),
(62, 'Elsa', 'Susa', 'faul@gmail.com', '9078675644', 'petTrainer', '123'),
(63, 'Elsa', 'Susa', 'pa@gmail.com', '9078675644', 'petTrainer', '123'),
(65, 'Elsa', 'Susa', 'yu@gmail.com', '9078675645', 'petTrainer', '123'),
(66, 'Elsa', 'Susa', 'r@gmail.com', '9078675643', 'petTrainer', '123'),
(67, 'davis', 'Vam', 'davis@gmail.com', '9078675643', 'petOwner', '123');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `appointment_table`
--
ALTER TABLE `appointment_table`
  ADD PRIMARY KEY (`appointment_id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `trainer_id` (`trainer_id`);

--
-- Indexes for table `enquiry_table`
--
ALTER TABLE `enquiry_table`
  ADD PRIMARY KEY (`enquiry_id`);

--
-- Indexes for table `review`
--
ALTER TABLE `review`
  ADD PRIMARY KEY (`review_id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `trainer_id` (`trainer_id`);

--
-- Indexes for table `trainer_table`
--
ALTER TABLE `trainer_table`
  ADD PRIMARY KEY (`trainer_id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `user_sessions`
--
ALTER TABLE `user_sessions`
  ADD PRIMARY KEY (`session_id`);

--
-- Indexes for table `user_table`
--
ALTER TABLE `user_table`
  ADD PRIMARY KEY (`user_id`),
  ADD UNIQUE KEY `email` (`user_email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `appointment_table`
--
ALTER TABLE `appointment_table`
  MODIFY `appointment_id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=100041;

--
-- AUTO_INCREMENT for table `enquiry_table`
--
ALTER TABLE `enquiry_table`
  MODIFY `enquiry_id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=700018;

--
-- AUTO_INCREMENT for table `review`
--
ALTER TABLE `review`
  MODIFY `review_id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=200004;

--
-- AUTO_INCREMENT for table `trainer_table`
--
ALTER TABLE `trainer_table`
  MODIFY `trainer_id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1016;

--
-- AUTO_INCREMENT for table `user_table`
--
ALTER TABLE `user_table`
  MODIFY `user_id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=68;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `appointment_table`
--
ALTER TABLE `appointment_table`
  ADD CONSTRAINT `appointment_table_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user_table` (`user_id`),
  ADD CONSTRAINT `appointment_table_ibfk_2` FOREIGN KEY (`trainer_id`) REFERENCES `trainer_table` (`trainer_id`);

--
-- Constraints for table `review`
--
ALTER TABLE `review`
  ADD CONSTRAINT `review_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user_table` (`user_id`),
  ADD CONSTRAINT `review_ibfk_2` FOREIGN KEY (`trainer_id`) REFERENCES `trainer_table` (`trainer_id`);

--
-- Constraints for table `trainer_table`
--
ALTER TABLE `trainer_table`
  ADD CONSTRAINT `trainer_table_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user_table` (`user_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
