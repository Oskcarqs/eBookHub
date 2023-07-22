
package interfaces;

import java.util.List;
import model.Factura;


public interface CRUDFactura {
    public List listar();
    public Factura list(int id);
    public boolean add (Factura facto);
    public boolean edit(Factura facto);
    public boolean eliminar(int id);
}
