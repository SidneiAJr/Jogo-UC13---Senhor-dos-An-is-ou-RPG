Create database kalleotopia;

use kalleotopia;

create table personagem(
   Id_personagem int primary key auto_increment,
   nome_personagem varchar(55) not null,
   classe varchar(55) not null,
   dano int not null,
   info_personagem varchar(55)
);
create table usuário(
  id_usuario int primary key auto_increment,
  nome_usuario varchar(55) not null,
  senha varchar(255) not null,
  email varchar(255) not null
);

create table classe(
  id_classe primary key auto_increment, 
  nome_claae varchar(55) not null,
  info_classe varchar(55) not null,
  dano_classe int not null
);
create table mobs (
  id_mob primary key auto_increment,
  nome_mobs enum("slime","goblin") not null
);
