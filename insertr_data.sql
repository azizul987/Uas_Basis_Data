CALL sp_tambah_produk('Buku Tulis Sidu', 5000, 100);
CALL sp_tambah_produk('Pulpen AE7 Hitam', 2500, 200);
CALL sp_tambah_produk('Penghapus Karet', 1000, 300);
CALL sp_tambah_produk('Spidol Papan Tulis', 8000, 50);
CALL sp_tambah_produk('Kertas HVS A4', 45000, 20);


-- select * from produk;

-- CALL sp_tambah_pembeli('Budi', '081234564789', 'Jakarta');
-- CALL sp_tambah_pembeli('siti', '08123456589', 'Jawa Barat');
-- CALL sp_tambah_pembeli('rudi', '0812345676', 'Palembang');
-- CALL sp_buat_pesanan(1, @nota_budi);


-- CALL sp_tambah_item_pesanan(@nota_budi, 1, 10); -- Beli 10 Buku
-- CALL sp_tambah_item_pesanan(@nota_budi, 5, 1);  -- Beli 1 Rim Kertas


-- CALL sp_bayar_pesanan(@nota_budi);






-- CALL sp_buat_pesanan(3, @nota_rudi);
-- CALL sp_tambah_item_pesanan(@nota_rudi, 4, 2); -- Beli 2 Spidol


-- CALL sp_batalkan_pesanan(@nota_rudi);

-- SELECT * FROM v_laporan_lengkap;