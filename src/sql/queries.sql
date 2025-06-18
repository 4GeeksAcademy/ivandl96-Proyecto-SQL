-- PLEASE READ THIS BEFORE RUNNING THE EXERCISE

-- ⚠️ IMPORTANT: This SQL file may crash due to two common issues: comments and missing semicolons.

-- ✅ Suggestions:
-- 1) Always end each SQL query with a semicolon `;`
-- 2) Ensure comments are well-formed:
--    - Use `--` for single-line comments only
--    - Avoid inline comments after queries
--    - Do not use `/* */` multi-line comments, as they may break execution

-- -----------------------------------------------
-- queries.sql
-- Complete each mission by writing your SQL query
-- directly below the corresponding instruction
-- -----------------------------------------------

SELECT * FROM regions;
SELECT * FROM species;
SELECT * FROM climate;
SELECT * FROM observations;


-- MISSION 1
-- Your query here;
SELECT regions.name, regions.country, COUNT(DISTINCT species.id) AS total_species
FROM observations
JOIN species ON observations.species_id = species.id
JOIN regions ON observations.region_id = regions.id
GROUP BY regions.name, regions.country
ORDER BY total_species DESC;    
-- MISSION 2
-- Your query here;
SELECT  strftime('%m', observations.observation_date) AS month, COUNT(*) AS total
FROM observations
GROUP BY month
ORDER BY total DESC;

-- MISSION 3
-- Your query here;
SELECT species.scientific_name, species.common_name, SUM(observations.count) AS total_species
FROM observations
JOIN species ON observations.species_id = species.id
GROUP BY species.id
HAVING total_species <= 2
ORDER BY total_species ASC;

-- MISSION 4
-- Your query here;
SELECT regions.name, regions.country, COUNT (DISTINCT observations.species_id) AS species
FROM observations
JOIN regions ON observations.region_id = regions.id
GROUP BY regions.name, regions.country
ORDER BY species DESC
LIMIT 1;
-- MISSION 5
-- Your query here;
SELECT species.scientific_name, species.common_name, COUNT(*) AS most_observations
FROM observations
JOIN species ON observations.species_id = species_id
GROUP BY species.id
ORDER BY most_observations DESC
LIMIT 5;
-- MISSION 6
-- Your query here;
SELECT observations.observer, COUNT(*) AS total
FROM observations
GROUP BY observations.observer
ORDER BY total DESC
LIMIT 5;
-- MISSION 7
-- Your query here;
SELECT species.scientific_name, species.common_name
FROM species
LEFT JOIN observations ON species.id = observations.species_id
WHERE observations.species_id IS NULL;

-- MISSION 8
-- Your query here;
SELECT observations.observation_date, COUNT (DISTINCT observations.species_id) AS distinct_species
FROM observations
GROUP BY observations.observation_date
ORDER BY distinct_species DESC
LIMIT 5;