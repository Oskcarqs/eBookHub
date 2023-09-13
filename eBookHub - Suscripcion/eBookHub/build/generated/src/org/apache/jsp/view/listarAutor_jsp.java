package org.apache.jsp.view;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import model.Autor;
import modelDAO.AutorDAO;
import java.util.Iterator;
import model.Categoria;
import java.util.List;
import modelDAO.CategoriaDAO;

public final class listarAutor_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent {

  private static final JspFactory _jspxFactory = JspFactory.getDefaultFactory();

  private static java.util.List<String> _jspx_dependants;

  private org.apache.jasper.runtime.TagHandlerPool _jspx_tagPool_c_forEach_var_items;

  private org.glassfish.jsp.api.ResourceInjector _jspx_resourceInjector;

  public java.util.List<String> getDependants() {
    return _jspx_dependants;
  }

  public void _jspInit() {
    _jspx_tagPool_c_forEach_var_items = org.apache.jasper.runtime.TagHandlerPool.getTagHandlerPool(getServletConfig());
  }

  public void _jspDestroy() {
    _jspx_tagPool_c_forEach_var_items.release();
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
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("<!DOCTYPE html>\r\n");
      out.write("<html>\r\n");
      out.write("    <head>\r\n");
      out.write("        <meta http-equiv=\"Content-Type\" content=\"text/html; charset=UTF-8\">\r\n");
      out.write("        <title>Listar Autor</title>\r\n");
      out.write("        <link rel=\"stylesheet\" href=\"https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css\">      \r\n");
      out.write("        <link href=\"https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css\" rel=\"stylesheet\" integrity=\"sha384-4bw+/aepP/YC94hEpVNVgiZdgIC5+VKNBQNGCHeKRQN+PtmoHDEXuppvnDJzQIu9\" crossorigin=\"anonymous\">\r\n");
      out.write("        <script src=\"https://kit.fontawesome.com/2833bb8570.js\" crossorigin=\"anonymous\"></script>\r\n");
      out.write("        <script src=\"../Scripts.js\"></script>\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("    </head>\r\n");
      out.write("    <body>\r\n");
      out.write("        <nav class=\"navbar navbar-expand-lg sticky-top navbar-dark bg-dark\">\r\n");
      out.write("            <div class=\"container-fluid\">\r\n");
      out.write("                <a class=\"navbar-brand mx-3\" href=\"#\">\r\n");
      out.write("                    <img src=\"../img/LogoEBookHubNavBar.png\" alt=\"Logo\" width=\"30\" height=\"30\" class=\"d-inline-block align-text-top\">\r\n");
      out.write("                    eBookHub\r\n");
      out.write("                </a>\r\n");
      out.write("                <button class=\"navbar-toggler\" type=\"button\" data-bs-toggle=\"collapse\" data-bs-target=\"#navbarSupportedContent\" aria-controls=\"navbarSupportedContent\" aria-expanded=\"false\" aria-label=\"Toggle navigation\">\r\n");
      out.write("                    <i class=\"fa-solid fa-bars fa-lg\" style=\"color: #ffffff;\"></i>\r\n");
      out.write("                </button>\r\n");
      out.write("                <div class=\"collapse navbar-collapse\" id=\"navbarSupportedContent\">\r\n");
      out.write("                    <ul class=\"navbar-nav me-auto mb-2 mb-lg-0\">\r\n");
      out.write("                        <li class=\"nav-item\">\r\n");
      out.write("                            <a class=\"nav-link mx-2\" aria-current=\"page\" href=\"Controlador?menu=Inicio&accion=Listar\"><i class=\"fa-solid fa-house\" style=\"color: #ffffff;\"></i> Inicio</a>\r\n");
      out.write("                        </li>\r\n");
      out.write("                        <li class=\"nav-item dropdown mx-2\">\r\n");
      out.write("                            <a class=\"nav-link mx-2\" aria-current=\"page\" href=\"view/listarLibro.jsp\">Libros</a>\r\n");
      out.write("                        </li>\r\n");
      out.write("                        <li class=\"nav-item dropdown mx-2\">\r\n");
      out.write("                            <a class=\"nav-link dropdown-toggle\" href=\"#\" role=\"button\" data-bs-toggle=\"dropdown\" aria-expanded=\"false\">\r\n");
      out.write("                                Mas\r\n");
      out.write("                            </a>\r\n");
      out.write("                            <ul class=\"dropdown-menu\">\r\n");
      out.write("                                <li><a class=\"dropdown-item\" href=\"view/listarCliente.jsp\">Clientes</a></li>\r\n");
      out.write("                                <li><a class=\"dropdown-item\" href=\"view/listarEmpleado.jsp\">Empleados</a></li>\r\n");
      out.write("                                <li><a class=\"dropdown-item\" href=\"view/listarFactura.jsp\">Facturas</a></li>\r\n");
      out.write("                                <li><a class=\"dropdown-item\" href=\"view/listarSucursal.jsp\">Sucursal</a></li>\r\n");
      out.write("                                <li><a class=\"dropdown-item\" href=\"view/ListarServicio.jsp\">Servicio</a></li>\r\n");
      out.write("                                <li><a class=\"dropdown-item\" href=\"view/listarEditorial.jsp\">Editorial</a></li>\r\n");
      out.write("                                <li><a class=\"dropdown-item\" href=\"Controlador?menu=Autor&accion=Listar\">Autor</a></li>\r\n");
      out.write("                                <li><a class=\"dropdown-item\" href=\"view/listarCliente.jsp\">Categoria</a></li>\r\n");
      out.write("\r\n");
      out.write("\r\n");
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
      out.write("                    <div class=\"dropdown\">\r\n");
      out.write("                        <button type=\"button\" class=\"btn btn-light dropdown-toggle\" data-bs-toggle=\"dropdown\" aria-expanded=\"false\" data-bs-auto-close=\"outside\">\r\n");
      out.write("                            Sing in\r\n");
      out.write("                        </button>\r\n");
      out.write("                        <form class=\"dropdown-menu dropdown-menu-lg-end  p-4\">\r\n");
      out.write("                            <div class=\"mb-3\">\r\n");
      out.write("                                <label for=\"exampleDropdownFormEmail2\" class=\"form-label\">Email address</label>\r\n");
      out.write("                                <input type=\"email\" class=\"form-control\" id=\"exampleDropdownFormEmail2\" placeholder=\"email@example.com\">\r\n");
      out.write("                            </div>\r\n");
      out.write("                            <div class=\"mb-3\">\r\n");
      out.write("                                <label for=\"exampleDropdownFormPassword2\" class=\"form-label\">Password</label>\r\n");
      out.write("                                <input type=\"password\" class=\"form-control\" id=\"exampleDropdownFormPassword2\" placeholder=\"Password\">\r\n");
      out.write("                            </div>\r\n");
      out.write("                            <div class=\"mb-3\">\r\n");
      out.write("                                <div class=\"form-check\">\r\n");
      out.write("                                    <input type=\"checkbox\" class=\"form-check-input\" id=\"dropdownCheck2\">\r\n");
      out.write("                                    <label class=\"form-check-label\" for=\"dropdownCheck2\">\r\n");
      out.write("                                        Remember me\r\n");
      out.write("                                    </label>\r\n");
      out.write("                                </div>\r\n");
      out.write("                            </div>\r\n");
      out.write("                            <button type=\"submit\" class=\"btn btn-primary\">Sign in</button>\r\n");
      out.write("                        </form>\r\n");
      out.write("                    </div>\r\n");
      out.write("                </div>\r\n");
      out.write("            </div>\r\n");
      out.write("        </nav>\r\n");
      out.write("\r\n");
      out.write("        <div class=\"container-fluid p-4\">\r\n");
      out.write("            <div class=\"d-flex justify-content-end\"> \r\n");
      out.write("                <!-- Button trigger modal -->\r\n");
      out.write("                <button type=\"button\" class=\"btn btn-primary\" data-bs-toggle=\"modal\" data-bs-target=\"#exampleModal\">\r\n");
      out.write("                    <i class=\"fa-solid fa-pen-fancy\" style=\"color: #ffffff;\"></i> Agregar autor\r\n");
      out.write("                </button>\r\n");
      out.write("                <!-- Modal -->\r\n");
      out.write("                <div class=\"modal fade\" id=\"exampleModal\" tabindex=\"-1\" aria-labelledby=\"exampleModalLabel\" aria-hidden=\"true\">\r\n");
      out.write("                    <div class=\"modal-dialog\">\r\n");
      out.write("                        <div class=\"modal-content\">\r\n");
      out.write("                            <form action=\"Controlador?menu=Autor\" method=\"POST\" autocomplete=\"off\">\r\n");
      out.write("                                <div class=\"modal-header\">\r\n");
      out.write("                                    <!-- Titulo -->\r\n");
      out.write("                                    <h1 class=\"modal-title fs-5\" id=\"exampleModalLabel\">Agregar autor</h1>\r\n");
      out.write("                                    <button type=\"button\" class=\"btn btn-white\" data-bs-dismiss=\"modal\" aria-label=\"Close\"><i class=\"fa-solid fa-xmark fa-xl\" style=\"color: #000000;\"></i></button>\r\n");
      out.write("                                </div>\r\n");
      out.write("                                <div class=\"modal-body\">\r\n");
      out.write("                                    <!-- FORMUlARIO PARA AGREGAR -->\r\n");
      out.write("                                    <div class=\"form-floating mb-3\">\r\n");
      out.write("                                        <input type=\"text\" class=\"form-control\" id=\"floatingInput\" name=\"txtNombre\" required>\r\n");
      out.write("                                        <label for=\"floatingInput\">Nombre autor</label>\r\n");
      out.write("                                    </div>\r\n");
      out.write("                                    <div class=\"form-floating mb-3\">\r\n");
      out.write("                                        <input type=\"text\" class=\"form-control\" id=\"floatingInput\" name=\"txtApellido\" required>\r\n");
      out.write("                                        <label for=\"floatingInput\">Apellido autor</label>\r\n");
      out.write("                                    </div>\r\n");
      out.write("                                    <div class=\"form-floating mb-3\">\r\n");
      out.write("                                        <input type=\"text\" class=\"form-control\" id=\"floatingInput\" name=\"txtNacionalidad\" required>\r\n");
      out.write("                                        <label for=\"floatingInput\">Nacionalidad</label>\r\n");
      out.write("                                    </div>\r\n");
      out.write("                                    <div class=\"form-floating mb-3\">\r\n");
      out.write("                                        <input type=\"date\" class=\"form-control\" id=\"floatingInput\" name=\"txtNacimiento\" required>\r\n");
      out.write("                                        <label for=\"floatingInput\">Fecha de nacimiento</label>\r\n");
      out.write("                                    </div>\r\n");
      out.write("                                    <div class=\"form-floating\">\r\n");
      out.write("                                        <textarea class=\"form-control\" id=\"floatingTextarea2\" style=\"height: 100px\" name=\"txtBiografia\" required=\"on\"></textarea>\r\n");
      out.write("                                        <label for=\"floatingTextarea2\">Biografia</label>\r\n");
      out.write("                                    </div>\r\n");
      out.write("                                </div>\r\n");
      out.write("                                <div class=\"modal-footer\">\r\n");
      out.write("                                    <button type=\"submit\" class=\"btn btn-secondary\" data-bs-dismiss=\"modal\">Cancelar</button>\r\n");
      out.write("                                    <button type=\"submit\" class=\"btn btn-primary\" name=\"accion\" value=\"Agregar\">Agregar</button>\r\n");
      out.write("                                </div>\r\n");
      out.write("                            </form>\r\n");
      out.write("                        </div>\r\n");
      out.write("                    </div>\r\n");
      out.write("                </div>\r\n");
      out.write("            </div>\r\n");
      out.write("\r\n");
      out.write("            <table class=\"table aling-middle table-striped text-center table-hover mt-3\">\r\n");
      out.write("                <thead class=\"table-dark\">\r\n");
      out.write("                    <tr>\r\n");
      out.write("                        <td>Nombre</td>\r\n");
      out.write("                        <td>Apellido</td>\r\n");
      out.write("                        <td>Nacionalidad</td>\r\n");
      out.write("                        <td>Nacimiento</td>\r\n");
      out.write("                        <td class=\"col-sm-5\">Biografia</td>\r\n");
      out.write("                        <td>Acciones</td>\r\n");
      out.write("                    </tr>\r\n");
      out.write("                </thead>\r\n");
      out.write("                <tbody>\r\n");
      out.write("                    ");
      if (_jspx_meth_c_forEach_0(_jspx_page_context))
        return;
      out.write("\r\n");
      out.write("                </tbody>\r\n");
      out.write("            </table>\r\n");
      out.write("        </div>\r\n");
      out.write("        <script src=\"https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.8/dist/umd/popper.min.js\" integrity=\"sha384-I7E8VVD/ismYTF4hNIPjVp/Zjvgyol6VFvRkX/vR+Vc4jQkC+hVqc2pM8ODewa9r\" crossorigin=\"anonymous\"></script>\r\n");
      out.write("        <script src=\"https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.min.js\" integrity=\"sha384-Rx+T1VzGupg4BHQYs2gCW9It+akI2MM/mndMCy36UVfodzcJcF0GGLxZIzObiEfa\" crossorigin=\"anonymous\"></script>\r\n");
      out.write("    </body>\r\n");
      out.write("</html>");
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

  private boolean _jspx_meth_c_forEach_0(PageContext _jspx_page_context)
          throws Throwable {
    PageContext pageContext = _jspx_page_context;
    JspWriter out = _jspx_page_context.getOut();
    //  c:forEach
    org.apache.taglibs.standard.tag.rt.core.ForEachTag _jspx_th_c_forEach_0 = (org.apache.taglibs.standard.tag.rt.core.ForEachTag) _jspx_tagPool_c_forEach_var_items.get(org.apache.taglibs.standard.tag.rt.core.ForEachTag.class);
    _jspx_th_c_forEach_0.setPageContext(_jspx_page_context);
    _jspx_th_c_forEach_0.setParent(null);
    _jspx_th_c_forEach_0.setVar("a");
    _jspx_th_c_forEach_0.setItems((java.lang.Object) org.apache.jasper.runtime.PageContextImpl.evaluateExpression("${autor}", java.lang.Object.class, (PageContext)_jspx_page_context, null));
    int[] _jspx_push_body_count_c_forEach_0 = new int[] { 0 };
    try {
      int _jspx_eval_c_forEach_0 = _jspx_th_c_forEach_0.doStartTag();
      if (_jspx_eval_c_forEach_0 != javax.servlet.jsp.tagext.Tag.SKIP_BODY) {
        do {
          out.write("\r\n");
          out.write("                        <tr>\r\n");
          out.write("                            <td>");
          out.write((java.lang.String) org.apache.jasper.runtime.PageContextImpl.evaluateExpression("${a.getNombreAutor()}", java.lang.String.class, (PageContext)_jspx_page_context, null));
          out.write("</td>\r\n");
          out.write("                            <td>");
          out.write((java.lang.String) org.apache.jasper.runtime.PageContextImpl.evaluateExpression("${a.getApellidoAutor()}", java.lang.String.class, (PageContext)_jspx_page_context, null));
          out.write("</td>\r\n");
          out.write("                            <td>");
          out.write((java.lang.String) org.apache.jasper.runtime.PageContextImpl.evaluateExpression("${a.getNacionalidadAutor()}", java.lang.String.class, (PageContext)_jspx_page_context, null));
          out.write("</td>\r\n");
          out.write("                            <td>");
          out.write((java.lang.String) org.apache.jasper.runtime.PageContextImpl.evaluateExpression("${a.getFechaNacimientoAutor()}", java.lang.String.class, (PageContext)_jspx_page_context, null));
          out.write("</td>\r\n");
          out.write("                            <td>");
          out.write((java.lang.String) org.apache.jasper.runtime.PageContextImpl.evaluateExpression("${a.getBiografiaAutor()}", java.lang.String.class, (PageContext)_jspx_page_context, null));
          out.write("</td>\r\n");
          out.write("                            <td>\r\n");
          out.write("                                <button type=\"button\" class=\"btn btn-warning\" data-bs-toggle=\"modal\" data-bs-target=\"#editarModal");
          out.write((java.lang.String) org.apache.jasper.runtime.PageContextImpl.evaluateExpression("${a.getIdAutor()}", java.lang.String.class, (PageContext)_jspx_page_context, null));
          out.write("\">\r\n");
          out.write("                                    <i class=\"fa-solid fa-pen-to-square\" style=\"color: #ffffff;\"></i>\r\n");
          out.write("                                </button>\r\n");
          out.write("                                <div class=\"modal fade\" id=\"editarModal");
          out.write((java.lang.String) org.apache.jasper.runtime.PageContextImpl.evaluateExpression("${a.getIdAutor()}", java.lang.String.class, (PageContext)_jspx_page_context, null));
          out.write("\" tabindex=\"-1\" aria-labelledby=\"editarModalLabel");
          out.write((java.lang.String) org.apache.jasper.runtime.PageContextImpl.evaluateExpression("${a.getIdAutor()}", java.lang.String.class, (PageContext)_jspx_page_context, null));
          out.write("\" aria-hidden=\"true\">\r\n");
          out.write("                                    <form action=\"Controlador?menu=Autor&codigoAutor=");
          out.write((java.lang.String) org.apache.jasper.runtime.PageContextImpl.evaluateExpression("${a.getIdAutor()}", java.lang.String.class, (PageContext)_jspx_page_context, null));
          out.write("\" method=\"POST\" autocomplete=\"off\" >\r\n");
          out.write("                                        <div class=\"modal-dialog\">\r\n");
          out.write("                                            <div class=\"modal-content\">\r\n");
          out.write("                                                <div class=\"modal-header\">\r\n");
          out.write("                                                    <!-- Titulo -->\r\n");
          out.write("                                                    <h1 class=\"modal-title fs-5\" id=\"exampleModalLabel\">Editar autor</h1>\r\n");
          out.write("                                                    <button type=\"button\" class=\"btn btn-white\" data-bs-dismiss=\"modal\" aria-label=\"Close\"><i class=\"fa-solid fa-xmark fa-xl\" style=\"color: #000000;\"></i></button>\r\n");
          out.write("                                                </div>\r\n");
          out.write("                                                <div class=\"modal-body\">\r\n");
          out.write("                                                    <!-- FORMUlARIO PARA EDITAR -->\r\n");
          out.write("                                                    <div class=\"form-floating mb-3\">\r\n");
          out.write("                                                        <input type=\"text\" class=\"form-control\" id=\"floatingInput\" value=\"");
          out.write((java.lang.String) org.apache.jasper.runtime.PageContextImpl.evaluateExpression("${a.getNombreAutor()}", java.lang.String.class, (PageContext)_jspx_page_context, null));
          out.write("\" name=\"txtNombre\" required>\r\n");
          out.write("                                                        <label for=\"floatingInput\">Nombre autor</label>\r\n");
          out.write("                                                    </div>\r\n");
          out.write("                                                    <div class=\"form-floating mb-3\">\r\n");
          out.write("                                                        <input type=\"text\" class=\"form-control\" id=\"floatingInput\" value=\"");
          out.write((java.lang.String) org.apache.jasper.runtime.PageContextImpl.evaluateExpression("${a.getApellidoAutor()}", java.lang.String.class, (PageContext)_jspx_page_context, null));
          out.write("\" name=\"txtApellido\" required>\r\n");
          out.write("                                                        <label for=\"floatingInput\">Apellido autor</label>\r\n");
          out.write("                                                    </div>\r\n");
          out.write("                                                    <div class=\"form-floating mb-3\">\r\n");
          out.write("                                                        <input type=\"text\" class=\"form-control\" id=\"floatingInput\" value=\"");
          out.write((java.lang.String) org.apache.jasper.runtime.PageContextImpl.evaluateExpression("${a.getNacionalidadAutor()}", java.lang.String.class, (PageContext)_jspx_page_context, null));
          out.write("\" name=\"txtNacionalidad\" required>\r\n");
          out.write("                                                        <label for=\"floatingInput\">Nacionalidad</label>\r\n");
          out.write("                                                    </div>\r\n");
          out.write("                                                    <div class=\"form-floating mb-3\">\r\n");
          out.write("                                                        <input type=\"date\" class=\"form-control\" id=\"floatingInput\" value=\"");
          out.write((java.lang.String) org.apache.jasper.runtime.PageContextImpl.evaluateExpression("${a.getFechaNacimientoAutor()}", java.lang.String.class, (PageContext)_jspx_page_context, null));
          out.write("\" name=\"txtNacimiento\" required>\r\n");
          out.write("                                                        <label for=\"floatingInput\">Fecha de nacimiento</label>\r\n");
          out.write("                                                    </div>\r\n");
          out.write("                                                    <div class=\"form-floating\">\r\n");
          out.write("                                                        <textarea class=\"form-control\" id=\"floatingTextarea2\" style=\"height: 100px\" name=\"txtBiografia\" required=\"on\">");
          out.write((java.lang.String) org.apache.jasper.runtime.PageContextImpl.evaluateExpression("${a.getBiografiaAutor()}", java.lang.String.class, (PageContext)_jspx_page_context, null));
          out.write("</textarea>\r\n");
          out.write("                                                        <label for=\"floatingTextarea2\">Biografia</label>\r\n");
          out.write("                                                    </div>\r\n");
          out.write("                                                </div>\r\n");
          out.write("                                                <div class=\"modal-footer\">\r\n");
          out.write("                                                    <button type=\"button\" class=\"btn btn-primary\" name=\"accion\" value=\"Editar\">Actualizar</button>\r\n");
          out.write("                                                    <button type=\"button\" class=\"btn btn-secondary\" data-bs-dismiss=\"modal\">Cancelar</button>\r\n");
          out.write("                                                </div>\r\n");
          out.write("                                            </div>\r\n");
          out.write("                                        </div>\r\n");
          out.write("                                    </form>\r\n");
          out.write("                                </div>\r\n");
          out.write("                                <a class=\"btn btn-danger\"><i class=\"fa-solid fa-trash\" style=\"color: #ffffff;\"></i></a>\r\n");
          out.write("                            </td>  \r\n");
          out.write("                        </tr>\r\n");
          out.write("                    ");
          int evalDoAfterBody = _jspx_th_c_forEach_0.doAfterBody();
          if (evalDoAfterBody != javax.servlet.jsp.tagext.BodyTag.EVAL_BODY_AGAIN)
            break;
        } while (true);
      }
      if (_jspx_th_c_forEach_0.doEndTag() == javax.servlet.jsp.tagext.Tag.SKIP_PAGE) {
        return true;
      }
    } catch (Throwable _jspx_exception) {
      while (_jspx_push_body_count_c_forEach_0[0]-- > 0)
        out = _jspx_page_context.popBody();
      _jspx_th_c_forEach_0.doCatch(_jspx_exception);
    } finally {
      _jspx_th_c_forEach_0.doFinally();
      _jspx_tagPool_c_forEach_var_items.reuse(_jspx_th_c_forEach_0);
    }
    return false;
  }
}
