
package modelDAO;


import config.Conexion;
import model.Empleado;
import interfaces.CRUDEmpleado;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class DAOEmpleado implements CRUDEmpleado{
    Conexion conect = new Conexion();
    Connection con;
    PreparedStatement ps;
    ResultSet rs;
    Empleado nEmpleado = new Empleado();
    
    @Override
    public List listarEmpleado() {
        ArrayList<Empleado> listaEmpleado = new ArrayList<>();
        String sql = "Select * from Empleado";
        try {
            con = conect.getConnection();
            ps = con.prepareStatement(sql);
            rs = ps.executeQuery();
            while(rs.next()){
                Empleado nuevoEmpleado = new Empleado();
                nuevoEmpleado.setIdEmpleado(rs.getInt("idEmpleado"));
                nuevoEmpleado.setNombreEmpleado(rs.getString("nombreEmpleado"));
                nuevoEmpleado.setApellidoEmpleado(rs.getString("apellidoEmpleado"));
                nuevoEmpleado.setPuestoEmpleado(rs.getString("puestoEmpleado"));
                nuevoEmpleado.setIdSucursal(rs.getInt("idSucursal"));
                listaEmpleado.add(nuevoEmpleado);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return listaEmpleado;
    }

    @Override
    public Empleado listEmpleado(int id) {
        String sql = "Select * from Empleado where idEmpleado="+ id;
        try {
            con = conect.getConnection();
            ps = con.prepareStatement(sql);
            rs = ps.executeQuery();
            while(rs.next()){
                nEmpleado.setIdEmpleado(rs.getInt("idEmpleado"));
                nEmpleado.setNombreEmpleado(rs.getString("nombreEmpleado"));
                nEmpleado.setApellidoEmpleado(rs.getString("apellidoEmpleado"));
                nEmpleado.setPuestoEmpleado(rs.getString("puestoEmpleado"));
                nEmpleado.setIdSucursal(rs.getInt("idSucursal"));
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return nEmpleado;
    }

    @Override
    public boolean add(Empleado emp) {
        String sql = "Insert into Empleado (nombreEmpleado, apellidoEmpleado, puestoEmpleado, idSucursal) values('"+emp.getNombreEmpleado()+"','"+emp.getApellidoEmpleado()+"','"+emp.getPuestoEmpleado()+"','"+emp.getIdSucursal()+"')";
        try {
            con = conect.getConnection();
            ps = con.prepareStatement(sql);
            ps.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return false;
    }

    @Override
    public boolean edit(Empleado emp) {
        String sql = "update Empleado set nombreEmpleado = '"+emp.getNombreEmpleado()+"',apellidoEmpleado = '"+emp.getApellidoEmpleado()+"',puestoEmpleado= '"+emp.getPuestoEmpleado()+"',idSucursal= '"+emp.getIdSucursal() + "' where idSucursal= "+ emp.getIdEmpleado();
        try {
            con = conect.getConnection();
            ps = con.prepareStatement(sql);
            ps.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return false;
    }

    @Override
    public boolean eliminar(int id) {
        String sql = "delete from Empleado where idEmpleado="+ id;
        try{
            con = conect.getConnection();
            ps = con.prepareStatement(sql);
            ps.executeUpdate();
        }catch(Exception e){
            e.printStackTrace();
        }
        return false;
    }
    
}
