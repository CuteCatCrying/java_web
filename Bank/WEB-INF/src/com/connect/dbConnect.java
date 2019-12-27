package com.connect;

import java.sql.Connection;
import java.sql.DriverManager;

public class dbConnect{
	public static Connection getConnect(){
		try{
			Class.forName("com.mysql.cj.jdbc.Driver");
			Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/si_bank","zera","mean123");
			return conn;
		}catch(Exception e){
			return null;
		}
	}
}