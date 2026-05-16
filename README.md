## Nambah database baru
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

ALTER TABLE pemesanan_online 
MODIFY status_pemesanan ENUM('menunggu','sudah bayar','diproses','selesai','batal');
