DELIMITER $$

CREATE PROCEDURE albuns_do_artista(IN artista VARCHAR(45))
BEGIN 
    SELECT 
    ar.nome AS artista, al.nome AS album
FROM
    SpotifyClone.artistas ar
        INNER JOIN
    SpotifyClone.albuns al ON ar.artista_id = al.artista_id
    WHERE ar.nome = artista;
END $$ 

DELIMITER ;
