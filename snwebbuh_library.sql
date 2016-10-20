-- phpMyAdmin SQL Dump
-- version 4.0.10.7
-- http://www.phpmyadmin.net
--
-- Host: localhost:3306
-- Generation Time: Oct 20, 2016 at 09:57 AM
-- Server version: 5.5.45-37.4-log
-- PHP Version: 5.4.31

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `snwebbuh_library`
--

-- --------------------------------------------------------

--
-- Table structure for table `books`
--

CREATE TABLE IF NOT EXISTS `books` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `isbn` varchar(13) DEFAULT NULL,
  `title` varchar(45) DEFAULT NULL,
  `issued_status` int(11) DEFAULT '0' COMMENT 'either 1 or 0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=14 ;

--
-- Dumping data for table `books`
--

INSERT INTO `books` (`id`, `isbn`, `title`, `issued_status`) VALUES
(1, '123', 'the jungle book', 1),
(2, '343', 'Something Wicked This Way Comes', 0),
(3, '567', 'I Was Told There''d Be Cake', 1),
(4, '788', 'The Hollow Chocolate Bunnie', 0),
(5, '557', 'The Man Without Qualities', 0),
(9, '8887', 'abcdefg', 0),
(10, '989', 'new book test', 0),
(11, '7', 'book1', 0),
(12, '8', 'book2', 0),
(13, '989', 'Novel', 0);

-- --------------------------------------------------------

--
-- Table structure for table `books_author`
--

CREATE TABLE IF NOT EXISTS `books_author` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `author` varchar(45) DEFAULT NULL,
  `other_fields` varchar(11) DEFAULT NULL,
  `dateadded` datetime DEFAULT NULL,
  `datemodified` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `books_category`
--

CREATE TABLE IF NOT EXISTS `books_category` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `category` varchar(45) DEFAULT NULL,
  `dateadded` datetime DEFAULT NULL,
  `datemodified` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=4 ;

--
-- Dumping data for table `books_category`
--

INSERT INTO `books_category` (`id`, `category`, `dateadded`, `datemodified`) VALUES
(1, 'science', '2016-10-19 16:20:00', '2016-10-19 16:20:00'),
(2, 'mystery', '2016-10-19 12:20:00', '2016-10-19 16:20:00'),
(3, 'fiction', '2016-10-19 12:20:00', '2016-10-19 16:20:00');

-- --------------------------------------------------------

--
-- Table structure for table `books_detail`
--

CREATE TABLE IF NOT EXISTS `books_detail` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `isbn` int(13) DEFAULT NULL,
  `category_id` int(11) DEFAULT NULL,
  `edition` int(11) DEFAULT NULL,
  `publisher` int(11) DEFAULT NULL,
  `author_id` int(11) DEFAULT NULL,
  `dateadded` datetime DEFAULT NULL,
  `datemodified` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=15 ;

--
-- Dumping data for table `books_detail`
--

INSERT INTO `books_detail` (`id`, `isbn`, `category_id`, `edition`, `publisher`, `author_id`, `dateadded`, `datemodified`) VALUES
(1, 123, 1, 0, 0, 1, '2016-10-19 16:00:00', '2016-10-19 16:00:00'),
(3, 343, 2, 0, 0, 1, '2016-10-19 16:00:00', '2016-10-19 16:00:00'),
(4, 567, 1, 0, 0, 1, '2016-10-19 16:00:00', '2016-10-19 16:00:00'),
(5, 788, 2, 0, 0, 1, '2016-10-19 16:00:00', '2016-10-19 16:00:00'),
(6, 557, 3, 0, 0, 1, '2016-10-19 16:00:00', '2016-10-19 16:00:00'),
(10, 8887, 2, NULL, NULL, NULL, NULL, NULL),
(11, 989, 2, NULL, NULL, NULL, NULL, NULL),
(12, 7, 2, NULL, NULL, NULL, NULL, NULL),
(13, 8, 3, NULL, NULL, NULL, NULL, NULL),
(14, 989, 1, NULL, NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `customers`
--

CREATE TABLE IF NOT EXISTS `customers` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `firstname` varchar(45) DEFAULT NULL,
  `lastname` varchar(45) DEFAULT NULL,
  `email` varchar(45) DEFAULT NULL,
  `password` varchar(45) DEFAULT NULL,
  `city` varchar(45) DEFAULT NULL,
  `number_of_books` int(11) DEFAULT NULL,
  `dateadded` datetime DEFAULT NULL,
  `datemodified` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=8 ;

--
-- Dumping data for table `customers`
--

INSERT INTO `customers` (`id`, `firstname`, `lastname`, `email`, `password`, `city`, `number_of_books`, `dateadded`, `datemodified`) VALUES
(1, 'anil', 'kumar', 'anil@gmail.com', 'somemd5value', 'manchester', 0, '2016-10-19 16:20:00', '2016-10-19 16:20:00'),
(2, 'rajiv', 'kumar', 'rajiv@gmail.com', 'somemd5value', 'manchester', 0, '2016-10-19 16:20:00', '2016-10-19 16:20:00'),
(3, 'abhi', 'kumar', 'abhi@gmail.com', 'somemd5value', 'london', 0, '2016-10-19 16:20:00', '2016-10-19 16:20:00'),
(4, 'amanv', 'thakur', 'aman@gmail.com', 'somemd5value', 'london', 0, '2016-10-19 16:20:00', '2016-10-19 16:20:00'),
(5, 'ravi', 'kumar', 'ravi@gmail.com', 'somemd5value', 'douglas', 0, '2016-10-19 16:20:00', '2016-10-19 16:20:00'),
(6, 'chris', 'gilles', 'chris@gmail.com', 'somemd5value', 'douglas', 0, '2016-10-19 16:20:00', '2016-10-19 16:20:00'),
(7, 'neeraj', 'thakur', 'neerajth@gmail.com', 'somemd5value', 'douglas', 0, '2016-10-19 16:20:00', '2016-10-19 16:20:00');

-- --------------------------------------------------------

--
-- Table structure for table `customer_books`
--

CREATE TABLE IF NOT EXISTS `customer_books` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `customer_id` int(11) DEFAULT NULL,
  `book_id` int(11) DEFAULT NULL,
  `date_issued` datetime DEFAULT NULL,
  `date_returned` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=62 ;

--
-- Dumping data for table `customer_books`
--

INSERT INTO `customer_books` (`id`, `customer_id`, `book_id`, `date_issued`, `date_returned`) VALUES
(59, 5, 1, '2016-10-19 00:00:00', NULL),
(60, 5, 1, '2016-10-19 00:00:00', NULL),
(61, 2, 3, '2016-10-20 00:00:00', NULL);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
