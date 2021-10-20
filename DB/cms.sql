-- phpMyAdmin SQL Dump
-- version 5.0.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jan 16, 2021 at 01:13 PM
-- Server version: 10.4.17-MariaDB
-- PHP Version: 7.4.13

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `cms`
--

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `cat_id` int(3) NOT NULL,
  `cat_title` varchar(300) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`cat_id`, `cat_title`) VALUES
(1, 'Bootstrap'),
(2, 'Javascript'),
(4, 'JAVA'),
(11, 'Dart'),
(12, 'HTML'),
(13, 'CSS'),
(14, 'PHP'),
(15, 'Pearl');

-- --------------------------------------------------------

--
-- Table structure for table `comments`
--

CREATE TABLE `comments` (
  `comment_id` int(3) NOT NULL,
  `comment_post_id` int(3) NOT NULL,
  `comment_author` varchar(255) NOT NULL,
  `comment_email` varchar(255) NOT NULL,
  `comment_content` text NOT NULL,
  `comment_status` varchar(255) NOT NULL,
  `comment_date` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `comments`
--

INSERT INTO `comments` (`comment_id`, `comment_post_id`, `comment_author`, `comment_email`, `comment_content`, `comment_status`, `comment_date`) VALUES
(2, 1, 'Cindy', 'cindy@gmail.com', 'Test comment for cindy', 'unapproved', '2021-01-13'),
(3, 7, 'Jo', 'jo@gmail.com', 'Test comment for Jo', 'approved', '2021-01-13'),
(4, 1, 'Peter', 'peter@gmail.com', 'Test comment for Peter', 'approved', '2021-01-13'),
(5, 1, 'Walim', 'Walim@gmail.com', 'Test comment for Walim', 'approved', '2021-01-13'),
(6, 7, 'Nikhil D', 'test2@gmail.com', 'test2@gmail.com etc', 'approved', '2021-01-13'),
(7, 7, 'Nikhil D', 'test@gmail.com', 'Test Comment 26', 'approved', '2021-01-14'),
(8, 7, 'Nikhil D', 'test@gmail.com', 'Test Comment 26', 'unapproved', '2021-01-14'),
(9, 7, 'Nikhil D', 'test@gmail.com', 'Test', 'unapproved', '2021-01-15'),
(10, 7, 'Nikhil D', 'test@gmail.com', 'Test', 'unapproved', '2021-01-15'),
(11, 7, 'Nikhil D', 'test@gmail.com', 'Test', 'unapproved', '2021-01-15');

-- --------------------------------------------------------

--
-- Table structure for table `logs`
--

CREATE TABLE `logs` (
  `id` int(11) NOT NULL,
  `post_id` int(11) NOT NULL,
  `action` varchar(20) NOT NULL,
  `cdate` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `logs`
--

INSERT INTO `logs` (`id`, `post_id`, `action`, `cdate`) VALUES
(1, 16, 'Inserted', '2021-01-16');

-- --------------------------------------------------------

--
-- Table structure for table `posts`
--

CREATE TABLE `posts` (
  `post_id` int(3) NOT NULL,
  `post_category_id` int(3) NOT NULL,
  `post_title` varchar(255) NOT NULL,
  `post_author` varchar(255) NOT NULL,
  `post_date` date NOT NULL,
  `post_image` text NOT NULL,
  `post_content` text NOT NULL,
  `post_tags` varchar(255) NOT NULL,
  `post_comment_count` int(11) NOT NULL,
  `post_status` varchar(255) NOT NULL DEFAULT 'draft'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `posts`
--

INSERT INTO `posts` (`post_id`, `post_category_id`, `post_title`, `post_author`, `post_date`, `post_image`, `post_content`, `post_tags`, `post_comment_count`, `post_status`) VALUES
(7, 4, 'Why do we use it?', 'Tech4live Staff ', '2021-01-13', 'Screenshot 2021-01-12 164331.png', 'It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout                ', 'PHP, SQL', 0, 'published'),
(9, 1, 'Example Post 3', 'Tech4live Staff ', '2021-01-12', 'eravezkxcaefhf6 (1).jpg', 'Test', 'PHP, SQL', 0, 'published'),
(10, 1, 'Why do we use it?', 'Tech4live', '2021-01-13', 'ErEhW8tW4Asji1P.jpg', 'It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum ', 'Java', 0, 'published'),
(11, 1, 'Test 259', 'Tech4live ', '2021-01-14', 'hotel-workers-Michael-BlannGettyImages.jpg', '        Test Post Content', 'PHP, SQL', 0, 'published'),
(13, 4, 'Test Post 36', 'Tech4live', '2021-01-15', 'burj-al-khalifa-city-lights-wallpaper.jpg', '         Test Content 36', 'PHP, SQL', 0, 'published'),
(15, 4, 'Test 300', 'Tech4live ', '2021-01-15', 'ErOdo9mXEAkVXLe.jpg', 'Test Content 300', 'PHP, SQL', 0, 'published'),
(16, 4, 'Test 301', 'Tech4live ', '2021-01-16', 'eq8y3gqvqaa5o7m (1).jpg', 'Test 301', 'PHP, SQL', 0, 'draft');

--
-- Triggers `posts`
--
DELIMITER $$
CREATE TRIGGER `insertLog` AFTER INSERT ON `posts` FOR EACH ROW INSERT INTO logs VALUES(null, NEW.post_id, 'Inserted', NOW())
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `user_id` int(3) NOT NULL,
  `username` varchar(255) NOT NULL,
  `user_password` varchar(255) NOT NULL,
  `user_firstname` varchar(255) NOT NULL,
  `user_lastname` varchar(255) NOT NULL,
  `user_email` varchar(255) NOT NULL,
  `user_image` text NOT NULL,
  `user_role` varchar(255) NOT NULL,
  `randSalt` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`user_id`, `username`, `user_password`, `user_firstname`, `user_lastname`, `user_email`, `user_image`, `user_role`, `randSalt`) VALUES
(1, 'Rico', '123', 'Rico', 'Suave', 'rico25@gmail.com', '', 'admin', ''),
(4, 'nikhild', '123', 'Nikhil', 'D', 'test2@gmail.com', '', 'admin', ''),
(5, 'Ricky', '123', 'Ricky', 'R', 'petersonri@gmail.com', '', 'admin', ''),
(6, 'Hazelw', '123', 'Hazel', 'Watson', 'Hazelw@gmail.com', '', 'subscriber', ''),
(7, 'Timh', '', 'Tim', 'H', 'Timh@gmail.com', '', 'admin', '');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`cat_id`);

--
-- Indexes for table `comments`
--
ALTER TABLE `comments`
  ADD PRIMARY KEY (`comment_id`);

--
-- Indexes for table `logs`
--
ALTER TABLE `logs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `posts`
--
ALTER TABLE `posts`
  ADD PRIMARY KEY (`post_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`user_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `cat_id` int(3) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `comments`
--
ALTER TABLE `comments`
  MODIFY `comment_id` int(3) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `logs`
--
ALTER TABLE `logs`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `posts`
--
ALTER TABLE `posts`
  MODIFY `post_id` int(3) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `user_id` int(3) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
