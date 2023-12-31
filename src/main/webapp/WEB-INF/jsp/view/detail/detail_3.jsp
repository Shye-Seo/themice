<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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
<script type="text/javascript"
	src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
<link rel="stylesheet" href="${root}/css/view/style.css">
<link rel="stylesheet" href="${root}/css/detail/detail_3.css">
<c:if test="${t == 'Y'}">
<style type="text/css">
body{
	pointer-events: none;
}
</style>
</c:if>

<c:if test="${t != 'Y'}">
<style type="text/css">
body{
	pointer-events: all;
}
</style>
<jsp:include page="/WEB-INF/jsp/aside/quick.jsp" />
</c:if>
<script type="text/javascript">
$(function() {
	$('.event_area span').css('transform', 'translateX(0)');
	$('.event_area span').css('opacity', '1');
	
	$('#change_btn_1').click(function(){
		$('#change_btn_1').css('display','none');
		$('#change_btn_2').css('display','block');
		$('.text_area').css('display','block');
		$('.info_area').css('display','none');
	});
	
	$('#change_btn_2').click(function(){
		$('#change_btn_2').css('display','none');
		$('#change_btn_1').css('display','block');
		$('.info_area').css('display','block');
		$('.text_area').css('display','none');
	});
});

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
       $(this).css('background-color','#eda660');
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
             cell.bgColor = "#eda660";
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
			name : '${cv.title}',
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
</head>
<body>

	<jsp:include page="/WEB-INF/jsp/view/detail_type.jsp" />
	<jsp:include page="/WEB-INF/jsp/header/header.jsp" />
	<div class="header">
		<div class="title">
			<span>전시</span>
		</div>
	</div>

	<a href="javascript:history.back();" id="back_area">
		<img alt="" src="${root}/img/common/back_btn.svg" class="back_btn">
		<span>${content_list.title}</span>
	</a>
	
	<jsp:include page="/WEB-INF/jsp/aside/quick.jsp" />
	
	<div class="detail_quick">
		<a href="website?contents_idx=${content_list.idx}" target="_blank">
			<img alt="" src="${root}/img/detail/direct_icon.svg">
		</a>
	</div>
	
	<section id="detail"
		style="background-color: ${content_list.background_color}; background-image: url('${root}/img/insertcontents/pattern/pattern_${content_list.pattern}.png')">
		<div class="top_title_area">
			<div class="event_area">
				<span>${content_list.start_day} ~ ${content_list.end_day}</span>
				<span>${content_list.title}</span>
			</div>
		</div>
		<div class="contents_area">
			<div class="top_btn_area">
				<button onclick="payment('${root}')"><img alt="" src="${root}/img/detail/3_type/icon_2.svg">예매하기</button>
			</div>

			<div class="content_item_1">
				<div class="img_area">
					<img alt="" src="${root}/watermark_path/${content_img.img_1}">
				</div>

				<div class="content_area">
					<div class="title_area">
						<img src="${root}/img/detail/3_type/icon_1.svg"><span>${content_list.title}</span>
						<input type="button" value="전시내용 보기  >" id="change_btn_1">
						<input type="button" value="전시정보 보기  >" id="change_btn_2">
					</div>
					<div class="info_area">
						<ul>
							<li>
								<div class="left">
									<p>주최/주관</p>
								</div>
								<div class="right">
									<p>${content_list.business}</p>
								</div>
							</li>

							<li>
								<div class="left">
									<p>기간</p>
								</div>
								<div class="right">
									<p>${content_list.start_day} ~ ${content_list.end_day}</p>
								</div>
							</li>

							<li>
								<div class="left">
									<p>시간</p>
								</div>
								<div class="right">
									<p>${content_list.start_time} ~ ${content_list.end_time}</p>
								</div>
							</li>

							<li>
								<div class="left">
									<p>전화</p>
								</div>
								<div class="right">
									<p>${content_list.tel}</p>
								</div>
							</li>
							
							<li>
								<div class="left">
									<p>팩스</p>
								</div>
								<div class="right">
									<p>${content_list.fax}</p>
								</div>
							</li>
							
							<c:if test="${content_list.web_address != ''}">
							<li>
								<div class="left">
									<p>홈페이지</p>
								</div>
								<div class="right">
									<p>${content_list.web_address}</p>
								</div>
							</li>
							</c:if>

							<c:if test="${content_list.web_address == ''}">
							<li>
								<div class="left">
									<p>개최장소</p>
								</div>
								<div class="right">
									<p>${content_list.address}&nbsp;${content_list.detail_address}</p>
								</div>
							</li>
							</c:if>

							<li>
								<div class="left">
									<p>관람료</p>
								</div>
								<div class="right">
									<p id="price_${content_list.idx}"></p>
								
									<script type="text/javascript">
										$(function () {
											var string = '${content_list.price}';
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
												$('#price_' + ${content_list.idx}).text('무료');
											} else {
												$('#price_' + ${content_list.idx}).text(price);
											}
										});
									</script>
								</div>
							</li>
						</ul>
						<input type="button" value="공유하기" class="share">
						<div class="url_share">
							<input type="button" value="URL 복사" class="url_copy_btn">
							<input id="copy_val" value="">
						</div>
						
						<script type="text/javascript">
							$(function () {
								var url = 'http://mice79.com/website?contents_idx=' + ${content_list.idx};
								$('#url_area').text(url);
								$('#copy_val').val(url);
								  
								$('.share').click(function(){
									$('.url_share').css('display', 'flex');
									$('.share').css('opacity', '0');
								});
								
								$('.url_copy_btn').click(function(){
									var copyText = document.getElementById("copy_val");
									copyText.select();
									document.execCommand("Copy");
								});
								
								$('html').click(function(e) {
									if(!$(e.target).hasClass("share")) { 
										$('.url_share').css('display', 'none');
										$('.share').css('opacity', '1');
									}
								});
							});
						</script>
					</div>
					<div class="text_area">
						<p>${content_list.content}</p>
					</div>
				</div>
			</div>

			<div class="content_item_2">
				<div class="title_area">
					<span>Best Gallery</span>
				</div>
				<div class="img_area">
					<div class="img_item">
						<img alt="" src="${root}/watermark_path/${content_img.img_2}">
					</div>

					<div class="img_item">
						<img alt="" src="${root}/watermark_path/${content_img.img_3}">
					</div>

					<div class="img_item">
						<img alt="" src="${root}/watermark_path/${content_img.img_4}">
					</div>

					<div class="img_item">
						<img alt="" src="${root}/watermark_path/${content_img.img_5}">
					</div>

					<div class="img_item">
						<img alt="" src="${root}/watermark_path/${content_img.img_6}">
					</div>

					<div class="img_item">
						<img alt="" src="${root}/watermark_path/${content_img.img_7}">
					</div>
					
					<script type="text/javascript">
						function payment(root) {
							
							var _width = '1130';
						    var _height = '800';
	
							var _left = Math.ceil(( window.screen.width - _width )/2);
						    var _top = Math.ceil(( window.screen.height - _height )/2); 
	
							let url = root + "/payment_page?contents_idx=${contents_idx}";
							window.open(url, "", "width=1130, height=850,left=" + _left +", top=" + _top);
						}
					</script>
				</div>
			</div>
		</div>
	</section>

	<input id="m_copy_val" value="">

	<div id="mobile_detail_btn">
		<div class="img_area m_url_copy_btn">
			<img alt="" src="${root}/img/common/share_btn.svg">
		</div>

		<div class="btn_line_area"></div>
		<div class="payment_area">
<!-- 			<input type="button" value="예매하기" id="m_payment_btn"> -->
			<input type="button" value="예매하기" id="m_payment_btn" disabled>
		</div>

		<script type="text/javascript">
			$(function () {
				var url = $(location).attr('href');
				$('#m_copy_val').val(url);
				
				$('.m_url_copy_btn').click(function(){
					var copyText = document.getElementById("m_copy_val");
					copyText.select();
					document.execCommand("Copy");
				});
				
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
			});
		</script>
	</div>
	
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

	<jsp:include page="/WEB-INF/jsp/footer/footer.jsp" />
</body>
</html>