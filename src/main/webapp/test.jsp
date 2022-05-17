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
<link rel="stylesheet" href="${root}/css/view/style.css">
<style type="text/css">

.gallery{
	width: 100%;
    height: 100vh;
    display: flex;
}

.gallery .left-item {
	width: 35%;
    position: relative;
}

.gallery .left-item .text-item {
	position: absolute;
    width: 60%;
    top: 25%;
    left: 50%;
    transform: translate(-50%, -50%);
    display: flex;
    flex-direction: column;
}

.gallery .left-item .text-item span:nth-child(1) {
	font-size: 65px;
    font-weight: bold;
}

.gallery .left-item .text-item span:nth-child(2) {
	margin-top: 10%;
    color: #707070;
    font-size: 20px;
}

.gallery .left-item .btn-item {
	position: absolute;
    width: 60%;
    bottom: 25%;
    left: 50%;
    transform: translate(-50%, -50%);
    display: flex;
    flex-direction: row;
}

.gallery .left-item .btn-item img:nth-child(1) {
	margin-right: 10%;
}

.gallery .right-item {
	width: 65%;
    height: 100%;
    position: relative;
}

.gallery .right-item ul {
	width: 200%;
    height: 100%;
    display: flex;
    flex-direction: row;
    position: absolute;
}

.gallery .right-item ul li {
	width: 100%;
    height: 100%;
}

.gallery .right-item ul li img {
	width: 100%;
	height: 100%;
	display: block;
}

.introduction {
	background-image: url("${root}/img/test/introduction_background.png");
	background-size: 100%;
    background-repeat: no-repeat;
	width: 100%;
    height: 100vh;
    display: flex;
    flex-direction: row;	
}

.introduction .left-item {
	width: 65%;
    position: relative;
}

.introduction .left-item .img-item {
	width: 70%;
    height: 55%;
    box-sizing: border-box;
    padding: 5%;
    border: solid 1px white;
    position: absolute;
    top: 40%;
    left: 50%;
    transform: translate(-50%, -50%);
    overflow: hidden;
    border-radius: 25px;
}

.introduction .left-item .img-item img {
	width: 100%;
	border-radius: 25px;
}

.introduction .right-item {
	width: 35%;
    position: relative;
}

.introduction .right-item .text-item {
	position: absolute;
    width: 60%;
    top: 25%;
    left: 50%;
    transform: translate(-50%, -50%);
    display: flex;
    flex-direction: column;
    color: white;
    align-items: flex-end;
}

.introduction .right-item .text-item span:nth-child(1) {
	font-size: 65px;
    font-weight: bold;
}

.introduction .right-item .text-item span:nth-child(2) {
	margin-top: 10%;
    font-size: 20px;
}

.introduction .right-item .btn-item {
	position: absolute;
    width: 60%;
    bottom: 25%;
    left: 50%;
    transform: translate(-50%, -50%);
    display: flex;
    flex-direction: row;
    justify-content: flex-end;
}

.introduction .right-item .btn-item input:nth-child(1) {
	width: 150px;
    height: 40px;
    border-radius: 25px;
    font-size: 17px;
    font-weight: bold;
    margin-right: 15px;
    border: unset;
}

.introduction .right-item .btn-item input:nth-child(2) {
	width: 150px;
    height: 40px;
    border-radius: 25px;
    font-size: 17px;
    font-weight: bold;
    border: solid 1px white;
    box-sizing: border-box;
    background: unset;
    color: white;
}

.location {
	display: flex;
    width: 100%;
    height: 100vh;
	background-image: url("${root}/img/test/location_background.png");
	background-size: 100%;
    background-repeat: no-repeat;
}

.location .left-item {
	width: 35%;
    position: relative;
}

.location .left-item .text-item {
	position: absolute;
    width: 60%;
    top: 35%;
    left: 50%;
    transform: translate(-50%, -50%);
    display: flex;
    flex-direction: column;
    color: white;
}

.location .left-item .text-item span:nth-child(1) {
	font-size: 65px;
    font-weight: bold;
}

.location .left-item .text-item span:nth-child(2) {
	margin-top: 5%;
    font-size: 20px;
}

