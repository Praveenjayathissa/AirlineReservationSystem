-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jul 24, 2026 at 12:43 PM
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
(19, 7, 1, 1, '2026-07-22 22:47:48'),
(22, 9, 1, 8, '2026-07-23 06:54:24'),
(26, 1, 2, 22, '2026-07-24 06:32:23'),
(27, 1, 2, 25, '2026-07-24 06:32:34'),
(28, 1, 1, 10, '2026-07-24 06:32:43'),
(29, 1, 2, 17, '2026-07-24 07:20:24'),
(30, 10, 2, 26, '2026-07-24 07:47:50'),
(31, 1, 2, 20, '2026-07-24 07:52:17'),
(32, 10, 9, 47, '2026-07-24 08:03:55'),
(33, 11, 9, 62, '2026-07-24 08:23:24'),
(34, 11, 2, 24, '2026-07-24 08:24:00');

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
(1, 'UL101', 'SriLankan Airlines', 'Colombo', 'London', '2026-08-10', '08:00:00', '18:30:00', 850.00),
(2, 'UL205', 'SriLankan Airlines', 'Colombo', 'Dubai', '2026-08-12', '10:00:00', '14:30:00', 420.00),
(7, 'SL303', 'Sri Lankan Airline', 'Colombo', 'Japan', '2026-02-12', '12:52:00', '12:52:00', 750.00),
(8, 'UL 420', 'SriLankan Airlines', 'Colombo', 'Canada', '2026-12-31', '02:00:00', '00:00:00', 950.00),
(9, '0111', 'Air India', 'New Delhi', 'Colombo', '2027-01-12', '04:56:00', '05:15:00', 50.00);

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
(6, 19, 'TXN1784760468570', 850.00, 'Visa', '2026-07-22 22:47:48'),
(9, 22, 'TXN1784789664772', 850.00, 'Visa', '2026-07-23 06:54:24'),
(13, 26, 'TXN1784874743501', 420.00, 'Visa', '2026-07-24 06:32:23'),
(14, 27, 'TXN1784874754955', 420.00, 'Visa', '2026-07-24 06:32:34'),
(15, 28, 'TXN1784874763911', 850.00, 'Visa', '2026-07-24 06:32:43'),
(16, 29, 'TXN1784877624147', 420.00, 'Visa', '2026-07-24 07:20:24'),
(17, 30, 'TXN1784879270783', 420.00, 'Visa', '2026-07-24 07:47:50'),
(18, 31, 'TXN1784879538018', 420.00, 'Visa', '2026-07-24 07:52:18'),
(19, 32, 'TXN1784880235741', 50.00, 'Visa', '2026-07-24 08:03:55'),
(20, 33, 'TXN1784881404410', 50.00, 'Visa', '2026-07-24 08:23:24'),
(21, 34, 'TXN1784881440858', 420.00, 'Visa', '2026-07-24 08:24:00');

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
(1, 1, 'A1', 'Booked'),
(2, 1, 'A2', 'Available'),
(3, 1, 'A3', 'Available'),
(4, 1, 'B1', 'Available'),
(5, 1, 'B2', 'Available'),
(6, 1, 'B3', 'Available'),
(7, 1, 'C1', 'Available'),
(8, 1, 'C2', 'Booked'),
(9, 1, 'C3', 'Available'),
(10, 1, 'D1', 'Booked'),
(11, 1, 'D2', 'Available'),
(12, 1, 'D3', 'Available'),
(13, 1, 'E1', 'Available'),
(14, 1, 'E2', 'Available'),
(15, 1, 'E3', 'Available'),
(16, 2, 'A1', 'Available'),
(17, 2, 'A2', 'Booked'),
(18, 2, 'A3', 'Available'),
(19, 2, 'B1', 'Available'),
(20, 2, 'B2', 'Booked'),
(21, 2, 'B3', 'Available'),
(22, 2, 'C1', 'Booked'),
(23, 2, 'C2', 'Available'),
(24, 2, 'C3', 'Booked'),
(25, 2, 'D1', 'Booked'),
(26, 2, 'D2', 'Booked'),
(27, 2, 'D3', 'Available'),
(28, 2, 'E1', 'Available'),
(29, 2, 'E2', 'Available'),
(30, 2, 'E3', 'Available'),
(46, 9, 'A1', 'Available'),
(47, 9, 'A2', 'Booked'),
(48, 9, 'A3', 'Available'),
(49, 9, 'A4', 'Available'),
(50, 9, 'A5', 'Available'),
(51, 9, 'B1', 'Available'),
(52, 9, 'B2', 'Available'),
(53, 9, 'B3', 'Available'),
(54, 9, 'B4', 'Available'),
(55, 9, 'B5', 'Available'),
(56, 9, 'C1', 'Available'),
(57, 9, 'C2', 'Available'),
(58, 9, 'C3', 'Available'),
(59, 9, 'C4', 'Available'),
(60, 9, 'C5', 'Available'),
(61, 9, 'D1', 'Available'),
(62, 9, 'D2', 'Booked'),
(63, 9, 'D3', 'Available'),
(64, 9, 'D4', 'Available'),
(65, 9, 'D5', 'Available');

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
(1, 'Achira Dilshan', 'achira@gmail.com', '1111', '0714141512', '2026518', '2026-07-21 16:46:56'),
(2, 'Saranga Ravindu', 'saranga@gmail.com', '1111', '0714141512', '256', '2026-07-22 21:42:07'),
(7, 'Ravindu Saranga', 'ravindu@gmail.com', '1111', '0714141512', '56666', '2026-07-22 22:43:31'),
(8, 'Osuka Lochana', 'osuka@gmail.com', '2222', '0112102056', 'SL/20216/315', '2026-07-22 23:19:49'),
(9, 'osuka ', 'osuka1@gmail.com', '3333', '0714141512', 'SL\\2026\\356', '2026-07-23 06:48:17'),
(10, 'Pulindu Ransaka', 'puli@gmail.com', '5262', '0714141512', 'SL/26/897', '2026-07-24 07:42:33'),
(11, 'inuka', '11@gmail.com', '1111', '0714141512', 'SL\\2026\\358', '2026-07-24 08:22:48');

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
  MODIFY `booking_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=35;

--
-- AUTO_INCREMENT for table `flights`
--
ALTER TABLE `flights`
  MODIFY `flight_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `payments`
--
ALTER TABLE `payments`
  MODIFY `payment_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT for table `seats`
--
ALTER TABLE `seats`
  MODIFY `seat_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=66;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `user_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

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
