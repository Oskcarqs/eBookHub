/*
	Fila 2 - Proyecto "eBookHub"

    Integrantes:
		omorales-201992
        zmenendez-2019484
        dsanchez-2018471
        hrodriguez-2019188
		epereira-2021576
        jrevolorio-2019058
        areyes-2019092
        arodriguez-2019620
        eramirez-2019031
        bmendoza-2019349
        pmedina-2019111
        amendez-2019362
*/


Drop database if exists  eBookHub;
Create database eBookHub;

Use eBookHub;

-- ------------------- ENTIDADES ------------------- --
Create table Autor (
	idAutor int not null auto_increment,
    nombreAutor varchar(35) not null,
    apellidoAutor varchar(35) not null,
    nacionalidadAutor varchar(35) not null,
    fechaNacimientoAutor date not null,
    biografiaAutor varchar(250) not null,
    primary key PK_idAutor (idAutor)
);

Create table Editorial (
	idEditorial int not null auto_increment,
    nombreEditorial varchar(35) not null,
    descripcionEditorial varchar(250) not null,
    primary key PK_idEditorial (idEditorial)
);

Create table Categoria (
	idCategoria int not null auto_increment,
    nombreCategoria varchar(35) not null,
    descripcionCategoria varchar(250) not null,
	primary key PK_idCategoria (idCategoria)
);

Create table Libro ( 
	idLibro int not null auto_increment,
	tituloLibro varchar(100) not null,
    descripcionLibro varchar(250) not null,
    fechaDePublicacion date not null,
    idiomaLibro varchar(30) not null,
    costoLibro decimal(10,2) not null,
    tipoLibro varchar(20) not null,
    stockLibro int not null,
    idAutor int not null,
    idEditorial int not null,
    idCategoria int not null,
    primary	key PK_idLibro (idLibro),
	constraint FK_Libro_Autor foreign key (idAutor)
		references Autor (idAutor) on delete cascade on update cascade,
	constraint FK_Libro_Editorial foreign key (idEditorial)
		references Editorial (idEditorial) on delete cascade on update cascade,
	constraint FK_Libro_Categoria foreign key (idCategoria)
		references Categoria (idCategoria) on delete cascade on update cascade
);

Create table Cliente (
	idCliente int not null auto_increment,
    nombreCliente varchar(35) not null,
    apellidoCliente varchar(35) not null,
    fechaDeNacimientoCliente date not null,
    direccionCliente varchar(75) not null,
    telefonoCliente varchar(10) not null,

    nickNameUsuario varchar(50),
    emailUsuario varchar(70),
    passwordUsuario varchar(50),

	imgCLiente longblob,

    primary key PK_idCliente (idCliente)
);


Create table TipoServicio (
	idTipoServicio int not null auto_increment,
    nombreTipoServicio varchar(35) not null,
    primary key PK_idTipoServicio (idTipoServicio)
);

Create table Servicio (
	idServicio int not null auto_increment,
    costoServicio decimal(10,2) not null,
    fechaServicio date not null,
    fechaVencimientoServicio date,
    idTipoServicio int not null,
    idLibro int not null,
    idCliente int not null,
    primary key PK_idServicio (idServicio),
    constraint FK_Servicio_TipoServicio foreign key (idTipoServicio)
		references TipoServicio (idTipoServicio) on delete cascade on update cascade,
    constraint FK_Servicio_Libro foreign key (idLibro)
		references Libro (idLibro) on delete cascade on update cascade,
	constraint FK_Servicio_Cliente foreign key (idCliente)
		references Cliente (idCliente) on delete cascade on update cascade
);

Create table Sucursal(
	idSucursal int not null auto_increment,
	nombreSucursal varchar(35) not null, 
	direccionSucursal varchar(75) not null,
	telefonoSucursal varchar(10) not null,
	primary key PK_idSucursal (idSucursal)
);

Create table Factura (
	idFactura int not null auto_increment,
    fechaEmision date not null,
    horaEmision time not null,
    totalFactura decimal(10,2) not null,
    idSucursal int not null,
    idCliente int not null,
    primary key PK_idFactura (idFactura),    
    constraint FK_Factura_Sucursal foreign key (idSucursal)
		references Sucursal (idSucursal)  on delete cascade on update cascade,      
	constraint FK_Factura_Cliente foreign key (idCliente)
		references Cliente (idCliente) on delete cascade on update cascade
);

