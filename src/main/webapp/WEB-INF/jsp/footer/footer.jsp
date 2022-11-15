<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<c:set var="root" value="${pageContext.request.contextPath}" />
<title>THE MICE</title>
<link rel="icon" href="${root}/img/common/favicon.svg">
<link rel="stylesheet" href="${root}/css/view/footer/footer.css">
<style type="text/css">
#footer .link .info_link .site {
	background-image: url("${root}/img/footer/footer_select_icon.svg");
	cursor: pointer;
	background-repeat: no-repeat;
	-webkit-appearance: none;
	-moz-appearance: none;
	appearance: none;
	background-position-x: 90%;
	background-position-y: center;
}

#footer .link .info_link .site::-ms-expand {
	display: none;
}
</style>
</head>
<body>
	<footer id="footer">
		<div id="wrap_footer">
		<div class="link">
			<div class="info_link">
				<ul>
					<li><a href="#">더웰소개</a></li>
					<li><a href="#">찾아오시는길</a></li>
					<li><a href="#">개인정보취급방침</a></li>
				</ul>
			</div>
		</div>
		
		<div id="line"></div>

		<div class="infomation">
			<div class="logo">
				<img src="${root}/img/header/logo.svg">
			</div>
			<div class="address">
				<ul>
					<li>부산광역시 해운대구 수영강변대로 140(문화컨텐츠 컴플렉스 612호)</li>
					<li>직업정보제공사업 신고번호 : 부산동부 제 2019-6호</li>
					<li>사업자 신고번호 : B18-148346</li>
				</ul>
				<ul>
					<li>통신판매업 신고번호 : 2018-부산해운대-0551호</li>
					<li>출판사 신고번호 : 2018-000017호</li>
				</ul>
			</div>
		</div>
		</div>
	</footer>
</body>
</html>