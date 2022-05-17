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
<link rel="stylesheet" href="${root}/css/view/style.css">
<link rel="stylesheet" href="${root}/css/view/website/website_type_1.css">
<style type="text/css">
#preferences {
	height: 88vh;
    margin-top: 72px;
}

#preferences .inner .category a:nth-child(6) {
	color: #EA933C;
    border-bottom: solid;
    border-width: 3px;
    border-color: #EA933C;
    font-weight: bold;
}

#footer{
    background-color: #404040;
    position: absolute;
    bottom: 0;
}

#footer a{
	color: white;
}

#footer .infomation{
	color: white;
}
</style>
</head>
<body>
	<div id="section">
		<jsp:include page="/WEB-INF/jsp/view/page_type_2/header.jsp" />
		
		<section id="preferences">
			<div class="inner">
				<div class="category">
					<a href="main_management?contents_idx=${contents_idx}">메인관리</a>
					<a href="introduction_management?contents_idx=${contents_idx}">소개관리</a>
					<a href="notice_management?contents_idx=${contents_idx}">공지사항관리</a>
					<a href="pop_up_management?contents_idx=${contents_idx}">팝업관리</a>
					<a href="gallery_management?contents_idx=${contents_idx}">갤러리관리</a>
					<a href="media_management?contents_idx=${contents_idx}">영상관리</a>
				</div>
				
				<div class="media_management">
					<div class="title_area">
						<span>영상 관리</span>
					</div>
					
					<form action="media_management" class="media_area" method="post">
						<div class="text_area">
							<div class="left_area">
								<span>링크 첨부</span>
							</div>
							
							<div class="right_area">
								<input type="text" placeholder="영상의 링크를 작성해주세요." name="link_1" value="${link_1}">
								<input type="text" placeholder="영상의 링크를 작성해주세요." name="link_2" value="${link_2}">
								<input type="text" placeholder="영상의 링크를 작성해주세요." name="link_3" value="${link_3}">
								<input type="text" placeholder="영상의 링크를 작성해주세요." name="link_4" value="${link_4}">
							</div>
						</div>
						
						<div class="btn_area">
							<input type="submit" value="저장">
						</div>
					</form>
				</div>
			</div>
			
			<jsp:include page="/WEB-INF/jsp/view/page_type_2/footer.jsp" />
		</section>
	</div>
</body>
</html>