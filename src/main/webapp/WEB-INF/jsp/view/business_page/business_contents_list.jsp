<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<c:set var="root" value="${pageContext.request.contextPath}" />
<link rel="stylesheet" href="${root}/css/view/style.css">
<link rel="stylesheet" href="${root}/css/view/mypage/mypage.css">
<link rel="stylesheet" href="${root}/css/view/list/list.css">
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link
	href="https://fonts.googleapis.com/css2?family=Nanum+Gothic:wght@400;700;800&display=swap"
	rel="stylesheet">
<script type="text/javascript"
	src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script src="${root}/js/map.js"></script>
<title>THE MICE</title>
<link rel="icon" href="${root}/img/common/favicon.svg">
<style type="text/css">
input[type="date"]::-webkit-calendar-picker-indicator {
	background-image: url('${root}/img/list/input_arrow.svg');
	background-size: 17px;
	background-position: center;
	cursor: pointer;
}
</style>
</head>
<body>

	<jsp:include page="/WEB-INF/jsp/header/header.jsp" />
	<div class="header">
		<div class="title">
			<span>마이페이지</span>
		</div>
	</div>
	<div id="navi_area">
		<nav>
			<ul>
				<li><a href="main"> <img alt=""
						src="${root}/img/member_page/home_icon.svg">
				</a></li>

				<li><a href="#">전시</a></li>
				<li><select onchange="window.location.href=this.value">
						<!-- <option value="business_info">회원정보 수정</option> -->
						<option value="login_check">회원정보 수정</option>
						<option value="business_contents_list" selected="selected">내 전시 리스트</option>
						<option value="business_payment">결제 내역</option>
						<option value="business_password_update">비밀번호 수정</option>
						<option value="business_secession">회원 탈퇴</option>
				</select></li>
			</ul>
		</nav>
	</div>

	<section id="list">
		<div class="category">
			<ul>
				<li><a href="business_contents_list?exhn_type=전체" class="exhn_type_0">전체</a></li>
				<li><a href="business_contents_list?exhn_type=박람회" class="exhn_type_1">박람회</a></li>
				<li><a href="business_contents_list?exhn_type=전시회" class="exhn_type_2">전시회</a></li>
				<li><a href="business_contents_list?exhn_type=페어" class="exhn_type_3">페어</a></li>
				<li><a href="business_contents_list?exhn_type=대제전" class="exhn_type_4">대제전</a></li>
				<li><a href="business_contents_list?exhn_type=행사" class="exhn_type_5">행사</a></li>
			</ul>

			<input type="hidden" name="exhn_type" value="${exhn_type}"
				class="exhn_type">
		</div>

		<script type="text/javascript">
			$(function() {
				var exhn_type = $('.exhn_type').val();
				if (exhn_type == '전체') {
					$('.exhn_type_0').css('font-weight', '700');
				} else if (exhn_type == '박람회') {
					$('.exhn_type_1').css('font-weight', '700');
				} else if (exhn_type == '전시회') {
					$('.exhn_type_2').css('font-weight', '700');
				} else if (exhn_type == '페어') {
					$('.exhn_type_3').css('font-weight', '700');
				} else if (exhn_type == '대제전') {
					$('.exhn_type_4').css('font-weight', '700');
				} else if (exhn_type == '행사') {
					$('.exhn_type_5').css('font-weight', '700');
				}
			});
		</script>

		<div class="search">
			<form method="post" action="business_contents_list">
				<div>
					<img src="${root}/img/list/star_icon_color.svg">
					<c:if test="${title == null}">
						<input type="text" placeholder="행사명을 입력하세요." name="title">
					</c:if>
					<c:if test="${title != null}">
						<input type="text" placeholder="행사명을 입력하세요." name="title"
							value="${title}">
					</c:if>
					<input type="submit" id="search_submit">
					<label>
						<img src="${root}/img/list/search.svg" id="search_submit_btn">
					</label>
				</div>
				<div>
					<img src="${root}/img/list/calender_icon.svg"> <input
						type="date" name="day" id="now_date" value="${day}">
				</div>
			</form>
		</div>
		<script type="text/javascript">
			$(function name() {
				$('#now_date').change(function() {
					var day = $('#now_date').val();

					$('.term_0').attr('href', 'business_contents_list?term=0&exhn_type=${exhn_type}&title=${title}&day=' + day);
					$('.term_1').attr('href', 'business_contents_list?term=1&exhn_type=${exhn_type}&title=${title}&day=' + day);
					$('.term_2').attr('href', 'business_contents_list?term=2&exhn_type=${exhn_type}&title=${title}&day=' + day);

					$('.paging_0').attr('href', 'business_contents_list?nowPage=${paging.startPage - 1}&cntPerPage=${paging.cntPerPage}&exhn_type=${exhn_type}&title=${title}&term=${term}&day=' + day);
					$('.paging_1').attr('href', 'business_contents_list?nowPage=${p}&cntPerPage=${paging.cntPerPage}&exhn_type=${exhn_type}&title=${title}&term=${term}&day=' + day);
					$('.paging_2').attr('href', 'business_contents_list?nowPage=${paging.endPage+1}&cntPerPage=${paging.cntPerPage}&exhn_type=${exhn_type}&title=${title}&term=${term}&day=' + day);
				})
				
				$('#search_submit_btn').click(function(){
					var title = $('input[name=title]').val();
					
					if(title == null || title == ''){
						alert('검색어를 입력해주세요.');
						$('input[name=title]').focus();
						return false;
					} else {
						$('form').submit();
					}
				});
			});
		</script>
		<div class="contents_category">
			<a
				href="business_contents_list?term=0&exhn_type=${exhn_type}&day=${day}&title=${title}"
				class="term_0">전체 일정</a> <a
				href="business_contents_list?term=1&exhn_type=${exhn_type}&day=${day}&title=${title}"
				class="term_0">진행 일정</a> <a
				href="business_contents_list?term=2&exhn_type=${exhn_type}&day=${day}&title=${title}"
				class="term_0">지난 일정</a> <input type="hidden" name="term"
				value="${term}">
		</div>

		<div class="contents">
			<ul class="contents_item">
				<c:forEach var="l" items="${list}" varStatus="st">
					<li class="content">
						<div class="content_img">
							<c:if test="${l.layout_type == 0}">
								<c:if test="${l.img_path != null}">
									<img alt="" src="${root}/crawiling_img/${l.img_path}">
								</c:if>
								<c:if test="${l.img_path == null}">
									<img alt="" src="${root}/img/list/non_img.jpg">
								</c:if>
							</c:if>

							<c:if test="${l.layout_type != 0}">
								<c:if test="${l.img_path != null}">
									<img alt="" src="${root}/contents_img/${l.img_path}">
								</c:if>
								<c:if test="${l.img_path == null}">
									<img alt="" src="${root}/img/list/non_img.jpg">
								</c:if>
							</c:if>
						</div>
						<div class="content_info">
							<div class="content_info_text">
								<c:if test="${l.exhn_type != null}">
									<span>${l.exhn_type}</span>
								</c:if>
								<ul>
									<li><h2>${l.title}</h2></li>
									<li>장소 | <c:if test="${l.web_address == ''}">${l.address}</c:if> <c:if test="${l.web_address != ''}">${l.web_address}</c:if></li>
									<li>기간 | ${l.start_day} ~ ${l.end_day}</li>
									<li>시간 | ${l.start_time} ~ ${l.end_time}</li>
									<li>관람료 | <span id="price_${l.idx}"></span>
									
									<script type="text/javascript">
										$(function () {
											var string = '${l.price}';
											var crawling = '${l.crawling_num}'
											
											if(crawling == 0){
												var strArray = string.split(',');
												var price = '';
												
												if(strArray[0] != 'null'){
													price = '성인 : ' + strArray[0] + '원';
												} if(strArray[1] != 'null'){
													price = price + '/ 중,고등학생 : ' + strArray[1] + '원';
												} if(strArray[2] != 'null'){
													price = price + '/ 초등학생 : ' + strArray[2] + '원';
												} if(strArray[3] != 'null'){
													price = pirce + '/ 아동 : ' + strArray[3] + '원';
												}
												
												if(price == ''){
													$('#price_' + ${l.idx}).text('무료');
												} else {
													$('#price_' + ${l.idx}).text(price);
												}
											} else {
												$('#price_' + ${l.idx}).text(string);
											}
										});
									</script>
								</ul>
							</div>
							<div class="content_info_link" style="width: 170px;">
								<a href="detail?contents_idx=${l.idx}" style="padding: 0.5% 10px;">자세히 보기</a>
								<a href="contents_update?contents_idx=${l.idx}" style="padding: 0.5% 10px; width: 50px;">수정</a>
							</div>
						</div>
					</li>
				</c:forEach>
			</ul>
		</div>
	</section>
	<div class="paging">
		<c:if test="${paging.startPage != 1 }">
			<a href="business_contents_list?nowPage=${paging.startPage - 1}&cntPerPage=${paging.cntPerPage}&exhn_type=${exhn_type}&term=${term}&day=${day}&title=${title}"
				class="paging_0">&lt;</a>
		</c:if>
		<c:forEach begin="${paging.startPage}" end="${paging.endPage}" var="p">
			<c:choose>
				<c:when test="${p == paging.nowPage}">
					<p>${p}</p>
				</c:when>
				<c:when test="${p != paging.nowPage}">
					<a
						href="business_contents_list?nowPage=${p}&cntPerPage=${paging.cntPerPage}&exhn_type=${exhn_type}&term=${term}&day=${day}&title=${title}"
						class="paging_1">${p}</a>
				</c:when>
			</c:choose>
		</c:forEach>
		<c:if test="${paging.endPage != paging.lastPage}">
			<a
				href="business_contents_list?nowPage=${paging.endPage+1}&cntPerPage=${paging.cntPerPage}&exhn_type=${exhn_type}&term=${term}&day=${day}&title=${title}"
				class="paging_2">&gt;</a>
		</c:if>
	</div>

	<jsp:include page="/WEB-INF/jsp/footer/footer.jsp" />
</body>
</html>