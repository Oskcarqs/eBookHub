package modelDAO;

import config.Conexion;
import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.InputStream;
import java.io.OutputStream;
import model.Empleado;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.http.HttpServletResponse;

public class DAOEmpleado {

    Conexion cn = new Conexion();
    Connection con;
    PreparedStatement ps;
    ResultSet rs;
    Empleado nEmpleado = new Empleado();

    public Empleado validar(String usuario, String clave) {

        Empleado empleado = new Empleado();

        String sql = "select * from Empleado where emailUsuario = ? and passwordUsuario = ?";

        try {

            con = cn.getConnection();
            ps = con.prepareStatement(sql);
            ps.setString(1, usuario);
            ps.setString(2, clave);
            rs = ps.executeQuery();

            while (rs.next()) {

                empleado.setIdEmpleado(rs.getInt("idEmpleado"));
                empleado.setPasswordUsuario(rs.getString("passwordUsuario"));
                empleado.setNickNameUsuario(rs.getString("nickNameUsuario"));
                empleado.setNombreEmpleado(rs.getString("nombreEmpleado"));
                empleado.setEmailUsuario(rs.getString("emailUsuario"));

            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return empleado;

    }

    public void listarImg(int id, HttpServletResponse response) {
        String sql = "Select * from Empleado where idEmpleado=" + id;
        InputStream inputStream = null;
        OutputStream outputStream = null;
        BufferedInputStream bufferedInputStream = null;
        BufferedOutputStream bufferedOutputStream = null;
        response.setContentType("img/*");
        try {
            outputStream = response.getOutputStream();
            con = cn.getConnection();
            ps = con.prepareStatement(sql);
            rs = ps.executeQuery();
            if (rs.next()) {
                inputStream = rs.getBinaryStream("imgEmpleado");
            }
            bufferedInputStream = new BufferedInputStream(inputStream);
            bufferedOutputStream = new BufferedOutputStream(outputStream);
            int i = 0;
            while ((i = bufferedInputStream.read()) != -1) {
                bufferedOutputStream.write(i);
            }
        } catch (Exception e) {
        }
    }

    public List listarEmpleado() {
        ArrayList<Empleado> listaEmpleado = new ArrayList<>();
        String sql = "Select * from Empleado";
        try {
            con = cn.getConnection();
            ps = con.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                Empleado nuevoEmpleado = new Empleado();
                nuevoEmpleado.setIdEmpleado(rs.getInt(1));
                nuevoEmpleado.setNombreEmpleado(rs.getString(2));
                nuevoEmpleado.setApellidoEmpleado(rs.getString(3));
                nuevoEmpleado.setPuestoEmpleado(rs.getString(4));
                nuevoEmpleado.setNickNameUsuario(rs.getString(5));
                nuevoEmpleado.setEmailUsuario(rs.getString(6));
                nuevoEmpleado.setPasswordUsuario(rs.getString(7));
                nuevoEmpleado.setImgEmpleado(rs.getBinaryStream(8));
                nuevoEmpleado.setIdSucursal(rs.getInt(9));
                listaEmpleado.add(nuevoEmpleado);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return listaEmpleado;
    }

    public Empleado listEmpleado(int id) {
        String sql = "Select * from Empleado where idEmpleado=" + id;
        try {
            con = cn.getConnection();
            ps = con.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                nEmpleado.setNombreEmpleado(rs.getString(2));
                nEmpleado.setApellidoEmpleado(rs.getString(3));
                nEmpleado.setPuestoEmpleado(rs.getString(4));
                nEmpleado.setNickNameUsuario(rs.getString(5));
                nEmpleado.setEmailUsuario(rs.getString(6));
                nEmpleado.setPasswordUsuario(rs.getString(7));
                nEmpleado.setImgEmpleado(rs.getBinaryStream(8));
                nEmpleado.setIdSucursal(rs.getInt(9));
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return nEmpleado;
    }

    public boolean add(Empleado emp) {
        String sql = "insert into Empleado (nombreEmpleado, apellidoEmpleado, puestoEmpleado, nicknameUsuario, emailUsuario, passwordUsuario, imgEmpleado, idSucursal) values(?,?,?,?,?,?,?,?)";
        try {
            con = cn.getConnection();
            ps = con.prepareStatement(sql);
            ps.setString(1, emp.getNombreEmpleado());
            ps.setString(2, emp.getApellidoEmpleado());
            ps.setString(3, emp.getPuestoEmpleado());
            ps.setString(4, emp.getNickNameUsuario());
            ps.setString(5, emp.getEmailUsuario());
            ps.setString(6, emp.getPasswordUsuario());
            ps.setBlob(7, emp.getImgEmpleado());
            ps.setInt(8, emp.getIdSucursal());
            ps.executeUpdate();
            System.out.println("Se agrego en el dao");
        } catch (Exception e) {
            e.printStackTrace();
        }
        return false;
    }

    public boolean edit(Empleado emp) {
        String sql = "update Empleado set nombreEmpleado=?, apellidoEmpleado=?, puestoEmpleado=?, nicknameUsuario=?, emailUsuario=?,passwordUsuario=?, imgEmpleado=?, idSucursal=? where idEmpleado=?";
        try {
            con = cn.getConnection();
            ps = con.prepareStatement(sql);
            ps.setString(1, emp.getNombreEmpleado());
            ps.setString(2, emp.getApellidoEmpleado());
            ps.setString(3, emp.getPuestoEmpleado());
            ps.setString(4, emp.getNickNameUsuario());
            ps.setString(5, emp.getEmailUsuario());
            ps.setString(6, emp.getPasswordUsuario());
            ps.setBlob(7, emp.getImgEmpleado());
            ps.setInt(8, emp.getIdSucursal());
            ps.setInt(9, emp.getIdEmpleado());
            ps.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return false;
    }

    public boolean eliminar(int id) {
        String sql = "delete from Empleado where idEmpleado=" + id;
        try {
            con = cn.getConnection();
            ps = con.prepareStatement(sql);
            ps.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return false;
    }

}
