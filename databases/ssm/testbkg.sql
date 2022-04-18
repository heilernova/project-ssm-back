SET FOREIGN_KEY_CHECKS = 0; -- Deshabilitamos las llaves foraneas
INSERT INTO `tb_eps` (`id`, `name`, `disable`) VALUES
(1, 'NUEVA EPS', b'0'),
(2, 'SIN AFILIACIÓN', b'0');

INSERT INTO `tb_ips` (`id`, `name`, `disable`) VALUES
(1, 'ESE I NIVEL', b'0'),
(2, 'HOSPITAL SAN JOSÉ DEL GUAVIARE', b'0'),
(3, 'ODONTOMEDIC IPS', b'0'),
(4, 'NUEVA SALUD INTEGRAL IPS', b'0'),
(5, 'CENTRO MEDICO GUAVIARE', b'0'),
(6, 'IPS SESMAS', b'0'),
(7, 'ANGIAGRAFIAS DE COLOMBIA', b'0'),
(8, 'MI IPS LLANOS', b'0'),
(9, 'VISIÓN ORAL DIGITAL', b'0'),
(10, 'GAMMAS IPS', b'0');

INSERT INTO `tb_persons` (`dni`, `dniType`, `date`, `name`, `lastName`, `cellphone`, `email`, `sex`, `birthDate`, `address`, `eps`, `sisben`, `regime`, `population`) VALUES
('1002387726', 'CC', '2022-03-25 15:13:38', 'Nicolás', 'Salamanca', '3205310725', NULL, '', '1994-12-24', 'Vereda El Limón', 1, b'1', b'1', 'R'),
('1002582109', 'CC', '2022-03-25 15:25:44', 'Julieth fernanda', 'Parra', '3138212495', NULL, '', '1987-02-15', 'Vereda la Leona', 1, b'1', b'1', 'R'),
('1002988117', 'CC', '2022-04-09 17:21:11', 'saray camila', 'leon albornoz', '3113671902', 'albornozsaraycamila@gmail.com', 'F', '2020-05-29', 'calle 8  28b 30 Barrio Portal de Belen', NULL, b'1', b'0', 'U'),
('1003710166', 'CC', '2022-04-09 17:31:07', 'ingrith Johana', 'vargas chila', '3118583236', NULL, 'F', '2000-01-05', 'Vereda tomachipan', NULL, b'1', b'1', 'R'),
('1006783343', 'CC', '2022-03-25 13:12:21', 'jency dayanna', 'pinto vergara', '3128217296', 'dayanapinto22@gmail.com', '', '2000-04-22', 'Calle 19 #19-36, Barrio modelo', 1, b'1', b'1', 'U'),
('1007244088', 'CC', '2022-03-25 04:01:11', 'Johan heiler', 'Nova cardenas', '3209716145', NULL, 'M', NULL, 'Calle 9 # 19 - 52', 1, b'1', b'1', 'U'),
('1023906050', 'CC', '2022-04-04 22:14:48', 'Marlon Stevens', 'Riveros Quimbay', '3128214569', NULL, 'F', '1991-03-17', 'Barrio Modelo', NULL, b'1', b'0', 'U'),
('1028860558', 'TI', '2022-04-05 13:47:47', 'Sharon Valeria', 'patiño Soto', '3123038786', NULL, 'F', '2005-08-08', 'Calle 22 #19 B 75 Barrio la Granja', NULL, b'1', b'0', 'U'),
('1029800215', 'TI', '2022-04-08 17:26:53', 'rafael', 'toquica Reyes', '3156193873', NULL, 'M', '2009-06-10', 'vereda Puerto Tolima', NULL, b'1', b'0', 'R'),
('1032407223', 'CC', '2022-03-25 15:49:30', 'Cristian Camilo ', 'Acevedo Vargas', '111', NULL, '', NULL, 'Q', 1, b'1', b'1', 'U'),
('1064789853', 'TI', '2022-04-05 19:33:49', 'ligia orangy', 'opina Simanca', '3128606822', NULL, 'F', '2006-08-18', 'Vereda santa rosa', NULL, b'1', b'0', 'R'),
('1110487608', 'CC', '2022-03-25 14:59:52', 'Diana Marcela', 'Peña', '3184129115', NULL, '', '1989-08-15', 'Calle 25 #28-a San Jorge', 1, b'1', b'1', 'U'),
('1116436731', 'TI', '2022-04-04 21:09:22', 'maryori', 'galvis arcil', '3209985107', NULL, 'F', '2007-03-10', 'Bicentenario I MZ H c. # 3', NULL, b'1', b'0', 'U'),
('1120560397', 'CC', '2022-03-25 13:56:58', 'Nubia ', 'Ladino', '3224510724', NULL, '', '1986-01-17', 'CRA 23 # 20-19', 1, b'1', b'1', 'U'),
('1120560764', 'CC', '2022-04-02 16:31:15', 'Rubiela', 'Simón amado', '3107634171', NULL, 'F', '1986-08-27', 'Barrio 20 de Julio avenida colonizadores', NULL, b'1', b'1', 'U'),
('1120561599', 'CC', '2022-04-06 21:24:01', 'fabian antonio', 'vargas pinzon', '3229121716', NULL, 'M', '1986-12-28', 'Barrio Araza', NULL, b'1', b'0', 'U'),
('1120563116', 'TI', '2022-04-09 17:43:27', 'carlos alberto ', 'bohorquez veloza', '3219476141', 'paolabohor068@gmail.com', 'M', '2006-03-08', 'calle 18 N 29-150', NULL, b'1', b'0', 'U'),
('1120564048', 'CC', '2022-04-02 16:23:29', 'Jhon Jairo', 'Cristancho Rodríguez', '3177283314', NULL, 'M', '1987-10-02', 'Barrio la Paz MZ I casa 232', NULL, b'1', b'1', 'U'),
('1120570617', 'CC', '2022-04-01 13:55:48', 'Fernando', 'Bautista', '3175623907', 'ktmfer650@hotmail.com', 'M', '1990-11-02', 'Calle 18# 24-47', NULL, b'1', b'1', 'U'),
('1120581400', 'CC', '2022-03-25 14:35:11', 'Claudia Jhoana', 'Sánchez Hernández', '3107932247', NULL, '', '1987-11-16', 'CRA 30 # 21-a 15', 1, b'1', b'1', 'U'),
('1121864121', 'CC', '2022-04-04 14:28:01', 'lUZ AMANDA ', 'VILLAMIL GUILGUERO', '3232822694', NULL, 'F', '1988-12-24', 'Vereda Caño Negro', NULL, b'1', b'0', 'R'),
('1121870861', 'CC', '2022-04-06 17:00:53', 'NICHEL ALEXIS ', 'JAVELA MEJIA', '3112414173', NULL, 'M', '1990-07-18', 'barrio la Paz', NULL, b'1', b'0', 'U'),
('1121925616', 'CC', '2022-04-05 19:12:26', 'johan alexis', 'fernandez', '3104150192', NULL, 'M', NULL, '', NULL, NULL, b'0', NULL),
('1122919196', 'CC', '2022-03-29 20:46:12', 'ilber stiven', 'daza moya', '3138870136', NULL, 'M', '2003-12-15', 'MZ G casa 4, B Prados de San Sebastián', NULL, b'1', b'1', 'U'),
('1123564455', 'CC', '2022-04-04 17:01:00', 'Yerly Sulandy', 'Moreno Castaño', '3138558894', 'yerlysulandymoreno@gmail.com', 'F', '1991-08-19', 'Barrio 20 de Julio', NULL, b'1', b'0', 'U'),
('11355030', 'CC', '2022-04-06 14:50:19', 'jorge Eliecer', 'Ruiz Medina', '3173741878', NULL, 'M', '1945-12-25', 'CRA 19 # 10-39 Barrio Porvenir', NULL, b'1', b'0', 'U'),
('17110249', 'CC', '2022-04-04 14:33:23', 'gUILLERMO', 'SILVA DOCTOR', '3134012533', NULL, 'M', '1944-01-01', 'CRA 26 Barrio Santander', NULL, b'1', b'0', 'U'),
('19351187', 'CC', '2022-03-25 15:52:59', 'Feliz Arturo', 'Leguizamón', '3153977888', NULL, '', '1955-06-27', 'Calle 12 4 b 461', 1, b'1', b'1', 'U'),
('20429723', 'CC', '2022-04-13 21:00:17', 'Gilma', 'Pacheco', '3156112951', NULL, 'F', NULL, 'Call6b#27_79 la Paz', NULL, b'1', b'1', 'U'),
('23805387', 'CC', '2022-04-09 01:36:28', 'Aurora', 'Escarraga', '3115787840', NULL, 'F', NULL, 'K 17 #15_108 B|Modelo', NULL, b'1', b'1', 'U'),
('25463330', 'CC', '2022-04-09 17:37:04', 'araceli', 'ultengo ultengo ', '3188336103', NULL, 'F', '1972-01-20', 'mz c casa 12 Bicentenario iI', NULL, b'1', b'0', 'U'),
('28523006', 'CE', '2022-04-06 20:15:23', 'mailis damelis ', 'coronado mujica', '3147036155', NULL, 'F', '2000-09-08', 'Vereda Triunfo II ', NULL, b'1', b'0', 'R'),
('28713816', 'CC', '2022-04-09 02:30:59', 'Luz Maria', 'Rincon', '3132073264', NULL, 'F', '1952-07-30', 'Prados De san Sebastian', NULL, b'1', b'1', 'U'),
('30048562', 'CC', '2022-04-09 17:48:17', 'ana elvia', 'mendoza hernandez', '3132031103', NULL, 'F', '1957-07-08', 'cll 23 19A Barrio la granja', NULL, b'1', b'0', 'U'),
('37696180', 'CC', '2022-04-05 16:51:40', 'angelina', 'Ruiz Guiza', '3228441465', NULL, 'F', '1963-04-16', 'Vereda puerto Ospina', NULL, b'1', b'0', 'R'),
('39748094', 'CC', '2022-04-09 02:59:03', 'MARGARITA', 'Murcia', '3188096104', NULL, 'F', '1964-11-22', 'Mz Jvcasa 33 Bicentenario I', NULL, b'1', b'1', 'U'),
('40217364', 'CC', '2022-04-01 16:19:39', 'Ana Rut', 'Durango Galindez', '3204854677', 'ana2219822@hotmail.com', 'F', '1981-01-22', 'Mz l casa 4', NULL, b'1', b'1', 'R'),
('40378365', 'CC', '2022-04-04 15:03:40', 'oMAIRA ', 'GUERRERO LOPEZ', '3112628123', NULL, 'F', '1966-02-27', 'Prados san sebatian', NULL, b'1', b'0', 'U'),
('41213255', 'TI', '2022-03-25 13:20:04', 'Sandy Yanira', 'Cardenas', '3102688341', NULL, '', '1970-06-01', 'Bello horizonte Calle 20 # 21-60', 1, b'1', b'1', 'U'),
('41214486', 'CC', '2022-03-25 14:08:42', 'Lidia Estela ', 'Salgado', '3142184947', NULL, '', '1976-07-01', 'Calle 25 19D barrio triunfo', 1, b'1', b'1', 'U'),
('41219693', 'CC', '2022-04-02 16:39:14', 'Flor', 'Ramírez', '3102706831', NULL, 'F', '1972-09-17', 'Vereda Cambolitos', NULL, b'1', b'1', 'R'),
('42023163', 'CC', '2022-03-25 14:49:30', 'Luz María ', 'Londoño', '3118946438', NULL, '', '1966-12-11', 'Vereda Puerto Tolima', 1, b'1', b'1', 'R'),
('55111500', 'CC', '2022-04-02 16:13:40', 'Nury del Carmen', 'Julio Marulanda', '3502972025', NULL, 'F', '1967-12-09', 'Barrio altos de San jorge', NULL, b'1', b'1', 'R'),
('5696624', 'CC', '2022-04-05 15:32:47', 'ULPIANO ', 'ARCHILA CACE', '3126323462', NULL, 'M', '1949-10-21', 'Prado de san sebastian MZ k casa 21', NULL, b'1', b'0', 'U'),
('68246835', 'CC', '2022-04-01 13:54:59', 'Eumelia', 'Cuadros', '3102327525', 'as.amapadig@hotmail.es', 'F', '1972-10-20', 'Mz g casa 9', NULL, b'1', b'1', 'R'),
('7817407', 'CC', '2022-04-05 15:02:09', 'guillermo', 'Gonzáles Rojas', '3219928701', NULL, 'M', '1952-04-08', 'Barrio 20 de Julio CRA 29 # 5-99', NULL, b'1', b'0', 'U'),
('86005285', 'CC', '2022-04-02 16:48:05', 'wilson ', 'rey sánchez', '3125033048', NULL, 'M', '1969-09-01', 'Calle 24 A # 19-39', NULL, b'1', b'1', 'U'),
('86054186', 'CC', '2022-03-26 14:27:54', 'Andres Bertulfo', 'Pinto Beltran', '3103166399', NULL, '', '1977-07-21', 'Vereda Cerro Azul', 1, b'1', b'1', 'R'),
('93126703', 'CC', '2022-04-04 19:35:18', 'huberles', 'preciado sanchez', '3223193793', NULL, 'M', '1971-02-25', 'Barrio las Palmas Cll E Cs 124', NULL, b'1', b'0', 'U');


