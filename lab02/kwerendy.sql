CREATE TABLE authors (
    id          SERIAL PRIMARY KEY,
    name        VARCHAR(50) NOT NULL,
    surname     VARCHAR(50) NOT NULL
);

CREATE TABLE publishers (
    id          SERIAL PRIMARY KEY,
    name        VARCHAR(50) NOT NULL,
    country     VARCHAR(50)
);

CREATE TABLE books (
    id              SERIAL PRIMARY KEY,
    title           VARCHAR(150) NOT NULL,
    author_id       INTEGER REFERENCES authors(id),
	publisher_id    INTEGER REFERENCES publishers(id),
    release         INTEGER,
    cost            NUMERIC(6,2),
    availability    BOOLEAN DEFAULT TRUE
);

INSERT INTO authors (name, surname) VALUES
    ('Andrzej', 'Sapkowski'),
    ('J.R.R.', 'Tolkien'),
    ('Stanisław', 'Lem'),
	('Pani', 'Jogurcik'),
	('Pani', 'Pizgacz'),
	('Jostein', 'Gaarder'),
	('Weronika','Marczak'),
	('H.D.', 'Carlton'),
	('Blanka', 'Lipińska'),
	('Vera', 'Valentine'),
	('Patryk', 'Olszowski');

INSERT INTO publishers (name, country) VALUES
    ('Wydawnictwo Niezwykłe', 'Polska'),
	('Pióro Marzeń', 'Polska'),
	('Czzarna Owca', 'Polska');

INSERT INTO publishers (name) VALUES
    ('Amazon'),
	('Muza'),
	('MON'),
	('superNOWA'),
	('Edipresse');

INSERT INTO books (title, author_id, publisher_id, release, cost, availability) VALUES
    ('Wiedźmin', 1, 7, 1990, 39.99, TRUE),
    ('Władca Pierścieni', 2, 5,1954, 59.90, TRUE),
    ('Solaris', 3, 6,1961, 29.90, FALSE),
	('His Obsession', 4, 2, 2025, 43.90, TRUE),
	('Start a Fire 1', 5, 1, 2022, 30.68, TRUE),
	('Start a Fire 2', 5, 1, 2022, 31.74, TRUE),
	('Burn the Hell 3', 5, 1, 2022, 31.74, TRUE),
	('Burn the Hell 4', 5, 1, 2023, 31.74, TRUE),
	('Extinguish the Heat 5', 5, 1, 2023, 31.74, TRUE),
	('Extinguish the Heat 6', 5, 1, 2023, 31.74, TRUE),
	('Extinguish the Heat Final', 5, 1, 2024, 31.74, TRUE),
	('Świat Zofii', 6, 3, 2020, 37.77, TRUE),
	('Haunting Adeline', 8, 1, 2023, 32.70, FALSE),
	('365 dni', 9, 8, 2018, 4.10, TRUE),
	('Koń z Valony', 11, 4, 2023, 44.99, TRUE),
	('Unhinged, an Erotic Door Romance', 10, 4, 2023, 42.00, FALSE),
	('Rodzina Monet. Skarb', 7, 1, 2022, 29.99, TRUE),
	('Rodzina Monet. Królewna 1', 7, 1, 2023, 29.99, TRUE),
	('Rodzina Monet. Królewna 2', 7, 1, 2023, 29.99, TRUE),
	('Rodzina Monet. Perełka 1', 7, 1, 2023, 24.99, TRUE),
	('Rodzina Monet. Perełka 2', 7, 1, 2023, 31.99, TRUE),
	('Rodzina Monet. Diament 1', 7, 1, 2023, 24.99, TRUE),
	('Rodzina Monet. Diament 2', 7, 1, 2024, 27.99, TRUE);



