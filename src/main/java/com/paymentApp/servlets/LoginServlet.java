package com.paymentApp.servlets;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import com.paymentApp.db.DbConnection;
import com.paymentApp.dto.UsersDto;


@WebServlet("/LoginServlet")
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
 
    public LoginServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession hs=request.getSession();
		PrintWriter pw=response.getWriter();
		response.setContentType("text/html");
		String email=(String)request.getParameter("email");
		String password=(String)request.getParameter("password");
		try {
			Connection con=DbConnection.DbConnect();
			String query="select * from User_Details where Email=? and Password=?";
			PreparedStatement ps=con.prepareStatement(query);
			ps.setString(1,email);
			ps.setString(2,password);
			ResultSet rs=ps.executeQuery();
			if(rs.next())
			{
             UsersDto loggedUser=new UsersDto(rs.getString("User_Name"),rs.getString("Password"),rs.getString("First_Name"),
            		 rs.getString("Last_Name"),rs.getString("Phone_Number"),rs.getString("Email"),rs.getString("Address"));
             loggedUser.setUserId(rs.getInt(1));
             hs.setAttribute("loggedUser",loggedUser);
			 pw.print("<script>alert('Login successfull...!');window.location='profile.jsp';</script>");
			}
			
			}catch(Exception e)
		{
			e.printStackTrace();
		}
		
	}



	

}
