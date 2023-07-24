<%-- 
    Document   : add
    Created on : 5/07/2023, 09:18:48 AM
    Author     : informatica
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Agregar Factura</title>
    </head>
    <body>
        <h1>Agregar Factura</h1>
        <form action="ControladorFactura">
            <strong>Fecha de Emisión</strong><br>
            <input type="text" name="txtFecha"><br>
            <br><strong>Hora de Emisión</strong><br>
            <input type="text" name="txtHora"><br>
            <br><strong>Total de Factura</strong><br>
            <input type="text" name="txtTotalFactura"><br>
            <br><strong>Código de Sucursal</strong><br>
            <input type="text" name="txtCodSucursal"><br>
            <br><strong>Código de Usuario</strong><br>
            <input type="text" name="txtCodUsuario"><br>
            <br><input type="submit" name="accion" value="Agregar"><br>
        </form>
    </body>
</html>

