-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Feb 26, 2024 at 07:03 AM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `cems`
--

-- --------------------------------------------------------

--
-- Table structure for table `events`
--

CREATE TABLE `events` (
  `event_id` int(11) NOT NULL,
  `event_title` varchar(50) NOT NULL,
  `event_price` int(11) DEFAULT NULL,
  `participents` int(100) DEFAULT 0,
  `img_link` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `events`
--

INSERT INTO `events` (`event_id`, `event_title`, `event_price`, `participents`, `img_link`) VALUES
(1, 'Sports Hunt', 0, 4, 'images/SportsHunt.jpeg'),
(2, 'Puzzle Quest', 0, 1, 'images/PuzzleQuest.jpeg'),
(3, 'Mind Maze', 50, 3, 'images/MindMaze.png'),
(4, 'CheatCode', 0, 3, 'images/CheatCode.jpeg'),
(5, 'zxha', 0, 0, 'images/Hiring.png');

-- --------------------------------------------------------

--
-- Table structure for table `event_info`
--

CREATE TABLE `event_info` (
  `event_id` int(10) NOT NULL,
  `Date` date DEFAULT NULL,
  `time` varchar(20) NOT NULL,
  `location` varchar(300) NOT NULL,
  `duration` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `event_info`
--

INSERT INTO `event_info` (`event_id`, `Date`, `time`, `location`, `duration`) VALUES
(1, '2024-02-22', '2:30 pm', 'CDX', '2 hours'),
(2, '2024-01-24', '2:00 pm', 'LH206', '1 hour'),
(3, '2024-01-10', '2:00 pm', 'Basic Science', '2 hours'),
(4, '2023-12-27', '2:30 pm', 'LH 205', '2 hours'),
(5, '2023-12-09', '10:30 am', 'cdx', '2 hours');

-- --------------------------------------------------------

--
-- Stand-in structure for view `participantswithmultipleregistrations`
-- (See below for the actual view)
--
CREATE TABLE `participantswithmultipleregistrations` (
`usn` varchar(20)
,`name` varchar(100)
,`branch` varchar(200)
);

-- --------------------------------------------------------

--
-- Table structure for table `participent`
--

CREATE TABLE `participent` (
  `usn` varchar(20) NOT NULL,
  `name` varchar(100) NOT NULL,
  `branch` varchar(200) NOT NULL,
  `sem` int(11) NOT NULL,
  `email` varchar(300) NOT NULL,
  `phone` varchar(12) NOT NULL,
  `college` varchar(20) NOT NULL,
  `event_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `participent`
--

INSERT INTO `participent` (`usn`, `name`, `branch`, `sem`, `email`, `phone`, `college`, `event_id`) VALUES
('1CR21CS005', 'Anu', 'CSE', 5, 'anu@gmail.com', '8989988998', 'CMRIT', 1),
('1CR21CS005', 'Anu', 'CSE', 5, 'anu@gmail.com', '8989988998', 'CMRIT', 2),
('1CR21CS012', 'Bhavana', 'CSE', 5, 'bhavana@gmail.com', '7557575757', 'CMRIT', 3),
('1CR21CS012', 'Bhavana', 'CSE', 5, 'bhavana@cmrit.ac.in', '9934736623', 'CMRIT', 4),
('1CR21CS025', 'Akash', 'ISE', 5, 'akash@cmrit.ac.in', '8998848488', 'CMRIT', 3),
('1CR21CS101', 'Mihir', 'CSE', 5, 'mihir@cmrit.ac.in', '9898989898', 'CMRIT', 4),
('1CR21CS116', 'Nilesh Kumar', 'CSE', 5, 'nilesh@cmrit.ac.in', '7878787878', 'CMRIT', 1),
('1CR21CS116', 'Nilesh Kumar', 'CSE', 5, 'nilesh@gmail.com', '7878787878', 'CMRIT', 4),
('1cr21cs87', 'Afzal', 'cse', 5, 'nilesh@gmail.com', '78787878', 'CMRIT', 1),
('1CR21IS045', 'Prathiksha', 'ISE', 5, 'prathi@gmail.com', '7897854345', 'CMRIT', 3);

--
-- Triggers `participent`
--
DELIMITER $$
CREATE TRIGGER `insert_into_registered` AFTER INSERT ON `participent` FOR EACH ROW BEGIN
    INSERT INTO registered (usn, event_id,name,phone)
    VALUES (NEW.usn, NEW.event_id,NEW.name, NEW.phone); -- Assuming event_id is added to the Participants table
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Stand-in structure for view `pp`
-- (See below for the actual view)
--
CREATE TABLE `pp` (
`usn` varchar(20)
,`name` varchar(100)
);

-- --------------------------------------------------------

--
-- Table structure for table `registered`
--

CREATE TABLE `registered` (
  `rid` int(11) NOT NULL,
  `usn` varchar(20) DEFAULT NULL,
  `event_id` int(11) DEFAULT NULL,
  `name` varchar(100) DEFAULT NULL,
  `phone` varchar(12) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `registered`
--

INSERT INTO `registered` (`rid`, `usn`, `event_id`, `name`, `phone`) VALUES
(13, '1CR21CS116', 4, 'Nilesh Kumar', '7878787878'),
(14, '1CR21CS005', 1, 'Anu', '8989988998'),
(15, '1CR21CS005', 2, 'Anu', '8989988998'),
(16, '1CR21CS012', 3, 'Bhavana', '7557575757'),
(17, '1CR21CS012', 4, 'Bhavana', '9934736623'),
(18, '1CR21CS025', 3, 'Akash', '8998848488'),
(19, '1CR21CS101', 4, 'Mihir', '9898989898'),
(20, '1CR21CS116', 1, 'Nilesh Kumar', '7878787878'),
(21, '1CR21IS045', 3, 'Prathiksha', '7897854345'),
(23, '1cr21cs87', 1, 'Afzal', '78787878');

--
-- Triggers `registered`
--
DELIMITER $$
CREATE TRIGGER `count` AFTER INSERT ON `registered` FOR EACH ROW update events
set events.participents=events.participents+1
WHERE events.event_id=new.event_id
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `staff_coordinator`
--

CREATE TABLE `staff_coordinator` (
  `stid` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `phone` varchar(10) DEFAULT NULL,
  `event_id` int(11) DEFAULT NULL,
  `department` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `staff_coordinator`
--

INSERT INTO `staff_coordinator` (`stid`, `name`, `phone`, `event_id`, `department`) VALUES
(1, 'Debasmita Mishra', '7878787878', 1, 'CSE'),
(2, 'Mamatha', '9956436123', 2, 'CSE'),
(3, 'Suparna.A', '9956436456', 3, 'ISE'),
(4, 'Geetha', '9956436789', 4, 'ISE'),
(5, 'xyz', NULL, 5, 'cse');

-- --------------------------------------------------------

--
-- Table structure for table `student_coordinator`
--

CREATE TABLE `student_coordinator` (
  `sid` int(11) NOT NULL,
  `st_name` varchar(100) NOT NULL,
  `phone` varchar(10) DEFAULT NULL,
  `event_id` int(11) DEFAULT NULL,
  `address` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `student_coordinator`
--

INSERT INTO `student_coordinator` (`sid`, `st_name`, `phone`, `event_id`, `address`) VALUES
(1, 'Nilesh', '7765657575', 1, 'BANGALORE'),
(2, 'Afzal', '7956436123', 2, 'BANGALORE'),
(3, 'Navya Shree R', '8956436456', 3, 'BANGALORE'),
(4, 'Samanth Jain', '6956436789', 4, 'BANGALORE'),
(5, 'Nilesh ', '7878787878', 5, 'bangalore');

-- --------------------------------------------------------

--
-- Structure for view `participantswithmultipleregistrations`
--
DROP TABLE IF EXISTS `participantswithmultipleregistrations`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `participantswithmultipleregistrations`  AS SELECT DISTINCT `p`.`usn` AS `usn`, `p`.`name` AS `name`, `p`.`branch` AS `branch` FROM (`participent` `p` join (select `registered`.`usn` AS `usn`,count(distinct `registered`.`event_id`) AS `num_events_registered` from `registered` group by `registered`.`usn` having count(distinct `registered`.`event_id`) >= 2) `reg_counts` on(`p`.`usn` = `reg_counts`.`usn`)) ;

-- --------------------------------------------------------

--
-- Structure for view `pp`
--
DROP TABLE IF EXISTS `pp`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `pp`  AS SELECT `p`.`usn` AS `usn`, `p`.`name` AS `name` FROM `participent` AS `p` ;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `events`
--
ALTER TABLE `events`
  ADD PRIMARY KEY (`event_id`);

--
-- Indexes for table `event_info`
--
ALTER TABLE `event_info`
  ADD PRIMARY KEY (`event_id`);

--
-- Indexes for table `participent`
--
ALTER TABLE `participent`
  ADD PRIMARY KEY (`usn`,`event_id`),
  ADD KEY `fk_event_id` (`event_id`);

--
-- Indexes for table `registered`
--
ALTER TABLE `registered`
  ADD PRIMARY KEY (`rid`);

--
-- Indexes for table `staff_coordinator`
--
ALTER TABLE `staff_coordinator`
  ADD PRIMARY KEY (`stid`);

--
-- Indexes for table `student_coordinator`
--
ALTER TABLE `student_coordinator`
  ADD PRIMARY KEY (`sid`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `event_info`
--
ALTER TABLE `event_info`
  MODIFY `event_id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `registered`
--
ALTER TABLE `registered`
  MODIFY `rid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- AUTO_INCREMENT for table `staff_coordinator`
--
ALTER TABLE `staff_coordinator`
  MODIFY `stid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `student_coordinator`
--
ALTER TABLE `student_coordinator`
  MODIFY `sid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `participent`
--
ALTER TABLE `participent`
  ADD CONSTRAINT `fk_event_id` FOREIGN KEY (`event_id`) REFERENCES `events` (`event_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
