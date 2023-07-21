/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model;

/**
 *
 * @author Kaled Rodriguez
 */
public class TipoServicio {

    private int idTipoServicio;
    private String nombreTipoServicio;

    public TipoServicio() {
    }

    public TipoServicio(int idTipoServicio, String nombreTipoServicio) {
        this.idTipoServicio = idTipoServicio;
        this.nombreTipoServicio = nombreTipoServicio;
    }

    public String getNombreTipoServicio() {
        return nombreTipoServicio;
    }

    public void setNombreTipoServicio(String nombreTipoServicio) {
        this.nombreTipoServicio = nombreTipoServicio;
    }

    public int getIdTipoServicio() {
        return idTipoServicio;
    }

    public void setIdTipoServicio(int idTipoServicio) {
        this.idTipoServicio = idTipoServicio;
    }
}
