<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<c:set var="root" value="${pageContext.request.contextPath}" />
<link rel="stylesheet" href="${root}/css/admin_style.css">
</head>
<body>
	<section id="admin_list">
		<div class="navi_area">
			<jsp:include page="/WEB-INF/jsp/admin/admin_side.jsp" />
		</div>

		<div class="contents_area">
			<div class="inner">
				<div class="container">
					<div class="title_area">
						<span>관리자 정보</span>
					</div>
					<div class="info_area">
						<ul>
							<li>
								<span>계정</span>
								<span>${sessionScope.id}</span>
							</li>
							<li>
								<span>관리자 권한</span>
								<span>${sessionScope.authority}</span>
							</li>
							<li>
								<span>접속 시간</span>
								<span>${time}</span>
							</li>
						</ul>
						<a href="admin_logout">로그아웃</a>
					</div>
				</div>
				
				<div class="container">
					<div class="title_area">
						<span>신규 회원가입</span>
						<a href="admin_user">더보기&nbsp;&gt;</a>
					</div>
					<div class="content_area">
						<ul>
							<li><span>ID</span></li>
							<li><span>이름</span></li>
							<li><span>가입일</span></li>
						</ul>
						
						<c:forEach var="ml" items="${member_new_list}" varStatus="st">
						<ul>
							<li><span>${ml.id}</span></li>
							<li><span>${ml.name}</span></li>
							<li><span>${ml.sign_date}</span></li>
						</ul>
						</c:forEach>
					</div>
				</div>
				
				<div class="container">
					<div class="title_area">
						<span>기업 승인 여부</span>
						<a href="admin_business_waite">더보기&nbsp;&gt;</a>
					</div>
					<div class="content_area">
						<ul>
							<li><span>기업명</span></li>
							<li><span>사업자 번호</span></li>
							<li><span>신청일</span></li>
						</ul>
						
						<c:forEach var="bl" items="${besiness_new_list}" varStatus="st">
						<ul>
							<li><span>${bl.business_name}</span></li>
							<li><span>${bl.business_num}</span></li>
							<li><span>${bl.sign_date}</span></li>
						</ul>
						</c:forEach>
					</div>
				</div>
				
				<div class="container">
					<div class="title_area">
						<span>공지사항</span>
						<a href="admin_notice">더보기&nbsp;&gt;</a>
					</div>
					<div class="content_area">
						<ul>
							<li><span>NO</span></li>
							<li><span>제목</span></li>
							<li><span>작성자</span></li>
						</ul>
						
						<c:forEach var="nl" items="${notice_new_list}" varStatus="st">
						<ul>
							<li><span>${nl.idx}</span></li>
							<li><span>${nl.title}</span></li>
							<li><span>${nl.writer}</span></li>
						</ul>
						</c:forEach>
					</div>
				</div>
			</div>
		</div>
	</section>
</body>
</html>