INSERT INTO `tb_sac_cases` (`id`, `date`, `status`, `user`, `dni`, `eps`, `requiredAttention`, `note`, `sisben`, `regime`, `olderAdult`, `disabled`, `pregnant`, `womenHeadHousehold`, `afrodescendent`, `lgtbi`, `victim`, `displaced`, `demobilized`, `reinserted`, `palenRaizal`, `roomGintano`, `nnaNunaccompaniedAdult`) VALUES
(1, '2022-03-29 20:59:30', b'1', 1, '1122919196', 1, 6, 'Paciente de alto costo (Cáncer) que requiere un medicamento pero la EPS dice estado inactivo,\ny desabastecimiento temporal indefinido de medicamento.\nEnviado a Gibi escaneado el paquete para revisión.', NULL, NULL, b'0', b'0', b'0', b'0', b'0', b'0', b'0', b'0', b'0', b'0', b'0', b'0', b'0'),
(2, '2022-04-04 14:31:31', b'1', 1, '1121864121', 1, 5, 'Usuaria no reportada por la Eps para la CET, se le realizo acompañamiento para diligenciar el formulario de actualización de datos de Nueva Eps. ', NULL, NULL, b'0', b'0', b'0', b'0', b'0', b'0', b'0', b'1', b'0', b'0', b'0', b'0', b'0'),
(3, '2022-04-04 14:34:15', b'1', 1, '17110249', 1, 6, ' Adulto mayor Se le realizo acompañamiento para Solicitud de cita con medico general en la ESE de I Nivel, pero no aparece activo, Se Solicito certificación a Nueva EPS.\n', NULL, NULL, b'1', b'0', b'0', b'0', b'0', b'0', b'0', b'0', b'0', b'0', b'0', b'0', b'0'),
(4, '2022-04-04 15:10:17', b'1', 1, '40378365', 1, 4, 'Derecho de petición radicado ante Nueva EPS por la usuaria el día 01 de abril por inconsistencias en el servicio integral en salud, RAD-1917634.\nLa usuaria deja copia para seguimiento como ente territorial.', NULL, NULL, b'0', b'1', b'0', b'0', b'0', b'0', b'1', b'0', b'0', b'0', b'0', b'0', b'0'),
(5, '2022-04-04 17:08:07', b'1', 1, '1123564455', 1, 7, 'Traslado realizado mediante la plataforma de  \"mi seguridad social\"\nTraslado activo a partir del 01-05-2022\n', NULL, NULL, b'0', b'1', b'0', b'0', b'0', b'0', b'0', b'1', b'0', b'0', b'0', b'0', b'0'),
(6, '2022-04-04 19:38:36', b'1', 1, '93126703', 1, 2, 'seguimiento a formulario de afiliación diligenciado por Nueva EPs el 04-04-2022. ', NULL, NULL, b'0', b'0', b'0', b'0', b'0', b'0', b'0', b'0', b'0', b'0', b'0', b'0', b'0'),
(7, '2022-04-04 21:12:57', b'1', 1, '1116436731', 1, 6, 'análisis computarizado de la marcha del paciente en mención  ha sido programado para el día 4 DE MAYO  A LAS 2 PM en el laboratorio de análisis de movimiento ubicado dentro del Hospital Infantil Universitario de San José.\n', NULL, NULL, b'0', b'1', b'0', b'0', b'0', b'0', b'0', b'1', b'0', b'0', b'0', b'0', b'0'),
(8, '2022-04-04 22:17:05', b'1', 1, '1023906050', 1, 7, 'Traslado realizado mediante la plataforma de se \"mi seguridad social\"\nActivo para Nueva EPS a partir del 01-05-2022', NULL, NULL, b'0', b'0', b'0', b'0', b'0', b'0', b'0', b'1', b'0', b'0', b'0', b'0', b'0'),
(9, '2022-04-05 13:53:53', b'1', 1, '1028860558', 1, 4, 'Usuraria manifiesta inconformidad por la no oportuna repuesta de la linea telefónica para solicitar citas con de medicina general en la ESE  de I nivel.', NULL, NULL, b'0', b'0', b'0', b'0', b'0', b'0', b'0', b'0', b'0', b'0', b'0', b'0', b'0'),
(10, '2022-04-05 15:04:28', b'1', 1, '7817407', 1, 6, 'Adulto mayor se le realizo acompañamiento para solicitud de cita con medicina general para el 19 de abril a las 9:00Am', NULL, NULL, b'0', b'0', b'0', b'0', b'0', b'0', b'0', b'0', b'0', b'0', b'0', b'0', b'0'),
(11, '2022-04-05 15:33:41', b'1', 1, '5696624', 1, 5, 'Se encuentra en validaciones para realizar el giro, gestione la apertura de cuenta de trámite simplicado (Daviplata, Nequi o Bancolombia a la Mano), si ya tiene una, verifique que se encuentre activa y diligencie el siguiente formulario https://forms.office.com/r/8dK0LmpXjN ', NULL, NULL, b'1', b'1', b'0', b'0', b'0', b'0', b'0', b'1', b'0', b'0', b'0', b'0', b'0'),
(12, '2022-04-05 17:19:19', b'1', 1, '37696180', 1, 6, 'Se realizo acompañamiento en la solicitud de cita para Mamografía, ecografía vías urinarias y electrocardiograma.\nLa usuaria ya reclamo el paquete original y tiene la fecha de las citas', NULL, NULL, b'1', b'0', b'0', b'1', b'0', b'0', b'0', b'0', b'0', b'0', b'0', b'0', b'0'),
(13, '2022-04-05 19:38:28', b'1', 1, '1064789853', 1, 6, 'Se realizo acompañamiento a menor para solicitud de cita mediante correo electrónico de:\n*Imitancia acustica \n*Potenciales evocados auditivos de corta latencia por vía ósea  \n', NULL, NULL, b'0', b'0', b'0', b'0', b'0', b'0', b'0', b'1', b'0', b'0', b'0', b'0', b'0'),
(14, '2022-04-06 14:51:21', b'1', 1, '11355030', 1, 6, 'Medicamento requerido: LEVETIRACETAM 1000MG\nSe comento e caso con la jefe Flor Alba de Nueva EPS', NULL, NULL, b'1', b'0', b'0', b'0', b'0', b'0', b'0', b'1', b'0', b'0', b'0', b'0', b'0'),
(15, '2022-04-06 17:02:19', b'1', 1, '1121870861', 1, 2, 'Orientación para afiliación al SGSSS', NULL, NULL, b'0', b'0', b'0', b'0', b'0', b'0', b'1', b'0', b'0', b'0', b'0', b'0', b'0'),
(16, '2022-04-06 20:21:25', b'1', 1, '28523006', 1, 6, 'Gestante Venezolana  irregular, se recepcionaron datos y se diligencio formato \"solicitud constancia de residencia\" para enviar por correo electrónico a administrativa.', NULL, NULL, b'0', b'0', b'1', b'0', b'0', b'0', b'0', b'0', b'0', b'0', b'0', b'0', b'0'),
(17, '2022-04-06 21:31:43', b'1', 1, '1120561599', 1, 3, 'Pendiente Cambiar servicio requerido\nSe verifico el estado de afiliación y se oriento sobre sus derechos y deberes como usuario del SGSSS.  ', NULL, NULL, b'0', b'0', b'0', b'0', b'0', b'0', b'1', b'0', b'0', b'0', b'0', b'0', b'0'),
(18, '2022-04-08 17:28:52', b'1', 1, '1029800215', 1, 4, 'Madre del menor: Cristina Reyes Villalobos CC.1120569541 Con custodia del menor desde junio de 2020\nCotizante actual: Se desconoce datos del familiar cotizante actual ( anteriormente el cotizante era el padre del menor quien falleció hace 5 años)\nLa madre requiere afiliar al menor en su núcleo familiar en el régimen subsidiado.', NULL, NULL, b'0', b'0', b'0', b'0', b'0', b'0', b'1', b'0', b'0', b'0', b'0', b'0', b'0'),
(19, '2022-04-09 17:29:06', b'1', 1, '1002988117', 1, 1, 'Se solicito portabilidad para su grupo familiar mediante correo electrónico y se creo usuario en https://portabilidad.asmetsalud.com/#/ov/afiliados \nContraseña: saray117\nDatos integrantes del núcleo familiar para solicitud de portabilidad:\n\n1.	 Nombres y apellidos: CARLOS EDUARDO LEON ALBORNOZ\n             Identificación del titular TI 1059986592\n2.	Nombres y apellidos: LESLY VANESSA PINO LEON\n   ', NULL, NULL, b'0', b'0', b'0', b'0', b'1', b'0', b'0', b'0', b'0', b'0', b'0', b'0', b'0'),
(20, '2022-04-09 17:34:43', b'1', 1, '1003710166', 1, 1, 'Se solicito portabilidad mediante correo electrónico', NULL, NULL, b'0', b'0', b'0', b'1', b'0', b'0', b'0', b'0', b'0', b'0', b'0', b'0', b'0'),
(21, '2022-04-09 17:38:58', b'1', 1, '25463330', 1, 1, 'Se solicito portabilidad a su grupo familiar mediante correo electrónico a Capital Salud', NULL, NULL, b'0', b'0', b'0', b'1', b'0', b'0', b'0', b'0', b'0', b'0', b'0', b'0', b'0'),
(22, '2022-04-09 17:45:29', b'1', 1, '1120563116', 1, 1, 'Se solicito portabilidad mediante correo electrónico a Capital Salud', NULL, NULL, b'0', b'1', b'0', b'0', b'0', b'0', b'0', b'0', b'0', b'0', b'0', b'0', b'0'),
(23, '2022-04-09 17:51:43', b'1', 1, '30048562', 1, 6, 'Se realizo acompañamiento para solicitud de cita con especialista de oftalmología, asignada para el lunes 2 de mayo 3:30 pm con el especialista David colina en Granada Meta Cra 13 #25-62 centro comercial Milenium. ', NULL, NULL, b'1', b'0', b'0', b'0', b'0', b'0', b'0', b'0', b'0', b'0', b'0', b'0', b'0');

