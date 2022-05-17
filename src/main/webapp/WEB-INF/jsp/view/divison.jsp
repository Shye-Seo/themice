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
<meta name="viewport" content="width=device-width, initial-scale=1">
<script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
<style type="text/css">
body {
	overflow: hidden;
	margin: 0;
}

#devision {
	width: 100%;
    height: 100vh;
    position: relative;
    display: flex;
    flex-wrap: wrap;
    flex-direction: row;
}

.option_btn {
	position: absolute;
    top: 50%;
    left: 50%;
    transform: translate(-50%, -50%);
    z-index: 4000;
    width: 100px;
    height: 100px;
    cursor: pointer;
}

.background {
	position: absolute;
    top: 0;
    left: 0;
    width: 100%;
    height: 100%;
    background-color: black;
    z-index: 3000;
    opacity: 0.5;
    display: none;
}

.option_btn img {
	width: 100%;
    height: 100%;
}

.option_items {
	top: 50%;
    left: 50%;
    transform: translate(-50%, -50%);
    z-index: 5000;
    background-color: white;
    border-radius: 20px;
    box-sizing: border-box;
    padding: 2%;
    display: none;
    flex-direction: column;
    position: relative;
	width: 30%;
    height: 58%;
    position: absolute;
}

.option_items .title-item {
	width: 100%;
    display: flex;
    flex-direction: column;
    margin-bottom: 5%;
}

.option_items .title-item span {
	font-size: 22px;
    margin-bottom: 15px;
    font-weight: bold;
    color: #333333;
}

.option_items .title-item span {
	font-size: 15px;
    color: #333333;
}

.option_items .option-item {
	display: flex;
    justify-content: space-between;
    align-items: center;
    margin-bottom: 5%;
}

.option_items .option-item input{
	margin-right: 15px;
}

.option_items .option-item label{
	width: 100%;
    font-size: 18px;
    cursor: pointer;
}

.submit_btn {
	width: 100px;
    height: 30px;
    border-radius: 7px;
    font-size: 17px;
    color: white;
    background-color: #EF8E24;
    margin: 0 auto;
    cursor: pointer;
    margin-top: 10%;
    display: flex;
    align-items: center;
    justify-content: center;
}

.close_btn {
	width: 20px;
    position: absolute;
    top: 5%;
    right: 5%;
    cursor: pointer;
}

.end_btn {
	position: absolute;
    bottom: 0%;
    left: 50%;
    transform: translate(-50%, -50%);
    cursor: pointer;
    display: none;
}

.no_link_area {
	position: absolute;
    top: 50%;
    left: 50%;
    transform: translate(-50%, -50%);
    width: 50%;
    display: flex;
    flex-wrap: wrap;
    flex-direction: row;
    justify-content: center;
}

.no_link_area img {
	width:40%;
	margin-bottom: 1%;
}

.no_link_area input:nth-child(2) {
	width: 80%;
    box-sizing: border-box;
    height: 40px;
    font-size: 17px;
    text-indent: 10px;
    border: solid 1px #EF8E24;
}

.no_link_area input:nth-child(3) {
	width: 20%;
    box-sizing: border-box;
    background-color: #EF8E24;
    border: unset;
    color: white;
    font-size: 17px;
    cursor: pointer;
}

.import_url {
	width: 100%;
	height: 100%;
	display: none;
}
</style>

<c:if test="${category == 4}">
<style type="text/css">
.import {
	width: 50%;
    height: 50%;
    overflow: scroll;
    position: relative;
}
</style>
</c:if>

<c:if test="${category == 8}">
<style type="text/css">
.import {
	width: 25%;
    height: 50%;
    overflow: scroll;
    position: relative;
}
</style>
</c:if>

<c:if test="${category == 12}">
<style type="text/css">
.import {
	width: 25%;
    height: calc(100%/3);
    overflow: scroll;
    position: relative;
}
</style>
</c:if>

<c:if test="${category == 16}">
<style type="text/css">
.import {
	width: 25%;
    height: 25%;
    overflow: scroll;
    position: relative;
}
</style>
</c:if>
</head>
<body>
	<div id="devision">
		<div class="option_btn">
			<img alt="" src="${root}/img/test/option_btn.svg">
		</div>
		
		<div class="background"></div>
		<div class="option_items">
			<form action="divison" method="get">
				<div class="title-item">
					<span>레이아웃 변경</span>
					<span>원하시는 레이아웃으로 변경해주세요.</span>
				</div>
				
				<div class="option-item">
					<input type="radio" id="4_screen" name="category" value="4">
					<label for="4_screen">4개 분할 레이아웃</label>
					<img alt="" src="${root}/img/test/4_screen.svg">
				</div>
				
				<div class="option-item">
					<input type="radio" id="8_screen" name="category" value="8">
					<label for="8_screen">8개 분할 레이아웃</label>
					<img alt="" src="${root}/img/test/8_screen.svg">
				</div>
				
				<div class="option-item">
					<input type="radio" id="12_screen" name="category" value="12">
					<label for="12_screen">12개 분할 레이아웃</label>
					<img alt="" src="${root}/img/test/12_screen.svg">
				</div>
				
				<div class="option-item">
					<input type="radio" id="16_screen" name="category" value="16">
					<label for="16_screen">16개 분할 레이아웃</label>
					<img alt="" src="${root}/img/test/16_screen.svg">
				</div>
				
				<input type="submit" value="저장" class="submit_btn">
				<img alt="" src="${root}/img/test/close.svg" class="close_btn">
			</form>
		</div>
		
		<script type="text/javascript">
			$('.option_btn').click(function () {
				$('.background').css('display', 'block');
				$('.option_items').css('display', 'flex');
			});
			
			$('.close_btn').click(function () {
				$('.background').css('display', 'none');
				$('.option_items').css('display', 'none');
			});
		</script>
		
		<c:forEach var="i" begin="1" end="${category}">
			<div class="import_${i} import">
				<div class="import_url">
					<c:import url="https://www.naver.com" charEncoding="UTF-8"></c:import>
				</div>
				
				<div class="no_link_area">
					<img alt="" src="${root}/img/header/logo.svg">
					<input type="text" placeholder="url을 입력해주세요." class="url_text">
					<input type="button" value="검색" class="url_submit_btn">
				</div>
				<img alt="" src="${root}/img/test/end_btn.svg" class="end_btn end_btn_${i}" onclick="import_end(${i})">
			</div>
		</c:forEach>
		
		<script type="text/javascript">
			function import_end(num) {
				
			};
			
			$('.url_submit_btn').click(function () {
				var url = $('.url_text').val();
				$('').val(url);
			});
		</script>
	</div>
</body>
</html>