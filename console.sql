-- 0) create schema
create schema netology_sql2;

-- 1) crate table customers
create table netology_sql2.customers
(
    id int primary key auto_increment,
    name varchar(20) not null,
    surname varchar(20) not null,
    age int check (0 <= age <= 150),
    phone_number varchar(11) not null
);

-- 2) create table 'orders'
create table netology_sql2.orders
(
    id int primary key auto_increment,
    date date not null,
    customer_id int not null,
    product_name varchar(100) not null,
    amount decimal(10,2),
    foreign key (customer_id) references customers (id)
);

-- 3) insert data into table 'customers'
insert into netology_sql2.customers (name, surname, age, phone_number)
values ('alexey', 'orlov', 27, 79059486785);
insert into netology_sql2.customers (name, surname, age, phone_number)
values ('albert', 'dzagoev', 33, 79044567756);
insert into netology_sql2.customers (name, surname, age, phone_number)
values ('Alexey', 'Moiseev', 45, 79199562916);
insert into netology_sql2.customers (name, surname, age, phone_number)
values ('Natalya', 'Ivanova', 24, 79057836618);

-- 4) insert data into table 'orders'
insert into netology_sql2.orders (date, customer_id, product_name, amount)
values (21/01/2022, 1, 'meat', 999.05);
insert into netology_sql2.orders (date, customer_id, product_name, amount)
values (02/02/2022, 2, 'vegetables', 245.90);
insert into netology_sql2.orders (date, customer_id, product_name, amount)
values (05/03/2022, 3, 'juice', 150.00);
insert into netology_sql2.orders (date, customer_id, product_name, amount)
values (04/04/2022, 4, 'cheese', 458.23);

-- 5) sampling
select product_name from netology_sql2.orders o
join netology_sql2.customers c on o.customer_id = c.id
where c.name like '%alexey%';