INSERT INTO `tb_sac_cases_comments` (`id`, `date`, `user`, `case`, `content`) VALUES
(1, '2022-03-29 23:56:35', 1, 1, 'Pendiente radica PQR'),
(2, '2022-03-30 22:55:58', 1, 1, 'Se realizo notificación de PQR ante Nueva EPS al correo de auditorias_guaviare@nuevaeps.com.co por la no garantía oportuna de entrega de medicamentos. Pendiente respuesta EPS.'),
(3, '2022-04-04 17:10:25', 1, 5, 'correo: yerlysulandymoreno@gmail.com, pw: 1123564455, usuario SAT: CC1123564455, pw: Yerly455. \nNovedad SAT: 069CC112356445504042022115100004'),
(4, '2022-04-06 21:33:43', 1, 13, 'Pendiente solicitar cita'),
(5, '2022-04-08 17:29:48', 1, 18, 'Se envió paquete de soportes a Mariam de nueva EPS para revisión.'),
(6, '2022-04-09 15:30:51', 1, 1, 'Nueva EPS dio respuesta a la PQR el 8 de abril, manifiestan que el medicamento tiene dificultad logística en el pais y establecieron contacto con la IPS ordenadora para verificar su disponibilidad del'),
(7, '2022-04-09 17:52:30', 1, 23, 'Pendiente que la usuaria venga por el paquete original.');


