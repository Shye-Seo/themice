<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>THE MICE</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<c:set var="root" value="${pageContext.request.contextPath}" />
<link rel="icon" href="${root}/img/common/favicon.svg">
<script src="//code.jquery.com/jquery-1.11.3.min.js"></script>
<script src="//code.jquery.com/jquery-migrate-1.2.1.min.js"></script>
<script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
<link rel="stylesheet" href="${root}/css/view/website/website_type_1.css">
</head>
<body>
	<div id="section">
<%-- 		<jsp:include page="/WEB-INF/jsp/view/page_type_1/header.jsp" /> --%>
		
		<section id="web_notice">
			<div class="inner">
<!-- 				<div class="title_area"> -->
<!-- 					<span>공지사항</span> -->
<!-- 				</div> -->
				
				<div class="web_notice_list">
<!-- 					<form action="web_notice_list" method="post" name="form"> -->
<!-- 						<input type="text" placeholder="제목으로 입력해주세요." name="title"> -->
<!-- 						<input type="submit" value="검색" id="search_submit_btn"> -->
<!-- 					</form> -->
<!-- 					<script> -->
					
<!-- // 						$('#search_submit_btn').click(function(){ -->
<!-- // 							var title = $('input[name=title]').val(); -->
										
<!-- // 							if(title == null || title == ''){ -->
<!-- // 								alert('검색어를 입력해주세요.'); -->
<!-- // 								$('input[name=title]').focus(); -->
<!-- // 								return false; -->
<!-- // 							} else { -->
<!-- // 								$('form[name=form]').submit(); -->
<!-- // 							} -->
<!-- // 						}); -->
<!-- 					</script> -->
					
					<div class="content_area">
						<ul>
							<li>NO</li>
							<li>제목</li>
							<li>작성일자</li>
							<li>조회수</li>
						</ul>
						
						<c:forEach var="list" items="${notice_list}" varStatus="st">
							<ul>
								<li>${list.idx}</li>
								<li><a href="web_notice_detail?contents_idx=${contents_idx}&idx=${list.idx}">${list.title}</a></li>
								<li>${list.create_day}</li>
								<li>${list.views}</li>
							</ul>
						</c:forEach>
					</div>
				</div>
				
<%-- 				<c:if test="${not empty sessionScope.business_id && sessionScope.business_id eq business_num}"> --%>
<!-- 						<div class="btn_area"> -->
<%-- 							<a href="notice_management_insert?contents_idx=${contents_idx}">등록</a> --%>
<!-- 						</div> -->
<%-- 				</c:if> --%>
				
				<div class="paging">
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
			</div>
			
<%-- 			<jsp:include page="/WEB-INF/jsp/footer/footer.jsp" /> --%>
		</section>
	</div>
</body>
</html>