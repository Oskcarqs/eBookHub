package modelDAO;

import config.Conexion;
import interfaces.CRUDCategoria;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import model.Categoria;

public class CategoriaDAO implements CRUDCategoria {

    Conexion conect = new Conexion();
    Connection con;
    PreparedStatement ps;
    ResultSet rs;
    Categoria cat = new Categoria();

    @Override
    public List listarCategoria() {
        ArrayList<Categoria> listaCategoria = new ArrayList<>();
        String sql = "select * from Categoria";
        try {
            con = conect.getConnection();
            ps = con.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                Categoria nuevoCategoria = new Categoria();
                nuevoCategoria.setIdCategoria(rs.getInt("idCategoria"));
                nuevoCategoria.setNombreCategoria(rs.getString("nombreCategoria"));
                nuevoCategoria.setDescripcionCategoria(rs.getString("descripcionCategoria"));
                listaCategoria.add(nuevoCategoria);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }

        return listaCategoria;
    }

    @Override
    public Categoria listCategoria(int id) {
        String sql = "Select * from Categoria where idCategoria=" + id;
        try {
            con = conect.getConnection();
            ps = con.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                cat.setIdCategoria(rs.getInt("idCategoria"));
                cat.setNombreCategoria(rs.getString("nombreCategoria"));
                cat.setDescripcionCategoria(rs.getString("descripcionCategoria"));
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return cat;

    }

    @Override
    public boolean addCategoria(Categoria cate) {
        String sql = "Insert into Categoria (nombreCategoria, descripcionCategoria) values('" + cate.getNombreCategoria() + "','" + cate.getDescripcionCategoria() + "')";
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
    public boolean editCategoria(Categoria cate) {
        String sql = "update Categoria set nombreCategoria = '" + cate.getNombreCategoria() + "',descripcionCategoria = '" + cate.getDescripcionCategoria() + "' where idCategoria= " + cate.getIdCategoria();
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
    public boolean eliminarCategoria(int id) {
        String sql = "delete from Categoria where idCategoria=" + id;
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
