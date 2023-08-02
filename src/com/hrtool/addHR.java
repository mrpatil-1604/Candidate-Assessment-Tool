package com.hrtool;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class addHR
 */
public class addHR extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public addHR() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
		int Id=0;
		String hrName = request.getParameter("hrName");
		String hrEmail = request.getParameter("hrEmail");
		long hrMob = Long.parseLong(request.getParameter("hrMob"));
		String hrPass = request.getParameter("hrPass");
		String hrDesign = request.getParameter("hrDesign");
		try {
			Connection con = DbConnection.connect();
			PreparedStatement pstmt = con.prepareStatement("insert into hr values(?,?,?,?,?,?)");
			pstmt.setInt(1, Id);
			pstmt.setString(2, hrName);
			pstmt.setString(3, hrEmail);
			pstmt.setLong(4, hrMob);
			pstmt.setString(5, hrPass);
			pstmt.setString(6, hrDesign);
			int i = pstmt.executeUpdate();
			if(i>0)
				response.sendRedirect("adDashboard.html");
			else
				response.sendRedirect("addHR.html");
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}

}
