<%-- 
    Document   : editar
    Created on : 18/07/2023, 11:26:42 PM
    Author     : Usuario
--%>

<%@page import="modelDAO.DAOEmpleado"%>
<%@page import="model.Empleado"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Editar Empleado</title>
    </head>
    <div>
        <div>
            <%
                DAOEmpleado nuevoEmpleadoDAO = new DAOEmpleado();
                int idEmpleado = Integer.parseInt((String) request.getAttribute("idEmp"));
                Empleado nuevoEmpleado = (Empleado) nuevoEmpleadoDAO.listEmpleado(idEmpleado);
            %>
            <h1>Editar Empleado</h1>
            <form action="Controlador">
                <strong>Nombre Empleado:</strong><br><br>
            <input type="text" name="txtNombreEmpleado" value="<%= nuevoEmpleado.getNombreEmpleado()%>"><br><br>
            <strong>Apellido Empleado:</strong><br><br>
            <input type="text" name="txtApellidoEmpleado" value="<%= nuevoEmpleado.getApellidoEmpleado()%>"><br><br>
            <strong>Puesto Empleado:</strong><br><br>
            <input type="text" name="txtPuestoEmpleado" value="<%= nuevoEmpleado.getPuestoEmpleado()%>"><br><br>
            <strong>Id Sucursal:</strong><br><br>
            <input type="text" name="txtIdSucursal" value="<%= nuevoEmpleado.getIdSucursal()%>"><br><br>
            <input type="hidden" name="txtIdEmpleado" value="<%= nuevoEmpleado.getIdEmpleado()%>"><br><br>
            <input type="submit" name="accion" value="ActualizarEmpleado"><br><br>
            </form>
        </div>
    </div>
    <body>
    </body>
</html>