.location .left-item .btn-item {
	position: absolute;
    width: 60%;
    bottom: 25%;
    left: 50%;
    transform: translate(-50%, -50%);
    display: flex;
}

.location .left-item .btn-item input {
	width: 150px;
    height: 40px;
    border-radius: 25px;
    font-size: 17px;
    font-weight: bold;
    border: unset;
}

.location .right-item {
	width: 65%;
    position: relative;
}

.location .right-item .img-item {
	position: absolute;
    top: 50%;
    left: 0;
    transform: translate(0, -50%);
    width: 80%;
    height: 65%;
}

.location .right-item .img-item img {
	width: 100%;
    height: 100%;
}

.notice {
	display: flex;
    width: 100%;
    height: 100vh;
}

.notice .left-item {
	width: 65%;
    box-sizing: border-box;
    padding: 10%;
	background-image: url("${root}/img/test/notice_background.png");
	background-size: 100%;
    background-repeat: no-repeat;	
    color: white;
    display: flex;
    flex-direction: column;
}

.notice .left-item ul {
	width: 100%;
    display: flex;
}

.notice .left-item ul li {
	display: flex;
    flex-direction: column;
    align-items: center;
}

.notice .left-item ul li span:nth-child(1) {
	font-size: 75px;
}

.notice .left-item ul li span:nth-child(2) {
	font-size: 15px;
}

.notice .right-item {
	width: 35%;
    position: relative;
}

.notice .right-item .text-item {
	position: absolute;
    width: 65%;
    top: 25%;
    left: 50%;
    transform: translate(-50%, -50%);
    display: flex;
    flex-direction: column;
    color: #333333;
    align-items: flex-end;
}

.notice .right-item .text-item span:nth-child(1) {
	font-size: 65px;
    font-weight: bold;
}

.notice .right-item .text-item span:nth-child(2) {
	margin-top: 5%;
    font-size: 20px;
}

.notice .right-item .btn-item {
	position: absolute;
    width: 60%;
    bottom: 25%;
    left: 50%;
    transform: translate(-50%, -50%);
    display: flex;
    flex-direction: row;
    justify-content: flex-end;
}

.notice .right-item .btn-item input {
	width: 150px;
    height: 40px;
    border-radius: 25px;
    font-size: 17px;
    font-weight: bold;
    border: unset;
    background-color: black;
    color: white;
}

.refund {
	display: flex;
    width: 100%;
    height: 100vh;
	background-image: url("${root}/img/test/refund_background.png");
	background-size: 100%;
    background-repeat: no-repeat;
}

