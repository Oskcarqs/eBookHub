<%-- 
    Document   : addEditorial
    Created on : 18/07/2023, 09:59:16 PM
    Author     : PC
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Agregar Editorial</title>
    </head>
    <body>
        <h1>Agregar Editorial</h1>
        <form action="Controlador?accion=addEditorial">
            <strong>Nombre:</strong><br>
            <input type="text" name="txtNombreEditorial"><br>
            <br><strong>Descripcion:</strong><br>
            <input type="text" name="txtDescripcionEditorial"><br>
            <br><input type="submit" name="accion" value="AgregarEditorial"><br>
        </form>
    </body>
</html>
