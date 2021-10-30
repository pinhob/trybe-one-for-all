CREATE VIEW top_2_hits_do_momento AS
    SELECT 
        c.nome AS cancao, COUNT(uh.cancao_id) AS reproducoes
    FROM
        SpotifyClone.users_historico uh
            INNER JOIN
        SpotifyClone.cancoes c ON c.cancao_id = uh.cancao_id
    GROUP BY cancao
    ORDER BY reproducoes DESC , cancao
    LIMIT 2;