<%-- 
    Document   : Carrito
    Created on : 10/09/2023, 02:33:07 AM
    Author     : Brandon Mendoza
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!doctype html>
<html lang="en">
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>Carrito Guatemala | eBookHub</title>
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/css/bootstrap.min.css" integrity="sha384-TX8t27EcRE3e/ihU7zmQxVncDAy5uIKz4rEkgIXeMed4M0jlfIDPvg6uqKI2xXr2" crossorigin="anonymous">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-4bw+/aepP/YC94hEpVNVgiZdgIC5+VKNBQNGCHeKRQN+PtmoHDEXuppvnDJzQIu9" crossorigin="anonymous">
        <!-- SCRIPT DE LA LIBRERIA DE ICONO-->
        <script src="https://kit.fontawesome.com/2833bb8570.js" crossorigin="anonymous"></script>
        <style>
            /* Estilos base para los botones */
            .mi-boton {
                width: 80%;
                height: 7vh;
                border-radius: 10px;
                border: none;
                font-size: 18px;
                margin-bottom: 10px;
                cursor: pointer;
                margin-left: auto;
                margin-right: auto;
            }

            /* Estilo predeterminado */
            .mi-boton-FinCompra {
                background-color: orange;
                color: white;
            }

            /* Estilo para el botón "Agregar otro Producto" */
            .mi-boton-agregar {
                background-color: #05ab58;
                color: white;
            }

            /* Estilo para el botón "Limpiar Carrito" */
            .mi-boton-limpiar {
                background-color: transparent;
                color: gray;
                border: 1px solid gray;
            }

            /* Efecto hover */
            .mi-boton:hover {
                opacity: 0.9; /* Cambia la opacidad al pasar el mouse por encima */
            }

            @media print{
                .parte01, .btn, .accion, .a{
                    display: none;
                }
            }
        </style>
    </head>
    <body>
        <nav class="parte01 navbar navbar-expand-lg sticky-top navbar-dark bg-dark">
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

                    <div>
                        <li class="nav-item">
                            <a style="margin-left: 10px; border: none" class="btn btn-outline-success" class="nav-link" href="ControladorCarrito?menu=Carrito&accion=Listar"><img src="img/carrito.png" alt="" width="30"/></a>
                        </li>
                    </div>

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
            <form action="ControladorCarrito?menu=Carrito" method="Post">
                <div class="card-body">
                    <div class="form-group d-flex">
                        <label>Datos del Cliente</label>
                    </div>
                    <!--Formulario Cliente-->
                    <div class="form-group d-flex">
                        <div class="col-sm-2 d-flex">
                            <input type="text" name="txtCodigoCliente" value="${cl.getIdCliente()}" class="form-control" placeholder="Codigo" required>
                            <button type="submit" name="accion" value="BuscarCliente" class="btn btn-outline-info">Buscar</button>
                        </div>
                        <div class="col-sm-2">
                            <input type="text" name="txtNombreCliente" value="${cl.getNombreCliente()}" class="form-control" readonly required>
                        </div>
                        <div class="col-sm-2">

                            <input type="text" name="txtApellidoCliente" value="${cl.getApellidoCliente()}" class="form-control" readonly required>
                        </div>

                        <div class="d-flex col-sm-4 ml-auto" >
                            <label>Numero de serie:</label>
                            <input type="text" name="txtNumeroSerie" placeholder="${nserie}" class="form-control" readonly><br>
                        </div>

                    </div>

                </div>
            </form>
            <div class="row gx-3">
                <div class="col-8">
                    <!-- FORMUlARIO PARA AGREGAR -->
                    <form action="ControladorCarrito?menu=Carrito" method="POST" autocomplete="off">
                        <div class="card">
                            <div class="card-header text-left">
                                <h1>Mi Carrito</h1>
                                <h5>Productos Disponibles</h5>
                            </div>
                            <table class="table table-hover">
                                <thead>
                                    <tr>
                                        <th class="accion">ACCION</th>
                                        <th>NOMBRE</th>
                                        <th>PRECIO</th>
                                        <th>CANT</th>
                                        <th>SUBTOTAL</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <c:forEach var="car" items="${listaItemsCarrito}">
                                        <tr>
                                            <td class="col-sm-1 parte01">
                                    <center>
                                        <a href="ControladorCarrito?menu=Carrito&accion=Delete&idLibro=${car.getIdLibro()}&subTotal=${car.getSubTotal()}&items=${car.getItem()}"><img src="img/eliminar.png" alt="" width="30"/></a>
                                    </center>       
                                    </td>
                                    <td class="col-sm-5">${car.getNombre()}</td>
                                    <td>${car.getPrecioCompra()}</td>
                                    <td>${car.getCantidad()}</td>
                                    <td>${car.getSubTotal()}</td>
                                    </tr>
                                </c:forEach>
                                </tbody>
                            </table>
                        </div>
                    </form>
                </div>

                <div class="col-4">
                    <form action="ControladorCarrito?menu=Carrito" method="POST" autocomplete="off">
                        <div class="card">
                            <div class="card-header text-left">
                                <h1>Resumen</h1>
                                <hr>
                            </div>
                            <div class="card-body">
                                <div class="card-body">
                                    <div class="card-body">
                                        <label><h3>Total Pagar:</h3></label>
                                        <input type="text" value="Q.${totalPagar}0" maxlength="5"  readonly="" class="form-control" disabled>
                                    </div>
                                    <div class="parte01">
                                        <button type="button" class="mi-boton mi-boton-FinCompra" data-bs-toggle="modal" data-bs-target="#metodosCompra">
                                            <h5>Finalizar mi compra</h5>
                                        </button>
                                        <button class="mi-boton mi-boton-agregar" type="submit" name="accion" value="AgregarMasPro"><h5>Agregar otro Producto</h5></button>
                                        <button class="mi-boton mi-boton-limpiar" type="submit" name="accion" value="LimpiarCarrito"><h5>Limpiar Carrito</h5></button>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </form>
                </div>
                <!-- Modal Metodos de Compra-->
                <div class="modal fade parte01" id="metodosCompra" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
                    <div class="modal-dialog">
                        <div class="modal-content">
                            <div class="modal-header">
                                <h1 class="modal-title fs-5" id="exampleModalLabel">Formas de Entrega</h1>
                                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                            </div>
                            <div class="modal-body">
                                <center>
                                    <button type="button" class="btn btn-secondary" data-bs-toggle="modal" data-bs-target="#recogTien">
                                        <h4>Recoger en tienda ></h4>
                                    </button>
                                </center><br><br>
                                <center>
                                    <button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#online">
                                        <h4>Comprar En Linea ></h4>
                                    </button>
                                </center>
                            </div>
                        </div>
                    </div>
                </div>                

                <!-- Modal Recoger Ena Tienda -->
                <div class="parte01 modal fade" id="recogTien" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
                    <div class="modal-dialog">
                        <div class="modal-content">
                            <div class="modal-header">
                                <h1 class="modal-title fs-5" id="exampleModalLabel">Tienda</h1>
                                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                            </div>
                            <div class="modal-body">
                                <p>Elige la sucursal para recoger tu producto</p>
                                <select class="form-select" id="floatingSelect" aria-label="Floating label select example" name="txtIdAutor" required>
                                    <option value="" disabled selected hidden> </option>
                                    <c:forEach items="${sucursal}" var="s">
                                        <option value="${s.getIdSucursal()}">${s.getNombreSucursal()}</option>
                                    </c:forEach>
                                </select>
                            </div>
                            <div class="modal-footer">
                                <a type="submit" class="btn btn-primary" href="ControladorCarrito?menu=Carrito&accion=Comprar">Generar Compra</a>
                            </div>
                        </div>
                    </div>
                </div>

                <!-- Modal Online-->
                <div class="modal fade parte01" id="online" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
                    <div class="modal-dialog">
                        <div class="modal-content">
                            <div class="modal-header">
                                <h1 class="modal-title fs-5" id="exampleModalLabel">Online</h1>
                                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                            </div>
                            <div class="modal-body">
                                <div class="form-floating mb-3">
                                    <input type="text" class="form-control" id="floatingInput" name="txtNumTargeta" required>
                                    <label for="floatingInput">Num.Tarjeta</label>
                                </div>
                                <div class="form-floating mb-3">
                                    <input type="date" class="form-control" id="floatingInput" name="txtFechaCad" required>
                                    <label for="floatingInput">Fecha Caducidad</label>
                                </div>
                                <div class="form-floating mb-3">
                                    <input type="text" class="form-control" id="floatingInput" name="txtTituloTarj" required>
                                    <label for="floatingInput">Titular Tarjeta</label>
                                </div>
                                <div class="form-floating mb-3">
                                    <input type="text" class="form-control" id="floatingInput" name="txtEmisor" placeholder="visa, mastercard" required>
                                    <label for="floatingInput">Emisor</label>
                                </div>
                                <div class="form-floating mb-3">
                                    <input type="text" class="form-control" id="floatingInput" name="txtCvv" maxlength="3" required>
                                    <label for="floatingInput">CVV</label>
                                </div>
                            </div>
                            <div class="modal-footer">
                                <a type="submit" class="btn btn-primary" href="ControladorCarrito?menu=Carrito&accion=Comprar">Generar Compra</a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <%-- Alerta de éxito --%>
        <% String mensaje = (String) request.getAttribute("mensaje"); %>
        <% if (mensaje != null && !mensaje.isEmpty()) {%>
        <script>
            alert("<%= mensaje%>");
        </script>
        <% } %>

        <%-- Alerta de error --%>
        <% String errorMensaje = (String) request.getAttribute("errorMensaje"); %>
        <% if (errorMensaje != null && !errorMensaje.isEmpty()) {%>
        <script>
            alert("<%= errorMensaje%>");
        </script>
        <% }%>   
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-HwwvtgBNo3bZJJLYd8oVXjrBZt8cqVSpeBNS5n7C8IVInixGAoxmnlMuBnhbgrkm" crossorigin="anonymous"></script>
        <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js" integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN" crossorigin="anonymous"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js" integrity="sha384-B4gt1jrGC7Jh4AgTPSdUtOBvfO8shuf57BaghqFfPlYxofvL8/KUEfYiJOMMV+rV" crossorigin="anonymous"></script>
    </body>
</html>
