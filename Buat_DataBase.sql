
-- create database toko_kelompok_1
-- show databases;
-- use toko_kelompok_1;

-- create table Pembeli (
--  id_pembeli int auto_increment primary key,
--  nama_pembeli varchar(255) not null,
--  nomor_telpon int(16) not null,
--  alamat text not null
-- );

-- create table Produk(
-- 	id_produk int auto_increment primary key,
-- 	nama_produk varchar(255) not null,
-- 	harga int not null,
-- 	stok int not null
-- );

-- create table Pesanan(
-- 	id_pesanan int auto_increment primary key,
--     id_pembeli int not null,
--     foreign key (id_pembeli) references Pembeli(id_pembeli),
--     tanggal_pesanan datetime not null,
--     total_item int not null,
-- 	total_harga int not null,
-- 	status_pesanan enum('pending','dibayar','dibatalkan') not null
-- );

-- create table Item_Pesanan(
-- 	id_item int not null,
--     id_pesanan int not null,
--     id_produk int not null,
--     produk_yang_dibeli text not null,
--     jumlah int not null,
--     total_harga_per_item text not null,
--     foreign key(id_pesanan) references Pesanan(id_pesanan),
--     foreign key(id_produk) references Produk(id_produk)
-- );
