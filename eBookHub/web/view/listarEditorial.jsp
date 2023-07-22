<%-- 
    Document   : listarEditorial
    Created on : 18/07/2023, 10:00:04 PM
    Author     : PC
--%>
<%@page import="java.util.Iterator"%>
<%@page import="model.Editorial"%>
<%@page import="java.util.List"%>
<%@page import="modelDAO.EditorialDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">        
        <title>Listar Editorial</title>
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css"><br>
    </head>

    <body>
        <div  class="container mt-4">
            <h2>Listado Editorial</h2> <br>
            <a  href="ControladorEditorial?accion=addEditorial">Agregar Nueva Editorial</a><br><br>
            <table class="table text-center table-bordered table-hover">
                <thead>
                        <th>Id Editorial</th> 
                        <th>Nombre</th> 
                        <th>Descripcion</th> 
                        <th>Acciones</th> 
                </thead>

                <%
                    EditorialDAO dao = new EditorialDAO();
                    List<Editorial> listaEditorial = dao.listar();
                    Iterator<Editorial> iterator = listaEditorial.iterator();
                    Editorial edi = null;
                    while (iterator.hasNext()) {
                        edi = iterator.next();

                %>
                <tbody>
                    <tr>
                        <td><%= edi.getIdEditorial()%></td> 
                        <td><%= edi.getNombreEditorial()%></td> 
                        <td><%= edi.getDescripcionEditorial()%></td> 
                        <td>
                            <button type="button" class="btn btn-success" id="btnEditar">
                                <a href="ControladorEditorial?accion=editarEditorial&idEditorial=<%= edi.getIdEditorial()%>" style="color: #fff;">Edit</a>
                            </button>
                            <button type="button" class="btn btn-danger">
                                <a href="" style="color: #fff;">Eliminar</a>
                            </button>
                        </td> 
                    </tr>
                    <%}%>
                </tbody>
            </table>
        </div>
            <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
    </body>
</html>
