/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Date;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.FacturaSuscripcion;
import modelDAO.DAOFacturaSuscripcion;

/**
 *
 * @author Usuario
 */
public class ControladorFacturaSuscripcion extends HttpServlet {
    String listarFacturaSuscripcion = "view/listarFacturaSuscripcion.jsp";
    String addFacturaSuscripcion = "view/addFacturaSuscripcion.jsp";
    String editarFacturaSuscripcion = "view/editarFacturaSuscripcion.jsp";
    FacturaSuscripcion nuevafs = new FacturaSuscripcion();
    DAOFacturaSuscripcion nuevafsDAO = new DAOFacturaSuscripcion();
    
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
            out.println("<title>Servlet ControladorFacturaSuscripcion</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet ControladorFacturaSuscripcion at " + request.getContextPath() + "</h1>");
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
        if(action.equalsIgnoreCase("listarFacturaSuscripcion")){
            acceso = listarFacturaSuscripcion;
        }else if(action.equalsIgnoreCase("addFacturaSuscripcion")){
            acceso = addFacturaSuscripcion;
        }else if(action.equalsIgnoreCase("AgregarFacturaSuscripcion")){
            String fechaDeInicio = request.getParameter("txtFechaDeInicio");
            String fechaDeVencimiento = request.getParameter("txtFechaDeVencimiento");
            String idTipoSuscripcion = request.getParameter("txtIdTipoSuscripcion");
            String idUsuario = request.getParameter("txtIdUsuario");
            nuevafs.setFechaDeInicio(Date.valueOf(fechaDeInicio));
            nuevafs.setFechaDeVencimiento(Date.valueOf(fechaDeVencimiento));
            nuevafs.setIdTipoSuscripcion(Integer.valueOf(idTipoSuscripcion));
            nuevafs.setIdUsuario(Integer.valueOf(idUsuario));
            nuevafsDAO.add(nuevafs);
            acceso = listarFacturaSuscripcion;
        }else if(action.equalsIgnoreCase("editarFacturaSuscripcion")){
            request.setAttribute("idFS", request.getParameter("idFacturaSuscripcion"));
            acceso = editarFacturaSuscripcion;
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
