<%@page import="com.helper.UserModel"%>
<header>
	<div class="header-area ">
		<div id="sticky-header" class="main-header-area">
			<div class="container-fluid p-0">
				<div class="row align-items-center no-gutters">
					<div class="col-xl-2 col-lg-2">
						<div class="text-left">
							<a href="<%=request.getContextPath()%>/pages/index.jsp"> <img
								src="<%=request.getContextPath()%>/theme/img/logo.png" alt="">
								<h3 class="font-weight-bold text-white text-uppercase">Cradle
									of Life</h3>
							</a>
						</div>
					</div>
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
					<div class="col-xl-7 col-lg-7">
						<div class="main-menu  d-none d-lg-block float-right">
							<nav>
								<ul id="navigation">
									<%
										if (isAdmin) {
									%>

									<li><a class="active"
										href="<%=request.getContextPath()%>/pages/index.jsp">Home</a></li>
									<li><a
										href="<%=request.getContextPath()%>/pages/ngoinfo.jsp">Registered
											NGO LIST </a></li>

									<li><a
										href="<%=request.getContextPath()%>/pages/transactions.jsp">Transaction</a></li>
									<li><a
										href="<%=request.getContextPath()%>/pages/login.jsp">Log
											Out</a></li>
									<%
										}
									%>
									<%
										if (isUser) {
									%>
									<li><a class="active"
										href="<%=request.getContextPath()%>/pages/index.jsp">Home</a></li>

									<li><a
										href="<%=request.getContextPath()%>/pages/donation.jsp">Donation</a></li>
									<li><a
										href="<%=request.getContextPath()%>/pages/transactions.jsp">My Transaction</a></li>
									<li><a
										href="<%=request.getContextPath()%>/pages/aboutus.jsp">About
											US</a></li>

									<li><a
										href="<%=request.getContextPath()%>/pages/login.jsp">Log
											Out</a></li>
									<%
										}
									%>
									<%
										if (isNGO) {
									%>
									<li><a class="active"
										href="<%=request.getContextPath()%>/pages/index.jsp">Home</a></li>
									<li><a
										href="<%=request.getContextPath()%>/pages/aboutusNGo.jsp">About
											US</a></li>
									<li><a
										href="<%=request.getContextPath()%>/pages/login.jsp">Log
											Out</a></li>
									<%
										}
									%>
								</ul>
							</nav>
						</div>
					</div>

					<div class="col-12">
						<div class="mobile_menu d-block d-lg-none"></div>
					</div>
				</div>
			</div>
		</div>
	</div>
</header>
<!-- header-end -->