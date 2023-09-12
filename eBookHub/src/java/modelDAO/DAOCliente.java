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
import model.Cliente;

/**
 *
 * @author Usuario
 */
public class DAOCliente{
    Conexion conect = new Conexion();
    Connection con;
    PreparedStatement ps;
    ResultSet rs;
    Cliente nCliente = new Cliente();


    public List listarCliente() {
        ArrayList<Cliente> listaCliente = new ArrayList<>();
        String sql = "Select * from Cliente";
        try {
            con = conect.getConnection();
            ps = con.prepareStatement(sql);
            rs = ps.executeQuery();
            while(rs.next()){
                Cliente nuevoCliente = new Cliente();
                nuevoCliente.setIdCliente(rs.getInt("idCliente"));
                nuevoCliente.setNombreCliente(rs.getString("nombreCliente"));
                nuevoCliente.setApellidoCliente(rs.getString("apellidoCliente"));
                nuevoCliente.setFechaDeNacimientoCliente(rs.getDate("fechaDeNacimientoCliente"));
                nuevoCliente.setDireccionCliente(rs.getString("direccionCliente"));
                nuevoCliente.setTelefonoCliente(rs.getString("telefonoCliente"));
                listaCliente.add(nuevoCliente);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return listaCliente;
    }

    public Cliente listCliente(int id) {
        String sql = "Select * from Cliente where idCliente="+ id;
        try {
            con = conect.getConnection();
            ps = con.prepareStatement(sql);
            rs = ps.executeQuery();
            while(rs.next()){
                nCliente.setIdCliente(rs.getInt("idCliente"));
                nCliente.setNombreCliente(rs.getString("nombreCliente"));
                nCliente.setApellidoCliente(rs.getString("apellidoCliente"));
                nCliente.setFechaDeNacimientoCliente(rs.getDate("fechaDeNacimientoCliente"));
                nCliente.setDireccionCliente(rs.getString("direccionCliente"));
                nCliente.setTelefonoCliente(rs.getString("telefonoCliente"));
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return nCliente;
    }

    public boolean add(Cliente c) {
        String sql = "insert into Cliente (nombreCliente, apellidoCliente, fechaDeNacimientoCliente, direccionCliente, telefonoCliente)"
                + "values('"+c.getNombreCliente()+"','"+ c.getApellidoCliente()+"','" + c.getFechaDeNacimientoCliente() +"','"+ c.getDireccionCliente()+
                "','" + c.getTelefonoCliente()+"')";
        try {
            con = conect.getConnection();
            ps = con.prepareStatement(sql);
            ps.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return false;
    }

    public boolean edit(Cliente c) {
        
        try {
            con = conect.getConnection();
            PreparedStatement ps = con.prepareCall("call sp_EditarCliente(?,?,?,?,?,?)");
            ps.setInt(1, c.getIdCliente());
            ps.setString(2, c.getNombreCliente());
            ps.setString(3, c.getApellidoCliente());
            ps.setDate(4, c.getFechaDeNacimientoCliente());
            ps.setString(5, c.getDireccionCliente());
            ps.setString(6, c.getTelefonoCliente());
            ps.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return false;
    }

    public boolean eliminar(int id) {
        String sql = "delete from Cliente where idCliente="+ id;
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
