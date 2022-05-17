<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<c:set var="root" value="${pageContext.request.contextPath}" />
<link rel="stylesheet" href="${root}/css/view/find_info/find_info.css">
<link rel="stylesheet" href="${root}/css/view/mypage/mypage.css">
<link rel="stylesheet" href="${root}/css/view/style.css">
<script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>THE MICE</title>
<link rel="icon" href="${root}/img/common/favicon.svg">
</head>
<body>

	<jsp:include page="/WEB-INF/jsp/header/header.jsp" />
	
	<div class="header">
		<div class="title">
			<span>마이페이지</span>
		</div>
		<div class="root">
			<img alt="" src="${root}/img/list/home_icon.svg">
			<span><img alt="" src="${root}/img/common/arrow_icon.svg"></span>
			<span>마이페이지</span>
			<span><img alt="" src="${root}/img/common/arrow_icon.svg"></span>
			<span>아이디 찾기</span>
		</div>
	</div>
	
	<section class="container">
		<div class="id_wrap">
			<h1 class="id_top_text">
				<b>개인</b>아이디 찾기
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
								$('#email_btn').css('font-weight', '800');
								$('#email_btn').css('border-bottom', '3px solid #EA933C');
								$('#email_btn').css('border-color', '#EA933C');
								$('#email_btn span').css('color', '#EA933C');
								
								$('.tel').css('display', 'none');
								$('#tel_btn').css('font-weight', 'unset');
								$('#tel_btn').css('border-bottom', '2px solid #707070');
								$('#tel_btn').css('border-color', '#333');
								$('#tel_btn span').css('color', '#333');
							});
							
							$('#tel_btn').click(function(){
								$('.email').css('display', 'none');
								$('#email_btn').css('font-weight', 'unset');
								$('#email_btn').css('border-bottom', '2px solid #707070');
								$('#email_btn').css('border-color', '#333');
								$('#email_btn span').css('color', '#333');
								
								$('.tel').css('display', 'block');
								$('#tel_btn').css('font-weight', '800');
								$('#tel_btn').css('border-bottom', '3px solid #EA933C');
								$('#tel_btn').css('border-color', '#EA933C');
								$('#tel_btn span').css('color', '#EA933C');
							});
						});
					</script>
				</div>
				<form id="id_form" class="email">
					<input type="text" name="name" id="email_name" placeholder="이름을 입력해주세요.">
					<input type="email" id="email" name="email" placeholder="이메일을 입력해주세요.">
					<button type="button" id="email_search">아이디 찾기</button>
				</form>

				<form id="id_form" action="#" class="tel">
					<input type="text" name="name" id="tel_name" placeholder="이름을 입력해주세요.">
					<input type="tel" id="tel" name="tel" placeholder="'-'빼고 입력해주세요.">
					<button type="button" id="tel_search">아이디 찾기</button>
				</form>
				
				<script type="text/javascript">
					$(function () {
						var width = '400';
						var height = '200';
						
						var left = Math.ceil((window.screen.width - width)/2);
						var top = Math.ceil((window.screen.width - height)/2);
						
						$('#email_search').click(function(){
							
							var name = $('#email_name').val();
							var email = $('#email').val();
							
							$.ajax({
								url : 'member_email_id_find',
								type : 'post',
								data : {
									name : name,
									email : email
								},
								success : function(data) {
									if ($.trim(data) == 1) {
										var url = "/Home/member_id_email_certification?name=" + name + "&certification_type=" + email;
										window.open(url, "", "width=" + width + ", height=" + height + ", left=" + left + ", top=" + top);
									} else {
										alert('일치하는 정보가 없습니다.');
									}
								},
								error : function() {
									alert('일치하는 정보가 없습니다.');
								}
							});
						});
						
						$('#tel_search').click(function(){
							var name = $('#tel_name').val();
							var tel = $('#tel').val();
							
							$.ajax({
								url : 'member_tel_id_find',
								type : 'post',
								data : {
									name : name,
									tel : tel
								},
								success : function(data) {
									if ($.trim(data) == 1) {
										var url = "/Home/member_id_tel_certification?name=" + name + "&certification_type=" + tel;
										window.open(url, "", "width=" + width + ", height=" + height + ", left=" + left + ", top=" + top);
									} else {
										alert('일치하는 정보가 없습니다.');
									}
								},
								error : function() {
									alert("일치하는 정보가 없습니다.");
								}
							});
						});
					});
				</script>
			</div>
		</div>
	</section>
	
	<a href="javascript:history.back();" id="back_area"> <img alt=""
		src="${root}/img/common/back_btn.svg" class="back_btn"> <span>아이디 찾기</span>
	</a>
	
	<section id="mobile_id_find">
		<div class="category_area">
			<span class="m_email_btn">이메일</span>
			<span class="m_tel_btn">휴대전화</span>
		</div>
		
		<form id="mobile_email" action="m_member_id_result">
			<span>이름</span>
			<input type="text" id="m_email_name" placeholder="이름을 입력해주세요." name="name">
			
			<span>이메일주소</span>
			<div class="email_area">
				<input type="text" id="m_email" placeholder="이메일을 입력해주세요." name="email">
				<input type="button" value="인증발송" id="send_email_btn">
			</div>
			<input type="text" id="email_certification" placeholder="인증번호를 입력해주세요.">
			<input type="button" value="아이디 찾기" id="email_submit_btn">
		</form>
		
		<form id="mobile_tel" action="m_member_id_result">
			<span>이름</span>
			<input type="text" id="m_tel_name" placeholder="이름을 입력해주세요." name="name">
			
			<span>휴대폰번호</span>
			<div class="tel_area">
				<input type="text" id="m_tel" placeholder="전화번호를 입력해주세요." name="tel">
				<input type="button" value="인증발송" id="send_tel_btn">
			</div>
			<input type="text" id="tel_certification" placeholder="인증번호를 입력해주세요.">
			<input type="button" value="아이디 찾기" id="tel_submit_btn">
		</form>
	</section>
	
	<script type="text/javascript">
		$(function () {
			
			$('.m_email_btn').click(function(){
				$('#mobile_email').css('display', 'flex');
				$('#mobile_tel').css('display', 'none');
				$('.m_email_btn').css('color', '#EF8E24');
				$('.m_email_btn').css('border-color', '#EF8E24');
				$('.m_email_btn').css('border-width', '3px');
				$('.m_tel_btn').css('color', '#333333');
				$('.m_tel_btn').css('border-color', '#707070');
				$('.m_tel_btn').css('border-width', '1px');
			});
			
			$('.m_tel_btn').click(function(){
				$('#mobile_email').css('display', 'none');
				$('#mobile_tel').css('display', 'flex');
				$('.m_email_btn').css('color', '#333333');
				$('.m_email_btn').css('border-color', '#707070');
				$('.m_email_btn').css('border-width', '1px');
				$('.m_tel_btn').css('color', '#EF8E24');
				$('.m_tel_btn').css('border-color', '#EF8E24');
				$('.m_tel_btn').css('border-width', '3px');
			});
			
			$('#send_email_btn').click(function(){
				var name = $('#m_email_name').val();
				var email = $('#m_email').val();
				var filter = /^([\w-\.]+)@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.)|(([\w-]+\.)+))([a-zA-Z]{2,4}|[0-9]{1,3})(\]?)$/;
				
				if (filter.test(email) === true) {
					if(email == null || email == ''){
						alert('이메일을 입력해주세요.');
					} else if(name == null || name == '') {
						
					} else {
						$.ajax({
							url : 'send_m_email',
							type : 'post',
							data : {
								name : name,
								email : email
							},
							success : function(data) {
								if ($.trim(data) == 0) {
									alert('일치하는 정보가 없습니다.');
								} else{
									alert('인증번호 발송 완료');
								}
							},
							error : function() {
								alert('인증번호 발송에 실패하였습니다');
							}
						});
					}
				} else {
					alert('이메일 형식에 맞게 입력해주세요.');
				}
			});
			
			$('#email_submit_btn').click(function(){
				var name = $('#m_email_name').val();
				var email = $('#m_email').val();
				var certification = $('#email_certification').val();
				
				if(name == null || name == ''){
					alert('이름을 입력해주세요.');
					return false;
				} else if(email == null || email == ''){
					alert('이메일을 입력해주세요.');
					return false;
				} else {
					$.ajax({
						url : 'send_m_email_check',
						type : 'post',
						data : {
							certification : certification
						},
						success : function(data) {
							if ($.trim(data) == 1) {
								$('#mobile_email').submit();
							} else {
								alert('인증번호를 다시 입력하세요');
							}
						},
						error : function() {
							alert('인증번호를 다시 입력하세요');
						}
					});
				}
			});
			
			$('#send_tel_btn').click(function(){
				var name = $('#m_tel_name').val();
				var tel = $('#m_tel').val();
				var regPhone = /^01([0|1|6|7|8|9])-?([0-9]{3,4})-?([0-9]{4})$/;
				
				if (regPhone.test(tel) === true) {
					if(tel == null || tel == ''){
						alert('-을 제외한 휴대폰 번호를 입력해주세요.');
					} else {
						$.ajax({
							url : 'send_m_sms',
							type : 'post',
							data : {
								name : name,
								tel : tel
							},
							success : function(data) {
								if ($.trim(data) == 0) {
									alert('인증번호 발송에 실패하였습니다');
								} else{
									alert('인증번호 발송 완료');
								}
							},
							error : function() {
								alert('인증번호 발송에 실패하였습니다');
							}
						});
					}
			    } else {
			    	alert('-을 제외한 휴대폰 번호를 입력해주세요.');
			    }
			});
			
			$('#tel_submit_btn').click(function(){
				var name = $('#m_tel_name').val();
				var tel = $('#m_tel').val();
				var certification = $('#tel_certification').val();
				
				if(name == null || name == ''){
					alert('이름을 입력해주세요.');
					return false;
				} else if(tel == null || tel == ''){
					alert('전화번호를 입력해주세요.');
					return false;
				} else {
					$.ajax({
						url : 'send_m_sms_check',
						type : 'post',
						data : {
							certification : certification
						},
						success : function(data) {
							if ($.trim(data) == 1) {
								$('#mobile_tel').submit();
							} else {
								alert('인증번호를 다시 입력하세요');
							}
						},
						error : function() {
							alert('인증번호를 다시 입력하세요');
						}
					});
				}
			});
		});
	</script>
	
	<jsp:include page="/WEB-INF/jsp/footer/footer.jsp" />

</body>
</html>