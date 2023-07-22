package modelDAO;

import config.Conexion;
import interfaces.CRUDUsuario;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import model.Usuario;

public class UsuarioDAO implements CRUDUsuario{

    Conexion connect = new Conexion();
    Connection con;
    PreparedStatement ps;
    ResultSet rs;
    Usuario nUsuario = new Usuario();

    public Usuario validar(String nickNameUsuario, String passwordUsuario) {
        // Instanciar un objeto tipo empleado
        Usuario usuario = new Usuario();

        // Agregar una variable de tipo String para la consulta
        String sql = "select * from Usuario where nickNameUsuario = ? and passwordUsuario = ?";

        try {
            con = connect.getConnection();
            ps = con.prepareStatement(sql);
            ps.setString(1, nickNameUsuario);
            ps.setString(2, passwordUsuario);
            rs = ps.executeQuery();
            while(rs.next()){
                usuario.setIdUsuario(rs.getInt("idUsuario"));
                usuario.setNickNameUsuario(rs.getString("nickNameUsuario"));
                usuario.setEmailUsuario(rs.getString("emailUsuario"));
                usuario.setPasswordUsuario(rs.getString("passwordUsuario"));
                usuario.setIdCliente(rs.getInt("idCliente"));
            }
        } catch (Exception e) {
            e.printStackTrace();
        }

        return usuario; // Empleado encontrado
    }

    @Override
    public List listarUsuario() {
        ArrayList<Usuario> listarUsuario = new ArrayList<>();
        String sql = "select * from Usuario";
        
        try{
            
            con = connect.getConnection();
            ps = con.prepareStatement(sql);
            rs = ps.executeQuery();
            while(rs.next()){
                
                Usuario nuevaUsuario = new Usuario();
                nuevaUsuario.setIdUsuario(rs.getInt("idUsuario"));
                nuevaUsuario.setNickNameUsuario(rs.getString("nickNameUsuario"));
                nuevaUsuario.setEmailUsuario(rs.getString("emailUsuario"));
                nuevaUsuario.setPasswordUsuario(rs.getString("passwordUsuario"));
                nuevaUsuario.setIdCliente(rs.getInt("idCliente"));
                listarUsuario.add(nuevaUsuario);
                
            }
            
        }catch(Exception e){
            e.printStackTrace();
        }
        
        return listarUsuario;
    }

    @Override
    public Usuario listUsurio(int idUsuario) {
        String sql = "select * from Usuario where IdUsuario = " + idUsuario;
        
        try{
            
            con = connect.getConnection();
            ps = con.prepareStatement(sql);
            rs = ps.executeQuery();
            while(rs.next()){
                
                nUsuario.setIdUsuario(rs.getInt("idUsuario"));
                nUsuario.setNickNameUsuario(rs.getString("nickNameUsuario"));
                nUsuario.setEmailUsuario(rs.getString("emailUsuario"));
                nUsuario.setPasswordUsuario(rs.getString("passwordUsuario"));
                nUsuario.setIdCliente(rs.getInt("idCliente"));
                
            }
            
        }catch(Exception e){
            e.printStackTrace();
        }
        
        return nUsuario;
        
    }

    @Override
    public boolean addUsuario(Usuario u) {
        
        String sql = "Insert into Usuario(nickNameUsuario, emailUsuario, passwordUsuario, idCliente) values('" + u.getNickNameUsuario() + "','" + u.getEmailUsuario() + "','" + u.getPasswordUsuario() + "','" + u.getIdCliente() + "')";
        
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
    public boolean editUsuario(Usuario u) {
        
        String sql = "Update Usuario set nickNameUsuario ='" + u.getNickNameUsuario() + "' emailUsuario ='" + u.getEmailUsuario() + "', passwordUsuario='" + u.getPasswordUsuario() + "', idCliente='" + u.getIdCliente() + "' where idUsuario =" + u.getIdUsuario();
        
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
    public boolean eliminarUsuario(int idUsuario) {
        
        String sql = "delete from Usuario where idUsuario =" + idUsuario;
        
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
