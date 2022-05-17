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
#preferences .inner .category a:nth-child(3) {
	color: #EA933C;
    border-bottom: solid;
    border-width: 3px;
    border-color: #EA933C;
    font-weight: bold;
}
</style>
</head>
<body>
	<jsp:include page="/WEB-INF/jsp/view/page_type_1/header.jsp" />
	
	<section id="preferences">
		<div class="inner">
			<div class="category">
				<a href="main_management?contents_idx=${contents_idx}">메인관리</a>
				<a href="introduction_management?contents_idx=${contents_idx}">소개관리</a>
				<a href="notice_management?contents_idx=${contents_idx}">공지사항관리</a>
				<a href="pop_up_management?contents_idx=${contents_idx}">팝업관리</a>
				<a href="comment_management?contents_idx=${contents_idx}">댓글관리</a>
			</div>
			
			<div class="notice_management_insert">
				<span class="title_area">공지사항 등록</span>
				
				<form method="post" action="notice_management_update" enctype="multipart/form-data">
					<input type="hidden" name="contents_idx" value="${contents_idx}">
					<div class="infomation">
						<div class="left_area">
							<span>제목</span>
						</div>
						
						<div class="right_area">
							<input type="text" name="title">
						</div>
					</div>
					
					<div class="infomation">
						<div class="left_area">
							<span>게시 기간</span>
						</div>
						
						<div class="right_area">
							<input type="date" name="start_day"> ~ <input type="date" name="end_day">
						</div>
					</div>
					
					<div class="infomation">
						<div class="left_area">
							<span>작성자</span>
						</div>
						
						<div class="right_area">
							<input type="text" name="writer">
						</div>
					</div>
					
					<div class="infomation">
						<div class="left_area">
							<span>첨부파일</span>
						</div>
						
						<div class="right_area">
							<input type="file" name="main_img" id="main_img" accept="image/*">
							<div class="upload_item_1">
								<span>* 고해상도 이미지의 16:9 비율을 사용해주세요.</span>
								<span>* 5MB까지 사용가능합니다.</span>
							</div>
							
							<div class="upload_item_2">
								<label for="main_img"><img alt="" src="${root}/img/website/upload_icon.svg">내 PC</label>
							</div>
						</div>
					</div>
					
					<div class="infomation">
						<div class="left_area">
							<span>내용</span>
						</div>
						
						<div class="right_area">
							<input type="text" name="contents">
						</div>
					</div>
				</form>
			</div>
		</div>
		
		<jsp:include page="/WEB-INF/jsp/footer/footer.jsp" />
	</section>
</body>
</html>