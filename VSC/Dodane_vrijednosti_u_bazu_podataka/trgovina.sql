drop database if exists trgovina;
create database trgovina default character set utf8;
use trgovina;
#c:\xampp\mysql\bin\mysql.exe -uivor -pivor --default_character_set=utf8 < d:\Programiranje\GitHub\PHP\VSC\dodane_vrijednosti_u_bazu_podataka\trgovina.sql
create table racun(
    racun_ID    int not null primary key auto_increment,
    datum       datetime,
    redni_broj  varchar(50),
    operater    int not null
);

create table stavka(
    stavka_ID   int not null primary key auto_increment,
    racun       int not null,
    proizvod    int not null,
    kolicina    varchar(50) not null
);

create table proizvod(
    proizvod_ID            int not null primary key auto_increment,
    naziv                  varchar(100) not null,
    cijena decimal(18,2)   not null
);

create table operater(
    operater_ID int null primary key auto_increment,
    ime varchar(100) not null,
    prezime varchar(100) not null,
    email varchar(200) not null
);

alter table racun add foreign key (operater) references operater(operater_ID);
alter table stavka add foreign key (proizvod) references proizvod(proizvod_ID);
alter table stavka add foreign key (racun) references racun(racun_ID);




#select * from operater;
# 1-3
insert into operater (operater_ID, ime, prezime, email) values
(null, 'Marko', 'Filipović', 'markofilipovic@gmail.com'),
(null, 'Tomislav', 'Perilin', 'tomoperilica@gmail.com'),
(null, 'Jasmin', 'Petrarka', 'petrojasa@gmail.com');



#select * from proizvod;
# 1-3
insert into proizvod (proizvod_ID, naziv, cijena) values
(null, 'Brašno', 10.99),
(null, 'Jaja', 6.99),
(null, 'Sky Cola', 7.00);


#select * from racun;
# 1-3
insert into racun (racun_ID, datum, redni_broj, operater) values
(null, '2019-11-16 10:15', '51.', 2),
(null, '2019-11-15 13:47', '20.', 1),
(null, '2019-11-15 15:00', '30.', 3);


#select * from stavka;
# 1-3
insert into stavka (stavka_ID, racun, proizvod, kolicina) values
(null, 2, 1, 2), (null, 2, 2, 3), (null, 2, 3, 6);
# 4-6
insert into stavka (stavka_ID, racun, proizvod, kolicina) values
(null, 1, 3, 2), (null, 1, 2, 3), (null, 1, 3, 6);


update operater set
    ime='Karlo' where operater_ID=1;

update racun set
    redni_broj='50.' where racun_ID=1;

delete from stavka where stavka_ID=1;
delete from stavka where stavka_ID=2;
delete from stavka where stavka_ID=3;
delete from stavka where stavka_ID=5;
delete from racun where racun_ID=2;