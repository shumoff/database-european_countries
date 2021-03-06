DROP DATABASE IF EXISTS european_countries;
CREATE DATABASE european_countries;
GRANT ALL PRIVILEGES ON DATABASE european_countries TO postgres;
\connect european_countries

CREATE TABLE countries (
id serial primary key,
name varchar(100),
capital varchar(100),
population int,
territory_sq_km real,
region_id int);

CREATE TABLE regions (
rid serial primary key,
name varchar(100),
economical_leader int);

CREATE TABLE rulers (
ruler_id serial primary key,
country_id int,
name varchar(100),
beginning_of_government int,
end_of_government int NULL);

CREATE TABLE political_parties (
pid serial primary key,
country_id int,
name varchar(100) NULL,
leader varchar(100),
political_position varchar(100) NULL,
year_of_foundation int NULL);

CREATE TABLE languages (
lid serial primary key,
name varchar(100));

CREATE TABLE major_international_associations (
aid serial primary key,
name varchar(100),
type varchar(100),
chairman varchar(100) NULL,
headquarters_city varchar(100) NULL,
year_of_foundation int);

CREATE TABLE religions (
rel_id serial primary key,
name varchar(100));

CREATE TABLE country_languages (
country_id int,
language_id int);

CREATE TABLE country_associations (
country_id int,
association_id int);

CREATE TABLE country_religions (
country_id int,
religion_id int);



INSERT INTO regions (name, economical_leader) VALUES 
('Northern Europe', 46),
('Eastern Europe', 40),
('Southern Europe', 23),
('Western Europe', 18);

INSERT INTO countries (name, capital, population, territory_sq_km, region_id) VALUES 
('Albania', 'Tirana', 3020209, 28748, 3),
('Andorra', 'Andorra la Vella', 85458, 468, 3),
('Armenia', 'Yerevan', 3060631, 29743, 2),
('Austria', 'Vienna', 8032926, 83871, 4),
('Azerbaijan', 'Baku', 9686210, 86600, 2),
('Belarus', 'Minsk', 9505200, 207600, 2),
('Belgium', 'Brussels', 11358952, 30528, 4),
('Bosnia and Herzegovina', 'Sarajevo', 3871643, 51197, 3),
('Bulgaria', 'Sofia', 7101859, 110993.6, 2),
('Croatia', 'Zagreb', 4470534, 56594, 2),
('Cyprus', 'Nicosia', 1172458, 9251, 3),
('Czech Republic', 'Prague', 10538275, 78867, 2),
('Denmark', 'Copenhagen', 5693085, 43094, 1),
('Estonia', 'Tallinn', 1257921, 45228, 1),
('Finland', 'Helsinki', 5268799, 338145, 1),
('France', 'Paris', 66259012, 643427, 4),
('Georgia', 'Tbilisi', 4935880, 69700, 2),
('Germany', 'Berlin', 82175684, 357021, 4),
('Greece', 'Athens', 10816286, 131957, 3),
('Hungary', 'Budapest', 9919128, 93028, 2),
('Iceland', 'Reykjavik', 317351, 103000, 1),
('Ireland', 'Dublin', 4832765, 70273, 4),
('Italy', 'Rome', 61680122, 301340, 3),
('Kazakhstan', 'Astana', 17948816, 2724900, 2),
('Kosovo', 'Pristina', 1883018, 10887, 2),
('Latvia', 'Riga', 2165165, 64589, 1),
('Liechtenstein', 'Vaduz', 37313, 160, 4),
('Lithuania', 'Vilnius', 2943472, 65300, 1),
('Luxembourg', 'Luxembourg', 520672, 2586, 4),
('Macedonia', 'Skopje', 2091719, 25713, 3),
('Malta', 'Valetta', 412655, 316, 3),
('Moldova', 'Kishinev', 3583288, 33851, 2),
('Monaco', 'Monaco', 30508, 2, 4),
('Montenegro', 'Podgorica', 650036, 13812, 3),
('Netherlands', 'Amsterdam', 16877351, 41543, 4),
('Norway', 'Oslo', 5147792, 323802, 1),
('Poland', 'Warsaw', 38346279, 312685, 2),
('Portugal', 'Lisbon', 10427301, 92090, 3),
('Romania', 'Bucharest', 21729871, 238391, 2),
('Russia', 'Moscow', 146267288, 17098242, 2),
('San Marino', 'San Marino', 32742, 61, 3),
('Serbia', 'Belgrade', 7209764, 88361, 3),
('Slovakia', 'Bratislava', 5443583, 49035, 2),
('Slovenia', 'Ljubljana', 1988292, 20273, 3),
('Spain', 'Madrid', 47737941, 505370, 3),
('Sweden', 'Stockholm', 9723809, 450295, 1),
('Switzerland', 'Bern', 8061516, 41277, 4),
('Turkey', 'Ankara', 79814871, 783562, 3),
('Ukraine', 'Kiev', 44281413, 603550, 2),
('United Kingdom', 'London', 63395574, 243809, 4),
('Vatican City', 'Vatican City', 842, 0.44, 3);

