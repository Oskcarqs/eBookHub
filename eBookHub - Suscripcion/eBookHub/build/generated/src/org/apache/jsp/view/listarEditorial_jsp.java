package org.apache.jsp.view;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import java.util.Iterator;
import model.Editorial;
import java.util.List;
import modelDAO.EditorialDAO;

public final class listarEditorial_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent {

  private static final JspFactory _jspxFactory = JspFactory.getDefaultFactory();

  private static java.util.List<String> _jspx_dependants;

  private org.glassfish.jsp.api.ResourceInjector _jspx_resourceInjector;

  public java.util.List<String> getDependants() {
    return _jspx_dependants;
  }

  public void _jspService(HttpServletRequest request, HttpServletResponse response)
        throws java.io.IOException, ServletException {

    PageContext pageContext = null;
    HttpSession session = null;
    ServletContext application = null;
    ServletConfig config = null;
    JspWriter out = null;
    Object page = this;
    JspWriter _jspx_out = null;
    PageContext _jspx_page_context = null;

    try {
      response.setContentType("text/html;charset=UTF-8");
      pageContext = _jspxFactory.getPageContext(this, request, response,
      			null, true, 8192, true);
      _jspx_page_context = pageContext;
      application = pageContext.getServletContext();
      config = pageContext.getServletConfig();
      session = pageContext.getSession();
      out = pageContext.getOut();
      _jspx_out = out;
      _jspx_resourceInjector = (org.glassfish.jsp.api.ResourceInjector) application.getAttribute("com.sun.appserv.jsp.resource.injector");

      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("<!doctype html>\r\n");
      out.write("<html lang=\"en\">\r\n");
      out.write("    <head>\r\n");
      out.write("        <meta charset=\"utf-8\">\r\n");
      out.write("        <meta name=\"viewport\" content=\"width=device-width, initial-scale=1\">\r\n");
      out.write("        <title>Bootstrap demo</title>\r\n");
      out.write("        <link href=\"https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css\" rel=\"stylesheet\" integrity=\"sha384-4bw+/aepP/YC94hEpVNVgiZdgIC5+VKNBQNGCHeKRQN+PtmoHDEXuppvnDJzQIu9\" crossorigin=\"anonymous\">\r\n");
      out.write("        <!-- SCRIPT DE LA LIBRERIA DE ICONO-->\r\n");
      out.write("        <script src=\"https://kit.fontawesome.com/2833bb8570.js\" crossorigin=\"anonymous\"></script>\r\n");
      out.write("    </head>\r\n");
      out.write("    <body>\r\n");
      out.write("        <nav class=\"navbar navbar-expand-lg sticky-top navbar-dark bg-dark\">\r\n");
      out.write("            <div class=\"container-fluid\">\r\n");
      out.write("                <a class=\"navbar-brand mx-3\" href=\"#\">eBookHub</a>\r\n");
      out.write("                <button class=\"navbar-toggler\" type=\"button\" data-bs-toggle=\"collapse\" data-bs-target=\"#navbarSupportedContent\" aria-controls=\"navbarSupportedContent\" aria-expanded=\"false\" aria-label=\"Toggle navigation\">\r\n");
      out.write("                    <i class=\"fa-solid fa-bars fa-lg\" style=\"color: #ffffff;\"></i>\r\n");
      out.write("                </button>\r\n");
      out.write("                <div class=\"collapse navbar-collapse\" id=\"navbarSupportedContent\">\r\n");
      out.write("                    <ul class=\"navbar-nav me-auto mb-2 mb-lg-0\">\r\n");
      out.write("                        <li class=\"nav-item\">\r\n");
      out.write("                            <a class=\"nav-link mx-2\" aria-current=\"page\" href=\"Controlador?menu=Inicio&accion=Listar\"><i class=\"fa-solid fa-house\" style=\"color: #ffffff;\"></i> Inicio</a>\r\n");
      out.write("                        </li>\r\n");
      out.write("                        <li class=\"nav-item dropdown mx-2\">\r\n");
      out.write("                            <a class=\"nav-link dropdown-toggle\" href=\"#\" role=\"button\" data-bs-toggle=\"dropdown\" aria-expanded=\"false\">\r\n");
      out.write("                                Categorias\r\n");
      out.write("                            </a>\r\n");
      out.write("                            <ul class=\"dropdown-menu\">\r\n");
      out.write("                                <li><a class=\"dropdown-item\" href=\"#\">Action</a></li>\r\n");
      out.write("                                <li><a class=\"dropdown-item\" href=\"#\">Another action</a></li>\r\n");
      out.write("                                <li><hr class=\"dropdown-divider\"></li>\r\n");
      out.write("                                <li><a class=\"dropdown-item text-center\" href=\"#\">Agregar</a></li>\r\n");
      out.write("                            </ul>\r\n");
      out.write("                        </li>\r\n");
      out.write("                        <li class=\"nav-item dropdown mx-2\">\r\n");
      out.write("                            <a class=\"nav-link dropdown-toggle\" href=\"#\" role=\"button\" data-bs-toggle=\"dropdown\" aria-expanded=\"false\">\r\n");
      out.write("                                Editoriales\r\n");
      out.write("                            </a>\r\n");
      out.write("                            <ul class=\"dropdown-menu\">\r\n");
      out.write("                                <li><a class=\"dropdown-item\" href=\"#\">Action</a></li>\r\n");
      out.write("                                <li><a class=\"dropdown-item\" href=\"#\">Another action</a></li>\r\n");
      out.write("                                <li><hr class=\"dropdown-divider\"></li>\r\n");
      out.write("                                <li><a class=\"dropdown-item text-center\" href=\"#\">Agregar</a></li>\r\n");
      out.write("                            </ul>\r\n");
      out.write("                        </li>\r\n");
      out.write("                        <li class=\"nav-item \">\r\n");
      out.write("                            <a class=\"btn btn-warning\" href=\"#\">Suscripcion <i class=\"fa-solid fa-crown\" style=\"color: #000000;\"></i></a>\r\n");
      out.write("                        </li>\r\n");
      out.write("                    </ul>\r\n");
      out.write("                    <form class=\"d-flex me-auto\" role=\"search\">\r\n");
      out.write("                        <input class=\"form-control me-2\" type=\"search\" placeholder=\"Search\" aria-label=\"Search\">\r\n");
      out.write("                        <button class=\"btn btn-outline-success\" type=\"submit\">Search</button>\r\n");
      out.write("                    </form>\r\n");
      out.write("                    <a class=\"btn btn-light btn-rounded shadow me-2\" href=\"#!\"><i class=\"fa-solid fa-truck\" style=\"color: #000000;\"></i> Carrito</a>\r\n");
      out.write("                </div>\r\n");
      out.write("            </div>\r\n");
      out.write("        </nav>\r\n");
      out.write("\r\n");
      out.write("        <div class=\"container-fluid mt-3\">\r\n");
      out.write("            <div class=\"row gx-3\">\r\n");
      out.write("                <div class=\"col-8\">\r\n");
      out.write("                    <table class=\"table table-striped table-hover table-responsive-sm  text-center\">\r\n");
      out.write("                        <thead class=\"table-dark\">\r\n");
      out.write("                            <tr>\r\n");
      out.write("                                <td>Editorial</td>\r\n");
      out.write("                                <td>Descripcion</td>\r\n");
      out.write("                                <td>Acciones</td>\r\n");
      out.write("                            </tr>\r\n");
      out.write("                        </thead>\r\n");
      out.write("                        <tbody>\r\n");
      out.write("                            <tr>\r\n");
      out.write("                                <td>Hola</td>\r\n");
      out.write("                                <td>Hola</td>\r\n");
      out.write("                                <td>\r\n");
      out.write("                                    <a class=\"btn btn-warning btn-sm\"><i class=\"fa-solid fa-pen-to-square\" style=\"color: #ffffff;\"></i></a>\r\n");
      out.write("                                    <a class=\"btn btn-danger btn-sm\"><i class=\"fa-solid fa-trash\" style=\"color: #ffffff;\"></i></a>\r\n");
      out.write("                                </td>\r\n");
      out.write("                            </tr>\r\n");
      out.write("                        </tbody>\r\n");
      out.write("                    </table>\r\n");
      out.write("                </div>\r\n");
      out.write("                <div class=\"col-4\">\r\n");
      out.write("                    <form action=\"action\">\r\n");
      out.write("                        <div class=\"card\">\r\n");
      out.write("                            <div class=\"card-header text-center\">\r\n");
      out.write("                                <h5>Agregar editorial</h5>\r\n");
      out.write("                            </div>\r\n");
      out.write("                            <div class=\"card-body\">\r\n");
      out.write("                                <div class=\"form-floating my-3\">\r\n");
      out.write("                                    <input type=\"text\" class=\"form-control form-control-sm\" id=\"floatingInput\" placeholder=\"Nombre de la editorial\">\r\n");
      out.write("                                    <label for=\"floatingInput\">Editorial</label>\r\n");
      out.write("                                </div>\r\n");
      out.write("                                <div class=\"form-floating my-3\">\r\n");
      out.write("                                    <textarea class=\"form-control\" name=\"txtDescripcion\" placeholder=\"Breve descripcion de la editorial\" id=\"floatingTextarea\" style=\"height: 150px\"></textarea>\r\n");
      out.write("                                    <label for=\"floatingTextarea\">Descripcion</label>\r\n");
      out.write("                                </div>\r\n");
      out.write("                                <div class=\"d-flex justify-content-end\">\r\n");
      out.write("                                    <input type=\"submit\" value=\"Agregar\" class=\"btn btn-success mx-2\"/>\r\n");
      out.write("                                    <input type=\"submit\" value=\"Actualizar  \" class=\"btn btn-secondary\"/>\r\n");
      out.write("                                </div>\r\n");
      out.write("                            </div>\r\n");
      out.write("                        </div>\r\n");
      out.write("                    </form>\r\n");
      out.write("                </div>\r\n");
      out.write("            </div>\r\n");
      out.write("        </div>\r\n");
      out.write("        <script src=\"https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js\" integrity=\"sha384-HwwvtgBNo3bZJJLYd8oVXjrBZt8cqVSpeBNS5n7C8IVInixGAoxmnlMuBnhbgrkm\" crossorigin=\"anonymous\"></script>\r\n");
      out.write("    </body>\r\n");
      out.write("</html>\r\n");
    } catch (Throwable t) {
      if (!(t instanceof SkipPageException)){
        out = _jspx_out;
        if (out != null && out.getBufferSize() != 0)
          out.clearBuffer();
        if (_jspx_page_context != null) _jspx_page_context.handlePageException(t);
        else throw new ServletException(t);
      }
    } finally {
      _jspxFactory.releasePageContext(_jspx_page_context);
    }
  }
}
