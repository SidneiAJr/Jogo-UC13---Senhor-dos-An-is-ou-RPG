CREATE DATABASE kalleotopia;

USE kalleotopia;

CREATE TABLE personagem (
   Id_personagem INT PRIMARY KEY AUTO_INCREMENT,
   nome_personagem VARCHAR(55) NOT NULL,
   classe VARCHAR(55) NOT NULL,
   dano INT NOT NULL,
   info_personagem TEXT
);

CREATE TABLE usuario (
  id_usuario INT PRIMARY KEY AUTO_INCREMENT,
  nome_usuario VARCHAR(55) NOT NULL,
  senha VARCHAR(255) NOT NULL,
  email VARCHAR(255) NOT NULL
);

CREATE TABLE classe (
  id_classe INT PRIMARY KEY AUTO_INCREMENT, 
  nome_classe VARCHAR(55) NOT NULL,
  info_classe TEXT NOT NULL,
  dano_classe INT NOT NULL,
  velocidadeAtaque_classe DECIMAL(4,2) NOT NULL,
  rouboVida_classe DECIMAL(4,2) NOT NULL
);

CREATE TABLE mobs (
  id_mob INT PRIMARY KEY AUTO_INCREMENT,
  nome_mob VARCHAR(55) NOT NULL
);

CREATE TABLE personagem_classe (
  id_personagem INT,
  id_classe INT,
  PRIMARY KEY (id_personagem, id_classe),
  FOREIGN KEY (id_personagem) REFERENCES personagem(Id_personagem),
  FOREIGN KEY (id_classe) REFERENCES classe(id_classe)
);
