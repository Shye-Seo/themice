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
<link rel="stylesheet" href="${root}/css/view/website/website_type_1.css">
<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.8.js"></script>
<script src="https://developers.kakao.com/sdk/js/kakao.js"></script>
<c:if test="${not empty sessionScope.id}">
<script type="text/javascript">
$(function() {
    build();
    $('td').click(function() {
  	 var year = $('#year').val();
  	 var month = $('#month').val();
       var day = $(this).text();
       
       if(month < 10){
      	 month = '0' + month;
       }
       
       if(day < 10){
      	 day = '0' + day;
       }
       
       var entry_date = year + '.' + month + '.' + day
       
       $('#entry_date').val(entry_date);
       
       $('td').css('background-color','unset');
       $(this).css('background-color','#EA933C');
       $('td').css('color','#333333');
       $(this).css('color','white');
    });
 });
 
 var today = new Date();
 var date = new Date();
 
 function beforem()
 {
    today = new Date(today.getFullYear(), today.getMonth() - 1, today.getDate());
    build();
 }
 
 function nextm()
 {
    today = new Date(today.getFullYear(), today.getMonth() + 1, today.getDate());
    build();
 }

 function build() {
       var nMonth = new Date(today.getFullYear(), today.getMonth(), 1);
       var lastDate = new Date(today.getFullYear(), today.getMonth() + 1, 0);
       var tbcal = document.getElementById("calendar");
       var yearmonth = document.getElementById("yearmonth");
       yearmonth.innerHTML = today.getFullYear() + "년 " + (today.getMonth() + 1) + "월";
       
		 $('#year').val(today.getFullYear());
		 $('#month').val((today.getMonth() + 1));
		 
       if (today.getMonth() + 1 == 12)
       {
          before.innerHTML = (today.getMonth()) + "월";
          next.innerHTML = "1월";
       } else if (today.getMonth() + 1 == 1)
       {
          before.innerHTML = "12월";
          next.innerHTML = (today.getMonth() + 2) + "월";
       } else
       {
          before.innerHTML = (today.getMonth()) + "월";
          next.innerHTML = (today.getMonth() + 2) + "월";
       }

       while (tbcal.rows.length > 2) {
          tbcal.deleteRow(tbcal.rows.length - 1);
       }
       var row = null;
       row = tbcal.insertRow();
       var cnt = 0;

       for (i = 0; i < nMonth.getDay(); i++) {
          cell = row.insertCell();
          cnt = cnt + 1;
       }

       for (i = 1; i <= lastDate.getDate(); i++)
       {
          cell = row.insertCell();
          cell.innerHTML = i;
          cnt = cnt + 1;
          if (cnt % 7 == 1) {
             cell.innerHTML = "<font color=#FF9090>" + i
          }
          if (cnt % 7 == 0) {
             cell.innerHTML = "<font color=#7ED5E4>" + i
             row = calendar.insertRow();
          }
          if (today.getFullYear() == date.getFullYear()
                && today.getMonth() == date.getMonth()
                && i == date.getDate()) {
             cell.bgColor = "#EA933C";
             cell.color = "#ffffff";
          }
       }
 }
 
 function requestPay() {
		var sum = $('#sum_val').val();
		
		IMP.init("imp60647438");
		
		console.log(sum);

		IMP.request_pay({
			pg : "html5_inicis",
			pay_method : "card",
			merchant_uid : '${merchant_uid}',
			name : '${content_list.title}',
			amount : sum,
			buyer_email : '${mv.email}',
			buyer_name : '${mv.id}',
			buyer_tel : '${mv.tel}',
			buyer_addr : '${mv.address}'
		}, function(rsp) {
			if (rsp.success) {
				alert('결제완료!');
				location.href = 'payment?imp_uid='+rsp.imp_uid+'&imp_amount='+rsp.paid_amount+'&contents_idx='+${contents_idx};
			} else {
				var msg = '결제에 실패하였습니다.';
				msg += '에러내용 : ' + rsp.error_msg;
			}
		});
	}
</script>
</c:if>
<style type="text/css">
footer{
	display: none;
}
</style>
<c:if test="${pop_up.ratio_1 == 1}">
<style type="text/css">
#pop_up_event_1 {
    width: 400px;
    height: 320px;
    top: 17%;
    left: 3%;
}

@media screen and (max-width: 721px) {
	#pop_up_event_1 {
		width: 100%;
    	height: 30%;
    	top: 78px;
    	left: 0;
	}
}
</style>
</c:if>

<c:if test="${pop_up.ratio_1 == 2}">
<style type="text/css">
#pop_up_event_1 {
    width: 400px;
    height: 530px;
    top: 17%;
    left: 3%;
}

@media screen and (max-width: 721px) {
	#pop_up_event_1 {
		width: 100%;
    	height: 65%;
    	top: 78px;
    	left: 0;
	}
}
</style>
</c:if>

<c:if test="${pop_up.ratio_2 == 1}">
<style type="text/css">
#pop_up_event_2 {
    width: 400px;
    height: 320px;
    top: 17%;
    left: 26%;
}

@media screen and (max-width: 721px) {
	#pop_up_event_2 {
		width: 100%;
    	height: 30%;
    	top: 78px;
    	left: 0;
	}
}
</style>
</c:if>

<c:if test="${pop_up.ratio_2 == 2}">
<style type="text/css">
#pop_up_event_2 {
    width: 400px;
    height: 530px;
    top: 17%;
    left: 26%;
}

@media screen and (max-width: 721px) {
	#pop_up_event_2 {
		width: 100%;
    	height: 65%;
    	top: 78px;
    	left: 0;
	}
}
</style>
</c:if>

