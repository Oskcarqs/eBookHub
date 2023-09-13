<%-- 
    Document   : listarCategoria
    Created on : Jul 21, 2023, 8:54:56 AM
    Author     : oskca
--%>

<%@page import="java.util.Iterator"%>
<%@page import="model.Categoria"%>
<%@page import="java.util.List"%>
<%@page import="modelDAO.CategoriaDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Listar Categoria</title>
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">         
    </head>
    <body>
        <div class="container mt-4">
            <h2>Listado Categoria</h2> <br>
            <a href="ControladorCategoria?accion=addCategoria">Agregar Nueva Categoria</a><br><br>
            <table class="table text-center table-bordered table-hover">
                <thead>
                <th>Id Categoría</th>
                <th>Nombre Categoría</th>
                <th>Descripción Categoría</th>

                </thead>
                <%
                    CategoriaDAO dao = new CategoriaDAO();
                    List<Categoria> listaCategoria = dao.listarCategoria();
                    Iterator<Categoria> iterator = listaCategoria.iterator();
                    Categoria cate = null;
                    while (iterator.hasNext()) {
                        cate = iterator.next();

                %>
                <tbody>
                    <tr>
                        <td><%=cate.getIdCategoria()%></td>
                        <td><%=cate.getNombreCategoria()%></td>
                        <td><%=cate.getDescripcionCategoria()%></td>
                        <td>
                            <button type="button" class="btn btn-success" id="btnEditar">
                                <a href="ControladorCategoria?accion=editarCategoria&idCategoria=<%=cate.getIdCategoria()%>" style="color: #fff;">Editar</a>
                            </button>

                            <button type="button" class="btn btn-danger">
                                <a href="ControladorCategoria?accion=eliminarCategoria&idCategoria=<%=cate.getIdCategoria()%>" style="color: #fff;">Eliminar</a>
                            </button>

                        </td>
                    </tr>
                    <%}%>
                </tbody>
            </table>
        </div>
    </body>
</html>
