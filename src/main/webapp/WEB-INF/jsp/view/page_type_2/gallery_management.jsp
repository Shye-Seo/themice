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
    margin-top: 72px;
}

#preferences .inner .category a:nth-child(5) {
	color: #EA933C;
    border-bottom: solid;
    border-width: 3px;
    border-color: #EA933C;
    font-weight: bold;
}

#footer{
    background-color: #404040;
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
				
				<div class="gallery_management">
					<div class="title_area">
						<span>갤러리 관리</span>
					</div>
					
					<form class="img_area" action="gallery_management" enctype="multipart/form-data" method="post">
						<c:forEach var="img_list" items="${img_list}" varStatus="st">
							<div class="gallery_item">
								<div class="thumbnail_area thumbnail_${img_list.idx}">
									<img alt="" src="${root}/gallery_path/${img_list.img_path}">
								</div>
								
								<div class="upload_area">
									<input type="file" name="img" id="img_${img_list.idx}" accept="image/*" onchange="setThumbnail_${img_list.idx}(event);">
									<label for="img_${img_list.idx}">
										<img alt="" src="${root}/img/website/upload_icon.svg">내 PC
									</label>
								</div>
								
								<div class="text_area">
									<span>* 고해상도 이미지의 4:3 비율을 사용해주세요.</span>
									<span>* 5MB까지 사용가능합니다.</span>
								</div>
								
								<div class="btn_area">
									<img alt="" src="${root}/img/website2/close_btn.svg" class="close_img_btn_${img_list.idx}" style="display: block;">
								</div>
								
								<input type="hidden" name="existing" value="${img_list.img_path}" id="existing_${img_list.idx}">
							</div>
							
							<script type="text/javascript">
								function setThumbnail_${img_list.idx}(event) {
									var reader = new FileReader();
									reader.onload = function(event) {
										var img = document.createElement("img");
										img.setAttribute("src", event.target.result);
										document.querySelector("div.thumbnail_" + ${img_list.idx}).appendChild(img);
									};
									reader.readAsDataURL(event.target.files[0]);
								}
								
								$(function () {
									$('#img_' + ${img_list.idx}).off().on('change', function(){
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
											} else {
												$('.thumbnail_' + ${img_list.idx}).css('display', 'block');
												$('.close_img_btn_' + ${img_list.idx}).css('display', 'block');
											}
										}
									});
									
									$('.close_img_btn_' + ${img_list.idx}).click(function () {
										$('#img_' + ${img_list.idx}).val('');
										$('.thumbnail_' + ${img_list.idx}).css('display', 'none');
										$('.close_img_btn_' + ${img_list.idx}).css('display', 'none');
										$('#existing_' + ${img_list.idx}).val('');
									});
								});
							</script>
						</c:forEach>
						
						<c:forEach var="i" begin="${gallery_cnt + 1}" end="${8}">
							<div class="gallery_item">
								<div class="thumbnail_area thumbnail_${i}">
									
								</div>
								<div class="upload_area">
									<input type="file" name="img" id="img_${i}" accept="image/*" onchange="setThumbnail_${i}(event);">
									<label for="img_${i}">
										<img alt="" src="${root}/img/website/upload_icon.svg">내 PC
									</label>
								</div>
								
								<div class="text_area">
									<span>* 고해상도 이미지의 4:3 비율을 사용해주세요.</span>
									<span>* 5MB까지 사용가능합니다.</span>
								</div>
								
								<div class="btn_area">
									<img alt="" src="${root}/img/website2/close_btn.svg" class="close_img_btn_${i}">
								</div>
							</div>
							
							<script type="text/javascript">
								function setThumbnail_${i}(event) {
									var reader = new FileReader();
									reader.onload = function(event) {
										var img = document.createElement("img");
										img.setAttribute("src", event.target.result);
										document.querySelector("div.thumbnail_" + ${i}).appendChild(img);
									};
									reader.readAsDataURL(event.target.files[0]);
								}
								
								$(function () {
									$('#img_' + ${i}).off().on('change', function(){
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
											} else {
												$('.thumbnail_' + ${i}).css('display', 'block');
												$('.close_img_btn_' + ${i}).css('display', 'block');
											}
										}
									});
									
									$('.close_img_btn_' + ${i}).click(function () {
										$('#img_' + ${i}).val('');
										$('.thumbnail_' + ${i}).css('display', 'none');
										$('.close_img_btn_' + ${i}).css('display', 'none');
									});
								});
							</script>
						</c:forEach>
						
						<div class="btn_area">
							<input type="submit" value="저장">
						</div>
						
						<input type="hidden" name="contents_idx" value="${contents_idx}">
					</form>
				</div>
			</div>
			
			<jsp:include page="/WEB-INF/jsp/view/page_type_2/footer.jsp"/>
		</section>
	</div>
</body>
</html>