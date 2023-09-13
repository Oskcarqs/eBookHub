package model;

import java.io.InputStream;


public class Cliente {

    private int idCliente;
    private String nombreCliente;
    private String apellidoCliente;
    private String fechaDeNacimientoCliente;
    private String direccionCliente;
    private String telefonoCliente;
    private InputStream ImgCLiente;
    private String nickNameUsuario;
    private String emailUsuario;
    private String passwordUsuario;
    private int idTipoSuscripcion;

    public Cliente() {
    }

    public Cliente(int idCliente, String nombreCliente, String apellidoCliente, String fechaDeNacimientoCliente, String direccionCliente, String telefonoCliente, InputStream ImgCLiente, String nickNameUsuario, String emailUsuario, String passwordUsuario, int idTipoSuscripcion) {
        this.idCliente = idCliente;
        this.nombreCliente = nombreCliente;
        this.apellidoCliente = apellidoCliente;
        this.fechaDeNacimientoCliente = fechaDeNacimientoCliente;
        this.direccionCliente = direccionCliente;
        this.telefonoCliente = telefonoCliente;
        this.ImgCLiente = ImgCLiente;
        this.nickNameUsuario = nickNameUsuario;
        this.emailUsuario = emailUsuario;
        this.passwordUsuario = passwordUsuario;
        this.idTipoSuscripcion = idTipoSuscripcion;
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

    public String getFechaDeNacimientoCliente() {
        return fechaDeNacimientoCliente;
    }

    public void setFechaDeNacimientoCliente(String fechaDeNacimientoCliente) {
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

    public InputStream getImgCLiente() {
        return ImgCLiente;
    }

    public void setImgCLiente(InputStream ImgCLiente) {
        this.ImgCLiente = ImgCLiente;
    }

    public String getNickNameUsuario() {
        return nickNameUsuario;
    }

    public void setNickNameUsuario(String nickNameUsuario) {
        this.nickNameUsuario = nickNameUsuario;
    }

    public String getEmailUsuario() {
        return emailUsuario;
    }

    public void setEmailUsuario(String emailUsuario) {
        this.emailUsuario = emailUsuario;
    }

    public String getPasswordUsuario() {
        return passwordUsuario;
    }

    public void setPasswordUsuario(String passwordUsuario) {
        this.passwordUsuario = passwordUsuario;
    }

    public int getIdTipoSuscripcion() {
        return idTipoSuscripcion;
    }

    public void setIdTipoSuscripcion(int idTipoSuscripcion) {
        this.idTipoSuscripcion = idTipoSuscripcion;
    }

    
    
    
}
