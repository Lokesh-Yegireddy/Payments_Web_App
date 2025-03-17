package com.paymentApp.dto;


import java.util.ArrayList;
import java.util.List;

public class UsersDto {
private static int userId=100;
private String userName;
private String password;
private String firstName;
private String lastName;
private String phoneNumber;
private String email;
private String address;
//private List<BankAccountDetails> Banks;


public UsersDto() {
	super();
	// TODO Auto-generated constructor stub
}


public UsersDto( String userName, String password, String firstName, String lastName, String phoneNumber,
		String email, String address) {
	
	++userId;
	this.userName = userName;
	this.password = password;
	this.firstName = firstName;
	this.lastName = lastName;
	this.phoneNumber = phoneNumber;
	this.email = email;
	this.address = address;
  //  Banks =new ArrayList<>();
    
}

//public List<BankAccountDetails> getBanks() {
//	return Banks;
//}
//public void setBanks(BankAccountDetails bank) {
//	Banks.add(bank);
//}

public int getUserId() {
	return userId;
}
public void setUserId(int userId) {
	this.userId = userId;
}
public String getUserName() {
	return userName;
}
public void setUserName(String userName) {
	this.userName = userName;
}
public String getPassword() {
	return password;
}
public void setPassword(String password) {
	this.password = password;
}
public String getFirstName() {
	return firstName;
}
public void setFirstName(String firstName) {
	this.firstName = firstName;
}
public String getLastName() {
	return lastName;
}
public void setLastName(String lastName) {
	this.lastName = lastName;
}
public String getPhoneNumber() {
	return phoneNumber;
}
public void setPhoneNumber(String phoneNumber) {
	this.phoneNumber = phoneNumber;
}
public String getEmail() {
	return email;
}
public void setEmail(String email) {
	this.email = email;
}
public String getAddress() {
	return address;
}
public void setAddress(String address) {
	this.address = address;
}


@Override
public String toString() {
	return "UserDetails [userId=" + userId + ", userName=" + userName + ", password=" + password + ", firstName="
			+ firstName + ", lastName=" + lastName + ", phoneNumber=" + phoneNumber + ", email=" + email + ", address="
			+ address + "]";
}





}