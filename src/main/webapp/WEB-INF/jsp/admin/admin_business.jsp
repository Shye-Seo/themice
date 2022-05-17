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
<script type="text/javascript"
	src="http://code.jquery.com/jquery-1.11.3.js"></script>
<c:set var="root" value="${pageContext.request.contextPath}" />
<link rel="stylesheet" href="${root}/css/admin_style.css">
<script>
	function business_release() {
		var check = [];

		$('input[name="check"]:checked').each(function(e) {
			check.push($(this).val());
		})

		var list = {
			'check' : check
		}

		$.ajax({
			url : 'business_release',
			type : 'post',
			data : list,
			success : function(data) {

				if ($.trim(data) == 0) {
					alert('해제 완료!');
					location.href = 'admin_user';
				} else {
					alert('해제 실패!');
				}
			},
			error : function() {
				alert("에러입니다");
			}
		});
	};

	function business_stop() {
		var check = [];

		$('input[name="check"]:checked').each(function(e) {
			check.push($(this).val());
		})

		var list = {
			'check' : check
		}

		$.ajax({
			url : 'business_stop',
			type : 'post',
			data : list,
			success : function(data) {

				if ($.trim(data) == 0) {
					alert('정지 완료!');
					location.href = 'admin_user';
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

	<section id="user_section">
		<div class="navi_area">
			<jsp:include page="/WEB-INF/jsp/admin/admin_side.jsp" />
		</div>

		<div class="contents_area">
			<div class="inner">
				<div class="search_area">
					<form method="post" action="admin_user">
						<select name="select">
							<option>사업자 번호</option>
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
					<div class="category">
						<ul>
							<li><a href="admin_user">일반회원</a></li>
							<li></li>
							<li><a href="admin_business">기업회원</a></li>
						</ul>
					</div>

					<div class="list">
						<ul class="title_area">
							<li><input type="checkbox" onclick='selectAll(this)'></li>
							<li>NO</li>
							<li>사업자번호</li>
							<li>가입일</li>
							<li>정지/해제</li>
						</ul>

						<c:forEach var="bl" items="${business_list}" varStatus="st">
							<ul>
								<li><input type="checkbox" name="check" value="${bl.idx}"></li>
								<li>${bl.idx}</li>
								<li>${bl.business_num}</li>
								<li>${bl.sign_date}</li>
								<li><c:if test="${bl.flag == 'Y'}">정상</c:if> <c:if
										test="${bl.flag == 'N'}">정지</c:if></li>
							</ul>
						</c:forEach>
					</div>
					<div class="btn_area">
						<button onclick="business_release()" type="button">해제</button>
						<button onclick="business_stop()" type="button">정지</button>
					</div>

					<div id="paging">
						<c:if test="${paging.startPage != 1 }">
							<a
								href="admin_business?nowPage=${paging.startPage - 1}&cntPerPage=${paging.cntPerPage}&select=${select}&value=${value}">&lt;</a>
						</c:if>
						<c:forEach begin="${paging.startPage}" end="${paging2.endPage}"
							var="p">
							<c:choose>
								<c:when test="${p == paging.nowPage}">
									<b>${p}</b>
								</c:when>
								<c:when test="${p != paging.nowPage}">
									<a
										href="admin_business?nowPage=${p}&cntPerPage=${paging.cntPerPage}&select=${select}&value=${value}">${p}</a>
								</c:when>
							</c:choose>
						</c:forEach>
						<c:if test="${paging.endPage != paging.lastPage}">
							<a
								href="admin_business?nowPage=${paging.endPage+1}&cntPerPage=${paging.cntPerPage}&select=${select}&value=${value}">&gt;</a>
						</c:if>
					</div>
				</div>
			</div>
		</div>
	</section>
</body>
</html>