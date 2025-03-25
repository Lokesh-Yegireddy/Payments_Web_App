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

import com.paymentApp.db.DbConnection;
import com.paymentApp.dto.UsersDto;

/**
 * Servlet implementation class DeleteUserServlet
 */
@WebServlet("/DeleteUserServlet")
public class DeleteUserServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

    public DeleteUserServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

    
    protected void doPost(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
    PrintWriter pw=response.getWriter();
    response.setContentType("text/html");
    HttpSession session = request.getSession(false);
    if (session == null || session.getAttribute("loggedUser") == null) {
        response.sendRedirect("login.jsp"); // Redirect if not logged in
        return;
    }

    UsersDto user = (UsersDto) session.getAttribute("loggedUser");
    int userId = user.getUserId();

    try (Connection conn = DbConnection.DbConnect()) {
        String sql = "DELETE FROM User_Details WHERE user_id = ?";
        try (PreparedStatement stmt = conn.prepareStatement(sql)) {
            stmt.setInt(1, userId);
            int rowsDeleted = stmt.executeUpdate();

            if (rowsDeleted > 0) {
            	 // Invalidate session after delete
                session.invalidate();
                pw.print("Account Deleted Successfuly...!");
                pw.print("<h1>Please Go To Home Page </h1>");
                pw.print("<a href='index.html'>Home</a>");
                
            } else {
                response.sendRedirect("editProfile.jsp?error=Failed to Delete Account");
            }
        }
    } catch (Exception e) {
        e.printStackTrace();
        response.sendRedirect("editProfile.jsp?error=Something went wrong!");
    }}

}