<c:if test="${pop_up.ratio_3 == 1}">
<style type="text/css">
#pop_up_event_3 {
    width: 400px;
    height: 320px;
    top: 17%;
    left: 49%;
}

@media screen and (max-width: 721px) {
	#pop_up_event_3 {
		width: 100%;
    	height: 30%;
    	top: 78px;
    	left: 0;
	}
}
</style>
</c:if>

<c:if test="${pop_up.ratio_3 == 2}">
<style type="text/css">
#pop_up_event_3 {
    width: 400px;
    height: 530px;
    top: 17%;
    left: 49%;
}

@media screen and (max-width: 721px) {
	#pop_up_event_3 {
		width: 100%;
    	height: 65%;
    	top: 78px;
    	left: 0;
	}
}
</style>
</c:if>

<style type="text/css">
input[type="date"]::-webkit-calendar-picker-indicator {
	background-image: url('${root}/img/list/input_arrow.svg');
	background-position: center;
	cursor: pointer;
}
</style>
</head>
<body>
	<c:if test="${pop_up_1 == 'check'}">
		<div id="pop_up_event_1" class="pop_up_event">
			<div class="img_area">
				<img alt="" src="${root}/pop_up_path/${pop_up.img_1}">
			</div>
			
			<div class="btn_area">
				<div class="pop_up_close_item">
					<input type="checkbox" id="pop_up_check_1">
					<label for="pop_up_check_1">오늘 하루 열지 않기</label>
				</div>
				
				<div class="pop_up_close_1">
					<img alt="" src="${root}/img/website/pop_up_close.svg">
					<span>닫기</span>
				</div>
				
				<script type="text/javascript">
					$(function () {
						$('#pop_up_check_1').on('click', function() {
							
							var contents_idx = ${contents_idx};
							var this_id = $(this).attr('id');
							var val = contents_idx + '_' + this_id.substr(this_id.length-1, 1);
							
							if($(this).prop('checked')){
								$.ajax({
									url : 'pop_up_open',
									type : 'post',
									data : {
										val : val
									},
									success : function(data) {
										if ($.trim(data) == 0) {
											$('#pop_up_event_1').css('display', 'none');
										}
									},
									error : function() {
										alert("에러입니다");
									}
								});
							}
						})
						$('.pop_up_close_1').click(function () {
							$('#pop_up_event_1').css('display', 'none');
						});
					});
				</script>
			</div>
		</div>
	</c:if>
	
	<c:if test="${pop_up_2 == 'check'}">
		<div id="pop_up_event_2" class="pop_up_event">
			<div class="img_area">
				<img alt="" src="${root}/pop_up_path/${pop_up.img_2}">
			</div>
			
			<div class="btn_area">
				<div class="pop_up_close_item">
					<input type="checkbox" id="pop_up_check_2">
					<label for="pop_up_check_2">오늘 하루 열지 않기</label>
				</div>
				
				<div class="pop_up_close_2">
					<img alt="" src="${root}/img/website/pop_up_close.svg">
					<span>닫기</span>
				</div>
				
				<script type="text/javascript">
					$(function () {
						$('#pop_up_check_2').on('click', function() {
							
							var contents_idx = ${contents_idx};
							var this_id = $(this).attr('id');
							var val = contents_idx + '_' + this_id.substr(this_id.length-1, 1);
							
							if($(this).prop('checked')){
								$.ajax({
									url : 'pop_up_open',
									type : 'post',
									data : {
										val : val
									},
									success : function(data) {
										if ($.trim(data) == 0) {
											$('#pop_up_event_2').css('display', 'none');
										}
									},
									error : function() {
										alert("에러입니다");
									}
								});
							}
						})
						$('.pop_up_close_2').click(function () {
							$('#pop_up_event_2').css('display', 'none');
						});
					});
				</script>
			</div>
		</div>
	</c:if>
	
	<c:if test="${pop_up_3 == 'check'}">
		<div id="pop_up_event_3" class="pop_up_event">
			<div class="img_area">
				<img alt="" src="${root}/pop_up_path/${pop_up.img_3}">
			</div>
			
			<div class="btn_area">
				<div class="pop_up_close_item">
					<input type="checkbox" id="pop_up_check_3">
					<label for="pop_up_check_3">오늘 하루 열지 않기</label>
				</div>
				
				<div class="pop_up_close_3">
					<img alt="" src="${root}/img/website/pop_up_close.svg">
					<span>닫기</span>
				</div>
				
				<script type="text/javascript">
					$(function () {
						$('#pop_up_check_3').on('click', function() {
							
							var contents_idx = ${contents_idx};
							var this_id = $(this).attr('id');
							var val = contents_idx + '_' + this_id.substr(this_id.length-1, 1);
							
							if($(this).prop('checked')){
								$.ajax({
									url : 'pop_up_open',
									type : 'post',
									data : {
										val : val
									},
									success : function(data) {
										if ($.trim(data) == 0) {
											$('#pop_up_event_3').css('display', 'none');
										}
									},
									error : function() {
										alert("에러입니다");
									}
								});
							}
						})
						$('.pop_up_close_3').click(function () {
							$('#pop_up_event_3').css('display', 'none');
						});
					});
				</script>
			</div>
		</div>
	</c:if>
	
	<jsp:include page="/WEB-INF/jsp/view/page_type_1/mobile_header.jsp" />
	
	<div id="section">
		<jsp:include page="/WEB-INF/jsp/view/page_type_1/header.jsp" />
		
		<div id="web_main">
			<div class="img_area">
				<img alt="" src="${root}/web_main_path/${content_list.web_main_name}">
			</div>
			
			<div class="text_area">
				<span>${content_list.title}</span>
				<span>${content_list.start_day}&nbsp;~&nbsp;${content_list.end_day}</span>
			</div>
			
			<div class="detail_btn_area">
				<input type="button" value="자세히 보기" id="web_detail_btn">

				<script type="text/javascript">
					$('#web_detail_btn').click(function () {
						$('#web_detail').css('display', 'block');
						$('#web_main').css('display', 'none');
						
						var introduction = '${web_menu.introduction_seq}';
						var gallery = '${web_menu.gallery_seq}';
						var location = '${web_menu.location_seq}';
						var comment = '${web_menu.comment_seq}';
						var refund = '${web_menu.refund_seq}';
						
						for(var i = 1; i < 6; i++) {
							if(introduction == i) {
								$('.menu_item_lable_' + i).attr('for', 'introduction_btn');
								$('.menu_item_lable_' + i).text('${web_menu.introduction_name}');
								$('.menu_item_lable_' + i).css('display', 'block');
							} else if (introduction == '1') {
								$('#introduction_btn').prop('checked', true);
								$('.introduction_area').css('display', 'block');
								
								$('.menu_item_lable_1').css('border-bottom', 'solid');
							    $('.menu_item_lable_1').css('border-width', '3px');
							    $('.menu_item_lable_1').css('border-color', '#EA933C');
							    $('.menu_item_lable_1').css('color', '#EA933C');
							    $('.menu_item_lable_1').css('font-weight', 'bold');
							}
							
							if(gallery == i) {
								$('.menu_item_lable_' + i).attr('for', 'gallery_btn');
								$('.menu_item_lable_' + i).text('${web_menu.gallery_name}');
								$('.menu_item_lable_' + i).css('display', 'block');
							} else if (gallery == '1') {
								$('#gallery_btn').prop('checked', true);
								$('.gallery_area').css('display', 'block');
								
								$('.menu_item_lable_1').css('border-bottom', 'solid');
							    $('.menu_item_lable_1').css('border-width', '3px');
							    $('.menu_item_lable_1').css('border-color', '#EA933C');
							    $('.menu_item_lable_1').css('color', '#EA933C');
							    $('.menu_item_lable_1').css('font-weight', 'bold');
							}
							
							if(location == i) {
								$('.menu_item_lable_' + i).attr('for', 'place_btn');
								$('.menu_item_lable_' + i).text('${web_menu.location_name}');
								$('.menu_item_lable_' + i).css('display', 'block');
							} else if (location == '1') {
								$('#place_btn').prop('checked', true);
								$('.place_area').css('display', 'block');
								
								$('.menu_item_lable_1').css('border-bottom', 'solid');
							    $('.menu_item_lable_1').css('border-width', '3px');
							    $('.menu_item_lable_1').css('border-color', '#EA933C');
							    $('.menu_item_lable_1').css('color', '#EA933C');
							    $('.menu_item_lable_1').css('font-weight', 'bold');
								
								map.relayout();
				            	map.setCenter(centerNum);
							}
							
							if(comment == i) {
								$('.menu_item_lable_' + i).attr('for', 'comment_btn');
								$('.menu_item_lable_' + i).text('${web_menu.comment_name}');
								$('.menu_item_lable_' + i).css('display', 'block');
							} else if (comment == '1') {
								$('#comment_btn').prop('checked', true);
								$('.comment_area').css('display', 'block');
								
								$('.menu_item_lable_1').css('border-bottom', 'solid');
							    $('.menu_item_lable_1').css('border-width', '3px');
							    $('.menu_item_lable_1').css('border-color', '#EA933C');
							    $('.menu_item_lable_1').css('color', '#EA933C');
							    $('.menu_item_lable_1').css('font-weight', 'bold');
							}
							
							if(refund == i) {
								$('.menu_item_lable_' + i).attr('for', 'refund_btn');
								$('.menu_item_lable_' + i).text('${web_menu.refund_name}');
								$('.menu_item_lable_' + i).css('display', 'block');
							} else if (refund == '1') {
								$('#refund_btn').prop('checked', true);
								$('.refund_area').css('display', 'block');
								
								$('.menu_item_lable_1').css('border-bottom', 'solid');
							    $('.menu_item_lable_1').css('border-width', '3px');
							    $('.menu_item_lable_1').css('border-color', '#EA933C');
							    $('.menu_item_lable_1').css('color', '#EA933C');
							    $('.menu_item_lable_1').css('font-weight', 'bold');
							}
						}
					});
				</script>
			</div>
		</div>
		
		<section id="web_detail">
			<div class="inner">
				<div class="container_1">
					<div class="img_area">
						<img alt="" src="${root}/banner_path/${content_list.banner_name}">
					</div>
					
					<div class="data_area">
						<div class="text_area">
							<span>${content_list.title}</span>
							<span>${content_list.start_day}&nbsp;~&nbsp;${content_list.end_day}</span>
						</div>
						<div class="btn_area">
							<button class="payment_btn" onclick="payment('${root}')">예매하기</button>
						</div>
