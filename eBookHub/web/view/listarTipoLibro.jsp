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
    </head>
    <body>
        <div>
            <h1>Registro Tipo Libro</h1>
            <a href="Controlador?accion=addTipoLibro">Agregar Tipo Libro</a>
            <table border="1">
                <thead>
                    <tr>
                        <th>Id Tipo Libro</th>
                        <th>Nombre Tipo Libro</th>
                        <th>Descripción Tipo Libro</th>
                        <th>ACCIONES</th>
                    </tr>
                </thead>
                <%
                    TipoLibroDAO dao = new TipoLibroDAO();
                    List<TipoLibro> listarTipoLibro = dao.listarTipoLibro();
                    Iterator<TipoLibro> iterator = listarTipoLibro.iterator();
                    TipoLibro tl = null;
                    while(iterator.hasNext()){
                        
                        tl = iterator.next();
                        
                        
                %>
                <tbody>
                    <tr>
                        <td><%= tl.getIdTipoLibro()%></td>
                        <td><%= tl.getNombreTipoLibro()%></td>
                        <td><%= tl.getDescripcionTipoLibro()%></td>
                        <td>
                            <a href="Controlador?accion=editarTipoLibro&idTipLibro=<%= tl.getIdTipoLibro()%>">Edit</a>
                            <a href="">Eliminar</a>
                        </td>
                    </tr>
                    <%}%>
                </tbody>
            </table>
        </div>
    </body>
</html>
