CREATE VIEW historico_reproducao_usuarios AS
    SELECT 
        u.nome AS usuario, c.nome AS nome
    FROM
        SpotifyClone.users u
            INNER JOIN
        SpotifyClone.users_historico uh ON u.user_id = uh.user_id
            INNER JOIN
        SpotifyClone.cancoes c ON uh.cancao_id = c.cancao_id
    ORDER BY u.nome , c.nome;
