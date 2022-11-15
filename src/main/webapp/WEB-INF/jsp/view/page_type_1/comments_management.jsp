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
<link rel="stylesheet" href="${root}/css/view/website/website_type_1.css">
<style type="text/css">
#preferences .inner .category a:nth-child(6) {
	color: #EA933C;
    border-bottom: solid;
    border-width: 3px;
    border-color: #EA933C;
    font-weight: bold;
}
</style>
<script>
	function user_delete_management() {
		var check = [];

		if($('input[name="check"]:checked').length == 0){
			alert("선택된 항목이 없습니다.");
			return false;
		}else {
			$('input[name="check"]:checked').each(function(e) {
				check.push($(this).val());
			})
	
			var list = {
				'check' : check
			}
	
			$.ajax({
				url : 'user_delete_management',
				type : 'post',
				data : list,
				success : function(data) {
	
					if ($.trim(data) == 0) {
						alert('삭제되었습니다');
						location.href = 'comment_management?contents_idx=${contents_idx}';
					} else {
						alert('삭제 실패');
	
					}
				},
				error : function() {
					alert("에러입니다");
				}
			});
		}
	};
	
</script>
</head>
<body>
	<div id="section">
		<jsp:include page="/WEB-INF/jsp/view/page_type_1/header.jsp" />
		
		<div id="management_title_area">
			<span>환경설정</span>
		</div>
		<div id="navi_area">
			<nav>
				<ul>
					<li><a href="main_management?contents_idx=${contents_idx}">메인관리</a></li>
					<li><a href="introduction_management?contents_idx=${contents_idx}">소개관리</a></li>
					<li><a href="gallery_management?contents_idx=${contents_idx}">갤러리관리</a></li>
					<li><a href="notice_management?contents_idx=${contents_idx}">공지사항관리</a></li>
					<li><a href="pop_up_management?contents_idx=${contents_idx}">팝업관리</a></li>
					<li><a href="comment_management?contents_idx=${contents_idx}">댓글관리</a></li>
				</ul>
			</nav>
		</div>
	
		<section id="preferences">
			<div class="inner">
				<div class="comments_management">
					<span class="title_area">댓글관리</span>
<!-- 					<form method="get"> -->
<!-- 						<div class="search_area"> -->
<%-- 							<input type="text" placeholder="아이디로 입력해주세요." name="user_id" value="${user_id}"> --%>
<!-- 							<input type="submit" value="검색"> -->
<!-- 						</div> -->
						
<!-- 						<div class="select_area"> -->
<!-- 							<input type="radio" name="category" id="comments_report" value="1"> -->
<!-- 							<label for="comments_report">댓글</label> -->
						
<!-- 							<input type="radio" name="category" id="answers_report" value="2"> -->
<!-- 							<label for="answers_report">대댓글</label> -->
<!-- 							<script type="text/javascript"> -->
								
<!-- 							</script> -->
<!-- 						</div> -->
<!-- 					</form> -->
					<div class="btn_area">
						<input type="button" onclick="user_delete_management()" value="댓글삭제">
					</div>
					
					<div class="contents_area">
						<ul id="comment_head">
							<li><input type="checkbox" onclick='selectAll(this)'></li>
							<li>NO</li>
							<li>아이디</li>
							<li>작성내용</li>
							<li>작성시간</li>
							<li>신고횟수</li>
						</ul>
						
						<div class="comments_area">
							<c:forEach var="list" items="${comments_list}" varStatus="st">
								<ul>
									<li><input type="checkbox" name="check" value="${list.idx}"></li>
									<li>${list.idx}</li>
									<li>${list.user_id}</li>
									<li>${list.comment}</li>
									<li>${list.date}</li>
									<li>${list.count}</li>
								</ul>
							</c:forEach>
						</div>
						
						<div class="answer_area">
							<c:forEach var="list" items="${answers_list}" varStatus="st">
								<ul>
									<li><input type="checkbox" name="check" value="${list.idx}"></li>
									<li>${list.idx}</li>
									<li>${list.user_id}</li>
									<li>${list.comments}</li>
									<li>${list.date}</li>
									<li>${list.count}</li>
								</ul>
							</c:forEach>
						</div>
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
					
				</div>
			</div>
			
			<jsp:include page="/WEB-INF/jsp/footer/footer.jsp" />
		</section>
	</div>
</body>
</html>