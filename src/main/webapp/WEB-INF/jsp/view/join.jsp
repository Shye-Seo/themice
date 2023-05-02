<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>THE MICE</title>
<c:set var="root" value="${pageContext.request.contextPath}" />
<link rel="icon" href="${root}/img/common/favicon.svg">
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<link rel="stylesheet" href="${root}/css/view/join/join.css">
<link rel="stylesheet" href="${root}/css/view/join/mobile_join.css">
<link rel="stylesheet" href="${root}/css/view/style.css">
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/jquery-3.4.1.js"></script>
<script src="${root}/js/map.js"></script>
<meta name="viewport" content="width=device-width, initial-scale=1">
</head>
<body>
	<jsp:include page="/WEB-INF/jsp/header/header.jsp" />
	<div class="header">
		<div class="title">
			<span>회원가입</span>
		</div>
	</div>
	<section id="join">
		<div id="join_wrap">
		<div class="content_area">
			<div class="title_area">
<!-- 				<p>회원가입</p> -->
			</div>
	
			<div class="division_area">
				<div class="division">
					<div class="personal_div">
						<div id="div_text">
<!-- 							<input type="radio"	id="member_check" name="join" onchange="setDisplay()" checked> -->
							<label>개인회원</label>
						</div>
					</div>
					<div class="business_div">
						<div id="div_text">
