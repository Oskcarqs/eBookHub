/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.Libro;
import modelDAO.LibroDAO;

/**
 *
 * @author Ottoniel
 */
public class ControladorLibro extends HttpServlet {

    String listar = "view/listarLibro.jsp";
    String add = "view/addLibro.jsp";
    String edit = "view/editarLibro.jsp";
    Libro nuevoLibro = new Libro();
    LibroDAO nuevoLibroDAO = new LibroDAO();

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
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet ControladorLibro</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet ControladorLibro at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
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
        String acceso = "";
        String action = request.getParameter("accion");
        if (action.equalsIgnoreCase("listarLibro")) {
            acceso = listar;
        } else if (action.equalsIgnoreCase("addLibro")) {
            acceso = add;
        } else if (action.equalsIgnoreCase("AgregarLibro")) {
            String tituloLibro = request.getParameter("txtTituloLibro");
            String descripcion = request.getParameter("txtDescripcion");
            String fecha = request.getParameter("txtFecha");
            String idioma = request.getParameter("txtIdioma");
            Double costo = Double.parseDouble(request.getParameter("txtCosto"));
            int stock = Integer.parseInt(request.getParameter("txtStock"));
            int idTipoLibro = Integer.parseInt(request.getParameter("txtIdTipoLibro"));
            int idAutor = Integer.parseInt(request.getParameter("txtAutor"));
            int idEditorial = Integer.parseInt(request.getParameter("txtEditorial"));
            int idCategoria = Integer.parseInt(request.getParameter("txtCategoria"));
            nuevoLibro.setTituloLibro(tituloLibro);
            nuevoLibro.setDescripcionLibro(descripcion);
            nuevoLibro.setFechaDePublicacion(fecha);
            nuevoLibro.setIdiomaLibro(idioma);
            nuevoLibro.setCostoLibro(costo);
            nuevoLibro.setStockLibro(stock);
            nuevoLibro.setIdTipoLibro(idTipoLibro);
            nuevoLibro.setIdAutor(idAutor);
            nuevoLibro.setIdEditorial(idEditorial);
            nuevoLibro.setIdCategoria(idCategoria);
            nuevoLibroDAO.addLibro(nuevoLibro);
            acceso = listar;
        } else if (action.equalsIgnoreCase("editarLibro")) {
            request.setAttribute("codID", request.getParameter("idLibro"));
            acceso = edit;

//        } else if () {
        }
        RequestDispatcher vista = request.getRequestDispatcher(acceso);
        vista.forward(request, response);
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
