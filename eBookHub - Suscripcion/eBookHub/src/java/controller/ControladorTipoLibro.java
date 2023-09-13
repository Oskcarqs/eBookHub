package controller;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.TipoLibro;
import modelDAO.TipoLibroDAO;

public class ControladorTipoLibro extends HttpServlet {

    String listarTipoLibro = "view/listarTipoLibro.jsp";
    String addTipoLibro = "view/addTipoLibro.jsp";
    String editTipoLibro = "view/editarTipoLibro.jsp";

    TipoLibro nuevaTipoLibro = new TipoLibro();
    TipoLibroDAO nuevaTipoLibroDAO = new TipoLibroDAO();

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

        if (action.equalsIgnoreCase("listarTipoLibro")) {
            acceso = listarTipoLibro;
        } else if (action.equalsIgnoreCase("addTipoLibro")) {
            acceso = addTipoLibro;
        } else if (action.equalsIgnoreCase("AgregarTipoLibro")) {
            String nombreTipoLibro = request.getParameter("txtNombreTipoLibro");
            String descripcionTipoLibro = request.getParameter("txtDescripcionTipoLibro");
            nuevaTipoLibro.setNombreTipoLibro(nombreTipoLibro);
            nuevaTipoLibro.setDescripcionTipoLibro(descripcionTipoLibro);
            nuevaTipoLibroDAO.addTipoLibro(nuevaTipoLibro);
            acceso = listarTipoLibro;
        } else if (action.equalsIgnoreCase("editarTipoLibro")) {
            request.setAttribute("idtl", request.getParameter("idTipLibro"));
            acceso = editTipoLibro;
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
