------ First
create table country(
    country_code serial primary key,
    countryName varchar(50),
    nationality_code varchar(3) unique  -- Restricción de unicidad agregada
);

create table Athlete(
    nationality_code varchar(3),
    Acode serial primary key,
    name varchar(50),
    name_TV varchar(15),
    gender int not null, -- 1 for men, 0 to women
    nationality varchar(20),
    foreign key (nationality_code) references country(nationality_code),
    height decimal(5,2),
    weight decimal(5,2),
    birth_date date
);

create table Discipline(
    discipline_code serial primary key not null,
    discplineName varchar(50)
);

create table event(
    eventCode serial primary key not null,
    eventName varchar(50),
    eventDate date
);

create table event_Athlete(
    fk_eventCode int not null,
    fk_athleteCode int not null,
    foreign key (fk_eventCode) references event(eventCode),
    foreign key (fk_athleteCode) references Athlete(Acode)
);

create table Discipline_Athlete(
    fk_disciplineCode int not null,
    fk_AthleteCode int not null,
    foreign key (fk_disciplineCode) references Discipline(discipline_code),
    foreign key (fk_AthleteCode) references Athlete(Acode)
);

INSERT INTO country (countryName, nationality_code) VALUES
('United States', 'USA'),
('Jamaica', 'JAM'),
('Russia', 'RUS'),
('Brazil', 'BRA'),
('Japan', 'JPN');

INSERT INTO country (countryName, nationality_code) VALUES
('Canada', 'CAN'),
('Germany', 'GER'),
('Australia', 'AUS'),
('France', 'FRA'),
('Italy', 'ITA'),
('South Korea', 'KOR'),
('United Kingdom', 'UK'),
('Spain', 'ESP'),
('Sweden', 'SWE'),
('Mexico', 'MEX');

INSERT INTO Athlete (nationality_code, name, name_TV, gender, nationality, height, weight, birth_date) VALUES
('USA', 'John Speedman', 'SpeedyJohn', 1, 'American', 1.85, 80.5, '1992-07-12'),
('JAM', 'Leon Flash', 'LeonF', 1, 'Jamaican', 1.95, 85.0, '1988-06-21'),
('RUS', 'Natalia Strongova', 'NataStrong', 0, 'Russian', 1.78, 68.0, '1994-03-30'),
('BRA', 'Carlos Footbol', 'CarlFoot', 1, 'Brazilian', 1.82, 77.0, '1990-02-15'),
('JPN', 'Haruka Swimmer', 'HaruSwim', 0, 'Japanese', 1.70, 58.0, '1995-12-10');

INSERT INTO Athlete (nationality_code, name, name_TV, gender, nationality, height, weight, birth_date) VALUES
('CAN', 'Jake Swift', 'JakeS', 1, 'Canadian', 1.88, 82.5, '1991-08-05'),
('GER', 'Lara Schnell', 'LaraS', 0, 'German', 1.76, 64.3, '1995-10-11'),
('AUS', 'Emily Strong', 'EmStrong', 0, 'Australian', 1.81, 72.1, '1994-04-19'),
('FRA', 'Jean Sprinter', 'JeanS', 1, 'French', 1.83, 79.8, '1992-09-14'),
('ITA', 'Paolo Footballer', 'PaoloF', 1, 'Italian', 1.85, 78.5, '1990-11-20'),
('KOR', 'Jin Swimmer', 'JinSwim', 1, 'South Korean', 1.80, 77.2, '1996-03-02'),
('UK', 'Victoria Jump', 'VicJump', 0, 'British', 1.78, 67.5, '1991-07-17'),
('ESP', 'Miguel Rápido', 'MiguelR', 1, 'Spanish', 1.85, 81.0, '1993-05-08'),
('SWE', 'Klara Power', 'KlaraP', 0, 'Swedish', 1.77, 66.8, '1994-12-21'),
('MEX', 'Carlos Velocidad', 'CarlosV', 1, 'Mexican', 1.82, 79.9, '1990-06-12');


INSERT INTO Discipline (discplineName) VALUES
('100m Sprint'),
('200m Sprint'),
('Gymnastics'),
('Football'),
('Swimming');

INSERT INTO Discipline (discplineName) VALUES
('Marathon'),
('Rowing'),
('Javelin Throw'),
('Pole Vault'),
('High Jump');

INSERT INTO event (eventName, eventDate) VALUES
('Men\s 100m Sprint Final', '2024-07-25'),
('Women\s Gymnastics Final', '2024-07-26'),
('Men\s Football Final', '2024-07-27'),
('Women\s 200m Freestyle Final', '2024-07-28'),
('Men\s 200m Sprint Final', '2024-07-29');

INSERT INTO event (eventName, eventDate) VALUES
('Men\s Marathon', '2024-07-30'),
('Women\s High Jump Final', '2024-07-31'),
('Men\s Javelin Throw Final', '2024-08-01'),
('Men\s Pole Vault Final', '2024-08-02'),
('Women\s Rowing Final', '2024-08-03');



