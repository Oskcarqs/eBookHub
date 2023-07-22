/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Date;
import java.time.LocalDate;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.Cliente;
import modelDAO.DAOCliente;

/**
 *
 * @author Usuario
 */
public class ControladorCliente extends HttpServlet {
    String listarCliente = "view/listarCliente.jsp";
    String addCliente = "view/addCliente.jsp";
    String editarCliente = "view/editarCliente.jsp";
    Cliente nuevoCliente = new Cliente();
    DAOCliente nuevoClienteDAO = new DAOCliente();
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
            out.println("<title>Servlet ControladorCliente</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet ControladorCliente at " + request.getContextPath() + "</h1>");
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
        if(action.equalsIgnoreCase("listarCliente")){
            acceso = listarCliente;
        }else if(action.equalsIgnoreCase("addCliente")){
            acceso = addCliente;
        }else if(action.equalsIgnoreCase("AgregarCliente")){
            try {
            String nombreCliente = request.getParameter("txtNombreCliente");    
            String apellidoCliente = request.getParameter("txtApellidoCliente");
            String fechaDeNacimientoCliente = request.getParameter("txtFechaDeNacimientoCliente");
            String direccionCliente = request.getParameter("txtDireccionCliente");
            String telefonoCliente = request.getParameter("txtTelefonoCliente");
            nuevoCliente.setNombreCliente(nombreCliente);
            nuevoCliente.setApellidoCliente(apellidoCliente);
            nuevoCliente.setFechaDeNacimientoCliente(Date.valueOf(fechaDeNacimientoCliente));
            nuevoCliente.setDireccionCliente(direccionCliente);
            nuevoCliente.setTelefonoCliente(telefonoCliente);
            nuevoClienteDAO.add(nuevoCliente);
            acceso = listarCliente;  
            } catch (Exception e) {
                e.printStackTrace();
            }
        }else if(action.equalsIgnoreCase("editarCliente")){
            request.setAttribute("idCli", request.getParameter("idCliente"));
            acceso = editarCliente;
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
