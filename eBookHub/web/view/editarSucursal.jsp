<%-- 
    Document   : editarSucursal
    Created on : 21/07/2023, 11:46:07 AM
    Author     : User
--%>

<%@page import="model.Sucursal"%>
<%@page import="modelDAO.SucursalDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <div>
            <div>
                <%
                
                    SucursalDAO nuevaSucursalDAO = new SucursalDAO();
                    int idSucursa = Integer.parseInt((String)request.getAttribute("idsuc"));
                    Sucursal nuevaSucursal = (Sucursal)nuevaSucursalDAO.listSucursal(idSucursa);
                
                %>
                <h1>Editar Sucursal</h1>
                <form action="ControladorSucursal">
                    
                    <strong>Nombre Sucursal:</strong>
                    <br>
                    <input type="text" name="txtNombreSucursal" value="<%= nuevaSucursal.getNombreSucursal()%>">
                    <br>
                    <br>
                    <strong>Dirección Sucursal:</strong>
                    <br>
                    <input type="text" name="txtDireccionSucursal" value="<%= nuevaSucursal.getDireccionSucursal()%>">
                    <br>
                    <br>
                    <strong>Telefono Sucursal:</strong>
                    <br>
                    <input type="text" name="txtTelefonoSucursal" value="<%= nuevaSucursal.getTelefonoSucursal()%>">
                    <br>
                    <input type="hidden" name="txtIdSucursal" value="<%= nuevaSucursal.getIdSucursal()%>">
                    <br>
                    <input type="submit" name="accion" value="Actualizar">
                    <br>
                    
                </form>
            </div>
        </div>
    </body>
</html>
