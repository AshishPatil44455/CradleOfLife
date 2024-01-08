
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@page import="java.util.List"%>
<%@page import="java.util.HashMap"%>
<%@page import="com.database.ConnectionManager"%>
<%@page import="com.helper.DBUtils"%>
<%@page import="com.helper.StringHelper"%>
<%@page import="com.helper.UserModel"%>

<%
	String sMethod = StringHelper.n2s(request.getParameter("methodId"));
	String returnString = "";
	double returnDouble;
	System.out.println("HELLO");
	boolean bypasswrite = false;


	
	HashMap parameters = StringHelper.displayRequest(request);

	if (sMethod.equalsIgnoreCase("registerNewUser")) {
		returnString = ConnectionManager.registerNewUser(parameters);
	}
	else if (sMethod.equalsIgnoreCase("checkLogin")) {
		UserModel um = ConnectionManager.checkLogin(parameters);
		if (um != null) {
			session.setAttribute("USER_MODEL", um);
			returnString = "1";

		} else {
			returnString = "2";
		}

	}

	else if (sMethod.equalsIgnoreCase("checkLogin2")) {
		UserModel um = ConnectionManager.checkLogin(parameters);
		if (um != null) {
			session.setAttribute("USER_MODEL", um);
			request.getRequestDispatcher("../pages/index.jsp").forward(request, response);

		} else {
			returnString = "Failed! Some Error Occured!";
		}

	}

	else if (sMethod.equalsIgnoreCase("transferFunds")) {

		float amount = StringHelper.n2f(parameters.get("amount"));
		UserModel um = (UserModel) session.getAttribute("USER_MODEL");
		um.setTbal((StringHelper.n2f(um.getTamt()) + amount) + "");
		session.setAttribute("USER_MODEL", um);
		returnString = ConnectionManager.transferFunds(parameters);
	}
	
	else if (sMethod.equalsIgnoreCase("logout")) {
		session.removeAttribute("USER_MODEL");
		bypasswrite = true;
	}

	if (!bypasswrite) {
		out.println(returnString);
	}
%>

