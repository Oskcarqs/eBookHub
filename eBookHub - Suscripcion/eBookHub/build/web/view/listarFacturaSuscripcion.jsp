<%-- 
    Document   : listarAutor
    Created on : Jul 21, 2023, 12:59:30 PM
    Author     : oskca
--%>



<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page import="model.Autor"%>
<%@page import="modelDAO.AutorDAO"%>
<%@page import="java.util.Iterator"%>
<%@page import="model.Categoria"%>
<%@page import="java.util.List"%>
<%@page import="modelDAO.CategoriaDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Listar suscripcion</title>
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">      
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-4bw+/aepP/YC94hEpVNVgiZdgIC5+VKNBQNGCHeKRQN+PtmoHDEXuppvnDJzQIu9" crossorigin="anonymous">
        <script src="https://kit.fontawesome.com/2833bb8570.js" crossorigin="anonymous"></script>
        <script src="../Scripts.js"></script>


    </head>
    <body>
        <nav class="navbar navbar-expand-lg sticky-top navbar-dark bg-dark">
            <div class="container-fluid">
                <a class="navbar-brand mx-3" href="#">
                    <img src="../img/LogoEBookHubNavBar.png" alt="Logo" width="30" height="30" class="d-inline-block align-text-top">
                    eBookHub
                </a>
                <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                    <i class="fa-solid fa-bars fa-lg" style="color: #ffffff;"></i>
                </button>
                <div class="collapse navbar-collapse" id="navbarSupportedContent">
                    <ul class="navbar-nav me-auto mb-2 mb-lg-0">
                        <li class="nav-item">
                            <a class="nav-link mx-2" aria-current="page" href="Controlador?menu=Inicio&accion=Listar"><i class="fa-solid fa-house" style="color: #ffffff;"></i> Inicio</a>
                        </li>
                        <li class="nav-item dropdown mx-2">
                            <a class="nav-link mx-2" aria-current="page" href="view/listarLibro.jsp">Libros</a>
                        </li>
                        <li class="nav-item dropdown mx-2">
                            <a class="nav-link dropdown-toggle" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false">
                                Mas
                            </a>
                            <ul class="dropdown-menu">
                                <li><a class="dropdown-item" href="view/listarCliente.jsp">Clientes</a></li>
                                <li><a class="dropdown-item" href="view/listarEmpleado.jsp">Empleados</a></li>
                                <li><a class="dropdown-item" href="view/listarFactura.jsp">Facturas</a></li>
                                <li><a class="dropdown-item" href="view/listarSucursal.jsp">Sucursal</a></li>
                                <li><a class="dropdown-item" href="view/ListarServicio.jsp">Servicio</a></li>
                                <li><a class="dropdown-item" href="view/listarEditorial.jsp">Editorial</a></li>
                                <li><a class="dropdown-item" href="Controlador?menu=Autor&accion=Listar">Autor</a></li>
                                <li><a class="dropdown-item" href="view/listarCliente.jsp">Categoria</a></li>
                                <li><a class="dropdown-item" href="view/FacturaSuscripcion.jsp">Factura</a></li>


                            </ul>
                        </li>
                        <li class="nav-item ">
                            <a class="btn btn-warning" href="#">Suscripcion <i class="fa-solid fa-crown" style="color: #000000;"></i></a>
                        </li>
                    </ul>
                    <form class="d-flex me-auto" role="search">
                        <input class="form-control me-2" type="search" placeholder="Search" aria-label="Search">
                        <button class="btn btn-outline-success" type="submit">Search</button>
                    </form>
                    <div class="dropdown">
                        <button type="button" class="btn btn-light dropdown-toggle" data-bs-toggle="dropdown" aria-expanded="false" data-bs-auto-close="outside">
                            Sing in
                        </button>
                        <form class="dropdown-menu dropdown-menu-lg-end  p-4">
                            <div class="mb-3">
                                <label for="exampleDropdownFormEmail2" class="form-label">Email address</label>
                                <input type="email" class="form-control" id="exampleDropdownFormEmail2" placeholder="email@example.com">
                            </div>
                            <div class="mb-3">
                                <label for="exampleDropdownFormPassword2" class="form-label">Password</label>
                                <input type="password" class="form-control" id="exampleDropdownFormPassword2" placeholder="Password">
                            </div>
                            <div class="mb-3">
                                <div class="form-check">
                                    <input type="checkbox" class="form-check-input" id="dropdownCheck2">
                                    <label class="form-check-label" for="dropdownCheck2">
                                        Remember me
                                    </label>
                                </div>
                            </div>
                            <button type="submit" class="btn btn-primary">Sign in</button>
                        </form>
                    </div>
                </div>
            </div>
        </nav>
        
        
        
        
        <div class="container mt-5">
        <h1 class="text-center">Suscripciones</h1>
        <div class="row mt-4">
            <!-- Plan Básico -->
