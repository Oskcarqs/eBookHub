/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package interfaces;

import java.util.List;
import model.FacturaSuscripcion;

/**
 *
 * @author Usuario
 */
public interface CRUDFacturaSuscripcion {
    public List listarFacturaSuscripcion();
    public FacturaSuscripcion listFacturaSuscripcion(int id);
    public boolean add(FacturaSuscripcion fs);
    public boolean edit(FacturaSuscripcion fs);
    public boolean eliminar(int id);
    
}
