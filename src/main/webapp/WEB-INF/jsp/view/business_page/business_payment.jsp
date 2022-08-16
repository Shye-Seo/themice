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
			<span>기업회원</span>
			<span><img alt="" src="${root}/img/common/arrow_icon.svg"></span>
			<span>결제 내역</span>
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
						<!-- <option value="business_info">회원정보 수정</option> -->
						<option value="login_check">회원정보 수정</option>
						<option value="business_contents_list">내 전시 리스트</option>
						<option value="business_payment" selected="selected">결제 내역</option>
						<option value="business_password_update">비밀번호 수정</option>
						<option value="business_secession">회원 탈퇴</option>
					</select>
				</li>
			</ul>
		</nav>
	</div>
	
	<section id="member_payment">
		<div class="title_area">
			<span>결제 내역 확인</span>
		</div>
		
		<div class="contents_area">
			<div class="search_area">
				<form method="get" action="business_payment">
					<input type="text" name="title" placeholder="제목을 입력하세요." value="${title}">
					<img alt="" src="${root}/img/member_page/search.svg">
					<input type="submit" value="검색">
				</form>
			</div>
			
			<div class="text_area">
				<ul>
					<li>NO</li>
					<li>행사명</li>
					<li>예매일</li>
					<li>예매가격</li>
					<li>처리단계</li>
				</ul>
				
				<c:forEach var="pl" items="${payment_list}" varStatus="st">
					<ul>
						<li>${pl.idx}</li>
						<li>${pl.title}</li>
						<li>${pl.time}</li>
						<li>${pl.amount}</li>
						<li>
							<c:if test="${pl.status == 'paid'}">구매완료</c:if>
						</li>
					</ul>
				</c:forEach>
			</div>
		</div>
		
		<c:if test="${payment_list == null}">
		
			<style>
				footer{
					position: absolute;
					bottom: 0;
				}
			</style>
			
			<div class="total_area">
				<span>결제 내역이 없습니다.</span>
			</div>
		</c:if>
		
		<div class="paging">
			<c:if test="${paging.startPage != 1 }">
				<a href="business_payment?nowPage=${paging.startPage - 1}&cntPerPage=${paging.cntPerPage}&title=${title}" class="paging_0">&lt;</a>
			</c:if>
			<c:forEach begin="${paging.startPage}" end="${paging.endPage}" var="p">
				<c:choose>
					<c:when test="${p == paging.nowPage}">
						<p>${p}</p>
					</c:when>
					<c:when test="${p != paging.nowPage}">
						<a href="business_payment?nowPage=${p}&cntPerPage=${paging.cntPerPage}&title=${title}" class="paging_1">${p}</a>
					</c:when>
				</c:choose>
			</c:forEach>
			<c:if test="${paging.endPage != paging.lastPage}">
				<a href="business_payment?nowPage=${paging.endPage+1}&cntPerPage=${paging.cntPerPage}&title=${title}" class="paging_2">&gt;</a>
			</c:if>
		</div>
	</section>
	
	<jsp:include page="/WEB-INF/jsp/footer/footer.jsp" />
</body>
</html>