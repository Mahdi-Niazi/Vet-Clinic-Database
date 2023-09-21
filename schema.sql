/* Database schema to keep the structure of entire database. */

CREATE TABLE animals (
	id INTEGER,
	name varchar(150),
	date_of_birth date,
	escape_attempts INTEGER,
	neutered boolean,
	weight_kg decimal
);

ALTER TABLE animals 
ADD species varchar(50);

create table owners(
	id serial primary key,
	full_name varchar(200),
	age int
);
create table species(
	id serial primary key,
	name varchar(200)
);

alter table animals add primary key(id);
alter table animals alter id add generated always as identity;
alter table animals drop column species;
alter table animals add column species_id int;
alter table animals add constraint fk_species foreign key(species_id) references species(id);
alter table animals add column owner_id int;
alter table animals add constraint fk_owner foreign key(owner_id) references owners(id);
select * from animals;

create table vets(
	id int primary key generated always as identity,
	name varchar(50),
	age int,
	date_of_graduation date
);

create table specializations (
	species_id int,
	vet_id int,
	primary key(species_id, vet_id),
	constraint fk_species
		foreign key (species_id)
			references species(id),
	constraint fk_vets 
		foreign key(vet_id)
			references vets(id)
);

create table visits(
	animal_id int,
	vet_id int,
	date_of_visits date,
	constraint fk_animals
		foreign key(animal_id)
	 		references animals(id),
	constraint fk_vets
		foreign key(vet_id)
			references vets(id)
);
