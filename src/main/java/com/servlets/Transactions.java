package com.servlets;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

/**
 * Servlet implementation class Transactions
 */
@WebServlet("/Transactions")
public class Transactions extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Transactions() {
        super();
        // TODO Auto-generated constructor stub
    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
			HttpSession hs = request.getSession();
			Connection con =DbConnection.DbConnect();
			int transactionsPerPage = 5;
			int noOfPages = 0;
			int noOfTxn = 0;

			int page = 1; // by default

			if (request.getParameter("page") != null) {
				page = Integer.parseInt(request.getParameter("page"));
			}
			
			 if(request.getParameter("currentPage")!=null)
	            {
	            	page = Integer.parseInt(request.getParameter("currentPage"));
	            }

			int offSet = (page - 1) * transactionsPerPage;

			String query1 = "select count(*) from transaction";
			PreparedStatement ps = con.prepareStatement(query1);
			ResultSet rs = ps.executeQuery();

			if (rs.next()) {
				if (rs.getInt(1) != 0) {
					noOfTxn = rs.getInt(1);
					noOfPages = (int) Math.ceil(noOfTxn  / transactionsPerPage);
					hs.setAttribute("totPages", noOfPages);
					hs.setAttribute("page", page);
				}
			}
			String query2 = "select * from transaction LIMIT ? OFFSET ?";
			PreparedStatement ps1 = con.prepareStatement(query2);
			ps1.setInt(1, transactionsPerPage);
			ps1.setInt(2, offSet);

			ResultSet r1 = ps1.executeQuery();
			hs.setAttribute("tableData", r1);

			RequestDispatcher rd = request.getRequestDispatcher("ViewTransactionData.jsp");
			rd.forward(request, response);

		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	}

	


