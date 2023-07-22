package model;

import java.sql.Date;


public class FacturaSuscripcion {
    private int idFacturaSuscripcion;
    private Date fechaDeInicio;
    private Date fechaDeVencimiento;
    private int idTipoSuscripcion;
    private int idUsuario;     

    public FacturaSuscripcion() {
    }

    public FacturaSuscripcion(int idFacturaSuscripcion, Date fechaDeInicio, Date fechaDeVencimiento, int idTipoSuscripcion, int idUsuario) {
        this.idFacturaSuscripcion = idFacturaSuscripcion;
        this.fechaDeInicio = fechaDeInicio;
        this.fechaDeVencimiento = fechaDeVencimiento;
        this.idTipoSuscripcion = idTipoSuscripcion;
        this.idUsuario = idUsuario;
    }

    public int getIdFacturaSuscripcion() {
        return idFacturaSuscripcion;
    }

    public void setIdFacturaSuscripcion(int idFacturaSuscripcion) {
        this.idFacturaSuscripcion = idFacturaSuscripcion;
    }

    public Date getFechaDeInicio() {
        return fechaDeInicio;
    }

    public void setFechaDeInicio(Date fechaDeInicio) {
        this.fechaDeInicio = fechaDeInicio;
    }

    public Date getFechaDeVencimiento() {
        return fechaDeVencimiento;
    }

    public void setFechaDeVencimiento(Date fechaDeVencimiento) {
        this.fechaDeVencimiento = fechaDeVencimiento;
    }

    public int getIdTipoSuscripcion() {
        return idTipoSuscripcion;
    }

    public void setIdTipoSuscripcion(int idTipoSuscripcion) {
        this.idTipoSuscripcion = idTipoSuscripcion;
    }

    public int getIdUsuario() {
        return idUsuario;
    }

    public void setIdUsuario(int idUsuario) {
        this.idUsuario = idUsuario;
    }
    
    
}
