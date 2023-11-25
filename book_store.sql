-- Creating Relations (DDL)

CREATE TABLE authors (
	id Serial PRIMARY KEY,
	name varchar(255) NOT NULL,
	bio varchar(255)
);

CREATE TABLE genres(
	id Serial,
	name varchar(255) NOT NULL UNIQUE,
	description varchar(255)
);

ALTER TABLE genres ADD PRIMARY KEY(id);

CREATE TABLE books (
	id Serial PRIMARY KEY,
	title varchar(255) NOT NULL,
	description varchar(255),
	ISBN char(13),
	genre_id int,
	CHECK (LENGTH(ISBN) = 13),
	Foreign Key(genre_id) REFERENCES genres (id)
);

CREATE TABLE books_authors (
	book_id int,
	author_id int,
	is_main_author boolean DEFAULT true,
	Foreign Key(book_id) REFERENCES books(id)
);

ALTER TABLE books_authors ADD CONSTRAINT bk_authors_fk Foreign Key(author_id) REFERENCES authors(id);


-- DML
INSERT INTO authors VALUES 
(1, 'Tajudeen', 'Data Analyst'),
(2, 'Nkechi', 'Data Scientist'),
(3, 'Bolu', 'Data Analyst'),
(4, 'Abimbola', 'Data Scientist'),
(5, 'Segun', 'Data Analyst');

INSERT INTO genres(name, id, description) VALUES
('Tech', 1, ''),
('Edu', 2, 'Lorem Ipsum'),
('Fintech', 3, 'Lorem Ipsum'),
('Health', 4, 'Lorem Ipsum'),
('Music', 5, 'Lorem Ipsum');


INSERT INTO books VALUES
(6, 'Intro to Data Analytics', 'Lorem Ipsum', '123232323232', 1);
(2, 'Intro to Business Analytics', 'Lorem Ipsum', '1232323232324', 3),
(3, 'Intro to Data Science', 'Lorem Ipsum', '1232323232890', 1),
(4, 'Intro to Data Analytics For Dummies', 'Lorem Ipsum', '7652323232323', 2),
(5, 'Intro to Data Analytics', 'Lorem Ipsum', '6542323232323', 5);


INSERT INTO books_authors VALUES
(2, 3, true),
(3, 1, true),
(1, 2, false),
(4, 4, true),
(5, 5, true);



-- DQL 
SELECT * FROM authors;

SELECT * FROM books;

SELECT * FROM books_authors;

SELECT * FROM genres;


-- Data Cleaning 
SELECT * FROM genres WHERE column IS NULL;

UPDATE genres SET column = '' WHERE column IS NULL;

UPDATE genres SET column = LOWER(column);

UPDATE genres SET column = TRIM(column);

UPDATE genres SET column = CAST(column AS INT);













