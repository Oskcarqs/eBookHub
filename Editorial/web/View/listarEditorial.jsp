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
    </head>
    
    <body>
        
        <div>
            <h1>Registro de Editoriales</h1>
            <a  href="Controlador?accion=addEditorial">Agregar Nueva Editorial</a><br>
            <br><table border="1">

                <thead>
                    <tr>
                        <th>ID EDITORIAL</th> 
                        <th>NOMBRE</th> 
                        <th>DESCRIPCION</th> 
                        <th>ACCIONES</th> 
                    </tr>
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
                            <a href="Controlador?accion=editarEditorial&idEditorial=<%= edi.getIdEditorial()%>">Edit</a>
                            <a href="">Eliminar</a>
                        </td> 
                    </tr>
                    <%}%>
                </tbody>

            </table>
        </div>
                
    </body>
</html>
