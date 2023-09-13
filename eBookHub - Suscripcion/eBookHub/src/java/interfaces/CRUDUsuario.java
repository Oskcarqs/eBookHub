package interfaces;

import java.util.List;
import model.Usuario;

public interface CRUDUsuario {
    
    public List listarUsuario();
    public Usuario listUsurio(int idUsuario);
    public boolean addUsuario(Usuario u);
    public boolean editUsuario(Usuario u);
    public boolean eliminarUsuario(int idUsuario);
    
}
