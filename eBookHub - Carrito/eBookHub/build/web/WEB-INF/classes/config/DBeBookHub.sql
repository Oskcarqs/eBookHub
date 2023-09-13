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
    fotoLibro longblob,
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
    nickNameUsuario varchar(50) not null,
    emailUsuario varchar(70) not null,
    passwordUsuario varchar(50) not null,
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
insert into sucursal(nombreSucursal,direccionSucursal,telefonoSucursal)values('central','ciudad de Guatemala','23154689');

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
	imgEmpleado longblob,

    idSucursal int not null,
    primary key PK_idEmpleado (idEmpleado),
    constraint FK_Empleado_Sucursal foreign key (idSucursal)
		references Sucursal (idSucursal) on delete cascade on update cascade
);

Create table Factura (
	idFactura int not null auto_increment,
    numeroSerie varchar(55) not null,
    fechaEmision date not null,
    horaEmision time not null,
    montoFactura decimal(10,2) not null,
    estado varchar(1) not null,
    idCliente int not null,
    idSucursal int not null,
    primary key PK_idFactura (idFactura),    
	constraint FK_Factura_Cliente foreign key (idCliente)
		references Cliente (idCliente) on delete cascade on update cascade,
	constraint FK_Factura_Sucursal foreign key (idSucursal)
		references Sucursal (idSucursal) on delete cascade on update cascade
);

Create table DetalleFactura (
	idDetalleFactura int not null auto_increment,
    cantidad int not null,
	totalFactura double not null,
    idFactura int not null,
    idLibro int not null,
    primary key PK_idDetalleFactura (idDetalleFactura),
    constraint FK_DetalleFactura_Factura foreign key (idFactura)
		references Factura (idFactura) on delete cascade on update cascade,
	constraint FK_DetalleFactura_Libro foreign key (idLibro)
		references Libro (idLibro) on delete cascade on update cascade
);

-- ------------------- TUPLAS ------------------- --
/* AUTOR */
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

/* EDITORIAL */
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

/* CATEGORIA */
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

Select * from Categoria;

/* CLIENTE */
insert into Cliente (nombreCliente, apellidoCliente, fechaDeNacimientoCliente, direccionCliente, telefonoCliente, nickNameUsuario, emailUsuario, passwordUsuario, imgCliente) value('pedro', 'medina', '2023-06-11', 'villa nueva', '12345678', 'pmedina', 'pmedina@kinal.edu.gt', '123', ' ');
insert into Cliente (nombreCliente, apellidoCliente, fechaDeNacimientoCliente, direccionCliente, telefonoCliente, nickNameUsuario, emailUsuario, passwordUsuario, imgCliente) value('emilio', 'de paz', '2021-01-12', 'villa canales', '12345671', 'edepaz' ,'edepaz@kinal.edu.gt', '123', ' ');
insert into Cliente (nombreCliente, apellidoCliente, fechaDeNacimientoCliente, direccionCliente, telefonoCliente, nickNameUsuario, emailUsuario, passwordUsuario, imgCliente) value('oscar', 'morales', '2023-06-11', 'villa nueva', '12345678', 'pmedina', 'pmedina@kinal.edu.gt', '123', ' ');
insert into Cliente (nombreCliente, apellidoCliente, fechaDeNacimientoCliente, direccionCliente, telefonoCliente, nickNameUsuario, emailUsuario, passwordUsuario, imgCliente) value('otoniel ', 'menendez', '2023-06-11', 'villa nueva', '12345678', 'pmedina', 'pmedina@kinal.edu.gt', '123', ' ');
insert into Cliente (nombreCliente, apellidoCliente, fechaDeNacimientoCliente, direccionCliente, telefonoCliente, nickNameUsuario, emailUsuario, passwordUsuario, imgCliente) value('jorge', 'revolorio', '2023-06-11', 'villa nueva', '12345678', 'pmedina', 'pmedina@kinal.edu.gt', '123', ' ');

/* LIBRO */
Insert into Libro (fotoLibro, tituloLibro, descripcionLibro, fechaDePublicacion, idiomaLibro, costoLibro, tipoLibro, stockLibro, idAutor, idEditorial, idCategoria) 
	values (load_file('C:\\ProgramData\\MySQL\\MySQL Server 8.0\\Uploads\\RimasyLeyendas.png'), 
    'Rimas y Leyendas', ' Una recopilación de poesía romántica que incluye sus famosas rimas y cuentos de terror.', '1871-10-05', 'Español', 215.00, 'Digital', 10, 10, 1, 6);
Insert into Libro (fotoLibro, tituloLibro, descripcionLibro, fechaDePublicacion, idiomaLibro, costoLibro, tipoLibro, stockLibro, idAutor, idEditorial, idCategoria) 
	values (load_file('C:\\ProgramData\\MySQL\\MySQL Server 8.0\\Uploads\\YourName.png'), 
    'Your Name', 'Una novela que narra una historia de amor y conexión entre dos adolescentes que intercambian cuerpos y viven en diferentes momentos en el tiempo.', '2016-04-01', 'Japonés', 63.00, 57, 1, 9, 2, 1);
