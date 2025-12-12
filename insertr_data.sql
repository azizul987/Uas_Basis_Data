-- 2. ISI DATA PRODUK (Pakai Procedure)
-- Format: (Nama, Harga, Stok)
CALL sp_tambah_produk('Buku Tulis Sidu', 5000, 100);
CALL sp_tambah_produk('Pulpen AE7 Hitam', 2500, 200);
CALL sp_tambah_produk('Penghapus Karet', 1000, 300);
CALL sp_tambah_produk('Spidol Papan Tulis', 8000, 50);
CALL sp_tambah_produk('Kertas HVS A4', 45000, 20);

-- 3. SIMULASI TRANSAKSI 1: Si Budi Belanja (LUNAS)
-- a. Budi buat pesanan baru. ID Pesanan disimpan di variabel @nota_budi
CALL sp_buat_pesanan(1, @nota_budi);

-- b. Budi masukkan barang ke keranjangnya (@nota_budi)
-- Format: (ID Pesanan, ID Produk, Jumlah)
-- ID Produk 1 = Buku, ID Produk 5 = Kertas HVS
CALL sp_tambah_item_pesanan(@nota_budi, 1, 10); -- Beli 10 Buku
CALL sp_tambah_item_pesanan(@nota_budi, 5, 1);  -- Beli 1 Rim Kertas

-- c. Budi Bayar ke Kasir
CALL sp_bayar_pesanan(@nota_budi);


-- 4. SIMULASI TRANSAKSI 2: Si Siti Belanja (MASIH PENDING/BELANJA)
-- a. Siti buat pesanan baru. ID disimpan di variabel @nota_siti
CALL sp_buat_pesanan(2, @nota_siti);

-- b. Siti masukkan barang
CALL sp_tambah_item_pesanan(@nota_siti, 2, 5); -- Beli 5 Pulpen
CALL sp_tambah_item_pesanan(@nota_siti, 3, 2); -- Beli 2 Penghapus

-- c. Siti BELUM bayar (Jangan panggil sp_bayar_pesanan)


-- 5. SIMULASI TRANSAKSI 3: Si Rudi (DIBATALKAN)
CALL sp_buat_pesanan(3, @nota_rudi);
CALL sp_tambah_item_pesanan(@nota_rudi, 4, 2); -- Beli 2 Spidol
-- Rudi berubah pikiran, cancel pesanan
CALL sp_batalkan_pesanan(@nota_rudi);