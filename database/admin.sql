create table admin (
  adName varchar(60) not null unique primary key ,
  password varchar(60)
);

insert into admin (adName, password) values ('admin', 'admin');