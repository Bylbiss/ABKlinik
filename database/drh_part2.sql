-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jul 04, 2026 at 07:39 AM
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
-- Database: `drh_part2`
--

-- --------------------------------------------------------

--
-- Table structure for table `admin`
--

CREATE TABLE `admin` (
  `id_admin` int(11) NOT NULL,
  `username` varchar(50) NOT NULL,
  `password` varchar(255) NOT NULL,
  `nama` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `admin`
--

INSERT INTO `admin` (`id_admin`, `username`, `password`, `nama`, `email`, `created_at`, `updated_at`) VALUES
(1, 'Bunciss', '$2a$10$/K2JsefPWDuQp5k8b2seZeHblmRNjrBHyNyJJ6e7Z/KVpjf5HoVBW', 'Bylbiss El Haqqie', 'bylbiss@gmail.com', '2026-04-29 05:47:55', '2026-05-26 02:14:08'),
(2, 'Ipeh', '$2a$10$hCKjp4WJ6gUtmD2lV7stlO/A6oOjRgYYhV3xEqEC3FTmpG7JUj5Si', 'Alifah Chairul Munawar', 'orangimut@gmail.com', '2026-04-29 06:03:06', '2026-05-17 06:41:23');

-- --------------------------------------------------------

--
-- Table structure for table `alergi_pet`
--

CREATE TABLE `alergi_pet` (
  `id_alergi` int(11) NOT NULL,
  `id_pet` int(11) NOT NULL,
  `id_obat` int(11) DEFAULT NULL,
  `nama_alergi` text DEFAULT NULL,
  `created_by_type` enum('pemilik','dokter') NOT NULL,
  `created_by_id` int(11) NOT NULL,
  `status` enum('usulan','terverifikasi') DEFAULT 'usulan',
  `verified_by` int(11) DEFAULT NULL,
  `verified_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `alergi_pet`
--

INSERT INTO `alergi_pet` (`id_alergi`, `id_pet`, `id_obat`, `nama_alergi`, `created_by_type`, `created_by_id`, `status`, `verified_by`, `verified_at`, `created_at`) VALUES
(1, 1, 1, 'Alergi amoksisilin', 'pemilik', 1, 'usulan', NULL, NULL, '2026-05-26 04:08:42'),
(2, 1, NULL, 'Alergi debu rumah', 'pemilik', 1, 'usulan', NULL, NULL, '2026-05-26 04:08:42'),
(3, 2, 11, 'Alergi enrofloksasin', 'dokter', 27, 'terverifikasi', 1, '2026-05-26 04:08:42', '2026-05-26 04:08:42'),
(4, 2, NULL, 'Alergi kacang', 'pemilik', 2, 'usulan', NULL, NULL, '2026-05-26 04:08:42'),
(5, 3, 5, 'Alergi salep luka', 'pemilik', 3, 'usulan', NULL, NULL, '2026-05-26 04:08:42'),
(6, 3, NULL, 'Alergi jerami', 'dokter', 36, 'terverifikasi', 1, '2026-05-26 04:08:42', '2026-05-26 04:08:42'),
(7, 4, 71, 'Alergi ketokonazol', 'dokter', 102, 'terverifikasi', 2, '2026-05-26 04:08:42', '2026-05-26 04:08:42'),
(8, 4, NULL, 'Alergi serbuk sari', 'pemilik', 4, 'usulan', NULL, NULL, '2026-05-26 04:08:42'),
(9, 5, 10, 'Alergi amoksisilin powder', 'pemilik', 5, 'usulan', NULL, NULL, '2026-05-26 04:08:42'),
(10, 5, NULL, 'Alergi jagung', 'dokter', 18, 'terverifikasi', 1, '2026-05-26 04:08:42', '2026-05-26 04:08:42'),
(11, 6, 27, 'Alergi ivermectin pour-on', 'dokter', 56, 'terverifikasi', 1, '2026-05-26 04:08:42', '2026-05-26 04:08:42'),
(12, 6, NULL, 'Alergi rumput gajah', 'pemilik', 6, 'usulan', NULL, NULL, '2026-05-26 04:08:42'),
(13, 7, 95, 'Alergi prazikuantel', 'dokter', 99, 'terverifikasi', 1, '2026-05-26 04:08:42', '2026-05-26 04:08:42'),
(14, 7, NULL, 'Alergi kutu', 'pemilik', 7, 'usulan', NULL, NULL, '2026-05-26 04:08:42'),
(15, 8, 224, 'Alergi tetrasiklin oral powder', 'dokter', 60, 'terverifikasi', 2, '2026-05-26 04:08:42', '2026-05-26 04:08:42'),
(16, 8, NULL, 'Alergi kapas', 'pemilik', 8, 'usulan', NULL, NULL, '2026-05-26 04:08:42'),
(17, 9, 243, 'Alergi vitamin B12 oral', 'dokter', 52, 'terverifikasi', 1, '2026-05-26 04:08:42', '2026-05-26 04:08:42'),
(18, 9, NULL, 'Alergi wol', 'pemilik', 9, 'usulan', NULL, NULL, '2026-05-26 04:08:42'),
(19, 10, 238, 'Alergi kloramfenikol', 'dokter', 76, 'terverifikasi', 1, '2026-05-26 04:08:42', '2026-05-26 04:08:42'),
(20, 10, NULL, 'Alergi lateks', 'pemilik', 10, 'usulan', NULL, NULL, '2026-05-26 04:08:42'),
(21, 11, NULL, 'Alergi pisang', 'pemilik', 11, 'usulan', NULL, NULL, '2026-05-26 04:08:42'),
(22, 12, NULL, 'Alergi bulu ayam', 'pemilik', 12, 'usulan', NULL, NULL, '2026-05-26 04:08:42'),
(23, 13, NULL, 'Alergi air keruh', 'pemilik', 13, 'usulan', NULL, NULL, '2026-05-26 04:08:42');

-- --------------------------------------------------------

--
-- Table structure for table `chat`
--

CREATE TABLE `chat` (
  `id_chat` int(11) NOT NULL,
  `id_dokter` int(11) DEFAULT NULL,
  `id_pemilik` int(11) DEFAULT NULL,
  `pesan` text DEFAULT NULL,
  `waktu` timestamp NOT NULL DEFAULT current_timestamp(),
  `status_baca` enum('unread','read') DEFAULT 'unread',
  `pengirim` enum('dokter','pemilik') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `chat`
--

INSERT INTO `chat` (`id_chat`, `id_dokter`, `id_pemilik`, `pesan`, `waktu`, `status_baca`, `pengirim`) VALUES
(1, 13, 1, 'Selamat pagi dok, anak kucing saya yang bernama Milo (usia 2 tahun) sejak kemarin sore demam tinggi, tidak mau makan dan minum, lemas sekali. Apa yang harus saya lakukan?', '2026-05-26 03:02:35', 'read', 'pemilik'),
(2, 13, 1, 'Selamat pagi juga. Untuk demam pada kucing, bisa jadi infeksi. Coba ukur suhu tubuhnya jika memungkinkan. Apakah ada gejala lain seperti muntah atau diare?', '2026-05-26 03:03:33', 'read', 'dokter'),
(3, 13, 1, 'Tidak muntah atau diare dok, hanya lemas dan tidur terus. Saya coba ukur suhu pakai termometer, hasilnya 39,8 derajat.', '2026-05-26 03:03:48', 'read', 'pemilik'),
(4, 13, 1, 'Suhu di atas normal (38-39)', '2026-05-26 03:04:14', 'read', 'dokter'),
(5, 13, 1, 'Saya akan resepkan obat untuk Milo', '2026-05-26 03:05:37', 'read', 'dokter'),
(6, 13, 1, 'Baik dok, terimakasih', '2026-05-26 03:05:54', 'read', 'pemilik'),
(7, 27, 2, 'Dok, anjing saya Bobby (Golden Retriever, 3 tahun) diare sudah 2 hari, tinja cair bercampur lendir, kadang ada darah sedikit. Nafsu makan berkurang.', '2026-05-26 03:09:50', 'read', 'pemilik'),
(8, 27, 2, 'Wah, harus segera ditangani. Apakah sudah diberi obat atau makanan khusus? Jangan beri makanan dulu 12 jam, beri air putih yang cukup.', '2026-05-26 03:11:22', 'read', 'dokter'),
(9, 27, 2, 'Belum dok, saya takut salah kasih obat. Apakah bisa diberi oralit dulu?', '2026-05-26 03:11:38', 'read', 'pemilik'),
(10, 27, 2, 'Boleh, oralit untuk mencegah dehidrasi. Tapi solusi yang terbaik tetap periksa lebih dulu.', '2026-05-26 03:12:02', 'read', 'dokter'),
(11, 27, 2, 'Siap dok', '2026-05-26 03:12:18', 'read', 'pemilik'),
(12, 27, 2, 'Saya akan resepkan oralit dulu ya', '2026-05-26 03:12:33', 'read', 'dokter'),
(13, 36, 3, 'Halo dok, kelinci saya Kiko (Lop, 4 bulan) terluka di kaki belakang. Lukanya sekitar 1 cm, tampak basah dan sedikit bernanah. Saya sudah bersihkan dengan air garam, tetapi masih merah.', '2026-05-26 03:17:11', 'read', 'pemilik'),
(14, 36, 3, 'Halo, luka seperti itu rawan infeksi. Jangan gunakan air garam terlalu pekat. Gunakan antiseptik khusus hewan seperti povidone iodine yang diencerkan. Oleskan salep antibiotik setelah dibersihkan.', '2026-05-26 03:18:16', 'read', 'dokter'),
(15, 36, 3, 'Apakah perlu dibawa ke klinik dok?', '2026-05-26 03:18:25', 'read', 'pemilik'),
(16, 36, 3, 'Jika dalam 2 hari tidak membaik atau memburuk, segera bawa. Pantau apakah kelinci masih mau makan dan buang air besar normal.', '2026-05-26 03:18:40', 'read', 'dokter'),
(17, 36, 3, 'Baik dok, akan saya pantau. Terima kasih sarannya.', '2026-05-26 03:18:50', 'read', 'pemilik'),
(18, 102, 4, 'Dok, hamster saya Mochi (usia 3 bulan) tiba-tiba muntah 3 kali pagi ini. Biasanya dia aktif, sekarang diam saja. Saya beri makan pelet dan sayuran.', '2026-05-26 03:23:21', 'read', 'pemilik'),
(19, 102, 4, 'Muntah pada hamster bisa karena overeating, stres, atau infeksi. Cek apakah perutnya kembung. Jangan beri makan dulu 6 jam, beri air putih.', '2026-05-26 03:24:02', 'read', 'dokter'),
(20, 102, 4, 'Perutnya tidak kembung dok. Apakah bisa diberi obat mual manusia?', '2026-05-26 03:24:15', 'read', 'pemilik'),
(21, 102, 4, 'Jangan pernah memberi obat manusia tanpa resep, bisa fatal.', '2026-05-26 03:24:35', 'read', 'dokter'),
(22, 102, 4, 'saya akan meresepkan obat untuk Mochi', '2026-05-26 03:24:45', 'read', 'dokter'),
(23, 102, 4, 'Oh baik dok', '2026-05-26 03:24:53', 'read', 'pemilik'),
(24, 18, 5, 'Dokter, ayam bangkok saya Joko (jantan, 1 tahun) bulunya rontok di bagian punggung, kulitnya terlihat kemerahan dan ada sisik-sisik putih. Apakah jamur?', '2026-05-26 03:29:17', 'read', 'pemilik'),
(25, 18, 5, 'Gejala seperti itu kemungkinan besar infeksi jamur (ringworm) atau tungau. Jangan menyentuh langsung karena bisa menular ke manusia. Segera pisahkan ayam tersebut dari yang lain.', '2026-05-26 03:30:02', 'read', 'dokter'),
(26, 18, 5, 'Saya sudah pisahkan dok. Obat apa yang tepat?', '2026-05-26 03:30:15', 'read', 'pemilik'),
(27, 18, 5, 'Saya akan resepkan salep antijamur seperti ketokonazol dan semprotan khusus unggas. Oleskan 2 kali sehari selama 7 hari. Juga berikan vitamin untuk meningkatkan daya tahan tubuh.', '2026-05-26 03:30:33', 'read', 'dokter'),
(28, 18, 5, 'Terima kasih banyak dok, saya tunggu resepnya.', '2026-05-26 03:30:43', 'read', 'pemilik'),
(29, 56, 6, 'Dok, kambing etawa saya Moyo (usia 2 tahun) batuk sudah seminggu. Batuknya kering, kadang berdahak. Nafsu makan turun, berat badan menurun.', '2026-05-26 03:34:23', 'read', 'pemilik'),
(30, 56, 6, 'Batuk berkepanjangan pada kambing bisa karena pneumonia, parasit paru, atau alergi. Apakah ada hewan lain yang sakit? Cek apakah ada cairan dari hidung.', '2026-05-26 03:35:07', 'read', 'dokter'),
(31, 56, 6, 'Hidungnya berair dok, bening kadang kehijauan. Kambing lain sehat.', '2026-05-26 03:35:19', 'read', 'pemilik'),
(32, 56, 6, 'Kemungkinan infeksi bakteri. Segera beri antibiotik spektrum luas seperti enrofloksasin sesuai dosis. Jika tidak membaik, lakukan foto rontgen.', '2026-05-26 03:35:39', 'read', 'dokter'),
(33, 56, 6, 'Untuk sementara saya resepkan obat terlebih dahulu ya', '2026-05-26 03:36:02', 'read', 'dokter'),
(34, 56, 6, 'Baik dok', '2026-05-26 03:36:09', 'read', 'pemilik'),
(35, 99, 7, 'Dok, sapi limosin saya (usia 4 tahun) gatal-gatal hebat. Menggesek-gesekkan badannya ke tembok, bulu rontok di beberapa bagian. Ada kutu besar yang terlihat.', '2026-05-26 03:38:42', 'read', 'pemilik'),
(36, 99, 7, 'Itu tanda serangan caplak atau kutu sapi. Segera semprot dengan insektisida yang mengandung permetrin atau ivermectin pour-on. Bersihkan kandang dan semprot desinfektan.', '2026-05-26 03:39:31', 'read', 'dokter'),
(37, 99, 7, 'Apakah ivermectin suntik lebih efektif?', '2026-05-26 03:39:46', 'read', 'pemilik'),
(38, 99, 7, 'Ivermectin suntik juga bagus, tapi pour-on lebih praktis untuk sapi besar. Suntik bisa untuk kasus berat. Saya rekomendasikan keduanya kombinasi, tapi konsultasi dulu dosisnya.', '2026-05-26 03:40:03', 'read', 'dokter'),
(39, 99, 7, 'Saya akan beli pour-on dulu.', '2026-05-26 03:40:21', 'read', 'pemilik'),
(40, 99, 7, 'Baik, saya akan meresepkan obat dahulu', '2026-05-26 03:40:41', 'read', 'dokter'),
(41, 60, 8, 'Dok, kerbau saya tiba-tiba kejang-kejang pagi ini, mulut berbusa, lalu jatuh. Sekarang sudah sadar tapi lemas. Sebelumnya sehat saja.', '2026-05-26 03:44:25', 'read', 'pemilik'),
(42, 60, 8, 'Kejang pada kerbau bisa disebabkan oleh hipokalsemia (kekurangan kalsium), tetanus, atau rabies. Apakah hewan sudah divaksin? Apakah ada luka di badan?', '2026-05-26 03:45:18', 'read', 'dokter'),
(43, 60, 8, 'Belum divaksin dok, memang rencana bulan depan. Tidak ada luka yang terlihat.', '2026-05-26 03:45:30', 'read', 'pemilik'),
(44, 60, 8, 'Segera beri injeksi kalsium glukonas 20% secara intravena perlahan. Jika tidak ada perbaikan, bawa ke klinik. Saya khawatir kemungkinan rabies, isolasi dulu.', '2026-05-26 03:45:43', 'read', 'dokter'),
(45, 60, 8, 'Baik dok, saya akan coba beri kalsium. Mohon doanya.', '2026-05-26 03:45:54', 'read', 'pemilik'),
(46, 76, 10, 'Dok, kuda saya ada benjolan kecil di bagian leher seperti kutil. Tidak sakit, tapi semakin besar. Bagaimana mengatasinya?', '2026-05-26 03:53:04', 'read', 'pemilik'),
(47, 76, 10, 'Benjolan itu bisa fibroma atau papilloma. Biasanya jinak, tapi bisa diangkat dengan operasi kecil. Jangan dipotong sendiri karena bisa infeksi.', '2026-05-26 03:54:05', 'read', 'dokter'),
(48, 76, 10, 'Apakah perlu biopsi?', '2026-05-26 03:54:14', 'read', 'pemilik'),
(49, 76, 10, 'Untuk amannya, lakukan biopsi dulu untuk memastikan bukan tumor ganas. Saya bisa lakukan pengangkatan sekaligus biopsi minggu depan.', '2026-05-26 03:54:30', 'read', 'dokter'),
(50, 76, 10, 'Siap dok, saya daftar dulu.', '2026-05-26 03:54:41', 'read', 'pemilik'),
(51, 7, 1, 'halo dok', '2026-05-26 08:50:42', 'read', 'pemilik'),
(52, 7, 1, 'saya mau periksain gembrot', '2026-05-26 08:50:52', 'read', 'pemilik'),
(53, 7, 1, 'iya gimana sakitnya?', '2026-05-26 08:51:12', 'read', 'dokter');

-- --------------------------------------------------------

--
-- Table structure for table `detail_biaya_offline`
--

CREATE TABLE `detail_biaya_offline` (
  `id_detail` int(11) NOT NULL,
  `id_antrean` int(11) NOT NULL,
  `nama_biaya` varchar(100) NOT NULL,
  `jumlah` int(11) DEFAULT 1,
  `harga_satuan` decimal(15,2) NOT NULL,
  `subtotal` decimal(15,2) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `detail_biaya_offline`
--

INSERT INTO `detail_biaya_offline` (`id_detail`, `id_antrean`, `nama_biaya`, `jumlah`, `harga_satuan`, `subtotal`, `created_at`) VALUES
(2, 28, 'Suntik Antibiotik', 1, 69000.00, 69000.00, '2026-05-26 04:55:11'),
(3, 29, 'Suntik mati', 1, 300000.00, 300000.00, '2026-05-26 08:53:17');

-- --------------------------------------------------------

--
-- Table structure for table `detail_resep`
--

CREATE TABLE `detail_resep` (
  `id_detail` int(11) NOT NULL,
  `id_resep` int(11) NOT NULL,
  `id_obat` int(11) NOT NULL,
  `takaran` varchar(50) NOT NULL,
  `jumlah` int(11) NOT NULL,
  `catatan` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `detail_resep`
--

INSERT INTO `detail_resep` (`id_detail`, `id_resep`, `id_obat`, `takaran`, `jumlah`, `catatan`) VALUES
(5, 7, 44, '1x2', 1, NULL),
(6, 8, 224, '1x1 sehari', 2, NULL),
(7, 9, 5, '3x1', 1, NULL),
(8, 10, 3, '1x1', 2, NULL),
(9, 11, 71, '1x2 setiap hari', 1, NULL),
(10, 12, 10, '1x1', 1, NULL),
(11, 13, 27, '2x1', 1, NULL),
(12, 14, 95, '2x1', 1, NULL),
(13, 15, 238, '2x1', 1, NULL),
(14, 16, 3, '2x1', 1, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `dokter`
--

CREATE TABLE `dokter` (
  `id_dokter` int(11) NOT NULL,
  `nama_depan` varchar(50) DEFAULT NULL,
  `nama_belakang` varchar(50) DEFAULT NULL,
  `username` varchar(50) NOT NULL,
  `password` varchar(255) NOT NULL,
  `email` varchar(100) NOT NULL,
  `alamat` text DEFAULT NULL,
  `no_hp` varchar(20) DEFAULT NULL,
  `spesialisasi` varchar(100) DEFAULT NULL,
  `lama_kerja_tahun` int(11) NOT NULL,
  `biaya_konsultasi` decimal(10,2) DEFAULT NULL,
  `spesies_hewan` text DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `dokter`
--

INSERT INTO `dokter` (`id_dokter`, `nama_depan`, `nama_belakang`, `username`, `password`, `email`, `alamat`, `no_hp`, `spesialisasi`, `lama_kerja_tahun`, `biaya_konsultasi`, `spesies_hewan`, `created_at`, `updated_at`) VALUES
(1, 'Aidan', 'Elvano Pratama', 'aidan1', '$2a$10$F9CqA0F6BtRZSgeLcdeYGOqQ.jh42403FrpIqOhQM/xatArxaYVIu', 'aidan.elvanopratama@abpaw.com', 'Jl. Kaliurang Km 5', '081234567890', 'Dokter Umum', 0, 215000.00, 'ikan, burung, domba', '2026-04-29 00:50:57', '2026-05-26 04:05:05'),
(2, 'Keano', 'Alfarez Julian', 'keano2', '$2a$10$rnYMtFzDkEyk2Hixhy/VjONJJnLNhNGkegSbhhteCqzjpdQ4eWkBy', 'keano.alfarezjulian@abpaw.com', 'Jl. Malioboro No.12', '082345678901', 'Spesialis Penyakit Dalam', 0, 100000.00, 'ayam, kambing, kuda, kura-kura, hamster', '2026-04-29 00:50:57', '2026-05-26 04:05:05'),
(3, 'Zayden', 'Khalish Mahatma', 'zayden3', '$2a$10$nY5otvQ2BgeTKrH5108ja.GwY539l16PixFHaN1zPZsGEYuU4uOL.', 'zayden.khalishmahatma@abpaw.com', 'Jl. Gejayan No.45', '083456789012', 'Spesialis Gigi', 0, 90000.00, 'landak, sapi, musang, domba, hamster', '2026-04-29 00:50:57', '2026-05-26 04:05:05'),
(4, 'Ghaisan', 'Kenzo', 'ghaisan4', '$2a$10$QJwsHdTmd/2Q4MgDXv2lde.2JRLwxjT1vPz06Js5WiPlePeMqpdOq', 'ghaisan.kenzo@abpaw.com', 'Jl. Parangtritis Km 6', '084567890123', 'Spesialis Parasitologi & Infeksi', 0, 75000.00, 'kuda, hamster, domba, musang, monyet', '2026-04-29 00:50:57', '2026-05-26 04:05:05'),
(5, 'Zayn', 'Alby Rajendra', 'zayn5', '$2a$10$3Y51H/K9fgVkxzU5mWgFc.3BPzxW4ooGQcgm3o3oqaAaVVX2tlO9G', 'zayn.albyrajendra@abpaw.com', 'Jl. Magelang Km 7', '085678901234', 'Spesialis Reproduksi', 0, 180000.00, 'kerbau, kambing, kuda', '2026-04-29 00:50:57', '2026-05-26 04:05:05'),
(6, 'Ahmad', 'Fauzi Hasan', 'ahmad6', '$2a$10$QhFNi51zJoHgvgFV46LWKuYCL9vliXBvhsxI9BNIrICoY/lVniCaW', 'ahmad.fauzihasan@abpaw.com', 'Jl. Wonosari Km 8', '086789012345', 'Spesialis Gigi', 0, 160000.00, 'ayam, kuda, kelinci, ikan', '2026-04-29 00:50:57', '2026-05-26 04:05:05'),
(7, 'Dewi', 'Kartika Sari', 'dewi7', '$2a$10$/nB7COhg2uhKyspc5PEHn.Ec7PM09GjLbju6keggbd/731o6Sbyby', 'dewi.kartikasari@abpaw.com', 'Jl. Imogiri Timur No.21', '087890123456', 'Spesialis Reproduksi', 0, 185000.00, 'hamster, musang, anjing, kerbau, kuda', '2026-04-29 00:50:57', '2026-05-26 04:05:05'),
(8, 'Eko', 'Prasetyo Wibowo', 'eko8', '$2a$10$7wg2r4qx6EZoOmdoveWLSuCLAkTNa2Ids9R.1sEzyZi/fdra5ENBC', 'eko.prasetyowibowo@abpaw.com', 'Jl. Bantul Km 9', '088901234567', 'Spesialis Parasitologi & Infeksi', 0, 75000.00, 'sapi, kambing, kelinci, burung, domba', '2026-04-29 00:50:57', '2026-05-26 04:05:05'),
(9, 'Fitria', 'Nur Aini', 'fitria9', '$2a$10$aEdQyD4ZlPEoKasXBRlcq.naYq2Pe95/g1dTsabNgRg.scky95fzO', 'fitria.nuraini@abpaw.com', 'Jl. Godean Km 4', '089012345678', 'Spesialis Parasitologi & Infeksi', 0, 185000.00, 'ikan, hamster, kerbau', '2026-04-29 00:50:57', '2026-05-26 04:05:05'),
(10, 'Gilang', 'Maulana Ibrahim', 'gilang10', '$2a$10$4v49Gc934oCVFiJ95yYWceI/eUx0bX.q.nm78KA5yH1p51UIeJuVG', 'gilang.maulanaibrahim@abpaw.com', 'Jl. Kaliurang Km 10', '081112223334', 'Spesialis Reproduksi', 0, 195000.00, 'kura-kura, monyet, kelinci', '2026-04-29 00:50:57', '2026-05-26 04:05:05'),
(11, 'Hani', 'Fadilah Zahra', 'hani11', '$2a$10$XmePlNB3B2P0MKbkLfNmG.ANE4z9E2fFi/UrNepuG0ISHwAWLe3r2', 'hani.fadilahzahra@abpaw.com', 'Jl. Malioboro No.22', '082223334445', 'Spesialis Penyakit Dalam', 0, 190000.00, 'babi, kelinci, domba, ayam', '2026-04-29 00:50:57', '2026-05-26 04:05:05'),
(12, 'Indra', 'Kusuma Wardhana', 'indra12', '$2a$10$DJ/6oktwwJx5hFpG7JRHE.2CKleYIqXC04VyO/o3ahfpI0C1sLi2G', 'indra.kusumawardhana@abpaw.com', 'Jl. Gejayan No.67', '083334445556', 'Dokter Umum', 0, 140000.00, 'monyet, kuda, burung, musang, ayam', '2026-04-29 00:50:57', '2026-05-26 04:05:05'),
(13, 'Joko', 'Susilo Adi', 'joko13', '$2a$10$uk57ALQeVGet1RiyM543J.b2EwQzW.g2u8VBTCqEt7VGQ.h65rPK.', 'joko.susiloadi@abpaw.com', 'Jl. Parangtritis Km 7', '084445556667', 'Spesialis Kulit', 0, 205000.00, 'sapi, kerbau, babi, kuda, kucing', '2026-04-29 00:50:57', '2026-05-26 04:05:05'),
(14, 'Kartika', 'Sari Dewi', 'kartika14', '$2a$10$pLCt83scckqJ66yogFbo5.gro.ehdZvQPvBd8T/MWkaBHqOWrVXLa', 'kartika.saridewi@abpaw.com', 'Jl. Magelang Km 5', '085556667778', 'Dokter Umum', 0, 75000.00, 'hamster, kambing, kuda, musang, domba', '2026-04-29 00:50:57', '2026-05-26 04:05:05'),
(15, 'Laksmi', 'Dewi Andini', 'laksmi15', '$2a$10$XzRyf53HVOrsgEkxm3F62O50NvbFdm11Zj/rb9Ee6B5D7I.QAhV4.', 'laksmi.dewiandini@abpaw.com', 'Jl. Wonosari Km 6', '086667778889', 'Spesialis Gigi', 0, 150000.00, 'hamster, kura-kura, ayam, musang', '2026-04-29 00:50:57', '2026-05-26 02:56:35'),
(16, 'Mila', 'Rahmawati Putri', 'mila16', '$2a$10$kxo1mfUBU8X5xsNGtT/7SOnML7n5QASAuEoyC7J7Vx6OeiErZcdSq', 'mila.rahmawatiputri@abpaw.com', 'Jl. Imogiri Barat No.10', '087778889990', 'Spesialis Reproduksi', 0, 160000.00, 'kerbau, landak, kura-kura, burung', '2026-04-29 00:50:57', '2026-05-26 04:05:05'),
(17, 'Nanda', 'Kurniawan Setiawan', 'nanda17', '$2a$10$8JNMErcJKJXTrpccjC8Dae33OnvIGtqwY062xKYvnNkUu38P4GYMu', 'nanda.kurniawansetiawan@abpaw.com', 'Jl. Bantul Km 10', '088889990001', 'Spesialis Reproduksi', 0, 120000.00, 'ayam, kuda, kucing, burung', '2026-04-29 00:50:57', '2026-05-26 04:05:05'),
(18, 'Olivia', 'Sari Puspita', 'olivia18', '$2a$10$auLWYr6ld3.DlHSAXV0zVuimIftA0Jn2WHDikE7lLtBj0ZcWKVaxq', 'olivia.saripuspita@abpaw.com', 'Jl. Godean Km 6', '089990001112', 'Spesialis Kulit', 0, 185000.00, 'kura-kura, kerbau, babi, ikan, ayam', '2026-04-29 00:50:57', '2026-05-26 04:05:05'),
(19, 'Putri', 'Ayu Lestari', 'putri19', '$2a$10$w4XgmKRQ9KGZL/QS5bjd5OXoC6bu.vr.Tcq4oWgWBPY8Mj/RI7hO6', 'putri.ayulestari@abpaw.com', 'Jl. Kaliurang Km 8', '081223344556', 'Dokter Umum', 0, 210000.00, 'burung, kerbau, kura-kura, monyet, ikan', '2026-04-29 00:50:57', '2026-05-26 04:05:05'),
(20, 'Qori', 'Hidayatullah Firdaus', 'qori20', '$2a$10$exsefGPbxpytlXL9BbzlgOIsQSqX7SAGsrin9Sz26YWBMJfYl0cny', 'qori.hidayatullahfirdaus@abpaw.com', 'Jl. Malioboro No.30', '082334455667', 'Spesialis Reproduksi', 0, 115000.00, 'ayam, kuda, kerbau, kambing', '2026-04-29 00:50:57', '2026-05-26 04:05:05'),
(21, 'Rina', 'Amelia Putri', 'rina21', '$2a$10$Dz2XjLAukV.0YA6NAxxLnu58tjztshb0ogYpgDoVONAjh4obntpdC', 'rina.ameliaputri@abpaw.com', 'Jl. Gejayan No.90', '083445566778', 'Spesialis Bedah', 0, 180000.00, 'musang, kuda, kura-kura', '2026-04-29 00:50:57', '2026-05-26 04:05:05'),
(22, 'Sari', 'Yuliana Safitri', 'sari22', '$2a$10$12jhcmIsg90Qnsxwy.8ZO.krU5m7o3wznyBSgWTFhz3BogbqYObFS', 'sari.yulianasafitri@abpaw.com', 'Jl. Parangtritis Km 5', '084556677889', 'Spesialis Penyakit Dalam', 0, 175000.00, 'kura-kura, kelinci, burung, kuda', '2026-04-29 00:50:57', '2026-05-26 04:05:05'),
(23, 'Teguh', 'Prasetyo Utomo', 'teguh23', '$2a$10$iqyj0t4.IiLHGAatXzv4iOKr5gqlu48IwGnf00eJSObEPSDez6eHS', 'teguh.prasetyoutomo@abpaw.com', 'Jl. Magelang Km 3', '085667788990', 'Dokter Umum', 0, 125000.00, 'sapi, kucing, landak, babi', '2026-04-29 00:50:57', '2026-05-26 04:05:05'),
(24, 'Umi', 'Kalsum Azizah', 'umi24', '$2a$10$WloUaNl2ij98PCZJ4qZLcegekjqC57Cge/gm61k6hhNuKo.s4zQwq', 'umi.kalsumazizah@abpaw.com', 'Jl. Wonosari Km 4', '086778899001', 'Spesialis Gigi', 0, 170000.00, 'landak, burung, babi, anjing', '2026-04-29 00:50:57', '2026-05-26 04:05:05'),
(25, 'Vina', 'Meliana Putri', 'vina25', '$2a$10$UTP1i2OqQgcjwHU43pR0T.7YBc2ql9expE8V3JxCkEISSa7/PL3oS', 'vina.melianaputri@abpaw.com', 'Jl. Imogiri Timur No.5', '087889900112', 'Spesialis Kulit', 0, 110000.00, 'ayam, ikan, kelinci', '2026-04-29 00:50:57', '2026-05-26 04:05:05'),
(26, 'Wawan', 'Setiawan Budi', 'wawan26', '$2a$10$lGQq18svUKWyvyjBDRUsxuEEbKHz9AlvHoZgu74ReZhvFRVzylTmu', 'wawan.setiawanbudi@abpaw.com', 'Jl. Bantul Km 11', '088990011223', 'Spesialis Kulit', 0, 100000.00, 'sapi, babi, ikan, kelinci', '2026-04-29 00:50:57', '2026-05-26 04:05:05'),
(27, 'Xenia', 'Ayu Kirana', 'xenia27', '$2a$10$V.lqq3OF6w0M/WHBYUQ4V.JxF..uOwlwCV4i6mJmz3xbY.IFr86xa', 'xenia.ayukirana@abpaw.com', 'Jl. Godean Km 7', '089001122334', 'Dokter Umum', 0, 115000.00, 'anjing, kambing, kerbau, ikan', '2026-04-29 00:50:57', '2026-05-26 04:05:05'),
(28, 'Yuni', 'Susilawati Indah', 'yuni28', '$2a$10$DY38jmfA1.8z8FtuhQ5JruyN2WRMeFfSRubbB5PDtQn6vMeUTUDI2', 'yuni.susilawatiindah@abpaw.com', 'Jl. Kaliurang Km 12', '081334455667', 'Spesialis Reproduksi', 0, 195000.00, 'babi, musang, anjing, kuda, ikan', '2026-04-29 00:50:57', '2026-05-26 04:05:05'),
(29, 'Zaki', 'Ahmad Firdaus', 'zaki29', '$2a$10$I18iuRTfpZ5altrm4s0dLuh60Ijj9jLjHDiFhHML.A0jvKvdeTUuK', 'zaki.ahmadfirdaus@abpaw.com', 'Jl. Malioboro No.40', '082445566778', 'Spesialis Parasitologi & Infeksi', 0, 105000.00, 'ikan, hamster, sapi', '2026-04-29 00:50:57', '2026-05-26 04:05:05'),
(30, 'Ani', 'Mardiana Wati', 'ani30', '$2a$10$NahgAqBiM1/FrNtKNGcYRuoMoxnWxomXVP.bY/w1qQRe5oSuuuwFC', 'ani.mardianawati@abpaw.com', 'Jl. Gejayan No.100', '083556677889', 'Spesialis Parasitologi & Infeksi', 0, 165000.00, 'anjing, kucing, sapi, babi, domba', '2026-04-29 00:50:57', '2026-05-26 04:05:05'),
(31, 'Ahmad', 'Rizki Maulana Syahputra', 'ahmad31', '$2a$10$baurfbm9BzNo3dACLFHFz.TtptSLvPA6UFFoMDQstxprYUNiGxlaG', 'ahmad.rizkimaulanasyahputra@abpaw.com', 'Jl. Parangtritis Km 9', '084667788990', 'Spesialis Reproduksi', 0, 135000.00, 'musang, ikan, sapi, domba, kucing', '2026-04-29 00:50:57', '2026-05-26 04:05:05'),
(32, 'Dewi', 'Lestari Ayu Ningsih', 'dewi32', '$2a$10$qfif1dGTNzu83XXtDvOO2uTpIN9js4s1DT7kMxI6MidREAOvpE9CO', 'dewi.lestariayuningsih@abpaw.com', 'Jl. Magelang Km 2', '085778899001', 'Spesialis Bedah', 0, 110000.00, 'sapi, kelinci, kuda, musang', '2026-04-29 00:50:57', '2026-05-26 04:05:05'),
(33, 'Eko', 'Budi Santoso Raharjo', 'eko33', '$2a$10$o.ZXyG7.XzyXTBf99nAu1OQimJ7v.d8zEZnTwyqKB/YeRAMasezd2', 'eko.budisantosoraharjo@abpaw.com', 'Jl. Wonosari Km 10', '086889900112', 'Dokter Umum', 0, 75000.00, 'burung, landak, anjing, kucing', '2026-04-29 00:50:57', '2026-05-26 04:05:05'),
(34, 'Fitri', 'Handayani Sari Utami', 'fitri34', '$2a$10$mMImXU5d8AJbVzoK52upI.zToObRuRcV3JLvdBnpfXAVYdCf9Duc6', 'fitri.handayanisariutami@abpaw.com', 'Jl. Imogiri Barat No.15', '087990011223', 'Spesialis Parasitologi & Infeksi', 0, 120000.00, 'kerbau, kelinci, kucing', '2026-04-29 00:50:57', '2026-05-26 04:05:05'),
(35, 'Gita', 'Puspita Ayu Lestari', 'gita35', '$2a$10$yG4amgG202.ZErmFXg//0eTzT.mnCS81JkZe8VVuzg1Jxjl7mPQOS', 'gita.puspitaayulestari@abpaw.com', 'Jl. Bantul Km 12', '088001122334', 'Spesialis Reproduksi', 0, 150000.00, 'ikan, kura-kura, domba, kerbau, babi', '2026-04-29 00:50:57', '2026-05-26 02:56:39'),
(36, 'Hadi', 'Prasetyo Wibowo Saputra', 'hadi36', '$2a$10$koduG/nTYIHzEbIdnJiDt.A/nXd7YaVwhikHnRWtsLct/XOXy1vbO', 'hadi.prasetyowibowosaputra@abpaw.com', 'Jl. Godean Km 8', '089112233445', 'Dokter Umum', 0, 165000.00, 'monyet, landak, kelinci, ayam', '2026-04-29 00:50:57', '2026-05-26 04:05:05'),
(37, 'Indah', 'Permata Sari Dewi', 'indah37', '$2a$10$h8JVAMjVPJp6IciiTEOMYOk.PAv0ryFcTuZjldA2hxBSQE.sggBfi', 'indah.permatasaridewi@abpaw.com', 'Jl. Kaliurang Km 15', '081556677889', 'Spesialis Reproduksi', 0, 165000.00, 'babi, musang, ikan, kuda', '2026-04-29 00:50:57', '2026-05-26 04:05:05'),
(38, 'Joko', 'Prasetyo Hadi Susilo', 'joko38', '$2a$10$vGhvtjhr/OjarJhqFINzD.6ukWtdTkYkqnxB9t91shyzdUq.PJCxu', 'joko.prasetyohadisusilo@abpaw.com', 'Jl. Malioboro No.50', '082667788990', 'Dokter Umum', 0, 105000.00, 'monyet, domba, kerbau, kuda', '2026-04-29 00:50:57', '2026-05-26 04:05:05'),
(39, 'Kartika', 'Ayu Dewi Lestari', 'kartika39', '$2a$10$gUlt7pThypVhVhCtD8KmVOY424EQPcq40T30PUlS.T8DgvtNDlmYy', 'kartika.ayudewilestari@abpaw.com', 'Jl. Gejayan No.120', '083778899001', 'Spesialis Kulit', 0, 95000.00, 'sapi, musang, burung', '2026-04-29 00:50:57', '2026-05-26 04:05:05'),
(40, 'Lina', 'Marlina Sari Puspita', 'lina40', '$2a$10$HVJyGr/sXjaYhJUYqtgktei04M0RRU9CxkwM9t44a6oc04704.9hW', 'lina.marlinasaripuspita@abpaw.com', 'Jl. Parangtritis Km 11', '084889900112', 'Spesialis Kulit', 0, 100000.00, 'musang, monyet, kucing, landak', '2026-04-29 00:50:57', '2026-05-26 04:05:05'),
(41, 'Mila', 'Nurul Aini Fadhilah', 'mila41', '$2a$10$BWLBmBM3pVr7BPrLovW1GupkRimIu7rSsqF.lOCGGQ.jVShbEwTn2', 'mila.nurulainifadhilah@abpaw.com', 'Jl. Magelang Km 6', '085990011223', 'Spesialis Gigi', 0, 135000.00, 'musang, ayam, ikan', '2026-04-29 00:50:57', '2026-05-26 04:05:05'),
(42, 'Nanda', 'Kurniawan Hadi Putra', 'nanda42', '$2a$10$tZX/fd17Cz3NLtBDi.TNNeYWVbq9h6CGgMS4w89hdo7mZLX6JbdFe', 'nanda.kurniawanhadiputra@abpaw.com', 'Jl. Wonosari Km 12', '086001122334', 'Spesialis Reproduksi', 0, 145000.00, 'ikan, kura-kura, musang, kambing, burung', '2026-04-29 00:50:57', '2026-05-26 04:05:05'),
(43, 'Olivia', 'Grace Michelle Tan', 'olivia43', '$2a$10$nxH22V0cjZlN6RkzdXQ/pOZ3r3QgROY08BMdNmyQ2azjIzdFXc59e', 'olivia.gracemichelletan@abpaw.com', 'Jl. Imogiri Timur No.8', '087112233445', 'Spesialis Gigi', 0, 110000.00, 'sapi, kuda, musang, kerbau, domba', '2026-04-29 00:50:57', '2026-05-26 04:05:05'),
(44, 'Putri', 'Aulia Ramadhani Sari', 'putri44', '$2a$10$bru.FpjT3vLgkDTSI1OXGe.HcqIz668NCEJ/4Oczv2V9Uvk2/eGy2', 'putri.auliaramadhanisari@abpaw.com', 'Jl. Bantul Km 13', '088223344556', 'Spesialis Penyakit Dalam', 0, 195000.00, 'kucing, musang, babi', '2026-04-29 00:50:57', '2026-05-26 04:05:05'),
(45, 'Qonita', 'Nur Hidayati Rahma', 'qonita45', '$2a$10$GapV9SpH8ccxpHAf9T6IMeHLfC1aVcOahJIBDFeywFEG12mRwRNna', 'qonita.nurhidayatirahma@abpaw.com', 'Jl. Godean Km 9', '089334455667', 'Spesialis Parasitologi & Infeksi', 0, 120000.00, 'ayam, kuda, monyet', '2026-04-29 00:50:57', '2026-05-26 04:05:05'),
(46, 'Rina', 'Amelia Putri Sari', 'rina46', '$2a$10$T/V/cxCur9PKBGLgRD2X/.GJ4oJF3WUMrl1cZhkzo8TOnHpk5p7De', 'rina.ameliaputrisari@abpaw.com', 'Jl. Kaliurang Km 20', '081667788990', 'Spesialis Reproduksi', 0, 85000.00, 'ikan, landak, kelinci', '2026-04-29 00:50:57', '2026-05-26 04:05:05'),
(47, 'Sari', 'Ayu Wulandari Pratiwi', 'sari47', '$2a$10$lZJoux.4N7OwkPIAxeTFver.bykcWTFYqtlJXakDwzXNXLnkJ7jjG', 'sari.ayuwulandaripratiwi@abpaw.com', 'Jl. Malioboro No.60', '082778899001', 'Spesialis Kulit', 0, 145000.00, 'monyet, musang, babi, domba, burung', '2026-04-29 00:50:57', '2026-05-26 04:05:05'),
(48, 'Teguh', 'Prasetyo Utomo Saputro', 'teguh48', '$2a$10$l5a8NPr/TFApDxhD2SLA8eN0M4GOswaRyQCqmWJNaFy1OcEX490Ji', 'teguh.prasetyoutomosaputro@abpaw.com', 'Jl. Gejayan No.140', '083889900112', 'Spesialis Penyakit Dalam', 0, 95000.00, 'kambing, kuda, babi', '2026-04-29 00:50:57', '2026-05-26 04:05:05'),
(49, 'Umi', 'Kulsum Azizah Rahmawati', 'umi49', '$2a$10$en1JQcz3Zic6d6W1016X4.vGREYBRmGv8V7w370cB/YSfXTe0K.0q', 'umi.kulsumazizahrahmawati@abpaw.com', 'Jl. Parangtritis Km 13', '084990011223', 'Spesialis Kulit', 0, 110000.00, 'kuda, kambing, ayam, domba, babi', '2026-04-29 00:50:57', '2026-05-26 04:05:05'),
(50, 'Vera', 'Meliana Putri Indah', 'vera50', '$2a$10$wY43I5G4/oaTa9SuiChkXO.2jx/95mBOwQY22CMl9zenlkItZ3NVK', 'vera.melianaputriindah@abpaw.com', 'Jl. Magelang Km 9', '085001122334', 'Spesialis Bedah', 0, 200000.00, 'anjing, monyet, ayam, kambing, kura-kura', '2026-04-29 00:50:57', '2026-05-26 04:05:05'),
(51, 'Wawan', 'Setiawan Budi Utomo', 'wawan51', '$2a$10$H38Em9xhbwoAhjTNDhc/feppvwmf5fmDPLjjw1/YXmDwd7IOaJ/VS', 'wawan.setiawanbudiutomo@abpaw.com', 'Jl. Wonosari Km 14', '086112233445', 'Spesialis Penyakit Dalam', 0, 150000.00, 'kura-kura, anjing, domba, musang', '2026-04-29 00:50:57', '2026-05-26 02:56:41'),
(52, 'Xander', 'Ahmad Fatin Wilopo', 'xander52', '$2a$10$dzhsf95nLLGjxHodIcjzpuBOPcm9U9DT1UpyCZCpwKKLlAZIB6rO.', 'xander.ahmadfatinwilopo@abpaw.com', 'Jl. Imogiri Barat No.20', '087223344556', 'Spesialis Penyakit Dalam', 0, 75000.00, 'kerbau, kelinci, monyet, domba, kucing', '2026-04-29 00:50:57', '2026-05-26 04:05:05'),
(53, 'Yuni', 'Susilawati Indah Permata', 'yuni53', '$2a$10$SBXtRe9Htm4nIuIShtZ3Je2jdMiuaxW7hpfcstbOxTRF/lLCs4p/O', 'yuni.susilawatiindahpermata@abpaw.com', 'Jl. Bantul Km 14', '088334455667', 'Spesialis Penyakit Dalam', 0, 160000.00, 'domba, kerbau, musang', '2026-04-29 00:50:57', '2026-05-26 04:05:05'),
(54, 'Zaskia', 'Adinda Meutia Hafsari', 'zaskia54', '$2a$10$PXwPN3FRSAxF0UrUtHc/iu7dd4qicCeoELTksul0ILTQnK6m9VHK6', 'zaskia.adindameutiahafsari@abpaw.com', 'Jl. Godean Km 10', '089445566778', 'Spesialis Parasitologi & Infeksi', 0, 195000.00, 'babi, kelinci, kambing', '2026-04-29 00:50:57', '2026-05-26 04:05:05'),
(55, 'Agus', 'Salim Nur Hasanudin', 'agus55', '$2a$10$1kGoRKijrGIS8xmzenMkSeytCT6qHNvbESd/Z9C1tkPa3bFU9elci', 'agus.salimnurhasanudin@abpaw.com', 'Jl. Kaliurang Km 18', '081778899001', 'Spesialis Reproduksi', 0, 125000.00, 'sapi, kambing, kucing', '2026-04-29 00:50:57', '2026-05-26 04:05:05'),
(56, 'Aneska', 'Zoya Raveena', 'aneska56', '$2a$10$LLnf2c4R9sGuGW494t8FIer1OhUVSicn7ocOtVhsqNaFZWR4S2LM2', 'aneska.zoyaraveena@abpaw.com', 'Jl. Kaliurang No. 45', '081234567891', 'Dokter Umum', 0, 125000.00, 'ayam, ikan, sapi, kambing', '2026-04-29 00:58:43', '2026-05-26 04:05:05'),
(57, 'Arisha', 'Yonna Tanu', 'arisha57', '$2a$10$p1pgCz.AEFcJ6XelLTw04.UElm19hD/jT5aQtN0AMclr3FC6GmT2m', 'arisha.yonnatanu@abpaw.com', 'Jl. Gejayan No. 12', '082345678912', 'Spesialis Bedah', 0, 175000.00, 'musang, kambing, kuda', '2026-04-29 00:58:43', '2026-05-26 04:05:05'),
(58, 'Alesha', NULL, 'alesha58', '$2a$10$f8PS3UrIGEMT0M.IS2oVK.8JGRwDjZs/frJhS0kZWVG.mU1vjsMhq', '', 'Jl. Colombo No. 78', '083456789123', 'Spesialis Kulit', 0, 135000.00, 'kuda, kucing, babi, kambing, anjing', '2026-04-29 00:58:43', '2026-05-26 04:05:05'),
(59, 'Aresha', 'Ravan Arabella', 'aresha59', '$2a$10$pmWzcItnQ4S7uYgXhsog7.YQxYHET5DbUaXqgYAufAOO5ysid/ldS', 'aresha.ravanarabella@abpaw.com', 'Jl. Magelang No. 56', '084567891234', 'Spesialis Gigi', 0, 210000.00, 'ikan, sapi, ayam, babi', '2026-04-29 00:58:43', '2026-05-26 04:05:05'),
(60, 'Abila', 'Rezfan Azkadina', 'abila60', '$2a$10$mF.CUrMRJ52rrsURo27Aeuuioz3HZWwpsuWYUCUnW5sdw2MT6kgk.', 'abila.rezfanazkadina@abpaw.com', 'Jl. Affandi No. 34', '085678912345', 'Dokter Umum', 0, 140000.00, 'landak, kerbau, ayam, ikan', '2026-04-29 00:58:43', '2026-05-26 04:05:05'),
(61, 'Aurora', 'Ridha Zetana', 'aurora61', '$2a$10$K2TGiWCoOyuFgqeJANwtIe5gzIvsbYNCfb/IQ4CQhARkH/Kyvymn2', 'aurora.ridhazetana@abpaw.com', 'Jl. Bantul No. 67', '086789123456', 'Spesialis Parasitologi & Infeksi', 0, 140000.00, 'burung, monyet, hamster, kambing', '2026-04-29 00:58:43', '2026-05-26 04:05:05'),
(62, 'Aariz', 'Abrar Maalik', 'aariz62', '$2a$10$dAHMzKhKWBk9sOfrcjnfF.ppeXwUElizr0F3Kll8AXWDtZtBlqQjC', 'aariz.abrarmaalik@abpaw.com', 'Jl. Seturan No. 89', '087891234567', 'Dokter Umum', 0, 205000.00, 'kelinci, kura-kura, anjing', '2026-04-29 00:58:43', '2026-05-26 04:05:05'),
(63, 'Abid', 'Azhar Mubarak', 'abid63', '$2a$10$GgJ95vguHP3cCpSZ.KVFluroOKyTqSJXFm1BC21IYzRhrl33IYDTK', 'abid.azharmubarak@abpaw.com', 'Jl. Babarsari No. 23', '088912345678', 'Spesialis Reproduksi', 0, 85000.00, 'anjing, ikan, hamster', '2026-04-29 00:58:43', '2026-05-26 04:05:05'),
(64, 'Adnan', 'Aiman Hafidz', 'adnan64', '$2a$10$.19Qrddk8Ub5uKvuKbIStuLVhLEZ2ht9A.zLNiVfKU2Nj7mSyvsDa', 'adnan.aimanhafidz@abpaw.com', 'Jl. Janti No. 45', '089123456789', 'Spesialis Gigi', 0, 195000.00, 'kura-kura, hamster, kerbau, kuda, ayam', '2026-04-29 00:58:43', '2026-05-26 04:05:05'),
(65, 'Aksa', 'Althaf Rafiqi', 'aksa65', '$2a$10$h7635j8VKjF7CaoKUFa8Euj/QRael.en/3yFTvNA1tV3BTcXaYkFC', 'aksa.althafrafiqi@abpaw.com', 'Jl. Ringroad Utara No. 12', '081234567890', 'Spesialis Reproduksi', 0, 200000.00, 'landak, kerbau, musang, domba', '2026-04-29 00:58:43', '2026-05-26 04:05:05'),
(66, 'Alif', 'Arsyad Ghazi', 'alif66', '$2a$10$4o/DbZtAajZyQ6ulQL0r3uuGFth5QHHSWPI6ebrii7fAS49/yOP26', 'alif.arsyadghazi@abpaw.com', 'Jl. Wates No. 34', '082345678901', 'Spesialis Penyakit Dalam', 0, 185000.00, 'kerbau, hamster, landak, monyet, sapi', '2026-04-29 00:58:43', '2026-05-26 04:05:05'),
(67, 'Athalla', 'Alfarizi Akbar', 'athalla67', '$2a$10$llqEYToMbW3dUYfTkgiiVu04A1ezDuwhDWuPocrGZvMKJAU01iHGq', 'athalla.alfariziakbar@abpaw.com', 'Jl. Godean No. 56', '083456789012', 'Spesialis Penyakit Dalam', 0, 95000.00, 'anjing, monyet, musang, hamster, sapi', '2026-04-29 00:58:43', '2026-05-26 04:05:05'),
(68, 'Azriel', 'Aqil Ibrahim', 'azriel68', '$2a$10$e5oPyKlwmKqAxRPj8GaDIO3iavokBB71SY7Ky7GIL/.8RnF25n9gu', 'azriel.aqilibrahim@abpaw.com', 'Jl. Parangtritis No. 78', '084567890123', 'Spesialis Penyakit Dalam', 0, 145000.00, 'babi, hamster, kambing, kura-kura', '2026-04-29 00:58:43', '2026-05-26 04:05:05'),
(69, 'Bagas', 'Dewantara Sakti', 'bagas69', '$2a$10$MSoGPNa82weCmHPSwd3CkO3TCtW1WskjDsSEAnaXJm0xm.oBxkxV6', 'bagas.dewantarasakti@abpaw.com', 'Jl. Imogiri No. 90', '085678901234', 'Spesialis Gigi', 0, 85000.00, 'musang, sapi, hamster, kuda', '2026-04-29 00:58:43', '2026-05-26 04:05:05'),
(70, 'Bagaskara', 'Aditya Nugraha', 'bagaskara70', '$2a$10$pbAZraau0mXMFiBirMfGR.53VRwdYChzDjDD.J/4/0d91dOsk63Um', 'bagaskara.adityanugraha@abpaw.com', 'Jl. Wonosari No. 11', '086789012345', 'Spesialis Parasitologi & Infeksi', 0, 200000.00, 'kura-kura, sapi, kuda, domba, babi', '2026-04-29 00:58:43', '2026-05-26 04:05:05'),
(71, 'Baldwin', 'Aditya Wardhana', 'baldwin71', '$2a$10$EBFRzsPKG..xUhdjnJra3OQ5xQhnJOP0//AShwiawtiqvZPzwrlmS', 'baldwin.adityawardhana@abpaw.com', 'Jl. Prambanan No. 22', '087890123456', 'Spesialis Bedah', 0, 80000.00, 'kelinci, sapi, ikan, kerbau', '2026-04-29 00:58:43', '2026-05-26 04:05:05'),
(72, 'Bara', 'Aditya Nugraha', 'bara72', '$2a$10$IIm.6OJSIHZf.7YkTHZi/.pgBzTB3B0MPEEnrrUhV0X3SNvqJejfu', 'bara.adityanugraha@abpaw.com', 'Jl. Raya Yogya-Solo No. 33', '088901234567', 'Spesialis Parasitologi & Infeksi', 0, 175000.00, 'monyet, kambing, ayam, kura-kura, hamster', '2026-04-29 00:58:43', '2026-05-26 04:05:05'),
(73, 'Barata', 'Wisnu Tama', 'barata73', '$2a$10$owIPXsE9XkNhQoyHU3S0Z.f9vroxa1.MdSYc7bmFKT/Bs4f/cLMUy', 'barata.wisnutama@abpaw.com', 'Jl. Raya Yogya-Magelang No. 44', '089012345678', 'Spesialis Gigi', 0, 125000.00, 'domba, babi, kerbau, ayam, kuda', '2026-04-29 00:58:43', '2026-05-26 04:05:05'),
(74, 'Baruna', 'Jagat Raya', 'baruna74', '$2a$10$7deepOKbLEwVLQAf.ekWo.F68imd4.M.KbrwZKp3yPy2X8hjclLFm', 'baruna.jagatraya@abpaw.com', 'Jl. Monjali No. 55', '081123456789', 'Spesialis Bedah', 0, 160000.00, 'ikan, domba, kelinci', '2026-04-29 00:58:43', '2026-05-26 04:05:05'),
(75, 'Bhisma', 'Yudha Pratama', 'bhisma75', '$2a$10$B9S8aoYnRx8V/ARU9M76k.1gQgeztaotOh5xE9QdCrEn9gPGyTg4G', 'bhisma.yudhapratama@abpaw.com', 'Jl. Sudirman No. 66', '082234567890', 'Spesialis Kulit', 0, 215000.00, 'hamster, monyet, kucing', '2026-04-29 00:58:43', '2026-05-26 04:05:05'),
(76, 'Bryan', 'Kenzo Pratama', 'bryan76', '$2a$10$vsaPNbbPR7QoLbwmeiMkWec/kgrCu3v2Sy8LWV.53dYvN0O1IIY8K', 'bryan.kenzopratama@abpaw.com', 'Jl. Malioboro No. 77', '083345678901', 'Spesialis Kulit', 0, 215000.00, 'anjing, kuda, landak, kucing', '2026-04-29 00:58:43', '2026-05-26 04:05:05'),
(77, 'Oded', 'Zhafran Athalla', 'oded77', '$2a$10$H5PoRRSwvBzFXmQsovfg3e.CztdH/Yjf5KkAC.ttYjZDYk8lqSI9u', 'oded.zhafranathalla@abpaw.com', 'Jl. Sosrowijayan No. 88', '084456789012', 'Spesialis Kulit', 0, 205000.00, 'ayam, domba, kucing', '2026-04-29 00:58:43', '2026-05-26 04:05:05'),
(78, 'Calvin', 'Alfarizi Pratama', 'calvin78', '$2a$10$4g6qPsOsiokC8IWqTW7mA.hYMr26hCMy4trWPQgDDYBjZXSuu90zS', 'calvin.alfarizipratama@abpaw.com', 'Jl. Pasar Kembang No. 99', '085567890123', 'Spesialis Bedah', 0, 170000.00, 'burung, kucing, monyet, landak', '2026-04-29 00:58:43', '2026-05-26 04:05:05'),
(79, 'Daniswara', 'Bagus Kaizen', 'daniswara79', '$2a$10$S.HYFTNBlVe4QsSICnpPGOU.F./bXG/hmzESC0jmlA0TSgrW4.4UO', 'daniswara.baguskaizen@abpaw.com', 'Jl. Taman Siswa No. 10', '086678901234', 'Spesialis Bedah', 0, 155000.00, 'kelinci, ikan, burung, sapi', '2026-04-29 00:58:43', '2026-05-26 04:05:05'),
(80, 'Ethan', 'Zayn Adrian', 'ethan80', '$2a$10$iDcja/rTdRxI8PpoBko2Su2nMvSmMZdj/V7GyiKiIFP0cR6aHCM8W', 'ethan.zaynadrian@abpaw.com', 'Jl. Cik Di Tiro No. 20', '087789012345', 'Spesialis Parasitologi & Infeksi', 0, 195000.00, 'ikan, burung, musang', '2026-04-29 00:58:43', '2026-05-26 04:05:05'),
(81, 'Fahreza', 'Zayn Hakim', 'fahreza81', '$2a$10$w2jX1UPNciSFV8VYVmJJ6.GGq2JapMaUBOiFW5cYILBctNFKp6jsS', 'fahreza.zaynhakim@abpaw.com', 'Jl. Prof. Dr. Sardjito No. 30', '088890123456', 'Spesialis Reproduksi', 0, 140000.00, 'kelinci, kambing, ayam', '2026-04-29 00:58:43', '2026-05-26 04:05:05'),
(82, 'Ghifari', 'Dzaki Faza', 'ghifari82', '$2a$10$vgLXKAf7PW0kfVGbCvoSmu8N1dNunFiJTNCGsC5FS7r9brLirRQRu', 'ghifari.dzakifaza@abpaw.com', 'Jl. KHA Dahlan No. 40', '089901234567', 'Spesialis Kulit', 0, 200000.00, 'anjing, musang, kerbau', '2026-04-29 00:58:43', '2026-05-26 04:05:05'),
(83, 'Harith', 'Rayyan Zahran', 'harith83', '$2a$10$1fdUtLmJt2OHl0IHJITKxeF1kUcc8F0kyL/qkl/iqvVdSyz0V.T72', 'harith.rayyanzahran@abpaw.com', 'Jl. Urip Sumoharjo No. 50', '081012345678', 'Dokter Umum', 0, 195000.00, 'ikan, kucing, ayam', '2026-04-29 00:58:43', '2026-05-26 04:05:05'),
(84, 'Irfan', 'Rizqi Abdullah', 'irfan84', '$2a$10$IoP2AA3QSHe5vOqqp5Xd1Ocbn1reE/KJT2f80UwHWOxCb7Z78Dx9e', 'irfan.rizqiabdullah@abpaw.com', 'Jl. Suryotomo No. 60', '082123456789', 'Spesialis Bedah', 0, 160000.00, 'burung, kambing, sapi, kucing, anjing', '2026-04-29 00:58:43', '2026-05-26 04:05:05'),
(85, 'Jonathan', 'Noah Ezra', 'jonathan85', '$2a$10$Gd7ytWL/jMPzf3.kypdqCOkXcNDj6Zqa6g4oBRSwKF4rI./MytY5K', 'jonathan.noahezra@abpaw.com', 'Jl. Mayor Suryotomo No. 70', '083234567890', 'Spesialis Parasitologi & Infeksi', 0, 135000.00, 'kura-kura, ayam, kelinci', '2026-04-29 00:58:43', '2026-05-26 04:05:05'),
(86, 'Kharis', 'Kaelan Aksa', 'kharis86', '$2a$10$XtYZxMGPHWbi6AIe9rIUsOcwkCLEmSG4LtDnxRtY4zlQdD4XPGTh.', 'kharis.kaelanaksa@abpaw.com', 'Jl. Brigjen Katamso No. 80', '084345678901', 'Spesialis Gigi', 0, 130000.00, 'hamster, kambing, kuda', '2026-04-29 00:58:43', '2026-05-26 04:05:05'),
(87, 'Luthfi', 'Rafi Alfarizi', 'luthfi87', '$2a$10$bBxEqjQaGf8UZcFcSyGTsOQ0yOi1nZplIgpqkVZ5qwaDLg5Nfi7pq', 'luthfi.rafialfarizi@abpaw.com', 'Jl. Kusumanegara No. 90', '085456789012', 'Spesialis Gigi', 0, 180000.00, 'sapi, burung, landak', '2026-04-29 00:58:43', '2026-05-26 04:05:05'),
(88, 'Milan', 'Alvaro Putra', 'milan88', '$2a$10$rwWf/ytAmCA.lFxHlOGSPOkykIPitJpNk5y1czmWovXZ5o9Mecnd6', 'milan.alvaroputra@abpaw.com', 'Jl. Adisucipto No. 100', '086567890123', 'Spesialis Penyakit Dalam', 0, 130000.00, 'burung, kuda, kucing, landak, ayam', '2026-04-29 00:58:43', '2026-05-26 04:05:05'),
(89, 'Nathaniel', 'Kaelan Satria', 'nathaniel89', '$2a$10$OohAvSorByr30gLiCyQ0W.0.x0XOXyYyf7tY8nNBPsLv7FMxkM/Xu', 'nathaniel.kaelansatria@abpaw.com', 'Jl. Laksda Adisucipto No. 110', '087678901234', 'Dokter Umum', 0, 190000.00, 'burung, kucing, hamster', '2026-04-29 00:58:43', '2026-05-26 04:05:05'),
(90, 'Prasetya', 'Dwipa Aji', 'prasetya90', '$2a$10$EWriO3V2pffNvomC4pCpd.UJzJumnnfmA7Q1GdRRneLdQIHZ5I47G', 'prasetya.dwipaaji@abpaw.com', 'Jl. Raya Janti No. 120', '088789012345', 'Spesialis Reproduksi', 0, 195000.00, 'domba, ayam, kucing, kerbau, kambing', '2026-04-29 00:58:43', '2026-05-26 04:05:05'),
(91, 'Qamil', 'Haikal Athala', 'qamil91', '$2a$10$Sw2YYpuJWJQ2u2NsDorfXuyPU2A1v3iAGPREy4bzuvbp13ho8Af9G', 'qamil.haikalathala@abpaw.com', 'Jl. Ringroad Selatan No. 130', '089890123456', 'Spesialis Parasitologi & Infeksi', 0, 180000.00, 'landak, musang, ikan', '2026-04-29 00:58:43', '2026-05-26 04:05:05'),
(92, 'Rayhan', 'Kaelan Narendra', 'rayhan92', '$2a$10$IfGkT2M8S93ORwB.M.5sAetnPi/pF6uKvZL83CZ9VyoGvZnowBx/W', 'rayhan.kaelannarendra@abpaw.com', 'Jl. Bantu No. 140', '081901234567', 'Spesialis Bedah', 0, 85000.00, 'domba, kuda, landak, anjing', '2026-04-29 00:58:43', '2026-05-26 04:05:05'),
(93, 'Syafiq', 'Rizky Ananda', 'syafiq93', '$2a$10$zo7BDUKOuUS8TvT2fXvX4eOC3kMIPIRmd.7MHV6KgEfPmPPo7P7Ry', 'syafiq.rizkyananda@abpaw.com', 'Jl. Gamping No. 150', '082012345678', 'Spesialis Gigi', 0, 120000.00, 'kerbau, monyet, sapi, kura-kura, musang', '2026-04-29 00:58:43', '2026-05-26 04:05:05'),
(94, 'Tegar', 'Bagaskara Wijaya', 'tegar94', '$2a$10$NTUikRWa8xnVUpFKCgV6U..HxKiYa3La1SMgqf/0fLRfIxkBg7F96', 'tegar.bagaskarawijaya@abpaw.com', 'Jl. Sagan No. 160', '083123456789', 'Spesialis Gigi', 0, 115000.00, 'kura-kura, monyet, ayam, domba', '2026-04-29 00:58:43', '2026-05-26 04:05:05'),
(95, 'Uzair', 'Faza Azzam', 'uzair95', '$2a$10$63MhcVjZPTBn0.DApUUQQ.ojVgC8irwGJzsfA8NKkJTkorPxOwrUC', 'uzair.fazaazzam@abpaw.com', 'Jl. C. Simanjuntak No. 170', '084234567890', 'Spesialis Kulit', 0, 145000.00, 'ikan, kura-kura, babi', '2026-04-29 00:58:43', '2026-05-26 04:05:05'),
(96, 'Vincent', 'Ethan Alvaro', 'vincent96', '$2a$10$aw2tt/QE4vTMWK0H9cJIIOA6zCLkoI9j.gEY/hDkzoAvyGPvu6l4a', 'vincent.ethanalvaro@abpaw.com', 'Jl. Gedong Kuning No. 180', '085345678901', 'Spesialis Kulit', 0, 160000.00, 'babi, hamster, kambing', '2026-04-29 00:58:43', '2026-05-26 04:05:05'),
(97, 'Warren', 'Kenzo Pratama', 'warren97', '$2a$10$5NtKJNiA0GzNNmT.OmnE6e8CsigFhqTZS16noQjLe/uythsNX07mm', 'warren.kenzopratama@abpaw.com', 'Jl. Ngadisuryan No. 190', '086456789012', 'Spesialis Parasitologi & Infeksi', 0, 145000.00, 'kambing, kerbau, hamster, ikan', '2026-04-29 00:58:43', '2026-05-26 04:05:05'),
(98, 'Yudhistira', 'Abhimanyu Arjuna', 'yudhistira98', '$2a$10$scyhLnHHSh2ipyFDyBkT6O1M.kChJ0b8ttEiXmSMy9pI7fcxzFIqC', 'yudhistira.abhimanyuarjuna@abpaw.com', 'Jl. Prawirotaman No. 200', '087567890123', 'Spesialis Parasitologi & Infeksi', 0, 165000.00, 'ayam, kuda, kerbau, kambing, monyet', '2026-04-29 00:58:43', '2026-05-26 04:05:05'),
(99, 'Zhian', 'Farras Arshakalif', 'zhian99', '$2a$10$jq3LCG2uJokz9RQJA5wV3e2oiOvrr4n8Dp.I0PFm.NObnYSXOo5kC', 'zhian.farrasarshakalif@abpaw.com', 'Jl. Tirtodipuran No. 210', '088678901234', 'Spesialis Kulit', 0, 170000.00, 'monyet, sapi, kambing', '2026-04-29 00:58:43', '2026-05-26 04:05:05'),
(100, 'Bylbiss', 'El Haqqie', 'bylbiss100', '$2a$10$f0ZHGtzeJ2OjiZRDBsG7I./N4KLEpofFSByTTAPBcyCaK9u9Bx4r2', 'bylbiss.elhaqqie@abpaw.com', 'Jl. Veteran No. 12', '088803178628', 'Spesialis Parasitologi & Infeksi', 0, 135000.00, 'kelinci, musang, anjing, hamster', '2026-04-29 00:58:43', '2026-05-26 04:05:05'),
(101, 'Alifah', 'Chairul Munawar', 'alifah101', '$2a$10$88nrQtxmyzHQeZJ5voADI.Jtrzb.wY0OYY6wxkBHx.joP3mg/UB8.', 'alifah.chairulmunawar@abpaw.com', 'Jl. Diponegoro No. 45', '081393706713', 'Spesialis Reproduksi', 0, 100000.00, 'kerbau, kelinci, kura-kura', '2026-04-29 00:58:43', '2026-05-26 04:05:05'),
(102, 'Risya', 'Rizqiyah Haryati', 'risya102', '$2a$10$1UxecYWsmRDiMVWBjjTPdu5mp0220eeN3.1qYq6oo8yt.KyvpKBQW', 'risya.rizqiyahharyati@abpaw.com', 'Jl. Ahmad Yani No. 78', '088803178628', 'Dokter Umum', 0, 160000.00, 'domba, kucing, hamster, kambing, kura-kura', '2026-04-29 00:58:43', '2026-05-26 04:05:05'),
(103, 'Agung', 'Dwi Ratna', 'agung103', '$2a$10$/gw2d5MUFuH4Zm3osUeWBuFLto/d3Q8PkGiK2DRC2bQVvHe7gbrcW', 'agung.dwiratna@abpaw.com', 'Jl. Gatot Subroto No. 33', '081393706713', 'Spesialis Parasitologi & Infeksi', 0, 130000.00, 'burung, musang, kuda, babi', '2026-04-29 00:58:43', '2026-05-26 04:05:05'),
(104, 'Hamim', 'Thohari', 'hamim104', '$2a$10$hT/KFRz4scds2/Ido2U3uu/gABNu2iMowz.XaAtRCKBAQxFB.kIm6', 'hamim.thohari@abpaw.com', 'Jl. Sudirman No. 90', '088803178628', 'Spesialis Penyakit Dalam', 0, 95000.00, 'kuda, burung, landak, hamster, anjing', '2026-04-29 00:58:43', '2026-05-26 04:05:05'),
(105, 'Siti', 'Azizah', 'siti105', '$2a$10$kExCRlJsE8S0qaNzsHJW8u4akf5L/GKkK1xQ14EVtKUc1LygfBY1K', 'siti.azizah@abpaw.com', 'Jl. Pahlawan No. 21', '081393706713', 'Spesialis Bedah', 0, 165000.00, 'kucing, burung, kelinci, musang', '2026-04-29 00:58:43', '2026-05-26 04:05:05'),
(106, 'Azza', 'Wulandari', 'azza106', '$2a$10$IH80sAPLXVuLVVQhTgatA.jzXf.7w8q4YxPABluyytQCwRta3sx8y', 'azza.wulandari@abpaw.com', 'Jl. Merdeka No. 55', '088803178628', 'Spesialis Gigi', 0, 170000.00, 'landak, kura-kura, kambing, musang', '2026-04-29 00:58:43', '2026-05-26 04:05:05'),
(107, 'Khusnul', 'Khuluq', 'khusnul107', '$2a$10$kOVI3378jVLWk707McnLkuzFdkowa9is01Y0jincA8XzTSo2KOS6K', 'khusnul.khuluq@abpaw.com', 'Jl. Kartini No. 17', '081393706713', 'Dokter Umum', 0, 125000.00, 'landak, kambing, domba', '2026-04-29 00:58:43', '2026-05-26 04:05:05'),
(108, 'Abid', 'Mustaauliya', 'abid108', '$2a$10$JwXk3P0XvBU84hcA5X6olu.eCviWUN7A1FU73kqJLU0.QGYaR7Meq', 'abid.mustaauliya@abpaw.com', 'Jl. Raya Bogor No. 66', '088803178628', 'Spesialis Penyakit Dalam', 0, 205000.00, 'monyet, ayam, kuda', '2026-04-29 00:58:43', '2026-05-26 04:05:05');

-- --------------------------------------------------------

--
-- Table structure for table `kupon`
--

CREATE TABLE `kupon` (
  `id_kupon` int(11) NOT NULL,
  `kode` varchar(50) NOT NULL,
  `deskripsi` varchar(255) DEFAULT NULL,
  `diskon_persen` decimal(5,2) NOT NULL,
  `diskon_maks` decimal(10,2) NOT NULL,
  `minimal_pembelian` decimal(10,2) NOT NULL,
  `berlaku_hingga` date NOT NULL,
  `aktif` tinyint(1) DEFAULT 1,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `kupon`
--

INSERT INTO `kupon` (`id_kupon`, `kode`, `deskripsi`, `diskon_persen`, `diskon_maks`, `minimal_pembelian`, `berlaku_hingga`, `aktif`, `created_at`) VALUES
(3, 'DISKON10', 'Diskon 10% s/d 50rb', 10.00, 50000.00, 100000.00, '2026-12-31', 1, '2026-05-26 02:38:11'),
(4, 'DISKON20', 'Diskon 20% s/d 100rb', 20.00, 100000.00, 200000.00, '2026-12-31', 1, '2026-05-26 02:38:11'),
(5, 'DISKON30', 'Diskon 30% s/d 150rb', 30.00, 150000.00, 300000.00, '2026-12-31', 1, '2026-05-26 02:38:11'),
(6, 'HEMAT5', 'Diskon 5% tanpa batas', 5.00, 0.00, 50000.00, '2026-12-31', 1, '2026-05-26 02:38:11'),
(7, 'PROMO15', 'Diskon 15% s/d 75rb', 15.00, 75000.00, 150000.00, '2026-12-31', 1, '2026-05-26 02:38:11'),
(8, 'NEWUSER', 'Diskon 50rb', 0.00, 50000.00, 100000.00, '2026-12-31', 1, '2026-05-26 02:38:11'),
(9, 'WELCOME', 'Diskon 25rb', 0.00, 25000.00, 50000.00, '2026-12-31', 1, '2026-05-26 02:38:11'),
(10, 'MERDEKA', 'Diskon 17%', 17.00, 100000.00, 170000.00, '2026-08-17', 1, '2026-05-26 02:38:11'),
(11, 'TIKTOK', 'Diskon 10rb', 0.00, 10000.00, 50000.00, '2026-12-31', 1, '2026-05-26 02:38:11'),
(12, 'SHOPEE', 'Diskon 20rb', 0.00, 20000.00, 100000.00, '2026-12-31', 1, '2026-05-26 02:38:11'),
(13, 'TOKOPEDIA', 'Diskon 15rb', 0.00, 15000.00, 75000.00, '2026-12-31', 1, '2026-05-26 02:38:11'),
(14, 'LAZADA', 'Diskon 25rb', 0.00, 25000.00, 125000.00, '2026-12-31', 1, '2026-05-26 02:38:11'),
(15, 'BLIBLI', 'Diskon 30rb', 0.00, 30000.00, 150000.00, '2026-12-31', 1, '2026-05-26 02:38:11'),
(16, 'JENIUS', 'Diskon 12%', 12.00, 60000.00, 200000.00, '2026-12-31', 1, '2026-05-26 02:38:11'),
(17, 'CIMB', 'Diskon 8%', 8.00, 40000.00, 100000.00, '2026-12-31', 1, '2026-05-26 02:38:11'),
(18, 'BCA', 'Diskon 10%', 10.00, 50000.00, 150000.00, '2026-12-31', 1, '2026-05-26 02:38:11'),
(19, 'MANDIRI', 'Diskon 10%', 10.00, 50000.00, 150000.00, '2026-12-31', 1, '2026-05-26 02:38:11'),
(20, 'BRI', 'Diskon 10%', 10.00, 50000.00, 150000.00, '2026-12-31', 1, '2026-05-26 02:38:11'),
(21, 'BNI', 'Diskon 10%', 10.00, 50000.00, 150000.00, '2026-12-31', 1, '2026-05-26 02:38:11'),
(22, 'DANAMON', 'Diskon 5%', 5.00, 25000.00, 100000.00, '2026-12-31', 1, '2026-05-26 02:38:11'),
(23, 'PERMATA', 'Diskon 5%', 5.00, 25000.00, 100000.00, '2026-12-31', 1, '2026-05-26 02:38:11'),
(24, 'MAYBANK', 'Diskon 7%', 7.00, 35000.00, 120000.00, '2026-12-31', 1, '2026-05-26 02:38:11'),
(25, 'HSBC', 'Diskon 7%', 7.00, 35000.00, 120000.00, '2026-12-31', 1, '2026-05-26 02:38:11'),
(26, 'CITIBANK', 'Diskon 9%', 9.00, 45000.00, 180000.00, '2026-12-31', 1, '2026-05-26 02:38:11'),
(27, 'UOB', 'Diskon 9%', 9.00, 45000.00, 180000.00, '2026-12-31', 1, '2026-05-26 02:38:11');

-- --------------------------------------------------------

--
-- Table structure for table `obat`
--

CREATE TABLE `obat` (
  `id_obat` int(11) NOT NULL,
  `nama_obat` varchar(100) NOT NULL,
  `deskripsi_obat` text DEFAULT NULL,
  `bentuk_obat` enum('tablet','kapsul','suntik','salep','cair') DEFAULT 'tablet',
  `harga` decimal(12,2) NOT NULL,
  `stok` int(11) NOT NULL DEFAULT 0,
  `stok_minimal` int(11) DEFAULT 5,
  `tgl_kadaluarsa` date DEFAULT NULL,
  `perlu_resep` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `obat`
--

INSERT INTO `obat` (`id_obat`, `nama_obat`, `deskripsi_obat`, `bentuk_obat`, `harga`, `stok`, `stok_minimal`, `tgl_kadaluarsa`, `perlu_resep`, `created_at`, `updated_at`) VALUES
(1, 'Amoksisilin Trihidrat', 'Antibiotik spektrum luas untuk infeksi saluran pernapasan dan kulit pada anjing & kucing', 'tablet', 125000.00, 245, 10, '2026-05-20', 1, '2026-05-13 11:23:53', '2026-05-13 11:23:53'),
(2, 'Amoksisilin Trihidrat 500 mg', 'Antibiotik untuk infeksi bakteri pada sapi dan kambing', 'kapsul', 210000.00, 98, 5, '2026-07-15', 1, '2026-05-13 11:23:53', '2026-05-13 11:23:53'),
(3, 'Amoksisilin Trihidrat suspensi', 'Suspensi oral untuk hewan kecil, rasa daging', 'cair', 175000.00, 155, 8, '2025-12-10', 1, '2026-05-13 11:23:53', '2026-05-26 08:57:07'),
(4, 'Amoksisilin injeksi', 'Injeksi intramuskular untuk demam dan metritis pada sapi', 'suntik', 325000.00, 67, 5, '2027-01-30', 1, '2026-05-13 11:23:53', '2026-05-13 11:23:53'),
(5, 'Amoksisilin salep luka', 'Salep topikal untuk infeksi luka pasca operasi', 'salep', 89000.00, 302, 15, '2026-09-12', 0, '2026-05-13 11:23:53', '2026-05-14 00:37:30'),
(6, 'Amoksisilin trihidrat 250 mg', 'Tablet kunyah untuk kucing, antibiotik oral', 'tablet', 98500.00, 203, 10, '2026-11-01', 1, '2026-05-13 11:23:53', '2026-05-13 11:23:53'),
(7, 'Amoksisilin sirup', 'Sirup antibiotik untuk anak anjing dan anak kucing', 'cair', 143000.00, 178, 12, '2027-02-18', 1, '2026-05-13 11:23:53', '2026-05-13 11:23:53'),
(8, 'Amoksisilin LA', 'Long acting suntik untuk infeksi sistemik pada ternak', 'suntik', 450000.00, 42, 5, '2026-04-22', 1, '2026-05-13 11:23:53', '2026-05-13 11:23:53'),
(9, 'Amoksisilin + Asam Klavulanat', 'Kombinasi untuk infeksi resisten pada hewan kesayangan', 'tablet', 289000.00, 134, 8, '2026-10-05', 1, '2026-05-13 11:23:53', '2026-05-13 11:23:53'),
(10, 'Amoksisilin powder', 'Serbuk larut untuk air minum ayam dan itik', 'cair', 99000.00, 409, 20, '2025-11-30', 0, '2026-05-13 11:23:53', '2026-05-26 03:42:59'),
(11, 'Enrofloksasin 10%', 'Antibiotik fluorokuinolon untuk infeksi saluran kemih dan pencernaan', 'suntik', 350000.00, 84, 5, '2026-06-14', 1, '2026-05-13 11:23:53', '2026-05-17 07:45:27'),
(12, 'Enrofloksasin tablet', 'Tablet untuk infeksi kulit kronis pada anjing', 'tablet', 167500.00, 214, 10, '2027-03-09', 1, '2026-05-13 11:23:53', '2026-05-13 11:23:53'),
(13, 'Enrofloksasin oral solution', 'Larutan oral untuk pengobatan kolibasilosis pada unggas', 'cair', 198000.00, 302, 15, '2025-09-25', 1, '2026-05-13 11:23:53', '2026-05-13 11:23:53'),
(14, 'Enrofloksasin kapsul', 'Kapsul untuk kucing dengan infeksi saluran pernapasan atas', 'kapsul', 189000.00, 121, 7, '2026-12-03', 1, '2026-05-13 11:23:53', '2026-05-13 11:23:53'),
(15, 'Enrofloksasin salep mata', 'Salep mata untuk konjungtivitis bakteri pada kucing dan anjing', 'salep', 124000.00, 97, 5, '2027-04-17', 0, '2026-05-13 11:23:53', '2026-05-13 11:23:53'),
(16, 'Enrofloksasin 5%', 'Suntik dosis rendah untuk anak sapi', 'suntik', 278000.00, 75, 5, '2026-08-19', 1, '2026-05-13 11:23:53', '2026-05-13 11:23:53'),
(17, 'Enrofloksasin 20% LA', 'Long acting untuk pengobatan BRD pada sapi potong', 'suntik', 590000.00, 33, 3, '2025-10-11', 1, '2026-05-13 11:23:53', '2026-05-13 11:23:53'),
(18, 'Enrofloksasin tetes telinga', 'Tetes telinga untuk otitis eksterna bakteri', 'cair', 87000.00, 256, 12, '2027-01-24', 0, '2026-05-13 11:23:53', '2026-05-13 11:23:53'),
(19, 'Enrofloksasin generik', 'Tablet generik untuk hewan ternak', 'tablet', 112000.00, 189, 10, '2026-09-30', 1, '2026-05-13 11:23:53', '2026-05-13 11:23:53'),
(20, 'Enrofloksasin injeksi veteriner', 'Injeksi steril untuk infeksi gram negatif', 'suntik', 412000.00, 51, 5, '2026-11-11', 1, '2026-05-13 11:23:53', '2026-05-13 11:23:53'),
(21, 'Ivermectin 1%', 'Antiparasit spektrum luas untuk kudis dan cacing pada sapi & kambing', 'suntik', 225000.00, 167, 8, '2027-02-05', 1, '2026-05-13 11:23:53', '2026-05-13 11:23:53'),
(22, 'Ivermectin oral paste', 'Pasta oral untuk kuda, pengobatan strongylus', 'cair', 345000.00, 62, 4, '2026-05-18', 1, '2026-05-13 11:23:53', '2026-05-13 11:23:53'),
(23, 'Ivermectin spot on', 'Spot on untuk kutu dan caplak pada anjing dan kucing', 'cair', 158000.00, 430, 20, '2026-12-29', 0, '2026-05-13 11:23:53', '2026-05-13 11:23:53'),
(24, 'Ivermectin tablet kunyah', 'Tablet rasa daging untuk pencegahan heartworm', 'tablet', 187500.00, 299, 15, '2027-03-15', 0, '2026-05-13 11:23:53', '2026-05-13 11:23:53'),
(25, 'Ivermectin 0.5%', 'Larutan topikal untuk pengobatan skabies pada kelinci', 'cair', 99000.00, 203, 10, '2026-07-07', 0, '2026-05-13 11:23:53', '2026-05-13 11:23:53'),
(26, 'Ivermectin injeksi 10 ml', 'Vial suntik untuk babi dan domba', 'suntik', 198000.00, 88, 5, '2025-11-20', 1, '2026-05-13 11:23:53', '2026-05-13 11:23:53'),
(27, 'Ivermectin pour-on', 'Pour-on untuk sapi perah, efektif melawan lalat dan caplak', 'cair', 475000.00, 44, 5, '2027-01-11', 1, '2026-05-13 11:23:53', '2026-05-26 03:42:10'),
(28, 'Ivermectin krim', 'Krim untuk kudis sarcoptic pada anjing', 'salep', 123000.00, 156, 8, '2026-09-14', 0, '2026-05-13 11:23:53', '2026-05-13 11:23:53'),
(29, 'Ivermectin 2%', 'Suntik konsentrat untuk kuda dan sapi', 'suntik', 529000.00, 29, 3, '2026-04-25', 1, '2026-05-13 11:23:53', '2026-05-13 11:23:53'),
(30, 'Ivermectin generik', 'Obat cacing broad spectrum untuk ayam kampung', 'cair', 67500.00, 512, 25, '2025-12-01', 0, '2026-05-13 11:23:53', '2026-05-13 11:23:53'),
(31, 'Metronidazol 250 mg', 'Antibiotik antiprotozoa untuk giardiasis pada anjing', 'tablet', 98000.00, 178, 10, '2026-10-20', 1, '2026-05-13 11:23:53', '2026-05-13 11:23:53'),
(32, 'Metronidazol suspensi', 'Suspensi oral untuk infeksi mulut dan gigi pada kucing', 'cair', 145000.00, 143, 7, '2027-04-03', 1, '2026-05-13 11:23:53', '2026-05-13 11:23:53'),
(33, 'Metronidazol injeksi', 'Suntik untuk abses hati pada sapi', 'suntik', 267000.00, 54, 5, '2026-06-09', 1, '2026-05-13 11:23:53', '2026-05-13 11:23:53'),
(34, 'Metronidazol kapsul', 'Kapsul untuk pengobatan periodontitis pada anjing', 'kapsul', 132000.00, 109, 6, '2025-09-17', 1, '2026-05-13 11:23:53', '2026-05-13 11:23:53'),
(35, 'Metronidazol salep', 'Salep untuk luka infeksi anaerob', 'salep', 79000.00, 221, 12, '2027-02-28', 0, '2026-05-13 11:23:53', '2026-05-13 11:23:53'),
(36, 'Metronidazol 500 mg', 'Dosis tinggi untuk diare berdarah pada kuda', 'tablet', 211000.00, 87, 5, '2026-12-12', 1, '2026-05-13 11:23:53', '2026-05-13 11:23:53'),
(37, 'Metronidazol Benzoil', 'Larutan palatable untuk anak anjing', 'cair', 168000.00, 192, 10, '2027-01-19', 1, '2026-05-13 11:23:53', '2026-05-13 11:23:53'),
(38, 'Metronidazol generik', 'Obat murah untuk ayam petelur', 'tablet', 55000.00, 398, 20, '2025-11-02', 0, '2026-05-13 11:23:53', '2026-05-13 11:23:53'),
(39, 'Metronidazol veteriner', 'Suntik untuk infeksi sistemik pada reptil', 'suntik', 324000.00, 34, 4, '2026-08-27', 1, '2026-05-13 11:23:53', '2026-05-13 11:23:53'),
(40, 'Metronidazol + Spiramycin', 'Kombinasi untuk infeksi campuran', 'kapsul', 278000.00, 67, 5, '2027-03-21', 1, '2026-05-13 11:23:53', '2026-05-13 11:23:53'),
(41, 'Doksisiklin HiklAt', 'Antibiotik tetrasiklin untuk ehrlichiosis dan borreliosis', 'tablet', 189000.00, 147, 8, '2026-05-11', 1, '2026-05-13 11:23:53', '2026-05-13 11:23:53'),
(42, 'Doksisiklin oral liquid', 'Larutan untuk mycoplasma pada unggas', 'cair', 212000.00, 210, 10, '2027-04-09', 1, '2026-05-13 11:23:53', '2026-05-13 11:23:53'),
(43, 'Doksisiklin injeksi', 'Suntik lambat untuk infeksi saluran pernapasan kucing', 'suntik', 410000.00, 41, 5, '2025-09-28', 1, '2026-05-13 11:23:53', '2026-05-13 11:23:53'),
(44, 'Doksisiklin kapsul', 'Kapsul untuk leptospirosis pada anjing', 'kapsul', 176500.00, 123, 7, '2026-11-17', 1, '2026-05-13 11:23:53', '2026-05-13 11:23:53'),
(45, 'Doksisiklin salep mata', 'Salep untuk keratokonjungtivitis pada sapi', 'salep', 99000.00, 184, 10, '2027-02-11', 0, '2026-05-13 11:23:53', '2026-05-13 11:23:53'),
(46, 'Doksisiklin 100 mg', 'Tablet dosis rendah untuk kucing', 'tablet', 134000.00, 275, 12, '2026-07-24', 1, '2026-05-13 11:23:53', '2026-05-13 11:23:53'),
(47, 'Doksisiklin monohidrat', 'Bubuk larut untuk air minum ayam', 'cair', 156000.00, 366, 15, '2025-12-15', 0, '2026-05-13 11:23:53', '2026-05-13 11:23:53'),
(48, 'Doksisiklin LA', 'Long acting untuk ternak domba', 'suntik', 498000.00, 28, 3, '2027-01-02', 1, '2026-05-13 11:23:53', '2026-05-13 11:23:53'),
(49, 'Doksisiklin generik', 'Obat tetrasiklin murah untuk babi', 'tablet', 89000.00, 401, 20, '2026-10-09', 0, '2026-05-13 11:23:53', '2026-05-13 11:23:53'),
(50, 'Doksisiklin krim', 'Krim topikal untuk infeksi kulit pada kuda', 'salep', 118000.00, 92, 5, '2025-11-18', 0, '2026-05-13 11:23:53', '2026-05-13 11:23:53'),
(51, 'Sefaleksin 500 mg', 'Antibiotik sefalosporin untuk infeksi kulit dan saluran kemih', 'kapsul', 215000.00, 132, 7, '2026-09-05', 1, '2026-05-13 11:23:53', '2026-05-13 11:23:53'),
(52, 'Sefaleksin tablet', 'Tablet untuk pioderma pada anjing', 'tablet', 198000.00, 164, 10, '2027-03-30', 1, '2026-05-13 11:23:53', '2026-05-13 11:23:53'),
(53, 'Sefaleksin suspensi', 'Suspensi rasa ayam untuk anak kucing', 'cair', 167000.00, 201, 12, '2026-06-18', 1, '2026-05-13 11:23:53', '2026-05-13 11:23:53'),
(54, 'Sefaleksin injeksi', 'Suntik untuk infeksi tulang pada sapi', 'suntik', 478000.00, 37, 4, '2025-10-07', 1, '2026-05-13 11:23:53', '2026-05-13 11:23:53'),
(55, 'Sefaleksin salep', 'Salep untuk abses kulit pada kelinci', 'salep', 103000.00, 155, 8, '2027-04-14', 0, '2026-05-13 11:23:53', '2026-05-13 11:23:53'),
(56, 'Sefaleksin 250 mg', 'Dosis kecil untuk kucing dan anjing kecil', 'kapsul', 154000.00, 198, 10, '2026-12-27', 1, '2026-05-13 11:23:53', '2026-05-13 11:23:53'),
(57, 'Sefaleksin sirup', 'Sirup untuk infeksi telinga pada anak anjing', 'cair', 188000.00, 117, 6, '2027-01-09', 1, '2026-05-13 11:23:53', '2026-05-13 11:23:53'),
(58, 'Sefaleksin generik', 'Obat murah untuk ayam pedaging', 'tablet', 87000.00, 378, 20, '2025-09-21', 0, '2026-05-13 11:23:53', '2026-05-13 11:23:53'),
(59, 'Sefaleksin LA', 'Long acting untuk pengobatan mastitis sapi', 'suntik', 589000.00, 22, 3, '2026-08-14', 1, '2026-05-13 11:23:53', '2026-05-13 11:23:53'),
(60, 'Sefaleksin tetes telinga', 'Tetes untuk otitis eksterna anjing', 'cair', 112000.00, 143, 8, '2026-11-04', 0, '2026-05-13 11:23:53', '2026-05-13 11:23:53'),
(61, 'Gentamisin sulfat', 'Antibiotik aminoglikosida untuk infeksi gram negatif', 'suntik', 295000.00, 86, 5, '2027-02-19', 1, '2026-05-13 11:23:53', '2026-05-13 11:23:53'),
(62, 'Gentamisin tetes mata', 'Tetes mata untuk konjungtivitis pada kuda', 'cair', 89000.00, 234, 12, '2026-05-29', 0, '2026-05-13 11:23:53', '2026-05-13 11:23:53'),
(63, 'Gentamisin salep kulit', 'Salep untuk infeksi luka bakar pada anjing', 'salep', 108000.00, 167, 10, '2027-03-07', 0, '2026-05-13 11:23:53', '2026-05-13 11:23:53'),
(64, 'Gentamisin krim', 'Krim untuk dermatitis pada kucing', 'salep', 97000.00, 189, 9, '2025-12-13', 0, '2026-05-13 11:23:53', '2026-05-13 11:23:53'),
(65, 'Gentamisin injeksi 100 mg', 'Vial suntik untuk sepsis pada anak sapi', 'suntik', 365000.00, 54, 5, '2026-09-22', 1, '2026-05-13 11:23:53', '2026-05-13 11:23:53'),
(66, 'Gentamisin tetes telinga', 'Tetes untuk otitis media pada kelinci', 'cair', 76000.00, 301, 15, '2027-01-26', 0, '2026-05-13 11:23:53', '2026-05-13 11:23:53'),
(67, 'Gentamisin + Betametason', 'Kombinasi dengan steroid untuk peradangan telinga', 'cair', 149000.00, 122, 7, '2026-10-10', 1, '2026-05-13 11:23:53', '2026-05-13 11:23:53'),
(68, 'Gentamisin generik', 'Suntik murah untuk unggas', 'suntik', 178000.00, 248, 15, '2025-11-08', 1, '2026-05-13 11:23:53', '2026-05-13 11:23:53'),
(69, 'Gentamisin salep mata', 'Salep steril untuk infeksi mata sapi', 'salep', 115000.00, 98, 5, '2026-07-31', 0, '2026-05-13 11:23:53', '2026-05-13 11:23:53'),
(70, 'Gentamisin oral', 'Larutan oral untuk infeksi saluran pencernaan (tidak umum)', 'cair', 199000.00, 43, 5, '2027-04-22', 1, '2026-05-13 11:23:53', '2026-05-13 11:23:53'),
(71, 'Ketokonazol salep', 'Antijamur untuk kurap (ringworm) pada anjing dan kucing', 'salep', 126000.00, 277, 12, '2026-08-08', 0, '2026-05-13 11:23:53', '2026-05-13 11:23:53'),
(72, 'Ketokonazol tablet', 'Tablet untuk infeksi jamur sistemik pada kucing', 'tablet', 234000.00, 135, 8, '2027-02-01', 1, '2026-05-13 11:23:53', '2026-05-13 11:23:53'),
(73, 'Ketokonazol sampo', 'Sampo antijamur untuk dermatitis Malassezia', 'cair', 189000.00, 212, 10, '2025-10-25', 0, '2026-05-13 11:23:53', '2026-05-13 11:23:53'),
(74, 'Ketokonazol krim', 'Krim untuk kandidiasis pada kuda', 'salep', 99000.00, 188, 10, '2026-12-19', 0, '2026-05-13 11:23:53', '2026-05-13 11:23:53'),
(75, 'Ketokonazol 200 mg', 'Tablet dosis untuk anjing besar', 'tablet', 267000.00, 79, 5, '2027-03-12', 1, '2026-05-13 11:23:53', '2026-05-13 11:23:53'),
(76, 'Ketokonazol suspensi', 'Suspensi oral untuk anak kucing', 'cair', 156000.00, 149, 8, '2026-06-05', 1, '2026-05-13 11:23:53', '2026-05-13 11:23:53'),
(77, 'Ketokonazol + Klorheksidin', 'Shampo kombinasi untuk kutu jamur', 'cair', 209000.00, 164, 10, '2025-09-14', 0, '2026-05-13 11:23:53', '2026-05-13 11:23:53'),
(78, 'Ketokonazol injeksi', 'Suntik untuk mikosis sistemik pada reptil', 'suntik', 487000.00, 25, 3, '2027-01-17', 1, '2026-05-13 11:23:53', '2026-05-13 11:23:53'),
(79, 'Ketokonazol generik', 'Salep murah untuk ternak kambing', 'salep', 68000.00, 402, 20, '2026-11-28', 0, '2026-05-13 11:23:53', '2026-05-13 11:23:53'),
(80, 'Ketokonazol 400 mg', 'Dosis tinggi untuk kuda', 'tablet', 345000.00, 41, 4, '2027-04-07', 1, '2026-05-13 11:23:53', '2026-05-13 11:23:53'),
(81, 'Fipronil spot on', 'Ektoparasitisida untuk kutu, caplak, dan pinjal pada anjing', 'cair', 187000.00, 389, 15, '2026-09-03', 0, '2026-05-13 11:23:53', '2026-05-13 11:23:53'),
(82, 'Fipronil semprot', 'Semprot untuk lingkungan dan kandang', 'cair', 167000.00, 213, 10, '2027-02-14', 0, '2026-05-13 11:23:53', '2026-05-13 11:23:53'),
(83, 'Fipronil + Metoprena', 'Kombinasi menghambat telur kutu', 'cair', 245000.00, 178, 12, '2025-12-06', 0, '2026-05-13 11:23:53', '2026-05-13 11:23:53'),
(84, 'Fipronil untuk kucing', 'Spot on khusus kucing, bebas resep', 'cair', 169000.00, 302, 15, '2026-10-17', 0, '2026-05-13 11:23:53', '2026-05-13 11:23:53'),
(85, 'Fipronil generik', 'Obat kutu murah untuk anjing kampung', 'cair', 89000.00, 567, 25, '2027-03-25', 0, '2026-05-13 11:23:53', '2026-05-13 11:23:53'),
(86, 'Fipronil 10%', 'Konsentrat untuk sapi', 'cair', 410000.00, 56, 5, '2026-07-12', 1, '2026-05-13 11:23:53', '2026-05-13 11:23:53'),
(87, 'Fipronil krim', 'Krim untuk pengobatan fokal pada kucing', 'salep', 99000.00, 145, 8, '2025-11-19', 0, '2026-05-13 11:23:53', '2026-05-13 11:23:53'),
(88, 'Fipronil tetes leher', 'Tetes praktis untuk anak anjing', 'cair', 119000.00, 324, 18, '2026-05-04', 0, '2026-05-13 11:23:53', '2026-05-13 11:23:53'),
(89, 'Fipronil + Etofenprox', 'Campuran untuk kutu kebal', 'cair', 289000.00, 98, 5, '2027-01-29', 1, '2026-05-13 11:23:53', '2026-05-13 11:23:53'),
(90, 'Fipronil kalung', 'Kalung anti kutu lepas lambat', 'cair', 367000.00, 72, 5, '2026-12-20', 0, '2026-05-13 11:23:53', '2026-05-13 11:23:53'),
(91, 'Prazikuantel tablet', 'Anticacing untuk cacing pita pada anjing dan kucing', 'tablet', 85000.00, 410, 20, '2026-08-15', 0, '2026-05-13 11:23:53', '2026-05-13 11:23:53'),
(92, 'Prazikuantel injeksi', 'Suntik untuk cacing pita pada sapi', 'suntik', 295000.00, 64, 5, '2027-04-01', 1, '2026-05-13 11:23:53', '2026-05-13 11:23:53'),
(93, 'Prazikuantel + Pirantel', 'Kombinasi broad spectrum untuk cacing gelang dan pita', 'tablet', 129000.00, 378, 15, '2025-09-09', 0, '2026-05-13 11:23:53', '2026-05-13 11:23:53'),
(94, 'Prazikuantel suspensi', 'Suspensi oral untuk kucing liar', 'cair', 112000.00, 201, 10, '2026-11-23', 0, '2026-05-13 11:23:53', '2026-05-13 11:23:53'),
(95, 'Prazikuantel 50 mg', 'Tablet kecil untuk anak kucing', 'tablet', 67000.00, 288, 12, '2027-02-20', 0, '2026-05-13 11:23:53', '2026-05-26 03:47:50'),
(96, 'Prazikuantel generik', 'Obat cacing pita murah untuk ayam', 'tablet', 49000.00, 522, 30, '2025-10-03', 0, '2026-05-13 11:23:53', '2026-05-13 11:23:53'),
(97, 'Prazikuantel kapsul', 'Kapsul untuk anjing ras besar', 'kapsul', 156000.00, 134, 7, '2026-12-08', 1, '2026-05-13 11:23:53', '2026-05-13 11:23:53'),
(98, 'Prazikuantel oral paste', 'Pasta untuk kuda', 'cair', 345000.00, 47, 4, '2027-03-18', 1, '2026-05-13 11:23:53', '2026-05-13 11:23:53'),
(99, 'Prazikuantel + Febantel', 'Kombinasi tri cacing untuk anjing', 'tablet', 198000.00, 167, 10, '2026-06-27', 1, '2026-05-13 11:23:53', '2026-05-13 11:23:53'),
(100, 'Prazikuantel 200 mg', 'Dosis dewasa untuk anjing', 'tablet', 176000.00, 203, 10, '2025-12-29', 0, '2026-05-13 11:23:53', '2026-05-13 11:23:53'),
(101, 'Meloksikam injeksi', 'AINS untuk nyeri dan inflamasi pada sapi dan kuda', 'suntik', 345000.00, 78, 5, '2026-09-12', 1, '2026-05-13 11:23:53', '2026-05-13 11:23:53'),
(102, 'Meloksikam oral suspensi', 'Suspensi rasa madu untuk anjing arthritis', 'cair', 189000.00, 198, 10, '2027-01-05', 1, '2026-05-13 11:23:53', '2026-05-13 11:23:53'),
(103, 'Meloksikam tablet', 'Tablet untuk nyeri pasca operasi pada kucing', 'tablet', 154000.00, 213, 12, '2026-11-29', 1, '2026-05-13 11:23:53', '2026-05-13 11:23:53'),
(104, 'Meloksikam 1%', 'Suntik untuk radang sendi pada kuda', 'suntik', 412000.00, 44, 4, '2025-10-14', 1, '2026-05-13 11:23:53', '2026-05-13 11:23:53'),
(105, 'Meloksikam generik', 'Obat anti inflamasi murah untuk babi', 'tablet', 89000.00, 312, 15, '2027-04-10', 0, '2026-05-13 11:23:53', '2026-05-13 11:23:53'),
(106, 'Meloksikam krim', 'Krim topikal untuk nyeri otot pada anjing', 'salep', 117000.00, 167, 9, '2026-07-23', 0, '2026-05-13 11:23:53', '2026-05-13 11:23:53'),
(107, 'Meloksikam oral gel', 'Gel oral untuk kucing senior', 'cair', 209000.00, 122, 7, '2026-12-02', 1, '2026-05-13 11:23:53', '2026-05-13 11:23:53'),
(108, 'Meloksikam LA', 'Long acting untuk sapi perah', 'suntik', 569000.00, 31, 3, '2027-02-08', 1, '2026-05-13 11:23:53', '2026-05-13 11:23:53'),
(109, 'Meloksikam 0.5 mg/ml', 'Suspensi dosis rendah untuk anak anjing', 'cair', 143000.00, 145, 8, '2025-11-24', 1, '2026-05-13 11:23:53', '2026-05-13 11:23:53'),
(110, 'Meloksikam + Parasetamol', 'Kombinasi untuk demam pada kuda', 'tablet', 267000.00, 68, 5, '2026-08-30', 1, '2026-05-13 11:23:53', '2026-05-13 11:23:53'),
(111, 'Karprofen tablet', 'AINS untuk osteoartritis anjing', 'tablet', 234000.00, 156, 8, '2026-05-15', 1, '2026-05-13 11:23:53', '2026-05-13 11:23:53'),
(112, 'Karprofen injeksi', 'Suntik untuk nyeri pasca operasi', 'suntik', 398000.00, 53, 5, '2027-03-27', 1, '2026-05-13 11:23:53', '2026-05-13 11:23:53'),
(113, 'Karprofen kunyah', 'Tablet rasa hati untuk anjing', 'tablet', 198000.00, 201, 10, '2025-09-20', 0, '2026-05-13 11:23:53', '2026-05-13 11:23:53'),
(114, 'Karprofen 100 mg', 'Dosis untuk anjing besar', 'tablet', 278000.00, 89, 5, '2026-12-14', 1, '2026-05-13 11:23:53', '2026-05-13 11:23:53'),
(115, 'Karprofen generik', 'Obat nyeri murah untuk kucing', 'tablet', 145000.00, 178, 10, '2027-01-23', 0, '2026-05-13 11:23:53', '2026-05-13 11:23:53'),
(116, 'Karprofen suspensi', 'Suspensi oral untuk anjing kecil', 'cair', 167000.00, 134, 8, '2026-10-07', 1, '2026-05-13 11:23:53', '2026-05-13 11:23:53'),
(117, 'Karprofen 50 mg', 'Tablet untuk terapi jangka panjang', 'tablet', 189000.00, 210, 12, '2025-11-11', 1, '2026-05-13 11:23:53', '2026-05-13 11:23:53'),
(118, 'Karprofen kapsul', 'Kapsul untuk nyeri panggul pada kuda', 'kapsul', 412000.00, 37, 4, '2027-02-25', 1, '2026-05-13 11:23:53', '2026-05-13 11:23:53'),
(119, 'Karprofen LA', 'Suntik lepas lambat untuk radang sendi', 'suntik', 589000.00, 26, 3, '2026-08-02', 1, '2026-05-13 11:23:53', '2026-05-13 11:23:53'),
(120, 'Karprofen oral paste', 'Paste untuk kuda dengan kolik ringan', 'cair', 356000.00, 42, 4, '2027-04-16', 1, '2026-05-13 11:23:53', '2026-05-13 11:23:53'),
(121, 'Prednisolon tablet', 'Kortikosteroid untuk alergi dan autoimun pada anjing', 'tablet', 112000.00, 245, 12, '2026-06-11', 1, '2026-05-13 11:23:53', '2026-05-13 11:23:53'),
(122, 'Prednisolon injeksi', 'Suntik untuk syok anafilaksis pada kucing', 'suntik', 235000.00, 96, 5, '2027-01-31', 1, '2026-05-13 11:23:53', '2026-05-13 11:23:53'),
(123, 'Prednisolon salep', 'Salep untuk dermatitis atopik', 'salep', 89000.00, 202, 10, '2025-12-07', 0, '2026-05-13 11:23:53', '2026-05-26 03:59:56'),
(124, 'Prednisolon oral solution', 'Larutan untuk asma kucing', 'cair', 157000.00, 132, 7, '2026-09-19', 1, '2026-05-13 11:23:53', '2026-05-13 11:23:53'),
(125, 'Prednisolon 5 mg', 'Tablet dosis rendah untuk anjing kecil', 'tablet', 76000.00, 312, 15, '2027-03-05', 1, '2026-05-13 11:23:53', '2026-05-13 11:23:53'),
(126, 'Prednisolon generik', 'Obat radang murah untuk ternak', 'tablet', 67000.00, 397, 20, '2026-10-23', 0, '2026-05-13 11:23:53', '2026-05-26 03:59:36'),
(127, 'Prednisolon krim', 'Krim untuk eksim pada kuda', 'salep', 104000.00, 145, 8, '2025-08-28', 0, '2026-05-13 11:23:53', '2026-05-13 11:23:53'),
(128, 'Prednisolon 20 mg', 'Dosis tinggi untuk penyakit autoimun', 'tablet', 167000.00, 88, 5, '2027-02-12', 1, '2026-05-13 11:23:53', '2026-05-13 11:23:53'),
(129, 'Prednisolon tetes mata', 'Tetes untuk uveitis pada anjing', 'cair', 98000.00, 176, 10, '2026-07-16', 0, '2026-05-13 11:23:53', '2026-05-13 11:23:53'),
(130, 'Prednisolon + Neomycin', 'Kombinasi untuk infeksi telinga', 'cair', 145000.00, 119, 6, '2025-11-26', 1, '2026-05-13 11:23:53', '2026-05-13 11:23:53'),
(131, 'Deksametason injeksi', 'Kortikosteroid kuat untuk syok dan edema serebral', 'suntik', 189000.00, 134, 8, '2026-08-21', 1, '2026-05-13 11:23:53', '2026-05-13 11:23:53'),
(132, 'Deksametason tablet', 'Tablet untuk pengobatan alergi kronis', 'tablet', 99000.00, 267, 12, '2027-04-05', 1, '2026-05-13 11:23:53', '2026-05-13 11:23:53'),
(133, 'Deksametason salep', 'Salep untuk radang kulit pada kucing', 'salep', 78000.00, 234, 10, '2025-10-19', 0, '2026-05-13 11:23:53', '2026-05-13 11:23:53'),
(134, 'Deksametason oral', 'Larutan oral untuk asma kuda', 'cair', 145000.00, 98, 5, '2026-12-25', 1, '2026-05-13 11:23:53', '2026-05-13 11:23:53'),
(135, 'Deksametason 2 mg', 'Dosis rendah untuk anak anjing', 'tablet', 56000.00, 345, 18, '2027-01-14', 0, '2026-05-13 11:23:53', '2026-05-13 11:23:53'),
(136, 'Deksametason generik', 'Murah untuk sapi dan kambing', 'suntik', 123000.00, 276, 15, '2026-09-27', 1, '2026-05-13 11:23:53', '2026-05-13 11:23:53'),
(137, 'Deksametason krim', 'Krim untuk dermatitis kontak', 'salep', 87000.00, 189, 10, '2025-12-30', 0, '2026-05-13 11:23:53', '2026-05-13 11:23:53'),
(138, 'Deksametason 5 mg', 'Dosis tinggi untuk syok', 'tablet', 134000.00, 101, 6, '2027-03-17', 1, '2026-05-13 11:23:53', '2026-05-13 11:23:53'),
(139, 'Deksametason tetes mata', 'Tetes untuk inflamasi mata pada kuda', 'cair', 89000.00, 156, 8, '2026-06-26', 0, '2026-05-13 11:23:53', '2026-05-13 11:23:53'),
(140, 'Deksametason LA', 'Long acting untuk arthritis sapi', 'suntik', 345000.00, 48, 4, '2025-10-10', 1, '2026-05-13 11:23:53', '2026-05-13 11:23:53'),
(141, 'Furosemid injeksi', 'Diuretik untuk edema paru dan gagal jantung pada anjing', 'suntik', 178000.00, 112, 7, '2027-01-21', 1, '2026-05-13 11:23:53', '2026-05-13 11:23:53'),
(142, 'Furosemid tablet', 'Tablet untuk hipertensi pada kucing', 'tablet', 89000.00, 245, 12, '2026-08-09', 1, '2026-05-13 11:23:53', '2026-05-13 11:23:53'),
(143, 'Furosemid oral solution', 'Larutan untuk gagal jantung kongestif', 'cair', 156000.00, 134, 8, '2025-11-16', 1, '2026-05-13 11:23:53', '2026-05-13 11:23:53'),
(144, 'Furosemid 50 mg', 'Dosis untuk anjing besar', 'tablet', 123000.00, 189, 10, '2027-02-04', 1, '2026-05-13 11:23:53', '2026-05-13 11:23:53'),
(145, 'Furosemid generik', 'Obat diuretik murah untuk sapi', 'suntik', 99000.00, 278, 15, '2026-10-18', 0, '2026-05-13 11:23:53', '2026-05-13 11:23:53'),
(146, 'Furosemid kapsul', 'Kapsul untuk terapi jangka panjang kucing', 'kapsul', 145000.00, 97, 5, '2025-09-30', 1, '2026-05-13 11:23:53', '2026-05-13 11:23:53'),
(147, 'Furosemid 20 mg', 'Dosis kecil untuk anjing kecil', 'tablet', 78000.00, 302, 15, '2027-03-28', 0, '2026-05-13 11:23:53', '2026-05-13 11:23:53'),
(148, 'Furosemid injeksi 100 mg', 'Konsentrat untuk kuda', 'suntik', 267000.00, 43, 4, '2026-07-05', 1, '2026-05-13 11:23:53', '2026-05-13 11:23:53'),
(149, 'Furosemid + Spironolakton', 'Kombinasi hemat kalium', 'tablet', 234000.00, 76, 5, '2026-12-01', 1, '2026-05-13 11:23:53', '2026-05-13 11:23:53'),
(150, 'Furosemid tetes', 'Tetes oral untuk anak kucing', 'cair', 112000.00, 156, 8, '2027-04-19', 0, '2026-05-13 11:23:53', '2026-05-13 11:23:53'),
(151, 'Atropin sulfat', 'Antikolinergik untuk bradikardia dan antidot organofosfat', 'suntik', 156000.00, 167, 10, '2026-05-08', 1, '2026-05-13 11:23:53', '2026-05-13 11:23:53'),
(152, 'Atropin tetes mata', 'Tetes untuk midriasis pada pemeriksaan mata kuda', 'cair', 89000.00, 201, 12, '2027-02-16', 0, '2026-05-13 11:23:53', '2026-05-13 11:23:53'),
(153, 'Atropin tablet', 'Tablet untuk kejang otot polos pada kucing', 'tablet', 108000.00, 134, 8, '2025-12-18', 1, '2026-05-13 11:23:53', '2026-05-13 11:23:53'),
(154, 'Atropin 0.5 mg', 'Dosis kecil untuk anak anjing', 'suntik', 98000.00, 213, 10, '2026-09-15', 1, '2026-05-13 11:23:53', '2026-05-13 11:23:53'),
(155, 'Atropin generik', 'Obat darurat untuk keracunan pestisida pada ayam', 'suntik', 67000.00, 345, 20, '2027-01-27', 0, '2026-05-13 11:23:53', '2026-05-13 11:23:53'),
(156, 'Atropin salep mata', 'Salep untuk ulkus kornea', 'salep', 79000.00, 178, 10, '2025-11-03', 0, '2026-05-13 11:23:53', '2026-05-13 11:23:53'),
(157, 'Atropin 1 mg', 'Dosis standar untuk anjing', 'suntik', 134000.00, 98, 5, '2026-08-14', 1, '2026-05-13 11:23:53', '2026-05-13 11:23:53'),
(158, 'Atropin oral', 'Larutan oral untuk kolik pada kuda', 'cair', 167000.00, 76, 5, '2027-03-03', 1, '2026-05-13 11:23:53', '2026-05-13 11:23:53'),
(159, 'Atropin + Pralidoksim', 'Paket antidot untuk keracunan insektisida', 'suntik', 389000.00, 34, 3, '2026-10-28', 1, '2026-05-13 11:23:53', '2026-05-13 11:23:53'),
(160, 'Atropin krim', 'Krim untuk kejang otot lokal', 'salep', 89000.00, 142, 8, '2025-09-22', 0, '2026-05-13 11:23:53', '2026-05-26 08:55:37'),
(161, 'Xilazin HCl 2%', 'Sedatif dan analgesik untuk prosedur minor pada sapi', 'suntik', 267000.00, 87, 5, '2026-06-19', 1, '2026-05-13 11:23:53', '2026-05-13 11:23:53'),
(162, 'Xilazin injeksi', 'Obat bius untuk kuda dan domba', 'suntik', 310000.00, 64, 5, '2027-01-09', 1, '2026-05-13 11:23:53', '2026-05-13 11:23:53'),
(163, 'Xilazin 100 mg/ml', 'Konsentrat untuk rusa', 'suntik', 456000.00, 22, 3, '2025-12-11', 1, '2026-05-13 11:23:53', '2026-05-13 11:23:53'),
(164, 'Xilazin generik', 'Sedatif murah untuk kambing', 'suntik', 189000.00, 112, 7, '2026-09-24', 1, '2026-05-13 11:23:53', '2026-05-13 11:23:53'),
(165, 'Xilazin + Ketamin', 'Kombinasi anestesi untuk anjing', 'suntik', 589000.00, 41, 4, '2027-03-20', 1, '2026-05-13 11:23:53', '2026-05-13 11:23:53'),
(166, 'Xilazin 20 mg', 'Dosis rendah untuk kucing liar', 'suntik', 156000.00, 98, 6, '2025-10-05', 1, '2026-05-13 11:23:53', '2026-05-13 11:23:53'),
(167, 'Xilazin oral gel', 'Gel untuk sedasi ringan pada kucing', 'cair', 234000.00, 67, 5, '2026-11-12', 1, '2026-05-13 11:23:53', '2026-05-13 11:23:53'),
(168, 'Xilazin 10%', 'Untuk imobilisasi sapi besar', 'suntik', 398000.00, 35, 4, '2027-02-28', 1, '2026-05-13 11:23:53', '2026-05-13 11:23:53'),
(169, 'Xilazin HCl powder', 'Serbuk larut untuk air minum ayam (sedasi transport)', 'cair', 345000.00, 28, 3, '2026-07-19', 1, '2026-05-13 11:23:53', '2026-05-13 11:23:53'),
(170, 'Xilazin 500 mg', 'Dosis tinggi untuk kuda', 'suntik', 567000.00, 19, 2, '2025-09-17', 1, '2026-05-13 11:23:53', '2026-05-13 11:23:53'),
(171, 'Ketamin HCl', 'Anestesi dissosiatif untuk induksi pada kucing', 'suntik', 345000.00, 76, 5, '2026-12-09', 1, '2026-05-13 11:23:53', '2026-05-13 11:23:53'),
(172, 'Ketamin 100 mg/ml', 'Vial untuk anjing dan kucing', 'suntik', 398000.00, 54, 5, '2027-01-25', 1, '2026-05-13 11:23:53', '2026-05-13 11:23:53'),
(173, 'Ketamin + Xilazin', 'Kombinasi untuk anestesi jangka pendek', 'suntik', 489000.00, 43, 4, '2025-11-29', 1, '2026-05-13 11:23:53', '2026-05-13 11:23:53'),
(174, 'Ketamin generik', 'Obat bius murah untuk hewan laboratorium', 'suntik', 234000.00, 98, 6, '2026-08-17', 1, '2026-05-13 11:23:53', '2026-05-13 11:23:53'),
(175, 'Ketamin 50 mg', 'Dosis untuk kucing kecil', 'suntik', 189000.00, 112, 7, '2027-04-12', 1, '2026-05-13 11:23:53', '2026-05-13 11:23:53'),
(176, 'Ketamin oral', 'Larutan oral (off-label) untuk sedasi burung', 'cair', 278000.00, 34, 3, '2025-10-21', 1, '2026-05-13 11:23:53', '2026-05-13 11:23:53'),
(177, 'Ketamin + Medetomidin', 'Kombinasi untuk anestesi pada kelinci', 'suntik', 589000.00, 27, 3, '2026-09-06', 1, '2026-05-13 11:23:53', '2026-05-13 11:23:53'),
(178, 'Ketamin 200 mg/ml', 'Konsentrat untuk kuda', 'suntik', 456000.00, 31, 4, '2027-02-22', 1, '2026-05-13 11:23:53', '2026-05-13 11:23:53'),
(179, 'Ketamin sediaan krim', 'Krim anestesi topikal (jarang)', 'salep', 189000.00, 56, 5, '2025-12-14', 1, '2026-05-13 11:23:53', '2026-05-13 11:23:53'),
(180, 'Ketamin HCl powder', 'Serbuk untuk rekonstitusi', 'suntik', 678000.00, 18, 2, '2026-10-02', 1, '2026-05-13 11:23:53', '2026-05-13 11:23:53'),
(181, 'Buprenorfin injeksi', 'Analgesik opioid untuk nyeri sedang-berat pada anjing', 'suntik', 410000.00, 67, 5, '2026-07-28', 1, '2026-05-13 11:23:53', '2026-05-13 11:23:53'),
(182, 'Buprenorfin oral', 'Larutan oral untuk nyeri pasca operasi kucing', 'cair', 345000.00, 89, 5, '2027-03-14', 1, '2026-05-13 11:23:53', '2026-05-13 11:23:53'),
(183, 'Buprenorfin tablet', 'Tablet sublingual untuk nyeri kronis', 'tablet', 289000.00, 54, 5, '2025-10-15', 1, '2026-05-13 11:23:53', '2026-05-13 11:23:53'),
(184, 'Buprenorfin 0.3 mg', 'Dosis kecil untuk kucing', 'suntik', 198000.00, 112, 7, '2026-12-16', 1, '2026-05-13 11:23:53', '2026-05-13 11:23:53'),
(185, 'Buprenorfin generik', 'Opioid murah untuk sapi', 'suntik', 267000.00, 43, 4, '2027-01-08', 1, '2026-05-13 11:23:53', '2026-05-13 11:23:53'),
(186, 'Buprenorfin patch', 'Patch transdermal untuk nyeri 72 jam', 'salep', 567000.00, 23, 3, '2025-09-26', 1, '2026-05-13 11:23:53', '2026-05-13 11:23:53'),
(187, 'Buprenorfin + Lidokain', 'Kombinasi untuk blok epidural pada kuda', 'suntik', 589000.00, 31, 3, '2026-11-07', 1, '2026-05-13 11:23:53', '2026-05-13 11:23:53'),
(188, 'Buprenorfin 0.6 mg', 'Dosis tinggi untuk anjing besar', 'suntik', 345000.00, 47, 4, '2027-02-18', 1, '2026-05-13 11:23:53', '2026-05-13 11:23:53'),
(189, 'Buprenorfin sirup', 'Sirup untuk nyeri pada hewan kecil', 'cair', 298000.00, 78, 6, '2026-04-29', 1, '2026-05-13 11:23:53', '2026-05-13 11:23:53'),
(190, 'Buprenorfin spray oral', 'Semprot mukosa untuk kucing', 'cair', 412000.00, 39, 4, '2025-12-03', 1, '2026-05-13 11:23:53', '2026-05-13 11:23:53'),
(191, 'Klindamisin tablet', 'Antibiotik untuk infeksi tulang dan abses gigi pada anjing', 'tablet', 234000.00, 134, 8, '2026-06-23', 1, '2026-05-13 11:23:53', '2026-05-13 11:23:53'),
(192, 'Klindamisin kapsul', 'Kapsul untuk toksoplasmosis pada kucing', 'kapsul', 267000.00, 98, 6, '2027-01-12', 1, '2026-05-13 11:23:53', '2026-05-13 11:23:53'),
(193, 'Klindamisin injeksi', 'Suntik untuk infeksi anaerob dalam', 'suntik', 412000.00, 56, 5, '2025-11-05', 1, '2026-05-13 11:23:53', '2026-05-13 11:23:53'),
(194, 'Klindamisin oral liquid', 'Larutan rasa daging untuk anak anjing', 'cair', 189000.00, 145, 10, '2026-09-30', 1, '2026-05-13 11:23:53', '2026-05-13 11:23:53'),
(195, 'Klindamisin salep', 'Salep untuk infeksi kulit dalam', 'salep', 134000.00, 167, 9, '2027-03-26', 0, '2026-05-13 11:23:53', '2026-05-13 11:23:53'),
(196, 'Klindamisin 150 mg', 'Dosis standar untuk kucing', 'tablet', 176000.00, 201, 10, '2025-10-09', 1, '2026-05-13 11:23:53', '2026-05-13 11:23:53'),
(197, 'Klindamisin generik', 'Antibiotik murah untuk ayam', 'kapsul', 89000.00, 345, 20, '2026-08-12', 0, '2026-05-13 11:23:53', '2026-05-13 11:23:53'),
(198, 'Klindamisin 300 mg', 'Dosis untuk anjing besar', 'tablet', 289000.00, 87, 5, '2027-02-01', 1, '2026-05-13 11:23:53', '2026-05-13 11:23:53'),
(199, 'Klindamisin krim', 'Krim untuk folikulitis', 'salep', 112000.00, 154, 8, '2025-12-22', 0, '2026-05-13 11:23:53', '2026-05-13 11:23:53'),
(200, 'Klindamisin + Gentamisin', 'Kombinasi untuk infeksi campuran', 'suntik', 498000.00, 41, 4, '2026-11-15', 1, '2026-05-13 11:23:53', '2026-05-13 11:23:53'),
(201, 'Tilosin tartrat', 'Antibiotik makrolida untuk infeksi Mycoplasma pada unggas', 'suntik', 278000.00, 112, 7, '2026-05-16', 1, '2026-05-13 11:23:53', '2026-05-13 11:23:53'),
(202, 'Tilosin oral powder', 'Serbuk larut untuk air minum ayam', 'cair', 189000.00, 345, 15, '2027-04-08', 0, '2026-05-13 11:23:53', '2026-05-13 11:23:53'),
(203, 'Tilosin 200 mg', 'Tablet untuk babi', 'tablet', 167000.00, 134, 8, '2025-09-18', 1, '2026-05-13 11:23:53', '2026-05-13 11:23:53'),
(204, 'Tilosin injeksi 10%', 'Untuk sapi dengan metritis', 'suntik', 345000.00, 78, 5, '2026-12-05', 1, '2026-05-13 11:23:53', '2026-05-13 11:23:53'),
(205, 'Tilosin generik', 'Obat murah untuk itik', 'cair', 99000.00, 412, 20, '2027-01-30', 0, '2026-05-13 11:23:53', '2026-05-13 11:23:53'),
(206, 'Tilosin kapsul', 'Kapsul untuk kucing dengan pneumonia', 'kapsul', 198000.00, 89, 5, '2025-11-27', 1, '2026-05-13 11:23:53', '2026-05-13 11:23:53'),
(207, 'Tilosin 50 mg/ml', 'Larutan untuk anak ayam', 'cair', 134000.00, 278, 12, '2026-07-09', 0, '2026-05-13 11:23:53', '2026-05-13 11:23:53'),
(208, 'Tilosin + Doksisiklin', 'Kombinasi untuk CRD kompleks', 'cair', 267000.00, 67, 5, '2027-03-19', 1, '2026-05-13 11:23:53', '2026-05-13 11:23:53'),
(209, 'Tilosin salep', 'Salep untuk infeksi kelenjar pada kuda', 'salep', 123000.00, 101, 6, '2025-10-27', 0, '2026-05-13 11:23:53', '2026-05-13 11:23:53'),
(210, 'Tilosin tartrat 100 g', 'Paket besar untuk peternakan', 'cair', 589000.00, 28, 3, '2026-09-10', 1, '2026-05-13 11:23:53', '2026-05-13 11:23:53'),
(211, 'Sulfadimetoksin tablet', 'Antibiotik sulfa untuk koksidiosis pada anjing', 'tablet', 89000.00, 267, 12, '2026-08-25', 0, '2026-05-13 11:23:53', '2026-05-13 11:23:53'),
(212, 'Sulfadimetoksin oral liquid', 'Larutan untuk koksidiosis sapi', 'cair', 145000.00, 189, 10, '2027-01-17', 1, '2026-05-13 11:23:53', '2026-05-13 11:23:53'),
(213, 'Sulfadimetoksin injeksi', 'Suntik untuk enteritis pada kambing', 'suntik', 198000.00, 112, 7, '2025-12-19', 1, '2026-05-13 11:23:53', '2026-05-13 11:23:53'),
(214, 'Sulfadimetoksin 500 mg', 'Dosis untuk kuda', 'tablet', 134000.00, 145, 8, '2026-10-11', 1, '2026-05-13 11:23:53', '2026-05-13 11:23:53'),
(215, 'Sulfadimetoksin generik', 'Obat koksidia murah untuk ayam', 'cair', 67000.00, 489, 25, '2027-02-24', 0, '2026-05-13 11:23:53', '2026-05-13 11:23:53'),
(216, 'Sulfadimetoksin + Trimetoprim', 'Kombinasi potensiasi', 'tablet', 189000.00, 156, 9, '2025-09-13', 1, '2026-05-13 11:23:53', '2026-05-13 11:23:53'),
(217, 'Sulfadimetoksin 250 mg', 'Dosis untuk kucing', 'tablet', 89000.00, 201, 10, '2026-11-19', 0, '2026-05-13 11:23:53', '2026-05-13 11:23:53'),
(218, 'Sulfadimetoksin kapsul', 'Kapsul untuk kelinci', 'kapsul', 112000.00, 134, 7, '2027-04-02', 1, '2026-05-13 11:23:53', '2026-05-13 11:23:53'),
(219, 'Sulfadimetoksin 20%', 'Suntik pekat untuk sapi', 'suntik', 278000.00, 54, 5, '2025-10-28', 1, '2026-05-13 11:23:53', '2026-05-13 11:23:53'),
(220, 'Sulfadimetoksin bubuk', 'Serbuk untuk dicampur pakan', 'cair', 345000.00, 67, 5, '2026-07-21', 0, '2026-05-13 11:23:53', '2026-05-13 11:23:53'),
(221, 'Tetrasiklin HCl tablet', 'Antibiotik spektrum luas untuk infeksi saluran pernapasan', 'tablet', 89000.00, 312, 15, '2027-03-08', 0, '2026-05-13 11:23:53', '2026-05-13 11:23:53'),
(222, 'Tetrasiklin salep mata', 'Salep untuk konjungtivitis pada sapi', 'salep', 67000.00, 244, 12, '2026-05-12', 0, '2026-05-13 11:23:53', '2026-05-14 02:21:31'),
(223, 'Tetrasiklin injeksi', 'Suntik untuk anaplasmosis pada sapi', 'suntik', 198000.00, 134, 8, '2025-11-04', 1, '2026-05-13 11:23:53', '2026-05-13 11:23:53'),
(224, 'Tetrasiklin oral powder', 'Bubuk larut untuk air minum ayam', 'cair', 123000.00, 456, 20, '2026-09-17', 0, '2026-05-13 11:23:53', '2026-05-13 11:23:53'),
(225, 'Tetrasiklin 500 mg', 'Kapsul untuk anjing besar', 'kapsul', 145000.00, 178, 10, '2027-01-10', 1, '2026-05-13 11:23:53', '2026-05-13 11:23:53'),
(226, 'Tetrasiklin generik', 'Obat murah untuk babi', 'tablet', 56000.00, 567, 30, '2025-12-09', 0, '2026-05-13 11:23:53', '2026-05-13 11:23:53'),
(227, 'Tetrasiklin krim', 'Krim untuk infeksi kulit pada kucing', 'salep', 78000.00, 189, 10, '2026-08-01', 0, '2026-05-13 11:23:53', '2026-05-13 11:23:53'),
(228, 'Tetrasiklin 250 mg', 'Dosis untuk kucing', 'kapsul', 99000.00, 223, 12, '2027-02-27', 1, '2026-05-13 11:23:53', '2026-05-13 11:23:53'),
(229, 'Tetrasiklin + Colistin', 'Kombinasi untuk diare pada sapi', 'suntik', 345000.00, 67, 5, '2026-10-14', 1, '2026-05-13 11:23:53', '2026-05-13 11:23:53'),
(230, 'Tetrasiklin HCl 10%', 'Larutan suntik konsentrat', 'suntik', 267000.00, 54, 5, '2025-09-24', 1, '2026-05-13 11:23:53', '2026-05-13 11:23:53'),
(231, 'Kloramfenikol tablet', 'Antibiotik (penggunaan terbatas) untuk infeksi berat', 'tablet', 156000.00, 89, 5, '2026-06-02', 1, '2026-05-13 11:23:53', '2026-05-13 11:23:53'),
(232, 'Kloramfenikol injeksi', 'Suntik untuk salmonellosis pada kuda', 'suntik', 278000.00, 43, 4, '2027-03-23', 1, '2026-05-13 11:23:53', '2026-05-13 11:23:53'),
(233, 'Kloramfenikol salep mata', 'Salep untuk keratitis pada anjing', 'salep', 89000.00, 134, 8, '2025-10-16', 1, '2026-05-13 11:23:53', '2026-05-13 11:23:53'),
(234, 'Kloramfenikol oral', 'Larutan untuk infeksi sistemik pada kucing', 'cair', 189000.00, 67, 5, '2026-12-21', 1, '2026-05-13 11:23:53', '2026-05-13 11:23:53'),
(235, 'Kloramfenikol 250 mg', 'Kapsul untuk kambing', 'kapsul', 123000.00, 98, 6, '2027-01-28', 1, '2026-05-13 11:23:53', '2026-05-13 11:23:53'),
(236, 'Kloramfenikol generik', 'Murah untuk ayam (dilarang untuk petelur)', 'tablet', 89000.00, 345, 18, '2025-11-12', 0, '2026-05-13 11:23:53', '2026-05-13 11:23:53'),
(237, 'Kloramfenikol + Deksametason', 'Kombinasi untuk infeksi mata', 'salep', 145000.00, 112, 7, '2026-08-28', 1, '2026-05-13 11:23:53', '2026-05-13 11:23:53'),
(238, 'Kloramfenikol 500 mg', 'Dosis untuk sapi', 'tablet', 234000.00, 56, 5, '2027-02-09', 1, '2026-05-13 11:23:53', '2026-05-13 11:23:53'),
(239, 'Kloramfenikol PA', 'Long acting untuk pneumonia', 'suntik', 398000.00, 32, 3, '2025-12-24', 1, '2026-05-13 11:23:53', '2026-05-13 11:23:53'),
(240, 'Kloramfenikol tetes telinga', 'Tetes untuk otitis media kronis', 'cair', 108000.00, 144, 9, '2026-09-09', 0, '2026-05-13 11:23:53', '2026-05-14 03:45:05'),
(241, 'Vitamin B12 injeksi', 'Suplemen untuk anemia dan defisiensi pada sapi', 'suntik', 89000.00, 412, 20, '2026-07-13', 0, '2026-05-13 11:23:53', '2026-05-13 11:23:53'),
(242, 'Vitamin B12 tablet', 'Tablet kunyah untuk kucing tua', 'tablet', 67000.00, 378, 18, '2027-04-11', 0, '2026-05-13 11:23:53', '2026-05-13 11:23:53'),
(243, 'Vitamin B12 oral liquid', 'Larutan untuk ayam stress', 'cair', 56000.00, 533, 25, '2025-10-08', 0, '2026-05-13 11:23:53', '2026-05-26 03:50:52'),
(244, 'Vitamin B12 + Besi', 'Kombinasi untuk mengatasi anemia pada babi', 'suntik', 134000.00, 267, 12, '2026-11-24', 0, '2026-05-13 11:23:53', '2026-05-13 11:23:53'),
(245, 'Vitamin B12 1000 mcg', 'Dosis tinggi untuk kuda', 'suntik', 123000.00, 189, 10, '2027-01-04', 0, '2026-05-13 11:23:53', '2026-05-13 11:23:53'),
(246, 'Vitamin B12 generik', 'Suplemen murah untuk kambing', 'tablet', 45000.00, 689, 30, '2025-09-19', 0, '2026-05-13 11:23:53', '2026-05-13 11:23:53'),
(247, 'Vitamin B12 500 mcg', 'Dosis untuk anjing', 'suntik', 78000.00, 298, 15, '2026-12-30', 0, '2026-05-13 11:23:53', '2026-05-26 03:59:22'),
(248, 'Vitamin B12 + Selenium', 'Kombinasi untuk distrofi otot pada domba', 'suntik', 156000.00, 140, 8, '2027-03-11', 0, '2026-05-13 11:23:53', '2026-05-16 00:46:32'),
(249, 'Vitamin B12 krim', 'Krim topikal untuk penyembuhan luka (tidak umum)', 'salep', 67000.00, 127, 8, '2025-11-23', 0, '2026-05-13 11:23:53', '2026-05-26 03:47:32'),
(250, 'Vitamin B12 kompleks', 'Dengan vitamin B1 dan B6 untuk neuropati', 'suntik', 189000.00, 210, 12, '2026-05-06', 0, '2026-05-13 11:23:53', '2026-05-13 11:23:53');

-- --------------------------------------------------------

--
-- Table structure for table `pembelian_obat`
--

CREATE TABLE `pembelian_obat` (
  `id_pembelian` int(11) NOT NULL,
  `id_pemilik` int(11) NOT NULL,
  `id_obat` int(11) NOT NULL,
  `jumlah` int(11) NOT NULL,
  `harga_satuan` decimal(15,2) NOT NULL,
  `total_harga` decimal(15,2) NOT NULL,
  `tanggal` timestamp NOT NULL DEFAULT current_timestamp(),
  `status` varchar(20) DEFAULT 'sukses',
  `kode_transaksi` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `pembelian_obat`
--

INSERT INTO `pembelian_obat` (`id_pembelian`, `id_pemilik`, `id_obat`, `jumlah`, `harga_satuan`, `total_harga`, `tanggal`, `status`, `kode_transaksi`) VALUES
(14, 7, 27, 1, 475000.00, 475000.00, '2026-05-26 03:42:10', 'sukses', 'INV-OBT-1779766930812'),
(15, 7, 10, 1, 99000.00, 99000.00, '2026-05-26 03:42:59', 'sukses', 'INV-OBT-1779766979415'),
(16, 8, 249, 1, 67000.00, 67000.00, '2026-05-26 03:47:32', 'sukses', 'INV-OBT-1779767252671'),
(17, 8, 95, 1, 67000.00, 67000.00, '2026-05-26 03:47:50', 'sukses', 'INV-OBT-1779767270585'),
(18, 9, 243, 1, 56000.00, 56000.00, '2026-05-26 03:50:52', 'sukses', 'INV-OBT-1779767452291'),
(19, 15, 247, 1, 78000.00, 78000.00, '2026-05-26 03:59:22', 'sukses', 'INV-OBT-1779767962120'),
(20, 15, 126, 1, 67000.00, 67000.00, '2026-05-26 03:59:36', 'sukses', 'INV-OBT-1779767976693'),
(21, 15, 123, 1, 89000.00, 89000.00, '2026-05-26 03:59:56', 'sukses', 'INV-OBT-1779767996295'),
(22, 1, 160, 3, 89000.00, 267000.00, '2026-05-26 08:55:37', 'sukses', 'INV-OBT-1779785737514'),
(23, 1, 3, 1, 175000.00, 175000.00, '2026-05-26 08:57:07', 'sukses', 'INV-OBT-1779785827228');

-- --------------------------------------------------------

--
-- Table structure for table `pemesanan_offline`
--

CREATE TABLE `pemesanan_offline` (
  `id_antrean` int(11) NOT NULL,
  `id_dokter` int(11) NOT NULL,
  `id_pemilik` int(11) NOT NULL,
  `id_pet` int(11) NOT NULL,
  `nomor_antrean` varchar(20) NOT NULL,
  `tanggal_antrean` date NOT NULL,
  `waktu_antrean` time NOT NULL,
  `keluhan` text DEFAULT NULL,
  `biaya_jasa` decimal(15,2) DEFAULT 0.00,
  `total_biaya` decimal(15,2) DEFAULT 0.00,
  `status_antrean` enum('menunggu','diproses','selesai','batal') DEFAULT 'menunggu',
  `status_pembayaran` enum('belum_bayar','lunas') DEFAULT 'belum_bayar',
  `estimasi_waktu` time DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `pemesanan_offline`
--

INSERT INTO `pemesanan_offline` (`id_antrean`, `id_dokter`, `id_pemilik`, `id_pet`, `nomor_antrean`, `tanggal_antrean`, `waktu_antrean`, `keluhan`, `biaya_jasa`, `total_biaya`, `status_antrean`, `status_pembayaran`, `estimasi_waktu`, `created_at`, `updated_at`) VALUES
(17, 27, 2, 2, 'ANT-20260526-001', '2026-05-26', '11:00:00', '', 80000.00, 80000.00, 'selesai', 'belum_bayar', NULL, '2026-05-26 03:14:41', '2026-05-26 06:50:33'),
(18, 23, 1, 1, 'ANT-20260526-002', '2026-05-26', '11:00:00', '', 80000.00, 80000.00, 'selesai', 'belum_bayar', NULL, '2026-05-26 03:15:24', '2026-05-26 06:50:33'),
(19, 25, 3, 3, 'ANT-20260526-003', '2026-05-26', '11:00:00', '', 150000.00, 150000.00, 'selesai', 'belum_bayar', NULL, '2026-05-26 03:21:56', '2026-05-26 06:50:33'),
(20, 64, 4, 4, 'ANT-20260526-004', '2026-05-26', '11:00:00', '', 150000.00, 150000.00, 'selesai', 'belum_bayar', NULL, '2026-05-26 03:26:15', '2026-05-26 06:50:33'),
(21, 12, 5, 5, 'ANT-20260526-001', '2026-05-26', '12:00:00', '', 80000.00, 80000.00, 'selesai', 'belum_bayar', NULL, '2026-05-26 03:32:28', '2026-05-26 06:50:33'),
(22, 98, 8, 8, 'ANT-20260526-002', '2026-05-26', '12:00:00', '', 150000.00, 150000.00, 'selesai', 'belum_bayar', NULL, '2026-05-26 03:47:22', '2026-05-26 06:50:33'),
(23, 101, 8, 8, 'ANT-20260526-003', '2026-05-26', '12:00:00', '', 150000.00, 150000.00, 'selesai', 'belum_bayar', NULL, '2026-05-26 03:47:57', '2026-05-26 06:50:33'),
(24, 107, 9, 9, 'ANT-20260526-004', '2026-05-26', '12:00:00', '', 80000.00, 80000.00, 'selesai', 'belum_bayar', NULL, '2026-05-26 03:50:30', '2026-05-26 06:50:33'),
(25, 94, 9, 9, 'ANT-20260526-005', '2026-05-26', '12:00:00', '', 150000.00, 150000.00, 'selesai', 'belum_bayar', NULL, '2026-05-26 03:51:20', '2026-05-26 06:50:33'),
(26, 45, 10, 10, 'ANT-20260526-006', '2026-05-26', '14:00:00', '', 150000.00, 150000.00, 'selesai', 'belum_bayar', NULL, '2026-05-26 03:52:19', '2026-05-26 08:02:33'),
(27, 76, 10, 10, 'ANT-20260526-007', '2026-05-26', '12:00:00', '', 150000.00, 150000.00, 'selesai', 'belum_bayar', NULL, '2026-05-26 03:58:03', '2026-05-26 06:50:33'),
(28, 8, 7, 7, 'ANT-20260526-001', '2026-05-26', '13:00:00', '', 75000.00, 144000.00, 'selesai', 'belum_bayar', NULL, '2026-05-26 04:36:18', '2026-05-26 07:00:33'),
(29, 7, 1, 14, 'ANT-20260526-001', '2026-05-26', '22:00:00', 'kelaperan', 185000.00, 485000.00, 'menunggu', 'belum_bayar', NULL, '2026-05-26 07:55:15', '2026-05-26 08:53:17'),
(30, 78, 1, 1, 'ANT-20260526-001', '2026-05-26', '22:00:00', 'kicau mania', 170000.00, 170000.00, 'menunggu', 'belum_bayar', NULL, '2026-05-26 08:04:03', '2026-05-26 08:04:03'),
(32, 7, 1, 14, 'ANT-20260526-002', '2026-05-26', '18:00:00', '', 185000.00, 185000.00, 'menunggu', 'belum_bayar', NULL, '2026-05-26 08:54:41', '2026-05-26 08:54:41');

-- --------------------------------------------------------

--
-- Table structure for table `pemesanan_online`
--

CREATE TABLE `pemesanan_online` (
  `id_pemesanan` int(11) NOT NULL,
  `kode_pemesanan` varchar(20) NOT NULL,
  `id_pemilik` int(11) NOT NULL,
  `id_dokter` int(11) NOT NULL,
  `id_pet` int(11) NOT NULL,
  `tanggal_konsultasi` date NOT NULL,
  `waktu_konsultasi` varchar(5) NOT NULL,
  `keluhan` text NOT NULL,
  `biaya_konsultasi` decimal(10,2) NOT NULL,
  `kupon_digunakan` varchar(50) DEFAULT NULL,
  `jumlah_diskon` decimal(10,2) DEFAULT 0.00,
  `total_biaya` decimal(10,2) NOT NULL,
  `status_pemesanan` enum('menunggu','sudah bayar','diproses','selesai','batal') DEFAULT NULL,
  `waktu_pemesanan` datetime NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `pemesanan_online`
--

INSERT INTO `pemesanan_online` (`id_pemesanan`, `kode_pemesanan`, `id_pemilik`, `id_dokter`, `id_pet`, `tanggal_konsultasi`, `waktu_konsultasi`, `keluhan`, `biaya_konsultasi`, `kupon_digunakan`, `jumlah_diskon`, `total_biaya`, `status_pemesanan`, `waktu_pemesanan`, `created_at`, `updated_at`) VALUES
(47, 'ONL1779764540552', 1, 13, 1, '2026-05-26', '10:02', 'Milo lemes, gak mau makan minum', 150000.00, 'MANDIRI', 15000.00, 135000.00, 'selesai', '2026-05-26 10:02:20', '2026-05-26 03:02:20', '2026-05-26 03:07:49'),
(48, 'ONL1779764977541', 2, 27, 2, '2026-05-26', '10:09', 'eek nya cair', 80000.00, 'HEMAT5', 0.00, 80000.00, 'selesai', '2026-05-26 10:09:37', '2026-05-26 03:09:37', '2026-05-26 03:14:05'),
(49, 'ONL1779765425952', 3, 36, 3, '2026-05-26', '10:17', 'pincang', 80000.00, 'HEMAT5', 0.00, 80000.00, 'selesai', '2026-05-26 10:17:05', '2026-05-26 03:17:05', '2026-05-26 03:19:39'),
(50, 'ONL1779765682197', 3, 25, 3, '2026-05-26', '10:21', '', 150000.00, NULL, 0.00, 150000.00, 'selesai', '2026-05-26 10:21:22', '2026-05-26 03:21:22', '2026-05-26 04:22:49'),
(51, 'ONL1779765797247', 4, 102, 4, '2026-05-26', '10:23', 'tiba-tiba diem', 80000.00, NULL, 0.00, 80000.00, 'selesai', '2026-05-26 10:23:17', '2026-05-26 03:23:17', '2026-05-26 03:25:41'),
(52, 'ONL1779766153574', 5, 18, 5, '2026-05-26', '10:29', 'bulu rontok terus', 150000.00, 'TOKOPEDIA', 0.00, 150000.00, 'selesai', '2026-05-26 10:29:13', '2026-05-26 03:29:13', '2026-05-26 03:32:03'),
(53, 'ONL1779766439848', 6, 56, 6, '2026-05-26', '10:33', '', 80000.00, 'HEMAT5', 0.00, 80000.00, 'selesai', '2026-05-26 10:33:59', '2026-05-26 03:33:59', '2026-05-26 03:36:53'),
(54, 'ONL1779766699553', 7, 99, 7, '2026-05-26', '10:38', 'suka gesekin badan ke tembok', 150000.00, 'DISKON10', 15000.00, 135000.00, 'selesai', '2026-05-26 10:38:19', '2026-05-26 03:38:19', '2026-05-26 03:41:56'),
(55, 'ONL1779767060846', 8, 60, 8, '2026-05-26', '10:44', 'pingsan', 80000.00, NULL, 0.00, 80000.00, 'selesai', '2026-05-26 10:44:20', '2026-05-26 03:44:20', '2026-05-26 03:46:53'),
(56, 'ONL1779767408470', 9, 52, 9, '2026-05-27', '15:00', '', 150000.00, 'PROMO15', 22500.00, 127500.00, 'menunggu', '2026-05-26 10:50:08', '2026-05-26 03:50:08', '2026-05-26 03:50:08'),
(57, 'ONL1779767521988', 10, 2, 10, '2026-05-27', '16:00', '', 150000.00, 'SHOPEE', 0.00, 150000.00, 'menunggu', '2026-05-26 10:52:01', '2026-05-26 03:52:01', '2026-05-26 03:52:01'),
(58, 'ONL1779767580777', 10, 76, 10, '2026-05-26', '10:53', '', 150000.00, NULL, 0.00, 150000.00, 'selesai', '2026-05-26 10:53:00', '2026-05-26 03:53:00', '2026-05-26 04:56:04'),
(59, 'ONL1779785307721', 1, 7, 14, '2026-05-26', '15:48', 'pingsan', 185000.00, 'DISKON10', 18500.00, 166500.00, 'selesai', '2026-05-26 15:48:27', '2026-05-26 08:48:27', '2026-05-26 10:19:48');

-- --------------------------------------------------------

--
-- Table structure for table `pemilik`
--

CREATE TABLE `pemilik` (
  `id_pemilik` int(11) NOT NULL,
  `nama_pemilik` varchar(100) NOT NULL,
  `username` varchar(50) DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `no_hp` varchar(15) NOT NULL,
  `email` varchar(100) DEFAULT NULL,
  `alamat` text DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `pemilik`
--

INSERT INTO `pemilik` (`id_pemilik`, `nama_pemilik`, `username`, `password`, `no_hp`, `email`, `alamat`, `created_at`, `updated_at`) VALUES
(1, 'Budi Thohari', 'budi', '$2a$10$CUSAKlx.sbxYQ3maHe/3Gu8YkzPrt5BujljKExnW41Wla.w4YZcBO', '081234567890', 'budi@email.com', 'Jl. Merdeka No.1', '2026-05-26 02:35:19', '2026-05-26 02:49:24'),
(2, 'Siti Aminah', 'siti', '$2a$10$s2wuIoUCt3aSfz.wYMm7S.QHOTK8JcrVf7Z7CspzfgdW/elgx4yeW', '081234567891', 'siti@email.com', 'Jl. Sudirman No.2', '2026-05-26 02:35:19', '2026-05-26 02:49:24'),
(3, 'Agus Wijaya', 'agus', '$2a$10$K51a7q/PBh1LTcpRVBKJB.Sp1h0vfRwvhU.GYjDp2CRcCZN.LxrPW', '081234567892', 'agus@email.com', 'Jl. Gatot Subroto No.3', '2026-05-26 02:35:19', '2026-05-26 02:49:25'),
(4, 'Dewi Sartika', 'dewi', '$2a$10$JTK71G4kS9lHIDv/nVTHfOFV79IE9iJJ0MreU.i23atk8Q1NgnxGa', '081234567893', 'dewi@email.com', 'Jl. Diponegoro No.4', '2026-05-26 02:35:19', '2026-05-26 02:49:25'),
(5, 'Eko Prasetyo', 'eko', '$2a$10$dh7wpJFwgnpN94IUTD9//.CuaodfM1XzML0idGNwh0qLrEPUEZYDO', '081234567894', 'eko@email.com', 'Jl. Ahmad Yani No.5', '2026-05-26 02:35:19', '2026-05-26 02:49:25'),
(6, 'Fitri Handayani', 'fitri', '$2a$10$IofMlFsnOjQBmSO2kDCu3O9GsTy8hLhBv6lo7oGY4Q2CFauENJZhO', '081234567895', 'fitri@email.com', 'Jl. Pahlawan No.6', '2026-05-26 02:35:19', '2026-05-26 02:49:25'),
(7, 'Gunawan Setiawan', 'gunawan', '$2a$10$3UPu79WYgOyrT.7SUJMpCO3b7.DDs/k8HAPlIaEtXOrXWQWCcQNq2', '081234567896', 'gunawan@email.com', 'Jl. Veteran No.7', '2026-05-26 02:35:19', '2026-05-26 02:49:25'),
(8, 'Hartati Widodo', 'hartati', '$2a$10$EIXbhsoqcQURa3ene5zikOZRC8I8LkwOK52IHlcMBgtrGvVQj9F6u', '081234567897', 'hartati@email.com', 'Jl. Sisingamangaraja No.8', '2026-05-26 02:35:19', '2026-05-26 02:49:25'),
(9, 'Indra Kusuma', 'indra', '$2a$10$1/MIoZrnrSph6R90ObzR6.c22hQAw5vCdncSE5aDlxKetu7smbjx.', '081234567898', 'indra@email.com', 'Jl. Thamrin No.9', '2026-05-26 02:35:19', '2026-05-26 02:49:25'),
(10, 'Joko Susilo', 'joko', '$2a$10$hIfw8QNUd8VIJEK2z71BgONNk4i9UvKbbUHqGa5e1b/CpwTb1VCs.', '081234567899', 'joko@email.com', 'Jl. Kuningan No.10', '2026-05-26 02:35:19', '2026-05-26 02:49:26'),
(11, 'Kartika Dewi', 'kartika', '$2a$10$Ltvdx9ey.jYaZq5RnyG6f.2nkpoRGkDf35U.lxF/WRidZqB/PanQW', '081234567900', 'kartika@email.com', 'Jl. Rasuna Said No.11', '2026-05-26 02:35:19', '2026-05-26 02:49:26'),
(12, 'Lestari Murni', 'lestari', '$2a$10$7WdlyKbAozv5Ab8rH40U.epqcvjlbo9yUCEA4teQmsW7ElDbKn47K', '081234567901', 'lestari@email.com', 'Jl. HR Rasuna Said No.12', '2026-05-26 02:35:19', '2026-05-26 02:49:26'),
(13, 'Mulyono', 'mulyono', '$2a$10$j6N2DPOVlyhj8zxDAeJLAOGx4ONyyLRERn09TJKMEZP0xkhvhkhii', '081234567902', 'mulyono@email.com', 'Jl. Cikini No.13', '2026-05-26 02:35:19', '2026-05-26 02:49:26'),
(14, 'Nina Zaitun', 'nina', '$2a$10$IYD8CakYYR2nVQCPRpkJC.QS9bo6vv9vC02vTvdunZnS7lQBh1ADO', '081234567903', 'nina@email.com', 'Jl. Menteng No.14', '2026-05-26 02:35:19', '2026-05-26 02:49:26'),
(15, 'Oscar Simanjuntak', 'oscar', '$2a$10$0b7WNSB/LhAKWgRgW4iE6evJeeoJIqiCH4jKvsOgikroLUtSypv2K', '081234567904', 'oscar@email.com', 'Jl. Senopati No.15', '2026-05-26 02:35:19', '2026-05-26 02:49:26'),
(16, 'Putri Melati', 'putri', '$2a$10$PURnd9uAsuVWSH5cn/P/3OSfUnLOkc2qXgR/rnpEwtp3E7h8cbb..', '081234567905', 'putri@email.com', 'Jl. Panglima Polim No.16', '2026-05-26 02:35:19', '2026-05-26 02:49:27'),
(17, 'Qori Hidayat', 'qori', '$2a$10$hartrPOdelTHjRDvCbWhfuKaOybJILcKoq2dQLuDwz2kYM.U3lR6a', '081234567906', 'qori@email.com', 'Jl. Fatmawati No.17', '2026-05-26 02:35:19', '2026-05-26 02:49:27'),
(18, 'Rina Supriati', 'rina', '$2a$10$AX3R4fWyE6IoCXkzMu2GveV1jGwhG4CG5HCcWg3Fv/ZiAbsa.n4LS', '081234567907', 'rina@email.com', 'Jl. Cipete Raya No.18', '2026-05-26 02:35:19', '2026-05-26 02:49:27'),
(19, 'Slamet Riyadi', 'slamet', '$2a$10$L6fFY1wkIV.j3pr4nyFV0e9qPbr/2D0G3Z7A.VwCG6JnnOjeDl4ZW', '081234567908', 'slamet@email.com', 'Jl. Kemang Raya No.19', '2026-05-26 02:35:19', '2026-05-26 02:49:27'),
(20, 'Tuti Winarsih', 'tuti', '$2a$10$vMWWhbSeT98AkBGJEe0vgucMwL2IpVM2MoQCni4ppJnlGjFmqh7XC', '081234567909', 'tuti@email.com', 'Jl. Bangka No.20', '2026-05-26 02:35:19', '2026-05-26 02:49:27'),
(21, 'Umar Hasan', 'umar', '$2a$10$X/6A2QDniQs/iwaHYg3AVuXrFmAypdZPiro9dWx5gtAikkFnWpBnm', '081234567910', 'umar@email.com', 'Jl. Ciledug Raya No.21', '2026-05-26 02:35:19', '2026-05-26 02:49:28'),
(22, 'Vivi Nuraeni', 'vivi', '$2a$10$LL/4s8NHICo9lh8MolIrvO2OTfd2xUSiG2do1nYowD/gyllOaI8ka', '081234567911', 'vivi@email.com', 'Jl. Taman Sari No.22', '2026-05-26 02:35:19', '2026-05-26 02:49:28'),
(23, 'Wawan Kurniawan', 'wawan', '$2a$10$4ZmZasU271fWiABeoTNipuS6vGxn7L2ie0VYWhJFIpUkDDZ5K.Qs2', '081234567912', 'wawan@email.com', 'Jl. Kebon Jeruk No.23', '2026-05-26 02:35:19', '2026-05-26 02:49:28'),
(24, 'Xenia Paramitha', 'xenia', '$2a$10$Syb806EPsYXLeQkmGbtf7.RvF0lFC5lEMfkWuk.AjogsStAt4GieG', '081234567913', 'xenia@email.com', 'Jl. Meruya Ilir No.24', '2026-05-26 02:35:19', '2026-05-26 02:49:28'),
(25, 'Yusuf Maulana', 'yusuf', '$2a$10$rAtJTyy5JjfMQigTURBfteiQvZ/6hqvA5V3T1JxTfZXgWDQzes5Uq', '081234567914', 'yusuf@email.com', 'Jl. Srengseng Sawah No.25', '2026-05-26 02:35:19', '2026-05-26 02:49:29');

-- --------------------------------------------------------

--
-- Table structure for table `pets`
--

CREATE TABLE `pets` (
  `id_pet` int(11) NOT NULL,
  `id_pemilik` int(11) NOT NULL,
  `nama_pet` varchar(50) NOT NULL,
  `jenis_kelamin` enum('jantan','betina','tidak_diketahui') DEFAULT 'tidak_diketahui',
  `jenis_hewan` enum('sapi','kambing','kerbau','ayam','kucing','kelinci','anjing','hamster','burung','ikan','musang','kura-kura','landak','babi','kuda','domba','monyet') NOT NULL,
  `ras` varchar(50) DEFAULT NULL,
  `tanggal_lahir` date DEFAULT NULL,
  `usia` int(11) DEFAULT NULL,
  `berat` decimal(5,2) DEFAULT NULL,
  `sterilisasi` enum('sudah','belum') DEFAULT 'belum',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `pets`
--

INSERT INTO `pets` (`id_pet`, `id_pemilik`, `nama_pet`, `jenis_kelamin`, `jenis_hewan`, `ras`, `tanggal_lahir`, `usia`, `berat`, `sterilisasi`, `created_at`, `updated_at`) VALUES
(1, 1, 'Milo', 'jantan', 'kucing', 'Persia', '2024-05-26', 2, 4.50, 'belum', '2026-05-26 02:47:19', '2026-05-26 02:47:19'),
(2, 2, 'Bobby', 'jantan', 'anjing', 'Golden Retriever', '2023-05-26', 3, 25.00, 'belum', '2026-05-26 02:47:19', '2026-05-26 02:47:19'),
(3, 3, 'Kiko', 'jantan', 'kelinci', 'Lop', '2026-01-26', 0, 1.20, 'belum', '2026-05-26 02:47:19', '2026-05-26 02:47:19'),
(4, 4, 'Mochi', 'betina', 'hamster', 'Syria', '2026-02-26', 0, 0.08, 'belum', '2026-05-26 02:47:19', '2026-05-26 02:47:19'),
(5, 5, 'Joko', 'jantan', 'ayam', 'Bangkok', '2025-05-26', 1, 2.00, 'belum', '2026-05-26 02:47:19', '2026-05-26 02:47:19'),
(6, 6, 'Moyo', 'jantan', 'kambing', 'Etawa', '2024-05-26', 2, 35.00, 'belum', '2026-05-26 02:47:19', '2026-05-26 02:47:19'),
(7, 7, 'Sapi Limosin', 'jantan', 'sapi', 'Limosin', '2022-05-26', 4, 450.00, 'belum', '2026-05-26 02:47:19', '2026-05-26 02:47:19'),
(8, 8, 'Kerbau', 'jantan', 'kerbau', 'Lokal', '2021-05-26', 5, 500.00, 'belum', '2026-05-26 02:47:19', '2026-05-26 02:47:19'),
(9, 9, 'Domba', 'betina', 'domba', 'Priangan', '2024-05-26', 2, 25.00, 'belum', '2026-05-26 02:47:19', '2026-05-26 02:47:19'),
(10, 10, 'Kuda', 'jantan', 'kuda', 'Lombok', '2020-05-26', 6, 320.00, 'belum', '2026-05-26 02:47:19', '2026-05-26 02:47:19'),
(11, 11, 'Onyet', 'jantan', 'monyet', 'Ekor Panjang', '2022-05-26', 4, 7.50, 'belum', '2026-05-26 02:47:19', '2026-05-26 02:47:19'),
(12, 12, 'Kicau Mania', 'jantan', 'burung', 'Lovebird', '2025-05-26', 1, 0.05, 'belum', '2026-05-26 02:47:19', '2026-05-26 02:47:19'),
(13, 13, 'Loli', 'tidak_diketahui', 'ikan', 'Koi', '2024-05-26', 2, 0.50, 'belum', '2026-05-26 02:47:19', '2026-05-26 02:47:19'),
(14, 1, 'gembrot', 'betina', 'anjing', 'upn', '2025-05-26', 1, 3.00, 'sudah', '2026-05-26 07:54:28', '2026-05-26 07:54:28');

-- --------------------------------------------------------

--
-- Table structure for table `resep_obat`
--

CREATE TABLE `resep_obat` (
  `id_resep` int(11) NOT NULL,
  `id_pemesanan` int(11) NOT NULL,
  `tipe_pemesanan` enum('online','offline') NOT NULL,
  `id_dokter` int(11) NOT NULL,
  `id_apoteker` int(11) DEFAULT NULL,
  `tanggal_resep` date NOT NULL,
  `status` enum('belum_diproses','diproses','selesai','batal','diambil') NOT NULL DEFAULT 'belum_diproses',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `resep_obat`
--

INSERT INTO `resep_obat` (`id_resep`, `id_pemesanan`, `tipe_pemesanan`, `id_dokter`, `id_apoteker`, `tanggal_resep`, `status`, `created_at`) VALUES
(7, 47, 'online', 13, NULL, '2026-05-26', 'belum_diproses', '2026-05-26 03:07:27'),
(8, 48, 'online', 27, NULL, '2026-05-26', 'belum_diproses', '2026-05-26 03:13:58'),
(9, 49, 'online', 36, NULL, '2026-05-26', 'belum_diproses', '2026-05-26 03:19:27'),
(10, 51, 'online', 102, NULL, '2026-05-26', 'belum_diproses', '2026-05-26 03:25:32'),
(11, 52, 'online', 18, NULL, '2026-05-26', 'belum_diproses', '2026-05-26 03:31:55'),
(12, 53, 'online', 56, NULL, '2026-05-26', 'belum_diproses', '2026-05-26 03:36:45'),
(13, 54, 'online', 99, NULL, '2026-05-26', 'diambil', '2026-05-26 03:41:42'),
(14, 55, 'online', 60, NULL, '2026-05-26', 'diambil', '2026-05-26 03:46:45'),
(15, 58, 'online', 76, NULL, '2026-05-26', 'belum_diproses', '2026-05-26 03:55:26'),
(16, 59, 'online', 7, NULL, '2026-05-26', 'diambil', '2026-05-26 08:56:43');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`id_admin`),
  ADD UNIQUE KEY `username` (`username`),
  ADD UNIQUE KEY `email` (`email`),
  ADD UNIQUE KEY `unique_username` (`username`);

--
-- Indexes for table `alergi_pet`
--
ALTER TABLE `alergi_pet`
  ADD PRIMARY KEY (`id_alergi`),
  ADD KEY `id_pet` (`id_pet`),
  ADD KEY `id_obat` (`id_obat`);

--
-- Indexes for table `chat`
--
ALTER TABLE `chat`
  ADD PRIMARY KEY (`id_chat`);

--
-- Indexes for table `detail_biaya_offline`
--
ALTER TABLE `detail_biaya_offline`
  ADD PRIMARY KEY (`id_detail`),
  ADD KEY `id_antrean` (`id_antrean`);

--
-- Indexes for table `detail_resep`
--
ALTER TABLE `detail_resep`
  ADD PRIMARY KEY (`id_detail`),
  ADD KEY `id_resep` (`id_resep`),
  ADD KEY `id_obat` (`id_obat`);

--
-- Indexes for table `dokter`
--
ALTER TABLE `dokter`
  ADD PRIMARY KEY (`id_dokter`),
  ADD UNIQUE KEY `unique_username` (`username`);

--
-- Indexes for table `kupon`
--
ALTER TABLE `kupon`
  ADD PRIMARY KEY (`id_kupon`),
  ADD UNIQUE KEY `kode` (`kode`);

--
-- Indexes for table `obat`
--
ALTER TABLE `obat`
  ADD PRIMARY KEY (`id_obat`);

--
-- Indexes for table `pembelian_obat`
--
ALTER TABLE `pembelian_obat`
  ADD PRIMARY KEY (`id_pembelian`),
  ADD UNIQUE KEY `kode_transaksi` (`kode_transaksi`),
  ADD KEY `id_pemilik` (`id_pemilik`),
  ADD KEY `id_obat` (`id_obat`);

--
-- Indexes for table `pemesanan_offline`
--
ALTER TABLE `pemesanan_offline`
  ADD PRIMARY KEY (`id_antrean`),
  ADD UNIQUE KEY `unique_antrean` (`id_dokter`,`tanggal_antrean`,`nomor_antrean`),
  ADD KEY `id_dokter` (`id_dokter`),
  ADD KEY `id_pemilik` (`id_pemilik`),
  ADD KEY `id_pet` (`id_pet`);

--
-- Indexes for table `pemesanan_online`
--
ALTER TABLE `pemesanan_online`
  ADD PRIMARY KEY (`id_pemesanan`),
  ADD UNIQUE KEY `kode_pemesanan` (`kode_pemesanan`),
  ADD KEY `id_pemilik` (`id_pemilik`),
  ADD KEY `id_dokter` (`id_dokter`),
  ADD KEY `id_pet` (`id_pet`);

--
-- Indexes for table `pemilik`
--
ALTER TABLE `pemilik`
  ADD PRIMARY KEY (`id_pemilik`),
  ADD UNIQUE KEY `unique_username` (`username`),
  ADD UNIQUE KEY `unique_email` (`email`);

--
-- Indexes for table `pets`
--
ALTER TABLE `pets`
  ADD PRIMARY KEY (`id_pet`),
  ADD KEY `id_pemilik` (`id_pemilik`);

--
-- Indexes for table `resep_obat`
--
ALTER TABLE `resep_obat`
  ADD PRIMARY KEY (`id_resep`),
  ADD KEY `id_dokter` (`id_dokter`),
  ADD KEY `id_apoteker` (`id_apoteker`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admin`
--
ALTER TABLE `admin`
  MODIFY `id_admin` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `alergi_pet`
--
ALTER TABLE `alergi_pet`
  MODIFY `id_alergi` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- AUTO_INCREMENT for table `chat`
--
ALTER TABLE `chat`
  MODIFY `id_chat` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=54;

--
-- AUTO_INCREMENT for table `detail_biaya_offline`
--
ALTER TABLE `detail_biaya_offline`
  MODIFY `id_detail` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `detail_resep`
--
ALTER TABLE `detail_resep`
  MODIFY `id_detail` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `dokter`
--
ALTER TABLE `dokter`
  MODIFY `id_dokter` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=109;

--
-- AUTO_INCREMENT for table `kupon`
--
ALTER TABLE `kupon`
  MODIFY `id_kupon` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28;

--
-- AUTO_INCREMENT for table `obat`
--
ALTER TABLE `obat`
  MODIFY `id_obat` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=251;

--
-- AUTO_INCREMENT for table `pembelian_obat`
--
ALTER TABLE `pembelian_obat`
  MODIFY `id_pembelian` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- AUTO_INCREMENT for table `pemesanan_offline`
--
ALTER TABLE `pemesanan_offline`
  MODIFY `id_antrean` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=33;

--
-- AUTO_INCREMENT for table `pemesanan_online`
--
ALTER TABLE `pemesanan_online`
  MODIFY `id_pemesanan` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=60;

--
-- AUTO_INCREMENT for table `pemilik`
--
ALTER TABLE `pemilik`
  MODIFY `id_pemilik` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;

--
-- AUTO_INCREMENT for table `pets`
--
ALTER TABLE `pets`
  MODIFY `id_pet` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `resep_obat`
--
ALTER TABLE `resep_obat`
  MODIFY `id_resep` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `alergi_pet`
--
ALTER TABLE `alergi_pet`
  ADD CONSTRAINT `alergi_pet_ibfk_1` FOREIGN KEY (`id_pet`) REFERENCES `pets` (`id_pet`) ON DELETE CASCADE,
  ADD CONSTRAINT `alergi_pet_ibfk_2` FOREIGN KEY (`id_obat`) REFERENCES `obat` (`id_obat`) ON DELETE CASCADE;

--
-- Constraints for table `detail_biaya_offline`
--
ALTER TABLE `detail_biaya_offline`
  ADD CONSTRAINT `detail_biaya_offline_ibfk_1` FOREIGN KEY (`id_antrean`) REFERENCES `pemesanan_offline` (`id_antrean`) ON DELETE CASCADE;

--
-- Constraints for table `detail_resep`
--
ALTER TABLE `detail_resep`
  ADD CONSTRAINT `detail_resep_ibfk_1` FOREIGN KEY (`id_resep`) REFERENCES `resep_obat` (`id_resep`) ON DELETE CASCADE,
  ADD CONSTRAINT `detail_resep_ibfk_2` FOREIGN KEY (`id_obat`) REFERENCES `obat` (`id_obat`) ON DELETE CASCADE;

--
-- Constraints for table `pembelian_obat`
--
ALTER TABLE `pembelian_obat`
  ADD CONSTRAINT `pembelian_obat_ibfk_1` FOREIGN KEY (`id_pemilik`) REFERENCES `pemilik` (`id_pemilik`) ON DELETE CASCADE,
  ADD CONSTRAINT `pembelian_obat_ibfk_2` FOREIGN KEY (`id_obat`) REFERENCES `obat` (`id_obat`);

--
-- Constraints for table `pemesanan_offline`
--
ALTER TABLE `pemesanan_offline`
  ADD CONSTRAINT `pemesanan_offline_ibfk_1` FOREIGN KEY (`id_dokter`) REFERENCES `dokter` (`id_dokter`) ON DELETE CASCADE,
  ADD CONSTRAINT `pemesanan_offline_ibfk_2` FOREIGN KEY (`id_pemilik`) REFERENCES `pemilik` (`id_pemilik`) ON DELETE CASCADE,
  ADD CONSTRAINT `pemesanan_offline_ibfk_3` FOREIGN KEY (`id_pet`) REFERENCES `pets` (`id_pet`) ON DELETE CASCADE;

--
-- Constraints for table `pemesanan_online`
--
ALTER TABLE `pemesanan_online`
  ADD CONSTRAINT `pemesanan_online_ibfk_1` FOREIGN KEY (`id_pemilik`) REFERENCES `pemilik` (`id_pemilik`) ON DELETE CASCADE,
  ADD CONSTRAINT `pemesanan_online_ibfk_2` FOREIGN KEY (`id_dokter`) REFERENCES `dokter` (`id_dokter`) ON DELETE CASCADE,
  ADD CONSTRAINT `pemesanan_online_ibfk_3` FOREIGN KEY (`id_pet`) REFERENCES `pets` (`id_pet`) ON DELETE CASCADE;

--
-- Constraints for table `pets`
--
ALTER TABLE `pets`
  ADD CONSTRAINT `pets_ibfk_1` FOREIGN KEY (`id_pemilik`) REFERENCES `pemilik` (`id_pemilik`) ON DELETE CASCADE;

--
-- Constraints for table `resep_obat`
--
ALTER TABLE `resep_obat`
  ADD CONSTRAINT `resep_obat_ibfk_1` FOREIGN KEY (`id_dokter`) REFERENCES `dokter` (`id_dokter`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
