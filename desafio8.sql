-- Com base em: https://stackoverflow.com/questions/4798768/i-want-a-trigger-to-delete-from-2-tables-in-mysql
DELIMITER $$
CREATE TRIGGER trigger_usuario_delete
    BEFORE DELETE ON SpotifyClone.users
    FOR EACH ROW
BEGIN 
    DELETE FROM users_historico WHERE user_id = OLD.user_id;
DELETE FROM users_seguindo 
WHERE
    user_id = OLD.user_id;
END $$ 
DELIMITER ;