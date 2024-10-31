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

select order_id, count (item_id)
from order_details
group by order_id
	having count (item_id) != 0
order by count (item_id) desc
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


/*d) Usar ambas tablas para conocer la reacción de los clientes respecto al menú.*/
-- 1.- Realizar un left join entre entre order_details y menu_items con el identificador
-- item_id(tabla order_details) y menu_item_id(tabla menu_items).
select *
from order_details as o
left join menu_items as m
on o.item_id = m.menu_item_id;


/*e) Una vez que hayas explorado los datos en las tablas correspondientes y respondido las
 preguntas planteadas, realiza un análisis adicional utilizando este join entre las tablas. El
 objetivo es identificar 5 puntos clave que puedan ser de utilidad para los dueños del
 restaurante en el lanzamiento de su nuevo menú. Para ello, crea tus propias consultas y
 utiliza los resultados obtenidos para llegar a estas conclusiones.*/

-- ¿Cuáles fueron los platillos más pedidos del menú?
select count (o.order_id), m.item_name
from order_details as o
left join menu_items as m
on o.item_id = m.menu_item_id
group by m.item_name
order by count (o.order_id) desc
limit 3;
