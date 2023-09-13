package org.apache.jsp.view;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import java.util.Iterator;
import model.Servicio;
import java.util.List;
import modelDao.ServicioDAO;

public final class ListarServicio_jsp extends org.apache.jasper.runtime.HttpJspBase
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
      out.write("\n");
      out.write("\n");
      out.write("<!DOCTYPE html>\n");
      out.write("<html>\n");
      out.write("    <head>\n");
      out.write("        <title>Listar</title>\n");
      out.write("        <!-- Enlace a Bootstrap CSS -->\n");
      out.write("        <link rel=\"stylesheet\" href=\"https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css\">\n");
      out.write("    </head>\n");
      out.write("    <body>\n");
      out.write("        <div class=\"container mt-4\">\n");
      out.write("            <h2>Listado de servicios</h2>\n");
      out.write("            <table class=\"table table-bordered table-hover\">\n");
      out.write("                <thead>\n");
      out.write("                    <tr>\n");
      out.write("                        <th>ID</th>\n");
      out.write("                        <th>Costo De Servicio</th>\n");
      out.write("                        <th>Fecha Servicio</th>\n");
      out.write("                        <th>Fecha Vencimiento</th>\n");
      out.write("                        <th>ID Tipo Servicio</th>\n");
      out.write("                        <th>ID Libro</th>\n");
      out.write("                        <th>ID Usuario</th>\n");
      out.write("                        <th>Acciones</th>\n");
      out.write("                    </tr>\n");
      out.write("                </thead>\n");
      out.write("                ");

                    ServicioDAO dao = new ServicioDAO();
                    List<Servicio> listaTipoSuscripcion = dao.listar();
                    Iterator<Servicio> iterator = listaTipoSuscripcion.iterator();
                    Servicio serv = null;
                    while (iterator.hasNext()) {
                        serv = iterator.next();

                
      out.write("\n");
      out.write("                <tbody>\n");
      out.write("                    <tr>\n");
      out.write("                        <td>");
      out.print(serv.getIdServicio());
      out.write("</td>\n");
      out.write("                        <td>");
      out.print(serv.getCostoServicio());
      out.write("</td>\n");
      out.write("                        <td>");
      out.print(serv.getFechaServicio());
      out.write("</td>\n");
      out.write("                        <td>");
      out.print(serv.getFechaVencimientoServicio());
      out.write("</td>\n");
      out.write("                        <td>");
      out.print(serv.getIdTipoServicio());
      out.write("</td>\n");
      out.write("                        <td>");
      out.print(serv.getIdLibro());
      out.write("</td>\n");
      out.write("                        <td>");
      out.print(serv.getIdUsuario());
      out.write("</td>\n");
      out.write("                        <td>\n");
      out.write("                            <button type=\"button\" class=\"btn btn-primary\">Primary</button>\n");
      out.write("                            <button type=\"button\" class=\"btn btn-primary\">Primary</button>\n");
      out.write("                        </td>\n");
      out.write("                    </tr>\n");
      out.write("                    ");
}
      out.write("\n");
      out.write("                </tbody>\n");
      out.write("            </table>\n");
      out.write("        </div>\n");
      out.write("\n");
      out.write("        <!-- Enlace a Bootstrap JS (opcional, solo si necesitas funcionalidades JS de Bootstrap) -->\n");
      out.write("        <script src=\"https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js\"></script>\n");
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
