create table guest (
    guestId int(11) not null auto_increment ,
    name varchar(50) not null ,
    phone varchar(50) not null unique ,
    primary key (guestId)
);
ALTER TABLE guest
MODIFY name varchar(50) CHARACTER SET utf8 collate utf8_unicode_ci;
ALTER TABLE guest modify name text CHARACTER SET utf8 COLLATE utf8_unicode_ci;

