DELIMITER $$

CREATE FUNCTION quantidade_musicas_no_historico(id INT)
RETURNS INT READS SQL DATA
BEGIN 
    DECLARE cancoes_total INT;
    SELECT 
        COUNT(cancao_id)
    FROM
        SpotifyClone.users_historico
    WHERE
        user_id = id
    GROUP BY user_id INTO cancoes_total;
    RETURN cancoes_total;
END $$

DELIMITER ;
