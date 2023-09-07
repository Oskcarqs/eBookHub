package org.apache.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;

public final class index_jsp extends org.apache.jasper.runtime.HttpJspBase
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

      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("<!doctype html>\n");
      out.write("<html lang=\"en\">\n");
      out.write("    <head>\n");
      out.write("        <meta charset=\"utf-8\">\n");
      out.write("        <meta name=\"viewport\" content=\"width=device-width, initial-scale=1\">\n");
      out.write("        <title>Principal</title>\n");
      out.write("        <link href=\"https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css\" rel=\"stylesheet\" integrity=\"sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65\" crossorigin=\"anonymous\">\n");
      out.write("    </head>\n");
      out.write("    <body>\n");
      out.write("\n");
      out.write("        <nav class=\"navbar navbar-expand-lg bg-primary\"> <c\n");
      out.write("                <div class=\"container-fluid\">\n");
      out.write("                    <a class=\"navbar-brand\" href=\"#\">EBookHub</a>\n");
      out.write("                    <button class=\"navbar-toggler\" type=\"button\" data-bs-toggle=\"collapse\" data-bs-target=\"#navbarSupportedContent\" aria-controls=\"navbarSupportedContent\" aria-expanded=\"false\" aria-label=\"Toggle navigation\">\n");
      out.write("                        <span class=\"navbar-toggler-icon\"></span>\n");
      out.write("                    </button>\n");
      out.write("                    <div class=\"collapse navbar-collapse\" id=\"navbarSupportedContent\">\n");
      out.write("                        <ul class=\"navbar-nav me-auto mb-2 mb-lg-0\">\n");
      out.write("                            <li class=\"nav-item\">\n");
      out.write("                                <a class=\"nav-link active\" aria-current=\"page\" href=\"#\">Inicio</a>\n");
      out.write("                            </li>\n");
      out.write("                            <li class=\"nav-item\">\n");
      out.write("                                <a class=\"nav-link\" href=\"#\">Catalogo</a>\n");
      out.write("                            </li>\n");
      out.write("                            <li class=\"nav-item dropdown\">\n");
      out.write("                                <a class=\"nav-link dropdown-toggle\" href=\"#\" role=\"button\" data-bs-toggle=\"dropdown\" aria-expanded=\"false\">\n");
      out.write("                                    Categorias\n");
      out.write("                                </a>\n");
      out.write("                                <ul class=\"dropdown-menu\">\n");
      out.write("                                    <li><a class=\"dropdown-item\" href=\"#\">Action</a></li>\n");
      out.write("                                    <li><a class=\"dropdown-item\" href=\"#\">Another action</a></li>\n");
      out.write("                                    <li><hr class=\"dropdown-divider\"></li>\n");
      out.write("                                    <li><a class=\"dropdown-item\" href=\"#\">Something else here</a></li>\n");
      out.write("                                </ul>\n");
      out.write("                            </li>\n");
      out.write("                        </ul>\n");
      out.write("                        <form class=\"d-flex\" role=\"search\">\n");
      out.write("                            <input class=\"form-control me-2\" type=\"search\" placeholder=\"Buscar\" aria-label=\"Search\">\n");
      out.write("                            <button class=\"btn btn-outline-success\" type=\"submit\">Buscar</button>\n");
      out.write("                        </form>\n");
      out.write("                    </div>\n");
      out.write("                </div>\n");
      out.write("        </nav>\n");
      out.write("        <header id=\"inicio\" class=\"bg-primary text-white text-center\">\n");
      out.write("            <div class=\"container-xxl\">\n");
      out.write("                <h1 class=\"display-1\">Las mejores libros.</h1>\n");
      out.write("\n");
      out.write("                <a href=\"ControladorServicio?accion=listar\" class=\"link-light link-offset-4  link-underline-lightm link-underline-opacity-100-hover\">Listar Servicios</a>\n");
      out.write("                <a href=\"ControladorTipoServicio?accion=listar\" class=\"link-light link-offset-4  link-underline-lightm link-underline-opacity-100-hover\">Listar Tipo Servicios</a>\n");
      out.write("            </div>\n");
      out.write("        </header>\n");
      out.write("        <script src=\"https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js\" integrity=\"sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4\" crossorigin=\"anonymous\"></script>\n");
      out.write("    </body>\n");
      out.write("</html>\n");
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
