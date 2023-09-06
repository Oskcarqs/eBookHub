
package modelDAO;

import config.Conexion;
import interfaces.CRUDFactura;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import model.Factura;


public class FacturaDAO implements CRUDFactura{
    Conexion conect = new Conexion();
    Connection con;
    PreparedStatement ps;
    ResultSet rs;
    Factura nFactura = new Factura();

    @Override
    public List listar() {
        ArrayList<Factura> listaFactura = new ArrayList<>();
        String sql = "Select * from Factura";
        try{
            con = conect.getConnection();
            ps = con.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()){
                Factura nuevaFactura = new Factura ();
                nuevaFactura.setIdFactura(rs.getInt("idFactura"));
                nuevaFactura.setFechaEmision(rs.getString("fechaEmision"));
                nuevaFactura.setHoraEmision(rs.getString("horaEmision"));
                nuevaFactura.setTotalFactura(rs.getDouble("totalFactura"));
                nuevaFactura.setIdSucursal(rs.getInt("idSucursal"));
                nuevaFactura.setIdUsuario(rs.getInt("idUsuario"));
                listaFactura.add(nuevaFactura);
            }
        }catch(Exception e){
            e.printStackTrace();
        }
        return listaFactura;
    }

    @Override
    public Factura list(int id) {
        String sql = "Select * from Factura where idFactura="+ id;
        try {
            con = conect.getConnection();
            ps = con.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()){
                nFactura.setIdFactura(rs.getInt("idFactura"));
                nFactura.setFechaEmision(rs.getString("fechaEmision"));
                nFactura.setHoraEmision(rs.getString("horaEmision"));
                nFactura.setTotalFactura(rs.getDouble("totalFactura"));
                nFactura.setIdSucursal(rs.getInt("idSucursal"));
                nFactura.setIdUsuario(rs.getInt("idUsuario"));
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return nFactura;
    }

    @Override
    public boolean add(Factura facto) {
        /*Insert into Factura (idFactura, fechaEmision, horaEmision, totalFactura, idSucursal, idUsuario)
				values (idFactura, fechaEmision, horaEmision, totalFactura, idSucursal, idUsuario);*/
        String sql = "Insert into Factura (fechaEmision, horaEmision, totalFactura, idSucursal, idUsuario) values('"+facto.getFechaEmision()+"','"+facto.getHoraEmision()+"','"+facto.getTotalFactura()+"','"+facto.getIdSucursal()+"','"+facto.getIdUsuario()+"')" ;
        try{
            con = conect.getConnection();
            ps = con.prepareStatement(sql);
            ps.executeUpdate();
        }catch(Exception e){
            e.printStackTrace();
        }
        
        return false;
    }

    @Override
    public boolean edit(Factura facto) {
        String sql = "update Factura set fechaEmision = '"+facto.getFechaEmision()+"',horaEmision = '"+facto.getHoraEmision()+"',totalFactura= '"+facto.getTotalFactura()+"',idSucursal= '"+facto.getIdSucursal() + "', idUsuario= '"+facto.getIdUsuario()+"' where idSucursal= "+ facto.getIdFactura();
        try{
            con = conect.getConnection();
            ps = con.prepareStatement(sql);
            ps.executeUpdate();
        }catch(Exception e){
            e.printStackTrace();
        }
        
        
        return false;
    }

    @Override
    public boolean eliminar(int id) {
        String sql = "delete from Factura where idFactura="+ id;
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
