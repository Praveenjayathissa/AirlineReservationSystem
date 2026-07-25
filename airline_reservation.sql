-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jul 25, 2026 at 08:07 AM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.0.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `airline_reservation`
--

-- --------------------------------------------------------

--
-- Table structure for table `admin`
--

CREATE TABLE `admin` (
  `admin_id` int(11) NOT NULL,
  `username` varchar(50) NOT NULL,
  `password` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `admin`
--

INSERT INTO `admin` (`admin_id`, `username`, `password`) VALUES
(1, 'admin', 'admin123');

-- --------------------------------------------------------

--
-- Table structure for table `bookings`
--

CREATE TABLE `bookings` (
  `booking_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `flight_id` int(11) NOT NULL,
  `seat_id` int(11) NOT NULL,
  `booking_date` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `bookings`
--

INSERT INTO `bookings` (`booking_id`, `user_id`, `flight_id`, `seat_id`, `booking_date`) VALUES
(35, 15, 10, 77, '2026-07-25 06:03:55'),
(36, 14, 13, 138, '2026-07-25 06:05:10'),
(37, 14, 14, 156, '2026-07-25 06:05:48');

-- --------------------------------------------------------

--
-- Table structure for table `flights`
--

CREATE TABLE `flights` (
  `flight_id` int(11) NOT NULL,
  `flight_number` varchar(20) NOT NULL,
  `airline` varchar(100) NOT NULL,
  `origin` varchar(100) NOT NULL,
  `destination` varchar(100) NOT NULL,
  `departure_date` date NOT NULL,
  `departure_time` time NOT NULL,
  `arrival_time` time NOT NULL,
  `price` decimal(10,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `flights`
--

INSERT INTO `flights` (`flight_id`, `flight_number`, `airline`, `origin`, `destination`, `departure_date`, `departure_time`, `arrival_time`, `price`) VALUES
(10, 'SL 325', 'SriLankan Airline', 'Colombo', 'Tokyo', '2026-08-01', '08:00:00', '10:00:00', 400.00),
(11, 'IND 102', 'Air India', 'New Delhi', 'Colombo', '2026-08-14', '16:00:00', '17:15:00', 100.00),
(12, 'UK 809', 'Air UK', 'London', 'Beijing', '2026-08-20', '01:20:00', '15:50:00', 800.00),
(13, 'SL 303', 'SriLankan Airline', 'Colombo', 'Dubai', '2026-08-30', '08:00:00', '23:20:00', 1000.00),
(14, 'TH 406', 'Thai Air', 'Thailand', 'New York', '2026-09-02', '04:00:00', '17:00:00', 960.00);

-- --------------------------------------------------------

--
-- Table structure for table `payments`
--

CREATE TABLE `payments` (
  `payment_id` int(11) NOT NULL,
  `booking_id` int(11) DEFAULT NULL,
  `transaction_id` varchar(50) DEFAULT NULL,
  `amount` decimal(10,2) DEFAULT NULL,
  `payment_method` varchar(50) DEFAULT NULL,
  `payment_date` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `payments`
--

INSERT INTO `payments` (`payment_id`, `booking_id`, `transaction_id`, `amount`, `payment_method`, `payment_date`) VALUES
(22, 35, 'TXN1784959435839', 400.00, 'MasterCard', '2026-07-25 06:03:55'),
(23, 36, 'TXN1784959510777', 1000.00, 'Visa', '2026-07-25 06:05:10'),
(24, 37, 'TXN1784959548702', 960.00, 'MasterCard', '2026-07-25 06:05:48');

-- --------------------------------------------------------

--
-- Table structure for table `seats`
--

CREATE TABLE `seats` (
  `seat_id` int(11) NOT NULL,
  `flight_id` int(11) NOT NULL,
  `seat_number` varchar(10) NOT NULL,
  `status` enum('Available','Booked') DEFAULT 'Available'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `seats`
--

INSERT INTO `seats` (`seat_id`, `flight_id`, `seat_number`, `status`) VALUES
(66, 10, 'A1', 'Available'),
(67, 10, 'A2', 'Available'),
(68, 10, 'A3', 'Available'),
(69, 10, 'A4', 'Available'),
(70, 10, 'A5', 'Available'),
(71, 10, 'B1', 'Available'),
(72, 10, 'B2', 'Available'),
(73, 10, 'B3', 'Available'),
(74, 10, 'B4', 'Available'),
(75, 10, 'B5', 'Available'),
(76, 10, 'C1', 'Available'),
(77, 10, 'C2', 'Booked'),
(78, 10, 'C3', 'Available'),
(79, 10, 'C4', 'Available'),
(80, 10, 'C5', 'Available'),
(81, 10, 'D1', 'Available'),
(82, 10, 'D2', 'Available'),
(83, 10, 'D3', 'Available'),
(84, 10, 'D4', 'Available'),
(85, 10, 'D5', 'Available'),
(86, 11, 'A1', 'Available'),
(87, 11, 'A2', 'Available'),
(88, 11, 'A3', 'Available'),
(89, 11, 'A4', 'Available'),
(90, 11, 'A5', 'Available'),
(91, 11, 'B1', 'Available'),
(92, 11, 'B2', 'Available'),
(93, 11, 'B3', 'Available'),
(94, 11, 'B4', 'Available'),
(95, 11, 'B5', 'Available'),
(96, 11, 'C1', 'Available'),
(97, 11, 'C2', 'Available'),
(98, 11, 'C3', 'Available'),
(99, 11, 'C4', 'Available'),
(100, 11, 'C5', 'Available'),
(101, 11, 'D1', 'Available'),
(102, 11, 'D2', 'Available'),
(103, 11, 'D3', 'Available'),
(104, 11, 'D4', 'Available'),
(105, 11, 'D5', 'Available'),
(106, 12, 'A1', 'Available'),
(107, 12, 'A2', 'Available'),
(108, 12, 'A3', 'Available'),
(109, 12, 'A4', 'Available'),
(110, 12, 'A5', 'Available'),
(111, 12, 'B1', 'Available'),
(112, 12, 'B2', 'Available'),
(113, 12, 'B3', 'Available'),
(114, 12, 'B4', 'Available'),
(115, 12, 'B5', 'Available'),
(116, 12, 'C1', 'Available'),
(117, 12, 'C2', 'Available'),
(118, 12, 'C3', 'Available'),
(119, 12, 'C4', 'Available'),
(120, 12, 'C5', 'Available'),
(121, 12, 'D1', 'Available'),
(122, 12, 'D2', 'Available'),
(123, 12, 'D3', 'Available'),
(124, 12, 'D4', 'Available'),
(125, 12, 'D5', 'Available'),
(126, 13, 'A1', 'Available'),
(127, 13, 'A2', 'Available'),
(128, 13, 'A3', 'Available'),
(129, 13, 'A4', 'Available'),
(130, 13, 'A5', 'Available'),
(131, 13, 'B1', 'Available'),
(132, 13, 'B2', 'Available'),
(133, 13, 'B3', 'Available'),
(134, 13, 'B4', 'Available'),
(135, 13, 'B5', 'Available'),
(136, 13, 'C1', 'Available'),
(137, 13, 'C2', 'Available'),
(138, 13, 'C3', 'Booked'),
(139, 13, 'C4', 'Available'),
(140, 13, 'C5', 'Available'),
(141, 13, 'D1', 'Available'),
(142, 13, 'D2', 'Available'),
(143, 13, 'D3', 'Available'),
(144, 13, 'D4', 'Available'),
(145, 13, 'D5', 'Available'),
(146, 14, 'A1', 'Available'),
(147, 14, 'A2', 'Available'),
(148, 14, 'A3', 'Available'),
(149, 14, 'A4', 'Available'),
(150, 14, 'A5', 'Available'),
(151, 14, 'B1', 'Available'),
(152, 14, 'B2', 'Available'),
(153, 14, 'B3', 'Available'),
(154, 14, 'B4', 'Available'),
(155, 14, 'B5', 'Available'),
(156, 14, 'C1', 'Booked'),
(157, 14, 'C2', 'Available'),
(158, 14, 'C3', 'Available'),
(159, 14, 'C4', 'Available'),
(160, 14, 'C5', 'Available'),
(161, 14, 'D1', 'Available'),
(162, 14, 'D2', 'Available'),
(163, 14, 'D3', 'Available'),
(164, 14, 'D4', 'Available'),
(165, 14, 'D5', 'Available');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `user_id` int(11) NOT NULL,
  `full_name` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `password` varchar(100) NOT NULL,
  `phone` varchar(20) DEFAULT NULL,
  `passport_no` varchar(30) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`user_id`, `full_name`, `email`, `password`, `phone`, `passport_no`, `created_at`) VALUES
(12, 'Sahan Rajakaruna', 'sahan@gmail.com', '1111', '0710256458', 'SL/2026/315', '2026-07-25 05:59:50'),
(13, 'Dulin Rathnayake', 'dulin@gmail.com', '1111', '0778694210', 'SL/2024/521', '2026-07-25 06:00:45'),
(14, 'Achira Dilshan', 'achira@gmail.com', '1111', '0714141512', 'SL/2022/897', '2026-07-25 06:01:19'),
(15, 'Praveen Jayathissa', 'praveen@gmail.com', '2222', '0112102056', 'SL/2020/899', '2026-07-25 06:02:06');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`admin_id`),
  ADD UNIQUE KEY `username` (`username`);

--
-- Indexes for table `bookings`
--
ALTER TABLE `bookings`
  ADD PRIMARY KEY (`booking_id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `flight_id` (`flight_id`),
  ADD KEY `seat_id` (`seat_id`);

--
-- Indexes for table `flights`
--
ALTER TABLE `flights`
  ADD PRIMARY KEY (`flight_id`),
  ADD UNIQUE KEY `flight_number` (`flight_number`);

--
-- Indexes for table `payments`
--
ALTER TABLE `payments`
  ADD PRIMARY KEY (`payment_id`),
  ADD KEY `booking_id` (`booking_id`);

--
-- Indexes for table `seats`
--
ALTER TABLE `seats`
  ADD PRIMARY KEY (`seat_id`),
  ADD KEY `flight_id` (`flight_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`user_id`),
  ADD UNIQUE KEY `email` (`email`),
  ADD UNIQUE KEY `passport_no` (`passport_no`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admin`
--
ALTER TABLE `admin`
  MODIFY `admin_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `bookings`
--
ALTER TABLE `bookings`
  MODIFY `booking_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=38;

--
-- AUTO_INCREMENT for table `flights`
--
ALTER TABLE `flights`
  MODIFY `flight_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `payments`
--
ALTER TABLE `payments`
  MODIFY `payment_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- AUTO_INCREMENT for table `seats`
--
ALTER TABLE `seats`
  MODIFY `seat_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=166;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `user_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `bookings`
--
ALTER TABLE `bookings`
  ADD CONSTRAINT `bookings_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `bookings_ibfk_2` FOREIGN KEY (`flight_id`) REFERENCES `flights` (`flight_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `bookings_ibfk_3` FOREIGN KEY (`seat_id`) REFERENCES `seats` (`seat_id`) ON DELETE CASCADE;

--
-- Constraints for table `payments`
--
ALTER TABLE `payments`
  ADD CONSTRAINT `payments_ibfk_1` FOREIGN KEY (`booking_id`) REFERENCES `bookings` (`booking_id`);

--
-- Constraints for table `seats`
--
ALTER TABLE `seats`
  ADD CONSTRAINT `seats_ibfk_1` FOREIGN KEY (`flight_id`) REFERENCES `flights` (`flight_id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
