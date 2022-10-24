<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<c:set var="root" value="${pageContext.request.contextPath}" />
<link rel="stylesheet" href="${root}/css/view/style.css">
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
			<span>마이페이지</span>
		</div>
	</div>
	
	<div id="navi_area">
		<nav>
			<ul>
				<li><a href="business_contents_list">MY 전시</a></li>
				<li><a href="business_payment">결제내역</a></li>
				<li><a href="login_check">회원정보 수정</a></li>
				<li><a href="business_password_update">비밀번호 수정</a></li>
				<li><a href="business_secession">회원탈퇴</a></li>
			</ul>
		</nav>
	</div>
	
	<section id="member_password_update">
		<div class="title_area">
			<span>비밀번호 수정</span>
		</div>
	
		<div class="contents">
			<div class="text_area">
				<span>- 새로운 비밀번호를 입력하여 주십시오.</span>
				<span>- 연속된 숫자, 생일번호, 주민등록번호 등 알기 쉬운 숫자는 피해주시기 바랍니다.</span>
			</div>
			<div class="input_area">
				<form method="post" action="business_password_update">
					<div class="infomation_item">
						<div class="left_area">
							<span>현재 비밀번호</span>
						</div>
							
						<div class="right_area">
							<input type="password" placeholder="비밀번호를 입력하세요." id="current_password" class="text_input">
						</div>
					</div>
					
					<div class="infomation_item">
						<div class="left_area">
							<span>새 비밀번호</span>
						</div>
						
						<div class="right_area">
							<input class="member_pw" name="password" type="password" placeholder="(영문 대소문자/숫자/특수문자 중 2가지 이상조합, 10~16자)"/>
							<span id="member_pw"></span>
						</div>
					</div>
					
					<div class="infomation_item">
						<div class="left_area">
							<span>새 비밀번호 확인</span>
						</div>
						
						<div class="right_area">
							<input class="member_pw_check" type="password" placeholder="비밀번호를 다시 입력하세요."/> <br>
							<span id="member_pw_check"></span>
						</div>
					</div>
					
				</form>
			</div>
		</div>
					<div class="btn_area">
						<input type="button" value="저장" id="business_pw_update_btn">
						<input type="reset" value="취소">
						
					</div>
						<script type="text/javascript">
							$('#business_pw_update_btn').click(function() {
								var current_password = $('#current_password').val();
								var member_pw = $('#member_pw').text();
								var member_pw_check = $('#member_pw_check').text();
								
								$.ajax({
									url : 'business_pw_check',
									type : 'post',
									data : {
										current_password : current_password
									},
									success : function(data) {
										if ($.trim(data) == 0) {
											alert('현재 비밀번호를 잘못 입력했습니다.');
										} else {
											if(member_pw != '사용가능'){
												alert("비밀번호를 다시 입력하세요.");
												return false;
											} else if(member_pw_check != '사용가능'){
												alert("비밀번호를 다시 입력하세요.");
												return false;
											} else {
												$('form').submit();
											}
										}
									},
									error : function() {
										alert('현재 비밀번호를 잘못 입력했습니다.');
									}
								});
							});
						</script>
	</section>
	
	<jsp:include page="/WEB-INF/jsp/footer/footer.jsp" />
	<script src="${root}/js/join.js"></script>
</body>
</html>