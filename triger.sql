DELIMITER $$

-- Trigger A: Sebelum Insert Item (Cek Stok, Ambil Nama, Hitung Harga)
CREATE TRIGGER cek_stok_dan_harga_before_insert
BEFORE INSERT ON item_pesanan
FOR EACH ROW
BEGIN
    DECLARE stok_tersedia INT;
    DECLARE harga_satuan DECIMAL(10,2);
    DECLARE nama_produk_asli VARCHAR(100);

    SELECT stok, harga, nama_produk 
    INTO stok_tersedia, harga_satuan, nama_produk_asli
    FROM produk WHERE id_produk = NEW.id_produk;

    IF stok_tersedia < NEW.jumlah THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'GAGAL: Stok produk tidak mencukupi!';
    END IF;

    SET NEW.produk_yang_dibeli = nama_produk_asli;
    SET NEW.total_harga_per_item = harga_satuan * NEW.jumlah;
END$$

-- Trigger B: Setelah Insert Item (Potong Stok & Update Nota)
CREATE TRIGGER update_stok_dan_nota_after_insert
AFTER INSERT ON item_pesanan
FOR EACH ROW
BEGIN
    UPDATE produk 
    SET stok = stok - NEW.jumlah
    WHERE id_produk = NEW.id_produk;

    UPDATE pesanan 
    SET total_item = total_item + NEW.jumlah,
        total_harga = total_harga + NEW.total_harga_per_item
    WHERE id_pesanan = NEW.id_pesanan;
END$$

-- Trigger C: Restock jika Dibatalkan
CREATE TRIGGER restock_saat_pesanan_dibatalkan
AFTER UPDATE ON pesanan
FOR EACH ROW
BEGIN
    IF NEW.status_pesanan = 'Dibatalkan' AND OLD.status_pesanan != 'Dibatalkan' THEN
        UPDATE produk p
        INNER JOIN item_pesanan ip ON p.id_produk = ip.id_produk
        SET p.stok = p.stok + ip.jumlah
        WHERE ip.id_pesanan = NEW.id_pesanan;
    END IF;
END$$

DELIMITER ;