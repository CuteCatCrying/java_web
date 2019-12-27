package myUtil;

import java.sql.*;

public class ConnectionDB{
	private static Connection conn = null;

	public static Connection getConnectionDB(){
		if(conn != null){
			return conn;
		}else{
			try{
				String driver = "com.mysql.jdbc.Driver";
				String host = "jdbc:mysql://localhost:3306/si_perpustakaan";
				String user = "zera";
				String pwd = "mean123";

				Class.forName(driver);
				conn = DriverManager.getConnection(host,user,pwd);
			}catch(Exception e){
				System.out.println(e);
			}
			return conn;
		}
	}
}