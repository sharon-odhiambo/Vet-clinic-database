/*Queries that provide answers to the questions from all projects.*/

SELECT * FROM animals WHERE name LIKE '%mon';
SELECT name FROM animals WHERE date_of_birth BETWEEN '01/01/2016' AND '31/12/2019';
SELECT name FROM animals WHERE neutered= true AND escape_attempts < 3;
SELECT date_of_birth FROM animals WHERE name= 'Agumon' or name= 'Pikachu';
SELECT name, escape_attempts FROM animals WHERE weight_kg > 10.5;
SELECT * FROM animals WHERE neutered= true;
SELECT * FROM animals WHERE name != 'Gabumon';
SELECT * FROM animals WHERE weight_kg BETWEEN 10.4 AND 17.3 OR weight_kg = 10.4 or weight_kg= 17.3;

BEGIN;
UPDATE animals SET species = 'unspecified';
ROLLBACK;

BEGIN;
UPDATE animals SET species = 'digimon' WHERE name LIKE '%mon';
UPDATE animals SET species = 'pokemon' WHERE species IS NULL;
COMMIT;

BEGIN;
DELETE FROM animals;
ROLLBACK;

BEGIN;
DELETE FROM animals WHERE date_of_birth > '01/01/2022';
SAVEPOINT list;
UPDATE animals SET weight_kg = weight_kg * -1;
ROLLBACK TO list;
UPDATE animals SET weight_kg = weight_kg * -1 WHERE weight_kg < 0;
COMMIT;

SELECT COUNT(*) FROM animals;
SELECT COUNT(*) FROM animals WHERE escape_attempts = 0;
SELECT AVG (weight_kg) FROM animals;
SELECT neutered FROM animals WHERE escape_attempts = (SELECT MAX (escape_attempts) FROM animals);
SELECT species, MIN (weight_kg), MAX (weight_kg) FROM animals GROUP BY species;
SELECT species, AVG (escape_attempts) FROM animals WHERE date_of_birth BETWEEN '01/01/1990' AND '31/12/2000' GROUP BY species;

SELECT * FROM animals INNER JOIN owners ON animals.owners_id = owners.id WHERE owners.full_name = 'Melody Pond';
SELECT * FROM animals INNER JOIN species ON animals.species_id = species.id WHERE species.name = 'Pokemon';
SELECT full_name, STRING_AGG (animals.name, ', ') AS animals FROM owners LEFT JOIN animals ON animals.owners_id = owners.id GROUP BY owners.full_name;
SELECT species.name, COUNT (*) FROM species INNER JOIN animals ON animals.species_id = species.id GROUP BY species.name;
SELECT name FROM animals INNER JOIN owners ON owners_id = owners.id WHERE species_id = (SELECT id FROM species where name = 'Digimon') AND owners.full_name = 'Jenifer Orwell';
SELECT owners.full_name, COUNT(animals.name) FROM animals INNER JOIN owners ON owners.id = owners_id GROUP BY owners.full_name ORDER BY COUNT(name) desc LIMIT 1;
