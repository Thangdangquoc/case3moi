package com.example.demo12.connection;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class MyConnection {
    private final String DB_URL = "jdbc:mysql://localhost:3306/case_study?useSSL=false";
    private final String DB_USERNAME = "root";
    private  final  String DB_PASSWORD = "123456";

    private Connection connection;

    public Connection getInstance() {
        if (connection != null) {
            return connection;
        }
        return getConnection();
    }
    public Connection getConnection(){
        Connection connection = null;
        try {
            Class.forName("com.mysql.jdbc.Driver");
            connection = DriverManager.getConnection(DB_URL, DB_USERNAME, DB_PASSWORD);

        }catch (ClassNotFoundException | SQLException e){
            System.err.println(e.getMessage());
        }
        return connection;
    }
}
