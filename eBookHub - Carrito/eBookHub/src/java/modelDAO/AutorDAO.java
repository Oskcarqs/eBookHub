package modelDAO;

import config.Conexion;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import model.Autor;

public class AutorDAO{

    Conexion cn = new Conexion();
    Connection con;
    PreparedStatement ps;
    ResultSet rs;
    int resp;

    public List listarAutor() {
        ArrayList<Autor> listaAutor = new ArrayList<>();
        String sql = "select * from Autor";
        try {
            con = cn.getConnection();
            ps = con.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                Autor nuevoAutor = new Autor();
                nuevoAutor.setIdAutor(rs.getInt("idAutor"));
                nuevoAutor.setNombreAutor(rs.getString("nombreAutor"));
                nuevoAutor.setApellidoAutor(rs.getString("apellidoAutor"));
                nuevoAutor.setNacionalidadAutor(rs.getString("nacionalidadAutor"));
                nuevoAutor.setFechaNacimientoAutor(rs.getString("fechaNacimientoAutor"));
                nuevoAutor.setBiografiaAutor(rs.getString("biografiaAutor"));
                listaAutor.add(nuevoAutor);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }

        return listaAutor;
    }


    public Autor listAutor(int id) {
        Autor aut = new Autor();
        String sql = "Select * from Autor where idAutor=" + id;
        try {
            con = cn.getConnection();
            ps = con.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                
                aut.setIdAutor(rs.getInt("idAutor"));
                aut.setNombreAutor(rs.getString("nombreAutor"));
                aut.setApellidoAutor(rs.getString("apellidoAutor"));
                aut.setNacionalidadAutor(rs.getString("nacionalidadAutor"));
                aut.setFechaNacimientoAutor(rs.getString("fechaNacimientoAutor"));
                aut.setBiografiaAutor(rs.getString("biografiaAutor"));
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return aut;
    }


    public int addAutor(Autor aut) {
        String sql = "Insert into Autor (nombreAutor, apellidoAutor, nacionalidadAutor, fechaNacimientoAutor, biografiaAutor) values(?,?,?,?,?);";
        try {
            con = cn.getConnection();
            ps = con.prepareStatement(sql);
            ps.setString(1, aut.getNombreAutor());
            ps.setString(2, aut.getApellidoAutor());
            ps.setString(3, aut.getNacionalidadAutor());
            ps.setString(4, aut.getFechaNacimientoAutor());
            ps.setString(5, aut.getBiografiaAutor());
            ps.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return resp;
    }

    public int editAutor(Autor aut) {
        String sql = "update Autor set nombreAutor=?, apellidoAutor=?, nacionalidadAutor=?, fechaNacimientoAutor=?, biografiaAutor=? where idAutor=?";
        try {
            con = cn.getConnection();
            ps = con.prepareStatement(sql);
            ps.setInt(6, aut.getIdAutor());
            ps.setString(1, aut.getNombreAutor());
            ps.setString(2, aut.getApellidoAutor());
            ps.setString(3, aut.getNacionalidadAutor());
            ps.setString(4, aut.getFechaNacimientoAutor());
            ps.setString(5, aut.getBiografiaAutor());
            ps.executeUpdate();
            System.out.println("si se pudo actualizar en el dao");
        } catch (Exception e) {
            e.printStackTrace();
            System.out.println("no se pudo actualizar en el dao");
        }
        return resp;
    }

    public void eliminarAutor(int id) {
        String sql = "delete from Autor where idAutor=" + id;
        try {
            con = cn.getConnection();
            ps = con.prepareStatement(sql);
            ps.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
