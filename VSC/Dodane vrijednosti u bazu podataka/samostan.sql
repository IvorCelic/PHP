drop database if exists samostan;
create database samostan;
use samostan;

create table svecenik(
    svecenik_ID  int not null primary key auto_increment,
    ime          varchar(50) not null,
    prezime      varchar(50) not null,
    nadredeni    int 
);

create table posao(
    posao_ID    int not null primary key auto_increment,
    naziv       varchar(100) not null
);

create table svecenik_posao(
    svecenik int not null,
    posao    int not null
);

alter table svecenik add foreign key (nadredeni) references svecenik(svecenik_ID);

alter table svecenik_posao add foreign key (svecenik) references svecenik(svecenik_ID);
alter table svecenik_posao add foreign key (posao) references posao(posao_ID);


# 1-4
#select * from posao;
insert into posao (posao_ID, naziv) values
(null, 'držanje jutarnje mise'),
(null, 'ispvoijedanje'),
(null, 'sluga'),
(null, 'održavanje reda');


# 1-3
#select * from svecenik;
insert into svecenik (svecenik_ID, ime, prezime, nadredeni) values
(null, 'Josip', 'Dominiković', 1),
(null, 'Marko', 'Hralj', 1),
(null, 'Bogo', 'Božić', 1);


#select * from svecenik_posao;
insert into svecenik_posao (svecenik, posao) values
(1, 2), (1, 4),
(2, 3), (2, 2),
(3, 1), (3, 4);