<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Profile Page</title> 
</head>
<body>
 <%     
 String name=(String)session.getAttribute("userName");
 String email=(String)session.getAttribute("userEmail");
 String password=(String)session.getAttribute("userPassword");
 String mobile=(String)session.getAttribute("userMobile");
 String gender=(String)session.getAttribute("userGender");
        
        int currentPage=1;
        if(session.getAttribute("cPage")!=null)
        {
        	 currentPage =(int)session.getAttribute("cPage");
        }
     
%>
<h1>Welcome To Profile Page,<%=name %></h1><br>
<table border=1>
<tr>
<th>Name</th>
<th>Email</th>
<th>Password</th>
<th>Mobile</th>
<th>Gender</th>
</tr>
<tr>
<th><%=name %></th>
<th><%=email %></th>
<th><%=password %></th>
<th><%=mobile %></th>
<th><%=gender %></th>
</tr>
</table>
<a href="Transactions?currentPage=<%=currentPage%>">View Transactions Data</a><br>
<a href="ViewAllUsers">View Users Data</a><br>
<a href="UserLogout">Logout</a>

</body>
</html>