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
    PreparedStatement pst,pst1;
    String sur,pname,currentdate;
    ResultSet rs,rs1;
%>

<%
    try
    {
        DateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
        Calendar calfordate = Calendar.getInstance();
        currentdate = dateFormat.format(calfordate.getTime()).toString();
        url="jdbc:oracle:thin:@localhost:1521:XE";
        username="AMOL";
        password="12345";
        Class.forName("oracle.jdbc.driver.OracleDriver");
        
        con=DriverManager.getConnection(url,username,password);
        HttpSession ses=request.getSession(false);    
        sur = ses.getAttribute("resptname").toString();
        pname=request.getParameter("puser");
        pst=con.prepareStatement("select pname,pappdate,papptime,pappreason,selecteddoctor from pataintapointment where pappdate='"+currentdate+"' and pname='"+pname+"'" );
        rs=pst.executeQuery();
        rs.next();
        
        
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
							<li><a  data-hover="<%=sur%>" href="resptupdate.jsp"><%=sur%></a></li>
                                                        <li><a  data-hover="Patient List" href="ResptProfile.jsp">Patient List</a></li>
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
<div style="padding:100px 0px 600px 0px; background: url(images/banner.jpg);background-size: cover;">
    <div>
                            <div class="contact-top">
                                    <h3>BOOK APPOINTMENT</h3>
                                                                 
                            </div>
                            <div class="contact-bottom" style="margin-left:280px; ">
                            <form action="finalbooking" method="post" >                                  
                                    <div class="col-md-6 contact-right">
                                        <h5 style="color:white;">PATIENT NAME</h5>
                                        <input type="text"  name="username"  value="<%=rs.getString(1)%>" style="background-color:rgba(255,255,255,.5); width:670px; color: #843534; font-weight: bold; font-size:18px; border-radius: 15px; border:solid 2px white;" readonly>
                                        <br><h5 style="color:white;">APPOINTMENT DATE</h5>
                                        <input type="date"  name="apdate"  value="<%=rs.getString(2)%>" style="background-color:rgba(255,255,255,.5); width:670px; color: #843534; font-weight: bold; font-size:18px; border-radius: 15px; border:solid 2px white;" readonly>
                                        <br><h5 style="color:white;">APPOINTMENT TIME</h5>
                                        <input type="time"  name="aptime" value="<%=rs.getString(3)%>" style="background-color:rgba(255,255,255,.5); width:670px; color: #843534; font-weight: bold; font-size:18px; border-radius: 15px; border:solid 2px white;" readonly >                                        
                                        <br><h5 style="color:white;">REASON OF ILLNESS </h5>
                                        <input type="text"  name="reason" value="<%=rs.getString(4)%>" style="background-color:rgba(255,255,255,.5); width:670px; color: #843534; font-weight: bold; font-size:18px; border-radius: 15px; border:solid 2px white;" readonly >                                        
                                        <br><h5 style="color:white;">PATIENT REQUIRED DOCTOR </h5>
                                        <input type="text"  name="reason" value="<%=rs.getString(5)%>" style="background-color:rgba(255,255,255,.5); width:670px; color: #843534; font-weight: bold; font-size:18px; border-radius: 15px; border:solid 2px white;" readonly >                                        
                                        
                                        <br><h5 style="color:white;">DOCTOR NAME AND PRESENTY TIME</h5>
                                        <select  name="specialist" style="margin-top:15px; background-color:rgba(255,255,255,.5); width:670px; color: #843534; font-weight: bold; font-size:18px; border-radius: 15px; border:solid 2px white;">
                                            <%pst1=con.prepareStatement("select empname,SPECIALLIST,intime,outime from presenty where pdate='"+currentdate+"' and jobtype='Doctor'");
        rs1=pst1.executeQuery();
                                                while(rs1.next()){%>
                                            <option>
                                                <%out.print(""+rs1.getString(1)+"  ,  "+rs1.getString(3)+" - "+rs1.getString(4)+"  ,  "+rs1.getString(2)); %>                                          
                                            </option><%}%>
                                        </select>
                                        <input type="submit" value="APPOINTMENT BOOKED" style="margin-top:20px; width:670px; border-radius: 50px; background:#A73C46;">
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