/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package modelDAO;

import configuration.Conexion;
import interfaces.CRUD;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import model.Sucursal;

/**
 *
 * @author pedro me orina
 */
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
                nuevaSucursal.setDireccionSucursal(rs.getString("direccionSucursal"));
                nuevaSucursal.setTelefonoSucursal(rs.getString("telefonoSucursal"));
                listaSucursal.add(nuevaSucursal);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return listaSucursal;
    }

    @Override
    public Sucursal list(int id) {
        String sql = "Select * from Sucursal where idSucursal =" + id;
        try {
            con = conect.getConnection();
            ps = con.prepareStatement(sql);
            rs = ps.executeQuery();
            while(rs.next()){
                nSucursal.setIdSucursal(rs.getInt("idSucursal"));
                nSucursal.setNombreSucursal(rs.getString("nombreSucursal"));
                nSucursal.setDireccionSucursal(rs.getString("direccionSucursal"));
                nSucursal.setTelefonoSucursal(rs.getString("telefonoSucursal"));

            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return nSucursal;
    }

    @Override
    public boolean add(Sucursal suc) {
        String sql = "insert into Sucursal(nombreSucursal, direccionSucursal, telefonoSucursal) values('"+suc.getIdSucursal()+"','"+suc.getNombreSucursal()+"','"+suc.getDireccionSucursal()+"','"+suc.getTelefonoSucursal()+"')";
        
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
        String sql = "Update Sucursal set nombreSucursal = '"+ suc.getNombreSucursal()+"',direccionSucursal = '"+ suc.getNombreSucursal()+"', telefonoSucursal = '" + suc.getTelefonoSucursal()+"' where idSucursal ="+suc.getIdSucursal();
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
        String sql = "Delete from Sucursal where idSucursal" + id;
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
    

