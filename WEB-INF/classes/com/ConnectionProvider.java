package com;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class ConnectionProvider {
    public static Connection getConnection() throws SQLException, ClassNotFoundException {
        String driver = "oracle.jdbc.driver.OracleDriver";
        String url = "jdbc:oracle:thin:@localhost:1521:XE";
        String username = "hrm";
        String password = "manager";
        Connection connection;
        Class.forName(driver);
        connection = DriverManager.getConnection(url, username, password);
        return connection;
    }
}