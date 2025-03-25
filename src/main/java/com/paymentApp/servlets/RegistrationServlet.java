package com.paymentApp.servlets;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;

import com.paymentApp.Dao.RegistrationDao;
import com.paymentApp.db.DbConnection;
import com.paymentApp.dto.UsersDto;

/**
 * Servlet implementation class RegistrationServlet
 */
@WebServlet("/RegistrationServlet")
public class RegistrationServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public RegistrationServlet() {
        super();
        // TODO Auto-generated constructor stub
    }


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	   PrintWriter pw=response.getWriter();
	   response.setContentType("text/html");
	   String userName=request.getParameter("userName");
	   String password=(String)request.getParameter("password");
	   String firstName=request.getParameter("firstName");
	   String lastName=request.getParameter("lastName");
	   String phoneNumber=request.getParameter("phoneNumber");
	   String email=(String)request.getParameter("email");
	   String address=request.getParameter("address");
	   UsersDto user=new UsersDto(userName,password,firstName,lastName,phoneNumber,email, address);
	   RegistrationDao rd=new RegistrationDao();
	    int res=rd.registerUser(user);
	 
		   if(res>0)
		   {
			   pw.print("<script>alert('Registration successfull...!Please Continue Login...');window.location='index.html';</script>");
//			   RequestDispatcher rd=request.getRequestDispatcher("index.html");
//			   rd.include(request, response);
		   }else {
			   pw.print("<script>alert('Registration Failed...!Please Try Again...');window.location='register.html';</script>");
		   }
		   
		   
	   
	}


}