<div class="col-md-4">
    <div class="card h-100" style="border: 1px solid #000000;">
        <div class="card-header" style="background-color: #BFE6FF;">
            <h3 class="mb-0 text-center">Básico</h3>
        </div>
        <div class="card-body text-center" style="border-top: 1px solid #000000; border-bottom: 1px solid #000000;">

            <h2 class="mb-4">$9.99/mes</h2>
            <ul class="list-group">
                <li class="d-flex align-items-start">
                    <span class="subtitle mr-4">•</span>
                    <div>
                        <p class="mb-0">
                            Obtén acceso a una amplia colección de libros sin restricciones y disfruta de libros exclusivos.
                        </p>
                    </div>
                </li>
                <li class="list-group-item">
                    <h5>Funciones adicionales:</h5>
                    <ul class="list-unstyled">
                        <li>Diversas Editoriales</li>
                        <li>Autores Reconozidos</li>
                        <li>Libros de Fama Mundial</li>
                    </ul>
                </li>
            </ul>
        </div>
        <div class="card-footer">
            
            <button type="button" class="btn btn-block" data-bs-toggle="modal" data-bs-target="#exampleModal" style="background-color: #BFE6FF; ">Comprar</button>
        </div>
    </div>
</div>
            
            

            




    
<div class="col-md-4">
    <div class="card h-100" style="border: 1px solid #000000;">
        <div class="card-header" style="background-color: #FFD700 ;">
            <h3 class="mb-0 text-center">Estándar</h3>
        </div>
        <div class="card-body text-center" style="border-top: 1px solid #000000; border-bottom: 1px solid #000000;">

            <h2 class="mb-4">$19.99/mes</h2>
            <ul class="list-group">
                <li class="d-flex align-items-start">
                    <span class="subtitle mr-4">•</span>
                    <div>
                        <p class="mb-0">
                            Libros exclisvos para tu plan, resañas mensuales de libros.
                        </p>
                    </div>
                </li>
                <li class="list-group-item">
                    <h5>Funciones adicionales:</h5>
                    <ul class="list-unstyled">
                        <li>Audio Libros</li>
                        <li>Marca Paginas Persobalizable</li>
                        <li>Expación para la Libreria</li>
                    </ul>
                </li>
            </ul>
        </div>
        <div class="card-footer">
            <button type="button" class="btn btn-block" data-bs-toggle="modal" data-bs-target="#exampleModal1" style="background-color: #FFD700; ">Comprar</button>
        </div>
    </div>
</div>
            
            
            
            
            
            
            
            
            
    
            <!-- Plan Premium -->
<div class="col-md-4">
    <div class="card h-100" style="border: 1px solid #000000;">
        <div class="card-header" style="background-color: #FFC0CB;">
            <h3 class="mb-0 text-center">Pro</h3>
        </div>
        <div class="card-body text-center" style="border-top: 1px solid #000000; border-bottom: 1px solid #000000;">

            <h2 class="mb-4">$29.99/mes</h2>
            <ul class="list-group">
                <li class="d-flex align-items-start">
                    <span class="subtitle mr-4">•</span>
                    <div>
                        <p class="mb-0">
                            Libros del ultimo mes subidos en su respectivos idioma y doblados a tu idioma local.
                        </p>
                    </div>
                </li>
                <li class="list-group-item">
                    <h5>Funciones adicionales:</h5>
                    <ul class="list-unstyled">
                        <li>Estrenos Anticipados</li>
                        <li>Regalos Mensuales</li>
                        <li>Libreria Ilimitada</li>
                        
                    </ul>
                </li>
            </ul>
        </div>
        <div class="card-footer">
            <button type="button" class="btn btn-block" data-bs-toggle="modal" data-bs-target="#exampleModal2" style="background-color: #FFC0CB; ">Comprar</button>
        </div>
    </div>
</div>
            
            
            
