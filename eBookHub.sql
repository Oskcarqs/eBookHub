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

-- Oscar Morales--
Create table TipoLibro (
	idTipoLibro int not null auto_increment,
    nombreTipoLibro varchar(35) not null,
    descripcionTipoLibro varchar(250) not null,
    primary key PK_idTipoLibro (idTipoLibro)
);

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

-- Zendher Ottoniel --
Create table Libro ( 
	idLibro int not null auto_increment,
	tituloLibro varchar(100) not null,
    descripcionLibro varchar(250) not null,
    fechaDePublicacion date not null,
    idiomaLibro varchar(30) not null,
    costoLibro decimal(10,2) not null,
    stockLibro int not null,
    idTipoLibro int not null,
    idAutor int not null,
    idEditorial int not null,
    idCategoria int not null,
    primary	key PK_idLibro (idLibro),
    constraint FK_Libro_TipoLibro foreign key (idTipoLibro)
		references TipoLibro (idTipoLibro),
	constraint FK_Libro_Autor foreign key (idAutor)
		references Autor (idAutor),
	constraint FK_Libro_Editorial foreign key (idEditorial)
		references Editorial (idEditorial),
	constraint FK_Libro_Categoria foreign key (idCategoria)
		references Categoria (idCategoria)
);

-- Pedro Medina --
Create table Cliente (
	idCliente int not null auto_increment,
    nombreCliente varchar(35) not null,
    apellidoCliente varchar(35) not null,
    fechaDeNacimientoCliente date not null,
    direccionCliente varchar(75) not null,
    telefonoCliente varchar(10) not null,
    primary key PK_idCliente (idCliente)
);

-- Angel Reyes --
create table Usuario(
	idUsuario int not null auto_increment,
    nickNameUsuario varchar(50) not null,
    emailUsuario varchar(70) not null,
    passwordUsuario varchar(50) not null,
    idCliente int not null,
    primary key PK_idUsuario (idUsuario),
    constraint FK_Usuario_Cliente foreign key (idCliente)
		references Cliente (idCliente)  on delete cascade
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
    idUsuario int not null,    
    primary key PK_idServicio (idServicio),
    constraint FK_Servicio_TipoServicio foreign key (idTipoServicio)
		references TipoServicio (idTipoServicio),
    constraint FK_Servicio_Libro foreign key (idLibro)
		references Libro (idLibro),
	constraint FK_Servicio_Usuario foreign key (idUsuario)
		references Usuario (idUsuario)
);

-- Edson Pereira --
Create table Sucursal(
	idSucursal int not null auto_increment,
	nombreSucursal varchar(35) not null, 
	direccionSucursal varchar(75) not null,
	telefonoSucursal varchar(10) not null,
	primary key PK_idSucursal (idSucursal)
);

-- Evan Ramirez -- 
Create table Factura (
	idFactura int not null auto_increment,
    fechaEmision date not null,
    horaEmision time not null,
    totalFactura decimal(10,2) not null,
    idSucursal int not null,
    idUsuario int not null,
    primary key PK_idFactura (idFactura),    
    constraint FK_Factura_Sucursal foreign key (idSucursal)
		references Sucursal (idSucursal)  on delete cascade,      
	constraint FK_Factura_Usuario foreign key (idUsuario)
		references Usuario (idUsuario) on delete cascade
);

Create table DetalleFactura (
	idDetalleFactura int not null auto_increment,
    idFactura int not null,
    idServicio int not null,
    primary key PK_idDetalleFactura (idDetalleFactura),
    constraint FK_DetalleFactura_Factura foreign key (idFactura)
		references Factura (idFactura) on delete cascade,
	constraint FK_DetalleFactura_Servicio foreign key (idServicio)
		references Servicio (idServicio) on delete cascade
);

-- Brandon Mendoza -- 
Create table TipoSuscripcion(
	idTipoSuscripcion int not null auto_increment,
    nombreTipoSuscripcion varchar(35) not null,
    descripcionTipoSuscripcion varchar(250) not null,
    precioTipoSuscripcion decimal(10,2) not null,
    primary key PK_idTipoSuscripcion (idTipoSuscripcion)
);

-- Derick Sanchez --
Create table FacturaSuscripcion(
	idFacturaSuscripcion int not null auto_increment,
    fechaDeInicio date not null,
	fechaDeVencimiento date not null,
	idTipoSuscripcion int null null,
    idUsuario int not null,
    primary key PK_idFacturasuscripcion (idFacturasuscripcion),
    constraint FK_Suscripcion_TipoSuscripcion foreign key (idTipoSuscripcion) 
		references TipoSuscripcion (idTipoSuscripcion)  on delete cascade,
    constraint FK_Suscripcion_Usuario foreign key (idUsuario) 
		references Usuario (idUsuario)  on delete cascade
);


    
    select * from FacturaSuscripcion;

-- Jorge Revolorio -- 
Create table Empleado(
	idEmpleado int auto_increment not null,
    nombreEmpleado varchar(35) not null,
    apellidoEmpleado varchar(35) not null,
    puestoEmpleado varchar(35) not null,
    idSucursal int not null,
    primary key PK_idEmpleado (idEmpleado),
    constraint FK_Empleado_Sucursal foreign key (idSucursal)
		references Sucursal (idSucursal)
);


-- ------------------------ PROCEDIMIENTOS ALMACENADOS ------------------ --

