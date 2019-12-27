import java.io.IOException;
import java.sql.*;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class proseslogin extends HttpServlet{
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{

	}

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
		String userid = request.getParameter("username");
		String pass = request.getParameter("password");

		String host = "jdbc:mysql://localhost:3306/zera_panel";
		String user = "zera";
		String pwd = "mean123";

		HttpSession session = request.getSession(true);
		try{
			Class.forName("com.mysql.jdbc.Driver");
			Connection conn = DriverManager.getConnection(host,user,pwd);
			Statement stmt = conn.createStatement();

			String sql = "SELECT * FROM user where username = '"+userid+"' and password = '"+pass+"'";
			ResultSet rs = stmt.executeQuery(sql);
			if(rs.next()){
				session.setAttribute("userid",userid);
				response.sendRedirect("./Panel");
			}else{
				String output = "Invalid password <br> <a href='Panel?action=login'>Kembali</a>";
				response.setContentType("text/html");
				response.getWriter().print(output);
			}
		}catch(Exception e){
			String output = e.toString();
				response.getWriter().print(output);
		}
	}
}