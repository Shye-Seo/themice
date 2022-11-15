<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<c:set var="root" value="${pageContext.request.contextPath}" />
<title>THE MICE</title>
<link rel="icon" href="${root}/img/common/favicon.svg">
<link rel="stylesheet" href="${root}/css/view/list/list.css">
<link rel="stylesheet" href="${root}/css/view/list/mobile_list.css">
<link rel="stylesheet" href="${root}/css/view/style.css">
<meta name="viewport" content="width=device-width, initial-scale=1">
<script type="text/javascript"
	src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
<style type="text/css">
@import
	url('https://cdn.rawgit.com/moonspam/NanumSquare/master/nanumsquare.css')
	;

@font-face {
	font-family: 'SF_HambakSnow';
	src:
		url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2106@1.1/SF_HambakSnow.woff')
		format('woff');
	font-weight: normal;
	font-style: normal;
}

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
	
	<jsp:include page="/WEB-INF/jsp/aside/quick.jsp" />
	
	<div class="header">
		<div class="title">
			<span>전시</span>
		</div>
	</div>
	<section id="list">
		<div class="contents_category">
			<a href="list?term=0&exhn_type=${exhn_type}&day=${day}&title=${title}" class="term_0">전체 일정</a>
			<a href="list?term=1&exhn_type=${exhn_type}&day=${day}&title=${title}" class="term_0">현재 일정</a>
			<a href="list?term=2&exhn_type=${exhn_type}&day=${day}&title=${title}" class="term_0">지난 일정</a>
			<input type="hidden" name="term" value="${term}">
		</div>
		<div class="category">
			<ul>
				<li class="exhn_type_0"><a href="list?exhn_type=전체">전체</a></li>
				<li class="exhn_type_1"><a href="list?exhn_type=박람회">박람회</a></li>
				<li class="exhn_type_2"><a href="list?exhn_type=전시회">전시회</a></li>
				<li class="exhn_type_3"><a href="list?exhn_type=페어">페어</a></li>
				<li class="exhn_type_4"><a href="list?exhn_type=대제전">대제전</a></li>
				<li class="exhn_type_5" style="margin-right: 0"><a href="list?exhn_type=행사">행사</a></li>
			</ul>
			
			<input type="hidden" name="exhn_type" value="${exhn_type}" class="exhn_type">
		</div>
