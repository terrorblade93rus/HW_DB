-- Создание таблицы для жанров
CREATE TABLE Genres (
    id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(255) NOT NULL
);

-- Создание таблицы для исполнителей
CREATE TABLE Artists (
    id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(255) NOT NULL
);

-- Создание таблицы для альбомов
CREATE TABLE Albums (
    id INT PRIMARY KEY AUTO_INCREMENT,
    title VARCHAR(255) NOT NULL,
    release_year INT NOT NULL
);

-- Создание таблицы для треков
CREATE TABLE Tracks (
    id INT PRIMARY KEY AUTO_INCREMENT,
    title VARCHAR(255) NOT NULL,
    duration TIME NOT NULL,
    album_id INT,
    FOREIGN KEY (album_id) REFERENCES Albums(id)
);

-- Создание таблицы для сборников
CREATE TABLE Compilations (
    id INT PRIMARY KEY AUTO_INCREMENT,
    title VARCHAR(255) NOT NULL,
    release_year INT NOT NULL
);

-- Создание таблицы для связи исполнителей и жанров
CREATE TABLE Artist_Genre (
    artist_id INT,
    genre_id INT,
    PRIMARY KEY (artist_id, genre_id),
    FOREIGN KEY (artist_id) REFERENCES Artists(id),
    FOREIGN KEY (genre_id) REFERENCES Genres(id)
);

-- Создание таблицы для связи исполнителей и альбомов
CREATE TABLE Artist_Album (
    artist_id INT,
    album_id INT,
    PRIMARY KEY (artist_id, album_id),
    FOREIGN KEY (artist_id) REFERENCES Artists(id),
    FOREIGN KEY (album_id) REFERENCES Albums(id)
);

-- Создание таблицы для связи сборников и треков
CREATE TABLE Compilation_Track (
    compilation_id INT,
    track_id INT,
    PRIMARY KEY (compilation_id, track_id),
    FOREIGN KEY (compilation_id) REFERENCES Compilations(id),
    FOREIGN KEY (track_id) REFERENCES Tracks(id)
);
