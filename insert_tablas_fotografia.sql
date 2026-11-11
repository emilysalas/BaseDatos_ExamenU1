INSERT INTO Cliente (id_cliente, nombre, apellido, email, fecha_registro) VALUES
(1, 'Camila',    'Torres',    'camila.torres@gmail.com',     '2026-01-12'),
(2, 'Andrés',    'Jaramillo', 'andres.jaramillo@hotmail.com','2026-01-25'),
(3, 'Valeria',   'Ordóñez',   'valeria.ordonez@gmail.com',   '2026-02-08'),
(4, 'Sebastián', 'Cueva',     'sebas.cueva@outlook.com',     '2026-02-20'),
(5, 'Daniela',   'Armijos',   'daniela.armijos@gmail.com',   '2026-03-05'),
(6, 'Mateo',     'Salinas',   'mateo.salinas@gmail.com',     '2026-03-18'),
(7, 'Lucía',     'Pardo',     'lucia.pardo@hotmail.com',     '2026-04-02'),
(8, 'Joel',      'Castillo',  'joel.castillo@gmail.com',     '2026-04-15');

INSERT INTO Telefono_Cliente (id_telefono, telefono, id_cliente) VALUES
(1, '0991234567', 1),
(2, '0987654321', 1),
(3, '0998765432', 2),
(4, '0969876543', 3),
(5, '0983456789', 4),
(6, '0992345678', 5),
(7, '0987123456', 6),
(8, '0995551234', 7);


INSERT INTO Fotografo (id_fotografo, nombre, apellido, especialidad, telefono, estado) VALUES
(1, 'Carlos',   'Mendoza',   'Bodas',                 '0991001001', 'Activo'),
(2, 'Paola',    'Ríos',      'Retratos',              '0982002002', 'Activo'),
(3, 'Diego',    'Vivanco',   'Eventos corporativos',  '0973003003', 'Activo'),
(4, 'Gabriela', 'León',      'Moda',                  '0994004004', 'Activo'),
(5, 'Fernando', 'Aguirre',   'Maternidad y familia',  '0985005005', 'Inactivo'),
(6, 'Marcela',  'Ochoa',     'Fotografía infantil',   '0996006006', 'Activo'),
(7, 'Esteban',  'Paladines', 'Productos',             '0977007007', 'De vacaciones'),
(8, 'Rosa',     'Cabrera',   'Eventos sociales',      '0988008008', 'Activo');

INSERT INTO Paquete_Servicio (id_paquete, nombre_paquete, descripcion, precio_base, duracion_horas, tipo_entrega_base, incluye_impresiones, costo_impresion) VALUES
(1, 'Retrato Básico',        'Sesión individual en estudio con 15 fotos editadas',        60.00,   1,  'Digital', FALSE, 0.00),
(2, 'Retrato Premium',       'Sesión de retrato con vestuario y 30 fotos editadas',      120.00,   2,  'Mixto',   TRUE,  25.00),
(3, 'Boda Esencial',         'Cobertura de ceremonia y recepción por 6 horas',           650.00,   6,  'Digital', FALSE, 0.00),
(4, 'Boda Completa',         'Cobertura de 10 horas con álbum físico',                  1200.00,  10,  'Mixto',   TRUE,  80.00),
(5, 'Familia y Maternidad',  'Sesión en exteriores con 25 fotos editadas',               150.00,   2,  'Mixto',   TRUE,  30.00),
(6, 'Evento Corporativo',    'Cobertura de evento empresarial con entrega rápida',       400.00,   4,  'Digital', FALSE, 0.00),
(7, 'Book de Moda',          'Sesión de moda para portafolio con 40 fotos',              300.00,   3,  'Mixto',   TRUE,  40.00),
(8, 'Fotografía de Producto','Sesión de catálogo para tienda con fondo blanco',           200.00,   3,  'Digital', FALSE, 0.00);

