drop database if exists zastitazivotinja;
create database zastitazivotinja default character set utf8;
#c:\xampp\mysql\bin\mysql.exe -uivor -pivor --default_character_set=utf8 < d:\Programiranje\GitHub\PHP\VSC\dodane_vrijednosti_u_bazu_podataka\zastitazivotinja.sql
use zastitazivotinja;

create table osoba (
    osoba_ID int not null primary key auto_increment,
    ime varchar(50) not null,
    prezime varchar(50) not null,
    mobitel varchar(20) not null
);

create table prostor (
    prostor_ID int not null primary key auto_increment,
    tip varchar(20),
    duzina decimal (18,2),
    sirina decimal (18,2),
    visina decimal (18,2),
    naziv varchar(50) not null
);

create table sticenik (
    sticenik_ID int not null primary key auto_increment,
    vrsta varchar(50) not null,
    ime varchar(50) not null,
    dob int not null,
    prostor int not null,
    prehrana varchar(50)
);


alter table sticenik add foreign key (prostor) references prostor(prostor_ID);

# 1-5
insert into osoba (osoba_ID, ime, prezime, mobitel) values
    (null, 'Ivor', 'Ćelić', '+385989634999'),
    (null, 'Luka', 'Vuk', '+385975698333'),
    (null, 'Marin', 'Perić', '+385915663412'),
    (null, 'Klokan', 'Klokanović', '+385955634135'),
    (null, 'Adolf', 'Hitler', '+491234555');

# 1-3
insert into prostor (prostor_ID, naziv) values
    (null, 'kavez'),
    (null, 'dvorište'),
    (null, 'terarij');

# 1-3
insert into sticenik (sticenik_ID, vrsta, ime, dob, prostor) values
    (null, 'pas', 'Maki', 5, 1),
    (null, 'mačka', 'Cezar', 7, 2),
    (null, 'zmija', 'Otrovnić', 10, 3);


update prostor set
    duzina=2.00,
    sirina=4.00,
    visina=2.00 where prostor_ID=1;
update prostor set
    duzina=20.00,
    sirina=30.00,
    visina=10.00 where prostor_ID=2;
update prostor set    
    duzina=2.00,
    sirina=4.00,
    visina=2.00 where prostor_ID=3;

delete from sticenik where sticenik_ID=3;
delete from prostor where prostor_ID=3;
    