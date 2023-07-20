package config;

import java.sql.Connection;
import java.sql.DriverManager;

public class Conexion {

    Connection conexion;

    public  Conexion() {

        try {

            Class.forName("com.mysql.jdbc.Driver");
            conexion = DriverManager.getConnection("jdbc:mysql://localhost:3306/eBookHub?useSSL=false", "admin", "admin");

        } catch (Exception e) {
            e.printStackTrace();
            System.out.println("No se puedo establecer la conexión");
        }
    }
    
    public Connection getConnection(){
        
        return conexion;
        
    }

}
