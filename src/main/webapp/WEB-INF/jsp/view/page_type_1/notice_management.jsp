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
<link rel="stylesheet" href="${root}/css/view/style.css">
<link rel="stylesheet" href="${root}/css/view/website/website_type_2.css">
<style type="text/css">
#preferences .inner .category a:nth-child(3) {
	color: #EA933C;
    border-bottom: solid;
    border-width: 3px;
    border-color: #EA933C;
    font-weight: bold;
}
</style>
<script>
	function notice_delete_management() {
		var check = [];

		$('input[name="check"]:checked').each(function(e) {
			check.push($(this).val());
		})

		var list = {
			'check' : check
		}

		$.ajax({
			url : 'notice_delete_management',
			type : 'post',
			data : list,
			success : function(data) {

				if ($.trim(data) == 0) {
					alert('삭제되었습니다.');
					location.href = 'notice_management?contents_idx=${contents_idx}';
				} else {
					alert('삭제 실패');

				}
			},
			error : function() {
				alert("에러입니다");
			}
		});
	};
	
	function selectAll(selectAll)  {
		const checkboxes = document.getElementsByName('check');
		
		checkboxes.forEach((checkbox) => {
			checkbox.checked = selectAll.checked;
		})
	};
</script>
</head>
<body>
	<div id="section">
		<jsp:include page="/WEB-INF/jsp/view/page_type_1/header.jsp" />
	
		<section id="preferences">
			<div class="inner">
				<div class="category">
					<a href="main_management?contents_idx=${contents_idx}">메인관리</a>
					<a href="introduction_management?contents_idx=${contents_idx}">소개관리</a>
					<a href="notice_management?contents_idx=${contents_idx}">공지사항관리</a>
					<a href="pop_up_management?contents_idx=${contents_idx}">팝업관리</a>
					<a href="comment_management?contents_idx=${contents_idx}">댓글관리</a>
				</div>
				
				<div class="notice_management">
					<form method="get">
						<input type="text" placeholder="제목으로 입력해주세요." name="title" value="${test}">
						<input type="submit" value="검색">
						<input type="hidden" value="${contents_idx}" name="contents_idx">
					</form>
					
					<div class="contents_area">
						<ul>
							<li><input type="checkbox" name="check" value="${list.idx}"></li>
							<li>NO</li>
							<li>제목</li>
							<li>작성일자</li>
							<li>조회순</li>
						</ul>
						
						<c:forEach var="list" items="${notice_list}" varStatus="st">
							<ul>
								<li><input type="checkbox" name="check" value="${list.idx}"></li>
								<li>${list.idx}</li>
								<li><a href="web_notice_detail?contents_idx=${contents_idx}&idx=${list.idx}">${list.title}</a></li>
								<li>${list.create_day}</li>
								<li>${list.views}</li>
							</ul>
						</c:forEach>
					</div>
					
					<div class="paging" style="margin: 0 auto;">
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
					
					<div class="btn_area">
						<a href="notice_management_insert?contents_idx=${contents_idx}">게시글 등록</a>
						<input type="button" onclick="notice_delete_management()" value="삭제">
					</div>
				</div>
			</div>
			
			<jsp:include page="/WEB-INF/jsp/footer/footer.jsp" />
		</section>
	</div>
</body>
</html>