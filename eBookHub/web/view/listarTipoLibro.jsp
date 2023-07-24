<%-- 
    Document   : listarTipoLibro
    Created on : 19/07/2023, 09:36:23 AM
    Author     : User
--%>

<%@page import="java.util.Iterator"%>
<%@page import="java.util.List"%>
<%@page import="model.TipoLibro"%>
<%@page import="modelDAO.TipoLibroDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Listar Tipo Libro</title>
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">                
    </head>
    <body>
        <div class="container mt-4">
            <h1>Registro Tipo Libro</h1><br>
            <a href="ControladorTipoLibro?accion=addTipoLibro">Agregar Tipo Libro</a><br><br>
            <table class="table text-center table-bordered table-hover">
                <thead>
                <th>Id Tipo Libro</th>
                <th>Nombre Tipo Libro</th>
                <th>Descripción Tipo Libro</th>
                <th>ACCIONES</th>
                </thead>
                <%
                    TipoLibroDAO dao = new TipoLibroDAO();
                    List<TipoLibro> listarTipoLibro = dao.listarTipoLibro();
                    Iterator<TipoLibro> iterator = listarTipoLibro.iterator();
                    TipoLibro tl = null;
                    while (iterator.hasNext()) {

                        tl = iterator.next();


                %>
                <tbody>
                    <tr>
                        <td><%= tl.getIdTipoLibro()%></td>
                        <td><%= tl.getNombreTipoLibro()%></td>
                        <td><%= tl.getDescripcionTipoLibro()%></td>
                        <td>

                            <button type="button" class="btn btn-success" id="btnEditar">
                                <a href="ControladorTipoLibro?accion=editarTipoLibro&idTipLibro=<%= tl.getIdTipoLibro()%>" style="color: #fff;">Edit</a>
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
    </body>
</html>
