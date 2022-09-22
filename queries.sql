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

SELECT animals.name FROM animals INNER JOIN visits ON visits.animals_id = animals. id INNER JOIN vets ON visits.vets_id = vets.id WHERE vets.id = 1 AND date_of_visit = (SELECT MAX (date_of_visit) FROM visits);
SELECT COUNT(*) FROM animals INNER JOIN visits ON visits.animals_id = animals. id INNER JOIN vets ON visits.vets_id = vets.id WHERE vets.id = 3;
SELECT vets.name, STRING_AGG (species.name, ',') FROM vets LEFT JOIN specializations ON vets.id = specializations.vets_id LEFT JOIN species ON specializations.species_id = species.id GROUP BY vets.name;
SELECT animals.name, date_of_visit FROM animals INNER JOIN visits ON visits.animals_id = animals. id INNER JOIN vets ON visits.vets_id = vets.id WHERE vets.id = 3 AND date_of_visit BETWEEN '01/04/2020' AND '30/08/2020';
SELECT animals.name,COUNT(animals.name) FROM animals INNER JOIN visits ON animals.id = visits.animals_id GROUP BY animals.name ORDER BY COUNT(animals.name) DESC LIMIT 1;
SELECT animals.name FROM animals INNER JOIN visits ON visits.animals_id = animals. id INNER JOIN vets ON visits.vets_id = vets.id WHERE vets.id = 2 AND date_of_visit = (SELECT MIN (date_of_visit) FROM visits);
SELECT * FROM animals INNER JOIN visits ON visits.animals_id = animals. id INNER JOIN vets ON visits.vets_id = vets.id WHERE date_of_visit = (SELECT MAX (date_of_visit) FROM visits);
SELECT COUNT(visits.animals_id) FROM visits INNER JOIN vets ON visits.vets_id = vets.id INNER JOIN animals ON animals.id = visits.animals_id INNER JOIN specializations ON specializations.species_id = vets.id WHERE specializations.species_id != animals.species_id;
SELECT species.name, COUNT(*) FROM animals INNER JOIN visits ON animals.id = visits.animals_id INNER JOIN species ON animals.species_id = species.id WHERE visits.vets_id = 2 GROUP BY species.name ORDER BY COUNT(*) DESC LIMIT 1;