<!-- 						<input type="date"> -->
<!-- 						<div class="price_area"> -->
<!-- 							<div class="price_title_area"> -->
<!-- 								<span>선택</span> -->
<!-- 							</div> -->
<!-- 							<div class="price_item_0 price_item"> -->
<!-- 								<p>성인 :<span class="price_0"></span>원</p> -->
<!-- 								<div class="cnt_area"> -->
<!-- 									<div> -->
<%-- 										<img alt="" src="${root}/img/website/minus_icon.svg" class="price_minus_0"> --%>
<!-- 										<span class="price_cnt_0">0</span> -->
<%-- 										<img alt="" src="${root}/img/website/plus_icon.svg" class="price_plus_0"> --%>
<!-- 										<span>매</span> -->
<!-- 									</div> -->
<!-- 									<p><span class="sum_0"></span>원</p> -->
<!-- 								</div> -->
<!-- 							</div> -->
							
<!-- 							<div class="price_item_1 price_item"> -->
<!-- 								<p>중,고등학생 :<span class="price_1"></span>원</p> -->
<!-- 								<div class="cnt_area"> -->
<!-- 									<div> -->
<%-- 										<img alt="" src="${root}/img/website/minus_icon.svg" class="price_minus_1"> --%>
<!-- 										<span class="price_cnt_1">0</span> -->
<%-- 										<img alt="" src="${root}/img/website/plus_icon.svg" class="price_plus_1"> --%>
<!-- 										<span>매</span> -->
<!-- 									</div> -->
<!-- 									<p><span class="sum_1"></span>원</p> -->
<!-- 								</div> -->
<!-- 							</div> -->
							
