drop database if exists drzavnauprava;
create database drzavnauprava;
use drzavnauprava;

create table zupanija(
    zupanija_ID int not null primary key auto_increment,
    naziv varchar(100) not null,
    zupan varchar(100) not null
);

create table opcina(
    opcina_ID int not null primary key auto_increment,
    zupanija int not null,
    naziv varchar(100) not null,
    nacelnik varchar(100) not null
);

create table mjesto(
    mjesto_ID int not null primary key auto_increment,
    naziv varchar(100) not null,
    opcina int not null,
    broj_stanovnika int not null
);

alter table opcina add foreign key (zupanija) references zupanija(zupanija_ID);
alter table mjesto add foreign key (opcina) references opcina(opcina_ID);


#___1-20__________________________________________________________
#select * from zupanija;

insert into zupanija (zupanija_ID, naziv, zupan) values
(null, 'Zagrebačka županija', 'Stjepan Kožić'),
(null, 'Krapinsko-zagorska županija', 'Željko Kolar'),
(null, 'Sisačko-moslavačka županija', 'Ivo Žinić'),
(null, 'Karlovačka županija', 'Damir Jelić'),
(null, 'Varaždinska županija', 'Radimir Čačić'),
(null, 'Koprivničko-križevačka županija', 'Darko Koren'),
(null, 'Bjelovarsko-bilogorska županija', 'Damir Bajs'),
(null, 'Primorsko-goranska županija', 'Zlatko Komadina'),
(null, 'Ličko-senjska županija', 'Darko Milinović'),
(null, 'Virovitičko-podravska županija', 'Igor Andrović'),
(null, 'Požeško-slavonska županija', 'Alojz Tomašević'),
(null, 'Brodsko-posavska županija', 'Danijel Marušić'),
(null, 'Zadarska županija', 'Božidar Longinć '),
(null, 'Osječko-Baranjska županija', 'Ivan Anušić'),
(null, 'Šibensko-kninska županija', 'Goran Pauk'),
(null, 'Vukovarsko-srijemska županija', 'Božo Galić'),
(null, 'Splitsko-dalmatinska županija', 'Blaženko Boban'),
(null, 'Istarska županija', 'Valter Flego'),
(null, 'Dubrovačko-neretvanska županija', 'Nikola Dobroslavić'),
(null, 'Međimurska županija', 'Matija Posavec');

#describe zupanija;

#___1-24_______________________________________________________________
#select * from opcina;

insert into opcina (opcina_ID, zupanija, naziv, nacelnik) values
(null, 1, 'Bedenica', 'Slavko Cvrlja'),
(null, 1, 'Bistra', 'Krešimir Gulić'),
(null, 1, 'Brckovljani', 'Željko Funtek'),
(null, 1, 'Brdovec', 'Alen Prelec'),
(null, 1, 'Dubrava', 'Tomislav Okroša'),
(null, 1, 'Dubravica', 'Marin Štritof'),
(null, 1, 'Farkaševac', 'Željko Copak'),
(null, 1, 'Gradec', 'Ljubica Ambrušec'),
(null, 1, 'Jakovlje', 'Sanja Borovec'),
(null, 1, 'Klinča Sela', 'Miljenko Vučković'),
(null, 1, 'Kloštar Ivanić', 'Željko Filipović'),
(null, 1, 'Krašić', 'Dubravko Mačečević'),
(null, 1, 'Kravarsko', 'Vlado Kolarec'),
(null, 1, 'Križ', 'Marko Magdić'),
(null, 1, 'Luka', 'Darko Kralj'),
(null, 1, 'Marija Gorica', 'Marica Jančić'),
(null, 1, 'Orle', 'Ervin Vujica'),
(null, 1, 'Pisarovina', 'Tomo Kovačić'),
(null, 1, 'Pokupsko', 'Božidar Škrinjarić'),
(null, 1, 'Preseka', 'Nikola Kožar'),
(null, 1, 'Pušća', 'Anđela Cirkveni'),
(null, 1, 'Rakovec', 'Brankica Bend'),
(null, 1, 'Rugvica', 'Mato Čičak'),
(null, 1, 'Stupnik', 'Bruno Perković');

#describe opcina;

#___1-26_______________________________________________________________
#select * from mjesto;

insert into mjesto (mjesto_ID, naziv, opcina, broj_stanovnika) values
(null, 'Bedenica', 1, 535),
(null, 'Beloslavec', 1, 295),
(null, 'Bosna', 1, 112),
(null, 'Omamno', 1, 159),
(null, 'Otrčkovec', 1, 45),
(null, 'Turkovčina', 1, 376),
(null, 'Bukovje Bistransko', 2, 382),
(null, 'Donja Bistra', 2, 1273),
(null, 'Gornja Bistra', 2, 1629),
(null, 'Novaki Bistranski', 2, 777),
(null, 'Oborovo Bistransko', 2, 938),
(null, 'Poljanica Bistranska', 2, 1099),
(null, 'Božjakovina', 3, 216),
(null, 'Brckovljani', 3, 1243),
(null, 'Donje Dvorišće', 3, 141),
(null, 'Gornja Greda', 3, 586),
(null, 'Gornje Dvorišće', 3, 335),
(null, 'Gračec', 3, 997),
(null, 'Hrebinec', 3, 237),
(null, 'Kusanovec', 3, 53),
(null, 'Lupoglav', 3, 1064),
(null, 'Prečec', 3, 224),
(null, 'Prikraj', 3, 590),
(null, 'Stančić', 3, 738),
(null, 'Štakorovec', 3, 281),
(null, 'Teodrovec', 3, 111);
#describe mjesto;


update zupanija set naziv='Nije Točno' where zupanija_ID=18;
update zupanija set naziv='Istarska županija' where zupanija_ID=18;

delete from mjesto where mjesto_ID=26;
delete from mjesto where mjesto_ID=25;
