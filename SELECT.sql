-- Название и продолжительность самого длинного трека
SELECT title, duration
FROM Tracks
ORDER BY duration DESC
LIMIT 1;

-- Название треков, продолжительность которых не менее 3,5 минут
SELECT title
FROM Tracks
WHERE duration >= '00:03:30';

-- Названия сборников, вышедших в период с 2018 по 2020 включительно
SELECT title
FROM Compilations
WHERE release_year BETWEEN 2018 AND 2020;

-- Исполнители, чье имя состоит из одного слова
SELECT name
FROM Artists
WHERE name NOT LIKE '% %';

-- Названия треков, которые содержат "мой" или "my"
SELECT title
FROM Tracks
WHERE title LIKE '%мой%' OR title LIKE '%my%';


-- Количество исполнителей в каждом жанре
SELECT g.name AS genre, COUNT(ag.artist_id) AS artist_count
FROM Genres g
JOIN Artist_Genre ag ON g.id = ag.genre_id
GROUP BY g.name;

-- Количество треков, вошедших в альбомы 2019-2020 годов
SELECT COUNT(t.id) AS track_count
FROM Tracks t
JOIN Albums a ON t.album_id = a.id
WHERE a.release_year BETWEEN 2019 AND 2020;

-- Средняя продолжительность треков по каждому альбому
SELECT a.title AS album, AVG(TIME_TO_SEC(t.duration)) / 60 AS avg_duration_minutes
FROM Tracks t
JOIN Albums a ON t.album_id = a.id
GROUP BY a.title;

-- Все исполнители, которые не выпустили альбомы в 2020 году
SELECT ar.name
FROM Artists ar
WHERE ar.id NOT IN (
    SELECT aa.artist_id
    FROM Artist_Album aa
    JOIN Albums a ON aa.album_id = a.id
    WHERE a.release_year = 2020
);

-- Названия сборников, в которых присутствует конкретный исполнитель (Artist 1)
SELECT c.title AS compilation
FROM Compilations c
JOIN Compilation_Track ct ON c.id = ct.compilation_id
JOIN Tracks t ON ct.track_id = t.id
JOIN Albums a ON t.album_id = a.id
JOIN Artist_Album aa ON a.id = aa.album_id
JOIN Artists ar ON aa.artist_id = ar.id
WHERE ar.name = 'Artist 1';