<%-- 		<div><input type="text" value="${total }"></div> --%>
		<script type="text/javascript">
			$(function() {
				var exhn_type = $('.exhn_type').val();
				if (exhn_type == '전체') {
					$('.exhn_type_0').css('font-weight', '700');
					$('.exhn_type_0 a').css('color', '#FFFFFF');
					$('.exhn_type_0').css('background-color', '#292929');
					$('.exhn_type_0').css('border', '1px solid #292929');
				} else if (exhn_type == '박람회') {
					$('.exhn_type_1').css('font-weight', '700');
					$('.exhn_type_1 a').css('color', '#FFFFFF');
					$('.exhn_type_1').css('background-color', '#65B99B');
					$('.exhn_type_1').css('border', '1px solid #65B99B');
				} else if (exhn_type == '전시회') {
					$('.exhn_type_2').css('font-weight', '700');
					$('.exhn_type_2 a').css('color', '#FFFFFF');
					$('.exhn_type_2').css('background-color', '#6CB5E2');
					$('.exhn_type_2').css('border', '1px solid #6CB5E2');
				} else if (exhn_type == '페어') {
					$('.exhn_type_3').css('font-weight', '700');
					$('.exhn_type_3 a').css('color', '#FFFFFF');
					$('.exhn_type_3').css('background-color', '#A645AA');
					$('.exhn_type_3').css('border', '1px solid #A645AA');
				} else if (exhn_type == '대제전') {
					$('.exhn_type_4').css('font-weight', '700');
					$('.exhn_type_4 a').css('color', '#FFFFFF');
					$('.exhn_type_4').css('background-color', '#FCB800');
					$('.exhn_type_4').css('border', '1px solid #FCB800');
				} else if (exhn_type == '행사') {
					$('.exhn_type_5').css('font-weight', '700');
					$('.exhn_type_5 a').css('color', '#FFFFFF');
					$('.exhn_type_5').css('background-color', '#E6648C');
					$('.exhn_type_5').css('border', '1px solid #E6648C');
				}
			});
		</script>

		<div class="search">
			<form method="post" action="list" name="form">
				<div>
					<img src="${root}/img/list/icon_star.svg">
					<c:if test="${title == null}">
						<input type="text" placeholder="행사명을 입력하세요." name="title">
					</c:if>
					<c:if test="${title != null}">
						<input type="text" placeholder="행사명을 입력하세요." name="title" value="${title}">
					</c:if>
					<input type="submit" id="search_submit">
					<label>
						<img src="${root}/img/list/search.svg" id="search_submit_btn">
					</label>
				</div>
				<div>
					<img src="${root}/img/list/icon_date02.svg">
					<input type="date" name="day" id="now_date" value="${day}">
				</div>
			</form>
		</div>
		<script type="text/javascript">
			$(function name() {
				$('#now_date').change(function(){
					var day = $('#now_date').val();
					
					$('.term_0').attr('href', 'list?term=0&exhn_type=${exhn_type}&title=${title}&day=' + day);
					$('.term_1').attr('href', 'list?term=1&exhn_type=${exhn_type}&title=${title}&day=' + day);
					$('.term_2').attr('href', 'list?term=2&exhn_type=${exhn_type}&title=${title}&day=' + day);
					
					$('.paging_0').attr('href', 'list?nowPage=${paging.startPage - 1}&cntPerPage=${paging.cntPerPage}&exhn_type=${exhn_type}&title=${title}&term=${term}&day=' + day);
					$('.paging_1').attr('href', 'list?nowPage=${p}&cntPerPage=${paging.cntPerPage}&exhn_type=${exhn_type}&title=${title}&term=${term}&day=' + day);
					$('.paging_2').attr('href', 'list?nowPage=${paging.endPage+1}&cntPerPage=${paging.cntPerPage}&exhn_type=${exhn_type}&title=${title}&term=${term}&day=' + day);
				})
				
				$('#search_submit_btn').click(function(){
					var title = $('input[name=title]').val();
					
					if(title == null || title == ''){
						alert('검색어를 입력해주세요.');
						$('input[name=title]').focus();
						return false;
					} else {
						$('form[name=form]').submit();
					}
				});
			});
		</script>
		<c:if test="${total == 0}">
			<div class="none"><div>검색 결과가 없습니다.</div></div>
		</c:if>
		<c:if test="${total != 0 }">
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
									<span class="top_category" style="
																<c:if test="${l.exhn_type eq '박람회'}">background-color: #65B99B;</c:if>
																<c:if test="${l.exhn_type eq '전시회'}">background-color: #6CB5E2;</c:if>
																<c:if test="${l.exhn_type eq '페어'}">background-color: #A645AA;</c:if>
																<c:if test="${l.exhn_type eq '대제전'}">background-color: #FCB800;</c:if>
																<c:if test="${l.exhn_type eq '행사'}">background-color: #E6648C;</c:if>
																">
										${l.exhn_type}
									</span>
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
													price = price + '/ 아동 : ' + strArray[3] + '원';
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
									</li>
									<li class="score_area">
										<c:if test="${l.grade != null}">
											<span>평점&nbsp;|&nbsp;</span>
											<c:forEach var="i" begin="1" end="${l.grade}">
												<img src="${root}/img/comment/star_color_icon.svg">
											</c:forEach>
											<c:forEach var="i" begin="${l.grade}" end="4">
												<img src="${root}/img/comment/star_non_color_icon.svg">
											</c:forEach>
										</c:if>
										
										<c:if test="${l.grade == null}">
											<span>평점&nbsp;|&nbsp;</span>
											
											<c:forEach var="i" begin="0" end="4">
												<img src="${root}/img/comment/star_non_color_icon.svg">
											</c:forEach>
										</c:if>
									</li>
								</ul>
								
								<span class="views">조회수&nbsp;:&nbsp;${l.views}</span>
							</div>
							<div class="content_info_link">
								<a href="detail?contents_idx=${l.idx}">상세보기</a>
								<a href="website?contents_idx=${l.idx}" target="_blank">사이트가기</a>
								<c:if test="${mv.id ne null}">
									<a href="payment_page?contents_idx=${l.idx}" onClick="window.open(this.href,'_blank','width=1130, height=850'); return false">예매하기</a> 
								</c:if>
								<c:if test="${mv.id eq null}">
									<a href="javascript:alert('개인 회원으로 로그인해주세요.');">예매하기</a> 
								</c:if>
								<!--  
								<input type="button" value="예매하기" onclick="payment('${root}')">
								<script type="text/javascript">
									function payment(root) {
										$.ajax({
											url : 'payment_check',
											type : 'post',
											success : function(data) {
												if ($.trim(data) == 0) {
													alert('일반회원 로그인을 해주세요.')
												} else {
													var _width = '1130';
												    var _height = '800';
									
													var _left = Math.ceil(( window.screen.width - _width )/2);
												    var _top = Math.ceil(( window.screen.height - _height )/2); 
													console.log(${l.idx});
													let url = root + "/payment_page?contents_idx=${l.idx}";
													window.open(url, "", "width=1130, height=850,left=" + _left +", top=" + _top);
												}
											},
											error : function() {
												alert("로그인을 해주세요.");
											}
										});
									}
								</script>
								-->
							</div>
						</div>
					</li>
				</c:forEach>
			</ul>
		</div>
		</c:if>
		<div class="paging">
			<c:if test="${paging.startPage != 1 }">
				<a href="list?nowPage=${paging.startPage - 1}&cntPerPage=${paging.cntPerPage}&exhn_type=${exhn_type}&term=${term}&day=${day}&title=${title}" class="paging_0">&lt;</a>
			</c:if>
			<c:forEach begin="${paging.startPage}" end="${paging.endPage}"
				var="p">
				<c:choose>
					<c:when test="${p == paging.nowPage}">
						<p>${p}</p>
					</c:when>
					<c:when test="${p != paging.nowPage}">
						<a href="list?nowPage=${p}&cntPerPage=${paging.cntPerPage}&exhn_type=${exhn_type}&term=${term}&day=${day}&title=${title}" class="paging_1">${p}</a>
					</c:when>
				</c:choose>
			</c:forEach>
			<c:if test="${paging.endPage != paging.lastPage}">
				<a href="list?nowPage=${paging.endPage+1}&cntPerPage=${paging.cntPerPage}&exhn_type=${exhn_type}&term=${term}&day=${day}&title=${title}" class="paging_2">&gt;</a>
			</c:if>
		</div>
	</section>
	<jsp:include page="/WEB-INF/jsp/footer/footer.jsp" />
	
	<section id="mobile_list">
		<jsp:include page="/WEB-INF/jsp/header/mobile_header.jsp" />
		
		<div class="category_area">
			<a href="list?term=0&exhn_type=${exhn_type}&day=${day}&title=${title}" class="term_0">전체 일정</a>
			<a href="list?term=1&exhn_type=${exhn_type}&day=${day}&title=${title}" class="term_0">현재 일정</a>
			<a href="list?term=2&exhn_type=${exhn_type}&day=${day}&title=${title}" class="term_0">지난 일정</a>
			<input type="hidden" name="term" value="${term}">
		</div>
		
		<div class="exhn_type_area">
			<ul>
				<li class="m_exhn_type_0"><a href="list?exhn_type=전체&term=${term}">전체</a></li>
				<li class="m_exhn_type_1"><a href="list?exhn_type=박람회&term=${term}">박람회</a></li>
				<li class="m_exhn_type_2"><a href="list?exhn_type=전시회&term=${term}">전시회</a></li>
				<li class="m_exhn_type_3"><a href="list?exhn_type=페어&term=${term}">페어</a></li>
				<li class="m_exhn_type_4"><a href="list?exhn_type=대제전&term=${term}">대제전</a></li>
				<li class="m_exhn_type_5"><a href="list?exhn_type=행사&term=${term}">행사</a></li>
			</ul>
			
			<input type="hidden" name="exhn_type" value="${exhn_type}" class="m_exhn_type">
			
			<script type="text/javascript">
				$(function() {
					var exhn_type = $('.m_exhn_type').val();
					
					if (exhn_type == '전체') {
						$('.m_exhn_type_0').css('font-weight', '700');
						$('.m_exhn_type_0').css('border-color', '#EA933C');
						$('.m_exhn_type_0 a').css('color', '#EA933C');
					} else if (exhn_type == '박람회') {
						$('.m_exhn_type_1').css('font-weight', '700');
						$('.m_exhn_type_1').css('border-color', '#EA933C');
						$('.m_exhn_type_1 a').css('color', '#EA933C');
					} else if (exhn_type == '전시회') {
						$('.m_exhn_type_2').css('font-weight', '700');
						$('.m_exhn_type_2').css('border-color', '#EA933C');
						$('.m_exhn_type_2 a').css('color', '#EA933C');
					} else if (exhn_type == '페어') {
						$('.m_exhn_type_3').css('font-weight', '700');
						$('.m_exhn_type_3').css('border-color', '#EA933C');
						$('.m_exhn_type_3 a').css('color', '#EA933C');
					} else if (exhn_type == '대제전') {
						$('.m_exhn_type_4').css('font-weight', '700');
						$('.m_exhn_type_4').css('border-color', '#EA933C');
						$('.m_exhn_type_4 a').css('color', '#EA933C');
					} else if (exhn_type == '행사') {
						$('.m_exhn_type_5').css('font-weight', '700');
						$('.m_exhn_type_5').css('border-color', '#EA933C');
						$('.m_exhn_type_5 a').css('color', '#EA933C');
					}
				});
			</script>
		</div>
		
		<div class="contents_area">
			<c:forEach var="l" items="${m_list}" varStatus="st">
				<div class="content_area">
					<div class="img_area">
						<c:if test="${l.layout_type == 0}">
							<c:if test="${l.img_path != null}">
								<a href="detail?contents_idx=${l.idx}"><img alt="" src="${root}/crawiling_img/${l.img_path}"></a>
							</c:if>
							<c:if test="${l.img_path == null}">
								<a href="detail?contents_idx=${l.idx}"><img alt="" src="${root}/img/list/non_img.jpg"></a>
							</c:if>
						</c:if>

						<c:if test="${l.layout_type != 0}">
							<c:if test="${l.img_path != null}">
								<a href="detail?contents_idx=${l.idx}"><img alt="" src="${root}/contents_img/${l.img_path}"></a>
							</c:if>
							<c:if test="${l.img_path == null}">
								<a href="detail?contents_idx=${l.idx}"><img alt="" src="${root}/img/list/non_img.jpg"></a>
							</c:if>
						</c:if>
					</div>
					
					<div class="text_area">
						<ul>
							<li class="title_area">
								<span><a href="detail?contents_idx=${l.idx}">${l.title}</a></span>
							</li>
							
							<li>
								<span>기간&nbsp;&nbsp;${l.start_day} ~ ${l.end_day}</span>
							</li>
							
							<li>
								<span>장소&nbsp;&nbsp;${l.address}</span>
							</li>
							
							<li class="score_area">
								<c:forEach var="i" begin="0" end="${l.grade}">
									<img src="${root}/img/comment/star_color_icon.svg">
								</c:forEach>
								<c:forEach var="i" begin="${l.grade+1}" end="4">
									<img src="${root}/img/comment/star_non_color_icon.svg">
								</c:forEach>
							</li>
							
							<li class="price_area">
								<span id="m_price_${l.idx}"></span>
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
												price = price + '/ 아동 : ' + strArray[3] + '원';
											}
											
											if(price == ''){
												$('#m_price_' + ${l.idx}).text('무료');
											} else {
												$('#m_price_' + ${l.idx}).text(price);
											}
										} else {
											$('#m_price_' + ${l.idx}).text(string);
										}
									});
								</script>
							</li>
							
							<li>
								<a href="detail?contents_idx=${l.idx}" id="a_detail">자세히보기</a>
							</li>
						</ul>
					</div>
				</div>
			</c:forEach>
		</div>
		
		<jsp:include page="/WEB-INF/jsp/footer/mobile_footer.jsp" />
	</section>
</body>
</html>