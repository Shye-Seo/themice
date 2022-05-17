<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<c:set var="root" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript"
	src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
<link rel="stylesheet" href="${root}/css/admin_style.css">
<style type="text/css">
input[type="date"]::-webkit-calendar-picker-indicator {
	background-image: url("${root}/img/admin/calendar.svg");
	background-repeat: no-repeat;
	background-size: 15px;
	background-position: center;
}
</style>
</head>
<body>
	<section id="admin_advertisement_write">
		<div class="navi_area">
			<jsp:include page="/WEB-INF/jsp/admin/admin_side.jsp" />
		</div>
		<div class="contents_area">
			<div class="inner">
				<div class="container_1">
					<span>메인 등록</span>
				</div>

				<div class="container_2">
					<form method="post" enctype="multipart/form-data">
						<div class="info_item">
							<div class="left_area">
								<span>회사명</span>
							</div>
							<div class="right_area">
								<input type="text" name="business_name" id="business_name">
							</div>
						</div>

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
								<span>서브제목</span>
							</div>
							<div class="right_area">
								<input type="text" name="sub_title" id="sub_title">
							</div>
						</div>
						<div class="info_item">
							<div class="left_area">
								<span>링크주소</span>
							</div>
							<div class="right_area">
								<input type="text" name="link_address" id="link_address">
							</div>
						</div>
						<div class="info_item">
							<div class="left_area">
								<span>게시기간</span>
							</div>
							<div class="right_area">
								<input type="date" name="start_day" id="start_day"> ~ <input
									type="date" name="end_day" id="end_day">
							</div>
						</div>
						<div class="info_item">
							<div class="left_area">
								<span>광고비</span>
							</div>
							<div class="right_area">
								<input type="text" name="price" id="price">
							</div>
						</div>
						<div class="info_item">
							<div class="left_area">
								<div>첨부파일</div>
							</div>
							<div class="right_area upload_area">
								<div class="upload_item_1">
									<input type="file" id="img_file" accept="image/*" name="img" onchange="setThumbnail(event);">
									<label for="img_file" id="image_container"> * 고해상도의 16:9 이미지<br>
									<br> * 이미지의 인물, 물건 등을 오른쪽으로 배치된 사진을 첨부 해주세요.
									</label>
								</div>
								<div class="upload_item_2">
									<label for="img_file"><img alt=""
										src="${root}/img/admin/upload_icon.svg">내PC</label>
								</div>
								
								<script>
									function setThumbnail(event) {
										
										var id = $(this).attr('id');
										
										var reader = new FileReader();
										reader.onload = function(event) {
											var img = document.createElement("img");
											img.setAttribute("src", event.target.result);
											document.querySelector("#image_container").appendChild(img);
										};
										reader.readAsDataURL(event.target.files[0]);
									}
								</script>
							</div>
						</div>

						<div class="btn_area">
							<input type="button" value="완료" id="submit_btn"> <a
								href="admin_advertisement_list">목록</a>
						</div>

						<script type="text/javascript">
							$(function() {
								$('#submit_btn')
										.click(
												function() {
													var business_name = $(
															'#business_name')
															.val();
													var title = $('#title')
															.val();
													var sub_title = $(
															'#sub_title').val();
													var link_address = $(
															'#link_address')
															.val();
													var start_day = $(
															'#start_day').val();
													var end_day = $('#end_day')
															.val();
													var price = $('#price')
															.val();
													var img_file = $(
															'#img_file').val();

													if (business_name == "") {
														alert('회사명을 입력해주세요.');
														$('#business_name')
																.focus();
														return;
													} else if (title == "") {
														alert('제목을 입력해주세요.');
														$('#title').focus();
														return;
													} else if (sub_title == "") {
														alert('서브제목을 입력해주세요.');
														$('#sub_title').focus();
														return;
													} else if (link_address == "") {
														alert('링크주소를 입력해주세요.');
														$('#link_address')
																.focus();
														return;
													} else if (start_day == "") {
														alert('게시일을 입력해주세요.');
														$('#start_day').focus();
														return;
													} else if (end_day == "") {
														alert('종료일을 입력해주세요.');
														$('#end_day').focus();
														return;
													} else if (price == "") {
														alert('광고비를 입력해주세요.');
														$('#price').focus();
														return;
													} else if (img_file == "") {
														alert('이미지를 첨부해주세요.');
														return;
													} else {
														$("form").submit();
													}
												});
							})
						</script>
					</form>
				</div>
			</div>
		</div>
	</section>
</body>
</html>