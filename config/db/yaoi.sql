-- phpMyAdmin SQL Dump
-- version 4.8.2
-- https://www.phpmyadmin.net/
--
-- Host: db
-- Generation Time: Aug 26, 2018 at 09:49 AM
-- Server version: 5.6.40
-- PHP Version: 7.2.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `yaoi`
--

-- --------------------------------------------------------

--
-- Table structure for table `category`
--

CREATE TABLE `category` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `status` tinyint(2) NOT NULL,
  `create_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `category`
--

INSERT INTO `category` (`id`, `name`, `status`, `create_date`) VALUES
(1, 'นิยายรัก', 0, '2018-08-24 07:41:03'),
(2, 'นิยาย Yaoi', 0, '2018-08-25 03:16:05'),
(3, 'นิยาย Yuri', 0, '2018-08-25 03:15:47'),
(4, 'นิยายดราม่า', 0, '2018-08-24 07:42:28'),
(5, 'นิยายลึกลับ', 0, '2018-08-24 07:43:05'),
(6, 'นิยายแฟนตาซี', 0, '2018-08-24 07:43:05'),
(7, 'บทความ', 0, '2018-08-24 07:43:16'),
(8, 'วรรณกรรม', 0, '2018-08-25 03:15:51'),
(9, 'อื่นๆ', 0, '2018-08-25 03:15:37');

-- --------------------------------------------------------

--
-- Table structure for table `content_rating`
--

CREATE TABLE `content_rating` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `status` tinyint(1) NOT NULL,
  `create_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `content_rating`
--

INSERT INTO `content_rating` (`id`, `name`, `status`, `create_date`) VALUES
(1, 'ทุกวัย', 0, '2018-08-25 03:19:20'),
(2, 'อายุ 3-5 ปี ', 0, '2018-08-25 03:19:20'),
(3, 'อายุ 6-12 ปี', 0, '2018-08-25 03:20:12'),
(4, 'อายุ 13 ปีขึ้นไป', 0, '2018-08-25 03:20:12'),
(5, 'อายุ 18 ปีขึ้นไป', 0, '2018-08-25 03:20:24'),
(6, 'อายุ 20 ปีขึ้นไป', 0, '2018-08-25 03:20:24');

-- --------------------------------------------------------

--
-- Table structure for table `fiction`
--

