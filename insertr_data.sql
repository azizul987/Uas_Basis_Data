INSERT INTO pembeli (nama_pembeli, nomor_telepon, alamat) VALUES
('Budi Santoso', '081234567890', 'Jl. Merdeka No. 10, Jakarta'),
('Siti Aminah', '085678901234', 'Jl. Kebon Jeruk No. 5, Bandung'),
('Rudi Hermawan', '081345678901', 'Jl. Sudirman No. 45, Surabaya');

-- 2. Insert Produk
INSERT INTO produk (nama_produk, harga, stok) VALUES
('Buku Tulis Sidu 58 Lembar', 5000, 100),
('Pulpen Standard AE7 Hitam', 2500, 200),
('Pensil 2B Faber Castell', 4000, 150),
('Penghapus Karet Kecil', 1000, 300),
('Kertas HVS A4 70gr (1 Rim)', 45000, 25);

-- 3. Insert Pesanan (HEADER SAJA, TOTAL BIAR TRIGGER YANG ISI)
INSERT INTO pesanan (id_pembeli, total_item, total_harga, status_pesanan) VALUES
(1, 0, 0, 'Lunas'),   -- Pesanan Budi
(2, 0, 0, 'Pending'); -- Pesanan Siti

-- 4. Insert Item Pesanan (CUKUP ID & JUMLAH, SISANYA OTOMATIS)
-- Budi beli 1 Rim Kertas & 2 Buku
INSERT INTO item_pesanan (id_pesanan, id_produk, jumlah) VALUES
(1, 5, 1), 
(1, 1, 2);

-- Siti beli 2 Pulpen & 1 Pensil
INSERT INTO item_pesanan (id_pesanan, id_produk, jumlah) VALUES
(2, 2, 2),   
(2, 3, 1);