package org.apache.jsp.view;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import java.util.Iterator;
import java.util.List;
import model.TipoLibro;
import modelDAO.TipoLibroDAO;

public final class listarTipoLibro_jsp extends org.apache.jasper.runtime.HttpJspBase
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
      out.write("        <meta http-equiv=\"Content-Type\" content=\"text/html; charset=UTF-8\">\n");
      out.write("        <title>Listar Tipo Libro</title>\n");
      out.write("    </head>\n");
      out.write("    <body>\n");
      out.write("        <div>\n");
      out.write("            <h1>Registro Tipo Libro</h1>\n");
      out.write("            <a href=\"ControladorTipoLibro?accion=addTipoLibro\">Agregar Tipo Libro</a>\n");
      out.write("            <table border=\"1\">\n");
      out.write("                <thead>\n");
      out.write("                    <tr>\n");
      out.write("                        <th>Id Tipo Libro</th>\n");
      out.write("                        <th>Nombre Tipo Libro</th>\n");
      out.write("                        <th>Descripción Tipo Libro</th>\n");
      out.write("                        <th>ACCIONES</th>\n");
      out.write("                    </tr>\n");
      out.write("                </thead>\n");
      out.write("                ");

                    TipoLibroDAO dao = new TipoLibroDAO();
                    List<TipoLibro> listaTipoLibro = dao.listarTipoLibro();
                    Iterator<TipoLibro> iterator = listaTipoLibro.iterator();
                    TipoLibro tl = null;
                    while(iterator.hasNext()){
                        
                        tl = iterator.next();
                
      out.write("\n");
      out.write("                <tbody>\n");
      out.write("                    <tr>\n");
      out.write("                        <td>");
      out.print( tl.getIdTipoLibro());
      out.write("</td>\n");
      out.write("                        <td>");
      out.print( tl.getNombreTipoLibro());
      out.write("</td>\n");
      out.write("                        <td>");
      out.print( tl.getDescripcionTipoLibro());
      out.write("</td>\n");
      out.write("                        <td>\n");
      out.write("                            <a href=\"ControladorTipoLibro?accion=editar%idTipoLibro=");
      out.print( tl.getIdTipoLibro());
      out.write("\">Edit</a>\n");
      out.write("                            <a href=\"\">Eliminar</a>\n");
      out.write("                        </td>\n");
      out.write("                    </tr>\n");
      out.write("                    ");
}
      out.write("\n");
      out.write("                </tbody>\n");
      out.write("            </table>\n");
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
