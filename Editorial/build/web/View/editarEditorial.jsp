<%-- 
    Document   : editarEditorial
    Created on : 18/07/2023, 09:59:44 PM
    Author     : PC
--%>

<%@page import="model.Editorial"%>
<%@page import="modelDAO.EditorialDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Editar Editorial</title>
    </head>
    <body>
        <div>
            <div>
                <%
                EditorialDAO nuevaEditorialDAO = new EditorialDAO();
                int idEdi = Integer.parseInt((String)request.getAttribute("idEdi"));
                Editorial nuevaEditorial = (Editorial)nuevaEditorialDAO.listEditorial(idEdi);
                %>
                
                <h1>Editar una Editorial</h1>
                <form action="Controlador">
                <strong>Nombre:</strong><br>
                <input type="text" name="txtNombreEditorial" value="<%=nuevaEditorial.getNombreEditorial()%>"><br>
                <strong>Descripcion:</strong><br>
                <input type="text" name="txtDescripcionEditorial" value="<%=nuevaEditorial.getDescripcionEditorial()%>"><br>
                <input type="hidden" name="txtIdEditorial" value="<%=nuevaEditorial.getIdEditorial()%>"><br>
                <input type="submit" name="accion" value="ActualizarEditorial"><br>
                </form>
            </div>
        </div>
    </body>
</html>
