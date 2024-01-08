<%@page import="java.util.HashMap"%>
<%@page import="java.util.List"%>
<%@page import="com.helper.DBUtils"%>
<%@page import="com.helper.UserModel"%>
<%@page import="com.database.ConnectionManager"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<%@include file="../tiles/inc.jsp"%>
</head>
<body>
	<%@include file="../tiles/nav.jsp"%>

	<!-- bradcam_area_start -->
	<div class="bradcam_area breadcam_bg overlay2">
		<h3>About Us</h3>
	</div>
	<!-- bradcam_area_end -->

	<!-- about_area_start -->
	<div class="about_area">
		<div class="container">
			<div class="row">
				<div class="col-xl-5 col-lg-6">
					<div class="single_about_info">
						<h3>
							Over 700 incubators <br> from 20 Hospitals
						</h3>
						<p>Every moment counts in the fragile early hours of a
							newborn's life. Help us ensure they receive the vital care they
							need by donating towards the installation of state-of-the-art
							baby incubators. Your generosity can make a life-changing
							difference.</p>
						<a href="<%=request.getContextPath()%>/pages/donation.jsp"
							class="boxed_btn">Donate Now</a>
					</div>
				</div>
				<div class="col-xl-6 offset-xl-1 col-lg-6">
					<div class="about_tutorials">
						<div class="courses">
							<div class="inner_courses">
								<div class="text_info">
									<span>200+</span>
									<p>Hospitals</p>
								</div>
							</div>
						</div>
						<div class="courses-blue">
							<div class="inner_courses">
								<div class="text_info">
									<span>10000</span>
									<p>Donors</p>
								</div>

							</div>
						</div>
						<div class="courses-sky">
							<div class="inner_courses">
								<div class="text_info">
									<span>230+</span>
									<p>NGOs</p>
								</div>

							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- about_area_end -->

	<!-- testimonial_area_start -->
	<div class="testimonial_area testimonial_bg_1 overlay">
		<div class="testmonial_active owl-carousel">
			<div class="single_testmoial">
				<div class="container">
					<div class="row">
						<div class="col-xl-12">
							<div class="testmonial_text text-center">
								<div class="author_img">
									<img src="img/testmonial/author_img.png" alt="">
								</div>
								<p>"Crowdfunding isn't just about money; it's about
									community believing in an idea."</p>
								<span>- Balkrishna S</span>
							</div>
						</div>
					</div>
				</div>
			</div>
			<div class="single_testmoial">
				<div class="container">
					<div class="row">
						<div class="col-xl-12">
							<div class="testmonial_text text-center">
								<div class="author_img">
									<img src="img/testmonial/author_img.png" alt="">
								</div>
								<p>A journey of a thousand miles begins with a community of
									supporters.</p>
								<span>- Balkrishna S</span>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- testimonial_area_end -->

	<!-- our_latest_blog_start -->
	<div class="our_latest_blog">
		<div class="container">
			<div class="row">
				<div class="col-xl-12">
					<div class="section_title text-center mb-100">
						<h3>Our Latest Blog</h3>
					</div>
				</div>
			</div>
			<div class="row">
				<div class="col-xl-4 col-md-4">
					<div class="single_latest_blog">
						<div class="thumb">
							<img src="img/latest_blog/incubator1.png" alt="">
						</div>
						<div class="content_blog">
							<div class="date">
								<p>
									25 Aug, 2023 in <a href="#">Crowdfunding Success</a>
								</p>
							</div>
							<div class="blog_meta">
								<h3>
									<a href="#">The Story of Our First 100 Incubators</a>
								</h3>
							</div>
							<p class="blog_text">Learn how our community came together to
								fund the first 100 incubators, providing a life-saving start for
								hundreds of newborns.</p>
						</div>
					</div>
				</div>
				<div class="col-xl-4 col-md-4">
					<div class="single_latest_blog">
						<div class="thumb">
							<img src="img/latest_blog/incubator2.png" alt="">
						</div>
						<div class="content_blog">
							<div class="date">
								<p>
									18 Aug, 2023 in <a href="#">Supporters Spotlight</a>
								</p>
							</div>
							<div class="blog_meta">
								<h3>
									<a href="#">Interview with Top Donors</a>
								</h3>
							</div>
							<p class="blog_text">Hear directly from our generous donors
								about why they chose to support our cause and the impact it had
								on their lives.</p>
						</div>
					</div>
				</div>
				<div class="col-xl-4 col-md-4">
					<div class="single_latest_blog">
						<div class="thumb">
							<img src="img/latest_blog/incubator3.png" alt="">
						</div>
						<div class="content_blog">
							<div class="date">
								<p>
									10 Aug, 2023 in <a href="#">Crowdfunding Tips</a>
								</p>
							</div>
							<div class="blog_meta">
								<h3>
									<a href="#">How to Run a Successful Crowdfunding Campaign</a>
								</h3>
							</div>
							<p class="blog_text">Discover our top strategies and tips for
								running a successful crowdfunding campaign. These insights come
								straight from our journey to fund 700+ incubators!</p>
						</div>
					</div>
				</div>
			</div>

		</div>
		<!-- our_latest_blog_end -->

		<%@include file="../tiles/footer.jsp"%>
	</div>
	<%@include file="../tiles/footer_inc.jsp"%>
</body>
<script>
	
</script>
</html>