Create table DetalleFactura (
	idDetalleFactura int not null auto_increment,
    idFactura int not null,
    idServicio int not null,
    primary key PK_idDetalleFactura (idDetalleFactura),
    constraint FK_DetalleFactura_Factura foreign key (idFactura)
		references Factura (idFactura) on delete cascade on update cascade,
	constraint FK_DetalleFactura_Servicio foreign key (idServicio)
		references Servicio (idServicio) on delete cascade on update cascade
);

Create table TipoSuscripcion(
	idTipoSuscripcion int not null auto_increment,
    nombreTipoSuscripcion varchar(35) not null,
    descripcionTipoSuscripcion varchar(250) not null,
    precioTipoSuscripcion decimal(10,2) not null,
    primary key PK_idTipoSuscripcion (idTipoSuscripcion)
);

Create table FacturaSuscripcion(
	idFacturaSuscripcion int not null auto_increment,
    fechaDeInicio date not null,
	fechaDeVencimiento date not null,
	idTipoSuscripcion int null null,
    idCliente int not null,
    primary key PK_idFacturasuscripcion (idFacturasuscripcion),
    constraint FK_Suscripcion_TipoSuscripcion foreign key (idTipoSuscripcion) 
		references TipoSuscripcion (idTipoSuscripcion)  on delete cascade on update cascade,
    constraint FK_Suscripcion_Cliente foreign key (idCliente) 
		references Cliente (idCliente) on delete cascade on update cascade
);
    
Create table Empleado(
	idEmpleado int auto_increment not null,
    nombreEmpleado varchar(35) not null,
    apellidoEmpleado varchar(35) not null,
    puestoEmpleado varchar(35) not null,

    nickNameUsuario varchar(50) not null,
    emailUsuario varchar(70) not null,
    passwordUsuario varchar(50) not null,
	imgEmpleado longblob not null,

    idSucursal int not null,
    primary key PK_idEmpleado (idEmpleado),
    constraint FK_Empleado_Sucursal foreign key (idSucursal)
		references Sucursal (idSucursal) on delete cascade on update cascade
);

select * from detallefactura;

Insert into Autor(nombreAutor, apellidoAutor, nacionalidadAutor, fechaNacimientoAutor, biografiaAutor) values('Gabriel', 'García Márquez', 'Colombiano', '1927-03-06', 'Escritor colombiano ganador del Premio Nobel de Literatura en 1982.');
Insert into Autor(nombreAutor, apellidoAutor, nacionalidadAutor, fechaNacimientoAutor, biografiaAutor) values('J.K.', 'Rowling', 'Británica', '1965-07-31', 'Autora de la serie de libros de Harry Potter, una de las sagas más exitosas en la historia de la literatura.');
Insert into Autor(nombreAutor, apellidoAutor, nacionalidadAutor, fechaNacimientoAutor, biografiaAutor) values('Eiichiro', 'Oda', 'Japonés', '1975-01-01', 'Autor del manga y anime "One Piece", uno de los mangas más exitosos y longevos de la historia.');
Insert into Autor(nombreAutor, apellidoAutor, nacionalidadAutor, fechaNacimientoAutor, biografiaAutor) values('Haruki', 'Murakami', 'Japonés', '1949-01-12', 'Autor de novelas aclamadas internacionalmente, conocido por su estilo único y sus temas surrealistas.');
Insert into Autor(nombreAutor, apellidoAutor, nacionalidadAutor, fechaNacimientoAutor, biografiaAutor) values('Isabel', 'Allende', 'Chilena', '1942-08-02', 'Destacada autora chilena, reconocida por novelas como "La casa de los espíritus" y "Paula".');
Insert into Autor(nombreAutor, apellidoAutor, nacionalidadAutor, fechaNacimientoAutor, biografiaAutor) values('Julio', 'Cortázar', 'Argentino', '1914-08-26', 'Escritor argentino conocido por sus obras de narrativa y su estilo innovador.');
Insert into Autor(nombreAutor, apellidoAutor, nacionalidadAutor, fechaNacimientoAutor, biografiaAutor) values('Gabriela', 'Mistral', 'Chilena', '1889-04-07', 'Poeta chilena y ganadora del Premio Nobel de Literatura en 1945, reconocida por su poesía lírica y comprometida.');
Insert into Autor(nombreAutor, apellidoAutor, nacionalidadAutor, fechaNacimientoAutor, biografiaAutor) values('Rubén', 'Darío', 'Nicaragüense', '1867-01-18', 'Poeta nicaragüense, considerado uno de los máximos representantes del modernismo literario en Hispanoamérica.');
Insert into Autor(nombreAutor, apellidoAutor, nacionalidadAutor, fechaNacimientoAutor, biografiaAutor) values('Makoto', 'Shinkai', 'Japonés', '1973-02-09', 'Director y guionista de anime japonés, conocido por películas como "Your Name" y "Weathering with You".');
Insert into Autor(nombreAutor, apellidoAutor, nacionalidadAutor, fechaNacimientoAutor, biografiaAutor) values('Gustavo', 'Adolfo Bécquer', 'Español', '1836-02-17', 'Poeta y escritor español, conocido por sus Leyendas y Rimas, considerado uno de los máximos exponentes del romanticismo en España.');

