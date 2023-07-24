
package model;

import java.sql.Date;




public class Cliente {
   private int idCliente;
   private String nombreCliente;
   private String  apellidoCliente;
   private Date fechaDeNacimientoCliente;
   private String direccionCliente;
   private String telefonoCliente;

    public Cliente() {
    }

    public Cliente(int idCliente, String nombreCliente, String apellidoCliente, Date fechaDeNacimientoCliente, String direccionCliente, String telefonoCliente) {
        this.idCliente = idCliente;
        this.nombreCliente = nombreCliente;
        this.apellidoCliente = apellidoCliente;
        this.fechaDeNacimientoCliente = fechaDeNacimientoCliente;
        this.direccionCliente = direccionCliente;
        this.telefonoCliente = telefonoCliente;
    }

    public int getIdCliente() {
        return idCliente;
    }

    public void setIdCliente(int idCliente) {
        this.idCliente = idCliente;
    }

    public String getNombreCliente() {
        return nombreCliente;
    }

    public void setNombreCliente(String nombreCliente) {
        this.nombreCliente = nombreCliente;
    }

    public String getApellidoCliente() {
        return apellidoCliente;
    }

    public void setApellidoCliente(String apellidoCliente) {
        this.apellidoCliente = apellidoCliente;
    }

    public Date getFechaDeNacimientoCliente() {
        return fechaDeNacimientoCliente;
    }

    public void setFechaDeNacimientoCliente(Date fechaDeNacimientoCliente) {
        this.fechaDeNacimientoCliente = fechaDeNacimientoCliente;
    }

    public String getDireccionCliente() {
        return direccionCliente;
    }

    public void setDireccionCliente(String direccionCliente) {
        this.direccionCliente = direccionCliente;
    }

    public String getTelefonoCliente() {
        return telefonoCliente;
    }

    public void setTelefonoCliente(String telefonoCliente) {
        this.telefonoCliente = telefonoCliente;
    }
   
   
   

    
}
