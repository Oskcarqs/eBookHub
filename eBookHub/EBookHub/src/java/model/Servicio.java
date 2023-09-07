/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model;

import java.sql.Date;

/**
 *
 * @author Kaled Rodriguez
 */
public class Servicio {

    private int idServicio;
    private double costoServicio;
    private Date fechaServicio;
    private Date fechaVencimientoServicio;
    private int idTipoServicio;
    private int idLibro;
    private int idUsuario;

    public Servicio() {
    }

    public Servicio(int idServicio, double costoServicio, Date fechaServicio, Date fecchaVencimientoServicio, int idTipoServicio, int idLibro, int idUsuario) {
        this.idServicio = idServicio;
        this.costoServicio = costoServicio;
        this.fechaServicio = fechaServicio;
        this.fechaVencimientoServicio = fecchaVencimientoServicio;
        this.idTipoServicio = idTipoServicio;
        this.idLibro = idLibro;
        this.idUsuario = idUsuario;
    }

    public int getIdUsuario() {
        return idUsuario;
    }

    public void setIdUsuario(int idUsuario) {
        this.idUsuario = idUsuario;
    }

    public int getIdServicio() {
        return idServicio;
    }

    public void setIdServicio(int idServicio) {
        this.idServicio = idServicio;
    }

    public double getCostoServicio() {
        return costoServicio;
    }

    public void setCostoServicio(double costoServicio) {
        this.costoServicio = costoServicio;
    }

    public Date getFechaServicio() {
        return fechaServicio;
    }

    public void setFechaServicio(Date fechaServicio) {
        this.fechaServicio = fechaServicio;
    }

    public Date getFechaVencimientoServicio() {
        return fechaVencimientoServicio;
    }

    public void setFechaVencimientoServicio(Date fechaVencimientoServicio) {
        this.fechaVencimientoServicio = fechaVencimientoServicio;
    }

    public int getIdTipoServicio() {
        return idTipoServicio;
    }

    public void setIdTipoServicio(int idTipoServicio) {
        this.idTipoServicio = idTipoServicio;
    }

    public int getIdLibro() {
        return idLibro;
    }

    public void setIdLibro(int idLibro) {
        this.idLibro = idLibro;
    }

}
