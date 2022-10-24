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
#preferences .inner .category a:nth-child(3) {
	color: #EA933C;
    border-bottom: solid;
    border-width: 3px;
    border-color: #EA933C;
    font-weight: bold;
}
</style>
<script>
	function gallery_delete_management() {
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
				url : 'gallery_delete_management',
				type : 'post',
				data : list,
				success : function(data) {
	
					if ($.trim(data) == 0) {
						alert('삭제되었습니다.');
						location.href = 'gallery_management?contents_idx=${contents_idx}';
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
	
// 	function gallery_management_update() {
// 		var check = [];

// 		$('input[name="check"]:checked').each(function(e) {
// 			check.push($(this).val());
// 		})

// 		var list = {
// 			'check' : check
// 		}

// 		$.ajax({
// 			url : 'gallery_management_update',
// 			type : 'post',
// 			data : list,
// 			success : function(data) {

// 				if ($.trim(data) != 0) {
// 					alert('수정되었습니다.');
// 					location.href = 'gallery_management?contents_idx=${contents_idx}';
// 				} else {
// 					alert('실패');

// 				}
// 			},
// 			error : function() {
// 				alert("에러입니다=======>"+data.error_msg);
// 			}
// 		});
// 	};
	
	$("#selectAll").click(function(){
		if($(this).is(":checked")){
			$('input[name="check"]').attr("checked", true);
		}else{
			$('input[name="check"]').attr("checked", false);
		}
	});
	
	$("#selectAll").change(function(){

	    if($(this).is(":checked")){ 
	        $('input[name="check"]').prop("checked", true);
	    }else{ 
	        $('input[name="check"]').prop("checked", false);
	    }
	}); 
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
				<div class="gallery_management">
					<span class="title_area">갤러리관리</span>
<!-- 					<form method="get"> -->
<%-- 						<input type="text" placeholder="제목으로 입력해주세요." name="title" value="${test}"> --%>
<!-- 						<input type="submit" value="검색"> -->
<%-- 						<input type="hidden" value="${contents_idx}" name="contents_idx"> --%>
<!-- 					</form> -->
					
					<div class="btn_area">
						<a href="gallery_insert?contents_idx=${contents_idx}">갤러리 등록</a>
<%-- 						<a href="notice_management_update?contents_idx=${contents_idx}?idx=${notice_list.idx}">수정</a> --%>
<!-- 						<input type="button" onclick="notice_management_update()" value="수정"> -->
						<input type="button" onclick="gallery_delete_management()" value="삭제">
					</div>
					
					<div class="contents_area">
						<ul>
							<li><input type="checkbox" name="check" id="selectAll"></li>
							<li>NO</li>
							<li>제목</li>
							<li>대표이미지</li>
							<li>&nbsp;</li>
						</ul>
						
						<c:forEach var="list" items="${gallery_list}" varStatus="st">
							<ul>
								<li><input type="checkbox" name="check" value="${list.idx}" id="check"></li>
								<li>${list.idx}</li>
								<li><a href="gallery_detail?contents_idx=${contents_idx}&gallery_idx=${list.idx}">${list.title}</a></li>
								<li><a href="gallery_detail?contents_idx=${contents_idx}&gallery_idx=${list.idx}">
											<img alt="" src="${root}/thumbnail_path/${list.thumbnail}">
									</a>
								</li>
								<li><a href="gallery_update?contents_idx=${contents_idx}&gallery_idx=${list.idx}">수정</a></li>
							</ul>
						</c:forEach>
					</div>
					
					<div class="paging">
						<c:if test="${paging.startPage != 1 }">
							<a href="website?nowPage=${paging.startPage - 1}&cntPerPage=${paging.cntPerPage}&contents_idx=${contents_idx}" class="paging_0">&lt;</a>
						</c:if>
						<c:forEach begin="${paging.startPage}" end="${paging.endPage}" var="p">
							<c:choose>
								<c:when test="${p == paging.nowPage}">
									<p>${p}</p>
								</c:when>
								<c:when test="${p != paging.nowPage}">
									<a href="website?nowPage=${p}&cntPerPage=${paging.cntPerPage}&contents_idx=${contents_idx}" class="paging_1">${p}</a>
								</c:when>
							</c:choose>
						</c:forEach>
						<c:if test="${paging.endPage != paging.lastPage}">
							<a href="website?nowPage=${paging.endPage+1}&cntPerPage=${paging.cntPerPage}&contents_idx=${contents_idx}" class="paging_2">&gt;</a>
						</c:if>
					</div>
					<input type="hidden" value="${contents_idx}" name="contents_idx">
					<input type="hidden" value="${idx}" name="idx">
<%-- 						<input type="text" value="contents_idx=${contents_idx}  / idx=${list.idx}"> --%>
					
				</div>
			</div>
			
			<jsp:include page="/WEB-INF/jsp/footer/footer.jsp" />
		</section>
	</div>
</body>
</html>