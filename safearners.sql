-- phpMyAdmin SQL Dump
-- version 4.5.1
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Nov 06, 2017 at 04:55 PM
-- Server version: 10.1.13-MariaDB
-- PHP Version: 5.5.35

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `safearners`
--

-- --------------------------------------------------------

--
-- Table structure for table `account_earnings`
--

CREATE TABLE `account_earnings` (
  `id` int(11) NOT NULL,
  `depositAccountId` int(11) NOT NULL,
  `amount` decimal(10,2) DEFAULT NULL,
  `transaction_type` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `deposit_account`
--

CREATE TABLE `deposit_account` (
  `id` int(11) NOT NULL,
  `packageId` int(11) DEFAULT NULL,
  `userId` int(11) DEFAULT NULL,
  `dateCreated` datetime DEFAULT NULL,
  `active` tinyint(1) DEFAULT '1',
  `amount` decimal(10,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `packages`
--

CREATE TABLE `packages` (
  `id` int(11) NOT NULL,
  `title` varchar(45) DEFAULT NULL,
  `amount` varchar(45) DEFAULT NULL,
  `packagType` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `package_type`
--

CREATE TABLE `package_type` (
  `id` int(11) NOT NULL,
  `title` varchar(45) DEFAULT NULL,
  `paymentFreq` int(11) DEFAULT NULL,
  `percentEarning` decimal(5,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `payment_freq`
--

CREATE TABLE `payment_freq` (
  `id` int(11) NOT NULL,
  `title` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `referals`
--

CREATE TABLE `referals` (
  `id` int(11) NOT NULL,
  `userId` int(11) DEFAULT NULL,
  `partnerId` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `referal_generation`
--

CREATE TABLE `referal_generation` (
  `id` int(11) NOT NULL COMMENT 'This table will hold the % calcultions according to the referal generation levels',
  `title` varchar(45) DEFAULT NULL,
  `percentage_earnings` tinyint(2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `temp_token`
--

CREATE TABLE `temp_token` (
  `user_id` int(11) NOT NULL,
  `token` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `username` varchar(45) DEFAULT NULL,
  `password` varchar(100) DEFAULT NULL,
  `email` varchar(45) DEFAULT NULL,
  `firstname` varchar(45) DEFAULT NULL,
  `lastname` varchar(45) DEFAULT NULL,
  `othername` varchar(45) DEFAULT NULL,
  `phone` varchar(45) DEFAULT NULL,
  `dateAdded` int(11) NOT NULL,
  `dateModified` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `token` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `username`, `password`, `email`, `firstname`, `lastname`, `othername`, `phone`, `dateAdded`, `dateModified`, `token`) VALUES
(12, 'platin65', '$2y$10$G/2R5RErF45GhOPvYGQrhuOSx7FN.vkNx/OSGdwm/AnHrV3v4TZG2', 'mplat84@gmail.com', 'a', 'b', 'h', '93489348938934', 1509922800, '2017-11-06 11:57:23', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `withdraws`
--

CREATE TABLE `withdraws` (
  `id` int(11) NOT NULL,
  `depositAccountId` int(11) NOT NULL,
  `Amount` decimal(15,2) DEFAULT NULL,
  `withdrawDate` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `account_earnings`
--
ALTER TABLE `account_earnings`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_account_earnings_deposit_account1_idx` (`depositAccountId`);

--
-- Indexes for table `deposit_account`
--
ALTER TABLE `deposit_account`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_deposit_account_users_idx` (`userId`),
  ADD KEY `fk_deposit_account_packages1_idx` (`packageId`);

--
-- Indexes for table `packages`
--
ALTER TABLE `packages`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_packages_package_type1_idx` (`packagType`);

--
-- Indexes for table `package_type`
--
ALTER TABLE `package_type`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_package_type_payment_freq1_idx` (`paymentFreq`);

--
-- Indexes for table `payment_freq`
--
ALTER TABLE `payment_freq`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `referals`
--
ALTER TABLE `referals`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_referals_users1_idx` (`userId`),
  ADD KEY `fk_referals_users2_idx` (`partnerId`);

--
-- Indexes for table `referal_generation`
--
ALTER TABLE `referal_generation`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `withdraws`
--
ALTER TABLE `withdraws`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_withdraws_deposit_account1_idx` (`depositAccountId`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `account_earnings`
--
ALTER TABLE `account_earnings`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `deposit_account`
--
ALTER TABLE `deposit_account`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `packages`
--
ALTER TABLE `packages`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `package_type`
--
ALTER TABLE `package_type`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `payment_freq`
--
ALTER TABLE `payment_freq`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `referals`
--
ALTER TABLE `referals`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `referal_generation`
--
ALTER TABLE `referal_generation`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'This table will hold the % calcultions according to the referal generation levels';
--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;
--
-- Constraints for dumped tables
--

--
-- Constraints for table `account_earnings`
--
ALTER TABLE `account_earnings`
  ADD CONSTRAINT `fk_account_earnings_deposit_account1` FOREIGN KEY (`depositAccountId`) REFERENCES `deposit_account` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `deposit_account`
--
ALTER TABLE `deposit_account`
  ADD CONSTRAINT `fk_deposit_account_packages1` FOREIGN KEY (`packageId`) REFERENCES `packages` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_deposit_account_users` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `packages`
--
ALTER TABLE `packages`
  ADD CONSTRAINT `fk_packages_package_type1` FOREIGN KEY (`packagType`) REFERENCES `package_type` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `package_type`
--
ALTER TABLE `package_type`
  ADD CONSTRAINT `fk_package_type_payment_freq1` FOREIGN KEY (`paymentFreq`) REFERENCES `payment_freq` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `referals`
--
ALTER TABLE `referals`
  ADD CONSTRAINT `fk_referals_users1` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_referals_users2` FOREIGN KEY (`partnerId`) REFERENCES `users` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `withdraws`
--
ALTER TABLE `withdraws`
  ADD CONSTRAINT `fk_withdraws_deposit_account1` FOREIGN KEY (`depositAccountId`) REFERENCES `deposit_account` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
