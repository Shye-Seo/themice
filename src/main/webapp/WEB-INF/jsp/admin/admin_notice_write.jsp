<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="root" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="${root}/css/admin_style.css">
<script type="text/javascript" src="//code.jquery.com/jquery-1.11.0.min.js"></script>
</head>
<body>
	<section id="admin_notice_write">
		<div class="navi_area">
			<jsp:include page="/WEB-INF/jsp/admin/admin_side.jsp" />
		</div>
		
		<div class="contents_area">
			<div class="inner">
				<div class="container_1">
					<span>공지사항 등록</span> <a href="admin_notice">목록</a>
				</div>
				
				<div class="container_2">
					<form name="uploadForm" id="uploadForm" enctype="multipart/form-data" method="post">
						<div class="info_item">
							<div class="left_area">
								<span>제목</span>
							</div>
							<div class="right_area">
								<input type="text" name="title" id="title">
							</div>
						</div>

						<div class="info_item">
							<div class="left_area">
								<span>게시 기간</span>
							</div>
							<div class="right_area">
								<input type="date" name="start_day" id="start_day">
								~
								<input type="date" name="end_day" id="end_day">
							</div>
						</div>
					
						<div class="info_item">
							<div class="left_area">
								<span>첨부파일</span>
							</div>
							<div class="right_area upload_area">
								<div class="upload_item_1">
									<input type="file" name="file" id="file_upload">
									<img alt="" src="${root}/img/admin/close.svg" class="close_btn">
									<label for="file_upload" id="image_container"> * 클릭하여 파일을 첨부 해주세요.<br>
									<br> * 파일 크기는 5MB 이내로 가능합니다.
									</label>
								</div>
								<div class="upload_item_2">
									<label for="file_upload"><img alt="" src="${root}/img/admin/upload_icon.svg">내PC</label>
								</div>
								
								<script type="text/javascript">
									$(function() {
										$('input[name=file]').off().on('change', function(){
											if (this.files && this.files[0]) {
												var imgFile = $(this).val();
												var maxSize = 5 * 1024 * 1024;
												var fileSize = this.files[0].size;
												
												if(fileSize > maxSize){
													alert("파일 크기는 5MB 이내로 등록 가능합니다.");
													$(this).val('');
													return false;
												}
											
												if(!imgFile) {
													$('#image_container').css('display', 'block');
													$('#file_upload').css('display', 'none');
													$('.close_btn').css('display', 'none');
												} else {
													$('#image_container').css('display', 'none');
													$('#file_upload').css('display', 'block');
													$('.close_btn').css('display', 'block');
												}
											}
										});
										
										$('.close_btn').click(function () {
											$('input[name=file]').val('');
											$('#image_container').css('display', 'block');
											$('#file_upload').css('display', 'none');
											$('.close_btn').css('display', 'none');
										});
									});
								</script>
							</div>
						</div>
						
						<div class="info_item">
							<div class="left_area">
								<span>글 작성</span>
							</div>
							
							<div class="right_area upload_area">
								<textarea name="contents" id="contents"></textarea>
							</div>
						</div>
						
						<div class="submit_area">
							<input type="button" value="등록" id="submit_btn">
							<script type="text/javascript">
								$('#submit_btn').click(function () {
									var title = $('#title').val();
									var start_day = $('#start_day').val();
									var end_day = $('#end_day').val();
									var contents = $('#contents').val();
									
									if(!title){
										alert('제목을 입력해주세요.');
										return false;
									} else if(!start_day || !end_day){
										alert('게시 기간을 입력해주세요.');
										return false;
									} else if(!contents){
										alert('내용을 입력해주세요.');
										return false;
									} else {
										$('#uploadForm').submit();
									}
								});
							</script>
						</div>
					</form>
				</div>
			</div>
		</div>
	</section>
</body>
</html>