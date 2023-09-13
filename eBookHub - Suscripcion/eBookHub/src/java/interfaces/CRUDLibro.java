/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package interfaces;

import java.util.List;
import model.Libro;

/**
 *
 * @author Ottoniel
 */
public interface CRUDLibro {

    public List listarLibro();

    public Libro listLibro(int id);

    public boolean addLibro(Libro l);

    public boolean editLibro(Libro l);

    public boolean eliminarLibro(int id);

}