/* ENTIDAD TIPO LIBRO */
-- Agregar TipoLibro --
Delimiter $$
	Create procedure sp_AgregarTipoLibro(in nombreTipoLibro varchar(35), in descripcionTipoLibro varchar(250))
		Begin
			Insert into TipoLibro(nombreTipoLibro, descripcionTipoLibro)
				values (nombreTipoLibro, descripcionTipoLibro);
        end $$
Delimiter ;

call sp_AgregarTipoLibro('Libro físico', 'Libro en formato impreso, generalmente de pasta dura o blanda.');
call sp_AgregarTipoLibro('Libro digital', 'Libro en formato electrónico que se puede leer en dispositivos electrónicos.');
call sp_AgregarTipoLibro('Audiolibro', 'Versión grabada de un libro, narrada y grabada en audio para ser escuchada.');

-- Listar tipolibro --
Delimiter $$
	Create procedure sp_ListarTipoLibros()
		Begin
			Select 
				tl.idTipoLibro,
				tl.nombreTipoLibro, 
                tl.descripcionTipoLibro
			from TipoLibro tl;
        end $$
Delimiter ;

call sp_ListarTipoLibros();

-- Editar TipoLibro --
Delimiter $$
	Create procedure sp_EditarTipoLibro(in idTipoLib int, in nombreTipoLib varchar(35), in descripcionTipoLib varchar(250))
		Begin
			Update TipoLibro tl
				set tl.nombreTipoLibro = nombreTipoLib,
					tl.descripcionTipoLibro = descripcionTipoLib
				where tl.idTipoLibro = idTipoLib;
        end $$
Delimiter ;

-- call sp_EditarTipoLibro(1, ' ', ' ');

-- Eliminar TipoLibro --
Delimiter $$
	Create procedure sp_EliminarTipoLibro(in idTipoLib int)
		Begin
			Delete from TipoLibro
				where idTipoLibro = idTipoLib;
        end $$
Delimiter ;

-- call sp_EliminarTipoLibro(1);

-- Buscar TipoLibro --
Delimiter $$
	Create procedure sp_BuscarTipoLibro(in idTipoLib int)
		Begin
			Select 
				tl.idTipoLibro,
				tl.nombreTipoLibro, 
                tl.descripcionTipoLibro
			from TipoLibro tl
				where tl.idTipoLibro = idTipoLib;
        end $$
Delimiter ;

call sp_BuscarTipoLibro(1);
-- ------------------------------------------------------------------------------------------------------- --

/* ENTIDAD AUTOR */
-- Agregar AUTOR --
Delimiter $$
	Create procedure sp_AgregarAutor(in nombreAutor varchar(35), in apellidoAutor varchar(35), in nacionalidadAutor varchar(35), in fechaNacimientoAutor date, in biografiaAutor varchar(250))
		Begin
			Insert into Autor(nombreAutor, apellidoAutor, nacionalidadAutor, fechaNacimientoAutor, biografiaAutor)
				values (nombreAutor, apellidoAutor, nacionalidadAutor, fechaNacimientoAutor, biografiaAutor);
        End $$
Delimiter ;

call sp_AgregarAutor('Gabriel', 'García Márquez', 'Colombiano', '1927-03-06', 'Escritor colombiano ganador del Premio Nobel de Literatura en 1982.');
call sp_AgregarAutor('J.K.', 'Rowling', 'Británica', '1965-07-31', 'Autora de la serie de libros de Harry Potter, una de las sagas más exitosas en la historia de la literatura.');
call sp_AgregarAutor('Eiichiro', 'Oda', 'Japonés', '1975-01-01', 'Autor del manga y anime "One Piece", uno de los mangas más exitosos y longevos de la historia.');
call sp_AgregarAutor('Haruki', 'Murakami', 'Japonés', '1949-01-12', 'Autor de novelas aclamadas internacionalmente, conocido por su estilo único y sus temas surrealistas.');
call sp_AgregarAutor('Isabel', 'Allende', 'Chilena', '1942-08-02', 'Destacada autora chilena, reconocida por novelas como "La casa de los espíritus" y "Paula".');
CALL sp_AgregarAutor('Julio', 'Cortázar', 'Argentino', '1914-08-26', 'Escritor argentino conocido por sus obras de narrativa y su estilo innovador.');
call sp_AgregarAutor('Gabriela', 'Mistral', 'Chilena', '1889-04-07', 'Poeta chilena y ganadora del Premio Nobel de Literatura en 1945, reconocida por su poesía lírica y comprometida.');
call sp_AgregarAutor('Rubén', 'Darío', 'Nicaragüense', '1867-01-18', 'Poeta nicaragüense, considerado uno de los máximos representantes del modernismo literario en Hispanoamérica.');
call sp_AgregarAutor('Makoto', 'Shinkai', 'Japonés', '1973-02-09', 'Director y guionista de anime japonés, conocido por películas como "Your Name" y "Weathering with You".');
call sp_AgregarAutor('Gustavo', 'Adolfo Bécquer', 'Español', '1836-02-17', 'Poeta y escritor español, conocido por sus Leyendas y Rimas, considerado uno de los máximos exponentes del romanticismo en España.');

-- Listar autores --
Delimiter $$
	Create procedure sp_ListarAutores()
		Begin
			Select
				a.idAutor, 
                a.nombreAutor, 
                a.apellidoAutor, 
                a.nacionalidadAutor, 
                a.fechaNacimientoAutor, 
                a.biografiaAutor
			from Autor a;
        end $$
Delimiter ;

call sp_ListarAutores();