<!-- 							<div class="price_item_2 price_item"> -->
<!-- 								<p>초등학생 :<span class="price_2"></span>원</p> -->
<!-- 								<div class="cnt_area"> -->
<!-- 									<div> -->
<%-- 										<img alt="" src="${root}/img/website/minus_icon.svg" class="price_minus_2"> --%>
<!-- 										<span class="price_cnt_2">0</span> -->
<%-- 										<img alt="" src="${root}/img/website/plus_icon.svg" class="price_plus_2"> --%>
<!-- 										<span>매</span> -->
<!-- 									</div> -->
<!-- 									<p><span class="sum_2"></span>원</p> -->
<!-- 								</div> -->
<!-- 							</div> -->
							
<!-- 							<div class="price_item_3 price_item"> -->
<!-- 								<p>아동 :<span class="price_3"></span>원</p> -->
<!-- 								<div class="cnt_area"> -->
<!-- 									<div> -->
<%-- 										<img alt="" src="${root}/img/website/minus_icon.svg" class="price_minus_3"> --%>
<!-- 										<span class="price_cnt_3">0</span> -->
<%-- 										<img alt="" src="${root}/img/website/plus_icon.svg" class="price_plus_3"> --%>
<!-- 										<span>매</span> -->
<!-- 									</div> -->
<!-- 									<p><span class="sum_3"></span>원</p> -->
<!-- 								</div> -->
<!-- 							</div> -->
							
