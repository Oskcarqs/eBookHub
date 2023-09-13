package model;

public class Autor {
    
    private int idAutor;
    private String nombreAutor;
    private String apellidoAutor;
    private String nacionalidadAutor;
    private String fechaNacimientoAutor;
    private String biografiaAutor;

    public Autor() {
    }

    public Autor(int idAutor, String nombreAutor, String apellidoAutor, String nacionalidadAutor, String fechaNacimientoAutor, String biografiaAutor) {
        this.idAutor = idAutor;
        this.nombreAutor = nombreAutor;
        this.apellidoAutor = apellidoAutor;
        this.nacionalidadAutor = nacionalidadAutor;
        this.fechaNacimientoAutor = fechaNacimientoAutor;
        this.biografiaAutor = biografiaAutor;
    }

    public int getIdAutor() {
        return idAutor;
    }

    public void setIdAutor(int idAutor) {
        this.idAutor = idAutor;
    }

    public String getNombreAutor() {
        return nombreAutor;
    }

    public void setNombreAutor(String nombreAutor) {
        this.nombreAutor = nombreAutor;
    }

    public String getApellidoAutor() {
        return apellidoAutor;
    }

    public void setApellidoAutor(String apellidoAutor) {
        this.apellidoAutor = apellidoAutor;
    }

    public String getNacionalidadAutor() {
        return nacionalidadAutor;
    }

    public void setNacionalidadAutor(String nacionalidadAutor) {
        this.nacionalidadAutor = nacionalidadAutor;
    }

    public String getFechaNacimientoAutor() {
        return fechaNacimientoAutor;
    }

    public void setFechaNacimientoAutor(String fechaNacimientoAutor) {
        this.fechaNacimientoAutor = fechaNacimientoAutor;
    }

    public String getBiografiaAutor() {
        return biografiaAutor;
    }

    public void setBiografiaAutor(String biografiaAutor) {
        this.biografiaAutor = biografiaAutor;
    }

}
