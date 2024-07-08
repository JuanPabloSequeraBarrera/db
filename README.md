DataBase Garden Juan Pablo Sequera Barrera




## Consultas sobre una tabla

![img](https://lh7-us.googleusercontent.com/docsz/AD_4nXeqeYqq9J0mtLGcKgGhfdSIQ4T56n8LAJGL97BG_2TkftnayDjh0ECWplC1-J9C0JkfBwFbOtc72j5-Cf1Yc_kZUKN6JsziY9UB6h6KoLP9DcoIe6uwP0G_iAI93Yzk4qS0_Zl9qG7T0xcqTrp6SEfJYl2d?key=32v7tnxQKeOvcu4EmduWyg)

1. Devuelve un listado con el código de oficina y la ciudad donde hay oficinas.

   ```sql
   Select  a.codigo_oficina,  a.ciudad FROM  oficina a;
   +----------------+--------+
   | codigo_oficina | ciudad |
   +----------------+--------+
   | OF1            | Cucuta |
   | OF2            | Bga    |
   | OF3            | Madrid |
   +----------------+--------+
   ```

   

2. Devuelve un listado con la ciudad y el teléfono de las oficinas de España.

   ```sql
   a.codigo_oficina,  a.ciudad,  a.pais FROM  oficina a WHERE  a.pais = 'Espana';
   +----------------+--------+--------+
   | codigo_oficina | ciudad | pais   |
   +----------------+--------+--------+
   | OF3            | Madrid | Espana |
   +----------------+--------+--------+
   ```
   
   
   
3. Devuelve un listado con el nombre, apellidos y email de los empleados cuyo
   jefe tiene un código de jefe igual a 7.

   ```sql
   SELECT  m.nombre,  m.apellido1,  m.email 
   FROM  empleado m 
   WHERE m.puesto !=  'Jefe' AND m.codigo_jefe = 7;
   Empty set (0.00 sec)
   ```
   
   
   
4. Devuelve el nombre del puesto, nombre, apellidos y email del jefe de la
   empresa.

   ```sql
    SELECT
       ->  j.nombre,
       ->  j.apellido1,
       ->  j.email,
       ->  j.puesto
       -> FROM
       ->  empleado j
       -> WHERE j.puesto =  'Jefe';
   +---------+-----------+---------------------+--------+
   | nombre  | apellido1 | email               | puesto |
   +---------+-----------+---------------------+--------+
   | Johlver | Pardo     | Johlver@HOTmail.com | Jefe   |
   +---------+-----------+---------------------+--------+
   ```
   
   
   
5. Devuelve un listado con el nombre, apellidos y puesto de aquellos
   empleados que no sean representantes de ventas.

   ```sql
   SELECT  r.nombre,  r.apellido1,  r.puesto 
   FROM  empleado r 
   WHERE r.puesto != 'Rep.ventas' 
   AND r.puesto !='Jefe';
   +--------+-----------+----------+
   | nombre | apellido1 | puesto   |
   +--------+-----------+----------+
   | Jose   | Manuel    | conserje |
   | Juan   | Pablo     | Empleado |
   +--------+-----------+----------+
   ```
   
   
   
6. Devuelve un listado con el nombre de los todos los clientes españoles.

   ```sql
   c.codigo_cliente,  c.nombre_cliente,  c.pais FROM  cliente c WHERE  c.pais = 'Espana';
   Empty set (0.00 sec)
   ```
   
   
   
7. Devuelve un listado con los distintos estados por los que puede pasar un
   pedido.

   ```sql
    SELECT   p.estado  FROM   pedido p;
   +-----------+
   | estado    |
   +-----------+
   | Entregado |
   | Pendiente |
   | Rechazado |
   | Entregado |
   +-----------+
   ```
   
   
   
8. Devuelve un listado con el código de cliente de aquellos clientes que
   realizaron algún pago en 2024.

   ```sql
   SELECT
       ->     codigo_cliente,
       ->     forma_pago,
       ->     id_transaccion,
       ->     fecha_pago
       -> FROM
       ->     pago
       -> WHERE YEAR(fecha_pago) = 2024;
   -------------------------------------
   SELECT
       ->     codigo_cliente,
       ->     forma_pago,
       ->     id_transaccion,
       ->     fecha_pago
       -> FROM
       ->     pago
       -> WHERE DATE_FORMAT(fecha_pago, '%Y') = '2024';
   
   +----------------+---------------+----------------+------------+
   | codigo_cliente | forma_pago    | id_transaccion | fecha_pago |
   +----------------+---------------+----------------+------------+
   |     1045245635 | Transferencia | 12421412       | 2024-04-01 |
   |     1097493251 | Payu          | 453365         | 2024-07-05 |
   +----------------+---------------+----------------+------------+
   ```

   

9. Devuelve un listado con el código de pedido, código de cliente, fecha esperada y fecha de entrega de los pedidos que no han sido entregados a tiempo.

   ```sql
   SELECT
       codigo_pedido, 
       fecha_pedido,
       estado
   FROM
   	pedido
   WHERE estado = 'Pendiente';
   
   +---------------+--------------+-----------+
   | codigo_pedido | fecha_pedido | estado    |
   +---------------+--------------+-----------+
   |             2 | 2024-07-02   | Pendiente |
   +---------------+--------------+-----------+
   ```

   

10. Devuelve un listado con el código de pedido, código de cliente, fecha esperada y fecha de entrega de los pedidos cuya fecha de entrega ha sido al menos dos días antes de la fecha esperada.

   ```sql
   SELECT     codigo_pedido,     codigo_cliente,     fecha_esperada,     fecha_entrega,     estado 
   FROM     pedido 
   WHERE     DATEDIFF(fecha_esperada, fecha_entrega) >= 2;
   ----------------------------------------------------
   SELECT
       codigo_pedido,
       codigo_cliente,
       fecha_esperada,
       fecha_entrega
   FROM
       pedido
   WHERE
       fecha_entrega <= ADDDATE(fecha_esperada, INTERVAL -2 DAY);
   
   +---------------+----------------+----------------+---------------+-----------+
   | codigo_pedido | codigo_cliente | fecha_esperada | fecha_entrega | estado    |
   +---------------+----------------+----------------+---------------+-----------+
   |             4 |     1097493251 | 2012-01-10     | 2012-01-05    | Entregado |
   +---------------+----------------+----------------+---------------+-----------+
   ```




11. Devuelve un listado de todos los pedidos que fueron rechazados en 2024.

    ```sql
    SELECT  codigo_pedido,  fecha_pedido,  estado,  codigo_cliente FROM  pedido WHERE estado = 'Rechazado' AND DATE_FORMAT(fecha_pedido, '%Y') = '2024';
    +---------------+--------------+-----------+----------------+
    | codigo_pedido | fecha_pedido | estado    | codigo_cliente |
    +---------------+--------------+-----------+----------------+
    |             3 | 2024-03-15   | Rechazado |     1097493251 |
    +---------------+--------------+-----------+----------------+
    ```
    
    
    
12. Devuelve un listado de todos los pedidos que han sido entregados en el
    mes de enero de cualquier año.

    ```sql
    > SELECT
        ->     codigo_pedido,
        ->     codigo_cliente,
        ->     fecha_entrega,
        ->     estado
        -> FROM
        ->     pedido
        -> WHERE
        ->     DATE_FORMAT(fecha_entrega, '%m') = '01';
    +---------------+----------------+---------------+-----------+
    | codigo_pedido | codigo_cliente | fecha_entrega | estado    |
    +---------------+----------------+---------------+-----------+
    |             4 |     1097493251 | 2012-01-05    | Entregado |
    +---------------+----------------+---------------+-----------+
    ```
    
    



13. Devuelve un listado con todos los pagos que se realizaron en el
    año 2008 mediante Payua. Ordene el resultado de mayor a menor.
    
    ```sql
    SELECT     codigo_cliente,     forma_pago,     id_transaccion,     fecha_pago,     total 
    FROM     pago 
    WHERE  YEAR(fecha_pago) = 2024 
    AND forma_pago = 'Payu' 
    ORDER BY     total DESC;
    +----------------+------------+----------------+------------+---------+
    | codigo_cliente | forma_pago | id_transaccion | fecha_pago | total   |
    +----------------+------------+----------------+------------+---------+
    |     1097493251 | Payu       | 453365         | 2024-07-05 | 2000.00 |
    +----------------+------------+----------------+------------+---------+
    ```



14. Devuelve un listado con todas las formas de pago que aparecen en la
    tabla pago. Tenga en cuenta que no deben aparecer formas de pago
    repetidas.
    
    
    
    ```sql
     SELECT DISTINCT
        ->     forma_pago
        -> FROM
        ->     pago;
    +---------------+
    | forma_pago    |
    +---------------+
    | Transferencia |
    | Payu          |
    +---------------+
    
    ```



15. Devuelve un listado con todos los productos que pertenecen a la
    gama Ornamentales y que tienen más de 100 unidades en stock. El listado
    deberá estar ordenado por su precio de venta, mostrando en primer lugar
    los de mayor precio.
    
    ```sql
    SELECT
        ->  codigo_producto,
        ->  nombre_producto,
        ->     gama,
        ->     precio_venta
        -> FROM
        ->          producto
        -> WHERE
        ->  gama = 'Ornamentales' AND cantidad_en_stock > 100
        -> ORDER BY
        ->  precio_venta DESC;
    +-----------------+-----------------+--------------+--------------+
    | codigo_producto | nombre_producto | gama         | precio_venta |
    +-----------------+-----------------+--------------+--------------+
    | P1              | Mesa de jardín  | Ornamentales |       100.00 |
    +-----------------+-----------------+--------------+--------------+
    ```



16. Devuelve un listado con todos los clientes que sean de la ciudad de Madrid y
    cuyo representante de ventas tenga el código de empleado 11 o 30.
    
    ```sql
     SELECT  codigo_cliente,  nombre_cliente,  ciudad,  pais,  codigo_empleado_rep_ventas 
     FROM  cliente 
     WHERE ciudad = 'Madrid' 
     AND codigo_empleado_rep_ventas = 11;
    Empty set (0.00 sec)
    ```





## Consulta multitabla

1. *Obtén un listado con el nombre de cada cliente y el nombre y apellido de su*
    *representante de ventas.*

  ```mysql
   SELECT
      ->     cliente.nombre_cliente,
      ->     empleado.nombre AS nombre_representante,
      ->     empleado.apellido1 AS apellido_representante
      -> FROM
      ->     cliente
      -> JOIN
      ->     empleado ON cliente.codigo_empleado_rep_ventas = empleado.codigo_empleado;
  +----------------+----------------------+------------------------+
  | nombre_cliente | nombre_representante | apellido_representante |
  +----------------+----------------------+------------------------+
  | Goku           | Juan                 | Pablo                  |
  | Rick           | Juan                 | Pablo                  |
  +----------------+----------------------+------------------------+
  
  ```

2. *Muestra el nombre de los clientes que hayan realizado pagos junto con el*
    *nombre de sus representantes de ventas.*

  ```MYsql
  SELECT
      -> c.nombre_cliente,
      -> e.nombre AS nombre_representante,
      -> e.apellido1 AS apellido_representante,
      -> p.fecha_pago,
      -> p.id_transaccion
      -> FROM
      -> cliente c
      -> JOIN
      -> pago p ON p.codigo_cliente=c.codigo_cliente
      -> JOIN
      -> empleado e ON e.codigo_empleado=c.codigo_empleado_rep_ventas
      -> WHERE
      -> p.forma_pago != 'No registrada'
      -> ;
  +----------------+----------------------+------------------------+------------+----------------+
  | nombre_cliente | nombre_representante | apellido_representante | fecha_pago | id_transaccion |
  +----------------+----------------------+------------------------+------------+----------------+
  | Goku           | Juan                 | Pablo                  | 2024-04-01 | 12421412       |
  | Rick           | Juan                 | Pablo                  | 2024-07-05 | 453365         |
  +----------------+----------------------+------------------------+------------+----------------+
  ```

3. *Muestra el nombre de los clientes que no hayan realizado pagos junto con*
    *el nombre de sus representantes de ventas.* 

  ```mysql
  SELECT
      ->     cliente.nombre_cliente,
      ->     empleado.nombre AS nombre_representante,
      ->     empleado.apellido1 AS apellido_representante
      -> FROM
      ->     cliente
      -> JOIN
      ->     empleado ON cliente.codigo_empleado_rep_ventas = empleado.codigo_empleado
      -> LEFT JOIN
      ->     pago ON cliente.codigo_cliente = pago.codigo_cliente
      -> WHERE
      ->     pago.codigo_cliente IS NULL;
  Empty set (0.00 sec)
  
  ```

4. *Devuelve el nombre de los clientes que han hecho pagos y el nombre de sus*
    *representantes junto con la ciudad de la oficina a la que pertenece elrepresentante.*

  ```mysql
   SELECT     
   cliente.nombre_cliente,     
   empleado.nombre AS nombre_representante,     
   empleado.apellido1 AS apellido_representante,     
   oficina.ciudad 
  FROM     cliente 
  JOIN     empleado ON cliente.codigo_empleado_rep_ventas = empleado.codigo_empleado 
  JOIN     oficina ON empleado.codigo_oficina = oficina.codigo_oficina 
  JOIN     pago ON cliente.codigo_cliente = pago.codigo_cliente;
  +----------------+----------------------+------------------------+--------+
  | nombre_cliente | nombre_representante | apellido_representante | ciudad |
  +----------------+----------------------+------------------------+--------+
  | Goku           | Juan                 | Pablo                  | Cucuta |
  | Rick           | Juan                 | Pablo                  | Cucuta |
  +----------------+----------------------+------------------------+--------+
  
  ```

  

5. *Devuelve el nombre de los clientes que no hayan hecho pagos y el nombre*
    *de sus representantes junto con la ciudad de la oficina a la que pertenece el*
    *representante.*



  ```mysql
   SELECT
      ->     cliente.nombre_cliente,
      ->     empleado.nombre AS nombre_representante,
      ->     empleado.apellido1 AS apellido_representante,
      ->     oficina.ciudad
      -> FROM
      ->     cliente
      -> JOIN
      ->     empleado ON cliente.codigo_empleado_rep_ventas = empleado.codigo_empleado
      -> JOIN
      ->     oficina ON empleado.codigo_oficina = oficina.codigo_oficina
      -> LEFT JOIN
      ->     pago ON cliente.codigo_cliente = pago.codigo_cliente
      -> WHERE
      ->     pago.codigo_cliente IS NULL;
  
  
  ```

6. *Lista la dirección de las oficinas que tengan clientes en Fuenlabrada.*



  ```mysql
  SELECT 
  e.nombre_cliente,
  e.ciudad,
  o.codigo_oficina,
  o.codigo_postal AS codigo_postal_oficina,
  o.linea_direccion1,
  o.linea_direccion2
  FROM
  cliente e
  JOIN
  empleado e ON c.codigo_empleado_rep_ventas=e.codigo_empleado
  JOIN
  oficina o ON e.codigo_oficina=o.codigo_oficina
  WHERE
  e.ciudad='Fuenlabrada';
  
  ```

7.  Devuelve el nombre de los clientes y el nombre de sus representantes junto con la ciudad de la oficina a la que pertenece el representante

```
 SELECT
    -> c.nombre_cliente,
    -> e.nombre AS nombre_representante,
    -> o.ciudad AS ciudad_oficina
    -> FROM
    -> cliente c
    -> JOIN
    -> empleado e ON c.codigo_empleado_rep_ventas=e.codigo_empleado
    -> JOIN
    -> oficina o ON e.codigo_oficina=o.codigo_oficina;
+----------------+----------------------+----------------+
| nombre_cliente | nombre_representante | ciudad_oficina |
+----------------+----------------------+----------------+
| Goku           | Juan                 | Cucuta         |
| Rick           | Juan                 | Cucuta         |
+----------------+----------------------+----------------+
```



8.  Devuelve un listado con el nombre de los empleados junto con el nombre
   de sus jefes.

   ```
    e.nombre AS nombre_empleado,     e.apellido1 AS apellido1_empleado,     e.apellido2 AS apellido2_empleado,     j.nombre AS nombre_jefe,     j.apellido1 AS apellido1_jefe,     j.apellido2 AS apellido2_jefe FROM     empleado e LEFT JOIN     empleado j ON e.codigo_jefe = j.codigo_empleado;
   +-----------------+--------------------+--------------------+-------------+----------------+----------------+
   | nombre_empleado | apellido1_empleado | apellido2_empleado | nombre_jefe | apellido1_jefe | apellido2_jefe |
   +-----------------+--------------------+--------------------+-------------+----------------+----------------+
   | Johlver         | Pardo              | Garcia             | NULL        | NULL           | NULL           |
   | Jose            | Manuel             | Pardo              | NULL        | NULL           | NULL           |
   | Juan            | Pablo              | Sequera            | NULL        | NULL           | NULL           |
   +-----------------+--------------------+--------------------+-------------+----------------+----------------+	
   
   
   ```

   9. **Devuelve un listado que muestre el nombre de cada empleados, el nombre* *de su jefe y el nombre del jefe de sus jefe.*.*

   

     ```mysql
   INSERT INTO empleado (codigo_empleado, nombre, apellido1, apellido2, extension, email, codigo_oficina, codigo_jefe, puesto) VALUES
   (67, 'josep', 'jerez', 'perez', '098, 'jerez@gmail.com', 'OF1', 11, 'Empleado');
   
   SELECT
   e.nombre AS Empleado,
   a.nombre AS Jefe_menor,
   b.nombre AS Jefe_mayor
   FROM
   empleado e
   JOIN 
   empleado a ON a.codigo_empleado=e.codigo_jefe
   JOIN 
   empleado b ON b.codigo_empleado=a.codigo_jefe
   WHERE 
   e.codigo_empleado!=e.codigo_jefe
     ```




10. *Devuelve el nombre de los clientes a los que no se les ha entregado a* *tiempo un pedido.*

10. ```
    SELECT
        -> c.nombre_cliente,
        -> p.codigo_pedido
        -> FROM
        -> pedido p
        -> JOIN
        -> cliente c ON p.codigo_cliente=c.codigo_cliente
        -> WHERE
        -> p.estado != 'Entregado';
    +----------------+---------------+
    | nombre_cliente | codigo_pedido |
    +----------------+---------------+
    | Goku           |             2 |
    | Rick           |             3 |
    +----------------+---------------+
    ```

11. *Devuelve un listado de las diferentes gamas de producto que ha comprado* *cada cliente.*

    ```
    SELECT
        -> c.nombre_cliente,
        -> g.gama,
        -> g.descripcion_texto AS descripcion
        -> FROM
        -> cliente c
        -> JOIN
        -> pedido p ON c.codigo_cliente=p.codigo_cliente
        -> JOIN
        -> detalle_pedido d ON p.codigo_pedido=d.codigo_pedido
        -> JOIN
        -> producto pr ON d.codigo_producto=pr.codigo_producto
        -> JOIN
        -> gama_producto g ON pr.gama=g.gama
        -> ;
    +----------------+--------------+--------------------+
    | nombre_cliente | gama         | descripcion        |
    +----------------+--------------+--------------------+
    | Goku           | Indoor       | Productos interior |
    | Rick           | Ornamentales | Productos exterior |
    +----------------+--------------+--------------------+
    ```

    
