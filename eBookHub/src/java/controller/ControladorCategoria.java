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
import model.Categoria;
import modelDAO.CategoriaDAO;

/**
 *
 * @author oskca
 */
public class ControladorCategoria extends HttpServlet {

    String listarCategoria = "view/listarCategoria.jsp";
    String addCategoria = "view/addCategoria.jsp";
    String editarCategoria = "view/editarCategoria.jsp";
    Categoria nuevoCategoria = new Categoria();
    CategoriaDAO nuevoCategoriaDAO = new CategoriaDAO();

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
            out.println("<title>Servlet controlador</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet controlador at " + request.getContextPath() + "</h1>");
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
        if (action.equalsIgnoreCase("listarCategoria")) {
            acceso = listarCategoria;
        }else if(action.equalsIgnoreCase("addCategoria")){
            acceso = addCategoria;
        } else if (action.equalsIgnoreCase("AgregarCategoria")){
            String nombreCategoria = request.getParameter("txtNombreCategoria");
            String descripcionCategoria = request.getParameter("txtDescripcionCategoria");
            nuevoCategoria.setNombreCategoria(nombreCategoria);
            nuevoCategoria.setDescripcionCategoria(descripcionCategoria);
            nuevoCategoriaDAO.addCategoria(nuevoCategoria);
            acceso = listarCategoria;
        }else if(action.equalsIgnoreCase("editarCategoria")) {
            request.setAttribute("idCate", request.getParameter("idCategoria"));
            acceso = editarCategoria;
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
