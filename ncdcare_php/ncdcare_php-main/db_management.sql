-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Apr 15, 2023 at 11:11 AM
-- Server version: 10.4.24-MariaDB
-- PHP Version: 8.1.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `db_management`
--

-- --------------------------------------------------------

--
-- Table structure for table `tb_adisease`
--

CREATE TABLE `tb_adisease` (
  `adis_id` int(11) NOT NULL,
  `adis_name` varchar(255) NOT NULL,
  `adis_detail` varchar(255) NOT NULL,
  `user_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tb_adisease`
--

INSERT INTO `tb_adisease` (`adis_id`, `adis_name`, `adis_detail`, `user_id`) VALUES
(1, 'sw', '', 13),
(2, 'โรคลมชัก', '555', 11);

-- --------------------------------------------------------

--
-- Table structure for table `tb_admin`
--

CREATE TABLE `tb_admin` (
  `admin_id` int(11) NOT NULL,
  `admin_name` varchar(255) DEFAULT NULL,
  `admin_email` varchar(255) DEFAULT NULL,
  `admin_tel` varchar(255) DEFAULT NULL,
  `admin_status` varchar(255) DEFAULT NULL,
  `admin_passwd` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tb_admin`
--

INSERT INTO `tb_admin` (`admin_id`, `admin_name`, `admin_email`, `admin_tel`, `admin_status`, `admin_passwd`) VALUES
(1, 'Admin Jack', 'admin@admin.com', '123456789', '0', '123456789'),
(2, 'Admin JJ', 'adminjj@admin.com', '123456789', '1', '123456789'),
(3, 'adminn', 'adminn@admin.com', '123456789', '1', 'adminn');

-- --------------------------------------------------------

--
-- Table structure for table `tb_advice`
--

CREATE TABLE `tb_advice` (
  `adv_id` int(11) NOT NULL,
  `adv_image` varchar(255) DEFAULT NULL,
  `adv_name` varchar(255) DEFAULT NULL,
  `adv_detail` varchar(255) DEFAULT NULL,
  `adv_status` varchar(255) DEFAULT NULL,
  `tb_user_user_id` int(11) NOT NULL,
  `tb_admin_admin_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tb_advice`
--

INSERT INTO `tb_advice` (`adv_id`, `adv_image`, `adv_name`, `adv_detail`, `adv_status`, `tb_user_user_id`, `tb_admin_admin_id`) VALUES
(10, '31012023152038_p1.png', 'ข้อไหล่ติด ทำอะไรก็ปวด ฟื้นฟูได้แค่ทำให้ถูกวิธี', '   ข้อไหล่ติด เป็นอาการที่ไม่สามารถยกแขนได้สุด จะรู้สึกปวดเวลายกแขนไปเกือบสุดทั้งด้านหน้า ด้านข้างหรือไขว้แขนไปด้านหลัง อาจไม่ใช่โรคร้ายแรง แต่ก็เป็นอุปสรรคในการใช้ชีวิตประจำวันมากพอสมควร ซึ่งสาเหตุของโรคเกิดได้หลายปัจจัย เช่น อายุที่มากขึ้น โรคประจำตัวที', '0', 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `tb_allergy`
--

CREATE TABLE `tb_allergy` (
  `al_id` int(11) NOT NULL,
  `al_name` varchar(255) NOT NULL,
  `al_symptom` varchar(255) NOT NULL,
  `user_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tb_allergy`
--

INSERT INTO `tb_allergy` (`al_id`, `al_name`, `al_symptom`, `user_id`) VALUES
(2, 's', 'a', 13),
(3, 'พารากระต่ายบิน', 'กดแล้ววาป', 11);

-- --------------------------------------------------------

--
-- Table structure for table `tb_answer`
--

CREATE TABLE `tb_answer` (
  `answer_id` int(11) NOT NULL,
  `answer_title` varchar(255) NOT NULL,
  `answer_score` int(11) NOT NULL,
  `question_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tb_answer`
--

INSERT INTO `tb_answer` (`answer_id`, `answer_title`, `answer_score`, `question_id`) VALUES
(1, 'มี', 1, 1),
(2, 'ไม่มี', 0, 1),
(3, 'มี', 1, 2),
(4, 'ไม่มี', 0, 2),
(5, 'มี', 1, 3),
(6, 'ไม่มี', 0, 3),
(7, 'มี', 1, 4),
(8, 'ไม่มี', 0, 4),
(9, 'มี', 1, 5),
(10, 'ไม่มี', 0, 5);

-- --------------------------------------------------------

--
-- Table structure for table `tb_assessmentquestions`
--

CREATE TABLE `tb_assessmentquestions` (
  `aq_id` int(11) NOT NULL,
  `aq_question` varchar(255) DEFAULT NULL,
  `type_id` varchar(255) DEFAULT NULL,
  `aq_answer1` varchar(255) DEFAULT NULL,
  `aq_answer2` varchar(255) DEFAULT NULL,
  `aq_answer3` varchar(255) DEFAULT NULL,
  `aq_answer4` varchar(255) DEFAULT NULL,
  `tb_admin_admin_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tb_assessmentquestions`
--

INSERT INTO `tb_assessmentquestions` (`aq_id`, `aq_question`, `type_id`, `aq_answer1`, `aq_answer2`, `aq_answer3`, `aq_answer4`, `tb_admin_admin_id`) VALUES
(10, 'คุณนอนพักผ่อนวันละกี่ชั่วโมง', '4', 'น้อยกว่า 2-3 ชั่วโมง', '4-5 ชั่วโมง', '6-7 ชั่วโมง', 'มากกว่า 8 ชั่วโมง', 0),
(11, 'คุณออกกำลังกายบ่อยแค่ไหน', '1', 'ไม่เลย', '1-2 ครั้ง/สัปดาห์', '3-4 ครั้ง/สัปดาห์', 'ทุกวัน/เกือบทุกวัน', 0),
(12, 'คุณดื่มน้ำผักผลไม้บ่อยแค่ไหน', '2', 'ไม่เลย', '1-2 ครั้ง/สัปดาห์', '3-4 ครั้ง/สัปดาห์', 'ทุกวัน/เกือบทุกวัน', 0),
(13, 'คุณมีปัญหาเรื่องการนอนหลับ หรือนอนหลับยากหรือไม่', '5', 'เป็นประจำ', 'บ่อยครั้ง', 'บางครั้ง', 'ไม่เคยมี', 0),
(14, 'คุณดื่มเครื่องดื่มแอลกอฮอล์บ่อยแค่ไหน', '3', 'มากกว่า 4 ครั้ง/สัปดาห์', '2-3 ครั้ง/สัปดาห์', '2-3 ครั้ง/เดือน', 'ไม่เคยดื่ม', 0),
(17, 'คุณรับประทานอาหารที่มีรสเค็มจัดบ่อยแค่ไหน', '4', 'ไม่เลย', '1-2 ครั้ง/สัปดาห์', '3-4 ครั้ง/สัปดาห์', 'ทุกวัน/เกือบทุกวัน', 0),
(18, 'คุณรับประทานผักและผลไม้หรือไม่', '4', 'ไม่เลย', '1-2 ครั้ง/สัปดาห์', '3-4 ครั้ง/สัปดาห์', 'ทุกวัน/เกือบทุกวัน', 0),
(19, 'คุณมีความเครียด วิตกกังวล บ่อยแค่ไหน', '4', 'ทุกวัน/เกือบทุกวัน', '3-4 ครั้ง/สัปดาห์', '1-2 ครั้ง/สัปดาห์', 'ไม่เลย', 0),
(20, 'คุณรับประทานไอศกครีมหรือขนมหวานบ่อยแค่ไหน', '1', 'ทุกวัน/เกือบทุกวัน', '3-4 ครั้ง/สัปดาห์', '1-2 ครั้ง/สัปดาห์', 'ไม่เลย', 0),
(21, 'คุณรับประทานของทอด ฟาดฟู้ด หรืออาหารผัดน้ำมันบ่อยแค่ไหน', '1', 'ทุกวัน/เกือบทุกวัน', '3-4 ครั้ง/สัปดาห์', '1-2 ครั้ง/สัปดาห์', 'ไม่เลย', 0),
(22, 'คุณเลือกรับประทานเนื้อสัตว์ติดมัน ติดหนัง มีไขมันแทรกบ่อยแค่ไหน', '1', 'ทุกวัน/เกือบทุกวัน', '3-4 ครั้ง/สัปดาห์', '1-2 ครั้ง/สัปดาห์', 'ไม่เลย', 0),
(23, 'คุณดื่มเครื่องดื่มที่ผสมนมข้นหวาน ครีมเทียม หรือวิปปิ้งครีมบ่อยแค่ไหน', '1', 'ทุกวัน/เกือบทุกวัน', '3-4 ครั้ง/สัปดาห์', '1-2 ครั้ง/สัปดาห์', 'ไม่เลย', 0),
(24, 'คุณดื่มกาแฟดำ กาแฟเย็น กาแฟปั่น เครื่องดื่มชง น้ำหวาน หรือนมเปรี้ยวบ่อยแค่ไหน', '2', 'ทุกวัน/เกือบทุกวัน', '3-4 ครั้ง/สัปดาห์', '1-2 ครั้ง/สัปดาห์', 'ไม่เลย', 0),
(25, 'คุณเติมน้ำตาล น้ำผึ้ง หรือน้ำเชื่อม ลงในอาหารบ่อยแค่ไหน', '2', 'ทุกวัน/เกือบทุกวัน', '3-4 ครั้ง/สัปดาห์', '1-2 ครั้ง/สัปดาห์', 'ไม่เลย', 0),
(26, 'คุณไม่ชิมอาหารก่อนปรุงน้ำปลา ซีอิ๊ว ซอสปรุงรส ปรุงน้อยหรือไม่ปรุงบ่อยแค่ไหน', '2', 'ทุกวัน/เกือบทุกวัน', '3-4 ครั้ง/สัปดาห์', '1-2 ครั้ง/สัปดาห์', 'ไม่เลย', 0),
(27, 'คุณรับประทานอาหารจานเดียวไขมันสูงหรืออาหารประเภทแกงกระทิบ่อยแค่ไหน', '2', 'ทุกวัน/เกือบทุกวัน', '3-4 ครั้ง/สัปดาห์', '1-2 ครั้ง/สัปดาห์', 'ไม่เลย', 0),
(28, 'คุณจดจ่อ หรือมีสมาธิได้น้อยลงหรือไม่', '5', 'เป็นประจำ', 'บ่อยครั้ง', 'บางครั้ง', 'ไม่เคยมี', 0),
(29, 'คุณมีอาการหงุดหงิด กระวนกระวาย หรือว้าวุ่นใจหรือไม่', '5', 'เป็นประจำ', 'บ่อยครั้ง', 'บางครั้ง', 'ไม่เคยมี', 0),
(30, 'คุณมีอาการรู้สึกเบื่อ หรือเซ็งหรือไม่', '5', 'เป็นประจำ', 'บ่อยครั้ง', 'บางครั้ง', 'ไม่เคยมี', 0),
(31, 'คุณมีความรู้สึกไม่อยากพบปะผู้คนหรือไม่', '5', 'เป็นประจำ', 'บ่อยครั้ง', 'บางครั้ง', 'ไม่เคยมี', 0),
(32, 'เมื่อคุณดื่มสุรา โดยทั่วไปแล้วคุณดื่มปริมาณเท่าไร/วัน', '3', '7 กระป๋อง/4 ขวดขึ้นไป', '4-7 กระป๋อง/3-4 ขวด', '1-3 กระป๋อง/1-2 ขวด', 'ไม่เคยดื่ม', 0),
(33, 'คุณสูบบุหรี่บ่อยแค่ไหน', '3', 'เป็นประจำ', 'บ่อยครั้ง', 'บางครั้ง', 'ไม่เคยสูบบุหรี่', 0),
(34, 'คุณสูบบุหรี่วันละกี่มวน', '3', '6 มวนขึ้นไป', '4-5 มวน', '3-4 มวน', '0-2 มวน', 0),
(35, 'หลังตื่นนอนตอนเช้า คุณสูบบุหรี่มวนแรกเมื่อไร', '3', 'ภายใน 5 นาที', '6-30 นาที', '31-60 นาที', '60 นาทีขึ้นไป', 0),
(36, 'คุณมีความเครียด วิตกกังวล บ่อยแค่ไหน', '4', 'ทุกวัน/เกือบทุกวัน', '3-4 ครั้ง/สัปดาห์', '1-2 ครั้ง/สัปดาห์', 'ไม่เลย', 0);

-- --------------------------------------------------------

--
-- Table structure for table `tb_assessmentrespondent`
--

CREATE TABLE `tb_assessmentrespondent` (
  `ar_id` int(11) NOT NULL,
  `ar_score` varchar(255) DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  `aq_id` int(11) NOT NULL,
  `type_id` int(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tb_assessmentrespondent`
--

INSERT INTO `tb_assessmentrespondent` (`ar_id`, `ar_score`, `user_id`, `aq_id`, `type_id`) VALUES
(30, '1', 11, 10, 4),
(31, '2', 11, 11, 1),
(32, '3', 11, 12, 2),
(33, '0', 11, 13, 5),
(34, '1', 11, 14, 3),
(35, '2', 11, 17, 4),
(36, '2', 11, 18, 4),
(37, '1', 11, 19, 4),
(38, '2', 11, 20, 1),
(39, '3', 11, 21, 1),
(40, '3', 11, 22, 1),
(41, '2', 11, 23, 1),
(42, '2', 11, 24, 2),
(43, '1', 11, 25, 2),
(44, '0', 11, 26, 2),
(45, '1', 11, 27, 2),
(46, '1', 11, 27, 2),
(47, '1', 11, 28, 5),
(48, '1', 11, 29, 5),
(49, '2', 11, 30, 5),
(50, '1', 11, 31, 5),
(51, '0', 11, 32, 3),
(52, '0', 11, 33, 3),
(53, '0', 11, 34, 3),
(54, '0', 11, 35, 3),
(55, '1', 11, 36, 4),
(56, '2', 13, 27, 2),
(57, '3', 13, 10, 4),
(58, '3', 13, 14, 3);

-- --------------------------------------------------------

--
-- Table structure for table `tb_bodypart`
--

CREATE TABLE `tb_bodypart` (
  `bodypart_id` int(11) NOT NULL,
  `bodypart_name` varchar(255) NOT NULL,
  `bodypart_icon_id` varchar(255) NOT NULL,
  `bodypart_icon_fontFamily` varchar(255) NOT NULL,
  `bodypart_status` int(2) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tb_bodypart`
--

INSERT INTO `tb_bodypart` (`bodypart_id`, `bodypart_name`, `bodypart_icon_id`, `bodypart_icon_fontFamily`, `bodypart_status`) VALUES
(1, 'สภาพจิตใจ', '0xee49', 'MaterialIcons', 0),
(2, 'ศีรษะ', '0xee49', 'MaterialIcons', 0);

-- --------------------------------------------------------

--
-- Table structure for table `tb_contactus`
--

CREATE TABLE `tb_contactus` (
  `contact_id` int(11) NOT NULL,
  `contact_image` varchar(255) DEFAULT NULL,
  `contact_name` varchar(255) DEFAULT NULL,
  `contact_url` varchar(255) DEFAULT NULL,
  `contact_status` varchar(255) DEFAULT NULL,
  `tb_user_user_id` int(11) NOT NULL,
  `tb_admin_admin_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tb_contactus`
--

INSERT INTO `tb_contactus` (`contact_id`, `contact_image`, `contact_name`, `contact_url`, `contact_status`, `tb_user_user_id`, `tb_admin_admin_id`) VALUES
(6, '31012023152615_p1.png', 'กระทรวงสาธารณสุข', 'https://moph.thaijobjob.com/', '0', 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `tb_content`
--

CREATE TABLE `tb_content` (
  `content_id` int(11) NOT NULL,
  `content_image` varchar(255) DEFAULT NULL,
  `content_name` varchar(255) DEFAULT NULL,
  `content_detail` varchar(255) DEFAULT NULL,
  `content_status` varchar(255) DEFAULT NULL,
  `tb_user_user_id` int(11) NOT NULL,
  `tb_admin_admin_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tb_content`
--

INSERT INTO `tb_content` (`content_id`, `content_image`, `content_name`, `content_detail`, `content_status`, `tb_user_user_id`, `tb_admin_admin_id`) VALUES
(15, '31012023151504_p1.png', 'ภาวะลองโควิด (long covid) เป็นแล้วหายไหม วิธีสังเกตและการรักษา', 'ลองโควิด ต้องไม่ใช่ ภายใน 1 เดือน ต้องหายจากโควิด และมีอาการต่อเนื่องอย่างน้อย 2 เดือน ต้องแยกว่าไม่ได้เป็นโรคอื่นที่เป็นมาก่อนเป็นโควิด เช่น โรคหัวใจ โรคปอด นอนไม่หลับ บางคนไม่เคยหาหมอเลย แต่เมื่อเป็นโควิดแล้วได้ตรวจ จึงได้พบว่าเป็นโรคอื่นมาก่อนแล้ว', '0', 0, 0),
(24, '08032023102410_p1.png', 'ประเมินอนาคตสุขภาพ', 'การตรวจความสมบูรณ์ของเม็ดเลือด และอาจรวมถึงการตรวจค่าฮอร์โมนหรือสารที่ถูกสร้างจากร่างกายและสารอื่นๆ ในเลือดของคุณร่วมด้วยในบางกรณี โดยผลลัพธ์ที่ได้จากการตรวจนั้นสามารถให้ข้อมูลที่สำคัญแก่ผู้ให้บริการดูแลสุขภาพเกี่ยวกับสุขภาพของคุณโดยรวมและความเสี่ยงต่อโรค', '1', 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `tb_disease`
--

CREATE TABLE `tb_disease` (
  `dis_id` int(11) NOT NULL,
  `dis_image` varchar(255) DEFAULT NULL,
  `dis_name` varchar(255) DEFAULT NULL,
  `dis_detail` varchar(255) DEFAULT NULL,
  `dis_type` varchar(255) DEFAULT NULL,
  `dis_status` varchar(255) DEFAULT NULL,
  `tb_user_user_id` int(11) NOT NULL,
  `tb_admin_admin_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tb_disease`
--

INSERT INTO `tb_disease` (`dis_id`, `dis_image`, `dis_name`, `dis_detail`, `dis_type`, `dis_status`, `tb_user_user_id`, `tb_admin_admin_id`) VALUES
(7, 'de1.jpg', 'โรคเบาหวาน (Diabetes)', 'โรคเบาหวาน (Diabetes) คือโรคที่เกิดจากความผิดปกติของการทำงานของฮอร์โมนที่ชื่อว่า อินสุลิน (Insulin) ซึ่งโดยปกติแล้วร่างกายของคนเราจำเป็นต้องมีอินสุลิน เพื่อนำน้ำตาลในกระแสเลือดไปเลี้ยงอวัยวะต่าง ๆ ของร่างกาย โดยเฉพาะสมองและกล้ามเนื้อ ในภาวะที่อินสุลินมีคว', '0', '0', 0, 0),
(9, '08032023102740_p1.png', 'อ้วนลงพุงสร้างโรค', 'โรคอ้วน คือ ภาวะที่มีไขมันสะสมในร่างกายเพิ่มมากขึ้น โดยจะใช้ค่าร้อยละไขมันในร่างกาย > 20 ในชาย หรือมากกว่า > 30 ในหญิง ภาวะไขมันสะสมอาจมาจากไขมันใต้ผิวหนังมากหรือจากไขมันในช่องท้องมาก ซึ่งวิธีวัดไขมันมีหลายรูปแบบ ที่นิยมใช้คือการวัดจากดัชนีมวลกาย (BMI)\r\n\r', '0', '1', 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `tb_disease_symbol`
--

CREATE TABLE `tb_disease_symbol` (
  `disease_symbol_id` int(11) NOT NULL,
  `disease_symbol_name` varchar(255) NOT NULL,
  `isBMI` int(2) NOT NULL,
  `isAge` int(2) NOT NULL,
  `isFootImage` int(2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tb_disease_symbol`
--

INSERT INTO `tb_disease_symbol` (`disease_symbol_id`, `disease_symbol_name`, `isBMI`, `isAge`, `isFootImage`) VALUES
(1, 'โรคหลอดเลือดสมอง', 0, 1, 0),
(2, 'โรคความดันโลหิตสูง', 0, 1, 0),
(3, 'โรคถุงลมโป่งพอง', 0, 1, 0),
(4, 'โรคเบาหวาน', 0, 1, 1),
(5, 'โรคอ้วนลงพุง', 1, 1, 0);

-- --------------------------------------------------------

--
-- Table structure for table `tb_emergency`
--

CREATE TABLE `tb_emergency` (
  `em_id` int(11) NOT NULL,
  `em_name` varchar(255) DEFAULT NULL,
  `em_tel` varchar(255) DEFAULT NULL,
  `em_status` varchar(255) DEFAULT NULL,
  `tb_user_user_id` int(11) NOT NULL,
  `tb_admin_admin_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tb_emergency`
--

INSERT INTO `tb_emergency` (`em_id`, `em_name`, `em_tel`, `em_status`, `tb_user_user_id`, `tb_admin_admin_id`) VALUES
(7, 'ดับเพลิง', '199', '0', 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `tb_knowledgebase`
--

CREATE TABLE `tb_knowledgebase` (
  `knowb_id` int(11) NOT NULL,
  `knowb_image` varchar(255) DEFAULT NULL,
  `knowb_name` varchar(255) DEFAULT NULL,
  `knowb_video` varchar(255) DEFAULT NULL,
  `knowb_status` varchar(255) DEFAULT NULL,
  `tb_user_user_id` int(11) NOT NULL,
  `tb_admin_admin_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tb_knowledgebase`
--

INSERT INTO `tb_knowledgebase` (`knowb_id`, `knowb_image`, `knowb_name`, `knowb_video`, `knowb_status`, `tb_user_user_id`, `tb_admin_admin_id`) VALUES
(11, '31012023152845_p1.png', 'นอนอย่างไรให้สุขภาพดี อายุยืน', '<iframe src=\"https://www.youtube.com/embed/FqT5lk_cUwM\" title=\"YouTube video player\" frameborder=\"0\" allow=\"accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share\" allowfullscreen></iframe>', '0', 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `tb_question`
--

CREATE TABLE `tb_question` (
  `question_id` int(11) NOT NULL,
  `question_title` varchar(255) NOT NULL,
  `disease_symbol_id` int(11) NOT NULL,
  `symbol_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tb_question`
--

INSERT INTO `tb_question` (`question_id`, `question_title`, `disease_symbol_id`, `symbol_id`) VALUES
(1, 'น้ำหนักลดลงจากอาการไม่อยากอาหารหรือเบื่ออาหาร', 3, 1),
(2, 'มีอาการพูดไม่ชัดหรือไม่?', 1, 2),
(3, 'มีอาการอ่อนเพลีย', 3, 3),
(4, 'รู้สึกเหนื่อยง่ายและอ่อนเพลียไหม?', 4, 4),
(5, 'มีอาการปวดศีรษะอย่างรุนแรงร่วมด้วยหรือไม่?', 1, 5);

-- --------------------------------------------------------

--
-- Table structure for table `tb_result`
--

CREATE TABLE `tb_result` (
  `result_id` int(11) NOT NULL,
  `result_symbol` varchar(255) NOT NULL,
  `result_age` int(11) NOT NULL,
  `result_height` int(11) NOT NULL,
  `result_weight` int(11) NOT NULL,
  `result_image_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tb_result`
--

INSERT INTO `tb_result` (`result_id`, `result_symbol`, `result_age`, `result_height`, `result_weight`, `result_image_id`, `user_id`) VALUES
(1, '1,2,3,4', 20, 0, 0, 1, 11);

-- --------------------------------------------------------

--
-- Table structure for table `tb_result_detail`
--

CREATE TABLE `tb_result_detail` (
  `result_detail_id` int(11) NOT NULL,
  `result_detail_score` int(11) NOT NULL,
  `result_detail_max_score` int(11) NOT NULL,
  `disease_symbol_id` int(11) NOT NULL,
  `result_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tb_result_detail`
--

INSERT INTO `tb_result_detail` (`result_detail_id`, `result_detail_score`, `result_detail_max_score`, `disease_symbol_id`, `result_id`) VALUES
(1, 4, 4, 3, 1),
(2, 3, 3, 1, 1),
(3, 2, 2, 4, 1);

-- --------------------------------------------------------

--
-- Table structure for table `tb_result_image`
--

CREATE TABLE `tb_result_image` (
  `result_image_id` int(11) NOT NULL,
  `result_image_name` varchar(255) NOT NULL,
  `result_image_status` int(2) NOT NULL,
  `result_image_result` double NOT NULL,
  `disease_symbol_id` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tb_result_image`
--

INSERT INTO `tb_result_image` (`result_image_id`, `result_image_name`, `result_image_status`, `result_image_result`, `disease_symbol_id`) VALUES
(1, '15042023110433_p1.jpg', 1, 3, '4');

-- --------------------------------------------------------

--
-- Table structure for table `tb_sourceknowledge`
--

CREATE TABLE `tb_sourceknowledge` (
  `sourcek_id` int(11) NOT NULL,
  `sourcek_image` varchar(255) DEFAULT NULL,
  `sourcek_name` varchar(255) DEFAULT NULL,
  `sourcek_url` varchar(255) DEFAULT NULL,
  `sourcek_status` varchar(255) DEFAULT NULL,
  `tb_user_user_id` int(11) NOT NULL,
  `tb_admin_admin_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tb_sourceknowledge`
--

INSERT INTO `tb_sourceknowledge` (`sourcek_id`, `sourcek_image`, `sourcek_name`, `sourcek_url`, `sourcek_status`, `tb_user_user_id`, `tb_admin_admin_id`) VALUES
(8, '01022023104822_p1.png', 'ความรู้ทางการแพทย์', 'https://vibharamamata.com/knowledge.php', '0', 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `tb_suggestion`
--

CREATE TABLE `tb_suggestion` (
  `sug_id` int(11) NOT NULL,
  `sug_rate` varchar(3) NOT NULL,
  `sug_detail` varchar(255) DEFAULT NULL,
  `tb_user_user_id` int(11) NOT NULL,
  `tb_admin_admin_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tb_suggestion`
--

INSERT INTO `tb_suggestion` (`sug_id`, `sug_rate`, `sug_detail`, `tb_user_user_id`, `tb_admin_admin_id`) VALUES
(10, '1.0', 'ss', 13, 0),
(11, '1.0', 'ss', 13, 0),
(12, '1.5', 'sdsd', 13, 0),
(13, '3.0', '30', 11, 0);

-- --------------------------------------------------------

--
-- Table structure for table `tb_symbol`
--

CREATE TABLE `tb_symbol` (
  `symbol_id` int(11) NOT NULL,
  `symbol_name` varchar(255) NOT NULL,
  `symbol_dec` varchar(255) NOT NULL,
  `symbol_status` int(2) NOT NULL DEFAULT 0,
  `bodypart_id` int(11) NOT NULL,
  `disease_symbol_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tb_symbol`
--

INSERT INTO `tb_symbol` (`symbol_id`, `symbol_name`, `symbol_dec`, `symbol_status`, `bodypart_id`, `disease_symbol_id`) VALUES
(1, 'น้ำหนักลด', 'asdgarweg', 0, 1, 3),
(2, 'พูดไม่ชัด', 'asdgarweg', 0, 1, 1),
(3, 'อ่อนเพลีย', 'asdgarweg', 0, 1, 3),
(4, 'เหนื่อยล้าอ่อนเพลีย', 'asdgarweg', 0, 1, 4),
(5, 'ปวดศีรษะรุนแรง', 'asdgarweg', 0, 2, 1);

-- --------------------------------------------------------

--
-- Table structure for table `tb_type`
--

CREATE TABLE `tb_type` (
  `type_id` int(11) NOT NULL,
  `type_name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tb_type`
--

INSERT INTO `tb_type` (`type_id`, `type_name`) VALUES
(1, 'โรคอ้วนลงพุง'),
(2, 'โรคเบาหวาน'),
(3, 'โรคถุงลมโป่งพอง'),
(4, 'โรคความดันโลหิตสูง'),
(5, 'โรคหลอดเลือดในสมอง');

-- --------------------------------------------------------

--
-- Table structure for table `tb_user`
--

CREATE TABLE `tb_user` (
  `user_id` int(11) NOT NULL,
  `user_fullname` varchar(255) DEFAULT NULL,
  `user_name` varchar(255) DEFAULT NULL,
  `user_gender` varchar(255) DEFAULT NULL,
  `user_age` varchar(255) DEFAULT NULL,
  `user_email` varchar(255) DEFAULT NULL,
  `user_tel` varchar(255) DEFAULT NULL,
  `user_image` varchar(255) DEFAULT NULL,
  `user_status` varchar(255) DEFAULT NULL,
  `user_passwd` varchar(255) DEFAULT NULL,
  `otp` varchar(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tb_user`
--

INSERT INTO `tb_user` (`user_id`, `user_fullname`, `user_name`, `user_gender`, `user_age`, `user_email`, `user_tel`, `user_image`, `user_status`, `user_passwd`, `otp`) VALUES
(11, NULL, 'user', '0', '25', 'ju_1dearday@hotmail.com', '123456', '11032023090015_p1.jpg', '0', '123456', NULL),
(12, '', 'user1', '1', '20', 'user1@user.com', '123456', '04022023113709_p1.png', '0', 'user1', NULL),
(13, '', 'user2', '0', '24', 'user2@user.com', '12345', '04022023113833_p1.png', '0', 'user2', NULL),
(14, 'test', 'test01', '0', '20', 'test@gmail.com', '0887897899', '', '1', '123456', NULL),
(15, NULL, 'userr', '1', '20', 'userr@user.com', '123456789', '08032023102044_p1.png', '1', 'userr', NULL);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `tb_adisease`
--
ALTER TABLE `tb_adisease`
  ADD PRIMARY KEY (`adis_id`);

--
-- Indexes for table `tb_admin`
--
ALTER TABLE `tb_admin`
  ADD PRIMARY KEY (`admin_id`);

--
-- Indexes for table `tb_advice`
--
ALTER TABLE `tb_advice`
  ADD PRIMARY KEY (`adv_id`);

--
-- Indexes for table `tb_allergy`
--
ALTER TABLE `tb_allergy`
  ADD PRIMARY KEY (`al_id`);

--
-- Indexes for table `tb_answer`
--
ALTER TABLE `tb_answer`
  ADD PRIMARY KEY (`answer_id`);

--
-- Indexes for table `tb_assessmentquestions`
--
ALTER TABLE `tb_assessmentquestions`
  ADD PRIMARY KEY (`aq_id`);

--
-- Indexes for table `tb_assessmentrespondent`
--
ALTER TABLE `tb_assessmentrespondent`
  ADD PRIMARY KEY (`ar_id`);

--
-- Indexes for table `tb_bodypart`
--
ALTER TABLE `tb_bodypart`
  ADD PRIMARY KEY (`bodypart_id`);

--
-- Indexes for table `tb_contactus`
--
ALTER TABLE `tb_contactus`
  ADD PRIMARY KEY (`contact_id`);

--
-- Indexes for table `tb_content`
--
ALTER TABLE `tb_content`
  ADD PRIMARY KEY (`content_id`);

--
-- Indexes for table `tb_disease`
--
ALTER TABLE `tb_disease`
  ADD PRIMARY KEY (`dis_id`);

--
-- Indexes for table `tb_disease_symbol`
--
ALTER TABLE `tb_disease_symbol`
  ADD PRIMARY KEY (`disease_symbol_id`);

--
-- Indexes for table `tb_emergency`
--
ALTER TABLE `tb_emergency`
  ADD PRIMARY KEY (`em_id`);

--
-- Indexes for table `tb_knowledgebase`
--
ALTER TABLE `tb_knowledgebase`
  ADD PRIMARY KEY (`knowb_id`);

--
-- Indexes for table `tb_question`
--
ALTER TABLE `tb_question`
  ADD PRIMARY KEY (`question_id`);

--
-- Indexes for table `tb_result`
--
ALTER TABLE `tb_result`
  ADD PRIMARY KEY (`result_id`);

--
-- Indexes for table `tb_result_detail`
--
ALTER TABLE `tb_result_detail`
  ADD PRIMARY KEY (`result_detail_id`);

--
-- Indexes for table `tb_result_image`
--
ALTER TABLE `tb_result_image`
  ADD PRIMARY KEY (`result_image_id`);

--
-- Indexes for table `tb_sourceknowledge`
--
ALTER TABLE `tb_sourceknowledge`
  ADD PRIMARY KEY (`sourcek_id`);

--
-- Indexes for table `tb_suggestion`
--
ALTER TABLE `tb_suggestion`
  ADD PRIMARY KEY (`sug_id`);

--
-- Indexes for table `tb_symbol`
--
ALTER TABLE `tb_symbol`
  ADD PRIMARY KEY (`symbol_id`);

--
-- Indexes for table `tb_type`
--
ALTER TABLE `tb_type`
  ADD PRIMARY KEY (`type_id`);

--
-- Indexes for table `tb_user`
--
ALTER TABLE `tb_user`
  ADD PRIMARY KEY (`user_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `tb_adisease`
--
ALTER TABLE `tb_adisease`
  MODIFY `adis_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `tb_admin`
--
ALTER TABLE `tb_admin`
  MODIFY `admin_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `tb_advice`
--
ALTER TABLE `tb_advice`
  MODIFY `adv_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `tb_allergy`
--
ALTER TABLE `tb_allergy`
  MODIFY `al_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `tb_answer`
--
ALTER TABLE `tb_answer`
  MODIFY `answer_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `tb_assessmentquestions`
--
ALTER TABLE `tb_assessmentquestions`
  MODIFY `aq_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=37;

--
-- AUTO_INCREMENT for table `tb_assessmentrespondent`
--
ALTER TABLE `tb_assessmentrespondent`
  MODIFY `ar_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=59;

--
-- AUTO_INCREMENT for table `tb_bodypart`
--
ALTER TABLE `tb_bodypart`
  MODIFY `bodypart_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `tb_contactus`
--
ALTER TABLE `tb_contactus`
  MODIFY `contact_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `tb_content`
--
ALTER TABLE `tb_content`
  MODIFY `content_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- AUTO_INCREMENT for table `tb_disease`
--
ALTER TABLE `tb_disease`
  MODIFY `dis_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `tb_disease_symbol`
--
ALTER TABLE `tb_disease_symbol`
  MODIFY `disease_symbol_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `tb_emergency`
--
ALTER TABLE `tb_emergency`
  MODIFY `em_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `tb_knowledgebase`
--
ALTER TABLE `tb_knowledgebase`
  MODIFY `knowb_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `tb_question`
--
ALTER TABLE `tb_question`
  MODIFY `question_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `tb_result`
--
ALTER TABLE `tb_result`
  MODIFY `result_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `tb_result_detail`
--
ALTER TABLE `tb_result_detail`
  MODIFY `result_detail_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `tb_result_image`
--
ALTER TABLE `tb_result_image`
  MODIFY `result_image_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `tb_sourceknowledge`
--
ALTER TABLE `tb_sourceknowledge`
  MODIFY `sourcek_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `tb_suggestion`
--
ALTER TABLE `tb_suggestion`
  MODIFY `sug_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `tb_symbol`
--
ALTER TABLE `tb_symbol`
  MODIFY `symbol_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `tb_type`
--
ALTER TABLE `tb_type`
  MODIFY `type_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `tb_user`
--
ALTER TABLE `tb_user`
  MODIFY `user_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
