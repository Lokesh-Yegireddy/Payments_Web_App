<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ page import="com.paymentApp.dto.UsersDto" %>
 
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>User Profile</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f4f4;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
        }
        .profile-container {
            background: white;
            padding: 20px;
            border-radius: 10px;
            box-shadow: 0px 0px 10px rgba(0, 0, 0, 0.1);
            width: 400px;
            text-align: center; /* Centers the button inside */
        }
        h2 {
            text-align: center;
            color: #333;
        }
        table {
            width: 100%;
            border-collapse: collapse;
            margin-bottom: 20px; /* Adds spacing between table and button */
        }
        td {
            padding: 10px;
            border-bottom: 1px solid #ddd;
        }
        td:first-child {
            font-weight: bold;
            color: #555;
        }
        
        .edit-btn {
            padding: 10px 20px;
            font-size: 16px;
            color: white;
            background-color: #007bff;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            transition: background 0.3s;
            display: inline-block; /* Keeps button properly aligned */
        }
        .edit-btn:hover {
            background-color: #0056b3;
        }
        
        /* Logout Button (Placed Outside Profile Box) */
.logout-btn {
    position: fixed;
    top: 10px;
    right: 10px;
    padding: 10px 20px;
    font-size: 16px;
    background-color: #dc3545;
    color: white;
    border: none;
    border-radius: 5px;
    cursor: pointer;
    transition: background 0.3s;
}

.logout-btn:hover {
    background-color: #b02a37;
}
.dashboard-btn {
    position: fixed;
    top: 10px;
    left: 10px;
    padding: 10px 20px;
    font-size: 16px;
    background-color: #108fe3;
    color: white;
    border: none;
    border-radius: 5px;
    cursor: pointer;
    transition: background 0.3s;
}

.dashboard-btn:hover {
    background-color: #064670;
}

    </style>
</head>
<body>


<%
    UsersDto loggedUser = (UsersDto) session.getAttribute("loggedUser");
if (loggedUser == null) {
    // If not logged in, redirect to login page
    response.sendRedirect("login.jsp");
    return; // Stop further execution
}

    if (loggedUser != null) {
%>
<button class="logout-btn" onclick="window.location.href='LogoutServlet'">Logout</button>
    <div class="profile-container">
        <h2>User Profile</h2>
        <table>
            <tr><td>User ID:</td><td><%= loggedUser.getUserId() %></td></tr>
            <tr><td>Name:</td><td><%= loggedUser.getUserName() %></td></tr>
            <tr><td>First Name:</td><td><%= loggedUser.getFirstName() %></td></tr>
            <tr><td>Last Name:</td><td><%= loggedUser.getLastName() %></td></tr>
            <tr><td>Phone:</td><td><%= loggedUser.getPhoneNumber() %></td></tr>
            <tr><td>Email:</td><td><%= loggedUser.getEmail() %></td></tr>
            <tr><td>Address:</td><td><%= loggedUser.getAddress() %></td></tr>
        </table>

        <!-- Edit Profile Button (Now Properly Centered) -->
        <button class="edit-btn" onclick="window.location.href='editProfile.jsp'">Edit Profile</button>
    </div>
<% } else { %>
    <script>alert("No user logged in! Redirecting to login page."); window.location="login.jsp";</script>
<% } %>




</body>
</html>

