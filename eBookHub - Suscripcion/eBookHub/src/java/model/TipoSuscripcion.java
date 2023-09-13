package model;

public class TipoSuscripcion {
    private int idTipoSuscripcion;
    private String nombreTipoSuscripcion;
    private String descripcionTipoSuscripcion;
    private double precioTipoSuscripcion;       

    public TipoSuscripcion() {
    }

    public TipoSuscripcion(int idTipoSuscripcion, String nombreTipoSuscripcion, String descripcionTipoSuscripcion, double precioTipoSuscripcion) {
        this.idTipoSuscripcion = idTipoSuscripcion;
        this.nombreTipoSuscripcion = nombreTipoSuscripcion;
        this.descripcionTipoSuscripcion = descripcionTipoSuscripcion;
        this.precioTipoSuscripcion = precioTipoSuscripcion;
    }

    public int getIdTipoSuscripcion() {
        return idTipoSuscripcion;
    }

    public void setIdTipoSuscripcion(int idTipoSuscripcion) {
        this.idTipoSuscripcion = idTipoSuscripcion;
    }

    public String getNombreTipoSuscripcion() {
        return nombreTipoSuscripcion;
    }

    public void setNombreTipoSuscripcion(String nombreTipoSuscripcion) {
        this.nombreTipoSuscripcion = nombreTipoSuscripcion;
    }

    public String getDescripcionTipoSuscripcion() {
        return descripcionTipoSuscripcion;
    }

    public void setDescripcionTipoSuscripcion(String descripcionTipoSuscripcion) {
        this.descripcionTipoSuscripcion = descripcionTipoSuscripcion;
    }

    public double getPrecioTipoSuscripcion() {
        return precioTipoSuscripcion;
    }

    public void setPrecioTipoSuscripcion(double precioTipoSuscripcion) {
        this.precioTipoSuscripcion = precioTipoSuscripcion;
    }
    
    
    
}
