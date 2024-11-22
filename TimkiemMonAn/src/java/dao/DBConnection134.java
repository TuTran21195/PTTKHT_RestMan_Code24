package dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;


public class DBConnection134 {
    public static Connection getConnection() throws SQLException, ClassNotFoundException {
        Class.forName("com.mysql.cj.jdbc.Driver");
        
        return DriverManager.getConnection("jdbc:mysql://localhost:3306/restaurant134_db", "root", "doanthitramy");
    }
}