INSERT INTO `tb_sac_cases_required_attentions` (`id`, `attention`) VALUES
(1, 'Portabilidad'),
(2, 'Seguimiento a trasla'),
(3, 'Cambio de IPS'),
(4, 'Recepción de PQR'),
(5, 'Asesoria CET'),
(6, 'Acompañamiento prefe'),
(7, 'Traslado SAT'),
(8, 'Verificación estado '),
(9, 'Promoción del SAT');

INSERT INTO `tb_surveys_eps` (`id`, `date`, `user`, `dni`, `ask01`, `ask02`, `ask03`, `ask04`, `ask05`, `ask06`, `ask07`, `ask08`, `ask09`, `ask10`, `ask11`, `ask12`, `ask12.01`, `ask12.02`, `ask13`) VALUES
(1, '2022-03-25 13:24:12', 1, '41213255', '1', 'RECEPCIONISTA', b'1', 1, 4, 2, 4, 5, 4, 3, 2, 5, 5, 5, 3),
(2, '2022-03-25 14:05:37', 1, '1120560397', '1', 'Nadie', b'1', 1, 5, 1, 1, 1, 1, 1, 1, 2, 4, 2, 5),
(3, '2022-03-25 14:27:15', 1, '41214486', '1', 'Nadie', b'1', 1, 3, 4, 4, 4, 2, 2, 2, 4, 3, 4, 2),
(4, '2022-03-25 14:52:57', 1, '42023163', '1', 'RECEPCIONISTA', b'1', 1, 5, 5, 1, 5, 4, 2, 4, 5, 5, 5, 4),
(5, '2022-03-25 15:03:15', 1, '1110487608', '1', 'PROMOTOR', b'1', 1, 5, 5, 5, 4, 4, 4, 1, 5, 4, 4, 5),
(6, '2022-03-25 15:15:57', 1, '1002387726', '1', 'PROMOTOR', b'1', 1, 5, 4, 5, 5, 5, 5, 4, 5, 5, 5, 4),
(7, '2022-03-25 15:29:17', 1, '1002582109', '1', 'PROMOTOR', b'1', 1, 5, 3, 1, 1, 5, 2, 3, 5, 5, 5, 5),
(8, '2022-03-26 14:30:05', 1, '86054186', '1', 'PROMOTOR', b'1', 1, 3, 4, 3, 4, 3, 2, 3, 4, 5, 4, 3),
(9, '2022-04-01 13:58:18', 1, '1120570617', 'Nueva eps', '1', b'1', 4, 5, 4, 4, 4, 5, 5, 3, 5, 4, 5, 4),
(10, '2022-04-01 14:13:45', 1, '68246835', 'Nueva eps', 'Ninguna', b'1', 1, 1, 5, 1, 1, 1, 1, 1, 5, 5, 5, 5),
(11, '2022-04-01 16:25:35', 1, '40217364', 'Nueva eps ', 'Ninguna', b'1', 3, 1, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4),
(12, '2022-04-01 18:24:01', 1, '1007244088', 'Nueva eps', 'Nadie', b'1', 3, 1, 3, 1, 4, 1, 1, 1, 4, 4, 4, 2),
(13, '2022-04-02 16:20:07', 1, '55111500', 'Nueva EPS', '2', b'1', 4, 2, 3, 2, 4, 2, 2, 1, 5, 5, 5, 5),
(14, '2022-04-02 16:28:17', 1, '1120564048', 'Nueva eps', '2', b'1', 3, 2, 3, 2, 3, 3, 4, 2, 4, 4, 3, 4),
(15, '2022-04-02 16:36:18', 1, '1120560764', 'Nueva EPS', 'Nadie', b'1', 4, 2, 3, 1, 3, 3, 4, 2, 3, 4, 3, 2),
(16, '2022-04-02 16:46:07', 1, '41219693', 'Nueva EPS', 'Nadie', b'1', 1, 1, 2, 2, 1, 1, 2, 3, 2, 2, 2, 3),
(17, '2022-04-02 16:57:40', 1, '86005285', 'Nueva EPS', '2', b'1', 4, 3, 2, 2, 4, 3, 2, 3, 5, 5, 4, 2),
(18, '2022-04-05 19:32:49', 1, '1121925616', 'NUEVA EPS', '2', b'1', 4, 4, 3, 3, 3, 3, 4, 4, 4, 3, 3, 3),
(19, '2022-04-09 01:40:39', 2, '23805387', 'NUeva EPS', 'Enfermero', b'1', 4, 4, 3, 2, 1, 3, 1, 1, 3, 3, 3, 3),
(20, '2022-04-09 02:34:08', 2, '28713816', 'NUEVA ePS', '2', b'1', 4, 2, 2, 3, 3, 2, 3, 1, 4, 4, 4, 3),
(21, '2022-04-09 03:02:27', 2, '39748094', 'NUEVA EPS', '3', b'1', 5, 4, 4, 4, 4, 2, 3, 2, 4, 4, 4, 3),
(22, '2022-04-13 21:01:52', 2, '20429723', 'Nueva EPS', '3', b'1', 4, 4, 4, 4, 2, 2, 2, 1, 4, 3, 3, 3);