Insert into Editorial(nombreEditorial, descripcionEditorial) values('Penguin Random House', 'Editorial líder a nivel mundial, con una amplia gama de géneros literarios.');
Insert into Editorial(nombreEditorial, descripcionEditorial) values('HarperCollins Publishers', 'Editorial global con un catálogo diverso que abarca diferentes géneros literarios.');
Insert into Editorial(nombreEditorial, descripcionEditorial) values('Hachette Livre', 'Editorial francesa con presencia internacional y una amplia variedad de títulos.');
Insert into Editorial(nombreEditorial, descripcionEditorial) values('Simon & Schuster', 'Editorial estadounidense conocida por publicar obras de ficción y no ficción.');
Insert into Editorial(nombreEditorial, descripcionEditorial) values('Grupo Planeta', 'Editorial española con una amplia variedad de sellos editoriales y géneros literarios.');
Insert into Editorial(nombreEditorial, descripcionEditorial) values('Ediciones SM', 'Editorial especializada en publicaciones educativas y literatura infantil y juvenil.');
Insert into Editorial(nombreEditorial, descripcionEditorial) values('Editorial Anagrama', 'Editorial española reconocida por su selección de obras de narrativa contemporánea.');
Insert into Editorial(nombreEditorial, descripcionEditorial) values('Editorial Alfaguara', 'Editorial con un catálogo variado que incluye clásicos y autores contemporáneos.');
Insert into Editorial(nombreEditorial, descripcionEditorial) values('Ediciones Siruela', 'Editorial española enfocada en la publicación de obras de calidad y alto valor literario.');
Insert into Editorial(nombreEditorial, descripcionEditorial) values('Random House Mondadori', 'Editorial que fusiona el catálogo de Penguin Random House y Grupo Mondadori en países de habla hispana.');

Insert into Categoria(nombreCategoria, descripcionCategoria) values('Manga', 'Género de historietas o cómics japoneses, caracterizado por su estilo visual distintivo.');
Insert into Categoria(nombreCategoria, descripcionCategoria) values('Cómic', 'Obra de narrativa gráfica que combina ilustraciones y texto para contar una historia.');
Insert into Categoria(nombreCategoria, descripcionCategoria) values('Novela', 'Género literario de ficción narrativa');
Insert into Categoria(nombreCategoria, descripcionCategoria) values('Ciencia Ficción', 'Género que combina ciencia y elementos ficticios');
Insert into Categoria(nombreCategoria, descripcionCategoria) values('Historia', 'Registro y análisis de eventos pasados');
Insert into Categoria(nombreCategoria, descripcionCategoria) values('Poesía', 'Expresión artística mediante la escritura en verso');
Insert into Categoria(nombreCategoria, descripcionCategoria) values('Drama', 'Género teatral con conflictos y emociones intensas');
Insert into Categoria(nombreCategoria, descripcionCategoria) values('Fantasía', 'Género que involucra elementos mágicos e imaginarios');
Insert into Categoria(nombreCategoria, descripcionCategoria) values('Ensayo', 'Reflexión y análisis sobre un tema específico');
Insert into Categoria(nombreCategoria, descripcionCategoria) values('Infantil', 'Dirigido a niños y enfocado en su entretenimiento y aprendizaje');

