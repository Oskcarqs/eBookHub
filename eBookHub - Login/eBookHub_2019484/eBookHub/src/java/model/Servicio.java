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
    private String fechaServicio;
    private String fechaVencimientoServicio;
    private int idTipoServicio;
    private int idLibro;
    private int idCliente;

    public Servicio() {
    }

    public Servicio(int idServicio, double costoServicio, String fechaServicio, String fechaVencimientoServicio, int idTipoServicio, int idLibro, int idCliente) {
        this.idServicio = idServicio;
        this.costoServicio = costoServicio;
        this.fechaServicio = fechaServicio;
        this.fechaVencimientoServicio = fechaVencimientoServicio;
        this.idTipoServicio = idTipoServicio;
        this.idLibro = idLibro;
        this.idCliente = idCliente;
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

    public String getFechaServicio() {
        return fechaServicio;
    }

    public void setFechaServicio(String fechaServicio) {
        this.fechaServicio = fechaServicio;
    }

    public String getFechaVencimientoServicio() {
        return fechaVencimientoServicio;
    }

    public void setFechaVencimientoServicio(String fechaVencimientoServicio) {
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

    public int getIdCliente() {
        return idCliente;
    }

    public void setIdCliente(int idCliente) {
        this.idCliente = idCliente;
    }
}
