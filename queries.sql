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
