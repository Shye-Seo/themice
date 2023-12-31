<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<c:set var="root" value="${pageContext.request.contextPath}" />
<title>THE MICE</title>
<link rel="icon" href="${root}/img/common/favicon.svg">
<link rel="stylesheet" href="${root}/css/view/style.css">
<link rel="stylesheet" href="${root}/css/view/payment/payment.css">
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js" ></script>
<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.8.js"></script>
<script language="javascript">
//    $(function() {
//       build();
//       $('td').click(function() {
//     	 var year = $('#year').val();
//     	 var month = $('#month').val();
//          var day = $(this).text();
         
//          if(month < 10){
//         	 month = '0' + month;
//          }
         
//          if(day < 10){
//         	 day = '0' + day;
//          }
         
//          var entry_date = year + '.' + month + '.' + day
         
//          $('#entry_date').val(entry_date);
         
//          $('td').css('background-color','unset');
//          $(this).css('background-color','#eda660');
//          $('td').css('color','#333333');
//          $(this).css('color','white');
//       });
//    });
   
//    var today = new Date();
//    var date = new Date();
   
//    function beforem()
//    {
//       today = new Date(today.getFullYear(), today.getMonth() - 1, today.getDate());
//       build();
//    }
   
//    function nextm()
//    {
//       today = new Date(today.getFullYear(), today.getMonth() + 1, today.getDate());
//       build();
//    }
 
//    function build() {
//          var nMonth = new Date(today.getFullYear(), today.getMonth(), 1);
//          var lastDate = new Date(today.getFullYear(), today.getMonth() + 1, 0);
//          var tbcal = document.getElementById("calendar");
//          var yearmonth = document.getElementById("yearmonth");
//          yearmonth.innerHTML = today.getFullYear() + "년 " + (today.getMonth() + 1) + "월";
         
// 		 $('#year').val(today.getFullYear());
// 		 $('#month').val((today.getMonth() + 1));
		 
//          if (today.getMonth() + 1 == 12)
//          {
//             before.innerHTML = (today.getMonth()) + "월";
//             next.innerHTML = "1월";
//          } else if (today.getMonth() + 1 == 1)
//          {
//             before.innerHTML = "12월";
//             next.innerHTML = (today.getMonth() + 2) + "월";
//          } else
//          {
//             before.innerHTML = (today.getMonth()) + "월";
//             next.innerHTML = (today.getMonth() + 2) + "월";
//          }

//          while (tbcal.rows.length > 2) {
//             tbcal.deleteRow(tbcal.rows.length - 1);
//          }
//          var row = null;
//          row = tbcal.insertRow();
//          var cnt = 0;

//          for (i = 0; i < nMonth.getDay(); i++) {
//             cell = row.insertCell();
//             cnt = cnt + 1;
//          }

//          for (i = 1; i <= lastDate.getDate(); i++)
//          {
//             cell = row.insertCell();
//             cell.innerHTML = i;
//             cnt = cnt + 1;
//             if (cnt % 7 == 1) {
//                cell.innerHTML = "<font color=#FF9090>" + i
//             }
//             if (cnt % 7 == 0) {
//                cell.innerHTML = "<font color=#7ED5E4>" + i
//                row = calendar.insertRow();
//             }
//             if (today.getFullYear() == date.getFullYear()
//                   && today.getMonth() == date.getMonth()
//                   && i == date.getDate()) {
//                cell.bgColor = "#eda660";
//             }
//          }
//    }
   
   
//    function requestPay() {
// 		var sum = $('#sum').text();
		
// 		IMP.init("imp60647438");
		
// 		console.log(sum);

// 		IMP.request_pay({
// 			pg : "html5_inicis",
// 			pay_method : "card",
// 			merchant_uid : '${merchant_uid}',
// 			name : '${cv.title}',
// 			amount : sum,
// 			buyer_email : '${mv.email}',
// 			buyer_name : '${mv.id}',
// 			buyer_tel : '${mv.tel}',
// 			buyer_addr : '${mv.address}'
// 		}, function(rsp) {
// 			debugger;
// 			console.log(rsp);
// 			if (rsp.success) {
// 				alert('결제완료!');
// 				location.href = 'payment?imp_uid='+rsp.imp_uid+'&imp_amount='+rsp.paid_amount+'&contents_idx='+${contents_idx};
// 			} else {
// 				var msg = '결제에 실패하였습니다.';
// 				msg += '에러내용 : ' + rsp.error_msg;
// 			}
// 		});
// 	}
</script>
<style type="text/css">
body{
	overflow: hidden;
}

