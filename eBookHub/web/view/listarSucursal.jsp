<%-- 
    Document   : listarSucursal
    Created on : 21/07/2023, 11:45:56 AM
    Author     : User
--%>

<%@page import="model.Sucursal"%>
<%@page import="java.util.Iterator"%>
<%@page import="java.util.List"%>
<%@page import="modelDAO.SucursalDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Listar Sucursal</title>
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">                
    </head>
    <body>
        <div class="container mt-4">
            <h1>Regitro Sucursal</h1><br>
            <a href="ControladorSucursal?accion=addSucursal">Agregar Sucursal</a><br><br>
            <table class="table text-center table-bordered table-hover">
                <thead>
                    <tr>
                        <th>Id Sucursal</th>
                        <th>Nombre Sucursal</th>
                        <th>Direccion Sucursal</th>
                        <th>Telefono Sucursal</th>
                        <th>ACCIONES</th>
                    </tr>
                </thead>
                <%

                    SucursalDAO dao = new SucursalDAO();
                    List<Sucursal> listarSucursal = dao.listarSucursal();
                    Iterator<Sucursal> iterator = listarSucursal.iterator();
                    Sucursal suc = null;
                    while (iterator.hasNext()) {

                        suc = iterator.next();


                %>
                <tbody>
                    <tr>
                        <td><%= suc.getIdSucursal()%></td>
                        <td><%= suc.getNombreSucursal()%></td>
                        <td><%= suc.getDireccionSucursal()%></td>
                        <td><%= suc.getTelefonoSucursal()%></td>
                        <td>
                            <button type="button" class="btn btn-success" id="btnEditar">
                                <a href="ControladorSucursal?accion=editarSucursal&idSucursa=<%= suc.getIdSucursal()%>" style="color: #fff;">Edit</a>
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
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>                
    </body>
</html>