INSERT INTO event_Athlete (fk_eventCode, fk_athleteCode) VALUES
((SELECT eventCode FROM event WHERE eventName = 'Men\s 100m Sprint Final'), (SELECT Acode FROM Athlete WHERE name = 'John Speedman')),
((SELECT eventCode FROM event WHERE eventName = 'Men\s 100m Sprint Final'), (SELECT Acode FROM Athlete WHERE name = 'Leon Flash')),
((SELECT eventCode FROM event WHERE eventName = 'Women\s Gymnastics Final'), (SELECT Acode FROM Athlete WHERE name = 'Natalia Strongova')),
((SELECT eventCode FROM event WHERE eventName = 'Men\s Football Final'), (SELECT Acode FROM Athlete WHERE name = 'Carlos Footbol')),
((SELECT eventCode FROM event WHERE eventName = 'Women\s 200m Freestyle Final'), (SELECT Acode FROM Athlete WHERE name = 'Haruka Swimmer'));

INSERT INTO event_Athlete (fk_eventCode, fk_athleteCode) VALUES
((SELECT eventCode FROM event WHERE eventName = 'Men\s Marathon'), (SELECT Acode FROM Athlete WHERE name = 'Carlos Velocidad')),
((SELECT eventCode FROM event WHERE eventName = 'Women\s High Jump Final'), (SELECT Acode FROM Athlete WHERE name = 'Victoria Jump')),
((SELECT eventCode FROM event WHERE eventName = 'Men\s Javelin Throw Final'), (SELECT Acode FROM Athlete WHERE name = 'Jake Swift')),
((SELECT eventCode FROM event WHERE eventName = 'Men\s Pole Vault Final'), (SELECT Acode FROM Athlete WHERE name = 'Jean Sprinter')),
((SELECT eventCode FROM event WHERE eventName = 'Women\s Rowing Final'), (SELECT Acode FROM Athlete WHERE name = 'Klara Power'));

INSERT INTO Discipline_Athlete (fk_disciplineCode, fk_AthleteCode) VALUES
((SELECT discipline_code FROM Discipline WHERE discplineName = '100m Sprint'), (SELECT Acode FROM Athlete WHERE name = 'John Speedman')),
((SELECT discipline_code FROM Discipline WHERE discplineName = '100m Sprint'), (SELECT Acode FROM Athlete WHERE name = 'Leon Flash')),
((SELECT discipline_code FROM Discipline WHERE discplineName = 'Gymnastics'), (SELECT Acode FROM Athlete WHERE name = 'Natalia Strongova')),
((SELECT discipline_code FROM Discipline WHERE discplineName = 'Football'), (SELECT Acode FROM Athlete WHERE name = 'Carlos Footbol')),
((SELECT discipline_code FROM Discipline WHERE discplineName = 'Swimming'), (SELECT Acode FROM Athlete WHERE name = 'Haruka Swimmer'));

INSERT INTO Discipline_Athlete (fk_disciplineCode, fk_AthleteCode) VALUES
((SELECT discipline_code FROM Discipline WHERE discplineName = 'Marathon'), (SELECT Acode FROM Athlete WHERE name = 'Carlos Velocidad')),
((SELECT discipline_code FROM Discipline WHERE discplineName = 'High Jump'), (SELECT Acode FROM Athlete WHERE name = 'Victoria Jump')),
((SELECT discipline_code FROM Discipline WHERE discplineName = 'Javelin Throw'), (SELECT Acode FROM Athlete WHERE name = 'Jake Swift')),
((SELECT discipline_code FROM Discipline WHERE discplineName = 'Pole Vault'), (SELECT Acode FROM Athlete WHERE name = 'Jean Sprinter')),
((SELECT discipline_code FROM Discipline WHERE discplineName = 'Rowing'), (SELECT Acode FROM Athlete WHERE name = 'Klara Power'));

--consultas
--Retrieve all female athletes (gender = 'Female') who participate in more than one discipline.
--Display their full names, disciplines, and number of disciplines
INSERT INTO Athlete (nationality_code, name, name_TV, gender, nationality, height, weight, birth_date) VALUES
('USA', 'Alice Speedy', 'AliceS', 0, 'American', 1.70, 60.5, '1993-04-18'),
('GER', 'Sophia Leaper', 'SophiaL', 0, 'German', 1.78, 64.2, '1992-09-07'),
('AUS', 'Isabella Strong', 'BellaS', 0, 'Australian', 1.75, 63.1, '1994-05-21'),
('ESP', 'María Gómez', 'MariaG', 0, 'Spanish', 1.73, 61.4, '1993-03-29');

INSERT INTO Discipline (discplineName) VALUES
('100m Hurdles'),
('400m Sprint'),
('Long Jump'),
('Triple Jump');

