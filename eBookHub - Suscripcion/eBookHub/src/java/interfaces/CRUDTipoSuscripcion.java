package interfaces;

import java.util.List;
import model.TipoSuscripcion;

public interface CRUDTipoSuscripcion {
    public List listarTipoSuscripcion();
    public TipoSuscripcion list(int id);
    public boolean add (TipoSuscripcion tsub);
    public boolean edit(TipoSuscripcion tsub);
    public boolean eliminar(int id);
    
    
}