-- Editar Autor --
Delimiter $$
	Create procedure sp_EditarAutor(in idAut int ,in nombreAut varchar(35), in apellidoAut varchar(35), in nacdAut varchar(35), in fechaDeNacAut date, in bioAut varchar(250))
		Begin
			Update Autor a
				set a.nombreAutor = nombreAut,
					a.apellidoAutor = apellidoAut,
                    a.nacionalidadAutor = nacdAut,
					a.fechaNacimientoAutor = fechaDeNacAut,
                    a.biografiaAutor = bioAut
				where a.idAutor = idAut;
        end $$
Delimiter ;

-- call sp_EditarAutor(1, ' ', ' ', ' ', '1836-02-17',' ' );


-- Eliminar Autor --
Delimiter $$
	Create procedure sp_EliminarAutor(in idAut int)
		Begin
			Delete from Autor
				where idAutor = idAut;
		end $$
Delimiter ;

-- call sp_EliminarAutor(1);

-- Buscar Autor --
Delimiter $$
	Create procedure sp_BuscarAutor(in idAut int)
		Begin
			Select
				a.idAutor, 
                a.nombreAutor, 
                a.apellidoAutor, 
                a.nacionalidadAutor, 
                a.fechaNacimientoAutor, 
                a.biografiaAutor
			from Autor a
				where idAutor = idAut;
        end $$
Delimiter ;

call sp_BuscarAutor(2);

-- ------------------------------------------------------------------------------------------------------- --

/* ENTIDAD EDITORIAL */
-- Agregar Editorial --
Delimiter $$
	Create procedure sp_AgregarEditorial(in nombreEditorial varchar(35), in descripcionEditorial varchar(250))
		Begin
			Insert into Editorial(nombreEditorial, descripcionEditorial)
				values (nombreEditorial, descripcionEditorial);
        end $$
Delimiter ;

CALL sp_AgregarEditorial('Penguin Random House', 'Editorial líder a nivel mundial, con una amplia gama de géneros literarios.');
CALL sp_AgregarEditorial('HarperCollins Publishers', 'Editorial global con un catálogo diverso que abarca diferentes géneros literarios.');
CALL sp_AgregarEditorial('Hachette Livre', 'Editorial francesa con presencia internacional y una amplia variedad de títulos.');
CALL sp_AgregarEditorial('Simon & Schuster', 'Editorial estadounidense conocida por publicar obras de ficción y no ficción.');
CALL sp_AgregarEditorial('Grupo Planeta', 'Editorial española con una amplia variedad de sellos editoriales y géneros literarios.');
CALL sp_AgregarEditorial('Ediciones SM', 'Editorial especializada en publicaciones educativas y literatura infantil y juvenil.');
CALL sp_AgregarEditorial('Editorial Anagrama', 'Editorial española reconocida por su selección de obras de narrativa contemporánea.');
CALL sp_AgregarEditorial('Editorial Alfaguara', 'Editorial con un catálogo variado que incluye clásicos y autores contemporáneos.');
CALL sp_AgregarEditorial('Ediciones Siruela', 'Editorial española enfocada en la publicación de obras de calidad y alto valor literario.');
CALL sp_AgregarEditorial('Random House Mondadori', 'Editorial que fusiona el catálogo de Penguin Random House y Grupo Mondadori en países de habla hispana.');

-- Listar editoriales --
Delimiter $$
	Create procedure sp_ListarEditoriales()
		Begin
			Select
				e.idEditorial,
				e.nombreEditorial,
                e.descripcionEditorial
			from Editorial e;
        end $$
Delimiter ;

call sp_ListarEditoriales();

-- Editar editorial --
Delimiter $$
	Create procedure sp_EditarEditorial(in idEdit int, in nombEdit varchar(35), in descripEdit varchar(250))
		Begin
			Update Editorial e
				set e.nombreEditorial = nombEdit,
					e.descripcionEditorial = descripEdit
				where e.idEditorial = idEdit;
        end $$
Delimiter ;

-- call  sp_EditarEditorial(1,' ', ' ');


-- Eliminar editorial --
Delimiter $$
	Create procedure sp_EliminarEditorial(in idEdit int)
		Begin
			Delete from Editorial
				where idEditorial = idEdit;
		end $$
Delimiter ;

-- call sp_EliminarEditorial(1);

-- Buscar Editorial --
Delimiter $$
	Create procedure sp_BuscarEditorial(in idEdit int)
		Begin
			Select
				e.idEditorial,
				e.nombreEditorial,
                e.descripcionEditorial
			from Editorial e
				where e.idEditorial = idEdit;
        end $$
Delimiter ;

call sp_BuscarEditorial(1);

-- ------------------------------------------------------------------------------------------------------- --

/* ENTIDAD CATEGORÍA */
-- Agregar Categoría --
Delimiter $$
	Create procedure sp_AgregarCategoria(in nombreCategoria varchar(35), in descripcionCategoria varchar(250))
		Begin
			Insert into Categoria(nombreCategoria, descripcionCategoria)
				values(nombreCategoria, descripcionCategoria);
        end $$
Delimiter ;

call sp_AgregarCategoria('Manga', 'Género de historietas o cómics japoneses, caracterizado por su estilo visual distintivo.');
call sp_AgregarCategoria('Cómic', 'Obra de narrativa gráfica que combina ilustraciones y texto para contar una historia.');
call sp_AgregarCategoria('Novela', 'Género literario de ficción narrativa');
call sp_AgregarCategoria('Ciencia Ficción', 'Género que combina ciencia y elementos ficticios');
call sp_AgregarCategoria('Historia', 'Registro y análisis de eventos pasados');
call sp_AgregarCategoria('Poesía', 'Expresión artística mediante la escritura en verso');
call sp_AgregarCategoria('Drama', 'Género teatral con conflictos y emociones intensas');
call sp_AgregarCategoria('Fantasía', 'Género que involucra elementos mágicos e imaginarios');
call sp_AgregarCategoria('Ensayo', 'Reflexión y análisis sobre un tema específico');
call sp_AgregarCategoria('Infantil', 'Dirigido a niños y enfocado en su entretenimiento y aprendizaje');

