<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<c:set var="root" value="${pageContext.request.contextPath}"/>
<link rel="stylesheet" href="${root}/css/view/style.css">
<link rel="stylesheet" href="${root}/css/view/find_info/mobile_find.css">
<script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>THE MICE</title>
<link rel="icon" href="${root}/img/common/favicon.svg">
</head>
<body>
	<a href="javascript:history.back();" id="back_area"> <img alt=""
		src="${root}/img/common/back_btn.svg" class="back_btn"> <span>비밀번호 찾기</span>
	</a>
	
	<section id="mobile_id_find">
		<div class="title">
			<span>비밀번호 변경</span>
		</div>
		
		<form method="post" action="m_member_pw_result" id="pw_result">
			<div class="content_item">
				<span>새 비밀번호</span>
				<span id="pw_ture" style="display: none; color: blue;">사용가능</span>
				<span id="pw_false" style="display: none; color: red;">사용불가</span>
			</div>
			
			<div class="input_item">
				<input class="pw" id="password" name="password" type="password" placeholder="비밀번호를 입력하세요." required />
				<input type="hidden" id="pw_check" value="">
				<p>(영문 대소문자/숫자/특수문자 중 2가지 이상조합, 10~16자)</p>
			</div>
			
			<div class="content_item">
				<span>새 비밀번호 확인</span>
				<span id="alert-success" style="display: none; color: blue;">비밀번호가 일치합니다.</span>
				<span id="alert-danger" style="display: none; color: red;">비밀번호가 일치하지 않습니다.</span>
			</div>
			
			<div class="input_item">
				<input class="pw" id="ConfirmPassword" type="password" placeholder="비밀번호를 다시 입력하세요." required />
				<input type="hidden" id="pw_re_check" value="">
			</div>
			
			<input type="hidden" name="id" value="${vo.id}">
			<input type="button" id="pw_result_btn" value="저장">
			
			<script>
				$('.pw').focusout(function (){
					var pw = $("#password").val();
					var num = pw.search(/[0-9]/g);
					var eng = pw.search(/[a-z]/ig);
					var spe = pw.search(/[`~!@@#$%^&*|₩₩₩'₩";:₩/?]/gi);
	
					if(pw.length < 10 || pw.length > 16){
						$("#pw_false").css('display','block');
						$("#pw_ture").css('display', 'none');
					} else if(pw.search(/\s/) != -1){
						$("#pw_false").css('display','block');
						$("#pw_ture").css('display', 'none');
					} else if( (num < 0 && eng < 0) || (eng < 0 && spe < 0) || (spe < 0 && num < 0) ){
						$("#pw_false").css('display','block');
						$("#pw_ture").css('display', 'none');
					}else {
						$("#pw_false").css('display','none');
						$("#pw_ture").css('display', 'block');
						$('#pw_check').val('check');
				}});
				
				$('.pw').focusout(function() {
					var pwd1 = $("#password").val();
					var pwd2 = $("#ConfirmPassword").val();

					if (pwd1 != '' && pwd2 == '') {
						null;
					} else if (pwd1 != "" || pwd2 != "") {
						if (pwd1 == pwd2) {
							$("#alert-success").css('display', 'block');
							$("#alert-danger").css('display', 'none');
							$('#pw_re_check').val('check');
						} else {
							$("#alert-success").css('display', 'none');
							$("#alert-danger").css('display', 'block');
						}
					}
				});
				
				$('#pw_result_btn').click(function(){
					var pw_check = $('#pw_check').val();
					var pw_re_check = $('#pw_re_check').val();
					
					if(pw_check == 'check'){
						if(pw_re_check == 'check'){
							$('#pw_result').submit();
						} else {
							alert('비밀번호를 다시 입력하세요.');
						}
					} else {
						alert('비밀번호를 다시 입력하세요.');
					}
				});
			</script>
		</form>
	</section>
</body>
</html>