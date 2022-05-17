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
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
</head>
<body>

	<c:if test="${mini != 'Y'}">
		<jsp:include page="/WEB-INF/jsp/header/header.jsp" />
		
		<jsp:include page="/WEB-INF/jsp/aside/quick.jsp" />
	</c:if>
	
	<section id="manual">
		<div class="top_title_area">
			<span>THE MICE 사용 설명서</span>
		</div>
		<div class="manual_area">
			<ul>
				<li>
					<div class="title_area">
						<p><span>1</span>기본 정보 입력</p>
					</div>
					<div class="img_area">
						<img alt="" src="${root}/img/manual/manual_1.jpg">
					</div>
					<div class="text_area">
						<p>- 필수 항목(*) 입력 후 필요한 선택 사항 정보를 입력합니다.</p>
					</div>
				</li>
				
				<li>
					<div class="title_area">
						<p><span>2</span>원하는 전시 타입 선택</p>
					</div>
					<div class="img_area">
						<img alt="" src="${root}/img/manual/manual_2.jpg">
					</div>
					<div class="text_area">
						<p style="margin-bottom: 0;">- 총 5가지의 전시 타입이 있으며, 각각의 타입 안에 다른 A,B 타입을<br>&nbsp;&nbsp;제공합니다.</p>
						<p style="margin: 0">&nbsp;&nbsp;예시 = 주황색 컬러 선택(1번 2번)중 선택</p>
						<p>- 원하는 전시 타입을 선택 후 이미지 하단 버튼을 클릭하여 사이즈에<br>&nbsp;&nbsp;맞는 이미지를 업로드 합니다.</p>
					</div>
				</li>
				
				<li>
					<div class="title_area">
						<p><span>3</span>타입 선택 후 꾸미기 선택</p>
					</div>
					<div class="img_area">
						<img alt="" src="${root}/img/manual/manual_3.jpg">
					</div>
					<div class="text_area">
						<p>- 전시 타입을 선택후 원하는 폰트, 배경 이미지(패턴)을 선택합니다.</p>
						<p style="font-weight: bold;"><span style="color: #EA933C;">*</span>색상 이미지와 배경 색상은 전시 타입에 따라 선택 사항에 제공이 다릅니다.</p>
					</div>
				</li>
			</ul>
		</div>
	</section>
	<c:if test="${mini != 'Y'}">
		<jsp:include page="/WEB-INF/jsp/footer/footer.jsp" />
	</c:if>
</body>
</html>