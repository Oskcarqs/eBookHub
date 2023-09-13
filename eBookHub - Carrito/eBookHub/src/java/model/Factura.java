package model;

public class Factura {
    private int item;
    private int idFactura;
    private String numeroSerie;
    private String fechaEmision;
    private String horaEmision;
    private Double montoFactura;
    private String estado;
    private int idCliente;
    private int idSucursal;
    private int cantidad;
    private Double totalFactura;
    private int idLibro;
    private Double subtotal;

    public Factura() {
    }

    public Factura(int item, int idFactura, String numeroSerie, String fechaEmision, String horaEmision, Double montoFactura, String estado, int idCliente, int idSucursal, int cantidad, Double totalFactura, int idLibro, Double subtotal) {
        this.item = item;
        this.idFactura = idFactura;
        this.numeroSerie = numeroSerie;
        this.fechaEmision = fechaEmision;
        this.horaEmision = horaEmision;
        this.montoFactura = montoFactura;
        this.estado = estado;
        this.idCliente = idCliente;
        this.idSucursal = idSucursal;
        this.cantidad = cantidad;
        this.totalFactura = totalFactura;
        this.idLibro = idLibro;
        this.subtotal = subtotal;
    }

    public int getItem() {
        return item;
    }

    public void setItem(int item) {
        this.item = item;
    }

    public int getIdFactura() {
        return idFactura;
    }

    public void setIdFactura(int idFactura) {
        this.idFactura = idFactura;
    }

    public String getNumeroSerie() {
        return numeroSerie;
    }

    public void setNumeroSerie(String numeroSerie) {
        this.numeroSerie = numeroSerie;
    }

    public String getFechaEmision() {
        return fechaEmision;
    }

    public void setFechaEmision(String fechaEmision) {
        this.fechaEmision = fechaEmision;
    }

    public String getHoraEmision() {
        return horaEmision;
    }

    public void setHoraEmision(String horaEmision) {
        this.horaEmision = horaEmision;
    }

    public Double getMontoFactura() {
        return montoFactura;
    }

    public void setMontoFactura(Double montoFactura) {
        this.montoFactura = montoFactura;
    }

    public String getEstado() {
        return estado;
    }

    public void setEstado(String estado) {
        this.estado = estado;
    }

    public int getIdCliente() {
        return idCliente;
    }

    public void setIdCliente(int idCliente) {
        this.idCliente = idCliente;
    }

    public int getIdSucursal() {
        return idSucursal;
    }

    public void setIdSucursal(int idSucursal) {
        this.idSucursal = idSucursal;
    }

    public int getCantidad() {
        return cantidad;
    }

    public void setCantidad(int cantidad) {
        this.cantidad = cantidad;
    }

    public Double getTotalFactura() {
        return totalFactura;
    }

    public void setTotalFactura(Double totalFactura) {
        this.totalFactura = totalFactura;
    }

    public int getIdLibro() {
        return idLibro;
    }

    public void setIdLibro(int idLibro) {
        this.idLibro = idLibro;
    }

    public Double getSubtotal() {
        return subtotal;
    }

    public void setSubtotal(Double subtotal) {
        this.subtotal = subtotal;
    }

    
}
