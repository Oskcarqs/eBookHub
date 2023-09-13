/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.Autor;
import model.Cliente;
import model.Editorial;
import model.Factura;
import modelDAO.AutorDAO;
import modelDAO.DAOCliente;
import modelDAO.EditorialDAO;
import modelDAO.FacturaDAO;


/**
 *
 * @author Kaled Rodriguez
 */
public class Controlador extends HttpServlet {

    Autor autor = new Autor();
    AutorDAO autorDAO = new AutorDAO();
    Editorial editorial = new Editorial();
    EditorialDAO editorialDAO = new EditorialDAO();
    Factura factura = new Factura();
    FacturaDAO facturaDAO = new FacturaDAO();
    Cliente cliente = new Cliente();
    DAOCliente clienteDAO = new DAOCliente();
    
    int codFactura;
    int codCliente;

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
        String menu = request.getParameter("menu");
        String accion = request.getParameter("accion");
        if (menu.equals("Inicio")) {
            switch (accion) {
                case "Listar":
                    request.getRequestDispatcher("index.jsp").forward(request, response);
                    break;
            }
        } else if (menu.equals("Autor")) {
            switch (accion) {
                case "Listar":
                    List listarAutor = autorDAO.listarAutor();
                    request.setAttribute("autor", listarAutor);
                    request.getRequestDispatcher("view/listarAutor.jsp").forward(request, response);
                    break;
                case "Agregar":
                    autor.setNombreAutor(request.getParameter("txtNombre"));
                    autor.setApellidoAutor(request.getParameter("txtApellido"));
                    autor.setNacionalidadAutor(request.getParameter("txtNacionalidad"));
                    autor.setFechaNacimientoAutor(request.getParameter("txtNacimiento"));
                    autor.setBiografiaAutor(request.getParameter("txtBiografia"));
                    autorDAO.addAutor(autor);
                    response.sendRedirect("Controlador?menu=Autor&accion=Listar");
                    break;
                case "Eliminar":
                    response.sendRedirect("Controlador?menu=Autor&accion=Listar");
                    break;
                case "Editar":
                    response.sendRedirect("Controlador?menu=Autor&accion=Listar");
                    break;
            }
        } else if (menu.equals("Editorial")) {
            switch (accion) {
                case "Listar":
                    List listarEditorial = editorialDAO.listar();
                    request.setAttribute("editorial", listarEditorial);
                    request.getRequestDispatcher("view/listarEditorial.jsp").forward(request, response);
                    break;
                case "Agregar":
                    editorial.setNombreEditorial(request.getParameter("txtEditorial"));
                    editorial.setDescripcionEditorial(request.getParameter("txtDescripcion"));
                    editorialDAO.addEditorial(editorial);
                    response.sendRedirect("Controlador?menu=Editorial&accion=Listar");
                    break;
                case "Editar":
                    response.sendRedirect("Controlador?menu=Editorial&accion=Listar");
                    break;
                case "Cancelar":
                    response.sendRedirect("Controlador?menu=Editorial&accion=Listar");
                    break;
            } 
        } else if (menu.equals("Factura")){
            switch(accion){
                case "Listar":
                    List listaFactura = facturaDAO.listar();
                    request.setAttribute("factura", listaFactura);
                    request.getRequestDispatcher("view/listarFactura.jsp").forward(request, response);
                    break;
                case "Agregar":
                    factura.setFechaEmision(request.getParameter("txtFecha"));
                    factura.setHoraEmision(request.getParameter("txtHora"));
                    factura.setTotalFactura(Double.parseDouble(request.getParameter("txtTotalFactura")));
                    factura.setIdSucursal(Integer.parseInt(request.getParameter("txtCodSucursal")));
                    factura.setIdCliente(Integer.parseInt(request.getParameter("txtCodCliente")));
                    facturaDAO.add(factura);
                    response.sendRedirect("Controlador?menu=Factura&accion=Listar");
                    break;
                case "Editar":
                    factura.setFechaEmision(request.getParameter("txtFecha"));
                    factura.setHoraEmision(request.getParameter("txtHora"));
                    factura.setTotalFactura(Double.parseDouble(request.getParameter("txtTotalFactura")));
                    factura.setIdSucursal(Integer.parseInt(request.getParameter("txtCodSucursal")));
                    factura.setIdCliente(Integer.parseInt(request.getParameter("txtCodCliente")));
                    factura.setIdFactura(Integer.parseInt(request.getParameter("codigoFactura")));
                    facturaDAO.edit(factura);
                    response.sendRedirect("Controlador?menu=Factura&accion=Listar");
                    break;
                case "Eliminar":
                    codFactura = Integer.parseInt(request.getParameter("idFactura"));
                    factura.setIdFactura(codFactura);
                    facturaDAO.eliminar(codFactura);
                    response.sendRedirect("Controlador?menu=Factura&accion=Listar");
                    break;
                    
            } 
        } else if (menu.equals("Modal")){ 
            switch (accion){
                case "Listar":
                    request.getRequestDispatcher("view/listarFacturaSuscripcion.jsp").forward(request, response);
                    break;
                case "EditarPrimero":
                    
                    
                    cliente.setIdTipoSuscripcion(1);
                    System.out.println("3er punto");
                    cliente.setIdCliente(1);
                    System.out.println("4to punto");
                    clienteDAO.editTipoSuscripcion(cliente);
                    System.out.println("5to punto");
                    response.sendRedirect("Controlador?menu=Inicio&accion=Listar");
                    System.out.println("6to punto");
                    
                    break;
                case "EditarSegundo":
                    
                    cliente.setIdTipoSuscripcion(2);
                    cliente.setIdCliente(2);
                    clienteDAO.editTipoSuscripcion(cliente);
                    response.sendRedirect("Controlador?menu=Inicio&accion=Listar");
                    
                    break;
                    
                case "EditarTercero":
                    
                    cliente.setIdTipoSuscripcion(3);
                    cliente.setIdCliente(3);
                    clienteDAO.editTipoSuscripcion(cliente);
                    response.sendRedirect("Controlador?menu=Inicio&accion=Listar");
                    
                    break;
            }
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
        processRequest(request, response);
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
