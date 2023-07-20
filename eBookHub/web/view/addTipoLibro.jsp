<%-- 
    Document   : addTipoLibro
    Created on : 19/07/2023, 09:35:56 AM
    Author     : User
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Agregar Tipo Libro</title>
    </head>
    <body>
        <h1>Agregar Tipo Libro</h1>
        <form action="Controlador">
            
            <strong>Nombre Tipo Libro:</strong>
            <br>
            <input type="text" name="txtNombreTipoLibro">
            <br>
            <br>
            <strong>Descripción Tipo Libro:</strong>
            <br>
            <input type="text" name="txtDescripcionTipoLibro">
            <br>
            <br>
            <input type="submit" name="accion" value="AgregarTipoLibro">
            <br>
            <br>
            
        </form>
    </body>
</html>
