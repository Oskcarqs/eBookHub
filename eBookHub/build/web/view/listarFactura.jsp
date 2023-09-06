<%-- 
    Document   : listar
    Created on : 5/07/2023, 09:25:16 AM
    Author     : informatica
--%>

<%@page import="java.util.Iterator"%>
<%@page import="model.Factura"%>
<%@page import="java.util.List"%>
<%@page import="modelDAO.FacturaDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Listar Facturas</title>
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">                
    </head>

    <body>

        <div class="container mt-4">
            <h1>Registro de Facturas</h1><br>
            <a  href="ControladorFactura?accion=add">Agregar Nueva Factura</a><br><br>
            <table class="table text-center table-bordered table-hover">

                <thead>
                <th>Código Factura</th> 
                <th>Fecha de emisió</th> 
                <th>Hora de emisión</th> 
                <th>Total de factura</th>
                <th>Código sucursal</th> 
                <th>Codigo de usuario</th> 
                </thead>

                <%
                    FacturaDAO dao = new FacturaDAO();
                    List<Factura> listaFactura = dao.listar();
                    Iterator<Factura> iterator = listaFactura.iterator();
                    Factura fact = null;
                    while (iterator.hasNext()) {
                        fact = iterator.next();

                %>
                <tbody>
                    <tr>
                        <td><%= fact.getIdFactura()%></td> 
                        <td><%= fact.getFechaEmision()%></td> 
                        <td><%= fact.getHoraEmision()%></td> 
                        <td><%= fact.getTotalFactura()%></td> 
                        <td><%= fact.getIdSucursal()%></td> 
                        <td><%= fact.getIdUsuario()%></td> 
                        <td>

                            <button type="button" class="btn btn-success" id="btnEditar">
                                <a href="ControladorFactura?accion=editar&idFactura=<%= fact.getIdFactura()%>" style="color: #fff;">Edit</a>
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