<!-- 							<input type="radio" id="business_check" name="join" onchange="setDisplay()"> -->
							<label>사업자회원</label>
						</div>
					</div>
				</div>
			</div>
			
			<script type="text/javascript">
						$(function () {
							$('.personal_div').click(function(){
								$('#member').css('display', 'block');
								$('#business').css('display', 'none');
								$('.personal_div').css('background-color', '#EF8E24');
								$('.business_div').css('background-color', '#4B4B4B');
// 								$('#business_check').attr('checked', false);
// 								$('#member_check').attr('checked', true);
// 								$('input[type=radio][id=member_check]').attr('checked', true);
// 								$('input[type=radio][id=business_check]').attr('checked', false);
// 								$('#business').css('display', 'none');
							});
							
							$('.business_div').click(function(){
								$('#business').css('display', 'block');
								$('#member').css('display', 'none');
								$('.business_div').css('background-color', '#EF8E24');
								$('.personal_div').css('background-color', '#4B4B4B');
// 								$('#member_check').attr('checked', false);
// 								$('#business_check').attr('checked', true);
// 								$('input[type=radio][id=member_check]').attr('checked', false);
// 								$('input[type=radio][id=business_check]').attr('checked', true);
							});
						});
					</script>
			
			<div class="text_area">
				<div class="item_1">
					<p>기본정보</p>
				</div>
				<div class="item_2">
					<span>*</span>
					<p>필수입력사항</p>
				</div>
			</div>
				
			<div id="member">
				<form id="joinform" name="joinform" method="post" action="memeber_join">
					<div class="infomation_item">
						<div class="name_item">
							<span>*</span>
							<p>아이디</p>
						</div>
						<div class="value_item">
							<input type="text" id="id" name="id" placeholder="아이디" class="input" oninput="checkId()">
							<p>(영문소문자/숫자,4~16글자)</p>
							<span id="member_id_check"></span>
						</div>
					</div>
					<div class="infomation_item">
						<div class="name_item">
							<span>*</span>
							<p>비밀번호</p>
						</div>
						<div class="value_item">
							<input class="member_pw" name="password" type="password" placeholder="비밀번호를 입력하세요."/>
							<p>(영문 대소문자/숫자/특수문자 중 2가지 이상조합, 10~16자)</p>
							<span id="member_pw"></span>
						</div>
					</div>
	
					<div class="infomation_item">
						<div class="name_item">
							<span>*</span>
							<p>비밀번호 확인</p>
						</div>
						<div class="value_item">
							<input class="member_pw_check" type="password" placeholder="비밀번호를 다시 입력하세요."/> <br>
							<span id="member_pw_check"></span>
						</div>
					</div>
					<div class="infomation_item">
						<div class="name_item">
							<span>*</span>
							<p>이름</p>
						</div>
						<div class="value_item">
							<input type="text" name="name" placeholder="이름을 입력해주세요." id="member_name">
						</div>
					</div>
					<div class="infomation_item">
						<div class="name_item">
							<p>주소</p>
						</div>
						<div class="value_item">
							<div class="div">
								<input type="text" id="postcode" placeholder="우편번호" readonly>
								<input type="button" onclick="sample4_execDaumPostcode()" value="주소검색" class="post">
							</div>
							<div class="div">
								<input type="text" id="roadAddress" placeholder="도로명주소" name="address" readonly>
							</div>
							<div class="div">
								<input type="text" id="detailAddress" placeholder="상세주소" name="detail_address">
							</div>
						</div>
					</div>
	
					<div class="infomation_item">
						<div class="name_item">
							<p>이메일</p>
						</div>
						<div class="value_item form">
							<input type="text" name="email" class="mail_item_1" id="email">@<input type="text"
								name="email_add" maxlength="50" value="" class="mail_item_2" id="email_add">
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
					<div class="infomation_item" style="border-bottom: solid; border-width: 1px; border-color: #707070;">
						<div class="name_item">
							<span>*</span>
							<p>휴대전화</p>
						</div>
	
						<div class="value_item">
							<input type="text" name="tel" placeholder="휴대폰 번호" class="input"
								oninput="this.value = this.value.replace(/[^0-9.]/g, '').replace(/(\..*)\./g, '$1');" id="tel">
							<input type="button" onclick="smsCheck(joinform, '${root}')" value="휴대폰 인증" class="certification_button">
							<input type="button" id="sms_certification" value="" name="sms_certification">
						</div>
					</div>
					
					<div class="agreement">
						<div class="agree_title_area">
							<span>전체동의</span>
							<div class="check_area">
								<input type="checkbox" id="all_check_item">
								<label for="all_check_item">
									<img alt="" src="${root}/img/insertcontents/non_agreement_btn.svg">
									<img alt="" src="${root}/img/insertcontents/color_agreement_btn.svg">
								</label>
								<span>이용약관/개인정보이용/전시회정보수신에 모두 동의합니다.</span>
							</div>
						</div>
							
						<div class="agreement_area">
							<span class="title_span">[필수] 이용약관 동의</span>
							<textarea rows="" cols="">
	제 1 장 총칙
	
	제 1 조 (목적)
	본 약관은 더 마이스(THE MICE) 플랫폼의 제반 서비스의 이용조건 및 절차에 관한 사항 및 기타 필요한 사항을 규정함을 목적으로 한다.
	
	제 2 조 (용어의 정의)
	본 약관에서 사용하는 용어는 다음과 같이 정의한다.
	①회원 : 기본 회원 정보를 입력하였고, 회사와 서비스 이용계약을 체결하여 아이디를 부여받은 개인
	②아이디(ID) : 회원식별과 회원의 서비스 이용을 위해 회원이 선정하고 회사가 승인하는 문자와 숫자의 조합
	③비밀번호(Password) : 회원이 통신상의 자신의 비밀을 보호하기 위해 선정한 문자와 숫자의 조합
	④해지 : 회사 또는 회원에 의한 이용계약의 종료
	
	제 3 조 (약관의 공시 및 효력과 변경)
	①본 약관은 회원가입 화면에 게시하여 공시하며 '더 마이스(THE MICE) 플랫폼'은 사전 변경 및 영업상 중요한 사유가 있을 경우 약관을 변경할 수 있으며 변경된 약관은 공지사항을 통해 공시한다
	②본 약관 및 차후 회사사정에 따라 변경된 약관은 이용자에게 공시함으로써 효력을 발생한다.
	
	제 4 조 (약관 외 준칙)
	본 약관에 명시되지 않은 사항이 전기통신기본법, 전기통신사업법, 정보통신촉진법, ‘전자상거래등에서의 소비자 보호에 관한 법률’, ‘약관의 규제에관한법률’, ‘전자거래기본법’, ‘전자서명법’, ‘정보통신망 이용촉진등에 관한 법률’, ‘소비자보호법’ 등 기타 관계 법령에 규정되어 있을 경우에는 그 규정을 따르도록 한다.
	
	
	제 2 장 이용계약
	
	제 5 조 (이용신청)
	①이용신청자가 회원가입 안내에서 본 약관과 개인정보보호정책에 동의하고 등록절차(회사의 소정 양식의 가입 신청서 작성)를 거쳐 '확인' 버튼을 누르면 이용신청을 할 수 있다.
	②이용신청자는 반드시 실명과 실제 정보를 사용해야 하며 1개의 생년월일에 대하여 1건의 이용신청을 할 수 있다.
	③실명이나 실제 정보를 입력하지 않은 이용자는 법적인 보호를 받을 수 없으며, 서비스 이용에 제한을 받을 수 있다.
	
	제 6 조 (이용신청의 승낙)
	①'더 마이스(THE MICE) 플랫폼'은 제5조에 따른 이용신청자에 대하여 제2항 및 제3항의 경우를 예외로 하여 서비스 이용을 승낙한다.
	②'더 마이스(THE MICE) 플랫폼'은 아래 사항에 해당하는 경우에 그 제한사유가 해소될 때까지 승낙을 유보할 수 있다.
	  가. 서비스 관련 설비에 여유가 없는 경우
	  나. 기술상 지장이 있는 경우
	  다. 기타 회사 사정상 필요하다고 인정되는 경우
	③'더 마이스(THE MICE) 플랫폼'은 아래 사항에 해당하는 경우에 승낙을 하지 않을 수 있다.
	  가. 다른 사람의 명의를 사용하여 신청한 경우
	  나. 이용자 정보를 허위로 기재하여 신청한 경우
	  다. 사회의 안녕질서 또는 미풍양속을 저해할 목적으로 신청한 경우
	  라. 기타 회사가 정한 이용신청 요건이 미비한 경우
	
	
	제 3 장 계약 당사자의 의무
	
	제 7 조 (회사의 의무)
	①'더 마이스(THE MICE) 플랫폼'은 사이트를 안정적이고 지속적으로 운영할 의무가 있다.
	②'더 마이스(THE MICE) 플랫폼'은 이용자로부터 제기되는 의견이나 불만이 정당하다고 인정될 경우에는 즉시 처리해야 한다. 단, 즉시 처리가 곤란한 경우에는 이용자에게 그 사유와 처리일정을 공지사항 또는 전자우편을 통해 통보해야 한다.
	③제1항의 경우 수사상의 목적으로 관계기관 및 정보통신윤리위원회의 요청이 있거나 영장 제시가 있는 경우, 기타 관계 법령에 의한 경우는 예외로 한다.
	
	제 8 조 (이용자의 의무)
	①이용자는 본 약관 및 회사의 공지사항, 사이트 이용안내 등을 숙지하고 준수해야 하며 기타 회사의 업무에 방해되는 행위를 해서는 안 된다.
	②이용자는 회사의 사전 승인 없이 본 사이트를 이용해 어떠한 영리행위도 할 수 없다.
	③이용자는 본 사이트를 통해 얻는 정보를 회사의 사전 승낙 없이 복사, 복제, 변경, 번역, 출판, 방송 및 기타의 방법으로 사용하거나 이를 타인에게 제공할 수 없다.
	
	제 4 장 서비스의 제공 및 이용
	
	제 9 조 (서비스 이용)
	①이용자는 본 약관의 규정된 사항을 준수해 사이트를 이용한다.
	②본 약관에 명시되지 않은 서비스 이용에 관한 사항은 회사가 정해 '공지사항'에 게시하거나 또는 별도로 공지하는 내용에 따른다.
	
	제 10 조 (정보의 제공)
	'더 마이스(THE MICE) 플랫폼'은 회원이 서비스 이용 중 필요하다고 인정되는 다양한 정보에 대하여 전자메일이나 서신우편 등의 방법으로 회원에게 정보를 제공할 수 있다.
	
	제 11 조 (광고게재)
	①'더 마이스(THE MICE) 플랫폼'은 서비스의 운용과 관련하여 서비스 화면, 홈페이지, 전자우편 등에 광고 등을 게재할 수 있다.
	②'더 마이스(THE MICE) 플랫폼'은 사이트에 게재되어 있는 광고주의 판촉활동에 회원이 참여하거나 교신 또는 거래의 결과로서 발생하는 모든 손실 또는 손해에 대해 책임을 지지 않는다.
	
	제 12 조 (서비스 이용의 제한)
	본 사이트 이용 및 행위가 다음 각 항에 해당하는 경우 '더 마이스(THE MICE) 플랫폼'은 해당 이용자의 이용을 제한할 수 있다.
	①공공질서 및 미풍양속, 기타 사회질서를 해하는 경우
	②범죄행위를 목적으로 하거나 기타 범죄행위와 관련된다고 객관적으로 인정되는 경우
	③타인의 명예를 손상시키거나 타인의 서비스 이용을 현저히 저해하는 경우
	④타인의 의사에 반하는 내용이나 광고성 정보 등을 지속적으로 전송하는 경우
	⑤해킹 및 컴퓨터 바이러스 유포 등으로 서비스의 건전한 운영을 저해하는 경우
	⑥다른 이용자 또는 제3자의 지적재산권을 침해하거나 지적재산권자가 지적 재산권의 침해를 주장할 수 있다고 판단되는 경우
	⑦타인의 아이디 및 비밀번호를 도용한 경우
	⑧기타 관계 법령에 위배되는 경우 및 회사가 이용자로서 부적당하다고 판단한 경우
	
	제 13 조 (서비스 제공의 중지)
	'더 마이스(THE MICE) 플랫폼'은 다음 각 호에 해당하는 경우 서비스의 전부 또는 일부의 제공을 중지할 수 있다.
	①전기통신사업법 상에 규정된 기간통신 사업자 또는 인터넷 망 사업자가 서비스를 중지했을 경우
	②정전으로 서비스 제공이 불가능할 경우
	③설비의 이전, 보수 또는 공사로 인해 부득이한 경우
	④서비스 설비의 장애 또는 서비스 이용의 폭주 등으로 정상적인 서비스 제공이 어려운 경우
	⑤전시, 사변, 천재지변 또는 이에 준하는 국가비상사태가 발생하거나 발생할 우려가 있는 경우
	
	제 14 조 (게시물 관리)
	회사는 건전한 통신문화 정착과 효율적인 사이트 운영을 위하여 이용자가 게시하거나 제공하는 자료가 제12조에 해당한다고 판단되는 경우에 임의로 삭제, 자료이동, 등록거부를 할 수 있다.
	
	제 15 조 (서비스 이용 책임)
	이용자는 회사에서 권한 있는 사원이 서명한 명시적인 서면에 구체적으로 허용한 경우를 제외하고는 서비스를 이용하여 불법상품을 판매하는 영업활동을 할 수 없으며 특히 해킹, 돈벌기 광고, 음란 사이트를 통한 상업행위, 상용 S/W 불법제공 등을 할 수 없다. 이를 어기고 발생한 영업활동의 결과 및 손실, 관계기관에 의한 구속 등 법적 조치 등에 관해서는 회사가 책임을 지지 않는다.
	
	
	제 5 장 (재화의 주문 및 결제 관련) 
	
	제16조 (예약 및 결제방법)
	‘회원’은 ‘더 마이스(THE MICE) 플랫폼’에서 결제모듈을 통해 가능하며, 이때 ‘더 마이스(THE MICE) 플랫폼’은 이용자의 지급방법에 대하여 재화 외 어떠한 명목의 수수료를 추가 징수하지 않는다.
	
	① ‘더 마이스(THE MICE) 플랫폼’은 이용자의 예약 신청이 있는 경우 이용자에게 예약확인통지를 한다. 예약 확인에 대한 내용은 해당 게시판에서 확인 할 수 있다.
	② 예약확인통지를 받은 이용자는 의사표시의 불일치 등이 있는 경우에는 예약확인통지를 받은 후 즉시 취소를 요청할 수 있고 ‘회사’는 예약 확정 전에 이용자의 요청이 있는 경우에는 지체 없이 그 요청에 따라 처리한다. 다만 이미 대금을 지불한 경우에는 제 17조의 ‘취소 및 환불 규정’을 따른다.
	
	제 17조 (취소 및 환불 규정)
	‘더 마이스(THE MICE) 플랫폼’은 이용자가 예약 및 구매한 재화 등이 품절 등의 사유로 인도 또는 제공을 할 수 없을 때에는 지체 없이 그 사유를 이용자에게 통지하고 사전에 재화 등의 대금을 받은 경우에는 대금을 받은 날부터 14영업일 이내에 환급하거나 환급에 필요한 조치를 한다.
	① 예약이 확정 되기 전 이용자가 예약을 취소할 경우, ‘더 마이스(THE MICE) 플랫폼’은 해당 예약 건을 취소 처리한다. 상품의 특성상 예약한 상품의 시행 3일(42시간) 전부터는 취소가 불가능하다.
	② 재화가 발송된 이후, 또는 상품의 예약확인통지를 받아 결제 진행 후 환불가능기한(14일)을 지난 경우 결제 취소는 불가하다. 단, ‘더 마이스(THE MICE) 플랫폼’의 부주의 또는 불가항력적인 상황으로 인한 재화의 파손, 변질의 경우 ‘회사’는 이용자에게 구매 금액의 환불 및 교환 조치를 취한다.
	
	
	제 6 장 기타
	
	제 18 조 (면책 및 손해배상)
	①천재지변 또는 이에 준하는 불가항력으로 인하여 서비스를 제공할 수 없는 경우에는 회사의 서비스 제공 책임이 면제된다.
	②회사는 이용자간 또는 이용자와 제3자간의 상호거래 관계에서 발생되는 결과에 대하여 어떠한 책임도 부담하지 않는다.
	③회사는 이용자가 게시판에 게재한 정보, 자료, 내용 등에 관하여 사실의 정확성, 신뢰도 등에 어떠한 책임도 부담하지 않으며 이용자는 본인의 책임 아래 본 사이트를 이용해야 한다.
	④이용자가 게시 또는 전송한 자료 등에 관하여 손해가 발생하거나 자료의 취사선택, 기타 무료로 제공되는 서비스 이용과 관련해 어떠한 불이익이 발생하더라도 이에 대한 모든 책임은 이용자에게 있다.
	⑤아이디와 비밀번호의 관리 및 이용자의 부주의로 인하여 발생되는 손해 또는 제3자에 의한 부정사용 등에 대한 책임은 이용자에게 있다.
	⑥이용자가 본 약관의 규정을 위반함으로써 회사에 손해가 발생하는 경우 이 약관을 위반한 이용자는 회사에 발생한 모든 손해를 배상해야 하며 동 손해로부터 회사를 면책시켜야 한다.
	
	제 19 조 (개인신용정보 제공 및 활용에 대한 동의서)
	회사가 회원 가입과 관련해 취득한 개인 신용 정보는 신용정보의 이용 및 보호에 관한 법률 제23조의 규정에 따라 타인에게 제공 및 활용 시 이용자의 동의를 얻어야 한다. 이용자의 동의는 회사가 회원으로 가입한 이용자의 신용정보를 신용정보기관, 신용정보업자 및 기타 이용자 등에게 제공해 이용자의 신용을 판단하기 위한 자료로서 활용하거나 공공기관에서 정책자료로 활용하는데 동의하는 것으로 간주한다.
	
	제 20 조 (분쟁의 해결)
	①회사와 이용자는 본 사이트 이용과 관련해 발생한 분쟁을 원만하게 해결하기 위하여 필요한 모든 노력을 해야 한다.
	②제1항의 규정에도 불구하고 동 분쟁으로 인하여 소송이 제기될 경우 동 소송은 회사의 본사 소재지를 관할하는 법원의 관할로 본다.
	
	<부칙>
	본 약관은 2021년 11월 1일부터 적용한다.
							</textarea>
							<div class="check_area">
								<span>이용약관에 동의하십니까?</span>
								<input type="checkbox" id="check_item_1">
								<label for="check_item_1">
									<img alt="" src="${root}/img/insertcontents/non_agreement_btn.svg">
									<img alt="" src="${root}/img/insertcontents/color_agreement_btn.svg">
								</label>
							</div>
						</div>
						
						<div class="agreement_area">
							<span class="title_span">[필수] 개인정보 수집 및 이용 동의</span>
							<textarea rows="" cols="">
	1. 개인정보 수집 및 이용
	개인정보보호법에 따라 ‘더 마이스(THE MICE) 플랫폼’에 회원가입 신청하시는 분께 수집하는 개인정보의 항목, 개인정보의 수집 및 이용목적, 개인정보의 보유 및 이용기간, 동의 거부권 및 동의 거부 시 불이익에 관한 사항을 안내 드리오니 자세히 읽은 후 동의하여 주시기 바랍니다.
	
	1. 수집∙이용 목적
	회원가입, 서비스 이용, 상담 및 부정 거래 기록 확인, 서비스 이용 가능 연령 확인 및 본인 여부 확인, 이용자의 상품 및 서비스 이용 실적 정보를 활용한 통계 분석 및 상품 서비스 개선 제공, 맞춤형 서비스 제공을 위한 이용자 식별
	
	2. 수집 항목
	[회원가입]
	회원가입 시점에 ‘더 마이스(THE MICE) 플랫폼’이 이용자로부터 수집하는 개인정보는 아래와 같습니다.
	- 회원 가입 시에 ‘아이디, 비밀번호, 이름, 주소, 이메일, 휴대전화번호’를 필수항목으로 수집합니다. 그리고 선택항목으로 ‘생년월일, 성별, 소속, 직업’ 정보를 수집합니다.
	
	[서비스 이용 및 부정거래 기록 확인]
	서비스 이용시간/이용기록, 접수로그, 이용컨텐츠, 접속IP정보, 기기모델명, 브라우저 정보
	
	[이벤트]
	- 당첨자 이름, 주소, 휴대전화 번호
	
	[예약/결제]
	- 공통 : 예약자 이름, 연락처, 이메일
	- 계좌이체 시 : 은행명, 계좌번호, 예금주명
	- 취소.환불 시 : 은행명, 계좌번호, 예금주명
	
	3. 보유∙이용기간
	- 회원 탈퇴 요청일로 부터 3개월 간 보관
	- 관계법령에 따라 보존할 필요가 있는 경우 관련 법령에서 요구하는 기한까지 보관
							</textarea>
							<div class="check_area">
								<span>이용약관에 동의하십니까?</span>
								<input type="checkbox" id="check_item_2">
								<label for="check_item_2">
									<img alt="" src="${root}/img/insertcontents/non_agreement_btn.svg">
									<img alt="" src="${root}/img/insertcontents/color_agreement_btn.svg">
								</label>
							</div>
						</div>
						
						<div class="agreement_area">
							<span class="title_span">[선택] 전시회 정보 수신 동의</span>
							<textarea rows="" cols="">
	 ‘더 마이스(THE MICE) 플랫폼’은 개인정보보호법 등에 관한 법률 등 관계법령에 따라 광고성 정보를 전송하기 위해 수신자의 사전 수신동의를 받고 있으며, 광고성 정보 수신자의 수신동의여부를 정기적으로 확인합니다. 다만 동의하지 않을 경우, 상품/서비스 소개 및 권유, 이벤트 등 이용목적에 따른 혜택의 제한이 있을 수 있습니다. 그 밖에 금융 거래와 관련된 불이익은 없습니다.
	
	[전송방법]
	이용자의 핸드폰 문자메시지(SMS), 이메일 등을 통해 전달 될 수 있습니다.
	
	[전송내용]
	발송되는 마케팅 정보는 수신자에게 ‘더 마이스(THE MICE) 플랫폼’은 개인정보보호법 등에 관한 법률 등 관계법령에 따라 광고성 정보를 전송하기 위해 수신자의 사전 수신동의를 받고 있으며, 광고성 정보 수신자의 수신동의여부를 정기적으로 확인합니다. 다만 동의하지 않을 경우, 상품/서비스 소개 및 권유, 이벤트 등 이용목적에 따른 혜택의 제한이 있을 수 있습니다. 그 밖에 금융 거래와 관련된 불이익은 없습니다.
	
	[전송방법]
	이용자의 핸드폰 문자메시지(SMS), 이메일 등을 통해 전달 될 수 있습니다.
	
	[전송내용]
	발송되는 마케팅 정보는 수신자에게 ‘더 마이스(THE MICE) 플랫폼’은 개인정보보호법 등에 관한 법률 등 관계법령에 따라 광고성 정보를 전송하기 위해 수신자의 사전 수신동의를 받고 있으며, 광고성 정보 수신자의 수신동의여부를 정기적으로 확인합니다. 다만 동의하지 않을 경우, 상품/서비스 소개 및 권유, 이벤트 등 이용목적에 따른 혜택의 제한이 있을 수 있습니다. 그 밖에 금융 거래와 관련된 불이익은 없습니다.
	
	[전송방법]
	이용자의 핸드폰 문자메시지(SMS), 이메일 등을 통해 전달 될 수 있습니다.
	
	[전송내용]
	발송되는 마케팅 정보는 수신자에게 ‘더 마이스(THE MICE) 플랫폼’이 운영하는 서비스에서 제공하는 혜택 정보, 각종 이벤트 정보, 각종 웰니스 정보, 신규 상품 안내 등 광고성 정보로 관련법의 규정을 준수하여 발송됩니다. 단, 광고성 정보 이외 의무적으로 안내되어야 하는 정보성 내용은 수신동의 여부와 무관하게 제공됩니다.
	
	[철회안내]
	고객님은 수신 동의 이후에라도 의사에 따라 동의를 철회할 수 있으며, 수신을 동의하지 않아도 ‘더 마이스(THE MICE) 플랫폼’이 제공하는 기본적인 서비스를 이용할 수 있으나, 해당 플랫폼의 마케팅 정보를 수신하지 못할 수 있습니다.
	
	[수신동의 변경]
	마이페이지 마케팅 수신 동의란 체크 비활성화를 통해 수신동의를 (동의/철회)할 수 있습니다.
	
	[개인정보 이용 상세내용]
	1) 이용하는 개인정보 항목
	- 휴대전화번호, 이메일 주소
	
	2) 보유 이용 목적
	- 혜택 정보, 각종 이벤트 정보, 상품 정보, 신규 서비스 안내 등 광고성 정보 제공
	
	[개인정보 보유 및 이용 기간]
	마케팅 활용 동의일로부터 회원 탈퇴 또는 마케팅 동의 철회 시까지 보유 및 이용		
							</textarea>
							<div class="check_area">
								<span>이용약관에 동의하십니까?</span>
								<input type="checkbox" id="check_item_3">
								<label for="check_item_3">
									<img alt="" src="${root}/img/insertcontents/non_agreement_btn.svg">
									<img alt="" src="${root}/img/insertcontents/color_agreement_btn.svg">
								</label>
							</div>
						</div>
					</div>
					
					<div class="member_submit">
						<input type="button" value="가입" id="member_submit_btn">
						<input type="reset" value="취소" class="reset">
					</div>
				</form>
			</div>
	
	
			<div id="business">
				<form action="business_join" id="businessform" name="businessform" method="post" enctype="multipart/form-data">
					<div class="infomation_item">
						<div class="name_item">
							<span>*</span>
							<p>사업자 번호</p>
						</div>
						<div class="value_item">
							<input type="text" name="business_num" class="business_num" placeholder="사업자 등록번호를 입력하세요.">
							
							<input type="file" name="file" id="business_file_upload" accept="image/*">
							<label for="business_file_upload" class="business_file_upload_btn">사진 첨부</label>
							
							<span id="business_num_check"></span>
						</div>
					</div>
					<div class="infomation_item">
						<div class="name_item">
							<span>*</span>
							<p>비밀번호</p>
						</div>
						<div class="value_item">
							<input class="business_pw" name="password" type="password" placeholder="비밀번호를 입력하세요." />
							<p>(영문 대소문자/숫자/특수문자 중 2가지 이상조합, 10~16자)</p>
							<span id="business_pw"></span>
						</div>
					</div>
					<div class="infomation_item">
						<div class="name_item">
							<span>*</span>
							<p>비밀번호 확인</p>
						</div>
						<div class="value_item">
							<input class="business_pw_check" type="password" placeholder="비밀번호를 다시 입력하세요." />
							<span id="business_pw_check"></span>
						</div>
					</div>
					<div class="infomation_item">
						<div class="name_item">
							<span>*</span>
							<p>회사명</p>
						</div>
						<div class="value_item">
							<input type="text" name="business_name" placeholder="회사 이름을 입력하세요.">
						</div>
					</div>
					<div class="infomation_item">
						<div class="name_item">
							<p>주소</p>
						</div>
						<div class="value_item">
							<div class="div">
								<input type="text" id="postcode_1" placeholder="우편번호" class="input" readonly>
								<input type="button" onclick="sample4_execDaumPostcode_1()" value="주소검색" class="post">
							</div>
							<div class="div">
								<input type="text" id="roadAddress_1" placeholder="도로명주소" class="input" name="address" readonly>
							</div>
							<div class="div">
								<input type="text" id="detailAddress" placeholder="상세주소" class="input" name="detail_address">
							</div>
						</div>
					</div>
					<div class="infomation_item">
						<div class="name_item">
							<span>*</span>
							<p>이메일</p>
						</div>
						<div class="value_item form">
							<input type="text" name="email" class="mail_item_1" id="email">@
							<input type="text" name="email_add" maxlength="50" value="" class="mail_item_2" id="email_add">
							<select name="business_email" class="mail_item_3">
								<option value="etc">직접입력</option>
								<option value="naver.com">naver.com</option>
								<option value="hanmail.net">hanmail.net</option>
								<option value="gmail.com">gmail.com</option>
								<option value="yahoo.com">yahoo.com</option>
								<option value="hotmail.com">hotmail.com</option>
								<option value="korea.com">korea.com</option>
								<option value="nate.com">nate.com</option>
							</select>
							<input type="hidden" value="" id="business_email_check">
						</div>
					</div>
					<div class="infomation_item">
						<div class="name_item">
							<span>*</span>
							<p>휴대전화</p>
						</div>
						<div class="value_item">
							<input type="text" name="tel" placeholder="휴대폰 번호" class="input"
								oninput="this.value = this.value.replace(/[^0-9.]/g, '').replace(/(\..*)\./g, '$1');" id="business_tel">
							
							<input type="button" onclick="business_smsCheck(businessform, '${root}')"
								value="휴대폰 인증" class="certification_button">
								
							<input type="button" id="business_sms_certification" value="" name="business_sms_certification">
						</div>
					</div>
					<div class="infomation_item" style="border-bottom: solid; border-width: 1px; border-color: #707070;">
						<div class="name_item last_area">
							<p>팩스번호</p>
						</div>
						<div class="value_item">
							<input type="text" name="fax">
						</div>
					</div>
					
					<div class="agreement">
						<div class="agree_title_area">
							<span>전체동의</span>
							<div class="check_area">
								<input type="checkbox" id="b_all_check_item">
								<label for="b_all_check_item">
									<img alt="" src="${root}/img/insertcontents/non_agreement_btn.svg">
									<img alt="" src="${root}/img/insertcontents/color_agreement_btn.svg">
								</label>
								<span>이용약관/개인정보이용/전시회정보수신에 모두 동의합니다.</span>
							</div>
						</div>
							
						<div class="agreement_area">
							<span class="title_span">[필수] 이용약관 동의</span>
							<textarea rows="" cols="">
	제 1 장 총칙
	
	제 1 조 (목적)
	본 약관은 더 마이스(THE MICE) 플랫폼의 제반 서비스의 이용조건 및 절차에 관한 사항 및 기타 필요한 사항을 규정함을 목적으로 한다.
	
	제 2 조 (용어의 정의)
	본 약관에서 사용하는 용어는 다음과 같이 정의한다.
	①회원 : 기본 회원 정보를 입력하였고, 회사와 서비스 이용계약을 체결하여 아이디를 부여받은 개인
	②아이디(ID) : 회원식별과 회원의 서비스 이용을 위해 회원이 선정하고 회사가 승인하는 문자와 숫자의 조합
	③비밀번호(Password) : 회원이 통신상의 자신의 비밀을 보호하기 위해 선정한 문자와 숫자의 조합
	④해지 : 회사 또는 회원에 의한 이용계약의 종료
	
	제 3 조 (약관의 공시 및 효력과 변경)
	①본 약관은 회원가입 화면에 게시하여 공시하며 '더 마이스(THE MICE) 플랫폼'은 사전 변경 및 영업상 중요한 사유가 있을 경우 약관을 변경할 수 있으며 변경된 약관은 공지사항을 통해 공시한다
	②본 약관 및 차후 회사사정에 따라 변경된 약관은 이용자에게 공시함으로써 효력을 발생한다.
	
	제 4 조 (약관 외 준칙)
	본 약관에 명시되지 않은 사항이 전기통신기본법, 전기통신사업법, 정보통신촉진법, ‘전자상거래등에서의 소비자 보호에 관한 법률’, ‘약관의 규제에관한법률’, ‘전자거래기본법’, ‘전자서명법’, ‘정보통신망 이용촉진등에 관한 법률’, ‘소비자보호법’ 등 기타 관계 법령에 규정되어 있을 경우에는 그 규정을 따르도록 한다.
	
	
	제 2 장 이용계약
	
	제 5 조 (이용신청)
	①이용신청자가 회원가입 안내에서 본 약관과 개인정보보호정책에 동의하고 등록절차(회사의 소정 양식의 가입 신청서 작성)를 거쳐 '확인' 버튼을 누르면 이용신청을 할 수 있다.
	②이용신청자는 반드시 실명과 실제 정보를 사용해야 하며 1개의 생년월일에 대하여 1건의 이용신청을 할 수 있다.
	③실명이나 실제 정보를 입력하지 않은 이용자는 법적인 보호를 받을 수 없으며, 서비스 이용에 제한을 받을 수 있다.
	
	제 6 조 (이용신청의 승낙)
	①'더 마이스(THE MICE) 플랫폼'은 제5조에 따른 이용신청자에 대하여 제2항 및 제3항의 경우를 예외로 하여 서비스 이용을 승낙한다.
	②'더 마이스(THE MICE) 플랫폼'은 아래 사항에 해당하는 경우에 그 제한사유가 해소될 때까지 승낙을 유보할 수 있다.
	  가. 서비스 관련 설비에 여유가 없는 경우
	  나. 기술상 지장이 있는 경우
	  다. 기타 회사 사정상 필요하다고 인정되는 경우
	③'더 마이스(THE MICE) 플랫폼'은 아래 사항에 해당하는 경우에 승낙을 하지 않을 수 있다.
	  가. 다른 사람의 명의를 사용하여 신청한 경우
	  나. 이용자 정보를 허위로 기재하여 신청한 경우
	  다. 사회의 안녕질서 또는 미풍양속을 저해할 목적으로 신청한 경우
	  라. 기타 회사가 정한 이용신청 요건이 미비한 경우
	
	
	제 3 장 계약 당사자의 의무
	
	제 7 조 (회사의 의무)
	①'더 마이스(THE MICE) 플랫폼'은 사이트를 안정적이고 지속적으로 운영할 의무가 있다.
	②'더 마이스(THE MICE) 플랫폼'은 이용자로부터 제기되는 의견이나 불만이 정당하다고 인정될 경우에는 즉시 처리해야 한다. 단, 즉시 처리가 곤란한 경우에는 이용자에게 그 사유와 처리일정을 공지사항 또는 전자우편을 통해 통보해야 한다.
	③제1항의 경우 수사상의 목적으로 관계기관 및 정보통신윤리위원회의 요청이 있거나 영장 제시가 있는 경우, 기타 관계 법령에 의한 경우는 예외로 한다.
	
	제 8 조 (이용자의 의무)
	①이용자는 본 약관 및 회사의 공지사항, 사이트 이용안내 등을 숙지하고 준수해야 하며 기타 회사의 업무에 방해되는 행위를 해서는 안 된다.
	②이용자는 회사의 사전 승인 없이 본 사이트를 이용해 어떠한 영리행위도 할 수 없다.
	③이용자는 본 사이트를 통해 얻는 정보를 회사의 사전 승낙 없이 복사, 복제, 변경, 번역, 출판, 방송 및 기타의 방법으로 사용하거나 이를 타인에게 제공할 수 없다.
	
	제 4 장 서비스의 제공 및 이용
	
	제 9 조 (서비스 이용)
	①이용자는 본 약관의 규정된 사항을 준수해 사이트를 이용한다.
	②본 약관에 명시되지 않은 서비스 이용에 관한 사항은 회사가 정해 '공지사항'에 게시하거나 또는 별도로 공지하는 내용에 따른다.
	
	제 10 조 (정보의 제공)
	'더 마이스(THE MICE) 플랫폼'은 회원이 서비스 이용 중 필요하다고 인정되는 다양한 정보에 대하여 전자메일이나 서신우편 등의 방법으로 회원에게 정보를 제공할 수 있다.
	
	제 11 조 (광고게재)
	①'더 마이스(THE MICE) 플랫폼'은 서비스의 운용과 관련하여 서비스 화면, 홈페이지, 전자우편 등에 광고 등을 게재할 수 있다.
	②'더 마이스(THE MICE) 플랫폼'은 사이트에 게재되어 있는 광고주의 판촉활동에 회원이 참여하거나 교신 또는 거래의 결과로서 발생하는 모든 손실 또는 손해에 대해 책임을 지지 않는다.
	
	제 12 조 (서비스 이용의 제한)
	본 사이트 이용 및 행위가 다음 각 항에 해당하는 경우 '더 마이스(THE MICE) 플랫폼'은 해당 이용자의 이용을 제한할 수 있다.
	①공공질서 및 미풍양속, 기타 사회질서를 해하는 경우
	②범죄행위를 목적으로 하거나 기타 범죄행위와 관련된다고 객관적으로 인정되는 경우
	③타인의 명예를 손상시키거나 타인의 서비스 이용을 현저히 저해하는 경우
	④타인의 의사에 반하는 내용이나 광고성 정보 등을 지속적으로 전송하는 경우
	⑤해킹 및 컴퓨터 바이러스 유포 등으로 서비스의 건전한 운영을 저해하는 경우
	⑥다른 이용자 또는 제3자의 지적재산권을 침해하거나 지적재산권자가 지적 재산권의 침해를 주장할 수 있다고 판단되는 경우
	⑦타인의 아이디 및 비밀번호를 도용한 경우
	⑧기타 관계 법령에 위배되는 경우 및 회사가 이용자로서 부적당하다고 판단한 경우
	
	제 13 조 (서비스 제공의 중지)
	'더 마이스(THE MICE) 플랫폼'은 다음 각 호에 해당하는 경우 서비스의 전부 또는 일부의 제공을 중지할 수 있다.
	①전기통신사업법 상에 규정된 기간통신 사업자 또는 인터넷 망 사업자가 서비스를 중지했을 경우
	②정전으로 서비스 제공이 불가능할 경우
	③설비의 이전, 보수 또는 공사로 인해 부득이한 경우
	④서비스 설비의 장애 또는 서비스 이용의 폭주 등으로 정상적인 서비스 제공이 어려운 경우
	⑤전시, 사변, 천재지변 또는 이에 준하는 국가비상사태가 발생하거나 발생할 우려가 있는 경우
	
	제 14 조 (게시물 관리)
	회사는 건전한 통신문화 정착과 효율적인 사이트 운영을 위하여 이용자가 게시하거나 제공하는 자료가 제12조에 해당한다고 판단되는 경우에 임의로 삭제, 자료이동, 등록거부를 할 수 있다.
	
	제 15 조 (서비스 이용 책임)
	이용자는 회사에서 권한 있는 사원이 서명한 명시적인 서면에 구체적으로 허용한 경우를 제외하고는 서비스를 이용하여 불법상품을 판매하는 영업활동을 할 수 없으며 특히 해킹, 돈벌기 광고, 음란 사이트를 통한 상업행위, 상용 S/W 불법제공 등을 할 수 없다. 이를 어기고 발생한 영업활동의 결과 및 손실, 관계기관에 의한 구속 등 법적 조치 등에 관해서는 회사가 책임을 지지 않는다.
	
	
	제 5 장 (재화의 주문 및 결제 관련) 
	
	제16조 (예약 및 결제방법)
	‘회원’은 ‘더 마이스(THE MICE) 플랫폼’에서 결제모듈을 통해 가능하며, 이때 ‘더 마이스(THE MICE) 플랫폼’은 이용자의 지급방법에 대하여 재화 외 어떠한 명목의 수수료를 추가 징수하지 않는다.
	
	① ‘더 마이스(THE MICE) 플랫폼’은 이용자의 예약 신청이 있는 경우 이용자에게 예약확인통지를 한다. 예약 확인에 대한 내용은 해당 게시판에서 확인 할 수 있다.
	② 예약확인통지를 받은 이용자는 의사표시의 불일치 등이 있는 경우에는 예약확인통지를 받은 후 즉시 취소를 요청할 수 있고 ‘회사’는 예약 확정 전에 이용자의 요청이 있는 경우에는 지체 없이 그 요청에 따라 처리한다. 다만 이미 대금을 지불한 경우에는 제 17조의 ‘취소 및 환불 규정’을 따른다.
	
	제 17조 (취소 및 환불 규정)
	‘더 마이스(THE MICE) 플랫폼’은 이용자가 예약 및 구매한 재화 등이 품절 등의 사유로 인도 또는 제공을 할 수 없을 때에는 지체 없이 그 사유를 이용자에게 통지하고 사전에 재화 등의 대금을 받은 경우에는 대금을 받은 날부터 14영업일 이내에 환급하거나 환급에 필요한 조치를 한다.
	① 예약이 확정 되기 전 이용자가 예약을 취소할 경우, ‘더 마이스(THE MICE) 플랫폼’은 해당 예약 건을 취소 처리한다. 상품의 특성상 예약한 상품의 시행 3일(42시간) 전부터는 취소가 불가능하다.
	② 재화가 발송된 이후, 또는 상품의 예약확인통지를 받아 결제 진행 후 환불가능기한(14일)을 지난 경우 결제 취소는 불가하다. 단, ‘더 마이스(THE MICE) 플랫폼’의 부주의 또는 불가항력적인 상황으로 인한 재화의 파손, 변질의 경우 ‘회사’는 이용자에게 구매 금액의 환불 및 교환 조치를 취한다.
	
	
	제 6 장 기타
	
	제 18 조 (면책 및 손해배상)
	①천재지변 또는 이에 준하는 불가항력으로 인하여 서비스를 제공할 수 없는 경우에는 회사의 서비스 제공 책임이 면제된다.
	②회사는 이용자간 또는 이용자와 제3자간의 상호거래 관계에서 발생되는 결과에 대하여 어떠한 책임도 부담하지 않는다.
	③회사는 이용자가 게시판에 게재한 정보, 자료, 내용 등에 관하여 사실의 정확성, 신뢰도 등에 어떠한 책임도 부담하지 않으며 이용자는 본인의 책임 아래 본 사이트를 이용해야 한다.
	④이용자가 게시 또는 전송한 자료 등에 관하여 손해가 발생하거나 자료의 취사선택, 기타 무료로 제공되는 서비스 이용과 관련해 어떠한 불이익이 발생하더라도 이에 대한 모든 책임은 이용자에게 있다.
	⑤아이디와 비밀번호의 관리 및 이용자의 부주의로 인하여 발생되는 손해 또는 제3자에 의한 부정사용 등에 대한 책임은 이용자에게 있다.
	⑥이용자가 본 약관의 규정을 위반함으로써 회사에 손해가 발생하는 경우 이 약관을 위반한 이용자는 회사에 발생한 모든 손해를 배상해야 하며 동 손해로부터 회사를 면책시켜야 한다.
	
	제 19 조 (개인신용정보 제공 및 활용에 대한 동의서)
	회사가 회원 가입과 관련해 취득한 개인 신용 정보는 신용정보의 이용 및 보호에 관한 법률 제23조의 규정에 따라 타인에게 제공 및 활용 시 이용자의 동의를 얻어야 한다. 이용자의 동의는 회사가 회원으로 가입한 이용자의 신용정보를 신용정보기관, 신용정보업자 및 기타 이용자 등에게 제공해 이용자의 신용을 판단하기 위한 자료로서 활용하거나 공공기관에서 정책자료로 활용하는데 동의하는 것으로 간주한다.
	
	제 20 조 (분쟁의 해결)
	①회사와 이용자는 본 사이트 이용과 관련해 발생한 분쟁을 원만하게 해결하기 위하여 필요한 모든 노력을 해야 한다.
	②제1항의 규정에도 불구하고 동 분쟁으로 인하여 소송이 제기될 경우 동 소송은 회사의 본사 소재지를 관할하는 법원의 관할로 본다.
	
	<부칙>
	본 약관은 2021년 11월 1일부터 적용한다.
							</textarea>
							<div class="check_area">
								<span>이용약관에 동의하십니까?</span>
								<input type="checkbox" id="b_check_item_1">
								<label for="b_check_item_1">
									<img alt="" src="${root}/img/insertcontents/non_agreement_btn.svg">
									<img alt="" src="${root}/img/insertcontents/color_agreement_btn.svg">
								</label>
							</div>
						</div>
						
						<div class="agreement_area">
							<span class="title_span">[필수] 개인정보 수집 및 이용 동의</span>
							<textarea rows="" cols="">
	1. 개인정보 수집 및 이용
	개인정보보호법에 따라 ‘더 마이스(THE MICE) 플랫폼’에 회원가입 신청하시는 분께 수집하는 개인정보의 항목, 개인정보의 수집 및 이용목적, 개인정보의 보유 및 이용기간, 동의 거부권 및 동의 거부 시 불이익에 관한 사항을 안내 드리오니 자세히 읽은 후 동의하여 주시기 바랍니다.
	
	1. 수집∙이용 목적
	회원가입, 서비스 이용, 상담 및 부정 거래 기록 확인, 서비스 이용 가능 연령 확인 및 본인 여부 확인, 이용자의 상품 및 서비스 이용 실적 정보를 활용한 통계 분석 및 상품 서비스 개선 제공, 맞춤형 서비스 제공을 위한 이용자 식별
	
	2. 수집 항목
	[회원가입]
	회원가입 시점에 ‘더 마이스(THE MICE) 플랫폼’이 이용자로부터 수집하는 개인정보는 아래와 같습니다.
	- 회원 가입 시에 ‘아이디, 비밀번호, 이름, 주소, 이메일, 휴대전화번호’를 필수항목으로 수집합니다. 그리고 선택항목으로 ‘생년월일, 성별, 소속, 직업’ 정보를 수집합니다.
	
	[서비스 이용 및 부정거래 기록 확인]
	서비스 이용시간/이용기록, 접수로그, 이용컨텐츠, 접속IP정보, 기기모델명, 브라우저 정보
	
	[이벤트]
	- 당첨자 이름, 주소, 휴대전화 번호
	
	[예약/결제]
	- 공통 : 예약자 이름, 연락처, 이메일
	- 계좌이체 시 : 은행명, 계좌번호, 예금주명
	- 취소.환불 시 : 은행명, 계좌번호, 예금주명
	
	3. 보유∙이용기간
	- 회원 탈퇴 요청일로 부터 3개월 간 보관
	- 관계법령에 따라 보존할 필요가 있는 경우 관련 법령에서 요구하는 기한까지 보관
							</textarea>
							<div class="check_area">
								<span>이용약관에 동의하십니까?</span>
								<input type="checkbox" id="b_check_item_2">
								<label for="b_check_item_2">
									<img alt="" src="${root}/img/insertcontents/non_agreement_btn.svg">
									<img alt="" src="${root}/img/insertcontents/color_agreement_btn.svg">
								</label>
							</div>
						</div>
						
						<div class="agreement_area">
							<span class="title_span">[선택] 전시회 정보 수신 동의</span>
							<textarea rows="" cols="">
	 ‘더 마이스(THE MICE) 플랫폼’은 개인정보보호법 등에 관한 법률 등 관계법령에 따라 광고성 정보를 전송하기 위해 수신자의 사전 수신동의를 받고 있으며, 광고성 정보 수신자의 수신동의여부를 정기적으로 확인합니다. 다만 동의하지 않을 경우, 상품/서비스 소개 및 권유, 이벤트 등 이용목적에 따른 혜택의 제한이 있을 수 있습니다. 그 밖에 금융 거래와 관련된 불이익은 없습니다.
	
	[전송방법]
	이용자의 핸드폰 문자메시지(SMS), 이메일 등을 통해 전달 될 수 있습니다.
	
	[전송내용]
	발송되는 마케팅 정보는 수신자에게 ‘더 마이스(THE MICE) 플랫폼’은 개인정보보호법 등에 관한 법률 등 관계법령에 따라 광고성 정보를 전송하기 위해 수신자의 사전 수신동의를 받고 있으며, 광고성 정보 수신자의 수신동의여부를 정기적으로 확인합니다. 다만 동의하지 않을 경우, 상품/서비스 소개 및 권유, 이벤트 등 이용목적에 따른 혜택의 제한이 있을 수 있습니다. 그 밖에 금융 거래와 관련된 불이익은 없습니다.
	
	[전송방법]
	이용자의 핸드폰 문자메시지(SMS), 이메일 등을 통해 전달 될 수 있습니다.
	
	[전송내용]
	발송되는 마케팅 정보는 수신자에게 ‘더 마이스(THE MICE) 플랫폼’은 개인정보보호법 등에 관한 법률 등 관계법령에 따라 광고성 정보를 전송하기 위해 수신자의 사전 수신동의를 받고 있으며, 광고성 정보 수신자의 수신동의여부를 정기적으로 확인합니다. 다만 동의하지 않을 경우, 상품/서비스 소개 및 권유, 이벤트 등 이용목적에 따른 혜택의 제한이 있을 수 있습니다. 그 밖에 금융 거래와 관련된 불이익은 없습니다.
	
	[전송방법]
	이용자의 핸드폰 문자메시지(SMS), 이메일 등을 통해 전달 될 수 있습니다.
	
	[전송내용]
	발송되는 마케팅 정보는 수신자에게 ‘더 마이스(THE MICE) 플랫폼’이 운영하는 서비스에서 제공하는 혜택 정보, 각종 이벤트 정보, 각종 웰니스 정보, 신규 상품 안내 등 광고성 정보로 관련법의 규정을 준수하여 발송됩니다. 단, 광고성 정보 이외 의무적으로 안내되어야 하는 정보성 내용은 수신동의 여부와 무관하게 제공됩니다.
	
	[철회안내]
	고객님은 수신 동의 이후에라도 의사에 따라 동의를 철회할 수 있으며, 수신을 동의하지 않아도 ‘더 마이스(THE MICE) 플랫폼’이 제공하는 기본적인 서비스를 이용할 수 있으나, 해당 플랫폼의 마케팅 정보를 수신하지 못할 수 있습니다.
	
	[수신동의 변경]
	마이페이지 마케팅 수신 동의란 체크 비활성화를 통해 수신동의를 (동의/철회)할 수 있습니다.
	
	[개인정보 이용 상세내용]
	1) 이용하는 개인정보 항목
	- 휴대전화번호, 이메일 주소
	
	2) 보유 이용 목적
	- 혜택 정보, 각종 이벤트 정보, 상품 정보, 신규 서비스 안내 등 광고성 정보 제공
	
	[개인정보 보유 및 이용 기간]
	마케팅 활용 동의일로부터 회원 탈퇴 또는 마케팅 동의 철회 시까지 보유 및 이용		
							</textarea>
							<div class="check_area">
								<span>이용약관에 동의하십니까?</span>
								<input type="checkbox" id="b_check_item_3">
								<label for="b_check_item_3">
									<img alt="" src="${root}/img/insertcontents/non_agreement_btn.svg">
									<img alt="" src="${root}/img/insertcontents/color_agreement_btn.svg">
								</label>
							</div>
						</div>
					</div>
	
				</form>
					<div class="business_submit">
						<input type="button" value="가입" id="business_submit_btn">
						<input type="reset" value="취소" class="reset">
					</div>
			</div>
		</div>
		</div>
	</section>
	<jsp:include page="/WEB-INF/jsp/footer/footer.jsp" />
	
	<script type="text/javascript">
	$('#all_check_item').change(function () {
		if($('#all_check_item').is(':checked')){
			$("input:checkbox[id='check_item_1']").prop("checked", true);
			$("input:checkbox[id='check_item_2']").prop("checked", true);
			$("input:checkbox[id='check_item_3']").prop("checked", true);
		} else {
			$("input:checkbox[id='check_item_1']").prop("checked", false);
			$("input:checkbox[id='check_item_2']").prop("checked", false);
			$("input:checkbox[id='check_item_3']").prop("checked", false);
		}
	});

	$('#b_all_check_item').change(function () {
		if($('#b_all_check_item').is(':checked')){
			$("input:checkbox[id='b_check_item_1']").prop("checked", true);
			$("input:checkbox[id='b_check_item_2']").prop("checked", true);
			$("input:checkbox[id='b_check_item_3']").prop("checked", true);
		} else {
			$("input:checkbox[id='b_check_item_1']").prop("checked", false);
			$("input:checkbox[id='b_check_item_2']").prop("checked", false);
			$("input:checkbox[id='b_check_item_3']").prop("checked", false);
		}
	});
	</script>
	
	<section id="mobile_join">
		<a href="javascript:history.back();" id="back_area">
			<img alt="" src="${root}/img/common/back_btn.svg" class="back_btn">
			<span>회원가입</span>
		</a>
		
		<form action="m_memeber_join" id="m_form" method="post">
			<div class="contents_item">
				<div class="m_text_area">
					<span>아이디</span><span id="m_chkMsg"></span>
				</div>
				<input type="text" id="m_id" name="id" placeholder="아이디" class="input" oninput="m_checkId()" maxlength='16' required>
				<input type="hidden" id="m_id_check" value="">
				<script>
					function m_checkId() {
						var id = $('#m_id').val();
						$.ajax({
							url : 'idCheck',
							type : 'post',
							data : {
								id : id
							},
							success : function(data) {
								if ($.trim(data) == 0) {
									$('#m_chkMsg').html("사용가능");
									$('#m_chkMsg').css('color', 'blue');
									$('#m_id_check').val('인증');
								} else {
									$('#m_chkMsg').html("사용불가");
									$('#m_chkMsg').css('color', 'red');
									$('#m_id_check').val('');
								}
							},
							error : function() {
								alert("에러입니다");
							}
						});
					};
				</script>
			</div>
			
			<div class="contents_item">
				<div class="m_text_area">
					<span>비밀번호</span>
					<span id="m_pw_ture" style="display: none; color: blue;">사용가능</span>
					<span id="m_pw_false" style="display: none; color: red;">사용불가</span>
				</div>
				<input class="m_pw" id="m_password" name="password" type="password" placeholder="비밀번호를 입력하세요." required />
				<input type="hidden" id="m_password_check" value="">
				<script>
					$('.m_pw').focusout(function (){
						var pw = $("#m_password").val();
						var num = pw.search(/[0-9]/g);
						var eng = pw.search(/[a-z]/ig);
						var spe = pw.search(/[`~!@@#$%^&*|₩₩₩'₩";:₩/?]/gi);

						if(pw.length < 10 || pw.length > 16){
							$("#m_pw_false").css('display','block');
							$("#m_pw_ture").css('display', 'none');
							$('#m_password_check').val('');
						} else if(pw.search(/\s/) != -1){
							$("#m_pw_false").css('display','block');
							$("#m_pw_ture").css('display', 'none');
							$('#m_password_check').val('');
						} else if( (num < 0 && eng < 0) || (eng < 0 && spe < 0) || (spe < 0 && num < 0) ){
							$("#m_pw_false").css('display','block');
							$("#m_pw_ture").css('display', 'none');
							$('#m_password_check').val('');
						}else {
							$("#m_pw_false").css('display','none');
							$("#m_pw_ture").css('display', 'block');
							$('#m_password_check').val('인증');
					 }});
				</script>
			</div>
			
			<div class="contents_item">
				<div class="m_text_area">
					<span>비밀번호 확인</span>
					<span id="m_alert-success" style="display: none; color: blue;">비밀번호가 일치합니다.</span>
					<span id="m_alert-danger" style="display: none; color: red;">비밀번호가 일치하지 않습니다.</span>
				</div>
				<input class="m_pw" id="m_ConfirmPassword" type="password" placeholder="비밀번호를 다시 입력하세요."/>
				<input type="hidden" id="m_ConfirmPassword_check" value="">
				<script>
					$('.m_pw').focusout(function() {
						var pwd1 = $("#m_password").val();
						var pwd2 = $("#m_ConfirmPassword").val();

						if (pwd1 != '' && pwd2 == '') {
							null;
						} else if (pwd1 != "" || pwd2 != "") {
							if (pwd1 == pwd2) {
								$("#m_alert-success").css('display','block');
								$("#m_alert-danger").css('display', 'none');
								$('#m_ConfirmPassword_check').val('인증');
							} else {
								$("#m_alert-success").css('display', 'none');
								$("#m_alert-danger").css('display','block');
								$('#m_ConfirmPassword_check').val('');
							}
						}
					});
				</script>
			</div>
			
			<div class="contents_item">
				<div class="m_text_area">
					<span>이름</span>
				</div>
				<input type="text" name="name" placeholder="이름을 입력하세요." id="m_name">
			</div>
			
			<div class="contents_item">
				<div class="m_text_area">
					<span>이메일</span>
				</div>
				<input type="email" name="email" placeholder="이메일을 입력하세요.">
			</div>
			
			<div class="contents_item">
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
				<input type="button" id="m_submit_btn" value="가입완료">
				
				<script type="text/javascript">
					$(function () {
						$('#m_tel_btn').click(function(){
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
											tel : tel,
											name : name
										},
										success : function(data) {
											if ($.trim(data) == 0) {
												alert('인증번호 발송에 실패하였습니다');
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
						
						$('#m_submit_btn').click(function(){
							var id = $('#m_id_check').val();
							var password = $('#m_password_check').val();
							var password_check = $('#m_ConfirmPassword_check').val();
							var name = $('#m_name').val();
							var certification = $('#certification').val();
							
							if(id != '인증'){
								alert('아이디를 확인해주세요');
								return false;
							} else if(password != '인증'){
								alert('비밀번호를 확인해주세요');
								return false;
							} else if(password_check != '인증'){
								alert('비밀번호를 확인해주세요');
								return false;
							} else if(name == null || name == ''){
								alert('이름을 입력해주세요.');
								return false;
							} else {
								$.ajax({
									url : 'send_m_sms_check',
									type : 'post',
									data : {
										certification : certification
									},
									success : function(data) {
										if ($.trim(data) == 0) {
											$('#m_form').submit();
										} else {
											alert('인증번호를 다시 입력하세요');
										}
									},
									error : function() {
										alert('인증번호 발송에 실패하였습니다');
									}
								});
							}
						});
					});
				</script>
			</div>
		</form>
	</section>
	<jsp:include page="/WEB-INF/jsp/footer/mobile_footer.jsp" />
	
	<script src="${root}/js/join.js"></script>
</body>
</html>