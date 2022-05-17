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
<script type="text/javascript"
	src="http://code.jquery.com/jquery-1.11.3.js"></script>

<script>
	function Release() {
		var check = [];

		$('input[name="check"]:checked').each(function(e) {
			check.push($(this).val());
		})

		var list = {
			'check' : check
		}

		$.ajax({
			url : 'contents_release',
			type : 'post',
			data : list,
			success : function(data) {

				if ($.trim(data) == 0) {
					alert('해제 완료!');
					location.href = 'admin_contents';
				} else {
					alert('해제 실패!');
				}
			},
			error : function() {
				alert("에러입니다");
			}
		});
	};

	function Stop() {
		var check = [];

		$('input[name="check"]:checked').each(function(e) {
			check.push($(this).val());
		})

		var list = {
			'check' : check
		}

		$.ajax({
			url : 'contents_stop',
			type : 'post',
			data : list,
			success : function(data) {

				if ($.trim(data) == 0) {
					alert('정지 완료!');
					location.href = 'admin_contents';
				} else {
					alert('정지 실패!');

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
	<section id="admin_contents">
		<div class="navi_area">
			<jsp:include page="/WEB-INF/jsp/admin/admin_side.jsp" />
		</div>
		<div class="contents_area">
			<div class="inner">
				<div class="search_area">
					<form method="get">
						<select name="category" id="category">
							<option value="1">제목</option>
							<option value="2">기업명</option>
						</select> <input type="text" name="title" placeholder="내용을 입력해주세요."
							value="${title}"> <input type="submit" value="검색">
					</form>
				</div>

				<script type="text/javascript">
					$(function() {
						var category = '${category}';

						if (category == 1) {
							$('#category').val('1').prop('selected', true);
						} else {
							$('#category').val('2').prop('selected', true);
						}
					});
				</script>

				<div class="container">
					<div class="list">
						<ul class="title_area">
							<li><input type="checkbox" onclick='selectAll(this)'></li>
							<li>NO</li>
							<li>제목</li>
							<li>기업명</li>
							<li>작성일</li>
							<li>정지/해제</li>
						</ul>
						<c:forEach var="cl" items="${Contents_list}" varStatus="st">

							<ul>
								<li><input type="checkbox" name="check" value="${cl.idx}"></li>
								<li>${cl.idx}</li>
								<li>${cl.title}</li>
								<li>${cl.business}</li>
								<li>${cl.create_day}</li>
								<li><c:if test="${cl.flag == 'Y'}">게시중</c:if> <c:if
										test="${cl.flag == 'N'}">정지</c:if></li>
							</ul>

						</c:forEach>
					</div>

					<div class="btn_area">
						<button onclick="Release()" type="button">해제</button>
						<button onclick="Stop()" type="button">정지</button>
					</div>
					<div id="paging">
						<c:if test="${paging.startPage != 1 }">
							<a
								href="admin_contents?nowPage=${paging.startPage - 1}&cntPerPage=${paging.cntPerPage}&title=${title}&category=${category}">&lt;</a>
						</c:if>
						<c:forEach begin="${paging.startPage}" end="${paging.endPage}"
							var="p">
							<c:choose>
								<c:when test="${p == paging.nowPage}">
									<b>${p}</b>
								</c:when>
								<c:when test="${p != paging.nowPage}">
									<a
										href="admin_contents?nowPage=${p}&cntPerPage=${paging.cntPerPage}&title=${title}&category=${category}">${p}</a>
								</c:when>
							</c:choose>
						</c:forEach>
						<c:if test="${paging.endPage != paging.lastPage}">
							<a
								href="admin_contents?nowPage=${paging.endPage+1}&cntPerPage=${paging.cntPerPage}&title=${title}&category=${category}">&gt;</a>
						</c:if>
					</div>
				</div>
			</div>
		</div>
	</section>
</body>
</html>