<!-- Modal -->
                <div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
                    <div class="modal-dialog">
                        <div class="modal-content">
                            <form action="Controlador?menu=Modal" method="POST" autocomplete="off">
                                <div class="modal-header">
                                    <!-- Titulo -->
                                    <h1 class="modal-title fs-5" id="exampleModalLabel">Comprar Plan Básico</h1>
                                    
                                    <button type="button" class="btn btn-white" data-bs-dismiss="modal" aria-label="Close"><i class="fa-solid fa-xmark fa-xl" style="color: #000000;"></i></button>
                                </div>
                                <div class="modal-body">
                                    <!-- FORMUlARIO PARA AGREGAR -->
                                    <div class="form-floating mb-3">
                                        <input type="text" class="form-control" id="floatingInput" name="txtNombre" >
                                        <label for="floatingInput">DPI</label>
                                    </div>
                                    <div class="form-floating mb-3">
                                        <input type="text" class="form-control" id="floatingInput" name="txtApellido" >
                                        <label for="floatingInput">Cifrado de Tarjeta</label>
                                    </div>
                                    <div class="form-floating mb-3">
                                        <input type="text" class="form-control" id="floatingInput" name="txtNacionalidad" >
                                        <label for="floatingInput">Numero de Atorización</label>
                                    </div>
                                    <div class="form-floating mb-3">
                                        <input type="date" class="form-control" id="floatingInput" name="txtNacimiento" >
                                        <label for="floatingInput">Fecha de Vencimiento</label>
                                    </div>
                                    <div class="form-floating">
                                        <textarea class="form-control" id="floatingTextarea2" style="height: 100px" name="txtBiografia" ></textarea>
                                        <label for="floatingTextarea2">Comentario de la Compra</label>
                                    </div>
                                </div>
                                <div class="modal-footer">
                                    <button type="submit" class="btn btn-secondary" data-bs-dismiss="modal">Cancelar</button>
                                    <button type="submit" class="btn btn-primary" name="accion" value="EditarPrimero">Comprar</button>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
                
                <div class="modal fade" id="exampleModal1" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
                    <div class="modal-dialog">
                        <div class="modal-content">
                            <form action="Controlador?menu=Modal" method="POST" autocomplete="off">
                                <div class="modal-header">
                                    <!-- Titulo -->
                                    <h1 class="modal-title fs-5" id="exampleModalLabel">Compra de Plan Estandar</h1>
                                   
                                    <button type="button" class="btn btn-white" data-bs-dismiss="modal" aria-label="Close"><i class="fa-solid fa-xmark fa-xl" style="color: #000000;"></i></button>
                                </div>
                                <div class="modal-body">
                                    <!-- FORMUlARIO PARA AGREGAR -->
                                    <div class="form-floating mb-3">
                                        <input type="text" class="form-control" id="floatingInput" name="txtNombre" required>
                                        <label for="floatingInput">DPI</label>
                                    </div>
                                    <div class="form-floating mb-3">
                                        <input type="text" class="form-control" id="floatingInput" name="txtApellido" required>
                                        <label for="floatingInput">Cifrado de Tarjeta</label>
                                    </div>
                                    <div class="form-floating mb-3">
                                        <input type="text" class="form-control" id="floatingInput" name="txtNacionalidad" required>
                                        <label for="floatingInput">Numero de Atorización</label>
                                    </div>
                                    <div class="form-floating mb-3">
                                        <input type="date" class="form-control" id="floatingInput" name="txtNacimiento" required>
                                        <label for="floatingInput">Fecha de Vencimiento</label>
                                    </div>
                                    <div class="form-floating">
                                        <textarea class="form-control" id="floatingTextarea2" style="height: 100px" name="txtBiografia" required="on"></textarea>
                                        <label for="floatingTextarea2">Comentario de la Compra</label>
                                    </div>
                                </div>
                                <div class="modal-footer">
                                    <button type="submit" class="btn btn-secondary" data-bs-dismiss="modal">Cancelar</button>
                                    <button type="submit" class="btn btn-primary" name="accion" value="EditarSegundo">Agregar</button>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>

                <div class="modal fade" id="exampleModal2" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
                    <div class="modal-dialog">
                        <div class="modal-content">
                            <form action="Controlador?menu=Modal" method="POST" autocomplete="off">
                                <div class="modal-header">
                                    <!-- Titulo -->
                                    <h1 class="modal-title fs-5" id="exampleModalLabel">Compra de Plan Pro</h1>
                                    
                                    <button type="button" class="btn btn-white" data-bs-dismiss="modal" aria-label="Close"><i class="fa-solid fa-xmark fa-xl" style="color: #000000;"></i></button>
                                </div>
                                <div class="modal-body">
                                    <!-- FORMUlARIO PARA AGREGAR -->
                                    <div class="form-floating mb-3">
                                        <input type="text" class="form-control" id="floatingInput" name="txtNombre" required>
                                        <label for="floatingInput">DPI</label>
                                    </div>
                                    <div class="form-floating mb-3">
                                        <input type="text" class="form-control" id="floatingInput" name="txtApellido" required>
                                        <label for="floatingInput">Cifrado de Tarjeta</label>
                                    </div>
                                    <div class="form-floating mb-3">
                                        <input type="text" class="form-control" id="floatingInput" name="txtNacionalidad" required>
                                        <label for="floatingInput">Numero de Atorización</label>
                                    </div>
                                    <div class="form-floating mb-3">
                                        <input type="date" class="form-control" id="floatingInput" name="txtNacimiento" required>
                                        <label for="floatingInput">Fecha de Vencimiento</label>
                                    </div>
                                    <div class="form-floating">
                                        <textarea class="form-control" id="floatingTextarea2" style="height: 100px" name="txtBiografia" required="on"></textarea>
                                        <label for="floatingTextarea2">Comentario de la Compra</label>
                                    </div>
                                </div>
                                <div class="modal-footer">
                                    <button type="submit" class="btn btn-secondary" data-bs-dismiss="modal">Cancelar</button>
                                    <button type="submit" class="btn btn-primary" name="accion" value="EditarTercero">Agregar</button>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
            
            
        </div>
    </div>


        
        <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.8/dist/umd/popper.min.js" integrity="sha384-I7E8VVD/ismYTF4hNIPjVp/Zjvgyol6VFvRkX/vR+Vc4jQkC+hVqc2pM8ODewa9r" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.min.js" integrity="sha384-Rx+T1VzGupg4BHQYs2gCW9It+akI2MM/mndMCy36UVfodzcJcF0GGLxZIzObiEfa" crossorigin="anonymous"></script>
    </body>
</html>