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
#preferences .inner .category a:nth-child(1) {
	color: #EA933C;
    border-bottom: solid;
    border-width: 3px;
    border-color: #EA933C;
    font-weight: bold;
}
</style>
</head>
<body>
	<div id="section">
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
					
				<div class="main_management">
					<span class="title_area">메인관리 등록</span>
					
					<div class="contents_area">
						<div class="left_area">
							<span>이미지 첨부</span>
						</div>
						
						<div class="right_area">
							<form method="post" action="main_management" enctype="multipart/form-data">
								<input type="file" name="main_img" id="main_img" accept="image/*" onchange="setThumbnail(event);">
								<div class="upload_item_1" id="image_container">
									<span>* 고해상도 이미지의 16:9 비율을 사용해주세요.</span>
									<span>* 5MB까지 사용가능합니다.</span>
								</div>
								
								<div class="upload_item_2">
									<label for="main_img"><img alt="" src="${root}/img/website/upload_icon.svg">내 PC</label>
								</div>
								
								<script type="text/javascript">
									function setThumbnail(event) {
										var reader = new FileReader();
										reader.onload = function(event) {
											var img = document.createElement("img");
											img.setAttribute("src", event.target.result);
											document.querySelector("div#image_container").appendChild(img);
										};
										reader.readAsDataURL(event.target.files[0]);
									}
									
									$(function () {
										$('input[name=main_img]').off().on('change', function(){
											if (this.files && this.files[0]) {
												var fileForm = /(.*?)\.(jpg|jpeg|png|gif|bmp|pdf)$/;
												var imgFile = $(this).val();
												var maxSize = 5 * 1024 * 1024;
												var fileSize = this.files[0].size;
												
												if(!imgFile.match(fileForm)) {
											    	alert("이미지 파일만 업로드 가능합니다.");
											    	$(this).val('');
											        return false;
											    } else if(fileSize > maxSize){
													alert("이미지 크기는 5MB 이내로 등록 가능합니다.");
													$(this).val('');
													return false;
												}
											}
										});
									});
								</script>
								<input type="hidden" name="contents_idx" value="${contents_idx}">
							</form>
						</div>
					</div>
					
					<div class="btn_area">
						<input type="button" value="등록" id="img_upload_btn">
						
						<script type="text/javascript">
							$('#img_upload_btn').click(function() {
								var main_img = $('#main_img').val();
								if(!main_img){
									alert("이미지를 등록해주세요.");
							        return false;
								} else {
									$('form').submit();
								}
							});
						</script>
					</div>
				</div>
			</div>
			
			<jsp:include page="/WEB-INF/jsp/footer/footer.jsp" />
		</section>
	</div>
</body>
</html>