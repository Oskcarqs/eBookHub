<%-- 
Document   : Catalogo
Created on : 4/09/2023, 01:28:44 PM
Author     : Admin
--%>



<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="es">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Catálogo de Libros</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-4bw+/aepP/YC94hEpVNVgiZdgIC5+VKNBQNGCHeKRQN+PtmoHDEXuppvnDJzQIu9" crossorigin="anonymous">
        <link rel="stylesheet" href="https://unpkg.com/aos@next/dist/aos.css" />
        <script src="https://kit.fontawesome.com/2833bb8570.js" crossorigin="anonymous"></script>
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

        <div class=" container-fluid px-5">
            <h1 class="my-4">Catalogo de libros</h1>
            <div class="d-flex justify-content-end"> 
                <button type="button" class="btn btn-primary mb-5" data-bs-toggle="modal" data-bs-target="#exampleModal">
                    <i class="fa-solid fa-book" style="color: #ffffff;"></i> Agregar Libro
                </button>
                <!-- Modal -->
                <div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
                    <div class="modal-dialog">
                        <div class="modal-content">
                            <form action="Controlador?menu=Libro" method="POST" enctype="multipart/form-data" autocomplete="off">
                                <div class="modal-header">
                                    <!-- Titulo -->
                                    <h1 class="modal-title fs-5" id="exampleModalLabel">Agregar Libro</h1>
                                    <button type="button" class="btn btn-white" data-bs-dismiss="modal" aria-label="Close"><i class="fa-solid fa-xmark fa-xl" style="color: #000000;"></i></button>
                                </div>
                                <div class="modal-body">
                                    <!-- FORMUlARIO PARA AGREGAR -->
                                    <div class="mb-3">
                                        <label for="formFile" class="form-label">Foto del libro</label>
                                        <input class="form-control" type="file" id="formFile" required name="fotoLibro">
                                    </div>
                                    <div class="form-floating mb-3">
                                        <input type="text" class="form-control" id="floatingInput" name="txtTituloLibro" required>
                                        <label for="floatingInput">Titulo Libro</label>
                                    </div>
                                    <div class="form-floating mb-3">
                                        <textarea class="form-control" minlength="50" id="floatingTextarea2" style="height: 100px" name="txtDescripcionLibro" required="on"></textarea>
                                        <label for="floatingTextarea2">Descripción Libro</label>
                                    </div>
                                    <div class="form-floating mb-3">
                                        <input type="date" class="form-control" id="floatingInput" name="txtFechaDePublicacion" required>
                                        <label for="floatingInput">Fecha de Publicación</label>
                                    </div>
                                    <div class="form-floating mb-3">
                                        <input type="text" class="form-control" id="floatingInput" name="txtIdiomaLibro" required>
                                        <label for="floatingInput">Idioma Libro</label>
                                    </div>
                                    <div class="form-floating mb-3">
                                        <input type="text" class="form-control" id="floatingInput" name="txtCostoLibro" required>
                                        <label for="floatingInput">Costo Libro</label>
                                    </div>
                                    <div class="form-floating mb-3">
                                        <input type="text" class="form-control" id="floatingInput" name="txtTipoLibro" required>
                                        <label for="floatingInput">Tipo Libro</label>
                                    </div>
                                    <div class="form-floating mb-3">
                                        <input type="number" class="form-control" id="floatingInput" name="txtStockLibro" required>
                                        <label for="floatingInput">Stok Libro</label>
                                    </div>
                                    <div class="form-floating mb-3">
                                        <select class="form-select" id="floatingSelect" aria-label="Floating label select example" name="txtIdAutor" required>
                                            <option value="" disabled selected hidden> </option>
                                            <c:forEach items="${autor}" var="a">
                                                <option value="${a.getIdAutor()}">${a.getNombreAutor()} ${a.getApellidoAutor()}</option>
                                            </c:forEach>
                                        </select>
                                        <label for="floatingSelect">Autor del libro</label>
                                    </div>
                                    <div class="form-floating mb-3">
                                        <select class="form-select" id="floatingSelect" aria-label="Floating label select example" name="txtIdEditorial" required>
                                            <option value="" disabled selected hidden> </option>
                                            <c:forEach items="${editorial}" var="e">
                                                <option value="${e.getIdEditorial()}">${e.getNombreEditorial()}</option>
                                            </c:forEach>
                                        </select>
                                        <label for="floatingSelect">Editorial</label>
                                    </div>
                                    <div class="form-floating mb-3">
                                        <select class="form-select" id="floatingSelect" aria-label="Floating label select example" name="txtIdCategoria" required>
                                            <option value="" disabled selected hidden> </option>
                                            <c:forEach items="${categoria}" var="c">
                                                <option value="${c.getIdCategoria()}">${c.getNombreCategoria()}</option>
                                            </c:forEach>
                                        </select>
                                        <label for="floatingSelect">Categoria</label>
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
            <form action="Controlador?menu=Libro" method="POST" class="d-flex" autocomplete="off">
                <div class="input-group">
                    <div class="form-outline">
                        <input class="form-control" name="txtBuscar" type="search" placeholder="Buscar" aria-label="Buscar" required>
                    </div>
                    <button class="btn btn-dark" name="accion" value="Buscar" type="submit"><i class="fa-solid fa-magnifying-glass" style="color: #ffffff;"></i></button>
                </div>
                <a>Libros</a>
            </form>     
        </div>

        <div class="container-fluid p-5">
            <div class="row">
                <c:forEach var="l" items="${libro}">
                    <div class="col-lg-3 col-md-4 col-sm-6 mb-4">
                        <div data-aos="zoom-in" class="card shadow-lg border-light rounded h-100">
                            <a href="#" class="" data-bs-toggle="modal" data-bs-target="#detalles${l.getIdLibro()}"><img  class="card-img-top" src="ControladorIMG?menu=Libro&idLibro=${l.getIdLibro()}" height="400" alt=""></a>
                            <div class="card-body">
                                <h4 class="card-title">
                                    <a href="#" class="link-dark link-offset-2 link-underline link-underline-opacity-0 ">${l.getTituloLibro()}</a>
                                </h4>
                                <p class="card-text">Q ${l.getCostoLibro()}</p>
                            </div>
                        </div>
                        <div class="modal fade" id="detalles${l.getIdLibro()}" tabindex="-1" aria-labelledby="detallesLabel${l.getIdLibro()}" aria-hidden="true">
                            <div class="modal-dialog  modal-dialog-centered modal-xl">
                                <div class="modal-content">
                                    <div class="modal-header">
                                        <h5 class="modal-title" id="exampleModalLabel">Libro: ${l.getTipoLibro()}</h5>
                                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                                    </div>
                                    <div class="modal-body">
                                        <div class="row gx-5">
                                            <div class="col-3 text-center">
                                                <img src="ControladorIMG?menu=Libro&idLibro=${l.getIdLibro()}" height="400" alt="">
                                            </div>
                                            <div class="col-9 ">
                                                <div class="px-5">
                                                    <h1 id="exampleModalLabel">${l.getTituloLibro()}</h1>
                                                    <h4 class="text-success">Q${l.getCostoLibro()}</h4>
                                                    <p class="fs-5">${l.getDescripcionLibro()}</p>
                                                    <p class="fw-bold">Fecha de publicacion: ${l.getFechaDePublicacion()}</p>
                                                    <p>
                                                        <span class="fw-medium">Categoria:</span> ${l.getNombreCategoria()},
                                                        <span class="fw-medium">Idioma:</span> ${l.getIdiomaLibro()},
                                                        <span class="fw-medium">Editorial:</span> ${l.getNombreEditorial()},
                                                        <span class="fw-medium">Autor:</span> ${l.getNombreAutor()} ${l.getApellidoAutor()}
                                                    </p>
                                                    <div class="row mt-5 text-center">
                                                        <div class="col">
                                                            <ul class="list-group w-75">
                                                                <li class="list-group-item d-flex justify-content-between align-items-center">
                                                                    Disponibilidad
                                                                    <span class="badge bg-primary rounded-pill">${l.getStockLibro()}</span>
                                                                </li>
                                                            </ul>
                                                        </div>
                                                        <div class="col">
                                                            <a class="btn btn-dark shadow"><i class="fa-solid fa-truck" style="color: #ffffff;"></i> Agregar al carrito</a>
                                                        </div>
                                                    </div>

                                                </div>                      
                                            </div>
                                        </div>

                                    </div>

                                    <div class="modal-footer">
                                        <button type="button" class="btn btn-warning btn-sm" data-bs-toggle="modal" data-bs-target="#editarModal${l.getIdLibro()}">
                                            <i class="fa-solid fa-pen-to-square" style="color: #ffffff;"></i>
                                        </button>
                                        <a class="btn btn-danger btn-sm" href="Controlador?menu=Libro&accion=Eliminar&idLibro=${l.getIdLibro()}"><i class="fa-solid fa-trash" style="color: #ffffff;"></i></a>
                                    </div>
                                </div>
                            </div>
                        </div>   
                        <div class="modal fade" id="editarModal${l.getIdLibro()}" tabindex="-1" aria-labelledby="editarModalLabel${l.getIdLibro()}" aria-hidden="true">
                            <form action="Controlador?menu=Libro&codigoLibro=${l.getIdLibro()}" method="POST" autocomplete="off" >
                                <div class="modal-dialog">
                                    <div class="modal-content">
                                        <div class="modal-header">
                                            <!--  -->
                                            <h1 class="modal-title fs-5" id="exampleModalLabel">Editar Libro</h1>
                                            <button type="button" class="btn btn-white" data-bs-dismiss="modal" aria-label="Close"><i class="fa-solid fa-xmark fa-xl" style="color: #000000;"></i></button>
                                        </div>
                                        <div class="modal-body">
                                            <div class="form-floating mb-3">
                                                <input type="text" class="form-control" id="floatingInput" value="${l.getTituloLibro()}" name="txtTituloLibro" required>
                                                <label for="floatingInput">Titulo Libro</label>
                                            </div>
                                            <div class="form-floating">
                                                <textarea class="form-control" id="floatingTextarea2" style="height: 100px" name="txtDescripcionLibro" required="on">${l.getDescripcionLibro()}</textarea>
                                                <label for="floatingTextarea2">Descripción Libro</label>
                                            </div>
                                            <div class="form-floating mb-3">
                                                <input type="date" class="form-control" id="floatingInput" value="${l.getFechaDePublicacion()}" name="txtFechaDePublicacion" required>
                                                <label for="floatingInput">Fecha de Publicación</label>
                                            </div>
                                            <div class="form-floating mb-3">
                                                <input type="text" class="form-control" id="floatingInput" value="${l.getIdiomaLibro()}" name="txtIdiomaLibro" required>
                                                <label for="floatingInput">Idioma Libro</label>
                                            </div>
                                            <div class="form-floating mb-3">
                                                <input type="text" class="form-control" id="floatingInput" value="${l.getCostoLibro()}" name="txtCostoLibro" required>
                                                <label for="floatingInput">Costo Libro</label>
                                            </div>
                                            <div class="form-floating mb-3">
                                                <input type="text" class="form-control" id="floatingInput" value="${l.getTipoLibro()}" name="txtTipoLibro" required>
                                                <label for="floatingInput">Tipo Libro</label>
                                            </div>
                                            <div class="form-floating mb-3">
                                                <input type="number" class="form-control" id="floatingInput" value="${l.getStockLibro()}" name="txtStockLibro" required>
                                                <label for="floatingInput">Stok Libro</label>
                                            </div>
                                            <div class="form-floating mb-3">
                                                <input type="text" class="form-control" id="floatingInput" value="${l.getIdAutor()}" name="txtIdAutor" required>
                                                <label for="floatingInput">ID Autor</label>
                                            </div>
                                            <div class="form-floating mb-3">
                                                <input type="text" class="form-control" id="floatingInput" value="${l.getIdEditorial()}" name="txtIdEditorial" required>
                                                <label for="floatingInput">ID Editorial</label>
                                            </div>
                                            <div class="form-floating mb-3">
                                                <input type="text" class="form-control" id="floatingInput" value="${l.getIdCategoria()}" name="txtIdCategoria" required>
                                                <label for="floatingInput">ID Categoria</label>
                                            </div>
                                        </div>
                                        <div class="modal-footer">
                                            <button type="submit" class="btn btn-primary" data-bs-toggle="modal" name="accion" value="Actualizar">Actualizar</button>
                                            <button type="button" class="btn btn-secondary" data-bs-toggle="modal" >Cancelar</button>
                                        </div>
                                    </div>
                                </div>
                            </form>
                        </div>
                    </div>
                </c:forEach>
            </div>
        </div>
        <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.8/dist/umd/popper.min.js" integrity="sha384-I7E8VVD/ismYTF4hNIPjVp/Zjvgyol6VFvRkX/vR+Vc4jQkC+hVqc2pM8ODewa9r" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.min.js" integrity="sha384-Rx+T1VzGupg4BHQYs2gCW9It+akI2MM/mndMCy36UVfodzcJcF0GGLxZIzObiEfa" crossorigin="anonymous"></script>
        <script src="https://unpkg.com/aos@next/dist/aos.js"></script>
        <script>
            AOS.init();
        </script>
    </body>
</html>