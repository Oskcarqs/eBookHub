package Interfaces;

import java.util.List;
import model.Editorial;

public interface CRUDEditorial {
    
    public List listar();
    public Editorial listEditorial(int id);
    public boolean addEditorial(Editorial edi);
    public boolean editEditorial(Editorial edi);
    public boolean eliminarEditorial(int id);
}
