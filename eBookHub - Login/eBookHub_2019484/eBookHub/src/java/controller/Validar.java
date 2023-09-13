package controller;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import modelDAO.DAOCliente;
import modelDAO.DAOEmpleado;
import model.Cliente;
import model.Empleado;

public class Validar extends HttpServlet {

    DAOCliente clienteDAO = new DAOCliente();
    Cliente cliente = new Cliente();
    DAOEmpleado empleadoDAO = new DAOEmpleado();
    Empleado empleado = new Empleado();

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
            out.println("<title>Servlet ValidarLogin</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet ValidarLogin at " + request.getContextPath() + "</h1>");
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

        String accion = request.getParameter("accion");
        if (accion.equalsIgnoreCase("Ingresar")) {

            String email = request.getParameter("txtEmail");
            String pass = request.getParameter("txtClave");

            if (email.contains("@kinal.edu.gt")) {
                cliente = clienteDAO.validar(email, pass);
                if (cliente.getEmailUsuario() != null) {
                    request.setAttribute("cliente", cliente);
                    System.out.println("Se ingreso el Usuario con Cliente");
                    request.getRequestDispatcher("Controlador?menu=Inicio&accion=listar").forward(request, response);
                }

            } else if (email.contains("@kinal.org.gt")) {

                empleado = empleadoDAO.validar(email, pass);
                if (empleado.getEmailUsuario() != null) {

                    request.setAttribute("empleado", empleado);
                    System.out.println("Se ingreso el Usuario con Empleado");
                    request.getRequestDispatcher("Controlador?menu=Inicio&accion=Listar").forward(request, response);

                }

            } else {
                request.getRequestDispatcher("Controlador?menu=Inicio&accion=Listar").forward(request, response);
            }

        } else {
            request.getRequestDispatcher("Controlador?menu=Inicio&accion=Listar").forward(request, response);
        }
        request.getRequestDispatcher("Controlador?menu=Inicio&accion=Listar").forward(request, response);

    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
