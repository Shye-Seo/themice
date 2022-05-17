<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:set var="root" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>THE MICE</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="icon" href="${root}/img/common/favicon.svg">
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;300;400;500;700;900&display=swap" rel="stylesheet">
<link rel="stylesheet" href="${root}/css/view/website2/notice.css">
<script src="//code.jquery.com/jquery-1.11.3.min.js"></script>
</head>
<body>
	<jsp:include page="header.jsp" />
	<script>
		var goBackBtn = document.getElementById('goBack')
		goBackBtn.addEventListener("click", function(){
			location.href = '${root}/website2'
		})
	</script>
	<div class="notice_banner">
		<img src="${root }/img/website2/notice_banner.png">
	</div>
	
	<div id="notice">
		<div class="search_area">
			<form action="web_notice_list" method="get">
				<input type="text" placeholder="제목으로 입력해주세요." name="title" value="${title}">
				<img class="sl_img" src="${root}/img/website2/notice_search.svg">
				<input type="submit" value="검색">
				<input type="hidden" name="contents_idx" value="${contents_idx}">
			</form>
		</div>
		
		<c:forEach var="list" items="${notice_list}" varStatus="st">
			<div class="contents_area">
				<div class="content_item">
					<span>Notice</span>
				</div>
				
				<div class="content_item">
					<div class="content_idx">
						<span>${list.idx}</span>
					</div>
					
					<div class="contents_day">
						<span>${list.start_day}</span>
					</div>
				</div>
				
				<div class="content_item">
					<div class="content_title">
						<a href="web_notice_detail?contents_idx=${contents_idx}&idx=${list.idx}">${list.title}</a>
					</div>
					
					<div class="content_text">
						<span>${list.contents}</span>
					</div>
				</div>
				
				<div class="content_item">
					<a href="web_notice_detail?contents_idx=${contents_idx}&idx=${list.idx}"><img alt="" src="${root}/img/website2/notice_plus.svg"></a>
				</div>
			</div>
		</c:forEach>
	</div>
	
	<div class="paging" style="margin: 3% auto;">
		<c:if test="${paging.startPage != 1 }">
			<a href="web_notice_list?nowPage=${paging.startPage - 1}&cntPerPage=${paging.cntPerPage}&contents_idx=${contents_idx}" class="paging_0">&lt;</a>
		</c:if>
		<c:forEach begin="${paging.startPage}" end="${paging.endPage}" var="p">
			<c:choose>
				<c:when test="${p == paging.nowPage}">
					<p>${p}</p>
				</c:when>
				<c:when test="${p != paging.nowPage}">
					<a href="web_notice_list?nowPage=${p}&cntPerPage=${paging.cntPerPage}&contents_idx=${contents_idx}" class="paging_1">${p}</a>
				</c:when>
			</c:choose>
		</c:forEach>
		<c:if test="${paging.endPage != paging.lastPage}">
			<a href="web_notice_list?nowPage=${paging.endPage+1}&cntPerPage=${paging.cntPerPage}&contents_idx=${contents_idx}" class="paging_2">&gt;</a>
		</c:if>
	</div>
	
	<jsp:include page="footer.jsp" />
	
	<div id="mobile">
		<div class="mn_content_wrap">
			<c:forEach var="list" items="${notice_list}" varStatus="st">
				<div class="mnc_inner_wrap">
					<div class="mnc_fst">Notice</div>
					<div class="mnc_sec">
						<div class="mnc_num">${list.idx}</div>
						<div class="mnc_date">${list.start_day}</div>
					</div>
					<div class="mnc_trd">
						<div class="mnc_title"><a class="mnct_a" href="web_notice_detail?contents_idx=${contents_idx}&idx=${list.idx}">${list.title}</a></div>
						<div class="mnc_subtitle">${list.contents}</div>
					</div>
				</div>
			</c:forEach>
		</div>
	</div>
</body>
</html>