INSERT INTO `tb_surveys_ips` (`id`, `date`, `user`, `dni`, `ask01`, `ask02`, `ask03`, `ask04`, `ask05`, `ask06`, `ask07`, `ask08`, `ask09`, `ask10`) VALUES
(1, '2022-04-09 01:45:44', 2, '23805387', 'ESe 1 Nivel', 3, 1, 5, 2, 2, 1, 3, 1, 2),
(2, '2022-04-09 02:37:44', 2, '28713816', 'ESe 1 nivel', 3, 2, 4, 2, 5, 1, 3, 2, 2),
(3, '2022-04-09 03:05:25', 2, '39748094', 'NUeva EPS', 2, 1, 4, 2, 4, 1, 3, 1, 2),
(4, '2022-04-13 21:03:17', 2, '20429723', 'Ese 1 Nivel', 3, 1, 2, 1, 2, 1, 3, 1, 3);

INSERT INTO `tb_surveys_ips_hospitalization` (`id`, `date`, `user`, `dni`, `ask01`, `ask02`, `ask03`, `ask04`, `ask05`, `ask06`, `ask07`, `ask08`, `ask09`, `ask10`) VALUES
(1, '2022-04-01 14:31:43', 1, '68246835', 0, 3, 1, 4, '2', 2, 1, 2, 2, 2),
(2, '2022-04-01 16:28:30', 1, '40217364', 0, 3, 1, 3, '2', 2, 1, 3, 1, 3),
(3, '2022-04-05 19:14:31', 1, '1121925616', 1, 1, 5, 1, '1', 2, 3, 1, 1, 3),
(4, '2022-04-09 01:47:40', 2, '23805387', 1, 2, 5, 1, '1', 2, 3, 1, 1, 2),
(5, '2022-04-09 02:42:33', 2, '28713816', 2, 1, 2, 1, '2', 2, 3, 1, 1, 3),
(6, '2022-04-09 03:10:39', 2, '39748094', 1, 3, 1, 1, '1', 2, 3, 2, 1, 2);

