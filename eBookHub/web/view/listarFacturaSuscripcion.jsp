<%-- 
    Document   : listarFacturaSuscripcion
    Created on : 20/07/2023, 07:33:41 PM
    Author     : Usuario
--%>

<%@page import="java.util.Iterator"%>
<%@page import="java.util.List"%>
<%@page import="model.FacturaSuscripcion"%>
<%@page import="modelDAO.DAOFacturaSuscripcion"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Listar Factura Suscripcion</title>
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">        
    </head>
    <body>
        <div class="container mt-4">
            <h2>Listado Factura Suscripción</h2> <br>
            <a href="ControladorFacturaSuscripcion?accion=addFacturaSuscripcion">Agregar Nuevo Factura Suscripcion</a><br><br>
            <table class="table text-center table-bordered table-hover">
                <thead>
                <th>Id Factura Suscripcion </th>
                <th>Fecha De Inicio</th>
                <th>Fecha De Vencimiento</th>
                <th>Id Tipo Suscripcion</th>
                <th>Id Usuario</th>
                </thead>
                <%
                    DAOFacturaSuscripcion dao = new DAOFacturaSuscripcion();
                    List<FacturaSuscripcion> listaFacturaSuscripcion = dao.listarFacturaSuscripcion();
                    Iterator<FacturaSuscripcion> iterator = listaFacturaSuscripcion.iterator();
                    FacturaSuscripcion fs = null;
                    while (iterator.hasNext()) {
                        fs = iterator.next();

                %>
                <tbody>
                    <tr>
                        <td><%=fs.getIdFacturaSuscripcion()%></td>
                        <td><%=fs.getFechaDeInicio()%></td>
                        <td><%=fs.getFechaDeVencimiento()%></td>
                        <td><%=fs.getIdTipoSuscripcion()%></td>
                        <td><%=fs.getIdUsuario()%></td>
                        <td>
                            <button type="button" class="btn btn-success" id="btnEditar">
                                <a href="ControladorFacturaSuscripcion?accion=editarFacturaSuscripcion&idFacturaSuscripcion=<%=fs.getIdFacturaSuscripcion()%>" style="color: #fff;">Editar</a>
                            </button>

                            <button type="button" class="btn btn-danger">
                                <a href="ControladorFacturaSuscripcion?accion=eliminarFacturaSuscripcion&idFacturaSuscripcion=<%=fs.getIdFacturaSuscripcion()%>" style="color: #fff;">Eliminar</a>
                            </button>

                        </td>
                    </tr>
                    <%}%>
                </tbody>
            </table>
        </div>
    </body>
</html>
