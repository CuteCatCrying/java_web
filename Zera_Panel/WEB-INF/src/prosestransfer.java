import java.io.IOException;
import java.sql.*;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class prosestransfer extends HttpServlet{
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{

	}

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
		HttpSession session = request.getSession(true);
		String nohp = request.getParameter("nohp");
		String jumlahdana = request.getParameter("jumlahdana");

		String host = "jdbc:mysql://localhost:3306/zera_panel";
		String user = "zera";
		String pwd = "mean123";

		// Jika user sudah login
		if(!((session.getAttribute("userid") == null) || (session.getAttribute("userid") == ""))){
			if(nohp == null || nohp == "" || jumlahdana == null || jumlahdana == ""){ // jika field nohp atau jumlah dana kosong
				response.setContentType("text/html");
				response.getWriter().print("Input dulu coy");
			}else{
				try{
					PreparedStatement ps = null;
					String saldoUserSumber = null;
					String saldoUserTujuan = null;
					String output = null;
					String sql = null;
					int totalTransferSumber, totalTransferTujuan;

					Class.forName("com.mysql.jdbc.Driver");
					Connection conn = DriverManager.getConnection(host,user,pwd);
					Statement stmt = conn.createStatement();
					String username = session.getAttribute("userid").toString(); //mendapatkan username yang sedang login

					sql = "SELECT * FROM profile where username = '"+username+"'";
					ResultSet rs = stmt.executeQuery(sql);
					while(rs.next()){
						saldoUserSumber = rs.getString("saldo");
					}

					sql = "SELECT * FROM profile where nohp = '"+nohp+"'";
					ResultSet rs2 = stmt.executeQuery(sql);
					while(rs2.next()){
						saldoUserTujuan = rs2.getString("saldo");
					}

					totalTransferSumber = Integer.valueOf(saldoUserSumber) - Integer.valueOf(jumlahdana);
					totalTransferTujuan = Integer.valueOf(saldoUserTujuan) + Integer.valueOf(jumlahdana);
					if(nohp == null || nohp == "" || jumlahdana == null || jumlahdana == ""){
						response.sendRedirect("Panel?action=transfer");
					}else{
						if(Integer.valueOf(saldoUserSumber) > Integer.valueOf(jumlahdana)){
							sql = "UPDATE profile SET saldo=? WHERE username = '"+username+"'";
							ps = conn.prepareStatement(sql);
							ps.setString(1,String.valueOf(totalTransferSumber));
							ps.executeUpdate();

							sql = "UPDATE profile SET saldo=? WHERE nohp = '"+nohp+"'";
							ps = conn.prepareStatement(sql);
							ps.setString(1,String.valueOf(totalTransferTujuan));
							ps.executeUpdate();

							response.sendRedirect("Panel?action=transfer");
						}else{
							output = "Saldo dikit";
							output += "<br> <a href='Panel?action=transfer'>Kembali</a>";
						}
					}
					response.setContentType("text/html");
					response.getWriter().print(output);
				}catch(Exception ex){
					String output = ex.toString();
					output += "<br> <a href='Panel?action=transfer'>Kembali</a>";
					response.setContentType("text/html");
					response.getWriter().print(output);
				}

			}
		}else{ // jika user belom login
			String output = "Kagak Masok";
			output += "<br> <a href='Panel?action=transfer'>Kembali</a>";
			response.setContentType("text/html");
			response.getWriter().print(output);
		}
	}
}