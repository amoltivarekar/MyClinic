<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Calendar"%>
<%@page import="java.text.DateFormat"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%!
    Connection con;
    String username;
    String password;
    String url;
    PreparedStatement pst,pst1,pst2;
    String sur,pnm,apd,drn;
    ResultSet rs,rs1,rs2;
%>

<%
    try
    {   
        DateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
        Calendar calfordate = Calendar.getInstance();
        String currentdate = dateFormat.format(calfordate.getTime()).toString();
        url="jdbc:oracle:thin:@localhost:1521:XE";
        username="AMOL";
        password="12345";
        Class.forName("oracle.jdbc.driver.OracleDriver");
        con=DriverManager.getConnection(url,username,password);
     
        con=DriverManager.getConnection(url,username,password);
        HttpSession ses=request.getSession(false);    
        sur = ses.getAttribute("resptname").toString();
        
        pst=con.prepareStatement("select PNAME from PATAINTSELFINFO");
        rs=pst.executeQuery();

    }
    catch(Exception e)
    {      
        out.print("hello exception :"+e);
    }
%>
<html>
<head>
<title>Dr.Care a Medical Hospital </title>
<link href="css/bootstrap.css" rel="stylesheet" type="text/css" media="all">
<!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
<script src="js/jquery-1.11.0.min.js"></script>
<!-- Custom Theme files -->
<link href="css/style.css" rel="stylesheet" type="text/css" media="all"/>
<!-- Custom Theme files -->
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="keywords" content="Dr.Care Responsive web template, Bootstrap Web Templates, Flat Web Templates, Android Compatible web template, 
Smartphone Compatible web template, free webdesigns for Nokia, Samsung, LG, SonyEricsson, Motorola web design" />
<script type="application/x-javascript"> addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false); function hideURLbar(){ window.scrollTo(0,1); } </script>
<!--Google Fonts-->
<link href='//fonts.googleapis.com/css?family=Cambo' rel='stylesheet' type='text/css'>
<link href='//fonts.googleapis.com/css?family=Hind:400,300,500,600,700' rel='stylesheet' type='text/css'>
<!-- start-smoth-scrolling -->
<script type="text/javascript" src="js/move-top.js"></script>
<script type="text/javascript" src="js/easing.js"></script>
	<script type="text/javascript">
			jQuery(document).ready(function($) {
				$(".scroll").click(function(event){		
					event.preventDefault();
					$('html,body').animate({scrollTop:$(this.hash).offset().top},1000);
				});
			});
	</script>
<!-- //end-smoth-scrolling -->
<link rel="stylesheet" type="text/css" href="css/style_common.css" />
<link rel="stylesheet" type="text/css" href="css/style4.css" />

<style>
    input [type='submite']:visited{color:red}
</style>
</head>
<body>
<!--header start here-->
<div class="header">
	<div class="container">
		<div class="header-main">
			<div class="header-left">
				<div class="logo">
				   <h1><a href="index.html">Dr.Care</a></h1>
                                </div>
				<div class="social-icons">
					<ul>
						<li><a href="https://www.facebook.com/login/"><span class="fa"> </span></a></li>
						<li><a href="https://twitter.com/login"><span class="tw"> </span></a></li>
						<li><a href="https://plus.google.com/collections/featured"><span class="ga"> </span></a></li>
					</ul>
				</div>
				 <div class="clearfix"> </div>
			  </div>
				<div class="top-navg">
					   <span class="menu"> <img src="images/icon.png" alt=""/></span>
					<nav class="cl-effect-16">
						<ul class="res">
							<li><a  data-hover="<%=sur%>" href="resptupdate.jsp"><%=sur%></a></li>
                                                        <li><a  data-hover="Patient List" href="ResptProfile.jsp">Patient List</a></li>
                                                        <li><a  data-hover="Bill" href="RespBill.jsp">Bill</a></li>
                                                        <li><a  data-hover="Doctor" href="DoctorList.jsp">Doctor</a></li>
							<li><a  data-hover="Logout" href="ResptLogout">Logout</a></li>
						</ul>
					<!-- script-for-menu -->
						 <script>
						   $( "span.menu" ).click(function() {
							 $( "ul.res" ).slideToggle( 300, function() {
							 // Animation complete.
							  });
							 });
						</script>
					</nav>
				</div>
			<div class="clearfix"> </div>
		</div>
	</div>
