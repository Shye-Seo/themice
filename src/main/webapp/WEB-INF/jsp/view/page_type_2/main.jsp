<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;300;400;500;700;900&display=swap" rel="stylesheet">
<meta charset="UTF-8">
<title>THE MICE</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<c:set var="root" value="${pageContext.request.contextPath}" />
<link rel="icon" href="${root}/img/common/favicon.svg">
<link rel="stylesheet" href="https://unpkg.com/swiper/swiper-bundle.min.css">
<link rel="stylesheet" href="${root}/css/view/website2/main.css">
<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.8.js"></script>
<script src="https://code.jquery.com/jquery-2.2.4.min.js"></script>
<style type="text/css">
#footer{
	position: absolute;
    bottom: 0;
    background-color: #404040;
}

#footer a{
	color: white;
}

#footer .infomation{
	color: white;
}

.header {
	position: fixed;
    top: 0;
}

body {
	position: relative;
}

footer {
	position: absolute;
	bottom: 0;
}
</style>
</head>
<body>
<script>
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
	       $(this).css('background-color','#1D1D1D');
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
	             cell.bgColor = "#1D1D1D";
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
	
	<jsp:include page="/WEB-INF/jsp/view/page_type_2/header.jsp" />
	
	<div id="web">
	    <div class="content">
    	    <c:if test="${web_menu_list[1] != null}">
		    	<jsp:include page="/WEB-INF/jsp/view/page_type_2/menu/${web_menu_list[1]}.jsp" />
		    </c:if>
		    
		   	<c:if test="${web_menu_list[2] != null}">
		   		<jsp:include page="/WEB-INF/jsp/view/page_type_2/menu/${web_menu_list[2]}.jsp" />
		   	</c:if>
		    
		    <c:if test="${web_menu_list[3] != null}">
		    	<jsp:include page="/WEB-INF/jsp/view/page_type_2/menu/${web_menu_list[3]}.jsp" />
		    </c:if>
		    
		    <c:if test="${web_menu_list[4] != null}">
		   		<jsp:include page="/WEB-INF/jsp/view/page_type_2/menu/${web_menu_list[4]}.jsp" />
		    </c:if>
		    
		    <c:if test="${web_menu_list[5] != null}">
		    	<jsp:include page="/WEB-INF/jsp/view/page_type_2/menu/${web_menu_list[5]}.jsp" />
		   	</c:if>
		   	
		   	<jsp:include page="/WEB-INF/jsp/view/page_type_2/footer.jsp" />
	    </div>
	</div>
	
	<input type="hidden" value="0" id="main_cnt">
	
	<script type="text/javascript">
		$('html').bind('wheel', function (event) {
			
			if($(event.target).hasClass('non-scroll')) { 
				console.log('aaaaaaaaa');
			} else if(!$(event.target).hasClass('non-scroll')){
				console.log('bbbbbbbbb');
				var max = $('.content .menu-item').length;
				var cnt = $('#main_cnt').val();
				
				if (event.originalEvent.wheelDelta > 0 || event.originalEvent.detail < 0) {
					if(cnt != 0) {
						cnt = Number(cnt) - 1;
						$('.content').css('transform', 'translateY(-' + cnt + '00vh');
						$('#main_cnt').val(cnt);
					}
				} else {
					if(cnt < Number(max) - 1) {
						cnt = Number(cnt) + 1;
						$('.content').css('transform', 'translateY(-' + cnt + '00vh');
						$('#main_cnt').val(cnt);
					}
				}
			}
		});
	</script>
	
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
					<td><font size=1%; color="#B3B6B3"><label onclick="nextm()" id="next"></label></font></td>
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
		
		<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=328dac099a55125f1d0b29b37bdd009b&libraries=services"></script>
		
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
</body>
</html>