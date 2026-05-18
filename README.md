## Nambah database baru

CREATE UNIQUE INDEX IF NOT EXISTS unique_username ON dokter (username);

CREATE UNIQUE INDEX IF NOT EXISTS unique_username ON admin (username);

CREATE UNIQUE INDEX IF NOT EXISTS unique_username ON pemilik (username);
CREATE UNIQUE INDEX IF NOT EXISTS unique_email ON pemilik (email);

ALTER TABLE alergi_pet MODIFY id_obat INT NULL;

ALTER TABLE resep_obat 
MODIFY COLUMN status ENUM('belum_diproses','diproses','selesai','batal','diambil') 
NOT NULL DEFAULT 'belum_diproses';

//ipeh
ALTER TABLE pemesanan_offline 
ADD COLUMN biaya_jasa DECIMAL(15,2) DEFAULT 0 AFTER keluhan;

ALTER TABLE pemesanan_offline 
ADD COLUMN status_pembayaran ENUM('belum_bayar','lunas') DEFAULT 'belum_bayar' AFTER status_antrean;

ALTER TABLE pemesanan_offline 
ADD COLUMN total_biaya DECIMAL(15,2) DEFAULT 0 AFTER biaya_jasa;