-- Listar Categorias --
Delimiter $$
	Create procedure sp_ListarCategorias()
		Begin
			Select
				c.idCategoria, 
				c.nombreCategoria, 
				c.descripcionCategoria
			from Categoria c;
        end $$
Delimiter ;

call sp_ListarCategorias();

-- Editar Categoria --
Delimiter $$
	Create procedure sp_EditarCategoria(in idCat int, in nombCat varchar(35), in descripCat varchar(250))
		Begin
			Update Categoria c
				set c.nombreCategoria = nombCat,
					c.descripcionCategoria = descripCat
				where c.idCategoria = idCat;
        end $$
Delimiter ;

-- call sp_EditarCategoria(1, '', '');

-- Eliminar Categoria --
Delimiter $$
	Create procedure sp_EliminarCategoria(in idCat int)
		Begin
			Delete from Categoria
				where idCategoria = idCat;
        end $$
Delimiter ;

-- call sp_EliminarCategoria(2);

-- Buscar Categoria -- 

Delimiter $$
	Create procedure sp_BuscarCategoria(in idCat int)
		Begin
			Select
				c.idCategoria, 
				c.nombreCategoria, 
				c.descripcionCategoria
			from Categoria C
				where c.idCategoria = idCat;
        end $$
Delimiter ;

call sp_BuscarCategoria(3);

-- ------------------------------------------------------------------------------------------------------- --

/* ENTIDAD LIBRO */
-- Agregar libro --
Delimiter $$
	Create procedure sp_AgregarLibro(in tituloLibro varchar(100), in descripcionLibro varchar(250), in fechaDePublicacion date,
									 in idiomaLibro varchar(30), in costoLibro decimal(10,2), in stockLibro int, in idTipoLibro int, in idAutor int, in idEditorial int, in idCategoria  int)
		Begin
			insert into Libro (tituloLibro, descripcionLibro, fechaDePublicacion, idiomaLibro, costoLibro, stockLibro, idTipoLibro, idAutor, idEditorial, idCategoria)
					values (tituloLibro, descripcionLibro, fechaDePublicacion, idiomaLibro, costoLibro, stockLibro, idTipoLibro, idAutor,idEditorial, idCategoria);
		end $$
Delimiter ;

call sp_AgregarLibro('Rimas y Leyendas', ' Una recopilación de poesía romántica que incluye sus famosas rimas y cuentos de terror.', '1871-10-05', 
					'Español', 215.00, 80, 1, 10, 1, 6);
