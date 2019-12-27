package com.zukronalviandy.model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;

public class KoneksiDB{
	private Connection conn;
	private Statement stmt;

	public void koneksi(){
		try{
			Class.forName("com.mysql.cj.jdbc.Driver");
			conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/mydb","zera","mean123");
			stmt = conn.createStatement();

		}catch(Exception e){
			System.out.println(e);
		}
	}

	public void diskonek(ResultSet rs){
		try{
			if(rs != null){
				rs.close();
			}
			stmt.close();
			conn.close();
		}catch(Exception e){
			System.out.println(e);
		}
	}

	public ResultSet ambilData(String sql){
		ResultSet rs = null;
		try{
			koneksi();
			rs = stmt.executeQuery(sql);
		}catch(Exception e){
			System.out.println(e);
		}
		return rs;
	}
}