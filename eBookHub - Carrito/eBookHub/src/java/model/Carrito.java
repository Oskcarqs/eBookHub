package model;

public class Carrito {
    int item;
    int idLibro;
    String nombre;
    double precioCompra;
    int cantidad;
    double subTotal;
    int stoc;

    public Carrito() {
    }

    public Carrito(int item, int idLibro, String nombre, double precioCompra, int cantidad, double subTotal, int stoc) {
        this.item = item;
        this.idLibro = idLibro;
        this.nombre = nombre;
        this.precioCompra = precioCompra;
        this.cantidad = cantidad;
        this.subTotal = subTotal;
        this.stoc = stoc;
    }

    public int getItem() {
        return item;
    }

    public void setItem(int item) {
        this.item = item;
    }

    public int getIdLibro() {
        return idLibro;
    }

    public void setIdLibro(int idLibro) {
        this.idLibro = idLibro;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public double getPrecioCompra() {
        return precioCompra;
    }

    public void setPrecioCompra(double precioCompra) {
        this.precioCompra = precioCompra;
    }

    public int getCantidad() {
        return cantidad;
    }

    public void setCantidad(int cantidad) {
        this.cantidad = cantidad;
    }

    public double getSubTotal() {
        return subTotal;
    }

    public void setSubTotal(double subTotal) {
        this.subTotal = subTotal;
    }

    public int getStoc() {
        return stoc;
    }

    public void setStoc(int stoc) {
        this.stoc = stoc;
    }

    
}
