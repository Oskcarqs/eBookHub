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
import model.Autor;
import modelDAO.AutorDAO;

/**
 *
 * @author oskca
 */
public class ControladorAutor extends HttpServlet {
    
    String listarAutor = "view/listarAutor.jsp";
    String addAutor = "view/addAutor.jsp";
    String editarAutor = "view/editarAutor.jsp";
    Autor nuevoAutor = new Autor();
    AutorDAO nuevoAutorDAO = new AutorDAO();    

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
            out.println("<title>Servlet ControladorAutor</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet ControladorAutor at " + request.getContextPath() + "</h1>");
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
        if (action.equalsIgnoreCase("listarAutor")) {
            acceso = listarAutor;
        }else if(action.equalsIgnoreCase("addAutor")){
            acceso = addAutor;
        } else if (action.equalsIgnoreCase("AgregarAutor")){
            String nombreAutor = request.getParameter("txtNombreAutor");
            String apellidoAutor = request.getParameter("txtApellidoAutor");
            String nacionalidadAutor = request.getParameter("txtNacionalidadAutor");
            String fechaNacimientoAutor = request.getParameter("txtFechaNacimientoAutor");
            String biografiaAutor = request.getParameter("txtBiografiaAutor");
            nuevoAutor.setNombreAutor(nombreAutor);
            nuevoAutor.setApellidoAutor(apellidoAutor);
            nuevoAutor.setNacionalidadAutor(nacionalidadAutor);
            nuevoAutor.setFechaNacimientoAutor(fechaNacimientoAutor);
            nuevoAutor.setBiografiaAutor(biografiaAutor);
            nuevoAutorDAO.addAutor(nuevoAutor);
            acceso = listarAutor;
        }else if(action.equalsIgnoreCase("editarAutor")) {
            request.setAttribute("IdAut", request.getParameter("idAutor"));
            acceso = editarAutor;
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
