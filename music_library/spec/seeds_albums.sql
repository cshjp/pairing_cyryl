
TRUNCATE TABLE artists RESTART IDENTITY;
TRUNCATE TABLE albums RESTART IDENTITY; -- replace with your own table name.

-- Below this line there should only be `INSERT` statements.
-- Replace these statements with your own seed data.

INSERT INTO artists (name, genre) VALUES ('AJR', 'Alt. Pop');
INSERT INTO albums (title, release_year, artist_id) VALUES ('Neotheater', '2019', '1');
INSERT INTO albums (title, release_year, artist_id) VALUES ('The Click', '2017', '1');