/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package interfaces;

import java.util.List;
import model.Cliente;

/**
 *
 * @author Usuario
 */
public interface CRUDCliente {
    public List listarCliente();
    public Cliente listCliente(int id);
    public boolean add(Cliente c);
    public boolean edit(Cliente c);
    public boolean eliminar(int id);
    
}
