CREATE TABLE pembeli (
    id_pembeli INT AUTO_INCREMENT PRIMARY KEY,
    nama_pembeli VARCHAR(255) NOT NULL,
    nomor_telepon VARCHAR(20) NOT NULL, 
    alamat TEXT NOT NULL
);


CREATE TABLE produk (
    id_produk INT AUTO_INCREMENT PRIMARY KEY,
    nama_produk VARCHAR(255) NOT NULL,
    harga DECIMAL(10, 2) NOT NULL,     
    stok INT NOT NULL
);


CREATE TABLE pesanan (
    id_pesanan INT AUTO_INCREMENT PRIMARY KEY,
    id_pembeli INT NOT NULL,
    tanggal_pesanan DATETIME DEFAULT CURRENT_TIMESTAMP,
    total_item INT DEFAULT 0,           -- Default 0 biar Trigger yang isi
    total_harga DECIMAL(10, 2) DEFAULT 0, -- Default 0 biar Trigger yang isi
    status_pesanan ENUM('Pending', 'Lunas', 'Dibatalkan') NOT NULL,
    FOREIGN KEY (id_pembeli) REFERENCES pembeli(id_pembeli)
);


CREATE TABLE item_pesanan (
    id_item INT AUTO_INCREMENT PRIMARY KEY,
    id_pesanan INT,
    id_produk INT,
    produk_yang_dibeli VARCHAR(100), -- Diisi otomatis oleh Trigger
    jumlah INT,
    total_harga_per_item DECIMAL(10, 2), -- Diisi otomatis oleh Trigger
    FOREIGN KEY (id_pesanan) REFERENCES pesanan(id_pesanan),
    FOREIGN KEY (id_produk) REFERENCES produk(id_produk)
);