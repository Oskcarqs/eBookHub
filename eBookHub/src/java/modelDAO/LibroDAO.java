package modelDAO;

import config.Conexion;
import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;
import model.Libro;

/**
 *
 * @author Ottoniel
 */
public class LibroDAO   {

    Conexion connect = new Conexion();
    Connection con;
    PreparedStatement ps;
    ResultSet rs;
    Libro libro = new Libro();

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
                nuevoLibro.setFotoLibro(rs.getBinaryStream("fotoLibro"));
                nuevoLibro.setTituloLibro(rs.getString("tituloLibro"));
                nuevoLibro.setDescripcionLibro(rs.getString("descripcionLibro"));
                nuevoLibro.setFechaDePublicacion(rs.getDate("fechaDePublicacion").toLocalDate());
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

    public Libro listLibro(int id) {
        String sql = "select * from Libro where idLibro =" + id;
        try {
            con = connect.getConnection();
            ps = con.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                libro.setIdLibro(rs.getInt("idLibro"));
                libro.setFotoLibro(rs.getBinaryStream("fotoLibro"));
                libro.setTituloLibro(rs.getString("tituloLibro"));
                libro.setDescripcionLibro(rs.getString("descripcionLibro"));
                libro.setFechaDePublicacion(rs.getDate("fechaDePublicacion").toLocalDate());
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

    public boolean addLibro(Libro l) {
        String sql = "insert into Libro(fotoLibro, tituloLibro, descripcionLibro, fechaDePublicacion, idiomaLibro, costoLibro, stockLibro, idTipoLibro, idAutor, idEditorial, idCategoria)values(?,?,?,?,?,?,?,?,?,?,?)";
        try {
            con = connect.getConnection();
            ps = con.prepareStatement(sql);
            ps.setBlob(1, l.getFotoLibro());
            ps.setString(2, l.getTituloLibro());
            ps.setString(3, l.getDescripcionLibro());
            ps.setDate(4, Date.valueOf(l.getFechaDePublicacion()));
            ps.setString(5, l.getIdiomaLibro());
            ps.setDouble(6, l.getCostoLibro());
            ps.setInt(7, l.getStockLibro());
            ps.setInt(8, l.getIdTipoLibro());
            ps.setInt(9, l.getIdAutor());
            ps.setInt(10, l.getIdEditorial());
            ps.setInt(11, l.getIdCategoria());
            ps.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }

        return false;
    }

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
