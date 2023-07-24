<%-- 
    Document   : listarAutor
    Created on : Jul 21, 2023, 12:59:30 PM
    Author     : oskca
--%>

<%@page import="model.Autor"%>
<%@page import="modelDAO.AutorDAO"%>
<%@page import="java.util.Iterator"%>
<%@page import="model.Categoria"%>
<%@page import="java.util.List"%>
<%@page import="modelDAO.CategoriaDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Listar Autor</title>
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">                
    </head>
    <body>
        <div class="container mt-4">
            <h2>Listado Autor</h2> <br>            
            <a href="ControladorAutor?accion=addAutor">Agregar Nuevo Autor</a><br><br>
            <table class="table text-center table-bordered table-hover">
                <thead>
                <th>Id Autor</th>
                <th>Nombre Autor</th>
                <th>Apellido Autor</th>
                <th>Nacionalidad Autor</th>
                <th>Fechad de Nacimiento Autor</th>
                <th>Biografía Autor</th>
                </thead>
                <%
                    AutorDAO dao = new AutorDAO();
                    List<Autor> listaAutor = dao.listarAutor();
                    Iterator<Autor> iterator = listaAutor.iterator();
                    Autor aut = null;
                    while (iterator.hasNext()) {
                        aut = iterator.next();
                %>
                <tbody>
                    <tr>
                        <td><%=aut.getIdAutor()%></td>
                        <td><%=aut.getNombreAutor()%></td>
                        <td><%=aut.getApellidoAutor()%></td>
                        <td><%=aut.getNacionalidadAutor()%></td>
                        <td><%=aut.getFechaNacimientoAutor()%></td>
                        <td><%=aut.getBiografiaAutor()%></td>
                        <td>
                            <button type="button" class="btn btn-success" id="btnEditar">
                                <a href="ControladorAutor?accion=editarAutor&idAutor=<%=aut.getIdAutor()%>" style="color: #fff;">Editar</a>
                            </button>
                            <button type="button" class="btn btn-danger">
                                <a href="ControladorAutor?accion=eliminarAutor&idAutor=<%=aut.getIdAutor()%>" style="color: #fff;">Eliminar</a>
                            </button>
                        </td>
                    </tr>
                    <%}%>
                </tbody>
            </table>
        </div>
    </body>
</html>
