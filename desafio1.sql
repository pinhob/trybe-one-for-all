DROP DATABASE IF EXISTS SpotifyClone;

CREATE DATABASE SpotifyClone;

USE SpotifyClone;

CREATE TABLE SpotifyClone.planos(
    plano_id INT auto_increment,
    plano VARCHAR(30) NOT NULL,
    valor_plano DECIMAL(4, 2) NOT NULL,
    PRIMARY KEY (plano_id)
);

CREATE TABLE SpotifyClone.users(
    user_id INT auto_increment,
    nome VARCHAR(30) NOT NULL,
    idade INT,
    plano_id INT NOT NULL,
    PRIMARY KEY(user_id),
    FOREIGN KEY (plano_id) REFERENCES planos(plano_id)
);

CREATE TABLE SpotifyClone.artistas(
    artista_id INT auto_increment,
    nome VARCHAR (30) NOT NULL,
    CONSTRAINT PRIMARY KEY (artista_id)
);

CREATE TABLE SpotifyClone.albuns(
    album_id INT auto_increment,
    nome VARCHAR (30) NOT NULL,
    artista_id INT NOT NULL,
    CONSTRAINT PRIMARY KEY (album_id),
    FOREIGN KEY (artista_id) REFERENCES artistas(artista_id)
);

CREATE TABLE SpotifyClone.cancoes(
    cancao_id INT auto_increment,
    nome VARCHAR (30) NOT NULL,
    album_id INT NOT NULL,
    CONSTRAINT PRIMARY KEY (cancao_id),
    FOREIGN KEY (album_id) REFERENCES albuns(album_id)
);

CREATE TABLE SpotifyClone.users_seguindo(
    user_id INT NOT NULL,
    artista_id INT NOT NULL, 
    CONSTRAINT PRIMARY KEY (user_id, artista_id),
    FOREIGN KEY (user_id) REFERENCES users(user_id),
    FOREIGN KEY (artista_id) REFERENCES artistas(artista_id)
);

CREATE TABLE users_historico(
    user_id INT NOT NULL,
    cancao_id INT NOT NULL, 
    PRIMARY KEY (user_id, cancao_id),
    FOREIGN KEY (user_id) REFERENCES users(user_id),
    FOREIGN KEY (cancao_id) REFERENCES cancoes(cancao_id)
);

INSERT INTO SpotifyClone.planos(plano, valor_plano)
VALUES 
    ('gratuito', 0),
    ('familiar', 7.99),
    ('universitário', 5.99);

INSERT INTO SpotifyClone.users(nome, idade, plano_id)
VALUES 
    ('Thati', 23, 1),
    ('Cintia', 35, 2),
    ('Bill', 20, 3),
    ('Roger', 45, 1);
    
INSERT INTO SpotifyClone.artistas(nome)
VALUES 
    ('Walter Phoenix'),
    ('Peter Strong'),
    ('Lance Day'),
    ('Freedie Shannon');
    
INSERT INTO SpotifyClone.albuns(nome, artista_id)
VALUES
    ('Envious', 1),
    ('Exuberant', 1),
    ('Hallowed Steam', 2),
    ('Incandescent', 3),
    ('Temporary Culture', 4);
    
INSERT INTO SpotifyClone.cancoes(nome, album_id)
VALUES
    ('Soul For Us', 1),
    ('Reflections Of Magic', 1),
    ('Dance With Her Own', 1),
    ('Troubles Of My Inner Fire', 2),
    ('Time Fireworks', 2),
    ('Magic Circus', 3),
    ('Honey So Do I', 3),
    ("Sweetie Let's Go Wild", 3),
    ('She Knows', 3),
    ('Fantasy For Me', 4),
    ('Celebration Of More', 4),
    ('Rock His Everything', 4),
    ('Home Forever', 4),
    ('Diamond Power', 4),
    ("Honey Let's Be Silly", 4),
    ('Thang Of Thunder', 5),
    ('Words Of Her Life', 5),
    ('Without My Streets', 5);
    
INSERT INTO SpotifyClone.users_seguindo(user_id, artista_id)
VALUES
    (1, 1),
    (1, 4),
    (1, 3),
    (2, 1),
    (2, 3),
    (3, 2),
    (3, 1),
    (4, 4);
    
INSERT INTO SpotifyClone.users_historico(user_id, cancao_id)
VALUES
    (1, 1),
    (1, 6),
    (1, 14),
    (1, 16),
    (2, 13),
    (2, 17),
    (2, 2),
    (2, 15),
    (3, 4),
    (3, 16),
    (3, 6),
    (4, 3),
    (4, 18),
    (4, 11);
