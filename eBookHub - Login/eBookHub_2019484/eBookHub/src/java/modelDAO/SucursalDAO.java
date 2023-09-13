package modelDAO;

import config.Conexion;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import model.Sucursal;

public class SucursalDAO{
    
    Conexion conect = new Conexion();
    Connection con;
    PreparedStatement ps;
    ResultSet rs;
    Sucursal sucursal = new Sucursal();
    int resp;

    public List listarSucursal() {
        List<Sucursal> listaSucursal = new ArrayList<>();
        String sql = "select * from sucursal";
        try{
            con = conect.getConnection();
            ps = con.prepareStatement(sql);
            rs = ps.executeQuery();
            while(rs.next()){
                Sucursal nuevaSucursal = new Sucursal();
                nuevaSucursal.setIdSucursal(rs.getInt(1));
                nuevaSucursal.setNombreSucursal(rs.getString(2));
                nuevaSucursal.setDireccionSucursal(rs.getString(3));
                nuevaSucursal.setTelefonoSucursal(rs.getString(4));
                listaSucursal.add(nuevaSucursal);
            }            
        }catch(Exception e){
            e.printStackTrace();
        }
        return listaSucursal;
    }

    public Sucursal listSucursal(int id) {
        Sucursal sucur = new Sucursal();
        String sql = "select * from Sucursal where idSucursal = " + id;
        try{
            con = conect.getConnection();
            ps = con.prepareStatement(sql);
            rs = ps.executeQuery();
            while(rs.next()){
                sucur.setNombreSucursal(rs.getString(2));
                sucur.setDireccionSucursal(rs.getString(3));
                sucur.setTelefonoSucursal(rs.getString(4));
            }
        }catch(Exception e){
            e.printStackTrace();
        }
        return sucursal;
    }

    public int addSucursal(Sucursal suc) {
        String sql = "Insert into Sucursal(nombreSucursal, direccionSucursal, telefonoSucursal) values(?,?,?)";
        try {
            con = conect.getConnection();
            ps = con.prepareStatement(sql);
            ps.setString(1, suc.getNombreSucursal());
            ps.setString(2, suc.getDireccionSucursal());
            ps.setString(3, suc.getTelefonoSucursal());
            ps.executeUpdate();
        }catch (Exception e) {
            e.printStackTrace();
            System.out.println("No se puede agregar Sucursal");            
        }
        return resp;
    }

    public boolean editSucursal(Sucursal suc) {
        String sql = "Update Sucursal set nombreSucursal = ?, direccionSucursal = ?, telefonoSucursal = ? where idSucursal = ?";
        try{
            con = conect.getConnection();
            ps = con.prepareStatement(sql);
            ps.setString(1, suc.getNombreSucursal());   
            ps.setString(2, suc.getDireccionSucursal());
            ps.setString(3, suc.getTelefonoSucursal());
            ps.setInt(4, suc.getIdSucursal());
            ps.executeUpdate();
        }catch(Exception e){
            e.printStackTrace();
            System.out.println("no se pudo editar");
        }
        return false;
    }

    public boolean eliminarSucursal(int id) {
        String sql= "Delete from Sucursal where idSucursal =" + id;
        try{
            con = conect.getConnection();
            ps = con.prepareStatement(sql);
            ps.executeUpdate();
        }catch(Exception e){
            e.printStackTrace();
        }
        return false;
    }
    
}
