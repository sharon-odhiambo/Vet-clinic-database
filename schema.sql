/* Database schema to keep the structure of entire database. */

CREATE TABLE animals (
    ID INT PRIMARY KEY NOT NULL,
    name text,
    date_of_birth date,
    escape_attempts integer,
    neutered boolean,
    weight_kg decimal,
);

ALTER TABLE animals ADD species text;

CREATE TABLE owners (
    id INT NOT NULL GENERATED ALWAYS AS IDENTITY, 
    full_name text NOT NULL, 
    age integer NOT NULL, 
    PRIMARY KEY(id)
    );

CREATE TABLE species (
    id INT NOT NULL GENERATED ALWAYS AS IDENTITY, 
    name text NOT NULL, 
    PRIMARY KEY(id)
    );

ALTER TABLE animals DROP ID;
ALTER TABLE animals ADD id INT NOT NULL GENERATED ALWAYS AS IDENTITY;
ALTER TABLE animals ADD PRIMARY KEY (id);
ALTER TABLE animals DROP species;

ALTER TABLE animals 
ADD COLUMN species_id INT REFERENCES species (id) 
ON DELETE CASCADE;

 ALTER TABLE animals 
 ADD COLUMN owners_id INT REFERENCES owners (id) 
 ON DELETE CASCADE;

CREATE TABLE vets (
    id INT NOT NULL GENERATED ALWAYS AS IDENTITY, 
    name text NOT NULL, 
    age INT NOT NULL, 
    date_of_graduation date,
    PRIMARY KEY (id)
    );

CREATE TABLE specializations (
    id INT NOT NULL GENERATED ALWAYS AS IDENTITY,
    species_id INTEGER REFERENCES species (id), 
    vets_id INTEGER REFERENCES vets (id)
    );

CREATE TABLE visits (
    id INT NOT NULL GENERATED ALWAYS AS IDENTITY,
    animals_id INTEGER REFERENCES animals (id), 
    vets_id INTEGER REFERENCES vets (id), 
    date_of_visit date
    );

ALTER TABLE owners ALTER COLUMN age INT;