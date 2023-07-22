package model;

/**
 *
 * @author Ottoniel
 */
public class Libro {

    private int idLibro;
    private String tituloLibro;
    private String descripcionLibro;
    private String fechaDePublicacion;
    private String idiomaLibro;
    private double costoLibro;
    private int stockLibro;
    private int idTipoLibro;
    private int idAutor;
    private int idEditorial;
    private int idCategoria;

    public Libro() {
    }

    public Libro(int idLibro, String tituloLibro, String descripcionLibro, String fechaDePublicacion, String idiomaLibro, double costoLibro, int stockLibro, int idTipoLibro, int idAutor, int idEditorial, int idCategoria) {
        this.idLibro = idLibro;
        this.tituloLibro = tituloLibro;
        this.descripcionLibro = descripcionLibro;
        this.fechaDePublicacion = fechaDePublicacion;
        this.idiomaLibro = idiomaLibro;
        this.costoLibro = costoLibro;
        this.stockLibro = stockLibro;
        this.idTipoLibro = idTipoLibro;
        this.idAutor = idAutor;
        this.idEditorial = idEditorial;
        this.idCategoria = idCategoria;
    }

    public int getIdLibro() {
        return idLibro;
    }

    public void setIdLibro(int idLibro) {
        this.idLibro = idLibro;
    }

    public String getTituloLibro() {
        return tituloLibro;
    }

    public void setTituloLibro(String tituloLibro) {
        this.tituloLibro = tituloLibro;
    }

    public String getDescripcionLibro() {
        return descripcionLibro;
    }

    public void setDescripcionLibro(String descripcionLibro) {
        this.descripcionLibro = descripcionLibro;
    }

    public String getFechaDePublicacion() {
        return fechaDePublicacion;
    }

    public void setFechaDePublicacion(String fechaDePublicacion) {
        this.fechaDePublicacion = fechaDePublicacion;
    }

    public String getIdiomaLibro() {
        return idiomaLibro;
    }

    public void setIdiomaLibro(String idiomaLibro) {
        this.idiomaLibro = idiomaLibro;
    }

    public double getCostoLibro() {
        return costoLibro;
    }

    public void setCostoLibro(double costoLibro) {
        this.costoLibro = costoLibro;
    }

    public int getStockLibro() {
        return stockLibro;
    }

    public void setStockLibro(int stockLibro) {
        this.stockLibro = stockLibro;
    }

    public int getIdTipoLibro() {
        return idTipoLibro;
    }

    public void setIdTipoLibro(int idTipoLibro) {
        this.idTipoLibro = idTipoLibro;
    }

    public int getIdAutor() {
        return idAutor;
    }

    public void setIdAutor(int idAutor) {
        this.idAutor = idAutor;
    }

    public int getIdEditorial() {
        return idEditorial;
    }

    public void setIdEditorial(int idEditorial) {
        this.idEditorial = idEditorial;
    }

    public int getIdCategoria() {
        return idCategoria;
    }

    public void setIdCategoria(int idCategoria) {
        this.idCategoria = idCategoria;
    }

}
