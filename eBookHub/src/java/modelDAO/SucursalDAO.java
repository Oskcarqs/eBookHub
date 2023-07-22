package modelDAO;

import config.Conexion;
import interfaces.CRUDSucursal;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import model.Sucursal;

public class SucursalDAO implements CRUDSucursal{
    
    Conexion connect = new Conexion();
    Connection con;
    PreparedStatement ps;
    ResultSet rs;
    Sucursal nSucursal = new Sucursal();

    @Override
    public List listarSucursal() {
        ArrayList<Sucursal> listarSucursal = new ArrayList<>();
        String sql = "select * from sucursal";
        
        try{
            
            con = connect.getConnection();
            ps = con.prepareStatement(sql);
            rs = ps.executeQuery();
            while(rs.next()){
                
                Sucursal nuevaSucursal = new Sucursal();
                nuevaSucursal.setIdSucursal(rs.getInt("idSucursal"));
                nuevaSucursal.setNombreSucursal(rs.getString("nombreSucursal"));
                nuevaSucursal.setDireccionSucursal(rs.getString("direccionSucursal"));
                nuevaSucursal.setTelefonoSucursal(rs.getString("telefonoSucursal"));
                listarSucursal.add(nuevaSucursal);
                
            }
            
            
        }catch(Exception e){
            e.printStackTrace();
        }
        
        return listarSucursal;
    }

    @Override
    public Sucursal listSucursal(int idSucursal) {
        
        String sql = "select * from Sucursal where idSucursal = " + idSucursal;
        
        try{
            
            con = connect.getConnection();
            ps = con.prepareStatement(sql);
            rs = ps.executeQuery();
            while(rs.next()){
                
                nSucursal.setIdSucursal(rs.getInt("idSucursal"));
                nSucursal.setNombreSucursal(rs.getString("nombreSucursal"));
                nSucursal.setDireccionSucursal(rs.getString("direccionSucursal"));
                nSucursal.setTelefonoSucursal(rs.getString("telefonoSucursal"));
                
            }
            
        }catch(Exception e){
            e.printStackTrace();
        }
        
        
        return nSucursal;
        
    }

    @Override
    public boolean addSucursal(Sucursal suc) {
        
        String sql = "Insert into Sucursal(nombreSucursal, direccionSucursal, telefonoSucursal) values('" + suc.getNombreSucursal() + "','" + suc.getDireccionSucursal() + "','" + suc.getTelefonoSucursal() + "')";
        
        try {
          
            con = connect.getConnection();
            ps = con.prepareStatement(sql);
            ps.executeUpdate();
            
        }catch (Exception e) {
            e.printStackTrace();
        }
        
        return false;
        
    }

    @Override
    public boolean editSucursal(Sucursal suc) {
        String sql = "Update Sucursal set nombreSucursal ='" + suc.getNombreSucursal() + "', direccionSucursal ='" + suc.getDireccionSucursal() + "', telefonoSucursal ='" + suc.getTelefonoSucursal() + "' where idSucursal ='" + suc.getIdSucursal();
        
        try{
            
            con = connect.getConnection();
            ps = con.prepareStatement(sql);
            ps.executeUpdate();
            
        }catch(Exception e){
            e.printStackTrace();
        }
        
        return false;
    }

    @Override
    public boolean eliminarSucursal(int idSucursal) {
        
        String sql= "Delete from Sucursal where idSucursal =" + idSucursal;
        
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
