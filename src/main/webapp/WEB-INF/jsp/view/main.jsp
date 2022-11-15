<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>THE MICE</title>
<c:set var="root" value="${pageContext.request.contextPath}" />
<link rel="icon" href="${root}/img/header/logo.svg">
<link rel="stylesheet" href="https://unpkg.com/swiper/swiper-bundle.css" />
<link rel="stylesheet" href="https://unpkg.com/swiper/swiper-bundle.min.css" />
<script src="https://unpkg.com/swiper/swiper-bundle.js"></script>
<script src="https://unpkg.com/swiper/swiper-bundle.min.js"></script>
<link rel="stylesheet" href="${root}/css/view/main/main.css">
<link rel="stylesheet" href="${root}/css/view/main/mobile_main.css">
<link rel="stylesheet" href="${root}/css/view/style.css">
<script type="text/javascript" src="http://code.jquery.com/jquery-1.12.4.min.js"></script>
<script src="http://code.jquery.com/jquery-latest.js"></script>
<meta name="viewport" content="width=device-width, initial-scale=1">
<style type="text/css">
#main #section_1 .background img{
	display: none;
}
/* #footer{ */
/*  	position: absolute; */
/*     bottom: 0; */
/* } */
#section_1 .header_area{
	z-index: 1;
}
</style>
	<script type="text/javascript">
	$(function () {
		var a = '${focus}';
		if(a == 'focus'){
			$('#main').css('transition', 'unset');
			$('#main').css('transform', 'translateY(-200%)');
			$('#mouse_cnt').val(3);
			$('.title_area_2 p:nth-child(1)').css('transform', 'translateX(0)');
			$('.title_area_2 p:nth-child(1)').css('opacity', '1');
			$('.title_area_2 p:nth-child(2)').css('transform', 'translateX(0)');
			$('.title_area_2 p:nth-child(2)').css('opacity', '1');
			$('.title_area_2 .plus_area').css('transform', 'translateX(0)');
			$('.title_area_2 .plus_area').css('opacity', '1');
		};
		
		$("#main").on('mousewheel', function(e) {
			var wheel = e.originalEvent.wheelDelta;
			var cnt = $('#mouse_cnt').val();
			$('#main').css('transition', '2s');
			if (wheel > 0) { //휠 올라감
				if(cnt != 1){
					$('#mouse_cnt').val(Number(cnt) - 1);
					move();
					title_area();
				}
			} else { //휠 내려감
				if(cnt < 4){
					$('#mouse_cnt').val(Number(cnt) + 1);
					move();
					title_area();
				}
			}
		});

		$('#main').on('scroll touchmove mousewheel', function(event) {
			event.preventDefault();
			event.stopPropagation();
			return false;
		});
		
		function move() {
			var cnt = $('#mouse_cnt').val();
			$('#main').css('transition', '2s');
			if(cnt == '1'){
				$('#main').css('transform', 'translateY(0)');
			} else if(cnt == '2'){
				$('#main').css('transform', 'translateY(-100%)');
			}  else if(cnt == '3'){
				$('#main').css('transform', 'translateY(-200%)');
			} else if(cnt == '4'){
				$('#main').css('transform', 'translateY(-300%)');
			}
		};
		
		function title_area() {
			var cnt = $('#mouse_cnt').val();
			$('.title_area p:nth-child(1)').css('transform', 'translateX(-100%)');
			$('.title_area p:nth-child(1)').css('opacity', '0');
			$('.title_area p:nth-child(2)').css('transform', 'translateX(-100%)');
			$('.title_area p:nth-child(2)').css('opacity', '0');
			$('.title_area .plus_area').css('transform', 'translateX(-100%)');
			$('.title_area .plus_area').css('opacity', '0');
			
			$('.title_area_2 p:nth-child(1)').css('transform', 'translateX(100%)');
			$('.title_area_2 p:nth-child(1)').css('opacity', '0');
			$('.title_area_2 p:nth-child(2)').css('transform', 'translateX(100%)');
			$('.title_area_2 p:nth-child(2)').css('opacity', '0');
			$('.title_area_2 .plus_area').css('transform', 'translateX(100%)');
			$('.title_area_2 .plus_area').css('opacity', '0');
			
			if(cnt == '2'){
				$('.title_area_1 p:nth-child(1)').css('transform', 'translateX(0)');
				$('.title_area_1 p:nth-child(1)').css('opacity', '1');
				$('.title_area_1 p:nth-child(2)').css('transform', 'translateX(0)');
				$('.title_area_1 p:nth-child(2)').css('opacity', '1');
				$('.title_area_1 .plus_area').css('transform', 'translateX(0)');
				$('.title_area_1 .plus_area').css('opacity', '1');
			} else if(cnt == '3'){
				$('.title_area_2 p:nth-child(1)').css('transform', 'translateX(0)');
				$('.title_area_2 p:nth-child(1)').css('opacity', '1');
				$('.title_area_2 p:nth-child(2)').css('transform', 'translateX(0)');
				$('.title_area_2 p:nth-child(2)').css('opacity', '1');
				$('.title_area_2 .plus_area').css('transform', 'translateX(0)');
				$('.title_area_2 .plus_area').css('opacity', '1');
			}  else if(cnt == '4'){
				$('.title_area_3 p:nth-child(1)').css('transform', 'translateX(0)');
				$('.title_area_3 p:nth-child(1)').css('opacity', '1');
				$('.title_area_3 p:nth-child(2)').css('transform', 'translateX(0)');
				$('.title_area_3 p:nth-child(2)').css('opacity', '1');
				$('.title_area_3 .plus_area').css('transform', 'translateX(0)');
				$('.title_area_3 .plus_area').css('opacity', '1');
			}
		};
	});
	
	window.onload = function () {
		setTimeout (function () {
			scrollTo(0, 0);
		}, 100);
	};
	</script>
