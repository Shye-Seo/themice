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
<link rel="stylesheet" href="${root}/css/view/style.css">
<style type="text/css">
#footer{
	position: absolute;
    bottom: 0;
    overflow: hidden;
}
</style>
</head>
<body>
	<jsp:include page="/WEB-INF/jsp/aside/quick.jsp" />
	<jsp:include page="/WEB-INF/jsp/header/header.jsp" />
	<div class="header">
		<div class="title">
			<span>마이페이지</span>
		</div>
	</div>
	<section id="select_area">
		<div class="title_area">
			<p><span>My</span> 전시</p>
		</div>
		<div class="contents_area">
			<div class="sub_area">
				<a href="insertContents">
					<img src="${root}/img/select/select_icon_1.svg">
					<span>전시 등록하기</span>
				</a>
			</div>
			
			<div class="sub_area" style="border: none;">
				<input type="hidden" value="${sessionScope.business_id}">
				<a href="/business_contents_list">
					<img src="${root}/img/select/select_icon_2.svg">
					<span>My 전시장 목록보기</span>
				</a>
			</div>
		</div>
	</section>
	<jsp:include page="/WEB-INF/jsp/footer/footer.jsp" />
</body>
</html>