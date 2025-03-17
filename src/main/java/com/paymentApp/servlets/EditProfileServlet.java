package com.paymentApp.servlets;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;

import com.paymentApp.db.DbConnection;
import com.paymentApp.dto.UsersDto;

/**
 * Servlet implementation class EditProfileServlet
 */
@WebServlet("/EditProfileServlet")
public class EditProfileServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
 
    public EditProfileServlet() {
        super();
        // TODO Auto-generated constructor stub
    }



	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		 // Get user inputs
        int userId = Integer.parseInt(request.getParameter("userId"));
        String userName = request.getParameter("userName");
        String firstName = request.getParameter("firstName");
        String lastName = request.getParameter("lastName");
        String email = request.getParameter("email");
        String phone = request.getParameter("phone");
        String address = request.getParameter("address");

        Connection conn = null;
        PreparedStatement pstmt = null;

        try {
            // Get database connection
            conn = DbConnection.DbConnect();
            
            // Update user details query
            String sql = "UPDATE user_details SET User_Name=?, First_Name=?, Last_Name=?, Email=?, Phone_Number=?, Address=? WHERE User_Id=?";
            pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, userName);
            pstmt.setString(2, firstName);
            pstmt.setString(3, lastName);
            pstmt.setString(4, email);
            pstmt.setString(5, phone);
            pstmt.setString(6, address);
            pstmt.setInt(7, userId);
            
            int rowsUpdated = pstmt.executeUpdate();

            if (rowsUpdated > 0) {
                // Update session object with new details
                HttpSession session = request.getSession();
                UsersDto user = (UsersDto) session.getAttribute("loggedUser");
                
                if (user != null) {
                    user.setUserName(userName);
                    user.setFirstName(firstName);
                    user.setLastName(lastName);
                    user.setEmail(email);
                    user.setPhoneNumber(phone);
                    user.setAddress(address);
                    session.setAttribute("loggedUser", user);
                }

                // Redirect with success message
                response.getWriter().println("<script>alert('Profile updated successfully!'); window.location='profile.jsp';</script>");
            } else {
                response.getWriter().println("<script>alert('Profile update failed!'); window.location='editProfile.jsp';</script>");
            }

        } catch (Exception e) {
            e.printStackTrace();
            response.getWriter().println("<script>alert('Error occurred! Try again.'); window.location='editProfile.jsp';</script>");
        } finally {
            try { if (pstmt != null) pstmt.close(); } catch (Exception ex) {}
            try { if (conn != null) conn.close(); } catch (Exception ex) {}
        }
            
		
	}

}
