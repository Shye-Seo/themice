<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<c:set var="root" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript"
	src="http://code.jquery.com/jquery-1.11.3.js"></script>
<link rel="stylesheet" href="${root}/css/admin_style.css">
<script>
	function advertisement_release() {
		var check = [];

		$('input[name="check"]:checked').each(function(e) {
			check.push($(this).val());
		})

		var list = {
			'check' : check
		}

		$.ajax({
			url : 'advertisement_release',
			type : 'post',
			data : list,
			success : function(data) {

				if ($.trim(data) == 0) {
					alert('해제 완료!');
					location.href = 'admin_advertisement_list';
				} else {
					alert('해제 실패!');
				}
			},
			error : function() {
				alert("에러입니다");
			}
		});
	};

	function advertisement_stop() {
		var check = [];

		$('input[name="check"]:checked').each(function(e) {
			check.push($(this).val());
		})

		var list = {
			'check' : check
		}

		$.ajax({
			url : 'advertisement_stop',
			type : 'post',
			data : list,
			success : function(data) {

				if ($.trim(data) == 0) {
					alert('정지 완료!');
					location.href = 'admin_advertisement_list';
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
	<section id="admin_advertisement_list">
		<div class="navi_area">
			<jsp:include page="/WEB-INF/jsp/admin/admin_side.jsp" />
		</div>
		<div class="contents_area">
			<div class="inner">
				<div class="search_area">
					<form>
						<select name="select">
							<option>제목</option>
							<option>기업명</option>
						</select>
						<c:if test="${value == null}">
							<input name="value" type="text" placeholder="내용을 입력해주세요.">
						</c:if>
						<c:if test="${value != null}">
							<input name="value" type="text" placeholder="내용을 입력해주세요."
								value="${value}">
						</c:if>
						<input type="submit" value="검색">
					</form>
				</div>

				<div class="container">
					<div class="list">
						<ul class="title_area">
							<li><input type="checkbox" onclick='selectAll(this)'></li>
							<li>NO</li>
							<li>회사명</li>
							<li>제목</li>
							<li>링크</li>
							<li>광고비</li>
							<li>게시 기간</li>
						</ul>
						<c:forEach var="list" items="${list}" varStatus="st">
							<ul>
								<li><input type="checkbox" name="check" value="${list.idx}"></li>
								<li>${list.idx}</li>
								<li>${list.business_name}</li>
								<li>${list.title}</li>
								<li>${list.link_address}</li>
								<li>${list.price}</li>
								<li>${list.start_day}~${list.end_day}</li>
							</ul>
						</c:forEach>
					</div>

					<div class="btn_area">
						<button onclick="advertisement_release()" type="button">해제</button>
						<button onclick="advertisement_stop()" type="button">정지</button>
						<a href="admin_advertisement_write">등록</a>
					</div>

					<div id="paging">
						<c:if test="${paging.startPage != 1 }">
							<a
								href="admin_advertisement_list?nowPage=${paging.startPage - 1}&cntPerPage=${paging.cntPerPage}&select=${select}&value=${value}">&lt;</a>
						</c:if>
						<c:forEach begin="${paging.startPage}" end="${paging.endPage}"
							var="p">
							<c:choose>
								<c:when test="${p == paging.nowPage}">
									<b>${p}</b>
								</c:when>
								<c:when test="${p != paging.nowPage}">
									<a
										href="admin_advertisement_list?nowPage=${p}&cntPerPage=${paging.cntPerPage}&select=${select}&value=${value}">${p}</a>
								</c:when>
							</c:choose>
						</c:forEach>
						<c:if test="${paging.endPage != paging.lastPage}">
							<a
								href="admin_advertisement_list?nowPage=${paging.endPage+1}&cntPerPage=${paging.cntPerPage}&select=${select}&value=${value}">&gt;</a>
						</c:if>
					</div>
				</div>
			</div>
		</div>
	</section>
</body>
</html>