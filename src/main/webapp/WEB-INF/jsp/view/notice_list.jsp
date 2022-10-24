<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:set var="root" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>THE MICE</title>
<link rel="icon" href="${root}/img/common/favicon.svg">
<link rel="stylesheet" href="${root}/css/view/notice/notice.css">
<link rel="stylesheet" href="${root}/css/view/notice/mobile_notice.css">
<link rel="stylesheet" href="${root}/css/view/style.css">
<meta name="viewport" content="width=device-width, initial-scale=1">
<style type="text/css">
.paging{
	margin-bottom: 10%;
}
</style>
</head>
<body>
	<jsp:include page="/WEB-INF/jsp/aside/quick.jsp" />
	<jsp:include page="/WEB-INF/jsp/header/header.jsp" />
	
	<div class="header">
		<div class="title">
			<span>공지사항</span>
		</div>
	</div>
	<section id="notice">
		<div class="search_area">
			<form method="get">
				<input type="text" placeholder="제목으로 입력해주세요." name="title" value="${title}">
				<input type="submit" value="검색" id="search_submit">
<%-- 				<label for="search_submit"><img alt="" src="${root}/img/list/search.svg"></label> --%>
			</form>
		</div>
		<div class="contents_area">
			<ul>
				<li>번호</li>
				<li>제목</li>
				<li>작성일자</li>
				<li>조회수</li>
			</ul>
			
			<c:forEach var="nl" items="${notice_list}" varStatus="st">
				<ul>
					<li>${nl.idx}</li>
					<li><a href="notice_detail?idx=${nl.idx}">${nl.title}</a></li>
					<li>${nl.create_day}</li>
					<li>${nl.views}</li>
				</ul>
			</c:forEach>
		</div>
	</section>
<%-- 	<input type="text" value="${total}"> --%>
	<div class="paging">
		<c:if test="${paging.startPage != 1 }">
			<a
				href="notice_list?nowPage=${paging.startPage - 1}&cntPerPage=${paging.cntPerPage}&exhn_type=${exhn_type}&term=${term}&day=${day}&title=${title}"
				class="paging_0">&lt;</a>
		</c:if>
		<c:forEach begin="${paging.startPage}" end="${paging.endPage}" var="p">
			<c:choose>
				<c:when test="${p == paging.nowPage}">
					<p>${p}</p>
				</c:when>
				<c:when test="${p != paging.nowPage}">
					<a
						href="notice_list?nowPage=${p}&cntPerPage=${paging.cntPerPage}&exhn_type=${exhn_type}&term=${term}&day=${day}&title=${title}"
						class="paging_1">${p}</a>
				</c:when>
			</c:choose>
		</c:forEach>
		<c:if test="${paging.endPage != paging.lastPage}">
			<a href="notice_list?nowPage=${paging.endPage+1}&cntPerPage=${paging.cntPerPage}&exhn_type=${exhn_type}&term=${term}&day=${day}&title=${title}"
				class="paging_2">&gt;</a>
		</c:if>
	</div>
	
	<jsp:include page="/WEB-INF/jsp/footer/footer.jsp" />
	
	<section id="mobile_notice">
		
		<a href="javascript:history.back();" id="back_area">
			<img alt="" src="${root}/img/common/back_btn.svg" class="back_btn">
			<span>공지사항</span>
		</a>
		
		<div class="contents_area">
			<c:forEach var="nl" items="${notice_list}" varStatus="st">
				<a href="notice_detail?idx=${nl.idx}">
					<span>${nl.title}</span>
					<span>${nl.create_day}&nbsp;|&nbsp;${nl.views}</span>
				</a>
			</c:forEach>
		</div>
	</section>
	
	<jsp:include page="/WEB-INF/jsp/footer/mobile_footer.jsp" />
</body>
</html>