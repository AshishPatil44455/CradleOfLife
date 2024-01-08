<%@page import="com.helper.UserModel"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<%@include file="../tiles/inc.jsp"%>
</head>
<body>

	<%
		UserModel um = null;
		String role = "", name = "", uid = "";
		boolean isUser = false;
		boolean isAdmin = false;
		boolean isNGO = false; 
		if (session.getAttribute("USER_MODEL") != null) {
			um = (UserModel) session.getAttribute("USER_MODEL");
			if (um.getRoleid().equalsIgnoreCase("2")) { // user
				role = "User";
				uid = um.getUserid();
				isUser = true;
			} else if (um.getRoleid().equalsIgnoreCase("1")) {
				role = "NGO";
				uid = um.getUserid();
				isNGO = true;
			} else if (um.getRoleid().equalsIgnoreCase("3")) {
				role = "Administrator";
				uid = um.getUserid();
				isAdmin = true;
			}

		}
	%>
	<div class="slider_area ">
		<div
			class="single_slider d-flex align-items-center justify-content-center slider_bg_1">
			<div class="container">
				<div class="row">
					<div class="col-xl-5 col-lg-6">
						<div class="single_about_info">
							<h1 style=font-size:50px>
								Cradle Of Life
							</h1>
							<h4 class="text-info font-bold">Every moment counts in the fragile early hours of a
								newborn's life. Help us ensure they receive the vital care they
								need by donating towards the installation of state-of-the-art
								baby incubators. Your generosity can make a life-changing
								difference.</h4>
								<a href="#form_login"
								class="login popup-with-form genric-btn success circle ">Let's
								Log In</a>
						</div>
					</div>
				</div>
				<div class="row align-items-center justify-content-center">
					<div class="col-xl-7 col-md-7">
						<div class="slider_info">							
							<h4 class="text-dark font-italic">
								"It's not just about funding. </br>It's about belief, momentum, and
								shared dreams."
							</h4>

						

						</div>
					</div>

					<!-- Sign in-->
					<form id="form_login" class="white-popup-block mfp-hide"
						action="javascript:fnSubmit();">
						<div class="popup_box ">
							<div class="popup_inner">
								<div class="logo text-center">
									<a href="#"> <img
										src="<%=request.getContextPath()%>/theme/img/logo.png" alt="">
									</a>
								</div>
								<h3>Sign in</h3>

								<div class="row">
									<div class="col-xl-12 col-md-12">
										<input type="text" name="username" id="username"
											placeholder="User Name">
									</div>
									<div class="col-xl-12 col-md-12">
										<input type="password" name="password" id="password"
											placeholder="Password">
									</div>
									<div class="col-xl-12">
										<button type="submit" class="boxed_btn_orange">Sign
											in</button>
									</div>
								</div>

								<p class="dont-hav-acc">
									Not Register? <a class="dont-hav-acc" href="#reg_form">Sign
										Up</a>
								</p>
							</div>
						</div>
					</form>
					<!-- form itself end -->

					<!--Registration form -->
					<form id="reg_form" class="white-popup-block mfp-hide"
						action="javascript:fnReg();">
						<div class="col-xl-12 col-md-12">
							<div class="popup_box">
								<div class="popup_inner">
									<h3>Registration</h3>

									<!-- Role Selection -->
									<div class="row">
										<div class="col-xl-12 col-md-12 mb-4">
											<h4 class="text-dark">Who are you?:</h4>
											<select id="roleid" name="roleid" onchange="fnData();">
												<option value="0">Select Role</option>
												<option value="1">NGO</option>
												<option value="2">Donator</option>
												<option value="3">Admin</option>
											</select>
										</div>
									</div>

									<!-- NGO Form Fields -->
									<div id="NGOForm" style="display: none;">
										<div class="col-xl-12 col-md-12">
											<input type="text" name="ngo" id="ngo"
												placeholder="Enter NGO Name">
										</div>
									</div>

									<!-- Common Fields for all roles -->

									<div class="col-xl-12 col-md-12">
										<input type="email" name="email" id="email"
											placeholder="Enter Email">
									</div>
									<div class="col-xl-12 col-md-12">
										<input type="text" name="address" id="address"
											placeholder="Enter Address">
									</div>
									<div class="col-xl-12 col-md-12">
										<input type="text" name="phoneno" id="phoneno"
											pattern="[0-9]{10}" title="Accepted 10 Digit Only"
											placeholder="Mobile Number" required="required">
									</div>
									<!-- User Form Fields -->
									<div id="UserForm" style="display: none;">
										<div class="col-xl-12 col-md-12">
											<input type="text" name="fname" id="fname"
												placeholder="Enter First Name">
										</div>
										<div class="col-xl-12 col-md-12">
											<input type="text" name="lname" id="lname"
												placeholder="Enter Last Name">
										</div>
										<div class="col-xl-12 col-md-12">
											<input type="text" name="pancardno" id="pancardno"
												pattern="^[A-Z]{5}\d{4}[A-Z]{1}$"
												title="Accepted 10 Digit Only"
												placeholder="Enter PAN card No.">
										</div>
									</div>

									<!-- Admin Form Fields -->
									<div id="AdminForm" style="display: none;">
										<div class="col-xl-12 col-md-12">
											<input type="text" name="name" id="adminname"
												placeholder="Enter Name">
										</div>
									</div>

									<!-- Common Fields for username and password -->
									<div class="col-xl-12 col-md-12">
										<input type="text" name="username" id="username"
											placeholder="Enter Username">
									</div>
									<div class="col-xl-12 col-md-12">
										<input type="password" name="password" id="password"
											placeholder="Password">
									</div>
									<div class="col-xl-12 col-md-12">
										<input type="password" name="cpassword" id="cpassword"
											placeholder="Confirm password"> <span
											class="font-weight-bold text-center" id='message'></span>
									</div>
									<div class="col-xl-12 d-flex justify-content-center">
										<button type="submit" class="boxed_btn_orange">Sign
											Up</button>
									</div>
								</div>
							</div>
						</div>
					</form>

					<!-- form itself end -->

				</div>
			</div>
		</div>
	</div>
	<%@include file="../tiles/footer_inc.jsp"%>
