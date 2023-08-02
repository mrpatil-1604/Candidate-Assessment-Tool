<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>Candidate personality test</title>
<!-- custom-theme -->
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="keywords" content="Elegant Feedback Form  Responsive web template, Bootstrap Web Templates, Flat Web Templates, Android Compatible web template, Smartphone Compatible web template, free webdesigns for Nokia, Samsung, LG, SonyEricsson, Motorola web design" />
<script type="application/x-javascript"> addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false);
		function hideURLbar(){ window.scrollTo(0,1); } </script>
<!-- //custom-theme -->
<link href="css/style.css" rel="stylesheet" type="text/css" media="all" />
<link href="//fonts.googleapis.com/css?family=Montserrat:400,700" rel="stylesheet">
</head>
<body class="agileits_w3layouts">
<%@ page import=" java.sql.*" %>
<%@ page import ="com.hrtool.*" %>
<%
int Id=0;
String canName = request.getParameter("canName");
String canEmail = request.getParameter("canEmail");
long canMob = Long.parseLong(request.getParameter("canMob"));
String address = request.getParameter("address");
Connection con = DbConnection.connect();
try {
	PreparedStatement pstmt = con.prepareStatement("insert into candidate values(?,?,?,?,?,?)");
	pstmt.setInt(1, Id);
	pstmt.setInt(2,CandDetail.getJid());
	pstmt.setString(3, canName);
	pstmt.setString(4, canEmail);
	pstmt.setLong(5, canMob);
	pstmt.setString(6, address);
	int i=pstmt.executeUpdate();
	if(i>0){
		PreparedStatement pst = con.prepareStatement("select Id from candidate where Email =?");
		pst.setString(1, canEmail);
		ResultSet rs1= pst.executeQuery();
		if(rs1.next()){
			Id = rs1.getInt(1);
			CandDetail.setcId(Id);
		}
	}
} catch (SQLException ae) {
	ae.printStackTrace();
}
%>
    <h1 class="agile_head text-center">Personality Test</h1>
    <div class="w3layouts_main wrap">
     <form action="AddMarks" method="post" class="agile_form">
    <%
    		int count=1;
    		PreparedStatement pstmt1 = con.prepareStatement("select * from question");
  			ResultSet rs = pstmt1.executeQuery();
    %>
    <%while(rs.next()){%>
	  <h3><%=rs.getInt(1)%>.  <%=rs.getString(2) %></h3>
			 <ul class="agile_info_select">
				 <li><input type="radio" name="q<%=Integer.toString(count)%>"value="HA"id="e<%=Integer.toString(count)%>" > 
				 	  <label for="e<%=Integer.toString(count)%>">strongly agree</label>
				      <div class="check w3"></div>
				 </li>
				 <li><input type="radio" name="q<%=Integer.toString(count)%>"value="A"id="g<%=Integer.toString(count)%>" checked="checked"> 
					  <label for="g<%=Integer.toString(count)%>">agree</label>
				      <div class="check w3ls"></div>
				 </li>
				 <li><input type="radio"name="q<%=Integer.toString(count)%>"value="N" id="n<%=Integer.toString(count)%>"> 
					 <label for="n<%=Integer.toString(count)%>">neutral</label>
				     <div class="check wthree"></div>
				 </li>
				 <li><input type="radio" name="q<%=Integer.toString(count)%>" value="D"id="h<%=Integer.toString(count)%>"> 
					  <label for="h<%=Integer.toString(count)%>">disagree</label>
				      <div class="check w3_agileits"></div>
				 </li>
				  <li><input type="radio" name="q<%=Integer.toString(count)%>" value="HD"id="p<%=Integer.toString(count)%>"> 
					  <label for="p<%=Integer.toString(count)%>">strongly disagree</label>
				      <div class="check w3_agileits"></div>
				 </li>
			 </ul>			 
			 <%count++;} %>
			 <input type="submit" value="Submit" class="agileinfo" />
	  </form>
	</div>
</body>
</html>
