DELIMITER $$

-- ====================================================
-- 1. [ADMIN] Tambah Produk Baru
-- ====================================================
DROP PROCEDURE IF EXISTS sp_tambah_produk$$
CREATE PROCEDURE sp_tambah_produk(
    IN p_nama VARCHAR(100), 
    IN p_harga DECIMAL(10,2), 
    IN p_stok INT
)
BEGIN
    INSERT INTO produk (nama_produk, harga, stok) 
    VALUES (p_nama, p_harga, p_stok);
END$$

-- ====================================================
-- 2. [ADMIN] Tambah Stok Gudang (Restock)
-- ====================================================
DROP PROCEDURE IF EXISTS sp_tambah_stok_gudang$$
CREATE PROCEDURE sp_tambah_stok_gudang(IN p_id_produk INT, IN p_jumlah INT)
BEGIN
    UPDATE produk SET stok = stok + p_jumlah WHERE id_produk = p_id_produk;
END$$

-- ====================================================
-- 3. [USER] Buat Keranjang/Pesanan Baru
-- ====================================================
DROP PROCEDURE IF EXISTS sp_buat_pesanan$$
CREATE PROCEDURE sp_buat_pesanan(IN p_id_pembeli INT, OUT p_id_pesanan_baru INT)
BEGIN
    -- Kita insert default Pending. Total harga & item biarkan 0 (Trigger yg urus nanti)
    INSERT INTO pesanan (id_pembeli, status_pesanan) VALUES (p_id_pembeli, 'Pending');
    SET p_id_pesanan_baru = LAST_INSERT_ID(); 
END$$

-- ====================================================
-- 4. [USER] Masukkan Barang ke Keranjang
-- ====================================================
DROP PROCEDURE IF EXISTS sp_tambah_item_pesanan$$
CREATE PROCEDURE sp_tambah_item_pesanan(IN p_id_pesanan INT, IN p_id_produk INT, IN p_jumlah INT)
BEGIN
    -- Cukup insert ID & Jumlah. Trigger 'before_insert' akan urus harga & nama otomatis!
    INSERT INTO item_pesanan (id_pesanan, id_produk, jumlah) 
    VALUES (p_id_pesanan, p_id_produk, p_jumlah);
END$$

-- ====================================================
-- 5. [KASIR] Bayar Pesanan (Ubah Status ke Lunas)
-- ====================================================
DROP PROCEDURE IF EXISTS sp_bayar_pesanan$$
CREATE PROCEDURE sp_bayar_pesanan(IN p_id_pesanan INT)
BEGIN
    -- Perbaikan: Sesuaikan status jadi 'Lunas' (bukan Dibayar)
    -- Perbaikan: Hapus tanggal_bayar karena kolomnya tidak ada di tabel kita
    UPDATE pesanan 
    SET status_pesanan = 'Lunas'
    WHERE id_pesanan = p_id_pesanan;
END$$

-- ====================================================
-- 6. [KASIR/USER] Batalkan Pesanan
-- ====================================================
DROP PROCEDURE IF EXISTS sp_batalkan_pesanan$$
CREATE PROCEDURE sp_batalkan_pesanan(IN p_id_pesanan INT)
BEGIN
    UPDATE pesanan SET status_pesanan = 'Dibatalkan' WHERE id_pesanan = p_id_pesanan;
END$$

-- ====================================================
-- 7. [LAPORAN] Harian
-- ====================================================
DROP PROCEDURE IF EXISTS sp_laporan_harian$$
CREATE PROCEDURE sp_laporan_harian(IN p_tanggal DATE)
BEGIN
    -- Menggunakan View v_laporan_lengkap
    SELECT `ID Nota`, `Pembeli`, SUM(`Subtotal`) as total_trx, `Status`
    FROM v_laporan_lengkap
    WHERE DATE(`Tanggal`) = p_tanggal AND `Status` != 'Dibatalkan'
    GROUP BY `ID Nota`, `Pembeli`, `Status`;
END$$

-- ====================================================
-- 8. [LAPORAN] Bulanan (Produk Terlaris)
-- ====================================================
DROP PROCEDURE IF EXISTS sp_laporan_bulanan$$
CREATE PROCEDURE sp_laporan_bulanan(IN p_bulan INT, IN p_tahun INT)
BEGIN
    SELECT `Barang`, SUM(`Qty`) as terjual, SUM(`Subtotal`) as omzet
    FROM v_laporan_lengkap
    WHERE MONTH(`Tanggal`) = p_bulan 
      AND YEAR(`Tanggal`) = p_tahun 
      AND `Status` = 'Lunas'
    GROUP BY `Barang` 
    ORDER BY terjual DESC;
END$$

DELIMITER ;