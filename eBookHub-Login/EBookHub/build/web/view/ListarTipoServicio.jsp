<%-- 
    Document   : ListarServicio
    Created on : 20/07/2023, 06:02:09 PM
    Author     : Kaled Rodriguez
--%>

<%@page import="modelDao.TipoServicioDAO"%>
<%@page import="model.TipoServicio"%>
<%@page import="java.util.Iterator"%>
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
            <h2>Listado De Tipo De Servicios</h2>
            <a href="ControladorTipoServicio?accion=agregar">Agregar servicio</a>
            <table class="table text-center table-bordered table-hover">
                <thead>
                    <tr>
                        <th>ID</th>
                        <th>Tipo de servicio</th>
                    </tr>
                </thead>
                <%
                    TipoServicioDAO dao = new TipoServicioDAO();
                    List<TipoServicio> listaTipoServicio = dao.listar();
                    Iterator<TipoServicio> iterator = listaTipoServicio.iterator();
                    TipoServicio tserv = null;
                    while (iterator.hasNext()) {
                        tserv = iterator.next();

                %>
                <tbody>
                    <tr>
                        <td><%=tserv.getIdTipoServicio()%></td>
                        <td><%=tserv.getNombreTipoServicio()%></td>
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
