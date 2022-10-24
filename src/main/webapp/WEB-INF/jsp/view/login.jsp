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
<link rel="stylesheet" href="${root}/css/view/login/login.css">
<link rel="stylesheet" href="${root}/css/view/login/mobile_login.css">
<link rel="stylesheet" href="${root}/css/view/style.css">
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<meta name="viewport" content="width=device-width, initial-scale=1">
<script type="text/javascript">
	$(document).ready(function() {

		// 저장된 쿠키값을 가져와서 ID 칸에 넣어준다. 없으면 공백으로 들어감.
		var key = getCookie("key");
		$("#id").val(key);

		var key1 = getCookie("key1");
		$("#business_num").val(key1);

		if ($("#id").val() != "") { // 그 전에 ID를 저장해서 처음 페이지 로딩 시, 입력 칸에 저장된 ID가 표시된 상태라면,
			$("#idSaveCheck").attr("checked", true); // ID 저장하기를 체크 상태로 두기.
		}

		$("#idSaveCheck").change(function() { // 체크박스에 변화가 있다면,
			if ($("#idSaveCheck").is(":checked")) { // ID 저장하기 체크했을 때,
				setCookie("key", $("#id").val(), 7); // 7일 동안 쿠키 보관
			} else { // ID 저장하기 체크 해제 시,
				deleteCookie("key");
			}
		});

		// ID 저장하기를 체크한 상태에서 ID를 입력하는 경우, 이럴 때도 쿠키 저장.
		$("#id").keyup(function() { // ID 입력 칸에 ID를 입력할 때,
			if ($("#idSaveCheck").is(":checked")) { // ID 저장하기를 체크한 상태라면,
				setCookie("key", $("#id").val(), 7); // 7일 동안 쿠키 보관
			}
		});

		if ($("#business_num").val() != "") {
			$("#businessCheck").attr("checked", true);
		}

		$("#businessCheck").change(function() {
			if ($("#businessCheck").is(":checked")) {
				setCookie("key1", $("#business_num").val(), 7);
			} else {
				deleteCookie("key1");
			}
		});

		$("#business_num").keyup(function() {
			if ($("#businessCheck").is(":checked")) {
				setCookie("key1", $("#business_num").val(), 7);
			}
		});
	});

	function setCookie(cookieName, value, exdays) {
		var exdate = new Date();
		exdate.setDate(exdate.getDate() + exdays);
		var cookieValue = escape(value)
				+ ((exdays == null) ? "" : "; expires=" + exdate.toGMTString());
		document.cookie = cookieName + "=" + cookieValue;
	}

	function deleteCookie(cookieName) {
		var expireDate = new Date();
		expireDate.setDate(expireDate.getDate() - 1);
		document.cookie = cookieName + "= " + "; expires="
				+ expireDate.toGMTString();
	}

	function getCookie(cookieName) {
		cookieName = cookieName + '=';
		var cookieData = document.cookie;
		var start = cookieData.indexOf(cookieName);
		var cookieValue = '';
		if (start != -1) {
			start += cookieName.length;
			var end = cookieData.indexOf(';', start);
			if (end == -1)
				end = cookieData.length;
			cookieValue = cookieData.substring(start, end);
		}
		return unescape(cookieValue);
	}
</script>
<style type="text/css">
#footer {
	overflow: hidden;
	position: absolute;
    bottom: 0;
}
</style>
</head>
<body>
	<jsp:include page="/WEB-INF/jsp/header/header.jsp" />
	<div class="header">
		<div class="title">
			<span>로그인</span>
		</div>
	</div>
	<section id="login">
		<div class="content_area">
			<div class="login_area">
				<form method="post" action="member_login">
					<div class="title_area">
						<span>개인 회원로그인</span>
					</div>
					<div class="input_area">
						<input type="text" placeholder="아이디" name="id" id="id">
						<input type="password" placeholder="비밀번호" name="password">
					</div>
	
					<div class="remember_area">
						<input type="checkbox" id="idSaveCheck">
						<p>아이디 저장
						</p>
					</div>
					
					<button id="login">
						개인 회원 로그인
					</button>
				</form>
	
				<div class="login_sub_area">
					<div class="sub_area">
<!-- 						<div class="img_area"> -->
<%-- 							<img src="${root}/img/login/login_person_icon.JPG"> --%>
<!-- 						</div> -->
						<div class="input_area">
							<a href="member_id_find">아이디 찾기</a>
							|<a href="member_pw_find">비밀번호 찾기</a>
							|<a href="join">회원가입</a>
						</div>
					</div>
				</div>
			</div>
			
			<div class="line_area"></div>
	
			<div class="login_area" style="border: none;">
				<form method="post" action="business_login">
					<div class="title_area">
						<span>기업 회원로그인</span>
					</div>
					<div class="input_area">
						<input type="text" placeholder="사업자 번호" name="id" id="business_num">
						<input type="password" placeholder="비밀번호" name="password">
						<input type="submit" id="business_submit" style="display: none;">
					</div>
	
					<div class="remember_area">
						<input type="checkbox" id="businessCheck">
						<p>아이디 저장</p>
					</div>
					
					<button id="login">
						기업 회원 로그인
					</button>
				</form>
	
				<div class="login_sub_area">
					<div class="sub_area">
						<div class="input_area">
							<a href="business_pw_find">비밀번호 찾기</a>
							|<a href="join">회원가입</a>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>
	<jsp:include page="/WEB-INF/jsp/footer/footer.jsp" />
	
	<section id="mobile_login">
		
		<a href="javascript:history.back();" id="back_area">
			<img alt="" src="${root}/img/common/back_btn.svg" class="back_btn">
			<span>로그인</span>
		</a>
		
		<form method="post" action="member_login">
			<div class="input_area">
				<input type="text" placeholder="아이디" name="id">
				<input type="password" placeholder="비밀번호" name="password">
				<button>로그인</button>
			</div>
		</form>
		
		<div class="find_area">
			<a href="member_id_find">아이디 찾기</a>
			<div class="line_area"></div>
			<a href="member_pw_find">비밀번호 찾기</a>
			<div class="line_area"></div>
			<a href="join">회원가입</a>
		</div>
	</section>
	
	<jsp:include page="/WEB-INF/jsp/footer/mobile_footer.jsp" />
</body>
</html>