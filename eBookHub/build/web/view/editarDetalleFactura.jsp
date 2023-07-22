<%-- 
    Document   : editarDetalleFactura
    Created on : 20/07/2023, 03:04:46 PM
    Author     : User
--%>

<%@page import="model.DetalleFactura"%>
<%@page import="modelDAO.DetalleFacturaDAO"%>
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
                
                    DetalleFacturaDAO nuevaDetalleFacturaDAO = new DetalleFacturaDAO();
                    int idDetallFactura = Integer.parseInt((String)request.getAttribute("iddf"));
                    DetalleFactura nuevaDetalleFactura = (DetalleFactura)nuevaDetalleFacturaDAO.listDetalleFactura(idDetallFactura);

                %>
                <h1>Editar Tipo Libro</h1>
                <form action="ControladorDetalleFactura">
                    
                    <strong>Id Factura:</strong>
                    <br>
                    <input type="text" name="txtIdFactura" value="<%= nuevaDetalleFactura.getIdFactura()%>">
                    <br>
                    <br>
                    <strong>Id Servicio:</strong>
                    <br>
                    <input type="text" name="txtIdServicio" value="<%= nuevaDetalleFactura.getIdServicio()%>">
                    <br>
                    <input type="hidden" name="txtIdDetalleFactura" value="<%= nuevaDetalleFactura.getIdDetalleFactura()%>">
                    <br>
                    <input type="submit" name="accion" value="Actualizar">
                    <br>
                    
                </form>
            </div>
        </div>
    </body>
</html>
