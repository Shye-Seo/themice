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
		<div class="root">
			<img alt="" src="${root}/img/list/home_icon.svg">
			<span><img alt="" src="${root}/img/common/arrow_icon.svg"></span>
			<span>개인회원</span>
			<span><img alt="" src="${root}/img/common/arrow_icon.svg"></span>
			<span>비밀번호 수정</span>
		</div>
	</div>
	
	<div id="navi_area">
		<nav>
			<ul>
				<li>
					<a href="main">
						<img alt="" src="${root}/img/member_page/home_icon.svg">
					</a>
				</li>
				
				<li>
					<a href="#">전시</a>
				</li>
				
				<li>
					<select onchange="window.location.href=this.value">
						<option value="member_info">회원정보 수정</option>
						<option value="member_payment">결제 내역</option>
						<option value="member_password_update" selected="selected">비밀번호 수정</option>
						<option value="member_secession">회원 탈퇴</option>
					</select>
				</li>
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
				<form method="post">
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
							<input class="member_pw" name="password" type="password" placeholder="비밀번호를 입력하세요."/>
							<p>(영문 대소문자/숫자/특수문자 중 2가지 이상조합, 10~16자)</p>
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
					
					<div class="btn_area">
						<input type="button" value="저장" id="member_pw_update_btn">
						<input type="reset" value="취소">
					</div>
				</form>
			</div>
		</div>
	</section>
	
	<jsp:include page="/WEB-INF/jsp/footer/footer.jsp" />
	
	<script src="${root}/js/join.js"></script>
	<script src="${root}/js/member_page.js"></script>
</body>
</html>