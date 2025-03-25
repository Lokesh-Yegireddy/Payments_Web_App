package com.paymentApp.dto;

public class BankDto {
	private  int bankAccountId;
	private long accountNumber;
	private String ifscCode;
	private String accountStatus;
	private String bankName;
	private String bankBranchLocation;
	private double bankBalance;
	private int userId;
	
	public int getUserId() {
		return userId;
	}
	public void setUserId(int userId) {
		this.userId = userId;
	}
	public BankDto(String bankName,long accountNumber, String ifscCode, String accountStatus, 
			double bankBalance,String bankBranchLocation, int userId) {
		super();
		this.accountNumber = accountNumber;
		this.ifscCode = ifscCode;
		this.accountStatus = accountStatus;
		this.bankName = bankName;
		this.bankBranchLocation = bankBranchLocation;
		this.bankBalance = bankBalance;
		this.userId=userId;
	}
	public  int getBankAccountId() {
		return bankAccountId;
	}
	
	public  int setBankAccountId(int bankAccountId) {
		return this.bankAccountId = bankAccountId;
	}
	
	public long getAccountNumber() {
		return accountNumber;
	}
	
	public void setAccountNumber(long accountNumber) {
		this.accountNumber = accountNumber;
	}
	
	public String getIfscCode() {
		return ifscCode;
	}
	
	public void setIfscCode(String ifscCode) {
		this.ifscCode = ifscCode;
	}
	public String getAccountStatus() {
		return accountStatus;
	}
	public void setAccountStatus(String accountStatus) {
		this.accountStatus = accountStatus;
	}
	public String getBankName() {
		return bankName;
	}
	public void setBankName(String bankName) {
		this.bankName = bankName;
	}
	public String getBankBranchLocation() {
		return bankBranchLocation;
	}
	public void setBankBranchLocation(String bankBranchLocation) {
		this.bankBranchLocation = bankBranchLocation;
	}
	public double getBankBalance() {
		return bankBalance;
	}
	public void setBankBalance(double bankBalance) {
		this.bankBalance = bankBalance;
	}
	public BankDto() {
		super();
	
	}
}
