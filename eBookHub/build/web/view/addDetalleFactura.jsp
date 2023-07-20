<%-- 
    Document   : addDetalleFactura
    Created on : 20/07/2023, 03:04:27 PM
    Author     : User
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Agregar Detalle Factura</title>
    </head>
    <body>
        <h1>Agregar Detalle Factura</h1>
        <form action="ControladorDetalleFactura">
            
            <strong>Id Factura:</strong>
            <br>
            <input type="text" name="txtIdFactura">
            <br>
            <br>
            <strong>Id Servicio:</strong>
            <br>
            <input type="text" name="txtIdServicio">
            <br>
            <br>
            <input type="submit" name="accion" value="AgregarDetalleFactura">
            <br>
            <br>
            
        </form>
    </body>
</html>
