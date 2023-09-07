/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package config;

/**
 *
 * @author Kaled Rodriguez
 */
import java.sql.Connection;
import java.sql.DriverManager;

public class Conexion {

    Connection conexion;

    public Conexion() {
        try {
            Class.forName("com.mysql.jdbc.Driver");
            conexion = DriverManager.getConnection("jdbc:mysql://localhost:3306/eBookHub?useSSL=false", "root", "admin");
        } catch (Exception e) {
            e.printStackTrace();
            System.out.println("No connection" + e.getMessage());
        }

    }

    public Connection getConnection() {
        return conexion;
    }
}
