
package model;


public class Factura {
    private int idFactura;
    private String fechaEmision;
    private String horaEmision;
    private Double totalFactura;
    private int idSucursal;
    private int idUsuario;

    public Factura() {
    }

    public Factura(int idFactura, String fechaEmision, String horaEmision, Double totalFactura, int idSucursal, int idUsuario) {
        this.idFactura = idFactura;
        this.fechaEmision = fechaEmision;
        this.horaEmision = horaEmision;
        this.totalFactura = totalFactura;
        this.idSucursal = idSucursal;
        this.idUsuario = idUsuario;
    }

    public int getIdFactura() {
        return idFactura;
    }

    public void setIdFactura(int idFactura) {
        this.idFactura = idFactura;
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

    public Double getTotalFactura() {
        return totalFactura;
    }

    public void setTotalFactura(Double totalFactura) {
        this.totalFactura = totalFactura;
    }

    public int getIdSucursal() {
        return idSucursal;
    }

    public void setIdSucursal(int idSucursal) {
        this.idSucursal = idSucursal;
    }

    public int getIdUsuario() {
        return idUsuario;
    }

    public void setIdUsuario(int idUsuario) {
        this.idUsuario = idUsuario;
    }
    
    
}