/* ENTIDAD CLIENTE */
-- Agregar cliente --
Delimiter $$
	Create procedure sp_AgregarCliente( in nombreCliente varchar(35), in apellidoCliente varchar(35), in fechaDeNacimientoCliente date, in direccionCliente varchar(75), telefonoCliente varchar(10))
		begin 
			insert into Cliente (nombreCliente, apellidoCliente, fechaDeNacimientoCliente, direccionCliente, telefonoCliente)
			value (nombreCliente, apellidoCliente, fechaDeNacimientoCliente, direccionCliente, telefonoCliente);
		End$$
Delimiter ;

call sp_AgregarCliente('pedro', 'medina', '2023-06-11', 'villa nueva', '12345678');
call sp_AgregarCliente('emilio', 'de paz', '2021-01-12', 'villa canales', '12345671');
call sp_AgregarCliente('isabel', 'gordillo', '2022-02-13', 'mixco', '12345672');
call sp_AgregarCliente('fabian', 'medina', '2023-03-14', 'san miguel petapa', '12345673');
call sp_AgregarCliente('enrique', 'de paz', '2024-04-15', 'cuidad del sol', '12345674');
call sp_AgregarCliente('pedro', 'lopez', '2025-05-16', 'la betania', '12345675');
call sp_AgregarCliente('santiago', 'maeda', '2026-07-17', 'zona 18', '12345676');
call sp_AgregarCliente('oscar', 'morales', '2027-08-18', 'colonia landivar', '12345677');
call sp_AgregarCliente('otto', 'menendez', '2028-09-19', 'amatitlan', '12345671');
call sp_AgregarCliente('angel', 'mendez', '2029-10-10', 'escuintla', '123456710');

-- Listar clientes --
Delimiter $$
	Create procedure sp_ListarClientes ()
		Begin
			Select 	
            C.nombreCliente,
            C.apellidoCliente,
			C.fechaDeNacimientoCliente,
            C.direccionCliente,
            C.telefonoCliente
            From Cliente C;
        End$$
Delimiter ;
	
Call sp_ListarClientes();

-- Editar cliente --
Delimiter $$
	Create procedure sp_EditarCliente (in idCli int, in nomCli varchar(35), in apeCli varchar(35), in fecha date, in dir varchar(75), tel varchar(10))
		Begin
			Update Cliente C
				Set C.nombreCliente = nomCli,
					C.apellidoCliente = apeCli,
                    C.fechaDeNacimientoCliente = fecha,
                    C.direccionCliente = dir,
                    C.telefonoCliente = tel
                    where C.idCliente = idCli;
        End$$
Delimiter ;

-- call sp_EditarCliente(1 ,'medina', 'pedro', '2023-06-11', 'villa nueva', '12345678');

-- Eliminar cliente
Delimiter $$
	Create procedure sp_EliminarCliente (in idCli int)
		Begin
			Delete from Cliente
					where idCliente = idCli;
        End$$
Delimiter ;

-- call sp_EliminarCliente(1);

-- Buscar cliente --
Delimiter $$
	Create procedure sp_BuscarCliente (in idCli int)
		Begin
			Select 
            C.nombreCliente,
            C.apellidoCliente,
			C.fechaDeNacimientoCliente,
            C.direccionCliente,
            C.telefonoCliente
            From Cliente C where idCliente = idCli;
        End$$
Delimiter ;

Call sp_BuscarCliente (1);
/* ENTIDAD SUCURSAL */
-- Agregar Sucursal --
Delimiter $$
	Create procedure sp_AgregarSucursal(in nombreSucursal varchar(35), in direccionSucursal varchar(75), in telefonoSucursal varchar(10))
		Begin
			Insert into Sucursal (nombreSucursal, direccionSucursal, telefonoSucursal)
				values (nombreSucursal, direccionSucursal, telefonoSucursal);
        end $$
Delimiter ; 

call sp_AgregarSucursal('Online', '', '');
call sp_AgregarSucursal('Edificio Luna', '8va Av. 9-96 z.21', '6452-1325');
call sp_AgregarSucursal('Edificio Sol', '9na Calle 5-52 z.11', '65845211');
call sp_AgregarSucursal('Edificio Cero', 'Las Carchas, z.11', '2424-2424');
call sp_AgregarSucursal('Edificio Pi', 'Condado Ricinos z.14', '1234-5678');
call sp_AgregarSucursal('Edificio Pablo Neruda', '8va Calle 9-63 Col. Jardines Oscuros z.13', '7410-2589');
call sp_AgregarSucursal('Edificio Gabriel Garcia Márquez', 'Condado Las Buganvilias Z.1', '4656-4512');
call sp_AgregarSucursal('Edificio Julio Verne', '8va Av. 12-42 Villa Las Flores z.2', '2475-0122');
call sp_AgregarSucursal('Edificio Miguel Angel Asturias', 'Avenida de los Álamos 8-90, Zona 16, Villa Nueva', '5274-8016');
call sp_AgregarSucursal('Edificio Ricardo Arjona', 'Calle del Sol 23-67, Zona 10, Mixco', '5368-4207');
call sp_AgregarSucursal('Edificio Erick Barrondo ', '7a Avenida 15-45, Zona 4, Ciudad de Guatemala', '2541-9990');

