create table guest (
    guestId int(11) not null auto_increment ,
    name varchar(50) not null ,
    phone varchar(50) not null unique ,
    primary key (guestId)
);