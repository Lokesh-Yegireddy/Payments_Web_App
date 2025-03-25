package com.paymentApp.Dao;

import java.sql.Connection;
import java.sql.PreparedStatement;

import com.paymentApp.db.DbConnection;
import com.paymentApp.dto.UsersDto;

public class RegistrationDao {

public int	registerUser(UsersDto user)
	{
	    int res=0;
	  
	   try {
		   Connection con=DbConnection.DbConnect();
		   String query="insert into  user_details (User_Name, Password, First_Name, Last_Name, Phone_Number, Email, Address) values(?,?,?,?,?,?,?)";
		   PreparedStatement psmt=con.prepareStatement(query);
		   psmt.setString(1,user.getUserName());
		   psmt.setString(2,user.getPassword());
		   psmt.setString(3,user.getFirstName());
		   psmt.setString(4,user.getLastName());
		   psmt.setString(5,user.getPhoneNumber());
		   psmt.setString(6,user.getEmail());
		   psmt.setString(7,user.getAddress());
		   res=psmt.executeUpdate();
		   
	   }catch(Exception e)
	   {
		   e.printStackTrace();
	   }
	   
	 
	    return res;
	}
	
}
