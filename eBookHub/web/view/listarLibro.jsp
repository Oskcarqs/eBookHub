<%-- 
    Document   : listarLibro
    Created on : 19-jul-2023, 21:56:22
    Author     : Ottoniel
--%>

<%@page import="java.util.Iterator"%>
<%@page import="model.Libro"%>
<%@page import="java.util.List"%>
<%@page import="modelDAO.LibroDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Listar Persona</title>
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">                
    </head>
    <body>
        <div class="container mt-4">
            <h1>Registro de Personas</h1><br>
            <a href="ControladorLibro?accion=addLibro">Agregar Nuevo Libro</a><br><br>
            <table class="table text-center table-bordered table-hover">
                <thead>
                <th>ID Libro</th>
                <th>Título Libro</th>
                <th>Descripción</th>
                <th>Fecha de Publicación</th>
                <th>Idioma del libro</th>
                <th>Costo libro</th>
                <th>Stock libro</th>
                <th>ID tipo libro</th>
                <th>ID Autor</th>
                <th>ID Auditorial</th>
                <th>ID Categoría</th>
                </thead>
                <%
                    LibroDAO dao = new LibroDAO();
                    List<Libro> listaLibro = dao.listarLibro();
                    Iterator<Libro> iterator = listaLibro.iterator();
                    Libro libro = null;
                    while (iterator.hasNext()) {
                        libro = iterator.next();
                %>
                <tbody>
                    <tr>
                        <td><%= libro.getIdLibro()%></td>
                        <td><%= libro.getTituloLibro()%></td>
                        <td><%= libro.getDescripcionLibro()%></td>
                        <td><%= libro.getFechaDePublicacion()%></td>
                        <td><%= libro.getIdiomaLibro()%></td>
                        <td><%= libro.getCostoLibro()%></td>
                        <td><%= libro.getStockLibro()%></td>
                        <td><%= libro.getIdTipoLibro()%></td>
                        <td><%= libro.getIdAutor()%></td>
                        <td><%= libro.getIdEditorial()%></td>
                        <td><%= libro.getIdCategoria()%></td>   
                        <td>

                            <button type="button" class="btn btn-success" id="btnEditar">
                                <a href="ControladorLibro?accion=editarLibro&idLibro=<%= libro.getIdLibro()%>" style="color: #fff;">Editar</a>
                            </button>

                            <button type="button" class="btn btn-danger">
                                <a href="" style=" color: #fff;">Eliminar</a>
                            </button>

                        </td> 
                    </tr>
                    <%}%>
                </tbody>
            </table>    
        </div>
    </body>
</html>