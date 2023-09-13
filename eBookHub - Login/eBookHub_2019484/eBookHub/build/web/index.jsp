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
        <title>eBookHub</title>
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
                                <li><a class="dropdown-item" href="view/listarCliente.jsp">Clientes</a></li>
                                <li><a class="dropdown-item" href="view/listarEmpleado.jsp">Empleados</a></li>
                                <li><a class="dropdown-item" href="view/listarFactura.jsp">Facturas</a></li>
                                <li><a class="dropdown-item" href="view/listarSucursal.jsp">Sucursal</a></li>
                                <li><a class="dropdown-item" href="Controlador?menu=TipoServicio&accion=Listar">Tipo Servicio</a></li>
                                <li><a class="dropdown-item" href="Controlador?menu=Servicio&accion=Listar">Servicio</a></li>
                                <li><a class="dropdown-item" href="Controlador?menu=Editorial&accion=Listar">Editorial</a></li>
                                <li><a class="dropdown-item" href="Controlador?menu=Autor&accion=Listar">Autor</a></li>
                                <li><a class="dropdown-item" href="Controlador?menu=Categoria&accion=Listar">Categoria</a></li>
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
                    <button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#exampleModal1" >Sign Up</button>
                    &nbsp;
                    &nbsp;  
                    <button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#exampleModal" >Sign In</button>
                </div>
            </div>
        </nav>
        <div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">
                    <form action="Validar" method="POST" autocomplete="off">
                        <div class="modal-header">
                            <!-- Titulo -->
                            <h1 class="modal-title fs-5" id="exampleModalLabel">Login</h1>
                            <button type="button" class="btn btn-white" data-bs-dismiss="modal" aria-label="Close"><i class="fa-solid fa-xmark fa-xl" style="color: #000000;"></i></button>
                        </div>
                        <div class="modal-body">
                            <!-- FORMUlARIO PARA AGREGAR -->
                            <div class="form-floating mb-3">
                                <input type="text" class="form-control" id="txtEmail" name="txtEmail" required>
                                <label for="txtEmail">Usuario</label>
                            </div>
                            <div class="form-floating mb-3">
                                <input type="password" class="form-control" id="txtClave" name="txtClave" required>
                                <label for="txtClave">Contraseña</label>
                            </div>
                        </div>
                        <div class="modal-footer">
                            <button type="submit" class="btn btn-secondary" data-bs-dismiss="modal">Cancelar</button>
                            <button type="submit" class="btn btn-primary" name="accion" value="Ingresar">Logear</button>
                        </div>
                    </form>
                </div>
            </div>
        </div>
        <div class="modal fade" id="exampleModal1" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">
                    <form action="Controlador?menu=Cliente" method="POST" enctype="multipart/form-data" autocomplete="off">
                        <div class="modal-header">
                            <!-- Titulo -->
                            <h1 class="modal-title fs-5" id="exampleModalLabel">Registrar Cuenta</h1>
                            <button type="button" class="btn btn-white" data-bs-dismiss="modal" aria-label="Close"><i class="fa-solid fa-xmark fa-xl" style="color: #000000;"></i></button>
                        </div>
                        <div class="modal-body">
                            <!-- FORMUlARIO PARA AGREGAR -->
                            <div class="form-floating mb-3">
                                <input type="text" class="form-control" id="floatingInput" name="txtNombreCliente" required>
                                <label for="floatingInput">Nombre del Cliente</label>
                            </div>
                            <div class="form-floating mb-3">
                                <input type="text" class="form-control" id="floatingInput" name="txtApellidoCliente" required>
                                <label for="floatingInput">Apellido del Cliente</label>
                            </div>
                            <div class="form-floating mb-3">
                                <input type="date" class="form-control" id="floatingInput" name="txtNacimientoCliente" required>
                                <label for="floatingInput">Fecha de Nacimiento</label>
                            </div>
                            <div class="form-floating mb-3">
                                <input type="text" class="form-control" id="floatingInput" name="txtDireccionCliente" required>
                                <label for="floatingInput">Dirección de Cliente</label>
                            </div>
                            <div class="form-floating mb-3">
                                <input type="text" class="form-control" id="floatingInput" name="txtTelefonoCliente" required>
                                <label for="floatingInput">Teléfono de Cliente</label>
                            </div>
                            <div class="form-floating mb-3">
                                <input type="text" class="form-control" id="floatingInput" name="txtNombreUsuario" required>
                                <label for="floatingInput">Usuario</label>
                            </div>
                            <div class="form-floating mb-3">
                                <input type="text" class="form-control" id="floatingInput" required="@kinal.edu.gt" name="txtCorreoUsuario" >
                                <label for="floatingInput">Email</label>
                            </div>

                            <div class="form-floating mb-3">
                                <input type="password" class="form-control" id="floatingInput" name="txtpassword" required>
                                <label for="floatingInput">Contraseña</label>
                            </div>
                            <div class="form-floating mb-3">
                                <input type="file" name="fileImgCLiente" class="form-control">
                                <label for="floatingInput">Foto Del Cliente</label>
                            </div>
                        </div>

                        <div class="modal-footer">
                            <button type="submit" class="btn btn-secondary" data-bs-dismiss="modal">Cancelar</button>
                            <button type="submit" class="btn btn-primary" name="accion" value="AgregarCuenta">Crear Cuenta</button>
                        </div>
                    </form>
                </div>
            </div>
        </div>
        <header id="inicio" class="bg-dark text-white text-center">
            <div class="container">
                <div id="carouselExampleAutoplaying" class="carousel slide" data-bs-ride="carousel">
                    <div class="carousel-inner">
                        <div class="carousel-item active">
                            <img src="img/slide1.jpg" class="d-block w-100" alt="...">
                        </div>
                        <div class="carousel-item">
                            <img src="img/slide2.jpg" class="d-block w-100" alt="...">
                        </div>
                        <div class="carousel-item">
                            <img src="img/slide3.jpg" class="d-block w-100" alt="...">
                        </div>
                    </div>
                    <button class="carousel-control-prev" type="button" data-bs-target="#carouselExampleAutoplaying" data-bs-slide="prev">
                        <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                        <span class="visually-hidden">Previous</span>
                    </button>
                    <button class="carousel-control-next" type="button" data-bs-target="#carouselExampleAutoplaying" data-bs-slide="next">
                        <span class="carousel-control-next-icon" aria-hidden="true"></span>
                        <span class="visually-hidden">Next</span>
                    </button>
                </div>
            </div>
        </header>
        <section>
            <div class="container-fluid py-3">
                <h2 class="text-center mb-5">Libros</h2>
            </div>
        </section>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-HwwvtgBNo3bZJJLYd8oVXjrBZt8cqVSpeBNS5n7C8IVInixGAoxmnlMuBnhbgrkm" crossorigin="anonymous"></script>
    </body>
</html>