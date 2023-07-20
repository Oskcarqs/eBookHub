<%-- 
    Document   : listarDetalleFactura
    Created on : 20/07/2023, 03:05:00 PM
    Author     : User
--%>

<%@page import="java.util.Iterator"%>
<%@page import="model.DetalleFactura"%>
<%@page import="java.util.List"%>
<%@page import="modelDAO.DetalleFacturaDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Listar Detalle Factura</title>
    </head>
    <body>
        <div>
            <h1>Registro Detalle Factura</h1>
            <a href="ControladorDetalleFactura?accion=addDetalleFactura">Agregar Detalle Factura</a>
            <table border="1">
                <thead>
                    <tr>
                        <th>Id Detalle Factura</th>
                        <th>Id Factura</th>
                        <th>Id Servicio</th>
                        <th>ACCIONES</th>
                    </tr>
                </thead>
                <%
                
                    DetalleFacturaDAO dao = new DetalleFacturaDAO();
                    List<DetalleFactura> listarDetalleFactura = dao.listarDetalleFactura();
                    Iterator<DetalleFactura> iterator = listarDetalleFactura.iterator();
                    DetalleFactura df = null;
                    while(iterator.hasNext()){
                        
                        df = iterator.next();
                        
                    
                
                %>
                <tbody>
                    <tr>
                        <td><%= df.getIdDetalleFactura()%></td>
                        <td><%= df.getIdFactura()%></td>
                        <td><%= df.getIdServicio()%></td>
                        <td>
                            <a href="ControladorDetalleFactura?accion=editarDetalleFactura&idDetallFactura=<%= df.getIdDetalleFactura()%>">Edit</a>
                            <a href="">Eliminar</a>
                        </td>
                    </tr>
                    <%}%>
                </tbody>
            </table>
        </div>
    </body>
</html>
