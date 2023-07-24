<%-- 
    Document   : listar
    Created on : 5/07/2023, 09:30:40 AM
    Author     : informatica
--%>

<%@page import="java.util.Iterator"%>
<%@page import="java.util.List"%>
<%@page import="model.TipoSuscripcion"%>
<%@page import="modelDAO.TipoSuscripcionDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
        <title>Listar Persona</title>
    </head>
    <body>
        <div class="container mt-4">
            <h1>Listado Tipo Suscripción</h1><br>
            <a href="ControladorTipoSuscripcion?accion=addTipoSuscripcion"> Agregar Nuevo Tipo Suscripcion </a><br><br>
            <table class="table text-center table-bordered table-hover">
                <thead>
                    <tr>
                        <th>Id Tipo Suscripcion</th>
                        <th>Nombre Tipo Suscripcion</th>
                        <th>Descripcion Tipo Suscripcion</th>
                        <th>Precio Tipo Suscripcion</th>
                    </tr>
                </thead>
                <%
                    TipoSuscripcionDAO dao = new TipoSuscripcionDAO();
                    List<TipoSuscripcion> listaTipoSuscripcion = dao.listarTipoSuscripcion();
                    Iterator<TipoSuscripcion> iterator = listaTipoSuscripcion.iterator();
                    TipoSuscripcion tsus = null;
                    while (iterator.hasNext()) {
                        tsus = iterator.next();

                %>
                <tbody>
                    <tr>
                        <td><%= tsus.getIdTipoSuscripcion()%></td>
                        <td><%= tsus.getNombreTipoSuscripcion()%></td>
                        <td><%= tsus.getDescripcionTipoSuscripcion()%></td>
                        <td><%= tsus.getPrecioTipoSuscripcion()%></td>
                        <td>
                            <button type="button" class="btn btn-success" id="btnEditar">
                                <a href="ControladorTipoSuscripcion?accion=editarTipoSuscripcion&idTipoSuscripcion=<%= tsus.getIdTipoSuscripcion()%>" style="color: #fff;">Edit</a>
                            </button>
                            <button type="button" class="btn btn-danger">
                                <a href="ControladorTipoSuscripcion?accion=eliminar&idTipoSuscripcion=<%= tsus.getIdTipoSuscripcion()%>" style="color: #fff;">Eliminar</a>
                            </button>

                        </td>
                    </tr>
                    <%}%>
                </tbody>
            </table>
        </div>

        <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js" integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN" crossorigin="anonymous"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js" integrity="sha384-B4gt1jrGC7Jh4AgTPSdUtOBvfO8shuf57BaghqFfPlYxofvL8/KUEfYiJOMMV+rV" crossorigin="anonymous"></script>

    </body>
</html>
