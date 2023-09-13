package org.apache.jsp.view;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;

public final class AgregarServicio_jsp extends org.apache.jasper.runtime.HttpJspBase
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
      out.write("<!DOCTYPE html>\n");
      out.write("<html lang=\"en\">\n");
      out.write("    <head>\n");
      out.write("        <meta charset=\"UTF-8\">\n");
      out.write("        <meta name=\"viewport\" content=\"width=device-width, initial-scale=1.0\">\n");
      out.write("        <title>Formulario de Servicio</title>\n");
      out.write("        <!-- Agregar el enlace al archivo bootstrap.min.css -->\n");
      out.write("        <link rel=\"stylesheet\" href=\"https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css\">\n");
      out.write("        <!-- Agregar el enlace al archivo bootstrap-datepicker.min.css -->\n");
      out.write("        <link rel=\"stylesheet\" href=\"https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.9.0/css/bootstrap-datepicker.min.css\">\n");
      out.write("        <style>\n");
      out.write("            body {\n");
      out.write("                background-color: #f7f7f7;\n");
      out.write("                font-family: Arial, sans-serif;\n");
      out.write("            }\n");
      out.write("\n");
      out.write("            .container {\n");
      out.write("                max-width: 500px;\n");
      out.write("                margin: 50px auto;\n");
      out.write("                background-color: #fff;\n");
      out.write("                padding: 20px;\n");
      out.write("                border-radius: 5px;\n");
      out.write("                box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);\n");
      out.write("            }\n");
      out.write("\n");
      out.write("            h2 {\n");
      out.write("                margin-bottom: 30px;\n");
      out.write("                text-align: center;\n");
      out.write("            }\n");
      out.write("\n");
      out.write("            .form-group label {\n");
      out.write("                font-weight: bold;\n");
      out.write("            }\n");
      out.write("\n");
      out.write("            .btn-primary {\n");
      out.write("                background-color: #007bff;\n");
      out.write("                border-color: #007bff;\n");
      out.write("            }\n");
      out.write("\n");
      out.write("            .btn-primary:hover {\n");
      out.write("                background-color: #0056b3;\n");
      out.write("                border-color: #0056b3;\n");
      out.write("            }\n");
      out.write("\n");
      out.write("            .btn-primary:focus {\n");
      out.write("                box-shadow: 0 0 0 3px rgba(0, 123, 255, 0.5);\n");
      out.write("            }\n");
      out.write("        </style>\n");
      out.write("    </head>\n");
      out.write("    <body>\n");
      out.write("        <div class=\"container\">\n");
      out.write("            <h2>Formulario de Servicio</h2>\n");
      out.write("            <form action=\"ControladorServicio\">\n");
      out.write("                <div class=\"form-group\">\n");
      out.write("                    <label for=\"costoServicio\">Costo de Servicio:</label>\n");
      out.write("                    <input type=\"text\" class=\"form-control\" id=\"costoServicio\" name=\"txtCostoServicio\" required>\n");
      out.write("                </div>\n");
      out.write("                <div class=\"form-group\">\n");
      out.write("                    <label for=\"fechaServicio\">Fecha de Servicio:</label>\n");
      out.write("                    <input type=\"text\" class=\"form-control datepicker\" id=\"fechaServicio\" name=\"txtFechaServicio\" required>\n");
      out.write("                </div>\n");
      out.write("                <div class=\"form-group\">\n");
      out.write("                    <label for=\"fechaVencimientoServicio\">Fecha de Vencimiento del Servicio:</label>\n");
      out.write("                    <input type=\"text\" class=\"form-control datepicker\" id=\"fechaVencimientoServicio\" name=\"txtFechaVencimientoServicio\" required>\n");
      out.write("                </div>\n");
      out.write("                <div class=\"form-group\">\n");
      out.write("                    <label for=\"idTipoServicio\">ID de Tipo de Servicio:</label>\n");
      out.write("                    <input type=\"text\" class=\"form-control\" id=\"idTipoServicio\" name=\"txtIdTipoServicio\" required>\n");
      out.write("                </div>\n");
      out.write("                <div class=\"form-group\">\n");
      out.write("                    <label for=\"idLibro\">ID de Libro:</label>\n");
      out.write("                    <input type=\"text\" class=\"form-control\" id=\"idLibro\" name=\"txtIdLibro\" required>\n");
      out.write("                </div>\n");
      out.write("                <div class=\"form-group\">\n");
      out.write("                    <label for=\"idUsuario\">ID de Usuario:</label>\n");
      out.write("                    <input type=\"text\" class=\"form-control\" id=\"idUsuario\" name=\"txtIdUsuario\" required>\n");
      out.write("                </div>\n");
      out.write("                <button type=\"submit\" name=\"accion\" value=\"add\" class=\"btn btn-primary btn-block\">Enviar</button>\n");
      out.write("            </form>\n");
      out.write("        </div>\n");
      out.write("\n");
      out.write("        <!-- Agregar el enlace al archivo bootstrap.min.js -->\n");
      out.write("        <script src=\"https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js\"></script>\n");
      out.write("        <!-- Agregar el enlace al archivo bootstrap-datepicker.min.js -->\n");
      out.write("        <script src=\"https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.9.0/js/bootstrap-datepicker.min.js\"></script>\n");
      out.write("        <script>\n");
      out.write("            // Inicializar los datepickers\n");
      out.write("            $(document).ready(function () {\n");
      out.write("                $('.datepicker').datepicker({\n");
      out.write("                    format: 'yyyy-mm-dd',\n");
      out.write("                    autoclose: true\n");
      out.write("                });\n");
      out.write("            });\n");
      out.write("        </script>\n");
      out.write("    </body>\n");
      out.write("</html>\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
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
