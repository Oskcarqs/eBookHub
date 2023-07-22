<%-- 
    Document   : addAutor
    Created on : Jul 21, 2023, 1:02:10 PM
    Author     : oskca
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Añadir Autor</title>
    </head>
    <body>
        <form action="ControladorAutor?accion=addAutor">
            <strong>Nombre Autor</strong><br><br>
            <input type="text" name="txtNombreAutor"><br><br>
            <strong>Apellido Autor</strong><br><br>
            <input type="text" name="txtApellidoAutor"><br><br>
            <strong>Nacionalidad Autor</strong><br><br>
            <input type="text" name="txtNacionalidadAutor"><br><br>
            <strong>Fecha de Nacimiento Autor</strong><br><br>
            <input type="text" name="txtFechaNacimientoAutor"><br><br>
            <strong>Biiografia Autor</strong><br><br>
            <input type="text" name="txtBiografiaAutor"><br><br>
            <input type="submit" name="accion" value="AgregarAutor"><br><br>            
        </form>
    </body>
</html>
