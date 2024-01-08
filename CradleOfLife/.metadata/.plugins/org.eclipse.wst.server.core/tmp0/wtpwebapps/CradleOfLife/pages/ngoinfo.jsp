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
		List<UserModel> userList = DBUtils.getBeanList(UserModel.class,
				"SELECT * FROM userdata WHERE roleid  LIKE 1");
		System.out.print(userId + "," + um.getName());
	%>

	<div class="slider_area ">
		<div class="bradcam_area breadcam_bg overlay2">
			<div
				class="single_slider d-flex align-items-center justify-content-center slider_bg_1">
				<div class="container">

					<div class="table-responsive">
						<table class="table table-bordered table-hover">
							<thead class="thead-dark">
								<tr>
									<th scope="col">Sr. No</th>
									<th scope="col">NGO</th>
									<th scope="col">Address</th>
								</tr>
							</thead>
							<tbody>
								<%
									for (int i = 0; i < userList.size(); i++) {
										UserModel user = userList.get(i);
								%>
								<tr id=<%=i + 1%>>
									<th scope="row"><%=i + 1%></th>
									<td><%=user.getNgo()%></td>
									<td><%=user.getAddress()%></td>
								</tr>
								<%
									}
								%>
							</tbody>
						</table>
					</div>
			





				</div>
			</div>
		</div>
		<%@include file="../tiles/footer.jsp"%>
	</div>
	<%@include file="../tiles/footer_inc.jsp"%>
</body>
</html>