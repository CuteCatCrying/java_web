package DAO;

import java.sql.*;
import java.util.List;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;
import Bean.Buku;
import myUtil.ConnectionDB;

public class BukuDao{
	private Connection conn;

	public BukuDao(){
		conn = ConnectionDB.getConnectionDB();
	}

	public void addBuku(Buku buku){
		try{
			String insertQuery = "Insert into buku (id,judul,pengarang,penerbit,jumlah) values (?,?,?,?,?)";

			PreparedStatement ps = conn.prepareStatement(insertQuery);
			ps.setInt(1, buku.getBukuID());
			ps.setString(2, buku.getJudul());
			ps.setString(3, buku.getPengarang());
			ps.setString(4, buku.getPenerbit());
			ps.setInt(5, buku.getJumlah());

			ps.executeUpdate();
		}catch(SQLException e){
			System.out.println(e);
		}
	}

	public void deleteBukuById(int bukuID){
		try{
			String deleteQuery = "delete from buku where id = ?";

			PreparedStatement ps = conn.prepareStatement(deleteQuery);
			ps.setInt(1, bukuID);

			ps.executeUpdate();
		}catch(SQLException e){
			System.out.println(e);
		}
	}

	public Buku findBukuById(int bukuID){
		Buku buku = new Buku();

		try{
			String query = "Select * from buku where id = ?";

			PreparedStatement ps = conn.prepareStatement(query);
			ps.setInt(1, bukuID);

			ResultSet rs = ps.executeQuery();
			while(rs.next()){
				buku.setBukuID(bukuID);
				buku.setJudul(rs.getString(2));
				buku.setPengarang(rs.getString(3));
				buku.setPenerbit(rs.getString(4));
				buku.setJumlah(rs.getInt(5));
			}
		}catch(SQLException e){
			System.out.println(e);
		}
		return buku;
	}

	public void editBuku(Buku buku){
		try{
			String editQuery = "Update buku set judul = ?, pengarang = ?, penerbit = ?, jumlah = ? where id = ?";

			PreparedStatement ps = conn.prepareStatement(editQuery);
			ps.setString(1, buku.getJudul());
			ps.setString(2, buku.getPengarang());
			ps.setString(3, buku.getPenerbit());
			ps.setInt(4, buku.getJumlah());
			ps.setInt(5, buku.getBukuID());

			ps.executeUpdate();
		}catch(SQLException e){
			System.out.println(e);
		}
	}

	public List retrieveBuku(){
		List sbuku = new ArrayList();
		try{
			String retrieveQuery = "Select * from buku";
			Statement stmt = conn.createStatement();
			ResultSet rs = stmt.executeQuery(retrieveQuery);
			while(rs.next()){
				Buku buku = new Buku();
				buku.setBukuID(rs.getInt(1));
				buku.setJudul(rs.getString(2));
				buku.setPengarang(rs.getString(3));
				buku.setPenerbit(rs.getString(4));
				buku.setJumlah(rs.getInt(5));
				sbuku.add(buku);
			}
		}catch(SQLException e){
			Logger.getLogger(BukuDao.class.getName()).log(Level.SEVERE, null, e);
		}
		return sbuku;
	}
}