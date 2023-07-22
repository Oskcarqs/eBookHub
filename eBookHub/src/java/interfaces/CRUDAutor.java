package interfaces;

import java.util.List;
import model.Autor;

public interface CRUDAutor {
    
    public List listarAutor();
    public Autor listAutor(int id);
    public boolean addAutor(Autor aut);
    public boolean editAutor(Autor aut);
    public boolean eliminarAutor(int id);

}
