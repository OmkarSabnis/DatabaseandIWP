-- phpMyAdmin SQL Dump
-- version 4.7.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Sep 10, 2017 at 05:36 PM
-- Server version: 10.1.26-MariaDB
-- PHP Version: 7.1.8

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `iwp`
--
CREATE DATABASE IF NOT EXISTS `iwp` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `iwp`;

-- --------------------------------------------------------

--
-- Table structure for table `admin`
--

CREATE TABLE `admin` (
  `Admin_ID` varchar(5) NOT NULL COMMENT 'Primary Key',
  `Admin_PW` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Table to manage the Admin';

--
-- Dumping data for table `admin`
--

INSERT INTO `admin` (`Admin_ID`, `Admin_PW`) VALUES
('root', 'root');

-- --------------------------------------------------------

--
-- Table structure for table `allotted`
--

CREATE TABLE `allotted` (
  `Teacher_ID` varchar(5) CHARACTER SET utf8 NOT NULL,
  `Course_ID` varchar(5) CHARACTER SET utf8 NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `course`
--

CREATE TABLE `course` (
  `Course_ID` varchar(5) NOT NULL,
  `Course_Name` varchar(50) NOT NULL,
  `Course_Credit` int(1) NOT NULL,
  `Course_Slot` varchar(2) NOT NULL,
  `Dept_No` varchar(5) NOT NULL,
  `Admin_ID` varchar(5) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Table to manage the Course';

--
-- Dumping data for table `course`
--

INSERT INTO `course` (`Course_ID`, `Course_Name`, `Course_Credit`, `Course_Slot`, `Dept_No`, `Admin_ID`) VALUES
('CL101', 'Surveying', 4, 'D2', '10004', 'root'),
('CL102', 'Advanced Fluid Mechanics', 4, 'D1', '10004', 'root'),
('CL202', 'Structural Analysis', 3, 'L3', '10004', 'root'),
('CL401', 'Building Drawing', 4, 'L2', '10004', 'root'),
('CL501', 'Surveying - J Component', 1, 'P2', '10004', 'root'),
('CS101', 'Operating Systems', 4, 'A2', '10001', 'root'),
('CS102', 'Database Management', 4, 'A1', '10001', 'root'),
('CS201', 'Introduction to Python Programming', 3, 'L1', '10001', 'root'),
('CS203', 'Object Oriented Programming', 3, 'L3', '10001', 'root'),
('CS501', 'Database Management - J Component', 1, 'P1', '10001', 'root'),
('EC101', 'Semiconductor System', 3, 'B2', '10002', 'root'),
('EC102', 'Analog Electronic Circuits', 4, 'B1', '10002', 'root'),
('EC201', 'Sensors and Measurements', 3, 'L2', '10002', 'root'),
('EC205', 'Signal Processing', 3, 'L4', '10002', 'root'),
('EC501', 'Semiconductor System - J Component', 1, 'P2', '10002', 'root'),
('EE101', 'Electric Circuits', 3, 'E2', '10005', 'root'),
('EE102', 'Network Theory', 3, 'E1', '10005', 'root'),
('EE202', 'Measurement and Instrumentation', 4, 'L5', '10005', 'root'),
('EE301', 'Fiber Optics Testing', 3, 'L4', '10005', 'root'),
('EE501', 'Measurement and Instrumentation - J Component', 1, 'P2', '10005', 'root'),
('IT101', 'Digital Logic and Microprocessor', 3, 'C2', '10003', 'root'),
('IT102', 'Software Engineering', 4, 'C1', '10003', 'root'),
('IT202', 'Data Compression Techniques', 2, 'L5', '10003', 'root'),
('IT301', 'Digital Image Processing', 4, 'L1', '10003', 'root'),
('IT501', 'Digital Logic and Microprocessor - J Component', 1, 'P3', '10003', 'root');

-- --------------------------------------------------------

--
-- Table structure for table `department`
--

CREATE TABLE `department` (
  `Dept_No` varchar(5) CHARACTER SET utf8 NOT NULL COMMENT 'Primary Key',
  `Dept_Name` varchar(10) CHARACTER SET utf8 NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='Table to manage the department';

--
-- Dumping data for table `department`
--

INSERT INTO `department` (`Dept_No`, `Dept_Name`) VALUES
('10001', 'SCOPE'),
('10002', 'SENSE'),
('10003', 'SITE'),
('10004', 'SCALE'),
('10005', 'SELECT');

-- --------------------------------------------------------

--
-- Table structure for table `enrolls`
--

CREATE TABLE `enrolls` (
  `Student_ID` varchar(5) NOT NULL,
  `Course_ID` varchar(5) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `student`
--

CREATE TABLE `student` (
  `Serial No` int(11) NOT NULL,
  `Student_ID` varchar(9) NOT NULL,
  `Student_Name` varchar(40) NOT NULL,
  `Student_DOB` date NOT NULL,
  `Student_EmailID` varchar(40) NOT NULL,
  `Dept_No` varchar(5) NOT NULL,
  `Admin_ID` varchar(5) NOT NULL,
  `Student_PhoneNo` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Table to manage the Students';

--
-- Dumping data for table `student`
--

INSERT INTO `student` (`Serial No`, `Student_ID`, `Student_Name`, `Student_DOB`, `Student_EmailID`, `Dept_No`, `Admin_ID`, `Student_PhoneNo`) VALUES
(1, '16BCB0001', 'Omkar Sabnis', '1998-11-08', 'omkarsabnis@gmail.com', '10001', 'root', '9994427885'),
(2, '16BCB0015', 'Shivam Kumar Verma', '1997-05-09', 'shivamkverma@gmail.com', '10001', 'root', '7539514562'),
(3, '16BCB0016', 'Ritika Thakur', '1998-04-29', 'ritikathakur@gmail.com', '10001', 'root', '8400077900'),
(4, '16BCB0032', 'Pawan Hazel', '1998-12-24', 'pawanhazel@gmail.com', '10001', 'root', '8456511112'),
(5, '16BCB0045', 'David Shaji George', '1998-10-30', 'davidgeorge@gmail.com', '10001', 'root', '9638525877'),
(6, '16BCB0082', 'Kalyani Asthana', '1996-03-17', 'kalyaniasthana@gmail.com', '10001', 'root', '8586427290'),
(7, '16BCB0092', 'Saikat Bhattacharyya', '1997-12-15', 'saikat01244569@gmail.com', '10001', 'root', '8584965037'),
(8, '16BCB0101', 'Shourya Mittal', '1997-10-18', 'shouryamittal@gmail.com', '10001', 'root', '7845012433'),
(9, '16BCB0129', 'Varshan Agarwal', '1997-04-13', 'varshanagarwal@gmail.com', '10001', 'root', '7447124523'),
(10, '16BCB0140', 'Koduri Sai Sankeerth', '1998-07-05', 'saisankeerth@gmail.com', '10001', 'root', '9895454551'),
(11, '16BCE0001', 'Akula Gana Teja', '1998-09-27', 'gtdrag1412@gmail.com', '10001', 'root', '7890987432'),
(12, '16BCE0098', 'Abhijith Venugopal', '1998-06-08', 'abhijithvenu@gmail.com', '10001', 'root', '8907657912'),
(13, '16BCE0198', 'Akshata Bhusari', '1998-09-15', 'akshatabhu@gmail.com', '10001', 'root', '7689076761'),
(14, '16BCE0234', 'Ananya Mirji', '1997-09-12', 'ananyamir@gmail.com', '10001', 'root', '7876509871'),
(15, '16BCE0677', 'Meghana V', '1997-09-18', 'meghanav@gmail.com', '10001', 'root', '9087656712'),
(16, '16BCE0812', 'Harsh Singhal', '1998-09-16', 'harshsingh@gmail.com', '10001', 'root', '9067898678'),
(17, '16BCE0981', 'Aditya Singh', '1997-09-18', 'adityasingh@gmail.com', '10001', 'root', '7689700001'),
(18, '16BCE2012', 'Simran Jath', '1998-01-12', 'simranjat@gmail.com', '10001', 'root', '9000178651'),
(19, '16BCE2034', 'Swapnil Joshi', '1997-09-20', 'swappy@gmail.com', '10001', 'root', '8775698012'),
(20, '16BCE2289', 'Bharat Singh', '1997-06-12', 'bharatsingh@gmail.com', '10001', 'root', '9034165431'),
(21, '16BCL0010', 'Shivas Dharman', '1998-09-16', 'shivasdharman@gmail.com', '10004', 'root', '9831323147'),
(22, '16BCL0012', 'Sandra G. Rider', '1997-02-28', 'sandrarider@gmail.com', '10004', 'root', '7530007600'),
(23, '16BCL0086', 'Paul J. Simmons', '1996-12-31', 'paulsimmons@gmail.com', '10004', 'root', '8754296861'),
(24, '16BCL0099', 'Phyllis R. Bussell', '1996-10-10', 'phyllisbussell@gmail.com', '10004', 'root', '8456877999'),
(25, '16BCL0101', 'Gandhi Dewar', '1996-08-18', 'gandhidewar@gmail.com', '10004', 'root', '9567189897'),
(26, '16BCL0102', 'Kimono Pie', '1996-01-11', 'kimonopie@gmail.com', '10004', 'root', '9090761561'),
(27, '16BCL0103', 'Yun Che', '1996-04-17', 'yunche@gmail.com', '10004', 'root', '8654132324'),
(28, '16BCL0104', 'Meng Hao', '1998-11-30', 'menghao@gmail.com', '10004', 'root', '9451222567'),
(29, '16BCL0105', 'Nie Li', '1997-08-29', 'nieli@gmail.com', '10004', 'root', '9345171234'),
(30, '16BCL0106', 'Xia Qingyue', '1999-12-31', 'xiaqingyue@gmail.com', '10004', 'root', '8342176765'),
(31, '16BCL0107', 'Xiao Shen', '1995-03-31', 'xiaoshen@gmail.com', '10004', 'root', '9345167192'),
(32, '16BCL0108', 'Huyan Cayi', '1998-01-05', 'huyancayi@gmail.com', '10004', 'root', '9865412456'),
(33, '16BCL0109', 'Feng Xuer', '1997-05-28', 'fengxuer@gmail.com', '10004', 'root', '8789555789'),
(34, '16BCL0321', 'Nathan M. Box', '1998-04-03', 'nathanbox@gmail.com', '10004', 'root', '7855564287'),
(35, '16BCL0405', 'Pushpa Jain', '1998-05-14', 'pushpajain@gmail.com', '10004', 'root', '9831666855'),
(36, '16BCL0541', 'Julia M. Lancaster', '1997-08-01', 'julialancaster@gmail.com', '10004', 'root', '7898813231'),
(37, '16BCL0610', 'Rebecca B. Abbott', '1998-06-13', 'rebeccaabbott@gmail.com', '10004', 'root', '8795456211'),
(38, '16BCL1011', 'John D. Santillanes', '1997-06-30', 'johnsan@gmail.com', '10004', 'root', '9831556855'),
(39, '16BCL1985', 'Rajiv Shukla', '1996-04-15', 'rajivshukla@gmail.com', '10004', 'root', '9123255441'),
(40, '16BCL2022', 'Qatar Danush', '1998-01-11', 'qatardanush@gmail.com', '10004', 'root', '9546427885'),
(41, '16BEC0001', 'Rishabh Pratap Sisodia', '1998-12-23', 'rishabhpratap@gmail.com', '10002', 'root', '9845031390'),
(42, '16BEC0012', 'Varshan Hegde', '1998-09-12', 'varshanhegs@gmail.com', '10002', 'root', '7689012123'),
(43, '16BEC0178', 'Kevin Abraham', '1997-02-17', 'kevinabraham335@gmail.com', '10002', 'root', '8767854356'),
(44, '16BEC0231', 'Parangjyothi C', '1998-07-23', 'parangjyothic@gmail.com', '10002', 'root', '7658912212'),
(45, '16BEC0321', 'Gautham Rao', '1998-05-11', 'gauthamrao19@gmail.com', '10002', 'root', '7653912123'),
(46, '16BEC0431', 'Rohit Janardhan', '1998-03-29', 'rohitbj@gmail.com', '10002', 'root', '8790877662'),
(47, '16BEC0456', 'Vibha S', '1998-03-12', 'vibhas231@gmail.com', '10002', 'root', '9887634561'),
(48, '16BEC0478', 'Siddharth Abraham', '1998-09-12', 'sidabhraham@gmail.com', '10002', 'root', '9087656712'),
(49, '16BEC0512', 'Sahil Deshpande', '1998-07-12', 'sahildesh@gmail.com', '10002', 'root', '9765123234'),
(50, '16BEC0567', 'Vishruth RG', '1997-12-03', 'vishruthrg@gmail.com', '10002', 'root', '8789765789'),
(51, '16BEC0654', 'Karthik Hosur', '1998-12-23', 'karthikhosur@gmail.com', '10002', 'root', '7650001212'),
(52, '16BEC0765', 'Aditya TA', '1998-01-01', 'adityata@gmail.com', '10002', 'root', '8790876671'),
(53, '16BEC0871', 'Aditya Sharma', '1998-09-09', 'adityasharma@gmail.com', '10002', 'root', '8989896571'),
(54, '16BEC0890', 'Sahana Shanbhag', '1998-12-23', 'sahanashan@gmail.com', '10002', 'root', '7897865761'),
(55, '16BEC0901', 'Gayatri Narayanan', '1998-05-01', 'gayathrilnara@gmail.com', '10002', 'root', '9878900012'),
(56, '16BEC0923', 'Parinita Daneshwar', '1998-02-15', 'pari@gmail.com', '10002', 'root', '7689012345'),
(57, '16BEC0965', 'Radhika Apte', '1998-09-09', 'radhikaapte@gmail.com', '10002', 'root', '9809876891'),
(58, '16BEC0987', 'Priya Bhide', '1997-03-12', 'priyabhide@gmail.com', '10002', 'root', '9876812126'),
(59, '16BEC0991', 'Siddharth Prabhakaran', '1998-09-16', 'sidprabhak@gmail.com', '10002', 'root', '7897865121'),
(60, '16BEC0998', 'Minal Patadi', '1998-05-06', 'minalpatadi@gmail.com', '10002', 'root', '9878910102'),
(61, '16BEE0010', 'Jackson Sayers', '1998-07-05', 'jacksonsayers@gmail.com', '10005', 'root', '9871290026'),
(62, '16BEE0011', 'Zachary O\'Shea', '1998-07-06', 'zacharyoshea@gmail.com', '10005', 'root', '9871200026'),
(63, '16BEE0012', 'Lucas Jackey', '1998-07-07', 'lucasjackey@gmail.com', '10005', 'root', '7975843336'),
(64, '16BEE0013', 'Joseph Titheradge', '1998-07-08', 'josephtither@gmail.com', '10005', 'root', '9222843336'),
(65, '16BEE0014', 'Callum Wolff', '1998-07-09', 'callumwolff@gmail.com', '10005', 'root', '9875843006'),
(66, '16BEE0015', 'Andrew Hilder', '1998-07-10', 'andrewhilder@gmail.com', '10005', 'root', '9115843336'),
(67, '16BEE0016', 'Maya Ullathorne', '1998-07-11', 'mayaullathorne@gmail.com', '10005', 'root', '9875843331'),
(68, '16BEE0017', 'Emily McEwen', '1998-07-12', 'emilymcewen@gmail.com', '10005', 'root', '9899999996'),
(69, '16BEE0018', 'Jai Hague', '1998-07-13', 'jaihague@gmail.com', '10005', 'root', '9575843336'),
(70, '16BEE0019', 'Flynn Hawthorn', '1998-07-14', 'flynnhawthorn@gmail.com', '10005', 'root', '9875043336'),
(71, '16BEE0020', 'Summer Kidd', '1998-07-15', 'summerkid@gmail.com', '10005', 'root', '7775843336'),
(72, '16BEE0021', 'Grace Louise', '1998-07-16', 'gracelouise@gmail.com', '10005', 'root', '9222840006'),
(73, '16BEE0022', 'Aaron Fritzsche', '1998-07-17', 'aaronfritz@gmail.com', '10005', 'root', '9875843336'),
(74, '16BEE0023', 'Noah Brifman', '1998-07-18', 'noahbrifman@gmail.com', '10005', 'root', '8885840006'),
(75, '16BEE0024', 'Hamish Reeve', '1998-07-19', 'hamishreeve@gmail.com', '10005', 'root', '9875740006'),
(76, '16BEE0025', 'Lily Simson', '1998-07-20', 'lilysimson@gmail.com', '10005', 'root', '995840009'),
(77, '16BEE0026', 'Lachlan Mayrhofer', '1998-07-21', 'lachlanmayrhofer@gmail.com', '10005', 'root', '7875840006'),
(78, '16BEE0027', 'Katie Coungeau', '1998-07-22', 'katiecoungeau@gmail.com', '10005', 'root', '9875840002'),
(79, '16BEE0028', 'Seth Blacklow', '1998-07-23', 'sethblacklow@gmail.com', '10005', 'root', '9175840006'),
(80, '16BEE0029', 'Harry Counsel', '1998-07-24', 'harrycounsel@gmail.com', '10005', 'root', '9875840006'),
(81, '16BIT0012', 'Peter Parker', '1998-01-01', 'peterparker@gmail.com', '10003', 'root', '9087600991'),
(82, '16BIT0078', 'Tony Stark', '1997-09-17', 'iamironman@gmail.com', '10003', 'root', '7867109871'),
(83, '16BIT0091', 'Bruce Wayne', '1997-01-09', 'iambatman@gmail.com', '10003', 'root', '9087688771'),
(84, '16BIT0132', 'Clark Kent', '1997-01-18', 'iamsuperman@gmail.com', '10003', 'root', '8976190871'),
(85, '16BIT0169', 'Barry Allen', '1997-05-18', 'iamflash@gmail.com', '10003', 'root', '9801989101'),
(86, '16BIT0201', 'Chandler Bing', '1996-12-09', 'iamchandler@gmail.com', '10003', 'root', '8790177722'),
(87, '16BIT0278', 'Monica Taylor', '1997-03-21', 'iammonica@gmail.com', '10003', 'root', '9880002091'),
(88, '16BIT0301', 'Ross Garrison', '1997-08-17', 'iamross@gmail.com', '10003', 'root', '9090890907'),
(89, '16BIT0402', 'Pratyush Agarwal', '1998-03-05', 'iampratyush@gmail.com', '10003', 'root', '8907811143'),
(90, '16BIT0478', 'Nilrava Sensarma', '1998-04-15', 'iamneel@gmail.com', '10003', 'root', '7689011231'),
(91, '16BIT0589', 'Navdeep Beniwal', '1998-03-21', 'iamnavdeep@gmail.com', '10003', 'root', '7890134342'),
(92, '16BIT0614', 'Ayush Acharya', '1997-09-16', 'iamayush@gmail.com', '10003', 'root', '8901254654'),
(93, '16BIT0678', 'Diana Prince', '1995-01-01', 'iamdiana@gmail.com', '10003', 'root', '7890167812'),
(94, '16BIT0712', 'Prithviraj Chauhan', '1998-06-12', 'iamprithviraj@gmail.com', '10003', 'root', '8765146781'),
(95, '16BIT0784', 'Charlton Jude', '1996-03-31', 'iamcharlton@gmail.com', '10003', 'root', '9798701012'),
(96, '16BIT0818', 'Rahul Janardhan', '1997-06-19', 'rahuljanardhan@gmail.com', '10003', 'root', '9145678671'),
(97, '16BIT0891', 'Mayank Ganatej', '1996-01-01', 'iamamayank@gmail.com', '10003', 'root', '9164843170'),
(98, '16BIT0941', 'Khaleesi Dragneel', '1998-01-26', 'iamkhaleesi@gmail.com', '10003', 'root', '9167878711'),
(99, '16BIT2012', 'Jon Snow', '1996-06-18', 'iamsnow@gmail.com', '10003', 'root', '9234578912'),
(100, '16BIT2061', 'Khal Drogo', '1997-09-17', 'iamkhal@gmail.com', '10003', 'root', '9455678781');

-- --------------------------------------------------------

--
-- Table structure for table `teacher`
--

CREATE TABLE `teacher` (
  `Serial No` int(11) NOT NULL,
  `Teacher_ID` varchar(5) NOT NULL COMMENT 'Primary Key',
  `Dept_No` varchar(5) NOT NULL COMMENT 'Foreign Key',
  `Admin_ID` varchar(5) NOT NULL COMMENT 'Foreign Key',
  `Teacher_Name` varchar(40) NOT NULL,
  `Teacher_Email` varchar(20) NOT NULL,
  `Teacher_PhoneNo` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Table to manage the Teachers';

--
-- Dumping data for table `teacher`
--

INSERT INTO `teacher` (`Serial No`, `Teacher_ID`, `Dept_No`, `Admin_ID`, `Teacher_Name`, `Teacher_Email`, `Teacher_PhoneNo`) VALUES
(1, '12133', '10001', 'root', 'Padmapriya R', 'padmapriya@gmail.com', '9089012124'),
(2, '12438', '10001', 'root', 'Jasmin Jose', 'jasminjose@gmail.com', '9878976890'),
(3, '13561', '10001', 'root', 'Murali S', 'muralis@gmail.com', '7689012543'),
(4, '14561', '10002', 'root', 'Kubendaran R', 'kubendarar@gmail.com', '7650012151'),
(5, '15671', '10002', 'root', 'Santhi S', 'santhis@gmail.com', '9090865761'),
(6, '16512', '10002', 'root', 'Jacob John', 'jacobjohn@gmail.com', '8787650981'),
(7, '16522', '10003', 'root', 'Hrithik Roshan', 'hrithik@gmail.com', '8908767123'),
(8, '17871', '10003', 'root', 'Shah Rukh Khan', 'iamsrk@gmail.com', '7887654891'),
(9, '18966', '10003', 'root', 'Deepika Padukone', 'deepika@gmail.com', '9090878651'),
(10, '19009', '10004', 'root', 'Kalpana Chawla', 'kalpanach@gmail.com', '8778600013'),
(11, '20121', '10004', 'root', 'Sunidhi Chauhan', 'sunidhich@gmail.com', '7689076816'),
(12, '21987', '10004', 'root', 'Lata Mangeshkar', 'latamang@gmail.com', '8790156423'),
(13, '22989', '10005', 'root', 'Shraddha Kapoor', 'shraddhak@gmail.com', '9087609871'),
(14, '23654', '10005', 'root', 'Udyaan Vaats', 'udayaan@gmail.com', '7865700012'),
(15, '28765', '10005', 'root', 'Kumar Sangakaara', 'kumarsanga@gmail.com', '7876189012');

-- --------------------------------------------------------

--
-- Table structure for table `teaches`
--

CREATE TABLE `teaches` (
  `Teacher_ID` varchar(5) NOT NULL,
  `Student_ID` varchar(5) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`Admin_ID`);

--
-- Indexes for table `allotted`
--
ALTER TABLE `allotted`
  ADD KEY `Teacher_ID` (`Teacher_ID`),
  ADD KEY `Course_ID` (`Course_ID`);

--
-- Indexes for table `course`
--
ALTER TABLE `course`
  ADD PRIMARY KEY (`Course_ID`),
  ADD KEY `Admin_ID` (`Admin_ID`),
  ADD KEY `Dept_No` (`Dept_No`);

--
-- Indexes for table `department`
--
ALTER TABLE `department`
  ADD PRIMARY KEY (`Dept_No`);

--
-- Indexes for table `enrolls`
--
ALTER TABLE `enrolls`
  ADD KEY `Student_ID` (`Student_ID`),
  ADD KEY `Course_ID` (`Course_ID`);

--
-- Indexes for table `student`
--
ALTER TABLE `student`
  ADD PRIMARY KEY (`Student_ID`),
  ADD UNIQUE KEY `Serial No` (`Serial No`),
  ADD KEY `Dept_No` (`Dept_No`),
  ADD KEY `Admin_ID` (`Admin_ID`) USING BTREE;

--
-- Indexes for table `teacher`
--
ALTER TABLE `teacher`
  ADD PRIMARY KEY (`Teacher_ID`),
  ADD UNIQUE KEY `Serial No` (`Serial No`),
  ADD KEY `Admin_ID` (`Admin_ID`),
  ADD KEY `Dept_No` (`Dept_No`) USING BTREE;

--
-- Indexes for table `teaches`
--
ALTER TABLE `teaches`
  ADD KEY `Teacher_ID` (`Teacher_ID`),
  ADD KEY `Student_ID` (`Student_ID`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `student`
--
ALTER TABLE `student`
  MODIFY `Serial No` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=101;
--
-- AUTO_INCREMENT for table `teacher`
--
ALTER TABLE `teacher`
  MODIFY `Serial No` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;
--
-- Constraints for dumped tables
--

--
-- Constraints for table `allotted`
--
ALTER TABLE `allotted`
  ADD CONSTRAINT `allotted_ibfk_1` FOREIGN KEY (`Course_ID`) REFERENCES `course` (`Course_ID`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `allotted_ibfk_2` FOREIGN KEY (`Teacher_ID`) REFERENCES `teacher` (`Teacher_ID`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `course`
--
ALTER TABLE `course`
  ADD CONSTRAINT `course_ibfk_1` FOREIGN KEY (`Admin_ID`) REFERENCES `admin` (`Admin_ID`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `course_ibfk_2` FOREIGN KEY (`Dept_No`) REFERENCES `department` (`Dept_No`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `enrolls`
--
ALTER TABLE `enrolls`
  ADD CONSTRAINT `enrolls_ibfk_1` FOREIGN KEY (`Course_ID`) REFERENCES `course` (`Course_ID`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `enrolls_ibfk_2` FOREIGN KEY (`Student_ID`) REFERENCES `student` (`Student_ID`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `student`
--
ALTER TABLE `student`
  ADD CONSTRAINT `student_ibfk_1` FOREIGN KEY (`Dept_No`) REFERENCES `department` (`Dept_No`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `student_ibfk_2` FOREIGN KEY (`Admin_ID`) REFERENCES `admin` (`Admin_ID`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `teacher`
--
ALTER TABLE `teacher`
  ADD CONSTRAINT `teacher_ibfk_1` FOREIGN KEY (`Dept_No`) REFERENCES `department` (`Dept_No`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `teacher_ibfk_2` FOREIGN KEY (`Admin_ID`) REFERENCES `admin` (`Admin_ID`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `teaches`
--
ALTER TABLE `teaches`
  ADD CONSTRAINT `teaches_ibfk_1` FOREIGN KEY (`Teacher_ID`) REFERENCES `teacher` (`Teacher_ID`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `teaches_ibfk_2` FOREIGN KEY (`Student_ID`) REFERENCES `student` (`Student_ID`) ON DELETE CASCADE ON UPDATE CASCADE;
--
-- Database: `phpmyadmin`
--
CREATE DATABASE IF NOT EXISTS `phpmyadmin` DEFAULT CHARACTER SET utf8 COLLATE utf8_bin;
USE `phpmyadmin`;

-- --------------------------------------------------------

--
-- Table structure for table `pma__bookmark`
--

CREATE TABLE `pma__bookmark` (
  `id` int(11) NOT NULL,
  `dbase` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `user` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `label` varchar(255) CHARACTER SET utf8 NOT NULL DEFAULT '',
  `query` text COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Bookmarks';

-- --------------------------------------------------------

--
-- Table structure for table `pma__central_columns`
--

CREATE TABLE `pma__central_columns` (
  `db_name` varchar(64) COLLATE utf8_bin NOT NULL,
  `col_name` varchar(64) COLLATE utf8_bin NOT NULL,
  `col_type` varchar(64) COLLATE utf8_bin NOT NULL,
  `col_length` text COLLATE utf8_bin,
  `col_collation` varchar(64) COLLATE utf8_bin NOT NULL,
  `col_isNull` tinyint(1) NOT NULL,
  `col_extra` varchar(255) COLLATE utf8_bin DEFAULT '',
  `col_default` text COLLATE utf8_bin
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Central list of columns';

-- --------------------------------------------------------

--
-- Table structure for table `pma__column_info`
--

CREATE TABLE `pma__column_info` (
  `id` int(5) UNSIGNED NOT NULL,
  `db_name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `table_name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `column_name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `comment` varchar(255) CHARACTER SET utf8 NOT NULL DEFAULT '',
  `mimetype` varchar(255) CHARACTER SET utf8 NOT NULL DEFAULT '',
  `transformation` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `transformation_options` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `input_transformation` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `input_transformation_options` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Column information for phpMyAdmin';

-- --------------------------------------------------------

--
-- Table structure for table `pma__designer_settings`
--

CREATE TABLE `pma__designer_settings` (
  `username` varchar(64) COLLATE utf8_bin NOT NULL,
  `settings_data` text COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Settings related to Designer';

--
-- Dumping data for table `pma__designer_settings`
--

INSERT INTO `pma__designer_settings` (`username`, `settings_data`) VALUES
('root', '{\"angular_direct\":\"direct\",\"snap_to_grid\":\"off\",\"relation_lines\":\"true\"}');

-- --------------------------------------------------------

--
-- Table structure for table `pma__export_templates`
--

CREATE TABLE `pma__export_templates` (
  `id` int(5) UNSIGNED NOT NULL,
  `username` varchar(64) COLLATE utf8_bin NOT NULL,
  `export_type` varchar(10) COLLATE utf8_bin NOT NULL,
  `template_name` varchar(64) COLLATE utf8_bin NOT NULL,
  `template_data` text COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Saved export templates';

--
-- Dumping data for table `pma__export_templates`
--

INSERT INTO `pma__export_templates` (`id`, `username`, `export_type`, `template_name`, `template_data`) VALUES
(1, 'root', 'server', 'Project', '{\"quick_or_custom\":\"quick\",\"what\":\"sql\",\"db_select[]\":[\"iwp\",\"phpmyadmin\",\"test\"],\"output_format\":\"sendit\",\"filename_template\":\"@SERVER@\",\"remember_template\":\"on\",\"charset\":\"utf-8\",\"compression\":\"none\",\"maxsize\":\"\",\"codegen_structure_or_data\":\"data\",\"codegen_format\":\"0\",\"csv_separator\":\",\",\"csv_enclosed\":\"\\\"\",\"csv_escaped\":\"\\\"\",\"csv_terminated\":\"AUTO\",\"csv_null\":\"NULL\",\"csv_structure_or_data\":\"data\",\"excel_null\":\"NULL\",\"excel_columns\":\"something\",\"excel_edition\":\"win\",\"excel_structure_or_data\":\"data\",\"htmlword_structure_or_data\":\"structure_and_data\",\"htmlword_null\":\"NULL\",\"json_structure_or_data\":\"data\",\"latex_caption\":\"something\",\"latex_structure_or_data\":\"structure_and_data\",\"latex_structure_caption\":\"Structure of table @TABLE@\",\"latex_structure_continued_caption\":\"Structure of table @TABLE@ (continued)\",\"latex_structure_label\":\"tab:@TABLE@-structure\",\"latex_relation\":\"something\",\"latex_comments\":\"something\",\"latex_mime\":\"something\",\"latex_columns\":\"something\",\"latex_data_caption\":\"Content of table @TABLE@\",\"latex_data_continued_caption\":\"Content of table @TABLE@ (continued)\",\"latex_data_label\":\"tab:@TABLE@-data\",\"latex_null\":\"\\\\textit{NULL}\",\"mediawiki_structure_or_data\":\"data\",\"mediawiki_caption\":\"something\",\"mediawiki_headers\":\"something\",\"ods_null\":\"NULL\",\"ods_structure_or_data\":\"data\",\"odt_structure_or_data\":\"structure_and_data\",\"odt_relation\":\"something\",\"odt_comments\":\"something\",\"odt_mime\":\"something\",\"odt_columns\":\"something\",\"odt_null\":\"NULL\",\"pdf_report_title\":\"\",\"pdf_structure_or_data\":\"data\",\"phparray_structure_or_data\":\"data\",\"sql_include_comments\":\"something\",\"sql_header_comment\":\"\",\"sql_use_transaction\":\"something\",\"sql_compatibility\":\"NONE\",\"sql_structure_or_data\":\"structure_and_data\",\"sql_create_table\":\"something\",\"sql_auto_increment\":\"something\",\"sql_create_view\":\"something\",\"sql_create_trigger\":\"something\",\"sql_backquotes\":\"something\",\"sql_type\":\"INSERT\",\"sql_insert_syntax\":\"both\",\"sql_max_query_size\":\"50000\",\"sql_hex_for_binary\":\"something\",\"sql_utc_time\":\"something\",\"texytext_structure_or_data\":\"structure_and_data\",\"texytext_null\":\"NULL\",\"yaml_structure_or_data\":\"data\",\"\":null,\"as_separate_files\":null,\"csv_removeCRLF\":null,\"csv_columns\":null,\"excel_removeCRLF\":null,\"htmlword_columns\":null,\"json_pretty_print\":null,\"ods_columns\":null,\"sql_dates\":null,\"sql_relation\":null,\"sql_mime\":null,\"sql_disable_fk\":null,\"sql_views_as_tables\":null,\"sql_metadata\":null,\"sql_drop_database\":null,\"sql_drop_table\":null,\"sql_if_not_exists\":null,\"sql_procedure_function\":null,\"sql_truncate\":null,\"sql_delayed\":null,\"sql_ignore\":null,\"texytext_columns\":null}');

-- --------------------------------------------------------

--
-- Table structure for table `pma__favorite`
--

CREATE TABLE `pma__favorite` (
  `username` varchar(64) COLLATE utf8_bin NOT NULL,
  `tables` text COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Favorite tables';

-- --------------------------------------------------------

--
-- Table structure for table `pma__history`
--

CREATE TABLE `pma__history` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `username` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `db` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `table` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `timevalue` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `sqlquery` text COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='SQL history for phpMyAdmin';

-- --------------------------------------------------------

--
-- Table structure for table `pma__navigationhiding`
--

CREATE TABLE `pma__navigationhiding` (
  `username` varchar(64) COLLATE utf8_bin NOT NULL,
  `item_name` varchar(64) COLLATE utf8_bin NOT NULL,
  `item_type` varchar(64) COLLATE utf8_bin NOT NULL,
  `db_name` varchar(64) COLLATE utf8_bin NOT NULL,
  `table_name` varchar(64) COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Hidden items of navigation tree';

-- --------------------------------------------------------

--
-- Table structure for table `pma__pdf_pages`
--

CREATE TABLE `pma__pdf_pages` (
  `db_name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `page_nr` int(10) UNSIGNED NOT NULL,
  `page_descr` varchar(50) CHARACTER SET utf8 NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='PDF relation pages for phpMyAdmin';

-- --------------------------------------------------------

--
-- Table structure for table `pma__recent`
--

CREATE TABLE `pma__recent` (
  `username` varchar(64) COLLATE utf8_bin NOT NULL,
  `tables` text COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Recently accessed tables';

--
-- Dumping data for table `pma__recent`
--

INSERT INTO `pma__recent` (`username`, `tables`) VALUES
('root', '[{\"db\":\"iwp\",\"table\":\"enrolls\"},{\"db\":\"iwp\",\"table\":\"student\"},{\"db\":\"iwp\",\"table\":\"teacher\"},{\"db\":\"iwp\",\"table\":\"admin\"},{\"db\":\"iwp\",\"table\":\"department\"},{\"db\":\"iwp\",\"table\":\"course\"},{\"db\":\"iwp\",\"table\":\"teaches\"},{\"db\":\"iwp\",\"table\":\"allotted\"},{\"db\":\"iwp\",\"table\":\"Course\"},{\"db\":\"iwp\",\"table\":\"Student\"}]');

-- --------------------------------------------------------

--
-- Table structure for table `pma__relation`
--

CREATE TABLE `pma__relation` (
  `master_db` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `master_table` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `master_field` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `foreign_db` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `foreign_table` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `foreign_field` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Relation table';

-- --------------------------------------------------------

--
-- Table structure for table `pma__savedsearches`
--

CREATE TABLE `pma__savedsearches` (
  `id` int(5) UNSIGNED NOT NULL,
  `username` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `db_name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `search_name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `search_data` text COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Saved searches';

-- --------------------------------------------------------

--
-- Table structure for table `pma__table_coords`
--

CREATE TABLE `pma__table_coords` (
  `db_name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `table_name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `pdf_page_number` int(11) NOT NULL DEFAULT '0',
  `x` float UNSIGNED NOT NULL DEFAULT '0',
  `y` float UNSIGNED NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Table coordinates for phpMyAdmin PDF output';

-- --------------------------------------------------------

--
-- Table structure for table `pma__table_info`
--

CREATE TABLE `pma__table_info` (
  `db_name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `table_name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `display_field` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Table information for phpMyAdmin';

-- --------------------------------------------------------

--
-- Table structure for table `pma__table_uiprefs`
--

CREATE TABLE `pma__table_uiprefs` (
  `username` varchar(64) COLLATE utf8_bin NOT NULL,
  `db_name` varchar(64) COLLATE utf8_bin NOT NULL,
  `table_name` varchar(64) COLLATE utf8_bin NOT NULL,
  `prefs` text COLLATE utf8_bin NOT NULL,
  `last_update` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Tables'' UI preferences';

--
-- Dumping data for table `pma__table_uiprefs`
--

INSERT INTO `pma__table_uiprefs` (`username`, `db_name`, `table_name`, `prefs`, `last_update`) VALUES
('root', 'iwp', 'student', '{\"sorted_col\":\"`student`.`Student_ID` ASC\"}', '2017-09-10 14:47:25');

-- --------------------------------------------------------

--
-- Table structure for table `pma__tracking`
--

CREATE TABLE `pma__tracking` (
  `db_name` varchar(64) COLLATE utf8_bin NOT NULL,
  `table_name` varchar(64) COLLATE utf8_bin NOT NULL,
  `version` int(10) UNSIGNED NOT NULL,
  `date_created` datetime NOT NULL,
  `date_updated` datetime NOT NULL,
  `schema_snapshot` text COLLATE utf8_bin NOT NULL,
  `schema_sql` text COLLATE utf8_bin,
  `data_sql` longtext COLLATE utf8_bin,
  `tracking` set('UPDATE','REPLACE','INSERT','DELETE','TRUNCATE','CREATE DATABASE','ALTER DATABASE','DROP DATABASE','CREATE TABLE','ALTER TABLE','RENAME TABLE','DROP TABLE','CREATE INDEX','DROP INDEX','CREATE VIEW','ALTER VIEW','DROP VIEW') COLLATE utf8_bin DEFAULT NULL,
  `tracking_active` int(1) UNSIGNED NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Database changes tracking for phpMyAdmin';

-- --------------------------------------------------------

--
-- Table structure for table `pma__userconfig`
--

CREATE TABLE `pma__userconfig` (
  `username` varchar(64) COLLATE utf8_bin NOT NULL,
  `timevalue` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `config_data` text COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='User preferences storage for phpMyAdmin';

--
-- Dumping data for table `pma__userconfig`
--

INSERT INTO `pma__userconfig` (`username`, `timevalue`, `config_data`) VALUES
('root', '2017-09-03 13:27:41', '{\"collation_connection\":\"utf8mb4_unicode_ci\"}');

-- --------------------------------------------------------

--
-- Table structure for table `pma__usergroups`
--

CREATE TABLE `pma__usergroups` (
  `usergroup` varchar(64) COLLATE utf8_bin NOT NULL,
  `tab` varchar(64) COLLATE utf8_bin NOT NULL,
  `allowed` enum('Y','N') COLLATE utf8_bin NOT NULL DEFAULT 'N'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='User groups with configured menu items';

-- --------------------------------------------------------

--
-- Table structure for table `pma__users`
--

CREATE TABLE `pma__users` (
  `username` varchar(64) COLLATE utf8_bin NOT NULL,
  `usergroup` varchar(64) COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Users and their assignments to user groups';

--
-- Indexes for dumped tables
--

--
-- Indexes for table `pma__bookmark`
--
ALTER TABLE `pma__bookmark`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `pma__central_columns`
--
ALTER TABLE `pma__central_columns`
  ADD PRIMARY KEY (`db_name`,`col_name`);

--
-- Indexes for table `pma__column_info`
--
ALTER TABLE `pma__column_info`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `db_name` (`db_name`,`table_name`,`column_name`);

--
-- Indexes for table `pma__designer_settings`
--
ALTER TABLE `pma__designer_settings`
  ADD PRIMARY KEY (`username`);

--
-- Indexes for table `pma__export_templates`
--
ALTER TABLE `pma__export_templates`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `u_user_type_template` (`username`,`export_type`,`template_name`);

--
-- Indexes for table `pma__favorite`
--
ALTER TABLE `pma__favorite`
  ADD PRIMARY KEY (`username`);

--
-- Indexes for table `pma__history`
--
ALTER TABLE `pma__history`
  ADD PRIMARY KEY (`id`),
  ADD KEY `username` (`username`,`db`,`table`,`timevalue`);

--
-- Indexes for table `pma__navigationhiding`
--
ALTER TABLE `pma__navigationhiding`
  ADD PRIMARY KEY (`username`,`item_name`,`item_type`,`db_name`,`table_name`);

--
-- Indexes for table `pma__pdf_pages`
--
ALTER TABLE `pma__pdf_pages`
  ADD PRIMARY KEY (`page_nr`),
  ADD KEY `db_name` (`db_name`);

--
-- Indexes for table `pma__recent`
--
ALTER TABLE `pma__recent`
  ADD PRIMARY KEY (`username`);

--
-- Indexes for table `pma__relation`
--
ALTER TABLE `pma__relation`
  ADD PRIMARY KEY (`master_db`,`master_table`,`master_field`),
  ADD KEY `foreign_field` (`foreign_db`,`foreign_table`);

--
-- Indexes for table `pma__savedsearches`
--
ALTER TABLE `pma__savedsearches`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `u_savedsearches_username_dbname` (`username`,`db_name`,`search_name`);

--
-- Indexes for table `pma__table_coords`
--
ALTER TABLE `pma__table_coords`
  ADD PRIMARY KEY (`db_name`,`table_name`,`pdf_page_number`);

--
-- Indexes for table `pma__table_info`
--
ALTER TABLE `pma__table_info`
  ADD PRIMARY KEY (`db_name`,`table_name`);

--
-- Indexes for table `pma__table_uiprefs`
--
ALTER TABLE `pma__table_uiprefs`
  ADD PRIMARY KEY (`username`,`db_name`,`table_name`);

--
-- Indexes for table `pma__tracking`
--
ALTER TABLE `pma__tracking`
  ADD PRIMARY KEY (`db_name`,`table_name`,`version`);

--
-- Indexes for table `pma__userconfig`
--
ALTER TABLE `pma__userconfig`
  ADD PRIMARY KEY (`username`);

--
-- Indexes for table `pma__usergroups`
--
ALTER TABLE `pma__usergroups`
  ADD PRIMARY KEY (`usergroup`,`tab`,`allowed`);

--
-- Indexes for table `pma__users`
--
ALTER TABLE `pma__users`
  ADD PRIMARY KEY (`username`,`usergroup`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `pma__bookmark`
--
ALTER TABLE `pma__bookmark`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `pma__column_info`
--
ALTER TABLE `pma__column_info`
  MODIFY `id` int(5) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `pma__export_templates`
--
ALTER TABLE `pma__export_templates`
  MODIFY `id` int(5) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `pma__history`
--
ALTER TABLE `pma__history`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `pma__pdf_pages`
--
ALTER TABLE `pma__pdf_pages`
  MODIFY `page_nr` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `pma__savedsearches`
--
ALTER TABLE `pma__savedsearches`
  MODIFY `id` int(5) UNSIGNED NOT NULL AUTO_INCREMENT;--
-- Database: `test`
--
CREATE DATABASE IF NOT EXISTS `test` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `test`;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
