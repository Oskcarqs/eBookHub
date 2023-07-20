package org.apache.jsp.View;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import model.Editorial;
import modelDAO.EditorialDAO;

public final class editarEditorial_jsp extends org.apache.jasper.runtime.HttpJspBase
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
      out.write("\n");
      out.write("\n");
      out.write("<!DOCTYPE html>\n");
      out.write("<html>\n");
      out.write("    <head>\n");
      out.write("        <meta http-equiv=\"Content-Type\" content=\"text/html; charset=UTF-8\">\n");
      out.write("        <title>Editar Editorial</title>\n");
      out.write("    </head>\n");
      out.write("    <body>\n");
      out.write("        <div>\n");
      out.write("            <div>\n");
      out.write("                ");

                EditorialDAO nuevaEditorialDAO = new EditorialDAO();
                int idEdi = Integer.parseInt((String)request.getAttribute("idEdi"));
                Editorial nuevaEditorial = (Editorial)nuevaEditorialDAO.listEditorial(idEdi);
            
      out.write("\n");
      out.write("                <h1>Editar una Editorial</h1>\n");
      out.write("                <form action=\"Controlador\">\n");
      out.write("                <strong>Nombre:</strong><br>\n");
      out.write("                <input type=\"text\" name=\"txtNombreEditorial\" value=\"");
      out.print(nuevaEditorial.getNombreEditorial());
      out.write("\"><br>\n");
      out.write("                <strong>Descripcion:</strong><br>\n");
      out.write("                <input type=\"text\" name=\"txtDescripcionEditorial\" value=\"");
      out.print(nuevaEditorial.getDescripcionEditorial());
      out.write("\"><br>\n");
      out.write("                <input type=\"hidden\" name=\"txtIdEditorial\" value=\"");
      out.print(nuevaEditorial.getIdEditorial());
      out.write("\"><br>\n");
      out.write("                <input type=\"submit\" name=\"accion\" value=\"ActualizarEditorial\"><br>\n");
      out.write("                </form>\n");
      out.write("            </div>\n");
      out.write("        </div>\n");
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
