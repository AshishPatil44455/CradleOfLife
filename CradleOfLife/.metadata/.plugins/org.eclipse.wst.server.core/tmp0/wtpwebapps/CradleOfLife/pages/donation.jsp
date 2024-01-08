<%@page import="com.helper.UserModel"%>
<%@page import="com.helper.StringHelper"%>
<%@ page import="com.helper.DBUtils"%>
<%@page import="java.util.List"%>
<%@page import="java.net.URLDecoder"%>
<%@page import="java.net.URLEncoder"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<%@include file="../tiles/inc.jsp"%>
</head>
<%
	UserModel uml = (UserModel) session.getAttribute("USER_MODEL");
	String currbal = uml.getTbal(   );
	System.out.println(uml.getUserid() +"::" + currbal);
	if (currbal == null) {
		currbal = "0";
	}
	String userId = uml.getUserid();
	List list = DBUtils.getBeanList(UserModel.class,
			"	SELECT SUM(tamt) as Totalfunds FROM transaction where tuserid like '"
					+ userId + "' ");
%>

<body>
	<%@include file="../tiles/nav.jsp"%>
	<div class="bradcam_area breadcam_bg overlay2">
		<div class="slider_area ">
			<div
				class="single_slider d-flex align-items-center justify-content-center slider_bg_1">
				<div class="container">
					<div class="row align-items-center justify-content-center">

						<form id="donation_form" action="javascript:fnSubmit();">

							<div class="popup_box ">
								<div class="popup_inner">
									<div class="text-center">
										<%
											if (list.size() > 0) {
												um = (UserModel) list.get(0);
										%>
										<h1 class="badge btn-info">
											Funds Transferred Total Till : <i class="fas fa-rupee-sign"></i>
											<%=um.getTotalfunds()%>
										</h1>
										<%
											}
										%>
									</div>
								</div>
								<div class="row">
									<div class="col-xl-12 col-md-12">
										<input type="hidden" name="userId" id="userIds 	" value="<%=userId%>" />
										<input type="hidden" name="currentBalance"
											value="	<%=currbal%>" />
									</div>
									<div class="col-xl-6 col-md-6	">
										<label for="name">Payment Options..</label>
										<!-- <input type="text" class="form-control" style="text-transform: capitalize;" id="fname" name="fname" 
                                    tabindex="1"  placeholder="Enter First name" required="required" maxlength="20"/> -->
										<select class="form-control" tabindex="1">
											<option value="0">Select Method...</option>
											<!--         									<option value="1">NetBanking</option> -->
											<option value="2">Credit Card</option>
											<option value="3">Debit Card</option>
											<!-- <option value="4">Multi-Axle</option> -->
										</select>
									</div>
									<div class="col-xl-6 col-md-6	">
										<label for="name">CVV2</label> <input type="text"
											class="form-control" style="text-transform: capitalize;"
											tabindex="3" placeholder="Enter Valid Code"
											required="required" title="please enter only 3 digits "
											pattern="[0-9]{3}" />
									</div>

									<div class="col-xl-6 col-md-6	">
										<label for="name">Card Number</label> <input type="text"
											class="form-control" style="text-transform: capitalize;"
											title="please enter 6 digits " tabindex="2"
											placeholder="Account/Card No" maxlength="16" />
									</div>
									<div class="col-xl-6 col-md-6	">
										<label for="name">Amount</label> <input type="text"
											class="form-control" name="amount"
											style="text-transform: capitalize;" id="balance" tabindex="4"
											placeholder="Enter Amount(Rs.)"
											title="please enter only digits " pattern="[0-9]+"
											required="required" />
									</div>

									<div class="col-xl-6 col-md-6">
										<label for="name">Expiry Date</label> <input type="text"
											class="form-control" style="text-transform: capitalize;"
											title="please enter only 3 digits "
											pattern="[0-9]{2}/[0-9]{2}" tabindex="3"
											placeholder="Enter Valid Expiry MM/YY" required="required" />

									</div>
									<div class="col-xl-12 col-md-12">
										<button type="submit" class="genric-btn success circle ">Transfer
											Amount</button>
									</div>
								</div>
							</div>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>
	<%@include file="../tiles/footer_inc.jsp"%>
</body>
<script type="text/javascript">
      $('#cardno, #c_cardno').on('keyup', function () {
      	  if ($('#cardno').val() == $('#c_cardno').val()) {
      	    $('#message').html('Card Id Matching').css('color', 'cyan');
      	  } else 
      	    $('#message').html('Id Not Matching').css('color', 'red');
      	});
      	
      function fnSubmit(){
      	 var str = $( "#donation_form" ).serialize();
      // 	 alert(str);
      	$.post("<%=request.getContextPath()%>/tiles/ajax.jsp?methodId=transferFunds",
						str, function(data) {
							data = $.trim(data);
							alert("Done");
							//		window.location.reload();
							$('#donation_form')[0].reset();

						});
	}
</script>
</html>
