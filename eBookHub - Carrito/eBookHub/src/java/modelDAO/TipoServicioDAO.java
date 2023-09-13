/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package modelDAO;

import config.Conexion;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import model.TipoServicio;

/**
 *
 * @author Kaled Rodriguez
 */
public class TipoServicioDAO {

    Conexion conect = new Conexion();
    Connection con;
    PreparedStatement ps;
    ResultSet rs;
    TipoServicio tipoServicio = new TipoServicio();

    public List listarTipoServicio() {
        ArrayList<TipoServicio> listaTipoServicio = new ArrayList<>();
        String sql = "Select * from TipoServicio;";
        try {
            con = conect.getConnection();
            ps = con.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                TipoServicio nuevoTipoServicio = new TipoServicio();
                nuevoTipoServicio.setIdTipoServicio(rs.getInt("idTipoServicio"));
                nuevoTipoServicio.setNombreTipoServicio(rs.getString("nombreTipoServicio"));
                listaTipoServicio.add(nuevoTipoServicio);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return listaTipoServicio;
    }

    public TipoServicio list(int id) {
        String sql = "Select * from TipoServicio where idTipoServicio =" + id;
        try {
            con = conect.getConnection();
            ps = con.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                tipoServicio.setIdTipoServicio(rs.getInt("idServicio"));
                tipoServicio.setNombreTipoServicio(rs.getString("nombreTipoServicio"));

            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return tipoServicio;
    }

    public boolean addTipoServicio(TipoServicio tserv) {
        String sql = "Insert into TipoServicio(nombreTipoServicio)"
                + " values('" + tserv.getNombreTipoServicio() + "')";
        try {
            con = conect.getConnection();
            ps = con.prepareStatement(sql);
            ps.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return false;
    }

    public boolean editTipoServicio(TipoServicio tserv) {
        String sql = "update TipoServicio set nombreTipoServicio = '" + tserv.getNombreTipoServicio()
                + "' where idTipoServicio = " + tserv.getIdTipoServicio();
        try {
            con = conect.getConnection();
            ps = con.prepareStatement(sql);
            ps.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }

        return false;
    }

    public boolean eliminarTipoServicio(int id) {
        String sql = "delete from TipoServicio where idTipoServicio=" + id;
        try {
            con = conect.getConnection();
            ps = con.prepareStatement(sql);
            ps.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return false;
    }

}
