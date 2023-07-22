<%-- 
    Document   : addFacturaSuscripcion
    Created on : 20/07/2023, 07:31:03 PM
    Author     : Usuario
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Agregar Fac.Suscripcion</title>
    </head>
    <body>
        <form action="ControladorFacturaSuscripcion?accion=addFacturaSuscripcion">
            <strong>FechaDeInicio:</strong><br><br>
            <input type="text" name="txtFechaDeInicio"><br><br>
            <strong>FechaDeVencimiento:</strong><br><br>
            <input type="text" name="txtFechaDeVencimiento"><br><br>
            <strong>IdTipoSuscripcion:</strong><br><br>
            <input type="text" name="txtIdTipoSuscripcion"><br><br>
            <strong>IdUsuario:</strong><br><br>
            <input type="text" name="txtIdUsuario"><br><br>
            <input type="submit" name="accion" value="AgregarFacturaSuscripcion"><br><br>
            
        </form>
    </body>
</html>
