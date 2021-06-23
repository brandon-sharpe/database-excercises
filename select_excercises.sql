USE albums_db;

SELECT *
FROM albums;   


SELECT DISTINCT artist -- How many unique artist names are in albums? 23
FROM albums;

DESCRIBE albums; -- What is the primary key for the albums table? id


SELECT     -- What is the oldest release date for on the table? What is the most recent? 
	name,	-- 1967 Sqt. Peppers, 2011 21
	release_date
FROM albums
ORDER BY release_date DESC;


SELECT -- The name of all albums by Pink Floyd? Dark side and The Wall
	name
FROM albums
WHERE artist = 'Pink Floyd'


SELECT release_date --  The year Sgt. Pepper's Lonely Hearts Club Band was released? 1967
FROM albums
WHERE name = "Sgt. Pepper's Lonely Hearts Club Band";


SELECT genre -- The genre for the album Nevermind? Grunge, Alternative rock
FROM albums 
WHERE name ='Nevermind';


SELECT name -- Which albums were released in the 1990s? The Immaculate Collection
FROM albums 
WHERE release_date = 1990 ;

SELECT name  -- Which albums had less than 20 million certified sales? alot << run
FROM albums
WHERE sales < 20 ;


SELECT name -- All the albums with a genre of "Rock".
FROM albums
WHERE genre = 'Rock';
