
package interfaces;

import java.util.List;
import model.Sucursal;

public interface CRUD {
    public List listar();
    public Sucursal list(int id);
    public boolean add(Sucursal Suc);
    public boolean edit(Sucursal Suc);
    public boolean eliminar(int id);
}
