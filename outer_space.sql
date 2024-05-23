-- from the terminal run:
-- psql < outer_space.sql

DROP DATABASE IF EXISTS outer_space;

CREATE DATABASE outer_space;

\c outer_space

CREATE TABLE orbited_planets (
  id SERIAL PRIMARY KEY, 
  name TEXT NOT NULL 
);

CREATE TABLE planets (
  id SERIAL PRIMARY KEY,
  name TEXT NOT NULL,
  orbital_period_in_years FLOAT NOT NULL,
  orbits_around INT,
  FOREIGN KEY (orbits_around) REFERENCES orbited_planets(id),
  galaxy TEXT NOT NULL
);

CREATE TABLE moons (
  moon_id SERIAL PRIMARY KEY, 
  orbits_around INT, 
  FOREIGN KEY (orbits_around) REFERENCES planets(id),
  name VARCHAR(30)
);

INSERT INTO orbited_planets (name) VALUES
  ('The Sun'), 
  ('Proxima Centauri'), 
  ('Gliese 876');

INSERT INTO planets (name, orbital_period_in_years, orbits_around, galaxy) VALUES
  ('Earth', 1.00, 1, 'Milky Way'),
  ('Mars', 1.88, 1, 'Milky Way'),
  ('Venus', 0.62, 1, 'Milky Way'),
  ('Neptune', 164.8, 1, 'Milky Way'),
  ('Proxima Centauri b', 0.03, 2, 'Milky Way'),
  ('Gliese 876 b', 0.23, 3, 'Milky Way');

INSERT INTO moons (orbits_around, name) VALUES 
(1, 'The Moon'),
(2, 'Phobos'),
(2, 'Diemos'), 
(4, 'Naiad'),
(4, 'Thalassa'),
(4, 'Despina'),
(4, 'Galatea'),
(4, 'Larissa'),
(4, 'S/2004 N 1'),
(4, 'Proteus'),
(4, 'Triton'),
(4, 'Nereid'),
(4, 'Halimede'),
(4, 'Sao'),
(4, 'Laomedeia'),
(4, 'Psamathe'),
(4, 'Neso');