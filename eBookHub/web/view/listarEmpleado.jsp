<%-- 
    Document   : listar
    Created on : 18/07/2023, 11:26:26 PM
    Author     : Usuario
--%>

<%@page import="modelDAO.DAOEmpleado"%>
<%@page import="java.util.Iterator"%>
<%@page import="java.util.List"%>
<%@page import="model.Empleado"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Listar Empleado</title>
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">        
    </head>
    <body>
        <div class="container mt-4">
            <h2>Listado Empleado</h2> <br>
            <a href="ControladorEmpleado?accion=addEmpleado">Agregar Nuevo Empleado</a><br><br>
            <table class="table text-center table-bordered table-hover">
                <thead>
                <th>Id Empleado</th>
                <th>Nombre Empleado</th>
                <th>Apellido Empleado</th>
                <th>PuestoEmpleado</th>
                <th>Id Sucursal</th>
                </thead>
                <%
                    DAOEmpleado dao = new DAOEmpleado();
                    List<Empleado> listaEmpleado = dao.listarEmpleado();
                    Iterator<Empleado> iterator = listaEmpleado.iterator();
                    Empleado emp = null;
                    while (iterator.hasNext()) {
                        emp = iterator.next();
                %>
                <tbody>
                    <tr>
                        <td><%=emp.getIdEmpleado()%></td>
                        <td><%=emp.getNombreEmpleado()%></td>
                        <td><%=emp.getApellidoEmpleado()%></td>
                        <td><%=emp.getPuestoEmpleado()%></td>
                        <td><%=emp.getIdSucursal()%></td>
                        <td>
                            <button type="button" class="btn btn-success" id="btnEditar">
                                <a href="ControladorEmpleado?accion=editarEmpleado&idEmpleado=<%=emp.getIdEmpleado()%>" style="color: #fff;">Editar</a>
                            </button>

                            <button type="button" class="btn btn-danger">
                                <a href="ControladorEmpleado?accion=eliminarEmpleado&idEmpleado=<%=emp.getIdEmpleado()%>"  style="color: #fff;">Eliminar</a>
                            </button>
                        </td>
                    </tr>
                    <%}%>
                </tbody>
            </table>
        </div>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
    </body>
</html>
\