<!-- 							<div class="total_area"> -->
<!-- 								<p>총 결제 금액 : <span class="total_sum"></span>원</p> -->
<!-- 							</div> -->
<!-- 						</div> -->
						
						<script type="text/javascript">
							$(function () {
								var price = '${content_list.price}';
								var price_array = price.split(',');
								
								if(price_array[0] != 'null'){
									$('.price_item_0').css('display', 'flex');
									$('.price_0').text(price_array[0]);
								} if(price_array[1] != 'null'){
									$('.price_item_1').css('display', 'flex');
									$('.price_1').text(price_array[1]);
								} if(price_array[2] != 'null'){
									$('.price_item_2').css('display', 'flex');
									$('.price_2').text(price_array[2]);
								} if(price_array[3] != 'null'){
									$('.price_item_3').css('display', 'flex');
									$('.price_3').text(price_array[3]);
								} 
								
								else if(price_array[0] == 'null'){
									$('.price_item_0').css('display', 'flex');
									$('.price_0').text(0);
								} if(price_array[1] == 'null'){
									$('.price_item_1').css('display', 'flex');
									$('.price_1').text(0);
								} if(price_array[2] == 'null'){
									$('.price_item_2').css('display', 'flex');
									$('.price_2').text(0);
								} if(price_array[3] == 'null'){
									$('.price_item_3').css('display', 'flex');
									$('.price_3').text(0);
								}
							});
							
							$('.price_plus_0').click(function() {
								var cnt = $('.price_cnt_0').text();
								cnt = Number(cnt) + 1;
								$('.price_cnt_0').text(cnt);
								sum_0();
								sum();
							});
							
							$('.price_minus_0').click(function() {
								var cnt = $('.price_cnt_0').text();
								if(cnt != '0'){
									cnt = Number(cnt) - 1;
									$('.price_cnt_0').text(cnt);
									sum_0();
									sum();
								}
							});
							
							$('.price_plus_1').click(function() {
								var cnt = $('.price_cnt_1').text();
								cnt = Number(cnt) + 1;
								$('.price_cnt_1').text(cnt);
								sum_1();
								sum();
							});
							
							$('.price_minus_1').click(function() {
								var cnt = $('.price_cnt_1').text();
								if(cnt != '0'){
									cnt = Number(cnt) - 1;
									$('.price_cnt_1').text(cnt);
									sum_1();
									sum();
								}
							});
							
							$('.price_plus_2').click(function() {
								var cnt = $('.price_cnt_2').text();
								cnt = Number(cnt) + 1;
								$('.price_cnt_2').text(cnt);
								sum_2();
								sum();
							});
							
							$('.price_minus_2').click(function() {
								var cnt = $('.price_cnt_2').text();
								if(cnt != '0'){
									cnt = Number(cnt) - 1;
									$('.price_cnt_2').text(cnt);
									sum_2();
									sum();
								}
							});
							
							$('.price_plus_3').click(function() {
								var cnt = $('.price_cnt_3').text();
								cnt = Number(cnt) + 1;
								$('.price_cnt_3').text(cnt);
								sum_3();
								sum();
							});
							
							$('.price_minus_3').click(function() {
								var cnt = $('.price_cnt_3').text();
								if(cnt != '0'){
									cnt = Number(cnt) - 1;
									$('.price_cnt_3').text(cnt);
									sum_3();
									sum();
								}
							});
							
							function sum_0() {
								var price_0 = $('.price_0').text();
								var price_cnt_0 = $('.price_cnt_0').text();
								
								var sum_0 = Number(price_0) * Number(price_cnt_0);
								$('.sum_0').text(sum_0);
							};
							
							function sum_1() {
								var price_1 = $('.price_1').text();
								var price_cnt_1 = $('.price_cnt_1').text();
								
								var sum_1 = Number(price_1) * Number(price_cnt_1);
								$('.sum_1').text(sum_1);
							};
							
							function sum_2() {
								var price_2 = $('.price_2').text();
								var price_cnt_2 = $('.price_cnt_2').text();
								
								var sum_2 = Number(price_2) * Number(price_cnt_2);
								$('.sum_2').text(sum_2);
							};
							
							function sum_3() {
								var price_3 = $('.price_3').text();
								var price_cnt_3 = $('.price_cnt_3').text();
								
								var sum_3 = Number(price_3) * Number(price_cnt_3);
								$('.sum_3').text(sum_3);
							};
							
							function sum() {
								var sum_0 = $('.sum_0').text();
								var sum_1 = $('.sum_1').text();
								var sum_2 = $('.sum_2').text();
								var sum_3 = $('.sum_3').text();
								
								var sum = Number(sum_0) + Number(sum_1) + Number(sum_2) + Number(sum_3);
								$('.total_sum').text(sum);
							};
						</script>
						
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
											let url = root + "/payment_page?contents_idx=${contents_idx}";
											window.open(url, "", "width=1130, height=850,left=" + _left +", top=" + _top);
										}
									},
									error : function() {
										alert("로그인을 해주세요.");
									}
								});
							}
						</script>
					</div>
				</div>
				
				<div class="container_2">
					<script type="text/javascript">
						$(document).ready(function() {
							
						});
					</script>
					<div class="menu_item">

						<input type="radio" name="menu_category" id="introduction_btn" value="1" checked="checked">
						<input type="radio" name="menu_category" id="gallery_btn" value="2">
						<input type="radio" name="menu_category" id="place_btn" value="3">
						<input type="radio" name="menu_category" id="comment_btn" value="4">
						<input type="radio" name="menu_category" id="refund_btn" value="5">
						<input type="radio" name="menu_category" id="notice_btn" value="6">

						<label class="menu_item_lable_1"></label>
						<label class="menu_item_lable_2"></label>
						<label class="menu_item_lable_3"></label>
						<label class="menu_item_lable_4"></label>
						<label class="menu_item_lable_5"></label>
						<label class="menu_item_lable_6"></label>
						
						<script type="text/javascript">
							$('.menu_item_1').insertAfter('.menu_item_2');
							
							$('.menu_item label').click(function () {
								 $('.menu_item label').css('border-bottom', 'unset');
							     $('.menu_item label').css('color', '#333333');
							     $('.menu_item label').css('font-weight', 'unset');
							     
							     $(this).css('border-bottom', 'solid');
							     $(this).css('border-width', '3px');
							     $(this).css('border-color', '#EA933C');
							     $(this).css('color', '#EA933C');
							     $(this).css('font-weight', 'bold');
							});
							
							$("input[name='menu_category']:radio").change(function () {
						        var val = this.value;
						        
						        if(val == '1') {
						        	introduction();
						        } else if(val == '2'){
						        	gallery();
						        } else if(val == '3'){
						        	place();
						        } else if(val == '4'){
						        	comment();
						        } else if(val == '5'){
						        	refund();
						        } else if(val == '6'){
						        	notice();
						        }
							});
							
							function introduction() {
								$('#introduction_btn').prop('checked', true);
					        	$('#web_main').css('display', 'none');
					        	$('#web_detail').css('display', 'block');
					        	$('.introduction_area').css('display', 'block');
					        	$('.gallery_area').css('display', 'none');
					        	$('.place_area').css('display', 'none');
					        	$('.comment_area').css('display', 'none');
					        	$('.refund_area').css('display', 'none');
					        	$('.notice_area').css('display', 'none');
							};
							
							function gallery() {
								$('#gallery_btn').prop('checked', true);
					        	$('#web_main').css('display', 'none');
					        	$('#web_detail').css('display', 'block');
					        	$('.introduction_area').css('display', 'none');
					        	$('.gallery_area').css('display', 'block');
					        	$('.place_area').css('display', 'none');
					        	$('.comment_area').css('display', 'none');
					        	$('.refund_area').css('display', 'none');
					        	$('.notice_area').css('display', 'none');
							};
							
							function place() {
								$('#place_btn').prop('checked', true);
					        	$('#web_main').css('display', 'none');
					        	$('#web_detail').css('display', 'block');
					        	$('.introduction_area').css('display', 'none');
					        	$('.gallery_area').css('display', 'none');
					        	$('.place_area').css('display', 'block');
					        	$('.comment_area').css('display', 'none');
					        	$('.refund_area').css('display', 'none');
					        	$('.notice_area').css('display', 'none');
					        	
					        	map.relayout();
				            	map.setCenter(centerNum);
							};
							
							function comment() {
								$('#comment_btn').prop('checked', true);
					        	$('#web_main').css('display', 'none');
					        	$('#web_detail').css('display', 'block');
					        	$('.introduction_area').css('display', 'none');
					        	$('.gallery_area').css('display', 'none');
					        	$('.place_area').css('display', 'none');
					        	$('.comment_area').css('display', 'block');
					        	$('.refund_area').css('display', 'none');
					        	$('.notice_area').css('display', 'none');
							};
							
							function refund() {
								$('#refund_btn').prop('checked', true);
					        	$('#web_main').css('display', 'none');
					        	$('#web_detail').css('display', 'block');
					        	$('.introduction_area').css('display', 'none');
					        	$('.gallery_area').css('display', 'none');
					        	$('.place_area').css('display', 'none');
					        	$('.comment_area').css('display', 'none');
					        	$('.refund_area').css('display', 'block');
					        	$('.notice_area').css('display', 'none');
							};
							
							function notice() {
								$('#notice_btn').prop('checked', true);
					        	$('#web_main').css('display', 'none');
					        	$('#web_detail').css('display', 'block');
					        	$('.introduction_area').css('display', 'none');
					        	$('.gallery_area').css('display', 'none');
					        	$('.place_area').css('display', 'none');
					        	$('.comment_area').css('display', 'none');
					        	$('.refund_area').css('display', 'none');
					        	$('.notice_area').css('display', 'block');
							};
						</script>
					</div>
					
					<div class="introduction_area">
						<c:forEach var="list" items="${introduction_list}" varStatus="st">
							<img alt="" src="${root}/introduction_path/${list.img_path}">
						</c:forEach>
					</div>
						<div class="gallery_area">
							<div class="img_area">
								<c:forEach var="list" items="${gallery_list}" varStatus="st">
									<div class="img_item">
										<a href="gallery_detail?contents_idx=${contents_idx}&gallery_idx=${list.idx}">
											<img alt="" src="${root}/thumbnail_path/${list.thumbnail}">
										</a>
									</div>
								</c:forEach>
							</div>
							
							<div class="search_area">
