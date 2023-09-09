/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package modelDAO;

import config.Conexion;
import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.InputStream;
import java.io.OutputStream;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServletResponse;
import model.Cliente;

/**
 *
 * @author Usuario
 */
@MultipartConfig
public class DAOCliente {

    Conexion cn = new Conexion();
    Connection con;
    PreparedStatement ps;
    ResultSet rs;
    Cliente nCliente = new Cliente();

    public void listarImg(int id, HttpServletResponse response) {
        String sql = "Select * from Cliente where idCliente=" + id;
        InputStream inputStream = null;
        OutputStream outputStream = null;
        BufferedInputStream bufferedInputStream = null;
        BufferedOutputStream bufferedOutputStream = null;
        response.setContentType("img/*");
        try {
            outputStream = response.getOutputStream();
            con = cn.getConnection();
            ps = con.prepareStatement(sql);
            rs = ps.executeQuery();
            if (rs.next()) {
                inputStream = rs.getBinaryStream("imgCLiente");
            }
            bufferedInputStream = new BufferedInputStream(inputStream);
            bufferedOutputStream = new BufferedOutputStream(outputStream);
            int i = 0;
            while ((i = bufferedInputStream.read()) != -1) {
                bufferedOutputStream.write(i);
            }
        } catch (Exception e) {
        }
    }

    public List listarCliente() {
        ArrayList<Cliente> listaCliente = new ArrayList<>();
        String sql = "Select * from Cliente";
        try {
            con = cn.getConnection();
            ps = con.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                Cliente nuevoCliente = new Cliente();
                nuevoCliente.setIdCliente(rs.getInt("idCliente"));
                nuevoCliente.setNombreCliente(rs.getString("nombreCliente"));
                nuevoCliente.setApellidoCliente(rs.getString("apellidoCliente"));
                nuevoCliente.setFechaDeNacimientoCliente(rs.getString("fechaDeNacimientoCliente"));
                nuevoCliente.setDireccionCliente(rs.getString("direccionCliente"));
                nuevoCliente.setTelefonoCliente(rs.getString("telefonoCliente"));
                nuevoCliente.setNickNameUsuario(rs.getString("nickNameUsuario"));
                nuevoCliente.setEmailUsuario(rs.getString("emailUsuario"));
                nuevoCliente.setPasswordUsuario(rs.getString("passwordUsuario"));
                nuevoCliente.setImgCLiente(rs.getBinaryStream("imgCLiente"));
                listaCliente.add(nuevoCliente);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return listaCliente;
    }

    public Cliente listCliente(int id) {
        String sql = "Select * from Cliente where idCliente=" + id;
        try {
            con = cn.getConnection();
            ps = con.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                nCliente.setIdCliente(rs.getInt("idCliente"));
                nCliente.setNombreCliente(rs.getString("nombreCliente"));
                nCliente.setApellidoCliente(rs.getString("apellidoCliente"));
                nCliente.setFechaDeNacimientoCliente(rs.getString("fechaDeNacimientoCliente"));
                nCliente.setDireccionCliente(rs.getString("direccionCliente"));
                nCliente.setTelefonoCliente(rs.getString("telefonoCliente"));
                nCliente.setNickNameUsuario(rs.getString("nickNameUsuario"));
                nCliente.setEmailUsuario(rs.getString("emailUsuario"));
                nCliente.setPasswordUsuario(rs.getString("passwordUsuario"));
                nCliente.setImgCLiente(rs.getBinaryStream("imgCLiente"));
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return nCliente;
    }

    public boolean add(Cliente c) {
        String sql = "insert into Cliente (nombreCliente, apellidoCliente, fechaDeNacimientoCliente, direccionCliente, telefonoCliente,nickNameUsuario,emailUsuario,passwordUsuario,imgCLiente) values(?,?,?,?,?,?,?,?,?)";
        try {
            con = cn.getConnection();
            ps = con.prepareStatement(sql);
            ps.setString(1, c.getNombreCliente());
            ps.setString(2, c.getApellidoCliente());
            ps.setString(3, c.getFechaDeNacimientoCliente());
            ps.setString(4, c.getDireccionCliente());
            ps.setString(5, c.getTelefonoCliente());
            ps.setString(6, c.getNickNameUsuario());
            ps.setString(7, c.getEmailUsuario());
            ps.setString(8, c.getPasswordUsuario());
            ps.setBlob(9, c.getImgCLiente());
            ps.executeUpdate();
            System.out.println("se agrego en el dao");
        } catch (Exception e) {
            System.out.println("no se agrego 1");
            e.printStackTrace();
        }
        return false;
    }

    public boolean edit(Cliente c) {
        String sql = "update Cliente set nombreCliente=?, apellidoCliente=?, fechaDeNacimientoCliente=?, direccionCliente=?, telefonoCliente=?,nickNameUsuario=?, emailUsuario=?,passwordUsuario=?,imgCLiente=? where idCliente=?";
        try {
            con = cn.getConnection();
            ps = con.prepareStatement(sql);
            ps.setString(1, c.getNombreCliente());
            ps.setString(2, c.getApellidoCliente());
            ps.setString(3, c.getFechaDeNacimientoCliente());
            ps.setString(4, c.getDireccionCliente());
            ps.setString(5, c.getTelefonoCliente());
            ps.setString(6, c.getNickNameUsuario());
            ps.setString(7, c.getEmailUsuario());
            ps.setString(8, c.getPasswordUsuario());
            ps.setBlob(9, c.getImgCLiente());
            ps.setInt(10, c.getIdCliente());
            ps.executeUpdate();
        } catch (Exception e) {
            System.out.println(" no se editor porque :" + e.getMessage());
            e.printStackTrace();

        }
        return false;
    }

    public boolean eliminar(int id) {
        String sql = "delete from Cliente where idCliente=" + id;
        try {
            con = cn.getConnection();
            ps = con.prepareStatement(sql);
            ps.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return false;
    }
}
