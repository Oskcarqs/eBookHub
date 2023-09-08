/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controlador;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Date;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.Servicio;
import modelDao.ServicioDAO;

/**
 *
 * @author Kaled Rodriguez
 */
public class ControladorServicio extends HttpServlet {

    String listar = "view/ListarServicio.jsp";
    String add = "view/AgregarServicio.jsp";
    String edit = "view/EditarServicio.jsp";
    Servicio nuevoServicio = new Servicio();
    ServicioDAO nuevoServicioDAO = new ServicioDAO();

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
            out.println("<title>Servlet ControladorServicio</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet ControladorServicio at " + request.getContextPath() + "</h1>");
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
        } else if (action.equalsIgnoreCase("agregar")) {
            acceso = add;
        } else if (action.equalsIgnoreCase("add")) {
            double costoServicio = Double.parseDouble(request.getParameter("txtCostoServicio"));
            Date fechaServicio = Date.valueOf(request.getParameter("txtFechaServicio"));
            Date fechaVencimientoServicio = Date.valueOf(request.getParameter("txtFechaVencimientoServicio"));
            int idTipoServicio = Integer.parseInt(request.getParameter("txtIdTipoServicio"));
            int idLibro = Integer.parseInt(request.getParameter("txtIdLibro"));
            int idUsuario = Integer.parseInt(request.getParameter("txtIdUsuario"));
            nuevoServicio.setCostoServicio(costoServicio);
            nuevoServicio.setFechaServicio(fechaServicio);
            nuevoServicio.setFechaVencimientoServicio(fechaVencimientoServicio);
            nuevoServicio.setIdTipoServicio(idTipoServicio);
            nuevoServicio.setIdLibro(idLibro);
            nuevoServicio.setIdUsuario(idUsuario);
            nuevoServicioDAO.add(nuevoServicio);
            acceso = listar;
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
