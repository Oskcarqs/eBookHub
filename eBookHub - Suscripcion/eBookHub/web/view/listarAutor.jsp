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
        <title>Listar Autor</title>
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

        <div class="container-fluid p-4">
            <div class="d-flex justify-content-end"> 
                <!-- Button trigger modal -->
                <button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#exampleModal">
                    <i class="fa-solid fa-pen-fancy" style="color: #ffffff;"></i> Agregar autor
                </button>
                <!-- Modal -->
                <div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
                    <div class="modal-dialog">
                        <div class="modal-content">
                            <form action="Controlador?menu=Autor" method="POST" autocomplete="off">
                                <div class="modal-header">
                                    <!-- Titulo -->
                                    <h1 class="modal-title fs-5" id="exampleModalLabel">Agregar autor</h1>
                                    <button type="button" class="btn btn-white" data-bs-dismiss="modal" aria-label="Close"><i class="fa-solid fa-xmark fa-xl" style="color: #000000;"></i></button>
                                </div>
                                <div class="modal-body">
                                    <!-- FORMUlARIO PARA AGREGAR -->
                                    <div class="form-floating mb-3">
                                        <input type="text" class="form-control" id="floatingInput" name="txtNombre" required>
                                        <label for="floatingInput">Nombre autor</label>
                                    </div>
                                    <div class="form-floating mb-3">
                                        <input type="text" class="form-control" id="floatingInput" name="txtApellido" required>
                                        <label for="floatingInput">Apellido autor</label>
                                    </div>
                                    <div class="form-floating mb-3">
                                        <input type="text" class="form-control" id="floatingInput" name="txtNacionalidad" required>
                                        <label for="floatingInput">Nacionalidad</label>
                                    </div>
                                    <div class="form-floating mb-3">
                                        <input type="date" class="form-control" id="floatingInput" name="txtNacimiento" required>
                                        <label for="floatingInput">Fecha de nacimiento</label>
                                    </div>
                                    <div class="form-floating">
                                        <textarea class="form-control" id="floatingTextarea2" style="height: 100px" name="txtBiografia" required="on"></textarea>
                                        <label for="floatingTextarea2">Biografia</label>
                                    </div>
                                </div>
                                <div class="modal-footer">
                                    <button type="submit" class="btn btn-secondary" data-bs-dismiss="modal">Cancelar</button>
                                    <button type="submit" class="btn btn-primary" name="accion" value="Agregar">Agregar</button>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
            </div>

            <table class="table aling-middle table-striped text-center table-hover mt-3">
                <thead class="table-dark">
                    <tr>
                        <td>Nombre</td>
                        <td>Apellido</td>
                        <td>Nacionalidad</td>
                        <td>Nacimiento</td>
                        <td class="col-sm-5">Biografia</td>
                        <td>Acciones</td>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach var="a" items="${autor}">
                        <tr>
                            <td>${a.getNombreAutor()}</td>
                            <td>${a.getApellidoAutor()}</td>
                            <td>${a.getNacionalidadAutor()}</td>
                            <td>${a.getFechaNacimientoAutor()}</td>
                            <td>${a.getBiografiaAutor()}</td>
                            <td>
                                <button type="button" class="btn btn-warning" data-bs-toggle="modal" data-bs-target="#editarModal${a.getIdAutor()}">
                                    <i class="fa-solid fa-pen-to-square" style="color: #ffffff;"></i>
                                </button>
                                <div class="modal fade" id="editarModal${a.getIdAutor()}" tabindex="-1" aria-labelledby="editarModalLabel${a.getIdAutor()}" aria-hidden="true">
                                    <form action="Controlador?menu=Autor&codigoAutor=${a.getIdAutor()}" method="POST" autocomplete="off" >
                                        <div class="modal-dialog">
                                            <div class="modal-content">
                                                <div class="modal-header">
                                                    <!-- Titulo -->
                                                    <h1 class="modal-title fs-5" id="exampleModalLabel">Editar autor</h1>
                                                    <button type="button" class="btn btn-white" data-bs-dismiss="modal" aria-label="Close"><i class="fa-solid fa-xmark fa-xl" style="color: #000000;"></i></button>
                                                </div>
                                                <div class="modal-body">
                                                    <!-- FORMUlARIO PARA EDITAR -->
                                                    <div class="form-floating mb-3">
                                                        <input type="text" class="form-control" id="floatingInput" value="${a.getNombreAutor()}" name="txtNombre" required>
                                                        <label for="floatingInput">Nombre autor</label>
                                                    </div>
                                                    <div class="form-floating mb-3">
                                                        <input type="text" class="form-control" id="floatingInput" value="${a.getApellidoAutor()}" name="txtApellido" required>
                                                        <label for="floatingInput">Apellido autor</label>
                                                    </div>
                                                    <div class="form-floating mb-3">
                                                        <input type="text" class="form-control" id="floatingInput" value="${a.getNacionalidadAutor()}" name="txtNacionalidad" required>
                                                        <label for="floatingInput">Nacionalidad</label>
                                                    </div>
                                                    <div class="form-floating mb-3">
                                                        <input type="date" class="form-control" id="floatingInput" value="${a.getFechaNacimientoAutor()}" name="txtNacimiento" required>
                                                        <label for="floatingInput">Fecha de nacimiento</label>
                                                    </div>
                                                    <div class="form-floating">
                                                        <textarea class="form-control" id="floatingTextarea2" style="height: 100px" name="txtBiografia" required="on">${a.getBiografiaAutor()}</textarea>
                                                        <label for="floatingTextarea2">Biografia</label>
                                                    </div>
                                                </div>
                                                <div class="modal-footer">
                                                    <button type="button" class="btn btn-primary" name="accion" value="Editar">Actualizar</button>
                                                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Cancelar</button>
                                                </div>
                                            </div>
                                        </div>
                                    </form>
                                </div>
                                <a class="btn btn-danger"><i class="fa-solid fa-trash" style="color: #ffffff;"></i></a>
                            </td>  
                        </tr>
                    </c:forEach>
                </tbody>
            </table>
        </div>
        <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.8/dist/umd/popper.min.js" integrity="sha384-I7E8VVD/ismYTF4hNIPjVp/Zjvgyol6VFvRkX/vR+Vc4jQkC+hVqc2pM8ODewa9r" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.min.js" integrity="sha384-Rx+T1VzGupg4BHQYs2gCW9It+akI2MM/mndMCy36UVfodzcJcF0GGLxZIzObiEfa" crossorigin="anonymous"></script>
    </body>
</html>