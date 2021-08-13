create database if not exists social;

use social;

drop table if exists comments;
drop table if exists posts;
drop table if exists users;

create table users (
	user_id int(11) not null auto_increment,
	username varchar(25) not null,
	password varchar(25) not null,
	email varchar(35) not null,
	primary key (user_id)
);

create table posts (
	post_id int(11) not null auto_increment,
	user_id int(11) not null,
	post_time datetime default current_timestamp,
	post_content varchar(140) not null,
	primary key (post_id),
	foreign key (user_id) references users(user_id)
);

create table comments (
	comm_id int(11) not null auto_increment,
	user_id int(11) not null,
	post_id int(11) not null,
	comm_time datetime default current_timestamp,
	comm_content varchar(140) not null,
	primary key (comm_id),
	foreign key (user_id) references users(user_id),
	foreign key (post_id) references posts(post_id)
);