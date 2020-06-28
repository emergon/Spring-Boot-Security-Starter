-- create schema securityDb;
-- use securityDB;

/* -- ********************STARTING DEFAULT TABLES FOR SPRING SECURITY**************************
create table users(
	username varchar(50) primary key,
    password varchar(68),
    enabled int(1),
    email varchar(30)
);

-- drop table users;

create table authorities(
	username varchar(50) not null,
    authority varchar(50) not null,
    unique key authorities_uk (username, authority),
    constraint authorities_fk foreign key (username) references users(username)
);

-- insert into users values ('user', '1234', 1, 'user@email.com');
-- insert into authorities values ('user', 'ROLE_USER');

-- insert into users values ('admin', '{bcrypt}$2a$10$vqc5c3xGDawM/06zHvNMJ.FXjJAYa7cmDvzFx5IvoTshkpNwIEPp6', 1, 'admin@email.com');
-- insert into authorities values ('admin', 'ROLE_ADMIN');
-- insert into authorities values ('admin', 'ROLE_USER');

-- update users set password = '$2a$10$rd0PgVqdvPCoaLXAFvTR1O5bU551wQXMszYiQ05VN5uzU1bUtTbQq' where username = 'admin';-- password:1234
-- update users set enabled = 1 where username = 'user';

-- ********************ENDING DEFAULT TABLES FOR SPRING SECURITY**************************
*/
-- ********************STARTING CUSTOM TABLES FOR SPRING SECURITY**************************
create table myuser(
	uid int primary key auto_increment,
    username varchar(20) not null,
    password varchar(68) not null,
    fname varchar(20) not null,
    lname varchar(20) not null,
    email varchar(30) not null,
    constraint myuser_unique_username unique (username)
);

-- insert into myuser values (null, 'user1', '$2a$10$ED7hbZcLrZ9zjE6pgr8Oc.2iq0VIf6Jge8Y2kAGn8TPUYMycwDCHK', 'Fname', 'Lname', 'personal@mail.com'); -- pass=1234

create table role(
	rid int primary key auto_increment,
    rname varchar(20) not null,
    constraint role_unique_rname unique (rname)
);

insert into role values 
(null, 'ROLE_ADMIN'),
(null, 'ROLE_USER');

create table user_role(
	uid int not null,
    rid int not null,
    constraint user_role_fk_uid foreign key (uid) references myuser(uid),
    constraint user_role_fk_rid foreign key (rid) references role(rid),
    primary key (uid, rid)
);

-- insert into user_role values (1, 1);
-- insert into user_role values (1, 2);

-- ********************ENDING CUSTOM TABLES FOR SPRING SECURITY**************************