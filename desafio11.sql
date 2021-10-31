CREATE VIEW cancoes_premium AS
    SELECT 
        c.nome AS nome, COUNT(uh.cancao_id) AS reproducoes
    FROM
        SpotifyClone.cancoes c
            INNER JOIN
        SpotifyClone.users_historico uh ON c.cancao_id = uh.cancao_id
            INNER JOIN
        SpotifyClone.users u ON uh.user_id = u.user_id
    WHERE
        u.plano_id = 2 OR u.plano_id = 3
    GROUP BY c.cancao_id
    ORDER BY nome;
