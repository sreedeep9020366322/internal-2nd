package com.training.servlets;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import project.internal.utils.SqlConnection;

/**
 * Servlet implementation class FirstServlet
 */
public class FirstServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public FirstServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		Connection con = SqlConnection.getOracleConnection();
		
		String sql = "Select * from EmployeeCredentials where EmployeeId = ? and EmployeePswd = ?";

		PreparedStatement pstmt;
		try {
			
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1,request.getParameter("userName"));
			pstmt.setString(2,request.getParameter("pswd"));
			final ResultSet resultset = pstmt.executeQuery();
			
			if(resultset.next()) {

				RequestDispatcher dispatcher = request.getRequestDispatcher("User.jsp");
				dispatcher.forward(request, response);
			}
			
			else {
				
				RequestDispatcher dispatcher = request.getRequestDispatcher("InvalidUserName.jsp");
				dispatcher.forward(request, response);
			}
				
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
