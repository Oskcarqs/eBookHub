package interfaces;

import java.util.List;
import model.Categoria;

public interface CRUDCategoria {
    
    public List listarCategoria();
    public Categoria listCategoria(int id);
    public boolean addCategoria(Categoria cate);
    public boolean editCategoria(Categoria cate);
    public boolean eliminarCategoria(int id);

}
