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
						<a href="manual"  target="_blank"><img alt="" src="${root}/img/quick/quick01.svg"></a>
					</div>
				</li>
				
				<li>
					<div class="img_area">
						<a href="login_check"><img alt="" src="${root}/img/quick/quick02.svg"></a>
					</div>
				</li>
				
				<li>
					<div class="img_area">
						<img alt="" src="${root}/img/quick/quick03.svg" onclick="window.scrollTo(0,0);">
					</div>
				</li>
				
			</ul>
		</div>
<!-- 		<div class="top_btn_area"> -->
<!-- 			<span onclick="window.scrollTo(0,0);">Top</span> -->
<%-- 			<img alt="" src="${root}/img/quick/top_arrow.svg" onclick="window.scrollTo(0,0);"> --%>
<!-- 		</div> -->
	</aside>
</body>
</html>