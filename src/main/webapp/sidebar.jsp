<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<Style>
/* Sidebar (Fixed) */
.sidebar {
    width: 250px;
    height: 100vh;
    background: #0099e6;
    color: white;
    position: fixed;
    left: 0;
    top: 0;
    padding-top: 20px;
}

.sidebar h2 {
    text-align: center;
    margin-bottom: 20px;
}

.sidebar ul {
    list-style: none;
    padding: 0;
}

.sidebar ul li {
    margin: 15px 0;
}

.sidebar ul li a {
    color: white;
    text-decoration: none;
    padding: 10px;
    display: block;
    border-radius: 5px;
}

.sidebar ul li a:hover, .sidebar ul li a.active {
    background: #00b386;
}

.main-content {
    background-color: #f5f5f5; /* Light Gray */
    padding: 20px;
    min-height: 100vh; /* Ensures it covers the full viewport height */
}
</Style>
</head>
<body>
<!-- sidebar.jsp -->
<div class="sidebar">
    <ul>
        <li><a href="dashboard.jsp" class="active">🏠 Dashboard</a></li>
        <li><a href="profile.jsp">👤 Profile</a></li>
        <li><a href="transactions.jsp">💰 Transactions</a></li>
        <li><a href="LogoutServlet">🚪 Logout</a></li>
    </ul>
</div>

</body>
</html>