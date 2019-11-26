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