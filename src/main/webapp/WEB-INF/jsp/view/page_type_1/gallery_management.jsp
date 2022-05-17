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
	<div id="section">
		<jsp:include page="/WEB-INF/jsp/view/page_type_1/header.jsp" />
	
		<section id="preferences">
			<div class="inner">
				<div class="category">
					<a href="main_management?contents_idx=${contents_idx}">메인관리</a>
					<a href="notice_management?contents_idx=${contents_idx}">공지사항관리</a>
					<a href="gallery_management?contents_idx=${contents_idx}">갤러리관리</a>
					<a href="comment_management?contents_idx=${contents_idx}">댓글관리</a>
					<a href="media_management?contents_idx=${contents_idx}">영상관리</a>
				</div>
					
				<div class="gallery_management">
					<span class="title_area">갤러리 관리</span>
					
					<div class="img_area">
						<form method="post" enctype="multipart/form-data">
							<div class="img_item" id="image_container_1">
								<c:if test="${gallery_list.img_1 == 'null'}">
									<img alt="" src="${root}/gallery_path/${gallery_list.img_1}">
								</c:if>
								
								<div class="upload_area">
									<input type="file" name="img_1" id="gallery_img_1" accept="image/*" onchange="setThumbnail(event);">
									<label for="gallery_img_1"><img alt="" src="${root}/img/website/upload_icon.svg">내 PC</label>
								</div>
								
								<div class="text_area">
									<span>*고해상도 이미지의 4:3 비율을 사용해주세요.</span>
									<span>*5MB까지 사용가능합니다.</span>
								</div>
							</div>
							
							<div class="img_item" id="image_container_2">
								<c:if test="${gallery_list.img_2 == 'null'}">
									<img alt="" src="${root}/gallery_path/${gallery_list.img_2}">
								</c:if>
								
								<div class="upload_area">
									<input type="file" name="img_2" id="gallery_img_2" accept="image/*" onchange="setThumbnail(event);">
									<label for="gallery_img_2"><img alt="" src="${root}/img/website/upload_icon.svg">내 PC</label>
								</div>
								
								<div class="text_area">
									<span>*고해상도 이미지의 4:3 비율을 사용해주세요.</span>
									<span>*5MB까지 사용가능합니다.</span>
								</div>
							</div>
							
							<div class="img_item" id="image_container_3">
								<c:if test="${gallery_list.img_3 == 'null'}">
									<img alt="" src="${root}/gallery_path/${gallery_list.img_3}">
								</c:if>
								
								<div class="upload_area">
									<input type="file" name="img_3" id="gallery_img_3" accept="image/*" onchange="setThumbnail(event);">
									<label for="gallery_img_3"><img alt="" src="${root}/img/website/upload_icon.svg">내 PC</label>
								</div>
								
								<div class="text_area">
									<span>*고해상도 이미지의 4:3 비율을 사용해주세요.</span>
									<span>*5MB까지 사용가능합니다.</span>
								</div>
							</div>
							
							<div class="img_item" id="image_container_4">
								<c:if test="${gallery_list.img_4 == 'null'}">
									<img alt="" src="${root}/gallery_path/${gallery_list.img_4}">
								</c:if>
								
								<div class="upload_area">
									<input type="file" name="img_4" id="gallery_img_4" accept="image/*" onchange="setThumbnail(event);">
									<label for="gallery_img_4"><img alt="" src="${root}/img/website/upload_icon.svg">내 PC</label>
								</div>
								
								<div class="text_area">
									<span>*고해상도 이미지의 4:3 비율을 사용해주세요.</span>
									<span>*5MB까지 사용가능합니다.</span>
								</div>
							</div>
							
							<div class="img_item" id="image_container_5">
								<c:if test="${gallery_list.img_5 == 'null'}">
									<img alt="" src="${root}/gallery_path/${gallery_list.img_5}">
								</c:if>
								
								<div class="upload_area">
									<input type="file" name="img_5" id="gallery_img_5" accept="image/*" onchange="setThumbnail(event);">
									<label for="gallery_img_5"><img alt="" src="${root}/img/website/upload_icon.svg">내 PC</label>
								</div>
								
								<div class="text_area">
									<span>*고해상도 이미지의 4:3 비율을 사용해주세요.</span>
									<span>*5MB까지 사용가능합니다.</span>
								</div>
							</div>
							
							<div class="img_item" id="image_container_6">
								<c:if test="${gallery_list.img_6 == 'null'}">
									<img alt="" src="${root}/gallery_path/${gallery_list.img_6}">
								</c:if>
								
								<div class="upload_area">
									<input type="file" name="img_6" id="gallery_img_6" accept="image/*" onchange="setThumbnail(event);">
									<label for="gallery_img_6"><img alt="" src="${root}/img/website/upload_icon.svg">내 PC</label>
								</div>
								
								<div class="text_area">
									<span>*고해상도 이미지의 4:3 비율을 사용해주세요.</span>
									<span>*5MB까지 사용가능합니다.</span>
								</div>
							</div>
							
							<div class="img_item" id="image_container_7">
								<c:if test="${gallery_list.img_7 == 'null'}">
									<img alt="" src="${root}/gallery_path/${gallery_list.img_7}">
								</c:if>
								
								<div class="upload_area">
									<input type="file" name="img_7" id="gallery_img_7" accept="image/*" onchange="setThumbnail(event);">
									<label for="gallery_img_7"><img alt="" src="${root}/img/website/upload_icon.svg">내 PC</label>
								</div>
								
								<div class="text_area">
									<span>*고해상도 이미지의 4:3 비율을 사용해주세요.</span>
									<span>*5MB까지 사용가능합니다.</span>
								</div>
							</div>
							
							<div class="img_item" id="image_container_8">
								<c:if test="${gallery_list.img_8 == 'null'}">
									<img alt="" src="${root}/gallery_path/${gallery_list.img_8}">
								</c:if>
								
								<div class="upload_area">
									<input type="file" name="img_8" id="gallery_img_8" accept="image/*" onchange="setThumbnail(event);">
									<label for="gallery_img_8"><img alt="" src="${root}/img/website/upload_icon.svg">내 PC</label>
								</div>
								
								<div class="text_area">
									<span>*고해상도 이미지의 4:3 비율을 사용해주세요.</span>
									<span>*5MB까지 사용가능합니다.</span>
								</div>
							</div>
							
							<script type="text/javascript">
								function setThumbnail(event) {
									var id = $(this).attr('id');
									console.log(id);
									var container = id.charAt(id.length-1);
									
									var reader = new FileReader();
									reader.onload = function(event) {
										var img = document.createElement("img");
										img.setAttribute("src", event.target.result);
										document.querySelector("div#image_container_" + container).appendChild(img);
									};
									reader.readAsDataURL(event.target.files[0]);
								}
								
								$(function () {
									$('input[type="file"]').off().on('change', function(){
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
						</form>
						
						<div class="btn_area">
							<input type="button" value="저장">
						</div>
					</div>
				</div>
			</div>
			
			<jsp:include page="/WEB-INF/jsp/footer/footer.jsp" />
		</section>
	</div>
</body>
</html>