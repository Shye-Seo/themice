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
#preferences .inner .category a:nth-child(4) {
	color: #EA933C;
    border-bottom: solid;
    border-width: 3px;
    border-color: #EA933C;
    font-weight: bold;
}
</style>
<script type="text/javascript">
	$(function () {
		var ratio_1 = '${pop_up.ratio_1}';
		var ratio_2 = '${pop_up.ratio_2}';
		var ratio_3 = '${pop_up.ratio_3}';
		
		
	});
</script>
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
				
				<div class="pop_up_management">
					<span class="title_area">팝업 관리</span>
					<span class="sub_title_area">팝업창은 최대 3개까지 등록 가능합니다.</span>
					
					<form method="post" action="pop_up_management" enctype="multipart/form-data">
						<input type="hidden" name="contents_idx" value="${contents_idx}">
						<div class="contents_area">
							<div class="content_item">
								<div class="left_area">
									<span>제목</span>
								</div>
								
								<div class="right_area">
									<input type="text" placeholder="40글자 이내로 작성해주세요." name="title_1" maxlength="40" value="${pop_up.title_1}">
								</div>
							</div>
							
							<div class="content_item">
								<div class="left_area">
									<span>게시기간</span>
								</div>
								
								<div class="right_area">
									<input type="date" name="start_day_1" value="${pop_up.start_day_1}"> ~ <input type="date" name="end_day_1" value="${pop_up.end_day_1}">
								</div>
							</div>
							
							<div class="content_item">
								<div class="left_area">
									<span>비율</span>
								</div>
								
								<div class="right_area">
									<input type="radio" name="ratio_1" id="horizontal_1" value="1"><label for="horizontal_1">가로형(4:3)</label>
									<input type="radio" name="ratio_1" id="vertical_1" value="2"><label for="vertical_1">세로형(3:4)</label>
								</div>
							</div>
							
							<div class="content_item">
								<div class="left_area">
									<span>첨부파일</span>
								</div>
								
								<div class="right_area">
									<input type="file" name="img_file_1" id="img_1" accept="image/*">
									<div class="upload_item_1">
										<span class="text_item_1_1">* 고해상도 이미지의 16:9 비율을 사용해주세요.</span>
										<span class="text_item_1_1">* 5MB까지 사용가능합니다.</span>
										<div class="text_item_1_2">
											<span class="file_name_1"></span>
											<img alt="" src="${root}/img/website/close.svg" class="close_item_1">
										</div>
									</div>
									
									<div class="upload_item_2">
										<label for="img_1"><img alt="" src="${root}/img/website/upload_icon.svg">내 PC</label>
									</div>
								</div>
							</div>
						</div>
						
						<div class="contents_area">
							<div class="content_item">
								<div class="left_area">
									<span>제목</span>
								</div>
								
								<div class="right_area">
									<input type="text" placeholder="40글자 이내로 작성해주세요." name="title_2" maxlength="40" value="${pop_up.title_2}">
								</div>
							</div>
							
							<div class="content_item">
								<div class="left_area">
									<span>게시기간</span>
								</div>
								
								<div class="right_area">
									<input type="date" name="start_day_2" value="${pop_up.start_day_2}"> ~ <input type="date" name="end_day_2" value="${pop_up.end_day_2}">
								</div>
							</div>
							
							<div class="content_item">
								<div class="left_area">
									<span>비율</span>
								</div>
								
								<div class="right_area">
									<input type="radio" name="ratio_2" value="1" id="horizontal_2"><label for="horizontal_2">가로형(4:3)</label>
									<input type="radio" name="ratio_2" value="2" id="vertical_2"><label for="vertical_2">세로형(3:4)</label>
								</div>
							</div>
							
							<div class="content_item">
								<div class="left_area">
									<span>첨부파일</span>
								</div>
								
								<div class="right_area">
									<input type="file" name="img_file_2" id="img_2" accept="image/*">
									<div class="upload_item_1">
										<span class="text_item_2_1">* 고해상도 이미지의 16:9 비율을 사용해주세요.</span>
										<span class="text_item_2_1">* 5MB까지 사용가능합니다.</span>
										<div class="text_item_2_2">
											<span class="file_name_2"></span>
											<img alt="" src="${root}/img/website/close.svg" class="close_item_2">
										</div>
									</div>
									
									<div class="upload_item_2">
										<label for="img_2"><img alt="" src="${root}/img/website/upload_icon.svg">내 PC</label>
									</div>
								</div>
							</div>
						</div>
						
						<div class="contents_area">
							<div class="content_item">
								<div class="left_area">
									<span>제목</span>
								</div>
								
								<div class="right_area">
									<input type="text" placeholder="40글자 이내로 작성해주세요." name="title_3" maxlength="40" value="${pop_up.title_3}">
								</div>
							</div>
							
							<div class="content_item">
								<div class="left_area">
									<span>게시기간</span>
								</div>
								
								<div class="right_area">
									<input type="date" name="start_day_3" value="${pop_up.start_day_3}"> ~ <input type="date" name="end_day_3" value="${pop_up.end_day_3}">
								</div>
							</div>
							
							<div class="content_item">
								<div class="left_area">
									<span>비율</span>
								</div>
								
								<div class="right_area">
									<input type="radio" name="ratio_3" value="1" id="horizontal_3"><label for="horizontal_3">가로형(4:3)</label>
									<input type="radio" name="ratio_3" value="2" id="vertical_3"><label for="vertical_3">세로형(3:4)</label>
								</div>
							</div>
							
							<div class="content_item">
								<div class="left_area">
									<span>첨부파일</span>
								</div>
								
								<div class="right_area">
									<input type="file" name="img_file_3" id="img_3" accept="image/*">
									<div class="upload_item_1">
										<span class="text_item_3_1">* 고해상도 이미지의 16:9 비율을 사용해주세요.</span>
										<span class="text_item_3_1">* 5MB까지 사용가능합니다.</span>
										<div class="text_item_3_2">
											<span class="file_name_3"></span>
											<img alt="" src="${root}/img/website/close.svg" class="close_item_3">
										</div>
									</div>
									
									<div class="upload_item_2">
										<label for="img_3"><img alt="" src="${root}/img/website/upload_icon.svg">내 PC</label>
									</div>
								</div>
							</div>
						</div>
						
						<div class="btn_area">
							<input type="submit" value="저장" id="img_upload_btn">
							<input type="reset" value="취소">
						</div>
					</form>
					
					
					<script type="text/javascript">
						$(function () {
							$('input[name=img_file_1]').off().on('change', function(){
								var fileValue = $(this).val().split("\\");
								var fileName = fileValue[fileValue.length-1];
								
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
										$('.text_item_1_1').css('display', 'none');
										$('.text_item_1_2').css('display', 'block');
										$('.file_name_1').text(fileName);
									}
								}
							});
							
							$('input[name=img_file_2]').off().on('change', function(){
								var fileValue = $(this).val().split("\\");
								var fileName = fileValue[fileValue.length-1];
								
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
										$('.text_item_2_1').css('display', 'none');
										$('.text_item_2_2').css('display', 'block');
										$('.file_name_2').text(fileName);
									}
								}
							});
							
							$('input[name=img_file_3]').off().on('change', function(){
								var fileValue = $(this).val().split("\\");
								var fileName = fileValue[fileValue.length-1];
								
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
										$('.text_item_3_1').css('display', 'none');
										$('.text_item_3_2').css('display', 'block');
										$('.file_name_3').text(fileName);
									}
								}
							});
							
							$('.close_item_1').click(function () {
								$('.text_item_1_1').css('display', 'block');
								$('.text_item_1_2').css('display', 'none');
								$('input[name=img_file_1]').val('');
							});
							
							$('.close_item_2').click(function () {
								$('.text_item_2_1').css('display', 'block');
								$('.text_item_2_2').css('display', 'none');
								$('input[name=img_file_2]').val('');
							});
							
							$('.close_item_3').click(function () {
								$('.text_item_3_1').css('display', 'block');
								$('.text_item_3_2').css('display', 'none');
								$('input[name=img_file_3]').val('');
							});
						});
					</script>
					
					<c:if test="${pop_up.img_1 != null}">
						<script type="text/javascript">
							$(function () {
								var name = '${pop_up.img_1}';
								$('.text_item_1_1').css('display', 'none');
								$('.text_item_1_2').css('display', 'block');
								$('.file_name_1').text(name);
							});
						</script>
					</c:if>
					
					<c:if test="${pop_up.img_2 != null}">
						<script type="text/javascript">
							$(function () {
								var name = '${pop_up.img_2}';
								$('.text_item_2_1').css('display', 'none');
								$('.text_item_2_2').css('display', 'block');
								$('.file_name_2').text(name);
							});
						</script>
					</c:if>
					
					<c:if test="${pop_up.img_3 != null}">
						<script type="text/javascript">
							$(function () {
								var name = '${pop_up.img_3}';
								$('.text_item_3_1').css('display', 'none');
								$('.text_item_3_2').css('display', 'block');
								$('.file_name_3').text(name);
							});
						</script>
					</c:if>
				</div>
			</div>
			
			<jsp:include page="/WEB-INF/jsp/footer/footer.jsp" />
		</section>
	</div>
</body>
</html>