package interfaces;

import java.util.List;
import model.TipoLibro;

public interface CRUDTipoLibro {
    
    public List listarTipoLibro();
    public TipoLibro listTipoLibro(int idTipoLibro);
    public boolean addTipoLibro(TipoLibro tl);
    public boolean editTipoLibro(TipoLibro tl);
    public boolean eliminarTipoLibro(int idTipoLibro);
    
}