<!-- 								<form action="website" method="post" name="form"> -->
<!-- 									<select name="category"> -->
<!-- 										<option value="이미지">이미지</option> -->
<!-- 										<option value="영상">영상</option> -->
<!-- 									</select> -->
<!-- 									<input type="text" name="title" placeholder="제목으로 입력해주세요."> -->
<!-- 									<input type="submit" value="검색" id="search_submit_btn"> -->
<!-- 								</form> -->
<!-- 								<script> -->
<!-- // 									$('#search_submit_btn').click(function(){ -->
<!-- // 										var title = $('input[name=title]').val(); -->
										
<!-- // 										if(title == null || title == ''){ -->
<!-- // 											alert('검색어를 입력해주세요.'); -->
<!-- // 											$('input[name=title]').focus(); -->
<!-- // 											return false; -->
<!-- // 										} else { -->
<!-- // 											$('form[name=form]').submit(); -->
<!-- // 										} -->
<!-- // 									}); -->
<!-- 								</script> -->
								
<%-- 								<c:if test="${sessionScope.business_id == content_list.business_num}"> --%>
<%-- 									<a href="gallery_insert?contents_idx=${contents_idx}"><img src="">글쓰기</a> --%>
<%-- 								</c:if> --%>
							</div>
							
							<div class="paging">
								<c:if test="${paging_2.startPage != 1 }">
									<a href="website?nowPage_2=${paging_2.startPage - 1}&cntPerPage_2=${paging_2.cntPerPage}&contents_idx=${contents_idx}" class="paging_0">&lt;</a>
								</c:if>
								<c:forEach begin="${paging_2.startPage}" end="${paging_2.endPage}" var="p">
									<c:choose>
										<c:when test="${p == paging_2.nowPage}">
											<p>${p}</p>
										</c:when>
										<c:when test="${p != paging_2.nowPage}">
											<a href="website?nowPage_2=${p}&cntPerPage_2=${paging_2.cntPerPage}&contents_idx=${contents_idx}" class="paging_1">${p}</a>
										</c:when>
									</c:choose>
								</c:forEach>
								<c:if test="${paging_2.endPage != paging_2.lastPage}">
									<a href="website?nowPage_2=${paging_2.endPage+1}&cntPerPage_2=${paging_2.cntPerPage}&contents_idx=${contents_idx}" class="paging_2">&gt;</a>
								</c:if>
							</div>
						</div>

						<div class="place_area">
							<div id="map"></div>
						</div>
						
						<div class="comment_area">
							<jsp:include page="/WEB-INF/jsp/comment/comment.jsp" />
						</div>
		
						<div class="refund_area">
							<h2>[환불규정]</h2>
							<p>
								※ 구매시점과 무관하게 관람 당일은 환불/변경 불가<br>
								※ 관람 당일 지각/연령 미숙지로 인한 환불/변경 불가<br><br>
								
								1) 구매 당일 요청 시 전액 환불 (단, 당일 티켓은 환불 불가)<br>
								2) 전시회 8일 전 ~ : 전액 환불<br>
								3) 전시회 7일 전 ~ 4일 전 : 10% 공제 후 환불<br>
								4) 전시회 3일 전 ~ 2일 전 : 20% 공제 후 환불<br>
								5) 전시회 1일 전 ~ : 30% 공제 후 환불<br>
								6) 전시회 당일(자정) 이후 : 환불/취소/변경 불가<br><br><br>
							</p>
							
							<h2>[환불안내]</h2>
							<p>
								※ 마이페이지 > 결제내역현황에서 취소버튼 클릭 후 진행<br>
								※ 구매시점과 무관하게 관람 당일 및 이후는 환불/변경 불가<br>
								※ 무일 기준 1일 내로 환불 규정에 따른 절차 진행<br><br>
							
								1) 카드결제: 공제금 제외 금액의 카드결제 부분취소<br>
								2) 휴대폰결제: 공제금 제외 금액을 회원 계좌로 이체<br>
								3) 무통장/실시간계좌: 공제금 제외 금액을 회원 계좌로 이체<br>
								4) 네이버페이 및 기타: 결제수단별 부분취소 진행<br>
								* 휴대폰결제 취소는 결제월에만 가능(이외의 경우 계좌 이체)<br>
								* 휴대폰결제는 결제월 이후 환불할 경우 수수료가 청구될 수 있습니다.<br><br><br>
							</p>
							
							<h2>[주의사항]</h2>
							<p>
								- 환불 기준 날짜는 밤12시(자정) 기준으로 산정됩니다.<br>
								- 부분환불, 날짜/시간 변경은 지원하지 않으며, 원하시는 경우 전체 환불 후 재구매하셔야 합니다.<br>
								- 관람 당일 티켓은 환불/취소/변경 불가하여, 연령미숙지로 관람을 하지 못하더라도 환불이 불가합니다.
							</p>
						</div>
						
						<div class="notice_area">
							<jsp:include page="/WEB-INF/jsp/view/page_type_1/notice_list.jsp" />
						</div>
				</div>
				
				<div class="container_3">
					<button class="mi_btn2" id="m_payment_btn">예매하기</button>
					<script type="text/javascript">
						$('#m_payment_btn').click(function(){
							$.ajax({
								url : 'mobile_payment_check',
								type : 'post',
								success : function(data) {
									if ($.trim(data) == 0) {
										$('.mobile_payment').css('transform', 'translateY(0)');
										$('.null_area').css('opacity', '0.6');
										$('.null_area').css('display', 'block');
									} else {
										alert('로그인을 해주세요.');
									}
								},
								error : function() {
									alert('로그인을 해주세요.');
								}
							});
						});
					</script>
				</div>
			</div>
			
			<jsp:include page="/WEB-INF/jsp/footer/footer.jsp" />
		</section>
		
		<div class="null_area">
			<img alt="" src="">
		</div>
		
		<div class="mobile_payment">
			<div class="payment_item_1">
				<table align="center" id="calendar">
					<tr>
						<td><font size=1%; color="#B3B6B3"><label
								onclick="beforem()" id="before"></label></font></td>
						<td colspan="5" align="center" id="yearmonth"></td>
						<td><font size=1%; color="#B3B6B3"><label
								onclick="nextm()" id="next"></label></font></td>
					</tr>
					<tr>
						<td align="center"><font color="#FF9090">일</font></td>
						<td align="center">월</td>
						<td align="center">화</td>
						<td align="center">수</td>
						<td align="center">목</td>
						<td align="center">금</td>
						<td align="center"><font color=#7ED5E4>토</font></td>
					</tr>
				</table>
			</div>
	
			<div class="payment_item_2">
				<ul>
					<li>
						<span>성인(일반)</span>
						<span class="m_price_1">
							<c:if test="${m_price[0] == 'null'}">
								무료
							</c:if>
							
							<c:if test="${m_price[0] != 'null'}">
								${m_price[0]}원
							</c:if>
						</span>
						
						<img alt="" src="${root}/img/common/payment_minus_icon.svg" class="minus_btn_1">
						<span class="cnt_btn_1">0</span>
						<img alt="" src="${root}/img/common/payment_plus_icon.svg" class="plus_btn_1">
					</li>
					
					<li>
						<span>중,고등학생</span>
						<span class="m_price_2">
							<c:if test="${m_price[1] == 'null'}">
								무료
							</c:if>
							
							<c:if test="${m_price[1] != 'null'}">
								${m_price[1]}원
							</c:if>
						</span>
						
						<img alt="" src="${root}/img/common/payment_minus_icon.svg" class="minus_btn_2">
						<span class="cnt_btn_2">0</span>
						<img alt="" src="${root}/img/common/payment_plus_icon.svg" class="plus_btn_2">
					</li>
					
					<li>
						<span>초등학생</span>
						<span class="m_price_3">
							<c:if test="${m_price[2] == 'null'}">
								무료
							</c:if>
							
							<c:if test="${m_price[2] != 'null'}">
								${m_price[2]}원
							</c:if>
						</span>
						
						<img alt="" src="${root}/img/common/payment_minus_icon.svg" class="minus_btn_3">
						<span class="cnt_btn_3">0</span>
						<img alt="" src="${root}/img/common/payment_plus_icon.svg" class="plus_btn_3">
					</li>
					
					<li>
						<span>아동</span>
						<span class="m_price_4">
							<c:if test="${m_price[3] == 'null'}">
								무료
							</c:if>
							
							<c:if test="${m_price[3] != 'null'}">
								${m_price[3]}원
							</c:if>
						</span>
						
						<img alt="" src="${root}/img/common/payment_minus_icon.svg" class="minus_btn_4">
						<span class="cnt_btn_4">0</span>
						<img alt="" src="${root}/img/common/payment_plus_icon.svg" class="plus_btn_4">
					</li>
				</ul>
			</div>
			
			<input type="hidden" id="sum_1" value="0">
			<input type="hidden" id="sum_2" value="0">
			<input type="hidden" id="sum_3" value="0">
			<input type="hidden" id="sum_4" value="0">
			<input type="hidden" id="sum_val" value="">
			
			<div class="payment_item_3">
				<span>총 결제 금액</span>
				<span id="sum"></span>
				<button class="payment_btn" onclick="requestPay()">결제</button>
			</div>
			
			<script type="text/javascript">
				$(function () {
					$('.minus_btn_1').click(function () {
						var cnt = $('.cnt_btn_1').text();
						var price = $.trim($('.m_price_1').text());
						price = price.slice(0, -1);
						
						if(cnt != 0){
							cnt = Number(cnt) - 1;
							$('.cnt_btn_1').text(cnt);
							
							if(price != '무'){
								$('#sum_1').val(Number(cnt) * Number(price));
							}
						}
						
						sum();
					});
					
					$('.plus_btn_1').click(function () {
						var cnt = $('.cnt_btn_1').text();
						var price = $.trim($('.m_price_1').text());
						price = price.slice(0, -1);
		
						cnt = Number(cnt) + 1;
						$('.cnt_btn_1').text(cnt);
						
						if(price != '무'){
							$('#sum_1').val(Number(cnt) * Number(price));
						}
						
						sum();
					});
					
					$('.minus_btn_2').click(function () {
						var cnt = $('.cnt_btn_2').text();
						var price = $.trim($('.m_price_2').text());
						price = price.slice(0, -1);
	
						if(cnt != 0){
							cnt = Number(cnt) - 1;
							$('.cnt_btn_2').text(cnt);
							
							if(price != '무'){
								$('#sum_2').val(Number(cnt) * Number(price));
							}
						}
						
						sum();
					});
					
					$('.plus_btn_2').click(function () {
						var cnt = $('.cnt_btn_2').text();
						var price = $.trim($('.m_price_2').text());
						price = price.slice(0, -1);
						
						cnt = Number(cnt) + 1;
						$('.cnt_btn_2').text(cnt);
							
						if(price != '무'){
							$('#sum_2').val(Number(cnt) * Number(price));
						}
						
						sum();
					});
					
					$('.minus_btn_3').click(function () {
						var cnt = $('.cnt_btn_3').text();
						var price = $.trim($('.m_price_3').text());
						price = price.slice(0, -1);
						
						if(cnt != 0){
							cnt = Number(cnt) - 1;
							$('.cnt_btn_3').text(cnt);
							
							if(price != '무'){
								$('#sum_3').val(Number(cnt) * Number(price));
							}
						}
						
						sum();
					});
					
					$('.plus_btn_3').click(function () {
						var cnt = $('.cnt_btn_3').text();
						var price = $.trim($('.m_price_3').text());
						price = price.slice(0, -1);
							
						cnt = Number(cnt) + 1;
						$('.cnt_btn_3').text(cnt);
							
						if(price != '무'){
							$('#sum_3').val(Number(cnt) * Number(price));
						}
				
						sum();
					});
					
					$('.minus_btn_4').click(function () {
						var cnt = $('.cnt_btn_4').text();
						var price = $.trim($('.m_price_4').text());
						price = price.slice(0, -1);
	
						if(cnt != 0){
							cnt = Number(cnt) - 1;
							$('.cnt_btn_4').text(cnt);
							
							if(price != '무'){
								$('#sum_4').val(Number(cnt) * Number(price));
							}
						}
						
						sum();
					});
					
					$('.plus_btn_4').click(function () {
						var cnt = $('.cnt_btn_4').text();
						var price = $.trim($('.m_price_4').text());
						price = price.slice(0, -1);
	
						cnt = Number(cnt) + 1;
						$('.cnt_btn_4').text(cnt);
						
						if(price != '무'){
							$('#sum_4').val(Number(cnt) * Number(price));
						}
						
						sum();
					});
					
					function sum() {
						var sum_1 = $('#sum_1').val();
						var sum_2 = $('#sum_2').val();
						var sum_3 = $('#sum_3').val();
						var sum_4 = $('#sum_4').val();
						
						var sum = Number(sum_1) + Number(sum_2) + Number(sum_3) + Number(sum_4);
						$('#sum').text(sum + '원');
						$('#sum_val').val(sum);
					};
				});
			</script>
		</div>
		
		<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=16e3aa505cb28f9baced04a98761aae7&libraries=services"></script>
		<script type="text/javascript">
			var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
		    mapOption = {
		        center: new kakao.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
		        level: 3 // 지도의 확대 레벨
		    };  
			
			// 지도를 생성합니다    
			var map = new kakao.maps.Map(mapContainer, mapOption); 
			var centerNum = '';
			// 주소-좌표 변환 객체를 생성합니다
			var geocoder = new kakao.maps.services.Geocoder();
				
			// 주소로 좌표를 검색합니다
			geocoder.addressSearch('${content_list.address})', function(result, status) {
				
			    // 정상적으로 검색이 완료됐으면 
			     if (status === kakao.maps.services.Status.OK) {
				
			        var coords = new kakao.maps.LatLng(result[0].y, result[0].x);
					centerNum = coords;
			        // 결과값으로 받은 위치를 마커로 표시합니다
			        var marker = new kakao.maps.Marker({
			            map: map,
			            position: coords
			        });
				
			        // 인포윈도우로 장소에 대한 설명을 표시합니다
			        var infowindow = new kakao.maps.InfoWindow({
			            content: '<div style="width:150px;text-align:center;">${content_list.business}</div>'
			        });
			        infowindow.open(map, marker);
				
			        // 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
			        map.setCenter(coords);
			    } 
			});
		</script>
	</div>
</body>
</html>