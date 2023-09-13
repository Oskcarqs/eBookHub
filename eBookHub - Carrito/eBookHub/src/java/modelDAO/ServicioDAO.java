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
public class ServicioDAO {

    Conexion conect = new Conexion();
    Connection con;
    PreparedStatement ps;
    ResultSet rs;
    Servicio servicio = new Servicio();

    public List listarServicio() {
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
                nuevoServicio.setFechaServicio(rs.getString("fechaServicio"));
                nuevoServicio.setFechaVencimientoServicio(rs.getString("fechaVencimientoServicio"));
                nuevoServicio.setIdTipoServicio(rs.getInt("idTipoServicio"));
                nuevoServicio.setIdLibro(rs.getInt("idLibro"));
                nuevoServicio.setIdCliente(rs.getInt("idCliente"));
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
                servicio.setFechaServicio(rs.getString("fechaServicio"));
                servicio.setFechaVencimientoServicio(rs.getString("fechaVencimientoServicio"));
                servicio.setIdTipoServicio(rs.getInt("idTipoServicio"));
                servicio.setIdLibro(rs.getInt("idLibro"));
                servicio.setIdCliente(rs.getInt("idCliente"));
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return servicio;
    }

    public boolean add(Servicio s) {
        String sql = "insert into Servicio (costoServicio, fechaServicio, fechaVencimientoServicio, idTipoServicio, idLibro, idCliente) values('"
                + s.getCostoServicio() + "','"
                + s.getFechaServicio() + "','"
                + s.getFechaVencimientoServicio() + "','"
                + s.getIdTipoServicio() + "','"
                + s.getIdLibro() + "','"
                + s.getIdCliente() + "')";
//        System.out.println(s.getFechaVencimientoServicio());
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
        String sql = "update Servicio set costoServicio = '" + serv.getCostoServicio()
                + "',fechaServicio = '" + serv.getFechaServicio()
                + "',fechaVencimientoServicio = '" + serv.getFechaVencimientoServicio()
                + "',idTipoServicio = '" + serv.getIdTipoServicio()
                + "',idLibro = '" + serv.getIdLibro()
                + "' where idServicio = " + serv.getIdServicio();
        try {
            con = conect.getConnection();
            ps = con.prepareStatement(sql);
            ps.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return false;
    }

    public boolean eliminar(int id) {
        String sql = "delete from Servicio where idServicio=" + id;
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
