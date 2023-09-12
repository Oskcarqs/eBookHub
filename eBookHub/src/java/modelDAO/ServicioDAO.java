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
import model.Servicio;

/**
 *
 * @author Kaled Rodriguez
 */
public class ServicioDAO   {

    Conexion conect = new Conexion();
    Connection con;
    PreparedStatement ps;
    ResultSet rs;
    Servicio servicio = new Servicio();

    public List listar() {
        ArrayList<Servicio> listaServicio = new ArrayList<>();
        String sql = "select * from Servicio";
        try {
            con = conect.getConnection();
            ps = con.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                Servicio nuevoServicio = new Servicio();
                nuevoServicio.setIdServicio(rs.getInt("idServicio"));
                nuevoServicio.setCostoServicio(rs.getDouble("costoServicio"));
                nuevoServicio.setFechaServicio(rs.getDate("fechaServicio"));
                nuevoServicio.setFechaVencimientoServicio(rs.getDate("fechaVencimientoServicio"));
                nuevoServicio.setIdTipoServicio(rs.getInt("idTipoServicio"));
                nuevoServicio.setIdLibro(rs.getInt("idLibro"));
                nuevoServicio.setIdUsuario(rs.getInt("idUsuario"));
                listaServicio.add(nuevoServicio);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return listaServicio;
    }

    public Servicio list(int id) {
        String sql = "Select * from Servicio where idServicio =" + id;
        try {
            con = conect.getConnection();
            ps = con.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                servicio.setIdServicio(rs.getInt("idServicio"));
                servicio.setCostoServicio(rs.getDouble("costoServicio"));
                servicio.setFechaServicio(rs.getDate("fechaServicio"));
                servicio.setFechaVencimientoServicio(rs.getDate("fechaVencimientoServicio"));
                servicio.setIdTipoServicio(rs.getInt("idTipoServicio"));
                servicio.setIdLibro(rs.getInt("idLibro"));
                servicio.setIdUsuario(rs.getInt("idUsuario"));
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return servicio;
    }

    public boolean add(Servicio serv) {
        String sql = "Insert into Servicio (costoServicio, fechaServicio, fechaVencimientoServicio, idTipoServicio, idLibro, idUsuario)"
                + " values('" + serv.getCostoServicio() + "','" + serv.getFechaServicio() + "','" + serv.getFechaVencimientoServicio() + "','" + serv.getIdTipoServicio() + "','" + serv.getIdLibro() + "','" + serv.getIdUsuario() + "')";
        try {
            con = conect.getConnection();
            ps = con.prepareStatement(sql);
            ps.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return false;
    }

    
    public boolean edit(Servicio serv) {
        return true;
    }

    public boolean eliminar(int id) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

}
