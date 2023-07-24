<%-- 
    Document   : editar
    Created on : 5/07/2023, 09:24:55 AM
    Author     : informatica
--%>

<%@page import="model.Factura"%>
<%@page import="modelDAO.FacturaDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Editar Personas</title>
    </head>
    
    <body>
        <div>
            
            <%
                FacturaDAO nuevaFacturaDAO = new FacturaDAO();
                int idFact = Integer.parseInt((String)request.getAttribute("idFact"));
                Factura nuevaFactura = (Factura)nuevaFacturaDAO.list(idFact);
            %>
            
            <div>
                <h1>Editar una Persona</h1>
                <form action="ControladorFactura">
                <strong>Fecha de Emisión</strong><br>
            <input type="text" name="txtFecha" value="<%= nuevaFactura.getFechaEmision() %>"><br>
            <br><strong>Hora de Emisión</strong><br>
            <input type="text" name="txtHora" value="<%= nuevaFactura.getHoraEmision() %>"><br>
            <br><strong>Total de Factura</strong><br>
            <input type="text" name="txtTotalFactura" value="<%= nuevaFactura.getTotalFactura() %>"><br>
            <br><strong>Código de Sucursal</strong><br>
            <input type="text" name="txtCodSucursal" value="<%= nuevaFactura.getIdSucursal() %>"><br>
            <br><strong>Código de Usuario</strong><br>
            <input type="text" name="txtCodUsuario" value="<%= nuevaFactura.getIdUsuario() %>"><br>
                <input type="hidden" name="txtCodigoPersona" value="<%= nuevaFactura.getIdFactura()%>"><br>
                <input type="submit" name="accion" value="editar"><br>
                </form>
            </div>
        </div>        
    </body>
    
</html>
