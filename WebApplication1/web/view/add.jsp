<%-- 
    Document   : add
    Created on : 20/07/2023, 08:19:22 PM
    Author     : pedro me orina
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Agregar Sucursal</title>
    </head>
    <body>
        <h1>Agregar Sucursal</h1>
        <form action = "Controlador">
            <strong>nombre Sucursal:</strong><br>
            <input type="text" name="txtNombreSucursal"><br><br>
            <strong>Direccion Sucursal:</strong><br>
            <input type="text" name="txtDireccionEmpresa"><br><br>
            <strong>Telefono Sucursal:</strong><br>
            <input type="text" name="txtTelefonoSucursal"><br><br>
            <input type="submit" name="accion" value="Agregar"><br><br>
        </form>
    </body>
</html>