call sp_AgregarLibro('Your Name', 'Una novela que narra una historia de amor y conexión entre dos adolescentes que intercambian cuerpos 
					 y viven en diferentes momentos en el tiempo.', '2016-04-01', 'Japonés', 63.00,57, 1,9,2,1);  
call sp_AgregarLibro('Azul', 'Un libro de poesía modernista que contiene una colección de poemas líricos y simbolistas, 
					considerado uno de los hitos en la literatura hispanoamericana.', '1888-06-20', 'Español', 46.00,90, 1,8,3,6);  
call sp_AgregarLibro('Desolación', 'Una compilación de poemas que abordan temas como el amor, la maternidad, la soledad y la desesperanza,
					escritos con una prosa lírica y melancólica.', '1922-04-08' ,'Español', 81.00,90, 2,7,4,6);
call sp_AgregarLibro('Rayuela', 'Una novela experimental que ofrece múltiples formas de lectura. 
					Los lectores pueden elegir diferentes órdenes para leer los capítulos y explorar distintas narrativas.','1963-01-25', 'Español', 47.99,110, 1,6,5,1);
call sp_AgregarLibro('Cien años de soledad', ' Una obra maestra del realismo mágico que narra la historia de la familia Buendía a lo largo de varias generaciones
					en el pueblo ficticio de Macondo.','1967-05-10','Español', 8.00,63,3,1,6,1);
call sp_AgregarLibro('One Piece', 'Una exitosa serie de manga y anime que sigue las aventuras de Monkey D. Luffy y su tripulación en busca del tesoro más grande del mundo,
					el One Piece.','1997-07-26','Japonés', 26.99,59,2,3,7,4);
call sp_AgregarLibro('Harry Potter y la piedra filosofal', ' El primer libro de la serie "Harry Potter", que introduce al joven mago Harry Potter y su entrada 
					al mundo mágico de Hogwarts.','1997-04-26', 'Inglés', 15.00,85,3,2,8,2);
call sp_AgregarLibro('1Q84', 'Una novela surrealista que combina elementos de misterio, fantasía y romance. La historia sigue a dos personajes y su conexión 
					en un mundo alternativo.', '2009-10-05', 'Inglés',32.99,78,2,4,9,1);
call sp_AgregarLibro('La casa de los espíritus',' Una novela que abarca varias generaciones de la familia Trueba y muestra la historia de Chile a través de los ojos
					de sus personajes.', '1982-12-25', 'Español', 20.00,69, 3,5,10,1);   

-- Listar libros -- 
Delimiter $$
	Create procedure sp_ListarLibros()
		Begin
			Select 
				l.idLibro,
				l.tituloLibro,
				l.descripcionLibro,
				l.fechaDePublicacion,
				l.idiomaLibro,
				l.costoLibro,
                l.stockLibro,
				l.idTipoLibro,
				l.idAutor,
				l.idEditorial,
				l.idCategoria
			from Libro l;
        end$$
Delimiter ;

Call sp_ListarLibros();

-- Editar libro -- 
Delimiter $$
	Create procedure sp_EditarLibro(in idLibro int, in tituloLibro varchar(100), in descripcionLibro varchar(250), in fechaDePublicacion date,
									in idiomaLibro varchar(30), in costoLibro decimal(10,2), in stockLibro int, in idTipoLibro int, in idAutor int, in idEditorial int, in idCategoria  int)
		Begin
			Update Libro l
				set l.idLibro = idLibro, 
					l.tituloLibro = tituloLibro, 
					l.descripcionLibro = descripcionLibro, 
					l.fechaDePublicacion = fechaDePublicacion,
					l.idiomaLibro = idiomaLibro, 
					l.costoLibro = costoLibro, 
                    l.stockLibro = stockLibro,	
					l.idTipoLibro = idTipoLibro, 
					l.idAutor = idAutor, 
					l.idEditorial = idEditorial,
					l.idCategoria = idCategoria 
				where l.idLibro = idLibro;		
		end$$
Delimiter ;

-- Eliminar libro -- 
Delimiter $$
	Create procedure sp_EliminarLibro(in id int)
		Begin
			delete from Libro
			where idLibro = id;
		end$$
Delimiter ;

-- Buscar libro --
Delimiter $$
	create procedure sp_BuscarLibro(in id int)
		Begin
			Select 
				l.idLibro,
				l.tituloLibro,
				l.descripcionLibro,
				l.fechaDePublicacion,
				l.idiomaLibro,
				l.costoLibro,
                l.stockLibro,
				l.idTipoLibro,
				l.idAutor,
				l.idEditorial,
				l.idCategoria
			from Libro l where l.idLibro = id;
        end$$
Delimiter ;

-- ----------------------------------------------------------------------------------------------------- --

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

-- ---------------------------------------------------------------------------------------------------------- --

/* ENTIDAD USUARIO */
-- Agregar usuario --
Delimiter $$
	create procedure sp_AgregarUsuario(in nickNameUsuario varchar(50), in emailUsuario varchar(70), in passwordUsuario varchar(50), in idCliente int)
		begin
			insert into Usuario(idUsuario, nickNameUsuario, emailUsuario, passwordUsuario, idCliente)
				values (idUsuario, nickNameUsuario, emailUsuario, passwordUsuario, idCliente);
        end$$
Delimiter ;

call sp_AgregarUsuario('Alice','alice@gmail.com','p@ssw0rd','1');
call sp_AgregarUsuario('Bob','bob@gmail.com','512412faaw','2');
call sp_AgregarUsuario('eveeee','eve@gmail.com','31afwl','3');
call sp_AgregarUsuario('John', 'john@gmail.com', 'password123', '4');
call sp_AgregarUsuario('Sarah', 'sarah@gmail.com', 'secretpass', '5');
call sp_AgregarUsuario('Michael', 'michael@gmail.com', 'mypass123', '6');
call sp_AgregarUsuario('Emily', 'emily@gmail.com', 'pass1234', '7');
call sp_AgregarUsuario('Juan', 'juan@gmail.com', 'qwer', '8');
call sp_AgregarUsuario('Oscar', 'oscar@gmail.com', 'sdfg', '9');
call sp_AgregarUsuario('Totto', 'totto@gmail.com', 'asdf', '10');

-- Listar usuarios --
Delimiter $$
Create procedure sp_ListarUsuarios()
	Begin
		Select
			U.idUsuario,
            U.nickNameUsuario,
            U.emailUsuario,
            U.passwordUsuario,
            U.idCliente
		From Usuario U;
    End$$
Delimiter ;

call sp_ListarUsuarios();

-- Editar usuario --
Delimiter $$
Create procedure sp_EditarUsuario(in idUsuario int, in nickNameUsuario varchar(50), in emailUsuario varchar(70), in passwordUsuario varchar(50), in idCliente int)
	Begin
		Update Usuario U 
			set U.idUsuario = idUsuario,
				U.nickNameUsuario = nickNameUsuario, 
				U.emailUsuario = emailUsuario,
                U.passwordUsuario = passwordUsuario,
                U.idCliente = idCliente
			where  U.idUsuario = idUsuario;
	End $$
Delimiter ;

call sp_EditarUsuario(1, 'Roberto', 'robert@gmail.com', '2414124', 1);

-- Eliminar usuario -- 
Delimiter $$
Create procedure sp_EliminarUsuario(in idUsua int)
	Begin
		Delete from Usuario
			where idUsuario = idUsua;
	End $$
Delimiter ;

-- call sp_EliminarUsuario(1);

-- Buscar usuario --
Delimiter $$
Create procedure sp_BuscarUsuario(in idUsua int)
	Begin
		Select
			U.idUsuario,
            U.nickNameUsuario,
            U.emailUsuario,
            U.passwordUsuario,
            U.idCliente
		From Usuario U where U.idUsuario = idUsua;
    End$$
Delimiter ;

call sp_BuscarUsuario(2);


-- ------------------------------------------------------------------------------------------------------- --

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

-- ------------------------------------------------------------------------------------------------------- --

/* ENTIDAD TipoServicio */
-- Agregar TipoServicio --
Delimiter $$
	create procedure sp_AgregarTipoServicio(in nombreTipoServicio varchar(35))
		Begin
			Insert into TipoServicio(nombreTipoServicio)
            values(nombreTipoServicio);
        End$$
Delimiter ;

Call sp_AgregarTipoServicio('Compra');
Call sp_AgregarTipoServicio('Renta');

-- Listar TipoServicio --
Delimiter $$
	create procedure sp_ListarTipoServicios()
		Begin
			Select
				t.idTipoServicio,
				t.nombreTipoServicio
            from TipoServicio t;
        End$$
Delimiter ;

-- Buscar TipoServicio --
Delimiter $$
	create procedure sp_BuscarTipoServicio(in id int)
		Begin
			Select
				t.idTipoServicio,
				t.nombreTipoServicio
            from TipoServicio t where  t.idTipoServicio = id;
        End$$
Delimiter ;

-- ------------------------------------------------------------------------------------------------------- --

/* ENTIDAD Servicio */
-- Agregar servicio --
Delimiter $$
	Create procedure sp_AgregarServicio(in costoServicio decimal(10,2), in fechaServicio date, in fechaVencimientoServicio date, in idTipoServicio int, in idLibro int, in idUsuario int)
		Begin
			Insert into Servicio (costoServicio, fechaServicio, fechaVencimientoServicio, idTipoServicio, idLibro, idUsuario)
				values (costoServicio, fechaServicio, fechaVencimientoServicio, idTipoServicio, idLibro, idUsuario);
        End$$
Delimiter ;

call sp_AgregarServicio(215.00, '2022-02-22', '2022-03-22', 1, 1, 1);
call sp_AgregarServicio(63.00, '2023-08-15', '2032-09-15', 1, 2, 1);
call sp_AgregarServicio(46.00, '2023-02-22', '2022-03-22', 1, 3, 1);
call sp_AgregarServicio(81.00, '2021-01-26', '2021-02-26', 2, 4, 2);
call sp_AgregarServicio(47.99, '2020-02-22', '2020-03-22', 2, 5, 2);
call sp_AgregarServicio(8.00, '2022-12-24', '2023-01-24', 2, 6, 2);
call sp_AgregarServicio(26.99, '2019-10-20', '2019-11-20', 1, 7, 3);
call sp_AgregarServicio(15.00, '2020-03-20', '2020-04-20', 1, 8, 3);
call sp_AgregarServicio(32.99, '2021-09-20', '2021-10-20', 2, 9, 4);
call sp_AgregarServicio(20.00, '2023-10-25', '2023-10-25', 2, 10, 5);


-- Listar Servicio --
Delimiter $$
	Create procedure sp_ListarServicios()
		Begin
			Select * from Servicio;
		End $$
Delimiter ;

call sp_ListarServicios();


-- Editar Servicio --
Delimiter $$
	Create procedure sp_EditarServicio (in idServ int, in costoServ decimal(10,2), in fechaServ date, in fechaVencimientoServ date, in idTipoServ int, in idLib int, in idUs int)
		Begin
				Update Servicio S
					set S.costoServicio = costoServ, 
						S.fechaServicio = fechaServ, 
                        s.fechaVencimientoServicio = fechaVencimientoServ, 
                        S.idTipoServicio = idTipoServ, 
                        S.idLibro = idLib, 
                        S.idUsuario = idUs
					where S.idServicio = idServ;
        End $$
Delimiter ;

-- call sp_EditarServicio(1, 0.00, '2000-01-01','2000-01-01', 1, 1, 1);

-- Eliminar Servicio --
Delimiter $$
	Create procedure sp_EliminarServicio (in idServ int)
		Begin
			Delete from Servicio
				where idServicio = idServ;
        End $$
Delimiter ;

-- call sp_EliminarServicio(1);

-- Buscar Servicio --
Delimiter $$
	Create procedure sp_BuscarServicio (in idServ int)
		Begin
			Select * from Servicio S
				where S.idServicio = idServ;
        End $$
Delimiter ;

call sp_BuscarServicio(2);


-- ------------------------------------------------------------------------------------------------------- --

/* ENTIDAD FACTURA */
-- Agregar factura --
Delimiter $$
	Create procedure sp_AgregarFactura(in fechaEmision date, in horaEmision time, in totalFactura decimal(10,2), in idSucursal int, in idUsuario int)
		Begin
			Insert into Factura (fechaEmision, horaEmision, totalFactura, idSucursal, idUsuario)
				values (fechaEmision, horaEmision, totalFactura, idSucursal, idUsuario);
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
	Create procedure sp_EditarFactura(in fechaEmision date, in horaEmision time, in totalFactura decimal(10,2), in idSucursal int, in idUsuario int)
		Begin
			Update Factura
				set fechaEmision = fechaEmision,
					horaEmision = horaEmision,
					totalFactura = totalFactura,
                    idSucursal = idSucursal,
					idUsuario = idUsuario
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

call sp_BuscarFactura(1);


-- ------------------------------------------------------------------------------------------------------- --

/* ENTIDAD DATALLEFACTURA */
-- Agregar Datalle Factura --
Delimiter $$
	Create procedure sp_AgregarDetalleFactura(in idFactura int, in idServicio int)
		Begin
			Insert into DetalleFactura(idFactura, idServicio)
				values(idFactura, idServicio);
        End $$
Delimiter ;

call sp_AgregarDetalleFactura(1, 1);
call sp_AgregarDetalleFactura(1, 2);
call sp_AgregarDetalleFactura(1, 3);
call sp_AgregarDetalleFactura(1, 4);
call sp_AgregarDetalleFactura(2, 5);
call sp_AgregarDetalleFactura(2, 6);
call sp_AgregarDetalleFactura(3, 7);
call sp_AgregarDetalleFactura(4, 8);
call sp_AgregarDetalleFactura(5, 9);
call sp_AgregarDetalleFactura(5, 10);

-- Listar Detalle Factura --
Delimiter $$
	Create procedure sp_ListarDetalleFactura()
		Begin
			Select * from DetalleFactura;
        End $$
Delimiter ;

Call sp_ListarDetalleFactura();

-- Editar Detalle Factura --
Delimiter $$
	Create procedure sp_EditarDetalleFactura(in idDetalleFact int, in idFact int, in idServ int)
		Begin
			Update DetalleFactura DF
				set DF.idFactura =  idFact,
					DF.idServicio = idServ
				where DF.idDetalleFactura = idDetalleFact;
        End $$
Delimiter ;

-- call sp_EditarDetalleFactura(1, 10,10);

-- Eliminar Detalle Factura --
Delimiter $$
	Create procedure sp_EliminarDetalleFactura(in idDetalleFact int)
		Begin
			Delete from DetalleFactura
				where idDetalleFactura = idDetalleFact;
        End $$
Delimiter ;

-- Call sp_EliminarDetalleFactura (1);

-- Buscar Detalle Factura --
Delimiter $$
	Create procedure sp_BuscarDetalleFactura(in idDetalleFact int)
		Begin
			Select * from DetalleFactura DF
				where DF.idDetalleFactura = idDetalleFact;
        End$$
Delimiter ;

Call sp_BuscarDetalleFactura(2);


-- ------------------------------------------------------------------------------------------------------- --

/* ENTIDAD TIPO SUSCRIÇIÓN */
-- Agregar TipoSuscripcion --
Delimiter $$
	Create procedure sp_AgregarTipoSuscripcion(in nombreTipoSuscripcion varchar(35), in descripcionTipoSuscripcion varchar(250), in precioTipoSuscripcion decimal(10,2))
    Begin
		insert into  TipoSuscripcion(nombreTipoSuscripcion,descripcionTipoSuscripcion,precioTipoSuscripcion)
		values (nombreTipoSuscripcion,descripcionTipoSuscripcion,precioTipoSuscripcion);
	end$$
Delimiter ;

call sp_AgregarTipoSuscripcion("Básica", "Suscripción básica con acceso limitado", 9.99);
call sp_AgregarTipoSuscripcion("Premium", "Suscripción premium con acceso completo", 19.99);
call sp_AgregarTipoSuscripcion("Familiar", "Suscripción para familias con múltiples usuarios", 14.99);
call sp_AgregarTipoSuscripcion("Estudiante", "Suscripción especial para estudiantes", 6.99);
call sp_AgregarTipoSuscripcion("Empresarial", "Suscripción para empresas con características adicionales", 29.99);

-- Listar TipoSuscripciones 
Delimiter $$
	Create procedure  sp_ListarTipoSuscripciones()
		Begin
			select
				TS.idTipoSuscripcion,
				TS.nombreTipoSuscripcion,
				TS.descripcionTipoSuscripcion,
				TS.precioTipoSuscripcion
				From TipoSuscripcion TS;
        End$$
Delimiter ;

-- Editar TipoSuscripcion --
Delimiter $$
	Create procedure sp_EditarTipoSuscripcion(in idTpSuscrip int, in nTpSuscrip varchar(35), in descripTpSuscrip varchar(250), in precioTpSuscrip decimal(10,2))
		Begin
			update TipoSuscripcion TS
				set  TS.nombreTipoSuscripcion=nTpSuscrip, TS.descripcionTipoSuscripcion=descripTpSuscrip, TS.precioTipoSuscripcion=precioTpSuscrip 
				where idTipoSuscripcion = idTpSuscrip;
        End$$
Delimiter ;

-- Eliminar TipoSuscripcion --
Delimiter $$
	Create procedure sp_EliminarTipoSuscripcion(in idTipSuscrip int)
		Begin 
			Delete from TipoSuscripcion
				where idTipoSuscripcion = idTipSuscrip;

		End$$
Delimiter ;

-- Buscar TipoSuscripcion --
Delimiter $$
	Create procedure sp_BuscarTipoSuscripcion(in idTipSuscrip int)
		Begin
			select
				TS.idTipoSuscripcion,
				TS.nombreTipoSuscripcion,
				TS.descripcionTipoSuscripcion,
				TS.precioTipoSuscripcion
				From TipoSuscripcion TS where TS.idTipoSuscripcion = idTipSuscrip ;
        End$$
Delimiter ;


-- ------------------------------------------------------------------------------------------------------- --

/* ENTIDAD SUSCRIÇIÓN */
-- Agregar Suscripcion --
Delimiter $$
    create procedure sp_AgregarSuscripcion(in idSuscripcion int, in fechaDeInicio date, in fechaDeVencimiento date, in idTipoSuscripcion int, in idUsuario int)
        Begin
            Insert into Suscripcion(idSuscripcion, fechaDeInicio, fechaDeVencimiento, idTipoSuscripcion,idUsuario)
            values(idSuscripcion, fechaDeInicio, fechaDeVencimiento, idTipoSuscripcion,idUsuario);
        End $$
Delimiter ; 

-- Listar Suscripciones -- 
Delimiter $$
    create procedure sp_ListarSuscripciones()
        Begin
            Select 
				s.idSuscripcion,
				s.fechaDeInicio,
				s.fechaDeVencimiento,
				s.idTipoSuscripcion,
				s.idUsuario
				from Suscripcion s;
        End $$
Delimiter ;

-- Editar Suscripcion --
Delimiter $$
    create procedure sp_EditarSuscripcion(in idSuscripcion int, in fechaDeInicio date, in fechaDeVencimiento date, in idTipoSuscripcion int, in idUsuario int)
        Begin
            Update Suscripcion
            set s.fechaDeInicio = fechaDeInicio, 
				s.fechaDeVencimiento = fechaDeVencimiento, 
                s.idTipoSuscripcion = idTipoSuscripcion,
                s.idUsuario = idUsuario 
                where s.idSuscripcion = idSuscripcion;
        End $$
Delimiter ;

-- Eliminar Suscripcion --
Delimiter $$
    create procedure sp_EliminarSuscripcion(in id int)
        Begin
            delete from Suscripcion 
				where idSuscripcion = id;
        End $$
Delimiter ;

Delimiter $$
    create procedure sp_BuscarSuscripcion(in id int)
        Begin
            Select 
				s.idSuscripcion,
				s.fechaDeInicio,
				s.fechaDeVencimiento,
				s.idTipoSuscripcion,
				s.idUsuario
				from Suscripcion s 
					where s.idSuscripcion=id;
        End$$
Delimiter ;


-- ------------------------------------------------------------------------------------------------------- --

/* ENTIDAD EMPLEADO */
-- Agregar Empleado --
Delimiter $$
	Create procedure sp_AgregarEmpleado(in nombreEmpleado varchar(35), in apellidoEmpleado varchar(35), in puestoEmpleado varchar(35), in idSucursal int)
		Begin
			Insert into Empleado(nombreEmpleado, apellidoEmpleado, puestoEmpleado, idSucursal)
				values(nombreEmpleado, apellidoEmpleado, puestoEmpleado, idSucursal);
        End$$
Delimiter ;

call sp_AgregarEmpleado("Pedro Ezequiel", "Osorio Hernandez", "Gerente General", 1);
call sp_AgregarEmpleado("Juan Felipe", "Lemus Castañeda", "SubGerente", 2);
call sp_AgregarEmpleado("Maria Ester", "Perez Istacuy", "Servicio al cliente", 3);
call sp_AgregarEmpleado("Pedro Ezequiel", "Osorio Hernandez", "Recursos", 4);
call sp_AgregarEmpleado("Otto Samuel", "Enriquez Bolaños", "Programador Front-End", 5);
call sp_AgregarEmpleado("Brandon Esmeralda", "Morales Ramirez", "Programador Back-End", 6);
call sp_AgregarEmpleado("Toto Valentin", "Menendez Estrada", "Marketing", 7);
call sp_AgregarEmpleado("Francesca Elizabeth", "Salvaroti Velazquez", "Contabilidad", 8);
call sp_AgregarEmpleado("Luisa Fernanda", "Santos Osorio", "Mantenimiento", 9);
call sp_AgregarEmpleado("Jorge Samuel", "Perez Molina", "Project Manager", 10);

-- Listar empleados --
Delimiter $$
	Create procedure sp_ListarEmpleados()
		Begin
			Select 
				EM.idEmpleado,
                EM.nombreEmpleado,
                EM.apellidoEmpleado,
                EM.puestoEmpleado,
                EM.idSucursal
				from Empleado EM;
        End$$
Delimiter ;

call sp_ListarEmpleados();

-- Editar empleado --
Delimiter $$
	Create procedure sp_EditarEmpleado(in id_Empleado int ,in nombre_Empleado varchar(35), in apellido_Empleado varchar(35), in puesto_Empleado varchar(35), in id_Sucursal int)
		Begin
			Update Empleado EM
				set EM.nombreEmpleado = nombre_Empleado, EM.apellidoEmpleado = apellido_Empleado, EM.puestoEmpleado = puesto_Empleado, EM.idSucursal = id_Sucursal
					where EM.idEmpleado = id_Empleado;
        End$$
Delimiter ;

-- call sp_EditarEmpleado(7, "Victor", "Alvarez", "Marketing", 7);

-- Eliminar empleado --
Delimiter $$
	Create procedure sp_EliminarEmpleado(in id_Empleado int)
		Begin
			Delete from Empleado
				where idEmpleado = id_Empleado;
        End$$
Delimiter ;

-- call sp_EliminarEmpleado(9);

-- Buscar empleado --
Delimiter $$
	Create procedure sp_BuscarEmpleado(in id_Empleado int)
		Begin
			Select 
				EM.idEmpleado,
                EM.nombreEmpleado,
                EM.apellidoEmpleado,
                EM.puestoEmpleado,
                EM.idSucursal
				from Empleado EM
					where EM.idEmpleado = id_Empleado;
        End$$
Delimiter ;

call sp_BuscarEmpleado(4);

call sp_ListarTipoLibros();


select * from TipoLibro;

select * from Categoria;

insert into FacturaSuscripcion(fechaDeInicio, fechaDeVencimiento, idTipoSuscripcion, idUsuario)
	values('2020-07-31', '2022-07-31', 1, 1);
insert into FacturaSuscripcion(fechaDeInicio, fechaDeVencimiento, idTipoSuscripcion, idUsuario)
	values('2021-07-31', '2022-07-31', 1, 1);    