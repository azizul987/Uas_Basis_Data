SELECT * FROM produk;
SELECT * FROM pembeli;
-- CALL sp_tambah_produk('Kertas HVS A4', 45000, -20);
SELECT * from pesanan;
SELECT * from item_pesanan;
SELECT * FROM v_laporan_lengkap;

CALL sp_tambah_produk('Kertas HVS A4', 45000, -20);

CALL sp_tambah_pembeli('siti', '08123456589', 'Jawa Barat');

CALL sp_tambah_pembeli('Budi', '081234564789', 'Jakarta');

CALL sp_buat_pesanan(2, @nota_Budi);

CALL sp_tambah_item_pesanan(@nota_budi, 1, 10); 
CALL sp_tambah_item_pesanan(@nota_budi, 5, 1);  


CALL sp_bayar_pesanan(@nota_budi);

CALL sp_buat_pesanan(1, @nota_siti);

CALL sp_tambah_item_pesanan(@nota_siti, 4, 90); 
CALL sp_tambah_item_pesanan(@nota_siti, 4, 30); 

SELECT id_produk, nama_produk, stok FROM produk WHERE id_produk = 4;

CALL sp_batalkan_pesanan(@nota_siti);

SELECT id_pesanan, status_pesanan FROM pesanan WHERE id_pesanan = @nota_Budi;

SELECT id_pesanan, status_pesanan FROM pesanan WHERE id_pesanan = @nota_Siti;
 SELECT id_produk, nama_produk, stok FROM produk WHERE id_produk = 4;