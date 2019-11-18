drop database if exists FrizerskiSalon;
create database FrizerskiSalon;
use FrizerskiSalon;

create table djelatnica(
    djelatnica_ID   int not null primary key auto_increment,
    ime             varchar(50) not null,
    prezime         varchar(50) not null,
    iban            varchar(50) not null
);

create table korisnik(
    korisnik_ID     int not null primary key auto_increment,
    spol            varchar(10),
    nacin_placanja  varchar(20),
    mobitel         varchar(20) not null,
    djelatnica      int not null, #FK
    usluga          int not null #FK
);

create table posjeta(
    posjeta_ID  int not null primary key auto_increment,
    vrijeme_od  datetime not null,
    vrijeme_do  datetime not null,
    korisnik    int not null, #FK
    djelatnica  int not null, #FK
    usluga      int not null #FK
);

create table usluga(
    usluga_ID   int not null primary key auto_increment,
    naziv       varchar(100) not null,
    cijena      decimal(18,2) not null,
    trajanje    int
);

create table usluga_posjeta(
    usluga  int not null, #FK
    posjeta int not null #FK
);


alter table korisnik add foreign key (djelatnica) references djelatnica(djelatnica_ID);
alter table korisnik add foreign key (usluga) references usluga(usluga_ID);

alter table posjeta add foreign key (korisnik) references korisnik(korisnik_ID);
alter table posjeta add foreign key (djelatnica) references djelatnica(djelatnica_ID);
alter table posjeta add foreign key (usluga) references usluga(usluga_ID);

alter table usluga_posjeta add foreign key (usluga) references usluga(usluga_ID);
alter table usluga_posjeta add foreign key (posjeta) references posjeta(posjeta_ID);




#___1-3________________________________________________________________
#select * from djelatnica;
insert into djelatnica (djelatnica_ID, ime, prezime, iban) values
(null, 'Draženka', 'Cvitanušić', 'HR1123600009662461851'),
(null, 'Jasminka', 'Brozović', 'HR3325000095549469667'),
(null, 'Spomenka', 'Malik', 'HR6425000093369882989');



#___1-3________________________________________________________________
#select * from usluga;
insert into usluga (usluga_ID, naziv, cijena) values
(null, 'Pranje i frizura', 90.00),
(null, 'Bojanje kose i frizura', 270.00),
(null, 'Izbjeljivanje, bojanje, šišanje kose i frizura', 500.00);



#___1__________________________________________________________________
#select * from korisnik;
insert into korisnik (korisnik_ID, mobitel, djelatnica, usluga) values
(null, '+385983841888', 1, 1);

#___2__________________________________________________________________
insert into korisnik (korisnik_ID, mobitel, djelatnica, usluga) values
(null, '+385975634877', 2, 2);

#___3__________________________________________________________________
insert into korisnik (korisnik_ID, mobitel, djelatnica, usluga) values
(null, '+385952444348', 3, 3);




#___1__________________________________________________________________
#select * from posjeta;
insert into posjeta (posjeta_ID, vrijeme_od, vrijeme_do, korisnik, djelatnica, usluga) values
(null, '2019-11-15 12:00:00', '2019-11-15 13:00:00', 1, 1, 1);

#___2__________________________________________________________________
insert into posjeta (posjeta_ID, vrijeme_od, vrijeme_do, korisnik, djelatnica, usluga) values
(null, '2019-11-15 12:00:00', '2019-11-15 14:00:00', 2, 2, 2);

#___3__________________________________________________________________
insert into posjeta (posjeta_ID, vrijeme_od, vrijeme_do, korisnik, djelatnica, usluga) values
(null, '2019-11-15 12:00:00', '2019-11-15 15:00:00', 3, 3, 3);



#___1-3________________________________________________________________
#select * from usluga_posjeta;

insert into usluga_posjeta (usluga, posjeta) values (1, 1);
insert into usluga_posjeta (usluga, posjeta) values (2, 2);
insert into usluga_posjeta (usluga, posjeta) values (3, 3);