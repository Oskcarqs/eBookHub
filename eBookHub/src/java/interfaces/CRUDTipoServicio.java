/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package interfaces;

import java.util.List;
import model.TipoServicio;

/**
 *
 * @author Kaled Rodriguez
 */
public interface CRUDTipoServicio {
     public List listar();

    public TipoServicio list(int id);

    public boolean add(TipoServicio tserv);

    public boolean edit(TipoServicio tserv);

    public boolean eliminar(int id);
}
