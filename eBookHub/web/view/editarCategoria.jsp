<%-- 
    Document   : addCategoria
    Created on : Jul 21, 2023, 8:54:16 AM
    Author     : oskca
--%>

<%@page import="model.Categoria"%>
<%@page import="modelDAO.CategoriaDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Editar Categoria</title>
    </head>
    <body>
        <div>
            <div>
                <%
                    CategoriaDAO nuevoCategoriaDAO = new CategoriaDAO();
                    int idCategoria = Integer.parseInt((String) request.getAttribute("idCate"));
                    Categoria nuevoCategoria = (Categoria) nuevoCategoriaDAO.listCategoria(idCategoria);
                %>
                <h1>Editar Categoria</h1>
                <form action="ControladorCategoria">
                    <strong>Nombre Empleado:</strong><br><br>
                    <input type="text" name="txtNombreCategoria" value="<%= nuevoCategoria.getNombreCategoria()%>"><br><br>
                    <strong>Apellido Empleado:</strong><br><br>
                    <input type="text" name="txtDescripcionCategoria" value="<%= nuevoCategoria.getDescripcionCategoria()%>"><br><br>
                    <input type="hidden" name="txtIdCategoria" value="<%= nuevoCategoria.getIdCategoria()%>"><br><br>
                    <input type="submit" name="accion" value="ActualizarCategoria"><br><br>
                </form>
            </div>
        </div>        
        
    </body>
</html>
