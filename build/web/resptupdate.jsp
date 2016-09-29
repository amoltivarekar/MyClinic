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
    String url,currentdate;
    PreparedStatement pst;
    String sur;
    ResultSet rs;
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
        
        pst=con.prepareStatement("select * from resptselfinfo where rname='"+sur+"'");
        rs=pst.executeQuery();
        rs.next();
    }
    catch(Exception e)
    {
        
    }
%>
<html>
<head>
<title>Dr.Care a Medical Hospital category Flat bootstrap Responsive  Website Template | Home :: w3layouts</title>
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
                                    <h3>My Profile</h3>
                                    <p>If you want to update, then you update your profile here.</p>                                    
                            </div>
                            <div class="contact-bottom" style="margin-left:280px; ">
                            <form action="resptupdateinfo" method="post" >                                  
                                    <div class="col-md-6 contact-right">
                                        <input placeholder="Full Name" type="text"  name="username"  value="<%=rs.getString(1)%>" style="background-color:rgba(255,255,255,.5); width:670px; color: #843534; font-weight: bold; font-size:18px; border-radius: 15px; border:solid 2px white;" onkeypress="return validateFm(event)" required>
                                        <input placeholder="Email Address" type="email"  name="useremail" value="<%=rs.getString(2)%>" style="background-color:rgba(255,255,255,.5); width:670px; color: #843534; font-weight: bold; font-size:18px; border-radius: 15px; border:solid 2px white;" required>
                                        <textarea placeholder="Address" class="col-md-6 contact-left" style="width:670px; height:120px; background-color:rgba(255,255,255,.5); color: #843534; font-weight: bold; font-size:18px; border-radius: 15px; border:solid 2px white;"  name="address" required><%=rs.getString(3)%></textarea>
                                        <input placeholder="Mobile Number" style="margin-top:15px; background-color:rgba(255,255,255,.5); width:670px; color: #843534; font-weight: bold; font-size:18px; border-radius: 15px; border:solid 2px white;" type="text"  name="mobno" value="<%=rs.getString(4)%>" onkeypress="return validatephno(event)" required >
                                        <input placeholder="Username" type="text"  name="user" value="<%=rs.getString(5)%>"  style="background-color:rgba(255,255,255,.5); width:670px; color: #843534; font-weight: bold; font-size:18px; border-radius: 15px; border:solid 2px white;" required>
                                        <input placeholder="Password" type="password"  name="password" value="<%=rs.getString(6)%>"  style="background-color:rgba(255,255,255,.5); width:670px; color: #843534; font-weight: bold; font-size:18px; border-radius: 15px; border:solid 2px white;" required>                                        
                                        <input type="submit" value="Update" style="margin-top:20px; width:670px; border-radius: 50px;">
                                    </div>                                    
                            </form>
                            </div>
                            
    </div>
</div>
<!--content end here-->
<!--footer strat here-->
<div class="footer">
    <div class="contact-bottom" style="margin-left:20px ;">
                            <form action="presenty" method="post" >                                  
                                    <div class="col-md-6 contact-right">
                                        <input placeholder="Full Name" type="text"  name="username"  value="<%=rs.getString(1)%>" style="background-color:rgba(255,255,255,.5); width:400px; color: #843534; font-weight: bold; font-size:18px; border-radius: 15px; border:solid 2px white;" onkeypress="return validateFm(event)" readonly>
                                        <input placeholder="Employee Type" type="text"  name="jobtype"  value="Receptionist" style="background-color:rgba(255,255,255,.5); width:400px; color: #843534; font-weight: bold; font-size:18px; border-radius: 15px; border:solid 2px white;" onkeypress="return validateFm(event)" readonly>
                                        <input type="date"  name="date" value="<%out.print(""+currentdate);%>" style="background-color:rgba(255,255,255,.5); width:400px; color: #843534; font-weight: bold; font-size:18px; border-radius: 15px; border:solid 2px white;" readonly >                                        
                                        <br><h5 style="color:white;">INCOMING TIME</h5>
                                        <input type="time"  name="intime" style="margin-top:15px; background-color:rgba(255,255,255,.5); width:400px; color: #843534; font-weight: bold; font-size:18px; border-radius: 15px; border:solid 2px white;">
                                        <br><h5 style="color:white;">OUTGOING TIME</h5>
                                        <input type="time"  name="outtime" style="background-color:rgba(255,255,255,.5); width:400px; color: #843534; font-weight: bold; font-size:18px; border-radius: 15px; border:solid 2px white;">                                        
                                        <input type="submit" value="PRESENTY" style="margin-top:20px; width:400px; border-radius: 50px; background:#A73C46;">
                                    </div>                                    
                            </form>                                    
                            </div>
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