

-- Soru 1: 

SELECT SUM(total) AS toplam_fatura_miktari  -- Faturaların toplam miktarını hesapla ve toplam_fatura_miktari etiketiyle göster
FROM invoice                                -- invoice tablosundan veri seç
WHERE billing_country = 'USA'               -- Yalnızca "USA" ülkesine ait kayıtları filtrele
  AND EXTRACT(YEAR FROM invoice_date) = 2009; -- invoice_date sütunundan yıl değerini çek ve 2009 yılına ait kayıtları filtrele

-- Soru 2:

SELECT track.track_id,                             -- track_id sütununu seç
       track.name AS parça_adı,                    -- Parça adını seç ve parça_adı olarak etiketle
       playlist.name AS playlist_adı               -- Playlist adını seç ve playlist_adı olarak etiketle
FROM track                                         -- track tablosundan başla
INNER JOIN playlisttrack ON track.track_id = playlisttrack.track_id   -- track ve playlisttrack tablolarını track_id üzerinden birleştir
INNER JOIN playlist ON playlisttrack.playlist_id = playlist.playlist_id; -- playlisttrack ve playlist tablolarını playlist_id üzerinden birleştir

-- Soru 3: 

SELECT track.name AS parça_adı,                    -- Parça adını seç ve parça_adı olarak etiketle
       artist.name AS sanatçı_adı,                 -- Sanatçı adını seç ve sanatçı_adı olarak etiketle
       track.milliseconds                          -- Parça süresi (milliseconds) sütununu seç
FROM track                                         -- track tablosundan başla
INNER JOIN album ON track.album_id = album.album_id  -- track ve album tablolarını album_id üzerinden birleştir
INNER JOIN artist ON album.artist_id = artist.artist_id -- album ve artist tablolarını artist_id üzerinden birleştir
WHERE album.title = 'Let There Be Rock'            -- Yalnızca "Let There Be Rock" albümüne ait kayıtları filtrele
ORDER BY track.milliseconds DESC;                  -- Parça süresine (milliseconds) göre azalan sıralama yap
