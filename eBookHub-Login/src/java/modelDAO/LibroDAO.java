package modelDAO;

import config.Conexion;
import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.InputStream;
import java.io.OutputStream;
import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.http.HttpServletResponse;
import model.Libro;

/**
 *
 * @author Ottoniel
 */
public class LibroDAO {

    Conexion connect = new Conexion();
    Connection con;
    PreparedStatement ps;
    ResultSet rs;
    Libro libro = new Libro();
    int resp;

    public void listarImg(int id, HttpServletResponse response) {
        String sql = "Select * from Libro where idLibro = " + id;
        InputStream inputStream = null;
        OutputStream outputStream = null;
        BufferedInputStream bufferedInputStream = null;
        BufferedOutputStream bufferedOutputStream = null;
        response.setContentType("img/*");
        try {
            outputStream = response.getOutputStream();
            con = connect.getConnection();
            ps = con.prepareStatement(sql);
            rs = ps.executeQuery();
            if (rs.next()) {
                inputStream = rs.getBinaryStream("fotoLibro");
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

    public List listarLibro() {
        List<Libro> listaLibro = new ArrayList<>();
        String sql = "select L.idLibro, L.fotoLibro, L.tituloLibro, L.descripcionLibro, L.fechaDePublicacion, L.idiomaLibro, L.costoLibro, L.tipoLibro, L.stockLibro, A.nombreAutor, A.apellidoAutor, E.nombreEditorial, C.nombreCategoria from Libro L"
                + " inner join Autor A on L.idAutor = A.idAutor"
                + " inner join Editorial E on L.idEditorial = E.idEditorial"
                + " inner join Categoria C on L.idCategoria = C.idCategoria";
        try {
            con = connect.getConnection();
            ps = con.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                Libro nuevoLibro = new Libro();
                nuevoLibro.setIdLibro(rs.getInt(1));
                nuevoLibro.setFotoLibro(rs.getBinaryStream(2));
                nuevoLibro.setTituloLibro(rs.getString(3));
                nuevoLibro.setDescripcionLibro(rs.getString(4));
                nuevoLibro.setFechaDePublicacion(rs.getString(5));
                nuevoLibro.setIdiomaLibro(rs.getString(6));
                nuevoLibro.setCostoLibro(rs.getDouble(7));
                nuevoLibro.setTipoLibro(rs.getString(8));
                nuevoLibro.setStockLibro(rs.getInt(9));
                nuevoLibro.setNombreAutor(rs.getString(10));
                nuevoLibro.setApellidoAutor(rs.getString(11));
                nuevoLibro.setNombreEditorial(rs.getString(12));
                nuevoLibro.setNombreCategoria(rs.getString(13));
                listaLibro.add(nuevoLibro);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return listaLibro;
    }

    public List buscar(String texto) {
        List<Libro> listaLibro = new ArrayList<>();
        String sql = "select * from Libro where tituloLibro like '%" + texto + "%'";
        try {
            con = connect.getConnection();
            ps = con.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                Libro nuevoLibro = new Libro();
                nuevoLibro.setIdLibro(rs.getInt(1));
                nuevoLibro.setFotoLibro(rs.getBinaryStream(2));
                nuevoLibro.setTituloLibro(rs.getString(3));
                nuevoLibro.setDescripcionLibro(rs.getString(4));
                nuevoLibro.setFechaDePublicacion(rs.getString(5));
                nuevoLibro.setIdiomaLibro(rs.getString(6));
                nuevoLibro.setCostoLibro(rs.getDouble(7));
                nuevoLibro.setTipoLibro(rs.getString(8));
                nuevoLibro.setStockLibro(rs.getInt(9));
                nuevoLibro.setIdAutor(rs.getInt(10));
                nuevoLibro.setIdEditorial(rs.getInt(11));
                nuevoLibro.setIdCategoria(rs.getInt(12));
                listaLibro.add(nuevoLibro);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return listaLibro;
    }

    public Libro listLibro(int id) {

        Libro lib = new Libro();
        String sql = "select * from Libro where idLibro =" + id;
        try {
            con = connect.getConnection();
            ps = con.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                lib.setTituloLibro(rs.getString(2));
                lib.setDescripcionLibro(rs.getString(3));
                lib.setFechaDePublicacion(rs.getString(4));
                lib.setIdiomaLibro(rs.getString(5));
                lib.setCostoLibro(rs.getDouble(6));
                lib.setTipoLibro(rs.getString(7));
                lib.setStockLibro(rs.getInt(8));
                lib.setIdAutor(rs.getInt(9));
                lib.setIdEditorial(rs.getInt(10));
                lib.setIdCategoria(rs.getInt(11));
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return libro;
    }

    public int agregar(Libro l) {
        String sql = "insert into Libro(fotoLibro, tituloLibro, descripcionLibro, fechaDePublicacion, idiomaLibro, costoLibro, tipoLibro, stockLibro, idAutor, idEditorial, idCategoria)values(?,?,?,?,?,?,?,?,?,?,?)";
        try {

            con = connect.getConnection();
            ps = con.prepareStatement(sql);
            ps.setBlob(1, l.getFotoLibro());
            ps.setString(2, l.getTituloLibro());
            ps.setString(3, l.getDescripcionLibro());
            ps.setString(4, l.getFechaDePublicacion());
            ps.setString(5, l.getIdiomaLibro());
            ps.setDouble(6, l.getCostoLibro());
            ps.setString(7, l.getTipoLibro());
            ps.setInt(8, l.getStockLibro());
            ps.setInt(9, l.getIdAutor());
            ps.setInt(10, l.getIdEditorial());
            ps.setInt(11, l.getIdCategoria());
            ps.executeUpdate();

        } catch (Exception e) {
            e.printStackTrace();
            System.out.println("No se puede agregar el Libro");
        }

        return resp;
    }

    public int actualizar(Libro l) {
        String sql = "Update libro set tituloLibro = ?, descripcionLibro = ?, fechaDePublicacion = ?, idiomaLibro = ?, costoLibro = ?, tipoLibro = ?, stockLibro = ?, idAutor = ?, idEditorial = ?, idCategoria = ? where idLibro = ?";
        try {
            con = connect.getConnection();
            ps = con.prepareStatement(sql);
            ps.setString(1, l.getTituloLibro());
            ps.setString(2, l.getDescripcionLibro());
            ps.setString(3, l.getFechaDePublicacion());
            ps.setString(4, l.getIdiomaLibro());
            ps.setDouble(5, l.getCostoLibro());
            ps.setString(6, l.getTipoLibro());
            ps.setInt(7, l.getStockLibro());
            ps.setInt(8, l.getIdAutor());
            ps.setInt(9, l.getIdEditorial());
            ps.setInt(10, l.getIdCategoria());
            ps.setInt(11, l.getIdLibro());
            ps.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
            System.out.println("No se puede Actualizar");
        }
        return resp;
    }

    public void eliminar(int id) {
        String sql = "delete from Libro where idLibro=" + id;
        try {
            con = connect.getConnection();
            ps = con.prepareStatement(sql);
            ps.executeUpdate();

        } catch (Exception e) {
            e.printStackTrace();
        }
    }

}