INSERT INTO Discipline_Athlete (fk_disciplineCode, fk_AthleteCode) VALUES
((SELECT discipline_code FROM Discipline WHERE discplineName = '100m Hurdles'), (SELECT Acode FROM Athlete WHERE name = 'Alice Speedy')),
((SELECT discipline_code FROM Discipline WHERE discplineName = '400m Sprint'), (SELECT Acode FROM Athlete WHERE name = 'Alice Speedy')),
((SELECT discipline_code FROM Discipline WHERE discplineName = 'Long Jump'), (SELECT Acode FROM Athlete WHERE name = 'Sophia Leaper')),
((SELECT discipline_code FROM Discipline WHERE discplineName = 'Triple Jump'), (SELECT Acode FROM Athlete WHERE name = 'Sophia Leaper')),
((SELECT discipline_code FROM Discipline WHERE discplineName = '400m Sprint'), (SELECT Acode FROM Athlete WHERE name = 'Isabella Strong')),
((SELECT discipline_code FROM Discipline WHERE discplineName = 'Long Jump'), (SELECT Acode FROM Athlete WHERE name = 'Isabella Strong')),
((SELECT discipline_code FROM Discipline WHERE discplineName = 'Triple Jump'), (SELECT Acode FROM Athlete WHERE name = 'María Gómez')),
((SELECT discipline_code FROM Discipline WHERE discplineName = '400m Sprint'), (SELECT Acode FROM Athlete WHERE name = 'María Gómez'));

select a.name as full_name, array_agg(d.discplineName) as disciplines,
       count(d.discplineName) as numberOf_disciplines from Athlete a
     join Discipline_Athlete da on a.Acode = da.fk_AthleteCode
     join Discipline d on da.fk_disciplineCode = d.discipline_code
     where a.gender =0 group by a.Acode, a.name
     having count(d.discplineName)>1 order by full_name;


--List the full names and nationalities of athletes who were born after the year 2000 and
--weigh more than the average weight of all athletes

INSERT INTO Athlete (nationality_code, name, name_TV, gender, nationality, height, weight, birth_date) VALUES
('CAN', 'Liam Strong', 'LiamS', 1, 'Canadian', 1.85, 85.5, '2001-08-15'),
('GER', 'Emma Schnell', 'EmmaS', 0, 'German', 1.80, 70.2, '2002-11-19'),
('AUS', 'Jack Runner', 'JackR', 1, 'Australian', 1.90, 88.1, '2003-06-10'),
('FRA', 'Chloe Swimmer', 'ChloeS', 0, 'French', 1.75, 72.3, '2001-04-23'),
('ESP', 'Diego Perez', 'DiegoP', 1, 'Spanish', 1.88, 90.0, '2000-12-05'),
('USA', 'Olivia Power', 'OliviaP', 0, 'American', 1.78, 68.5, '2003-02-17'),
('ITA', 'Marco Strong', 'MarcoS', 1, 'Italian', 1.83, 87.2, '2001-07-30'),
('KOR', 'Ji-hoon Runner', 'JihoonR', 1, 'South Korean', 1.82, 80.5, '2002-05-08'),
('UK', 'Ethan Speed', 'EthanS', 1, 'British', 1.90, 89.0, '2002-12-11'),
('MEX', 'Isabella Jump', 'IsaJump', 0, 'Mexican', 1.76, 69.0, '2001-03-12');

with average_weight as (
    select avg(weight) as avg_weight from Athlete
),
filtered_athletes as (
        select name , nationality from Athlete where birth_date >'2000-01-01'
                and weight >(select avg_weight from average_weight)
)
select
    name,nationality from filtered_athletes;


/*Count the number of athletes per country (country_full), and display the result only for
countries that have more than five athletes*/

INSERT INTO Athlete (nationality_code, name, name_TV, gender, nationality, height, weight, birth_date) VALUES
('BRA', 'Lucas Footballer', 'LucasF', 1, 'Brazilian', 1.85, 79.5, '1991-07-14'),
('BRA', 'Fernanda Runner', 'FernandaR', 0, 'Brazilian', 1.75, 63.5, '1992-08-19'),
('BRA', 'Paulo Strong', 'PauloS', 1, 'Brazilian', 1.90, 85.3, '1990-11-23'),
('BRA', 'Gabriela Jumper', 'GabrielaJ', 0, 'Brazilian', 1.80, 68.0, '1993-01-12'),
('BRA', 'Mateus Swimmer', 'MateusS', 1, 'Brazilian', 1.88, 81.5, '1994-05-09'),
('CAN', 'David Fast', 'DavidF', 1, 'Canadian', 1.83, 80.2, '1992-09-25'),
('CAN', 'Sophie Jumper', 'SophieJ', 0, 'Canadian', 1.78, 67.0, '1995-04-30'),
('CAN', 'Nathan Runner', 'NathanR', 1, 'Canadian', 1.84, 82.1, '1993-12-18'),
('CAN', 'Isabella Swimmer', 'IsabellaS', 0, 'Canadian', 1.76, 66.5, '1991-06-07'),
('CAN', 'Ethan Strong', 'EthanS', 1, 'Canadian', 1.86, 84.0, '1990-03-15'),
('GER', 'Thomas Runner', 'ThomasR', 1, 'German', 1.87, 83.0, '1990-10-11'),
('GER', 'Hanna Swimmer', 'HannaS', 0, 'German', 1.80, 69.0, '1992-02-04'),
('GER', 'Johannes Strong', 'JohannesS', 1, 'German', 1.89, 85.7, '1994-08-22'),
('GER', 'Klara Jumper', 'KlaraJ', 0, 'German', 1.75, 66.0, '1991-11-03'),
('GER', 'Lukas Footballer', 'LukasF', 1, 'German', 1.90, 80.0, '1995-01-09'),
('GER', 'Emily Runner', 'EmilyR', 0, 'German', 1.79, 67.8, '1993-03-12');

