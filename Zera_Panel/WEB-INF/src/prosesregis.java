import java.io.IOException;
import java.sql.*;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class prosesregis extends HttpServlet{
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{

	}

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
		String name = request.getParameter("fullname");
		String email = request.getParameter("email");
		String userid = request.getParameter("username");
		String pass = request.getParameter("password");
		String confpass = request.getParameter("confpassword");

		String host = "jdbc:mysql://localhost:3306/zera_panel";
		String user = "zera";
		String pwd = "mean123";
		int updateQuery = 0;

		if(name.equals("") || email.equals("") || userid.equals("") || pass.equals("") || confpass.equals("")){ // Cek jika ada field yang kosong
			String output = "Isi yang betul COK!!, masih ada yang kosong noh";
			output += "<br> <a href='Panel?action=registration'>Kembali</a>";
			response.setContentType("text/html");
			response.getWriter().print(output);
		}else if(pass.equals(confpass)){ // Cek password pada kedua password sama
			try{
				Class.forName("com.mysql.jdbc.Driver");
				Connection conn = DriverManager.getConnection(host,user,pwd);
				Statement stmt = conn.createStatement();

				String sql;
				// Insert table user
				sql = "INSERT INTO user (fullname,username,password,email,regdate) values (?,?,?,?,curdate())";
				PreparedStatement psUser = conn.prepareStatement(sql);
				psUser.setString(1,name);
				psUser.setString(2,userid);
				psUser.setString(3,pass);
				psUser.setString(4,email);
				psUser.executeUpdate();

				// Insert table profile
				sql = "INSERT INTO profile (username,fullname,email,saldo) values (?,?,?,0)";
				PreparedStatement psProfile = conn.prepareStatement(sql);
				psProfile.setString(1,userid);
				psProfile.setString(2,name);
				psProfile.setString(3,email);
				updateQuery = psProfile.executeUpdate();
				if(updateQuery != 0){
					response.sendRedirect("Panel?action=login");
				}
			}catch(SQLException e){ // jika ada username yang sama dan jika tidak bisa konek ke database
				// String output = e.toString();
				// response.getWriter().print(output);
				String output = "Username sudah ada, cari yang lain COK!!!";
				output += "<br> <a href='Panel?action=registration'>Kembali</a>";
				response.setContentType("text/html");
				response.getWriter().print(output);

			}catch(ClassNotFoundException e){ // jika kelas com.mysql.jdbc.Driver tidak kedetek
				String output = e.toString();
				response.getWriter().print(output);
			}
		}else{
			String output = "Password tidak sama COK!!";
			output += "<br> <a href='Panel?action=registration'>Kembali</a>";
			response.setContentType("text/html");
			response.getWriter().print(output);
		}
	}
}