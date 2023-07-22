<%-- 
    Document   : editarCliente
    Created on : 21/07/2023, 03:24:36 PM
    Author     : Usuario
--%>

<%@page import="model.Cliente"%>
<%@page import="modelDAO.DAOCliente"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Editar Cliente</title>
    </head>
    <div>
        <div>
            <%
                DAOCliente nuevoClienteDAO = new DAOCliente();
                int idCliente = Integer.parseInt((String) request.getAttribute("idCli"));
                Cliente nuevoCliente = (Cliente) nuevoClienteDAO.listCliente(idCliente);
            %>
            <h1>Editar Cliente</h1>
            <form action="ControladorCliente">
            <strong>Nombre Cliente:</strong><br><br>
            <input type="text" name="txtNombreCliente" value="<%= nuevoCliente.getNombreCliente()%>"><br><br>
            <strong>Apellido Cliente:</strong><br><br>
            <input type="text" name="txtApellidoCliente" value="<%= nuevoCliente.getApellidoCliente()%>"><br><br>
            <strong>Fecha De Nacimiento Cliente:</strong><br><br>
            <input type="text" name="txtFechaDeNacimientoCliente" value="<%= nuevoCliente.getFechaDeNacimientoCliente()%>"><br><br>
            <strong>Direccion Cliente:</strong><br><br>
            <input type="text" name="txtDireccionCliente" value="<%= nuevoCliente.getDireccionCliente()%>"><br><br>
            <strong>Telefono Cliente:</strong><br><br>
            <input type="text" name="txtTelefonoCliente" value="<%= nuevoCliente.getTelefonoCliente()%>"><br><br>
            <input type="hidden" name="txtIdCliente" value="<%= nuevoCliente.getIdCliente()%>"><br><br>
            <input type="submit" name="accion" value="ActualizarCliente"><br><br>
            </form>
        </div>
    </div>
    <body>
    </body>
</html>
