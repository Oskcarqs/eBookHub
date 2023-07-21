<%-- 
    Document   : listar
    Created on : 5/07/2023, 09:26:52 AM
    Author     : pedro me orina
--%>

<%@page import="java.util.Iterator"%>
<%@page import="model.Sucursal"%>
<%@page import="java.util.List"%>
<%@page import="modelDAO.SucursalDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Listar Sucursales</title>
    </head>
    <body>
        <h1>Registro de Sucursales</h1>
        <a href="Controlador?accion=add">Agregar Nueva Sucursal</a>
        <div>
        <table border="1">
            <thead>
                <tr>
                    <th>ID SUCURSAL</th>
                    <th>NOMBRE SUCURSAL</th>
                    <th>DIRECCION SUCURSAL</th>
                    <th>ACCIONES</th>
                </tr>
            </thead>
            <%
                SucursalDAO dao = new SucursalDAO();
                List<Sucursal> listaSucursal = dao.listar();
                Iterator<Sucursal> iterator = listaSucursal.iterator();
                Sucursal per = null;
                while(iterator.hasNext()){
                    per = iterator.next();
            %>
            <tbody>
                <tr>
                    <td><%=per.getIdSucursal()%></td>
                    <td><%=per.getNombreSucursal()%></td>
                    <td><%=per.getDireccionSucursal()%></td>
                    <td><%=per.getTelefonoSucursal()%></td>
                    <td>
                        <a href="Controlador?accion=editar&codigoPersona=<%= per.getIdSucursal()%>">Edit</a>
                        <a href="">Eliminar</a>
                    </td>
                </tr>
                <%}%>
            </tbody>
        </table>
        </div>
    </body>
</html>