/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package modelDAO;

import config.Conexion;
import interfaces.CRUDFacturaSuscripcion;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import model.FacturaSuscripcion;

/**
 *
 * @author Usuario
 */
public class DAOFacturaSuscripcion implements CRUDFacturaSuscripcion{
    Conexion conect = new Conexion();
    Connection con;
    PreparedStatement ps;
    ResultSet rs;
    FacturaSuscripcion nFacturaSuscripcion = new FacturaSuscripcion();
    
    public List listarFacturaSuscripcion() {
    ArrayList<FacturaSuscripcion> listaFacturaSuscripcion = new ArrayList<>();
    String sql = "Select * from FacturaSuscripcion";
        try {    
            con = conect.getConnection();
            ps = con.prepareStatement(sql);
            rs = ps.executeQuery();
            while(rs.next()){
                FacturaSuscripcion nuevaFacturaSuscripcion = new FacturaSuscripcion();
                nuevaFacturaSuscripcion.setIdFacturaSuscripcion(rs.getInt("idFacturaSuscripcion"));
                nuevaFacturaSuscripcion.setFechaDeInicio(rs.getDate("fechaDeInicio"));
                nuevaFacturaSuscripcion.setFechaDeVencimiento(rs.getDate("fechaDeVencimiento"));
                nuevaFacturaSuscripcion.setIdTipoSuscripcion(rs.getInt("idTipoSuscripcion"));
                nuevaFacturaSuscripcion.setIdUsuario(rs.getInt("idUsuario"));
                listaFacturaSuscripcion.add(nuevaFacturaSuscripcion);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return listaFacturaSuscripcion;
    }

    @Override
    public FacturaSuscripcion listFacturaSuscripcion(int id) {
        String sql = "Select * from FacturaSuscripcion where idFacturaSuscripcion="+ id;
        try {
            con = conect.getConnection();
            ps = con.prepareStatement(sql);
            rs = ps.executeQuery();
            while(rs.next()){
                nFacturaSuscripcion.setIdFacturaSuscripcion(rs.getInt("idFacturaSuscripcion"));
                nFacturaSuscripcion.setFechaDeInicio(rs.getDate("fechaDeInicio"));
                nFacturaSuscripcion.setFechaDeVencimiento(rs.getDate("fechaDeVencimiento"));
                nFacturaSuscripcion.setIdTipoSuscripcion(rs.getInt("idTipoSuscripcion"));
                nFacturaSuscripcion.setIdUsuario(rs.getInt("idUsuario"));
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return nFacturaSuscripcion;
    }

    @Override
    public boolean add(FacturaSuscripcion fs) {
        String sql = "Insert into FacturaSuscripcion(fechaDeInicio, fechaDeVencimiento, "
                + "idTipoSuscripcion,idUsuario) values('"+fs.getFechaDeInicio()+
                "','"+fs.getFechaDeVencimiento()+"','"+fs.getIdTipoSuscripcion()+
                "','"+fs.getIdUsuario()+"')";
        try {
            con = conect.getConnection();
            ps = con.prepareStatement(sql);
            ps.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return false;
    }

    @Override
    public boolean edit(FacturaSuscripcion fs) {
        System.out.println("entro aqui");
        String sql = "update FacturaSuscripcion set fechaDeInicio = '"+fs.getFechaDeInicio()+"',fechaDeVencimiento = '"+fs.getFechaDeVencimiento()+"',idTipoSuscripcion = '"+fs.getIdTipoSuscripcion()+"',idUsuario = '"+fs.getIdUsuario()+"' where idFacturaSuscripcion = "+ fs.getIdFacturaSuscripcion();
        try {
            con = conect.getConnection();
            ps = con.prepareStatement(sql);
            ps.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return false;
    }

    @Override
    public boolean eliminar(int id) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }
}
