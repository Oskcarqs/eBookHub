
package modelDAO;

import config.Conexion;
import interfaces.CRUDTipoLibro;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import model.TipoLibro;

public class TipoLibroDAO implements CRUDTipoLibro{
    
    Conexion connect = new Conexion();
    Connection con;
    PreparedStatement ps;
    ResultSet rs;
    TipoLibro nTipoLibro = new TipoLibro();

    @Override
    public List listarTipoLibro() {
        ArrayList<TipoLibro> listarTipoLibro = new ArrayList<>();
        String sql = "select * from tipolibro";
        
        try{
            
            con = connect.getConnection();
            ps = con.prepareStatement(sql);
            rs = ps.executeQuery();
            while(rs.next()){
                
                TipoLibro nuevaTipoLibro = new TipoLibro();
                nuevaTipoLibro.setIdTipoLibro(rs.getInt("idTipoLibro"));
                nuevaTipoLibro.setNombreTipoLibro(rs.getString("nombreTipoLibro")); 
                nuevaTipoLibro.setDescripcionTipoLibro(rs.getString("descripcionTipoLibro"));
                listarTipoLibro.add(nuevaTipoLibro);
                
            }
            
        }catch(Exception e){
            e.printStackTrace();
        }
        
        return listarTipoLibro;
    }

    @Override
    public TipoLibro listTipoLibro(int idTipoLibro) {
        String sql = "select * from TipoLibro where idTipoLibro = " + idTipoLibro;
        
        try{
            
            con = connect.getConnection();
            ps = con.prepareStatement(sql);
            rs = ps.executeQuery();
            while(rs.next()){
                
                nTipoLibro.setIdTipoLibro(rs.getInt("idTipoLibro"));
                nTipoLibro.setNombreTipoLibro(rs.getString("nombreTipoLibro"));
                nTipoLibro.setDescripcionTipoLibro(rs.getString("descripcionTipoLibro"));
                
            }
            
        }catch(Exception e){
            e.printStackTrace();
        }
        
        return nTipoLibro;
    }

    @Override
    public boolean addTipoLibro(TipoLibro tl) {
        String sql = "insert into TipoLibro (nombreTipoLibro, descripcionTipoLibro) values('" + tl.getNombreTipoLibro() + "','"+ tl.getDescripcionTipoLibro() + "')";
        
        try{
            
            con = connect.getConnection();
            ps = con.prepareStatement(sql);
            ps.executeUpdate();
            
        }catch(Exception e){
            e.printStackTrace();
        }
        
        return false;
    }

    @Override
    public boolean editTipoLibro(TipoLibro tl) {
        String sql = "Update TipoLibro set nombreTipoLibro ='" + tl.getNombreTipoLibro()+ "', descripcionTipoLibro ='" + tl.getDescripcionTipoLibro() + "'where idTipoLibro ='" + tl.getIdTipoLibro();
        
        try{
            
            con = connect.getConnection();
            ps = con.prepareStatement(sql);
            ps.executeUpdate();
            
        }catch(Exception e){
            e.printStackTrace();
        }
        
        return false;
    }

    @Override
    public boolean eliminarTipoLibro(int idTipoLibro) {
        String sql = "delete from TipoLibro where idTipoLibro ='" + idTipoLibro;
        try{
            
            con = connect.getConnection();
            ps = con.prepareStatement(sql);
            ps.executeUpdate();
            
        }catch(Exception e){
            e.printStackTrace();
        }
        
        return false;
    }

    
    
    
    
}
