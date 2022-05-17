<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>THE MICE</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<c:set var="root" value="${pageContext.request.contextPath}" />
<link rel="icon" href="${root}/img/common/favicon.svg">
<script src="//code.jquery.com/jquery-1.11.3.min.js"></script>
<script src="//code.jquery.com/jquery-migrate-1.2.1.min.js"></script>
<script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
<link rel="stylesheet" href="${root}/css/view/website/website_type_1.css">
<link rel="stylesheet" href="${root}/css/view/style.css">
</head>
<body>
	<a href="javascript:history.back();" id="back_area">
		<img alt="" src="${root}/img/common/back_btn.svg" class="back_btn">
		<span>${content_list.title}</span>
	</a>
	
	<div id="section">
		<jsp:include page="/WEB-INF/jsp/view/page_type_1/header.jsp" />
		
		<section id="gallery_detail">
			<div class="inner">
				<div class="title_area">
					<span>갤러리</span>
				</div>
				
				<div class="contents_area">
					<c:forEach var="list" items="${gallery_list}" varStatus="st">
						<div class="img_item">
							<img alt="" src="${root}/gallery_path/${list.img_path}">
						</div>
					</c:forEach>
				</div>
				
				<div class="btn_area">
					<a href="website?contents_idx=${contents_idx}">목록</a>
					<c:if test="${sessionScope.business_id == content_list.business_num}">
						<a href="gallery_update?contents_idx=${contents_idx}&gallery_idx=${gallery_idx}">수정</a>
					</c:if>
				</div>
			</div>
			
			<jsp:include page="/WEB-INF/jsp/footer/footer.jsp" />
		</section>
	</div>
</body>
</html>