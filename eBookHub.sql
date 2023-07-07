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

Create table Compra(
	idCompra int auto_increment not null,
    precioCompra decimal(10,2) not null,
    fechaCompra date not null,
    idLibro int not null,
    primary key idCompra (idCompra),
    constraint FK_idLibro_libro foreign key (idLibro)
		references libro(idLibro)
);

Create table Renta(
	idRenta int auto_increment not null,
    precioRentaDia decimal(10,2) not null,
    fechaDeRenta date not null,
    fechaDeVencimientoRenta date not null,
    primary key PK_idRenta (idRenta)
);

create table DetalleFactura(
idDetalleFactura int not null auto_increment primary key,
idCompra int,
idRenta int,
constraint FK_DetalleFactura_Compra foreign key
	(idCompra) references Compra(idCompra) on delete cascade,
constraint FK_DetalleFactura_Renta foreign key
	(idRenta) references Renta(idRenta) on delete cascade
);


-- Procedimientos entidad Compra

/*

Delimiter $$
	Create procedure sp_AgregarCompra(in precioCompra decimal(10,2), in fechaCompra date, in idLibro int)
		begin 
			Insert into Compra(precioCompra, fechaCompra, idLibro)
				values(precioCompra, fechaCompra, idLibro); 
        end $$
Delimiter ;

CALL sp_AgregarCompra(5000.00, '2023-06-05', 1);
CALL sp_AgregarCompra(3500.00, '2023-07-01', 2);
CALL sp_AgregarCompra(8000.00, '2023-06-15', 3);
CALL sp_AgregarCompra(2000.00, '2023-06-20', 4);
CALL sp_AgregarCompra(6000.00, '2023-07-02', 5);
CALL sp_AgregarCompra(4500.00, '2023-06-25', 6);
CALL sp_AgregarCompra(7000.00, '2023-06-10', 7);
CALL sp_AgregarCompra(3000.00, '2023-07-05', 8);
CALL sp_AgregarCompra(5500.00, '2023-06-30', 9);
CALL sp_AgregarCompra(4000.00, '2023-07-03', 10);

Delimiter $$
	Create procedure sp_EliminarCompra(in idCompra int) 
		begin 
			delete from Compra 
				where idCompra = idCompra; 
        end $$
Delimiter 


Delimiter $$
	Create procedure sp_ListarCompra()
	begin 
		Select 
			idCompra, 
            precioCompra, 
            fechaCompra, 
            idLibro
            from Compra; 
    end $$
Delimiter ;


Delimiter $$
	Create procedure sp_BuscarPresupuesto(in idCompra int)
		Begin 
			Select 
				Com.idCompra, 
				Com.precioCompra, 
				Com.fechaCompra, 
				Com.idLibro
				from Compra Com where Com.idCompra = idCompra; 
        end $$ 
Delimiter ;


Delimiter $$
	Create procedure sp_EditarPresupuesto(in idCom int, in preCom decimal(10,2), in fechaCom date, in idLib int)
		begin 
			  Update Compra
					set
                    precioCompra = preCom,
                    fechaCompra = fechaCom,
                    idLibro = idLib
                    where Pre.codigoPresupuesto = codPres;
                    
        end $$
Delimiter ;

*/

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