INSERT INTO Sesion_Fotografica (id_sesion, fecha, ubicacion, tipo_entrega, recargo_impresion, monto_total, estado_sesion, id_cliente, id_fotografo, id_paquete) VALUES
(1, '2026-02-14', 'Parque Jipiro, Loja',                    'Mixto',   25.00,  145.00, 'Finalizada', 1, 2, 2),
(2, '2026-03-07', 'Quinta Los Cedros, Loja',                'Mixto',   80.00, 1280.00, 'Finalizada', 2, 1, 4),
(3, '2026-03-28', 'Estudio principal, Loja',                'Mixto',   30.00,  180.00, 'Finalizada', 3, 6, 5),
(4, '2026-04-18', 'Cámara de Comercio de Loja',             'Digital',  0.00,  400.00, 'Finalizada', 4, 3, 6),
(5, '2026-05-09', 'Estudio principal, Loja',                'Mixto',   40.00,  340.00, 'Finalizada', 5, 4, 7),
(6, '2026-11-28', 'Jardín Botánico Reinaldo Espinosa, Loja','Digital',  0.00,  650.00, 'Programada', 1, 1, 3),
(7, '2026-12-12', 'Quinta La Laguna, Catamayo',             'Mixto',   80.00, 1280.00, 'Programada', 6, 8, 4),
(8, '2026-10-24', 'Estudio principal, Loja',                'Mixto',   25.00,  145.00, 'En edición', 3, 2, 2);


INSERT INTO Pago (id_pago, monto, fecha_pago, metodo_pago, concepto, id_sesion) VALUES
(1,  145.00, '2026-02-14', 'Efectivo',            'Pago total',  1),
(2,  600.00, '2026-01-20', 'Transferencia',       'Anticipo',    2),
(3,  680.00, '2026-03-07', 'Transferencia',       'Saldo final', 2),
(4,  180.00, '2026-03-28', 'Efectivo',            'Pago total',  3),
(5,  400.00, '2026-04-10', 'Transferencia',       'Pago total',  4),
(6,  170.00, '2026-05-01', 'Tarjeta de crédito',  'Anticipo',    5),
(7,  170.00, '2026-05-09', 'Tarjeta de crédito',  'Saldo final', 5),
(8,   70.00, '2026-10-10', 'Efectivo',            'Anticipo',    8);

INSERT INTO Entrega_Material (id_entrega, formato_entrega, cantidad_fotos_digitales, cantidad_fotos_impresas, detalles_producto_fisico, estado_entrega, fecha_entrega_estimada, fecha_entrega_real, direccion_envio, id_sesion) VALUES
(1, 'Mixto',   15,   5, 'Fotos 15x21 en caja de recuerdo',             'Entregado',      '2026-02-28', '2026-02-27', 'Av. Universitaria y Miguel Riofrío, Loja', 1),
(2, 'Mixto',  450,  40, 'Álbum de boda de 40 páginas en caja de lujo', 'Entregado',      '2026-04-20', '2026-04-22', 'Calle Bolívar y Colón, Loja',              2),
(3, 'Mixto',   25,   6, 'Fotos 20x30 enmarcadas',                      'Entregado',      '2026-04-10', '2026-04-10', 'Retiro en el estudio',                     3),
(4, 'Digital',220,   0, NULL,                                          'Entregado',      '2026-04-22', '2026-04-21', NULL,                                       4),
(5, 'Mixto',   40,   8, 'Fotos 20x30 con portafolio impreso',          'Entregado',      '2026-05-23', '2026-05-24', 'Calle Lourdes y Azuay, Loja',              5),
(6, 'Digital',  0,   0, NULL,                                          'Pendiente',      '2026-12-12', NULL,         NULL,                                       6),
(7, 'Mixto',    0,   0, 'Álbum de 60 páginas y caja de recuerdo',      'Pendiente',      '2027-01-15', NULL,         'Av. Isidro Ayora, Catamayo',               7),
(8, 'Mixto',   30,   5, 'Fotos 15x21 en caja de recuerdo',             'En laboratorio', '2026-11-20', NULL,         'Retiro en el estudio',                     8);

INSERT INTO Factura (id_factura, numero_factura, fecha_emision, valor_total, ruc_cedula_cliente, id_sesion) VALUES
(1, '001-001-000000101', '2026-02-14',  145.00, '1104512345',    1),
(2, '001-001-000000102', '2026-03-07', 1280.00, '1105623456',    2),
(3, '001-001-000000103', '2026-03-28',  180.00, '1106734567',    3),
(4, '001-001-000000104', '2026-04-18',  400.00, '1190012345001', 4),
(5, '001-001-000000105', '2026-05-09',  340.00, '1108956789',    5),
(6, '001-001-000000106', '2026-11-02',  650.00, '1104512345',    6),
(7, '001-001-000000107', '2026-11-05', 1280.00, '1109067890',    7),
(8, '001-001-000000108', '2026-10-10',  145.00, '1106734567',    8);