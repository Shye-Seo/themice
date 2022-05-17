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
<script type="text/javascript"
	src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
<link rel="stylesheet" href="${root}/css/view/style.css">
<link rel="stylesheet" href="${root}/css/detail/detail_1.css">
<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.8.js"></script>
<script type="text/javascript">
	function requestPay() {
		var sum = $('#sum').text();
		
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
	<header>
	</header>
	
	<section>
		<div class="container_1">
			<img alt="" src="">
			
			<div class="text_area">
				<span>${content_list_title}</span>
				<p><img alt="" src="${root}/img/website/calendar_white.svg"> ${content_list.start_day} ~ ${content_list.end_day}</p>
			</div>
		</div>
		
		<div class="container_2">
			<div class="container_item_1">
				<div class="text_area">
					<span>Gallery</span>
					<p>더 마이스와 다양한 갤러리를 만나보세요.</p>
				</div>
				
				<div class="slider_btn">
					<img alt="" src="${root}/img/website/left_btn.svg" class="left_btn">
					<img alt="" src="${root}/img/website/right_btn.svg" class="right_btn">
				</div>
			</div>
			
			<div class="container_item_2">
				<div class="slider_area">
					
				</div>
			</div>
		</div>
		
		<div class="container_3">
			<div class="container_item_1">
				
			</div>
			
			<div class="container_item_2">
				<div class="text_area">
					<span>Introduction</span>
					<p>더 마이스가 보여주는 전시소개를 만나보세요.</p>
				</div>
				
				<div class="btn_area">
					<a href="#">전체보기</a>
				</div>
			</div>
		</div>
		
		<div class="container_4">
			<div class="container_item_1">
				<div class="text_area">
					<span>Notice</span>
					<p>더 마이스에서 알려주는 공지사항을 만나보에쇼.</p>
				</div>
				
				<div class="btn_area">
					<a href="#">전체보기</a>
				</div>
			</div>
			<div class="container_item_2">
			</div>
		</div>
		
		<div class="container_5">
			<div class="container_item_1">
				<div id="map"></div>
			</div>
			
			<div class="container_item_2">
				<div class="text_area">
					<span>Location</span>
					<p>더 마이스를 볼 수 있는 위치를 안내합니다.</p>
				</div>
				
				<div class="btn_area">
					<a href="#">전체보기</a>
				</div>
			</div>
		</div>
		
		<div class="container_6">
			<div class="container_item_1">
				<span>Refund Policy</span>
				<p>더 마이스에서 예매한 티켓의 환불규정을 알려드립니다.</p>
			</div>
			
			<div class="container_item_2">
				<div class="refund_area_1">
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
				</div>

				<div class="refund_area_2">
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
			</div>
		</div>
		
		<div class="container_9">
			
		</div>
	</section>
	
	<jsp:include page="/WEB-INF/jsp/footer/footer.jsp" />
	
	<jsp:include page="/WEB-INF/jsp/footer/mobile_footer.jsp" />
	<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=328dac099a55125f1d0b29b37bdd009b&libraries=services"></script>
	<script>
		var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
		    mapOption = {
		        center: new kakao.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
		        level: 3 // 지도의 확대 레벨
		    };  
		
		// 지도를 생성합니다    
		var map = new kakao.maps.Map(mapContainer, mapOption); 
		
		// 주소-좌표 변환 객체를 생성합니다
		var geocoder = new kakao.maps.services.Geocoder();
		
		// 주소로 좌표를 검색합니다
		geocoder.addressSearch('${content_list.address})', function(result, status) {
		
		    // 정상적으로 검색이 완료됐으면 
		     if (status === kakao.maps.services.Status.OK) {
		
		        var coords = new kakao.maps.LatLng(result[0].y, result[0].x);
		
		        // 결과값으로 받은 위치를 마커로 표시합니다
		        var marker = new kakao.maps.Marker({
		            map: map,
		            position: coords
		        });
		
		        // 인포윈도우로 장소에 대한 설명을 표시합니다
		        var infowindow = new kakao.maps.InfoWindow({
		            content: '<div style="width:150px;text-align:center;padding:6px 0;">우리회사</div>'
		        });
		        infowindow.open(map, marker);
		
		        // 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
		        map.setCenter(coords);
		    } 
		});    
	</script>
</body>
</html>