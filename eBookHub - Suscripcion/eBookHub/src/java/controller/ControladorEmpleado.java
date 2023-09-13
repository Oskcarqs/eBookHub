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
import model.Empleado;
import modelDAO.DAOEmpleado;

/**
 *
 * @author Usuario
 */
public class ControladorEmpleado extends HttpServlet {
    String listarEmpleado ="view/listarEmpleado.jsp";
    String addEmpleado = "view/addEmpleado.jsp";
    String editarEmpleado="view/editarEmpleado.jsp";
    Empleado nuevoEmpleado = new Empleado();
    DAOEmpleado nuevoEmpleadoDAO = new DAOEmpleado();
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
        if(action.equalsIgnoreCase("listarEmpleado")){
            acceso = listarEmpleado;
        }else if(action.equalsIgnoreCase("addEmpleado")){
            acceso = addEmpleado;
        }else if(action.equalsIgnoreCase("AgregarEmpleado")){
            String nombreEmpleado = request.getParameter("txtNombreEmpleado");
            String apellidoEmpleado = request.getParameter("txtApellidoEmpleado");
            String puestoEmpleado = request.getParameter("txtPuestoEmpleado");
            String idSucursal = request.getParameter("txtIdSucursal");
            nuevoEmpleado.setNombreEmpleado(nombreEmpleado);
            nuevoEmpleado.setApellidoEmpleado(apellidoEmpleado);
            nuevoEmpleado.setPuestoEmpleado(puestoEmpleado);
            nuevoEmpleado.setIdSucursal(Integer.valueOf(idSucursal));
            nuevoEmpleadoDAO.add(nuevoEmpleado);
            acceso = listarEmpleado;          
        }else if(action.equalsIgnoreCase("editarEmpleado")){
            request.setAttribute("idEmp", request.getParameter("idEmpleado"));
            acceso = editarEmpleado;
        }else if(action.equalsIgnoreCase("ActualizarEmpleado")){
            String idEmpleado = request.getParameter("txtIdEmpleado");
            String nombreEmpleado = request.getParameter("txtNombreEmpleado");
            String apellidoEmpleado = request.getParameter("txtApellidoEmpleado");
            String puestoEmpleado = request.getParameter("txtPuestoEmpleado");
            String idSucursal = request.getParameter("txtIdSucursal");
            nuevoEmpleado.setIdEmpleado(Integer.parseInt(idEmpleado));
            nuevoEmpleado.setNombreEmpleado(nombreEmpleado);
            nuevoEmpleado.setApellidoEmpleado(apellidoEmpleado);
            nuevoEmpleado.setPuestoEmpleado(puestoEmpleado);
            nuevoEmpleado.setIdSucursal(Integer.valueOf(idSucursal));
            nuevoEmpleadoDAO.edit(nuevoEmpleado);
            acceso = listarEmpleado;
        }else if(action.equalsIgnoreCase("eliminarEmpleado")){
            Integer IdEmpleado = Integer.parseInt(request.getParameter("idEmpleado"));
            nuevoEmpleadoDAO.eliminar(IdEmpleado);
            acceso = listarEmpleado;
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
