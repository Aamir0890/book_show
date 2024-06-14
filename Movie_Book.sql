create database book_show;
use book_show;

create table Theatre (
    TheatreId int auto_increment not null primary key,
    TheatreName varchar(255) not null
);
insert into Theatre(TheatreName) values
("PVR"),
("INOX"),
("Empire Theatre");

create table Movie(
   MovieId int auto_increment not null primary key,
   MovieName varchar(255) not null
);

insert into Movie(MovieName) values
("RRR"),
("Darkest Hour"),
("GodFather");

create table Shows(
    ShowId int auto_increment not null primary key,
    MovieId int not null ,
	TheatreId int not null,
    ShowDate Date not null,
    showTime time not null,
    FOREIGN KEY (MovieId) references Movie(MovieId),
    foreign key (TheatreId) references Theatre(TheatreId)
);
insert into Shows(MovieId,TheatreId,ShowDate,showTime) values
(2,3,'2024-06-16','15:00:00'),
(2,2,'2024-06-16','18:00:00'),
(2,3,'2024-06-16','21:00:00'),
(2,1,'2024-06-17','12:00:00'),
(3,2,'2024-06-17','9:00:00'),
(3,1,'2024-06-18','2:00:00');

select Shows.showId,Theatre.TheatreName,Movie.MovieName,Shows.showTime from Shows inner join Theatre on Shows.TheatreId=Theatre.TheatreId inner join Movie on Shows.MovieId=Movie.MovieId where Shows.ShowDate='2024-06-16' and Theatre.TheatreName='INOX';
