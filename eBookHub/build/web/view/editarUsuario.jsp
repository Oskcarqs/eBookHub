<%-- 
    Document   : editarUsuario
    Created on : 20/07/2023, 07:21:35 PM
    Author     : User
--%>

<%@page import="model.Usuario"%>
<%@page import="modelDAO.UsuarioDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Editar Usuario</title>
    </head>
    <body>
        <div>
            <div>
                <%

                    UsuarioDAO nuevaUsuarioDAO = new UsuarioDAO();
                    int idUsuari = Integer.parseInt((String) request.getAttribute("idu"));
                    Usuario nuevaUsuario = (Usuario) nuevaUsuarioDAO.listUsurio(idUsuari);

                %>
                <h1>Editar Usuario</h1>
                <form action="ControladorUsuario">

                    <strong>Nick Name Usurio:</strong>
                    <br>
                    <input type="text" name="txtNickNameUsuario" value="<%= nuevaUsuario.getNickNameUsuario()%>">
                    <br>
                    <br>
                    <strong>Email Usuario:</strong>
                    <br>
                    <input type="text" name="txtEmailUsuario" value="<%= nuevaUsuario.getEmailUsuario()%>">
                    <br>
                    <br>
                    <strong>Password Usuario:</strong>
                    <br>
                    <input type="text" name="txtPasswordUsuario" value="<%= nuevaUsuario.getPasswordUsuario()%>">
                    <br>
                    <br>
                    <strong>Id Cliente:</strong>
                    <br>
                    <input type="text" name="txtIdCliente" value="<%= nuevaUsuario.getIdCliente()%>">
                    <br>
                    <input type="hidden" name="txtIdUsuario" value="<%= nuevaUsuario.getIdUsuario()%>">
                    <br>
                    <input type="submit" name="accion" value="Actualizar">
                    <br>

                </form>
            </div>
        </div>
    </body>
</html>
