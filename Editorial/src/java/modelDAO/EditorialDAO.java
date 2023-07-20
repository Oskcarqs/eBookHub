package modelDAO;

import Interfaces.CRUDEditorial;
import configuration.Conexion;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import model.Editorial;

public class EditorialDAO implements CRUDEditorial {
    
    Conexion conect = new Conexion();
    Connection con;
    PreparedStatement ps;
    ResultSet rs;
    Editorial nEditorial = new Editorial();
    
    @Override
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
    
    @Override
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

    @Override
    public boolean addEditorial(Editorial edi) {
        String sql = "insert into editorial(nombreEditorial, descripcionEditorial) values('"+ edi.getNombreEditorial()+ "','" + edi.getDescripcionEditorial()+ "')";
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
    public boolean editEditorial(Editorial edi) {
        String sql = "update editorial set nombreEditorial = '" + edi.getNombreEditorial()+ "', descripcionEditorial = '" + edi.getDescripcionEditorial()+ "' where idEditorial = " + edi.getIdEditorial();
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
    public boolean eliminarEditorial(int id) {
       String sql = "delete from editorial where idEditorial";
        try {
            con = conect.getConnection();
            ps = con.prepareStatement(sql);
            ps.executeQuery();
        } catch (Exception e) {
            e.printStackTrace();
        }
        
        return false; 
    }
 
}