INSERT INTO languages (name) VALUES 
('Albanian'),
('Armenian'),
('Azerbaijani'),
('Belarusian'),
('Bosnian'),
('Bulgarian'),
('Croatian'),
('Catalan'),
('Czech'),
('Danish'),
('Dutch'),
('English'),
('Estonian'),
('French'),
('Finnish'),
('Georgian'),
('German'),
('Greek'),
('Hungarian'),
('Icelandic'),
('Irish'),
('Italian'),
('Kazakh'),
('Macedonian'),
('Maltese'),
('Montenegrin'),
('Norwegian'),
('Turkish'),
('Latvian'),
('Lithuanian'),
('Luxembourgish'),
('Polish'),
('Portuguese'),
('Romanian'),
('Russian'),
('Serbian'),
('Slovak'),
('Slovene'),
('Spanish'),
('Swedish'),
('Ukranian');

INSERT INTO religions (name) VALUES
('Atheism'),
('Catholicism'),
('Protestantism'),
('Orthodoxy'),
('Anglican Church'),
('Lutheran Church'),
('Armenian Church'),
('Islam'),
('Church of Denmark'),
('Church of Norway'),
('Church of Sweden');

INSERT INTO major_international_associations (name, type, chairman, headquarters_city, year_of_foundation) VALUES
('Council of Europe', 'intergovernmental organization', 'Thorbjorn Jagland', 'Strasbourg', 1949),
('European Union', 'politico-economic union', 'Donald Tusk', 'Brussels', 1993),
('Commonwealth of Independent States', 'confederation', 'Sergei Lebedev', 'Minsk', 1991),
('North Atlantic Treaty Organisation', 'military alliance', 'Jens Stoltenberg', 'Brussels', 1949),
('Organization for Security and Co-operation in Europe', 'intergovernmental organization', 'Thomas Greminger', 'Vienna', 1995),
('Nordic Council', 'intergovernmental organization', 'Britt Olsson', 'Copenhagen', 1952),
('Central European Free Trade Agreement', 'trade agreement', 'Renata Vitez', 'Cracow', 1992),
('Benelux', 'politico-economic union', NULL, 'Brussels', 1948),
('GUAM', 'economic union', 'Altai Efendiev', 'Kiev', 2001),
('Eurasian Economic Union', 'economic union', 'Tigran Sargsyan', 'Moscow', 2015),
('Baltic Assembly', 'intergovernmental organization', 'Dr. Marika Laizane-Jurkane', 'Riga', 1991),
('Council of the Baltic Sea States', 'intergovernmental organization', 'Maira Mora', 'Stockholm', 1992),
('Union State', 'supranational union', 'Alexander Lukashenko', 'Moscow', 2014),
('Union of European Footbal Associations', 'sportive', 'Aleksander Ceferin', 'Nyon', 1954);

