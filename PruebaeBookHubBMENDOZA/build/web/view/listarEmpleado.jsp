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
    </head>
    <body>
        <div>
            <a href="Controlador?accion=addEmpleado">Agregar Nuevo Empleado</a><br><br>
            <table border="2">
                <thead>
                    <th>Id Empleado</th>
                    <th>Nombre Empleado</th>
                    <th>Apellido Empleado</th>
                    <th>PuestoEmpleado</th>
                    <th>Id Sucursal</th>
                </thead>
                <%
                    DAOEmpleado dao = new DAOEmpleado();
                    List<Empleado>listaEmpleado=dao.listarEmpleado();
                    Iterator<Empleado>iterator = listaEmpleado.iterator();
                    Empleado emp = null;
                    while (iterator.hasNext()){
                        emp=iterator.next();
                        
                %>
                <tbody>
                    <tr>
                        <td><%=emp.getIdEmpleado()%></td>
                        <td><%=emp.getNombreEmpleado()%></td>
                        <td><%=emp.getApellidoEmpleado()%></td>
                        <td><%=emp.getPuestoEmpleado()%></td>
                        <td><%=emp.getIdSucursal()%></td>
                        <td>
                            <a href="Controlador?accion=editarEmpleado&idEmpleado=<%=emp.getIdEmpleado()%>">Editar</a>
                            <a href="Controlador?accion=eliminarEmpleado&idEmpleado=<%=emp.getIdEmpleado()%>">Eliminar</a>
                        </td>
                    </tr>
                    <%}%>
                </tbody>
            </table>
        </div>
    </body>
</html>