/*Delimiter $$
Create procedure sp_AgregarRenta(in precioRentaDia decimal(10,2), in fechaDeRenta date, in fechaDeVencimientoRenta date)
	Begin
		insert into Renta (precioRentaDia, fechaDeRenta, fechaDeVencimientoRenta)
			value (precioRentaDia, fechaDeRenta, fechaDeVencimientoRenta);
    End$$
Delimiter ;

call sp_AgregarRenta(55.50, '2023-12-12', '2023-12-28');
call sp_AgregarRenta(42.60, '2024-04-10', '2024-05-10');
call sp_AgregarRenta(60.40, '2024-02-14', '2024-03-01');
call sp_AgregarRenta(25.00, '2023-09-01', '2023-10-01');
call sp_AgregarRenta(80.50, '2024-07-04', '2024-08-22');
call sp_AgregarRenta(70.50, '2024-10-01', '2024-12-27');
call sp_AgregarRenta(10.50, '2024-03-04', '2024-11-11');
call sp_AgregarRenta(42.50, '2024-07-04', '2024-08-24');
call sp_AgregarRenta(23.50, '2024-08-09', '2024-09-29');
call sp_AgregarRenta(32.50, '2024-01-07', '2024-10-30');



Delimiter $$
Create procedure sp_ListarRenta()
	Begin
		Select
			R.idRenta,
            R.precioRentaDia,
            R.fechaDeRenta,
            R.fechaDeVencimientoRenta
		From Renta R;
    End$$
Delimiter ;

call sp_ListarRenta();

Delimiter $$
Create procedure sp_EliminarRenta(in idRen int)
	Begin
		Delete from Renta
			where idRenta = idRen;
	End $$
Delimiter ;

call sp_EliminarRenta(3);

Delimiter $$
Create procedure sp_BuscarRenta(in idRenta int)
	Begin
		Select
			R.idRenta,
            R.precioRentaDia,
            R.fechaDeRenta,
            R.fechaDeVencimientoRenta
		From Renta R where R.idRenta = idRenta;
    End$$
Delimiter ;

call sp_BuscarRenta(2);

Delimiter $$
Create procedure sp_EditarRenta(in idRenta int, in precioRentaDia decimal(10,2), in fechaDeRenta date, in fechaDeVencimientoRenta date)
	Begin
		Update Renta R 
			set R.precioRentaDia = precioRentaDia,
				R.fechaDeRenta = fechaDeRenta, 
				R.fechaDeVencimientoRenta = fechaDeVencimientoRenta
			where  R.idRenta = idRenta;
	End $$
Delimiter ;

call sp_EditarRenta(5, 80.00, '2023-01-01', '2024-12-12');

-- -------------------------------- Agregar DetalleFactura --------------------------------
delimiter $$
	create procedure sp_AgregarDetalleFactura(in idCompra int, in idRenta int)
		begin
			insert into DetalleFactura (idCompra, idRenta)
				values(idCompra, idRenta);
        end $$
delimiter ;

-- -------------------------------- Listar DetalleFactura --------------------------------
delimiter $$
	create procedure sp_ListarDetalleFactura()
		begin
			select
				df.idDetalleFactura,
                df.idCompra,
                df.idRenta
			from DetalleFactura df;
        end $$
delimiter ;

-- -------------------------------- Buscar DetalleFactura --------------------------------
delimiter $$
	create procedure sp_BuscarDetalleFactura(in codigoDetalleFactura int)
		begin
			select
				df.idDetalleFactura,
                df.idCompra,
                df.idRenta
			from DetalleFactura df where df.idDetalleFactura = codigoDetalleFactura;        
        end $$
delimiter ;

-- -------------------------------- Eliminar DetalleFactura --------------------------------
delimiter $$
		create procedure sp_EliminarDetalleFactura(in codigoDetalleFactura int)
		begin	
			delete from DetalleFactura df where df.idDetalleFactura = codigoDetalleFactura; 
        end $$
delimiter ; 

-- -------------------------------- Editar DetalleFactura --------------------------------
delimiter $$
	create procedure sp_EditarDetalleFactura(in codigoDetalleFactura int, in codCompra int, in codRenta int)
		begin
			Update DetalleFactura df
				set 
					df.idCompra = codCompra, 
					df.idRenta = codRenta
					where df.idDetalleFactura = codigoDetalleFactura; 				
        end $$
delimiter ;


call sp_AgregarDetalleFactura(1,1);
call sp_AgregarDetalleFactura(2, 2);
call sp_ListarDetalleFactura();
call sp_BuscarDetalleFactura(2);
call sp_EliminarDetalleFactura(1);
call sp_EditarDetalleFactura(2, 3, 3);




*/