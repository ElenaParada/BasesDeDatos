/* b) Explorar la tabla “menu_items” para conocer los productos del menú.
 1.- Realizar consultas para contestar las siguientes preguntas:*/
select * from menu_items;

-- ● Encontrar el número de artículos en el menú.
select count (*) as recuento
from menu_items;

-- ● ¿Cuál es el artículo menos caro y el más caro en el menú?
select * from menu_items
order by price desc;

select * from menu_items 
where price <6 or price >19;

-- ● ¿Cuántos platos americanos hay en el menú?
select count (category) as platos_americanos
from menu_items
where category = 'American';

-- ● ¿Cuál es el precio promedio de los platos?
select round (avg (price), 2) as precio_promedio
from menu_items;


/*c) Explorar la tabla “order_details” para conocer los datos que han sido recolectados.
 1.- Realizar consultas para contestar las siguientes preguntas:*/
select * from order_details;
 
-- ● ¿Cuántos pedidos únicos se realizaron en total?
select count (distinct order_id) as total_pedidos
from order_details;

-- ● ¿Cuáles son los 5 pedidos que tuvieron el mayor número de artículos?
select order_details_id, item_id as numero_articulos 
from order_details
where item_id is not null
order by item_id desc
limit 5;

--● ¿Cuándo se realizó el primer pedido y el último pedido?
select * from order_details
order by order_date desc;

select order_date as fecha
from order_details
group by order_date 
order by order_date desc;

--● ¿Cuántos pedidos se hicieron entre el '2023-01-01' y el '2023-01-05'?
select count (order_details_id) as recuento, order_date as fecha  
from order_details 
where order_date between '2023-01-01' and '2023-01-05'
group by order_date;
