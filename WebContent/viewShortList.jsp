<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en" class="">
<head>
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <title>view short listed candidate</title>

  <!-- Tailwind is included -->
  <link rel="stylesheet" href="css/main.css?v=1628755089081">

  <link rel="apple-touch-icon" sizes="180x180" href="apple-touch-icon.png"/>
  <link rel="icon" type="image/png" sizes="32x32" href="favicon-32x32.png"/>
  <link rel="icon" type="image/png" sizes="16x16" href="favicon-16x16.png"/>
  <link rel="mask-icon" href="safari-pinned-tab.svg" color="#00b4b6"/>

  <meta name="description" content="Admin One - free Tailwind dashboard">

  <meta property="og:url" content="https://justboil.github.io/admin-one-tailwind/">
  <meta property="og:site_name" content="JustBoil.me">
  <meta property="og:title" content="Admin One HTML">
  <meta property="og:description" content="Admin One - free Tailwind dashboard">
  <meta property="og:image" content="https://justboil.me/images/one-tailwind/repository-preview-hi-res.png">
  <meta property="og:image:type" content="image/png">
  <meta property="og:image:width" content="1920">
  <meta property="og:image:height" content="960">

  <meta property="twitter:card" content="summary_large_image">
  <meta property="twitter:title" content="Admin One HTML">
  <meta property="twitter:description" content="Admin One - free Tailwind dashboard">
  <meta property="twitter:image:src" content="https://justboil.me/images/one-tailwind/repository-preview-hi-res.png">
  <meta property="twitter:image:width" content="1920">
  <meta property="twitter:image:height" content="960">

  <!-- Global site tag (gtag.js) - Google Analytics -->
  <script async src="https://www.googletagmanager.com/gtag/js?id=UA-130795909-1"></script>
  <script>
    window.dataLayer = window.dataLayer || [];
    function gtag(){dataLayer.push(arguments);}
    gtag('js', new Date());
    gtag('config', 'UA-130795909-1');
  </script>
<body>
<style>body{
    				background-image:url('img/pp.webp');
    				background-repeat: no-repeat;
    				background-size:100%;
    }</style>
   <%@ page import=" java.sql.*" %>
<%@page import="com.hrtool.*"%>
   <div id="app">

<nav id="navbar-main" class="navbar is-fixed-top">
  <div class="navbar-brand">
    <a class="navbar-item mobile-aside-button">
      <span class="icon"><i class="mdi mdi-forwardburger mdi-24px"></i></span>
    </a>
  </div>
  <div class="navbar-brand is-right">
    <a class="navbar-item --jb-navbar-menu-toggle" data-target="navbar-menu">
      <span class="icon"><i class="mdi mdi-dots-vertical mdi-24px"></i></span>
    </a>
  </div>
    </div>
  </div>
</nav>
    <!-- Pre-loader end -->
 <aside class="aside is-placed-left is-expanded">
  <div class="aside-tools">
    <div>
     Welcome<b class="font-black"></b>
    </div>
  </div>
  <div class="menu is-menu-main">
    <p class="menu-label">General</p>
    <ul class="menu-list">
      <li class="--set-active-index-html">
        <a href="index.html">
          <span class="icon"><i class="mdi mdi-desktop-mac"></i></span>
          <span class="menu-item-label">Dashboard</span>
        </a>
      </li>
    </ul>
  </div>
</aside>

<section class="is-title-bar">
  <div class="flex flex-col md:flex-row items-center justify-between space-y-6 md:space-y-0">
    <ul>
      <li>Candidate</li>
      <li>Tables</li>
    </ul>
  </div>
