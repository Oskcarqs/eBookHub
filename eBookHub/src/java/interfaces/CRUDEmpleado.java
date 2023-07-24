package interfaces;

import java.util.List;
import model.Empleado;

public interface CRUDEmpleado {
    public List listarEmpleado();
    public Empleado listEmpleado(int id);
    public boolean add(Empleado emp);
    public boolean edit(Empleado emp);
    public boolean eliminar(int id);
}
