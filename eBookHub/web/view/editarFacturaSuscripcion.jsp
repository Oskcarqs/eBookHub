<%-- 
    Document   : editarFacturacionSuscripcion
    Created on : 20/07/2023, 07:31:47 PM
    Author     : Usuario
--%>

<%@page import="model.FacturaSuscripcion"%>
<%@page import="modelDAO.DAOFacturaSuscripcion"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Editar Fac.Suscripcion</title>
    </head>
    <div>
        <div>
            <%
                DAOFacturaSuscripcion nuevaFacturaSuscripcionDAO = new DAOFacturaSuscripcion();
                int idFacturaSuscripcion = Integer.parseInt((String) request.getAttribute("idFS"));
                FacturaSuscripcion nuevafs = (FacturaSuscripcion) nuevaFacturaSuscripcionDAO.listFacturaSuscripcion(idFacturaSuscripcion);
            %>
            <h1>Editar Factura Suscripción</h1>
            <form action="ControladorFacturaSuscripcion">
            <strong>FechaDeInicio:</strong><br><br>
            <input type="text" name="txtFechaDeInicio" value="<%= nuevafs.getFechaDeInicio()%>"><br><br>
            <strong>FechaDeVencimiento:</strong><br><br>
            <input type="text" name="txtFechaDeVencimiento" value="<%= nuevafs.getFechaDeVencimiento()%>"><br><br>
            <strong>IdTipoSuscripcion:</strong><br><br>
            <input type="text" name="txtIdTipoSuscripcion" value="<%= nuevafs.getIdTipoSuscripcion()%>"><br><br>
            <strong>IdUsuario:</strong><br><br>
            <input type="text" name="txtIdUsuario" value="<%= nuevafs.getIdUsuario()%>"><br><br>
            <input type="hidden" name="txtIdFacturaSuscripcion" value="<%= nuevafs.getIdFacturaSuscripcion()%>"><br><br>
            <input type="submit" name="accion" value="ActualizarFacturaSuscripcion"><br><br>
            </form>
        </div>
    </div>
        
    <body>
    </body>
</html>
