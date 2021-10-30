CREATE VIEW perfil_artistas AS
    SELECT 
        ar.nome AS artista,
        al.nome AS album,
        COUNT(us.artista_id) AS seguidores
    FROM
        SpotifyClone.artistas ar
            INNER JOIN
        SpotifyClone.albuns al ON ar.artista_id = al.artista_id
            INNER JOIN
        SpotifyClone.users_seguindo us ON ar.artista_id = us.artista_id
    GROUP BY al.album_id
    ORDER BY seguidores DESC , artista , album;