SELECT
    c.countryName AS country_full,
    COUNT(a.Acode) AS num_athletes
FROM
    Athlete a
JOIN
    country c
ON
    a.nationality_code = c.nationality_code  -- Se hace el JOIN por nationality_code, que es de tipo VARCHAR(3)
GROUP BY
    c.countryName
HAVING
    COUNT(a.Acode) > 5;


/*4. Find the youngest and oldest athletes in the database. Show their full names, birth dates,
and nationalities*/
select name, birth_date, nationality from Athlete
where birth_date = (select min(birth_date) from Athlete);

select name, nationality, birth_date from Athlete
where birth_date = (select max(birth_date) from Athlete);

/*
5. List the athletes who participate in more than three events, displaying their full names, the
events, and the total number of events they participate in. Use a temporary table to assist
in this query */


INSERT INTO event (eventName, eventDate) VALUES
('Men\s Volleyball', '2024-08-05'),
('Men\s Volley Playa', '2024-08-06'),
('Men\s Basketball', '2024-08-07'),
('Men\s Wrestling', '2024-08-08');

INSERT INTO event_Athlete (fk_eventCode, fk_athleteCode) VALUES
((SELECT eventCode FROM event WHERE eventName = 'Men\s Volleyball'), (SELECT Acode FROM Athlete WHERE name = 'John Speedman')),
((SELECT eventCode FROM event WHERE eventName = 'Men\s Volley Playa'), (SELECT Acode FROM Athlete WHERE name = 'John Speedman')),
((SELECT eventCode FROM event WHERE eventName = 'Men\s Basketball'), (SELECT Acode FROM Athlete WHERE name = 'John Speedman')),
((SELECT eventCode FROM event WHERE eventName = 'Men\s Wrestling'), (SELECT Acode FROM Athlete WHERE name = 'John Speedman'));


select eventCode, eventName from event;

CREATE TEMP TABLE athlete_event_count AS
SELECT
    fk_athleteCode,
    COUNT(fk_eventCode) AS eventCount
FROM
    event_Athlete
GROUP BY
    fk_athleteCode
HAVING
    COUNT(fk_eventCode) > 3;

SELECT
    a.name AS full_name,
    e.eventName AS event_name,
    aeC.eventCount AS total_events
FROM
    athlete_event_count aeC
JOIN
    Athlete a ON a.Acode = aeC.fk_athleteCode
JOIN
    event_Athlete ea ON ea.fk_athleteCode = aeC.fk_athleteCode
JOIN
    event e ON e.eventCode = ea.fk_eventCode
ORDER BY
    a.name, e.eventName;

/*
6. Create a view that lists all athletes along with the number of events they participate in.
Then, write a query to display the athletes from this view who participate in exactly two
events */
INSERT INTO event_Athlete (fk_eventCode, fk_athleteCode) VALUES
((SELECT eventCode FROM event WHERE eventName = 'Men\s 100m Sprint Final'), (SELECT Acode FROM Athlete WHERE name = 'Carlos Velocidad')),
((SELECT eventCode FROM event WHERE eventName = 'Men\s 200m Sprint Final'), (SELECT Acode FROM Athlete WHERE name = 'Carlos Velocidad')),

((SELECT eventCode FROM event WHERE eventName = 'Women\s High Jump Final'), (SELECT Acode FROM Athlete WHERE name = 'Sophia Leaper')),
((SELECT eventCode FROM event WHERE eventName = 'Women\s Gymnastics Final'), (SELECT Acode FROM Athlete WHERE name = 'Sophia Leaper')),

((SELECT eventCode FROM event WHERE eventName = 'Men\s Football Final'), (SELECT Acode FROM Athlete WHERE name = 'Liam Strong')),
((SELECT eventCode FROM event WHERE eventName = 'Men\s 200m Sprint Final'), (SELECT Acode FROM Athlete WHERE name = 'Liam Strong'));

create view athleteEventCount as select
        a.name, count(ea.fk_eventCode) as num_events from Athlete a left join
    event_Athlete eA on a.Acode = eA.fk_athleteCode group by a.Acode, a.name;

  select name,num_events from athleteEventCount where num_events =2;

/*
7. Use a temporary table to list the average height and weight of athletes grouped by
nationality. Then, query this table to find nationalities where the average height is above
180 cm and the average weight is below 75 kg*/

