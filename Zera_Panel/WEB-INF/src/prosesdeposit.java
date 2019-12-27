import java.io.IOException;
import java.sql.*;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class prosesdeposit extends HttpServlet{
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{

	}

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
		HttpSession session = request.getSession(true);

		String sumberdana = request.getParameter("sumberdana");
		String norek = request.getParameter("norek");
		String jumlahdana = request.getParameter("jumlahdana");

		String host = "jdbc:mysql://localhost:3306/zera_panel";
		String user = "zera";
		String pwd = "mean123";

		// Jika user sudah login
		if(!((session.getAttribute("userid") == null) || (session.getAttribute("userid") == ""))){
			try{
				PreparedStatement ps = null;
				String sql = "";
				String saldoUser = "";
				int totalDepo;

				Class.forName("com.mysql.jdbc.Driver");
				Connection conn = DriverManager.getConnection(host,user,pwd);
				String username = session.getAttribute("userid").toString(); //mendapatkan username yang sedang login

				Statement stmt = conn.createStatement();
				sql = "SELECT * FROM profile where username = '"+username+"'";
				ResultSet rs = stmt.executeQuery(sql);
				while(rs.next()){
					saldoUser = rs.getString("saldo");
				}

				totalDepo = Integer.valueOf(saldoUser) + Integer.valueOf(jumlahdana); // totalkan saldo user dengan dana depo, agar kalau langsung diupdate memakai dana depo,, nanti akan tereplace
				if(sumberdana.equalsIgnoreCase("bank")){
					if(norek == "" || norek == null || jumlahdana == "" || jumlahdana == null){
						response.sendRedirect("Panel?action=deposit");
					}else{
						sql = "UPDATE profile SET saldo=? where username = '"+username+"'";
						ps = conn.prepareStatement(sql);
						ps.setString(1,String.valueOf(totalDepo)); // harus dikonver ke string, karena query hanya menerima string bukan integer
						ps.executeUpdate();
						response.sendRedirect("Panel?action=deposit");
					}
				}else if(sumberdana.equalsIgnoreCase("ovo")){
					if(jumlahdana == "" || jumlahdana == null){
						response.sendRedirect("Panel?action=deposit");
					}else{
						sql = "UPDATE profile SET saldo=? where username = '"+username+"'";
						ps = conn.prepareStatement(sql);
						ps.setString(1,String.valueOf(totalDepo)); // harus dikonver ke string, karena query hanya menerima string bukan integer
						ps.executeUpdate();
						response.sendRedirect("Panel?action=deposit");
					}
				}else if(sumberdana.equalsIgnoreCase("gopay")){
					if(jumlahdana == "" || jumlahdana == null){
						response.sendRedirect("Panel?action=deposit");
					}else{
						sql = "UPDATE profile SET saldo=? where username = '"+username+"'";
						ps = conn.prepareStatement(sql);
						ps.setString(1,String.valueOf(totalDepo)); // harus dikonver ke string, karena query hanya menerima string bukan integer
						ps.executeUpdate();
						response.sendRedirect("Panel?action=deposit");
					}
				}else{
					response.sendRedirect("Panel?action=deposit");
				}
			}catch(Exception ex){
				String output = ex.toString();
				output += "<br> <a href='Panel?action=deposit'>Kembali</a>";
				response.setContentType("text/html");
				response.getWriter().print(output);
			}
		}else{ // jika user belom login
			String output = "Kagak Masok";
			output += "<br> <a href='Panel?action=login'>Kembali</a>";
			response.setContentType("text/html");
			response.getWriter().print(output);
		}
	}
}