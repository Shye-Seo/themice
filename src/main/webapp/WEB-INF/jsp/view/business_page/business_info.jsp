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
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Nanum+Gothic:wght@400;700;800&display=swap" rel="stylesheet">
<script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script src="${root}/js/map.js"></script>
<title>THE MICE</title>
<link rel="icon" href="${root}/img/common/favicon.svg">
<script>
	function business_smsCheck(obj, root) {
		if (obj.business_tel.value == "") {
			alert("휴대폰 번호를 입력하세요.");
			obj.business_tel.focus();
			return false;
		} else {
			let url = root + "/business_sendSMS?tel=" + obj.business_tel.value;
			window.open(url, "", "width=400, height=200");
		}
	}
</script>
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

	<section id="business_info">
		<div class="title_area">
			<span>회원정보 수정</span>
		</div>

		<div class="contents">
			<form method="post" action="business_info_update" id="businessform" enctype="multipart/form-data">
				<div class="infomation_item">
					<div class="left_area">
						<span>회사명</span>
					</div>
					<div class="right_area">
						<input type="text" name="business_name" placeholder="회사명을 입력해주세요."
							value="${vo.business_name}" id="name">
					</div>
				</div>

				<div class="infomation_item">
					<div class="left_area">
						<span>주소</span>
					</div>
					<div class="right_area">
<!-- 						<div class="div"> -->
<!-- 							<input type="text" id="postcode" placeholder="우편번호" class="input"> -->
<!-- 							<input type="button" onclick="sample4_execDaumPostcode()" -->
<!-- 								value="우편번호 찾기" class="post"> -->
<!-- 						</div> -->
<!-- 						<div class="div"> -->
<!-- 							<input type="text" id="roadAddress" placeholder="도로명주소" -->
<%-- 								class="input" name="address" value="${vo.address}"> --%>
<!-- 						</div> -->
<!-- 						<div class="div"> -->
<!-- 							<input type="text" id="detailAddress" placeholder="상세주소" -->
<%-- 								class="input" name="detail_address" value="${vo.detail_address}"> --%>
<!-- 						</div> -->
						<table>
							<tr>
								<td><input type="text" id="postcode" placeholder="우편번호" class="input"></td>
								<td><input type="button" onclick="sample4_execDaumPostcode()"
								value="주소검색" class="post"></td>
							</tr>
							<tr>
								<td id="roadAddress"><input type="text" id="roadAddress" placeholder="도로명주소"
								class="input" name="address" value="${vo.address}"></td>
							</tr>
							<tr>
								<td><input type="text" id="detailAddress" placeholder="상세주소"
								class="input" name="detail_address" value="${vo.detail_address}"></td>
							</tr>
						</table>
					</div>
				</div>

				<div class="infomation_item">
					<div class="left_area">
						<span>이메일</span>
					</div>
					<div class="right_area form email_area">
						<input type="text" name="email" value="${email_id}" placeholder="이메일을 입력해주세요.">
						@<input type="text" name="email_add" maxlength="50" value="${email_domain}">
						<select name="sel_email">
							<option value="etc">직접입력</option> 
							<option value="naver.com">naver.com</option>
							<option value="hanmail.net">hanmail.net</option>
							<option value="gmail.com">gmail.com</option>
							<option value="yahoo.com">yahoo.com</option>
							<option value="hotmail.com">hotmail.com</option>
							<option value="korea.com">korea.com</option>
							<option value="nate.com">nate.com</option>
						</select>
						<script type="text/javascript">
								$("select[name=sel_email]").on(
										"change",
										function() {
											var $addr = $(this).closest(".form").find(
													"input[name=email_add]");
											if ($(this).val() == "etc") {
												$addr.val('');
												$addr.prop("readonly", false);
					
											} else {
												$addr.val($(this).val());
												$addr.prop("readonly", true);
											}
										});
							</script>
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
							id="business_tel" value="${vo.tel}"> <input type="button"
							onclick="mypage_business_smsCheck(businessform, '${root}')" value="인증요청"
							class="certification_button" readonly>
							<input type="hidden" id="business_sms_certification" value="">
					</div>
				</div>

				<div class="infomation_item">
					<div class="left_area">
						<span>팩스번호</span>
					</div>
					<div class="right_area">
						<input type="text" name="fax" value="${vo.fax}">
					</div>
				</div>
				
			</form>
				<div class="btn_area">
					<input type="button" value="저장" class="submit_btn">
					<input type="reset" value="취소">
					
				</div>
					<script type="text/javascript">
						$(function () {
							$('.submit_btn').click(function(){
								var name = $('#name').val();
								var business_sms_certification = $('#business_sms_certification').val();
								
								if(name == null || name == ''){
									alert('이름을 입력해주세요.');
									return false;
								} else if(business_sms_certification == null || business_sms_certification == ''){
									alert('휴대폰 번호 인증을 해주세요.');
									return false;
								} else {
									$('#businessform').submit();
								}
							});
						})
					</script>
		</div>
	</section>

	<jsp:include page="/WEB-INF/jsp/footer/footer.jsp" />
	<script src="${root}/js/join.js"></script>
</body>
</html>