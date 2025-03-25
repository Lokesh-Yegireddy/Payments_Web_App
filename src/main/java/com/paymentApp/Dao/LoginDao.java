package com.paymentApp.Dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import com.paymentApp.db.DbConnection;
import com.paymentApp.dto.UsersDto;

public  class LoginDao {

	public UsersDto loginUser(String email,String password)
	{
		ResultSet userDetails=null;
		 UsersDto loggedUser=null;
		try {
			Connection con=DbConnection.DbConnect();
			String query="select * from User_Details where Email=? and Password=?";
			PreparedStatement ps=con.prepareStatement(query);
			ps.setString(1,email);
			ps.setString(2,password);
			userDetails=ps.executeQuery();
			
			 if(userDetails.next())
	 			{
	              loggedUser=new UsersDto(userDetails.getString("User_Name"),userDetails.getString("Password"),userDetails.getString("First_Name"),
	             		 userDetails.getString("Last_Name"),userDetails.getString("Phone_Number"),userDetails.getString("Email"),userDetails.getString("Address"));
	              loggedUser.setUserId(userDetails.getInt(1));
	 			}
	              
	        }catch(Exception e)
		          {
		              e.printStackTrace();
	              }
		
		return loggedUser;
}
}
