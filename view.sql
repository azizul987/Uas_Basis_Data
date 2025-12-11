CREATE OR REPLACE VIEW v_laporan_lengkap AS
SELECT 
    p.id_pesanan AS 'ID Nota',
    p.tanggal_pesanan AS 'Tanggal',
    cust.nama_pembeli AS 'Pembeli',
    pr.nama_produk AS 'Barang',
    ip.jumlah AS 'Qty',
    ip.total_harga_per_item AS 'Subtotal',
    p.status_pesanan AS 'Status'
FROM pesanan p
JOIN pembeli cust ON p.id_pembeli = cust.id_pembeli
JOIN item_pesanan ip ON p.id_pesanan = ip.id_pesanan
JOIN produk pr ON ip.id_produk = pr.id_produk
ORDER BY p.tanggal_pesanan DESC;

SELECT * FROM v_laporan_lengkap;