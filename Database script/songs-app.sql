-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: May 07, 2023 at 04:03 PM
-- Server version: 10.4.21-MariaDB
-- PHP Version: 8.0.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `songs-app`
--

-- --------------------------------------------------------

--
-- Table structure for table `s001_categories`
--

CREATE TABLE `s001_categories` (
  `id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `is_deleted` tinyint(1) NOT NULL DEFAULT 0 COMMENT '0 => active record,\r\n1 => deleted record'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `s001_categories`
--

INSERT INTO `s001_categories` (`id`, `name`, `is_deleted`) VALUES
(1, 'Pop', 0),
(2, 'Hip hop', 0),
(3, 'Rock', 0),
(4, 'Soul', 0),
(5, 'Folk', 0),
(6, 'Jazz', 0),
(7, 'Disco', 0),
(8, 'Classical', 0);

-- --------------------------------------------------------

--
-- Table structure for table `s002_artists`
--

CREATE TABLE `s002_artists` (
  `id` bigint(20) NOT NULL,
  `name` varchar(100) NOT NULL,
  `is_deleted` tinyint(1) NOT NULL DEFAULT 0 COMMENT '0 => active record,\r\n1 => deleted record',
  `created_date` datetime DEFAULT NULL,
  `updated_date` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `s002_artists`
--

INSERT INTO `s002_artists` (`id`, `name`, `is_deleted`, `created_date`, `updated_date`) VALUES
(1, 'Taylor swift', 0, '2023-05-07 16:15:11', '2023-05-07 16:15:11'),
(2, 'Katy Perry', 0, '2023-05-07 16:15:11', '2023-05-07 16:15:11'),
(3, 'Justin Bieber', 0, '2023-05-07 16:15:11', '2023-05-07 16:15:11'),
(4, 'Lady Gaga', 0, '2023-05-07 16:15:11', '2023-05-07 16:15:11'),
(5, 'Ed Sheeran', 0, '2023-05-07 16:15:11', '2023-05-07 16:15:11'),
(6, 'Elton John', 0, '2023-05-07 16:15:11', '2023-05-07 16:15:11'),
(7, 'Rihanna', 0, '2023-05-07 16:15:11', '2023-05-07 16:15:11'),
(8, 'Mariah Carey', 0, '2023-05-07 16:15:11', '2023-05-07 16:15:11'),
(9, 'Justin Timberlake', 0, '2023-05-07 16:15:11', '2023-05-07 16:15:11'),
(10, 'Bob Dylan', 0, '2023-05-07 16:15:11', '2023-05-07 16:15:11'),
(11, 'Michael Jackson', 0, '2023-05-07 16:15:11', '2023-05-07 16:15:11'),
(12, 'David Bowie', 0, '2023-05-07 16:15:11', '2023-05-07 16:15:11');

-- --------------------------------------------------------

--
-- Table structure for table `s003_songs`
--

CREATE TABLE `s003_songs` (
  `id` bigint(20) NOT NULL,
  `name` varchar(100) NOT NULL,
  `album_name` varchar(100) DEFAULT NULL,
  `category` int(11) DEFAULT NULL,
  `type` enum('a','v') DEFAULT NULL COMMENT 'a => audio,\r\nv => video',
  `artists` varchar(100) DEFAULT NULL COMMENT 'comma seperated artists ids',
  `length` float DEFAULT NULL COMMENT 'Song length in minutes',
  `media_url` varchar(300) DEFAULT NULL,
  `cover_image` varchar(300) DEFAULT NULL,
  `is_deleted` tinyint(1) NOT NULL DEFAULT 0 COMMENT '0 => active record,\r\n1 => deleted record',
  `created_date` datetime DEFAULT NULL,
  `updated_date` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `s003_songs`
--

INSERT INTO `s003_songs` (`id`, `name`, `album_name`, `category`, `type`, `artists`, `length`, `media_url`, `cover_image`, `is_deleted`, `created_date`, `updated_date`) VALUES
(1, 'Song 1', 'Album 1', 1, 'v', '1,5', 3.5, 'https://www.youtube.com/watch?v=77YwsoKsNV8', 'null', 0, '2023-05-07 16:17:53', '2023-05-07 16:17:53'),
(2, 'Song 2', 'Album 2', 2, 'a', '1,2', 2.53, 'https://cdn.pixabay.com/audio/2022/10/14/audio_9939f792cb.mp3?filename=the-beat-of-nature-122841.mp3', NULL, 0, '2023-05-07 16:17:53', '2023-05-07 16:17:53'),
(3, 'Song 3', 'Album 3', 3, 'a', '11,12,2', 2.18, 'https://cdn.pixabay.com/audio/2022/05/05/audio_1395e7800f.mp3?filename=forest-lullaby-110624.mp3', NULL, 0, '2023-05-07 16:17:53', '2023-05-07 16:17:53'),
(4, 'Song 4', 'Album 4', 4, 'a', '2', 2.4, 'https://cdn.pixabay.com/audio/2021/11/23/audio_64b2dd1bce.mp3?filename=just-relax-11157.mp3', 'https://cdn.pixabay.com/audio/2023/04/03/14-44-18-281_200x200.png', 0, '2023-05-07 16:17:53', '2023-05-07 16:17:53'),
(5, 'Song 5', 'Album 5', 5, 'a', '3,4', 3.09, 'https://cdn.pixabay.com/download/audio/2022/08/02/audio_884fe92c21.mp3?filename=inspiring-cinematic-ambient-116199.mp3', 'https://cdn.pixabay.com/audio/2022/04/13/11-20-13-185_200x200.jpg', 0, '2023-05-07 16:17:53', '2023-05-07 16:17:53'),
(6, 'Song 6', 'Album 6', 6, 'a', '5', 1.5, 'https://cdn.pixabay.com/download/audio/2022/01/18/audio_d0a13f69d2.mp3?filename=electronic-rock-king-around-here-15045.mp3', NULL, 0, '2023-05-07 16:17:53', '2023-05-07 16:17:53'),
(7, 'Song 7', 'Album 7', 7, 'a', '6,7', 1.5, 'https://cdn.pixabay.com/download/audio/2022/10/25/audio_3ea72d75c6.mp3?filename=drop-it-124014.mp3', 'https://cdn.pixabay.com/audio/2023/04/03/14-44-18-281_200x200.png', 0, '2023-05-07 16:17:53', '2023-05-07 16:17:53'),
(8, 'Song 8', 'Album 8', 8, 'a', '8', 1.5, 'https://cdn.pixabay.com/audio/2022/01/26/audio_d0c6ff1bdd.mp3?filename=the-cradle-of-your-soul-15700.mp3', NULL, 0, '2023-05-07 16:17:53', '2023-05-07 16:17:53'),
(9, 'Song 9', 'Album 9', 1, 'a', '9', 1.5, 'https://cdn.pixabay.com/audio/2022/04/27/audio_30ff2fdf22.mp3?filename=sedative-110241.mp3', 'https://cdn.pixabay.com/audio/2022/04/13/11-20-13-185_200x200.jpg', 0, '2023-05-07 16:17:53', '2023-05-07 16:17:53'),
(10, 'Song 10', 'Album 10', 2, 'v', '10,11', 3.5, 'https://www.youtube.com/watch?v=77YwsoKsNV8', NULL, 0, '2023-05-07 16:17:53', '2023-05-07 16:17:53'),
(11, 'Song 11', 'Album 11', 3, 'v', '12', 1.5, 'https://www.youtube.com/watch?v=77YwsoKsNV8', 'https://cdn.pixabay.com/audio/2022/04/13/11-20-13-185_200x200.jpg', 0, '2023-05-07 16:17:53', '2023-05-07 16:17:53'),
(12, 'Song 12', 'Album 12', 4, 'a', '5', 2.53, 'https://cdn.pixabay.com/audio/2022/10/14/audio_9939f792cb.mp3?filename=the-beat-of-nature-122841.mp3', NULL, 0, '2023-05-07 16:17:53', '2023-05-07 16:17:53'),
(13, 'Song 13', 'Album 13', 5, 'a', '10', 2.18, 'https://cdn.pixabay.com/audio/2022/05/05/audio_1395e7800f.mp3?filename=forest-lullaby-110624.mp3', NULL, 0, '2023-05-07 16:17:53', '2023-05-07 16:17:53'),
(14, 'Song 14', 'Album 14', 6, 'a', '11', 2.4, 'https://cdn.pixabay.com/audio/2021/11/23/audio_64b2dd1bce.mp3?filename=just-relax-11157.mp3', 'https://cdn.pixabay.com/audio/2023/04/03/14-44-18-281_200x200.png', 0, '2023-05-07 16:17:53', '2023-05-07 16:17:53'),
(15, 'Song 15', 'Album 15', 7, 'a', '1,12', 3.09, 'https://cdn.pixabay.com/download/audio/2022/08/02/audio_884fe92c21.mp3?filename=inspiring-cinematic-ambient-116199.mp3', 'https://cdn.pixabay.com/audio/2022/04/13/11-20-13-185_200x200.jpg', 0, '2023-05-07 16:17:53', '2023-05-07 16:17:53'),
(16, 'Song 16', 'Album 16', 8, 'a', '1,5', 1.5, 'https://cdn.pixabay.com/download/audio/2022/01/18/audio_d0a13f69d2.mp3?filename=electronic-rock-king-around-here-15045.mp3', NULL, 0, '2023-05-07 16:17:53', '2023-05-07 16:17:53'),
(17, 'Song 17', 'Album 17', 8, 'a', '7', 1.5, 'https://cdn.pixabay.com/download/audio/2022/10/25/audio_3ea72d75c6.mp3?filename=drop-it-124014.mp3', 'https://cdn.pixabay.com/audio/2023/04/03/14-44-18-281_200x200.png', 0, '2023-05-07 16:17:53', '2023-05-07 16:17:53'),
(18, 'Song 18', 'Album 18', 7, 'a', '8', 1.5, 'https://cdn.pixabay.com/audio/2022/01/26/audio_d0c6ff1bdd.mp3?filename=the-cradle-of-your-soul-15700.mp3', NULL, 0, '2023-05-07 16:17:53', '2023-05-07 16:17:53'),
(19, 'Song 19', 'Album 19', 6, 'a', '2', 1.5, 'https://cdn.pixabay.com/audio/2022/04/27/audio_30ff2fdf22.mp3?filename=sedative-110241.mp3', 'https://cdn.pixabay.com/audio/2022/04/13/11-20-13-185_200x200.jpg', 0, '2023-05-07 16:17:53', '2023-05-07 16:17:53'),
(20, 'Song 20', 'Album 20', 5, 'v', '3', 3.5, 'https://www.youtube.com/watch?v=77YwsoKsNV8', NULL, 0, '2023-05-07 16:17:53', '2023-05-07 16:17:53'),
(21, 'Song 21', 'Album 21', 4, 'v', '5,7', 1.5, 'https://www.youtube.com/watch?v=77YwsoKsNV8', 'https://cdn.pixabay.com/audio/2022/04/13/11-20-13-185_200x200.jpg', 0, '2023-05-07 16:17:53', '2023-05-07 16:17:53'),
(22, 'Song 22', 'Album 22', 3, 'a', '9', 2.53, 'https://cdn.pixabay.com/audio/2022/10/14/audio_9939f792cb.mp3?filename=the-beat-of-nature-122841.mp3', NULL, 0, '2023-05-07 16:17:53', '2023-05-07 16:17:53'),
(23, 'Song 23', 'Album 23', 2, 'a', '12', 2.18, 'https://cdn.pixabay.com/audio/2022/05/05/audio_1395e7800f.mp3?filename=forest-lullaby-110624.mp3', NULL, 0, '2023-05-07 16:17:53', '2023-05-07 16:17:53'),
(24, 'Song 24', 'Album 24', 1, 'a', '12,7', 2.4, 'https://cdn.pixabay.com/audio/2021/11/23/audio_64b2dd1bce.mp3?filename=just-relax-11157.mp3', 'https://cdn.pixabay.com/audio/2023/04/03/14-44-18-281_200x200.png', 0, '2023-05-07 16:17:53', '2023-05-07 16:17:53'),
(25, 'Song 25', 'Album 25', 1, 'a', '5,8', 3.09, 'https://cdn.pixabay.com/download/audio/2022/08/02/audio_884fe92c21.mp3?filename=inspiring-cinematic-ambient-116199.mp3', 'https://cdn.pixabay.com/audio/2022/04/13/11-20-13-185_200x200.jpg', 0, '2023-05-07 16:17:53', '2023-05-07 16:17:53'),
(26, 'Song 26', 'Album 26', 2, 'a', '3,6', 1.5, 'https://cdn.pixabay.com/download/audio/2022/01/18/audio_d0a13f69d2.mp3?filename=electronic-rock-king-around-here-15045.mp3', NULL, 0, '2023-05-07 16:17:53', '2023-05-07 16:17:53'),
(27, 'Song 27', 'Album 27', 3, 'a', '5', 1.5, 'https://cdn.pixabay.com/download/audio/2022/10/25/audio_3ea72d75c6.mp3?filename=drop-it-124014.mp3', 'https://cdn.pixabay.com/audio/2023/04/03/14-44-18-281_200x200.png', 0, '2023-05-07 16:17:53', '2023-05-07 16:17:53'),
(28, 'Song 28', 'Album 28', 4, 'a', '7', 1.5, 'https://cdn.pixabay.com/audio/2022/01/26/audio_d0c6ff1bdd.mp3?filename=the-cradle-of-your-soul-15700.mp3', NULL, 0, '2023-05-07 16:17:53', '2023-05-07 16:17:53'),
(29, 'Song 29', 'Album 29', 5, 'a', '9', 1.5, 'https://cdn.pixabay.com/audio/2022/04/27/audio_30ff2fdf22.mp3?filename=sedative-110241.mp3', 'https://cdn.pixabay.com/audio/2022/04/13/11-20-13-185_200x200.jpg', 0, '2023-05-07 16:17:53', '2023-05-07 16:17:53'),
(30, 'Song 30', 'Album 30', 6, 'v', '1', 3.5, 'https://www.youtube.com/watch?v=77YwsoKsNV8', NULL, 0, '2023-05-07 16:17:53', '2023-05-07 16:17:53'),
(31, 'Test Song 1', 'Test album 1', 1, 'v', '1,5', 3.5, 'https://www.youtube.com/watch?v=77YwsoKsNV8', 'null', 0, '2023-05-07 16:17:53', '2023-05-07 16:59:39');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `s001_categories`
--
ALTER TABLE `s001_categories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `s002_artists`
--
ALTER TABLE `s002_artists`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `s003_songs`
--
ALTER TABLE `s003_songs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `category` (`category`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `s001_categories`
--
ALTER TABLE `s001_categories`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `s002_artists`
--
ALTER TABLE `s002_artists`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `s003_songs`
--
ALTER TABLE `s003_songs`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=33;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `s003_songs`
--
ALTER TABLE `s003_songs`
  ADD CONSTRAINT `s003_songs_ibfk_1` FOREIGN KEY (`category`) REFERENCES `s001_categories` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
