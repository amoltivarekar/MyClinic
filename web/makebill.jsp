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
    PreparedStatement pst;
    String sur,pnm;
    ResultSet rs;
%>

<%
    try
    {   pnm = request.getParameter("puser");
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
        sur = ses.getAttribute("doctorname").toString();
        
        pst=con.prepareStatement("select * from finalbooking where appdate='"+currentdate+"' and pname='"+pnm+"'");
        rs=pst.executeQuery();
        rs.next();
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
    function validatephno(evt)
    {
        var charCode = (evt.which) ? evt.which : event.keyCode
        if (charCode < 47 || charCode > 58)
        {
            alert("You cannot insert any Alphabetic character ");
            return false;
        }      
    }
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
							<li><a  data-hover="<%=sur%>" href="DoctorProfile.jsp"><%=sur%></a></li>
                                                        <li><a  data-hover="Patient List" href="DoctorAccount.jsp">Patient List</a></li>                                                        
							<li><a  data-hover="Logout" href="DoctorLogout">Logout</a></li>
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
<div style="padding:100px 0px 1250px 0px; background: url(images/banner.jpg);background-size: cover;">
    <div>
                            <div class="contact-top">
                                <h3>Dr.Care Clinic</h3>
                                    <p>Santacurz west , Premnagar, Express Highway</p>                                    
                            </div>
                            <div class="contact-bottom" style="margin-left:280px; ">
                                <form action="PatientBill" method="post" >                                  
                                        <div class="col-md-6 contact-right">
                                            <table width="100%">
                                                <tr >
                                                    <td >PATIENT NAME</td>
                                                    <td style="padding-left:150px;"><input type="text"  name="PatientName" readonly value="<%=rs.getString(1)%>" style="background-color:rgba(255,255,255,.5); width:450px; color: #843534; font-weight: bold; font-size:18px; border-radius: 15px; border:solid 2px white;" onkeypress="return validateFm(event)" required></td>
                                                </tr>
                                                <tr>
                                                    <td>APPOINTMENT DATE</td>
                                                    <td style="padding-left:150px;"><input type="text"  name="AppoDate" readonly value="<%=rs.getString(2)%>" style="background-color:rgba(255,255,255,.5); width:450px; color: #843534; font-weight: bold; font-size:18px; border-radius: 15px; border:solid 2px white;" required></td>
                                                </tr>
                                                <tr>
                                                    <td>APPOINTMENT TIME</td>
                                                    <td style="padding-left:150px;"><input type="text"  name="AppoTime" readonly value="<%=rs.getString(3)%>" style="background-color:rgba(255,255,255,.5); width:450px; color: #843534; font-weight: bold; font-size:18px; border-radius: 15px; border:solid 2px white;" required></td>
                                                </tr>
                                                <tr>
                                                    <td>REASON OF ILLNESS</td>
                                                    <td style="padding-left:150px;"><textarea readonly class="col-md-6 contact-left" style="width:450px; height:70px; background-color:rgba(255,255,255,.5); color: #843534; font-weight: bold; font-size:18px; border-radius: 15px; border:solid 2px white;"  name="Reason" required><%=rs.getString(4)%></textarea></td>
                                                </tr>
                                                <tr>
                                                    <td>DOCTOR NAME</td>
                                                    <td style="padding-left:150px;"><input type="text"  name="DrName" readonly value="<%=sur%>" style="background-color:rgba(255,255,255,.5); width:450px; color: #843534; font-weight: bold; font-size:18px; border-radius: 15px; border:solid 2px white; margin-top:10px;" required></td>
                                                </tr>
                                            </table>
                                                <table style="width:700px; margin-top:50px;">
                                                    <tr>
                                                        <td style="color:white; padding-left:50px; font-weight: bold; font-family:century gothics; font-size:15px; padding:10px 20px; margin:15px; background:rgba(65,24,27,.3);" readonly>
                                                            DESCRIPTION
                                                        </td>                                                       
                                                        <td style="color:white; padding-left:50px; font-weight: bold; font-family:century gothics; font-size:15px; padding:10px 20px; margin:15px; background:rgba(65,24,27,.3);" readonly>
                                                            QUANTITY
                                                        </td>                                                        
                                                    </tr>
                                                    <%int i=1;for(i=1;i<=7;i++){%>
                                                    <tr>
                                                        <td>
                                                            <input type="text" name="des<%=i%>" >
                                                        </td>                                                        
                                                        <td>
                                                            <input type="text" name="qty<%=i%>" id="q<%=i%>" onblur="ptotal<%=i%>()" onkeypress="return validatephno(event)">
                                                        </td>                                                        
                                                    </tr>
                                                    <%}%>
                                                    <tr>
                                                        <td>
                                                            <a style="font-weight: bold; text-decoration: none;" >DOCTOR FEES</a>
                                                        </td>
                                                        <td>
                                                            <input type="text" name="drfees" onblur="dfees()" id="dfee" style="font-size:20px; font-weight:bold;"onkeypress="return validatephno(event)">
                                                        </td>
                                                    </tr>                                                    
                                                </table>
                                            <input type="submit" value="Submit" style="margin-top:20px; width:670px; border-radius: 50px; font-weight: bold; font-size:20px;">
                                        </div>                                    
                                </form>
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