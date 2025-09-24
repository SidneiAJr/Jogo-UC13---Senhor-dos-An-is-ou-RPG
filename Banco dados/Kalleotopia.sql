CREATE DATABASE kalleotopia;

USE kalleotopia;

CREATE TABLE personagem (
   id_personagem INT PRIMARY KEY AUTO_INCREMENT,
   nome_personagem VARCHAR(55) NOT NULL,
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
  id_classe INT,
  FOREIGN KEY (id_classe) REFERENCES classe(id_classe)
);

CREATE TABLE personagem_classe (
  id_personagem INT,
  id_classe INT,
  FOREIGN KEY (id_personagem) REFERENCES personagem(Id_personagem),
  FOREIGN KEY (id_classe) REFERENCES classe(id_classe)
);

CREATE TABLE usuario_personagem(
id_personagem int not null,
id_usuario int not null,
FOREIGN KEY (id_personagem) REFERENCES personagem(Id_personagem),
FOREIGN KEY( id_usuario) REFERENCES usuario(id_usuario)
);

CREATE TABLE batalhas (
  id_batalha INT PRIMARY KEY AUTO_INCREMENT,
  id_personagem INT,
  id_mob INT,
  resultado VARCHAR(20) NOT NULL, -- vitoria, derrota, fuga
  xp_ganho INT,
  data_batalha TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  FOREIGN KEY (id_personagem) REFERENCES personagem(id_personagem),
  FOREIGN KEY (id_mob) REFERENCES mobs(id_mob)
);


/*
 ====Criando====
 1 - Classe dos Personagens
 2 - Criando Atributos Base
 3 - Criando Subclasse
*/

-- Insert das classes:
INSERT INTO classe (nome_classe, info_classe, dano_classe, velocidadeAtaque_classe, rouboVida_classe, mana)
VALUES 
("Guerreiro","Guerreiro Comum",10,0.75,0.5,0),
("Mago","Mago Arcano",7,0.50,0,100),
("Tank","Tank Comum",8,0.60,0,0),
("Berseker","Lutador Corpo a Corpo",5,0.75,0,0);


-- Insert da Evolução de Classe:
Insert into evolucao_classe (nome_evolucao,info_evolucao,id_classe)
values
("Super Guerreiro","Aumento de Vida e Dano Base",1),
("Mago Supremo Arcanista","Aumento de dados de Habilidade",2),
("Colosso Prime","Aumento de Vida e Resistencia",3),
("Caçador Supremo","Aumento de Roubo de Vida e Dano",4);

-- Inserido Mobs:
INSERT INTO mobs (nome_mob,dano_mob,mobilidade,xp_mob_drop)
VALUES
("Goblin",2,1,5),
("Golem",5,1,50),
("Super Golem",20,1,500),
("Dark Golem X",2000,1,5000),
("Ariete Suprema",20000,1,50000),
("O Supremo",2000000,1,500);

