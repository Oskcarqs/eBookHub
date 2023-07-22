<%-- 
    Document   : addLibro
    Created on : 19-jul-2023, 21:56:10
    Author     : Ottoniel
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Agregar Libro</title>
    </head>
     <body>
        <h1>Agregar Libro</h1>
        <form action="ControladorLibro?accion=addLibro">
            <strong>Titutlo del Libro:</strong><br>
            <input type="text" name="txtTituloLibro"><br><br>
            <strong>Descripcion:</strong><br>
            <input type="text" name="txtDescripcion"><br><br>
            <strong>Fecha de Publicación:</strong><br>
            <input type="text" name="txtFecha"><br><br>
            <strong>Idioma del Libro:</strong><br>
            <input type="text" name="txtIdioma"><br><br>
            <strong>Costo de Libro:</strong><br>
            <input type="text" name="txtCosto"><br><br>
            <strong>Stock de Libros:</strong><br>
            <input type="text" name="txtStock"><br><br>
            <strong>ID Tipo de Libro:</strong><br>
            <input type="text" name="txtIdTipoLibro"><br><br>
            <strong>ID de Autor:</strong><br>
            <input type="text" name="txtAutor"><br><br>
            <strong>ID de Editorial</strong><br>
            <input type="text" name="txtEditorial"><br><br>
            <strong>ID de Categoria</strong><br>
            <input type="text" name="txtCategoria"><br><br>
            <input type="submit" name="accion" value="AgregarLibro"><br><br>
        </form>
    </body>
</html>
