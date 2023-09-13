/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import com.oracle.wls.shaded.org.apache.bcel.generic.AALOAD;
import java.io.IOException;
import java.io.PrintWriter;
import java.io.InputStream;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;
import model.Autor;
import model.Categoria;
import model.Cliente;
import model.DetalleFactura;
import model.Editorial;
import model.Factura;
import model.Libro;
import model.Servicio;
import model.Sucursal;
import model.TipoServicio;
import modelDAO.AutorDAO;
import modelDAO.CategoriaDAO;
import modelDAO.DAOCliente;
import modelDAO.DetalleFacturaDAO;
import modelDAO.EditorialDAO;
import modelDAO.FacturaDAO;
import modelDAO.LibroDAO;
import modelDAO.ServicioDAO;
import modelDAO.SucursalDAO;
import modelDAO.TipoServicioDAO;

/**
 *
 * @author Kaled Rodriguez
 */
@MultipartConfig
public class Controlador extends HttpServlet {

    Autor autor = new Autor();
    AutorDAO autorDAO = new AutorDAO();
    Editorial editorial = new Editorial();
    EditorialDAO editorialDAO = new EditorialDAO();
    Categoria categoria = new Categoria();
    CategoriaDAO categoriaDAO = new CategoriaDAO();
    Libro libro = new Libro();
    LibroDAO libroDAO = new LibroDAO();
    Cliente cliente = new Cliente();
    DAOCliente clienteDAO = new DAOCliente();
    TipoServicio tipoServicio = new TipoServicio();
    TipoServicioDAO tServicioDAO = new TipoServicioDAO();
    Servicio servicio = new Servicio();
    ServicioDAO servicioDAO = new ServicioDAO();
    Sucursal sucursal = new Sucursal();
    SucursalDAO sucursalDAO = new SucursalDAO();
    Factura factura = new Factura();
    FacturaDAO facturaDAO = new FacturaDAO();
    DetalleFactura detallefactura = new DetalleFactura();
    DetalleFacturaDAO detallefacturaDAO = new DetalleFacturaDAO();

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
                case "listar":
                    request.getRequestDispatcher("indexCliente.jsp").forward(request, response);
                    break;
            }
        }
        if (menu.equals("Autor")) {
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
                    autorDAO.eliminarAutor(Integer.parseInt(request.getParameter("idAutor")));
                    response.sendRedirect("Controlador?menu=Autor&accion=Listar");
                    break;
                case "Editar":
                    autor.setIdAutor(Integer.parseInt(request.getParameter("codigoAutor")));
                    autor.setNombreAutor(request.getParameter("txtNombre"));
                    autor.setApellidoAutor(request.getParameter("txtApellido"));
                    autor.setNacionalidadAutor(request.getParameter("txtNacionalidad"));
                    autor.setFechaNacimientoAutor(request.getParameter("txtNacimiento"));
                    autor.setBiografiaAutor(request.getParameter("txtBiografia"));
                    autorDAO.editAutor(autor);
                    response.sendRedirect("Controlador?menu=Autor&accion=Listar");
                    break;
                default:
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
                    editorial.setIdEditorial(Integer.parseInt(request.getParameter("codigoEditorial")));
                    editorial.setNombreEditorial(request.getParameter("txtEditorial"));
                    editorial.setDescripcionEditorial(request.getParameter("txtDescripcion"));
                    editorialDAO.editEditorial(editorial);
                    response.sendRedirect("Controlador?menu=Editorial&accion=Listar");
                    break;
                case "Eliminar":
                    editorialDAO.eliminarEditorial(Integer.parseInt(request.getParameter("codigoEditorial")));
                    response.sendRedirect("Controlador?menu=Editorial&accion=Listar");

                    break;
                case "Cancelar":
                    response.sendRedirect("Controlador?menu=Editorial&accion=Listar");
                    break;
                default:
                    response.sendRedirect("Controlador?menu=Editorial&accion=Listar");
                    break;
            }
        } else if (menu.equals("Categoria")) {
            switch (accion) {
                case "Listar":
                    break;
                case "Agregar":
                    break;
                case "Eliminar":
                    break;
                case "Editar":
                    break;
                default:
                    response.sendRedirect("Controlador?menu=Categoria&accion=Listar");
                    break;
            }
        } else if (menu.equals("Libro")) {

            switch (accion) {
                case "Listar":
                    List listarLibro = libroDAO.listarLibro();
                    request.setAttribute("libro", listarLibro);

                    List listarAutor = autorDAO.listarAutor();
                    request.setAttribute("autor", listarAutor);

                    List listarEditorial = editorialDAO.listar();
                    request.setAttribute("editorial", listarEditorial);

                    List listarCategoria = categoriaDAO.listarCategoria();
                    request.setAttribute("categoria", listarCategoria);

                    request.getRequestDispatcher("view/catalogo.jsp").forward(request, response);
                    break;
                case "Buscar":
                    listarLibro = libroDAO.buscar(request.getParameter("txtBuscar"));
                    request.setAttribute("libro", listarLibro);

                    listarAutor = autorDAO.listarAutor();
                    request.setAttribute("autor", listarAutor);

                    listarEditorial = editorialDAO.listar();
                    request.setAttribute("editorial", listarEditorial);

                    listarCategoria = categoriaDAO.listarCategoria();
                    request.setAttribute("categoria", listarCategoria);

                    request.getRequestDispatcher("view/catalogo.jsp").forward(request, response);
                    break;
                case "Agregar":
                    Part part = request.getPart("fotoLibro");
                    InputStream foto = part.getInputStream();
                    libro.setFotoLibro(foto);
                    libro.setTituloLibro(request.getParameter("txtTituloLibro"));
                    libro.setDescripcionLibro(request.getParameter("txtDescripcionLibro"));
                    libro.setFechaDePublicacion(request.getParameter("txtFechaDePublicacion"));
                    libro.setIdiomaLibro(request.getParameter("txtIdiomaLibro"));
                    libro.setCostoLibro(Double.parseDouble(request.getParameter("txtCostoLibro")));
                    libro.setTipoLibro(request.getParameter("txtTipoLibro"));
                    libro.setStockLibro(Integer.parseInt(request.getParameter("txtStockLibro")));
                    libro.setIdAutor(Integer.parseInt(request.getParameter("txtIdAutor")));
                    libro.setIdEditorial(Integer.parseInt(request.getParameter("txtIdEditorial")));
                    libro.setIdCategoria(Integer.parseInt(request.getParameter("txtIdCategoria")));
                    libroDAO.agregar(libro);
                    response.sendRedirect("Controlador?menu=Libro&accion=Listar");
                    break;
                case "Actualizar":
                    libro.setTituloLibro(request.getParameter("txtTituloLibro"));
                    libro.setDescripcionLibro(request.getParameter("txtDescripcionLibro"));
                    libro.setFechaDePublicacion(request.getParameter("txtFechaDePublicacion"));
                    libro.setIdiomaLibro(request.getParameter("txtIdiomaLibro"));
                    libro.setCostoLibro(Double.parseDouble(request.getParameter("txtCostoLibro")));
                    libro.setTipoLibro(request.getParameter("txtTipoLibro"));
                    libro.setStockLibro(Integer.parseInt(request.getParameter("txtStockLibro")));
                    libro.setIdAutor(Integer.parseInt(request.getParameter("txtIdAutor")));
                    libro.setIdEditorial(Integer.parseInt(request.getParameter("txtIdEditorial")));
                    libro.setIdCategoria(Integer.parseInt(request.getParameter("txtIdCategoria")));
                    libro.setIdLibro(Integer.parseInt(request.getParameter("idLibro")));
                    libroDAO.actualizar(libro);
                    response.sendRedirect("Controlador?menu=Libro&accion=Listar");
                    break;
                case "Eliminar":
                    libroDAO.eliminar(Integer.parseInt(request.getParameter("idLibro")));
                    request.getRequestDispatcher("Controlador?menu=Libro&accion=Listar").forward(request, response);
                    break;
                case "Cancelar":
                    response.sendRedirect("Controlador?menu=Libro&accion=Listar");
                    break;
                default:
                    response.sendRedirect("Controlador?menu=Libro&accion=Listar");
                    break;
            }

        } else if (menu.equals("Cliente")) {
            switch (accion) {
                case "Listar":
                    List listarCliente = clienteDAO.listarCliente();
                    request.setAttribute("cliente", listarCliente);
                    request.getRequestDispatcher("view/listarCliente.jsp").forward(request, response);
                    break;
                case "ListarImg":
                    int id = Integer.parseInt(request.getParameter("idCliente"));
                    clienteDAO.listarImg(id, response);
                    break;
                case "Agregar":
                    try {
                        cliente.setNombreCliente(request.getParameter("txtNombreCliente"));
                        cliente.setApellidoCliente(request.getParameter("txtApellidoCliente"));
                        cliente.setFechaDeNacimientoCliente(request.getParameter("txtNacimientoCliente"));
                        cliente.setDireccionCliente(request.getParameter("txtDireccionCliente"));
                        cliente.setTelefonoCliente(request.getParameter("txtTelefonoCliente"));
                        cliente.setNickNameUsuario(request.getParameter("txtNombreUsuario"));
                        cliente.setEmailUsuario(request.getParameter("txtCorreoUsuario"));
                        cliente.setPasswordUsuario(request.getParameter("txtpassword"));
                        Part part = request.getPart("fileImgCLiente");
                        InputStream inputStream = part.getInputStream();
                        cliente.setImgCliente(inputStream);
                        clienteDAO.add(cliente);
                        System.out.println("Si se pudo agregar en controlador");

                    } catch (Exception e) {
                        e.printStackTrace();
                        System.out.println("No se pudo agregar el cliente");
                    }
                    response.sendRedirect("Controlador?menu=Cliente&accion=Listar");
                    break;
                case "Eliminar":
                    int codCliente = Integer.parseInt(request.getParameter("idCliente"));
                    clienteDAO.eliminar(codCliente);
                    response.sendRedirect("Controlador?menu=Cliente&accion=Listar");
                    break;
                case "Actualizar":
                    try {
                        cliente.setIdCliente(Integer.parseInt(request.getParameter("idCliente")));
                        cliente.setNombreCliente(request.getParameter("txtNombreCliente"));
                        cliente.setApellidoCliente(request.getParameter("txtApellidoCliente"));
                        cliente.setFechaDeNacimientoCliente(request.getParameter("txtNacimientoCliente"));
                        cliente.setDireccionCliente(request.getParameter("txtDireccionCliente"));
                        cliente.setTelefonoCliente(request.getParameter("txtTelefonoCliente"));
                        cliente.setNickNameUsuario(request.getParameter("txtNombreUsuario"));
                        cliente.setEmailUsuario(request.getParameter("txtCorreoUsuario"));
                        cliente.setPasswordUsuario(request.getParameter("txtpassword"));
                        Part part = request.getPart("fileImgCLiente");
                        InputStream inputStream = part.getInputStream();
                        cliente.setImgCliente(inputStream);
                        clienteDAO.edit(cliente);
                    } catch (Exception e) {
                        e.printStackTrace();
                        System.out.println("No se pudo actualizar");
                    }
                    response.sendRedirect("Controlador?menu=Cliente&accion=Listar");
                    break;
                case "AgregarCuenta":
                    try {
                        String nombreDeUsuario = request.getParameter("txtNombreUsuario");
                        cliente.setNombreCliente(request.getParameter("txtNombreCliente"));
                        cliente.setApellidoCliente(request.getParameter("txtApellidoCliente"));
                        cliente.setFechaDeNacimientoCliente(request.getParameter("txtNacimientoCliente"));
                        cliente.setDireccionCliente(request.getParameter("txtDireccionCliente"));
                        cliente.setTelefonoCliente(request.getParameter("txtTelefonoCliente"));
                        cliente.setNickNameUsuario(request.getParameter("txtNombreUsuario"));
                        cliente.setEmailUsuario(request.getParameter("txtCorreoUsuario"));
                        cliente.setPasswordUsuario(request.getParameter("txtpassword"));
                        Part part = request.getPart("fileImgCLiente");
                        InputStream inputStream = part.getInputStream();
                        cliente.setImgCliente(inputStream);
                        clienteDAO.add(cliente);
                        response.getWriter().println("var nombreUsuario = '" + nombreDeUsuario + "';");

                        System.out.println("Si se pudo agregar en controlador");

                    } catch (Exception e) {
                        e.printStackTrace();
                        System.out.println("No se pudo agregar el cliente");
                    }
                    response.sendRedirect("Controlador?menu=Inicio&accion=Listar");
                    break;
            }
        } else if (menu.equals("TipoServicio")) {
            switch (accion) {
                case "Listar":
                    List listarTipoServicio = tServicioDAO.listarTipoServicio();
                    request.setAttribute("tipoServicio", listarTipoServicio);
                    request.getRequestDispatcher("view/listarTipoServicio.jsp").forward(request, response);
                    break;
                case "Agregar":
                    tipoServicio.setNombreTipoServicio(request.getParameter("txtNombreTipoServicio"));
                    tServicioDAO.addTipoServicio(tipoServicio);
                    response.sendRedirect("Controlador?menu=TipoServicio&accion=Listar");
                    break;
                case "Editar":
                    tipoServicio.setNombreTipoServicio(request.getParameter("txtNombreTipoServicio"));
                    tipoServicio.setIdTipoServicio(Integer.parseInt(request.getParameter("codigoTipoServicio")));
                    tServicioDAO.editTipoServicio(tipoServicio);
                    response.sendRedirect("Controlador?menu=TipoServicio&accion=Listar");
                    break;
                case "Eliminar":
                    int codTipo = Integer.parseInt(request.getParameter("idTipoServicio"));
                    tipoServicio.setIdTipoServicio(codTipo);
                    tServicioDAO.eliminarTipoServicio(codTipo);
                    response.sendRedirect("Controlador?menu=TipoServicio&accion=Listar");
                    break;
            }
        } else if (menu.equals("Servicio")) {
            switch (accion) {
                case "Listar":
                    List listarCliente = clienteDAO.listarCliente();
                    request.setAttribute("cliente", listarCliente);
                    List listarLibro = libroDAO.listarLibro();
                    request.setAttribute("libro", listarLibro);
                    List listarTipoServicio = tServicioDAO.listarTipoServicio();
                    request.setAttribute("tipoServicio", listarTipoServicio);
                    List listarServicio = servicioDAO.listarServicio();
                    request.setAttribute("servicio", listarServicio);
                    request.getRequestDispatcher("view/listarServicio.jsp").forward(request, response);
                    break;
                case "Agregar":
                    servicio.setCostoServicio(Double.parseDouble(request.getParameter("txtCostoServicio")));
                    servicio.setFechaServicio(request.getParameter("txtFechaServicio"));
                    servicio.setFechaVencimientoServicio(request.getParameter("txtFechaVencimientoServicio"));
                    servicio.setIdTipoServicio(Integer.parseInt(request.getParameter("txtIdTipoServicio")));
                    servicio.setIdLibro(Integer.parseInt(request.getParameter("txtIdLibro")));
                    servicio.setIdCliente(Integer.parseInt(request.getParameter("txtIdCliente")));
                    servicioDAO.add(servicio);
                    response.sendRedirect("Controlador?menu=Servicio&accion=Listar");
                    break;
                case "Editar":
                    servicio.setCostoServicio(Double.parseDouble(request.getParameter("txtCostoServicio")));
                    servicio.setFechaServicio(request.getParameter("txtFechaServicio"));
                    servicio.setFechaVencimientoServicio(request.getParameter("txtFechaVencimientoServicio"));
                    servicio.setIdTipoServicio(Integer.parseInt(request.getParameter("txtIdTipoServicio")));
                    servicio.setIdLibro(Integer.parseInt(request.getParameter("txtIdLibro")));
                    servicio.setIdCliente(Integer.parseInt(request.getParameter("txtIdCliente")));
                    servicio.setIdServicio(Integer.parseInt(request.getParameter("codigoServicio")));
                    servicioDAO.edit(servicio);
                    response.sendRedirect("Controlador?menu=Servicio&accion=Listar");
                    break;
                case "Eliminar":
                    int codServicio = Integer.parseInt(request.getParameter("idServicio"));
                    servicio.setIdServicio(codServicio);
                    servicioDAO.eliminar(codServicio);
                    response.sendRedirect("Controlador?menu=Servicio&accion=Listar");
                    break;
            }
        } else if (menu.equals("Sucursal")) {

            switch (accion) {
                case "Listar":
                    List listarSucursal = sucursalDAO.listarSucursal();
                    request.setAttribute("sucursal", listarSucursal);
                    request.getRequestDispatcher("view/listarSucursal.jsp").forward(request, response);
                    break;

                case "Agregar":
                    sucursal.setNombreSucursal(request.getParameter("txtNombreSucursal"));
                    sucursal.setDireccionSucursal(request.getParameter("txtDireccionSucursal"));
                    sucursal.setTelefonoSucursal(request.getParameter("txtTelefonoSucursal"));
                    sucursalDAO.addSucursal(sucursal);
                    response.sendRedirect("Controlador?menu=Sucursal&accion=Listar");
                    break;

                case "Editar":
                    sucursal.setIdSucursal(Integer.parseInt(request.getParameter("codigoSucursal")));
                    sucursal.setNombreSucursal(request.getParameter("txtNombreSucursal"));
                    sucursal.setDireccionSucursal(request.getParameter("txtDireccionSucursal"));
                    sucursalDAO.editSucursal(sucursal);
                    response.sendRedirect("Controlador?menu=Sucursal&accion=Listar");
                    break;

                case "Eliminar":
                    sucursalDAO.eliminarSucursal(Integer.parseInt(request.getParameter("idSucursal")));
                    request.getRequestDispatcher("Controlador?menu=Sucursal&accion=Listar").forward(request, response);
                    break;

                case "Cancelar":
                    response.sendRedirect("Controlador?menu=Categoria&accion=Listar");
                    break;
            }
        } else if (menu.equals("Factura")) {
            switch (accion) {
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
                    facturaDAO.eliminar(Integer.parseInt(request.getParameter("idFactura")));
                    response.sendRedirect("Controlador?menu=Factura&accion=Listar");
                    break;

            }
        } else if (menu.equals("DetalleFactura")) {
            switch (accion) {
                case "Listar":
                    List listarDetalleFactura = detallefacturaDAO.listarDetalleFactura();
                    request.setAttribute("Detallefactura", listarDetalleFactura);
                    request.getRequestDispatcher("view/listarDetalleFactura.jsp").forward(request, response);
                    break;
                case "Agregar":
                    detallefactura.setIdDetalleFactura(Integer.parseInt(request.getParameter("txtIdDetalleFactura")));
                    detallefactura.setIdFactura(Integer.parseInt(request.getParameter("codigoFactura")));
                    detallefactura.setIdServicio(Integer.parseInt(request.getParameter("txtIdServicio")));
                    detallefacturaDAO.add(detallefactura);
                    response.sendRedirect("Controlador?menu=DetalleFactura&accion=Listar");
                    break;
                case "Editar":
                    detallefactura.setIdDetalleFactura(Integer.parseInt(request.getParameter("txtIdDetalleFactura")));
                    detallefactura.setIdFactura(Integer.parseInt(request.getParameter("codigoFactura")));
                    detallefactura.setIdServicio(Integer.parseInt(request.getParameter("txtIdServicio")));
                    detallefacturaDAO.edit(detallefactura);
                    response.sendRedirect("Controlador?menu=DetalleFactura&accion=Listar");
                    break;
                case "Eliminar":
                    detallefacturaDAO.eliminar(Integer.parseInt(request.getParameter("idDetalleFactura")));
                    response.sendRedirect("Controlador?menu=DetalleFactura&accion=Listar");
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
