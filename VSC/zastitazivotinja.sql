drop database if exists zastitazivotinja;
create database zastitazivotinja;
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

samoproba