INSERT INTO `tb_surveys_ips_laboratorys` (`id`, `date`, `user`, `dni`, `ask01`, `ask02`, `ask03`, `ask04`, `ask05`, `ask06`, `ask07`, `ask08`, `ask09`, `ask10`) VALUES
(1, '2022-04-03 00:16:00', 1, '1006783343', 'Nueva salud integral', 3, 3, 3, 1, 3, 3, 3, 1, 3),
(2, '2022-04-05 19:24:02', 1, '1121925616', 'ese hospital sjg', 3, 3, 3, 1, 3, 3, 1, 1, 3),
(3, '2022-04-09 01:59:39', 2, '23805387', 'ESe 1 nivel', 3, 2, 2, 3, 2, 3, 1, 1, 2),
(4, '2022-04-09 02:46:08', 2, '28713816', 'ESe 1 Nivel', 3, 3, 3, 4, 2, 3, 1, 1, 2),
(5, '2022-04-09 03:14:29', 2, '39748094', 'NUeva salud integral', 3, 3, 3, 1, 3, 3, 1, 1, 3);

INSERT INTO `tb_surveys_ips_medicine` (`id`, `date`, `user`, `dni`, `ask01`, `ask02`, `ask03`, `ask04`, `ask05`, `ask06`, `ask07`, `ask08`, `ask09`, `ask10`) VALUES
(1, '2022-04-01 18:26:41', 1, '1007244088', 'ESE I NIVEL', 4, 3, 1, 1, 3, 2, 1, 1, 2),
(2, '2022-04-05 19:30:59', 1, '1121925616', 'ESE HOSPITAL SJG', 3, 3, 1, 1, 3, 3, 3, 3, 3),
(3, '2022-04-09 02:01:06', 2, '23805387', 'Ese 1 nivel', 4, 3, 1, 1, 3, 3, 3, 3, 3),
(4, '2022-04-09 02:47:45', 2, '28713816', 'Ese 1 nivel', 4, 2, 1, 1, 3, 3, 3, 3, 3),
(5, '2022-04-09 03:16:18', 2, '39748094', 'Nueva EPS', 3, 3, 1, 1, 3, 3, 3, 3, 3),
(6, '2022-04-09 20:26:05', 1, '1007244088', 'NUEVA SALUD INTEGRAL', 2, 2, 1, 1, 2, 2, 3, 3, 3);

