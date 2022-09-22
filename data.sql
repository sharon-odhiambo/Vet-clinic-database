/* Populate database with sample data. */

INSERT INTO animals(id, name, date_of_birth, escape_attempts, neutered, weight_kg)  
VALUES (1, 'Agumon', '02/03/2020', 0, true, 10.23);
INSERT INTO animals (id, name, date_of_birth, escape_attempts, neutered, weight_kg)  
VALUES (2, 'Gabumon', '15/11/2018', 2, true, 8);
INSERT INTO animals (id, name, date_of_birth, escape_attempts, neutered, weight_kg)  
VaLUES (3, 'Pikachu', '07/01/2021', 1, false, 15.04);
INSERT INTO animals (id, name, date_of_birth, escape_attempts, neutered, weight_kg) 
VALUES (4, 'Devimon', '12/05/2021', 5, true, 11)
INSERT INTO animals(id, name, date_of_birth, escape_attempts, neutered, weight_kg)  
VALUES (5, 'Charmander', '08/02/2020', 0, false, -11);
INSERT INTO animals(id, name, date_of_birth, escape_attempts, neutered, weight_kg)  
VALUES (6, 'Plantmon', '15/11/2021', 2, true, -5.7);
INSERT INTO animals(id, name, date_of_birth, escape_attempts, neutered, weight_kg)  
VALUES (7, 'Squirtle', '02/04/1993', 3, false, -12.13);
INSERT INTO animals(id, name, date_of_birth, escape_attempts, neutered, weight_kg)  
VALUES (8, 'Angemon', '12/06/2005', 1, true, -45);
INSERT INTO animals(id, name, date_of_birth, escape_attempts, neutered, weight_kg)  
VALUES (9, 'Boarmon', '07/06/2005', 7, true, 20.4);
INSERT INTO animals(id, name, date_of_birth, escape_attempts, neutered, weight_kg)  
VALUES (10, 'Blossom', '13/10/1998', 3, true, 17);
INSERT INTO animals(id, name, date_of_birth, escape_attempts, neutered, weight_kg)  
VALUES (11, 'Ditto', '14/05/2022', 4, true, 22);
INSERT INTO owners(full_name, age) VALUES('Sam Smith', 34);
INSERT INTO owners(full_name, age) VALUES('Jenifer Orwell', 19);
INSERT INTO owners(full_name, age) VALUES('Bob', 45);
INSERT INTO owners(full_name, age) VALUES('Melody Pond', 77);
INSERT INTO owners(full_name, age) VALUES('Dean Winchester', 14);
INSERT INTO owners(full_name, age) VALUES('Jodie Whittaker', 38);
INSERT INTO species(name) VALUES('Pokemon');
INSERT INTO species(name) VALUES('Digimon');

BEGIN;
UPDATE animals SET species_id = (SELECT id FROM species WHERE name = 'Digimon') WHERE name LIKE '%mon';
COMMIT;

BEGIN;
UPDATE animals SET species_id = (SELECT id FROM species WHERE name = 'Pokemon') WHERE species_id IS NULL;
COMMIT;

BEGIN;
UPDATE animals SET owners_id = (SELECT id FROM owners WHERE full_name = 'Jenifer Orwell') WHERE name = 'Gabumon';
UPDATE animals SET owners_id = (SELECT id FROM owners WHERE full_name = 'Jenifer Orwell') WHERE name = 'Pikachu';
UPDATE animals SET owners_id = (SELECT id FROM owners WHERE full_name = 'Bob') WHERE name = 'Devimon';
UPDATE animals SET owners_id = (SELECT id FROM owners WHERE full_name = 'Bob') WHERE name = 'Plantmon';
UPDATE animals SET owners_id = (SELECT id FROM owners WHERE full_name = 'Melody Pond') WHERE name = 'Charmander';
UPDATE animals SET owners_id = (SELECT id FROM owners WHERE full_name = 'Melody Pond') WHERE name = 'Squirtle';
UPDATE animals SET owners_id = (SELECT id FROM owners WHERE full_name = 'Melody Pond') WHERE name = 'Blossom';
UPDATE animals SET owners_id = (SELECT id FROM owners WHERE full_name = 'Dean Winchester') WHERE name = 'Angemon';
UPDATE animals SET owners_id = (SELECT id FROM owners WHERE full_name = 'Dean Winchester') WHERE name = 'Boarmon';
COMMIT;

INSERT INTO vets (name, age, date_of_graduation) VALUES('William Tatcher', 45, '23/04/2000');
INSERT INTO vets (name, age, date_of_graduation) VALUES('Maisy Smith', 26, '17/01/2019');
INSERT INTO vets (name, age, date_of_graduation) VALUES('Stephanie Mendez', 34, '04/05/1981');
INSERT INTO vets (name, age, date_of_graduation) VALUES('Jack Harkness', 68, '08/06/2008');

INSERT INTO specializations (species_id, vets_id) VALUES(1,1);
INSERT INTO specializations (species_id, vets_id) VALUES(2,3);
INSERT INTO specializations (species_id, vets_id) VALUES(1,3);
INSERT INTO specializations (species_id, vets_id) VALUES(2,4);

INSERT INTO visits (animals_id, vets_id, date_of_visit) VALUES(5, 1, '24/05/2020');
INSERT INTO visits (animals_id, vets_id, date_of_visit) VALUES(5, 3, '22/07/2020');
INSERT INTO visits (animals_id, vets_id, date_of_visit) VALUES(6, 4, '02/02/2021');
INSERT INTO visits (animals_id, vets_id, date_of_visit) VALUES(9, 2, '05/01/2021');
INSERT INTO visits (animals_id, vets_id, date_of_visit) VALUES(9, 2, '08/03/2020');
INSERT INTO visits (animals_id, vets_id, date_of_visit) VALUES(9, 2, '14/05/2020');
INSERT INTO visits (animals_id, vets_id, date_of_visit) VALUES(7, 3, '04/05/2021');
INSERT INTO visits (animals_id, vets_id, date_of_visit) VALUES(3, 4, '24/02/2021');
INSERT INTO visits (animals_id, vets_id, date_of_visit) VALUES(1, 2, '21/12/2019');
INSERT INTO visits (animals_id, vets_id, date_of_visit) VALUES(1, 1, '10/08/2020');
INSERT INTO visits (animals_id, vets_id, date_of_visit) VALUES(1, 2, '07/04/2021');
INSERT INTO visits (animals_id, vets_id, date_of_visit) VALUES(4, 3, '29/09/2019');
INSERT INTO visits (animals_id, vets_id, date_of_visit) VALUES(2, 4, '03/10/2020');
INSERT INTO visits (animals_id, vets_id, date_of_visit) VALUES(2, 4, '04/11/2020');
INSERT INTO visits (animals_id, vets_id, date_of_visit) VALUES(8, 2, '24/01/2019');
INSERT INTO visits (animals_id, vets_id, date_of_visit) VALUES(8, 2, '15/01/2019');
INSERT INTO visits (animals_id, vets_id, date_of_visit) VALUES(8, 2, '27/02/2020');
INSERT INTO visits (animals_id, vets_id, date_of_visit) VALUES(8, 2, '03/08/2020');
INSERT INTO visits (animals_id, vets_id, date_of_visit) VALUES(10, 1, '24/05/2020');
INSERT INTO visits (animals_id, vets_id, date_of_visit) VALUES(10, 1, '11/05/2021');