.header{
	top: 15%;
}
</style>
</head>
<body style="overflow-x:hidden;overflow-y:scroll">
<!-- <div id="container"><div id="p">준비중</div></div> -->
	<div class="upper_area">
			<div class="title">
				<span>예매하기</span>
			</div>
	</div>
	<section id="payment">
		<div class="info_area">
			<div id="container_info">
			<div class="img_area">
				<img alt="" src="${root}/contents_img/${cv.img_path}">
			</div>
			<div class="text_area">
				<ul>
					<li class="title">${cv.title}</li>
					<li>주최/주관&nbsp;&nbsp;|&nbsp;&nbsp;&nbsp;${cv.business }</li>
					<li>개최기간&nbsp;&nbsp;&nbsp;|&nbsp;&nbsp;&nbsp;${cv.start_day} ~ ${cv.end_day}</li>
					<li>관람시간&nbsp;&nbsp;&nbsp;|&nbsp;&nbsp;&nbsp;${cv.start_time} ~ ${cv.end_time }</li>
					<c:if test="${cv.tel ne '' && cv.tel ne 'null'}"><li>전화번호&nbsp;&nbsp;&nbsp;|&nbsp;&nbsp;&nbsp;${cv.tel}</li></c:if>
					<li>관람장소&nbsp;&nbsp;&nbsp;|&nbsp;&nbsp;&nbsp;<c:if test="${cv.web_address == ''}">${cv.address} ${cv.detail_address }</c:if> <c:if test="${cv.web_address != ''}">${cv.web_address}</c:if></li>
				</ul>
			</div>
			</div>
		</div>

		<form method="post" action="insert_payment" enctype="multipart/form-data" id="form_data">
			<input type="hidden" name="contents_idx" id="contents_idx" value="${cv.idx}">
			<input type="hidden" name="business_num" id="business_num" value="${cv.business_num }">
			<input type="hidden" name="title" id="title" value="${cv.title}">
			<input type="hidden" name="status" id="status" value="paid">
		<div class="choice_area">
			<div class="information_area">
				<div class="title_area">
					<span>1. 예매자 정보 입력</span>
				</div>
				<div class="input_area">
					<table>
						<tr>
							<td>성함</td>
							<td><input type="text" name="name" id="name"></td>
						</tr>
						<tr>
							<td>연락처</td>
							<td><input type="text" name="tel" id="tel" placeholder="예) 010-000-0000"></td>
						</tr>
					</table>
				</div>
			</div>

			<div class="personnel_area">
				<div class="title_area">
					<span>2. 날짜/인원선택</span>
				</div>
				<div class="input_area">
					<input type="date" name="visit_date" id="visit_date">
					<ul class="select_area">
						<li>
							<ul class="select_item">
								<li>기본가(성인)</li>
								<li>중,고등학생</li>
								<li>초등학생</li>
								<li>아동</li>
							</ul>
						</li>
						<li style="text-align: center;">
							<ul class="select_item">
								<c:forEach var="i" begin="0" end="3">
									<li>
										<c:if test="${price[i] == 'null'}"> 0 원 </c:if>
										
										<c:if test="${price[i] != 'null'}">
											<span id="price_${i}">${price[i]}</span>원
										</c:if>
									</li>
								</c:forEach>
							</ul>
						</li>
						<li style="text-align: right;">
							<ul class="select_item">
								<c:forEach var="i" begin="1" end="4">
									<li><select id="number_${i}">
											<option value="0">0</option>
											<option value="1">1</option>
											<option value="2">2</option>
											<option value="3">3</option>
											<option value="4">4</option>
											<option value="5">5</option>
											<option value="6">6</option>
											<option value="7">7</option>
											<option value="8">8</option>
											<option value="9">9</option>
											<option value="10">10</option>
									</select><span>매</span></li>
								</c:forEach>
							</ul>
						</li>
					</ul>

					<ul class="payment_area">
						<li>총 결제 금액</li>
						<li style="text-align: center;">
							<span id="sum"></span>원
							<input type="hidden" value="0" id="sum_1">
							<input type="hidden" value="0" id="sum_2">
							<input type="hidden" value="0" id="sum_3">
							<input type="hidden" value="0" id="sum_4">
						</li>
						<li style="text-align: right;"><button class="payment_btn" id="payment_btn">결제</button></li>
					</ul>
					
					<input type="hidden" value="0" id="total" name="total">
					<input type="hidden" value="0" id="amount_1" name="ticket_amount">
					<input type="hidden" value="0" id="amount_2" name="ticket_amount">
					<input type="hidden" value="0" id="amount_3" name="ticket_amount">
					<input type="hidden" value="0" id="amount_4" name="ticket_amount">

					<script type="text/javascript">
						$(function() {
							$("#number_1").on("change",function(){
								var sum = Number($('#price_0').text()) * Number($('#number_1').val());
							    $('#sum_1').val(sum);
							    
							    var sum_1 = $('#sum_1').val();
								var sum_2 = $('#sum_2').val();
								var sum_3 = $('#sum_3').val();
								var sum_4 = $('#sum_4').val();
								
								$('#sum').text(Number(sum_1) + Number(sum_2) + Number(sum_3) + Number(sum_4));
								
								var amount_1 = Number($('#number_1').val());
								var amount_2 = Number($('#number_2').val());
								var amount_3 = Number($('#number_3').val());
								var amount_4 = Number($('#number_4').val());
								
								$('#amount_1').val(amount_1);
								$('#amount_2').val(amount_2);
								$('#amount_3').val(amount_3);
								$('#amount_4').val(amount_4);
								$('#amount').text(Number(amount_1) + Number(amount_2) + Number(amount_3) + Number(amount_4));
								$('#total').text($('#amount').val());
						    })
						      
							$("#number_2").on("change",function(){
								var sum = Number($('#price_1').text()) * Number($('#number_2').val());
								$('#sum_2').val(sum);
								
								var sum_1 = $('#sum_1').val();
								var sum_2 = $('#sum_2').val();
								var sum_3 = $('#sum_3').val();
								var sum_4 = $('#sum_4').val();
								
								$('#sum').text(Number(sum_1) + Number(sum_2) + Number(sum_3) + Number(sum_4));
								
								var amount_1 = Number($('#number_1').val());
								var amount_2 = Number($('#number_2').val());
								var amount_3 = Number($('#number_3').val());
								var amount_4 = Number($('#number_4').val());
								
								$('#amount_1').val(amount_1);
								$('#amount_2').val(amount_2);
								$('#amount_3').val(amount_3);
								$('#amount_4').val(amount_4);
								$('#amount').text(Number(amount_1) + Number(amount_2) + Number(amount_3) + Number(amount_4));
								$('#total').text($('#amount').val());
						    })
						      
							$("#number_3").on("change",function(){
								var sum = Number($('#price_2').text()) * Number($('#number_3').val());
								$('#sum_3').val(sum);
								
								var sum_1 = $('#sum_1').val();
								var sum_2 = $('#sum_2').val();
								var sum_3 = $('#sum_3').val();
								var sum_4 = $('#sum_4').val();
								
								$('#sum').text(Number(sum_1) + Number(sum_2) + Number(sum_3) + Number(sum_4));
								
								var amount_1 = Number($('#number_1').val());
								var amount_2 = Number($('#number_2').val());
								var amount_3 = Number($('#number_3').val());
								var amount_4 = Number($('#number_4').val());
								
								$('#amount_1').val(amount_1);
								$('#amount_2').val(amount_2);
								$('#amount_3').val(amount_3);
								$('#amount_4').val(amount_4);
								$('#amount').text(Number(amount_1) + Number(amount_2) + Number(amount_3) + Number(amount_4));
								$('#total').text($('#amount').val());
						 	})
						 	
						 	$("#number_4").on("change",function(){
						 		var sum = Number($('#price_3').text()) * Number($('#number_4').val());
						 		$('#sum_4').val(sum);
						 		
						 		var sum_1 = $('#sum_1').val();
								var sum_2 = $('#sum_2').val();
								var sum_3 = $('#sum_3').val();
								var sum_4 = $('#sum_4').val();
								
								$('#sum').text(Number(sum_1) + Number(sum_2) + Number(sum_3) + Number(sum_4));
								
								var amount_1 = Number($('#number_1').val());
								var amount_2 = Number($('#number_2').val());
								var amount_3 = Number($('#number_3').val());
								var amount_4 = Number($('#number_4').val());
								
								$('#amount_1').val(amount_1);
								$('#amount_2').val(amount_2);
								$('#amount_3').val(amount_3);
								$('#amount_4').val(amount_4);
								$('#amount').text(Number(amount_1) + Number(amount_2) + Number(amount_3) + Number(amount_4));
								$('#total').text($('#amount').val());
						 	})
						});
						
						$(function () {
							$('#payment_btn').click(function () {
								var name = $('#name').val();
								var tel = $('#tel').val();
								var visit_date = $('#visit_date').val();
								var amount_1 = Number($('#number_1').val());
								var amount_2 = Number($('#number_2').val());
								var amount_3 = Number($('#number_3').val());
								var amount_4 = Number($('#number_4').val());
								
								var amount = amount_1 + amount_2 + amount_3 + amount_4;
								$('#ticket_amount').text(amount_1+"+"+amount_2+"+"+amount_3+"+"+amount_4);
								
								if(!visit_date){
									alert('날짜를 선택해주세요.');
									$('#visit_date').focus();
									return false;
								} else if (amount == 0){
									alert('예매인원을 선택해주세요.');
									return false;
								}else if (!name){
									alert('이름을 입력해주세요.');
									return false;
								}else if (!tel){
									alert('전화번호를 입력해주세요.');
									return false;
								} else {
									debugger;
									$('form').submit();
								}
							})
						});
					</script>
				</div>
			</div>
		</div>
		</form>
	</section>
</body>
</html>