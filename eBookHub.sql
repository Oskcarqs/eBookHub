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
