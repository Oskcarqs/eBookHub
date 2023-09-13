<%-- 
    Document   : ListarServicio
    Created on : 20/07/2023, 06:02:09 PM
    Author     : Kaled Rodriguez
--%>

<%@page import="java.util.Iterator"%>
<%@page import="model.Servicio"%>
<%@page import="java.util.List"%>
<%@page import="modelDao.ServicioDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Listar</title>
        <!-- Enlace a Bootstrap CSS -->
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    </head>
    <body>
        <div class="container mt-4">
            <h2>Listado de servicios</h2>
            <a href="ControladorServicio?accion=agregar">Agregar servicio</a>
            <table class="table text-center table-bordered table-hover">
                <thead>
                    <tr>
                        <th>ID</th>
                        <th>Costo De Servicio</th>
                        <th>Fecha Servicio</th>
                        <th>Fecha Vencimiento</th>
                        <th>ID Tipo Servicio</th>
                        <th>ID Libro</th>
                        <th>ID Usuario</th>
                        <th>Acciones</th>
                    </tr>
                </thead>
                <%
                    ServicioDAO dao = new ServicioDAO();
                    List<Servicio> listarPersona = dao.listar();
                    Iterator<Servicio> iterator = listarPersona.iterator();
                    Servicio serv = null;
                    while (iterator.hasNext()) {
                        serv = iterator.next();

                %>
                <tbody>
                    <tr>
                        <td><%=serv.getIdServicio()%></td>
                        <td><%=serv.getCostoServicio()%></td>
                        <td><%=serv.getFechaServicio()%></td>
                        <td><%=serv.getFechaVencimientoServicio()%></td>
                        <td><%=serv.getIdTipoServicio()%></td>
                        <td><%=serv.getIdLibro()%></td>
                        <td><%=serv.getIdUsuario()%></td>
                        <td>
                            <button type="button" class="btn btn-success">Editar</button>
                            <button type="button" class="btn btn-danger">Eliminar</button>
                        </td>
                    </tr>
                    <%}%>
                </tbody>
            </table>
        </div>

        <!-- Enlace a Bootstrap JS (opcional, solo si necesitas funcionalidades JS de Bootstrap) -->
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
    </body>
</html>
