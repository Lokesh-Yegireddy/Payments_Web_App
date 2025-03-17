<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Transaction Data</title>
</head>
<body>
<%String name=(String)session.getAttribute("username"); %>
<%ResultSet rs=(ResultSet)session.getAttribute("tableData"); %>
<%int noOfPages=(int)session.getAttribute("totPages"); %>
<%int currentPage=(int)session.getAttribute("page"); %>
<% out.print("<h1>Page No : "+currentPage+"</h1>");%><br>
<a href="SortingData">Ascending Order</a>
<a href="SortingData">Descending Order</a>
<div>
<table border=1>
<tr>
<th>Transaction_Id</th>
<th>Transaction_Date</th>
<th>Transaction_Amount</th>
<th>Source_Account_Id</th>
<th>Destination_Account_Id</th>
</tr>
<%while(rs.next()){%>
	<tr>
	<td><%=rs.getInt(1) %></td>
	<td><%=rs.getString(2) %></td>
	<td><%=rs.getInt(3) %></td>
	<td><%=rs.getInt(4) %></td>
	<td><%=rs.getInt(5) %></td>
	</tr>
<%} %>
</table>
</div>
<div>
    <% 
        // Check if the current page is greater than 1
        if (currentPage > 1) { 
    %>
        <a href="Transactions?page=<%= currentPage - 1 %>">&lt;&lt; Previous</a> 
    <% 
        } else { 
    %>
        <span>&lt;&lt; Previous</span> 
    <% 
        } 

        // Check if the current page is less than the total number of pages
        if (currentPage < noOfPages) { 
    %>
        <a href="Transactions?page=<%= currentPage + 1 %>">Next &gt;&gt;</a>
    <% 
        } else { 
    %>
        <span>Next &gt;&gt;</span>
    <% 
        } 
    %>
</div>
<%session.setAttribute("cPage",currentPage); %>
<a href="profile.jsp">Back To Profile Page</a>

</body>
</html>