CREATE TABLE `fiction` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `cover_path_name` varchar(255) NOT NULL,
  `title` varchar(255) NOT NULL,
  `synopsis` varchar(255) NOT NULL,
  `author` varchar(255) NOT NULL,
  `category_id` int(11) NOT NULL,
  `content_rating_id` int(11) NOT NULL,
  `preface` text NOT NULL,
  `amt_comment` int(11) NOT NULL,
  `amt_read` int(11) NOT NULL,
  `create_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `status` tinyint(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `fiction`
--

INSERT INTO `fiction` (`id`, `user_id`, `cover_path_name`, `title`, `synopsis`, `author`, `category_id`, `content_rating_id`, `preface`, `amt_comment`, `amt_read`, `create_date`, `status`) VALUES
(1, 1, 'covers-1534863647852.jpg', 'ชื่อเรื่อง', 'คำโปรย', 'นามปากกา', 1, 2, '', 0, 0, '2018-08-23 17:06:22', 0),
(2, 1, 'covers-1534863647852.jpg', 'ชื่อเรื่อง', 'คำโปรย', 'นามปากกา', 1, 2, '<p style=\"text-align:center;\"><span style=\"color: rgb(33,37,41);background-color: rgb(255,255,255);font-size: 1.75rem;font-family: sans-serif;\">คำนำเรื่อง</span></p>\r\n', 0, 0, '2018-08-23 17:06:22', 0),
(3, 1, 'covers-1534863647852.jpg', 'ชื่อเรื่อง', 'คำโปรย', 'นามปากกา', 1, 2, '<p style=\"text-align:center;\"><span style=\"color: rgb(33,37,41);background-color: rgb(255,255,255);font-size: 1.75rem;font-family: sans-serif;\">คำนำเรื่อง</span></p>\r\n', 0, 0, '2018-08-23 17:06:22', 0),
(4, 1, 'covers-1534863647852.jpg', 'ชื่อเรื่อง', 'คำโปรย', 'นามปากกา', 1, 2, '<p style=\"text-align:center;\"><span style=\"color: rgb(33,37,41);background-color: rgb(255,255,255);font-size: 1.75rem;font-family: sans-serif;\">คำนำเรื่อง</span></p>\r\n', 0, 0, '2018-08-23 17:06:22', 0),
(5, 1, 'covers-1534863647852.jpg', 'ชื่อเรื่อง', 'คำโปรย', 'นามปากกา', 1, 2, '<p style=\"text-align:center;\"><span style=\"color: rgb(33,37,41);background-color: rgb(255,255,255);font-size: 1.75rem;font-family: sans-serif;\">คำนำเรื่อง</span></p>\r\n', 0, 0, '2018-08-23 17:06:22', 0),
(6, 1, 'covers-1534863647852.jpg', 'ชื่อเรื่อง', 'คำโปรย', 'นามปากกา', 1, 2, '<p style=\"text-align:center;\"><span style=\"color: rgb(33,37,41);background-color: rgb(255,255,255);font-size: 1.75rem;font-family: sans-serif;\">คำนำเรื่อง</span></p>\r\n', 0, 0, '2018-08-23 17:06:22', 0),
(7, 1, 'covers-1534863647852.jpg', 'ชื่อเรื่อง', 'คำโปรย', 'นามปากกา', 1, 2, '<p style=\"text-align:center;\"><span style=\"color: rgb(33,37,41);background-color: rgb(255,255,255);font-size: 1.75rem;font-family: sans-serif;\">คำนำเรื่อง</span></p>\r\n', 0, 0, '2018-08-21 15:00:47', 0),
(8, 1, 'covers-1534863647852.jpg', 'bbb', 'aaa', 'segsag', 2, 3, '<p>agesgasg</p>\r\n', 0, 0, '2018-08-23 17:06:22', 0),
(9, 18, 'covers-1534863647852.jpg', 'sega', 'aega', 'aega', 2, 2, '<p>ageasgag</p>\r\n', 0, 0, '2018-08-23 17:06:22', 0),
(10, 18, 'covers-1534863647852.jpg', 'aag', 'bsae', 'egaeg', 1, 2, '<p>aegasegg</p>\r\n', 0, 0, '2018-08-23 17:06:22', 0),
(11, 18, 'covers-1534863647852.jpg', 'agesgasg', 'segasgag', 'aegasgg', 1, 2, '<p>aeaegasgaeg</p>\r\n', 0, 0, '2018-08-23 17:06:22', 0),
(12, 18, 'covers-1534863647852.jpg', 'ageasg', 'segageg', 'aseasg', 1, 2, '<p>aegsagaeg</p>\r\n', 0, 0, '2018-08-23 17:06:22', 0),
(13, 18, 'covers-1534863647852.jpg', 'aeragasg', 'egag', 'aeagag', 2, 3, '<p>aesgagag</p>\r\n', 0, 0, '2018-08-23 17:06:22', 0),
(14, 18, 'covers-1534863647852.jpg', 'sasegag', 'segaeag', 'aeasg', 2, 3, '<p>aeagsg</p>\r\n', 0, 0, '2018-08-23 17:06:22', 0),
(15, 18, 'covers-1535044434312.jpg', 'มาโปรด', 'Make sure that you always handle the files that a user uploads. Never add multer as a global middleware since a malicious user could upload files to a route that you didn\'t anticipate. Only use this function on routes where you are handling the uploaded f', 'Snufflehp', 1, 2, '<p style=\"text-align:start;\"><span style=\"color: rgb(36,41,46);background-color: rgb(255,255,255);font-size: 16px;font-family: -apple-system, system-ui, \"Segoe UI\", Helvetica, Arial, sans-serif, \"Apple Color Emoji\", \"Segoe UI Emoji\", \"Segoe UI Symbol;\"><code>destination</code></span> <span style=\"color: rgb(36,41,46);background-color: rgb(255,255,255);font-size: 16px;font-family: -apple-system, system-ui, \"Segoe UI\", Helvetica, Arial, sans-serif, \"Apple Color Emoji\", \"Segoe UI Emoji\", \"Segoe UI Symbol;\">is used to determine within which folder the uploaded files should be stored. This can also be given as a</span> <span style=\"color: rgb(36,41,46);background-color: rgb(255,255,255);font-size: 16px;font-family: -apple-system, system-ui, \"Segoe UI\", Helvetica, Arial, sans-serif, \"Apple Color Emoji\", \"Segoe UI Emoji\", \"Segoe UI Symbol;\"><code>string</code></span> <span style=\"color: rgb(36,41,46);background-color: rgb(255,255,255);font-size: 16px;font-family: -apple-system, system-ui, \"Segoe UI\", Helvetica, Arial, sans-serif, \"Apple Color Emoji\", \"Segoe UI Emoji\", \"Segoe UI Symbol;\">(e.g.</span> <span style=\"color: rgb(36,41,46);background-color: rgb(255,255,255);font-size: 16px;font-family: -apple-system, system-ui, \"Segoe UI\", Helvetica, Arial, sans-serif, \"Apple Color Emoji\", \"Segoe UI Emoji\", \"Segoe UI Symbol;\"><code>\'/tmp/uploads\'</code>). If no</span> <span style=\"color: rgb(36,41,46);background-color: rgb(255,255,255);font-size: 16px;font-family: -apple-system, system-ui, \"Segoe UI\", Helvetica, Arial, sans-serif, \"Apple Color Emoji\", \"Segoe UI Emoji\", \"Segoe UI Symbol;\"><code>destination</code></span> <span style=\"color: rgb(36,41,46);background-color: rgb(255,255,255);font-size: 16px;font-family: -apple-system, system-ui, \"Segoe UI\", Helvetica, Arial, sans-serif, \"Apple Color Emoji\", \"Segoe UI Emoji\", \"Segoe UI Symbol;\">is given, the operating system\'s default directory for temporary files is used.</span></p>\r\n<p style=\"text-align:start;\"><span style=\"color: rgb(36,41,46);background-color: rgb(255,255,255);font-size: 16px;font-family: -apple-system, system-ui, \"Segoe UI\", Helvetica, Arial, sans-serif, \"Apple Color Emoji\", \"Segoe UI Emoji\", \"Segoe UI Symbol;\"><strong>Note:</strong></span> <span style=\"color: rgb(36,41,46);background-color: rgb(255,255,255);font-size: 16px;font-family: -apple-system, system-ui, \"Segoe UI\", Helvetica, Arial, sans-serif, \"Apple Color Emoji\", \"Segoe UI Emoji\", \"Segoe UI Symbol;\">You are responsible for creating the directory when providing</span> <span style=\"color: rgb(36,41,46);background-color: rgb(255,255,255);font-size: 16px;font-family: -apple-system, system-ui, \"Segoe UI\", Helvetica, Arial, sans-serif, \"Apple Color Emoji\", \"Segoe UI Emoji\", \"Segoe UI Symbol;\"><code>destination</code></span> <span style=\"color: rgb(36,41,46);background-color: rgb(255,255,255);font-size: 16px;font-family: -apple-system, system-ui, \"Segoe UI\", Helvetica, Arial, sans-serif, \"Apple Color Emoji\", \"Segoe UI Emoji\", \"Segoe UI Symbol;\">as a function. When passing a string, multer will make sure that the directory is created for you.</span></p>\r\n<p style=\"text-align:start;\"><span style=\"color: rgb(36,41,46);background-color: rgb(255,255,255);font-size: 16px;font-family: -apple-system, system-ui, \"Segoe UI\", Helvetica, Arial, sans-serif, \"Apple Color Emoji\", \"Segoe UI Emoji\", \"Segoe UI Symbol;\"><code>filename</code></span> <span style=\"color: rgb(36,41,46);background-color: rgb(255,255,255);font-size: 16px;font-family: -apple-system, system-ui, \"Segoe UI\", Helvetica, Arial, sans-serif, \"Apple Color Emoji\", \"Segoe UI Emoji\", \"Segoe UI Symbol;\">is used to determine what the file should be named inside the folder. If no</span> <span style=\"color: rgb(36,41,46);background-color: rgb(255,255,255);font-size: 16px;font-family: -apple-system, system-ui, \"Segoe UI\", Helvetica, Arial, sans-serif, \"Apple Color Emoji\", \"Segoe UI Emoji\", \"Segoe UI Symbol;\"><code>filename</code></span> <span style=\"color: rgb(36,41,46);background-color: rgb(255,255,255);font-size: 16px;font-family: -apple-system, system-ui, \"Segoe UI\", Helvetica, Arial, sans-serif, \"Apple Color Emoji\", \"Segoe UI Emoji\", \"Segoe UI Symbol;\">is given, each file will be given a random name that doesn\'t include any file extension.</span></p>\r\n<p style=\"text-align:start;\"><span style=\"color: rgb(36,41,46);background-color: rgb(255,255,255);font-size: 16px;font-family: -apple-system, system-ui, \"Segoe UI\", Helvetica, Arial, sans-serif, \"Apple Color Emoji\", \"Segoe UI Emoji\", \"Segoe UI Symbol;\"><strong>Note:</strong></span> <span style=\"color: rgb(36,41,46);background-color: rgb(255,255,255);font-size: 16px;font-family: -apple-system, system-ui, \"Segoe UI\", Helvetica, Arial, sans-serif, \"Apple Color Emoji\", \"Segoe UI Emoji\", \"Segoe UI Symbol;\">Multer will not append any file extension for you, your function should return a filename complete with an file extension.</span></p>\r\n<p style=\"text-align:start;\"><span style=\"color: rgb(36,41,46);background-color: rgb(255,255,255);font-size: 16px;font-family: -apple-system, system-ui, \"Segoe UI\", Helvetica, Arial, sans-serif, \"Apple Color Emoji\", \"Segoe UI Emoji\", \"Segoe UI Symbol;\">Each function gets passed both the request (<code>req</code>) and some information about the file (<code>file</code>) to aid with the decision.</span></p>\r\n<p style=\"text-align:start;\"><span style=\"color: rgb(36,41,46);background-color: rgb(255,255,255);font-size: 16px;font-family: -apple-system, system-ui, \"Segoe UI\", Helvetica, Arial, sans-serif, \"Apple Color Emoji\", \"Segoe UI Emoji\", \"Segoe UI Symbol;\">Note that</span> <span style=\"color: rgb(36,41,46);background-color: rgb(255,255,255);font-size: 16px;font-family: -apple-system, system-ui, \"Segoe UI\", Helvetica, Arial, sans-serif, \"Apple Color Emoji\", \"Segoe UI Emoji\", \"Segoe UI Symbol;\"><code>req.body</code></span> <span style=\"color: rgb(36,41,46);background-color: rgb(255,255,255);font-size: 16px;font-family: -apple-system, system-ui, \"Segoe UI\", Helvetica, Arial, sans-serif, \"Apple Color Emoji\", \"Segoe UI Emoji\", \"Segoe UI Symbol;\">might not have been fully populated yet. It depends on the order that the client transmits fields and files to the server.</span></p>\r\n', 0, 0, '2018-08-23 17:13:54', 0),
(16, 18, 'covers-1535046286256.jpg', ' กลิ่นโรงพยาบาล', 'จะมีดบาด บาดแขนบาดขา ก็ได้กลิ่น คนรวยคนรวยคนจน อยากจะเตื่อนกันไว้ทุกคน', 'noname', 2, 1, '<p>จะมีดบาด บาดแขนบาดขา ก็ได้กลิ่น คนรวยคนรวยคนจน อยากจะเตื่อนกันไว้ทุกคน</p>\r\n', 3, 10, '2018-08-24 07:33:55', 0),
(17, 18, 'covers-1535167602259.jpg', 'MemoryStorage', 'The memory storage engine stores the files in memory as Buffer objects. It doesn\'t have any options.', 'Golf', 7, 1, '<p>The memory storage engine stores the files in memory as <code>Buffer</code> objects. It doesn\'t have any options.</p>\r\n<p></p>\r\n<pre><span style=\"color: rgb(215,58,73);background-color: rgb(246,248,250);font-size: 13.6;font-family: SFMono-Regular, Consolas, \"Liberation Mono\", Menlo, Courier, monospace;\">var</span><span style=\"background-color: rgb(246,248,250);font-size: 13.6;font-family: SFMono-Regular, Consolas, \"Liberation Mono\", Menlo, Courier, monospace;\"> storage </span><span style=\"color: rgb(215,58,73);background-color: rgb(246,248,250);font-size: 13.6;font-family: SFMono-Regular, Consolas, \"Liberation Mono\", Menlo, Courier, monospace;\">=</span> <span style=\"color: rgb(36,41,46);background-color: rgb(246,248,250);font-size: 13.6;font-family: SFMono-Regular, Consolas, \"Liberation Mono\", Menlo, Courier, monospace;\">multer</span><span style=\"background-color: rgb(246,248,250);font-size: 13.6;font-family: SFMono-Regular, Consolas, \"Liberation Mono\", Menlo, Courier, monospace;\">.</span><span style=\"color: rgb(111,66,193);background-color: rgb(246,248,250);font-size: 13.6;font-family: SFMono-Regular, Consolas, \"Liberation Mono\", Menlo, Courier, monospace;\">memoryStorage</span><span style=\"background-color: rgb(246,248,250);font-size: 13.6;font-family: SFMono-Regular, Consolas, \"Liberation Mono\", Menlo, Courier, monospace;\">()<br></span><span style=\"color: rgb(215,58,73);background-color: rgb(246,248,250);font-size: 13.6;font-family: SFMono-Regular, Consolas, \"Liberation Mono\", Menlo, Courier, monospace;\">var</span><span style=\"background-color: rgb(246,248,250);font-size: 13.6;font-family: SFMono-Regular, Consolas, \"Liberation Mono\", Menlo, Courier, monospace;\"> upload </span><span style=\"color: rgb(215,58,73);background-color: rgb(246,248,250);font-size: 13.6;font-family: SFMono-Regular, Consolas, \"Liberation Mono\", Menlo, Courier, monospace;\">=</span> <span style=\"color: rgb(111,66,193);background-color: rgb(246,248,250);font-size: 13.6;font-family: SFMono-Regular, Consolas, \"Liberation Mono\", Menlo, Courier, monospace;\">multer</span><span style=\"background-color: rgb(246,248,250);font-size: 13.6;font-family: SFMono-Regular, Consolas, \"Liberation Mono\", Menlo, Courier, monospace;\">({ storage</span><span style=\"color: rgb(215,58,73);background-color: rgb(246,248,250);font-size: 13.6;font-family: SFMono-Regular, Consolas, \"Liberation Mono\", Menlo, Courier, monospace;\">:</span><span style=\"background-color: rgb(246,248,250);font-size: 13.6;font-family: SFMono-Regular, Consolas, \"Liberation Mono\", Menlo, Courier, monospace;\"> storage })</span></pre>\r\n<p>When using memory storage, the file info will contain a field called <code>buffer</code> that contains the entire file.</p>\r\n<p><strong>WARNING</strong>: Uploading very large files, or relatively small files in large numbers very quickly, can cause your application to run out of memory when memory storage is used.</p>\r\n<h3><br></h3>\r\n', 0, 0, '2018-08-25 03:26:42', 0);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `username` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `email` varchar(200) NOT NULL,
  `regis_date` datetime NOT NULL,
  `status` tinyint(2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `username`, `password`, `email`, `regis_date`, `status`) VALUES
(12, 'Golf', '1', 'bunyut.p@gmail.com', '2018-08-10 02:29:24', 0),
(13, 'Golf2', '$2a$08$Ov0/l6i2ZopqWmbuG.MfcOpTJDVj8FlwTX2XiNGPB8Xq6ndFUGG8G', 'bunyut2.p@gmail.com', '2018-08-13 03:54:31', 0),
(14, 'Golf2', '$2a$08$WRDu.exRpobmAOdF7IcF/.qspGQXGPAQD.EovuQZhv1YOVbCrixvq', 'bunyut.p2@gmail.com', '2018-08-13 05:56:41', 0),
(15, 'Golf2', '$2a$08$J1yop4woXbtUx9VDP3XzAe4wz9w90A5CqIZg.lazjM2X7R.rVlam6', 'bunyut.p3@gmail.com', '2018-08-13 05:57:38', 0),
(16, 'Golf4', '$2a$08$al5HmTBkG0PVni.n6srk9eNJ1gKeeA8.RSM282ZhC1JdrJSMledz.', 'bunyut.p7@gmail.com', '2018-08-13 06:08:07', 0),
(17, 'Golf5', '$2a$08$Ek13yNq0FP7iVwTp0Vm4S.u93FSci042F0jufBFrUuUiug6Q3PIHy', 'bunyut.p8@gmail.com', '2018-08-13 06:20:09', 0),
(18, 'Golf22', '$2a$08$5VG1H/ailLts0XdPC4z5UO9742dtuL/vPSteSRbtXod6gd6FcCEeG', 'bunyut.p22@gmail.com', '2018-08-13 06:54:19', 0),
(19, 'Golf44', '$2a$08$/Jn27OgBCzH/zOz9qokA9er0E99Vm9KB6V0xjBZxF8MH/J2wYSNCu', 'bunyut.p44@gmail.com', '2018-08-13 06:57:58', 0),
(20, 'Golf23', '$2a$08$mV0Cm3Nb7l/eEp8q7vJ5sOjiF7vb4I7TWufGaTmbiyRt9gxcgyPyq', 'bunyut.p23@gmail.com', '2018-08-13 07:00:06', 0),
(21, 'Golf66', '$2a$08$JdU3oxobRTxmdir424BTTe6OgXr2tB4nRDEPNXn0vIJjQWNxHhc.u', 'bunyut.p66@gmail.com', '2018-08-13 07:02:53', 0);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `category`
--
ALTER TABLE `category`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `content_rating`
--
ALTER TABLE `content_rating`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `fiction`
--
ALTER TABLE `fiction`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `category_id` (`category_id`),
  ADD KEY `content_rating_id` (`content_rating_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `category`
--
ALTER TABLE `category`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `content_rating`
--
ALTER TABLE `content_rating`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `fiction`
--
ALTER TABLE `fiction`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
