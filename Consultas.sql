/*Consulta de tablas*/
select * from inventario.category order by category;
select * from inventario.book order by title;
select * from inventario.book where author like '%A';
select * from inventario.book where title like '%Estambul%';
select * from inventario.book where title like '%Egipto%' and lenguage in ('Ingles');

/*consultas con orden*/
select title, state, edition, price from inventario.book order by price;

/*consultas sin Autor repetido*/
select distinct author from inventario.book order by author;

/*consulta de seleccion de categoria*/ 
select title, author, stock, category, price from inventario.book where category='Ficción' order by title;
select title, author, category from inventario.book where category='Historia';

/*consulta de precio*/
select title, author, stock, price from inventario.book where price<='$ 40.000,00' order by price;

/*Consula de cantidades*/
select Title, author, price from inventario.book where stock > 2;

/*Consulta de totales*/ 
select category, sum(stock) as Unidades_por_Categoria from inventario.book group by category;
select title, sum(stock * price) as Total_precio_por_stock from inventario.book group by title order by title;
select count(stock) as total_titulos from inventario.book;
select sum(stock) as total_unidades from inventario.book;
select  sum(stock * price) as precio_total from inventario.book;

/*consulta de caso*/
select title, author, 
    case 
        when stock >= 1 then 'Disponible'
        else 'sin Unidades'
    end as stock, price  
from inventario.book; 

/*sub consulta*/
select * from inventario.book where price < all (select price from inventario.book where category='Historia');
select * from inventario.book where price < (select max(book.price) from inventario.book) and Category like 'Ficción';

/*Consulta de creación y actualizacion*/
update inventario.book set price='$ 49.000,00' where title='Buda blues';
select title, price from inventario.book where title='Buda blues';

select * into inventario.book_Arquitectura from inventario.book where category='Arquiectura';
select Title, state, price into inventario.Precio_book from inventario.book;
select * from inventario.Precio_book;

select * into inventario.book_saldo from inventario.Book where stock >= 3;
update inventario.book_saldo set stock=stock-1 where stock >= 3; 
select * from inventario.book_saldo order by title;
