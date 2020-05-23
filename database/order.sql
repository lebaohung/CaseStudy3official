create table orders (
    orderId int(11) not null primary key auto_increment ,
    guestId int(11) not null ,
    branchId int(11) not null ,
    date date not null ,
    time time not null ,
    guestNum int(15) not null,
    constraint fk_guest foreign key (guestId) references guest(guestId)
    on delete cascade
    on update cascade ,
    constraint fk_branch foreign key (branchId) references branch(branchId)
    on delete cascade
    on update cascade
);