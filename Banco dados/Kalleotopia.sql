CREATE DATABASE kalleotopia;

USE kalleotopia;

CREATE TABLE personagem (
   id_personagem INT PRIMARY KEY AUTO_INCREMENT,
   nome_personagem VARCHAR(55) NOT NULL,
   classe VARCHAR(55) NOT NULL,
   dano INT NOT NULL,
   info_personagem TEXT
);

CREATE TABLE usuario (
  id_usuario INT PRIMARY KEY AUTO_INCREMENT,
  nome_usuario VARCHAR(55) NOT NULL,
  senha VARCHAR(255) NOT NULL,
  email VARCHAR(255) NOT NULL UNIQUE
);

CREATE TABLE classe (
  id_classe INT PRIMARY KEY AUTO_INCREMENT, 
  nome_classe VARCHAR(55) NOT NULL,
  info_classe TEXT NOT NULL,
  dano_classe INT NOT NULL,
  velocidadeAtaque_classe DECIMAL(4,2) NOT NULL,
  rouboVida_classe DECIMAL(4,2) NOT NULL,
  mana int not null
);

CREATE TABLE mobs (
  id_mob INT PRIMARY KEY AUTO_INCREMENT,
  nome_mob VARCHAR(55) NOT NULL,
  dano_mob int not null,
  mobilidade int not null,
  xp_mob_drop int not null
);

CREATE TABLE evolucao_classe(
  id_evolucao int primary key auto_increment,
  nome_evolucao varchar(100) not null,
  info_evolucao varchar(100)not null,
  id_personagem INT,
FOREIGN KEY (id_personagem) REFERENCES personagem(Id_personagem)
);

CREATE TABLE personagem_classe (
  id_personagem INT,
  id_classe INT,
  PRIMARY KEY (id_personagem, id_classe),
  FOREIGN KEY (id_personagem) REFERENCES personagem(Id_personagem),
  FOREIGN KEY (id_classe) REFERENCES classe(id_classe)
);

CREATE TABLE usuario_personagem(
id_personagem int not null,
id_usuario int not null,
FOREIGN KEY (id_personagem) REFERENCES personagem(Id_personagem),
FOREIGN KEY( id_usuario) REFERENCES usuario(id_usuario)
);
