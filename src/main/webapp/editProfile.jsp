<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.paymentApp.dto.UsersDto" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Edit Profile</title>
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
        position:relative;
            background: white;
            padding: 20px;
            border-radius: 10px;
            box-shadow: 0px 0px 10px rgba(0, 0, 0, 0.1);
            width: 400px;
        }
        h2 {
            text-align: center;
            color: #333;
        }
        form {
            display: flex;
            flex-direction: column;
        }
        .form-group {
            display: flex;
            flex-direction: column;
            margin-bottom: 15px;
        }
        label {
            font-weight: bold;
            margin-bottom: 5px;
            color: #555;
        }
        input, textarea {
            padding: 10px;
            border: 1px solid #ccc;
            border-radius: 5px;
            font-size: 14px;
            width: 100%;
        }
        input[readonly] {
            background-color: #e9ecef;
            cursor: not-allowed;
        }
        textarea {
            resize: none;
            height: 60px;
        }
        .save-btn {
            margin-top: 10px;
            padding: 10px;
            font-size: 16px;
            color: white;
            background-color: #007bff;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            transition: background 0.3s;
        }
        .save-btn:hover {
            background-color: #0056b3;
        }
        
        .delete-button {
    position: absolute;
    top: 10px;
    right: 10px;
    background-color: #dc3545; /* Red color for delete */
    color: white;
    padding: 8px 12px;
    font-size: 14px;
    border: none;
    border-radius: 5px;
    cursor: pointer;
    transition: background 0.3s;
}

.delete-button:hover {
    background-color: #b02a37; /* Darker red on hover */
}
        
    </style>
</head>
<body>

<%
    UsersDto loggedUser = (UsersDto) session.getAttribute("loggedUser");
%>
    <div class="profile-container">
        <h2>Edit Profile</h2>
       
        <form action="DeleteUserServlet" method="post">
        <input type="hidden" name="userId" value="<%= loggedUser.getUserId() %>">
        <button class="delete-button" type="submit">Delete User</button>
       </form>
         <form action="EditProfileServlet" method="post">
            <div class="form-group">
                <label>User ID:</label>
                <input type="text" name="userId" value="<%= loggedUser.getUserId() %>" readonly>
            </div>
            
            <div class="form-group">
            <label>User Name:</label>
            <input type="text" name="userName" value="<%=loggedUser.getUserName() %>">
            </div>
            
            <div class="form-group">
                <label>First Name:</label>
                <input type="text" name="firstName" value="<%= loggedUser.getFirstName() %>" required>
            </div>

            <div class="form-group">
                <label>Last Name:</label>
                <input type="text" name="lastName" value="<%= loggedUser.getLastName() %>" required>
            </div>

            <div class="form-group">
                <label>Email:</label>
                <input type="email" name="email" value="<%= loggedUser.getEmail() %>">
            </div>

            <div class="form-group">
                <label>Phone:</label>
                <input type="text" name="phone" value="<%= loggedUser.getPhoneNumber() %>" required>
            </div>

            <div class="form-group">
                <label>Address:</label>
                <textarea name="address"><%= loggedUser.getAddress() %></textarea>
            </div>

            <!-- Submit Button -->
            <button class="save-btn"  type="submit">Save Changes</button>
        </form>
    </div>


</body>
</html>
