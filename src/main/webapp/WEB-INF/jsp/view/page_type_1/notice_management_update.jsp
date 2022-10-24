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
	
	<div id="management_title_area">
			<span>환경설정</span>
		</div>
		<div id="navi_area">
			<nav>
				<ul>
					<li><a href="main_management?contents_idx=${contents_idx}">메인관리</a></li>
					<li><a href="introduction_management?contents_idx=${contents_idx}">소개관리</a></li>
					<li><a href="gallery_management?contents_idx=${contents_idx}">갤러리관리</a></li>
					<li><a href="notice_management?contents_idx=${contents_idx}">공지사항관리</a></li>
					<li><a href="pop_up_management?contents_idx=${contents_idx}">팝업관리</a></li>
					<li><a href="comment_management?contents_idx=${contents_idx}">댓글관리</a></li>
				</ul>
			</nav>
		</div>
		
	<section id="preferences">
		<div class="inner">
			<div class="notice_management_insert">
				<span class="title_area">공지사항 수정</span>
				
				<form method="post" action="notice_management_update" enctype="multipart/form-data">
					<input type="hidden" name="contents_idx" value="${contents_idx}">
						<div class="infomation">
							<div class="left_area">
								<span>제목</span>
							</div>
							
							<div class="right_area">
								<input type="text" name="title" id="title" value="${title}">
							</div>
						</div>
						
						<div class="infomation">
							<div class="left_area">
								<span>게시 기간</span>
							</div>
							
							<div class="right_area">
								<input type="date" name="start_day" id="start_day"> ~ <input type="date" name="end_day" id="end_day">
							</div>
						</div>
						
						<div class="infomation">
							<div class="left_area">
								<span>작성자</span>
							</div>
							
							<div class="right_area">
								<input type="text" name="writer" id="writer" value="${writer}">
							</div>
						</div>
						
						<div class="infomation">
							<div class="left_area">
								<span>첨부파일</span>
							</div>
							
							<div class="right_area">
								<input type="file" name="notice_img" id="notice_img" accept="image/*">
								<div class="upload_item_1">
									<span class="text_item">* 고해상도 이미지의 16:9 비율을 사용해주세요.</span>
									<span class="text_item">* 5MB까지 사용가능합니다.</span>
									<div class="text_item_2">
										<span class="file_name"></span>
										<img alt="" src="${root}/img/website/close.svg" class="close_item">
									</div>
								</div>
								
								<div class="upload_item_2">
									<label for="notice_img"><img alt="" src="${root}/img/website/upload_white.svg">내 PC</label>
								</div>
								
								<script type="text/javascript">
									$('input[name=notice_img]').off().on('change', function(){
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
												$('.text_item').css('display', 'none');
												$('.text_item_2').css('display', 'block');
												$('.file_name').text(fileName);
											}
										}
										
										$('.close_item').click(function () {
											$('.text_item').css('display', 'block');
											$('.text_item_1').css('display', 'none');
											$('input[name=notice_img]').val('');
										});
									});
								</script>
							</div>
						</div>
						
						<div class="infomation">
							<div class="left_area">
								<span>내용</span>
							</div>
							
							<div class="right_area">
								<textarea name="contents" id="contents">${contents}</textarea>
							</div>
						</div>
					<input type="hidden" name="idx" value="${notice_list.idx}">
				</form>
				
					<div class="btn_area">
						<input type="button" value="등록" id="submit_btn">
						<input type="reset" value="취소">
					</div>
							<script type="text/javascript">
								$(function () {
									$('#submit_btn').click(function () {
										var title = $('#title').val();
										var start_day = $('#start_day').val();
										var end_day = $('#end_day').val();
										var writer = $('#writer').val();
										var contents = $('#contents').val();
										
										if(!title) {
											alert('제목을 입력해주세요.');
											alert('제목 : '+title);
											return false;
										} else if (!start_day) {
											alert('시작 날짜를 입력해주세요.');
											return false;
										} else if (!end_day) {
											alert('종료 날짜를 입력해주세요.');
											return false;
										} else if (!writer) {
											alert('작성자를 입력해주세요.');
											return false;
										} else if (!contents) {
											alert('내용을 입력해주세요.');
											return false;
										} else {
											$('form').submit();
										}
									});
								});
							</script>
			</div>
		</div>
		
		<jsp:include page="/WEB-INF/jsp/footer/footer.jsp" />
	</section>
	</div>
</body>
</html>