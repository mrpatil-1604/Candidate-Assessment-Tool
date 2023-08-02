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
 * Servlet implementation class AddJobs
 */
public class AddJobs extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AddJobs() {
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
		String qualities ="";
		String jobTitle = request.getParameter("jobTitle");
		String jobDesc = request.getParameter("jobDesc");
		String salRange = request.getParameter("salRange");
		String expr = request.getParameter("expr");	
		boolean o,c,e,a,n;
		Connection con = DbConnection.connect();
		try {
			try{
				if(request.getParameter("o").equals("Openness")){
					qualities+=("Openness,");
				}
			}catch(java.lang.NullPointerException ne){
				o=false;
			}
			try{
				if(request.getParameter("c").equals("Conscientiousness")){
					qualities+=("Conscientiousness,");
				}
			}catch(java.lang.NullPointerException ne){
				c=false;
			}
			try{
				if(request.getParameter("e").equals("Extraversion")){
					qualities+=("Extraversion,");
				}
			}catch(java.lang.NullPointerException ne){
				e=false;
			}
			try{
				if(request.getParameter("a").equals("Agreeableness")){
					qualities+=("Agreeableness,");
				}
			}catch(java.lang.NullPointerException ne){
				a=false;
			}
			try{
				if(request.getParameter("n").equals("Neuroticium")){
					qualities+=("Neuroticium,");
				}
			}catch(java.lang.NullPointerException ne){
				n=false;
			}
			PreparedStatement pstmt = con.prepareStatement("insert into jobs values(?,?,?,?,?,?,?)");
			pstmt.setInt(1, Id);
			pstmt.setString(2, CandDetail.getHrEmail());
			pstmt.setString(3, jobTitle);
			pstmt.setString(4, jobDesc);
			pstmt.setString(5, salRange);
			pstmt.setString(6, qualities);
			pstmt.setString(7, expr);
			int i= pstmt.executeUpdate();
			if(i>0){
				response.sendRedirect("hrDashboard.html");
			}else{
				response.sendRedirect("addJobs.html");
			}
		} catch (SQLException ae) {
			// TODO Auto-generated catch block
			ae.printStackTrace();
		}
	}

}