INSERT INTO Athlete (nationality_code, name, name_TV, gender, nationality, height, weight, birth_date) VALUES
('GER', 'Anna High', 'AnnaH', 0, 'German', 1.85, 70.0, '1994-07-18'),
('GER', 'Mark Tall', 'MarkT', 1, 'German', 1.90, 72.0, '1993-05-22'),
('SWE', 'Oscar Light', 'OscarL', 1, 'Swedish', 1.82, 68.5, '1992-10-12'),
('SWE', 'Sofia Fast', 'SofiaF', 0, 'Swedish', 1.83, 74.0, '1995-06-25'),
('CAN', 'Daniel Swift', 'DanS', 1, 'Canadian', 1.78, 75.5, '1991-12-09'),
('CAN', 'Emily Tall', 'EmTall', 0, 'Canadian', 1.85, 72.2, '1992-03-30'),
('ITA', 'Marco Light', 'MarcoL', 1, 'Italian', 1.81, 73.5, '1993-04-10'),
('ITA', 'Luisa Runner', 'LuisaR', 0, 'Italian', 1.84, 74.9, '1994-01-19');

insert into Athlete (nationality_code, name, name_TV, gender, nationality, height, weight, birth_date) values
    ('GER', 'Mateus Lanzoni','MatLan',1,'German',2.90,50,'2004-09-4'),
    ('BRA','Juanmi','Elputon',1,'brazilian',1.10,30,'2003-09-11');

drop table if exists avgWeightHeightNationality;

 CREATE TEMP TABLE avgWeightHeightNationality AS
SELECT nationality AS nationality,
       AVG(height) AS avg_height,
       AVG(weight) AS avg_weight
FROM Athlete
GROUP BY nationality;

SELECT
    nationality,avg_weight,avg_weight FROM avgWeightHeightNationality
WHERE
    avg_height > 180
    AND avg_weight < 75;

/*
8. Write a query to identify any potential data inconsistencies by finding athletes whose listed
events do not match their disciplines. For example, if an athlete’s discipline is 'Archery' but
their events include 'Swimming', this should be flagged as inconsistent. Use a combination
of joins, string functions, and subqueries to achieve this, and display the athlete’s name,
discipline, and the mismatched events*/

INSERT INTO Athlete (nationality_code, name, name_TV, gender, nationality, height, weight, birth_date)
VALUES ('UK', 'Sophie Tennis', 'SophieT', 0, 'British', 1.70, 65, '1993-08-10');

-- Asignar disciplina "Tennis" a Sophie Tennis
INSERT INTO Discipline (discplineName) VALUES ('Tennis');
INSERT INTO Discipline_Athlete (fk_disciplineCode, fk_AthleteCode)
VALUES ((SELECT discipline_code FROM Discipline WHERE discplineName = 'Tennis'), (SELECT Acode FROM Athlete WHERE name = 'Sophie Tennis'));

-- Asignar evento de "Marathon" a Sophie Tennis (inconsistente)
INSERT INTO event (eventName, eventDate) VALUES ('Women\s Marathon', '2024-07-22');
INSERT INTO event_Athlete (fk_eventCode, fk_athleteCode)
VALUES ((SELECT eventCode FROM event WHERE eventName = 'Women\s Marathon'), (SELECT Acode FROM Athlete WHERE name = 'Sophie Tennis'));

INSERT INTO Discipline_Athlete (fk_disciplineCode, fk_AthleteCode)
VALUES ((SELECT discipline_code FROM Discipline WHERE discplineName = 'Archery' LIMIT 1),
        (SELECT Acode FROM Athlete WHERE name = 'Liam Archer' LIMIT 1));

INSERT INTO event_Athlete (fk_eventCode, fk_athleteCode)
VALUES ((SELECT eventCode FROM event WHERE eventName = 'Men\s Swimming 100m Freestyle' LIMIT 1),
        (SELECT Acode FROM Athlete WHERE name = 'Liam Archer' LIMIT 1));

  WITH athlete_disciplines AS (
    -- Obtenemos el nombre del atleta y su disciplina principal
    SELECT
        a.Acode AS athlete_code,
        a.name AS athlete_name,
        d.discplineName AS discipline
    FROM
        Athlete a
    JOIN
        Discipline_Athlete da ON a.Acode = da.fk_AthleteCode
    JOIN
        Discipline d ON da.fk_disciplineCode = d.discipline_code
),
athlete_events AS (
    -- Obtenemos los eventos en los que participa el atleta
    SELECT
        a.Acode AS athlete_code,
        e.eventName AS event_name
    FROM
        Athlete a
    JOIN
        event_Athlete ea ON a.Acode = ea.fk_athleteCode
    JOIN
        event e ON ea.fk_eventCode = e.eventCode
),
inconsistent_events AS (
    -- Detectamos inconsistencias entre la disciplina del atleta y los eventos en los que participa
    SELECT
        ad.athlete_name,
        ad.discipline,
        ae.event_name
    FROM
        athlete_disciplines ad
    JOIN
        athlete_events ae ON ad.athlete_code = ae.athlete_code
    WHERE
        -- Buscamos eventos que no contengan palabras clave relacionadas con la disciplina del atleta
        NOT (
            LOWER(ad.discipline) LIKE '%' || LOWER(ae.event_name) || '%' OR
            LOWER(ae.event_name) LIKE '%' || LOWER(ad.discipline) || '%'
        )
)

-- Finalmente, mostramos los atletas con inconsistencias
SELECT
    athlete_name,
    discipline,
    event_name
