<%-- 
    Document   : addCategoria
    Created on : Jul 21, 2023, 8:54:16 AM
    Author     : oskca
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Añadir Categoria</title>
    </head>
    <body>
        <form action="ControladorCategoria?accion=addCategoria">
            <strong>Nombre Categoria:</strong><br><br>
            <input type="text" name="txtNombreCategoria"><br><br>
            <strong>Descripción Categoria:</strong><br><br>
            <input type="text" name="txtDescripcionCategoria"><br><br>
            <input type="submit" name="accion" value="AgregarCategoria"><br><br>
        </form>
    </body>
</html>
