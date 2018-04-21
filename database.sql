create table clients (
  name varchar(255),
  surname varchar(255),
  contact_id int
);

create table cities (
  city_id int auto_increment primary key,
  name varchar(255)
);

create table locations (
  location_id int auto_increment primary key,
  city_id int,
  name varchar(255),
  partial_address varchar(255)
);

create table buildings (
  building_id int auto_increment primary key,
  location_id int,
  number varchar(255),
  name varchar(255),
  investment_id int
);

create table apartments (
  apartment_id int auto_increment primary key,
  building_id int,
  number varchar(255)
);

create table apartment_assets (
  apartment_id int,
  asset_key int,
  asset_value int
);

create table apartment_asset_keys (
  asset_key int auto_increment primary key,
  asset_key_name varchar(255)
);

create table apartment_asset_values (
  asset_value int auto_increment primary key,
  asset_value_name varchar(255)
);

create table asset_areas (
  apartment_id int,
  asset_key int,
  asset_value int,
  area decimal(10, 1)
);

create table developers (
  developer_id int auto_increment primary key,
  name varchar(255)
);

create table investments (
  investment_id int auto_increment primary key,
  developer_id int,
  name varchar(255)
);



insert into developers values
  (1, 'Oszuści S.A'),
  (2, 'Naciągacz sp z.o.o');
  
insert into investments values
  (1, 1, 'Zielona Dolina'),
  (2, 2, 'Miejskie Blokowisko'),
  (3, 2, 'Nowobogackie Wzgórza');

insert into cities values
  (1, 'Kraków'),
  (2, 'Wieliczka');

insert into locations values
  (1, 1, 'Krótka', 'Kraków, ul. Krótka'),
  (2, 2, 'Przekątna', 'Wieliczka, ul. Przekątna');

insert into buildings values 
  (1, 1, '7c', 'Szklany Dom', 1),
  (2, 1, '7a', 'Bursztynowy Dom', 1),
  (3, 2, '11', 'Jedenastka', 2),
  (4, 2, '16', 'Cokolwiek', 3);

insert into apartments values
  (1, 1, '8'),
  (2, 2, '11'),
  (3, 2, '15'),
  (4, 3, '8'),
  (5, 4, '13'),
  (6, 3, '123');

insert into apartment_asset_keys values
  (1, 'balkony_type'),
  (2, 'additional rooms'); 
  
insert into apartment_asset_values values
  (1, 'balkon'),
  (2, 'loggia'),
  (3, 'taras'),
  (4, 'pomieszczenie gospodarcze'),
  (5, 'garaż'),
  (6, 'miejsce parkingowe');

insert into apartment_assets values
  (1, 1, 2),
  (2, 1, 1),
  (3, 1, 1),
  (3, 1, 3),
  (4, 1, 2),
  (5, 1, 2),
  (5, 1, 1),
  (6, 1, 1),
  (1, 2, 4),
  (2, 2, 4),
  (2, 2, 6),
  (3, 2, 4),
  (3, 2, 5),
  (4, 2, 5),
  (5, 2, 5),
  (6, 2, 6);

insert into asset_areas values
(1, null, null, 60),
(1, 1, 2, 5),
(2, null, null, 49),
(2, 1, 1, 4),
(3, null, null, 47),
(3, 1, 1, 4),
(3,	1, 3, 9),
(4, null, null, 42),
(4,	1, 2, 5),
(5, null, null, 29),
(5,	1, 2, 5),
(5,	1, 1, 4),
(6, null, null, 69),
(6, 1, 1, 4),
(1,	2, 4, 2),
(2,	2, 4, 2),
(2,	2, 6, 3.5),
(3,	2, 4, 2),
(3,	2, 5, 10),
(4, 2, 5, 10),
(5,	2, 5, 12),
(6, 2, 6, 5.5);


insert into clients values
  ('Jan', 'Kowalski', null),
  ('Dorota', 'Małek', null);