FROM
    inconsistent_events
ORDER BY
    athlete_name, event_name;
/*
9. Database normalized and postgresql script for database and data insertion*/

-- Drop existing tables if they exist
DROP TABLE IF EXISTS Discipline_Athlete;
DROP TABLE IF EXISTS event_Athlete;
DROP TABLE IF EXISTS Event;
DROP TABLE IF EXISTS Country;
DROP TABLE IF EXISTS Discipline;
DROP TABLE IF EXISTS Athlete;
--Country table
create table country(
    country_code serial primary key,
    countryName varchar(50),
    nationality_code varchar(3) unique  -- Restricción de unicidad agregada
);
--Athlete table
create table Athlete(
    nationality_code varchar(3),
    Acode serial primary key,
    name varchar(50),
    name_TV varchar(15),
    gender int not null, -- 1 for men, 0 to women
    nationality varchar(20),
    foreign key (nationality_code) references country(nationality_code),
    height decimal(5,2),
    weight decimal(5,2),
    birth_date date
);
--Discipline table
create table Discipline(
    discipline_code serial primary key not null,
    discplineName varchar(50)
);
--Event table
create table event(
    eventCode serial primary key not null,
    eventName varchar(50),
    eventDate date
);
--event_Athlete table
create table event_Athlete(
    fk_eventCode int not null,
    fk_athleteCode int not null,
    foreign key (fk_eventCode) references event(eventCode),
    foreign key (fk_athleteCode) references Athlete(Acode)
);
--Discipline_athlete table
create table Discipline_Athlete(
    fk_disciplineCode int not null,
    fk_AthleteCode int not null,
    foreign key (fk_disciplineCode) references Discipline(discipline_code),
    foreign key (fk_AthleteCode) references Athlete(Acode)
);
------ Second

/*
1.Normalize the database up to the Third Normal Form (3NF). Break down the large, unstructured table into smaller, well-structured tables to eliminate redundancy and ensure data integrity.
*/

CREATE TABLE States (
    state_id SERIAL ,
    state VARCHAR(100) PRIMARY KEY
);

CREATE TABLE Cities (
    FOREIGN KEY (state) REFERENCES States(state),
    cityname VARCHAR(255) PRIMARY KEY,
    state VARCHAR(100)
);

CREATE TABLE Apartments (
    FOREIGN KEY (cityname) REFERENCES Cities(cityname),
    FOREIGN KEY (state) REFERENCES States(state),
    id SERIAL PRIMARY KEY,
    title VARCHAR(255),
    body TEXT,
    amenities TEXT,
    bathrooms INT,
    bedrooms INT,
    square_feet INT,
    address TEXT,
    cityname VARCHAR(255),
    state VARCHAR(100),
    latitude DECIMAL,
    longitude DECIMAL,
    time TIMESTAMP
);

CREATE TABLE Prices (
    price_id INT PRIMARY KEY,
    currency VARCHAR(10),
    price DECIMAL,
    fee DECIMAL,
    price_type VARCHAR(50)
);

CREATE TABLE Listings (
    FOREIGN KEY (id) REFERENCES Apartments(id),
    FOREIGN KEY (price_id) REFERENCES Prices(price_id),
    id INT PRIMARY KEY,
    price_id INT,
    has_photo BOOLEAN,
    pets_allowed BOOLEAN,
    source VARCHAR(255),
    category VARCHAR(50)
);

drop table prices, Listings;

/*
2. Create the normalized tables in PostgreSQL. Ensure that the relationships between tables are properly defined using foreign keys.
*/

/*
3. Insert the cleaned data into the normalized tables.
*/
INSERT INTO States (state) VALUES
('California'),
('Texas'),
('New York'),
('Florida'),
('Illinois');

INSERT INTO Cities (cityname, state) VALUES
('Los Angeles', 'California'),
('San Francisco', 'California'),
('Austin', 'Texas'),
('Houston', 'Texas'),
('New York City', 'New York'),
('Miami', 'Florida'),
('Orlando', 'Florida'),
('Chicago', 'Illinois');

