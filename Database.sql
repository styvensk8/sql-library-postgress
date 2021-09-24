/* libreria Estambul

Inventario 

Book:
ISBN
Title
Author
Lenguage
Edition
Stock
condition
Precio


Categoria:
Nombre

*/

Create schema inventario;

create table inventario.Book(
    isbn int8 not null,
    title varchar(100) not null,
    author Varchar(100) not null,
    lenguage varchar(50) not null,
    edition varchar(100) not null,
    stock int2 not null,
    state varchar(20) not null,
    price money not null,
	category varchar(50) not null,
    constraint pk_inventario primary key (isbn)
);
comment on column inventario.Book.isbn is 'Codigo de barras o referencia del producto';
comment on column inventario.Book.title is 'Titulo del libro';
comment on column inventario.Book.author is 'Autor(s) del libro';
comment on column inventario.Book.lenguage is 'Idioma del libro';
comment on column inventario.Book.edition is 'Editorial del libro';
comment on column inventario.Book.stock is 'Cantidad de unidades disponibles que hay del producto';
comment on column inventario.Book.state is 'Estado o condicion del libro que puede ser usado o nuevo';
comment on column inventario.Book.price is 'Precio del libro';
comment on column inventario.Book.category is 'Llave foranea de la tabla Categoria';

create table inventario.category(
    category varchar (50) not null,
    constraint pk_category primary key (category)
);
comment on column inventario.category.category is 'Categoria del libro Ejemplo: Terror, Historia, ect...';
alter table inventario.Book add constraint fk_book_category foreign key (category) references inventario.category (category);
