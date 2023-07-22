package modelDAO;

import config.Conexion;
import interfaces.CRUDLibro;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import model.Libro;

/**
 *
 * @author Ottoniel
 */
public class LibroDAO implements CRUDLibro {

    Conexion connect = new Conexion();
    Connection con;
    PreparedStatement ps;
    ResultSet rs;
    Libro libro = new Libro();

    @Override
    public List listarLibro() {
        ArrayList<Libro> listaLibro = new ArrayList<>();
        String sql = "select * from Libro";
        try {
            con = connect.getConnection();
            ps = con.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                Libro nuevoLibro = new Libro();
                nuevoLibro.setIdLibro(rs.getInt("idLibro"));
                nuevoLibro.setTituloLibro(rs.getString("tituloLibro"));
                nuevoLibro.setDescripcionLibro(rs.getString("descripcionLibro"));
                nuevoLibro.setFechaDePublicacion(rs.getString("fechaDePublicacion"));
                nuevoLibro.setIdiomaLibro(rs.getString("idiomaLibro"));
                nuevoLibro.setCostoLibro(rs.getDouble("costoLibro"));
                nuevoLibro.setStockLibro(rs.getInt("stockLibro"));
                nuevoLibro.setIdTipoLibro(rs.getInt("idTipoLibro"));
                nuevoLibro.setIdAutor(rs.getInt("idAutor"));
                nuevoLibro.setIdEditorial(rs.getInt("idEditorial"));
                nuevoLibro.setIdCategoria(rs.getInt("idCategoria"));
                listaLibro.add(nuevoLibro);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return listaLibro;
    }

    @Override
    public Libro listLibro(int id) {
        String sql = "select * from Libro where idLibro =" + id;
        try {
            con = connect.getConnection();
            ps = con.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                libro.setIdLibro(rs.getInt("idLibro"));
                libro.setTituloLibro(rs.getString("tituloLibro"));
                libro.setDescripcionLibro(rs.getString("descripcionLibro"));
                libro.setFechaDePublicacion(rs.getString("fechaDePublicacion"));
                libro.setIdiomaLibro(rs.getString("idiomaLibro"));
                libro.setCostoLibro(rs.getDouble("costoLibro"));
                libro.setStockLibro(rs.getInt("stockLibro"));
                libro.setIdTipoLibro(rs.getInt("idTipoLibro"));
                libro.setIdAutor(rs.getInt("idAutor"));
                libro.setIdEditorial(rs.getInt("idEditorial"));
                libro.setIdCategoria(rs.getInt("idCategoria"));
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return libro;
    }

    @Override
    public boolean addLibro(Libro l) {
        String sql = "insert into Libro (tituloLibro, descripcionLibro, fechaDePublicacion, idiomaLibro, costoLibro, stockLibro, "
                + "idTipoLibro, idAutor, idEditorial, idCategoria) values('"
                + l.getTituloLibro() + "','"
                + l.getDescripcionLibro() + "','"
                + l.getFechaDePublicacion() + "','"
                + l.getIdiomaLibro() + "','"
                + l.getCostoLibro() + "','"
                + l.getStockLibro() + "','"
                + l.getIdTipoLibro() + "','"
                + l.getIdAutor() + "','"
                + l.getIdEditorial() + "','"
                + l.getIdCategoria() + "')";
        try {
            con = connect.getConnection();
            ps = con.prepareStatement(sql);
            ps.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }

        return false;
    }

    @Override
    public boolean editLibro(Libro l) {
        String sql = "update persona "
                + "set tituloLibro = '" + l.getTituloLibro()
                + "',descripcionLibro = '" + l.getDescripcionLibro()
                + "',fechaDePublicacion = '" + l.getFechaDePublicacion()
                + "',idiomaLibro = '" + l.getIdiomaLibro()
                + "',costoLibro = '" + l.getCostoLibro()
                + "',idTipoLibro = '" + l.getIdTipoLibro()
                + "',idAutor = '" + l.getIdAutor()
                + "',idEditorial = '" + l.getIdEditorial()
                + "',idCategoria = '" + l.getIdCategoria()
                + "'where idLibro= " + l.getIdLibro();
        try {
            con = connect.getConnection();
            ps = con.prepareStatement(sql);
            ps.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return false;
    }

    @Override
    public boolean eliminarLibro(int id) {
        String sql = "delete from Libro where idLibro" + id;
        try {
            con = connect.getConnection();
            ps = con.prepareStatement(sql);
            ps.executeUpdate();
            while (rs.next()) ;

        } catch (Exception e) {
            e.printStackTrace();
        }
        return false;
    }

}
