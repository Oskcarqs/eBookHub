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
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">                
    </head>
    <body>
        <div class="container mt-4">
            <h1>Registro Detalle Factura</h1><br>
            <a href="ControladorDetalleFactura?accion=addDetalleFactura">Agregar Detalle Factura</a><br><br>
            <table class="table text-center table-bordered table-hover">
                <thead>
                <th>Id Detalle Factura</th>
                <th>Id Factura</th>
                <th>Id Servicio</th>
                <th>ACCIONES</th>
                </thead>
                <%

                    DetalleFacturaDAO dao = new DetalleFacturaDAO();
                    List<DetalleFactura> listarDetalleFactura = dao.listarDetalleFactura();
                    Iterator<DetalleFactura> iterator = listarDetalleFactura.iterator();
                    DetalleFactura df = null;
                    while (iterator.hasNext()) {

                        df = iterator.next();
                %>
                <tbody>
                    <tr>
                        <td><%= df.getIdDetalleFactura()%></td>
                        <td><%= df.getIdFactura()%></td>
                        <td><%= df.getIdServicio()%></td>
                        <td>
                            <button type="button" class="btn btn-success" id="btnEditar">
                                <a href="ControladorDetalleFactura?accion=editarDetalleFactura&idDetallFactura=<%= df.getIdDetalleFactura()%>" style="color: #fff;">Edit</a>
                            </button>                            
                            <button type="button" class="btn btn-danger">
                                <a href="" style="color: #fff;">Eliminar</a>
                            </button>
                        </td>
                    </tr>
                    <%}%>
                </tbody>
            </table>
        </div>
    </body>
</html>
