<%-- 
    Document   : listarCliente
    Created on : 21/07/2023, 03:24:56 PM
    Author     : Usuario
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Listar Cliente</title>
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">      
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-4bw+/aepP/YC94hEpVNVgiZdgIC5+VKNBQNGCHeKRQN+PtmoHDEXuppvnDJzQIu9" crossorigin="anonymous">
        <script src="https://kit.fontawesome.com/2833bb8570.js" crossorigin="anonymous"></script>
        <script src="../Scripts.js"></script>


    </head>
    <body>
        <nav class="navbar navbar-expand-lg sticky-top navbar-dark bg-dark">
            <div class="container-fluid"> 
                <a class="navbar-brand mx-3" href="#">
                    <img src="img/LogoEBookHubNavBar.png" alt="Logo" width="30" height="30" class="d-inline-block align-text-top">
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
                            <a class="nav-link mx-2" aria-current="page" href="Controlador?menu=Libro&accion=Listar">Libros</a>
                        </li>
                        <li class="nav-item dropdown mx-2">
                            <a class="nav-link dropdown-toggle" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false">
                                Mas
                            </a>
                            <ul class="dropdown-menu">
                                <li><a class="dropdown-item" href="Controlador?menu=Cliente&accion=Listar">Clientes</a></li> 
                                <li><a class="dropdown-item" href="view/listarEmpleado.jsp">Empleados</a></li>
                                <li><a class="dropdown-item" href="Controlador?menu=Factura&accion=Listar">Facturas</a></li>
                                <li><a class="dropdown-item" href="Controlador?menu=DetalleFactura&accion=Listar">Detalle Factura</a></li>
                                <li><a class="dropdown-item" href="Controlador?menu=Sucursal&accion=Listar">Sucursal</a></li>
                                <li><a class="dropdown-item" href="Controlador?menu=TipoServicio&accion=Listar">Tipo Servicio</a></li>
                                <li><a class="dropdown-item" href="Controlador?menu=Servicio&accion=Listar">Servicio</a></li>
                                <li><a class="dropdown-item" href="Controlador?menu=Editorial&accion=Listar">Editorial</a></li>
                                <li><a class="dropdown-item" href="Controlador?menu=Autor&accion=Listar">Autor</a></li>
                                <li><a class="dropdown-item" href="view/listarCliente.jsp">Categoria</a></li>
                            </ul>
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
                    <i class="fa-solid fa-pen-fancy" style="color: #ffffff;"></i> Agregar Cliente
                </button>
                <!-- Modal -->
                <div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
                    <div class="modal-dialog">
                        <div class="modal-content">
                            <form action="Controlador?menu=Cliente" method="POST" enctype="multipart/form-data" autocomplete="off">
                                <div class="modal-header">
                                    <!-- Titulo -->
                                    <h1 class="modal-title fs-5" id="exampleModalLabel">Agregar Cliente</h1>
                                    <button type="button" class="btn btn-white" data-bs-dismiss="modal" aria-label="Close"><i class="fa-solid fa-xmark fa-xl" style="color: #000000;"></i></button>
                                </div>
                                <div class="modal-body">
                                    <!-- FORMUlARIO PARA AGREGAR -->
                                    <div class="form-floating mb-3">
                                        <input type="text" class="form-control" id="floatingInput" name="txtNombreCliente" required maxlength="35">
                                        <label for="floatingInput">Nombre Cliente</label>
                                    </div>
                                    <div class="form-floating mb-3">
                                        <input type="text" class="form-control" id="floatingInput" name="txtApellidoCliente" required maxlength="35">
                                        <label for="floatingInput">Apellido Cliente</label>
                                    </div>
                                    <div class="form-floating mb-3">
                                        <input type="date" class="form-control" id="floatingInput" name="txtNacimientoCliente" required placeholder="Selecciona la fecha">
                                        <label for="floatingInput">Fecha de nacimiento</label>
                                    </div>
                                    <div class="form-floating mb-3">
                                        <input type="text" class="form-control" id="floatingInput" name="txtDireccionCliente" required maxlength="75">
                                        <label for="floatingInput">Dirección Cliente</label>
                                    </div>
                                    <div class="form-floating mb-3">
                                        <input type="text" class="form-control" id="floatingInput" name="txtTelefonoCliente" required maxlength="10" >
                                        <label for="floatingInput">Telefono Cliente</label>
                                    </div>
                                    <div class="form-floating mb-3">
                                        <input type="text" class="form-control" id="floatingInput" name="txtNombreUsuario" required maxlength="50">
                                        <label for="floatingInput">Nombre Usuario</label>
                                    </div>
                                    <div class="form-floating mb-3">
                                        <input type="email" class="form-control" id="floatingInput" name="txtCorreoUsuario" required="@" maxlength="70">
                                        <label for="floatingInput">Correo Cliente</label>
                                    </div>
                                    <div class="form-floating mb-3">
                                        <input type="text" class="form-control" id="floatingInput" name="txtpassword" required maxlength="50">
                                        <label for="floatingInput">Contraseña</label>
                                    </div>
                                    <div class="form-floating mb-3">
                                        <input type="file" name="fileImgCLiente" class="form-control">
                                        <label for="floatingInput">Foto Del Cliente</label>
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
                        <td>Nacimiento</td>
                        <td>Direccion</td>
                        <td>Telefono</td>
                        <td>Usuario</td>
                        <td>Correo</td>
                        <td>Contraseña</td>
                        <td>Imagen</td>
                        <td>Acciones</td>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach var="cl" items="${cliente}">
                        <tr>
                            <td>${cl.getNombreCliente()}</td>
                            <td>${cl.getApellidoCliente()}</td>
                            <td>${cl.getFechaDeNacimientoCliente()}</td>
                            <td>${cl.getDireccionCliente()}</td>
                            <td>${cl.getTelefonoCliente()}</td>
                            <td>${cl.getNickNameUsuario()}</td>
                            <td>${cl.getEmailUsuario()}</td>
                            <td>${cl.getPasswordUsuario()}</td>
                            <td><img src="ControladorIMG?menu=Cliente&idCliente=${cl.getIdCliente()}" height="50"/></td>


                            <td>
                                <button type="button" class="btn btn-warning" data-bs-toggle="modal" data-bs-target="#editarModal${cl.getIdCliente()}">
                                    <i class="fa-solid fa-pen-to-square" style="color: #ffffff;"></i>
                                </button>
                                <div class="modal fade" id="editarModal${cl.getIdCliente()}" tabindex="-1" aria-labelledby="editarModalLabel${cl.getIdCliente()}" aria-hidden="true">
                                    <form action="Controlador?menu=Cliente&idCliente=${cl.getIdCliente()}" method="POST" enctype="multipart/form-data" autocomplete="off" >
                                        <div class="modal-dialog">
                                            <div class="modal-content">
                                                <div class="modal-header">
                                                    <!-- Titulo -->
                                                    <h1 class="modal-title fs-5" id="exampleModalLabel">Editar Cliente</h1>
                                                    <button type="button" class="btn btn-white" data-bs-dismiss="modal" aria-label="Close"><i class="fa-solid fa-xmark fa-xl" style="color: #000000;"></i></button>
                                                </div>
                                                <div class="modal-body">
                                                    <!-- FORMUlARIO PARA EDITAR -->
                                                    <div class="form-floating mb-3">
                                                        <input type="text" class="form-control" id="floatingInput" value="${cl.getNombreCliente()}" name="txtNombreCliente" required maxlength="35">
                                                        <label for="floatingInput">Nombre Cliente</label>
                                                    </div>
                                                    <div class="form-floating mb-3">
                                                        <input type="text" class="form-control" id="floatingInput" value="${cl.getApellidoCliente()}" name="txtApellidoCliente" required maxlength="35">
                                                        <label for="floatingInput">Apellido Cliente</label>
                                                    </div>
                                                    <div class="form-floating mb-3">
                                                        <input type="date" class="form-control" id="floatingInput" value="${cl.getFechaDeNacimientoCliente()}" name="txtNacimientoCliente" required placeholder="Selecciona tu fecha de nacimiento">
                                                        <label for="floatingInput">Fecha de nacimiento</label>
                                                    </div>
                                                    <div class="form-floating mb-3">
                                                        <input type="text" class="form-control" id="floatingInput" value="${cl.getDireccionCliente()}" name="txtDireccionCliente" required maxlength="75">
                                                        <label for="floatingInput">Dirección Cliente</label>
                                                    </div>
                                                    <div class="form-floating mb-3">
                                                        <input type="text" class="form-control" id="floatingInput" value="${cl.getTelefonoCliente()}" name="txtTelefonoCliente" required maxlength="8">
                                                        <label for="floatingInput">Telefono Cliente</label>
                                                    </div>
                                                    <div class="form-floating mb-3">
                                                        <input type="text" class="form-control" id="floatingInput" value="${cl.getNickNameUsuario()}" name="txtNombreUsuario" required maxlength="50">
                                                        <label for="floatingInput">Nombre Usuario</label>
                                                    </div>
                                                    <div class="form-floating mb-3">
                                                        <input type="email" class="form-control" id="floatingInput" value="${cl.getEmailUsuario()}" name="txtCorreoUsuario" required="@" maxlength="70">
                                                        <label for="floatingInput">Correo Cliente</label>
                                                    </div>
                                                    <div class="form-floating mb-3">
                                                        <input type="text" class="form-control" id="floatingInput" value="${cl.getPasswordUsuario()}" name="txtpassword" required maxlength="50">
                                                        <label for="floatingInput">Contraseña</label>
                                                    </div>
                                                    <div class="form-floating mb-3">
                                                        <input type="file" class="form-control" id="floatingInput" value="${cl.getImgCLiente()}" name="fileImgCLiente" required>
                                                        <label for="floatingInput">Foto Del Cliente</label>
                                                    </div>
                                                </div>
                                                <div class="modal-footer">
                                                    <button type="submit" class="btn btn-primary" name="accion" value="Actualizar">Actualizar</button>
                                                    <button type="reset" class="btn btn-secondary" data-bs-dismiss="modal">Cancelar</button>
                                                </div>
                                            </div>
                                        </div>
                                    </form>
                                </div>
                                <a class="btn btn-danger" href="Controlador?menu=Cliente&accion=Eliminar&idCliente=${cl.getIdCliente()}"><i class="fa-solid fa-trash" style="color: #ffffff;"></i></a>
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