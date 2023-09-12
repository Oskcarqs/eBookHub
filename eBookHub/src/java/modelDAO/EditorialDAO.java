package modelDAO;

import config.Conexion;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import model.Editorial;

public class EditorialDAO {

    Conexion conect = new Conexion();
    Connection con;
    PreparedStatement ps;
    ResultSet rs;
    Editorial nEditorial = new Editorial();

 
    public List listar() {
        ArrayList<Editorial> listaEditorial = new ArrayList<>();
        String sql = "select * from editorial";
        try {
            con = conect.getConnection();
            ps = con.prepareStatement(sql);
            rs = ps.executeQuery();

            while (rs.next()) {
                Editorial nuevaEditorial = new Editorial();
                nuevaEditorial.setIdEditorial(rs.getInt("idEditorial"));
                nuevaEditorial.setNombreEditorial(rs.getString("nombreEditorial"));
                nuevaEditorial.setDescripcionEditorial(rs.getString("descripcionEditorial"));
                listaEditorial.add(nuevaEditorial);
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return listaEditorial;
    }

    
    public Editorial listEditorial(int id) {
        String sql = "Select * from editorial where idEditorial = " + id;
        try {
            con = conect.getConnection();
            ps = con.prepareStatement(sql);
            rs = ps.executeQuery();

            while (rs.next()) {
                nEditorial.setIdEditorial(rs.getInt("idEditorial"));
                nEditorial.setNombreEditorial(rs.getString("nombreEditorial"));
                nEditorial.setDescripcionEditorial(rs.getString("descripcionEditorial"));
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return nEditorial;
    }

    
    public boolean addEditorial(Editorial edi) {
        String sql = "insert into editorial(nombreEditorial, descripcionEditorial) values(?,?)";
        try {
            con = conect.getConnection();
            ps = con.prepareStatement(sql);
            ps.setString(1, edi.getNombreEditorial());
            ps.setString(2, edi.getDescripcionEditorial());
            ps.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return false;
    }

   
    public boolean editEditorial(Editorial edi) {
        String sql = "update editorial set nombreEditorial=?, descripcionEditorial=? where idEditorial=?";
        //String sql = "update editorial set nombreEditorial = '" + edi.getNombreEditorial() + "', descripcionEditorial = '" + edi.getDescripcionEditorial() + "' where idEditorial = " + edi.getIdEditorial();
        try {
            con = conect.getConnection();
            ps = con.prepareStatement(sql);
            ps.setString(1, edi.getNombreEditorial());
            ps.setString(2, edi.getDescripcionEditorial());
            ps.setInt(3, edi.getIdEditorial());
            ps.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
            System.out.println("No se pudo editar");
        }

        return false;
    }

  
    public boolean eliminarEditorial(int id) {
        String sql = "delete from editorial where idEditorial="+id;
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