</head>
<body>
	<jsp:include page="/WEB-INF/jsp/aside/quick.jsp" />
	<script type="text/javascript">
		$('.img_area:last-child').click(function () {
			$('#mouse_cnt').val(1);
			$('#main').css('transform', 'translateY(0)');
		});
	</script>
	<div id="main">
		<input type="hidden" id="mouse_cnt" value="1">
		<div id="section_1">
			<div class="header_area">
				<jsp:include page="/WEB-INF/jsp/header/header.jsp" />
			</div>
			<div class="slider_area_1">
				<c:forEach var="list" items="${section_1_list}" varStatus="st">
					<div class="contents_area">
						<div class="img_area">
							<img alt="" src="${root}/advertisement_img/${list.img_path}">
						</div>
						<div class="text_area">
							<span class="main_event_1">${list.sub_title}</span>
							<span class="main_event_2">${list.start_day} ~ ${list.end_day}</span>
							<br>
							<span class="main_event_3">${list.title}</span>
						</div>
					</div>
				</c:forEach>
				<input type="hidden" id="slider_cnt_1" value="1">
			</div>

			<div class="slider_btn_area">
				<div class="main_sub_btn">
					<c:forEach var="i" begin="1" end="${section_1_cnt + 1}">
						<div class="fix_btn" onclick="change(${i})"></div>
					</c:forEach>
					<div class="move_btn"></div>
				</div>
				<div class="main_btn">
					<span class="section_1_left_btn">
						<img alt="" src="${root}/img/main/left_btn_2.svg">
					</span>
					<span class="section_1_right_btn">
						<img alt="" src="${root}/img/main/right_btn_2.svg">
					</span>
				</div>
			</div>

			<script type="text/javascript">
				
				function change(num) {
					
					num = Number(num) - 1;
					
					if(num == 0) {
						num = 1;
					};
					
					$('#slider_cnt_1').val(num);
					
					$('.slider_area_1 .contents_area').css('transition', '1s');
					$('.slider_area_1 .contents_area .img_area').css('transition', '1s');
					$('.slider_area_1 .contents_area .text_area').css('transition', '1s');
					
					$('.slider_area_1 .contents_area').css('opacity', '0');
					$('.slider_area_1 .contents_area .img_area').css('transform', 'scale(1.5)');
					$('.slider_area_1 .contents_area .text_area').css('transform', 'translateY(100px)');
					
					$('.slider_area_1 .contents_area:nth-child(' + num + ')').css('transition', '3s');
					$('.slider_area_1 .contents_area:nth-child(' + num + ') .img_area').css('transition', '3s');
					$('.slider_area_1 .contents_area:nth-child(' + num + ') .text_area').css('transition', '3s');
					
					$('.slider_area_1 .contents_area:nth-child(' + num + ')').css('opacity', '1');
					$('.slider_area_1 .contents_area:nth-child(' + num + ') .img_area').css('transform', 'scale(1)');
					$('.slider_area_1 .contents_area:nth-child(' + num + ') .text_area').css('transform', 'translateY(0)');
					
					$('.move_btn').css('transform', 'translateX(' + 40 * (num - 1) + 'px)');
				};
			
				$(function () {
					
					var width = ${section_1_cnt};
					
					$('.section_1_right_btn').click(function(){
						
						var cnt = $('#slider_cnt_1').val();
						
						$('.slider_area_1 .contents_area').css('transition', '1s');
						$('.slider_area_1 .contents_area .img_area').css('transition', '1s');
						$('.slider_area_1 .contents_area .text_area').css('transition', '1s');
						
						$('.slider_area_1 .contents_area').css('opacity', '0');
						$('.slider_area_1 .contents_area .img_area').css('transform', 'scale(1.5)');
						$('.slider_area_1 .contents_area .text_area').css('transform', 'translateY(100px)');
						
						cnt = Number(cnt) + 1;
						
						if(cnt <= width){
							$('#slider_cnt_1').val(cnt);
							
							$('.slider_area_1 .contents_area:nth-child(' + cnt + ')').css('transition', '3s');
							$('.slider_area_1 .contents_area:nth-child(' + cnt + ') .img_area').css('transition', '3s');
							$('.slider_area_1 .contents_area:nth-child(' + cnt + ') .text_area').css('transition', '3s');
							
							$('.slider_area_1 .contents_area:nth-child(' + cnt + ')').css('opacity', '1');
							$('.slider_area_1 .contents_area:nth-child(' + cnt + ') .img_area').css('transform', 'scale(1)');
							$('.slider_area_1 .contents_area:nth-child(' + cnt + ') .text_area').css('transform', 'translateY(0)');
							
							$('.move_btn').css('transform', 'translateX(' + 40 * (cnt - 1) + 'px)');
						} else {
							$('#slider_cnt_1').val(1);
							
							$('.slider_area_1 .contents_area:nth-child(1)').css('transition', '3s');
							$('.slider_area_1 .contents_area:nth-child(1) .img_area').css('transition', '3s');
							$('.slider_area_1 .contents_area:nth-child(1) .text_area').css('transition', '3s');
							
							$('.slider_area_1 .contents_area:nth-child(1)').css('opacity', '1');
							$('.slider_area_1 .contents_area:nth-child(1) .img_area').css('transform', 'scale(1)');
							$('.slider_area_1 .contents_area:nth-child(1) .text_area').css('transform', 'translateY(0)');
							
							$('.move_btn').css('transform', 'translateX(0)');
						}
					});
					
					$('.section_1_left_btn').click(function(){
						
						var cnt = $('#slider_cnt_1').val();
						
						$('.slider_area_1 .contents_area').css('transition', '1s');
						$('.slider_area_1 .contents_area .img_area').css('transition', '1s');
						$('.slider_area_1 .contents_area .text_area').css('transition', '1s');
						
						$('.slider_area_1 .contents_area').css('opacity', '0');
						$('.slider_area_1 .contents_area .img_area').css('transform', 'scale(1.5)');
						$('.slider_area_1 .contents_area .text_area').css('transform', 'translateY(100px)');
						
						cnt = Number(cnt) - 1;
						
						if(cnt > 0){
							$('#slider_cnt_1').val(cnt);
							
							$('.slider_area_1 .contents_area:nth-child(' + cnt + ')').css('transition', '3s');
							$('.slider_area_1 .contents_area:nth-child(' + cnt + ') .img_area').css('transition', '3s');
							$('.slider_area_1 .contents_area:nth-child(' + cnt + ') .text_area').css('transition', '3s');
							
							$('.slider_area_1 .contents_area:nth-child(' + cnt + ')').css('opacity', '1');
							$('.slider_area_1 .contents_area:nth-child(' + cnt + ') .img_area').css('transform', 'scale(1)');
							$('.slider_area_1 .contents_area:nth-child(' + cnt + ') .text_area').css('transform', 'translateY(0)');
							
							$('.move_btn').css('transform', 'translateX(' + 40 * (cnt - 1) + 'px)');
						} else {
							$('#slider_cnt_1').val(width);
							
							$('.slider_area_1 .contents_area:nth-child(' + width + ')').css('transition', '3s');
							$('.slider_area_1 .contents_area:nth-child(' + width + ') .img_area').css('transition', '3s');
							$('.slider_area_1 .contents_area:nth-child(' + width + ') .text_area').css('transition', '3s');
							                                           
							$('.slider_area_1 .contents_area:nth-child(' + width + ')').css('opacity', '1');
							$('.slider_area_1 .contents_area:nth-child(' + width + ') .img_area').css('transform', 'scale(1)');
							$('.slider_area_1 .contents_area:nth-child(' + width + ') .text_area').css('transform', 'translateY(0)');
							
							$('.move_btn').css('transform', 'translateX(' + 40 * (width - 1) + 'px)');
						}
					});
				});
			</script>
		</div>

		<div id="section_2">
			<div class="container_1">
				<div class="title_area title_area_1">
					<p>
						<span>NEW</span>
					</p>
				</div>
			</div>
	
			<div class="container_2">
				<div class="slider_area_2">
							<c:forEach var="list" items="${section_2_list}" varStatus="st">
								<div class="content_item">
									<div class="img_area">
										<c:if test="${list.layout_type == 0}">
											<c:if test="${list.img_path != null}">
												<img alt="" src="${root}/crawiling_img/${list.img_path}">
											</c:if>
											<c:if test="${list.img_path == null}">
												<img alt="" src="${root}/img/list/non_img.jpg">
											</c:if>
										</c:if>
			
										<c:if test="${list.layout_type != 0}">
											<c:if test="${list.img_path != null}">
												<img alt="" src="${root}/contents_img/${list.img_path}">
											</c:if>
											<c:if test="${list.img_path == null}">
												<img alt="" src="${root}/img/list/non_img.jpg">
											</c:if>
										</c:if>
										<div id="inner_content">
											<div class="content_title_area">${list.title}</div>
						
											<div class="date_area">${list.start_day}&nbsp;~&nbsp;${list.end_day}</div>
						
											<div class="btn_area">
												<a href="detail?contents_idx=${list.idx}">상세보기</a>
												<c:if test="${list.layout_type != 0}">
													<a href="website?contents_idx=${list.idx}" target="_blank">사이트바로가기</a>
												</c:if>
												<c:if test="${list.layout_type == 0}">
													<a href="${list.web_address}" target="_blank">사이트바로가기</a>
												</c:if>
											</div>
										</div>
									</div>
								</div>
							</c:forEach>
					<input type="hidden" id="slider_cnt_2" value="1">
				</div>
			</div>
			
			<div class="section_2_btn_area">
				<div class="section_2_left_btn">
					<span><img alt="" src="${root}/img/main/right_btn_1.svg"></span>
				</div>
				<p></p>
				<div class="section_2_right_btn">
					<span><img alt="" src="${root}/img/main/right_btn_1.svg"></span>
				</div>
			</div>
			
			<script type="text/javascript">
			$(function () {
				$('.section_2_right_btn').click(function(){
					var cnt = $('#slider_cnt_2').val();
					
					if(cnt < 3){
						$('.slider_area_2').css('transform', 'translateX(-' + Number(cnt) * 20 + '%)');
						$('#slider_cnt_2').val(Number(cnt) + 1);
					} else {
						$('.slider_area_2').css('transform', 'translateX(0)');
						$('#slider_cnt_2').val(1);
					}
				});
				
				$('.section_2_left_btn').click(function(){
					var cnt = $('#slider_cnt_2').val();
					cnt = Number(cnt) - 1;
					
					if(cnt > 0){
						$('.slider_area_2').css('transform', 'translateX(-' + (Number(cnt) - 1) * 20 + '%)');
						$('#slider_cnt_2').val(cnt);
					} else {
						$('.slider_area_2').css('transform', 'translateX(-60%)');
						$('#slider_cnt_2').val(3);
					}
				});
			});
			</script>
		</div>

		<div id="section_3">
			<div class="container_1">
				<form id="form_item" method="get">
					<div class="date_area">
						<div id="top_date">
							<div class="date_img">
								<img src="${root}/img/list/icon_date01.svg">
								<span>월간일정</span>
							</div>
							<div class="year_item">
								<select id="year_select" name=year>
									<c:forEach var="i" begin="2010" end="${end_year}">
										<option value="${i}">${i}</option>
									</c:forEach>
								</select>
								<script type="text/javascript">
									$(function () {
										var year = ${year};
										$('#year_select').val(year).prop('selected', true);
									});
								</script>
							</div>
		
							<div class="month_item">
								<c:forEach var="i" begin="1" end="12">
									<c:if test="${i lt 10}"><c:set var="i" value="0${i}"></c:set></c:if>
									<input type="radio" name="month" value="${i}" id="month_${i}">
									<label for="month_${i}">${i}월</label>
								</c:forEach>
							</div>
		
							<script type="text/javascript">
								$(function () {
									var month = '${month}';
									console.log(month);
									if(month == '') {
										
									} else {
										
									}
									
									$('#month_' + month).prop('checked', true); 
									$('input[type=radio][name=month]').change(function () {
										$('#form_item').submit();
									});
								});
							</script>
						</div>
					</div>
	
					<div class="slider_area_3">
						<div class="slider">
							<c:if test="${section_3_cnt == 0}">
								<span id="non_data">검색하신 결과가 없습니다.</span>
							</c:if>
	
							<c:if test="${section_3_cnt != 0}">
								<c:forEach var="list" items="${section_3_list}" varStatus="st">
									<div class="slider_item">
										<div class="img_area">
											<a href="detail?contents_idx=${list.idx}">
												<c:if test="${list.layout_type == 0}">
													<c:if test="${list.img_path != null}">
														<img alt="" src="${root}/crawiling_img/${list.img_path}">
													</c:if>
													<c:if test="${list.img_path == null}">
														<img alt="" src="${root}/img/list/non_img.jpg">
													</c:if>
												</c:if>
					
												<c:if test="${list.layout_type != 0}">
													<c:if test="${list.img_path != null}">
														<img alt="" src="${root}/contents_img/${list.img_path}">
													</c:if>
													<c:if test="${list.img_path == null}">
														<img alt="" src="${root}/img/list/non_img.jpg">
													</c:if>
												</c:if>
											</a>
										</div>
										<div class="btn_area">
											<span class="content_title_area">${list.title}</span>
											<span class="date_area_2">${list.start_day}&nbsp;~&nbsp;${list.end_day}</span>
											<div>
												<a href="detail?contents_idx=${list.idx}">상세보기</a>
												<c:if test="${list.layout_type != 0}">
													<a href="website?contents_idx=${list.idx}" target="_blank">사이트바로가기</a>
												</c:if>
											</div>
										</div>
									</div>
								</c:forEach>
							</c:if>
	
							<input type="hidden" id="section_3_cnt" value="${section_3_cnt}">
							<input type="hidden" id="slider_cnt_3" value="1">
						</div>
					</div>
	
					<div class="slider_btn_area">
						<div class="section_3_left_btn">
							<span><img alt="" src="${root}/img/main/right_btn_1.svg"></span>
						</div>
						<div class="section_3_right_btn">
							<span><img alt="" src="${root}/img/main/right_btn_1.svg"></span>
						</div>
					</div>
	
					<script type="text/javascript">
						$(function () {
							
							var cnt = ${section_3_cnt};
							console.log(cnt);
							$('.slider').css('width', 30 * Number(cnt) + '%');
							
							$('.section_3_right_btn').click(function(){
								var cnt = $('#section_3_cnt').val();
								var end = Number(cnt) - 2;
								var slider_cnt_3 = $('#slider_cnt_3').val();
								
								if(cnt > 3 && slider_cnt_3 <= end){
									$('#slider_cnt_3').val(Number(slider_cnt_3));
									var val = -100 / Number(cnt) * Number(slider_cnt_3);
									$('.slider').css('transform', 'translateX(calc(' + val + '%))');
								} else if(cnt > 3 && slider_cnt_3 > end){
									$('#slider_cnt_3').val(1);
									$('.slider').css('transform', 'translateX(0)');
								}
							});
							
							$('.section_3_left_btn').click(function(){
								var cnt = $('#section_3_cnt').val();
								var end = Number(cnt) - 2;
								var slider_cnt_3 = $('#slider_cnt_3').val();
								
								if(cnt > 3 && slider_cnt_3 > 1){
									$('#slider_cnt_3').val(Number(slider_cnt_3));
									var val = -100 / Number(cnt) * (Number(slider_cnt_3) - 1);
									$('.slider').css('transform', 'translateX(calc(' + val + '%))');
								} else if(cnt > 3 && slider_cnt_3 == 1){
									$('#slider_cnt_3').val(end);
									var val = -100 / Number(cnt) * Number(end);
									$('.slider').css('transform', 'translateX(calc(' + val + '%))');
								}
							});
						});
					</script>
				</form>
			</div>
		</div>
		
		<div id="section_4">
			<div class="notice_area" style="background-image: url('${root}/img/main/main_notice_2.svg');">
				<div class="container_1">
					<div class="title_area title_area_3">
						<p>
							공지사항
						</p>
						<p>
							행사에 관련된 중요한 공지사항, 뉴스, 입찰정보를<br>
							최신 순으로 보여드려요.
						</p>
						<img alt="" src="${root}/img/main/title_background.svg" class="section_3_background_img">
						
						<div class="plus_area">
							<a href="notice_list">더보기&nbsp;&nbsp;<img alt="" src="${root}/img/main/arrow_icon.svg"></a>
						</div>
					</div>
				</div>
				
				<div class="container_2">
					<div class="img_area">
						<img alt="" src="${root}/img/main/main_notice_1.png">
						
						<div class="text_area">
							<div class="text_item_1">
								<span>THE MICE</span>
								<div class="line_area"></div>
							</div>
							<div class="text_item_2">
								<span>다양한 전시를 편리하게 보여드리겠습니다.</span>
							</div>
							<div class="btn_area">
								<a href="notice_list">공지사항 더보기</a>
								<a href="list">전시일정 바로가기</a>
							</div>
						</div>
					</div>
				</div>
			</div>

			<div class="footer_area">
				<jsp:include page="/WEB-INF/jsp/footer/footer.jsp" />
			</div>
		</div>
	</div>
		
	<div id="mobile_main">
		<jsp:include page="/WEB-INF/jsp/header/mobile_header.jsp" />
		
		<div id="m_main_section_1">
			<div class="contents_area">
				<div class="m_section_slider">
					<c:forEach var="list" items="${section_1_list}" varStatus="st">
						<div class="content_area">
							<div class="img_area">
								<img alt="" src="${root}/advertisement_img/${list.img_path}">
							</div>
							<div class="text_area">
								<span class="main_event_1">${list.sub_title}</span>
								<span class="main_event_2">${list.title}</span>
								<span class="main_event_3">${list.start_day} ~ ${list.end_day}</span>
							</div>
						</div>
					</c:forEach>
					<input type="hidden" id="mobile_slider" value="1">
				</div>
			</div>
			
			<div class="section_1_btn_area">
				<div class="section_1_btn_item">
					<c:forEach var="i" begin="1" end="${section_1_cnt}">
						<div class="base_btn">
							<img alt="" src="${root}/img/main/mobile_section_btn_1.svg">
						</div>
					</c:forEach>
				
					<div class="move_btn_area">
						<img alt="" src="${root}/img/main/mobile_section_btn_2.svg">
					</div>
				</div>
			</div>
			
			<script type="text/javascript">
				$(function () {
					setInterval(function () {
						var mobile_slider = $('#mobile_slider').val();
						var max_cnt = '${section_1_cnt}';
						
						if(mobile_slider == max_cnt){
							$('.m_section_slider').css('transform', 'translateX(0)');
							$('.move_btn_area').css('transform', 'translateX(0)');
							$('#mobile_slider').val(1);
						} else {
							$('.m_section_slider').css('transform', 'translateX(calc(-' + mobile_slider + '00%/' + max_cnt + '))');
							$('.move_btn_area').css('transform', 'translateX(' + Number(mobile_slider) * 60 + 'px)');
							$('#mobile_slider').val(Number(mobile_slider) + 1);
						}
					}, 4000);
				});
			</script>
		</div>
		
		<div id="m_main_section_2">
			<div class="title_area">
				<a href="list"><span>NEW</span>&nbsp;전시</a>
			</div>
			<div class="content_area swiper-container">
				<div class="m_section_2_slider_area swiper-wrapper">
					<c:forEach var="list" items="${m_section_2_list}" varStatus="st">
						<div class="content_item swiper-slide">
							<div class="img_area">
								<a href="detail?contents_idx=${list.idx}">
									<c:if test="${list.layout_type == 0}">
										<c:if test="${list.img_path != null}">
											<img alt="" src="${root}/crawiling_img/${list.img_path}">
										</c:if>
										<c:if test="${list.img_path == null}">
											<img alt="" src="${root}/img/list/non_img.jpg">
										</c:if>
									</c:if>
									
									<c:if test="${list.layout_type != 0}">
										<c:if test="${list.img_path != null}">
											<img alt="" src="${root}/contents_img/${list.img_path}">
										</c:if>
										<c:if test="${list.img_path == null}">
											<img alt="" src="${root}/img/list/non_img.jpg">
										</c:if>
									</c:if>
								</a>
							</div>
							
							<div class="text_area">
								<a href="detail?contents_idx=${list.idx}"><span>${list.title}</span></a>
								<a href="detail?contents_idx=${list.idx}"><span id="price_${list.idx}"></span></a>
								
								<script type="text/javascript">
									$(function () {
										var string = '${list.price}';
										var crawling = '${list.crawling_num}'
										
										if(crawling == 0){
											var strArray = string.split(',');
											var price = '';
											
											if(strArray[0] != 'null'){
												price = '성인 : ' + strArray[0] + '원';
											}
											
											if(price == ''){
												$('#price_' + ${list.idx}).text('무료');
											} else {
												$('#price_' + ${list.idx}).text(price);
											}
										} else {
											$('#price_' + ${list.idx}).text(string);
										}
									});
								</script>
							</div>
						</div>
					</c:forEach>
				</div>
			</div>
			
			<script type="text/javascript">
				const swiper = new Swiper('.swiper-container', {
					//기본 셋팅 //방향 셋팅 vertical 수직, horizontal 수평 설정이 없으면 수평
					direction: 'horizontal', //한번에 보여지는 페이지 숫자
					slidesPerView: 3, //페이지와 페이지 사이의 간격
					spaceBetween: 10, //드레그 기능 true 사용가능 false 사용불가
					debugger: true, //마우스 휠기능 true 사용가능 false 사용불가
					mousewheel: true, //반복 기능 true 사용가능 false 사용불가
					loop: true, //선택된 슬라이드를 중심으로 true 사용가능 false 사용불가 djqt
					centeredSlides: true, // 페이지 전환효과 slidesPerView효과와 같이 사용 불가 //
				});
			</script>
		</div>
		
		<div id="m_main_section_3">
			<div class="title_area">
				<a href="list"><span>Best</span>&nbsp;전시</a>
			</div>
			
			<div class="content_area">
				<c:forEach var="list" items="${m_section_3_list}" varStatus="st">
					<div class="content_item">
						<div class="img_area">
							<a href="detail?contents_idx=${list.idx}">
								<c:if test="${list.layout_type == 0}">
									<c:if test="${list.img_path != null}">
										<img alt="" src="${root}/crawiling_img/${list.img_path}">
									</c:if>
									<c:if test="${list.img_path == null}">
										<img alt="" src="${root}/img/list/non_img.jpg">
									</c:if>
								</c:if>
	
								<c:if test="${list.layout_type != 0}">
									<c:if test="${list.img_path != null}">
										<img alt="" src="${root}/contents_img/${list.img_path}">
									</c:if>
									<c:if test="${list.img_path == null}">
										<img alt="" src="${root}/img/list/non_img.jpg">
									</c:if>
								</c:if>
							</a>
						</div>
						
						<div class="text_area">
							<div class="text_item_1">
								<span>${list.exhn_type}</span>
							</div>
							<div class="text_item_2">
								<a href="detail?contents_idx=${list.idx}">${list.title}</a>
							</div>
							<div class="text_item_3">
								<div class="score_area">
									<img src="${root}/img/comment/star_color_icon.svg"><span>${list.grade}</span>
								</div>
								<div class="price_area">
									<span id="section_3_price_${list.idx}"></span>
									
									<script type="text/javascript">
										$(function () {
											var string = '${list.price}';
											var crawling = '${list.crawling_num}'
											
											if(crawling == 0){
												var strArray = string.split(',');
												var price = '';
												
												if(strArray[0] != 'null'){
													price = '성인 : ' + strArray[0] + '원';
												}
												
												if(price == ''){
													$('#section_3_price_' + ${list.idx}).text('무료');
												} else {
													$('#section_3_price_' + ${list.idx}).text(price);
												}
											} else {
												$('#section_3_price_' + ${list.idx}).text(string);
											}
										});
									</script>
								</div>
							</div>
						</div>
					</div>
				</c:forEach>
				
				<div class="more_area">
					<a href="list">전시 전체보기<img alt="" src="${root}/img/main/right_arrow.svg"></a>
				</div>
			</div>
		</div>
	</div>
	
	<footer id="mobile_footer">
		<div class="footer_item">
			<span>더웰소개</span>
			<span>찾아오시는길</span>
			<span>개인정보취급방침</span>
		</div>
		
		<div class="footer_item">
			<span>부산광역시 해운대구 수영강변대로 140(문화컨텐츠 컴플렉스 612호)</span>
			<span>직업정보제공사업 신고번호 : 부산동부 제 2019-6호</span>
			<span>사업자 신고번호 : B18-148346</span>
		</div>
	</footer>
	
	<jsp:include page="/WEB-INF/jsp/footer/mobile_footer.jsp" />
	
</body>
</html>