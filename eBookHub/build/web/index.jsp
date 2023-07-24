<%-- 
    Document   : index
    Created on : Jul 21, 2023, 11:02:54 AM
    Author     : oskca
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!doctype html>
<html lang="en">
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>Principal</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
    </head>
    <body>

        <nav class="navbar navbar-expand-lg bg-primary"> <c
                <div class="container-fluid">
                    <a class="navbar-brand" href="#">EBookHub</a>
                    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                        <span class="navbar-toggler-icon"></span>
                    </button>
                    <div class="collapse navbar-collapse" id="navbarSupportedContent">
                        <ul class="navbar-nav me-auto mb-2 mb-lg-0">
                            <li class="nav-item">
                                <a class="nav-link active" aria-current="page" href="#">Inicio</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" href="#">Catalogo</a>
                            </li>
                            <li class="nav-item dropdown">
                                <a class="nav-link dropdown-toggle" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false">
                                    Categorias
                                </a>
                                <ul class="dropdown-menu">
                                    <li><a class="dropdown-item" href="#">Action</a></li>
                                    <li><a class="dropdown-item" href="#">Another action</a></li>
                                    <li><hr class="dropdown-divider"></li>
                                    <li><a class="dropdown-item" href="#">Something else here</a></li>
                                </ul>
                            </li>
                        </ul>
                        <form class="d-flex" role="search">
                            <input class="form-control me-2" type="search" placeholder="Buscar" aria-label="Search">
                            <button class="btn btn-outline-success" type="submit">Buscar</button>
                        </form>
                    </div>
                </div>
        </nav>
        <header id="inicio" class="bg-primary text-white text-center">
            <div class="container-xxl">
                <h1 class="display-1">Las mejores libros.</h1><br>
            </div>
        </header>
        <main>
            <br>
            <div class="container">
                <nav class="nav justify-content-center">
                    <a href="ControladorServicio?accion=listar" class="nav-link btn btn-outline-primary m-2" >Listar Servicios</a> <br>
                    <a href="ControladorTipoServicio?accion=listar" class="nav-link btn btn-outline-primary m-2">Listar Tipo Servicios</a> <br>
                    <a href="ControladorEmpleado?accion=listarEmpleado" class="nav-link btn btn-outline-primary m-2">ListarEmpleado</a>
                    <a href="ControladorEditorial?accion=listarEditorial" class="nav-link btn btn-outline-primary m-2">Listar Editorial</a>
                    <a href="ControladorTipoLibro?accion=listarTipoLibro" class="nav-link btn btn-outline-primary m-2">ListarTipoLibro</a> <br>
                </nav>   
                <nav class="nav justify-content-center">
                    <a href="ControladorDetalleFactura?accion=listarDetalleFactura"class="nav-link btn btn-outline-primary m-2">ListarDetalleFactura</a> <br> <br>
                    <a href="ControladorUsuario?accion=listarUsuario" class="nav-link btn btn-outline-primary m-2">ListarUsuario</a>
                    <a href="ControladorFactura?accion=listar" class="nav-link btn btn-outline-primary m-2">Listar Facturas</a>
                    <a href="ControladorLibro?accion=listarLibro" class="nav-link btn btn-outline-primary m-2">ListarLibros</a>
                    <a href="ControladorFacturaSuscripcion?accion=listarFacturaSuscripcion" class="nav-link btn btn-outline-primary m-2">ListarFacturaSuscripcion</a>
                <nav class="nav justify-content-center">
                    <a href="ControladorCategoria?accion=listarCategoria" class="nav-link btn btn-outline-primary m-2">Listar Categoria</a>
                    <a href="ControladorAutor?accion=listarAutor" class="nav-link btn btn-outline-primary m-2">Listar Autor</a>
                    <a href="ControladorSucursal?accion=listarSucursal" class="nav-link btn btn-outline-primary m-2">ListarSucursal</a>
                    <a href="ControladorCliente?accion=listarCliente" class="nav-link btn btn-outline-primary m-2">Listar Cliente</a>   
                    <a href="ControladorTipoSuscripcion?accion=listarTipoSuscripcion" class="nav-link btn btn-outline-primary m-2">Listar TipoSuscripcion</a>
                    <nav>
                    
                </nav>
            </div>       
            <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script>
    </body>
</html>
