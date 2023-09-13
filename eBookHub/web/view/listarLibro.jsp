<%-- 
    Document   : listarLibro
    Created on : 19-jul-2023, 21:56:22
    Author     : Ottoniel
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Listar Libro</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-4bw+/aepP/YC94hEpVNVgiZdgIC5+VKNBQNGCHeKRQN+PtmoHDEXuppvnDJzQIu9" crossorigin="anonymous">
        <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.8/dist/umd/popper.min.js" integrity="sha384-I7E8VVD/ismYTF4hNIPjVp/Zjvgyol6VFvRkX/vR+Vc4jQkC+hVqc2pM8ODewa9r" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.min.js" integrity="sha384-Rx+T1VzGupg4BHQYs2gCW9It+akI2MM/mndMCy36UVfodzcJcF0GGLxZIzObiEfa" crossorigin="anonymous"></script>
    </head>
    <body>
        <div class="container-fluid px-5 mt-5">

            <div class="d-flex justify-content-end">
                <button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#exampleModal">
                    Agregar libro
                </button>
            </div>

            <!-- Modal -->
            <div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
                <div class="modal-dialog modal-lg">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h1 class="modal-title fs-5" id="exampleModalLabel">Modal title</h1>
                            <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                        </div>
                        <div class="modal-body">
                            <form class="row g-3">
                                <div class="col-md-6">
                                    <label for="nombreLibro" class="form-label">Libro</label>
                                    <input type="text" class="form-control" id="nombreLibro" name="txtNombreLibro" placeholder="Nombre del título" required>
                                </div>
                                <div class="col-md-6">
                                    <label for="fecha" class="form-label">Fecha</label>
                                    <input type="date" class="form-control" id="fecha" name="txtFecha" required>
                                </div>
                                <div class="col-12">
                                    <label for="descripcion" class="form-label">Descripción</label>
                                    <textarea class="form-control" id="descripcion" rows="3" placeholder="Breve descripción del título" required></textarea>
                                </div>
                                <div class="col-md-6">
                                    <label for="precioLibro" class="form-label">Precio</label>
                                    <input type="number" class="form-control" id="precioLibro" name="txtPrecio" placeholder="Costo unitario" required>
                                </div>
                                <div class="col-md-6">
                                    <label for="stockLibro" class="form-label">Stock</label>
                                    <input type="number" class="form-control" id="stockLibro" name="txtStock" placeholder="Cantidades disponibles" required>
                                </div>
                                <div class="col-md-6">
                                    <label for="inputCity" class="form-label">City</label>
                                    <input type="text" class="form-control" id="inputCity">
                                </div>
                                <div class="col-md-4">
                                    <label for="inputState" class="form-label">State</label>
                                    <select id="inputState" class="form-select">
                                        <option selected>Choose...</option>
                                        <option>...</option>
                                    </select>
                                </div>
                                <div class="col-md-2">
                                    <label for="inputZip" class="form-label">Zip</label>
                                    <input type="text" class="form-control" id="inputZip">
                                </div>
                                <div class="col-12">
                                    <div class="form-check">
                                        <input class="form-check-input" type="checkbox" id="gridCheck">
                                        <label class="form-check-label" for="gridCheck">
                                            Check me out
                                        </label>
                                    </div>
                                </div>
                                <div class="col-12">
                                    <button type="submit" class="btn btn-primary">Sign in</button>
                                </div>
                            </form>
                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                            <button type="button" class="btn btn-primary">Save changes</button>
                        </div>
                    </div>
                </div>
            </div>

            <table class="table table-striped table-hover table-responsive-xxl">
                <thead class="table-dark">
                    <tr>
                        <td>Nombre</td>
                        <td>Descripcion</td>
                        <td>Publicacion</td>
                        <td>Lenguaje</td>
                        <td>Precio</td>
                        <td>Stock</td>
                        <td>Tipo Libro</td>
                        <td>Autor</td>
                        <td>Editorial</td>
                        <td>Categoria</td>
                        <td>Acciones</td>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach var="lib" items="${libros}">             
                        <tr>
                            <td>${lib.getTituloLibro()}</td>
                            <td>${lib.getDescripcionLibro()}</td>
                            <td>${lib.getFechaDePublicacion()}</td>
                            <td>${lib.getIdiomaLibro()}</td>
                            <td>Q.${lib.getCostoLibro()}</td>
                            <td>${lib.getStockLibro()}</td>
                            <td>${lib.getIdTipoLibro()}</td>
                            <td>${lib.getIdAutor()}</td>
                            <td>${lib.getIdEditorial()}</td>
                            <td>${lib.getIdCategoria()}</td>
                        </tr>
                    </c:forEach>
                </tbody>
            </table>
        </div>
    </body>
</html>