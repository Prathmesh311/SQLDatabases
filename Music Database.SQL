--creating database
CREATE DATABASE Music DEFAULT CHARATER SET UTF8;
CREATE TABLE Artist(
    artist_id INTEGER NOT NULL AUTO_INCREMENT,
    name VARCHAR(255),
    PRIMARY KEY(artist_id)
)ENGINE INNODB;


--Creating Album Table
CREATE TABLE Album (
    album_id INTEGER NOT NULL AUTO_INCREMENT,
    title VARCHAR(255),
    artist_id INTEGER,
    PRIMARY KEY(album_id),
    INDEX USING BTREE(title),
    
    CONSTRAINT FOREIGN KEY (artist_id) REFERENCES Artist(artist_id)
    ON DELETE CASCADE ON UPDATE CASCADE
)ENGINE= INNODB;
    
--Creating Genre Table
CREATE TABLE Genre(
    genre_id INTEGER NOT NULL AUTO_INCREMENT,
    name VARCHAR(255),
    PRIMARY KEY(genre_id),
    INDEX USING BTREE(name)
)ENGINE=INNODB;
    

--Creating Track Table    
CREATE TABLE Track(
    track_id INTEGER NOT NULL AUTO_INCREMENT,
    title VARCHAR(255),
    len INTEGER,
    rating INTEGER,
    count INTEGER,
    album_id INTEGER,
    artist_id INTEGER,
    PRIMARY KEY(track_id),
    INDEX USING BTREE(title),
    
    CONSTRAINT FOREIGN KEY (album_id) REFERENCES Album (album_id)
    ON DELETE CASCADE ON UPDATE CASCADE,
    CONSTRAINT FOREIGN KEY (artist_id) REFERENCES Artist(artist_id)
    ON DELETE CASCADE ON UPDATE CASCADE
)ENGINE=INNODB;

    
--Inserting Artist Data

INSERT INTO Artist(name) VALUES("Eagles"),("Michael Jackson"),("Garth Brooks");


-- Inserting Album Data

INSERT INTO Album (title,artist_id) VALUES
("Hotel California",1),
("Thriller",2),
("Their greatest hits",1),
("Double live",3),
("Dangerous",2);


--Inserting Genre Data

INSERT INTO Genre(name) VALUES
("Pop"),
("Rock"),
("Country classic");


--Inserting Track Data

INSERT INTO Track(title, len, rating, count, album_id, genre_id) VALUES
("Hotel California",390,4,0,1,2),
("New kid in town",304,5,0,1,2),
("Life in the fast line",286,3,0,1,2),
("wasted time",321,4,0,1,2),
("Wanna be starting something",363,5,0,2,1),
("Baby be mine",260,4,0,2,1),
("The girl is mine",222,4,0,2,1),
("Thriller",358,5,0,2,1),
("Take it easy",212,5,0,3,1),
("Witch women",253,4,0,3,2),
("lyin Eyes",382,3,0,3,2),
("Already gone",253,4,0,3,2),
("Callin' baton rouge",178,4,0,4,3),
("Shameless",243,5,0,4,3),
("The thunder rolls",293,4,0,4,3),
("We shall be free",229,4,0,4,3),
("Jam",338,5,0,5,1),
("In the closet",391,3,0,5,1),
("Why wanna trip on me",325,4,0,5,1),
("Heal the world",390,5,0,5,1);

--Joining Tables Again
SELECT Track.title,Artist.name,Album.title,Genre.name
FROM Track JOIN Genre JOIN Album JOIN artist ON
Track.genre_id = Genre.genre_id AND Track.album_id = Album.album_id
AND Album.artist_id = Artist.artist_id   LIMIT 4;

SELECT Artist.name,Genre.name
FROM Artist JOIN Genre ON
Track.genre_id = Genre.genre_id AND Track.album_id = Album.album_id
AND Album.artist_id = Artist.artist_id   LIMIT 1;


    