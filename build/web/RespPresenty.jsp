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
    PreparedStatement pst;
    String sur,rname;
    ResultSet rs;
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
        HttpSession ses=request.getSession(false);    
        sur = ses.getAttribute("adminname").toString();
        
        rname=request.getParameter("ruser");
        pst=con.prepareStatement("select EMPNAME,JOBTYPE,PDATE,INTIME,OUTIME from presenty where EMPNAME='"+rname+"' order by pdate");
        rs=pst.executeQuery();
    }
    catch(Exception e)
    {       
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
<script>
    function validateFm(evt)
    {
        var charCode = (evt.which) ? evt.which : event.keyCode
        if (charCode < 47 || charCode > 58)
        {
        }
        else
        {
            alert("You cannot insert any numeric values");
            return false;
        }   
    }
</script>
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
							<li><a  data-hover="<%=sur%>" href="adminprofile.jsp"><%=sur%></a></li>
                                                        <li><a  data-hover="Create Account" href="AdminCreateAccount.html">Create Account</a></li>                                                       
                                                        <li><a  data-hover="Receptionist" href="ReceptionistRecords.jsp">Receptionist</a></li>
                                                        <li><a  data-hover="Doctor" href="DoctorRecords.jsp">Doctor</a></li>
                                                        <li><a  data-hover="Feedback" href="WebFeedback.jsp">Feedback</a></li>
							<li><a  data-hover="Logout" href="AdminLogout">Logout</a></li>
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
<div style="padding:100px 0px 700px 0px; background: url(images/banner.jpg);background-size: cover;">
    <div>
                            <div class="contact-top">
                                    <h3>Receptionist <%=rname%> Presenty</h3>
                            </div>
                            <center>
        <table width="80%">
            <tr>
                <td style="color:white; font-weight: bold; font-family:century gothics; font-size:15px; padding:10px 20px; margin:15px; background:rgba(65,24,27,.3);">
                    RECEPTIONIST NAME
                </td>
                <td style="color:white; font-weight: bold; font-family:century gothics; font-size:15px; padding:10px 20px; margin:15px; background:rgba(65,24,27,.3);">
                    JOB TYPE
                </td>
                <td style="color:white; font-weight: bold; font-family:century gothics; font-size:15px; padding:10px 20px; margin:15px; background:rgba(65,24,27,.3);">
                    PRESENT DATE
                </td>
                <td style="color:white; font-weight: bold; font-family:century gothics; font-size:15px; padding:10px 20px; margin:15px; background:rgba(65,24,27,.3);">
                    IN TIME
                </td>
                <td style="color:white; font-weight: bold; font-family:century gothics; font-size:15px; padding:10px 20px; margin:15px; background:rgba(65,24,27,.3);">
                    OUT TIME
                </td>               
            </tr>
        <%while (rs.next())
        {
            %>
            <tr>
                <td style="color:white; font-weight: bold; font-family:century gothics; font-size:15px; padding:7px 20px; margin:5px 5px;  background:rgba(65,24,27,.1);">
                    <%=rs.getString(1)%>
                </td>
                <td style="color:white; font-weight: bold; font-family:century gothics; font-size:15px; padding:7px 20px;  margin:5px 5px; background:rgba(65,24,27,.1);" >
                    <%=rs.getString(2)%>
                </td>
                <td style="color:white; font-weight: bold; font-family:century gothics; font-size:15px; padding:7px 20px;  margin:5px 5px; background:rgba(65,24,27,.1);">
                    <%=rs.getString(3)%>
                </td>
                <td style="color:white; font-weight: bold; font-family:century gothics; font-size:15px; padding:7px 20px;  margin:5px 5px;  background:rgba(65,24,27,.1);">
                    <%=rs.getString(4)%>
                </td>
                <td style="color:white; font-weight: bold; font-family:century gothics; font-size:15px; padding:7px 20px;  margin:5px 5px;  background:rgba(65,24,27,.1);">
                    <%=rs.getString(5)%>
                </td>                
            </tr>
      <%}%>
        </table>
    </center>
                                
                            
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