Insert into Libro (fotoLibro, tituloLibro, descripcionLibro, fechaDePublicacion, idiomaLibro, costoLibro, tipoLibro, stockLibro, idAutor, idEditorial, idCategoria) 
	values (load_file('C:\\ProgramData\\MySQL\\MySQL Server 8.0\\Uploads\\Azul.png'), 
    'Azul', 'Un libro de poesía modernista que contiene una colección de poemas líricos y simbolistas, considerado uno de los hitos en la literatura hispanoamericana.', '1888-06-20', 'Español', 46.00, 90, 1, 8, 3, 6);  
Insert into Libro (fotoLibro, tituloLibro, descripcionLibro, fechaDePublicacion, idiomaLibro, costoLibro, tipoLibro, stockLibro, idAutor, idEditorial, idCategoria) 
	values (load_file('C:\\ProgramData\\MySQL\\MySQL Server 8.0\\Uploads\\Desolacion.png'), 
    'Desolación', 'Una compilación de poemas que abordan temas como el amor, la maternidad, la soledad y la desesperanza, escritos con una prosa lírica y melancólica.', '1922-04-08' ,'Español', 81.00, 90, 2, 7, 4, 6);
Insert into Libro (fotoLibro, tituloLibro, descripcionLibro, fechaDePublicacion, idiomaLibro, costoLibro, tipoLibro, stockLibro, idAutor, idEditorial, idCategoria) 
	values (load_file('C:\\ProgramData\\MySQL\\MySQL Server 8.0\\Uploads\\Rayuela.png'), 
    'Rayuela', 'Una novela experimental que ofrece múltiples formas de lectura. Los lectores pueden elegir diferentes órdenes para leer los capítulos y explorar distintas narrativas.','1963-01-25', 'Español', 47.99, 110, 1, 6, 5, 3);
 Insert into Libro (fotoLibro, tituloLibro, descripcionLibro, fechaDePublicacion, idiomaLibro, costoLibro, tipoLibro, stockLibro, idAutor, idEditorial, idCategoria) 
 	values (load_file('C:\\ProgramData\\MySQL\\MySQL Server 8.0\\Uploads\\Cien.png'), 
     'Cien años de soledad', ' Una obra maestra del realismo mágico que narra la historia de la familia Buendía a lo largo de varias generaciones en el pueblo ficticio de Macondo.','1967-05-10','Español', 8.00, 63, 3, 1, 6, 8);
Insert into Libro (fotoLibro, tituloLibro, descripcionLibro, fechaDePublicacion, idiomaLibro, costoLibro, tipoLibro, stockLibro, idAutor, idEditorial, idCategoria) 
	values (load_file('C:\\ProgramData\\MySQL\\MySQL Server 8.0\\Uploads\\OnePiece.png'), 
    'One Piece', 'Una exitosa serie de manga y anime que sigue las aventuras de Monkey D. Luffy y su tripulación en busca del tesoro más grande del mundo, el One Piece.','1997-07-26','Japonés', 26.99, 59, 2, 3, 7, 4);
Insert into Libro (fotoLibro, tituloLibro, descripcionLibro, fechaDePublicacion, idiomaLibro, costoLibro, tipoLibro, stockLibro, idAutor, idEditorial, idCategoria) 
	values (load_file('C:\\ProgramData\\MySQL\\MySQL Server 8.0\\Uploads\\HarryPotter.png'), 
    'Harry Potter y la piedra filosofal', ' El primer libro de la serie "Harry Potter", que introduce al joven mago Harry Potter y su entrada al mundo mágico de Hogwarts.','1997-04-26', 'Inglés', 15.00, 85, 3, 2, 8, 2);
Insert into Libro (fotoLibro, tituloLibro, descripcionLibro, fechaDePublicacion, idiomaLibro, costoLibro, tipoLibro, stockLibro, idAutor, idEditorial, idCategoria) 
	values (load_file('C:\\ProgramData\\MySQL\\MySQL Server 8.0\\Uploads\\1Q84.png'), 
    '1Q84', 'Una novela surrealista que combina elementos de misterio, fantasía y romance. La historia sigue a dos personajes y su conexión en un mundo alternativo.', '2009-10-05', 'Inglés', 32.99, 78, 2, 4, 9, 3);
 Insert into Libro (fotoLibro, tituloLibro, descripcionLibro, fechaDePublicacion, idiomaLibro, costoLibro, tipoLibro, stockLibro, idAutor, idEditorial, idCategoria) 
 	values (load_file('C:\\ProgramData\\MySQL\\MySQL Server 8.0\\Uploads\\LaCasa.png'), 
     'La casa de los espíritus',' Una novela que abarca varias generaciones de la familia Trueba y muestra la historia de Chile a través de los ojos de sus personajes.', '1982-12-25', 'Español', 20.00, 69, 3, 5, 10, 5);   



-- ------------------- CONSULTAS ------------------- --
SELECT * FROM Libro l 
	INNER JOIN Categoria c ON l.idCategoria = c.idCategoria 
    WHERE c.idCategoria = 10;
update libro set stockLibro =1000;

SELECT 
    F.idFactura,
    F.numeroSerie,
    F.fechaEmision,
    F.horaEmision,
    F.montoFactura,
    F.estado,
    F.idCliente,
    F.idSucursal,
    DF.idDetalleFactura,
    DF.cantidad,
    DF.totalFactura,
    DF.idLibro
FROM Factura F
INNER JOIN DetalleFactura DF ON F.idFactura = DF.idFactura;

select * from Factura;
select * from DetalleFactura;

Select max(idFactura) from Factura