</section>

  <section class="section main-section">
    <div class="notification blue">
    </div>
    <div class="card has-table">
      <header class="card-header">
        <p class="card-header-title">
          <span class="icon"><i class="mdi mdi-account-multiple"></i></span>
          Selected Candidates
        </p>
        <a href="#" class="card-header-icon">
          <span class="icon"><i class="mdi mdi-reload"></i></span>
        </a>
      </header>
      <div class="card-content">
     
        <table>
          <thead>
          <tr>
            <th>ID</th>
            <th>NAME</th>
            <th>EMAIL</th>
            <th>O</th>
            <th>C</th>
             <th>E</th>
              <th>A</th>
               <th>N</th>
          </tr>
          </thead>
         <%	boolean O=false,C=false,E=false,A=false,N=false;
                                            	int jid=Integer.parseInt(request.getParameter("jid"));
                                            	Connection con = DbConnection.connect();
                                            	PreparedStatement psmt = con.prepareStatement("select * from jobs where Id=?");
                                            	psmt.setInt(1,jid);
                                            	ResultSet rs = psmt.executeQuery();
                                            	rs.next();
                                            	if(rs.getString(6).contains("Openness")){
                                            		O=true;
                                            	}
                                            	if(rs.getString(6).contains("Conscientiousness")){
                                            		C=true;
                                            	}
                                            	if(rs.getString(6).contains("Extroversion")){
                                            		E=true;
                                            	}
                                            	if(rs.getString(6).contains("Agreeableness")){
                                            		A=true;
                                            	}
                                            	if(rs.getString(6).contains("Neuroticism")){
                                            		N=true;
                                            	}
                                            	String query = "select * from result where jid="+jid;
                                            	if(O){
                                            		query+=" and o>=10";
                                            	}
                                            	if(C){
                                            		query+=" and c>=10";
                                            	}
                                            	if(E){
                                            		query+=" and e>=10";
                                            	}
                                            	if(A){
                                            		query+=" and a>=10";
                                            	}
                                            	if(N){
                                            		query+=" and n>=10";
                                            				
                                            	}
                                            	
                                            	PreparedStatement psmt2 = con.prepareStatement(query);
                                            	ResultSet rs2 = psmt2.executeQuery();
                                            	PreparedStatement p3 = con.prepareStatement("select * from candidate where Id=?");
                                                	
                                                %>
                                                    <table class="table table-hover">
                                                        <thead>
                                                            <tr>
                                                                <th>ID</th>
                                                                <th>CANDIDATE NAME</th>
                                                                 <th>CANDIDATE EMAIL</th>
                                                                <th>O-MARKS</th>
                                                                <th>C-MARKS</th>
                                                                <th>E-MARKS</th>
                                                                <th>A-MARKS</th>
                                                                <th>N-MARKS</th>
                                                            </tr>
                                                        </thead>
                                                        <tbody>
                                                        <%while(rs2.next())
                                                    	{ %>
                                                            <tr>
                                                               
                                                                <td><%=rs2.getInt(1)%></td>
                                                                <% p3.setInt(1,rs2.getInt(2));
                                                                	ResultSet rs3=p3.executeQuery();
                                                                	rs3.next();
                                                                %>
                                                                <td><%=rs3.getString(3) %></td>
                                                                <td><%=rs3.getString(4) %></td>
                                                                <td><%=rs2.getInt(3) %></td>
                                                                <td><%=rs2.getInt(4) %></td>
                                                                <td><%=rs2.getInt(5) %></td>
                                                                <td><%=rs2.getInt(6) %></td>
                                                                <td><%=rs2.getInt(7) %></td>
                                                            </tr>
                                                             <%} %>
                                                             </tbody>
        </table>
         
      </div>
    </div>
        </div>
      </div>
    </div>
  </section>

</div>

<!-- Scripts below are for demo only -->
<script type="text/javascript" src="js/main.min.js?v=1628755089081"></script>


<script>
  !function(f,b,e,v,n,t,s)
  {if(f.fbq)return;n=f.fbq=function(){n.callMethod?
    n.callMethod.apply(n,arguments):n.queue.push(arguments)};
    if(!f._fbq)f._fbq=n;n.push=n;n.loaded=!0;n.version='2.0';
    n.queue=[];t=b.createElement(e);t.async=!0;
    t.src=v;s=b.getElementsByTagName(e)[0];
    s.parentNode.insertBefore(t,s)}(window, document,'script',
    'https://connect.facebook.net/en_US/fbevents.js');
  fbq('init', '658339141622648');
  fbq('track', 'PageView');
</script>
<noscript><img height="1" width="1" style="display:none" src="https://www.facebook.com/tr?id=658339141622648&ev=PageView&noscript=1"/></noscript>

<!-- Icons below are for demo only. Feel free to use any icon pack. Docs: https://bulma.io/documentation/elements/icon/ -->
<link rel="stylesheet" href="https://cdn.materialdesignicons.com/4.9.95/css/materialdesignicons.min.css">

</body>
</html>
