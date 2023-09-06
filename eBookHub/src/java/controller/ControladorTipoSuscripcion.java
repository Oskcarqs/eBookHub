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
import model.TipoSuscripcion;
import modelDAO.TipoSuscripcionDAO;

/**
 *
 * @author Acer
 */
public class ControladorTipoSuscripcion extends HttpServlet {
    
    String listarTipoSuscripcion = "view/listarTipoSuscripcion.jsp";
    String addTipoSuscripcion = "view/addTipoSuscripcion.jsp";
    String editTipoSuscripcion = "view/editarTipoSuscripcion.jsp";
    TipoSuscripcion nuevoTipoSuscripcion = new TipoSuscripcion();
    TipoSuscripcionDAO nuevoTipoSuscripcionDAO = new TipoSuscripcionDAO();
    
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet ControladorTipoSuscripcion</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet ControladorTipoSuscripcion at " + request.getContextPath() + "</h1>");
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
        if (action.equalsIgnoreCase("listarTipoSuscripcion")){
            acceso = listarTipoSuscripcion;
        }else if(action.equalsIgnoreCase("addTipoSuscripcion")){
         acceso = addTipoSuscripcion;
        }else if (action.equalsIgnoreCase("Agregar")){
            String nombre = request.getParameter("txtNombre");
            String descripcion = request.getParameter("txtDescr");
            String pre = request.getParameter("txtPrec");
            
            nuevoTipoSuscripcion.setNombreTipoSuscripcion(nombre);
            nuevoTipoSuscripcion.setDescripcionTipoSuscripcion(descripcion);
            nuevoTipoSuscripcion.setPrecioTipoSuscripcion(Double.parseDouble(pre));
            nuevoTipoSuscripcionDAO.add(nuevoTipoSuscripcion);
            acceso = listarTipoSuscripcion;
        }else if(action.equalsIgnoreCase("editarTipoSuscripcion")){
            request.setAttribute("idTipoSuscripcion", request.getParameter("idTipoSuscripcion"));
            acceso = editTipoSuscripcion;
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
