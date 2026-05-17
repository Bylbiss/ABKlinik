## Nambah database baru

CREATE UNIQUE INDEX IF NOT EXISTS unique_username ON dokter (username);

CREATE UNIQUE INDEX IF NOT EXISTS unique_username ON admin (username);

CREATE UNIQUE INDEX IF NOT EXISTS unique_username ON pemilik (username);
CREATE UNIQUE INDEX IF NOT EXISTS unique_email ON pemilik (email);

ALTER TABLE alergi_pet MODIFY id_obat INT NULL;

ALTER TABLE resep_obat 
MODIFY COLUMN status ENUM('belum_diproses','diproses','selesai','batal','diambil') 
NOT NULL DEFAULT 'belum_diproses';
