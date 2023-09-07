package modelDAO;

import config.Conexion;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import model.Categoria;

public class CategoriaDAO{

    Conexion conect = new Conexion();
    Connection con;
    PreparedStatement ps;
    ResultSet rs;
    Categoria categoria = new Categoria();
    int resp;

    public List listarCategoria() {
        List<Categoria> listaCategoria = new ArrayList<>();
        String sql = "select * from Categoria";
        try {
            con = conect.getConnection();
            ps = con.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                Categoria nuevoCategoria = new Categoria();
                nuevoCategoria.setIdCategoria(rs.getInt(1));
                nuevoCategoria.setNombreCategoria(rs.getString(2));
                nuevoCategoria.setDescripcionCategoria(rs.getString(3));
                listaCategoria.add(nuevoCategoria);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }

        return listaCategoria;
    }

    public Categoria listCategoria(int id) {
        
        Categoria cat = new Categoria();
        String sql = "Select * from Categoria where idCategoria=" + id;
        try {
            con = conect.getConnection();
            ps = con.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                cat.setNombreCategoria(rs.getString(2));
                cat.setDescripcionCategoria(rs.getString(3));
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return categoria;

    }

    public int addCategoria(Categoria cate) {
        String sql = "Insert into Categoria (nombreCategoria, descripcionCategoria) values(?,?)";
        try {
            con = conect.getConnection();
            ps = con.prepareStatement(sql);
            ps.setString(1, cate.getNombreCategoria());
            ps.setString(2, cate.getDescripcionCategoria());
            ps.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
            System.out.println("No se puede agregar Categoria");
        }
        return resp;
    }

    public int editCategoria(Categoria cate) {
        String sql = "update Categoria set nombreCategoria = ?, descripcionCategoria = ? where idCategoria = ?";
        try {
            con = conect.getConnection();
            ps = con.prepareStatement(sql);
            ps.setString(1, cate.getNombreCategoria());
            ps.setString(2, cate.getDescripcionCategoria());
            ps.setInt(3, cate.getIdCategoria());
            ps.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
            System.out.println("No se puede actualizar Categoria");
        }
        return resp;
    }

    public void eliminarCategoria(int id) {
        String sql = "delete from Categoria where idCategoria=" + id;
        try {
            con = conect.getConnection();
            ps = con.prepareStatement(sql);
            ps.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
