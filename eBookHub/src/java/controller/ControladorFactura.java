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
import model.Factura;
import modelDAO.FacturaDAO;

/**
 *
 * @author edson
 */
public class ControladorFactura extends HttpServlet {

    String listar = "view/listarFactura.jsp";
    String add = "view/addFactura.jsp";
    String edit = "view/editarFactura.jsp";

    Factura nuevaFactura = new Factura();
    FacturaDAO nuevaFacturaDAO = new FacturaDAO();

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet Controlador</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet Controlador at " + request.getContextPath() + "</h1>");
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

        if (action.equalsIgnoreCase("listar")) {
            acceso = listar;
        } else if (action.equalsIgnoreCase("add")) {
            acceso = add;
        } else if (action.equalsIgnoreCase("Agregar")) {
            String fecha = request.getParameter("txtFecha");
            String hora = request.getParameter("txtHora");
            String total = request.getParameter("txtTotalFactura");
            String idSuc = request.getParameter("txtCodSucursal");
            String idUsu = request.getParameter("txtCodUsuario");

            nuevaFactura.setFechaEmision(fecha);
            nuevaFactura.setHoraEmision(hora);
            nuevaFactura.setTotalFactura(Double.parseDouble(total));
            nuevaFactura.setIdSucursal(Integer.parseInt(idSuc));
            nuevaFactura.setIdUsuario(Integer.parseInt(idUsu));
            nuevaFacturaDAO.add(nuevaFactura);
            acceso = listar;
        } else if (action.equalsIgnoreCase("editar")) {
            request.setAttribute("idFact", request.getParameter("idFactura"));
            acceso = edit;
        }

        RequestDispatcher vista = request.getRequestDispatcher(acceso);
        vista.forward(request, response);

//        String menu = request.getParameter("menu");
//        String accion = request.getParameter("accion");
//        if (menu.equals("listar")){
//            request.getRequestDispatcher("listarFactura.jsp").forward(request, response);
//        }
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
