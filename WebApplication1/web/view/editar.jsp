<%-- 
    Document   : editar
    Created on : 5/07/2023, 09:26:28 AM
    Author     : informatica
--%>

<%@page import="model.Sucursal"%>
<%@page import="modelDAO.SucursalDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Editar Persona</title>
    </head>
    <body>
    <div>
        <div>
            <%
                SucursalDAO nuevaSucursalDAO = new SucursalDAO();
                int idSucursal = Integer.parseInt((String)request.getAttribute("idSuc"));
                Sucursal nuevaSucursal = (Sucursal)nuevaSucursalDAO.list(idSucursal);
            %>
            <h1>Editar una Sucursal</h1>
            <form action="Controlador">
                <strong>Nombre Sucursal:</strong><br>
                <input type="text" name="txtNombreSucursal" value="<%=nuevaSucursal.getNombreSucursal()%>"<br><br>
                <strong>Direccion Sucursal</strong><br>
                <input type="text" name="txtDireccionSucursal" value="<%=nuevaSucursal.getDireccionSucursal()%>"<br><br>
                <strong>Telefono Sucursal</strong><br>
                <input type="text" name="txtTelefonoSucursal" value="<%=nuevaSucursal.getTelefonoSucursal()%>"<br><br>
                <input type="hidden" name="txtTdSucursal"<%=nuevaSucursal.getIdSucursal()%>><br>
                <input type="submit" name="accion" value="Actualizar"><br>
            </form>
        </div>
    </div>
    </body>
</html>