INSERT INTO political_parties (country_id, name, leader, political_position, year_of_foundation) VALUES
(1, 'Socialist Party of Albania', 'Edi Rama', 'centre-left', 1991),
(2, 'Democrats for Andorra', 'Antoni Marti', 'centre-right', 2011),
(3, 'Republican Party of Armenia', 'Serzh Sargsyan', 'right-wing', 1990),
(4, 'Social Democratic Party of Austria', 'Christian Kern', 'centre-left', 1945),
(5, 'New Azerbaijan Party', 'Ilham Aliyev', 'right-wing', 1992),
(6, 'Communist Party of Belarus', 'Igor Karpenko', 'left-wing', 1996),
(7, 'New Flemish Alliance', 'Bart De Wever', 'centre-right', 2001),
(8, 'Party of Democratic Action', 'Bakir Izetbegovic', 'centre-right', 1990),
(9, 'GERB', 'Boyko Borisov', 'centre-right', 2006),
(10, 'Croatian Democratic Union', 'Andrej Plenkovic', 'centre-right', 1989),
(11, 'Democratic Rally', 'Averof Neofytou', 'centre-right', 1976),
(12, 'Czech Social Democratic Party', 'Lubomir Zaoralek', 'centre-left', 1878),
(13, 'Social Democrats', 'Mette Frederiksen', 'centre-left', 1871), 
(14, 'Estonian Reform Party', 'Hanno Pevkur', 'centre-right', 1994),
(15, 'Centre Party', 'Juha Sipila', 'centre', 1906),
(16, 'En Marche!', 'Catherine Barbaroux', 'centre', 2016),
(17, 'Georgian Dream', 'Giorgi Kvirikashvili', 'centre-right', 2012),
(18, 'CDU/CSU', 'Angela Merkel', 'centre-right', 1945),
(19, 'New Democracy', 'Kyriakos Mitsotakis', 'centre-right', 1974),
(20, 'Hungarian Civic Alliance', 'Viktor Orban', 'centre-right', 1988),
(21, 'Independence Party', 'Bjarni Benediktsson', 'centre-right', 1929),
(22, 'Fine Gael', 'Leo Varadkar', 'centre-right', 1933),
(23, 'Democratic Party', 'Matteo Renzi', 'centre-left', 2007),
(24, 'Nur Otan', 'Nursultan Nazarbayev', 'centre', 2006),
(25, 'Democratic party of Kosovo', 'Kadri Veseli', 'centre-right', 1999),
(26, 'Social Democratic Party "Harmony"', 'Nils Usakovs', 'centre-left', 2009),
(27, 'Progressive Citizens Party', 'Thomas Banzer', 'right-wing', 1918),
(28, 'Homeland', 'Gabrielius Landsbergis', 'centre-right', 1993),
(29, 'Christian Social People Party', 'Marc Spautz', 'centre-right', 1944),
(30, 'VMRO-DPMNE', 'Nikola Gruevski', 'right-wing', 1990),
(31, 'Labour Party', 'Joseph Muscat', 'centre-left', 1920),
(32, 'Party of Socialists of the Republic of Moldova', 'Zinaida Greceanii', 'left-wing', 1997),
(33, 'Horizon Monaco', 'Laurent Nouvion', 'right-wing', 2012),
(34, 'Coalition for a European Montenegro', 'Milo Dikanovic', 'centre-left', 1998),
(35, 'People Party for Freedom and Democracy', 'Mark Rutte', 'centre-right', 1948),
(36, 'Labour Party', 'Jonas Gahr Store', 'centre-left', 1887),
(37, 'Law and Justice', 'Jaroslaw  Kaczynski', 'right-wing', 2001),
(38, 'Portugal Ahead', 'Pedro Passos Coelho', 'centre-right', 2014),
(39, 'Social Democratic Party', 'Liviu Dragnea', 'centre-left', 2001),
(40, 'United Russia', 'Dmitry Medvedev', 'centre-right', 2001),
(41, 'Sammarinese Christian Democratic Party', 'Marco Gatti', 'centre', 1948),
(42, 'Serbian Progressive Party', 'Aleksandar Vucic', 'centre-right', 2008),
(43, 'Direction-Social Democracy', 'Robert Fico', 'centre-left', 1999),
(44, 'Positive Slovenia', 'Zoran Jankovic', 'centre-left', 2011),
(45, 'People Party', 'Mariano Rajoy', 'centre-right', 1989),
(46, 'Swedish Social Democratic Party', 'Stefan Lofven', 'centre-left', 1889),
(47, 'Swiss People Party', 'Albert Rosti', 'right-wing', 1971),
(48, 'Justice and Development Party', 'Recep Tayyip Erdogan', 'right-wing', 2001),
(49, 'Petro Poroshenko Bloc "Solidarity"', 'Vitali Klitschko', 'centre-right', 2014),
(50, 'Conservative Party', 'Theresa May', 'centre-right', 1834),
(51, NULL, 'Pope Francis', NULL, NULL);

