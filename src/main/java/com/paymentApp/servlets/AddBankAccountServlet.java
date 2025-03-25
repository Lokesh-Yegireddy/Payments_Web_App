package com.paymentApp.servlets;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.io.PrintWriter;

import com.paymentApp.Dao.AddBankAccountDao;
import com.paymentApp.dto.BankDto;
import com.paymentApp.dto.UsersDto;


@WebServlet("/AddBankAccountServlet")
public class AddBankAccountServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public AddBankAccountServlet() {
        super();
        // TODO Auto-generated constructor stub
    }


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		PrintWriter pw=response.getWriter();
		response.setContentType("text/html");
		String bankName=request.getParameter("bankName");
		long accountNumber=Long.parseLong(request.getParameter("accountNumber"));
		String ifscCode=request.getParameter("ifscCode");
		double bankBalance=Double.parseDouble(request.getParameter("bankBalance"));
		String accountStatus=request.getParameter("bankStatus");
		String bankLocation=request.getParameter("bankLocation");
		
		//getting session of logged user details
		HttpSession hs = request.getSession();
		if(hs!=null && hs.getAttribute("loggedUser") !=null )
		{
		UsersDto user = (UsersDto) hs.getAttribute("loggedUser"); 
			    int userId = user.getUserId(); 
			    
		BankDto  userBankDetails=new BankDto(bankName,accountNumber,ifscCode,accountStatus,bankBalance,bankLocation,userId);
		AddBankAccountDao bank=new AddBankAccountDao();
		int bankAccountAdded=bank.addBankAccount(userBankDetails);
		}
		
	}

}
