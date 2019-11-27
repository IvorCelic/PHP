select * from kategorija;
select * from recept;
select * from sastojak;
select * from recept_namirnica;


# ispišite kojoj kategoriji pripada koja kategorija

select a.kategorija, b.naziv as kategorija
from kategorija a
inner join kategorija b on b.kategorija_ID = a.kategorija_ID;



# ispišite kategorije za recepte

select b.kategorija as kategorija, a.naziv as naziv
from recept a
inner join kategorija b on a.kategorija = b.kategorija_ID;



# ispišite kategoriju i sastojke od Francuske salate

select a.naziv as naziv, c.sastojak, c.recept as recept_ID, b.kategorija_ID as kategorija_ID
from recept a
inner join kategorija b on a.kategorija = b.kategorija_ID
inner join recept_namirnica c on a.recept_ID = c.recept
inner join sastojak d on c.recept = d.sastojak_ID
where a.naziv='Francuska salata';


#________________________________________________________________________#
#________________________________________________________________________#
#________________________________________________________________________#


select * from kategorija;
select * from recept;
select * from sastojak;

select * 

# ispisati sastojke za teletinu, kojoj kategoriji pripada i komentare vezane za taj recept 
select a.naziv as recept, a.kategorija, c.sastojak, e.komentar_text as komentar
from recept a
inner join kategorija b on a.kategorija = b.kategorija_ID
inner join recept_sastojak c on a.recept_ID = c.recept
inner join sastojak d on c.sastojak = d.sastojak_ID
inner join komentar e on e.recept = a.recept_ID;


# izlistajte sve kategorije koje u počinju sa slovom p
select * from kategorija where naziv like 'p%';

# izlistajte sve kategorije koje u sebi imaju slovo m ili t
select * from kategorija where naziv like '%t%'
	or naziv like '%m%';
	
# izlistajte sve sastojke koji se ne koriste ni za jedan recept
select b.sastojak
from recept a
left join recept_sastojak b on a.recept_ID = b.recept
left join sastojak c on c.sastojak_ID = b.sastojak
where b.recept is null;

select * from recept_sastojak;