<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Dashboard</title>
    <link rel="stylesheet" href="dashboard.css">
    
    <Style>
  
body, html {
    margin: 0;
    padding: 0;
    font-family: Arial, sans-serif;
    background-color: #f4f4f4;
}



/* Main Container */
.main-container {
    margin-left: 250px;
    padding-top: 30px;
    font-size:20px;
}


 
    </Style>
</head>
<body>

     <!-- Include Sidebar -->
    <jsp:include page="sidebar.jsp" />

    <!-- Main Container -->
    <div class="main-container">
        <!-- Page Content -->
        <div class="content">
        <h3>Welcome, <%= session.getAttribute("username") %>!</h3>
           
            <p>This is your dashboard. Manage your account, view transactions, and more.</p>

        </div>
        
    </div>

</body>
</html>