INSERT INTO rulers (country_id, name, beginning_of_government, end_of_government) VALUES
( 1, 'Edi Rama', 2013, NULL),
( 2, 'Antoni Marti', 2015, NULL),
( 3, 'Serzh Sargsyan', 2008, NULL),
( 4, 'Christian Kern', 2016, NULL),
( 5, 'Ilham Aliyev', 2003, NULL),
( 6, 'Alexander Lukashenko', 1994, NULL),
( 7, 'Charles Michel', 2014, NULL),
( 8, 'Denis Zvizdic', 2015, NULL),
( 9, 'Boyko Borisov', 2017, NULL),
( 10, 'Andrej Plenkovic', 2016, NULL),
( 11, 'Nicos Anastasiades', 2013, NULL),
( 12, 'Bohuslav Sobotka', 2014, NULL),
( 13, 'Lars Rasmussen', 2015, NULL),
( 14, 'Juri Ratas', 2016, NULL),
( 15, 'Juha Sipila', 2015, NULL),
( 16, 'Emmanuel Macron', 2017, NULL),
( 17, 'Giorgi Margvelashvili', 2013, NULL),
( 18, 'Angela Merkel', 2005, NULL),
( 19, 'Alexis Tsipras', 2015, NULL),
( 20, 'Viktor Orban', 2010, NULL),
( 21, 'Bjarni Benediktsson', 2017, NULL),
( 22, 'Leo Varadkar', 2011, NULL),
( 23, 'Paolo Gentiloni', 2016, NULL),
( 24, 'Nursultan Nazarbayev', 1991, NULL),
( 25, 'Ramush Haradinaj', 2017, NULL),
( 26, 'Maris Kucinskis', 2016, NULL),
( 27, 'Adrian Hasler', 2013, NULL),
( 28, 'Dalia Grybauskaite', 2009, NULL),
( 29, 'Xavier Bettel', 2013, NULL),
( 30, 'Zoran Zaev', 2017, NULL),
( 31, 'Joseph Muscat', 2013, NULL),
( 32, 'Pavel Filip', 2016, NULL),
( 33, 'Serge Telle', 2016, NULL),
( 34, 'Dusko Markovic', 2016, NULL),
( 35, 'Mark Rutte', 2010, NULL),
( 36, 'Erna Solberg', 2013, NULL),
( 37, 'Andrzej Duda', 2015, NULL),
( 38, 'Marcelo de Sousa', 2016, NULL),
( 39, 'Klaus Iohannis', 2014, NULL),
( 40, 'Vladimir Putin', 2012, NULL),
( 41, 'Enrico Carattoni', 2017, NULL),
( 42, 'Ana Brnabic', 2017, NULL),
( 43, 'Robert Fico', 2012, NULL),
( 44, 'Miro Cerar', 2014, NULL),
( 45, 'Mariano Rajoy', 2011, NULL),
( 46, 'Stefan Lofven', 2014, NULL),
( 47, 'Walter Thurnherr', 2016, NULL),
( 48, 'Recep Tayyip Erdogan', 2014, NULL),
( 49, 'Petro Poroshenko', 2014, NULL),
( 50, 'Theresa May', 2016, NULL),
( 51, 'Pope Francis', 2013, NULL);

