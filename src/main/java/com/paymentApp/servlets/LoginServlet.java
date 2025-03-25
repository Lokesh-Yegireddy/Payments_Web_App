package com.paymentApp.servlets;

import jakarta.servlet.RequestDispatcher;
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

import com.paymentApp.Dao.LoginDao;
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
		PrintWriter pw=response.getWriter();
		response.setContentType("text/html");
		String email=(String)request.getParameter("email");
		String password=(String)request.getParameter("password");
		LoginDao ld=new LoginDao();
	    UsersDto userDetails=ld.loginUser(email,password);
			
         if(userDetails!=null)
         {   
        	 HttpSession hs=request.getSession();
        	 hs.setAttribute("loggedUser",userDetails);
 		     pw.print("<script>alert('Login successfull...!');window.location='user-home.jsp';</script>");
 		     
         }else
         {
        	 pw.print("Invalid Credentials!");
        	 RequestDispatcher rd=request.getRequestDispatcher("index.html");
        	 rd.include(request, response);
         }
 			
       
	    
			
		
	}
}



