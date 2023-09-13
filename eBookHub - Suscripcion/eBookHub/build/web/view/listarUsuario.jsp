<%-- 
    Document   : listarUsuario
    Created on : 20/07/2023, 07:21:54 PM
    Author     : User
--%>

<%@page import="java.util.Iterator"%>
<%@page import="java.util.List"%>
<%@page import="model.Usuario"%>
<%@page import="modelDAO.UsuarioDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Listar Usuario</title>
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">                
    </head>
    <body>
        <div class="container mt-4">
            <h1>Registro Usuario</h1><br>
            <a href="ControladorUsuario?accion=addUsuario">Agregar Usuario</a><br><br>
            <table class="table text-center table-bordered table-hover">
                <thead>
                <th>Id Usuario</th>
                <th>Nick Name Usuario</th>
                <th>Email Usuario</th>
                <th>Password Usuario</th>
                <th>Id Cliente</th>
                <th>ACCIONES</th>
                </thead>
                <%

                    UsuarioDAO dao = new UsuarioDAO();
                    List<Usuario> listarUsuario = dao.listarUsuario();
                    Iterator<Usuario> iterator = listarUsuario.iterator();
                    Usuario u = null;
                    while (iterator.hasNext()) {

                        u = iterator.next();

                %>
                <tbody>
                    <tr>
                        <td><%= u.getIdUsuario()%></td>
                        <td><%= u.getNickNameUsuario()%></td>
                        <td><%= u.getEmailUsuario()%></td>
                        <td><%= u.getPasswordUsuario()%></td>
                        <td><%= u.getIdCliente()%></td>
                        <td>
                            <button type="button" class="btn btn-success" id="btnEditar">
                                <a href="ControladorUsuario?accion=editarUsuario&idUsuari=<%= u.getIdUsuario()%>" style="color: #fff;">Edit</a>
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
