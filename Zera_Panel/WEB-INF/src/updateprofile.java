import java.io.IOException;
import java.sql.*;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class updateprofile extends HttpServlet{
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{

	}

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
		String name = request.getParameter("fullname");
		String userid = request.getParameter("username");
		String email = request.getParameter("email");
		String nohp = request.getParameter("nohp");
		String jekel = request.getParameter("jekel");

		String host = "jdbc:mysql://localhost:3306/zera_panel";
		String user = "zera";
		String pwd = "mean123";
		int updateQuery = 0;

		try{
			Class.forName("com.mysql.jdbc.Driver");
			Connection conn = DriverManager.getConnection(host,user,pwd);
			Statement stmt = conn.createStatement();

			String sql;
			PreparedStatement ps = null;
			// Update table user
			sql = "UPDATE user SET fullname=?, email=? WHERE username='"+userid+"'";
			ps = conn.prepareStatement(sql);
			ps.setString(1,name);
			ps.setString(2,email);
			ps.executeUpdate();

			// ps = null; // untuk mereset prepare statement yang telah dipakai
			// Update table profile
			sql = "UPDATE profile SET fullname=?, email=?, nohp=?, jekel=? WHERE username='"+userid+"'";
			ps = conn.prepareStatement(sql);
			ps.setString(1,name);
			ps.setString(2,email);
			ps.setString(3,nohp);
			ps.setString(4,jekel);
			updateQuery = ps.executeUpdate();
			if(updateQuery != 0){
				response.sendRedirect("Panel?action=profile");
			}
		}catch(SQLException e){
			String output = e.toString();
			response.getWriter().print(output);
		}catch(ClassNotFoundException e){
			String output = e.toString();
			response.getWriter().print(output);
		}
	}
}