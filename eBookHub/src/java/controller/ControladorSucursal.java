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
import model.Sucursal;
import modelDAO.SucursalDAO;

public class ControladorSucursal extends HttpServlet {

    String listarSucursal = "view/listarSucursal.jsp";
    String addSucursal = "view/addSucursal.jsp";
    String editSucursal = "view/editarSucursal.jsp";
    
    Sucursal nuevaSucursal = new Sucursal();
    SucursalDAO nuevaSucursalDAO = new SucursalDAO();
    
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet ControladorSucursal</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet ControladorSucursal at " + request.getContextPath() + "</h1>");
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
        
        if(action.equalsIgnoreCase("listarSucursal")){
            acceso = listarSucursal;
        }else if(action.equalsIgnoreCase("addSucursal")){
            acceso = addSucursal;
        }else if(action.equalsIgnoreCase("AgregarSucursal")){
            
            String nombreSucursal = request.getParameter("txtNombreSucursal");
            String direccionSucursal = request.getParameter("txtDireccionSucursal");
            String telefonoSucursal = request.getParameter("txtTelefonoSucursal");
            nuevaSucursal.setNombreSucursal(nombreSucursal);
            nuevaSucursal.setDireccionSucursal(direccionSucursal);
            nuevaSucursal.setTelefonoSucursal(telefonoSucursal);
            nuevaSucursalDAO.addSucursal(nuevaSucursal);
            acceso = listarSucursal;
           
        }else if(action.equalsIgnoreCase("editarSucursal")){
            request.setAttribute("idsuc", request.getParameter("idSucursa"));
            acceso = editSucursal;
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
