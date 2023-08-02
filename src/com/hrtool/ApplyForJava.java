package com.hrtool;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class ApplyForJava
 */
public class ApplyForJava extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ApplyForJava() {
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
		int Id=0,o =0,c=0,e=0,a=0,n=0;
		String canName = request.getParameter("canName");
		String canEmail = request.getParameter("canEmail");
		long canMob = Long.parseLong(request.getParameter("canMob"));
		String address = request.getParameter("address");
		String job = request.getParameter("job");
		Connection con = DbConnection.connect();
		try {
			PreparedStatement pstmt = con.prepareStatement("insert into candidate values(?,?,?,?,?,?,?,?,?,?,?)");
			pstmt.setInt(1, Id);
			pstmt.setString(2, canName);
			pstmt.setString(3, canEmail);
			pstmt.setLong(4, canMob);
			pstmt.setString(5, address);
			pstmt.setString(6, job);
			pstmt.setInt(7, o);
			pstmt.setInt(8, c);
			pstmt.setInt(9, e);
			pstmt.setInt(10, a);
			pstmt.setInt(11, n);
			int i=pstmt.executeUpdate();
			if(i>0){
				PreparedStatement pst = con.prepareStatement("select Id from candidate where Email =?");
				pst.setString(1, canEmail);
				ResultSet rs1= pst.executeQuery();
				if(rs1.next()){
					Id = rs1.getInt(1);
					CandDetail.setcId(Id);
				}
				response.sendRedirect("test.jsp");
			}else{
				response.sendRedirect("applyForJob.jsp");
			}
		} catch (SQLException ae) {
			// TODO Auto-generated catch block
			ae.printStackTrace();
		}
		
	}

}
