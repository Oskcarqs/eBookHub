package model;

import java.io.InputStream;

public class Empleado {
    private int idEmpleado;
    private String nombreEmpleado;
    private String apellidoEmpleado;
    private String puestoEmpleado;
    private String nickNameUsuario;
    private String emailUsuario;
    private String passwordUsuario;
    private InputStream imgEmpleado;
    private int idSucursal;


    public Empleado() {
    }

    public Empleado(int idEmpleado, String nombreEmpleado, String apellidoEmpleado, String puestoEmpleado, String nickNameUsuario, String emailUsuario, String passwordUsuario, InputStream imgEmpleado, int idSucursal) {
        this.idEmpleado = idEmpleado;
        this.nombreEmpleado = nombreEmpleado;
        this.apellidoEmpleado = apellidoEmpleado;
        this.puestoEmpleado = puestoEmpleado;
        this.nickNameUsuario = nickNameUsuario;
        this.emailUsuario = emailUsuario;
        this.passwordUsuario = passwordUsuario;
        this.imgEmpleado = imgEmpleado;
        this.idSucursal = idSucursal;
    }

    public int getIdEmpleado() {
        return idEmpleado;
    }

    public void setIdEmpleado(int idEmpleado) {
        this.idEmpleado = idEmpleado;
    }

    public String getNombreEmpleado() {
        return nombreEmpleado;
    }

    public void setNombreEmpleado(String nombreEmpleado) {
        this.nombreEmpleado = nombreEmpleado;
    }

    public String getApellidoEmpleado() {
        return apellidoEmpleado;
    }

    public void setApellidoEmpleado(String apellidoEmpleado) {
        this.apellidoEmpleado = apellidoEmpleado;
    }

    public String getPuestoEmpleado() {
        return puestoEmpleado;
    }

    public void setPuestoEmpleado(String puestoEmpleado) {
        this.puestoEmpleado = puestoEmpleado;
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

    public InputStream getImgEmpleado() {
        return imgEmpleado;
    }

    public void setImgEmpleado(InputStream imgEmpleado) {
        this.imgEmpleado = imgEmpleado;
    }

    public int getIdSucursal() {
        return idSucursal;
    }

    public void setIdSucursal(int idSucursal) {
        this.idSucursal = idSucursal;
    }

   
    
    
   
}
