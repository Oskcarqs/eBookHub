<%-- 
    Document   : addCliente
    Created on : 21/07/2023, 03:24:25 PM
    Author     : Usuario
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Agregar Cliente</title>
    </head>
    <body>
        <form action="ControladorCliente?accion=addCliente">
            <strong>Nombre Cliente:</strong><br><br>
            <input type="text" name="txtNombreCliente"><br><br>
            <strong>Apellido Cliente:</strong><br><br>
            <input type="text" name="txtApellidoCliente"><br><br>
            <strong>Fecha De Nacimiento Cliente:</strong><br><br>
            <input type="text" name="txtFechaDeNacimientoCliente"><br><br>
            <strong>Direccion Cliente:</strong><br><br>
            <input type="text" name="txtDireccionCliente"><br><br>
            <strong>Telefono Cliente:</strong><br><br>
            <input type="text" name="txtTelefonoCliente"><br><br>
            <input type="submit" name="accion" value="AgregarCliente"><br><br>
            
        </form>
    </body>
</html>
