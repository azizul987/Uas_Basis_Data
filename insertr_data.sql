CALL sp_tambah_produk('Buku Tulis Sidu', 5000, 100);
CALL sp_tambah_produk('Pulpen AE7 Hitam', 2500, 200);
CALL sp_tambah_produk('Penghapus Karet', 1000, 300);
CALL sp_tambah_produk('Spidol Papan Tulis', 8000, 50);
CALL sp_tambah_produk('Kertas HVS A4', 45000, 20);

CALL sp_tambah_produk('Kertas HVS A4', 45000, -20);


CALL sp_buat_pesanan(1, @nota_budi);


CALL sp_tambah_item_pesanan(@nota_budi, 1, 10); -- Beli 10 Buku
CALL sp_tambah_item_pesanan(@nota_budi, 5, 1);  -- Beli 1 Rim Kertas


CALL sp_bayar_pesanan(@nota_budi);



CALL sp_buat_pesanan(2, @nota_siti);


CALL sp_tambah_item_pesanan(@nota_siti, 2, 5); -- Beli 5 Pulpen
CALL sp_tambah_item_pesanan(@nota_siti, 3, 2); -- Beli 2 Penghapus


CALL sp_buat_pesanan(3, @nota_rudi);
CALL sp_tambah_item_pesanan(@nota_rudi, 4, 2); -- Beli 2 Spidol


CALL sp_batalkan_pesanan(@nota_rudi);