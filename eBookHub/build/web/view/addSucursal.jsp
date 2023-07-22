<%-- 
    Document   : addSucursal
    Created on : 21/07/2023, 11:45:35 AM
    Author     : User
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
        <form action="ControladorSucursal">
            
            <strong>Nombre Sucursal:</strong>
            <br>
            <input type="text" name="txtNombreSucursal">
            <br>
            <br>
            <strong>Direccion Sucursal:</strong>
            <br>
            <input type="text" name="txtDireccionSucursal">
            <br>
            <br>
            <strong>Telefono Sucursal:</strong>
            <br>
            <input type="text" name="txtTelefonoSucursal">
            <br>
            <br>
            <input type="submit" name="accion" value="AgregarSucursal">
            <br>
            <br>
            
        </form>
    </body>
</html>
