package interfaces;

import java.util.List;
import model.Sucursal;

public interface CRUDSucursal {
    
    public List listarSucursal();
    public Sucursal listSucursal(int idSucursal);
    public boolean addSucursal(Sucursal suc);
    public boolean editSucursal(Sucursal suc);
    public boolean eliminarSucursal(int idSucursal);
    
}
