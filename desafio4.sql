CREATE VIEW top_3_artistas AS
    SELECT 
        a.nome AS artista, COUNT(us.artista_id) AS seguidores
    FROM
        SpotifyClone.users_seguindo us
            INNER JOIN
        SpotifyClone.artistas a ON us.artista_id = a.artista_id
    GROUP BY a.artista_id
    ORDER BY seguidores DESC , artista
    LIMIT 3;
