-- create table pembeli (
--  id_pembeli int auto_increment primary key,
--  nama_pembeli varchar(255) not null,
--  nomor_telepon varchar(16) not null,
--  alamat text not null
-- );

-- create table produk(
-- 	id_produk int auto_increment primary key,
-- 	nama_produk varchar(255) not null,
-- 	harga int not null,
-- 	stok int not null
-- );

-- create table pesanan(
-- 	id_pesanan int auto_increment primary key,
--     id_pembeli int not null,
--     foreign key (id_pembeli) references Pembeli(id_pembeli),
--     tanggal_pesanan datetime not null,
-- 	tanggal_bayar DATETIME NULL,
--     total_item int not null,
-- 	total_harga int not null,
-- 	status_pesanan enum('pending','dibayar','dibatalkan') not null
-- );

-- CREATE TABLE item_pesanan (
--     id_item INT AUTO_INCREMENT PRIMARY KEY,
--     id_pesanan INT,
--     id_produk INT,
--     produk_yang_dibeli VARCHAR(100),           -- INI YANG ANDA TANYAKAN (Nama Produk Snapshot)
--     jumlah INT,                                -- Quantity
--     total_harga_per_item DECIMAL(10, 2),       -- (Harga x Jumlah)
--     FOREIGN KEY (id_pesanan) REFERENCES pesanan(id_pesanan),
--     FOREIGN KEY (id_produk) REFERENCES produk(id_produk)
-- );



-- ALTER TABLE pembeli MODIFY nomor_telepon VARCHAR(20) NOT NULL;
-- show tables;
-- desc pembeli

