<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<title>Trang chủ</title>

<link rel="stylesheet" href="css/style.css">
<base href="${pageContext.servletContext.contextPath}/">
<!-- <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.6.3/css/font-awesome.css" rel="stylesheet">
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"></script> -->

<!-- <link rel="manifest" href="site.webmanifest"> -->
<link rel="shortcut icon" type="image/x-icon" href="img/favicon.png">
<!-- Place favicon.ico in the root directory -->

<!-- CSS here -->
<link rel="stylesheet" href="css2/bootstrap.min.css">
<link rel="stylesheet" href="css2/owl.carousel.min.css">
<link rel="stylesheet" href="css2/magnific-popup.css">
<link rel="stylesheet" href="css2/font-awesome.min.css">
<link rel="stylesheet" href="css2/themify-icons.css">
<link rel="stylesheet" href="css2/nice-select.css">
<link rel="stylesheet" href="css2/flaticon.css">
<link rel="stylesheet" href="css2/gijgo.css">
<link rel="stylesheet" href="css2/animate.css">
<link rel="stylesheet" href="css2/slick.css">
<link rel="stylesheet" href="css2/slicknav.css">
<link rel="stylesheet"
	href="https://ajax.googleapis.com/ajax/libs/jqueryui/1.11.2/themes/smoothness/jquery-ui.css">
<link rel="stylesheet" href="css2/style.css">

</head>
<body style="padding-top: 0px;">





	<!-- header-end -->


	<!-- slider_area_start -->
	<div class="slider_area">
		<div class="single_slider  d-flex align-items-center slider_bg_1">
			<div class="container">
				<div class="row align-items-center justify-content-center">
					<div class="col-xl-10">
						<div class="slider_text text-center justify-content-center">
							<div class="Loginform">
								<h3 class="Logina" style="font-size: 50px">

									<c:if test="${user != null}">
										<a href="logout">Đăng Xuất</a>
									</c:if>
									<c:if test="${user == null}">
										<a href="Login">Đăng Nhập</a>
									</c:if>
								</h3>
							</div>
							<p>Find Nearby Attraction</p>
							<h3>Find Nearby Attraction</h3>
							<div class="search_form">
								<form action="#">
									<div class="row align-items-center">
										<div class="col-xl-5 col-md-4">
											<div class="input_field">
												<input type="text" placeholder="What are you finding?">
											</div>
										</div>
										<div class="col-xl-4 col-md-4">
											<div class="input_field location">
												<input type="text" placeholder="Location">
											</div>
										</div>
										<div class="col-xl-3 col-md-4">
											<div class="button_search">
												<button class="boxed-btn2" type="submit">Search</button>
											</div>
										</div>
									</div>
								</form>
							</div>
							<div class="quality">
								<ul>
									<li>
										<button>Hotel</button>
									</li>
									<li>
										<button>Food</button>
									</li>
									<li>
										<button>Shopping</button>
									</li>
									<li>
										<button>Bar & Pubs</button>
									</li>
									<li>
										<button>Bar & Pubs</button>
									</li>
									<li>
										<button>Places</button>
									</li>
								</ul>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- slider_area_end -->

	<div class="popular_catagory_area">
		<div class="container">
			<div class="row">
				<div class="col-xl-12">
					<div class="section_title mb-60 text-center">
						<p></p>
						<h3>Top Gương mặt xuất sắc</h3>
					</div>
				</div>
			</div>

			<div class="row">
				<c:forEach var="listtop" items="${topstaff}">
					<div class="col-xl-3 col-md-4 col-lg-3">
						<div class="single_catagory">
							<div class="thumb">
								<img src="images/${listtop[1]}" width="200px" height="200px"
									alt="">
							</div>
							<div class="hover_overlay">
								<div class="hover_inner">
									<a><h4>${listtop[0]}</h4></a> <span>${listtop[3]} Thành
										tích</span> <span>Phòng ban: ${listtop[2]}</span>
								</div>
							</div>
						</div>
					</div>
				</c:forEach>

			</div>
		</div>
	</div>

	<!--/ footer end  -->

	<!-- link that opens popup -->
	<script
		src=" https://cdnjs.cloudflare.com/ajax/libs/jqueryui/1.12.1/jquery-ui.min.js">
		
	</script>
	<!-- JS here -->

</body>
</html>