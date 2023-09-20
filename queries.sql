
SELECT * FROM animals WHERE name LIKE '%mon';
SELECT name FROM animals WHERE date_of_birth BETWEEN '2016-01-01' AND '2019-12-31';
SELECT name FROM animals WHERE neutered = true AND escape_attempts < 3;
SELECT date_of_birth FROM animals WHERE name IN ('Agumon', 'Pikachu');
SELECT name, escape_attempts FROM animals WHERE weight_kg > 10.5;
SELECT * FROM animals WHERE neutered = true;
SELECT * from animals WHERE name != 'Gabumon';
SELECT * FROM animals WHERE weight_kg >= 10.4 AND weight_kg <= 17.3;

BEGIN TRANSACTION;

UPDATE animals 
SET species = 'unspecified';

SELECT * FROM animals
WHERE species = 'unspecified';

Rollback;

SELECT * FROM animals;

begin;

update animals
set species = 'digimon'
where name like '%mon';

update animals 
set species = 'pokemon'
where species is null;

select * from animals 

commit;

select * from animals;

begin;

delete from animals;

select * from animals;

rollback;

select * from animals;

begin;
delete from animals
where date_of_birth > '2022-01-01';
savepoint sp1;
update animals 
set weight_kg = weight_kg * -1;
select * from animals;
rollback;
update animals
set weight_kg = weight_kg * -1;
commit;
select * from animals


select count(id) from animals;
select count(escape_attempts) from animals where escape_attempts = 0;
select avg(weight_kg) from animals;
select neutered, max(escape_attempts) from animals group by neutered;
select species, max(weight_kg), min(weight_kg) from animals group by species;

select species, avg(escape_attempts) 
from animals
where date_of_birth between '1990-01-01' AND '2000-12-31'
group by species;