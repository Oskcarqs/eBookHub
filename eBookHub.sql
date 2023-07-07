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

Create table Factura (
	idFactura int not null auto_increment,
    fechaDeEmision date not null,
    totalFactura decimal(10,2) not null,
	idUsuario int not null,
    idDetalleFactura int not null,
    
    primary key PK_idFactura (idFactura),
    
    constraint FK_Factura_Usuario foreign key (idUsuario)
		references Usuario (idUsuario),
        
	constraint FK_Factura_detalleFactura foreign key (idDetalleFactura)
		references detalleFactura (idDetalleFactura)
);
Create table TipoSuscripcion(
	idTipoSuscripcion int auto_increment primary key,
    nombreTipoSuscripcion varchar(35) not null,
    descripcionTipoSuscripcion varchar(250) not null,
    precioTipoSuscripcion decimal(10,2) not null
);

create table Cliente (
	idCliente int not null auto_increment,
    nombreCliente varchar(35),
    apellidoCliente varchar(35),
    fechaDeNacimientoCliente date,
    direccionCliente varchar(75),
    telefonoCliente varchar(10),
    primary key PK_idCliente (idCliente)
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

-- -------------------------------- Agregar Factura --------------------------------
Delimiter $$
	Create procedure sp_AgregarFactura(in fechaDeEmision date, in totalFactura decimal(10,2), in idUsuario int, in idDetalleFactura int)
		Begin
			Insert into Factura (fechaDeEmision, totalFactura, idUsuario, idDetalleFactura)
				values (fechaDeEmision, totalFactura, idUsuario, idDetalleFactura);
        End $$
Delimiter ; 

call sp_AgregarFactura('2023-01-03', 400.30, 1, 1);
call sp_AgregarFactura('2023-02-04', 100.50, 2, 2);
call sp_AgregarFactura('2023-03-05', 200.00, 3, 3);
call sp_AgregarFactura('2020-04-05', 700.10, 4, 4);
call sp_AgregarFactura('2023-05-05', 500.10, 5, 5);
call sp_AgregarFactura('2023-06-05', 300.10, 6, 6);
call sp_AgregarFactura('2021-07-05', 800.60, 7, 7);
call sp_AgregarFactura('2019-08-05', 600.70, 8, 8);
call sp_AgregarFactura('2021-09-05', 500.90, 9, 9);

-- -------------------------------- Listar Factura --------------------------------

Delimiter $$
	Create procedure sp_ListarFactura()
		Begin
			Select * from Factura;
        End $$
Delimiter ; 

call sp_ListarFactura();

-- -------------------------------- Buscar Factura --------------------------------

Delimiter $$
	Create procedure sp_BuscarFactura(in idFactura int)
		Begin
			Select * from Factura
				where idFactura = idFactura;
        End $$
Delimiter ; 

call sp_BuscarFactura(1);
call sp_BuscarFactura(2);
call sp_BuscarFactura(3);
call sp_BuscarFactura(4);
call sp_BuscarFactura(5);
call sp_BuscarFactura(6);
call sp_BuscarFactura(7);
call sp_BuscarFactura(8);
call sp_BuscarFactura(9);

-- -------------------------------- Eliminar Factura --------------------------------

Delimiter $$
	Create procedure sp_EliminarFactura(in idFactura int)
		Begin
			Delete from Factura
				where idFactura= idFactura;
        End $$
Delimiter ; 

call sp_EliminarFactura(1);

-- -------------------------------- Editar Factura --------------------------------

Delimiter $$
	Create procedure sp_EditarFactura(in fechaDeEmision date, in totalFactura decimal(10,2), in idUsuario int, in idDetalleFactura int)
		Begin
			Update Factura
				set fechaDeEmision = fechaDeEmision,
					totalFactura = totalFactura,
					idUsuario = idUsuario,
                    idDetalleFactura = idDetalleFactura
			where idFactura = idFactura;
        End $$
Delimiter ;
-- -------------------- Agregar Tipo Suscripcion -------------------------------------
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

-- -------------------- Listar Tipo Suscripcion -------------------------------------
Delimiter $$
	Create procedure  sp_ListarTipoSuscripcion()
		Begin
			select
				TS.idTipoSuscripcion,
				TS.nombreTipoSuscripcion,
				TS.descripcionTipoSuscripcion,
				TS.precioTipoSuscripcion
				From TipoSuscripcion TS;
        End$$
Delimiter ;
-- -------------------- Buscar Tipo Suscripcion -------------------------------------
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
-- -------------------- Eliminar Tipo Suscripcion -------------------------------------
Delimiter $$
	Create procedure sp_EliminarTipoSuscripcion(in idTipSuscrip int)
		Begin 
			Delete from TipoSuscripcion
				where idTipoSuscripcion = idTipSuscrip;

		End$$
Delimiter ;
-- -------------------- editar tipo Suscripcion -------------------------------------
Delimiter $$
	Create procedure sp_EditarTipoSuscripcion(in idTpSuscrip int, in nTpSuscrip varchar(35), in descripTpSuscrip varchar(250), in precioTpSuscrip decimal(10,2))
		Begin
			update TipoSuscripcion TS
				set  TS.nombreTipoSuscripcion=nTpSuscrip, TS.descripcionTipoSuscripcion=descripTpSuscrip, TS.precioTipoSuscripcion=precioTpSuscrip 
				where idTipoSuscripcion = idTpSuscrip;
        End$$
Delimiter ;

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

Delimiter $$
	Create procedure sp_ListarCliente ()
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
	
Call sp_ListarCliente();

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

Delimiter $$
	Create procedure sp_EliminarCliente (in idCli int)
		Begin
			Delete from Cliente
					where idCliente = idCli;
        End$$
Delimiter ;

-- call sp_EliminarCliente(1);

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

call sp_EditarCliente(1 ,'medina', 'pedro', '2023-06-11', 'villa nueva', '12345678');

*/