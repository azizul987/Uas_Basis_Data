DELIMITER $$
CREATE EVENT ev_auto_cancel_pesanan_kedaluwarsa
ON SCHEDULE EVERY 10 SECOND 
STARTS CURRENT_TIMESTAMP
DO
BEGIN
    UPDATE pesanan
    SET status_pesanan = 'Dibatalkan'
    WHERE status_pesanan = 'Pending' 
    AND tanggal_pesanan < (NOW() - INTERVAL 1 MINUTE); -- Cuma 1 menit lgsg batal
END$$
DELIMITER ;

-- alter event ev_auto_cancel_pesanan_kedaluwarsa disable;

-- ALTER EVENT ev_auto_cancel_pesanan_kedaluwarsa
-- ON SCHEDULE EVERY 30 SECOND;
