/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import config.GenerarSerie;
import java.io.IOException;
import java.io.PrintWriter;
import static java.lang.System.out;
import java.time.LocalDate;
import java.time.LocalTime;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.Carrito;
import model.Cliente;
import model.Factura;
import model.Libro;
import model.Sucursal;
import modelDAO.DAOCliente;
import modelDAO.FacturaDAO;
import modelDAO.LibroDAO;
import modelDAO.SucursalDAO;

/**
 *
 * @author Usuario
 */
public class ControladorCarrito extends HttpServlet {
    
    Sucursal sucursal = new Sucursal();
    SucursalDAO sucursalDAO = new SucursalDAO();
    Cliente cliente = new Cliente();
    DAOCliente clienteDAO = new DAOCliente();
    Libro libro = new Libro();
    LibroDAO libroDAO = new LibroDAO();
    FacturaDAO facturaDAO = new FacturaDAO();
    Factura factura = new Factura();
    Double totalPagar = 0.0;
    int cantidad = 1;
    int item;
    int pos = 0;
    List<Carrito> listaCarrito = new ArrayList<>();
    int codPro;
    int cod;
    String descripcion;
    Double precio, subTotal;
    Carrito car = new Carrito();
    String numeroserie;

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
        if (menu.equals("Carrito")) {
            switch (accion) {
                case "Listar":
                    List listarSucursal = sucursalDAO.listarSucursal();
                    request.setAttribute("sucursal", listarSucursal);
                    if (listaCarrito.size() > 0) {
                        totalPagar = 0.00;
                        request.setAttribute("carrito", listaCarrito);
                        for (int i = 0; i < listaCarrito.size(); i++) {
                            totalPagar = totalPagar + listaCarrito.get(i).getSubTotal();
                        }
                        request.setAttribute("totalPagar", totalPagar);
                    }
                    numeroserie = facturaDAO.GenerarSerie();
                    if (numeroserie == null) {
                        numeroserie = "00000001";
                        request.setAttribute("nserie", numeroserie);
                    } else {
                        int incrementar = Integer.parseInt(numeroserie);
                        GenerarSerie gs = new GenerarSerie();
                        numeroserie = gs.NumeroSerie(incrementar);
                        request.setAttribute("nserie", numeroserie);
                    }
                    request.setAttribute("cl", cliente);
                    request.setAttribute("listaItemsCarrito", listaCarrito);
                    request.getRequestDispatcher("Carrito.jsp").forward(request, response);
                    break;
                case "AgregarCarrito":
                    try {
                        System.out.println(libro.getStockLibro());

                        int idl = Integer.parseInt(request.getParameter("idLibro"));
                        libro = libroDAO.listarId(idl);
                        if (libro.getStockLibro() >= 1) {
                            cantidad = 1;
                            if (listaCarrito.size() > 0) {
                                if (idl == listaCarrito.get(pos).getIdLibro()) {
                                    cantidad = listaCarrito.get(pos).getCantidad() + cantidad;
                                    double subtotal = listaCarrito.get(pos).getPrecioCompra() * cantidad;
                                    listaCarrito.get(pos).setCantidad(cantidad);
                                    listaCarrito.get(pos).setSubTotal(subtotal);
                                } else {
                                    Carrito car = new Carrito();
                                    item = item + 1;
                                    car.setItem(item);
                                    car.setIdLibro(libro.getIdLibro());
                                    car.setNombre(libro.getTituloLibro());
                                    car.setPrecioCompra(libro.getCostoLibro());
                                    car.setCantidad(cantidad);
                                    car.setSubTotal(cantidad * libro.getCostoLibro());
                                    listaCarrito.add(car);
                                    for (int i = 0; i < listaCarrito.size(); i++) {
                                        int cantidad = listaCarrito.get(i).getCantidad();
                                        int codiLibro = listaCarrito.get(i).getIdLibro();
                                        Libro libro = new Libro();
                                        LibroDAO libroDAO = new LibroDAO();
                                        libro = libroDAO.buscarlib(codiLibro);
                                        int sac = libro.getStockLibro() - cantidad;
                                        libroDAO.actualizarstock(codiLibro, sac);
                                    }
                                }
                            } else {
                                Carrito car = new Carrito();
                                item = item + 1;
                                car.setItem(item);
                                car.setIdLibro(libro.getIdLibro());
                                car.setNombre(libro.getTituloLibro());
                                car.setPrecioCompra(libro.getCostoLibro());
                                car.setCantidad(cantidad);
                                car.setSubTotal(cantidad * libro.getCostoLibro());
                                listaCarrito.add(car);
                                for (int i = 0; i < listaCarrito.size(); i++) {
                                    int cantidad = listaCarrito.get(i).getCantidad();
                                    int codiLibro = listaCarrito.get(i).getIdLibro();
                                    Libro libro = new Libro();
                                    LibroDAO libroDAO = new LibroDAO();
                                    libro = libroDAO.buscarlib(codiLibro);
                                    int sac = libro.getStockLibro() - cantidad;
                                    libroDAO.actualizarstock(codiLibro, sac);
                                }
                            }
                            request.setAttribute("cl", cliente);
                            request.setAttribute("nserie", numeroserie);
                            request.setAttribute("contador", listaCarrito.size());
                            request.getRequestDispatcher("ControladorCarrito?menu=Carrito&accion=Listar").forward(request, response);
                        } else {
                            System.out.println("stock vacio" + libro.getStockLibro());
                        }
                    } catch (Exception e) {
                        e.printStackTrace();
                    }
                    break;
                case "Delete":
                    try {
                        
                        request.setAttribute("cl", cliente);
                        request.setAttribute("nserie", numeroserie);
                        int idLibro = Integer.parseInt(request.getParameter("idLibro"));
                        int valItems = Integer.parseInt(request.getParameter("items"));
                        double ep = Double.parseDouble(request.getParameter("subTotal"));
                        for (int i = 0; i < listaCarrito.size(); i++) {
                            if (listaCarrito.get(i).getIdLibro() == idLibro) {
                                totalPagar = totalPagar - ep;
                                item = item - valItems;
                                car.setItem(item);
                                listaCarrito.remove(i);
                                request.setAttribute("listaCarrito", listaCarrito);
                                request.setAttribute("totalPagar", totalPagar);
                                request.getRequestDispatcher("ControladorCarrito?menu=Carrito&accion=Listar").forward(request, response);

                            } else {
                                System.out.println("No se pudo eliminar");
                            }
                            if (item == 0) {
                                totalPagar = 0.00;
                                request.setAttribute("totalPagar", totalPagar);
                            }
                        }

                    } catch (Exception e) {
                        e.printStackTrace();
                    }
                    break;

                case "AgregarMasPro":
                    request.setAttribute("cl", cliente);
                    request.setAttribute("nserie", numeroserie);
                    request.getRequestDispatcher("Controlador?menu=Libro&accion=Listar").forward(request, response);
                    break;

                case "BuscarCliente":
                    try {
                        String idCli = request.getParameter("txtCodigoCliente");
                        cliente.setIdCliente(Integer.parseInt(idCli));
                        cliente = clienteDAO.buscarCliente(Integer.parseInt(idCli));
                        request.setAttribute("cl", cliente);
                        request.setAttribute("nserie", numeroserie);
                        request.getRequestDispatcher("ControladorCarrito?menu=Carrito&accion=Listar").forward(request, response);

                    } catch (Exception e) {
                        System.out.println("No se pudo setear los datos");
                    }
                    break;

                case "LimpiarCarrito":
                    try {
                        item = item - 1;
                        car.setItem(item);
                        listaCarrito.clear();
                        request.setAttribute("nserie", numeroserie);
                        request.getRequestDispatcher("ControladorCarrito?menu=Carrito&accion=Listar").forward(request, response);
                    } catch (Exception e) {
                        e.printStackTrace();
                    }
                    break;

                case "Comprar":
                    try {
                        LocalDate fechaActual = LocalDate.now();
                        LocalTime horaActual = LocalTime.now();
                        factura.setIdCliente(cliente.getIdCliente());
                        factura.setIdSucursal(1);
                        factura.setNumeroSerie(numeroserie);
                        factura.setFechaEmision(String.valueOf(fechaActual));
                        factura.setHoraEmision(String.valueOf(horaActual));
                        factura.setMontoFactura(totalPagar);
                        factura.setEstado("1");
                        facturaDAO.guardarFactura(factura);
                        //Guardar detalle factura
                        int idf = Integer.parseInt(facturaDAO.IdFacturas());
                        for (int i = 0; i < listaCarrito.size(); i++) {
                            factura = new Factura();
                            factura.setIdFactura(idf);
                            factura.setIdLibro(listaCarrito.get(i).getIdLibro());
                            factura.setCantidad(listaCarrito.get(i).getCantidad());
                            factura.setTotalFactura(listaCarrito.get(i).getPrecioCompra());
                            facturaDAO.guardarDetalleFactura(factura);
                        }
                        System.out.println("compra realizado");
                        request.setAttribute("mensaje", "               Su compra Fue Exitosa");
                    } catch (Exception e) {
                        System.out.println("error en controlador para compra");
                        e.printStackTrace();
                    }
                    item = item - 1;
                    factura.setItem(item);
                    listaCarrito.clear();
                    totalPagar = 0.00;

                    request.setAttribute("nserie", numeroserie);
                    request.getRequestDispatcher("Carrito.jsp").forward(request, response);
                    request.getRequestDispatcher("ControladorCarrito?menu=Carrito&accion=Listar").forward(request, response);
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