</body>
<script type="text/javascript">
$('#password, #cpassword').on('keyup', function () {
	  if ($('#password').val() == $('#cpassword').val()) {
	    $('#message').html('Matching').css('color', 'cyan');
	  } else 
	    $('#message').html('Not Matching').css('color', 'red');
	});
	</script>
<script type="text/javascript">
function fnData() {
    var selectedRole = document.getElementById("roleid").value;

    // Hide all form sections by default
    document.getElementById("NGOForm").style.display = "none";
    document.getElementById("UserForm").style.display = "none";
    document.getElementById("AdminForm").style.display = "none";

    // Display appropriate form sections based on the selected role
    if (selectedRole == "1") { // NGO
        document.getElementById("NGOForm").style.display = "block";
    } else if (selectedRole == "2") { // Donator/User
        document.getElementById("UserForm").style.display = "block";
    } else if (selectedRole == "3") { // Admin
        document.getElementById("AdminForm").style.display = "block";
    }
}

function fnSubmit(){	
	var str = $("#form_login" ).serialize();
	//alert(str);
	$.post("<%=request.getContextPath()%>/tiles/ajax.jsp?methodId=checkLogin",str, function(data) {
		
		                    data = $.trim(data);
								if (data==1) {	
<%-- 									if(<%=um.getRoleid()%>=="1"){ --%>
                               window.location.href = "<%=request.getContextPath()%>/pages/index.jsp";    
<%-- 									}if(<%=um.getRoleid()%>=="2"){ --%>
<%-- 										WINDOW.LOCATION.HREF="<%=REQUEST.GETCONTEXTPATH()%>/PAGES/ADDSTATION.JSP";     --%>
								//	}
								     
									
							}else {
								alert("Please Enter Valid Credentials");
							}
							$('#form_login')[0].reset();
						});
}


	//registration form
	function fnReg(){
	var str = $("#reg_form").serialize();
// 	alert(str);
	$.post("<%=request.getContextPath()%>/tiles/ajax.jsp?methodId=registerNewUser",
						str, function(data) {
							data = $.trim(data);
							if (data==1) {
								
								window.location.href="<%=request.getContextPath()%>/pages/login.jsp";
							} else {
								alert("Error");
							}
							$('#reg_form')[0].reset();
						});
	}
</script>
</html>