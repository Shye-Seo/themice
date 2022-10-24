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
			<div class="header">
				<div class="title">
					<span>전시등록 설명서</span>
				</div>
			</div>
		
		<jsp:include page="/WEB-INF/jsp/aside/quick.jsp" />
	</c:if>
	<c:if test="${mini == 'Y'}">
				<div class="title_mini">
					<span>전시등록 설명서</span>
				</div>
		
	</c:if>
	
	
	<section id="manual">
		<div class="manual_area">
			<ul>
				<li>
					<div class="title_area">
						<p>1. 기본 정보 입력</p>
					</div>
					<div class="img_area">
						<img alt="" src="${root}/img/manual/manual_01.jpg">
					</div>
					<div class="text_area">
						<div id="text">
							<p>- 필수 항목(*) 입력 후 필요한 선택 사항 정보를 입력합니다.</p>
						</div>
					</div>
				</li>
				
				<li>
					<div class="title_area">
						<p>2. 전시 상세페이지 스타일 선택</p>
					</div>
					<div class="img_area" id="manual_02">
						<img alt="" src="${root}/img/manual/manual_02.jpg">
					</div>
					<div class="text_area">
						<div id="text">
							<p>- 4가지의 상세페이지 스타일이 있습니다.</p>
							<p>- 원하는 스타일을 선택 후 이미지 안의 버튼을 클릭하여<br>이미지를 첨부하며, 
							이미지에 관련된 텍스트를 입력합니다.</p>
						</div>
					</div>
				</li>
				
				<li>
					<div class="title_area">
						<p>3. 스타일 선택 후 꾸미기</p>
					</div>
					<div class="img_area">
						<img alt="" src="${root}/img/manual/manual_03.jpg">
					</div>
					<div class="text_area">
						<div id="text">
							<p>- 스타일을 선택후 원하는 폰트, 배경패턴, 배경색상을 선택합니다.</p>
							<p style="color: #EA933C;">* 배경패턴과 배경색상은 전시 스타일에 따라 다르게 적용됩니다.</p>
						</div>
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