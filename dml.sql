INSERT INTO gama_producto (gama, descripcion_texto, descripcion_html, imagen) VALUES
('Ornamentales', 'Productos exterior', 'Productos exterior', 'Ornamentales.jpg'),
('Indoor', 'Productos interior', 'Productos interior', 'indoor.jpg');

INSERT INTO producto (codigo_producto, nombre_producto, gama, dimensiones, proveedor, descripcion, cantidad_en_stock, precio_venta, precio_proveedor) VALUES
('P1', 'Mesa de jardín', 'Ornamentales', '200m', 'Proveedor A', 'Mesa de madera', 500, 100.00, 15000.00),
('P2', 'Sofá de sala', 'Indoor', '220m', 'Proveedor B', 'Sofa de cuero', 30, 400.00, 40000.00);

INSERT INTO oficina (codigo_oficina, ciudad, pais, region, codigo_postal, telefono, linea_direccion1, linea_direccion2) VALUES
('OF1', 'Cucuta', 'Colombia', 'Norte de Santander', '68004', '623445634', 'Calle 25-52', 'Apto 402'),
('OF2', 'Bga', 'Colombia', 'Santander', '00100', '152324356', 'Calle 47-54', 'Casa 9'),
('OF3', 'Madrid', 'Espana', 'Espana', '00002', '561142325', 'Calle 11-25', 'Casa 10');

INSERT INTO empleado (codigo_empleado, nombre, apellido1, apellido2, extension, email, codigo_oficina, codigo_jefe, puesto) VALUES
(1002, 'Juan', 'Pablo', 'Sequera', '089', 'j.sequerab@uniandes.edu.co', 'OF1', NULL, 'Empleado'),
(112, 'Jose', 'Manuel', 'Pardo', '076', 'pardi@hotmail.com', 'OF2', NULL, 'conserje'),
(74, 'Johlver', 'Pardo', 'Garcia', '074', 'Johlver@HOTmail.com', 'OF3', NULL, 'Jefe');

INSERT INTO cliente (codigo_cliente, nombre_cliente, nombre_contacto, apellido_contacto, telefono, fax, linea_direccion1, linea_direccion2, ciudad, region, pais, codigo_postal, codigo_empleado_rep_ventas, limite_credito) VALUES
(1097493251, 'Rick', 'Monster', 'rock', '15324544', '514535674', 'Calle 12', 'Casa 22', 'Bga', 'Santander', 'Colombia', '00100', 1002, 2000000.00),
(1045245635, 'Goku', 'gohan', 'papo', '323253125', '434563462', 'Calle 46', 'Casa 32', 'Bog', 'Cundinamarca', 'Colombia', '00002', 1002, 3000000.00);

INSERT INTO pedido (codigo_pedido, fecha_pedido, fecha_esperada, fecha_entrega, estado, comentarios, codigo_cliente) VALUES
(1, '2024-07-05', '2024-07-12', '2024-07-14', 'Entregado', 'Entrega rápida', 1097493251),
(2, '2024-04-01', '2024-07-12', NULL, 'Pendiente', NULL, 1045245635),
(3, '2024-03-15', '2024-03-18', NULL, 'Rechazado', NULL, 1097493251),
(4, '2024-01-12', '2012-01-10', '2012-01-05', 'Entregado', 'Entrega rápida', 1097493251);

INSERT INTO detalle_pedido (codigo_pedido, codigo_producto, cantidad, precio_unidad, numero_linea) VALUES
(1, 'P1', 2, 100.00, 1),
(2, 'P2', 4, 400.00, 1);

INSERT INTO pago (codigo_cliente, forma_pago, id_transaccion, fecha_pago, total) VALUES
(1097493251, 'Payu', '453365', '2024-07-05', 2000.00),
(1045245635, 'Transferencia', '12421412', '2024-04-01', 1600.00);
