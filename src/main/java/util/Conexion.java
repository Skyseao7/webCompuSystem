package util;

import java.sql.*;

public class Conexion {

    public static Connection getConexion() {
        Connection con = null;
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            String url = "jdbc:mysql://localhost:3306/bd_compusystem";
            String usr = "root";
            String psw = "";
            con = DriverManager.getConnection(url, usr, psw);
            System.out.println("conexion ok");
       } catch (Exception ex) {
            ex.printStackTrace();
        }
        return con;
    }
}
