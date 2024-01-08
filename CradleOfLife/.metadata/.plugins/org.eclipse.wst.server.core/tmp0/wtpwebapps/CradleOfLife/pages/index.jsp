<%@page import="java.util.HashMap"%>
<%@page import="java.util.List"%>
<%@page import="com.helper.DBUtils"%>
<%@page import="com.helper.UserModel"%>
<%@page import="com.helper.NGOModel"%>
<%@page import="com.database.ConnectionManager"%>
<%@ page import="java.time.LocalDate"%>
<%@ page import="java.time.format.DateTimeFormatter"%>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<%@include file="../tiles/inc.jsp"%>
</head>
<body>
	<%@include file="../tiles/nav.jsp"%>
	<%
		LocalDate currentDate = LocalDate.now();
		DateTimeFormatter formatter = DateTimeFormatter.ofPattern("dd MMM");
		String formattedDate = currentDate.format(formatter);

		String userId = um.getUserid();
		String Uname = um.getName();
		String ngo = um.getNgo();
		String currbal = um.getTbal();
		System.out.println(um.getName() + "::" + currbal);
		if (currbal == null) {
			currbal = "0";
		}

		List list = DBUtils.getBeanList(UserModel.class,
				"SELECT SUM(tbal) as TotalBalance FROM transaction");
	%>
	<div class="bradcam_area breadcam_bg overlay2">
		<div class="slider_area ">
			<div
				class="single_slider d-flex align-items-center justify-content-center slider_bg_1">
				<div class="container">

					<div class="row align-items-center justify-content-center">

						<%
							if (isAdmin) {
						%>
						<form id="form_funds" action="javascript:fnSubmit();">
							<div class="fade-left">
								<div id="note" class="alert alert-warning" role="alert">
									Welcome <span class="text-capitalize text-dark"><%=Uname%></span>
								</div>
							</div>
							<div class="popup_box ">
								<div class="popup_inner">
									<h3>Total Over All Collection</h3>
									<div class="row">
										<div class="col-xl-6 col-md-6"></div>
										<div class="col-xl-6 col-md-6"></div>
										<div class="col-xl-4 col-md-4 mt-4">
											<h2 class="text-white">Funds :</h2>
										</div>
										<div class="col-xl-4 col-md-4 mt-4">
											<%
												if (list.size() > 0) {
														um = (UserModel) list.get(0);
														if(um.getTotalBalance() == null){
											%>
											<h1 class="text-warning" id="fare" name="funds">
												0</h1>
												<%}else{ %>
											<h1 class="text-warning" id="fare" name="funds">
												<%=um.getTotalBalance()%></h1>
													<%
											}
										%>
										</div>
										<%
											}
										%>
										<!-- 										<div class="col-xl-4 mt-4  text-center"> -->
										<!-- 											<button type="submit" class=" genric-btn success circle">Transfer -->
										<!-- 											</button> -->
										<!-- 										</div> -->
									</div>
								</div>
							</div>
						</form>

						<%
							}
						%>
						<%
							if (isNGO) {
						%>
						<form id="form_journey" action="javascript:fnSubmit();">
							<div class="fade-left">
								<div id="note" class="alert alert-warning" role="alert">
									Welcome <span class="text-capitalize text-dark"><%=ngo%></span>
								</div>
							</div>
							<h1>Funds for NGOs Contact us at:</h1><br>
						<a href="mailto:cradleoflife@gmail.com" style="color: blue; font-size: 1.8em;">cradleoflife@gmail.com</a>
						<h2 style="color:black ; font-size:1.8em">or +917276507759</h2>
						<br>
						
							<!--  <div class="popup_box ">
								<div class="popup_inner">
									<h3>Total Over ALL Collection</h3>
									<div class="row">
										<div class="col-xl-6 col-md-6"></div>
										<div class="col-xl-6 col-md-6"></div>
										<div class="col-xl-4 col-md-4 mt-4">
											<h2 class="text-white">Funds :</h2>
										</div>
										<div class="col-xl-4 col-md-4 mt-4">
											<%
												if (list.size() > 0) {
														um = (UserModel) list.get(0);
														if(um.getTotalBalance() == null){
											%>
											<h1 class="text-warning" id="fare" name="funds">
												0</h1>
												<%}else{ %>
											<h1 class="text-warning" id="fare" name="funds">
												<%=um.getTotalBalance()%></h1>
													<%
											}
										%>
										</div>
										<%
											}
										%>

									</div>
								</div>
							</div>-->
							
       
    
						</form>
						<%
							}
						%>
						<%
							if (isUser) {
						%>
						<div class="fade-left">
							<div id="note" class="alert alert-warning" role="alert">
								Welcome <span class="text-capitalize text-dark"><%=Uname%></span>
							</div>
						</div>
						<div class="col-xl-12 col-md-12">

						<article class="blog_item bg-white">
						<div class="blog_item_img">
							<img class="card-img rounded-0" src="img/blog/single_blog_4.png"
								alt=""> <a href="#" class="blog_item_date">
								<p><%=formattedDate%></p> 
														</a>
						</div>

						<div class="blog_details">
							<a class="d-inline-block" href="single-blog.html">
								<h2>Raising Hope and Lives: The Baby Incubator Crowdfunding
									Campaign</h2>
							</a>
							<p>Before we delve deep into the importance of our campaign,
								let's quickly understand the lifeline we're talking about: the
								baby incubator. A baby incubator is a vital piece of medical
								equipment designed to provide newborns, especially premature
								babies, with the ideal environment to continue growing after
								birth. This environment mimics the warmth, humidity, and
								protective surroundings of a mother's womb.</p>
							<ul class="blog-info-link">
								<li><a href="#"><i class="fa fa-user"></i>Author</a></li>

							</ul>
							
						</div>
						
						</article>
					</div>
						
						<%
							}
						%>


					</div>
					
					<div class="col-xl-12 col-md-">

						<div class="alert alert-primary mt-2 mb-2" role="alert">
							<h4>Distribution Funds Incubators With NGOs</h4>

						</div>
						<div id="map"></div>

					</div>
				</div>
			</div>
			<%@include file="../tiles/footer.jsp"%>
		</div>
	</div>
	<%@include file="../tiles/footer_inc.jsp"%>
</body>
<script async defer
	src="https://maps.googleapis.com/maps/api/js?key=AIzaSyA3f5FY7C1DezvMd99zjHNtAbJLxFGGzvQ&callback=initMap">
    </script>
<script>
function initMap() {
    const map = new google.maps.Map(document.getElementById('map'), {
        zoom: 4,
        center: {lat: 20, lng: 0} // Default center
    });
    
    <%List ngoList = DBUtils.getBeanList(NGOModel.class,
					"SELECT * FROM ngodata");
			NGOModel nm = null;
			for (int i = 0; i < ngoList.size(); i++) {
				nm = (NGOModel) ngoList.get(i);%>
    var marker = new google.maps.Marker({
        position: {lat: <%=nm.getLat()%>, lng: <%=nm.getLongt()%>}, //Latitude and Longitude Specified
        map: map,
        title: "<%=nm.getNgoname()%>"
    });
    <%}%>
}

google.maps.event.addDomListener(window, 'load', initMap);
</script>
<script>
function fnSubmit(){
	var str = $("#form_funds").serialize();
	
	$.post("<%=request.getContextPath()%>/tiles/ajax.jsp?methodId=totalFunds",
						str, function(data) {
							data = $.trim(data);
							document.getElementById('fare').innerHTML = data;
						});
	}

	$("#note").show().delay(5000).hide(0);
</script>


</html>