INSERT INTO country_languages (country_id, language_id) VALUES 
( 1, 1), ( 2, 8), ( 2, 39), ( 2, 14), ( 2, 33), ( 3, 2), ( 3, 18), ( 3, 35), ( 4, 17), ( 5, 3), ( 5, 2), ( 5, 16),
( 5, 35), ( 6, 4), ( 6, 35), ( 7, 11), ( 7, 14), ( 7, 17), ( 8, 5), ( 8, 7), ( 8, 36), ( 9, 6), ( 10, 7), ( 11, 18),
( 11, 28), ( 12, 9), ( 13, 10), ( 14, 13), ( 14, 35), ( 15, 15), ( 15, 40), ( 16, 14), ( 17, 16), ( 18, 17), ( 19, 18), 
( 20, 19), ( 21, 20), ( 22, 21), ( 22, 12), ( 23, 22), ( 24, 23), ( 24, 35), ( 25, 1), ( 25, 36), ( 26, 29), ( 26, 35),
( 27, 17), ( 28, 31), ( 28, 35), ( 28, 32), ( 29, 31), ( 29, 14), ( 29, 17), ( 30, 24), ( 30, 1), ( 30, 28), ( 30, 34),
( 30, 36), ( 31, 25), ( 31, 12), ( 32, 34), ( 32, 41), ( 33, 14), ( 33, 22), ( 34, 26), ( 34, 36), ( 34, 5), ( 34, 1),
( 34, 7), ( 35, 11), ( 35, 12), ( 36, 27), ( 37, 32), ( 37, 17), ( 37, 35), ( 37, 41), ( 37, 4), ( 38, 33), ( 39, 34),
( 39, 35), ( 39, 32), ( 39, 37), ( 39, 28), ( 39, 41), ( 39, 1), ( 39, 2), ( 39, 6), ( 39, 9), ( 39, 7), ( 39, 17),
( 39, 18), ( 39, 22), ( 39, 24), ( 39, 19), ( 40, 35), ( 40, 41), ( 41, 22), ( 42, 36), ( 42, 19), ( 42, 34),
( 43, 37), ( 43, 19), ( 44, 38), ( 45, 39), ( 45, 8), ( 46, 40), ( 47, 14), ( 47, 17), ( 47, 22), ( 48, 28),
( 49, 41), ( 49, 35), ( 50, 12), ( 50, 21), ( 51, 22);

INSERT INTO country_religions (country_id, religion_id) VALUES 
( 1, 8), ( 1, 4), ( 1, 1), ( 2, 2), ( 3, 7), ( 4, 2), ( 4, 8), ( 4, 4), ( 5, 8), ( 6, 4), 
( 6, 1), ( 7, 2), ( 7, 1), ( 8, 8), ( 8, 4), ( 8, 2), ( 9, 4), ( 9, 8), ( 10, 2), ( 10, 4), 
( 11, 4), ( 11, 8), ( 12, 1), ( 12, 2), ( 13, 9), ( 13, 1), ( 14, 4), ( 14, 6), ( 14, 1), 
( 15, 6), ( 15, 1), ( 15, 4), ( 16, 2), ( 16, 1), ( 17, 4), ( 17, 8), ( 18, 3), ( 18, 1),
( 19, 4), ( 20, 2), ( 20, 1), ( 21, 6), ( 22, 2), ( 22, 1), ( 23, 2), ( 23, 1), ( 24, 8),
( 24, 4), ( 25, 8), ( 26, 6), ( 26, 2), ( 26, 4), ( 26, 1), ( 27, 2), ( 27, 3), ( 27, 8),
( 28, 2), ( 28, 1), ( 29, 2), ( 29, 1), ( 30, 4), ( 30, 8), ( 31, 2), ( 32, 4), ( 33, 2), 
( 33, 1), ( 34, 4), ( 35, 1), ( 35, 2), ( 35, 3), ( 36, 10), ( 37, 2), ( 38, 2), ( 38, 1),
( 39, 4), ( 40, 4), ( 40, 1), ( 41, 2), ( 42, 4), ( 43, 2), ( 43, 3), ( 43, 1), ( 44, 2), 
( 44, 1), ( 45, 2), ( 45, 1), ( 46, 11), ( 47, 2), ( 47, 1), ( 48, 8), ( 49, 4), ( 50, 5),
( 50, 1), ( 50, 2), ( 51, 2);

