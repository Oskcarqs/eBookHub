<%-- 
    Document   : listarCliente
    Created on : 21/07/2023, 03:24:56 PM
    Author     : Usuario
--%>

<%@page import="java.util.Iterator"%>
<%@page import="java.util.List"%>
<%@page import="model.Cliente"%>
<%@page import="modelDAO.DAOCliente"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Listar Cliente</title>
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">                
    </head>
    <body>
        <div class="container mt-4">
            <h2>Listado Cliente</h2> <br>            
            <a href="ControladorCliente?accion=addCliente">Agregar Nuevo Cliente</a><br><br>
            <table class="table text-center table-bordered table-hover">
                <thead>
                <th>Id Cliente</th>
                <th>Nombre Cliente</th>
                <th>Apellido Cliente</th>
                <th>Fecha de nacimiento Cliente</th>
                <th>Direccion Cliente</th>
                <th>Telefono Cliente</th>
                </thead>
                <%
                    DAOCliente dao = new DAOCliente();
                    List<Cliente> listaCliente = dao.listarCliente();
                    Iterator<Cliente> iterator = listaCliente.iterator();
                    Cliente c = null;
                    while (iterator.hasNext()) {
                        c = iterator.next();

                %>
                <tbody>
                    <tr>
                        <td><%=c.getIdCliente()%></td>
                        <td><%=c.getNombreCliente()%></td>
                        <td><%=c.getApellidoCliente()%></td>
                        <td><%=c.getFechaDeNacimientoCliente()%></td>
                        <td><%=c.getDireccionCliente()%></td>
                        <td><%=c.getTelefonoCliente()%></td>
                        <td>
                            <button type="button" class="btn btn-success" id="btnEditar">
                                <a href="ControladorCliente?accion=editarCliente&idCliente=<%=c.getIdCliente()%>" style="color: #fff;">Editar</a>
                            </button>
                            <button type="button" class="btn btn-danger">
                                <a href="ControladorCliente?accion=eliminarCliente&idCliente=<%=c.getIdCliente()%>" style="color: #fff;">Eliminar</a>
                            </button>
                        </td>
                    </tr>
                    <%}%>
                </tbody>
            </table>
        </div>
    </body>
</html>
