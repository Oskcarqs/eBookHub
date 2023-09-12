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
import model.DetalleFactura;

/**
 *
 * @author User
 */
public class DetalleFacturaDAO {
    
    Conexion connect = new Conexion();
    Connection con;
    PreparedStatement ps;
    ResultSet rs;
    DetalleFactura nDetalleFactura = new DetalleFactura();

  
    public List listarDetalleFactura() {
        ArrayList<DetalleFactura> listarDetalleFactura = new ArrayList<>();
        String sql = "select * from DetalleFactura";
        
        try{
            
            con = connect.getConnection();
            ps = con.prepareStatement(sql);
            rs = ps.executeQuery();
            while(rs.next()){
                
                DetalleFactura nuevaDetalleFactura = new DetalleFactura();
                nuevaDetalleFactura.setIdDetalleFactura(rs.getInt("idDetalleFactura"));
                nuevaDetalleFactura.setIdFactura(rs.getInt("idFactura"));
                nuevaDetalleFactura.setIdServicio(rs.getInt("idServicio"));
                listarDetalleFactura.add(nuevaDetalleFactura);
                
            }
            
        }catch(Exception e){
            e.printStackTrace();
        }
        
        return listarDetalleFactura;
    }

   
    public DetalleFactura listDetalleFactura(int idDetalleFactura) {
        
        String sql = "select * from DetalleFactura where idDetalleFactura = " + idDetalleFactura;
        
        try{
            
            con = connect.getConnection();
            ps = con.prepareStatement(sql);
            rs = ps.executeQuery();
            while(rs.next()){
                
                nDetalleFactura.setIdDetalleFactura(rs.getInt("idDetalleFactura"));
                nDetalleFactura.setIdFactura(rs.getInt("idFactura"));
                nDetalleFactura.setIdServicio(rs.getInt("idServicio"));
                
            }
            
        }catch(Exception e){
            e.printStackTrace();
        }
        
        return nDetalleFactura;
        
    }


    public boolean addDetalleFactura(DetalleFactura df) {
        
        String sql = "Insert into DetalleFactura(idFactura, idServicio) values('" + df.getIdFactura() + "','" + df.getIdServicio() + "')";
        
        try{
            
            con = connect.getConnection();
            ps = con.prepareStatement(sql);
            ps.executeUpdate();
            
        }catch(Exception e){
            e.printStackTrace();
        }
        
        return false;
    }

 
    public boolean editDetalleFactura(DetalleFactura df) {
        
        String sql = "Update DetalleFactura set idFactura ='" + df.getIdFactura() + "', idServicio ='" + df.getIdServicio() + "' where idDetalleFactura =" + df.getIdDetalleFactura();
        
        try{
            
            con = connect.getConnection();
            ps = con.prepareStatement(sql);
            ps.executeUpdate();
            
        }catch(Exception e){
            e.printStackTrace();
        }
        
        return false;
    }


    public boolean eliminarDetalleFactura(int idDetalleFactura) {
        String sql = "delete from DetalleFactura where idDetalleFactura =" + idDetalleFactura;
        
        try{
            
            con = connect.getConnection();
            ps = con.prepareStatement(sql);
            ps.executeUpdate();
            
        }catch(Exception e){
            e.printStackTrace();
        }
        
        return false;
    }
    
}