INSERT INTO `tb_surveys_ips_odontology` (`id`, `date`, `user`, `dni`, `ask01`, `ask02`, `ask03`, `ask04`, `ask05`, `ask06`, `ask07`, `ask08`, `ask09`, `ask10`) VALUES
(1, '2022-04-03 00:09:04', 1, '1006783343', 'Nueva salud Integral', 3, 3, 1, 1, 3, 3, 2, 3, 3),
(2, '2022-04-09 02:03:11', 2, '23805387', 'Ese 1 Nivel', 3, 2, 1, 1, 3, 2, 1, 3, 2),
(3, '2022-04-09 02:49:58', 2, '28713816', 'Ese 1 Nivel', 4, 3, 1, 1, 3, 3, 2, 3, 3);


INSERT INTO `tb_surveys_ips_pharmacy` (`id`, `date`, `user`, `dni`, `ask01`, `ask02`, `ask03`, `ask04`, `ask05`, `ask06`, `ask07`, `ask08`) VALUES
(1, '2022-04-05 19:28:35', 1, '1121925616', 'ESE HOSPITAL SJG', 3, 3, 1, 1, 1, 3, 3),
(2, '2022-04-09 01:57:04', 2, '23805387', 'SErvicios farmaceutica colmedica', 3, 1, 1, 1, 1, 3, 2),
(3, '2022-04-09 02:44:01', 2, '28713816', 'SErvicios farmaceuticos colmedica', 3, 2, 2, 2, 2, 3, 2),
(4, '2022-04-09 03:12:22', 2, '39748094', 'Audifarma', 3, 2, 1, 1, 2, 1, 3);



INSERT INTO `tb_users` (`id`, `date`, `dni`, `name`, `lastName`, `username`, `email`, `password`, `token`, `rule`, `disable`) VALUES
(1, '2022-03-29 19:28:09', '1006783343', 'DAYANNA', 'PINTO', 'DAYANNA', 'DAYANAPINTO22@GMAIL.COM', '$2y$04$A8dGLVylvwo/0eLebRIam.jJ6xLqfrnMKay2m1xB7cmptEYAyGp9.', 'cbd760e56e7ebb60f1a360d639582739119dff546490ad3d0a', 1, b'0'),
(2, '2022-04-04 16:25:00', '1', 'ERIKA', 'GARCIA', 'erikagarci', '', '', '', 0, NULL),
(3, '2022-04-04 16:26:55', '2', 'ANA GIBI', 'CORRALES', 'anagabi', 'anna@', '', 'kjk', 0, NULL);


SET FOREIGN_KEY_CHECKS = 1; -- Deshabilitamos las llaves foraneas