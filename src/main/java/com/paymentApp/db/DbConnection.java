package com.paymentApp.db;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DbConnection {
    public static Connection DbConnect() throws ClassNotFoundException, SQLException
    {
    	Class.forName("com.mysql.cj.jdbc.Driver");
    	 Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/tech_m","root" , "Lokesh@8125");
    			return con;
    }
}
