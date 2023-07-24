<%-- 
    Document   : editar
    Created on : 5/07/2023, 09:30:18 AM
    Author     : informatica
--%>

<%@page import="model.TipoSuscripcion"%>
<%@page import="modelDAO.TipoSuscripcionDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/css/bootstrap.min.css" integrity="sha384-TX8t27EcRE3e/ihU7zmQxVncDAy5uIKz4rEkgIXeMed4M0jlfIDPvg6uqKI2xXr2" crossorigin="anonymous">

        <title>Editar persona</title>
    </head>
    <body>
    <div>
        <div>
            <%
                TipoSuscripcionDAO nuevoTipoSuscripcionDAO = new TipoSuscripcionDAO();
                int idTipoSuscripcion = Integer.parseInt((String)request.getAttribute("idTipoSuscripcion"));
                TipoSuscripcion nuevoTipoSuscripcion = (TipoSuscripcion)nuevoTipoSuscripcionDAO.list(idTipoSuscripcion);
            %>
            
            <h1>Editar una persona</h1>
            <form action="ControladorTipoSuscripcion">
            <strong>Nombre tipo suscripcion:</strong><br>
            <input type="text" name="txtNombre" value="<%=nuevoTipoSuscripcion.getNombreTipoSuscripcion() %>"><br><br>
            <strong>Descripcion tipo suscripcion:</strong><br>
            <input type="text" name="txtDescr" value="<%=nuevoTipoSuscripcion.getDescripcionTipoSuscripcion() %>"><br>
            <strong>Precio tipo suscripcion:</strong><br>
            <input type="text" name="txtPrec" value="<%=nuevoTipoSuscripcion.getPrecioTipoSuscripcion() %>"><br>
            <input type="hidden" name="txtIdTipoSuscripcion" value="<%= nuevoTipoSuscripcion.getIdTipoSuscripcion()%>"><br><br>
            <input type="submit" name="accion" value="editar"><br>
            </form>
        </div>
    </div>
        
        <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js" integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN" crossorigin="anonymous"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js" integrity="sha384-B4gt1jrGC7Jh4AgTPSdUtOBvfO8shuf57BaghqFfPlYxofvL8/KUEfYiJOMMV+rV" crossorigin="anonymous"></script>

    </body>
</html>
