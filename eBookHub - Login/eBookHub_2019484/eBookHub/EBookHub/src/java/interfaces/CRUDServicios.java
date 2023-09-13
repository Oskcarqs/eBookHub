/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package interfaces;

import java.util.List;
import model.Servicio;

/**
 *
 * @author Kaled Rodriguez
 */
public interface CRUDServicios {

    public List listar();

    public Servicio list(int id);

    public boolean add(Servicio serv);

    public boolean edit(Servicio serv);

    public boolean eliminar(int id);

}
