package modelDAO;

import configuracion.Conexion;
import interfaces.CRUD;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import model.Sucursal;

public class SucursalDAO implements CRUD{
    
    Conexion conect = new Conexion();
    Connection con;
    PreparedStatement ps;
    ResultSet rs;
    Sucursal nSucursal = new Sucursal();

    @Override
    public List listar() {
        ArrayList<Sucursal> listaSucursal = new ArrayList<>();
        String sql = "select * from Sucursal;";
        try {
            con = conect.getConnection();
            ps = con.prepareStatement(sql);
            rs = ps.executeQuery();
            while(rs.next()){
                Sucursal nuevaSucursal = new Sucursal();
                nuevaSucursal.setIdSucursal(rs.getInt("idSucursal"));
                nuevaSucursal.setNombreSucursal(rs.getString("nombreSucursal"));
                listaSucursal.add(nuevaSucursal);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return listaSucursal;
    }

    @Override
    public Sucursal list(int id) {
        String sql = "Select * from persona where codigoPersona =" + id;
        try {
            con = conect.getConnection();
            ps = con.prepareStatement(sql);
            rs = ps.executeQuery();
            while(rs.next()){
                nSucursal.setIdSucursal(rs.getInt("idSucursal"));
                nSucursal.setNombreSucursal(rs.getString("nombreSucursal"));
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return nSucursal;
    }

    @Override
    public boolean add(Sucursal suc) {
        
        String sql = "Insert into Sucursal (nombreSucursal) values('"+suc.getIdSucursal()+"','"+suc.getNombreSucursal()+"')";
        
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
    public boolean edit(Sucursal suc) {
        //Update persona set DPI = '', nombrePersona = '' where codigoPersona = ?;
//        String sql = "Update persona set DPI = '"+ per.getDPI()+"',nombrePersona = '"+ per.getNombrePersona()+"'where codigoPersona ="+per.getCodigoPersona();
//        String sql = "Update Sucursal set nombreSucursal = nomSuc '"+ suc.getNombreSucursal()"'where idSucursal ="+suc.getIdSucursal();
        try {
            con = conect.getConnection();
//            ps = con.prepareStatement(sql);
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

