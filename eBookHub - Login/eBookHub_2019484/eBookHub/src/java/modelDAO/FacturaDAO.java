package modelDAO;

import config.Conexion;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import model.Factura;

public class FacturaDAO {

    Conexion conect = new Conexion();
    Connection con;
    PreparedStatement ps;
    ResultSet rs;
    Factura nFactura = new Factura();

    public List listar() {
        ArrayList<Factura> listaFactura = new ArrayList<>();
        String sql = "Select * from Factura";
        try {
            con = conect.getConnection();
            ps = con.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                Factura nuevaFactura = new Factura();
                nuevaFactura.setIdFactura(rs.getInt("idFactura"));
                nuevaFactura.setFechaEmision(rs.getString("fechaEmision"));
                nuevaFactura.setHoraEmision(rs.getString("horaEmision"));
                nuevaFactura.setTotalFactura(rs.getDouble("totalFactura"));
                nuevaFactura.setIdSucursal(rs.getInt("idSucursal"));
                nuevaFactura.setIdCliente(rs.getInt("idCliente"));
                listaFactura.add(nuevaFactura);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return listaFactura;
    }

    public Factura list(int id) {
        String sql = "Select * from Factura where idFactura=" + id;
        try {
            con = conect.getConnection();
            ps = con.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                nFactura.setIdFactura(rs.getInt("idFactura"));
                nFactura.setFechaEmision(rs.getString("fechaEmision"));
                nFactura.setHoraEmision(rs.getString("horaEmision"));
                nFactura.setTotalFactura(rs.getDouble("totalFactura"));
                nFactura.setIdSucursal(rs.getInt("idSucursal"));
                nFactura.setIdCliente(rs.getInt("idCliente"));
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return nFactura;
    }

    public boolean add(Factura facto) {
        /*Insert into Factura (idFactura, fechaEmision, horaEmision, totalFactura, idSucursal, idCliente)
				values (?, ?, ?, ?, ?, ?);*/
        String sql = "Insert into Factura (fechaEmision, horaEmision, totalFactura, idSucursal, idCliente)\n"
                + "				values (?, ?, ?, ?, ?)";
        try {
            con = conect.getConnection();
            ps = con.prepareStatement(sql);
            ps.setString(1, facto.getFechaEmision());
            ps.setString(2, facto.getHoraEmision());
            ps.setDouble(3, facto.getTotalFactura());
            ps.setInt(4, facto.getIdSucursal());
            ps.setInt(5, facto.getIdCliente());
            ps.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }

        return false;
    }

    public boolean edit(Factura facto) {
        String sql = "update Factura set fechaEmision = ?, horaEmision = ?, totalFactura = ?, idSucursal = ?, idCliente = ? where idFactura = ?";
        try {
            con = conect.getConnection();
            ps = con.prepareStatement(sql);
            ps.setString(1, facto.getFechaEmision());
            ps.setString(2, facto.getHoraEmision());
            ps.setDouble(3, facto.getTotalFactura());
            ps.setInt(4, facto.getIdSucursal());
            ps.setInt(5, facto.getIdCliente());
            ps.setInt(6, facto.getIdFactura());
            ps.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }

        return false;
    }

    public boolean eliminar(int id) {
        String sql = "delete from Factura where idFactura=" + id;
        try {
            con = conect.getConnection();
            ps = con.prepareStatement(sql);
            ps.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return false;
    }

}
