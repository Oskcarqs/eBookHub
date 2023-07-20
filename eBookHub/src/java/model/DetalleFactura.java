package model;

public class DetalleFactura {
    
    private int idDetalleFactura;
    private int idFactura;
    private int idServicio;

    public DetalleFactura() {
    }

    public DetalleFactura(int idDetalleFactura, int idFactura, int idServicio) {
        this.idDetalleFactura = idDetalleFactura;
        this.idFactura = idFactura;
        this.idServicio = idServicio;
    }

    public int getIdDetalleFactura() {
        return idDetalleFactura;
    }

    public void setIdDetalleFactura(int idDetalleFactura) {
        this.idDetalleFactura = idDetalleFactura;
    }

    public int getIdFactura() {
        return idFactura;
    }

    public void setIdFactura(int idFactura) {
        this.idFactura = idFactura;
    }

    public int getIdServicio() {
        return idServicio;
    }

    public void setIdServicio(int idServicio) {
        this.idServicio = idServicio;
    }
    
    
    
}