</div>
<!--header end here-->
<!--content start here-->
<div style="padding:100px 0px 350px 0px; background: url(images/banner.jpg);background-size: cover;">
    <div>
                            <div class="contact-top">
                                <h3>Dr.Care Clinic</h3>
                                    <p>Santacurz west , Premnagar, Express Highway</p>                                    
                            </div>
                            <div class="contact-bottom" style="margin-left:280px; ">
                                <form action="RespBill1.jsp" method="post" >                                  
                                        <div class="col-md-6 contact-right">
                                            <table width="100%">
                                                <tr >
                                                    <td style="font-weight: bold; color: #A73C46;">PATIENT NAME</td>
                                                    <td style="padding-left:150px;"><select  name="PatientName" style="background-color:rgba(255,255,255,.5); width:450px; color: #843534; font-weight: bold; font-size:18px; border-radius: 15px; border:solid 2px white; margin-bottom:20px;" required><%while(rs.next()){%><option><%=rs.getString(1)%></option><%}%></select></td>
                                                </tr>
                                                <tr>
                                                    <td style="font-weight: bold; color: #A73C46;">APPOINTMENT DATE</td>
                                                    <td style="padding-left:150px;"><input type="date"  name="AppoDate"  style="background-color:rgba(255,255,255,.5); width:450px; color: #843534; font-weight: bold; font-size:18px; border-radius: 15px; border:solid 2px white;"></td>
                                                </tr>
                                                <tr>
                                                    <td style="font-weight: bold;  color: #A73C46;">APPOINTMENT TIME</td>
                                                    <td style="padding-left:150px;"><input type="time"  name="AppoTime"  style="background-color:rgba(255,255,255,.5); width:450px; color: #843534; font-weight: bold; font-size:18px; border-radius: 15px; border:solid 2px white;"></td>
                                                </tr>
                                                <% pst1=con.prepareStatement("select DNAME from DOCTORSELFINFO");
                                                rs1=pst1.executeQuery();%>
                                                <tr>
                                                    <td style="font-weight: bold;  color: #A73C46;">DOCTOR NAME</td>
                                                    <td style="padding-left:150px;"><select  name="DrName" style="background-color:rgba(255,255,255,.5); width:450px; color: #843534; font-weight: bold; font-size:18px; border-radius: 15px; border:solid 2px white; margin-top:10px;" required><%while(rs1.next()){%><option><%=rs1.getString(1)%></option><%}%></select></td>
                                                </tr>
                                                </tr>
                                            </table>
                                            <input type="submit" value="Submit" style="margin-top:20px;margin-left:20px; width:670px; border-radius: 50px; font-weight: bold; font-size:20px;">
                                </form>
                                                                                        
                                        </div>
                            </div>
                            
    </div>
</div>
<!--content end here-->
<!--footer strat here-->
<div class="footer">
	<div class="container">
		<div class="footer-main">
		   <div class="col-md-4 ftr-grid">
		   	<h4>About Us</h4>
		   	<p>The Clinic will maximize all of its resources to support each patient's healthy lifestyle. We provide total health support, from examinations and treatment to health management.</p>
		   </div>
		   <div class="col-md-4 ftr-grid">
		   	<h4>Address</h4>
		   	<p>Santacurz west</p>
		   	<p>Near to Hub Mall</p>
		   	<p>Ph:+1285 587 624</p>
		   </div>
		   <div class="col-md-4 ftr-grid">
		   	<h4>Newsletter</h4>
		   	<input type="text" value="Email" onfocus="this.value = '';" onblur="if (this.value == '') {this.value = 'Name';}">
		   	<input type="submit" value="Subscribe">
		   </div>
		  
	    </div>
	</div>

		<script type="text/javascript">
										$(document).ready(function() {
											/*
											var defaults = {
									  			containerID: 'toTop', // fading element id
												containerHoverID: 'toTopHover', // fading element hover id
												scrollSpeed: 1200,
												easingType: 'linear' 
									 		};
											*/
											
											$().UItoTop({ easingType: 'easeOutQuart' });
											
										});
									</script>
						<a href="#" id="toTop" style="display: block;"> <span id="toTopHover" style="opacity: 1;"> </span></a>

</div>
<!--footer end here-->
</body>
</html>