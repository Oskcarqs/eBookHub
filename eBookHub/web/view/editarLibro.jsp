<%-- 
    Document   : editarLibro
    Created on : 19-jul-2023, 21:56:32
    Author     : Ottoniel
--%>

<%@page import="model.Libro"%>
<%@page import="modelDAO.LibroDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Editar Persona</title>
    </head>
    <div>
        <div>
            <%
                LibroDAO nuevoLibroDAO = new LibroDAO();
                int idLibro = Integer.parseInt((String) request.getAttribute("codID"));
                Libro nuevoLibro = (Libro) nuevoLibroDAO.listLibro(idLibro);
            %>
            <h1>Editar Persona</h1>
           <form action="ControladorLibro?accion=editarLibro">
            <strong>Titutlo del Libro:</strong><br>
            <input type="text" name="txtTituloLibro" value="<%=nuevoLibro.getTituloLibro()%>"><br><br>
            <strong>Descripcion:</strong><br>
            <input type="text" name="txtDescripcion" value="<%=nuevoLibro.getDescripcionLibro()%>"><br><br>
            <strong>Fecha de Publicación:</strong><br>
            <input type="text" name="txtFecha" value="<%=nuevoLibro.getFechaDePublicacion()%>"><br><br>
            <strong>Idioma del Libro:</strong><br>
            <input type="text" name="txtIdioma" value="<%=nuevoLibro.getIdiomaLibro()%>"><br><br>
            <strong>Costo de Libro:</strong><br>
            <input type="text" name="txtCosto" value="<%=nuevoLibro.getCostoLibro()%>"><br><br>
            <strong>Stock de Libros:</strong><br>
            <input type="text" name="txtStock" value="<%=nuevoLibro.getStockLibro()%>"><br><br>
            <strong>ID Tipo de Libro:</strong><br>
            <input type="text" name="txtIdTipoLibro" value="<%=nuevoLibro.getIdTipoLibro()%>"><br><br>
            <strong>ID de Autor:</strong><br>
            <input type="text" name="txtAutor" value="<%=nuevoLibro.getIdAutor()%>"><br><br>
            <strong>ID de Editorial</strong><br>
            <input type="text" name="txtEditorial" value="<%=nuevoLibro.getIdEditorial()%>"><br><br>
            <strong>ID de Categoria</strong><br>
            <input type="text" name="txtCategoria" value="<%=nuevoLibro.getIdCategoria()%>"><br><br>
            <input type="submit" name="accion" value="EditarLibro"><br><br>
        </form>
        </div>
    </div>
</html>
