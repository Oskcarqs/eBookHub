package interfaces;

import java.util.List;
import model.DetalleFactura;

public interface CRUDDetalleFactura {
    
    public List listarDetalleFactura();
    public DetalleFactura listDetalleFactura(int idDetalleFactura);
    public boolean addDetalleFactura(DetalleFactura df);
    public boolean editDetalleFactura(DetalleFactura df);
    public boolean eliminarDetalleFactura(int idDetalleFactura);
    
}
