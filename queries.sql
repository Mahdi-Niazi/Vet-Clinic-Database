
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
rollback to sp1;
update animals
set weight_kg = weight_kg * -1 WHERE weight_kg < 0;
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

select animals.name, owners.full_name
from animals 
inner join owners
on animals.owner_id = owners.id
where owners.full_name = 'Melody Pond';

select animals.name, species.name
from animals 
inner join species
on animals.species_id = species.id
where species.name = 'Pokemon';

select animals.name, owners.full_name
from owners
left join animals on animals.owner_id = owners.id;

select species.name as species_name, count(*) as animal_count
from species
join animals on animals.species_id = species.id
group by species.name
order by animal_count desc;

select animals.name, owners.full_name, species.name
from animals
join owners on animals.owner_id = owners.id
join species on animals.species_id = species.id
where species.name = 'Digimon' and owners.full_name = 'Jennifer Orwell'

select animals.name, owners.full_name, species.name, animals.escape_attempts
from animals
join owners on animals.owner_id = owners.id
join species on animals.species_id = species.id
where owners.full_name = 'Dean Winchester' and animals.escape_attempts = 0

select owners.full_name, count(*) as most_owner
from owners
join animals on animals.owner_id = owners.id
group by owners.full_name
order by most_owner desc;


select a.name, vi.date_of_visits 
from animals a 
join visits vi on a.id = vi.animal_id 
join vets ve on ve.id = vi.vet_id 
where ve.name ='Vet William Tatcher' 
order by(vi.date_of_visits) desc limit 1;

select count(distinct(a.name)) as total_seen
from animals a 
join visits vi on a.id = vi.animal_id 
join vets ve on vi.vet_id = ve.id 
where ve.name = 'Vet Stephanie Mendez'; 

select ve.name, s.name as specialties 
from vets ve 
left join specializations sp on ve.id = sp.vet_id 
left join species s on s.id = sp.species_id;

select a.name, vi.date_of_visits 
from animals a join visits vi on a.id = vi.animal_id 
join vets v on vi.vet_id = v.id 
where v.name = 'Vet Stephanie Mendez'
and vi.date_of_visits between '2020-04-01' and '2020-08-30';

select a.name as most_visited, count(vi.animal_id) 
from animals a join visits vi on a.id = vi.animal_id 
join vets v on v.id = vi.vet_id 
group by(vi.animal_id, a.name) 
order by count(vi.animal_id) desc limit 1;

select a.name, vi.date_of_visits as most_visited 
from animals a 
join visits vi on a.id = vi.animal_id 
join vets v on v.id = vi.vet_id 
where v.name = 'Vet Maisy Smith' 
order by(vi.date_of_visits) limit 1;

select a.name,v.name as vet_name, vi.date_of_visits 
from animals a join visits vi on a.id = vi.animal_id 
join vets v on v.id = vi.vet_id 
order by(vi.date_of_visits) desc limit 1;

select count(*) from visits 
join animals on animals.id = visits.animal_id 
join species on species.id = animals.species_id 
join vets on vets.id = visits.vet_id 
left join specializations sp on sp.vet_id = vets.id 
where sp.species_id != animals.species_id or sp.species_id is null;

select species.name, count(species.id) 
from species join animals on species.id = animals.species_id 
join visits on visits.animal_id = animals.id 
join vets on vets.id = visits.vet_id 
where vets.name = 'Vet Maisy Smith' 
group by(species.id) 
order by(species.id) desc limit 1;