INSERT INTO country_associations (country_id, association_id) VALUES 
( 1, 1), ( 2, 1), ( 4, 1), ( 5, 1), ( 7, 1), ( 8, 1), ( 9, 1), ( 10, 1), ( 11, 1), ( 12, 1),
( 13, 1), ( 14, 1), ( 15, 1), ( 16, 1), ( 17, 1), ( 18, 1), ( 19, 1), ( 20, 1), ( 21, 1), ( 22, 1), 
( 23, 1), ( 26, 1), ( 27, 1), ( 28, 1), ( 29, 1), ( 30, 1), ( 31, 1), ( 32, 1), ( 33, 1), ( 34, 1),
( 35, 1), ( 36, 1), ( 37, 1), ( 38, 1), ( 39, 1), ( 40, 1), ( 41, 1), ( 42, 1), ( 43, 1), ( 44, 1), 
( 45, 1), ( 46, 1), ( 47, 1), ( 48, 1), ( 49, 1), ( 50, 1), ( 51, 1), ( 4, 2), ( 7, 2), ( 9, 2), ( 20, 2),
( 19, 2), ( 18, 2), ( 13, 2), ( 22, 2), ( 23, 2), ( 45, 2), ( 11, 2), ( 26, 2), ( 31, 2), ( 28, 2),
( 29, 2), ( 35, 2), ( 37, 2), ( 38, 2), ( 39, 2), ( 16, 2), ( 15, 2), ( 10, 2), ( 12, 2), ( 46, 2), 
( 43, 2), ( 44, 2),  ( 14, 2), ( 3, 3), ( 5, 3), ( 24, 3), ( 32, 3), ( 40, 3), ( 6, 3), ( 1, 4), ( 7, 4),
( 9, 4), ( 51, 4), ( 18, 4), ( 20, 4), ( 19, 4), ( 13, 4), ( 21, 4), ( 23, 4), ( 45, 4), ( 26, 4),
( 28, 4), ( 29, 4), ( 35, 4), ( 36, 4), ( 37, 4), ( 38, 4), ( 39, 4), ( 43, 4), ( 44, 4), ( 48, 4), ( 16, 4),
( 10, 4), ( 12, 4), ( 34, 4), ( 14, 4), ( 4, 5), ( 5, 5), ( 1, 5), ( 2, 5), ( 3, 5), ( 6, 5), ( 7, 5),
( 9, 5), ( 8, 5), ( 50, 5), ( 51, 5), ( 20, 5), ( 18, 5), ( 19, 5), ( 17, 5), ( 13, 5), ( 22, 5), ( 21, 5),
( 45, 5), ( 23, 5), ( 24, 5), ( 11, 5), ( 26, 5), ( 28, 5), ( 27, 5), ( 29, 5), ( 30, 5), ( 31, 5), ( 32, 5), ( 33, 5),
( 35, 5), ( 36, 5), ( 37, 5), ( 38, 5), ( 40, 5), ( 39, 5), ( 41, 5), ( 42, 5), ( 43, 5), ( 44, 5), ( 48, 5), ( 49, 5),
( 15, 5), ( 16, 5), ( 10, 5), ( 34, 5), ( 12, 5), ( 47, 5), ( 46, 5), ( 14, 5), ( 13, 6), ( 15, 6), ( 21, 6), ( 36, 6),
( 46, 6), ( 1, 7), ( 8, 7), ( 30, 7), ( 32, 7), ( 34, 7), ( 42, 7), ( 7, 8), ( 35, 8), ( 29, 8), ( 32, 9), ( 17, 9),
( 49, 9), ( 5, 9), ( 3, 10), ( 6, 10), ( 24, 10), ( 40, 10), ( 32, 10), ( 14, 11), ( 26, 11), ( 28, 11), ( 13, 12), 
( 14, 12), ( 15, 12), ( 18, 12), ( 21, 12), ( 26, 12), ( 28, 12), ( 36, 12), ( 37, 12), ( 40, 12), ( 46, 12), ( 40, 13),
( 6, 13), ( 1, 14), ( 2, 14), ( 3, 14), ( 4, 14), ( 51, 14), ( 6, 14), ( 7, 14), ( 9, 14), ( 8, 14), ( 20, 14), ( 18, 14),
( 19, 14), ( 17, 14), ( 13, 14), ( 22, 14), ( 21, 14), ( 45, 14), ( 23, 14), ( 24, 14), ( 11, 14), ( 25, 14), ( 26, 14),
( 28, 14), ( 27, 14), ( 29, 14), ( 30, 14), ( 31, 14), ( 32, 14), ( 35, 14), ( 36, 14), ( 37, 14), ( 38, 14), ( 40, 14),
( 39, 14), ( 41, 14), ( 42, 14), ( 43, 14), ( 44, 14), ( 48, 14), ( 49, 14), ( 15, 14), ( 16, 14), ( 10, 14), ( 34, 14),
( 12, 14), ( 47, 14), ( 46, 14), ( 14, 14);



