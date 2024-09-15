-- Добавляем жанры
INSERT INTO Genres (name) VALUES 
('Rock'), 
('Pop'), 
('Jazz');

-- Добавляем исполнителей
INSERT INTO Artists (name) VALUES 
('Artist 1'), 
('Artist 2'), 
('Artist 3'), 
('Artist 4');

-- Связываем исполнителей с жанрами
INSERT INTO Artist_Genre (artist_id, genre_id) VALUES 
(1, 1),
(1, 2),
(2, 1),
(3, 3),
(4, 2);

-- Добавляем альбомы
INSERT INTO Albums (title, release_year) VALUES 
('Album 1', 2021), 
('Album 2', 2020), 
('Album 3', 2022);

-- Связываем исполнителей с альбомами
INSERT INTO Artist_Album (artist_id, album_id) VALUES 
(1, 1),
(2, 1),
(3, 2),
(4, 3);

-- Добавляем треки
INSERT INTO Tracks (title, duration, album_id) VALUES 
('Track 1', '00:03:45', 1), 
('Track 2', '00:04:00', 1), 
('Track 3', '00:05:00', 2), 
('Track 4', '00:02:30', 2), 
('Track 5', '00:03:10', 3), 
('Track 6', '00:04:20', 3);

-- Добавляем сборники
INSERT INTO Compilations (title, release_year) VALUES 
('Compilation 1', 2023), 
('Compilation 2', 2021), 
('Compilation 3', 2022), 
('Compilation 4', 2020);

-- Связываем треки со сборниками
INSERT INTO Compilation_Track (compilation_id, track_id) VALUES 
(1, 1),
(1, 3),
(2, 2),
(2, 5),
(3, 4),
(3, 6),
(4, 1),
(4, 6);