INSERT INTO Apartments (title, body, amenities, bathrooms, bedrooms, square_feet, address, cityname, state, latitude, longitude, time)
VALUES
('Luxury Condo Downtown', 'Spacious 2 bedroom condo in downtown', 'Pool, Gym, Parking', 2, 2, 1500, '123 Main St', 'Los Angeles', 'California', 34.0522, -118.2437, '2024-09-10 10:00:00'),
('Modern Loft', 'Stylish 1 bedroom loft near the tech district', 'Gym, Roofdeck', 1, 1, 800, '456 Tech Ave', 'San Francisco', 'California', 37.7749, -122.4194, '2024-09-10 11:00:00'),
('Cozy Apartment', '1 bedroom cozy apartment', 'Laundry, Pets Allowed', 1, 1, 600, '789 Elm St', 'Austin', 'Texas', 30.2672, -97.7431, '2024-09-10 12:00:00'),
('Suburban House', 'Large 3 bedroom house in a quiet neighborhood', 'Garage, Yard', 2, 3, 2000, '101 Maple Ave', 'Houston', 'Texas', 29.7604, -95.3698, '2024-09-10 13:00:00'),
('Penthouse Suite', 'Penthouse suite with skyline views', 'Pool, Gym, Parking', 2, 3, 2200, '202 Broadway', 'New York City', 'New York', 40.7128, -74.0060, '2024-09-10 14:00:00'),
('Beachside Condo', '1 bedroom condo steps from the beach', 'Pool, Beach Access', 1, 1, 700, '303 Ocean Dr', 'Miami', 'Florida', 25.7617, -80.1918, '2024-09-10 15:00:00'),
('Family Home', 'Spacious 4 bedroom home perfect for a family', 'Garage, Yard, Pool', 3, 4, 2500, '404 Sunset Blvd', 'Orlando', 'Florida', 28.5383, -81.3792, '2024-09-10 16:00:00'),
('Downtown Apartment', '1 bedroom apartment in the heart of the city', 'Pets Allowed', 1, 1, 850, '505 State St', 'Chicago', 'Illinois', 41.8781, -87.6298, '2024-09-10 17:00:00'),
('Luxury Villa', '4 bedroom luxury villa with private pool', 'Private Pool, Gym, Parking', 4, 4, 3000, '606 Mansion Ln', 'Los Angeles', 'California', 34.0522, -118.2437, '2024-09-10 18:00:00'),
('Studio Loft', 'Open-concept studio loft in tech hub', 'Gym, Pets Allowed', 1, 0, 500, '707 Bay St', 'San Francisco', 'California', 37.7749, -122.4194, '2024-09-10 19:00:00'),
('Apartment with Garden', '2 bedroom apartment with private garden', 'Garden, Pets Allowed', 2, 2, 1200, '808 Garden St', 'Austin', 'Texas', 30.2672, -97.7431, '2024-09-10 20:00:00'),
('Charming Bungalow', '3 bedroom bungalow in a serene neighborhood', 'Yard, Pets Allowed', 2, 3, 1800, '909 Hilltop Rd', 'Houston', 'Texas', 29.7604, -95.3698, '2024-09-10 21:00:00'),
('Downtown Studio', 'Modern studio with skyline views', 'Gym, Pool', 1, 0, 600, '1010 Central Park', 'New York City', 'New York', 40.7128, -74.0060, '2024-09-10 22:00:00'),
('Beachfront Bungalow', '2 bedroom beachfront bungalow', 'Beach Access, Pool', 2, 2, 1100, '1111 Beach Rd', 'Miami', 'Florida', 25.7617, -80.1918, '2024-09-10 23:00:00'),
('Spacious Penthouse', '5 bedroom penthouse with stunning city views', 'Gym, Pool, Parking', 5, 5, 4000, '1212 Skyview St', 'Chicago', 'Illinois', 41.8781, -87.6298, '2024-09-11 00:00:00');

INSERT INTO Prices (price_id, currency, price, fee, price_type) VALUES
(1, 'USD', 5000, 250, 'monthly'),
(2, 'USD', 3500, 200, 'monthly'),
(3, 'USD', 2000, 100, 'monthly'),
(4, 'USD', 4000, 300, 'monthly'),
(5, 'USD', 8000, 500, 'monthly'),
(6, 'USD', 3500, 150, 'monthly'),
(7, 'USD', 6000, 350, 'monthly'),
(8, 'USD', 3000, 100, 'monthly'),
(9, 'USD', 10000, 700, 'monthly'),
(10, 'USD', 1800, 100, 'weekly'),
(11, 'USD', 2500, 200, 'biweekly'),
(12, 'USD', 4500, 250, 'monthly'),
(13, 'USD', 3000, 150, 'monthly'),
(14, 'USD', 4000, 300, 'monthly'),
(15, 'USD', 15000, 1000, 'monthly');

INSERT INTO Listings (id, price_id, has_photo, pets_allowed, source, category) VALUES
(1, 1, TRUE, TRUE, 'Online Listing', 'Apartment'),
(2, 2, TRUE, FALSE, 'Online Listing', 'Apartment'),
(3, 3, FALSE, TRUE, 'Real Estate Agency', 'Apartment'),
(4, 4, TRUE, FALSE, 'Real Estate Agency', 'House'),
(5, 5, TRUE, TRUE, 'Online Listing', 'Penthouse'),
(6, 6, TRUE, TRUE, 'Real Estate Agency', 'Condo'),
(7, 7, TRUE, TRUE, 'Online Listing', 'House'),
(8, 8, TRUE, FALSE, 'Real Estate Agency', 'Apartment'),
(9, 9, TRUE, TRUE, 'Online Listing', 'Villa'),
(10, 10, FALSE, TRUE, 'Real Estate Agency', 'Studio'),
(11, 11, TRUE, TRUE, 'Online Listing', 'Apartment'),
(12, 12, TRUE, FALSE, 'Real Estate Agency', 'House'),
(13, 13, TRUE, TRUE, 'Online Listing', 'Studio'),
(14, 14, TRUE, TRUE, 'Online Listing', 'Bungalow'),
(15, 15, TRUE, FALSE, 'Real Estate Agency', 'Penthouse');

