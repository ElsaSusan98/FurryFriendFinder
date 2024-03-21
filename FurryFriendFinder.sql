-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: db
-- Generation Time: Mar 21, 2024 at 02:38 PM
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
-- Database: `FurryFriendFinder`
--

-- --------------------------------------------------------

--
-- Table structure for table `appointment_table`
--

CREATE TABLE `appointment_table` (
  `appointment_id` int NOT NULL,
  `user_id` int NOT NULL,
  `trainer_id` int NOT NULL,
  `appointment_date` date NOT NULL,
  `appointment_time` time NOT NULL,
  `appointment_status` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `appointment_table`
--

INSERT INTO `appointment_table` (`appointment_id`, `user_id`, `trainer_id`, `appointment_date`, `appointment_time`, `appointment_status`) VALUES
(100001, 3, 1001, '2024-03-20', '14:19:15', 'Approved'),
(100002, 4, 1001, '2024-03-21', '04:19:15', 'Approved'),
(100003, 1, 1001, '2024-03-26', '04:19:15', 'Pending'),
(100004, 2, 1001, '2024-03-30', '04:19:15', 'Pending');

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
  `enquiry_status` varchar(100) NOT NULL,
  `user_id` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `enquiry_table`
--

INSERT INTO `enquiry_table` (`enquiry_id`, `name`, `email`, `phone_number`, `subject`, `message`, `enquiry_status`, `user_id`) VALUES
(700001, 'mani', 'mani@gmail.com', '+00 1234567890', 'regarding offers', 'Is there any offer is going on now !', 'Pending', 1),
(700002, 'Tulasi', 'tulasi@gmail.com', '07990809462', 'Regarding your services', 'What services are you guys offering.', 'Pending', 1),
(700003, 'ram', 'ram@gmail.com', '7993403447', 'trainning', 'what type of pets are you guys accept.', 'Pending', 1);

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
(200001, 1, 1001, '5', 'Nice Work!!', '2024-03-19'),
(200002, 2, 1001, '4', 'good', '2024-03-20'),
(200003, 2, 1001, '4', 'Good Job!!', '2024-03-20');

-- --------------------------------------------------------

--
-- Table structure for table `trainer_table`
--

CREATE TABLE `trainer_table` (
  `trainer_id` int NOT NULL,
  `trainer_name` varchar(100) NOT NULL,
  `trainer_speciality` varchar(100) NOT NULL,
  `trainer_image` blob NOT NULL,
  `trainer_experience` int NOT NULL,
  `trainer_certificate` varchar(100) NOT NULL,
  `trainer_description` text,
  `user_id` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `trainer_table`
--

INSERT INTO `trainer_table` (`trainer_id`, `trainer_name`, `trainer_speciality`, `trainer_image`, `trainer_experience`, `trainer_certificate`, `trainer_description`, `user_id`) VALUES
(1001, 'jack', 'Protection Training', 0x4c4f41445f46494c4528272f55736572732f6d616e6974756c61736972616d6b616d696e656e692f446f776e6c6f6164732f696d616765732e6a7065672729, 3, 'null', 'null', 2);

-- --------------------------------------------------------

--
-- Table structure for table `user_table`
--

CREATE TABLE `user_table` (
  `user_id` int NOT NULL,
  `user_name` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `pass_word` varchar(100) NOT NULL,
  `registration_date` date NOT NULL,
  `user_type` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `user_table`
--

INSERT INTO `user_table` (`user_id`, `user_name`, `email`, `pass_word`, `registration_date`, `user_type`) VALUES
(1, 'David', 'david@gmail.com', 'David@123', '2024-03-18', 'pet owner'),
(2, 'elsa', 'elsa@gmail.com', 'Elsa@123', '2024-03-17', 'pet owner'),
(3, 'ambly', 'ambly@gmail.com', 'Ambly@123', '2024-03-18', 'pet owner'),
(4, 'Ram', 'ram@gmail.com', 'Ram@123', '2024-03-18', 'petowner');

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
  ADD PRIMARY KEY (`enquiry_id`),
  ADD KEY `fk_constraint_name` (`user_id`);

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
-- Indexes for table `user_table`
--
ALTER TABLE `user_table`
  ADD PRIMARY KEY (`user_id`),
  ADD UNIQUE KEY `email` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `appointment_table`
--
ALTER TABLE `appointment_table`
  MODIFY `appointment_id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=100005;

--
-- AUTO_INCREMENT for table `enquiry_table`
--
ALTER TABLE `enquiry_table`
  MODIFY `enquiry_id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=700004;

--
-- AUTO_INCREMENT for table `review`
--
ALTER TABLE `review`
  MODIFY `review_id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=200004;

--
-- AUTO_INCREMENT for table `trainer_table`
--
ALTER TABLE `trainer_table`
  MODIFY `trainer_id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1002;

--
-- AUTO_INCREMENT for table `user_table`
--
ALTER TABLE `user_table`
  MODIFY `user_id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

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
-- Constraints for table `enquiry_table`
--
ALTER TABLE `enquiry_table`
  ADD CONSTRAINT `fk_constraint_name` FOREIGN KEY (`user_id`) REFERENCES `user_table` (`user_id`);

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
