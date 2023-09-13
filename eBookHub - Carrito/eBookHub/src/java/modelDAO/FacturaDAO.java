package modelDAO;

import config.Conexion;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import model.Factura;

public class FacturaDAO {

    Conexion cn = new Conexion();
    Connection con;
    PreparedStatement ps;
    ResultSet rs;
    int resp;
    Factura factura = new Factura();

    public String GenerarSerie() {
        String numeroserie = "";
        String sql = "select max(numeroSerie) from factura";
        try {
            con = cn.getConnection();
            ps = con.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                numeroserie = rs.getString(1);
            }
        } catch (Exception e) {
        }
        return numeroserie;
    }

    public String IdFacturas() {
        String idFactura = "";
        String sql = "Select max(idFactura) from Factura";
        try {
            con = cn.getConnection();
            ps = con.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                idFactura = rs.getString(1);
            }
        } catch (Exception e) {
        }
        return idFactura;
    }

    public int guardarFactura(Factura fac) {
        String sql = "insert into factura (numeroSerie,fechaEmision,horaEmision,montoFactura,estado,idCliente,idSucursal) values(?,?,?,?,?,?,?)";
        try {
            con = cn.getConnection();
            ps = con.prepareStatement(sql);
            ps.setString(1, fac.getNumeroSerie());
            ps.setString(2, fac.getFechaEmision());
            ps.setString(3, fac.getHoraEmision());
            ps.setDouble(4, fac.getMontoFactura());
            ps.setString(5, fac.getEstado());
            ps.setInt(6, fac.getIdCliente());
            ps.setInt(7, fac.getIdSucursal());
            ps.executeUpdate();
            while (rs.next()) {

            }
        } catch (Exception e) {
            e.printStackTrace();
            System.out.println("error en el dao guardarFactura");
        }
        return resp;
    }

    public int guardarDetalleFactura(Factura factura) {
        String sql = "insert into DetalleFactura(cantidad,totalFactura,idFactura,idLibro)values(?,?,?,?)";
        try {
            con = cn.getConnection();
            ps = con.prepareStatement(sql);
            ps.setInt(1, factura.getCantidad());
            ps.setDouble(2, factura.getTotalFactura());
            ps.setInt(3, factura.getIdFactura());
            ps.setInt(4, factura.getIdLibro());
            ps.executeUpdate();
        } catch (Exception e) {
        }
        return resp;
    }

}
