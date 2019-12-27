package com.zukronalviandy.controller;

import java.io.IOException;
import java.io.PrintWriter;
import static java.lang.System.out;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import com.zukronalviandy.model.UserModel;

@WebServlet(name="Login", urlPatterns={"/Login"})
public class Login extends HttpServlet{
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
		String proses = request.getParameter("proses");
		if(proses.equals("logout")){
			HttpSession sesi = request.getSession();
			sesi.invalidate();
			response.sendRedirect("index.jsp");
		}
	}

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
		String proses = request.getParameter("proses");
		if(proses.equals("login")){
			String id = request.getParameter("id");
			String user = request.getParameter("username");
			String pass = request.getParameter("password");
			String hak_akses = request.getParameter("hak_akses");

			if(pass == null || pass.equals("")){
				// validasi apabila field belum diisi
				response.sendRedirect("index.jsp");
			}else{
				UserModel pm = new UserModel();
				List<UserModel> datalogin = new ArrayList<UserModel>();
				datalogin = pm.LoginUser(user,pass);

				if(datalogin.isEmpty()){
					// validasi apabila username dan password salah
					response.sendRedirect("index.jsp");
				}else{
					HttpSession sesi = request.getSession(true);
					sesi.setAttribute("id",datalogin.get(0).getId());
					sesi.setAttribute("username",datalogin.get(0).getUsername());
					sesi.setAttribute("hak_akses",datalogin.get(0).getHak_akses());

					if(datalogin.get(0).getHak_akses().equals("Admin")){
						response.sendRedirect("admin.jsp");
					}
					if(datalogin.get(0).getHak_akses().equals("Pelanggan")){
						response.sendRedirect("pelanggan.jsp");
					}
				}
			}
		}
	}
}