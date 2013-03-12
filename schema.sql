-- phpMyAdmin SQL Dump
-- version 3.4.11.1deb1
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Mar 12, 2013 at 12:12 AM
-- Server version: 5.5.29
-- PHP Version: 5.4.6-1ubuntu1.1

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `FAH`
--

-- --------------------------------------------------------

--
-- Table structure for table `team`
--

CREATE TABLE IF NOT EXISTS `team` (
  `id` int(10) unsigned NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `score` bigint(20) unsigned NOT NULL,
  `units` int(10) unsigned NOT NULL,
  `timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `team_name` (`name`),
  KEY `team_score` (`score`),
  KEY `team_wu` (`units`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `updates`
--

CREATE TABLE IF NOT EXISTS `updates` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `status` enum('STARTED','FINISHED','FAILED') NOT NULL,
  `start_timestamp` timestamp NULL DEFAULT NULL,
  `end_timestamp` timestamp NULL DEFAULT NULL,
  `commit_time` float DEFAULT NULL,
  `teams_timestamp` datetime DEFAULT NULL,
  `teams_parsing_time` double DEFAULT NULL,
  `teams_delete_time` double DEFAULT NULL,
  `teams_update_time` double DEFAULT NULL,
  `teams_count` int(10) unsigned DEFAULT NULL,
  `teams_deleted` int(11) unsigned DEFAULT NULL,
  `teams_updated` int(11) unsigned DEFAULT NULL,
  `user_teams_count` int(10) unsigned DEFAULT NULL,
  `user_teams_deleted` int(10) unsigned DEFAULT NULL,
  `user_teams_updated` int(11) unsigned DEFAULT NULL,
  `user_teams_update_time` double DEFAULT NULL,
  `user_teams_delete_time` double DEFAULT NULL,
  `users_timestamp` datetime DEFAULT NULL,
  `users_parsing_time` double DEFAULT NULL,
  `users_delete_time` double DEFAULT NULL,
  `users_update_time` double DEFAULT NULL,
  `users_count` int(10) unsigned DEFAULT NULL,
  `users_deleted` int(11) unsigned DEFAULT NULL,
  `users_updated` int(11) unsigned DEFAULT NULL,
  `output` text,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=72 ;

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE IF NOT EXISTS `user` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `score` bigint(20) unsigned NOT NULL,
  `units` int(10) unsigned NOT NULL,
  `team` int(10) unsigned NOT NULL,
  `timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `user_team` (`team`),
  KEY `user_wu` (`units`),
  KEY `user_score` (`score`),
  KEY `user_name` (`name`,`team`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=3452740 ;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `user`
--
ALTER TABLE `user`
  ADD CONSTRAINT `user_ibfk_1` FOREIGN KEY (`team`) REFERENCES `team` (`id`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
