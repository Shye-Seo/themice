<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<c:set var="root" value="${pageContext.request.contextPath}" />
<link rel="stylesheet" href="${root}/css/view/style.css">
<link rel="stylesheet" href="${root}/css/view/find_info/find_info.css">
<link rel="stylesheet" href="${root}/css/view/mypage/mypage.css">
<script type="text/javascript"
	src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
<title>THE MICE</title>
<link rel="icon" href="${root}/img/common/favicon.svg">
</head>
<body>

	<jsp:include page="/WEB-INF/jsp/header/header.jsp" />
	
	<div class="header">
		<div class="title">
			<span>로그인</span>
		</div>
	</div>
	
	<section class="container">
		<div class="id_wrap">
			<h1 class="id_top_text">
				<b>기업</b> 비밀번호 찾기
			</h1>
			<div class="form_wrap">
				<div class="form_text_box">
					<div class="form_text text_on" id="email_btn">
						<span>이메일</span>
					</div>
					<div class="form_text" id="tel_btn">
						<span>휴대전화</span>
					</div>
					
					<script type="text/javascript">
						$(function () {
							$('#email_btn').click(function(){
								$('.email').css('display', 'block');
								$('#email_btn').css('border-bottom', '2px solid #EA933C');
								$('#email_btn').css('border-color', '#EA933C');
								$('#email_btn span').css('color', '#EA933C');
								
								$('.tel').css('display', 'none');
								$('#tel_btn').css('border-bottom', '2px solid #707070');
								$('#tel_btn').css('border-color', '#333');
								$('#tel_btn span').css('color', '#333');
							});
							
							$('#tel_btn').click(function(){
								$('.email').css('display', 'none');
								$('#email_btn').css('border-bottom', '2px solid #707070');
								$('#email_btn').css('border-color', '#333');
								$('#email_btn span').css('color', '#333');
								
								$('.tel').css('display', 'block');
								$('#tel_btn').css('border-bottom', '2px solid #EA933C');
								$('#tel_btn').css('border-color', '#EA933C');
								$('#tel_btn span').css('color', '#EA933C');
							});
						});
					</script>
				</div>
				<form id="id_form" class="email">
					<input type="text" id="email_business_num" placeholder="사업자등록번호를 입력해주세요.">
					<input type="email" id="email" name="email" placeholder="이메일을 입력해주세요.">
					<button type="button" id="email_search">비밀번호 찾기</button>
				</form>

				<form id="id_form" class="tel">
					<input type="text" id="tel_business_num" placeholder="사업자등록번호를 입력해주세요.">
					<input type="tel" id="tel" name="tel" placeholder="'-'빼고 입력해주세요.">
					<button type="button" id="tel_search">비밀번호 찾기</button>
				</form>
				
				<script type="text/javascript">
					$(function () {
						var width = '400';
						var height = '200';
						
						var left = Math.ceil((window.screen.width - width)/2);
						var top = Math.ceil((window.screen.width - width)/2);
						
						$('#email_search').click(function(){
							
							var business_num = $('#email_business_num').val();
							var email = $('#email').val();
							
							$.ajax({
								url : 'business_email_pw_find',
								type : 'post',
								data : {
									business_num : business_num,
									email : email
								},
								success : function(data) {
									if ($.trim(data) == 1) {
										var url = "/Home/business_pw_email_certification?business_num=" + business_num + "&certification_type=" + email;
										window.open(url, "", "width=" + width + ", height=" + height + ", left=" + left + ", top=" + top);
									} else {
										alert('일치하는 정보가 없습니다.');
									}
								},
								error : function() {
									alert("에러입니다");
								}
							});
						});
						
						$('#tel_search').click(function(){
							var business_num = $('#tel_business_num').val();
							var tel = $('#tel').val();
							
							$.ajax({
								url : 'business_tel_pw_find',
								type : 'post',
								data : {
									business_num : business_num,
									tel : tel
								},
								success : function(data) {
									if ($.trim(data) == 1) {
										var url = "/Home/business_pw_tel_certification?business_num=" + business_num + "&certification_type=" + tel;
										window.open(url, "", "width=" + width + ", height=" + height + ", left=" + left + ", top=" + top);
									} else {
										alert('일치하는 정보가 없습니다.');
									}
								},
								error : function() {
									alert("에러입니다");
								}
							});
						});
					});
				</script>
			</div>
		</div>
	</section>
	
	<jsp:include page="/WEB-INF/jsp/footer/footer.jsp" />
	
</body>
</html>