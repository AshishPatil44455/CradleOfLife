<%@page import="com.database.ConnectionManager"%>
<%@ page import="com.helper.DBUtils"%>
<%@page import="java.util.List"%>
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
		String userId = um.getUserid();

		List list = DBUtils.getBeanList(UserModel.class,
				"SELECT * FROM transaction WHERE tuserid  LIKE '" + userId
						+ "' ");
		List list2 = DBUtils.getBeanList(UserModel.class,
				"SELECT * FROM transaction");
		System.out.print(userId + "," + um.getName());
	%>
	<div class="bradcam_area breadcam_bg overlay2">
		<div class="slider_area ">
			<div
				class="single_slider d-flex align-items-center justify-content-center slider_bg_1">
				<div class="container">
				<%if (isAdmin){ %>
					<div class="table-responsive">
						<table class="table table-bordered table-hover">
							<thead class="thead-dark">
								<tr>
									<th scope="col">Sr. No</th>
									<th scope="col">Donator</th>
									<th scope="col">Funds</th>									
									<th scope="col">Date/Time</th>
								</tr>
							</thead>
							<tbody>
								<%
									for (int i = 0; i < list2.size(); i++) {
										um = (UserModel) list2.get(i);
										String userid=um.getTuserid();
										String Donorname=ConnectionManager.getUserName(userid);
										System.out.print("name:"+userid+":"+Donorname);
								%>
								<tr id=<%=i + 1%>>
									<th scope="row"><%=i + 1%></th>
										<th scope="col"><%=Donorname%></th>
									<td><i class="fas fa-rupee-sign"></i><%=um.getTamt()%></td>
									<td><%=um.getTtime()%></td>
								</tr>

							</tbody>
							<%
								}
							%>
						</table>

					</div>
					<%} %>
				
				
					<%if (isUser){ %>
					<div class="table-responsive">
						<table class="table table-bordered table-hover">
							<thead class="thead-dark">
								<tr>
									<th scope="col">Sr. No</th>
									<th scope="col">Funds</th>
									<th scope="col">Date/Time</th>
								</tr>
							</thead>
							<tbody>
								<%
									for (int i = 0; i < list.size(); i++) {
										um = (UserModel) list.get(i);
								%>
								<tr id=<%=i + 1%>>
									<th scope="row"><%=i + 1%></th>
									<td><i class="fas fa-rupee-sign"></i><%=um.getTamt()%></td>
									<td><%=um.getTtime()%></td>
								</tr>

							</tbody>
							<%
								}
							%>
						</table>

					</div>
					<%} %>
				</div>
				</div>
			</div>
		</div>
		<%@include file="../tiles/footer.jsp"%>

	<%@include file="../tiles/footer_inc.jsp"%>
</body>
</html>