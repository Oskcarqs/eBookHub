package modelDAO;

import config.Conexion;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import model.DetalleFactura;

public class DetalleFacturaDAO {

    Conexion connect = new Conexion();
    Connection con;
    PreparedStatement ps;
    ResultSet rs;
    DetalleFactura nDetalleFactura = new DetalleFactura();

    public List listarDetalleFactura() {
        ArrayList<DetalleFactura> listarDetalleFactura = new ArrayList<>();
        String sql = "Select * from DetalleFactura";
        try {
            con = connect.getConnection();
            ps = con.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                DetalleFactura nDetalleFactura = new DetalleFactura();
                nDetalleFactura.setIdDetalleFactura(rs.getInt("IdDetalleFactura"));
                nDetalleFactura.setIdFactura(rs.getInt("IdFactura"));
                nDetalleFactura.setIdServicio(rs.getInt("IdServicio"));
                listarDetalleFactura.add(nDetalleFactura);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return listarDetalleFactura;
    }

    public DetalleFactura list(int id) {
        String sql = "Select * from Factura where idDetalleFactura=" + id;
        try {
            con = connect.getConnection();
            ps = con.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                nDetalleFactura.setIdDetalleFactura(rs.getInt("IdDetalleFactura"));
                nDetalleFactura.setIdFactura(rs.getInt("idFactura"));
                nDetalleFactura.setIdServicio(rs.getInt("IdServicio"));
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return nDetalleFactura;
    }

    public boolean add(DetalleFactura facto) {
        /*Insert into Factura (idFactura, fechaEmision, horaEmision, totalFactura, idSucursal, idCliente)
				values (?, ?, ?, ?, ?, ?);*/
        String sql = "Insert into DetalleFactura (idDetalleFactura, idFactura, idServicio)\n"
                + "				values (?, ?, ?)";
        try {
            con = connect.getConnection();
            ps = con.prepareStatement(sql);
            ps.setInt(1, facto.getIdDetalleFactura());
            ps.setInt(2, facto.getIdFactura());
            ps.setInt(3, facto.getIdServicio());
            ps.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }

        return false;
    }

    public boolean edit(DetalleFactura facto) {
        String sql = "update DetalleFactura set idDetalleFactura = ?, idFactura = ?, idServicio = ?";
        try {
            con = connect.getConnection();
            ps = con.prepareStatement(sql);
            ps.setInt(1, facto.getIdDetalleFactura());
            ps.setInt(2, facto.getIdFactura());
            ps.setInt(3, facto.getIdServicio());
            ps.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }

        return false;
    }

    public boolean eliminar(int id) {
        String sql = "delete from DetalleFactura where idDetalleFactura=" + id;
        try {
            con = connect.getConnection();
            ps = con.prepareStatement(sql);
            ps.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return false;
    }

}
