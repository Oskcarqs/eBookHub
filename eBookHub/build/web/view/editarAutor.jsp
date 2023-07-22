<%-- 
    Document   : editarAutor
    Created on : Jul 21, 2023, 1:02:00 PM
    Author     : oskca
--%>

<%@page import="model.Autor"%>
<%@page import="modelDAO.AutorDAO"%>
<%@page import="model.Categoria"%>
<%@page import="modelDAO.CategoriaDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Editar Autor</title>
    </head>
    <body>
        <div>
            <div>
                <%
                    AutorDAO nuevoAutorDAO = new AutorDAO();
                    int idAutor = Integer.parseInt((String) request.getAttribute("IdAut"));
                    Autor nuevoAutor = (Autor) nuevoAutorDAO.listAutor(idAutor);
                %>
                <h1>Editar Categoria</h1>
                <form action="ControladorAutor">
                    <strong>Nombre Autor</strong><br><br>
                    <input type="text" name="txtNombreAutor" value="<%= nuevoAutor.getNombreAutor()%>"><br><br>
                    <strong>Apellido Autor</strong><br><br>
                    <input type="text" name="txtApellidoAutor" value="<%= nuevoAutor.getApellidoAutor()%>"><br><br>
                    <strong>Nacionalidad Autor</strong><br><br>
                    <input type="text" name="txtNacionalidadAutor" value="<%= nuevoAutor.getNacionalidadAutor()%>"><br><br>
                    <strong>Fecha de Nacimiento Autor</strong><br><br>
                    <input type="text" name="txtFechaNacimientoAutor" value="<%= nuevoAutor.getFechaNacimientoAutor()%>"><br><br>
                    <strong>Biiografia Autor</strong><br><br>
                    <input type="text" name="txtBiografiaAutor" value="<%= nuevoAutor.getBiografiaAutor()%>"><br><br>
                    <input type="hidden" name="txtIdAutor" value="<%= nuevoAutor.getIdAutor()%>"><br><br>
                    <input type="submit" name="accion" value="ActualizarAutor"><br><br>
                </form>
            </div>
        </div>        
        
    </body>
</html>
