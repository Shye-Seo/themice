<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<c:set var="root" value="${pageContext.request.contextPath}" />
</head>
<body>
	<aside id="quick">
		<div class="icon_area">
			<ul>
				<li>
					<div class="img_area">
						<a href="main"><img alt="" src="${root}/img/quick/home_icon.svg"></a>
					</div>
					<div class="text_area">
						<a href="main">홈</a>
					</div>
				</li>
				
				<li>
					<div class="img_area">
						<a href="manual"><img alt="" src="${root}/img/quick/question.svg"></a>
					</div>
					<div class="text_area">
						<a href="manual">전시등록 설명서</a>
					</div>
				</li>
				
				<li>
					<div class="img_area">
						<a href="login_check"><img alt="" src="${root}/img/quick/profile.svg"></a>
					</div>
					<div class="text_area">
						<a href="login_check"><span>마이페이지</span></a>
					</div>
				</li>
			</ul>
		</div>
		<div class="top_btn_area">
			<span onclick="window.scrollTo(0,0);">Top</span>
			<img alt="" src="${root}/img/quick/top_arrow.svg" onclick="window.scrollTo(0,0);">
		</div>
	</aside>
</body>
</html>