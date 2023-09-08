/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import com.oracle.wls.shaded.org.apache.bcel.generic.AALOAD;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.Autor;
import model.Categoria;
import model.Editorial;
import model.Libro;
import model.Sucursal;
import modelDAO.AutorDAO;
import modelDAO.CategoriaDAO;
import modelDAO.EditorialDAO;
import modelDAO.LibroDAO;
import modelDAO.SucursalDAO;

/**
 *
 * @author Kaled Rodriguez
 */
public class Controlador extends HttpServlet {

    Autor autor = new Autor();
    AutorDAO autorDAO = new AutorDAO();
    Editorial editorial = new Editorial();
    EditorialDAO editorialDAO = new EditorialDAO();
    Libro libro = new Libro();
    LibroDAO libroDAO = new LibroDAO();
    Categoria categoria = new Categoria();
    CategoriaDAO categoriaDAO = new CategoriaDAO();
    Sucursal sucursal = new Sucursal();
    SucursalDAO sucursalDAO = new SucursalDAO();
    
    int codLibro;
    int codCategoria;
    int codSucursal;

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String menu = request.getParameter("menu");
        String accion = request.getParameter("accion");
        if (menu.equals("Inicio")) {
            switch (accion) {
                case "Listar":
                    request.getRequestDispatcher("index.jsp").forward(request, response);
                    break;
            }
        }
        if (menu.equals("Autor")) {
            switch (accion) {
                case "Listar":
                    List listarAutor = autorDAO.listarAutor();
                    request.setAttribute("autor", listarAutor);
                    request.getRequestDispatcher("view/listarAutor.jsp").forward(request, response);
                    break;
                case "Agregar":
                    autor.setNombreAutor(request.getParameter("txtNombre"));
                    autor.setApellidoAutor(request.getParameter("txtApellido"));
                    autor.setNacionalidadAutor(request.getParameter("txtNacionalidad"));
                    autor.setFechaNacimientoAutor(request.getParameter("txtNacimiento"));
                    autor.setBiografiaAutor(request.getParameter("txtBiografia"));
                    autorDAO.addAutor(autor);
                    response.sendRedirect("Controlador?menu=Autor&accion=Listar");
                    break;
                case "Eliminar":
                    response.sendRedirect("Controlador?menu=Autor&accion=Listar");
                    break;
                case "Editar":
                    response.sendRedirect("Controlador?menu=Autor&accion=Listar");
                    break;
            }
        } else if (menu.equals("Editorial")) {
            switch (accion) {
                case "Listar":
                    List listarEditorial = editorialDAO.listar();
                    request.setAttribute("editorial", listarEditorial);
                    request.getRequestDispatcher("view/listarEditorial.jsp").forward(request, response);
                    break;
                case "Agregar":
                    editorial.setNombreEditorial(request.getParameter("txtEditorial"));
                    editorial.setDescripcionEditorial(request.getParameter("txtDescripcion"));
                    editorialDAO.addEditorial(editorial);
                    response.sendRedirect("Controlador?menu=Editorial&accion=Listar");
                    break;
                case "Editar":
                    response.sendRedirect("Controlador?menu=Editorial&accion=Listar");
                    break;
                case "Cancelar":
                    response.sendRedirect("Controlador?menu=Editorial&accion=Listar");
                    break;
            }
        }else if(menu.equals("Libro")){
            
            switch(accion){
                
                case "Listar":
                    
                    List listarLibro = libroDAO.listarLibro();
                    request.setAttribute("libro", listarLibro);
                    request.getRequestDispatcher("view/listarLibro.jsp").forward(request, response);
                    
                    break;
                    
                case "Agregar":
                    
                    libro.setTituloLibro(request.getParameter("txtTituloLibro"));
                    libro.setDescripcionLibro(request.getParameter("txtDescripcionLibro"));
                    libro.setFechaDePublicacion(request.getParameter("txtFechaDePublicacion"));
                    libro.setIdiomaLibro(request.getParameter("txtIdiomaLibro"));
                    libro.setCostoLibro(Double.parseDouble(request.getParameter("txtCostoLibro")));
                    libro.setTipoLibro(request.getParameter("txtTipoLibro"));
                    libro.setStockLibro(Integer.parseInt(request.getParameter("txtStockLibro")));
                    libro.setIdAutor(Integer.parseInt(request.getParameter("txtIdAutor")));
                    libro.setIdEditorial(Integer.parseInt(request.getParameter("txtIdEditorial")));
                    libro.setIdCategoria(Integer.parseInt(request.getParameter("txtIdCategoria")));
                    libroDAO.agregar(libro);
                    response.sendRedirect("Controlador?menu=Libro&accion=Listar");
                    
                    break;
                    
                case "Editar":
                    
                    codLibro = Integer.parseInt(request.getParameter("idLibro"));
                    Libro l = libroDAO.listLibro(codLibro);
                    request.setAttribute("libro", l);
                    response.sendRedirect("Controlador?menu=Libro&accion=Listar");
                    
                    break;
                    
                case "Actualizar":
                    
                    libro.setTituloLibro(request.getParameter("txtTituloLibro"));
                    libro.setDescripcionLibro(request.getParameter("txtDescripcionLibro"));
                    libro.setFechaDePublicacion(request.getParameter("txtFechaDePublicacion"));
                    libro.setIdiomaLibro(request.getParameter("txtIdiomaLibro"));
                    libro.setCostoLibro(Double.parseDouble(request.getParameter("txtCostoLibro")));
                    libro.setTipoLibro(request.getParameter("txtTipoLibro"));
                    libro.setStockLibro(Integer.parseInt(request.getParameter("txtStockLibro")));
                    libro.setIdAutor(Integer.parseInt(request.getParameter("txtIdAutor")));
                    libro.setIdEditorial(Integer.parseInt(request.getParameter("txtIdEditorial")));
                    libro.setIdCategoria(Integer.parseInt(request.getParameter("txtIdCategoria")));
                    libro.setIdLibro(codLibro);
                    libroDAO.actualizar(libro);
                    response.sendRedirect("Controlador?menu=Libro&accion=Listar");

                    break;
                    
                case "Eliminar":
                    
                    codLibro = Integer.parseInt(request.getParameter("idLibro"));
                    libroDAO.eliminar(codLibro);
                    request.getRequestDispatcher("Controlador?menu=Libro&accion=Listar").forward(request, response);
                    
                    break;
                    
                case "Cancelar":
                    
                    response.sendRedirect("Controlador?menu=Libro&accion=Listar");
                    
                    break;
                
            }
            
        }else if(menu.equals("Categoria")){
            
            switch(accion){
                
                case "Listar":
                    
                    List listarCategoria = categoriaDAO.listarCategoria();
                    request.setAttribute("categoria", listarCategoria);
                    request.getRequestDispatcher("view/listarCategoria.jsp").forward(request, response);
                    break;
                    
                case "Agregar":
                    categoria.setNombreCategoria(request.getParameter("txtNombreCategoria"));
                    categoria.setDescripcionCategoria(request.getParameter("txtDescripcionCategoria"));
                    categoriaDAO.addCategoria(categoria);
                    response.sendRedirect("Controlador?menu=Categoria&accion=Listar");
                    break;
                    
                case "Editar":
                    categoria.setIdCategoria(Integer.parseInt(request.getParameter("codigoCategoria")));
                    categoria.setNombreCategoria(request.getParameter("txtNombreCategoria"));
                    categoria.setDescripcionCategoria(request.getParameter("txtDescripcionCategoria"));
                    categoriaDAO.editCategoria(categoria);
                    response.sendRedirect("Controlador?menu=Categoria&accion=Listar");
                    break;
                   
                case "Eliminar":
                    codCategoria = Integer.parseInt(request.getParameter("idCategoria"));
                    categoriaDAO.eliminarCategoria(codCategoria);
                    request.getRequestDispatcher("Controlador?menu=Categoria&accion=Listar").forward(request, response);
                    break;
                    
                case "Cancelar":
                    response.sendRedirect("Controlador?menu=Categoria&accion=Listar");
                    break;
            }
                
        }else if(menu.equals("Sucursal")){
            
            switch(accion){
                case "Listar":
                    List listarSucursal = sucursalDAO.listarSucursal();
                    request.setAttribute("sucursal", listarSucursal);
                    request.getRequestDispatcher("view/listarSucursal.jsp").forward(request, response);
                    break;
                    
                case "Agregar":
                    sucursal.setNombreSucursal(request.getParameter("txtNombreSucursal"));
                    sucursal.setDireccionSucursal(request.getParameter("txtDireccionSucursal"));
                    sucursal.setTelefonoSucursal(request.getParameter("txtTelefonoSucursal"));
                    sucursalDAO.addSucursal(sucursal);
                    response.sendRedirect("Controlador?menu=Sucursal&accion=Listar");
                    break;
                    
                case "Editar":
                    sucursal.setIdSucursal(Integer.parseInt(request.getParameter("codigoSucursal")));
                    sucursal.setNombreSucursal(request.getParameter("txtNombreSucursal"));
                    sucursal.setDireccionSucursal(request.getParameter("txtDireccionSucursal"));
                    sucursalDAO.editSucursal(sucursal);
                    response.sendRedirect("Controlador?menu=Sucursal&accion=Listar");
                    break;
                    
                case "Eliminar":
                    codSucursal = Integer.parseInt(request.getParameter("idSucursal"));
                    sucursalDAO.eliminarSucursal(codSucursal);
                    request.getRequestDispatcher("Controlador?menu=Sucursal&accion=Listar").forward(request, response);
                    break;
                    
                case "Cancelar":
                    response.sendRedirect("Controlador?menu=Categoria&accion=Listar");
                    break;
            }            
        }

    }

// <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
