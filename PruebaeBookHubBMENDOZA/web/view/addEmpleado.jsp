<%-- 
    Document   : addEmpleado
    Created on : 19/07/2023, 08:19:04 PM
    Author     : Usuario
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <form action="Controlador?accion=addEmpleado">
            <strong>Nombre Empleado:</strong><br><br>
            <input type="text" name="txtNombreEmpleado"><br><br>
            <strong>Apellido Empleado:</strong><br><br>
            <input type="text" name="txtApellidoEmpleado"><br><br>
            <strong>Puesto Empleado:</strong><br><br>
            <input type="text" name="txtPuestoEmpleado"><br><br>
            <strong>Id Sucursal:</strong><br><br>
            <input type="text" name="txtIdSucursal"><br><br>
            <input type="submit" name="accion" value="AgregarEmpleado"><br><br>
            
        </form>
    </body>
</html>
