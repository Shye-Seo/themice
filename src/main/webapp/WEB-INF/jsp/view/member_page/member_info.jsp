<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<c:set var="root" value="${pageContext.request.contextPath}" />
<link rel="stylesheet" href="${root}/css/view/mypage/mypage.css">
<link rel="stylesheet" href="${root}/css/view/mypage/mobile_mypage.css">
<link rel="stylesheet" href="${root}/css/view/style.css">
<script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<script src="${root}/js/map.js"></script>
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
				<li><a href="member_payment">결제내역</a></li>
				<li><a href="login_check">회원정보 수정</a></li>
				<li><a href="member_password_update">비밀번호 수정</a></li>
				<li><a href="member_secession">회원탈퇴</a></li>
			</ul>
		</nav>
	</div>
	
	<section id="member_info">
		<div class="title_area">
			<span>회원정보 수정</span>
		</div>
			
		<div class="contents">
			<form method="post" action="member_info_update" enctype="multipart/form-data" id="joinform">
				<div class="infomation_item">
					<div class="left_area">
						<span>이름</span>
					</div>
					<div class="right_area">
						<input type="text" name="name" placeholder="이름을 입력해주세요." value="${mv.name}" id="name">
					</div>
				</div>
				
				<div class="infomation_item">
					<div class="left_area">
						<span>주소</span>
					</div>
					<div class="right_area">
<!-- 						<div class="div"> -->
<!-- 							<input type="text" id="postcode" placeholder="우편번호" readonly> -->
<!-- 							<input type="button" onclick="sample4_execDaumPostcode()" value="주소검색" class="post"> -->
<!-- 						</div> -->
<!-- 						<div class="div"> -->
<%-- 							<input type="text" id="roadAddress" placeholder="도로명주소" name="address" value="${mv.address}" readonly> --%>
<!-- 						</div> -->
<!-- 						<div class="div"> -->
<%-- 							<input type="text" id="detailAddress" placeholder="상세주소" name="detail_address" value="${mv.detail_address}"> --%>
<!-- 						</div> -->
						<table>
							<tr>
								<td><input type="text" id="postcode" placeholder="우편번호" class="input"></td>
								<td><input type="button" onclick="sample4_execDaumPostcode()"
								value="주소검색" class="post"></td>
							</tr>
							<tr>
								<td id="roadAddress"><input type="text" id="roadAddress" placeholder="도로명주소"
								class="input" name="address" value="${mv.address}"></td>
							</tr>
							<tr>
								<td><input type="text" id="detailAddress" placeholder="상세주소"
								class="input" name="detail_address" value="${mv.detail_address}"></td>
							</tr>
						</table>
					</div>
				</div>
				
				<div class="infomation_item">
					<div class="left_area">
						<span>이메일</span>
					</div>
					<div class="right_area email_area">  
						<input type="text" name="email" class="mail_item_1" id="email" value="${email_id}">@<input type="text"
							name="email_add" maxlength="50" class="mail_item_2" id="email_add" value="${email_domain}">
						<select name="sel_email" class="mail_item_3">
							<option value="etc">직접입력</option>
							<option value="naver.com">naver.com</option>
							<option value="hanmail.net">hanmail.net</option>
							<option value="gmail.com">gmail.com</option>
							<option value="yahoo.com">yahoo.com</option>
							<option value="hotmail.com">hotmail.com</option>
							<option value="korea.com">korea.com</option>
							<option value="nate.com">nate.com</option>
						</select>
						<input type="hidden" id="email_check" value="">
					</div>
				</div>
				
				<div class="infomation_item">
					<div class="left_area">
						<span>휴대전화</span>
					</div>
					<div class="right_area tel_area">
						<input type="text" name="tel" placeholder="휴대폰 번호" class="input"
						oninput="this.value = this.value.replace(/[^0-9.]/g, '').replace(/(\..*)\./g, '$1');"
						pattern="(?:(010-\d{4})|(01[1|6|7|8|9]-\d{3,4}))-(\d{4})"
						id="tel" value="${mv.tel}"> <input type="button"
						onclick="mypage_smsCheck(joinform, '${root}')" value="인증요청"
						class="certification_button" readonly>
						<input type="hidden" id="sms_certification" value="">
					</div>
				</div>
				
<!-- 				<div class="infomation_item"> -->
<!-- 					<div class="left_area"> -->
<!-- 						<span>프로필 사진</span> -->
<!-- 					</div> -->
<!-- 					<div class="right_area profile_area"> -->
<!-- 						<div class="img_area"> -->
<%-- 							<img alt="" src="${root}/img/join/user_profile_icon.svg"> --%>
<!-- 						</div> -->
<!-- 						<div class="input_file_area"> -->
<!-- 							<input type="file" name="file" value="이미지 첨부" -->
<!-- 								id="profile_file_upload" accept="image/*"> <label -->
<!-- 								for="profile_file_upload">사진 첨부</label> -->
<!-- 						</div> -->
<!-- 					</div> -->
<!-- 				</div> -->
			</form>
				<div class="btn_area">
					<input type="button" value="저장" class="submit_btn" id="member_info_update_btn">
					<input type="reset" value="취소">
				</div>
		</div>
	</section>
	
	<jsp:include page="/WEB-INF/jsp/footer/footer.jsp" />
	
	
	<section id="m_member_info">
		
		<a href="javascript:history.back();" id="back_area">
			<img alt="" src="${root}/img/common/back_btn.svg" class="back_btn">
			<span>개인정보 수정</span>
		</a>
		
		<div class="contents_area">
			<form action="m_member_info_update" method="post">
				<div class="content_item">
					<div class="m_text_area">
						<span>이름</span>
					</div>
					<input type="text" name="name" placeholder="이름을 입력하세요." id="m_name">
				</div>
				
				<div class="content_item">
					<div class="m_text_area">
						<span>이메일</span>
					</div>
					<input type="email" name="email" placeholder="이메일을 입력하세요.">
				</div>
				
				<div class="content_item">
					<div class="m_text_area">
						<span>휴대폰 인증</span>
					</div>
					<div class="tel_area">
						<input type="text" name="tel" id="m_tel" placeholder="휴대폰 번호를 입력하세요">
						<input type="button" value="인증요청" id="m_tel_btn">
					</div>
					<input type="text" placeholder="인증번호를 입력하세요." id="certification">
				</div>
				
				<div class="m_submit_area">
					<input type="button" id="m_submit_btn" value="수정완료">
				</div>
			</form>
		</div>
	</section>
	<jsp:include page="/WEB-INF/jsp/footer/mobile_footer.jsp" />
	<script src="${root}/js/join.js"></script>
	<script src="${root}/js/member_page.js"></script>
</body>
</html>