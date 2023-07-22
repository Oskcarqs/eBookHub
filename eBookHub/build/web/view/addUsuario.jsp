<%-- 
    Document   : addUsuario
    Created on : 20/07/2023, 07:21:20 PM
    Author     : User
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Agregar Usuario</title>
    </head>
    <body>
        <h1>Agregar Usuario</h1>
        <form action="ControladorUsuario">
            
            
            <strong>Nick Name Usurio:</strong>
            <br>
            <input type="text" name="txtNickNameUsuario">
            <br>
            <br>
            <strong>Email Usuario:</strong>
            <br>
            <input type="text" name="txtEmailUsuario">
            <br>
            <br>
            <strong>Password Usuario:</strong>
            <br>
            <input type="text" name="txtPasswordUsuario">
            <br>
            <br>
            <strong>Id Cliente:</strong>
            <br>
            <input type="text" name="txtIdCliente">
            <br>
            <br>
            <input type="submit" name="accion" value="AgregarUsuario">
            <br>
            <br>
            
        </form>
    </body>
</html>
