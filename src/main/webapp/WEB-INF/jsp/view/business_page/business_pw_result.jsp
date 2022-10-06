<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<c:set var="root" value="${pageContext.request.contextPath}" />
<title>THE MICE</title>
<link rel="icon" href="${root}/img/common/favicon.svg">
<link rel="stylesheet" href="${root}/css/view/style.css">
<link rel="stylesheet" href="${root}/css/view/find_info/find_info.css">
<script type="text/javascript"
	src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
</head>
<body>
	<jsp:include page="/WEB-INF/jsp/header/header.jsp" />
	
	<div class="header">
		<div class="title">
			<span>마이페이지</span>
		</div>
	</div>
	
	<section id="member_pw_result_area">
		<div class="title_area">
			<span>기업회원 비밀번호찾기</span>
		</div>
		
		<div class="text_area">
			<p>새로운 비밀번호를 입력하여 주십시오.</p>
			<p>연속된 숫자, 생일번호, 주민등록번호 등 알기 쉬운 숫자는 피해주시기 바랍니다.</p>
		</div>
		
		<form>
			<div class="contents_item">
				<div class="left_area">
					<span>새비밀번호</span>
				</div>
				<div class="right_area">
					<input class="pw" id="password" name="password" type="password" placeholder="비밀번호를 입력하세요." required />
					<p>(영문 대소문자/숫자/특수문자 중 2가지 이상조합, 10~16자)</p>
					<span id="pw_ture" style="display: none; color: blue;">사용가능</span>
					<span id="pw_false" style="display: none; color: red;">사용불가</span>
					<script>
						$('.pw').focusout(function (){
							var pw = $("#password").val();
							var num = pw.search(/[0-9]/g);
							var eng = pw.search(/[a-z]/ig);
							var spe = pw.search(/[`~!@@#$%^&*|₩₩₩'₩";:₩/?]/gi);
	
							if(pw.length < 10 || pw.length > 16){
								$("#pw_false").css(
										'display',
										'block');
								$("#pw_ture").css(
										'display', 'none');
							} else if(pw.search(/\s/) != -1){
								$("#pw_false").css(
										'display',
										'block');
								$("#pw_ture").css(
										'display', 'none');
							} else if( (num < 0 && eng < 0) || (eng < 0 && spe < 0) || (spe < 0 && num < 0) ){
								$("#pw_false").css(
										'display',
										'block');
								$("#pw_ture").css(
										'display', 'none');
							}else {
								$("#pw_false").css(
										'display',
										'none');
								$("#pw_ture").css(
										'display', 'block');
						 }});
					</script>
				</div>
			</div>
			
			<div class="contents_item">
				<div class="left_area">
					<span>새비밀번호 확인</span>
				</div>
				<div class="right_area">
					<input class="pw" id="ConfirmPassword" type="password" placeholder="비밀번호를 다시 입력하세요." required />
					<span id="alert-success" style="display: none; color: blue;">비밀번호가 일치합니다.</span>
					<span id="alert-danger" style="display: none; color: red;">비밀번호가 일치하지 않습니다.</span>
					<script>
				 		$('.pw').focusout( function() {
							var pwd1 = $("#password").val();
							var pwd2 = $("#ConfirmPassword").val();

							if (pwd1 != '' && pwd2 == '') {
								null;
							} else if (pwd1 != "" || pwd2 != "") {
								if (pwd1 == pwd2) {
									$("#alert-success").css(
											'display',
											'block');
									$("#alert-danger").css(
											'display', 'none');
								} else {
									$("#alert-success").css(
											'display', 'none');
									$("#alert-danger").css(
											'display',
											'block');
								}
							}
						});
					</script>
				</div>
			</div>
			
			<div class="submit_area">
				<input type="button" value="변경완료" id="submit_btn">
			</div>
			
			<script type="text/javascript">
				$(function () {
					$('#submit_btn').click(function(){
						var password = $('#password').val();
						
						$.ajax({
							url : 'business_pw_result',
							type : 'post',
							data : {
								password : password
							},
							success : function(data) {
								if ($.trim(data) == 1) {
									alert('비밀번호 변경에 완료하였습니다.');
									location.href = 'login';
								} else {
									alert('비밀번호 변경에 실패하였습니다.');
								}
							},
							error : function() {
								alert("에러입니다");
							}
						});
					});
				});
			</script>
		</form>
		
		<div class="btn">
			<a href="login">로그인</a>
			<a href="member_id_find">아이디 찾기</a>
		</div>
	</section>
	
	<jsp:include page="/WEB-INF/jsp/footer/footer.jsp" />
</body>
</html>