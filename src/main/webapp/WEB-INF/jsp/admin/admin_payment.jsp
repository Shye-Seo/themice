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
<script type="text/javascript">
function selectAll(selectAll)  {
	const checkboxes = document.getElementsByName('check');
	
	checkboxes.forEach((checkbox) => {
		checkbox.checked = selectAll.checked;
	})
};
</script>
</head>
<body>
	<section id="admin_payment">
		<div class="navi_area">
			<jsp:include page="/WEB-INF/jsp/admin/admin_side.jsp" />
		</div>
		<div class="contents_area">
			<div class="inner">
				<div class="search_area">
					<form>
						<select name="select">
							<option>상품명</option>
							<option>구매자</option>
						</select>
						<c:if test="${value == null}">
							<input name="value" type="text" placeholder="내용을 입력해주세요.">
						</c:if>
						<c:if test="${value != null}">
							<input name="value" type="text" placeholder="내용을 입력해주세요."
								value="${value}">
						</c:if>
						<input type="submit" id="search_submit" value="검색">
					</form>
				</div>
				<div class="container">
					<div class="list">
						<ul class="title_area">
							<li><input type="checkbox" onclick='selectAll(this)'></li>
							<li>NO</li>
							<li>상품명</li>
							<li>금액</li>
							<li>구매자</li>
							<li>결제일</li>
							<li>처리상태</li>
						</ul>
						<c:forEach var="pl" items="${payment_list}" varStatus="st">
							<ul>
								<li><input type="checkbox" name="check" value="${pl.idx}"></li>
								<li>${pl.idx}</li>
								<li>${pl.title}</li>
								<li>${pl.total}</li>
								<li>${pl.id}</li>
								<li>${pl.payment_date}</li>
								<li><c:if test="${pl.status == 'paid'}">결제완료</c:if> <c:if
										test="${pl.status == 'refund'}">환불완료</c:if></li>
							</ul>
						</c:forEach>
					</div>

					<div class="btn_area">
						<button onclick="refund()">결제 취소</button>
					</div>

					<div id="paging">
						<c:if test="${paging.startPage != 1 }">
							<a
								href="admin_payment?nowPage=${paging.startPage - 1}&cntPerPage=${paging.cntPerPage}&select=${select}&value=${value}">&lt;</a>
						</c:if>
						<c:forEach begin="${paging.startPage}" end="${paging.endPage}"
							var="p">
							<c:choose>
								<c:when test="${p == paging.nowPage}">
									<b>${p}</b>
								</c:when>
								<c:when test="${p != paging.nowPage}">
									<a
										href="admin_payment?nowPage=${p}&cntPerPage=${paging.cntPerPage}&select=${select}&value=${value}">${p}</a>
								</c:when>
							</c:choose>
						</c:forEach>
						<c:if test="${paging.endPage != paging.lastPage}">
							<a
								href="admin_payment?nowPage=${paging.endPage+1}&cntPerPage=${paging.cntPerPage}&select=${select}&value=${value}">&gt;</a>
						</c:if>
					</div>
				</div>
			</div>
		</div>
	</section>
</body>
</html>