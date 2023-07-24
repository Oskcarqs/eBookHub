<%-- 
    Document   : editarTipoLibro
    Created on : 19/07/2023, 09:36:12 AM
    Author     : User
--%>

<%@page import="model.TipoLibro"%>
<%@page import="modelDAO.TipoLibroDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <div>
            <div>
                <%
                    TipoLibroDAO nuevaTipoLibroDAO = new TipoLibroDAO();
                    int idTipLibro = Integer.parseInt((String)request.getAttribute("idtl"));
                    TipoLibro nuevaTipoLibro = (TipoLibro)nuevaTipoLibroDAO.listTipoLibro(idTipLibro);
                    
                %>
                <h1>Editar Tipo Libro</h1>
                <form action="ControladorTipoLibro">
                    
                    <strong>Nombre Tipo Libro:</strong>
                    <br>
                    <input type="text" name="txtNombreTipoLibro" value="<%= nuevaTipoLibro.getNombreTipoLibro()%>">
                    <br>
                    <br>
                    <strong>Descripción Tipo Libro:</strong>
                    <br>
                    <input type="text" name="txtDescripcionTipoLibro" value="<%= nuevaTipoLibro.getDescripcionTipoLibro()%>">
                    <br>
                    <input type="hidden" name="txtIdTipoLibro" value="<%=nuevaTipoLibro.getIdTipoLibro()%>">
                    <br>
                    <input type="submit" name="accion" value="Actualizar">
                    <br>
                    
                </form>
            </div>
        </div>
    </body>
</html>