ALTER TABLE countries 
ADD UNIQUE (capital),
ADD UNIQUE (name),
ADD FOREIGN KEY (region_id) REFERENCES regions (rid),
ADD CHECK (population > 0),
ADD CHECK (territory_sq_km > 0),
ALTER COLUMN name SET NOT NULL,
ALTER COLUMN capital SET NOT NULL,
ALTER COLUMN population SET NOT NULL,
ALTER COLUMN territory_sq_km SET NOT NULL,
ALTER COLUMN region_id SET NOT NULL;

ALTER TABLE regions 
ADD UNIQUE (name),
ADD UNIQUE (economical_leader),
ADD FOREIGN KEY (economical_leader) REFERENCES countries (id),
ALTER COLUMN name SET NOT NULL,
ALTER COLUMN economical_leader SET NOT NULL;

ALTER TABLE rulers
ALTER COLUMN country_id SET NOT NULL,
ALTER COLUMN name SET NOT NULL,
ALTER COLUMN beginning_of_government SET NOT NULL,
ADD FOREIGN KEY (country_id) REFERENCES countries (id),
ADD UNIQUE (name, beginning_of_government),
ADD CHECK (beginning_of_government > 0),
ADD CONSTRAINT valid_years_of_government CHECK (end_of_government > beginning_of_government);

ALTER TABLE political_parties
ALTER COLUMN country_id SET NOT NULL,
ALTER COLUMN leader SET NOT NULL,
ADD CHECK (year_of_foundation > 0),
ADD UNIQUE (name, leader),
ADD FOREIGN KEY (country_id) REFERENCES countries (id);

ALTER TABLE languages
ALTER COLUMN name SET NOT NULL,
ADD UNIQUE (name);

ALTER TABLE major_international_associations
ADD UNIQUE (name),
ADD CHECK (year_of_foundation > 0),
ALTER COLUMN name SET NOT NULL,
ALTER COLUMN type SET NOT NULL,
ALTER COLUMN year_of_foundation SET NOT NULL;

ALTER TABLE religions
ALTER COLUMN name SET NOT NULL,
ADD UNIQUE (name);

ALTER TABLE country_languages
ADD FOREIGN KEY (country_id) REFERENCES countries (id),
ADD FOREIGN KEY (language_id) REFERENCES languages (lid),
ADD PRIMARY KEY (country_id, language_id);

ALTER TABLE country_associations
ADD FOREIGN KEY (country_id) REFERENCES countries (id),
ADD FOREIGN KEY (association_id) REFERENCES major_international_associations (aid),
ADD PRIMARY KEY (country_id, association_id);

ALTER TABLE country_religions
ADD FOREIGN KEY (country_id) REFERENCES countries (id),
ADD FOREIGN KEY (religion_id) REFERENCES religions (rel_id),
ADD PRIMARY KEY (country_id, religion_id);






