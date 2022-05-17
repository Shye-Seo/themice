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
<link rel="stylesheet" href="${root}/css/admin_style.css">
<script type="text/javascript"
	src="http://code.jquery.com/jquery-1.11.3.js"></script>
<script>
	function Approval() {
		var check = [];

		$('input[name="check"]:checked').each(function(e) {
			check.push($(this).val());
		})

		var list = {
			'check' : check
		}

		$.ajax({
			url : 'business_Approval',
			type : 'post',
			data : list,
			success : function(data) {

				if ($.trim(data) == 0) {
					alert('승인 성공!');
					location.href = 'admin_business_waite';
				} else {
					alert('승인 실패!');

				}
			},
			error : function() {
				alert("에러입니다");
			}
		});
	};

	function Refusal() {
		var check = [];

		$('input[name="check"]:checked').each(function(e) {
			check.push($(this).val());
		})

		var list = {
			'check' : check
		}

		$.ajax({
			url : 'business_Refusal',
			type : 'post',
			data : list,
			success : function(data) {

				if ($.trim(data) == 0) {
					alert('거부 성공!');
					location.href = 'admin_business_waite';
				} else {
					alert('거부 실패!');

				}
			},
			error : function() {
				alert("에러입니다");
			}
		});
	};
</script>
</head>
<body>
	<section id="admin_business_waite">
		<div class="navi_area">
			<jsp:include page="/WEB-INF/jsp/admin/admin_side.jsp" />
		</div>
		<div class="contents_area">
			<div class="inner">
				<div class="search_area">
					<form>
						<select name="category" id="category">
							<option value="1">기업명</option>
							<option value="2">사업자 번호</option>
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
							<li><input type="checkbox"></li>
							<li>NO</li>
							<li>기업명</li>
							<li>사업자 번호</li>
							<li>신청일</li>
							<li>사업자 등록증</li>
						</ul>

						<c:forEach var="bl" items="${business_list}" varStatus="st">
							<ul>
								<li><input type="checkbox" name="check" value="${bl.idx}"></li>
								<li>${bl.idx}</li>
								<li>${bl.business_name}</li>
								<li>${bl.business_num}</li>
								<li>${bl.sign_date}</li>
								<li><button onclick="onDisplay('${bl.idx}')">보기</button></li>
							</ul>

							<script type="text/javascript">
								function onDisplay(num) {
									$("#display" + num).toggle();
								}
							</script>

							<div id="display${bl.idx}" style="display: none; position: relative;">
								<img alt="" src="${root}/business_img/${bl.img_path}" style="width: 1024px;
								height: auto; position: absolute;">
							</div>
						</c:forEach>
					</div>

					<div class="btn_area">
						<button onclick="Approval()" type="button">승인</button>
						<button onclick="Refusal()" type="button">거부</button>
					</div>
					<div id="paging">
						<c:if test="${paging.startPage != 1 }">
							<a
								href="admin_business_waite?nowPage=${paging.startPage - 1}&cntPerPage=${paging.cntPerPage}&title=${title}&category=${category}">&lt;</a>
						</c:if>
						<c:forEach begin="${paging.startPage}" end="${paging.endPage}"
							var="p">
							<c:choose>
								<c:when test="${p == paging.nowPage}">
									<b>${p}</b>
								</c:when>
								<c:when test="${p != paging.nowPage}">
									<a
										href="admin_business_waite?nowPage=${p}&cntPerPage=${paging.cntPerPage}&title=${title}&category=${category}">${p}</a>
								</c:when>
							</c:choose>
						</c:forEach>
						<c:if test="${paging.endPage != paging.lastPage}">
							<a
								href="admin_business_waite?nowPage=${paging.endPage+1}&cntPerPage=${paging.cntPerPage}&title=${title}&category=${category}">&gt;</a>
						</c:if>
					</div>
				</div>
			</div>
		</div>
	</section>
</body>
</html>