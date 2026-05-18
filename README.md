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

//buncis bosok
// masukin ini dulu jangsn langsung semuanya, soale gak nyambung
ALTER TABLE chat ADD COLUMN pengirim ENUM('dokter', 'pemilik') NOT NULL;
UPDATE chat SET pengirim = 'dokter' WHERE id_dokter IS NOT NULL AND id_pemilik IS NOT NULL;
UPDATE chat SET pengirim = 'pemilik' WHERE id_pemilik IS NOT NULL AND id_dokter IS NOT NULL;

// baru masukin ini
-- Update chat yang memiliki id_pemilik (berarti dari pemilik)
UPDATE chat SET pengirim = 'pemilik' WHERE id_pemilik IS NOT NULL AND (pengirim IS NULL OR pengirim = '');

-- Update chat yang memiliki id_dokter (berarti dari dokter)
UPDATE chat SET pengirim = 'dokter' WHERE id_dokter IS NOT NULL AND (pengirim IS NULL OR pengirim = '');
