package modelDAO;

import config.Conexion;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import model.TipoSuscripcion;

public class TipoSuscripcionDAO  {
    Conexion conect = new Conexion();
    Connection con;
    PreparedStatement ps;
    ResultSet rs;
    TipoSuscripcion nTipoSuscripcion = new TipoSuscripcion();

    public List listarTipoSuscripcion() {
        ArrayList<TipoSuscripcion> listaTipoSuscripcion = new ArrayList<>();
        String sql = "Select * from TipoSuscripcion";
        try {
            con = conect.getConnection();
            ps = con.prepareStatement(sql);
            rs = ps.executeQuery();
            while(rs.next()){
                TipoSuscripcion nuevoTipoSuscripcion = new TipoSuscripcion ();
                nuevoTipoSuscripcion.setIdTipoSuscripcion(rs.getInt("idTipoSuscripcion"));
                nuevoTipoSuscripcion.setNombreTipoSuscripcion(rs.getString("nombreTipoSuscripcion"));
                nuevoTipoSuscripcion.setDescripcionTipoSuscripcion(rs.getString("descripcionTipoSuscripcion"));
                nuevoTipoSuscripcion.setPrecioTipoSuscripcion(rs.getDouble("precioTipoSuscripcion"));
                listaTipoSuscripcion.add(nuevoTipoSuscripcion);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return listaTipoSuscripcion;
    }

    public TipoSuscripcion list(int id) {
        String sql = "Select * from TipoSuscripcion where idTipoSuscripcion="+ id;
        try {
            con = conect.getConnection();
            ps = con.prepareStatement(sql);
            rs = ps.executeQuery();
            while(rs.next()){
                nTipoSuscripcion.setIdTipoSuscripcion(rs.getInt("idTipoSuscripcion"));
                nTipoSuscripcion.setNombreTipoSuscripcion(rs.getString("nombreTipoSuscripcion"));
                nTipoSuscripcion.setDescripcionTipoSuscripcion(rs.getString("descripcionTipoSuscripcion"));
                nTipoSuscripcion.setPrecioTipoSuscripcion(rs.getDouble("precioTipoSuscripcion"));
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return nTipoSuscripcion;
    }

    public boolean add(TipoSuscripcion tsub) {
        String sql = "Insert into TipoSuscripcion (nombreTipoSuscripcion, descripcionTipoSuscripcion, precioTipoSuscripcion) values('"+ tsub.getNombreTipoSuscripcion() +"','"+tsub.getDescripcionTipoSuscripcion()+"','"+tsub.getPrecioTipoSuscripcion()+"')";
        try {
            con = conect.getConnection();
            ps = con.prepareStatement(sql);
            ps.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return false;
    }

    
    public boolean edit(TipoSuscripcion tsub) {
        String sql = "update TipoSuscripcion set nombreTipoSuscripcion = '"
                +tsub.getNombreTipoSuscripcion()+"',descripcionTipoSuscripcion = '"
                +tsub.getDescripcionTipoSuscripcion()+"',precioTipoSuscripcion= '"+tsub.getPrecioTipoSuscripcion()+
                "' where idTipoSuscripcion= "+ tsub.getIdTipoSuscripcion();
        try {
            con = conect.getConnection();
            ps = con.prepareStatement(sql);
            ps.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return false;
    }

    public boolean eliminar(int id) {
        String sql = "delete from TipoSuscripcion where idTipoSuscripcion="+ id;
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