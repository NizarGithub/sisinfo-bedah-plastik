-- phpMyAdmin SQL Dump
-- version 4.6.5.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Mar 26, 2018 at 08:38 AM
-- Server version: 10.1.21-MariaDB
-- PHP Version: 5.6.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `bedah`
--

-- --------------------------------------------------------

--
-- Table structure for table `ci_sessions`
--

CREATE TABLE `ci_sessions` (
  `id` varchar(128) NOT NULL,
  `ip_address` varchar(45) NOT NULL,
  `timestamp` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `data` blob NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `ci_sessions`
--

INSERT INTO `ci_sessions` (`id`, `ip_address`, `timestamp`, `data`) VALUES
('m3bbvr72c2s0r61o56l3vlp56l0t2ijl', '::1', 1521793033, 0x5f5f63695f6c6173745f726567656e65726174657c693a313532313737313534303b6c6f67696e7c613a323a7b733a343a2275736572223b733a353a2261646d696e223b733a383a2270617373776f7264223b733a33323a223264316133333131373364316539363331333037636164396662383334623433223b7d);

-- --------------------------------------------------------

--
-- Table structure for table `mst_rs`
--

CREATE TABLE `mst_rs` (
  `id` int(1) NOT NULL,
  `name` varchar(25) DEFAULT NULL,
  `group` varchar(2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `mst_rs`
--

INSERT INTO `mst_rs` (`id`, `name`, `group`) VALUES
(1, 'RSPAD', '2'),
(2, 'PAV. KARTIKA', '2'),
(3, 'PAV. DARMAWAN', '1'),
(4, 'PAV. IMAM SUJUDI', '1');

-- --------------------------------------------------------

--
-- Table structure for table `mst_ruangan`
--

CREATE TABLE `mst_ruangan` (
  `ruanganID` char(3) NOT NULL,
  `ruanganName` char(30) DEFAULT NULL,
  `id_ruang_tindakan` varchar(5) DEFAULT NULL,
  `rs` tinyint(1) DEFAULT NULL,
  `active` tinyint(4) DEFAULT '1',
  `priority` int(3) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `mst_ruangan`
--

INSERT INTO `mst_ruangan` (`ruanganID`, `ruanganName`, `id_ruang_tindakan`, `rs`, `active`, `priority`) VALUES
('001', 'KAMAR ABLASI', '1001', 1, 1, 8),
('002', 'PAV.AMINO', '1002', 1, 1, 13),
('003', 'BAYI PERISTI', '1003', 1, 1, 1),
('004', 'BEDAH', '1004', 1, 1, 2),
('005', 'ICU', '1005', 1, 1, 4),
('006', 'IGD', '1006', 1, 1, 5),
('007', 'IKA', '1007', 1, 1, 6),
('008', 'JANTUNG', '1008', 1, 1, 7),
('009', 'NEUROVASK', '1009', 1, 1, 9),
('010', 'OBSGIN', '1010', 1, 1, 11),
('011', 'PERSALINAN', '1011', 1, 1, 14),
('013', 'PU', '1012', 1, 1, 15),
('014', 'PARU', '1013', 1, 1, 12),
('015', 'STROKE', '1014', 1, 1, 16),
('016', 'HCU', '1015', 1, 0, 3),
('017', 'OBSERVASI', '1028', 1, 1, 10),
('102', 'SVIP KARTIKA', NULL, 2, 1, 2),
('103', 'VIP KARTIKA', NULL, 2, 1, 3),
('106', 'SVIP DARMAWAN', NULL, 3, 1, 1),
('107', 'VIP DARMAWAN', NULL, 3, 1, 2),
('108', 'KELAS I DARMAWAN', NULL, 3, 1, 5),
('109', 'KELAS II DARMAWAN', NULL, 3, 1, 6),
('111', 'VIP IMAN SUJUDI', NULL, 4, 1, 1),
('112', 'KELAS I IMAN SUJUDI', NULL, 4, 1, 4),
('114', 'ICU KARTIKA', NULL, 2, 1, 7),
('115', 'IMCU KARTIKA', NULL, 2, 1, 8),
('116', 'VIP A CVC', 'RI049', 2, 1, 17),
('118', 'VIP A DARMAWAN', NULL, 3, 1, 3),
('119', 'VIP C DARMAWAN', NULL, 3, 1, 4),
('120', 'SVIP A KARTIKA', NULL, 2, 1, 1),
('121', 'VIP B KARTIKA', NULL, 2, 1, 4),
('122', 'KEMOTERAPI', NULL, 2, 1, 9),
('123', 'VIP A IMAN SUJUDI', NULL, 4, 1, 2),
('124', 'VIP B IMAN SUJUDI', NULL, 4, 1, 3),
('125', 'VIP B CVC', 'RI048', 2, 1, 17);

-- --------------------------------------------------------

--
-- Table structure for table `mst_tempat_tidur`
--

CREATE TABLE `mst_tempat_tidur` (
  `bedID` char(15) NOT NULL,
  `keterangan` char(60) DEFAULT NULL,
  `tarif` decimal(12,0) DEFAULT NULL,
  `kondisi` char(15) DEFAULT NULL,
  `lantai` char(20) DEFAULT NULL,
  `ruanganID` char(3) DEFAULT NULL,
  `no_kamar` varchar(10) DEFAULT NULL,
  `jns_rawat` varchar(2) DEFAULT NULL,
  `active` tinyint(1) DEFAULT '1',
  `group` varchar(2) DEFAULT NULL,
  `id_ruang_tindakan` varchar(5) DEFAULT NULL,
  `rs` tinyint(1) DEFAULT NULL,
  `kelas` varchar(25) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `mst_tempat_tidur`
--

INSERT INTO `mst_tempat_tidur` (`bedID`, `keterangan`, `tarif`, `kondisi`, `lantai`, `ruanganID`, `no_kamar`, `jns_rawat`, `active`, `group`, `id_ruang_tindakan`, `rs`, `kelas`) VALUES
('001', 'JANTUNG', NULL, NULL, NULL, NULL, NULL, 'rj', 0, NULL, '001', 1, NULL),
('002', 'AKUPUNTUR', NULL, NULL, NULL, NULL, NULL, 'rj', 0, NULL, '002', 1, NULL),
('003', 'ANAK', NULL, NULL, NULL, NULL, NULL, 'rj', 0, NULL, '003', 1, NULL),
('004', 'BEDAH ANAK', NULL, NULL, NULL, NULL, NULL, 'rj', 0, NULL, '004', 1, NULL),
('005', 'BEDAH DIGESTIF', NULL, NULL, NULL, NULL, NULL, 'rj', 0, NULL, '005', 1, NULL),
('006', 'BEDAH PLASTIK', NULL, NULL, NULL, NULL, NULL, 'rj', 0, NULL, '006', 1, NULL),
('007', 'BEDAH TUMOR', NULL, NULL, NULL, NULL, NULL, 'rj', 0, NULL, '007', 1, NULL),
('008', 'BEDAH SYARAF', NULL, NULL, NULL, NULL, NULL, 'rj', 0, NULL, '008', 1, NULL),
('009', 'BEDAH VIP', NULL, NULL, NULL, NULL, NULL, 'rj', 0, NULL, '009', 1, NULL),
('010', 'FISIOTHERAPI', NULL, NULL, NULL, NULL, NULL, 'rj', 0, NULL, '010', 1, NULL),
('011', 'GIGI&MULUT', NULL, NULL, NULL, NULL, NULL, 'rj', 0, NULL, '011', 1, NULL),
('012', 'GIZI', NULL, NULL, NULL, NULL, NULL, 'rj', 0, NULL, '012', 1, NULL),
('013', 'HEMODIALISA', NULL, NULL, NULL, NULL, NULL, 'rj', 0, NULL, '013', 1, NULL),
('014', 'HEMATOLOGI', NULL, NULL, NULL, NULL, NULL, 'rj', 0, NULL, '014', 1, NULL),
('015', 'PENYAKIT DALAM', NULL, NULL, NULL, NULL, NULL, 'rj', 0, NULL, '015', 1, NULL),
('016', 'OKUPASI TERAPI', NULL, NULL, NULL, NULL, NULL, 'rj', 0, NULL, '016', 1, NULL),
('017', 'REHABILITASI MEDIK', NULL, NULL, NULL, NULL, NULL, 'rj', 0, NULL, '017', 1, NULL),
('018', 'TERAPI WICARA', NULL, NULL, NULL, NULL, NULL, 'rj', 0, NULL, '018', 1, NULL),
('019', 'JIWA', NULL, NULL, NULL, NULL, NULL, 'rj', 0, NULL, '019', 1, NULL),
('020', 'KULIT & KELAMIN', NULL, NULL, NULL, NULL, NULL, 'rj', 0, NULL, '020', 1, NULL),
('021', 'LAB KLINIK', NULL, NULL, NULL, NULL, NULL, 'rj', 0, NULL, '021', 1, NULL),
('022', 'MATA', NULL, NULL, NULL, NULL, NULL, 'rj', 0, NULL, '022', 1, NULL),
('023', 'NUKLIR', NULL, NULL, NULL, NULL, NULL, 'rj', 0, NULL, '023', 1, NULL),
('024', 'OBGIN', NULL, NULL, NULL, NULL, NULL, 'rj', 0, NULL, '024', 1, NULL),
('025', 'BEDAH ORTOPEDI', NULL, NULL, NULL, NULL, NULL, 'rj', 0, NULL, '025', 1, NULL),
('026', 'PARU', NULL, NULL, NULL, NULL, NULL, 'rj', 0, NULL, '026', 1, NULL),
('027', 'PATOLOGI ANATOMI', NULL, NULL, NULL, NULL, NULL, 'rj', 0, NULL, '027', 1, NULL),
('028', 'RADIONUKLIR', NULL, NULL, NULL, NULL, NULL, 'rj', 0, NULL, '028', 1, NULL),
('030', 'SARAF', NULL, NULL, NULL, NULL, NULL, 'rj', 0, NULL, '030', 1, NULL),
('031', 'BEDAH THORAKS', NULL, NULL, NULL, NULL, NULL, 'rj', 0, NULL, '031', 1, NULL),
('032', 'THT', NULL, NULL, NULL, NULL, NULL, 'rj', 0, NULL, '032', 1, NULL),
('033', 'INSTALASI GAWAT DARURAT', NULL, NULL, NULL, NULL, NULL, 'rj', 0, NULL, '033', 1, NULL),
('034', 'BEDAH UROLOGI', NULL, NULL, NULL, NULL, NULL, 'rj', 0, NULL, '034', 1, NULL),
('035', 'KAMAR OPERASI', NULL, NULL, NULL, NULL, NULL, 'rj', 0, NULL, '035', 1, NULL),
('036', 'GASTROLOGI', NULL, NULL, NULL, NULL, NULL, 'rj', 0, NULL, '036', 1, NULL),
('038', 'ANAESTESI', NULL, NULL, NULL, NULL, NULL, 'rj', 0, NULL, '038', 1, NULL),
('039', 'BEDAH VASKULER', NULL, NULL, NULL, NULL, NULL, 'rj', 0, NULL, '039', 1, NULL),
('062', 'POLI PENYAKIT DALAM (VCT)', NULL, NULL, NULL, NULL, NULL, 'rj', 0, NULL, '062', 1, NULL),
('064', 'KM.TIND & PERSALINAN', NULL, NULL, NULL, NULL, NULL, 'rj', 0, NULL, '064', 1, NULL),
('067', 'CVC', NULL, NULL, NULL, NULL, NULL, 'rj', 0, NULL, '067', 1, NULL),
('068', 'RADIOTERAPI', NULL, NULL, NULL, NULL, NULL, 'rj', 0, NULL, '068', 1, NULL),
('101 DAR', 'VIP A 101 DARMAWAN', NULL, 'Baik', 'LANTAI 1', '118', '101', 'ri', 1, NULL, 'RI017', 3, '004'),
('102 DAR', 'VIP 102 DARMAWAN', NULL, 'Baik', 'LANTAI 1', '107', '102', 'ri', 1, NULL, 'RI008', 3, '004'),
('103 DAR', 'VIP 103 DARMAWAN', NULL, 'Baik', 'LANTAI 1', '107', '103', 'ri', 1, NULL, 'RI008', 3, '004'),
('104 DAR', 'VIP 104 DARMAWAN', NULL, 'Baik', 'LANTAI 1', '107', '104', 'ri', 1, NULL, 'RI008', 3, '004'),
('105 DAR', 'VIP 105 DARMAWAN', NULL, 'Baik', 'LANTAI 1', '107', '105', 'ri', 1, NULL, 'RI008', 3, '004'),
('106 DAR', 'SVIP 106 DARMAWAN', NULL, 'Baik', 'LANTAI 1', '106', '106', 'ri', 1, NULL, 'RI006', 3, '005'),
('107 DAR', 'VIP A 107 DARMAWAN', NULL, 'Baik', 'LANTAI 1', '118', '107', 'ri', 1, NULL, 'RI017', 3, '004'),
('201 DAR', 'VIP A 201 DARMAWAN', NULL, 'Baik', 'LANTAI 2', '118', '201', 'ri', 1, NULL, 'RI018', 3, '004'),
('201 KTK', 'SVIP A 201 KARTIKA', NULL, 'Baik', 'LANTAI 2', '120', '201', 'ri', 1, NULL, 'RI046', 2, '005'),
('201 PIS', 'VIP B 201 IMAN SUJUDI', NULL, 'Baik', 'LANTAI 2', '124', '201', 'ri', 1, NULL, 'RI014', 4, '004'),
('202 KTK', 'SVIP 202 KARTIKA', NULL, 'Baik', 'LANTAI 2', '102', '202', 'ri', 1, NULL, 'RI001', 2, '005'),
('202 PIS', 'VIP B 202 IMAN SUJUDI', NULL, 'Baik', 'LANTAI 2', '124', '202', 'ri', 1, NULL, 'RI014', 4, '004'),
('202A', 'KELAS I A 202 A DARMAWAN', NULL, 'Baik', 'LANTAI 2', '108', '202', 'ri', 1, NULL, 'RI009', 3, '001'),
('202B', 'KELAS I A 202 B DARMAWAN', NULL, 'Baik', 'LANTAI 2', '108', '202', 'ri', 1, NULL, 'RI009', 3, '001'),
('203 DAR', 'VIP C 203 DARMAWAN', NULL, 'Baik', 'LANTAI 2', '119', '203', 'ri', 1, NULL, 'RI019', 3, '004'),
('203 KTK', 'SVIP 203 KARTIKA', NULL, 'Baik', 'LANTAI 2', '102', '203', 'ri', 1, NULL, 'RI001', 2, '005'),
('203 PIS', 'VIP B 203 IMAN SUJUDI', NULL, 'Baik', 'LANTAI 2', '124', '203', 'ri', 1, NULL, 'RI014', 4, '004'),
('204 KTK', 'SVIP 204 KARTIKA', NULL, 'Baik', 'LANTAI 2', '102', '204', 'ri', 1, NULL, 'RI001', 2, '005'),
('204 PIS', 'VIP A 204 IMAN SUJUDI', NULL, 'Baik', 'LANTAI 2', '123', '204', 'ri', 1, NULL, 'RI013', 4, '004'),
('204A', 'KELAS II A 204 A DARMAWAN', NULL, 'Baik', 'LANTAI 2', '109', '204', 'ri', 1, NULL, 'RI010', 3, '002'),
('204B', 'KELAS II A 204 B DARMAWAN', NULL, 'Baik', 'LANTAI 2', '109', '204', 'ri', 1, NULL, 'RI010', 3, '002'),
('204C', 'KELAS II A 204 C DARMAWAN', NULL, 'Baik', 'LANTAI 2', '109', '204', 'ri', 1, NULL, 'RI010', 3, '002'),
('205 KTK', 'SVIP 205 KARTIKA', NULL, 'Baik', 'LANTAI 2', '102', '205', 'ri', 1, NULL, 'RI001', 2, '005'),
('206 A', 'VIP 206 IMAN SUJUDI', NULL, 'Baik', 'LANTAI 2', '111', '206', 'ri', 1, NULL, 'RI015', 4, '033'),
('206 KTK', 'SVIP 206 KARTIKA', NULL, 'Baik', 'LANTAI 2', '102', '206', 'ri', 1, NULL, 'RI001', 2, '005'),
('206 PIS', 'VIP 206 IMAN SUJUDI', NULL, 'Baik', 'LANTAI 2', '111', '206', 'ri', 0, NULL, 'RI007', 2, '004'),
('206A', 'KELAS I A 206 A DARMAWAN', NULL, 'Baik', 'LANTAI 2', '108', '206', 'ri', 1, NULL, 'RI010', 3, '001'),
('206B', 'KELAS I A 206 B DARMAWAN', NULL, 'Baik', 'LANTAI 2', '108', '206', 'ri', 1, NULL, 'RI010', 3, '001'),
('206C', 'KELAS I A 206 C DARMAWAN', NULL, 'Baik', 'LANTAI 2', '108', '206', 'ri', 0, NULL, 'RI010', 3, '001'),
('207 A', 'KELAS I A 207 IMAN SUJUDI', NULL, 'Baik', 'LANTAI 2', '112', '207', 'ri', 1, NULL, 'RI015', 4, '001'),
('207 KTK', 'SVIP 207 KARTIKA', NULL, 'Baik', 'LANTAI 2', '102', '207', 'ri', 1, NULL, 'RI001', 2, '005'),
('207 PIS', 'VIP 207 IMAN SUJUDI', NULL, 'Baik', 'LANTAI 2', '111', '207', 'ri', 0, NULL, 'RI007', 2, '004'),
('207A', 'KELAS II A 207 A DARMAWAN', NULL, 'Baik', 'LANTAI 2', '109', '207', 'ri', 1, NULL, 'RI010', 3, '002'),
('207B', 'KELAS II A 207 B DARMAWAN', NULL, 'Baik', 'LANTAI 2', '109', '207', 'ri', 1, NULL, 'RI010', 3, '002'),
('207C', 'KELAS II A 207 C DARMAWAN', NULL, 'Baik', 'LANTAI 2', '109', '207', 'ri', 1, NULL, 'RI010', 3, '002'),
('208 A', 'KELAS I A 208 IMAN SUJUDI', NULL, 'Baik', 'LANTAI 2', '112', '208', 'ri', 1, NULL, 'RI015', 4, '001'),
('208 KTK', 'SVIP 208 KARTIKA', NULL, 'Baik', 'LANTAI 2', '102', '208', 'ri', 1, NULL, 'RI001', 2, '005'),
('208 PIS', 'VIP 208 IMAN SUJUDI', NULL, 'Baik', 'LANTAI 2', '111', '208', 'ri', 0, NULL, 'RI007', 2, '004'),
('208A', 'KELAS I A 208 A DARMAWAN', NULL, 'Baik', 'LANTAI 2', '108', '208', 'ri', 1, NULL, 'RI009', 3, '001'),
('208B', 'KELAS I A 208 B DARMAWAN', NULL, 'Baik', 'LANTAI 2', '108', '208', 'ri', 1, NULL, 'RI009', 3, '001'),
('209 A', 'KELAS I A 209 A IMAN SUJUDI', NULL, 'Baik', 'LANTAI 2', '112', '209', 'ri', 1, NULL, 'RI015', 4, '001'),
('209 B', 'KELAS I A 209 B IMAN SUJUDI', NULL, 'Baik', 'LANTAI 2', '112', '209', 'ri', 1, NULL, 'RI015', 4, '001'),
('209 KTK', 'SVIP 209 KARTIKA', NULL, 'Baik', 'LANTAI 2', '102', '209', 'ri', 1, NULL, 'RI001', 2, '005'),
('209A', 'KELAS I A 209 A DARMAWAN', NULL, 'Baik', 'LANTAI 2', '108', '209', 'ri', 1, NULL, 'RI009', 3, '001'),
('209B', 'KELAS I A 209 B DARMAWAN', NULL, 'Baik', 'LANTAI 2', '108', '209', 'ri', 1, NULL, 'RI009', 3, '001'),
('210 A', 'KELAS I A 210 A IMAN SUJUDI', NULL, 'Baik', 'LANTAI 2', '112', '210', 'ri', 1, NULL, 'RI015', 4, '001'),
('210 B', 'KELAS I A 210 B IMAN SUJUDI', NULL, 'Baik', 'LANTAI 2', '112', '210', 'ri', 1, NULL, 'RI015', 4, '001'),
('210 KTK', 'SVIP A 210 KARTIKA', NULL, 'Baik', 'LANTAI 2', '120', '210', 'ri', 1, NULL, 'RI046', 2, '005'),
('210A', 'KELAS II A 210 A DARMAWAN', NULL, 'Baik', 'LANTAI 2', '109', '210', 'ri', 1, NULL, 'RI010', 3, '002'),
('210B', 'KELAS II A 210 B DARMAWAN', NULL, 'Baik', 'LANTAI 2', '109', '210', 'ri', 1, NULL, 'RI010', 3, '002'),
('210C', 'KELAS II A 210 C DARMAWAN', NULL, 'Baik', 'LANTAI 2', '109', '210', 'ri', 1, NULL, 'RI010', 3, '002'),
('211 A', 'KELAS I A 211 A IMAN SUJUDI', NULL, 'Baik', 'LANTAI 2', '112', '211', 'ri', 1, NULL, 'RI015', 4, '001'),
('211 B', 'KELAS I A 211 B IMAN SUJUDI', NULL, 'Baik', 'LANTAI 2', '112', '211', 'ri', 1, NULL, 'RI015', 4, '001'),
('211 DAR', 'VIP C 211 DARMAWAN', NULL, 'Baik', 'LANTAI 2', '119', '211', 'ri', 1, NULL, 'RI019', 3, '004'),
('212A', 'KELAS II A 212 A DARMAWAN', NULL, 'Baik', 'LANTAI 2', '109', '212', 'ri', 1, NULL, 'RI010', 3, '002'),
('212B', 'KELAS II A 212 B DARMAWAN', NULL, 'Baik', 'LANTAI 2', '109', '212', 'ri', 1, NULL, 'RI010', 3, '002'),
('212C', 'KELAS II A 212 C DARMAWAN', NULL, 'Baik', 'LANTAI 2', '109', '212', 'ri', 1, NULL, 'RI010', 3, '002'),
('214A', 'KELAS I A 214 A DARMAWAN', NULL, 'Baik', 'LANTAI 2', '108', '214', 'ri', 1, NULL, 'RI009', 3, '001'),
('214B', 'KELAS I A 214 B DARMAWAN', NULL, 'Baik', 'LANTAI 2', '108', '214', 'ri', 1, NULL, 'RI009', 3, '001'),
('215 DAR', 'VIP A 215 DARMAWAN', NULL, 'Baik', 'LANTAI 2', '118', '215', 'ri', 1, NULL, 'RI018', 3, '004'),
('301 KTK', 'VIP 301 KARTIKA', NULL, 'Baik', 'LANTAI 3', '103', '301', 'ri', 1, NULL, 'RI002', 2, '004'),
('302 KTK', 'VIP 302 KARTIKA', NULL, 'Baik', 'LANTAI 3', '103', '302', 'ri', 1, NULL, 'RI002', 2, '004'),
('303 KTK', 'VIP 303 KARTIKA', NULL, 'Baik', 'LANTAI 3', '103', '303', 'ri', 1, NULL, 'RI002', 2, '004'),
('304 KTK', 'VIP 304 KARTIKA', NULL, 'Baik', 'LANTAI 3', '103', '304', 'ri', 1, NULL, 'RI002', 2, '004'),
('305 KTK', 'VIP 305 KARTIKA', NULL, 'Baik', 'LANTAI 3', '103', '305', 'ri', 1, NULL, 'RI002', 2, '004'),
('306 KTK', 'VIP 306 KARTIKA', NULL, 'Baik', 'LANTAI 3', '103', '306', 'ri', 1, NULL, 'RI002', 2, '004'),
('307 KTK', 'VIP 307 KARTIKA', NULL, 'Baik', 'LANTAI 3', '103', '307', 'ri', 1, NULL, 'RI002', 2, '004'),
('308 KTK', 'VIP 308 KARTIKA', NULL, 'Baik', 'LANTAI 3', '103', '308', 'ri', 1, NULL, 'RI002', 2, '004'),
('309 KTK', 'VIP 309 KARTIKA', NULL, 'Baik', 'LANTAI 3', '103', '309', 'ri', 1, NULL, 'RI002', 2, '004'),
('310 KTK', 'VIP 310 KARTIKA', NULL, 'Baik', 'LANTAI 3', '103', '310', 'ri', 1, NULL, 'RI002', 2, '004'),
('311 KTK', 'VIP 311 KARTIKA', NULL, 'Baik', 'LANTAI 3', '103', '311', 'ri', 1, NULL, 'RI002', 2, '004'),
('312 KTK', 'VIP 312 KARTIKA', NULL, 'Baik', 'LANTAI 3', '103', '312', 'ri', 1, NULL, 'RI002', 2, '004'),
('313 KTK', 'VIP 313 KARTIKA', NULL, 'Baik', 'LANTAI 3', '103', '313', 'ri', 1, NULL, 'RI002', 2, '004'),
('314 KTK', 'VIP 314 KARTIKA', NULL, 'Baik', 'LANTAI 3', '103', '314', 'ri', 1, NULL, 'RI002', 2, '004'),
('315 KTK', 'VIP 315 KARTIKA', NULL, 'Baik', 'LANTAI 3', '103', '315', 'ri', 1, NULL, 'RI002', 2, '004'),
('501 KTK', 'SVIP 501 KARTIKA', NULL, 'Baik', 'LANTAI 5', '102', '501', 'ri', 1, NULL, 'RI020', 2, '005'),
('502 KTK', 'SVIP 502 KARTIKA', NULL, 'Baik', 'LANTAI 5', '102', '502', 'ri', 1, NULL, 'RI020', 2, '005'),
('503 KTK', 'SVIP 503 KARTIKA', NULL, 'Baik', 'LANTAI 5', '102', '503', 'ri', 1, NULL, 'RI020', 2, '005'),
('504 KTK', 'SVIP 504 KARTIKA', NULL, 'Baik', 'LANTAI 5', '102', '504', 'ri', 1, NULL, 'RI020', 2, '005'),
('505 KTK', 'SVIP 505 KARTIKA', NULL, 'Baik', 'LANTAI 5', '102', '505', 'ri', 1, NULL, 'RI020', 2, '005'),
('506 KTK', 'SVIP 506 KARTIKA', NULL, 'Baik', 'LANTAI 5', '102', '506', 'ri', 1, NULL, 'RI020', 2, '005'),
('507 KTK', 'SVIP 507 KARTIKA', NULL, 'Baik', 'LANTAI 5', '102', '507', 'ri', 1, NULL, 'RI020', 2, '005'),
('508 KTK', 'SVIP 508 KARTIKA', NULL, 'Baik', 'LANTAI 5', '102', '508', 'ri', 1, NULL, 'RI020', 2, '005'),
('509 KTK', 'SVIP 509 KARTIKA', NULL, 'Baik', 'LANTAI 5', '102', '509', 'ri', 1, NULL, 'RI020', 2, '005'),
('510 KTK', 'SVIP 510 KARTIKA', NULL, 'Baik', 'LANTAI 5', '102', '510', 'ri', 1, NULL, 'RI020', 2, '005'),
('511 KTK', 'SVIP 511 KARTIKA', NULL, 'Baik', 'LANTAI 5', '102', '511', 'ri', 1, NULL, 'RI020', 2, '005'),
('512 KTK', 'SVIP 512 KARTIKA', NULL, 'Baik', 'LANTAI 5', '102', '512', 'ri', 1, NULL, 'RI020', 2, '005'),
('513 KTK', 'SVIP 513 KARTIKA', NULL, 'Baik', 'LANTAI 5', '102', '513', 'ri', 1, NULL, 'RI020', 2, '005'),
('514 KTK', 'SVIP 514 KARTIKA', NULL, 'Baik', 'LANTAI 5', '102', '514', 'ri', 1, NULL, 'RI020', 2, '005'),
('515 KTK', 'SVIP 515 KARTIKA', NULL, 'Baik', 'LANTAI 5', '102', '515', 'ri', 1, NULL, 'RI020', 2, '005'),
('516 A', 'RUANG KEMOTERAPI 516 A KARTIKA', NULL, 'Baik', 'LANTAI 5', '122', '516', 'ri', 1, NULL, 'RI047', 2, NULL),
('516 B', 'RUANG KEMOTERAPI 516 B KARTIKA', NULL, 'Baik', 'LANTAI 5', '122', '516', 'ri', 1, NULL, 'RI047', 2, NULL),
('516 C', 'RUANG KEMOTERAPI 516 C KARTIKA', NULL, 'Baik', 'LANTAI 5', '122', '516', 'ri', 1, NULL, 'RI047', 2, NULL),
('516 D', 'RUANG KEMOTERAPI 516 D KARTIKA', NULL, 'Baik', 'LANTAI 5', '122', '516', 'ri', 1, NULL, 'RI047', 2, NULL),
('601 KTK', 'SVIP 601 KARTIKA', NULL, 'Baik', 'LANTAI 6', '102', '601', 'ri', 1, NULL, 'RI011', 2, '005'),
('602 KTK', 'SVIP 602 KARTIKA', NULL, 'Baik', 'LANTAI 6', '102', '602', 'ri', 1, NULL, 'RI011', 2, '005'),
('603 KTK', 'SVIP 603 KARTIKA', NULL, 'Baik', 'LANTAI 6', '102', '603', 'ri', 1, NULL, 'RI011', 2, '005'),
('604 KTK', 'SVIP 604 KARTIKA', NULL, 'Baik', 'LANTAI 6', '102', '604', 'ri', 1, NULL, 'RI011', 2, '005'),
('605 KTK', 'SVIP 605 KARTIKA', NULL, 'Baik', 'LANTAI 6', '102', '605', 'ri', 1, NULL, 'RI011', 2, '005'),
('606 KTK', 'SVIP 606 KARTIKA', NULL, 'Baik', 'LANTAI 6', '102', '606', 'ri', 1, NULL, 'RI011', 2, '005'),
('607 KTK', 'SVIP 607 KARTIKA', NULL, 'Baik', 'LANTAI 6', '102', '607', 'ri', 1, NULL, 'RI011', 2, '005'),
('608 KTK', 'SVIP 608 KARTIKA', NULL, 'Baik', 'LANTAI 6', '102', '608', 'ri', 1, NULL, 'RI011', 2, '005'),
('609 KTK', 'SVIP 609 KARTIKA', NULL, 'Baik', 'LANTAI 6', '102', '609', 'ri', 1, NULL, 'RI011', 2, '005'),
('610 KTK', 'VIP 610 KARTIKA', NULL, 'Baik', 'LANTAI 6', '103', '610', 'ri', 1, NULL, 'RI051', 2, '004'),
('611 A', 'VIP B 611 KARTIKA', NULL, 'Baik', 'LANTAI 6', '121', '611', 'ri', 1, NULL, 'RI050', 2, '004'),
('611 B', 'VIP B 611 B KARTIKA', NULL, 'Baik', 'LANTAI 6', '121', '611', 'ri', 1, NULL, 'RI050', 2, '004'),
('612 A', 'VIP B 612 KARTIKA', NULL, 'Baik', 'LANTAI 6', '121', '612', 'ri', 1, NULL, 'RI050', 2, '004'),
('612 B', 'VIP B 612 B KARTIKA', NULL, 'Baik', 'LANTAI 6', '121', '612', 'ri', 1, NULL, 'RI050', 2, '004'),
('613 A', 'VIP B 613 KARTIKA', NULL, 'Baik', 'LANTAI 6', '121', '613', 'ri', 1, NULL, 'RI050', 2, '004'),
('613 B', 'VIP B 613 B KARTIKA', NULL, 'Baik', 'LANTAI 6', '121', '613', 'ri', 1, NULL, 'RI050', 2, '004'),
('614 A', 'VIP B 614 KARTIKA', NULL, 'Baik', 'LANTAI 6', '121', '614', 'ri', 1, NULL, 'RI050', 2, '004'),
('614 B', 'VIP B 614 B KARTIKA', NULL, 'Baik', 'LANTAI 6', '121', '614', 'ri', 1, NULL, 'RI050', 2, '004'),
('615 A', 'VIP B 615 KARTIKA', NULL, 'Baik', 'LANTAI 6', '121', '615', 'ri', 1, NULL, 'RI050', 2, '004'),
('615 B', 'VIP B 615 B KARTIKA', NULL, 'Baik', 'LANTAI 6', '121', '615', 'ri', 1, NULL, 'RI050', 2, '004'),
('ABLASI.1', 'KAMAR ABLASI - 1', NULL, 'Baik', NULL, '001', NULL, 'ri', 0, NULL, '1001', 1, NULL),
('ABLASI.2', 'KAMAR ABLASI - 2', NULL, 'Baik', NULL, '001', NULL, 'ri', 0, NULL, '1001', 1, NULL),
('ABLASI.3', 'KAMAR ABLASI - 3', NULL, 'Baik', NULL, '001', NULL, 'ri', 0, NULL, '1001', 1, NULL),
('ABLASI.4', 'KAMAR ABLASI - 4', NULL, 'Baik', NULL, '001', NULL, 'ri', 0, NULL, '1001', 1, NULL),
('AMN.A.01', 'PAV. AMINO ANAK- 01', '125000', 'Baik', 'LANTAI 1', '002', '105', 'ri', 1, '15', '1017', 1, '001'),
('AMN.A.02', 'PAV. AMINO ANAK- 02', '125000', 'Baik', 'LANTAI 1', '002', '105', 'ri', 1, '15', '1017', 1, '001'),
('AMN.L.01', 'PAV. AMINO LAKI-LAKI - 01', '125000', 'Baik', 'LANTAI 1', '002', '106', 'ri', 1, '13', '1015', 1, '001'),
('AMN.L.02', 'PAV. AMINO LAKI-LAKI - 02', '125000', 'Baik', 'LANTAI 1', '002', '107', 'ri', 1, '13', '1015', 1, '001'),
('AMN.L.03', 'PAV. AMINO LAKI-LAKI - 03', '125000', 'Baik', 'LANTAI 1', '002', '109', 'ri', 1, '13', '1015', 1, '002'),
('AMN.L.04', 'PAV. AMINO LAKI-LAKI - 04', '125000', 'Baik', 'LANTAI 1', '002', '109', 'ri', 1, '13', '1015', 1, '002'),
('AMN.L.05', 'PAV. AMINO LAKI-LAKI - 05', '125000', 'Baik', 'LANTAI 1', '002', '109', 'ri', 1, '13', '1015', 1, '002'),
('AMN.L.06', 'PAV. AMINO LAKI-LAKI - 06', '125000', 'Baik', 'LANTAI 1', '002', '109', 'ri', 1, '13', '1015', 1, '002'),
('AMN.L.07', 'PAV. AMINO LAKI-LAKI - 07', '125000', 'Baik', 'LANTAI 1', '002', NULL, 'ri', 0, '13', '1015', 1, '003'),
('AMN.L.08', 'PAV. AMINO LAKI-LAKI - 08', '125000', 'Baik', 'LANTAI 1', '002', NULL, 'ri', 0, '13', '1015', 1, '003'),
('AMN.L.09', 'PAV. AMINO LAKI-LAKI - 09', '125000', 'Baik', 'LANTAI 1', '002', '110', 'ri', 1, '13', '1015', 1, '003'),
('AMN.L.10', 'PAV. AMINO LAKI-LAKI - 10', '125000', 'Baik', 'LANTAI 1', '002', '110', 'ri', 1, '13', '1015', 1, '003'),
('AMN.L.11', 'PAV. AMINO LAKI-LAKI - 11', '125000', 'Baik', 'LANTAI 1', '002', '110', 'ri', 1, '13', '1015', 1, '003'),
('AMN.L.12', 'PAV. AMINO LAKI-LAKI - 12', '125000', 'Baik', 'LANTAI 1', '002', '110', 'ri', 1, '13', '1015', 1, '003'),
('AMN.P.01', 'PAV. AMINO PEREMPUAN - 01', '125000', 'Baik', 'LANTAI 1', '002', '101', 'ri', 1, '14', '1016', 1, '001'),
('AMN.P.02', 'PAV. AMINO PEREMPUAN - 02', '125000', 'Baik', 'LANTAI 1', '002', '102', 'ri', 1, '14', '1016', 1, '002'),
('AMN.P.03', 'PAV. AMINO PEREMPUAN - 03', '125000', 'Baik', 'LANTAI 1', '002', '103', 'ri', 1, '14', '1016', 1, '002'),
('AMN.P.04', 'PAV. AMINO PEREMPUAN - 04', '125000', 'Baik', 'LANTAI 1', '002', '104', 'ri', 1, '14', '1016', 1, '003'),
('AMN.P.05', 'PAV. AMINO PEREMPUAN - 05', '125000', 'Baik', 'LANTAI 1', '002', '104', 'ri', 1, '14', '1016', 1, '003'),
('AMN.P.06', 'PAV. AMINO PEREMPUAN - 06', '125000', 'Baik', 'LANTAI 1', '002', '104', 'ri', 1, '14', '1016', 1, '003'),
('AMN.P.07', 'PAV. AMINO PEREMPUAN - 07', '125000', 'Baik', 'LANTAI 1', '002', '104', 'ri', 1, '14', '1016', 1, '003'),
('AMN.P.08', 'PAV. AMINO SEKLUSI', '125000', 'Baik', 'LANTAI 1', '002', NULL, 'ri', 0, '14', '1016', 1, NULL),
('BAYI.B.01', 'BAYI BASINET -01', '75000', 'Baik', NULL, '003', NULL, 'ri', 0, '22', '1024', 1, NULL),
('BAYI.B.02', 'BAYI BASINET -02', '75000', 'Baik', NULL, '003', NULL, 'ri', 0, '22', '1024', 1, NULL),
('BAYI.C.01', 'BAYI COUVIS -01', '150000', 'Baik', 'LANTAI 1', '003', 'TRANS', 'ri', 1, '22', '1024', 1, NULL),
('BAYI.C.02', 'BAYI COUVIS -02', '150000', 'Baik', 'LANTAI 1', '003', 'TRANS', 'ri', 1, '22', '1024', 1, NULL),
('BAYI.C.03', 'BAYI COUVIS -03', '150000', 'Baik', 'LANTAI 1', '003', 'INFEK', 'ri', 1, '22', '1024', 1, NULL),
('BAYI.C.04', 'BAYI COUVIS -04', '150000', 'Baik', 'LANTAI 1', '003', 'INFEK', 'ri', 1, '22', '1024', 1, NULL),
('BAYI.C.05', 'BAYI COUVIS -05', '150000', 'Baik', 'LANTAI 1', '003', 'INFEK', 'ri', 1, '22', '1024', 1, NULL),
('BAYI.HCU.01', 'HCU -01', NULL, 'Baik', 'LANTAI 1', '011', 'HCU', 'ri', 1, '22', '1024', 1, '012'),
('BAYI.HCU.02', 'HCU -02', NULL, 'Baik', 'LANTAI 1', '011', 'HCU', 'ri', 1, '22', '1024', 1, '012'),
('BAYI.HCU.03', 'HCU -03', NULL, 'Baik', 'LANTAI 1', '011', 'HCU', 'ri', 1, '22', '1024', 1, '012'),
('BAYI.HCU.04', 'HCU -04', NULL, 'Baik', 'LANTAI 1', '011', 'HCU', 'ri', 1, '22', '1024', 1, '012'),
('BAYI.I.01', 'BAYI ISOLET -01', '200000', 'Baik', 'LANTAI 1', '003', 'TRANS', 'ri', 1, '22', '1024', 1, NULL),
('BAYI.I.02', 'BAYI ISOLET -02', '200000', 'Baik', 'LANTAI 1', '003', 'TRANS', 'ri', 1, '22', '1024', 1, NULL),
('BAYI.I.03', 'BAYI ISOLET -03', '200000', 'Baik', 'LANTAI 1', '003', 'TRANS', 'ri', 1, '22', '1024', 1, NULL),
('BAYI.I.04', 'BAYI ISOLET -04', '200000', 'Baik', 'LANTAI 1', '003', 'TRANS', 'ri', 1, '22', '1024', 1, NULL),
('BAYI.I.05', 'BAYI ISOLET -05', '200000', 'Baik', 'LANTAI 1', '003', 'INFEK', 'ri', 1, '22', '1024', 1, NULL),
('BAYI.I.06', 'BAYI ISOLET -06', '200000', 'Baik', 'LANTAI 1', '003', 'INFEK', 'ri', 1, '22', '1024', 1, NULL),
('BAYI.I.07', 'BAYI ISOLET -07', '200000', 'Baik', 'LANTAI 1', '003', 'INFEK', 'ri', 1, '22', '1024', 1, NULL),
('BAYI.I.08', 'BAYI ISOLET -08', '200000', 'Baik', 'LANTAI 1', '003', 'INFEK', 'ri', 1, '22', '1024', 1, NULL),
('BAYI.I.09', 'BAYI ISOLET -09', '200000', 'Baik', 'LANTAI 1', '003', 'INFEK', 'ri', 1, '22', '1024', 1, NULL),
('BAYI.I.10', 'BAYI ISOLET -10', '200000', 'Baik', NULL, '003', NULL, 'ri', 0, '22', '1024', 1, NULL),
('BAYI.ICU.01', 'NICU-01', '600000', 'Baik', 'LANTAI 1', '003', 'NICU', 'ri', 1, '22', '1024', 1, '010'),
('BAYI.ICU.02', 'NICU-02', '600000', 'Baik', 'LANTAI 1', '003', 'NICU', 'ri', 1, '22', '1024', 1, '010'),
('BAYI.ICU.03', 'NICU-03', '600000', 'Baik', 'LANTAI 1', '003', 'NICU', 'ri', 1, '22', '1024', 1, '010'),
('BAYI.ICU.04', 'NICU-04', '600000', 'Baik', 'LANTAI 1', '003', 'NICU', 'ri', 1, '22', '1024', 1, '010'),
('BAYI.RG01', 'BAYI WAT GABUNG-01', '75000', 'Baik', 'LANTAI 1', '010', NULL, 'ri', 1, '22', '1024', 1, NULL),
('BAYI.RG02', 'BAYI WAT GABUNG-02', '75000', 'Baik', 'LANTAI 1', '010', NULL, 'ri', 1, '22', '1024', 1, NULL),
('BAYI.RG03', 'BAYI WAT GABUNG-03', '75000', 'Baik', 'LANTAI 1', '010', NULL, 'ri', 1, '22', '1024', 1, NULL),
('BAYI.RG04', 'BAYI WAT GABUNG-04', '75000', 'Baik', 'LANTAI 1', '010', NULL, 'ri', 1, '22', '1024', 1, NULL),
('BAYI.RG05', 'BAYI WAT GABUNG-05', '75000', 'Baik', 'LANTAI 1', '010', NULL, 'ri', 1, '22', '1024', 1, NULL),
('BAYI.RG06', 'BAYI WAT GABUNG-06', '75000', 'Baik', 'LANTAI 1', '010', NULL, 'ri', 1, '22', '1024', 1, NULL),
('BAYI.RG07', 'BAYI WAT GABUNG-07', '75000', 'Baik', NULL, '010', NULL, 'ri', 0, '22', '1024', 1, NULL),
('BAYI.RG08', 'BAYI WAT GABUNG-08', '75000', 'Baik', NULL, '010', NULL, 'ri', 0, '22', '1024', 1, NULL),
('BAYI.RG09', 'BAYI WAT GABUNG-09', '75000', 'Baik', NULL, '010', NULL, 'ri', 0, '22', '1024', 1, NULL),
('BD.3.011', 'L. 3 BEDAH /301', '475000', 'Baik', 'LANTAI 3', '004', '301', 'ri', 1, '7', '1009', 1, '004'),
('BD.3.021', 'L. 3 BEDAH /302', '475000', 'Baik', 'LANTAI 3', '004', '302', 'ri', 1, '7', '1009', 1, '004'),
('BD.3.031', 'L. 3 BEDAH /303', '475000', 'Baik', 'LANTAI 3', '004', '303', 'ri', 1, '7', '1009', 1, '004'),
('BD.3.041', 'L. 3 BEDAH /304', '475000', 'Baik', 'LANTAI 3', '004', '304', 'ri', 1, '7', '1009', 1, '005'),
('BD.3.061', 'L. 3 BEDAH /306', '475000', 'Baik', 'LANTAI 3', '004', '306', 'ri', 1, '7', '1009', 1, '004'),
('BD.3.071', 'L. 3 BEDAH /307', '475000', 'Baik', 'LANTAI 3', '004', '307', 'ri', 1, '7', '1009', 1, '004'),
('BD.3.081', 'L. 3 BEDAH /308', '475000', 'Baik', 'LANTAI 3', '004', '308', 'ri', 1, '7', '1009', 1, '004'),
('BD.3.X99', 'L. 3 BEDAH /X99', '475000', 'Baik', 'LANTAI 3', '004', NULL, 'ri', 0, '7', '1009', 1, NULL),
('BD.4.011', 'L. 4 BEDAH /401 - 1', '300000', 'Rusak', 'LANTAI 4', '004', '401', 'ri', 1, '8', '1010', 1, '001'),
('BD.4.012', 'L. 4 BEDAH /401 - 2', '300000', 'Rusak', 'LANTAI 4', '004', '', 'ri', 0, '8', '1010', 1, '001'),
('BD.4.021', 'L. 4 BEDAH /402 - 1', '300000', 'Rusak', 'LANTAI 4', '004', '402', 'ri', 1, '8', '1010', 1, '001'),
('BD.4.022', 'L. 4 BEDAH /402 - 2', '300000', 'Rusak', 'LANTAI 4', '004', '402', 'ri', 1, '8', '1010', 1, '001'),
('BD.4.031', 'L. 4 BEDAH /403 -1', '300000', 'Baik', 'LANTAI 4', '004', '403', 'ri', 1, '8', '1010', 1, '001'),
('BD.4.032', 'L. 4 BEDAH /403 -2', '300000', 'Baik', 'LANTAI 4', '004', '403', 'ri', 1, '8', '1010', 1, '001'),
('BD.4.041', 'L. 4 BEDAH /404 - 1', '300000', 'Baik', 'LANTAI 4', '004', '404', 'ri', 1, '8', '1010', 1, '001'),
('BD.4.042', 'L. 4 BEDAH /404 - 2', '300000', 'Baik', 'LANTAI 4', '004', '404', 'ri', 1, '8', '1010', 1, '001'),
('BD.4.051', 'L. 4 BEDAH /405 -1', '300000', 'Baik', 'LANTAI 4', '004', '405', 'ri', 1, '8', '1010', 1, '001'),
('BD.4.052', 'L. 4 BEDAH /405 - 2', '300000', 'Baik', 'LANTAI 4', '004', '405', 'ri', 1, '8', '1010', 1, '001'),
('BD.4.061', 'L. 4 BEDAH /406 -1', '300000', 'Baik', 'LANTAI 4', '004', '406', 'ri', 1, '8', '1010', 1, '001'),
('BD.4.062', 'L. 4 BEDAH /406 - 2', '300000', 'Baik', 'LANTAI 4', '004', '406', 'ri', 1, '8', '1010', 1, '001'),
('BD.4.071', 'L. 4 BEDAH /407 -1', '300000', 'Baik', 'LANTAI 4', '004', '407', 'ri', 1, '8', '1010', 1, '001'),
('BD.4.072', 'L. 4 BEDAH /407 - 2', '300000', 'Baik', 'LANTAI 4', '004', '407', 'ri', 1, '8', '1010', 1, '001'),
('BD.4.081', 'L. 4 BEDAH /408 - 1', '300000', 'Baik', 'LANTAI 4', '004', '408', 'ri', 1, '8', '1010', 1, '001'),
('BD.4.082', 'L. 4 BEDAH /408 - 2', '300000', 'Baik', 'LANTAI 4', '004', '408', 'ri', 1, '8', '1010', 1, '001'),
('BD.4.091', 'L. 4 BEDAH /409 - 1', '300000', 'Baik', 'LANTAI 4', '004', '409', 'ri', 1, '8', '1010', 1, '004'),
('BD.4.092', 'L. 4 BEDAH /409 - 2', '300000', 'Baik', 'LANTAI 4', '004', '409', 'ri', 1, '8', '1010', 1, '004'),
('BD.4.101', 'L. 4 BEDAH /410 - 1', '300000', 'Baik', 'LANTAI 4', '004', '410', 'ri', 1, '8', '1010', 1, '004'),
('BD.4.102', 'L. 4 BEDAH /410 - 2', '300000', 'Baik', 'LANTAI 4', '004', '410', 'ri', 1, '8', '1010', 1, '004'),
('BD.4.111', 'L. 4 BEDAH /411 - 1', '300000', 'Baik', 'LANTAI 4', '004', '411', 'ri', 1, '8', '1010', 1, '004'),
('BD.4.112', 'L. 4 BEDAH /411 - 2', '300000', 'Baik', 'LANTAI 4', '004', '411', 'ri', 1, '8', '1010', 1, '004'),
('BD.4.121', 'L. 4 BEDAH /412.1', '300000', 'Baik', 'LANTAI 4', '004', '412', 'ri', 1, '8', '1010', 1, '004'),
('BD.4.122', 'L. 4 BEDAH /412.2', '300000', 'Baik', 'LANTAI 4', '004', '412', 'ri', 1, '8', '1010', 1, '004'),
('BD.4.141', 'L. 4 BEDAH /414.1', '300000', 'Baik', 'LANTAI 4', '004', '414', 'ri', 1, '8', '1010', 1, '001'),
('BD.4.142', 'L. 4 BEDAH /414.2', '300000', 'Baik', 'LANTAI 4', '004', '414', 'ri', 1, '8', '1010', 1, '001'),
('BD.4.151', 'L. 4 BEDAH /415.1', '300000', 'Baik', 'LANTAI 4', '004', '415', 'ri', 1, '8', '1010', 1, '001'),
('BD.4.152', 'L. 4 BEDAH /415.2', '300000', 'Baik', 'LANTAI 4', '004', '415', 'ri', 1, '8', '1010', 1, '001'),
('BD.4.IS1', 'L. 4 BEDAH /RPK-1', '155000', 'Baik', 'LANTAI 4', '004', 'RPK', 'ri', 1, '8', '1010', 1, '006'),
('BD.4.IS2', 'L. 4 BEDAH /RPK-2', '155000', 'Baik', 'LANTAI 4', '004', 'RPK', 'ri', 1, '8', '1010', 1, '006'),
('BD.4.IS3', 'L. 4 BEDAH /RPK-3', '155000', 'Baik', 'LANTAI 4', '004', 'RPK', 'ri', 1, '8', '1010', 1, '006'),
('BD.4.IS4', 'L. 4 BEDAH /RPK-4', '155000', 'Baik', 'LANTAI 4', '004', 'RPK', 'ri', 1, '8', '1010', 1, '006'),
('BD.5.011', 'L. 5 BEDAH /501-1', '175000', 'Baik', 'LANTAI 5', '004', '501', 'ri', 1, '8', '1011', 1, '001'),
('BD.5.012', 'L. 5 BEDAH /501-2', '175000', 'Baik', 'LANTAI 5', '004', '501', 'ri', 1, '9', '1011', 1, '001'),
('BD.5.021', 'L. 5 BEDAH /502-1', '175000', 'Rusak', 'LANTAI 5', '004', '502', 'ri', 1, '9', '1011', 1, '001'),
('BD.5.022', 'L. 5 BEDAH /502-2', '175000', 'Rusak', 'LANTAI 5', '004', '502', 'ri', 1, '9', '1011', 1, '001'),
('BD.5.023', 'L. 5 BEDAH /502-3', '175000', 'Rusak', 'LANTAI 5', '004', '502', 'ri', 1, '9', '1011', 1, '001'),
('BD.5.024', 'L. 5 BEDAH /502-4', '175000', 'Rusak', 'LANTAI 5', '004', '502', 'ri', 1, '9', '1011', 1, '001'),
('BD.5.031', 'L. 5 BEDAH /503-1', '175000', 'Rusak', 'LANTAI 5', '004', '503', 'ri', 1, '9', '1011', 1, '001'),
('BD.5.032', 'L. 5 BEDAH /503-2', '175000', 'Rusak', 'LANTAI 5', '004', '503', 'ri', 1, '9', '1011', 1, '001'),
('BD.5.033', 'L. 5 BEDAH /503-3', '175000', 'Rusak', 'LANTAI 5', '004', '503', 'ri', 1, '9', '1011', 1, '001'),
('BD.5.034', 'L. 5 BEDAH /503-4', '175000', 'Rusak', 'LANTAI 5', '004', '503', 'ri', 1, '9', '1011', 1, '001'),
('BD.5.041', 'L. 5 BEDAH /504-1', '175000', 'Baik', 'LANTAI 5', '004', '504', 'ri', 1, '9', '1011', 1, '001'),
('BD.5.042', 'L. 5 BEDAH /504-2', '175000', 'Baik', 'LANTAI 5', '004', '504', 'ri', 1, '9', '1011', 1, '001'),
('BD.5.043', 'L. 5 BEDAH /504-3', '175000', 'Baik', 'LANTAI 5', '004', '504', 'ri', 1, '9', '1011', 1, '001'),
('BD.5.044', 'L. 5 BEDAH /504-4', '175000', 'Baik', 'LANTAI 5', '004', NULL, 'ri', 0, '9', '1011', 1, '001'),
('BD.5.051', 'L. 5 BEDAH /505-1', '175000', 'Baik', 'LANTAI 5', '004', '505', 'ri', 1, '9', '1011', 1, '001'),
('BD.5.052', 'L. 5 BEDAH /505-2', '175000', 'Baik', 'LANTAI 5', '004', '505', 'ri', 1, '9', '1011', 1, '001'),
('BD.5.053', 'L. 5 BEDAH /505-3', '175000', 'Baik', 'LANTAI 5', '004', '505', 'ri', 1, '9', '1011', 1, '001'),
('BD.5.054', 'L. 5 BEDAH /505-4', '175000', 'Baik', 'LANTAI 5', '004', NULL, 'ri', 0, '9', '1011', 1, '001'),
('BD.5.061', 'L. 5 BEDAH /506-1', '175000', 'Baik', 'LANTAI 5', '004', '506', 'ri', 1, '9', '1011', 1, '001'),
('BD.5.062', 'L. 5 BEDAH /506-2', '175000', 'Baik', 'LANTAI 5', '004', '506', 'ri', 1, '9', '1011', 1, '001'),
('BD.5.063', 'L. 5 BEDAH /506-3', '175000', 'Baik', 'LANTAI 5', '004', '506', 'ri', 1, '9', '1011', 1, '001'),
('BD.5.064', 'L. 5 BEDAH /506-4', '175000', 'Baik', 'LANTAI 5', '004', '506', 'ri', 1, '9', '1011', 1, '001'),
('BD.5.071', 'L. 5 BEDAH /507-1', '175000', 'Baik', 'LANTAI 5', '004', '507', 'ri', 1, '9', '1011', 1, '003'),
('BD.5.072', 'L. 5 BEDAH /507-2', '175000', 'Baik', 'LANTAI 5', '004', '507', 'ri', 1, '9', '1011', 1, '003'),
('BD.5.073', 'L. 5 BEDAH /507-3', '175000', 'Baik', 'LANTAI 5', '004', '507', 'ri', 1, '9', '1011', 1, '003'),
('BD.5.074', 'L. 5 BEDAH /507-4', '175000', 'Baik', 'LANTAI 5', '004', '507', 'ri', 1, '9', '1011', 1, '003'),
('BD.5.081', 'L. 5 BEDAH /508-1', '175000', 'Baik', 'LANTAI 5', '004', '508', 'ri', 1, '9', '1011', 1, '003'),
('BD.5.082', 'L. 5 BEDAH /508-2', '175000', 'Baik', 'LANTAI 5', '004', '508', 'ri', 1, '9', '1011', 1, '003'),
('BD.5.083', 'L. 5 BEDAH /508-3', '175000', 'Baik', 'LANTAI 5', '004', '508', 'ri', 1, '9', '1011', 1, '003'),
('BD.5.084', 'L. 5 BEDAH /508-4', '175000', 'Baik', 'LANTAI 5', '004', '508', 'ri', 1, '9', '1011', 1, '003'),
('BD.5.091', 'L. 5 BEDAH /509-1', '175000', 'Baik', 'LANTAI 5', '004', '509', 'ri', 1, '9', '1011', 1, '003'),
('BD.5.092', 'L. 5 BEDAH /509-2', '175000', 'Baik', 'LANTAI 5', '004', '509', 'ri', 1, '9', '1011', 1, '003'),
('BD.5.093', 'L. 5 BEDAH /509-3', '175000', 'Baik', 'LANTAI 5', '004', '509', 'ri', 1, '9', '1011', 1, '003'),
('BD.5.094', 'L. 5 BEDAH /509-4', '175000', 'Baik', 'LANTAI 5', '004', NULL, 'ri', 0, '9', '1011', 1, '003'),
('BD.5.101', 'L. 5 BEDAH /510-1', '175000', 'Baik', 'LANTAI 5', '004', '510', 'ri', 1, '9', '1011', 1, '002'),
('BD.5.102', 'L. 5 BEDAH /510-2', '175000', 'Baik', 'LANTAI 5', '004', '510', 'ri', 1, '9', '1011', 1, '002'),
('BD.5.IS1', 'L. 5 BEDAH /RPK -1', '155000', 'Baik', 'LANTAI 5', '004', 'ISO1', 'ri', 1, '9', '1011', 1, '006'),
('BD.5.IS2', 'L. 5 BEDAH /RPK -2', '155000', 'Baik', 'LANTAI 5', '004', 'ISO2', 'ri', 1, '9', '1011', 1, '006'),
('BD.5.IS3', 'L. 5 BEDAH /RPK -3', '155000', 'Baik', 'LANTAI 5', '004', 'ISO3', 'ri', 1, '9', '1011', 1, '006'),
('BD.5.IS4', 'L. 5 BEDAH /RPK -4', '155000', 'Baik', 'LANTAI 5', '004', 'ISO4', 'ri', 1, '9', '1011', 1, '006'),
('BD.5.KT1', 'L. 5 BEDAH /KEMO -1', '155000', 'Baik', 'LANTAI 5', '004', NULL, 'ri', 0, '9', '1011', 1, NULL),
('BD.5.KT2', 'L. 5 BEDAH /KEMO -2', '155000', 'Baik', 'LANTAI 5', '004', NULL, 'ri', 0, '9', '1011', 1, NULL),
('BD.5.KT3', 'L. 5 BEDAH /KEMO -3', '155000', 'Baik', 'LANTAI 5', '004', NULL, 'ri', 0, '9', '1011', 1, NULL),
('BD.6.012', 'L. 6 BEDAH /601 -1', '125000', 'Baik', 'LANTAI 6', '004', '601', 'ri', 1, '10', '1012', 1, NULL),
('BD.6.021', 'L. 6 BEDAH /602 -1', '125000', 'Baik', 'LANTAI 6', '004', '602', 'ri', 1, '10', '1012', 1, NULL),
('BD.6.022', 'L. 6 BEDAH /602 -2', '125000', 'Baik', 'LANTAI 6', '004', '602', 'ri', 1, '10', '1012', 1, NULL),
('BD.6.023', 'L. 6 BEDAH /602 -3', '125000', 'Baik', 'LANTAI 6', '004', '602', 'ri', 1, '10', '1012', 1, NULL),
('BD.6.031', 'L. 6 BEDAH /603 -1', '125000', 'Baik', 'LANTAI 6', '004', '603', 'ri', 1, '10', '1012', 1, NULL),
('BD.6.032', 'L. 6 BEDAH /603 -2', '125000', 'Baik', 'LANTAI 6', '004', '603', 'ri', 1, '10', '1012', 1, NULL),
('BD.6.033', 'L. 6 BEDAH /603 -3', '125000', 'Baik', 'LANTAI 6', '004', '603', 'ri', 1, '10', '1012', 1, NULL),
('BD.6.034', 'L. 6 BEDAH /603 -4', '125000', 'Baik', 'LANTAI 6', '004', NULL, 'ri', 0, '10', '1012', 1, NULL),
('BD.6.041', 'L. 6 BEDAH /604 -1', '125000', 'Baik', 'LANTAI 6', '004', '604', 'ri', 1, '10', '1012', 1, NULL),
('BD.6.042', 'L. 6 BEDAH /604 -2', '125000', 'Baik', 'LANTAI 6', '004', '604', 'ri', 1, '10', '1012', 1, NULL),
('BD.6.043', 'L. 6 BEDAH /604 -3', '125000', 'Baik', 'LANTAI 6', '004', '604', 'ri', 1, '10', '1012', 1, NULL),
('BD.6.044', 'L. 6 BEDAH /604 -4', '125000', 'Baik', 'LANTAI 6', '004', NULL, 'ri', 0, '10', '1012', 1, NULL),
('BD.6.051', 'L. 6 BEDAH /605 -1', '125000', 'Baik', 'LANTAI 6', '004', '605', 'ri', 1, '10', '1012', 1, NULL),
('BD.6.052', 'L. 6 BEDAH /605 -2', '125000', 'Baik', 'LANTAI 6', '004', '605', 'ri', 1, '10', '1012', 1, NULL),
('BD.6.053', 'L. 6 BEDAH /605 -3', '125000', 'Baik', 'LANTAI 6', '004', '605', 'ri', 1, '10', '1012', 1, NULL),
('BD.6.054', 'L. 6 BEDAH /605 - 4', '125000', 'Baik', 'LANTAI 6', '004', NULL, 'ri', 0, '10', '1012', 1, NULL),
('BD.6.055', 'L. 6 BEDAH /605 -5', '125000', 'Baik', 'LANTAI 6', '004', NULL, 'ri', 0, '10', '1012', 1, NULL),
('BD.6.056', 'L. 6 BEDAH /605 -6', '125000', 'Baik', 'LANTAI 6', '004', NULL, 'ri', 0, '10', '1012', 1, NULL),
('BD.6.061', 'L. 6 BEDAH /606 -1', '125000', 'Baik', 'LANTAI 6', '004', '606', 'ri', 1, '10', '1012', 1, NULL),
('BD.6.062', 'L. 6 BEDAH /606 -2', '125000', 'Baik', 'LANTAI 6', '004', '606', 'ri', 1, '10', '1012', 1, NULL),
('BD.6.063', 'L. 6 BEDAH /606 -3', '125000', 'Baik', 'LANTAI 6', '004', '606', 'ri', 1, '10', '1012', 1, NULL),
('BD.6.064', 'L. 6 BEDAH /606 -4', '125000', 'Baik', 'LANTAI 6', '004', NULL, 'ri', 0, '10', '1012', 1, NULL),
('BD.6.065', 'L. 6 BEDAH /606 -5', '125000', 'Baik', 'LANTAI 6', '004', NULL, 'ri', 0, '10', '1012', 1, NULL),
('BD.6.066', 'L. 6 BEDAH /606 -6', '125000', 'Baik', 'LANTAI 6', '004', NULL, 'ri', 0, '10', '1012', 1, NULL),
('BD.6.071', 'L. 6 BEDAH /607 -1', '125000', 'Baik', 'LANTAI 6', '004', '607', 'ri', 1, '10', '1012', 1, NULL),
('BD.6.072', 'L. 6 BEDAH /607 -2', '125000', 'Baik', 'LANTAI 6', '004', '607', 'ri', 1, '10', '1012', 1, NULL),
('BD.6.073', 'L. 6 BEDAH /607 -3', '125000', 'Baik', 'LANTAI 6', '004', '607', 'ri', 1, '10', '1012', 1, NULL),
('BD.6.074', 'L. 6 BEDAH /607 -4', '125000', 'Baik', 'LANTAI 6', '004', NULL, 'ri', 0, '10', '1012', 1, NULL),
('BD.6.075', 'L. 6 BEDAH /607 -5', '125000', 'Baik', 'LANTAI 6', '004', NULL, 'ri', 0, '10', '1012', 1, NULL),
('BD.6.076', 'L. 6 BEDAH /607 -6', '125000', 'Baik', 'LANTAI 6', '004', NULL, 'ri', 0, '10', '1012', 1, NULL),
('BD.6.081', 'L. 6 BEDAH /608 -1', '125000', 'Baik', 'LANTAI 6', '004', '608', 'ri', 1, '10', '1012', 1, NULL),
('BD.6.082', 'L. 6 BEDAH /608 -2', '125000', 'Baik', 'LANTAI 6', '004', '608', 'ri', 1, '10', '1012', 1, NULL),
('BD.6.083', 'L. 6 BEDAH /608 -3', '125000', 'Baik', 'LANTAI 6', '004', '608', 'ri', 1, '10', '1012', 1, NULL),
('BD.6.084', 'L. 6 BEDAH /608 -4', '125000', 'Baik', 'LANTAI 6', '004', NULL, 'ri', 0, '10', '1012', 1, NULL),
('BD.6.085', 'L. 6 BEDAH /608 -5', '125000', 'Baik', 'LANTAI 6', '004', NULL, 'ri', 0, '10', '1012', 1, NULL),
('BD.6.086', 'L. 6 BEDAH /608 -6', '125000', 'Baik', 'LANTAI 6', '004', NULL, 'ri', 0, '10', '1012', 1, NULL),
('BD.6.087', 'L. 6 BEDAH /609 -1', '155000', 'Baik', 'LANTAI 6', '004', '609', 'ri', 1, '10', '1012', 1, NULL),
('BD.6.088', 'L. 6 BEDAH /610 -1', '155000', 'Baik', 'LANTAI 6', '004', '610', 'ri', 1, '10', '1012', 1, NULL),
('BD.6.089', 'L. 6 BEDAH /611 -1', '155000', 'Baik', 'LANTAI 6', '004', '611', 'ri', 1, '10', '1012', 1, NULL),
('BD.6.090', 'L. 6 BEDAH /612 -1', '155000', 'Baik', 'LANTAI 6', '004', '612', 'ri', 1, '10', '1012', 1, NULL),
('BD.6.091', 'L. 6 BEDAH /601 -2', '125000', 'Baik', 'LANTAI 6', '004', '601', 'ri', 1, '10', '1012', 1, NULL),
('BD.6.IS1', 'L. 6 BEDAH /RPK -1', '155000', 'Baik', 'LANTAI 6', '004', NULL, 'ri', 0, '10', '1012', 1, NULL),
('BD.6.IS2', 'L. 6 BEDAH /RPK -2', '155000', 'Baik', 'LANTAI 6', '004', NULL, 'ri', 0, '10', '1012', 1, NULL),
('BD.6.IS3', 'L. 6 BEDAH /RPK -3', '155000', 'Baik', 'LANTAI 6', '004', NULL, 'ri', 0, '10', '1012', 1, NULL),
('BD.6.IS4', 'L. 6 BEDAH /RPK -4', '155000', 'Baik', 'LANTAI 6', '004', NULL, 'ri', 0, '10', '1012', 1, NULL),
('CVC 10', 'VIP A CVC 10 RSPAD', '2000000', 'Baik', 'LANTAI 2', '116', 'CVC 10', 'ri', 1, NULL, 'RI049', 2, '004'),
('CVC 11', 'VIP A CVC 11 RSPAD', '2000000', 'Baik', 'LANTAI 2', '116', 'CVC 11', 'ri', 1, NULL, 'RI049', 2, '004'),
('CVC 12', 'VIP B CVC 12 RSPAD', '1500000', 'Baik', 'LANTAI 2', '125', 'CVC 12', 'ri', 1, NULL, 'RI048', 2, '004'),
('CVC 13', 'VIP B CVC 13 RSPAD', '1500000', 'Baik', 'LANTAI 2', '125', 'CVC 13', 'ri', 1, NULL, 'RI048', 2, '004'),
('CVC 14', 'VIP B CVC 14 RSPAD', '1500000', 'Baik', 'LANTAI 2', '125', 'CVC 14', 'ri', 1, NULL, 'RI048', 2, '004'),
('CVC 15', 'VIP B CVC 15 RSPAD', '1500000', 'Baik', 'LANTAI 2', '125', 'CVC 15', 'ri', 1, NULL, 'RI048', 2, '004'),
('CVC 16', 'VIP A CVC 16 RSPAD', '2000000', 'Baik', 'LANTAI 2', '116', 'CVC 16', 'ri', 1, NULL, 'RI049', 2, '004'),
('CVC 17', 'VIP A CVC 17 RSPAD', '2000000', 'Baik', 'LANTAI 2', '116', 'CVC 17', 'ri', 1, NULL, 'RI049', 2, '004'),
('CVC 18', 'VIP A CVC 18 RSPAD', '2000000', 'Baik', 'LANTAI 2', '116', 'CVC 18', 'ri', 1, NULL, 'RI049', 2, '004'),
('CVC 19', 'VIP A CVC 19 RSPAD', '2000000', 'Baik', 'LANTAI 2', '116', 'CVC 19', 'ri', 1, NULL, 'RI049', 2, '004'),
('CVC 2', 'VIP B CVC 2 RSPAD', '1500000', 'Baik', 'LANTAI 2', '125', 'CVC 2', 'ri', 1, NULL, 'RI048', 2, '004'),
('CVC 21', 'VIP B CVC 21 RSPAD', '1500000', 'Baik', 'LANTAI 2', '125', 'CVC 21', 'ri', 1, NULL, 'RI048', 2, '004'),
('CVC 22', 'VIP B CVC 22 RSPAD', '1500000', 'Baik', 'LANTAI 2', '125', 'CVC 22', 'ri', 1, NULL, 'RI048', 2, '004'),
('CVC 3', 'VIP B CVC 3 RSPAD', '1500000', 'Baik', 'LANTAI 2', '125', 'CVC 3', 'ri', 1, NULL, 'RI048', 2, '004'),
('CVC 4', 'VIP B CVC 4 RSPAD', '1500000', 'Baik', 'LANTAI 2', '125', 'CVC 4', 'ri', 1, NULL, 'RI048', 2, '004'),
('CVC 5', 'VIP B CVC 5 RSPAD', '1500000', 'Baik', 'LANTAI 2', '125', 'CVC 5', 'ri', 1, NULL, 'RI048', 2, '004'),
('CVC 6', 'VIP A CVC 6 RSPAD', '2000000', 'Baik', 'LANTAI 2', '116', 'CVC 6', 'ri', 1, NULL, 'RI049', 2, '004'),
('CVC 7', 'VIP A CVC 7 RSPAD', '2000000', 'Baik', 'LANTAI 2', '116', 'CVC 7', 'ri', 1, NULL, 'RI049', 2, '004'),
('CVC 8', 'VIP A CVC 8 RSPAD', '2000000', 'Baik', 'LANTAI 2', '116', 'CVC 8', 'ri', 1, NULL, 'RI049', 2, '004'),
('CVC 9', 'VIP A CVC 9 RSPAD', '2000000', 'Baik', 'LANTAI 2', '116', 'CVC 9', 'ri', 1, NULL, 'RI049', 2, '004'),
('CVC I', 'VIP B CVC I RSPAD', '1500000', 'Baik', 'LANTAI 2', '125', 'CVC I', 'ri', 1, NULL, 'RI048', 2, '004'),
('Halmahera', 'VIP A HALMAHERA IMAN SUJUDI', NULL, 'Baik', NULL, NULL, 'HALMAHERA', 'ri', 1, NULL, 'RI013', 4, NULL),
('HCU01', 'HCU - 01', NULL, NULL, NULL, '016', NULL, 'ri', 0, NULL, '1002', 1, NULL),
('HCU02', 'HCU - 02', NULL, NULL, NULL, '016', NULL, 'ri', 0, NULL, '1002', 1, NULL),
('HCU03', 'HCU - 03', '0', NULL, NULL, '016', NULL, 'ri', 0, NULL, '1002', 1, NULL),
('HCU04', 'HCU - 04', NULL, NULL, NULL, '016', NULL, 'ri', 0, NULL, '1002', 1, NULL),
('ICU.01', 'INTENSIVE CARE UNIT -A1', '600000', 'Baik', 'LANTAI 2', '005', 'A', 'ri', 1, '16', '1018', 1, '007'),
('ICU.02', 'INTENSIVE CARE UNIT -A2', '600000', 'Baik', 'LANTAI 2', '005', 'A', 'ri', 1, '16', '1018', 1, '007'),
('ICU.03', 'INTENSIVE CARE UNIT -A3', '600000', 'Baik', 'LANTAI 2', '005', 'A', 'ri', 1, '16', '1018', 1, '007'),
('ICU.04', 'INTENSIVE CARE UNIT -A4', '600000', 'Baik', 'LANTAI 2', '005', 'A', 'ri', 1, '16', '1018', 1, '007'),
('ICU.05', 'INTENSIVE CARE UNIT -B1', '600000', 'Baik', 'LANTAI 2', '005', 'B', 'ri', 1, '16', '1018', 1, '007'),
('ICU.06', 'INTENSIVE CARE UNIT -C1', '600000', 'Baik', 'LANTAI 2', '005', 'C', 'ri', 1, '16', '1018', 1, '007'),
('ICU.07', 'INTENSIVE CARE UNIT -C2', '600000', 'Baik', 'LANTAI 2', '005', 'C', 'ri', 1, '16', '1018', 1, '007'),
('ICU.08', 'INTENSIVE CARE UNIT -C3', '600000', 'Baik', 'LANTAI 2', '005', 'C', 'ri', 1, '16', '1018', 1, '007'),
('ICU.09', 'INTENSIVE CARE UNIT -C4', '600000', 'Baik', 'LANTAI 2', '005', 'C', 'ri', 1, '16', '1018', 1, '007'),
('ICU.10', 'INTENSIVE CARE UNIT -D1', '600000', 'Baik', 'LANTAI 2', '005', 'D', 'ri', 1, '16', '1018', 1, '007'),
('ICU.11', 'INTENSIVE CARE UNIT -D2', '600000', 'Baik', 'LANTAI 2', '005', 'D', 'ri', 1, '16', '1018', 1, '007'),
('ICU.12', 'INTENSIVE CARE UNIT -D3', '600000', 'Baik', 'LANTAI 2', '005', 'D', 'ri', 1, '16', '1018', 1, '007'),
('ICU.13', 'INTENSIVE CARE UNIT -D4', '600000', 'Baik', 'LANTAI 2', '005', 'D', 'ri', 1, '16', '1018', 1, '007'),
('ICU.14', 'INTENSIVE CARE UNIT -F1', '600000', 'Baik', 'LANTAI 2', '005', 'F', 'ri', 1, '16', '1018', 1, '007'),
('ICU.15', 'INTENSIVE CARE UNIT -F2', '600000', 'Baik', 'LANTAI 2', '005', 'F', 'ri', 1, '16', '1018', 1, '007'),
('ICU.16', 'INTENSIVE CARE UNIT -F3', '600000', 'Baik', 'LANTAI 2', '005', 'F', 'ri', 1, '16', '1018', 1, '007'),
('ICU.17', 'INTENSIVE CARE UNIT -F4', '600000', 'Baik', 'LANTAI 2', '005', 'F', 'ri', 1, '16', '1018', 1, '007'),
('ICU.18', 'INTENSIVE CARE UNIT -G1', '600000', 'Baik', 'LANTAI 2', '005', 'G', 'ri', 1, '16', '1018', 1, '007'),
('ICU.19', 'INTENSIVE CARE UNIT -G2', '600000', 'Baik', 'LANTAI 2', '005', 'G', 'ri', 1, '16', '1018', 1, '007'),
('ICU.20', 'INTENSIVE CARE UNIT -I1', '600000', 'Baik', 'LANTAI 2', '005', 'I', 'ri', 1, '16', '1018', 1, '007'),
('ICU.21', 'INTENSIVE CARE UNIT -H1', '600000', 'Baik', 'LANTAI 2', '005', 'H', 'ri', 1, '16', '1018', 1, '007'),
('ICU.22', 'INTENSIVE CARE UNIT -H2', '600000', 'Baik', 'LANTAI 2', '005', 'H', 'ri', 1, '16', '1018', 1, '007'),
('ICU.23', 'INTENSIVE CARE UNIT -H3', '600000', 'Baik', 'LANTAI 2', '005', 'H', 'ri', 1, '16', '1018', 1, '007'),
('ICU.24', 'INTENSIVE CARE UNIT -H4', '600000', 'Baik', 'LANTAI 2', '005', 'H', 'ri', 1, '16', '1018', 1, '007'),
('ICU.25', 'INTENSIVE CARE UNIT -E1', '600000', 'Baik', 'LANTAI 2', '005', 'E', 'ri', 1, '16', '1018', 1, '007'),
('ICU.26', 'INTENSIVE CARE UNIT -E2', '600000', 'Baik', 'LANTAI 2', '005', 'E', 'ri', 1, '16', '1018', 1, '007'),
('ICU.27', 'INTENSIVE CARE UNIT -E3', '600000', 'Baik', 'LANTAI 2', '005', 'E', 'ri', 1, '16', '1018', 1, '007'),
('ICU.28', 'INTENSIVE CARE UNIT -E4', '600000', 'Baik', 'LANTAI 2', '005', 'E', 'ri', 1, '16', '1018', 1, '007'),
('ICU.29', 'INTENSIVE CARE UNIT -I2', '600000', 'Baik', 'LANTAI 2', '005', 'I', 'ri', 1, '16', '1018', 1, '007'),
('ICU.30', 'INTENSIVE CARE UNIT -G3', '600000', 'Baik', 'LANTAI 2', '005', 'G', 'ri', 1, '16', '1018', 1, '007'),
('ICU.31', 'INTENSIVE CARE UNIT -G4', '600000', 'Baik', 'LANTAI 2', '005', 'G', 'ri', 1, '16', '1018', 1, '007'),
('ICU.32', 'INTENSIVE CARE UNIT -G9', '600000', 'Baik', 'LANTAI 2', '005', 'G', 'ri', 0, '16', '1018', 1, '007'),
('ICU.33', 'INTENSIVE CARE UNIT -B2', '600000', 'Baik', 'LANTAI 2', '005', 'B', 'ri', 1, '16', '1018', 1, '007'),
('ICU.34', 'INTENSIVE CARE UNIT -B3', '600000', 'Baik', 'LANTAI 2', '005', 'B', 'ri', 1, '16', '1018', 1, '007'),
('ICU.35', 'INTENSIVE CARE UNIT -B4', '600000', 'Baik', 'LANTAI 2', '005', 'B', 'ri', 1, '16', '1018', 1, '007'),
('ICU1', 'ICU 1 KARTIKA', NULL, 'Baik', 'LANTAI 4', '114', 'ICU 1', 'ri', 1, NULL, 'RI003', 2, '007'),
('ICU2', 'ICU 2 KARTIKA', NULL, 'Baik', 'LANTAI 4', '114', 'ICU 2', 'ri', 1, NULL, 'RI003', 2, '007'),
('ICU3', 'ICU 3 KARTIKA', NULL, 'Baik', 'LANTAI 4', '114', 'ICU 3', 'ri', 1, NULL, 'RI003', 2, '007'),
('ICU4', 'ICU 4 KARTIKA', NULL, 'Baik', 'LANTAI 4', '114', 'ICU 4', 'ri', 1, NULL, 'RI003', 2, '007'),
('IGD-1', 'KAMAR.RAWAT IGD-1', '125000', 'Baik', NULL, '006', NULL, 'ri', 1, '17', '1019', 1, '008'),
('IGD-2', 'KAMAR.RAWAT IGD-2', '125000', 'Baik', NULL, '006', NULL, 'ri', 0, '17', '1019', 1, '008'),
('IGD-3', 'KAMAR RAWAT IGD-3', '125000', 'Baik', NULL, '006', NULL, 'ri', 0, '17', '1019', 1, '008'),
('IGD-4', 'KAMAR.RAWAT IGD-4', '125000', 'Baik', NULL, '006', NULL, 'ri', 0, '17', '1019', 1, '008'),
('IGD-5', 'KAMAR.RAWAT IGD-5', '125000', 'Baik', NULL, '006', NULL, 'ri', 0, '17', '1019', 1, '008'),
('IGD-6', 'KAMAR.RAWAT IGD-6', '125000', 'Baik', NULL, '006', NULL, 'ri', 0, '17', '1019', 1, '008'),
('IKA1-109-5', 'IKA L.1 /109 - 6', '125000', 'Baik', NULL, '007', NULL, 'ri', 0, '11', '1013', 1, NULL),
('IKA1-BO-01', 'IKA L.1 /101 - 1', '300000', 'Baik', 'LANTAI 1', '007', '101', 'ri', 1, '11', '1013', 1, '001'),
('IKA1-BO-02', 'IKA L.1 /101 - 2', '300000', 'Baik', 'LANTAI 1', '007', '101', 'ri', 1, '11', '1013', 1, '001'),
('IKA1-BO-03', 'IKA L.1 /102 - 1', '300000', 'Baik', 'LANTAI 1', '007', '102', 'ri', 1, '11', '1013', 1, '001'),
('IKA1-BO-04', 'IKA L.1 /102 - 2', '300000', 'Baik', 'LANTAI 1', '007', '102', 'ri', 1, '11', '1013', 1, '001'),
('IKA1-BO-05', 'IKA L.1 /103 - 1', '300000', 'Baik', 'LANTAI 1', '007', '103', 'ri', 1, '11', '1013', 1, '001'),
('IKA1-BO-06', 'IKA L.1 /103 - 2', '300000', 'Baik', 'LANTAI 1', '007', '103', 'ri', 1, '11', '1013', 1, '001'),
('IKA1-BO-07', 'IKA L.1 /104 - 1', '300000', 'Baik', 'LANTAI 1', '007', '104', 'ri', 1, '11', '1013', 1, '001'),
('IKA1-BO-08', 'IKA L.1 /104 - 2', '300000', 'Baik', 'LANTAI 1', '007', '104', 'ri', 1, '11', '1013', 1, '001'),
('IKA1-BO-09', 'IKA L.1 /107 - 1', '175000', 'Baik', 'LANTAI 1', '007', '107', 'ri', 1, '11', '1013', 1, '002'),
('IKA1-BO-10', 'IKA L.1 /107 - 2', '175000', 'Baik', 'LANTAI 1', '007', '107', 'ri', 1, '11', '1013', 1, '002'),
('IKA1-BO-11', 'IKA L.1 /107 - 3', '175000', 'Baik', 'LANTAI 1', '007', '107', 'ri', 1, '11', '1013', 1, '002'),
('IKA1-BO-12', 'IKA L.1 /107 - 4', '175000', 'Baik', 'LANTAI 1', '007', '107', 'ri', 1, '11', '1013', 1, '002'),
('IKA1-IN-01', 'IKA L.1 /INKUBATOR 106 - 01', '125000', 'Baik', 'LANTAI 1', '007', '106', 'ri', 1, '11', '1013', 1, NULL),
('IKA1-IN-02', 'IKA L.1 /INKUBATOR 106 - 02', '125000', 'Baik', 'LANTAI 1', '007', '106', 'ri', 1, '11', '1013', 1, NULL),
('IKA1-IN-03', 'IKA L.1 /INKUBATOR 106 - 03', '125000', 'Baik', NULL, '007', NULL, 'ri', 0, '11', '1013', 1, NULL),
('IKA1-IN-04', 'IKA L.1 /RPK 105 - 1', '200000', 'Baik', 'LANTAI 1', '007', 'HCU', 'ri', 1, '11', '1013', 1, '006'),
('IKA1-K3-01', 'IKA L.1 /RPK 105 - 2', '200000', 'Baik', 'LANTAI 1', '007', 'HCU', 'ri', 1, '11', '1013', 1, '006'),
('IKA1-K3-02', 'IKA L.1 /108 - 1', '125000', 'Baik', 'LANTAI 1', '007', '108', 'ri', 1, '11', '1013', 1, '002'),
('IKA1-K3-03', 'IKA L.1 /108 - 2', '125000', 'Baik', 'LANTAI 1', '007', '108', 'ri', 1, '11', '1013', 1, '002'),
('IKA1-K3-04', 'IKA L.1 /108 - 3', '125000', 'Baik', 'LANTAI 1', '007', '108', 'ri', 1, '11', '1013', 1, '002'),
('IKA1-PM-01', 'IKA L.1 /108 - 4', '125000', 'Baik', 'LANTAI 1', '007', '108', 'ri', 1, '11', '1013', 1, '002'),
('IKA1-PM-02', 'IKA L.1 /108 - 5', '125000', 'Baik', 'LANTAI 1', '007', '108', 'ri', 0, '11', '1013', 1, '002'),
('IKA1-PM-03', 'IKA L.1 /108 - 6', '125000', 'Baik', 'LANTAI 1', '007', '108', 'ri', 0, '11', '1013', 1, '002'),
('IKA1-PM-04', 'IKA L.1 /109 - 1', '125000', 'Baik', 'LANTAI 1', '007', '109', 'ri', 1, '11', '1013', 1, '003'),
('IKA1-PM-05', 'IKA L.1 /109 - 2', '125000', 'Baik', 'LANTAI 1', '007', '109', 'ri', 1, '11', '1013', 1, '003'),
('IKA1-PM-06', 'IKA L.1 /109 - 3', '125000', 'Baik', 'LANTAI 1', '007', '109', 'ri', 1, '11', '1013', 1, '003'),
('IKA1-PM-07', 'IKA L.1 /109 - 4', '125000', 'Baik', 'LANTAI 1', '007', '109', 'ri', 1, '11', '1013', 1, '003'),
('IKA1-PM-08', 'IKA L.1 /109 - 5', '125000', 'Baik', 'LANTAI 1', '007', '109', 'ri', 0, '11', '1013', 1, '003'),
('IKA1-PM-09', 'IKA L.1 /109 - 6', '125000', 'Baik', 'LANTAI 1', '007', '109', 'ri', 0, '11', '1013', 1, '003'),
('IKA1-RPK-01', 'IKA L.1 /105 - 1', '125000', 'Baik', 'LANTAI 1', '007', '105', 'ri', 0, '11', '1013', 1, '006'),
('IKA1-RPK-02', 'IKA L.1 /105 - 2', '125000', 'Baik', 'LANTAI 1', '007', '105', 'ri', 0, '11', '1013', 1, '006'),
('IKA2.BP-1', 'IKA L.2 / 208 -1', '125000', 'Baik', 'LANTAI 2', '007', '208A', 'ri', 1, '12', '1014', 1, '002'),
('IKA2.BP-2', 'IKA L.2 / 208 -2', '125000', 'Baik', 'LANTAI 2', '007', '208A', 'ri', 1, '12', '1014', 1, '002'),
('IKA2.BP-3', 'IKA L.2 / 208 -3', '125000', 'Baik', 'LANTAI 2', '007', '208B', 'ri', 1, '12', '1014', 1, '002'),
('IKA2.BP-4', 'IKA L.2 / 208 -4', '125000', 'Baik', 'LANTAI 2', '007', '208B', 'ri', 1, '12', '1014', 1, '002'),
('IKA2.BY-1', 'IKA L.2 / 202 -1', '125000', 'Baik', 'LANTAI 2', '007', '202', 'ri', 1, '12', '1014', 1, '006'),
('IKA2.BY-2', 'IKA L.2 / 202 -2', '125000', 'Baik', 'LANTAI 2', '007', '202', 'ri', 1, '12', '1014', 1, '006'),
('IKA2.DH-1', 'IKA L.2 / 206  -1', '125000', 'Baik', 'LANTAI 2', '007', '206A', 'ri', 1, '12', '1014', 1, '002'),
('IKA2.DH-2', 'IKA L.2 / 206  -2', '125000', 'Baik', 'LANTAI 2', '007', '206A', 'ri', 1, '12', '1014', 1, '002'),
('IKA2.DH-3', 'IKA L.2 / 206  -3', '125000', 'Baik', 'LANTAI 2', '007', '206B', 'ri', 1, '12', '1014', 1, '002'),
('IKA2.DH-4', 'IKA L.2 / 206  -4', '125000', 'Baik', 'LANTAI 2', '007', '206B', 'ri', 1, '12', '1014', 1, '002'),
('IKA2.GE-1', 'IKA L.2 / 207  -1', '125000', 'Baik', 'LANTAI 2', '007', '207', 'ri', 1, '12', '1014', 1, '003'),
('IKA2.GE-2', 'IKA L.2 / 207  -2', '125000', 'Baik', 'LANTAI 2', '007', '207', 'ri', 1, '12', '1014', 1, '003'),
('IKA2.GE-3', 'IKA L.2 / 207  -3', '125000', 'Baik', 'LANTAI 2', '007', '207', 'ri', 1, '12', '1014', 1, '003'),
('IKA2.GE-4', 'IKA L.2 / 207  -4', '125000', 'Baik', 'LANTAI 2', '007', '207', 'ri', 1, '12', '1014', 1, '003'),
('IKA2.HE-1', 'IKA L.2 / 204 A -1', '125000', 'Baik', 'LANTAI 2', '007', '204A', 'ri', 1, '12', '1014', 1, '002'),
('IKA2.HE-2', 'IKA L.2 / 204 A -2', '125000', 'Baik', 'LANTAI 2', '007', '204A', 'ri', 1, '12', '1014', 1, '002'),
('IKA2.HE-3', 'IKA L.2 / 204 A -3', '125000', 'Baik', 'LANTAI 2', '007', '204A', 'ri', 1, '12', '1014', 1, '002'),
('IKA2.HE-4', 'IKA L.2 / 204 B -4', '125000', 'Baik', 'LANTAI 2', '007', '204B', 'ri', 1, '12', '1014', 1, '003'),
('IKA2.HE-5', 'IKA L.2 / 204 B -5', '125000', 'Baik', 'LANTAI 2', '007', '204B', 'ri', 1, '12', '1014', 1, '003'),
('IKA2.HE-6', 'IKA L.2 / 204 B -6', '125000', 'Baik', 'LANTAI 2', '007', '204B', 'ri', 1, '12', '1014', 1, '003');
INSERT INTO `mst_tempat_tidur` (`bedID`, `keterangan`, `tarif`, `kondisi`, `lantai`, `ruanganID`, `no_kamar`, `jns_rawat`, `active`, `group`, `id_ruang_tindakan`, `rs`, `kelas`) VALUES
('IKA2.IS-1', 'IKA L.2 / RPK/201  -1', '155000', 'Baik', 'LANTAI 2', '007', '201', 'ri', 1, '12', '1014', 1, '006'),
('IKA2.IS-2', 'IKA L.2 / RPK/201  -2', '155000', 'Baik', 'LANTAI 2', '007', '201', 'ri', 1, '12', '1014', 1, '006'),
('IKA2.IS-3', 'IKA L.2 / RPK/201  -3', '155000', 'Baik', 'LANTAI 2', '007', '201', 'ri', 1, '12', '1014', 1, '006'),
('IKA2.IS-4', 'IKA L.2 / RPK/210  -1', '155000', 'Baik', 'LANTAI 2', '007', '210', 'ri', 1, '12', '1014', 1, '009'),
('IKA2.IS-5', 'IKA L.2 / RPK/211  -1', '155000', 'Baik', 'LANTAI 2', '007', '211', 'ri', 1, '12', '1014', 1, '009'),
('IKA2.IS-6', 'IKA L.2 / RPK/212  -1', '155000', 'Baik', 'LANTAI 2', '007', '212', 'ri', 1, '12', '1014', 1, '009'),
('IKA2.IS-7', 'IKA L.2 / RPK RIM/209 -1', '155000', 'Baik', 'LANTAI 2', '007', '209', 'ri', 1, '12', '1014', 1, '006'),
('IKA2.KJ-1', 'IKA L.2 / 205 -1', '125000', 'Baik', 'LANTAI 2', '007', '205', 'ri', 1, '12', '1014', 1, '002'),
('IKA2.KJ-2', 'IKA L.2 / 205 -2', '125000', 'Baik', 'LANTAI 2', '007', '205', 'ri', 1, '12', '1014', 1, '002'),
('IKA2.KJ-3', 'IKA L.2 / 205 -3', '125000', 'Baik', 'LANTAI 2', '007', '205', 'ri', 1, '12', '1014', 1, '002'),
('IKA2.KJ-4', 'IKA L.2 / 205 -4', '125000', 'Baik', 'LANTAI 2', '007', '205', 'ri', 1, '12', '1014', 1, '002'),
('IKA2.ON-1', 'IKA L.2 / 203 A -1', '125000', 'Baik', 'LANTAI 2', '007', '203A', 'ri', 1, '12', '1014', 1, '002'),
('IKA2.ON-2', 'IKA L.2 / 203 A -2', '125000', 'Baik', 'LANTAI 2', '007', '203A', 'ri', 1, '12', '1014', 1, '002'),
('IKA2.ON-3', 'IKA L.2 / 203 A -3', '125000', 'Baik', 'LANTAI 2', '007', '203A', 'ri', 1, '12', '1014', 1, '002'),
('IKA2.ON-4', 'IKA L.2 / 203 B -4', '125000', 'Baik', 'LANTAI 2', '007', '203B', 'ri', 1, '12', '1014', 1, '002'),
('IKA2.ON-5', 'IKA L.2 / 203 B -5', '125000', 'Baik', 'LANTAI 2', '007', '203B', 'ri', 1, '12', '1014', 1, '002'),
('IKA2.ON-6', 'IKA L.2 / 203 B -6', '125000', 'Baik', 'LANTAI 2', '007', '203B', 'ri', 1, '12', '1014', 1, '003'),
('IKA2.TA-1', 'R. THALASEMI - 1', NULL, 'Baik', 'LANTAI 1', '007', 'THALA', 'ri', 1, '12', '1014', 1, NULL),
('IKA2.TA-2', 'R. THALASEMI - 2', NULL, 'Baik', 'LANTAI 1', '007', 'THALA', 'ri', 1, '12', '1014', 1, NULL),
('IKA2.TA-3', 'R. THALASEMI - 3', NULL, 'Baik', 'LANTAI 1', '007', 'THALA', 'ri', 1, '12', '1014', 1, NULL),
('IKA2.TA-4', 'R. THALASEMI - 4', NULL, 'Baik', 'LANTAI 1', '007', 'THALA', 'ri', 1, '12', '1014', 1, NULL),
('IKA2.TA-5', 'R. THALASEMI - 5', NULL, 'Baik', 'LANTAI 1', '007', 'THALA', 'ri', 1, '12', '1014', 1, NULL),
('IKA2.VIP-1', 'VIP 1 -1', NULL, 'Baik', 'LANTAI 1', '007', 'VIP 1', 'ri', 1, '12', '1014', 1, NULL),
('IKA2.VIP-10', 'VIP 8 -1', NULL, 'Baik', 'LANTAI 1', '007', 'VIP 10', 'ri', 1, '12', '1014', 1, NULL),
('IKA2.VIP-11', 'VIP 8 -2', NULL, 'Baik', 'LANTAI 1', '007', 'VIP 11', 'ri', 1, '12', '1014', 1, NULL),
('IKA2.VIP-12', 'VIP 8 -3', NULL, 'Baik', 'LANTAI 1', '007', 'VIP 12', 'ri', 1, '12', '1014', 1, NULL),
('IKA2.VIP-2', 'VIP 2 -1', NULL, 'Baik', 'LANTAI 1', '007', 'VIP 2', 'ri', 1, '12', '1014', 1, NULL),
('IKA2.VIP-3', 'VIP 3 -1', NULL, 'Baik', 'LANTAI 1', '007', 'VIP 3', 'ri', 1, '12', '1014', 1, NULL),
('IKA2.VIP-4', 'VIP 4 -1', NULL, 'Baik', 'LANTAI 1', '007', 'VIP 4', 'ri', 1, '12', '1014', 1, NULL),
('IKA2.VIP-5', 'VIP 5 -1', NULL, 'Baik', 'LANTAI 1', '007', 'VIP 5', 'ri', 1, '12', '1014', 1, NULL),
('IKA2.VIP-6', 'VIP 6 -1', NULL, 'Baik', 'LANTAI 1', '007', 'VIP 6', 'ri', 1, '12', '1014', 1, NULL),
('IKA2.VIP-7', 'VIP 7 -1', NULL, 'Baik', 'LANTAI 1', '007', 'VIP 7', 'ri', 1, '12', '1014', 1, NULL),
('IKA2.VIP-8', 'VIP 7 -2', NULL, 'Baik', 'LANTAI 1', '007', 'VIP 8', 'ri', 1, '12', '1014', 1, NULL),
('IKA2.VIP-9', 'VIP 7 -3', NULL, 'Baik', 'LANTAI 1', '007', 'VIP 9', 'ri', 1, '12', '1014', 1, NULL),
('IMCU A', 'IMCU A KARTIKA', NULL, 'Baik', 'LANTAI 4', '115', 'IMCU A', 'ri', 1, NULL, 'RI005', 2, NULL),
('IMCU B', 'IMCU B KARTIKA', NULL, 'Baik', 'LANTAI 4', '115', 'IMCU B', 'ri', 1, NULL, 'RI005', 2, NULL),
('IMCU C', 'IMCU C KARTIKA', NULL, 'Baik', 'LANTAI 4', '115', 'IMCU C', 'ri', 1, NULL, 'RI005', 2, NULL),
('IMCU D', 'IMCU D KARTIKA', NULL, 'Baik', 'LANTAI 4', '115', 'IMCU D', 'ri', 1, NULL, 'RI005', 2, NULL),
('JAN.201.1', 'JANTUNG 201 -1', '325000', 'Baik', 'LANTAI.2', '008', '201', 'ri', 1, '18', '1020', 1, '004'),
('JAN.202.1', 'JANTUNG 202 -1', '325000', 'Baik', 'LANTAI 2', '008', '202', 'ri', 1, '18', '1020', 1, '004'),
('JAN.203.1', 'JANTUNG 203 -1', '175000', 'Baik', 'LANTAI 2', '008', '203', 'ri', 1, '18', '1020', 1, '001'),
('JAN.203.2', 'JANTUNG 203 -2', '175000', 'Baik', 'LANTAI 2', '008', '203', 'ri', 1, '18', '1020', 1, '001'),
('JAN.204.1', 'JANTUNG 204 -1', '175000', 'Baik', 'LANTAI 2', '008', '204', 'ri', 1, '18', '1020', 1, '001'),
('JAN.204.2', 'JANTUNG 204 -2', '175000', 'Baik', 'LANTAI 2', '008', '204', 'ri', 1, '18', '1020', 1, '001'),
('JAN.205.1', 'JANTUNG 205 -1', '125000', 'Baik', 'LANTAI 2', '008', '205', 'ri', 1, '18', '1020', 1, '001'),
('JAN.205.2', 'JANTUNG 205 -2', '125000', 'Baik', 'LANTAI 2', '008', '205', 'ri', 1, '18', '1020', 1, '001'),
('JAN.206.1', 'JANTUNG 206 -1', '125000', 'Baik', 'LANTAI 2', '008', '206', 'ri', 1, '18', '1020', 1, '006'),
('JAN.206.2', 'JANTUNG 206 -2', '125000', 'Baik', 'LANTAI 2', '008', NULL, 'ri', 0, '18', '1020', 1, '006'),
('JAN.207.1', 'JANTUNG 207 -1', '125000', 'Baik', 'LANTAI 2', '008', '207', 'ri', 1, '18', '1020', 1, '006'),
('JAN.207.2', 'JANTUNG 207 -2', '125000', 'Baik', 'LANTAI 2', '008', NULL, 'ri', 0, '18', '1020', 1, '006'),
('JAN.208.1', 'JANTUNG 208-1', '125000', 'Baik', 'LANTAI 2', '008', '208', 'ri', 1, '18', '1020', 1, '002'),
('JAN.208.2', 'JANTUNG 208-2', '125000', 'Baik', 'LANTAI 2', '008', '208', 'ri', 1, '18', '1020', 1, '002'),
('JAN.208.3', 'JANTUNG 208 -3', '125000', 'Baik', 'LANTAI 2', '008', NULL, 'ri', 0, '18', '1020', 1, '002'),
('JAN.209.1', 'JANTUNG 209-1', '125000', 'Baik', 'LANTAI 2', '008', '209', 'ri', 1, '18', '1020', 1, '002'),
('JAN.209.2', 'JANTUNG 209-2', '125000', 'Baik', 'LANTAI 2', '008', '209', 'ri', 1, '18', '1020', 1, '002'),
('JAN.209.3', 'JANTUNG 209 - 3', '125000', 'Baik', 'LANTAI 2', '008', NULL, 'ri', 0, '18', '1020', 1, '002'),
('JAN.210.1', 'JANTUNG 210 -1', '125000', 'Baik', 'LANTAI 2', '008', '210', 'ri', 1, '18', '1020', 1, '003'),
('JAN.210.2', 'JANTUNG 210 -2', '125000', 'Baik', 'LANTAI 2', '008', '210', 'ri', 1, '18', '1020', 1, '003'),
('JAN.210.3', 'JANTUNG 210 - 3', '125000', 'Baik', 'LANTAI 2', '008', NULL, 'ri', 0, '18', '1020', 1, '003'),
('JAN.211.1', 'JANTUNG 211 - 1', '125000', 'Baik', 'LANTAI 2', '008', '211', 'ri', 1, '18', '1020', 1, '003'),
('JAN.211.2', 'JANTUNG 211 - 2', '125000', 'Baik', 'LANTAI 2', '008', '211', 'ri', 1, '18', '1020', 1, '003'),
('JAN.211.3', 'JANTUNG 211 - 3', '125000', 'Baik', 'LANTAI 2', '008', NULL, 'ri', 0, '18', '1020', 1, '003'),
('JAN.ISO.1', 'JANTUNG /RPK -1', '155000', 'Baik', 'LANTAI 2', '008', NULL, 'ri', 0, '18', '1020', 1, NULL),
('NRV.01', 'NEUROVASK - 1', '125000', 'Baik', 'LANTAI 2', '009', NULL, 'ri', 1, '24', '1026', 1, NULL),
('NRV.02', 'NEUROVASK - 2', '125000', 'Baik', 'LANTAI 2', '009', NULL, 'ri', 1, '24', '1026', 1, NULL),
('NRV.03', 'NEUROVASK - 3', '125000', 'Baik', 'LANTAI 2', '009', NULL, 'ri', 1, '24', '1026', 1, NULL),
('NRV.04', 'NEUROVASK - 4', '125000', 'Baik', 'LANTAI 2', '009', NULL, 'ri', 1, '24', '1026', 1, NULL),
('NRV.05', 'NEUROVASK - 5', '125000', 'Baik', 'LANTAI 2', '009', NULL, 'ri', 1, '24', '1026', 1, NULL),
('NRV.06', 'NEUROVASK - 6', '125000', 'Baik', 'LANTAI 2', '009', NULL, 'ri', 1, '24', '1026', 1, NULL),
('NRV.07', 'NEUROVASK - 7', '125000', 'Baik', 'LANTAI 2', '009', NULL, 'ri', 1, '24', '1026', 1, NULL),
('NRV.08', 'NEUROVASK - 8', '125000', 'Baik', 'LANTAI 2', '009', NULL, 'ri', 1, '24', '1026', 1, NULL),
('NRV.09', 'NEUROVASK - 9', '125000', 'Baik', 'LANTAI 2', '009', NULL, 'ri', 1, '24', '1026', 1, NULL),
('NRV.10', 'NEUROVASK - 10', '125000', 'Baik', 'LANTAI 2', '009', NULL, 'ri', 1, '24', '1026', 1, NULL),
('NRV.11', 'NEUROVASK - 11', '125000', 'Baik', 'LANTAI 2', '009', NULL, 'ri', 1, '24', '1026', 1, NULL),
('NRV.12', 'NEUROVASK - 12', '125000', 'Baik', 'LANTAI 2', '009', NULL, 'ri', 1, '24', '1026', 1, NULL),
('NRV.13', 'NEUROVASK - 13', '125000', 'Baik', 'LANTAI 2', '009', NULL, 'ri', 1, '24', '1026', 1, NULL),
('NRV.14', 'NEUROVASK - 14', '125000', 'Baik', 'LANTAI 2', '009', NULL, 'ri', 1, '24', '1026', 1, NULL),
('NRV.15', 'NEUROVASK - 15', '125000', 'Baik', 'LANTAI 2', '009', NULL, 'ri', 1, '24', '1026', 1, NULL),
('NRV.16', 'NEUROVASK - 16', '125000', 'Baik', 'LANTAI 2', '009', NULL, 'ri', 1, '24', '1026', 1, NULL),
('OB.1.021', 'L. 1 OBSGIN/102 -1', '125000', 'Baik', 'LANTAI 1', '010', '102', 'ri', 0, '23', '1025', 1, '011'),
('OB.1.022', 'L. 1 OBSGIN/102 -2', '125000', 'Baik', 'LANTAI 1', '010', '102', 'ri', 0, '23', '1025', 1, '011'),
('OB.1.023', 'L. 1 OBSGIN/102 -3', '125000', 'Baik', 'LANTAI 1', '010', '102', 'ri', 0, '23', '1025', 1, '011'),
('OB.1.024', 'L. 1 OBSGIN/102 -4', '125000', 'Baik', 'LANTAI 1', '010', '102', 'ri', 0, '23', '1025', 1, '011'),
('OB.1.025', 'L. 1 OBSGIN/102 -5', '125000', 'Baik', 'LANTAI 1', '010', NULL, 'ri', 0, '23', '1025', 1, '011'),
('OB.1.026', 'L. 1 OBSGIN/102 -6', '125000', 'Baik', 'LANTAI 1', '010', NULL, 'ri', 0, '23', '1025', 1, '011'),
('OB.1.031', 'L. 1 OBSGIN/103 -1', '125000', 'Baik', 'LANTAI 1', '010', '103', 'ri', 0, '23', '1025', 1, '006'),
('OB.1.032', 'L. 1 OBSGIN/103 -2', '125000', 'Baik', 'LANTAI 1', '010', '103', 'ri', 0, '23', '1025', 1, '006'),
('OB.1.033', 'L. 1 OBSGIN/103 -3', '125000', 'Baik', 'LANTAI 1', '010', '103', 'ri', 0, '23', '1025', 1, '006'),
('OB.1.034', 'L. 1 OBSGIN/103 -4', '125000', 'Baik', 'LANTAI 1', '010', NULL, 'ri', 0, '23', '1025', 1, '006'),
('OB.1.035', 'L. 1 OBSGIN/103 -5', '125000', 'Baik', 'LANTAI 1', '010', NULL, 'ri', 0, '23', '1025', 1, '006'),
('OB.1.041', 'L. 1 OBSGIN/104 -1', '125000', 'Baik', 'LANTAI 1', '010', '104', 'ri', 0, '23', '1025', 1, '002'),
('OB.1.042', 'L. 1 OBSGIN/104 -2', '125000', 'Baik', 'LANTAI 1', '010', '104', 'ri', 0, '23', '1025', 1, '002'),
('OB.1.043', 'L. 1 OBSGIN/104 -3', '125000', 'Baik', 'LANTAI 1', '010', '104', 'ri', 0, '23', '1025', 1, '002'),
('OB.1.044', 'L. 1 OBSGIN/104 -4', '125000', 'Baik', 'LANTAI 1', '010', '104', 'ri', 0, '23', '1025', 1, '002'),
('OB.1.051', 'L. 1 OBSGIN/105 -1', '125000', 'Baik', 'LANTAI 1', '010', '105', 'ri', 1, '23', '1025', 1, '003'),
('OB.1.061', 'L. 1 OBSGIN/106 -1', '175000', 'Baik', 'LANTAI 1', '010', '106', 'ri', 1, '23', '1025', 1, '013'),
('OB.1.062', 'L. 1 OBSGIN/106 -2', '175000', 'Baik', 'LANTAI 1', '010', '106', 'ri', 1, '23', '1025', 1, '013'),
('OB.1.063', 'L. 1 OBSGIN/106 -3', '175000', 'Baik', 'LANTAI 1', '010', '106', 'ri', 1, '23', '1025', 1, '013'),
('OB.1.071', 'L. 1 OBSGIN/107 -1', '175000', 'Baik', 'LANTAI 1', '010', NULL, 'ri', 0, '23', '1025', 1, '003'),
('OB.1.072', 'L. 1 OBSGIN/107 - 2', '175000', 'Baik', 'LANTAI 1', '010', NULL, 'ri', 0, '23', '1025', 1, '003'),
('OB.1.151', 'L. 1 OBSGIN/115 -1', '125000', 'Baik', 'LANTAI 1', '010', '115', 'ri', 1, '23', '1025', 1, '004'),
('OB.1.152', 'L. 1 OBSGIN/115 -2', '125000', 'Baik', 'LANTAI 1', '010', '115', 'ri', 1, '23', '1025', 1, '004'),
('OB.1.153', 'L. 1 OBSGIN/115 -3', '125000', 'Baik', 'LANTAI 1', '010', NULL, 'ri', 0, '23', '1025', 1, '004'),
('OB.1.154', 'L. 1 OBSGIN/115 -4', '125000', 'Baik', 'LANTAI 1', '010', NULL, 'ri', 0, '23', '1025', 1, '004'),
('OB.1.171', 'L. 1 OBSGIN/117 -1', '175000', 'Baik', 'LANTAI 1', '010', '117', 'ri', 1, '23', '1025', 1, NULL),
('OB.1.172', 'L. 1 OBSGIN/117 -3', '175000', 'Baik', 'LANTAI 1', '010', '117', 'ri', 1, '23', '1025', 1, NULL),
('OB.1.173', 'KAMAR BASINET - 1', NULL, 'Baik', NULL, '010', NULL, 'ri', 0, '23', '1025', 1, NULL),
('OB.1.174', 'KAMAR BASINET - 2', NULL, 'Baik', NULL, '010', NULL, 'ri', 0, '23', '1025', 1, NULL),
('OB.1.175', 'KAMAR BASINET - 3', NULL, 'Baik', NULL, '010', NULL, 'ri', 0, '23', '1025', 1, NULL),
('OB.1.176', 'KAMAR BASINET - 4', NULL, 'Baik', NULL, '010', NULL, 'ri', 0, '23', '1025', 1, NULL),
('OB.1.177', 'KAMAR BASINET - 5', NULL, 'Baik', NULL, '010', NULL, 'ri', 0, '23', '1025', 1, NULL),
('OB.1.178', 'KAMAR BASINET - 6', NULL, 'Baik', NULL, '010', NULL, 'ri', 0, '23', '1025', 1, NULL),
('OB.1.180', 'L. 1 OBSGIN/103 -4', '125000', 'Baik', 'LANTAI 1', '010', '103', 'ri', 1, '23', '1025', 1, '006'),
('OB.1.181', 'L. 1 OBSGIN/116 -1', '125000', 'Baik', 'LANTAI 1', '010', '116', 'ri', 1, '23', '1025', 1, NULL),
('OB.1.182', 'L. 1 OBSGIN/116 -2', '125000', 'Baik', 'LANTAI 1', '010', '116', 'ri', 1, '23', '1025', 1, NULL),
('OB.1.183', 'L. 1 OBSGIN/117 -2', '175000', 'Baik', 'LANTAI 1', '010', '117', 'ri', 1, '23', '1025', 1, NULL),
('OB.2.011', 'L. 2 OBSGIN/201 -1', '175000', 'Baik', 'LANTAI 2', '010', '201', 'ri', 1, '25', '1027', 1, '001'),
('OB.2.012', 'L. 2 OBSGIN/201 -2', '175000', 'Baik', 'LANTAI 2', '010', '201', 'ri', 1, '25', '1027', 1, '001'),
('OB.2.013', 'L. 2 OBSGIN/201 -3', '175000', 'Baik', 'LANTAI 2', '010', '201', 'ri', 1, '25', '1027', 1, '001'),
('OB.2.021', 'L. 2 OBSGIN/202 -1', '175000', 'Baik', 'LANTAI 2', '010', '202', 'ri', 1, '25', '1027', 1, '001'),
('OB.2.022', 'L. 2 OBSGIN/202 -2', '175000', 'Baik', 'LANTAI 2', '010', '202', 'ri', 1, '25', '1027', 1, '001'),
('OB.2.031', 'L. 2 OBSGIN/203 -1', '125000', 'Baik', 'LANTAI 2', '010', '203', 'ri', 1, '25', '1027', 1, '001'),
('OB.2.032', 'L. 2 OBSGIN/203 -2', '125000', 'Baik', 'LANTAI 2', '010', '203', 'ri', 1, '25', '1027', 1, '001'),
('OB.2.033', 'L. 2 OBSGIN/203 -3', '125000', 'Baik', 'LANTAI 2', '010', '203', 'ri', 1, '25', '1027', 1, '001'),
('OB.2.034', 'L. 2 OBSGIN/203 -4', '125000', 'Baik', 'LANTAI 2', '010', '203', 'ri', 1, '25', '1027', 1, '001'),
('OB.2.035', 'L. 2 OBSGIN/203 -5', '125000', 'Baik', 'LANTAI 2', '010', '203', 'ri', 1, '25', '1027', 1, '001'),
('OB.2.036', 'L. 2 OBSGIN/203 -6', '125000', 'Baik', 'LANTAI 2', '010', '203', 'ri', 1, '25', '1027', 1, '001'),
('OB.2.041', 'L. 2 OBSGIN/204 -1', '125000', 'Baik', 'LANTAI 2', '010', '204', 'ri', 1, '25', '1027', 1, '001'),
('OB.2.042', 'L. 2 OBSGIN/204 -2', '125000', 'Baik', 'LANTAI 2', '010', '204', 'ri', 1, '25', '1027', 1, '001'),
('OB.2.043', 'L. 2 OBSGIN/204 -3', '125000', 'Baik', 'LANTAI 2', '010', '204', 'ri', 1, '25', '1027', 1, '001'),
('OB.2.044', 'L. 2 OBSGIN/204 -4', '125000', 'Baik', 'LANTAI 2', '010', '204', 'ri', 1, '25', '1027', 1, '001'),
('OB.2.045', 'L. 2 OBSGIN/204 -5', '125000', 'Baik', 'LANTAI 2', '010', NULL, 'ri', 0, '25', '1027', 1, '001'),
('OB.2.046', 'L. 2 OBSGIN/204 -6', '125000', 'Baik', 'LANTAI 2', '010', NULL, 'ri', 0, '25', '1027', 1, '001'),
('OB.2.061', 'L. 2 OBSGIN/206 -1', '175000', 'Baik', 'LANTAI 2', '010', '206', 'ri', 1, '25', '1027', 1, '001'),
('OB.2.062', 'L. 2 OBSGIN/206 -2', '175000', 'Baik', 'LANTAI 2', '010', '206', 'ri', 1, '25', '1027', 1, '001'),
('OB.2.151', 'L. 2 OBSGIN/215 -1', '175000', 'Baik', 'LANTAI 2', '010', '215', 'ri', 1, '25', '1027', 1, '001'),
('OB.2.152', 'L. 2 OBSGIN/215 -2', '175000', 'Baik', 'LANTAI 2', '010', '215', 'ri', 1, '25', '1027', 1, '001'),
('OB.2.153', 'L. 2 OBSGIN/215 -3', '175000', 'Baik', 'LANTAI 2', '010', '215', 'ri', 1, '25', '1027', 1, '001'),
('OB.2.181', 'L. 2 OBSGIN/218 -1', '175000', 'Baik', 'LANTAI 2', '010', '218', 'ri', 1, '25', '1027', 1, '001'),
('OB.2.182', 'L. 2 OBSGIN/218 -2', '175000', 'Baik', 'LANTAI 2', '010', '218', 'ri', 1, '25', '1027', 1, '001'),
('OB.2.183', 'L. 2 OBSGIN/218 -3', '175000', 'Baik', 'LANTAI 2', '010', NULL, 'ri', 0, '25', '1027', 1, '001'),
('OBS01', 'OBSERVASI - 3', NULL, 'Baik', 'LANTAI 1', '011', 'OBSER', 'ri', 1, '26', '1028', 1, '012'),
('OBS02', 'OBSERVASI - 4', NULL, 'Baik', 'LANTAI 1', '011', 'OBSER', 'ri', 1, '26', '1028', 1, '012'),
('OBS03', 'OBSERVASI - 5', NULL, 'Baik', 'LANTAI 1', '011', 'OBSER', 'ri', 1, '26', '1028', 1, '012'),
('OBS04', 'OBSERVASI - 6', NULL, 'Baik', 'LANTAI 1', '011', 'OBSER', 'ri', 1, '26', '1028', 1, '012'),
('OKG01', 'K.TINDAKAN & PERSALINAN-01', NULL, 'Baik', 'LANTAI 1', '011', NULL, 'ri', 0, '27', '1029', 1, '012'),
('OKG02', 'K.TINDAKAN & PERSALINAN-02', NULL, 'Baik', 'LANTAI 1', '011', NULL, 'ri', 0, '27', '1029', 1, '012'),
('OKG03', 'K.TINDAKAN & PERSALINAN-03', NULL, 'Baik', 'LANTAI 1', '011', NULL, 'ri', 0, '27', '1029', 1, '012'),
('OKG04', 'K.TINDAKAN & PERSALINAN-04', NULL, 'Baik', 'LANTAI 1', '011', NULL, 'ri', 0, '27', '1029', 1, '012'),
('PEB01', 'PEB - 1', NULL, 'Baik', 'LANTAI 1', '011', 'PEB', 'ri', 1, '27', '1029', 1, '012'),
('PEB02', 'PEB - 2', NULL, 'Baik', 'LANTAI 1', '011', 'PEB', 'ri', 1, '27', '1029', 1, '012'),
('PU.1.03', 'L. 1PU / 103 - VIP B', '475000', 'Rusak', 'LANTAI 1', '013', '103', 'ri', 0, '1', '1003', 1, '004'),
('PU.1.04', 'L. 1PU / 104 - VIP B', '475000', 'Baik', 'LANTAI 1', '013', '104', 'ri', 0, '1', '1003', 1, '004'),
('PU.1.05', 'L. 1PU / 105 - VIP B', '475000', 'Baik', 'LANTAI 1', '013', '105', 'ri', 1, '1', '1003', 1, '004'),
('PU.1.06', 'L. 1PU / 106 - VIP B', '475000', 'Baik', 'LANTAI 1', '013', '106', 'ri', 1, '1', '1003', 1, '004'),
('PU.1.07', 'L. 1PU / 107 - VIP B', '475000', 'Baik', 'LANTAI 1', '013', '107', 'ri', 1, '1', '1003', 1, '004'),
('PU.1.08', 'L. 1PU / 108 - VIP B', '475000', 'Baik', 'LANTAI 1', '013', '108', 'ri', 1, '1', '1003', 1, '004'),
('PU.1.09', 'L. 1PU / 109 - VIP B', '475000', 'Baik', 'LANTAI 1', '013', '109', 'ri', 1, '1', '1003', 1, '004'),
('PU.1.10', 'L. 1PU / 110 - VIP B', '475000', 'Baik', 'LANTAI 1', '013', '110', 'ri', 1, '1', '1003', 1, '004'),
('PU.1.11', 'L. 1PU / 111 - VIP B', '475000', 'Baik', 'LANTAI 1', '013', '111', 'ri', 1, '1', '1003', 1, '004'),
('PU.1.16', 'L. 1PU / 116 -  VIP', '625000', 'Baik', 'LANTAI 1', '013', '116', 'ri', 1, '1', '1003', 1, '005'),
('PU.1.17', 'L. 1PU / 117 -  VIP', '625000', 'Baik', 'LANTAI 1', '013', '117', 'ri', 1, '1', '1003', 1, '005'),
('PU.1.20', 'L. 1PU / 120 -  VIP', '625000', 'Baik', 'LANTAI 1', '013', '120', 'ri', 1, '1', '1003', 1, '005'),
('PU.1.21', 'L. 1PU / 121 - VIP', '625000', 'Baik', 'LANTAI 1', '013', '121', 'ri', 1, '1', '1003', 1, '005'),
('PU.1.22', 'L. 1PU / 122 - VIP', '625000', 'Baik', 'LANTAI 1', '013', '122', 'ri', 1, '1', '1003', 1, '005'),
('PU.1.23', 'L. 1PU / 123 - VIP', '625000', 'Baik', 'LANTAI 1', '013', '123', 'ri', 1, '1', '1003', 1, '005'),
('PU.1.24', 'L. 1PU / 124 - VIP', '625000', 'Baik', 'LANTAI 1', '013', '124', 'ri', 1, '1', '1003', 1, '005'),
('PU.1.25', 'L. 1PU / 125 - VIP', '625000', 'Baik', 'LANTAI 1', '013', '125', 'ri', 1, '1', '1003', 1, '005'),
('PU.1.45', 'L. 1PU / 145 - VIP B', '475000', 'Rusak', 'LANTAI 1', '013', '145', 'ri', 1, '1', '1003', 1, NULL),
('PU.1.49', 'L. 1PU / 149 - VIP B', '475000', 'Rusak', 'LANTAI 1', '013', '149', 'ri', 1, '1', '1003', 1, NULL),
('PU.2.061', 'L. 2PU/206 - 1', '300000', 'Baik', 'LANTAI 2', '013', NULL, 'ri', 0, '2', '1004', 1, '006'),
('PU.2.062', 'L. 2PU/206 - 2', '300000', 'Baik', 'LANTAI 2', '013', NULL, 'ri', 0, '2', '1004', 1, '006'),
('PU.2.141', 'L. 2PU/214 - 1', '300000', 'Baik', 'LANTAI 2', '013', '214', 'ri', 1, '2', '1004', 1, '006'),
('PU.2.142', 'L. 2PU/214 - 2', '300000', 'Baik', 'LANTAI 2', '013', '214', 'ri', 1, '2', '1004', 1, '006'),
('PU.2.151', 'L. 2PU/215 - 1', '300000', 'Baik', 'LANTAI 2', '013', '215', 'ri', 1, '2', '1004', 1, '001'),
('PU.2.152', 'L. 2PU/215 - 2', '300000', 'Baik', 'LANTAI 2', '013', '215', 'ri', 1, '2', '1004', 1, '001'),
('PU.2.161', 'L. 2PU/216 - 1', '300000', 'Rusak', 'LANTAI 2', '013', '216', 'ri', 1, '2', '1004', 1, '001'),
('PU.2.162', 'L. 2PU/216 - 2', '300000', 'Rusak', 'LANTAI 2', '013', '216', 'ri', 1, '2', '1004', 1, '001'),
('PU.2.171', 'L. 2PU/217 - 1', '300000', 'Baik', 'LANTAI 2', '013', '217', 'ri', 1, '2', '1004', 1, '001'),
('PU.2.172', 'L. 2PU/217 - 2', '300000', 'Baik', 'LANTAI 2', '013', '217', 'ri', 1, '2', '1004', 1, '001'),
('PU.2.181', 'L. 2PU/218 - 1', '300000', 'Rusak', 'LANTAI 2', '013', '218', 'ri', 1, '2', '1004', 1, '001'),
('PU.2.182', 'L. 2PU/218 - 2', '300000', 'Rusak', 'LANTAI 2', '013', '218', 'ri', 1, '2', '1004', 1, '001'),
('PU.2.191', 'L. 2PU/219 - 1', '300000', 'Baik', 'LANTAI 2', '013', '219', 'ri', 1, '2', '1004', 1, '001'),
('PU.2.192', 'L. 2PU/219 - 2', '300000', 'Baik', 'LANTAI 2', '013', '219', 'ri', 1, '2', '1004', 1, '001'),
('PU.2.251', 'L. 2PU/225 - 1', '300000', 'Baik', 'LANTAI 2', '013', '225', 'ri', 1, '2', '1004', 1, '001'),
('PU.2.261', 'L. 2PU/226 - 1', '300000', 'Baik', 'LANTAI 2', '013', '226', 'ri', 1, '2', '1004', 1, '001'),
('PU.2.262', 'L. 2PU/226 - 2', '300000', 'Baik', 'LANTAI 2', '013', '226', 'ri', 1, '2', '1004', 1, '001'),
('PU.2.271', 'L. 2PU/227 - 1', '300000', 'Baik', 'LANTAI 2', '013', '227', 'ri', 1, '2', '1004', 1, '001'),
('PU.2.272', 'L. 2PU/227 - 2', '300000', 'Baik', 'LANTAI 2', '013', NULL, 'ri', 0, '2', '1004', 1, '001'),
('PU.2.281', 'L. 2PU/228 - 1', '300000', 'Baik', 'LANTAI 2', '013', '228', 'ri', 1, '2', '1004', 1, '001'),
('PU.2.282', 'L. 2PU/216 - 1', '300000', 'Baik', 'LANTAI 2', '013', '216', 'ri', 1, '2', '1004', 1, '001'),
('PU.2.301', 'L. 2PU/230 - 1', '300000', 'Baik', 'LANTAI 2', '013', '230', 'ri', 1, '2', '1004', 1, '001'),
('PU.2.ISO1', 'L. 2PU/RPK - 1', '155000', 'Baik', 'LANTAI 2', '013', 'RPK', 'ri', 1, '2', '1004', 1, '006'),
('PU.2.ISO2', 'L. 2PU/RPK - 2', '155000', 'Baik', 'LANTAI 2', '013', 'RPK', 'ri', 1, '2', '1004', 1, '006'),
('PU.2.ISO3', 'L. 2PU/RPK - 3', '155000', 'Baik', 'LANTAI 2', '013', 'RPK', 'ri', 1, '2', '1004', 1, '006'),
('PU.2.ISO4', 'L. 2PU/RPK - 4', '155000', 'Baik', 'LANTAI 2', '013', 'RPK', 'ri', 1, '2', '1004', 1, '006'),
('PU.2.LB1', 'L. 2PU/R.KHUSUS ULB - 1', '300000', 'Baik', 'LANTAI 2', '013', 'ULB', 'ri', 1, '2', '1004', 1, '006'),
('PU.2.LB2', 'L. 2PU/R.KHUSUS ULB - 2', '300000', 'Baik', 'LANTAI 2', '013', 'ULB', 'ri', 1, '2', '1004', 1, '006'),
('PU.2.LB3', 'L. 2PU/R.KHUSUS ULB - 3', '300000', 'Baik', 'LANTAI 2', '013', 'ULB', 'ri', 1, '2', '1004', 1, '006'),
('PU.2.LBPM', 'L. 2PU/R.KHUSUS ULB - 4', '300000', 'Baik', 'LANTAI 2', '013', 'ULB', 'ri', 1, '2', '1004', 1, '006'),
('PU.3.011', 'L. 3PU /301 - 1', '175000', 'Baik', 'LANTAI 3', '013', '301', 'ri', 1, '3', '1005', 1, '006'),
('PU.3.012', 'L. 3PU /301 - 2', '175000', 'Baik', 'LANTAI 3', '013', '301', 'ri', 1, '3', '1005', 1, '006'),
('PU.3.013', 'L. 3PU /301 - 3', '175000', 'Baik', 'LANTAI 3', '013', '301', 'ri', 1, '3', '1005', 1, '006'),
('PU.3.014', 'L. 3PU /301 - 4', '175000', 'Baik', 'LANTAI 3', '013', '301', 'ri', 1, '3', '1005', 1, '006'),
('PU.3.021', 'L. 3PU /302 - 1', '175000', 'Baik', 'LANTAI 3', '013', '302', 'ri', 1, '3', '1005', 1, '001'),
('PU.3.022', 'L. 3PU /302 - 2', '175000', 'Baik', 'LANTAI 3', '013', '302', 'ri', 1, '3', '1005', 1, '001'),
('PU.3.023', 'L. 3PU /302 - 3', '175000', 'Baik', 'LANTAI 3', '013', NULL, 'ri', 0, '3', '1005', 1, '001'),
('PU.3.031', 'L. 3PU /303 - 1', '175000', 'Baik', 'LANTAI 3', '013', '303', 'ri', 1, '3', '1005', 1, '001'),
('PU.3.032', 'L. 3PU /303 - 2', '175000', 'Baik', 'LANTAI 3', '013', '303', 'ri', 1, '3', '1005', 1, '001'),
('PU.3.033', 'L. 3PU /303 - 3', '175000', 'Baik', 'LANTAI 3', '013', NULL, 'ri', 0, '3', '1005', 1, '001'),
('PU.3.041', 'L. 3PU /304 - 1', '175000', 'Baik', 'LANTAI 3', '013', '304', 'ri', 1, '3', '1005', 1, '001'),
('PU.3.042', 'L. 3PU /304 - 2', '175000', 'Baik', 'LANTAI 3', '013', '304', 'ri', 1, '3', '1005', 1, '001'),
('PU.3.043', 'L. 3PU /304 - 3', '175000', 'Baik', 'LANTAI 3', '013', NULL, 'ri', 0, '3', '1005', 1, '001'),
('PU.3.051', 'L. 3PU /305 - 1', '175000', 'Baik', 'LANTAI 3', '013', '305', 'ri', 1, '3', '1005', 1, '001'),
('PU.3.052', 'L. 3PU /305 - 2', '175000', 'Baik', 'LANTAI 3', '013', '305', 'ri', 1, '3', '1005', 1, '001'),
('PU.3.053', 'L. 3PU /305 - 3', '175000', 'Baik', 'LANTAI 3', '013', NULL, 'ri', 0, '3', '1005', 1, '001'),
('PU.3.061', 'L. 3PU /306 - 1', '175000', 'Baik', 'LANTAI 3', '013', '306', 'ri', 1, '3', '1005', 1, '001'),
('PU.3.062', 'L. 3PU /306 - 2', '175000', 'Baik', 'LANTAI 3', '013', '306', 'ri', 1, '3', '1005', 1, '001'),
('PU.3.063', 'L. 3PU /306 - 3', '175000', 'Baik', 'LANTAI 3', '013', NULL, 'ri', 0, '3', '1005', 1, '001'),
('PU.3.101', 'L. 3PU /310 - 1', '175000', 'Baik', 'LANTAI 3', '013', '310', 'ri', 1, '3', '1005', 1, '001'),
('PU.3.102', 'L. 3PU /310 - 2', '175000', 'Baik', 'LANTAI 3', '013', '310', 'ri', 1, '3', '1005', 1, '001'),
('PU.3.103', 'L. 3PU /310 - 3', '175000', 'Baik', 'LANTAI 3', '013', NULL, 'ri', 0, '3', '1005', 1, '001'),
('PU.3.111', 'L. 3PU /311-1', NULL, 'Baik', 'LANTAI 3', '013', '311', 'ri', 1, '3', '1005', 1, '001'),
('PU.3.112', 'L. 3PU /311-2', NULL, 'Baik', 'LANTAI 3', '013', '311', 'ri', 1, '3', '1005', 1, '001'),
('PU.3.113', 'L. 3PU /KEMO 3', NULL, 'Baik', 'LANTAI 3', '013', NULL, 'ri', 0, '3', '1005', 1, NULL),
('PU.3.121', 'L. 3PU /312 - 1', '175000', 'Baik', 'LANTAI 3', '013', '312', 'ri', 1, '3', '1005', 1, '001'),
('PU.3.122', 'L. 3PU /312 - 2', '175000', 'Baik', 'LANTAI 3', '013', '312', 'ri', 1, '3', '1005', 1, '001'),
('PU.3.123', 'L. 3PU /312 - 3', '175000', 'Baik', 'LANTAI 3', '013', NULL, 'ri', 0, '3', '1005', 1, '001'),
('PU.3.131', 'L. 3PU /313 - 1', '175000', 'Baik', 'LANTAI 3', '013', '313', 'ri', 1, '3', '1005', 1, '001'),
('PU.3.132', 'L. 3PU /313 - 2', '175000', 'Baik', 'LANTAI 3', '013', '313', 'ri', 1, '3', '1005', 1, '001'),
('PU.3.133', 'L. 3PU /313 - 3', '175000', 'Baik', 'LANTAI 3', '013', NULL, 'ri', 0, '3', '1005', 1, '001'),
('PU.3.141', 'L. 3PU /314 - 1', '175000', 'Baik', 'LANTAI 3', '013', '314', 'ri', 1, '3', '1005', 1, '001'),
('PU.3.142', 'L. 3PU /314 - 2', '175000', 'Baik', 'LANTAI 3', '013', '314', 'ri', 1, '3', '1005', 1, '001'),
('PU.3.143', 'L. 3PU /314 - 3', '175000', 'Baik', 'LANTAI 3', '013', NULL, 'ri', 0, '3', '1005', 1, NULL),
('PU.3.150', 'L. 3PU /315 - 0', '175000', 'Baik', 'LANTAI 3', '013', '315', 'ri', 1, '3', '1005', 1, '001'),
('PU.3.152', 'L. 3PU /315 - 2', '175000', 'Baik', 'LANTAI 3', '013', '315', 'ri', 1, '3', '1005', 1, '001'),
('PU.3.153', 'L. 3PU /315 - 3', '175000', 'Baik', 'LANTAI 3', '013', NULL, 'ri', 0, '3', '1005', 1, NULL),
('PU.3.161', 'L. 3PU /316 - 1', '175000', 'Baik', 'LANTAI 3', '013', '316', 'ri', 1, '3', '1005', 1, '001'),
('PU.3.162', 'L. 3PU /316 - 2', '175000', 'Baik', 'LANTAI 3', '013', NULL, 'ri', 1, '3', '1005', 1, NULL),
('PU.3.163', 'L. 3PU /316 - 3', '175000', 'Baik', 'LANTAI 3', '013', '316', 'ri', 0, '3', '1005', 1, NULL),
('PU.3.IS1', 'L. 3PU / RPK - 1', '155000', 'Baik', 'LANTAI 3', '013', NULL, 'ri', 0, '3', '1005', 1, NULL),
('PU.3.IS2', 'L. 3PU / RPK - 2', '155000', 'Baik', 'LANTAI 3', '013', NULL, 'ri', 0, '3', '1005', 1, NULL),
('PU.3.IS3', 'L. 3PU / RPK - 3', '155000', 'Baik', 'LANTAI 3', '013', NULL, 'ri', 0, '3', '1005', 1, NULL),
('PU.3.IS4', 'L. 3PU / RPK - 4', '155000', 'Baik', 'LANTAI 3', '013', NULL, 'ri', 0, '3', '1005', 1, NULL),
('PU.4.01A1', 'L. 4PU/401 A - 1', '125000', 'Baik', 'LANTAI 4', '013', '401A', 'ri', 1, '4', '1006', 1, '002'),
('PU.4.01A2', 'L. 4PU/401 A - 2', '125000', 'Baik', 'LANTAI 4', '013', '401A', 'ri', 1, '4', '1006', 1, '002'),
('PU.4.01A3', 'L. 4PU/401 A - 3', '125000', 'Baik', 'LANTAI 4', '013', '401A', 'ri', 1, '4', '1006', 1, '002'),
('PU.4.01A4', 'L. 4PU/401 A - 4', '125000', 'Baik', 'LANTAI 4', '013', '401A', 'ri', 1, '4', '1006', 1, '002'),
('PU.4.01B1', 'L. 4PU/401 B - 1', '125000', 'Baik', 'LANTAI 4', '013', '401B', 'ri', 1, '4', '1006', 1, '002'),
('PU.4.01B2', 'L. 4PU/401 B - 2', '125000', 'Baik', 'LANTAI 4', '013', '401B', 'ri', 1, '4', '1006', 1, '002'),
('PU.4.01B3', 'L. 4PU/401 B - 3', '125000', 'Baik', 'LANTAI 4', '013', '401B', 'ri', 1, '4', '1006', 1, '002'),
('PU.4.01B4', 'L. 4PU/401 B - 4', '125000', 'Baik', 'LANTAI 4', '013', '401B', 'ri', 1, '4', '1006', 1, '002'),
('PU.4.01B5', 'L. 4PU/401 B - 5', '125000', 'Baik', 'LANTAI 4', '013', NULL, 'ri', 0, '4', '1006', 1, '002'),
('PU.4.01B6', 'L. 4PU/401 B - 6', '125000', 'Baik', 'LANTAI 4', '013', NULL, 'ri', 0, '4', '1006', 1, NULL),
('PU.4.021', 'L. 4PU/402 - 1', '125000', 'Baik', 'LANTAI 4', '013', '402', 'ri', 1, '4', '1006', 1, '002'),
('PU.4.022', 'L. 4PU/402 - 2', '125000', 'Baik', 'LANTAI 4', '013', '402', 'ri', 1, '4', '1006', 1, '002'),
('PU.4.023', 'L. 4PU/402 - 3', '125000', 'Baik', 'LANTAI 4', '013', '402', 'ri', 1, '4', '1006', 1, '002'),
('PU.4.024', 'L. 4PU/402 - 4', '125000', 'Baik', 'LANTAI 4', '013', NULL, 'ri', 0, '4', '1006', 1, '002'),
('PU.4.031', 'L. 4PU/403 - 1', '125000', 'Baik', 'LANTAI 4', '013', '403', 'ri', 1, '4', '1006', 1, '002'),
('PU.4.032', 'L. 4PU/403 - 2', '125000', 'Baik', 'LANTAI 4', '013', '403', 'ri', 1, '4', '1006', 1, NULL),
('PU.4.033', 'L. 4PU/403 - 3', '125000', 'Baik', 'LANTAI 4', '013', '403', 'ri', 1, '4', '1006', 1, NULL),
('PU.4.034', 'L. 4PU/403 - 4', '125000', 'Baik', 'LANTAI 4', '013', '403', 'ri', 1, '4', '1006', 1, '002'),
('PU.4.041', 'L. 4PU/404 - 1', '125000', 'Baik', 'LANTAI 4', '013', '404', 'ri', 1, '4', '1006', 1, '002'),
('PU.4.042', 'L. 4PU/404 - 2', '125000', 'Baik', 'LANTAI 4', '013', '404', 'ri', 1, '4', '1006', 1, '002'),
('PU.4.043', 'L. 4PU/404 - 3', '125000', 'Baik', 'LANTAI 4', '013', '404', 'ri', 1, '4', '1006', 1, '002'),
('PU.4.044', 'L. 4PU/404 - 4', '125000', 'Baik', 'LANTAI 4', '013', '404', 'ri', 1, '4', '1006', 1, '002'),
('PU.4.051', 'L. 4PU/405 - 1', '125000', 'Baik', 'LANTAI 4', '013', '405', 'ri', 1, '4', '1006', 1, '002'),
('PU.4.052', 'L. 4PU/405 - 2', '125000', 'Baik', 'LANTAI 4', '013', '405', 'ri', 1, '4', '1006', 1, '002'),
('PU.4.053', 'L. 4PU/405 - 3', '125000', 'Baik', 'LANTAI 4', '013', '405', 'ri', 1, '4', '1006', 1, '002'),
('PU.4.054', 'L. 4PU/405 - 4', '125000', 'Baik', 'LANTAI 4', '013', NULL, 'ri', 0, '4', '1006', 1, NULL),
('PU.4.061', 'L. 4PU/406 - 1', '125000', 'Baik', 'LANTAI 4', '013', '406', 'ri', 1, '4', '1006', 1, '002'),
('PU.4.062', 'L. 4PU/406-2', '125000', 'Baik', 'LANTAI 4', '013', '406', 'ri', 1, '4', '1006', 1, '002'),
('PU.4.063', 'L. 4PU/406 - 3', '125000', 'Baik', 'LANTAI 4', '013', '406', 'ri', 1, '4', '1006', 1, '002'),
('PU.4.064', 'L. 4PU/406 - 4', '125000', 'Baik', 'LANTAI 4', '013', NULL, 'ri', 0, '4', '1006', 1, NULL),
('PU.4.071', 'L. 4PU/407 - 1', '125000', 'Baik', 'LANTAI 4', '013', '407', 'ri', 1, '4', '1006', 1, '002'),
('PU.4.072', 'L. 4PU/407 - 2', '125000', 'Baik', 'LANTAI 4', '013', '407', 'ri', 1, '4', '1006', 1, '002'),
('PU.4.073', 'L. 4PU/407 - 3', '125000', 'Baik', 'LANTAI 4', '013', '407', 'ri', 1, '4', '1006', 1, '002'),
('PU.4.074', 'L. 4PU/407 - 4', '125000', 'Baik', 'LANTAI 4', '013', NULL, 'ri', 0, '4', '1006', 1, NULL),
('PU.4.081', 'L. 4PU/408 - 1', '125000', 'Baik', 'LANTAI 4', '013', '408', 'ri', 1, '4', '1006', 1, '002'),
('PU.4.082', 'L. 4PU/408 - 2', '125000', 'Baik', 'LANTAI 4', '013', '408', 'ri', 1, '4', '1006', 1, '002'),
('PU.4.083', 'L. 4PU/408 - 3', '125000', 'Baik', 'LANTAI 4', '013', '408', 'ri', 1, '4', '1006', 1, '002'),
('PU.4.084', 'L. 4PU/408 - 4', '125000', 'Baik', 'LANTAI 4', '013', '408', 'ri', 1, '4', '1006', 1, '002'),
('PU.4.091', 'L. 4PU/409 - 1', '125000', 'Baik', 'LANTAI 4', '013', '409A', 'ri', 1, '4', '1006', 1, '002'),
('PU.4.092', 'L. 4PU/409 - 2', '125000', 'Baik', 'LANTAI 4', '013', '409A', 'ri', 1, '4', '1006', 1, '002'),
('PU.4.093', 'L. 4PU/409 - 3', '125000', 'Baik', 'LANTAI 4', '013', '409A', 'ri', 1, '4', '1006', 1, '002'),
('PU.4.094', 'L. 4PU/409 - 4', '125000', 'Baik', 'LANTAI 4', '013', '409A', 'ri', 1, '4', '1006', 1, '002'),
('PU.4.101', 'L. 4PU/410 - 1', '125000', 'Baik', 'LANTAI 4', '013', '410', 'ri', 1, '4', '1006', 1, '001'),
('PU.4.102', 'L. 4PU/410 - 2', '125000', 'Baik', 'LANTAI 4', '013', '410', 'ri', 1, '4', '1006', 1, '002'),
('PU.4.103', 'L. 4PU/410 - 3', '125000', 'Baik', 'LANTAI 4', '013', '410', 'ri', 1, '4', '1006', 1, '002'),
('PU.4.111', 'L. 4PU/411 - 1', '125000', 'Baik', 'LANTAI 4', '013', '411', 'ri', 1, '4', '1006', 1, '002'),
('PU.4.112', 'L. 4PU/411 - 2', '125000', 'Baik', 'LANTAI 4', '013', '411', 'ri', 1, '4', '1006', 1, '002'),
('PU.4.113', 'L. 4PU/411 - 3', '125000', 'Baik', 'LANTAI 4', '013', '411', 'ri', 1, '4', '1006', 1, '002'),
('PU.4.121', 'L. 4PU/412 - 1', '125000', 'Baik', 'LANTAI 4', '013', '412', 'ri', 1, '4', '1006', 1, '002'),
('PU.4.122', 'L. 4PU/412 - 2', '125000', 'Baik', 'LANTAI 4', '013', '412', 'ri', 1, '4', '1006', 1, '002'),
('PU.4.123', 'L. 4PU/412 - 3', '125000', 'Baik', 'LANTAI 4', '013', '412', 'ri', 1, '4', '1006', 1, '002'),
('PU.4.131', 'L. 4PU/413 - 1', '125000', 'Baik', 'LANTAI 4', '013', '413', 'ri', 0, '4', '1006', 1, '006'),
('PU.4.132', 'L. 4PU/413 - 2', '125000', 'Baik', 'LANTAI 4', '013', '413', 'ri', 0, '4', '1006', 1, '006'),
('PU.4.133', 'L. 4PU/413 - 3', '125000', 'Baik', 'LANTAI 4', '013', '413', 'ri', 0, '4', '1006', 1, '006'),
('PU.4.134', 'L. 4PU/413 - 4', '125000', 'Baik', 'LANTAI 4', '013', '413', 'ri', 0, '4', '1006', 1, '006'),
('PU.4.IM1', 'L. 4PU /RPK - 1', '155000', 'Baik', 'LANTAI 4', '013', 'RPK', 'ri', 1, '4', '1006', 1, NULL),
('PU.4.IM2', 'L. 4PU /RPK - 2', '155000', 'Baik', 'LANTAI 4', '013', 'RPK', 'ri', 1, '4', '1006', 1, NULL),
('PU.4.IM3', 'L. 4PU /RPK - 3', '155000', 'Baik', 'LANTAI 4', '013', 'RPK', 'ri', 1, '4', '1006', 1, NULL),
('PU.4.IM4', 'L. 4PU /RPK - 4', '155000', 'Baik', 'LANTAI 4', '013', 'RPK', 'ri', 1, '4', '1006', 1, NULL),
('PU.5.021', 'L. 5PU /502 - 1', '125000', 'Baik', 'LANTAI 5', '013', '502', 'ri', 1, '5', '1007', 1, '003'),
('PU.5.022', 'L. 5PU /502 - 2', '125000', 'Baik', 'LANTAI 5', '013', '502', 'ri', 1, '5', '1007', 1, '003'),
('PU.5.023', 'L. 5PU /502 - 3', '125000', 'Baik', 'LANTAI 5', '013', '502', 'ri', 1, '5', '1007', 1, '003'),
('PU.5.024', 'L. 5PU /502 - 4', '125000', 'Baik', 'LANTAI 5', '013', '502', 'ri', 1, '5', '1007', 1, '003'),
('PU.5.031', 'L. 5PU /503 - 1', '125000', 'Baik', 'LANTAI 5', '013', '503', 'ri', 1, '5', '1007', 1, '003'),
('PU.5.032', 'L. 5PU /503 - 2', '125000', 'Baik', 'LANTAI 5', '013', '503', 'ri', 1, '5', '1007', 1, '003'),
('PU.5.033', 'L. 5PU /503 - 3', '125000', 'Baik', 'LANTAI 5', '013', '503', 'ri', 1, '5', '1007', 1, '003'),
('PU.5.034', 'L. 5PU /503 - 4', '125000', 'Baik', 'LANTAI 5', '013', '503', 'ri', 1, '5', '1007', 1, '003'),
('PU.5.041', 'L. 5PU /504 - 1', '125000', 'Baik', 'LANTAI 5', '013', '504', 'ri', 1, '5', '1007', 1, '003'),
('PU.5.042', 'L. 5PU /504 - 2', '125000', 'Baik', 'LANTAI 5', '013', '504', 'ri', 1, '5', '1007', 1, '003'),
('PU.5.043', 'L. 5PU /504 - 3', '125000', 'Baik', 'LANTAI 5', '013', '504', 'ri', 1, '5', '1007', 1, '003'),
('PU.5.044', 'L. 5PU /504 - 4', '125000', 'Baik', 'LANTAI 5', '013', '504', 'ri', 1, '5', '1007', 1, '003'),
('PU.5.051', 'L. 5PU /505 - 1', '125000', 'Baik', 'LANTAI 5', '013', '505', 'ri', 1, '5', '1007', 1, '003'),
('PU.5.052', 'L. 5PU /505 - 2', '125000', 'Baik', 'LANTAI 5', '013', '505', 'ri', 1, '5', '1007', 1, '003'),
('PU.5.053', 'L. 5PU /505 - 3', '125000', 'Baik', 'LANTAI 5', '013', '505', 'ri', 1, '5', '1007', 1, '003'),
('PU.5.054', 'L. 5PU /505 - 4', '125000', 'Baik', 'LANTAI 5', '013', '505', 'ri', 1, '5', '1007', 1, '003'),
('PU.5.061', 'L. 5PU /506 - 1', '125000', 'Baik', 'LANTAI 5', '013', '506', 'ri', 1, '5', '1007', 1, '003'),
('PU.5.062', 'L. 5PU /506 - 2', '125000', 'Baik', 'LANTAI 5', '013', '506', 'ri', 1, '5', '1007', 1, '003'),
('PU.5.063', 'L. 5PU /506 - 3', '125000', 'Baik', 'LANTAI 5', '013', '506', 'ri', 1, '5', '1007', 1, '003'),
('PU.5.064', 'L. 5PU /506 - 4', '125000', 'Baik', 'LANTAI 5', '013', '506', 'ri', 1, '5', '1007', 1, '003'),
('PU.5.101', 'L. 5PU /510 - 1', '125000', 'Baik', 'LANTAI 5', '013', '510', 'ri', 1, '5', '1007', 1, '002'),
('PU.5.102', 'L. 5PU /510 - 2', '125000', 'Baik', 'LANTAI 5', '013', '510', 'ri', 1, '5', '1007', 1, '002'),
('PU.5.103', 'L. 5PU /510 - 3', '125000', 'Baik', 'LANTAI 5', '013', '510', 'ri', 1, '5', '1007', 1, '002'),
('PU.5.104', 'L. 5PU /510 - 4', '125000', 'Baik', 'LANTAI 5', '013', '510', 'ri', 1, '5', '1007', 1, '002'),
('PU.5.111', 'L. 5PU /511 - 1', '125000', 'Baik', 'LANTAI 5', '013', '511', 'ri', 1, '5', '1007', 1, '002'),
('PU.5.112', 'L. 5PU /511 - 2', '125000', 'Baik', 'LANTAI 5', '013', '511', 'ri', 1, '5', '1007', 1, '002'),
('PU.5.113', 'L. 5PU /511 - 3', '125000', 'Baik', 'LANTAI 5', '013', '511', 'ri', 1, '5', '1007', 1, '002'),
('PU.5.114', 'L. 5PU /511 - 4', '125000', 'Baik', 'LANTAI 5', '013', '511', 'ri', 1, '5', '1007', 1, '002'),
('PU.5.121', 'L. 5PU /512 - 1', '125000', 'Baik', 'LANTAI 5', '013', '512', 'ri', 1, '5', '1007', 1, '002'),
('PU.5.122', 'L. 5PU /512 - 2', '125000', 'Baik', 'LANTAI 5', '013', '512', 'ri', 1, '5', '1007', 1, '002'),
('PU.5.123', 'L. 5PU /512 - 3', '125000', 'Baik', 'LANTAI 5', '013', '512', 'ri', 1, '5', '1007', 1, '002'),
('PU.5.124', 'L. 5PU /512 - 4', '125000', 'Baik', 'LANTAI 5', '013', '512', 'ri', 1, '5', '1007', 1, '002'),
('PU.5.IS1', 'L. 5PU /RPK - 1', '155000', 'Baik', 'LANTAI 5', '013', 'RPK', 'ri', 1, '5', '1007', 1, '006'),
('PU.5.IS2', 'L. 5PU /RPK - 2', '155000', 'Baik', 'LANTAI 5', '013', 'RPK', 'ri', 1, '5', '1007', 1, '006'),
('PU.5.IS3', 'L. 5PU /RPK - 3', '155000', 'Baik', 'LANTAI 5', '013', 'RPK', 'ri', 1, '5', '1007', 1, '006'),
('PU.5.IS4', 'L. 5PU /RPK - 4', '155000', 'Baik', 'LANTAI 5', '013', 'RPK', 'ri', 1, '5', '1007', 1, '006'),
('PU.6.011', 'L. 6PU /601 - 1', '125000', 'Baik', 'LANTAI 6', '013', '601', 'ri', 1, '6', '1008', 1, '003'),
('PU.6.012', 'L. 6PU /601 - 2', '125000', 'Baik', 'LANTAI 6', '013', '601', 'ri', 1, '6', '1008', 1, '003'),
('PU.6.013', 'L. 6PU /601 - 3', '125000', 'Baik', 'LANTAI 6', '013', '601', 'ri', 1, '6', '1008', 1, '003'),
('PU.6.014', 'L. 6PU /601 - 4', '125000', 'Baik', 'LANTAI 6', '013', '601', 'ri', 1, '6', '1008', 1, '003'),
('PU.6.021', 'L. 6PU /602 - 1', '125000', 'Baik', 'LANTAI 6', '013', '602', 'ri', 1, '6', '1008', 1, '003'),
('PU.6.022', 'L. 6PU /602 - 2', '125000', 'Baik', 'LANTAI 6', '013', '602', 'ri', 1, '6', '1008', 1, '003'),
('PU.6.023', 'L. 6PU /602 - 3', '125000', 'Baik', 'LANTAI 6', '013', '602', 'ri', 1, '6', '1008', 1, '003'),
('PU.6.024', 'L. 6PU /602 - 4', '125000', 'Baik', 'LANTAI 6', '013', '602', 'ri', 1, '6', '1008', 1, '003'),
('PU.6.031', 'L. 6PU /603 - 1', '125000', 'Baik', 'LANTAI 6', '013', '603', 'ri', 1, '6', '1008', 1, '003'),
('PU.6.032', 'L. 6PU /603 - 2', '125000', 'Baik', 'LANTAI 6', '013', '603', 'ri', 1, '6', '1008', 1, '003'),
('PU.6.033', 'L. 6PU /603 - 3', '125000', 'Baik', 'LANTAI 6', '013', '603', 'ri', 1, '6', '1008', 1, '003'),
('PU.6.034', 'L. 6PU /603 - 4', '125000', 'Baik', 'LANTAI 6', '013', '603', 'ri', 1, '6', '1008', 1, '003'),
('PU.6.041', 'L. 6PU /604 - 1', '125000', 'Baik', 'LANTAI 6', '013', '604', 'ri', 1, '6', '1008', 1, '003'),
('PU.6.042', 'L. 6PU /604 - 2', '125000', 'Baik', 'LANTAI 6', '013', '604', 'ri', 1, '6', '1008', 1, '003'),
('PU.6.043', 'L. 6PU /604 - 3', '125000', 'Baik', 'LANTAI 6', '013', '604', 'ri', 1, '6', '1008', 1, '003'),
('PU.6.044', 'L. 6PU /604 - 4', '125000', 'Baik', 'LANTAI 6', '013', '604', 'ri', 1, '6', '1008', 1, '003'),
('PU.6.045', 'L. 6PU /604 - 5', '125000', 'Baik', 'LANTAI 6', '013', NULL, 'ri', 0, '6', '1008', 1, '003'),
('PU.6.046', 'L. 6PU /604 - 6', '125000', 'Baik', 'LANTAI 6', '013', NULL, 'ri', 0, '6', '1008', 1, '003'),
('PU.6.051', 'L. 6PU /605 - 1', '125000', 'Baik', 'LANTAI 6', '013', '605', 'ri', 1, '6', '1008', 1, '003'),
('PU.6.052', 'L. 6PU /605 - 2', '125000', 'Baik', 'LANTAI 6', '013', '605', 'ri', 1, '6', '1008', 1, '003'),
('PU.6.053', 'L. 6PU /605 - 3', '125000', 'Baik', 'LANTAI 6', '013', '605', 'ri', 1, '6', '1008', 1, '003'),
('PU.6.054', 'L. 6PU /605 - 4', '125000', 'Baik', 'LANTAI 6', '013', '605', 'ri', 1, '6', '1008', 1, '003'),
('PU.6.055', 'L. 6PU /605 - 5', '125000', 'Baik', 'LANTAI 6', '013', NULL, 'ri', 0, '6', '1008', 1, '003'),
('PU.6.056', 'L. 6PU /605 - 6', '125000', 'Baik', 'LANTAI 6', '013', NULL, 'ri', 0, '6', '1008', 1, '003'),
('PU.6.061', 'L. 6PU /606 - 1', '125000', 'Baik', 'LANTAI 6', '013', '606', 'ri', 1, '6', '1008', 1, '002'),
('PU.6.062', 'L. 6PU /606 - 2', '125000', 'Baik', 'LANTAI 6', '013', '606', 'ri', 1, '6', '1008', 1, '002'),
('PU.6.063', 'L. 6PU /606 - 3', '125000', 'Baik', 'LANTAI 6', '013', '606', 'ri', 1, '6', '1008', 1, '002'),
('PU.6.064', 'L. 6PU /606 - 4', '125000', 'Baik', 'LANTAI 6', '013', '606', 'ri', 1, '6', '1008', 1, '002'),
('PU.6.065', 'L. 6PU /606 - 5', '125000', 'Baik', 'LANTAI 6', '013', NULL, 'ri', 0, '6', '1008', 1, '002'),
('PU.6.066', 'L. 6PU /606 - 6', '125000', 'Baik', 'LANTAI 6', '013', NULL, 'ri', 0, '6', '1008', 1, '002'),
('PU.6.071', 'L. 6PU /607 - 1', '125000', 'Baik', 'LANTAI 6', '013', '607', 'ri', 1, '6', '1008', 1, '002'),
('PU.6.072', 'L. 6PU /607 - 2', '125000', 'Baik', 'LANTAI 6', '013', '607', 'ri', 1, '6', '1008', 1, '002'),
('PU.6.073', 'L. 6PU /607 - 3', '125000', 'Baik', 'LANTAI 6', '013', '607', 'ri', 1, '6', '1008', 1, '002'),
('PU.6.074', 'L. 6PU /607 - 4', '125000', 'Baik', 'LANTAI 6', '013', '607', 'ri', 1, '6', '1008', 1, '002'),
('PU.6.081', 'L. 6PU /608 - 1', '125000', 'Baik', 'LANTAI 6', '013', '608', 'ri', 1, '6', '1008', 1, '002'),
('PU.6.082', 'L. 6PU /608 - 2', '125000', 'Baik', 'LANTAI 6', '013', '608', 'ri', 1, '6', '1008', 1, '002'),
('PU.6.083', 'L. 6PU /608 - 3', '125000', 'Baik', 'LANTAI 6', '013', '608', 'ri', 1, '6', '1008', 1, '002'),
('PU.6.084', 'L. 6PU /608 - 4', '125000', 'Baik', 'LANTAI 6', '013', '608', 'ri', 1, '6', '1008', 1, '002'),
('PU.6.085', 'L. 6PU /608 - 5', '125000', 'Baik', 'LANTAI 6', '013', NULL, 'ri', 0, '6', '1008', 1, '002'),
('PU.6.086', 'L. 6PU /608 - 6', '125000', 'Baik', 'LANTAI 6', '013', NULL, 'ri', 0, '6', '1008', 1, '002'),
('PU.6.091', 'L. 6PU /609 - 1', '125000', 'Baik', 'LANTAI 6', '013', '609', 'ri', 1, '6', '1008', 1, '002'),
('PU.6.092', 'L. 6PU /609 - 2', '125000', 'Baik', 'LANTAI 6', '013', '609', 'ri', 1, '6', '1008', 1, '002'),
('PU.6.093', 'L. 6PU /609 - 3', '125000', 'Baik', 'LANTAI 6', '013', '609', 'ri', 1, '6', '1008', 1, '002'),
('PU.6.094', 'L. 6PU /609 - 4', '125000', 'Baik', 'LANTAI 6', '013', '609', 'ri', 1, '6', '1008', 1, '002'),
('PU.6.095', 'L. 6PU /609 - 5', '125000', 'Baik', 'LANTAI 6', '013', NULL, 'ri', 0, '6', '1008', 1, '002'),
('PU.6.096', 'L. 6PU /609 - 6', '125000', 'Baik', 'LANTAI 6', '013', NULL, 'ri', 0, '6', '1008', 1, '002'),
('PU.6.101', 'L. 6PU /610 - 1', '125000', 'Baik', 'LANTAI 6', '013', '610', 'ri', 1, '6', '1008', 1, '002'),
('PU.6.102', 'L. 6PU /610 - 2', '125000', 'Baik', 'LANTAI 6', '013', '610', 'ri', 1, '6', '1008', 1, '002'),
('PU.6.103', 'L. 6PU /610 - 3', '125000', 'Baik', 'LANTAI 6', '013', '610', 'ri', 1, '6', '1008', 1, '002'),
('PU.6.104', 'L. 6PU /610 - 4', '125000', 'Baik', 'LANTAI 6', '013', '610', 'ri', 1, '6', '1008', 1, '002'),
('PU.6.105', 'L. 6PU /610 - 5', '125000', 'Baik', 'LANTAI 6', '013', NULL, 'ri', 0, '6', '1008', 1, '002'),
('PU.6.106', 'L. 6PU /610 - 6', '125000', 'Baik', 'LANTAI 6', '013', NULL, 'ri', 0, '6', '1008', 1, '002'),
('PU.6.IS1', 'L. 6PU /RPK - 1', '155000', 'Baik', 'LANTAI 6', '013', 'RPK', 'ri', 1, '6', '1008', 1, '006'),
('PU.6.IS2', 'L. 6PU /RPK - 2', '155000', 'Baik', 'LANTAI 6', '013', 'RPK', 'ri', 1, '6', '1008', 1, '006'),
('PU.6.IS3', 'L. 6PU /RPK - 3', '155000', 'Baik', 'LANTAI 6', '013', 'RPK', 'ri', 1, '6', '1008', 1, '006'),
('PU.6.IS4', 'L. 6PU /RPK - 4', '155000', 'Baik', 'LANTAI 6', '013', 'RPK', 'ri', 1, '6', '1008', 1, '006'),
('PUL.106.1', 'PARU 106 - 1', '325000', 'Baik', 'LANTAI 1', '014', '106', 'ri', 1, '19', '1021', 1, '004'),
('PUL.107.1', 'PARU 107 - 1', '325000', 'Baik', 'LANTAI 1', '014', '107', 'ri', 1, '19', '1021', 1, '004'),
('PUL.108.1', 'PARU 108 - 1', '325000', 'Baik', 'LANTAI 1', '014', '108', 'ri', 1, '19', '1021', 1, '004'),
('PUL.109.1', 'PARU 109 - 1', '325000', 'Baik', 'LANTAI 1', '014', '109', 'ri', 1, '19', '1021', 1, '001'),
('PUL.109.2', 'PARU 109 - 2', '325000', 'Baik', 'LANTAI 1', '014', '109', 'ri', 1, '19', '1021', 1, '001'),
('PUL.110.1', 'PARU 110 - 1', '325000', 'Rusak', 'LANTAI 1', '014', '110', 'ri', 1, '19', '1021', 1, '001'),
('PUL.110.2', 'PARU 110 - 2', '325000', 'Baik', 'LANTAI 1', '014', '110', 'ri', 1, '19', '1021', 1, '001'),
('PUL.1ICU1', 'PARU 1 ICU-1', '325000', 'Baik', 'LANTAI 1', '014', '111', 'ri', 1, '19', '1021', 1, '009'),
('Pul.1ICU2', 'PARU 1 ICU-2', '325000', 'Baik', 'LANTAI 1', '014', '112', 'ri', 1, '19', '1021', 1, '009'),
('PUL.1IS.1', 'PARU 105 - 1', '325000', 'Baik', 'LANTAI 1', '014', '105', 'ri', 1, '19', '1021', 1, '004'),
('PUL.1WARD11', 'PARU 1 WARD1-1', '325000', 'Baik', 'LANTAI 1', '014', '113', 'ri', 1, '19', '1021', 1, '009'),
('PUL.1WARD12', 'PARU 1 WARD1-2', '325000', 'Baik', 'LANTAI 1', '014', '114', 'ri', 1, '19', '1021', 1, '009'),
('PUL.1WARD21', 'PARU 1 WARD2-1', '325000', 'Baik', 'LANTAI 1', '014', NULL, 'ri', 0, '19', '1021', 1, NULL),
('PUL.1WARD22', 'PARU 1 WARD2-2', '325000', 'Baik', 'LANTAI 1', '014', NULL, 'ri', 0, '19', '1021', 1, NULL),
('PUL.401.1', 'PARU 401 - 1', '125000', 'Baik', 'LANTAI 4', '014', '401', 'ri', 1, '20', '1022', 1, '003'),
('PUL.401.2', 'PARU 401 - 2', '125000', 'Baik', 'LANTAI 4', '014', '401', 'ri', 1, '20', '1022', 1, '003'),
('PUL.401.3', 'PARU 401 - 3', '125000', 'Baik', 'LANTAI 4', '014', '401', 'ri', 1, '20', '1022', 1, '003'),
('PUL.401.4', 'PARU 401 - 4', '125000', 'Baik', 'LANTAI 4', '014', '401', 'ri', 1, '20', '1022', 1, '003'),
('PUL.402.1', 'PARU 402 - 1', '125000', 'Baik', 'LANTAI 4', '014', '402', 'ri', 1, '20', '1022', 1, '002'),
('PUL.402.2', 'PARU 402 - 2', '125000', 'Baik', 'LANTAI 4', '014', '402', 'ri', 1, '20', '1022', 1, '002'),
('PUL.402.3', 'PARU 402 - 3', '125000', 'Baik', 'LANTAI 4', '014', '402', 'ri', 1, '20', '1022', 1, '002'),
('PUL.402.4', 'PARU 402 - 4', '125000', 'Baik', 'LANTAI 4', '014', '402', 'ri', 1, '20', '1022', 1, '002'),
('PUL.403.1', 'PARU 403 - 1', '125000', 'Baik', 'LANTAI 4', '014', '403', 'ri', 1, '20', '1022', 1, '001'),
('PUL.403.2', 'PARU 403 - 2', '125000', 'Baik', 'LANTAI 4', '014', '403', 'ri', 1, '20', '1022', 1, '001'),
('PUL.418.1', 'PARU 418 - 1', '125000', 'Baik', 'LANTAI 4', '014', '418', 'ri', 1, '20', '1022', 1, '003'),
('PUL.418.2', 'PARU 418 - 2', '125000', 'Baik', 'LANTAI 4', '014', '418', 'ri', 1, '20', '1022', 1, '003'),
('PUL.418.3', 'PARU 418 - 3', '125000', 'Baik', 'LANTAI 4', '014', '418', 'ri', 1, '20', '1022', 1, '003'),
('PUL.418.4', 'PARU 418 - 4', '125000', 'Baik', 'LANTAI 4', '014', '418', 'ri', 1, '20', '1022', 1, '003'),
('PUL.419.1', 'PARU 419 - 1', '125000', 'Baik', 'LANTAI 4', '014', '419', 'ri', 1, '20', '1022', 1, '002'),
('PUL.419.2', 'PARU 419 - 2', '125000', 'Baik', 'LANTAI 4', '014', '419', 'ri', 1, '20', '1022', 1, '002'),
('PUL.419.3', 'PARU 419 - 3', '125000', 'Baik', 'LANTAI 4', '014', '419', 'ri', 1, '20', '1022', 1, '002'),
('PUL.419.4', 'PARU 419 - 4', '125000', 'Baik', 'LANTAI 4', '014', '419', 'ri', 1, '20', '1022', 1, '002'),
('PUL.420.1', 'PARU 420 - 1', '175000', 'Baik', 'LANTAI 4', '014', '420', 'ri', 1, '20', '1022', 1, '001'),
('PUL.420.2', 'PARU 420 - 2', '175000', 'Baik', 'LANTAI 4', '014', '420', 'ri', 1, '20', '1022', 1, '001'),
('PUL.4IS.1', 'PARU 4 /RPK -1', '155000', 'Baik', 'LANTAI 4', '014', 'RPK1', 'ri', 1, '20', '1022', 1, '006'),
('PUL.4IS.2', 'PARU 4 /RPK -2', '155000', 'Baik', 'LANTAI 4', '014', 'RPK2', 'ri', 1, '20', '1022', 1, '006'),
('STR-AN-1', 'STROKE ANGGREK - 1', '475000', 'Baik', 'LANTAI 3', '015', NULL, 'ri', 0, '21', '1023', 1, '006'),
('STR-MA-1', 'STROKE MAWAR - 1', '155000', 'Baik', 'LANTAI 3', '015', '301S', 'ri', 1, '21', '1023', 1, '006'),
('STR-MA-2', 'STROKE MAWAR - 2', '155000', 'Baik', 'LANTAI 3', '015', '301S', 'ri', 1, '21', '1023', 1, '006'),
('STR-MA-3', 'STROKE MAWAR - 3', '155000', 'Baik', 'LANTAI 3', '015', '301S', 'ri', 1, '21', '1023', 1, '006'),
('STR-MA-4', 'STROKE MAWAR - 4', '155000', 'Baik', 'LANTAI 3', '015', '301S', 'ri', 1, '21', '1023', 1, '006'),
('STR-MA-5', 'STROKE MAWAR - 5', '155000', 'Baik', 'LANTAI 3', '015', '301S', 'ri', 1, '21', '1023', 1, '006'),
('STR-MA-6', 'STROKE MAWAR - 6', '125000', 'Baik', 'LANTAI 3', '015', NULL, 'ri', 0, '21', '1023', 1, '006'),
('STR-ME-1', 'STROKE MELATI - 1', '350000', 'Baik', 'LANTAI 3', '015', '302S', 'ri', 1, '21', '1023', 1, '006'),
('STR-ME-2', 'STROKE MELATI - 2', '350000', 'Baik', 'LANTAI 3', '015', '302S', 'ri', 1, '21', '1023', 1, '006');

-- --------------------------------------------------------

--
-- Table structure for table `tm_dokter`
--

CREATE TABLE `tm_dokter` (
  `id` int(11) NOT NULL,
  `namaDokter` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tm_dokter`
--

INSERT INTO `tm_dokter` (`id`, `namaDokter`) VALUES
(1, 'Dr. Guntoro, SpBP-RE(K)'),
(2, 'Dr. Budiman, SpBP-RE(K), MARS'),
(3, 'Dr. Harun Adam, SpB, SpBP-RE(K)'),
(4, 'Dr. Denny Irwansyah, Sp.BP-RE'),
(5, 'Dr. Anastasia Dessy Harsono, Sp.BP-RE'),
(6, 'Dr. Asrofi Sueb Surachman, SpBP-RE(K), MARS');

-- --------------------------------------------------------

--
-- Table structure for table `tm_user`
--

CREATE TABLE `tm_user` (
  `loginID` int(11) NOT NULL,
  `username` varchar(50) NOT NULL,
  `password` varchar(150) DEFAULT NULL,
  `unit` varchar(50) DEFAULT NULL,
  `id_role` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tm_user`
--

INSERT INTO `tm_user` (`loginID`, `username`, `password`, `unit`, `id_role`) VALUES
(1, 'admin', '2d1a331173d1e9631307cad9fb834b43', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `tm_video`
--

CREATE TABLE `tm_video` (
  `id` int(11) NOT NULL,
  `videoCode` varchar(15) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tm_video`
--

INSERT INTO `tm_video` (`id`, `videoCode`) VALUES
(1, 'SbD-r4Ohczc&fea');

-- --------------------------------------------------------

--
-- Table structure for table `tt_events`
--

CREATE TABLE `tt_events` (
  `id` int(11) NOT NULL,
  `nama_operator` varchar(50) NOT NULL,
  `deskripsi` text NOT NULL,
  `tgl_events` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tt_events`
--

INSERT INTO `tt_events` (`id`, `nama_operator`, `deskripsi`, `tgl_events`) VALUES
(1, 'dr Guntoro, SpBP-RE (K)', 'Moderator Cadangan acara Rapat Terpadu pada bulan Agustus 2017 mulai pukul 07.30 s/d 09.00', '2017-08-04'),
(3, 'dr Budiman, SpBP-RE (K), MARS', 'Moderator  acara Rapat Terpadu pada bulan Agustus 2017 mulai pukul 07.30 s/d 09.00', '2017-08-29'),
(4, 'dr Guntoro, SpBP-RE (K)', 'Perwira Pengawas Apel Bulan Agustus 2017', '2017-08-08'),
(5, 'seluruh konsulen, residen, dokter magang', 'Bakti Sosial Sunat Massal dalam rangka HUT RSPAD \r\ntempat : RSPAD Gatot Soebroto Jakarta', '2017-08-08'),
(8, 'dr. Budiman Sp.BP - RE', 'Moderator Cadangan acara Rapat Terpadu pada bulan Agustus 2017 mulai pukul 07.30 s/d 09.00', '2017-08-15'),
(9, 'dr Denny Irwansyah, SpBP-RE ', ' Bertugas sebagai Medical Chek Up (MCU) pada hari Rabu', '2017-09-06'),
(10, 'dr Guntoro, SpBP-RE (K)', 'Bertugas sebagai Medical Chek Up (MCU) Hari Sealsa', '2017-09-12'),
(11, 'dr Guntoro, SpBP-RE (K)', 'bertugas sebagai Cadangan Moderator acara rapat terpadu bulan september 2017', '2017-09-05'),
(12, 'dr Anastasia Dessy Harsono, SpBP-RE', 'Bertugas menghadiri laporan terpadu pad hari senin tgl 02 oktober 2017 pukul 07.30 s.d selesai bertempat di ruang Konferensi L.II / Pav. Kartika. ', '2017-10-02'),
(13, 'dr Anastasia Dessy Harsono, SpBP-RE', 'Bertugas menghadiri laporan terpadu pad hari selasa tgl 10 oktober 2017 pukul 07.30 s.d selesai bertempat di ruang Konferensi L.II / Pav. Kartika. ', '2017-10-10'),
(14, 'dr Anastasia Dessy Harsono, SpBP-RE', 'Bertugas menghadiri laporan terpadu pad hari Rabu tgl 18 oktober 2017 pukul 07.30 s.d selesai bertempat di ruang Konferensi L.II / Pav. Kartika. ', '2017-10-18'),
(15, 'dr Anastasia Dessy Harsono, SpBP-RE', 'Bertugas menghadiri laporan terpadu pad hari kamis tgl 26 oktober 2017 pukul 07.30 s.d selesai bertempat di ruang Konferensi L.II / Pav. Kartika. ', '2017-10-26'),
(16, 'dr Anastasia Dessy Harsono, SpBP-RE', 'Bertugas sebagai Medical Chek Up (MCU) pada hari selasa ', '2017-10-03'),
(17, 'dr Guntoro, SpBP-RE (K)', 'Bertugas sebagai Medical Chek Up (MCU) pada hari kamis', '2017-10-19'),
(18, 'dr Denny Irwansyah, SpBP-RE ', 'Bertugas sebagai Medical Chek Up (MCU) pada hari senin', '2017-10-30'),
(19, 'dr Anastasia Dessy Harsono, SpBP', 'Bertugas sebagai moderator laporan jaga pada hari jumat', '2017-10-20'),
(20, 'TIM DOKTER BEDAH PLASTIK', 'ONE DAY BEDAH PLASTIK : - 09.00 sd 10.30 Penjelasan kegiatan coass di bedah plastik Bibir Sumbing & Langit-langit ( dr guntoro )\r\n- 10.30 sd 11.30 Hypospadia ( dr budiman ); - 11.30 sd 12.30 Luka bakar ( dr anastasi )\r\n- 12.30 sd 14.00 pengenalan bedah plastik luka & penangannya ( dr anastasia )\r\n- 14.00 sd 15.00 fraktur wajah ( dr harun adam )', '2018-01-09'),
(21, 'dr Denny Irwansyah, SpBP-RE ', '- kegiatan mengajar coas tentang skill station ( teori ) pada hari kamis tgl 11 jan 2018 pikul 13.00 sd 15.00', '2018-01-11'),
(22, 'dr Guntoro, SpBP-RE (K)', 'bertugas menjadi PAWAS hari libur hari minggu', '2018-01-21'),
(23, 'dr Guntoro, SpBP-RE (K)', 'bertugas sebagai Cadangan PAWAS pada hari sabtu', '2018-01-13');

-- --------------------------------------------------------

--
-- Table structure for table `tt_konsul`
--

CREATE TABLE `tt_konsul` (
  `id` int(11) NOT NULL,
  `idDokter` int(5) DEFAULT NULL,
  `tglJaga` date DEFAULT NULL,
  `idDokterIGD` int(5) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tt_konsul`
--

INSERT INTO `tt_konsul` (`id`, `idDokter`, `tglJaga`, `idDokterIGD`) VALUES
(1, 1, '2018-02-05', NULL),
(2, 1, '2018-02-06', NULL),
(3, 1, '2018-02-07', NULL),
(4, 1, '2018-02-08', NULL),
(5, 1, '2018-02-09', NULL),
(6, 1, '2018-02-10', NULL),
(7, 1, '2018-02-11', NULL),
(8, 5, '2018-02-12', NULL),
(9, 5, '2018-02-13', NULL),
(10, 5, '2018-02-14', NULL),
(11, 5, '2018-02-15', NULL),
(12, 5, '2018-02-16', NULL),
(13, 5, '2018-02-17', NULL),
(14, 5, '2018-02-18', NULL),
(15, 6, '2018-02-19', NULL),
(16, 6, '2018-02-20', NULL),
(17, 6, '2018-02-21', NULL),
(18, 6, '2018-02-22', NULL),
(19, 6, '2018-02-23', NULL),
(20, 6, '2018-02-24', NULL),
(21, 6, '2018-02-25', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `tt_konsulenpoli`
--

CREATE TABLE `tt_konsulenpoli` (
  `id` int(11) NOT NULL,
  `nama_konsulen` varchar(50) DEFAULT NULL,
  `hari` varchar(50) DEFAULT NULL,
  `tgl_konsul` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tt_konsulenpoli`
--

INSERT INTO `tt_konsulenpoli` (`id`, `nama_konsulen`, `hari`, `tgl_konsul`) VALUES
(16, '6', 'Selasa, 20 Februari 2018', NULL),
(17, '2', 'Kamis, 22 Februari 2018', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `tt_operasi`
--

CREATE TABLE `tt_operasi` (
  `id` int(11) NOT NULL,
  `operator` varchar(50) DEFAULT NULL,
  `assop_spesialis` varchar(50) DEFAULT NULL,
  `assop_residence` varchar(50) DEFAULT NULL,
  `jenisOperasi` varchar(250) DEFAULT NULL,
  `tglOperasi` date DEFAULT NULL,
  `jamOperasi` time DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tt_operasi`
--

INSERT INTO `tt_operasi` (`id`, `operator`, `assop_spesialis`, `assop_residence`, `jenisOperasi`, `tglOperasi`, `jamOperasi`) VALUES
(1, '5', NULL, NULL, 'ny Dewi Kospita, 39 tahun, 5/2 diagnosis : Kontraktur wrist dx ; tindakan : release kontraktur ( Bius Umum ) Kamar II OK II  ', '2017-08-02', NULL),
(2, '1', NULL, NULL, 'Tn Moch Machin, 74 tahun , 4/2, Diagnosis : Ulkus DM Pedis Sin ; Tindakan : Debridement + Stsg,  ( Bius Umum ) Kamar II OK II', '2017-08-02', NULL),
(3, '4', NULL, NULL, 'Ny. Surimawarni, 67 tahun, 5/PU, Diagnosis :Ulkus Dekubitus GR 3  , Tindakan :Debridement + Tutup Defek, ( Bius Umum ) Kamar II OK II', '2017-08-02', NULL),
(4, '5', NULL, NULL, 'AN Ignasius Fransisco , 8 tahun, Baksos , Diagnosis : pro sirkumsisi, Tindakan : Sirkumsisi ( bius lokal )', '2017-08-02', NULL),
(5, '5', NULL, NULL, 'Cristoper Singarimba, 11 tahun, Baksos , Diagnosis : pro sirkumsisi, Tindakan : Sirkumsisi ( bius lokal )', '2017-08-02', NULL),
(6, '4', NULL, NULL, 'An Fairus Hafizh ,9 tahun, Diagnosis : pro sirkumsisi, Tindakan : Sirkumsisi ( bius lokal )', '2017-08-02', NULL),
(7, '2', NULL, NULL, 'KIKI SOFIAN, 21TAHUN, 6/PU, DIAGNOSIS : RUPTUR MAXILA, TINDAKAN : ORIF (BIUS UMUM)', '2017-08-04', NULL),
(8, '5', NULL, NULL, 'AHMAD CAHYA, 19 TAHUN, 4/PU, DIAGNOSIS : HEMANGIOMA BUCAL SIN , TINDAKAN :REKONTRUKSI LANJUT REDUKSI ( BIUS UMUM )', '2017-08-04', NULL),
(9, '4', NULL, NULL, 'JOE MARCEL , 12 TAHUN , BAKSOS, DIAGNOSIS : PRO SIRKUMSISI , TINDAKAN : SIRKUMSISI ( LOKAL )', '2017-08-04', NULL),
(10, '4', NULL, NULL, 'ARYA DIRGANTARA, 2 TAHUN, IKA, BAKSOS, DIAGNOSIS : LABIOGENATO PALATOSCHIZIS, TINDAKAN PALATOPLASTY ( BIUS UMUM ) ', '2017-08-07', NULL),
(11, '5', NULL, NULL, 'IBRAHIM GHIFARLY, 26 TH, 6/PU, DIAGNOSIS :FR CONDILER MANDIBULA SIN; TINDAKAN :REKONTRUKSI ORIF', '2017-08-09', NULL),
(12, '2', NULL, NULL, 'KARTIKA ANDITA, 24 TAHUN,2/PU, DIAGNOSIS :LUKA BAKAR 38%;TINDAKAN : DEBRIDEMENT +STSG,', '2017-08-09', NULL),
(13, '5', NULL, NULL, 'SITI AMINAH , 5 TH,IGD, DIAGNOSIS : ULKUS DM PEDIS DX, TINDAKAN : NECROTOMY DEBRIDEMENT ', '2017-08-09', NULL),
(14, '4', NULL, NULL, 'ADE DWI ANANDA, 51 TH, DIAGNOSIS : SOFT TISSUE TUMOR DIG IV MANUS DX, TINDAKAN :PRO EXCISI', '2017-08-09', NULL),
(15, '5', NULL, NULL, 'ANDRI IWASKHI, 26 THN, DIAGNOSIS : HEMATOME DIG I MANUS, TINDAKAN NAIL PLASTY', '2017-08-09', NULL),
(16, '2', NULL, NULL, 'ANITA LEISA, 68 TAHUN, 3/PU, DIAGNOSIS : GANGREN DM DIG 4 - 5, TINDAKAN : DEBRIDEMENT + AMPUTASI', '2017-08-11', NULL),
(17, '1', NULL, NULL, 'VIDA ALMAHYRA, 3 BLN, IKA, BPJS, DIAGNOSIS : LABIOSCHIZIS, TINDAKAN : PRO LABIOPLASTY', '2017-08-11', NULL),
(18, '4', NULL, NULL, 'OVIAR, 17 THN, IKA/1, DIAGNOSIS : KONTRAKTUR DIG 2-3 MANUS KIRI, TINDAKAN : RELEASE KONTRAKTUR ', '2017-08-11', NULL),
(19, '2', NULL, NULL, 'IWAN NUGROHO, 56 TAHUN , 2/PU, DIAGNOSIS : ABSES DM PEDIS DX, TINDAKAN : INSISI DRAINASE', '2017-08-18', NULL),
(20, '4', NULL, NULL, 'GERRY DANA, 12 TAHUN, BAKSOS, DIAGNOSIS : PRO SIRKUMSISI, TINDAKAN : SIRKUMSISI', '2017-08-18', NULL),
(21, '4', NULL, NULL, 'ARINA AQSARINI, 16 TAHUN. DIAGNOSIS : CLAVUS PEDIS, TINDAKAN : EXCISI CLAVUS', '2017-08-18', NULL),
(22, '1', NULL, NULL, 'DR ASROFI SURACHMAN , 55 TAHUN. DIAGNOSIS : NEVUS PIGMENTOSIS, TINDAKAN : EXCISI NEVUS', '2017-08-18', NULL),
(23, '6', NULL, NULL, 'An ILLiansyah Fachrial, 3 tahun, IKA/1 , Diagnosis :labioschizis,Tindakan : pro Labioplasty', '2017-08-21', NULL),
(24, '5', NULL, NULL, 'ROCKY SAMUEL SITUMEANG, 32 TAHUN, 4/2 DIAGNOSIS : MICROTIA, TINDAKAN : REKONTRUKSI', '2017-08-21', NULL),
(25, '3', NULL, NULL, 'KABUL SUBIANTO , 39 TAHUN, 6/2, DIAGNOSIS : POST TUTUP DEFEK DG ABDOMINAL FLAP , TINDAKAN : SEPARATI FLAP', '2017-08-21', NULL),
(26, '5', NULL, NULL, 'NY NURMALUM S, 53 TAHUN, LOKAL , DIAGNOSIS : ECTROPION EYE DX ET SIN , TINDAKAN : REKONTRUKSI', '2017-08-25', NULL),
(27, '3', NULL, NULL, 'KABUL SUBIANTO , 39 TAHUN, 6/2, DIAGNOSIS : DEHISENSI LUKA PASCA ABDOMINAL FLAP, TINDAKAN : JAHIT PRIMER DEBRIDEMENT', '2017-08-29', NULL),
(28, '2', NULL, NULL, 'ELIEZER GUSTAV, 25 TAHUN, DIAGNOSIS : ECTROPION PALPEBRA, TINDAKAN : REKONTRUKSI PALBERA INFERIOR ', '2017-08-29', NULL),
(29, '2', NULL, NULL, 'Virus ardika, 19 tahun, 4/2, diagnosis : cleft lip nose, tindakan : rekonstruksi dg cartilage graft', '2017-08-30', NULL),
(30, '1', NULL, NULL, 'taufik, 77 tahun, 5/2, diagnosis : basalioma pasca rekonstruksi dg flap, tindakan : separasi flap ( rekon flap th II )', '2017-08-30', NULL),
(31, '2', NULL, NULL, 'TOTO PRIYANTO, 25 TAHUN, 6/2, DIAGNOSIS : FR NASSAL, TINDAKAN : REDUKSI', '2017-08-31', NULL),
(32, '1', NULL, NULL, 'SUSANTI MAHARANI , 43 TAHUN, LOKAL, DIAGNOSIS : SOFT TISSUE TUMOR PHILTRUM, TINDAKAN : EXCISI', '2017-08-31', NULL),
(33, '5', NULL, NULL, 'YOSI EFENDI, 19 TAHUN, DIAGNOSIS : KISTA ATEROMA, TINDAKAN : EXCISI', '2017-08-31', NULL),
(34, '5', NULL, NULL, 'TAMARA OKTAFANI, 17 TAHUN, DIAGNOSIS : SOFT TISSUE TUMOR AURICULA DX, TINDAKAN : EXCISI', '2017-08-31', NULL),
(35, '4', NULL, NULL, 'marsudi, 54 tahun,lokal,diagnosis  : lipoma wajah , tindakan : excisi lipoma', '2017-09-11', NULL),
(36, '4', NULL, NULL, 'chiko pratama, 20 tahun, lokal , diagnosis : vulnus aricuka sin , tindakan : jahit primer', '2017-09-11', NULL),
(37, '1', NULL, NULL, 'tn ade, 55 tahun, diagnosis : luka bakar grade 2 - 3 62 %tbsa, tindakan : non excisional debridement', '2017-09-11', NULL),
(38, '2', NULL, NULL, 'rahayu maharani, 3 tahun, ika/1, diagnosis : fistel palatum pasca palatoplasty, tindakan : refair fistel , ', '2017-09-12', NULL),
(39, '1', NULL, NULL, 'ade s, 56 tahun, icu/2, diagnosis : luka bakar grade II - III 62 % tbsa , tindakan : debridement excisi tangensial, ', '2017-09-12', NULL),
(40, '1', NULL, NULL, 'arlodio putra, 17 tahun, ika/1, diagnosis : hemangioma regio mandibula, tindakan : excisi', '2017-09-13', NULL),
(41, '5', NULL, NULL, 'luneng linianti, 36 tahun, 6/2, diagnosis : kontraktur palfebra dx, tindakan : release kontraktur ftsg', '2017-09-13', NULL),
(42, '5', NULL, NULL, 'sri utami, 69 tahun, lokal, diagnosis : pharonichia, tindakan : ekstraksi kuku', '2017-09-13', NULL),
(43, '4', NULL, NULL, 'hadi kusuma, 52 tahun, diagnosis : neurofibroma pedis dx, tindakan : excisi', '2017-09-18', NULL),
(44, '4', NULL, NULL, 'wenny widjaja, 44 tahun, diagnosis : excisi luas + rekonstruksi joint bedah tumor', '2017-09-18', NULL),
(45, '4', NULL, NULL, 'SUTIKNO . 42 TAHUN, 2/PU, TINDAKAN : NON EXCISIONAL DEBRIDEMENT, DIAGNOSIS : LUKA BAKAR GR 24 % TBSA ', '2017-09-19', NULL),
(46, '4', NULL, NULL, 'woniati, 58 tahun, 5/pu, diagnosis : presure luka gr III sacrum, tindakan : debridement ', '2017-09-19', NULL),
(47, '5', NULL, NULL, 'kanaya putri, 3 bulan , ika/1, diagnosis : labiopalatoschizis komplit, tindakan : pro labioplasty', '2017-09-22', NULL),
(48, '5', NULL, NULL, 'edoard hanifah majid, 24 tahun, diagnosis : luka bakar     gr 2 ab 6 % tbsa , tindakan debridemen', '2017-09-22', NULL),
(49, '5', NULL, NULL, 'FEBRI, 17 TAHUN, IKA/1, DIAGNOSIS : FR NASSAL , TINDAKAN : CLOSE REDUCTION', '2017-09-26', NULL),
(50, '5', NULL, NULL, 'TEGAR, 15 TAHUN, 2/PU, DIAGNOSIS : LUKA BAKAR 18 % TBSA, TINDAKAN : DEBRIDEMENT', '2017-09-26', NULL),
(51, '5', NULL, NULL, 'DULLAH ROKHIM, 46 TAHUN, 2/PU, DIAGNOSIS : LUKA BAKAR GR 2-3 30 % TBSA', '2017-09-26', NULL),
(52, '4', NULL, NULL, 'yosa santosa, 23 tahun, 5/2, diagnosis : fr parasimpisi mandibila dx + fr mandibula sin, tindakan : orif mandibula + orif wire ', '2017-09-27', NULL),
(53, '5', NULL, NULL, 'joice cordile , 39 tahun, 5/2, diagnosis : post all plaf coly anterior, tindakan pro thining flap coly  ', '2017-09-27', NULL),
(54, '1', NULL, NULL, 'aisyah, 2 tahun, ika/1, diagnosis :labiognato palatoschizis unilateral sin, tindakan : labioplasty', '2017-10-10', NULL),
(55, '1', NULL, NULL, 'mondar bin anas, 47 tahun, 5/2, diagnosis : ulkus dm pedis sin, tindakan : pro excisi dm pedis sin graft', '2017-10-10', NULL),
(56, '5', NULL, NULL, 'aerlin bellvania ,  2 tahun, ika/1, diagnosis : lgp pasca labio dan palatoplasty, tindakan : fistel palatum bifid uvula + pro repair palatum & uvula', '2017-10-16', NULL),
(57, '1', NULL, NULL, 'arina asparini putri asrofi, 16 tahun, lokal,diagnosis : clavus residif plantar pedis sin, tindakan : excisi', '2017-10-18', NULL),
(58, '1', NULL, NULL, 'nurchyani, 32 tahun. 5/pu, diagnosis : fr mandibula, tindakan : orif', '2017-10-18', NULL),
(59, '1', NULL, NULL, 'sudaryati, binti samsuri, 53 tahun, 5 bedah, d/ neurofibromatosis, t/ excisi tumor pedis sin', '2017-10-18', NULL),
(60, '1', NULL, NULL, 'muhammad nur azis, 1 tahun, baksos, diagnosis : lgp unilateral, tindakan : pro palatoplasty', '2017-10-23', NULL),
(61, '3', NULL, NULL, 'siti rohani, 49 tahun, 5/pu, diagnosis : soft tissue tumor regio palpebra superior, tindakan : pro excisi', '2017-10-23', NULL),
(62, '3', NULL, NULL, 'deni minarto, 4 tahun, 1/pu, diagnosis : ulkus dm pedis dx, tindakan : debridement', '2017-10-23', NULL),
(63, '5', NULL, NULL, 'sutirah, 49 tahun, 4/pu,diagnosis : gangren pedis dm kruris, tindakan : amputasi trans femoral dx ', '2017-10-23', NULL),
(65, '5', NULL, NULL, 'eko sudarmoyo, 57 tahun, lokal, diagnosis : cyst atherom, tindakan : ekterpasi', '2017-10-26', NULL),
(66, '3', NULL, NULL, 'deni minarto, 47 tahun, 1/pu, diagnosis : ulkus dm pedis dx, tindakan : debridement', '2017-10-26', NULL),
(67, '2', NULL, NULL, 'Wahyu Tri Ramadhan. 13 tahun. 2 PU. diagnosis: luka bakar grade III 35% TBSA. Tindakan: Debridement + STSG', '2017-10-30', NULL),
(68, '2', NULL, NULL, 'DR APRISTIYAH DEVITA, 30 TAHUN, DIAGNOSIS, ASIMETRIS TULANG WAJAH, TINDAKAN : REKONSTRUKSI OS ZYGOMETON ', '2017-11-02', NULL),
(69, '5', NULL, NULL, 'afthan afrik , baksos, ika/1 , diagnosis : lgp, tindakan : ABG', '2017-11-06', NULL),
(70, '6', NULL, NULL, 'yahni, 48 tahun,6/pu, diagnosis : ulkus dm pedis et cruris sin , tindakan : debridement + stsg', '2017-11-06', NULL),
(71, '4', NULL, NULL, 'Tn Sutomo, 71 th, 1PU. diagnosis: gangrene pedis dex + PAD. tindakan: amputasi below the knee', '2017-11-08', NULL),
(72, '4', NULL, NULL, 'SABRINA TUZAHRA, 9 TAHUN, IKA/1 DIAGNOSIS : HEMANGIOMA BUCCAEL DX, TINDAKAN EXCISI', '2017-12-13', NULL),
(73, '4', NULL, NULL, 'ROSNA LUBIS, 68 TAHUN, 5 BEDAH , DIAGNOSIS : BASALIOMA POST FLAP , TINDAKAN : FLAP VITAL ', '2017-12-13', NULL),
(74, '4', NULL, NULL, 'ROBERTUS DWI PRASETYO, 25 TAHUN , 5 BEDAH , DIAGNOSIS : EXCISI LUAS + EXPLORASI JOINT BEDAH DIGESTIVE + TUMOR', '2017-12-13', NULL),
(75, '3', NULL, NULL, 'Nn. Septi Dela N. 25 th. 5 B. Release Kontraktur Manus Bilateral', '2018-02-08', NULL),
(76, '3', NULL, NULL, 'Soni Hendrik, 39 th, Raw Surface Gluteal pasca wide excisi pro debridement + STSG', '2018-02-09', NULL),
(77, '2', NULL, NULL, 'Tn. Wening, 57 th, BPJS, Gangren DM dig I Pedis bil pro debridement', '2018-02-09', NULL),
(78, '1', NULL, NULL, 'Almahira Ardhani,  2 th, dx/ Fistel Palatum, Tx/ Repair Palatum', '2018-02-12', NULL),
(79, '4', NULL, NULL, 'Asri Puspitaningsih, 60 th, dx/ Kista Epidermoid, tx/ Ekstirpasi', '2018-02-12', NULL),
(80, '2', NULL, NULL, 'Tn. Zulkarnadin, 62 th, Ulkus pedis Dex pro debridement', '2018-02-23', NULL),
(81, '2', NULL, NULL, 'Tn. Feri Pramudya, 18 th, fr. Nasal pro Reduksi Nasal', '2018-02-23', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `tt_parade_pasien`
--

CREATE TABLE `tt_parade_pasien` (
  `id` int(11) NOT NULL,
  `nama_pasien` varchar(60) DEFAULT NULL,
  `diagnostik` text,
  `rencana_tindakan` text
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `tt_pasien`
--

CREATE TABLE `tt_pasien` (
  `id` int(11) NOT NULL,
  `nama_pasien` varchar(50) DEFAULT NULL,
  `id_ruangan` varchar(50) DEFAULT NULL,
  `diagnostik` text,
  `tgl_masuk` date DEFAULT NULL,
  `tgl_pulang` date DEFAULT NULL,
  `jam_operasi` time DEFAULT NULL,
  `id_rs` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tt_pasien`
--

INSERT INTO `tt_pasien` (`id`, `nama_pasien`, `id_ruangan`, `diagnostik`, `tgl_masuk`, `tgl_pulang`, `jam_operasi`, `id_rs`) VALUES
(3, 'Ny. Dintje, 62 th,', '5 PU', ' Dpjp dr. Harun spBP. Ulkus dexubitus grade 3 regio sacrum dengan Hypoglikemia ec DM. Rencana rawat luka dgn burnazin,pro debridement bila kondisi umum baik.', NULL, NULL, NULL, 1),
(7, 'Tn Burhanudin, 37 th', '1 PU', 'Dpjp dr. budiman spBP Luka bakar grade 3 4% tbsa et regio pedis et cruris pasca debridement.\r\nTerapi perawatan luka dengan madu, rencana tutup defek dengan stsg', NULL, NULL, NULL, 1),
(13, 'Tn, Coki, 54 th', 'ICU', 'DPJP dr. Anastasia, SpBP. Luka bakar gr 2-3 36% TBSA a/r wajah, ekstremitas atas, bawah * afebris, RR 24x/mnt, on ETT, PSV mode, FiO2 40% PEEP 5. TD 122/76 mmHg, N 106 bpm. SaO2 100% * DPO dalam miloz 2 mg * SL: luka bakar tertutup kasa, rembesan minimal', NULL, NULL, NULL, 1),
(14, 'Tn. Deden, 48 th', '5 B', 'DPJP dr Anastasia, SpBP * raw surface a/r cruris dextra pasca fasciotomi dengan riwayat open fracture tibia fibula Gutillo Anderson IIIc dengan ruptur total arteri vena femoralis hingga tibialis posterior * pro debridement dan STSG', NULL, NULL, NULL, 1),
(15, 'Tn. Soedarman, 50 th', '6 PU', 'DPJP dr. Guntoro, SpBP * Gangren dorsum pedis sinistra dengan amputasi digiti 2-4 pedis sinistra * pro debridement hari ini', NULL, NULL, NULL, 1),
(16, 'Tn. Rachmadian, 21 th', '5 B', 'DPJP dr. Guntoro, SpBP * Fraktur mandibula dan ZMC sinistra + Hematopneumothorax dengan WSD * pro pemasangan archbar. ORIF plate dan screw.', NULL, NULL, NULL, 1),
(17, 'Tn. A. Djaelani, 55 th', '6 PU', 'DPJP dr. Guntoro, SpBP * Ulkus DM pedis sin dengan amputasi digiti 2-3 pedis dex dengan PAD * evaluasi bed luka untuk persiapan STSG', NULL, NULL, NULL, 1),
(18, 'Tn. Yusuf Kamil, 72 th', 'CICU', 'DPJP dr. Denny, SpBP * Abses terdrainase spontan dengan ulkus regio thoracolumbal + CHF functional class III + anemia, pasca debridement * kontak adekuat, on ETT, RR 20 x/mnt, spontan * TD 140/80 mmHg. HR 88 x/mnt * GCS E4M6V on ETT * SL: tampak ulkus regio trunkus posterior, slough berkurang dasar luka otot, eksudat ada. * rencana debridement 20/02/18', NULL, NULL, NULL, 1),
(19, 'Ny. Kristian, 56 th', '4 B', 'DPJP dr. Guntoro, SpBP * Ulkus dekubitus gr 3 a/r sacrum + pneumonia perbaikan * rawat luka dengan madu/hari, rencana homecare', NULL, NULL, NULL, 1),
(20, 'Ny. Maria, 65 th', '2 PU', 'DPJP dr Harun, SpBP * luka bakar 15% pedis bilateral dengan gangren DM pedis bilateral digiti 3-5 * GDS 245, albumin 2,6 * terapi saat ini regulasi gula darah dan koreksi albumin, persiapan debridement', NULL, NULL, NULL, 1),
(21, 'Ny. Riamin, 65 th', '2 PU', 'DPJP dr. Anastasia SpBP * ulkus dekubitus gr 2-3 cruris bilateral dengan ca mammae pasca wide excision dengan meta intracranial dan paru * terapi rawat luka dengan burnazin/hari', NULL, NULL, NULL, 1),
(22, 'An. Kenzou, 1 th', 'IKA', 'DPJP dr Asrofi, SpBP * Constriction band of right arm pasca release constriction band dan multiple z plasty * terapi post operatif * pertahankan backslap dan balutan', NULL, NULL, NULL, 1);

-- --------------------------------------------------------

--
-- Table structure for table `tt_rondebesar`
--

CREATE TABLE `tt_rondebesar` (
  `id` int(11) NOT NULL,
  `pimpinan` varchar(60) DEFAULT NULL,
  `nama_pasien` varchar(60) DEFAULT NULL,
  `tgl` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `ci_sessions`
--
ALTER TABLE `ci_sessions`
  ADD KEY `ci_sessions_timestamp` (`timestamp`);

--
-- Indexes for table `mst_rs`
--
ALTER TABLE `mst_rs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `name` (`name`),
  ADD KEY `group` (`group`);

--
-- Indexes for table `mst_ruangan`
--
ALTER TABLE `mst_ruangan`
  ADD PRIMARY KEY (`ruanganID`),
  ADD KEY `MASTER_RUANGAN_KODE_kode` (`ruanganID`) USING BTREE,
  ADD KEY `MASTER_RUANGAN_NAMA_nama` (`ruanganName`) USING BTREE,
  ADD KEY `id_ruang_tindakan` (`id_ruang_tindakan`),
  ADD KEY `rs` (`rs`),
  ADD KEY `active` (`active`),
  ADD KEY `priority` (`priority`);

--
-- Indexes for table `mst_tempat_tidur`
--
ALTER TABLE `mst_tempat_tidur`
  ADD PRIMARY KEY (`bedID`),
  ADD KEY `T_TIDUR_KODE_kode` (`bedID`) USING BTREE,
  ADD KEY `T_TIDUR_RUANGKD_ruangkd` (`ruanganID`) USING BTREE,
  ADD KEY `group` (`group`),
  ADD KEY `id_ruang_tindakan` (`id_ruang_tindakan`),
  ADD KEY `active` (`active`),
  ADD KEY `rs` (`rs`);

--
-- Indexes for table `tm_dokter`
--
ALTER TABLE `tm_dokter`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tm_user`
--
ALTER TABLE `tm_user`
  ADD PRIMARY KEY (`loginID`,`username`),
  ADD UNIQUE KEY `NC_Login_LoginName_Password_IsLocked_Status` (`username`) USING BTREE,
  ADD KEY `password` (`password`) USING BTREE;

--
-- Indexes for table `tm_video`
--
ALTER TABLE `tm_video`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tt_events`
--
ALTER TABLE `tt_events`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tt_konsul`
--
ALTER TABLE `tt_konsul`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tt_konsulenpoli`
--
ALTER TABLE `tt_konsulenpoli`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tt_operasi`
--
ALTER TABLE `tt_operasi`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tt_parade_pasien`
--
ALTER TABLE `tt_parade_pasien`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tt_pasien`
--
ALTER TABLE `tt_pasien`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tt_rondebesar`
--
ALTER TABLE `tt_rondebesar`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `tm_dokter`
--
ALTER TABLE `tm_dokter`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
--
-- AUTO_INCREMENT for table `tm_user`
--
ALTER TABLE `tm_user`
  MODIFY `loginID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `tt_events`
--
ALTER TABLE `tt_events`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;
--
-- AUTO_INCREMENT for table `tt_konsul`
--
ALTER TABLE `tt_konsul`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;
--
-- AUTO_INCREMENT for table `tt_konsulenpoli`
--
ALTER TABLE `tt_konsulenpoli`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;
--
-- AUTO_INCREMENT for table `tt_operasi`
--
ALTER TABLE `tt_operasi`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=82;
--
-- AUTO_INCREMENT for table `tt_parade_pasien`
--
ALTER TABLE `tt_parade_pasien`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `tt_pasien`
--
ALTER TABLE `tt_pasien`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;
--
-- AUTO_INCREMENT for table `tt_rondebesar`
--
ALTER TABLE `tt_rondebesar`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
