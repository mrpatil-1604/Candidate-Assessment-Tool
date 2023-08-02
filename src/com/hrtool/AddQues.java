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
 * Servlet implementation class AddQues
 */
public class AddQues extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AddQues() {
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
		int Id =0;
		String question = request.getParameter("question");
		String mark1 = request.getParameter("mark1");
		String mark2 = request.getParameter("mark2");
		String mark3 = request.getParameter("mark3");
		String mark4 = request.getParameter("mark4");
		String mark5 = request.getParameter("mark5");
		Connection con = DbConnection.connect();
		try {
			PreparedStatement pstmt = con.prepareStatement("insert into question values(?,?,?,?,?,?,?)");
			pstmt.setInt(1, Id);
			pstmt.setString(2, question);
			pstmt.setString(3, mark1);
			pstmt.setString(4, mark2);
			pstmt.setString(5, mark3);
			pstmt.setString(6, mark4);
			pstmt.setString(7, mark5);
			int i=pstmt.executeUpdate();
			if(i>0){
				response.sendRedirect("adDashboard.html");
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

}
