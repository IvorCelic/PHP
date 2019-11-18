drop database if exists edunovapp20;
create database edunovapp20;
use edunovapp20;

create table smjer(
    smjer_ID    int not null primary key auto_increment,
    naziv       varchar(50) not null,
    trajanje    int,
    cijena      decimal(18,2) not null,
    upisnina    decimal(18,2) not null,
    verificiran boolean
);

create table grupa(
    grupa_ID        int not null primary key auto_increment,
    naziv           varchar(20)  not null,
    smjer           int  not null,
    predavac        int  not null,
    broj_polaznika  int,
    datum_pocetka   datetime  not null
);

create table predavac(
    predavac_ID   int not null primary key auto_increment,
    osoba         int not null,
    iban          varchar(50)
);

create table osoba(
    osoba_ID   int not null primary key auto_increment,
    ime        varchar(50) not null,
    prezime    varchar(50) not null,
    oib        char(11),
    email      varchar(100) not null
);

create table polaznik(
    polaznik_ID int not null primary key auto_increment,
    osoba       int not null,
    broj_ugovora varchar(50)
);

create table clan(
    grupa       int not null,
    polaznik    int not null
);


alter table grupa add foreign key(smjer) references smjer(smjer_ID);
alter table grupa add foreign key(predavac) references predavac(predavac_ID);

alter table predavac add foreign key(osoba) references osoba(osoba_ID);

alter table polaznik add foreign key(osoba) references osoba(osoba_ID);

alter table clan add foreign key(grupa) references grupa(grupa_ID);
alter table clan add foreign key(polaznik) references polaznik(polaznik_ID);



#select * from smjer;
# 1-4
insert into smjer (smjer_ID, naziv, trajanje, cijena, upisnina, verificiran) values
	(null, 'PHP Programiranje', 130, 5500.00, 500.00, true),
	(null, 'Java Programiranje', 150, 6000.00, 500.00, true),
	(null, 'Njemački jezik', 100, 4500.00, 500.00, false),
	(null, 'Računalni operater', 200, 8000.00, 500.00, true);


#select * from osoba;
# 1-5
insert into osoba (osoba_ID, ime, prezime, email) values
	(null, 'Tomislav', 'Jakopec', 'tjakopec@gmail.com'),
	(null, 'Ivor', 'Ćelić', 'ivorcelic@gmail.com'),
	(null, 'Luka', 'Vuk', 'luka.vuk@gmail.com'),
	(null, 'Damir', 'Mirza', 'damirmirza@gmail.com'),
	(null, 'Shaquille', 'O''Neal', 'saki@gmail.com');


#select * from polaznik;
# 1-3
insert into polaznik (polaznik_ID, osoba, broj_ugovora) values
	(null, 2, '3'),
	(null, 3, '2'),
	(null, 4, '1');


#select * from predavac;
# 1-2
insert into predavac (predavac_ID, osoba, iban) values
	(null, 1, 'HR2624020067839482524'),
	(null, 5, 'AE820262693915535887557');


#select * from grupa;
# 1-4
insert into grupa (grupa_ID, naziv, smjer, predavac, datum_pocetka) values
	(null, 'PP20', 1, 1, '2019-10-28 17:00'),
	(null, 'JP21', 2, 2, '2019-10-28 19:00'),
	(null, 'RP22', 3, 1, '2019-10-28 13:00'),
	(null, 'NJ23', 4, 2, '2019-10-28 15:00');


#select * from clan;
insert into clan (grupa, polaznik) values
	(1, 1), (1, 2), (1, 3);