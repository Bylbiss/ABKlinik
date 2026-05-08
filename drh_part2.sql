-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 08 Bulan Mei 2026 pada 18.57
-- Versi server: 10.4.32-MariaDB
-- Versi PHP: 8.2.12

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
-- Struktur dari tabel `admin`
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
-- Dumping data untuk tabel `admin`
--

INSERT INTO `admin` (`id_admin`, `username`, `password`, `nama`, `email`, `created_at`, `updated_at`) VALUES
(1, 'Bunciss', 'adminboss', 'Bylbiss El Haqqie', 'bylbiss@gmail.com', '2026-04-29 05:47:55', '2026-04-29 05:47:55'),
(2, 'Ipeh', 'minad', 'Alifah Chairul Munawar', 'orangimut@gmail.com', '2026-04-29 06:03:06', '2026-04-29 06:03:06');

-- --------------------------------------------------------

--
-- Struktur dari tabel `alergi_pet`
--

CREATE TABLE `alergi_pet` (
  `id_alergi` int(11) NOT NULL,
  `id_pet` int(11) NOT NULL,
  `id_obat` int(11) NOT NULL,
  `nama_alergi` text DEFAULT NULL,
  `created_by_type` enum('pemilik','dokter') NOT NULL,
  `created_by_id` int(11) NOT NULL,
  `status` enum('usulan','terverifikasi') DEFAULT 'usulan',
  `verified_by` int(11) DEFAULT NULL,
  `verified_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `apoteker`
--

CREATE TABLE `apoteker` (
  `id_apoteker` int(11) NOT NULL,
  `nama_apoteker` varchar(100) NOT NULL,
  `shift_kerja` varchar(50) NOT NULL,
  `no_hp` varchar(15) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `chat`
--

CREATE TABLE `chat` (
  `id_chat` int(11) NOT NULL,
  `id_dokter` int(11) DEFAULT NULL,
  `id_pemilik` int(11) DEFAULT NULL,
  `pesan` text DEFAULT NULL,
  `waktu` timestamp NOT NULL DEFAULT current_timestamp(),
  `status_baca` enum('unread','read') DEFAULT 'unread'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `detail_resep`
--

CREATE TABLE `detail_resep` (
  `id_detail` int(11) NOT NULL,
  `id_resep` int(11) NOT NULL,
  `id_obat` int(11) NOT NULL,
  `takaran` varchar(50) NOT NULL,
  `jumlah` int(11) NOT NULL,
  `catatan` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `dokter`
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
  `biaya_konsultasi` decimal(10,2) DEFAULT NULL,
  `spesies_hewan` text DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `dokter`
--

INSERT INTO `dokter` (`id_dokter`, `nama_depan`, `nama_belakang`, `username`, `password`, `email`, `alamat`, `no_hp`, `spesialisasi`, `biaya_konsultasi`, `spesies_hewan`, `created_at`, `updated_at`) VALUES
(1, 'Aidan', 'Elvano Pratama', 'aidan1', '8dd171', 'aidan.elvanopratama@abpaw.com', 'Jl. Kaliurang Km 5', '081234567890', 'Dokter Umum', 80000.00, 'ikan, burung, domba', '2026-04-29 07:50:57', '2026-05-06 22:57:28'),
(2, 'Keano', 'Alfarez Julian', 'keano2', 'e5bd91', 'keano.alfarezjulian@abpaw.com', 'Jl. Malioboro No.12', '082345678901', 'Spesialis Penyakit Dalam', 150000.00, 'ayam, kambing, kuda, kura-kura, hamster', '2026-04-29 07:50:57', '2026-05-06 22:57:28'),
(3, 'Zayden', 'Khalish Mahatma', 'zayden3', '69e6de', 'zayden.khalishmahatma@abpaw.com', 'Jl. Gejayan No.45', '083456789012', 'Spesialis Gigi', 150000.00, 'landak, sapi, musang, domba, hamster', '2026-04-29 07:50:57', '2026-05-06 22:57:28'),
(4, 'Ghaisan', 'Kenzo', 'ghaisan4', 'b8b32d', 'ghaisan.kenzo@abpaw.com', 'Jl. Parangtritis Km 6', '084567890123', 'Spesialis Parasitologi & Infeksi', 150000.00, 'kuda, hamster, domba, musang, monyet', '2026-04-29 07:50:57', '2026-05-06 22:57:28'),
(5, 'Zayn', 'Alby Rajendra', 'zayn5', 'be559f', 'zayn.albyrajendra@abpaw.com', 'Jl. Magelang Km 7', '085678901234', 'Spesialis Reproduksi', 150000.00, 'kerbau, kambing, kuda', '2026-04-29 07:50:57', '2026-05-06 22:57:28'),
(6, 'Ahmad', 'Fauzi Hasan', 'ahmad6', '0421ac', 'ahmad.fauzihasan@abpaw.com', 'Jl. Wonosari Km 8', '086789012345', 'Spesialis Gigi', 150000.00, 'ayam, kuda, kelinci, ikan', '2026-04-29 07:50:57', '2026-05-06 22:57:28'),
(7, 'Dewi', 'Kartika Sari', 'dewi7', 'efd823', 'dewi.kartikasari@abpaw.com', 'Jl. Imogiri Timur No.21', '087890123456', 'Spesialis Reproduksi', 150000.00, 'hamster, musang, anjing, kerbau, kuda', '2026-04-29 07:50:57', '2026-05-06 22:57:28'),
(8, 'Eko', 'Prasetyo Wibowo', 'eko8', '374ac9', 'eko.prasetyowibowo@abpaw.com', 'Jl. Bantul Km 9', '088901234567', 'Spesialis Parasitologi & Infeksi', 150000.00, 'sapi, kambing, kelinci, burung, domba', '2026-04-29 07:50:57', '2026-05-06 22:57:28'),
(9, 'Fitria', 'Nur Aini', 'fitria9', 'dd57ed', 'fitria.nuraini@abpaw.com', 'Jl. Godean Km 4', '089012345678', 'Spesialis Parasitologi & Infeksi', 150000.00, 'ikan, hamster, kerbau', '2026-04-29 07:50:57', '2026-05-06 22:57:28'),
(10, 'Gilang', 'Maulana Ibrahim', 'gilang10', '770fba', 'gilang.maulanaibrahim@abpaw.com', 'Jl. Kaliurang Km 10', '081112223334', 'Spesialis Reproduksi', 150000.00, 'kura-kura, monyet, kelinci', '2026-04-29 07:50:57', '2026-05-06 22:57:28'),
(11, 'Hani', 'Fadilah Zahra', 'hani11', 'effd5a', 'hani.fadilahzahra@abpaw.com', 'Jl. Malioboro No.22', '082223334445', 'Spesialis Penyakit Dalam', 150000.00, 'babi, kelinci, domba, ayam', '2026-04-29 07:50:57', '2026-05-06 22:57:28'),
(12, 'Indra', 'Kusuma Wardhana', 'indra12', 'c8486d', 'indra.kusumawardhana@abpaw.com', 'Jl. Gejayan No.67', '083334445556', 'Dokter Umum', 80000.00, 'monyet, kuda, burung, musang, ayam', '2026-04-29 07:50:57', '2026-05-06 22:57:28'),
(13, 'Joko', 'Susilo Adi', 'joko13', 'd7a1d5', 'joko.susiloadi@abpaw.com', 'Jl. Parangtritis Km 7', '084445556667', 'Spesialis Kulit', 150000.00, 'sapi, kerbau, babi, kuda, kucing', '2026-04-29 07:50:57', '2026-05-06 22:57:28'),
(14, 'Kartika', 'Sari Dewi', 'kartika14', 'ece2b2', 'kartika.saridewi@abpaw.com', 'Jl. Magelang Km 5', '085556667778', 'Dokter Umum', 80000.00, 'hamster, kambing, kuda, musang, domba', '2026-04-29 07:50:57', '2026-05-06 22:57:28'),
(15, 'Laksmi', 'Dewi Andini', 'laksmi15', '10ebfa', 'laksmi.dewiandini@abpaw.com', 'Jl. Wonosari Km 6', '086667778889', 'Spesialis Gigi', 150000.00, 'hamster, kura-kura, ayam, musang', '2026-04-29 07:50:57', '2026-05-06 22:57:28'),
(16, 'Mila', 'Rahmawati Putri', 'mila16', '494b65', 'mila.rahmawatiputri@abpaw.com', 'Jl. Imogiri Barat No.10', '087778889990', 'Spesialis Reproduksi', 150000.00, 'kerbau, landak, kura-kura, burung', '2026-04-29 07:50:57', '2026-05-06 22:57:28'),
(17, 'Nanda', 'Kurniawan Setiawan', 'nanda17', '188236', 'nanda.kurniawansetiawan@abpaw.com', 'Jl. Bantul Km 10', '088889990001', 'Spesialis Reproduksi', 150000.00, 'ayam, kuda, kucing, burung', '2026-04-29 07:50:57', '2026-05-06 22:57:28'),
(18, 'Olivia', 'Sari Puspita', 'olivia18', 'a1ce15', 'olivia.saripuspita@abpaw.com', 'Jl. Godean Km 6', '089990001112', 'Spesialis Kulit', 150000.00, 'kura-kura, kerbau, babi, ikan, ayam', '2026-04-29 07:50:57', '2026-05-06 22:57:28'),
(19, 'Putri', 'Ayu Lestari', 'putri19', '7d2249', 'putri.ayulestari@abpaw.com', 'Jl. Kaliurang Km 8', '081223344556', 'Dokter Umum', 80000.00, 'burung, kerbau, kura-kura, monyet, ikan', '2026-04-29 07:50:57', '2026-05-06 22:57:28'),
(20, 'Qori', 'Hidayatullah Firdaus', 'qori20', 'f1b808', 'qori.hidayatullahfirdaus@abpaw.com', 'Jl. Malioboro No.30', '082334455667', 'Spesialis Reproduksi', 150000.00, 'ayam, kuda, kerbau, kambing', '2026-04-29 07:50:57', '2026-05-06 22:57:28'),
(21, 'Rina', 'Amelia Putri', 'rina21', 'fdefe9', 'rina.ameliaputri@abpaw.com', 'Jl. Gejayan No.90', '083445566778', 'Spesialis Bedah', 150000.00, 'musang, kuda, kura-kura', '2026-04-29 07:50:57', '2026-05-06 22:57:28'),
(22, 'Sari', 'Yuliana Safitri', 'sari22', '6d87a9', 'sari.yulianasafitri@abpaw.com', 'Jl. Parangtritis Km 5', '084556677889', 'Spesialis Penyakit Dalam', 150000.00, 'kura-kura, kelinci, burung, kuda', '2026-04-29 07:50:57', '2026-05-06 22:57:28'),
(23, 'Teguh', 'Prasetyo Utomo', 'teguh23', '729147', 'teguh.prasetyoutomo@abpaw.com', 'Jl. Magelang Km 3', '085667788990', 'Dokter Umum', 80000.00, 'sapi, kucing, landak, babi', '2026-04-29 07:50:57', '2026-05-06 22:57:28'),
(24, 'Umi', 'Kalsum Azizah', 'umi24', 'a48f14', 'umi.kalsumazizah@abpaw.com', 'Jl. Wonosari Km 4', '086778899001', 'Spesialis Gigi', 150000.00, 'landak, burung, babi, anjing', '2026-04-29 07:50:57', '2026-05-06 22:57:28'),
(25, 'Vina', 'Meliana Putri', 'vina25', '8e994e', 'vina.melianaputri@abpaw.com', 'Jl. Imogiri Timur No.5', '087889900112', 'Spesialis Kulit', 150000.00, 'ayam, ikan, kelinci', '2026-04-29 07:50:57', '2026-05-06 22:57:28'),
(26, 'Wawan', 'Setiawan Budi', 'wawan26', 'ab37ed', 'wawan.setiawanbudi@abpaw.com', 'Jl. Bantul Km 11', '088990011223', 'Spesialis Kulit', 150000.00, 'sapi, babi, ikan, kelinci', '2026-04-29 07:50:57', '2026-05-06 22:57:28'),
(27, 'Xenia', 'Ayu Kirana', 'xenia27', 'db544b', 'xenia.ayukirana@abpaw.com', 'Jl. Godean Km 7', '089001122334', 'Dokter Umum', 80000.00, 'anjing, kambing, kerbau, ikan', '2026-04-29 07:50:57', '2026-05-06 22:57:28'),
(28, 'Yuni', 'Susilawati Indah', 'yuni28', '2f123b', 'yuni.susilawatiindah@abpaw.com', 'Jl. Kaliurang Km 12', '081334455667', 'Spesialis Reproduksi', 150000.00, 'babi, musang, anjing, kuda, ikan', '2026-04-29 07:50:57', '2026-05-06 22:57:28'),
(29, 'Zaki', 'Ahmad Firdaus', 'zaki29', 'b2b387', 'zaki.ahmadfirdaus@abpaw.com', 'Jl. Malioboro No.40', '082445566778', 'Spesialis Parasitologi & Infeksi', 150000.00, 'ikan, hamster, sapi', '2026-04-29 07:50:57', '2026-05-06 22:57:28'),
(30, 'Ani', 'Mardiana Wati', 'ani30', '26f8df', 'ani.mardianawati@abpaw.com', 'Jl. Gejayan No.100', '083556677889', 'Spesialis Parasitologi & Infeksi', 150000.00, 'anjing, kucing, sapi, babi, domba', '2026-04-29 07:50:57', '2026-05-06 22:57:28'),
(31, 'Ahmad', 'Rizki Maulana Syahputra', 'ahmad31', '9d4aba', 'ahmad.rizkimaulanasyahputra@abpaw.com', 'Jl. Parangtritis Km 9', '084667788990', 'Spesialis Reproduksi', 150000.00, 'musang, ikan, sapi, domba, kucing', '2026-04-29 07:50:57', '2026-05-06 22:57:28'),
(32, 'Dewi', 'Lestari Ayu Ningsih', 'dewi32', '749567', 'dewi.lestariayuningsih@abpaw.com', 'Jl. Magelang Km 2', '085778899001', 'Spesialis Bedah', 150000.00, 'sapi, kelinci, kuda, musang', '2026-04-29 07:50:57', '2026-05-06 22:57:28'),
(33, 'Eko', 'Budi Santoso Raharjo', 'eko33', '9cc668', 'eko.budisantosoraharjo@abpaw.com', 'Jl. Wonosari Km 10', '086889900112', 'Dokter Umum', 80000.00, 'burung, landak, anjing, kucing', '2026-04-29 07:50:57', '2026-05-06 22:57:28'),
(34, 'Fitri', 'Handayani Sari Utami', 'fitri34', '344038', 'fitri.handayanisariutami@abpaw.com', 'Jl. Imogiri Barat No.15', '087990011223', 'Spesialis Parasitologi & Infeksi', 150000.00, 'kerbau, kelinci, kucing', '2026-04-29 07:50:57', '2026-05-06 22:57:28'),
(35, 'Gita', 'Puspita Ayu Lestari', 'gita35', '49a3ff', 'gita.puspitaayulestari@abpaw.com', 'Jl. Bantul Km 12', '088001122334', 'Spesialis Reproduksi', 150000.00, 'ikan, kura-kura, domba, kerbau, babi', '2026-04-29 07:50:57', '2026-05-06 22:57:28'),
(36, 'Hadi', 'Prasetyo Wibowo Saputra', 'hadi36', '74690c', 'hadi.prasetyowibowosaputra@abpaw.com', 'Jl. Godean Km 8', '089112233445', 'Dokter Umum', 80000.00, 'monyet, landak, kelinci, ayam', '2026-04-29 07:50:57', '2026-05-06 22:57:28'),
(37, 'Indah', 'Permata Sari Dewi', 'indah37', '669132', 'indah.permatasaridewi@abpaw.com', 'Jl. Kaliurang Km 15', '081556677889', 'Spesialis Reproduksi', 150000.00, 'babi, musang, ikan, kuda', '2026-04-29 07:50:57', '2026-05-06 22:57:28'),
(38, 'Joko', 'Prasetyo Hadi Susilo', 'joko38', '0e9aed', 'joko.prasetyohadisusilo@abpaw.com', 'Jl. Malioboro No.50', '082667788990', 'Dokter Umum', 80000.00, 'monyet, domba, kerbau, kuda', '2026-04-29 07:50:57', '2026-05-06 22:57:28'),
(39, 'Kartika', 'Ayu Dewi Lestari', 'kartika39', 'e21aa1', 'kartika.ayudewilestari@abpaw.com', 'Jl. Gejayan No.120', '083778899001', 'Spesialis Kulit', 150000.00, 'sapi, musang, burung', '2026-04-29 07:50:57', '2026-05-06 22:57:28'),
(40, 'Lina', 'Marlina Sari Puspita', 'lina40', 'c2bbd9', 'lina.marlinasaripuspita@abpaw.com', 'Jl. Parangtritis Km 11', '084889900112', 'Spesialis Kulit', 150000.00, 'musang, monyet, kucing, landak', '2026-04-29 07:50:57', '2026-05-06 22:57:28'),
(41, 'Mila', 'Nurul Aini Fadhilah', 'mila41', '9ffe85', 'mila.nurulainifadhilah@abpaw.com', 'Jl. Magelang Km 6', '085990011223', 'Spesialis Gigi', 150000.00, 'musang, ayam, ikan', '2026-04-29 07:50:57', '2026-05-06 22:57:28'),
(42, 'Nanda', 'Kurniawan Hadi Putra', 'nanda42', '9af770', 'nanda.kurniawanhadiputra@abpaw.com', 'Jl. Wonosari Km 12', '086001122334', 'Spesialis Reproduksi', 150000.00, 'ikan, kura-kura, musang, kambing, burung', '2026-04-29 07:50:57', '2026-05-06 22:57:28'),
(43, 'Olivia', 'Grace Michelle Tan', 'olivia43', 'd15f8a', 'olivia.gracemichelletan@abpaw.com', 'Jl. Imogiri Timur No.8', '087112233445', 'Spesialis Gigi', 150000.00, 'sapi, kuda, musang, kerbau, domba', '2026-04-29 07:50:57', '2026-05-06 22:57:28'),
(44, 'Putri', 'Aulia Ramadhani Sari', 'putri44', 'e59fa6', 'putri.auliaramadhanisari@abpaw.com', 'Jl. Bantul Km 13', '088223344556', 'Spesialis Penyakit Dalam', 150000.00, 'kucing, musang, babi', '2026-04-29 07:50:57', '2026-05-06 22:57:28'),
(45, 'Qonita', 'Nur Hidayati Rahma', 'qonita45', 'f4efd4', 'qonita.nurhidayatirahma@abpaw.com', 'Jl. Godean Km 9', '089334455667', 'Spesialis Parasitologi & Infeksi', 150000.00, 'ayam, kuda, monyet', '2026-04-29 07:50:57', '2026-05-06 22:57:28'),
(46, 'Rina', 'Amelia Putri Sari', 'rina46', '63c4d3', 'rina.ameliaputrisari@abpaw.com', 'Jl. Kaliurang Km 20', '081667788990', 'Spesialis Reproduksi', 150000.00, 'ikan, landak, kelinci', '2026-04-29 07:50:57', '2026-05-06 22:57:28'),
(47, 'Sari', 'Ayu Wulandari Pratiwi', 'sari47', 'bc4a7a', 'sari.ayuwulandaripratiwi@abpaw.com', 'Jl. Malioboro No.60', '082778899001', 'Spesialis Kulit', 150000.00, 'monyet, musang, babi, domba, burung', '2026-04-29 07:50:57', '2026-05-06 22:57:28'),
(48, 'Teguh', 'Prasetyo Utomo Saputro', 'teguh48', '0c18d5', 'teguh.prasetyoutomosaputro@abpaw.com', 'Jl. Gejayan No.140', '083889900112', 'Spesialis Penyakit Dalam', 150000.00, 'kambing, kuda, babi', '2026-04-29 07:50:57', '2026-05-06 22:57:28'),
(49, 'Umi', 'Kulsum Azizah Rahmawati', 'umi49', '34714a', 'umi.kulsumazizahrahmawati@abpaw.com', 'Jl. Parangtritis Km 13', '084990011223', 'Spesialis Kulit', 150000.00, 'kuda, kambing, ayam, domba, babi', '2026-04-29 07:50:57', '2026-05-06 22:57:28'),
(50, 'Vera', 'Meliana Putri Indah', 'vera50', '7fa1d0', 'vera.melianaputriindah@abpaw.com', 'Jl. Magelang Km 9', '085001122334', 'Spesialis Bedah', 150000.00, 'anjing, monyet, ayam, kambing, kura-kura', '2026-04-29 07:50:57', '2026-05-06 22:57:28'),
(51, 'Wawan', 'Setiawan Budi Utomo', 'wawan51', 'cc02ba', 'wawan.setiawanbudiutomo@abpaw.com', 'Jl. Wonosari Km 14', '086112233445', 'Spesialis Penyakit Dalam', 150000.00, 'kura-kura, anjing, domba, musang', '2026-04-29 07:50:57', '2026-05-06 22:57:28'),
(52, 'Xander', 'Ahmad Fatin Wilopo', 'xander52', '8e7156', 'xander.ahmadfatinwilopo@abpaw.com', 'Jl. Imogiri Barat No.20', '087223344556', 'Spesialis Penyakit Dalam', 150000.00, 'kerbau, kelinci, monyet, domba, kucing', '2026-04-29 07:50:57', '2026-05-06 22:57:28'),
(53, 'Yuni', 'Susilawati Indah Permata', 'yuni53', '3eb444', 'yuni.susilawatiindahpermata@abpaw.com', 'Jl. Bantul Km 14', '088334455667', 'Spesialis Penyakit Dalam', 150000.00, 'domba, kerbau, musang', '2026-04-29 07:50:57', '2026-05-06 22:57:28'),
(54, 'Zaskia', 'Adinda Meutia Hafsari', 'zaskia54', 'cb54fa', 'zaskia.adindameutiahafsari@abpaw.com', 'Jl. Godean Km 10', '089445566778', 'Spesialis Parasitologi & Infeksi', 150000.00, 'babi, kelinci, kambing', '2026-04-29 07:50:57', '2026-05-06 22:57:28'),
(55, 'Agus', 'Salim Nur Hasanudin', 'agus55', '5d847c', 'agus.salimnurhasanudin@abpaw.com', 'Jl. Kaliurang Km 18', '081778899001', 'Spesialis Reproduksi', 150000.00, 'sapi, kambing, kucing', '2026-04-29 07:50:57', '2026-05-06 22:57:28'),
(56, 'Aneska', 'Zoya Raveena', 'aneska56', '6d67e4', 'aneska.zoyaraveena@abpaw.com', 'Jl. Kaliurang No. 45', '081234567891', 'Dokter Umum', 80000.00, 'ayam, ikan, sapi, kambing', '2026-04-29 07:58:43', '2026-05-06 22:57:28'),
(57, 'Arisha', 'Yonna Tanu', 'arisha57', '0e8ebe', 'arisha.yonnatanu@abpaw.com', 'Jl. Gejayan No. 12', '082345678912', 'Spesialis Bedah', 150000.00, 'musang, kambing, kuda', '2026-04-29 07:58:43', '2026-05-06 22:57:28'),
(58, 'Alesha', NULL, 'alesha58', 'b4b4ba', '', 'Jl. Colombo No. 78', '083456789123', 'Spesialis Kulit', 150000.00, 'kuda, kucing, babi, kambing, anjing', '2026-04-29 07:58:43', '2026-05-06 22:57:28'),
(59, 'Aresha', 'Ravan Arabella', 'aresha59', '54f8a1', 'aresha.ravanarabella@abpaw.com', 'Jl. Magelang No. 56', '084567891234', 'Spesialis Gigi', 150000.00, 'ikan, sapi, ayam, babi', '2026-04-29 07:58:43', '2026-05-06 22:57:28'),
(60, 'Abila', 'Rezfan Azkadina', 'abila60', 'dbd6e0', 'abila.rezfanazkadina@abpaw.com', 'Jl. Affandi No. 34', '085678912345', 'Dokter Umum', 80000.00, 'landak, kerbau, ayam, ikan', '2026-04-29 07:58:43', '2026-05-06 22:57:28'),
(61, 'Aurora', 'Ridha Zetana', 'aurora61', 'e18368', 'aurora.ridhazetana@abpaw.com', 'Jl. Bantul No. 67', '086789123456', 'Spesialis Parasitologi & Infeksi', 150000.00, 'burung, monyet, hamster, kambing', '2026-04-29 07:58:43', '2026-05-06 22:57:28'),
(62, 'Aariz', 'Abrar Maalik', 'aariz62', 'c3cec7', 'aariz.abrarmaalik@abpaw.com', 'Jl. Seturan No. 89', '087891234567', 'Dokter Umum', 80000.00, 'kelinci, kura-kura, anjing', '2026-04-29 07:58:43', '2026-05-06 22:57:28'),
(63, 'Abid', 'Azhar Mubarak', 'abid63', '08e912', 'abid.azharmubarak@abpaw.com', 'Jl. Babarsari No. 23', '088912345678', 'Spesialis Reproduksi', 150000.00, 'anjing, ikan, hamster', '2026-04-29 07:58:43', '2026-05-06 22:57:28'),
(64, 'Adnan', 'Aiman Hafidz', 'adnan64', '75a8a8', 'adnan.aimanhafidz@abpaw.com', 'Jl. Janti No. 45', '089123456789', 'Spesialis Gigi', 150000.00, 'kura-kura, hamster, kerbau, kuda, ayam', '2026-04-29 07:58:43', '2026-05-06 22:57:28'),
(65, 'Aksa', 'Althaf Rafiqi', 'aksa65', 'a6f0d9', 'aksa.althafrafiqi@abpaw.com', 'Jl. Ringroad Utara No. 12', '081234567890', 'Spesialis Reproduksi', 150000.00, 'landak, kerbau, musang, domba', '2026-04-29 07:58:43', '2026-05-06 22:57:28'),
(66, 'Alif', 'Arsyad Ghazi', 'alif66', '513cf4', 'alif.arsyadghazi@abpaw.com', 'Jl. Wates No. 34', '082345678901', 'Spesialis Penyakit Dalam', 150000.00, 'kerbau, hamster, landak, monyet, sapi', '2026-04-29 07:58:43', '2026-05-06 22:57:28'),
(67, 'Athalla', 'Alfarizi Akbar', 'athalla67', 'b65a85', 'athalla.alfariziakbar@abpaw.com', 'Jl. Godean No. 56', '083456789012', 'Spesialis Penyakit Dalam', 150000.00, 'anjing, monyet, musang, hamster, sapi', '2026-04-29 07:58:43', '2026-05-06 22:57:28'),
(68, 'Azriel', 'Aqil Ibrahim', 'azriel68', '0a6d3c', 'azriel.aqilibrahim@abpaw.com', 'Jl. Parangtritis No. 78', '084567890123', 'Spesialis Penyakit Dalam', 150000.00, 'babi, hamster, kambing, kura-kura', '2026-04-29 07:58:43', '2026-05-06 22:57:28'),
(69, 'Bagas', 'Dewantara Sakti', 'bagas69', '369aa0', 'bagas.dewantarasakti@abpaw.com', 'Jl. Imogiri No. 90', '085678901234', 'Spesialis Gigi', 150000.00, 'musang, sapi, hamster, kuda', '2026-04-29 07:58:43', '2026-05-06 22:57:28'),
(70, 'Bagaskara', 'Aditya Nugraha', 'bagaskara70', '34932e', 'bagaskara.adityanugraha@abpaw.com', 'Jl. Wonosari No. 11', '086789012345', 'Spesialis Parasitologi & Infeksi', 150000.00, 'kura-kura, sapi, kuda, domba, babi', '2026-04-29 07:58:43', '2026-05-06 22:57:28'),
(71, 'Baldwin', 'Aditya Wardhana', 'baldwin71', 'f3981e', 'baldwin.adityawardhana@abpaw.com', 'Jl. Prambanan No. 22', '087890123456', 'Spesialis Bedah', 150000.00, 'kelinci, sapi, ikan, kerbau', '2026-04-29 07:58:43', '2026-05-06 22:57:28'),
(72, 'Bara', 'Aditya Nugraha', 'bara72', '5f1c40', 'bara.adityanugraha@abpaw.com', 'Jl. Raya Yogya-Solo No. 33', '088901234567', 'Spesialis Parasitologi & Infeksi', 150000.00, 'monyet, kambing, ayam, kura-kura, hamster', '2026-04-29 07:58:43', '2026-05-06 22:57:28'),
(73, 'Barata', 'Wisnu Tama', 'barata73', 'bedda1', 'barata.wisnutama@abpaw.com', 'Jl. Raya Yogya-Magelang No. 44', '089012345678', 'Spesialis Gigi', 150000.00, 'domba, babi, kerbau, ayam, kuda', '2026-04-29 07:58:43', '2026-05-06 22:57:28'),
(74, 'Baruna', 'Jagat Raya', 'baruna74', '0feb9a', 'baruna.jagatraya@abpaw.com', 'Jl. Monjali No. 55', '081123456789', 'Spesialis Bedah', 150000.00, 'ikan, domba, kelinci', '2026-04-29 07:58:43', '2026-05-06 22:57:28'),
(75, 'Bhisma', 'Yudha Pratama', 'bhisma75', '6e354e', 'bhisma.yudhapratama@abpaw.com', 'Jl. Sudirman No. 66', '082234567890', 'Spesialis Kulit', 150000.00, 'hamster, monyet, kucing', '2026-04-29 07:58:43', '2026-05-06 22:57:28'),
(76, 'Bryan', 'Kenzo Pratama', 'bryan76', '8c652d', 'bryan.kenzopratama@abpaw.com', 'Jl. Malioboro No. 77', '083345678901', 'Spesialis Kulit', 150000.00, 'anjing, kuda, landak, kucing', '2026-04-29 07:58:43', '2026-05-06 22:57:28'),
(77, 'Oded', 'Zhafran Athalla', 'oded77', '96d40d', 'oded.zhafranathalla@abpaw.com', 'Jl. Sosrowijayan No. 88', '084456789012', 'Spesialis Kulit', 150000.00, 'ayam, domba, kucing', '2026-04-29 07:58:43', '2026-05-06 22:57:28'),
(78, 'Calvin', 'Alfarizi Pratama', 'calvin78', '8b8220', 'calvin.alfarizipratama@abpaw.com', 'Jl. Pasar Kembang No. 99', '085567890123', 'Spesialis Bedah', 150000.00, 'burung, kucing, monyet, landak', '2026-04-29 07:58:43', '2026-05-06 22:57:28'),
(79, 'Daniswara', 'Bagus Kaizen', 'daniswara79', '91fc5a', 'daniswara.baguskaizen@abpaw.com', 'Jl. Taman Siswa No. 10', '086678901234', 'Spesialis Bedah', 150000.00, 'kelinci, ikan, burung, sapi', '2026-04-29 07:58:43', '2026-05-06 22:57:28'),
(80, 'Ethan', 'Zayn Adrian', 'ethan80', '1921d6', 'ethan.zaynadrian@abpaw.com', 'Jl. Cik Di Tiro No. 20', '087789012345', 'Spesialis Parasitologi & Infeksi', 150000.00, 'ikan, burung, musang', '2026-04-29 07:58:43', '2026-05-06 22:57:28'),
(81, 'Fahreza', 'Zayn Hakim', 'fahreza81', '2db160', 'fahreza.zaynhakim@abpaw.com', 'Jl. Prof. Dr. Sardjito No. 30', '088890123456', 'Spesialis Reproduksi', 150000.00, 'kelinci, kambing, ayam', '2026-04-29 07:58:43', '2026-05-06 22:57:28'),
(82, 'Ghifari', 'Dzaki Faza', 'ghifari82', '2d6014', 'ghifari.dzakifaza@abpaw.com', 'Jl. KHA Dahlan No. 40', '089901234567', 'Spesialis Kulit', 150000.00, 'anjing, musang, kerbau', '2026-04-29 07:58:43', '2026-05-06 22:57:28'),
(83, 'Harith', 'Rayyan Zahran', 'harith83', '6efe35', 'harith.rayyanzahran@abpaw.com', 'Jl. Urip Sumoharjo No. 50', '081012345678', 'Dokter Umum', 80000.00, 'ikan, kucing, ayam', '2026-04-29 07:58:43', '2026-05-06 22:57:28'),
(84, 'Irfan', 'Rizqi Abdullah', 'irfan84', '17ee9c', 'irfan.rizqiabdullah@abpaw.com', 'Jl. Suryotomo No. 60', '082123456789', 'Spesialis Bedah', 150000.00, 'burung, kambing, sapi, kucing, anjing', '2026-04-29 07:58:43', '2026-05-06 22:57:28'),
(85, 'Jonathan', 'Noah Ezra', 'jonathan85', 'd6a3cc', 'jonathan.noahezra@abpaw.com', 'Jl. Mayor Suryotomo No. 70', '083234567890', 'Spesialis Parasitologi & Infeksi', 150000.00, 'kura-kura, ayam, kelinci', '2026-04-29 07:58:43', '2026-05-06 22:57:28'),
(86, 'Kharis', 'Kaelan Aksa', 'kharis86', '7bab03', 'kharis.kaelanaksa@abpaw.com', 'Jl. Brigjen Katamso No. 80', '084345678901', 'Spesialis Gigi', 150000.00, 'hamster, kambing, kuda', '2026-04-29 07:58:43', '2026-05-06 22:57:28'),
(87, 'Luthfi', 'Rafi Alfarizi', 'luthfi87', '97e1cb', 'luthfi.rafialfarizi@abpaw.com', 'Jl. Kusumanegara No. 90', '085456789012', 'Spesialis Gigi', 150000.00, 'sapi, burung, landak', '2026-04-29 07:58:43', '2026-05-06 22:57:28'),
(88, 'Milan', 'Alvaro Putra', 'milan88', '316f27', 'milan.alvaroputra@abpaw.com', 'Jl. Adisucipto No. 100', '086567890123', 'Spesialis Penyakit Dalam', 150000.00, 'burung, kuda, kucing, landak, ayam', '2026-04-29 07:58:43', '2026-05-06 22:57:28'),
(89, 'Nathaniel', 'Kaelan Satria', 'nathaniel89', '7e5650', 'nathaniel.kaelansatria@abpaw.com', 'Jl. Laksda Adisucipto No. 110', '087678901234', 'Dokter Umum', 80000.00, 'burung, kucing, hamster', '2026-04-29 07:58:43', '2026-05-06 22:57:28'),
(90, 'Prasetya', 'Dwipa Aji', 'prasetya90', 'ba1b5f', 'prasetya.dwipaaji@abpaw.com', 'Jl. Raya Janti No. 120', '088789012345', 'Spesialis Reproduksi', 150000.00, 'domba, ayam, kucing, kerbau, kambing', '2026-04-29 07:58:43', '2026-05-06 22:57:28'),
(91, 'Qamil', 'Haikal Athala', 'qamil91', '0df5f6', 'qamil.haikalathala@abpaw.com', 'Jl. Ringroad Selatan No. 130', '089890123456', 'Spesialis Parasitologi & Infeksi', 150000.00, 'landak, musang, ikan', '2026-04-29 07:58:43', '2026-05-06 22:57:28'),
(92, 'Rayhan', 'Kaelan Narendra', 'rayhan92', 'c5830f', 'rayhan.kaelannarendra@abpaw.com', 'Jl. Bantu No. 140', '081901234567', 'Spesialis Bedah', 150000.00, 'domba, kuda, landak, anjing', '2026-04-29 07:58:43', '2026-05-06 22:57:28'),
(93, 'Syafiq', 'Rizky Ananda', 'syafiq93', 'df2979', 'syafiq.rizkyananda@abpaw.com', 'Jl. Gamping No. 150', '082012345678', 'Spesialis Gigi', 150000.00, 'kerbau, monyet, sapi, kura-kura, musang', '2026-04-29 07:58:43', '2026-05-06 22:57:28'),
(94, 'Tegar', 'Bagaskara Wijaya', 'tegar94', 'ce46f5', 'tegar.bagaskarawijaya@abpaw.com', 'Jl. Sagan No. 160', '083123456789', 'Spesialis Gigi', 150000.00, 'kura-kura, monyet, ayam, domba', '2026-04-29 07:58:43', '2026-05-06 22:57:28'),
(95, 'Uzair', 'Faza Azzam', 'uzair95', '42bc54', 'uzair.fazaazzam@abpaw.com', 'Jl. C. Simanjuntak No. 170', '084234567890', 'Spesialis Kulit', 150000.00, 'ikan, kura-kura, babi', '2026-04-29 07:58:43', '2026-05-06 22:57:28'),
(96, 'Vincent', 'Ethan Alvaro', 'vincent96', '7f3c9b', 'vincent.ethanalvaro@abpaw.com', 'Jl. Gedong Kuning No. 180', '085345678901', 'Spesialis Kulit', 150000.00, 'babi, hamster, kambing', '2026-04-29 07:58:43', '2026-05-06 22:57:28'),
(97, 'Warren', 'Kenzo Pratama', 'warren97', '4c9d0b', 'warren.kenzopratama@abpaw.com', 'Jl. Ngadisuryan No. 190', '086456789012', 'Spesialis Parasitologi & Infeksi', 150000.00, 'kambing, kerbau, hamster, ikan', '2026-04-29 07:58:43', '2026-05-06 22:57:28'),
(98, 'Yudhistira', 'Abhimanyu Arjuna', 'yudhistira98', '80a6d8', 'yudhistira.abhimanyuarjuna@abpaw.com', 'Jl. Prawirotaman No. 200', '087567890123', 'Spesialis Parasitologi & Infeksi', 150000.00, 'ayam, kuda, kerbau, kambing, monyet', '2026-04-29 07:58:43', '2026-05-06 22:57:28'),
(99, 'Zhian', 'Farras Arshakalif', 'zhian99', '6c25b9', 'zhian.farrasarshakalif@abpaw.com', 'Jl. Tirtodipuran No. 210', '088678901234', 'Spesialis Kulit', 150000.00, 'monyet, sapi, kambing', '2026-04-29 07:58:43', '2026-05-06 22:57:28'),
(100, 'Bylbiss', 'El Haqqie', 'bylbiss100', 'c2d548', 'bylbiss.elhaqqie@abpaw.com', 'Jl. Veteran No. 12', '088803178628', 'Spesialis Parasitologi & Infeksi', 150000.00, 'kelinci, musang, anjing, hamster', '2026-04-29 07:58:43', '2026-05-06 22:57:28'),
(101, 'Alifah', 'Chairul Munawar', 'alifah101', 'ccdbd9', 'alifah.chairulmunawar@abpaw.com', 'Jl. Diponegoro No. 45', '081393706713', 'Spesialis Reproduksi', 150000.00, 'kerbau, kelinci, kura-kura', '2026-04-29 07:58:43', '2026-05-06 22:57:28'),
(102, 'Risya', 'Rizqiyah Haryati', 'risya102', '0efd52', 'risya.rizqiyahharyati@abpaw.com', 'Jl. Ahmad Yani No. 78', '088803178628', 'Dokter Umum', 80000.00, 'domba, kucing, hamster, kambing, kura-kura', '2026-04-29 07:58:43', '2026-05-06 22:57:28'),
(103, 'Agung', 'Dwi Ratna', 'agung103', 'e92709', 'agung.dwiratna@abpaw.com', 'Jl. Gatot Subroto No. 33', '081393706713', 'Spesialis Parasitologi & Infeksi', 150000.00, 'burung, musang, kuda, babi', '2026-04-29 07:58:43', '2026-05-06 22:57:28'),
(104, 'Hamim', 'Thohari', 'hamim104', '039aeb', 'hamim.thohari@abpaw.com', 'Jl. Sudirman No. 90', '088803178628', 'Spesialis Penyakit Dalam', 150000.00, 'kuda, burung, landak, hamster, anjing', '2026-04-29 07:58:43', '2026-05-06 22:57:28'),
(105, 'Siti', 'Azizah', 'siti105', 'd405f9', 'siti.azizah@abpaw.com', 'Jl. Pahlawan No. 21', '081393706713', 'Spesialis Bedah', 150000.00, 'kucing, burung, kelinci, musang', '2026-04-29 07:58:43', '2026-05-06 22:57:28'),
(106, 'Azza', 'Wulandari', 'azza106', 'c50bee', 'azza.wulandari@abpaw.com', 'Jl. Merdeka No. 55', '088803178628', 'Spesialis Gigi', 150000.00, 'landak, kura-kura, kambing, musang', '2026-04-29 07:58:43', '2026-05-06 22:57:28'),
(107, 'Khusnul', 'Khuluq', 'khusnul107', 'c18dc1', 'khusnul.khuluq@abpaw.com', 'Jl. Kartini No. 17', '081393706713', 'Dokter Umum', 80000.00, 'landak, kambing, domba', '2026-04-29 07:58:43', '2026-05-06 22:57:28'),
(108, 'Abid', 'Mustaauliya', 'abid108', 'dfaabe', 'abid.mustaauliya@abpaw.com', 'Jl. Raya Bogor No. 66', '088803178628', 'Spesialis Penyakit Dalam', 150000.00, 'monyet, ayam, kuda', '2026-04-29 07:58:43', '2026-05-06 22:57:28');

-- --------------------------------------------------------

--
-- Struktur dari tabel `kupon`
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

-- --------------------------------------------------------

--
-- Struktur dari tabel `obat`
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

-- --------------------------------------------------------

--
-- Struktur dari tabel `pemesanan_offline`
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
  `status_antrean` enum('menunggu','diproses','selesai','batal') DEFAULT 'menunggu',
  `estimasi_waktu` time DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `pemesanan_online`
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
  `status_pemesanan` enum('menunggu','sudah bayar','selesai','batal') DEFAULT 'menunggu',
  `waktu_pemesanan` datetime NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `pemilik`
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

-- --------------------------------------------------------

--
-- Struktur dari tabel `pets`
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

-- --------------------------------------------------------

--
-- Struktur dari tabel `resep_obat`
--

CREATE TABLE `resep_obat` (
  `id_resep` int(11) NOT NULL,
  `id_pemesanan` int(11) NOT NULL,
  `tipe_pemesanan` enum('online','offline') NOT NULL,
  `id_dokter` int(11) NOT NULL,
  `id_apoteker` int(11) DEFAULT NULL,
  `tanggal_resep` date NOT NULL,
  `status` enum('belum_diproses','diproses','selesai') DEFAULT 'belum_diproses',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`id_admin`),
  ADD UNIQUE KEY `username` (`username`),
  ADD UNIQUE KEY `email` (`email`);

--
-- Indeks untuk tabel `alergi_pet`
--
ALTER TABLE `alergi_pet`
  ADD PRIMARY KEY (`id_alergi`),
  ADD KEY `id_pet` (`id_pet`),
  ADD KEY `id_obat` (`id_obat`);

--
-- Indeks untuk tabel `apoteker`
--
ALTER TABLE `apoteker`
  ADD PRIMARY KEY (`id_apoteker`);

--
-- Indeks untuk tabel `chat`
--
ALTER TABLE `chat`
  ADD PRIMARY KEY (`id_chat`);

--
-- Indeks untuk tabel `detail_resep`
--
ALTER TABLE `detail_resep`
  ADD PRIMARY KEY (`id_detail`),
  ADD KEY `id_resep` (`id_resep`),
  ADD KEY `id_obat` (`id_obat`);

--
-- Indeks untuk tabel `dokter`
--
ALTER TABLE `dokter`
  ADD PRIMARY KEY (`id_dokter`);

--
-- Indeks untuk tabel `kupon`
--
ALTER TABLE `kupon`
  ADD PRIMARY KEY (`id_kupon`),
  ADD UNIQUE KEY `kode` (`kode`);

--
-- Indeks untuk tabel `obat`
--
ALTER TABLE `obat`
  ADD PRIMARY KEY (`id_obat`);

--
-- Indeks untuk tabel `pemesanan_offline`
--
ALTER TABLE `pemesanan_offline`
  ADD PRIMARY KEY (`id_antrean`),
  ADD UNIQUE KEY `unique_antrean` (`id_dokter`,`tanggal_antrean`,`nomor_antrean`),
  ADD KEY `id_dokter` (`id_dokter`),
  ADD KEY `id_pemilik` (`id_pemilik`),
  ADD KEY `id_pet` (`id_pet`);

--
-- Indeks untuk tabel `pemesanan_online`
--
ALTER TABLE `pemesanan_online`
  ADD PRIMARY KEY (`id_pemesanan`),
  ADD UNIQUE KEY `kode_pemesanan` (`kode_pemesanan`),
  ADD KEY `id_pemilik` (`id_pemilik`),
  ADD KEY `id_dokter` (`id_dokter`),
  ADD KEY `id_pet` (`id_pet`);

--
-- Indeks untuk tabel `pemilik`
--
ALTER TABLE `pemilik`
  ADD PRIMARY KEY (`id_pemilik`),
  ADD UNIQUE KEY `email` (`email`);

--
-- Indeks untuk tabel `pets`
--
ALTER TABLE `pets`
  ADD PRIMARY KEY (`id_pet`),
  ADD KEY `id_pemilik` (`id_pemilik`);

--
-- Indeks untuk tabel `resep_obat`
--
ALTER TABLE `resep_obat`
  ADD PRIMARY KEY (`id_resep`),
  ADD KEY `id_dokter` (`id_dokter`),
  ADD KEY `id_apoteker` (`id_apoteker`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `admin`
--
ALTER TABLE `admin`
  MODIFY `id_admin` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT untuk tabel `alergi_pet`
--
ALTER TABLE `alergi_pet`
  MODIFY `id_alergi` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `apoteker`
--
ALTER TABLE `apoteker`
  MODIFY `id_apoteker` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `chat`
--
ALTER TABLE `chat`
  MODIFY `id_chat` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `detail_resep`
--
ALTER TABLE `detail_resep`
  MODIFY `id_detail` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `dokter`
--
ALTER TABLE `dokter`
  MODIFY `id_dokter` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=110;

--
-- AUTO_INCREMENT untuk tabel `kupon`
--
ALTER TABLE `kupon`
  MODIFY `id_kupon` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `obat`
--
ALTER TABLE `obat`
  MODIFY `id_obat` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `pemesanan_offline`
--
ALTER TABLE `pemesanan_offline`
  MODIFY `id_antrean` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `pemesanan_online`
--
ALTER TABLE `pemesanan_online`
  MODIFY `id_pemesanan` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `pemilik`
--
ALTER TABLE `pemilik`
  MODIFY `id_pemilik` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `pets`
--
ALTER TABLE `pets`
  MODIFY `id_pet` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `resep_obat`
--
ALTER TABLE `resep_obat`
  MODIFY `id_resep` int(11) NOT NULL AUTO_INCREMENT;

--
-- Ketidakleluasaan untuk tabel pelimpahan (Dumped Tables)
--

--
-- Ketidakleluasaan untuk tabel `alergi_pet`
--
ALTER TABLE `alergi_pet`
  ADD CONSTRAINT `alergi_pet_ibfk_1` FOREIGN KEY (`id_pet`) REFERENCES `pets` (`id_pet`) ON DELETE CASCADE,
  ADD CONSTRAINT `alergi_pet_ibfk_2` FOREIGN KEY (`id_obat`) REFERENCES `obat` (`id_obat`) ON DELETE CASCADE;

--
-- Ketidakleluasaan untuk tabel `detail_resep`
--
ALTER TABLE `detail_resep`
  ADD CONSTRAINT `detail_resep_ibfk_1` FOREIGN KEY (`id_resep`) REFERENCES `resep_obat` (`id_resep`) ON DELETE CASCADE,
  ADD CONSTRAINT `detail_resep_ibfk_2` FOREIGN KEY (`id_obat`) REFERENCES `obat` (`id_obat`) ON DELETE CASCADE;

--
-- Ketidakleluasaan untuk tabel `pemesanan_offline`
--
ALTER TABLE `pemesanan_offline`
  ADD CONSTRAINT `pemesanan_offline_ibfk_1` FOREIGN KEY (`id_dokter`) REFERENCES `dokter` (`id_dokter`) ON DELETE CASCADE,
  ADD CONSTRAINT `pemesanan_offline_ibfk_2` FOREIGN KEY (`id_pemilik`) REFERENCES `pemilik` (`id_pemilik`) ON DELETE CASCADE,
  ADD CONSTRAINT `pemesanan_offline_ibfk_3` FOREIGN KEY (`id_pet`) REFERENCES `pets` (`id_pet`) ON DELETE CASCADE;

--
-- Ketidakleluasaan untuk tabel `pemesanan_online`
--
ALTER TABLE `pemesanan_online`
  ADD CONSTRAINT `pemesanan_online_ibfk_1` FOREIGN KEY (`id_pemilik`) REFERENCES `pemilik` (`id_pemilik`) ON DELETE CASCADE,
  ADD CONSTRAINT `pemesanan_online_ibfk_2` FOREIGN KEY (`id_dokter`) REFERENCES `dokter` (`id_dokter`) ON DELETE CASCADE,
  ADD CONSTRAINT `pemesanan_online_ibfk_3` FOREIGN KEY (`id_pet`) REFERENCES `pets` (`id_pet`) ON DELETE CASCADE;

--
-- Ketidakleluasaan untuk tabel `pets`
--
ALTER TABLE `pets`
  ADD CONSTRAINT `pets_ibfk_1` FOREIGN KEY (`id_pemilik`) REFERENCES `pemilik` (`id_pemilik`) ON DELETE CASCADE;

--
-- Ketidakleluasaan untuk tabel `resep_obat`
--
ALTER TABLE `resep_obat`
  ADD CONSTRAINT `resep_obat_ibfk_1` FOREIGN KEY (`id_dokter`) REFERENCES `dokter` (`id_dokter`) ON DELETE CASCADE,
  ADD CONSTRAINT `resep_obat_ibfk_2` FOREIGN KEY (`id_apoteker`) REFERENCES `apoteker` (`id_apoteker`) ON DELETE SET NULL;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
