Drop database if exists eBookHub;
Create database eBookHub;

Use eBookHub;

-- Creación de Entidades
Create table TipoLibro (
	idTipoLibro int not null,
    nombreTipoLibro varchar(35),
    descripcionTipoLibro varchar(50) not null,
    primary key PK_idTipoLibro (idTipoLibro)
);

Create table Autor (
	idAutor int not null,
    nombreAutor varchar(35) not null,
    apellidoAutor varchar(35) not null,
    nacionalidadAutor varchar(35) not null,
    fechaDeNacimientoAutor date not null,
    biografiaAutor varchar(250) not null,
    primary key PK_idAutor (idAutor)
);

Create table Editorial (
	idEditorial int not null,
    nombreEditorial varchar(35) not null,
    descripcionEditorial varchar(250) not null,
    primary key PK_idEditorial (idEditorial)
);

Create table Categoria (
	idCategoria int not null,
    nombreCategoria varchar(35) not null,
    descripcionCategoria varchar(250) not null,
	primary key PK_idCategoria (idCategoria)
);

Create table Libro(
	idLibro int not null,
    tituloLibro varchar(100) not null,
    descripcionLibro varchar(250) not null,
    fechaDePublicacion date not null,
    idiomaLibro varchar(30) not null,
    costoLibro decimal(10,2) not null,
    idTipoLibro int not null,
    idAutor int not null,
    idEditorial int not null,
    idCategoria int not null,
    primary key PK_idLibro(idLibro),
    constraint FK_Libro_TipoLibro foreign key (idTipoLibro)
		references TipoLibro(idTipoLibro),
    constraint FK_Libro_Autor foreign key (idAutor)
		references Autor(idAutor),
    constraint FK_Libro_Editorial foreign key (idEditorial)
		references Editorial(idEditorial),
    constraint FK_Libro_Categoria foreign key (idCategoria)
		references Categoria(idCategoria)
);
/*
-- Procedimientos Almacenados de la Entidad Libros --
Delimiter $$
	create procedure sp_AgregarLibro(in idLibro int, in tituloLibro varchar(100), in descripcionLibro varchar(250), in fechaDePublicacion date,
		in idiomaLibro varchar(30), in costoLibro decimal(10,2), in idTipoLibro int, in idAutor int, in idEditorial int, in idCategoria  int)
			Begin
				INSERT INTO Libro (idLibro, tituloLibro, descripcionLibro, fechaDePublicacion, idiomaLibro, costoLibro, idTipoLibro, idAutor, 
					idEditorial, idCategoria)
						VALUES (idLibro, tituloLibro, descripcionLibro, fechaDePublicacion, idiomaLibro, costoLibro, idTipoLibro, idAutor,
							idEditorial, idCategoria);
            End $$
Delimiter ;

Delimiter $$
	create procedure sp_ListarLibros()
		Begin
			Select * from Libro;
        End$$
Delimiter ;
	create procedure sp_BuscarLibro(in id int)
		Begin
			Select * from Libro where idLibro = id
        End$$
Delimiter ;*/
