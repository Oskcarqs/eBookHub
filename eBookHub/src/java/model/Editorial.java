package model;

public class Editorial {
    
    private int idEditorial;
    private String nombreEditorial;
    private String descripcionEditorial;

    public Editorial() {
    }

    public Editorial(int idEditorial, String nombreEditorial, String descripcionEditorial) {
        this.idEditorial = idEditorial;
        this.nombreEditorial = nombreEditorial;
        this.descripcionEditorial = descripcionEditorial;
    }

    public int getIdEditorial() {
        return idEditorial;
    }

    public void setIdEditorial(int idEditorial) {
        this.idEditorial = idEditorial;
    }

    public String getNombreEditorial() {
        return nombreEditorial;
    }

    public void setNombreEditorial(String nombreEditorial) {
        this.nombreEditorial = nombreEditorial;
    }

    public String getDescripcionEditorial() {
        return descripcionEditorial;
    }

    public void setDescripcionEditorial(String descripcionEditorial) {
        this.descripcionEditorial = descripcionEditorial;
    }
    
    
}