/*
4. Retrieve all apartment listings located in a specific city, displaying the title, price, and number of bedrooms.
*/
SELECT
    Apartments.title,
    Prices.price,
    Apartments.bedrooms
FROM
    Apartments
JOIN
    Listings ON Apartments.id = Listings.id
JOIN
    Prices ON Listings.price_id = Prices.price_id
WHERE
    Apartments.cityname = 'Austin';

/*
5. Count the number of listings per state and display states that have more than 100 listings. (with the most listings)
 */
 SELECT
    Apartments.state,
    COUNT(Listings.id) AS num_listings
FROM
    Apartments
JOIN
    Listings ON Apartments.id = Listings.id
GROUP BY
    Apartments.state
ORDER BY
    num_listings DESC
LIMIT 1;  -- Displays only the state with the most listings, changing it allows to see more states

---- Second option

SELECT
    Apartments.state,
    COUNT(Listings.id) AS num_listings
FROM
    Apartments
JOIN
    Listings ON Apartments.id = Listings.id
GROUP BY
    Apartments.state
ORDER BY
    num_listings DESC;


/*
6. Find the average price of apartments in each city that have at least two bedrooms. Display the city name, average price, and the number of apartments meeting the criteria.
 */
SELECT
    Apartments.cityname,
    AVG(Prices.price) AS average_price,
    COUNT(Apartments.id) AS num_apartments
FROM
    Apartments
JOIN
    Listings ON Apartments.id = Listings.id
JOIN
    Prices ON Listings.price_id = Prices.price_id
WHERE
    Apartments.bedrooms >= 2
GROUP BY
    Apartments.cityname
ORDER BY
    average_price DESC;

/*
7. List all apartments that include the word "luxury" in their title or description, along with their price and address.
*/
SELECT
    Apartments.title,
    Apartments.address,
    Prices.price
FROM
    Apartments
JOIN
    Listings ON Apartments.id = Listings.id
JOIN
    Prices ON Listings.price_id = Prices.price_id
WHERE
    Apartments.title ILIKE '%luxury%'
    OR Apartments.body ILIKE '%luxury%';

/*
8. Create a view that lists all apartments along with their price per square foot. Then, write a query to display apartments from this view that have a price per square foot above the median value.
*/
CREATE VIEW ApartmentPricePerSqFt AS
SELECT
    Apartments.id,
    Apartments.title,
    Apartments.address,
    Prices.price,
    Apartments.square_feet,
    (Prices.price / Apartments.square_feet) AS price_per_sqft
FROM
    Apartments
JOIN
    Listings ON Apartments.id = Listings.id
JOIN
    Prices ON Listings.price_id = Prices.price_id;

SELECT *
FROM ApartmentPricePerSqFt
WHERE price_per_sqft > (
    SELECT PERCENTILE_CONT(0.5) WITHIN GROUP (ORDER BY price_per_sqft)
    FROM ApartmentPricePerSqFt
);

/*
9. Use a temporary table to store the top 10 most expensive apartments in each state. Then, write a query to find the average price of these top listings by state.
*/
CREATE TEMPORARY TABLE Top10ExpensiveApartments AS
SELECT
    Apartments.id,
    Apartments.state,
    Prices.price,
    ROW_NUMBER() OVER (PARTITION BY Apartments.state ORDER BY Prices.price DESC) AS rank
FROM
    Apartments
JOIN
    Listings ON Apartments.id = Listings.id
JOIN
    Prices ON Listings.price_id = Prices.price_id
WHERE
    Apartments.state IS NOT NULL
ORDER BY
    Apartments.state, Prices.price DESC;

-- Keep only the top 10 apartments per state
DELETE FROM Top10ExpensiveApartments
WHERE rank > 10;

SELECT
    state,
    AVG(price) AS average_price
FROM
    Top10ExpensiveApartments
GROUP BY
    state;


/*
10. Identify inconsistencies in the data by finding listings where the stated number of bedrooms does not match the description. For example, if an apartment is listed as having 3 bedrooms but the description mentions only 2, this should be flagged. Use a combination of string functions, joins, and subqueries to accomplish this, and display the listing ID, title, and the inconsistency.
 */
SELECT
    Apartments.id,
    Apartments.title,
    Apartments.bedrooms AS stated_bedrooms,
    regexp_result.mentioned_bedrooms,
    CASE
        WHEN regexp_result.mentioned_bedrooms IS DISTINCT FROM Apartments.bedrooms THEN
            'Inconsistency found: Description mentions a different number of bedrooms'
        ELSE
            'No inconsistency'
    END AS inconsistency
FROM
    Apartments
JOIN
    Listings ON Apartments.id = Listings.id
LEFT JOIN LATERAL (
    SELECT
        CAST((REGEXP_MATCHES(Apartments.body, '[[:digit:]]+'))[1] AS INT) AS mentioned_bedrooms
    WHERE Apartments.body ~ '[[:digit:]]+ bedroom'
) AS regexp_result ON true
WHERE
    Apartments.body ~ '[[:digit:]]+ bedroom';