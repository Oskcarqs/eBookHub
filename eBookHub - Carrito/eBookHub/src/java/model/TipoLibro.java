package model;

public class TipoLibro {
    
    private int idTipoLibro;
    private String nombreTipoLibro;
    private String descripcionTipoLibro;

    public TipoLibro() {
    }

    public TipoLibro(int idTipoLibro, String nombreTipoLibro, String descripcionTipoLibro) {
        this.idTipoLibro = idTipoLibro;
        this.nombreTipoLibro = nombreTipoLibro;
        this.descripcionTipoLibro = descripcionTipoLibro;
    }

    public int getIdTipoLibro() {
        return idTipoLibro;
    }

    public void setIdTipoLibro(int idTipoLibro) {
        this.idTipoLibro = idTipoLibro;
    }

    public String getNombreTipoLibro() {
        return nombreTipoLibro;
    }

    public void setNombreTipoLibro(String nombreTipoLibro) {
        this.nombreTipoLibro = nombreTipoLibro;
    }

    public String getDescripcionTipoLibro() {
        return descripcionTipoLibro;
    }

    public void setDescripcionTipoLibro(String descripcionTipoLibro) {
        this.descripcionTipoLibro = descripcionTipoLibro;
    }
    
    
    
}