</style>
</head>
<body>
	<div class="gallery">
		<div class="left-item">
			<div class="text-item">
				<span>Gallery</span>
				<span>더 마이스의 다양한 갤러리를 만나보세요.</span>
			</div>
			
			<div class="btn-item">
				<img alt="" src="${root}/img/test/left_btn.svg">
				<img alt="" src="${root}/img/test/right_btn.svg">
			</div>
		</div>
		
		<div class="right-item">
			<ul>
				<li><img alt="" src="${root}/img/test/gallery_1.png"></li>
				<li><img alt="" src="${root}/img/test/gallery_2.png"></li>
			</ul>
		</div>
	</div>
	
	<div class="introduction">
		<div class="left-item">
			<div class="img-item">
				<img alt="" src="${root}/img/test/introduction.png">
			</div>
		</div>
		
		<div class="right-item">
			<div class="text-item">
				<span>Introduction</span>
				<span>더 마이스의 다양한 전시소개를 만나보세요.</span>
			</div>
			
			<div class="btn-item">
				<input type="button" value="예매하기">
				<input type="button" value="전체보기">
			</div>
		</div>
	</div>
	
	<div class="location">
		<div class="left-item">
			<div class="text-item">
				<span>Location</span>
				<span>더 마이스를 볼 수 있는 위치를 안내합니다.</span>
			</div>
			
			<div class="btn-item">
				<input type="button" value="자세히보기">
			</div>
		</div>
		
		<div class="right-item">
			<div class="img-item">
				<img alt="" src="${root}/img/test/map.png">
			</div>
		</div>
	</div>
	
	<div class="notice">
		<div class="left-item">
			<ul>
				<li>Notice</li>
				<li>
					<span>05</span>
					<span>2021.11.30</span>
				</li>
				<li>
					<span>변종 코로나인 오미크론으로 전시일정이 변경되었음을 알려드립니다.</span>
					<span>안녕하세요. 더 마이스입니다. 부산에 변종 코로나 오미크론이 심회되어</span>
					<span>전시일정이 변경되었습니다. 변경된 전시일정은 첨부파일로 첨부하오니 확인하고...</span>
				</li>
			</ul>
		</div>
		
		<div class="right-item">
			<div class="text-item">
				<span>Notice</span>
				<span>더 마이스를에서 알려주는 공지사항을 만나보세요.</span>
			</div>
			
			<div class="btn-item">
				<input type="button" value="전체보기">
			</div>
		</div>
	</div>
	
	<div class="refund">
		<div class="left-item">
			<div class="text-item">
				<span>Refund Policy</span>
				<span>더 마이스에서 예매한 티켓의 환불규정을 알려드립니다.</span>
			</div>
		</div>
		
		<div class="right-item">
			<div class="content-item">
				<span>[환불규정]</span>
				<p>
					※ 구매시점과 무관하게 관람 당일은 환불/변경 불가<br>
					※ 관람 당일 지각/연령 미숙지로 인한 환불/변경 불가<br><br>
					1) 구매 당일 요청 시 전액환불(단, 당일 티켓은 환불 불가)<br>
					2) 전시회 8일 전 ~ : 전액 환불<br>
 					3) 전시회 7일 전 ~ 4일 전 : 10% 공제 후 환불<br>
 					4) 전시회 3일 전 ~ 2일 전 : 20% 공제 후 환불<br>
 					5) 전시회 1일 전 ~ : 30% 공제 후 환불<br>
 					6) 전시회 당일(자정) 이후 : 환불/취소/변경 불가<br>
				</p>
			</div>
			
			<div class="content-item">
				<span>[환불안내]</span>
				<p>
					※ 마이페이지 > 결제내역현황에서 취소버튼 클릭 후 진행
 					※ 구매시점과 무관하게 관람 당일 및 이후는 환불/변경 불가
 					※ 무일 기준 1일 내로 환불 규정에 따른 절차 진행
 					1) 카드결제: 공제금 제외 금액의 카드결제 부분취소
 					2) 휴대폰결제: 공제금 제외 금액을 회원 계좌로 이체
 					3) 무통장/실시간계좌: 공제금 제외 금액을 회원 계좌로 이체
 					4) 네이버페이 및 기타: 결제수단별 부분취소 진행
 					* 휴대폰결제 취소는 결제월에만 가능(이외의 경우 계좌 이체)
 					* 휴대폰결제는 결제월 이후 환불할 경우 수수료가 청구될 수 있습니다.
				</p>
				<span>[주의사항]</span>
				<p>
					- 환불 기준 날짜는 밤12시(자정) 기준으로 산정됩니다.
 					- 부분환불, 날짜/시간 변경은 지원하지 않으며, 원하시는 경우 전체 환불 후 재구매하셔야 합니다.
 					- 관람 당일 티켓은 환불/취소/변경 불가하여, 연령미숙지로 관람을 하지 못하더라도 환불이 불가합니다.
				</p>
			</div>
		</div>
	</div>
	
	<div class="media">
		<div class="left-item">
			<div class="content-item">
				<div class="media-item">
					<img alt="" src="${root}/img/test/media_1.png">
					<img alt="" src="${root}/img/test/media_btn.svg">
				</div>
				
				<div class="media-item">
					<img alt="" src="${root}/img/test/media_2.png">
					<img alt="" src="${root}/img/test/media_btn.svg">
				</div>
				
				<div class="media-item">
					<img alt="" src="${root}/img/test/media_3.png">
					<img alt="" src="${root}/img/test/media_btn.svg">
				</div>
				
				<div class="media-item">
					<img alt="" src="${root}/img/test/media_4.png">
					<img alt="" src="${root}/img/test/media_btn.svg">
				</div>
			</div>
		</div>
		
		<div class="right-item">
			<div class="text-item">
				<span>Video</span>
				<span>더 마이스를 소개하는 다양한 영상을 만나보세요.</span>
			</div>
		</div>
	</div>
</body>
</html>