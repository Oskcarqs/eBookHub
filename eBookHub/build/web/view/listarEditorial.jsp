<%-- 
    Document   : listarEditorial
    Created on : 18/07/2023, 10:00:04 PM
    Author     : PC
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page import="java.util.Iterator"%>
<%@page import="model.Editorial"%>
<%@page import="java.util.List"%>
<%@page import="modelDAO.EditorialDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!doctype html>
<html lang="en">
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>Bootstrap demo</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-4bw+/aepP/YC94hEpVNVgiZdgIC5+VKNBQNGCHeKRQN+PtmoHDEXuppvnDJzQIu9" crossorigin="anonymous">
        <!-- SCRIPT DE LA LIBRERIA DE ICONO-->
        <script src="https://kit.fontawesome.com/2833bb8570.js" crossorigin="anonymous"></script>
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

        <div class="container-fluid mt-3">
            <div class="row gx-3">
                <div class="col-8">
                    <table class="table aling-middle table-striped text-center table-hover">
                        <thead class="table-dark">
                            <tr>
                                <td>Editorial</td>
                                <td class="col-sm-5">Descripcion</td>
                                <td>Acciones</td>
                            </tr>
                        </thead>
                        <tbody>
                            <c:forEach var="e" items="${editorial}">
                                <tr>                            
                                    <td>${e.getNombreEditorial()}</td>
                                    <td>${e.getDescripcionEditorial()}</td>
                                    <td>
                                        <button type="button" class="btn btn-warning btn-sm" data-bs-toggle="modal" data-bs-target="#editarModal${e.getIdEditorial()}">
                                            <i class="fa-solid fa-pen-to-square" style="color: #ffffff;"></i>
                                        </button>

                                        <div class="modal fade" id="editarModal${e.getIdEditorial()}" tabindex="-1" aria-labelledby="editarModalLabel${e.getIdEditorial()}" aria-hidden="true">
                                            <form action="Controlador?menu=Editorial&codigoEditorial=${e.getIdEditorial()}" method="POST" autocomplete="off" >
                                                <div class="modal-dialog">
                                                    <div class="modal-content">
                                                        <div class="modal-header">
                                                            <!-- Titulo -->
                                                            <h1 class="modal-title fs-5" id="exampleModalLabel">Editar editorial</h1>
                                                            <button type="button" class="btn btn-white" data-bs-dismiss="modal" aria-label="Close"><i class="fa-solid fa-xmark fa-xl" style="color: #000000;"></i></button>
                                                        </div>
                                                        <div class="modal-body">
                                                            <!-- FORMUlARIO PARA EDITAR -->
                                                            <div class="form-floating my-3">
                                                                <input type="text" class="form-control form-control-sm" id="floatingInput" name="txtEditorial" value="${e.getNombreEditorial()}" required>
                                                                <label for="floatingInput">Editorial</label>
                                                            </div>
                                                            <div class="form-floating my-3">
                                                                <textarea class="form-control" name="txtDescripcion" id="floatingTextarea" style="height: 150px" required="on">${e.getDescripcionEditorial()}</textarea>
                                                                <label for="floatingTextarea">Descripcion</label>
                                                            </div>
                                                        </div>
                                                        <div class="modal-footer">
                                                            <button type="submit" class="btn btn-primary" name="accion" value="Editar">Actualizar</button>
                                                            <button type="submit" class="btn btn-secondary" data-bs-dismiss="modal">Cancelar</button>
                                                        </div>
                                                    </div>
                                                </div>
                                            </form>
                                        </div>
                                        <a class="btn btn-danger btn-sm" href="Controlador?menu=Editorial&accion=Eliminar&codigoEditorial=${e.getIdEditorial()}"><i class="fa-solid fa-trash" style="color: #ffffff;"></i></a>
                                    </td>
                                </tr>
                            </c:forEach>
                        </tbody>
                    </table>
                </div>

                <div class="col-4">
                    <!-- FORMUlARIO PARA AGREGAR -->
                    <form action="Controlador?menu=Editorial" method="POST" autocomplete="off">
                        <div class="card">
                            <div class="card-header text-center">
                                <h5>Agregar editorial</h5>
                            </div>
                            <div class="card-body">
                                <div class="form-floating my-3">
                                    <input type="text" class="form-control form-control-sm" id="floatingInput" name="txtEditorial" required>
                                    <label for="floatingInput">Editorial</label>
                                </div>
                                <div class="form-floating my-3">
                                    <textarea class="form-control" name="txtDescripcion" id="floatingTextarea" style="height: 150px" required="on"></textarea>
                                    <label for="floatingTextarea">Descripcion</label>
                                </div>
                                <div class="d-flex justify-content-end">
                                    <button type="submit" name="accion" value="Agregar" class="btn btn-success mx-2">Agregar</button>
                                    <button type="submit" name="accion" value="Cancelar" class="btn btn-secondary">Cancelar</button>
                                </div>
                            </div>
                        </div>
                    </form>
                </div>
            </div>
        </div>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-HwwvtgBNo3bZJJLYd8oVXjrBZt8cqVSpeBNS5n7C8IVInixGAoxmnlMuBnhbgrkm" crossorigin="anonymous"></script>
    </body>
</html>