-- Listar Sucursales---
Delimiter $$
	Create procedure sp_ListarSucursales()
		Begin
			Select * from Sucursal;
        End $$
Delimiter ; 

call sp_ListarSucursales();

-- Editar Sucursal ---
Delimiter $$
	Create procedure sp_EditarSucursal(in idSucursal int, in nomSuc varchar(35), in dirSuc varchar(75), in telSuc varchar(10))
		Begin
			Update Sucursal
				set nombreSucursal = nomSuc,
					direccionSucursal = dirSuc,
					telefonoSucursal = telSuc
			where idSucursal = idSuc;
        End $$
Delimiter ; 

-- Eliminar Sucursales---
Delimiter $$
	Create procedure sp_EliminarSucursales(in idSuc int)
		Begin
			Delete from Sucursal
				where idSucursal = idSuc;
        End $$
Delimiter ;

-- Buscar Sucursal ---
Delimiter $$
	Create procedure sp_BuscarSucursal(in idSuc int)
		Begin
			Select * from Sucursal
				where idSucursal = idSuc;
        End $$
Delimiter ; 

call sp_BuscarSucursal(1);

/* ENTIDAD FACTURA */
-- Agregar factura --
Delimiter $$
	Create procedure sp_AgregarFactura(in fechaEmision date, in horaEmision time, in totalFactura decimal(10,2), in idSucursal int, in idCliente int)
		Begin
			Insert into Factura (idFactura, fechaEmision, horaEmision, totalFactura, idSucursal, idCliente)
				values (idFactura, fechaEmision, horaEmision, totalFactura, idSucursal, idCliente);
        End $$
Delimiter ; 

call sp_AgregarFactura('2023-01-03', '10:30:00', 400.30, 1, 1);
call sp_AgregarFactura('2023-02-04', '11:45:00', 100.50, 2, 2);
call sp_AgregarFactura('2023-03-05', '13:15:00', 200.00, 3, 3);
call sp_AgregarFactura('2020-04-05', '18:30:00', 700.10, 4, 4);
call sp_AgregarFactura('2023-05-05', '14:14:00', 500.10, 5, 5);
call sp_AgregarFactura('2023-06-05', '07:39:00', 300.10, 6, 6);
call sp_AgregarFactura('2021-07-05', '09:50:00', 800.60, 7, 7);
call sp_AgregarFactura('2019-08-05', '12:06:00', 600.70, 8, 8);
call sp_AgregarFactura('2021-09-05', '11:24:00', 500.90, 9, 9);
call sp_AgregarFactura('2022-01-05', '14:34:00', 600.90, 10, 10);

-- Listar facturas --
Delimiter $$
	Create procedure sp_ListarFacturas()
		Begin
			Select * from Factura;
        End $$
Delimiter ; 

call sp_ListarFacturas();

-- Editar factura --
Delimiter $$
	Create procedure sp_EditarFactura(in fechaEmision date, in horaEmision time, in totalFactura decimal(10,2), in idSucursal int, in idCliente int)
		Begin
			Update Factura
				set fechaEmision = fechaEmision,
					horaEmision = horaEmision,
					totalFactura = totalFactura,
                    idSucursal = idSucursal,
					idCliente = idCliente
			where idFactura = idFactura;
        End $$
Delimiter ;

-- Eliminar factura --
Delimiter $$
	Create procedure sp_EliminarFactura(in idFactura int)
		Begin
			Delete from Factura
				where idFactura = idFactura;
        End $$
Delimiter ; 

-- call sp_EliminarFactura(1);

-- Buscar factura --
Delimiter $$
	Create procedure sp_BuscarFactura(in idFactura int)
		Begin
			Select * from Factura
				where idFactura = idFactura;
        End $$
Delimiter ; 


