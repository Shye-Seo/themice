<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>THE MICE</title>
</head>
<body>
	<div id="introduction" class="menu-item">
		<div class="left-item non-scroll">
			<div class="content-item">
				<marquee behavior="scroll" direction="down">THE MICE</marquee>
				<div class="img-item">
					<c:forEach var="list" items="${introduction_list}" varStatus="st">
						<img class="cnt03_img" alt="" src="${root}/introduction_path/${list.img_path}" class="mi_intro_img">
					</c:forEach>
				</div>
				<marquee behavior="scroll" direction="up">THE MICE</marquee>
			</div>
			<div class="text-item">
				<span>마우스를 아래로 스크롤 해주세요.</span>
			</div>
		</div>
		
		<div class="right-item">
			<div class="text-item">
				<span>Introduction</span>
				<span>더 마이스가 보여주는 전시소개를 만나보세요.</span>
			</div>
			
			<img alt="" src="${root}/img/website2/background_logo.svg" class="background_img">
			
			<div class="btn-item">
				<input type="button" value="예매하기" id="ticketing">
				<input type="button" value="전체보기" id="full_screen">
			</div>

		</div>
	</div>
</body>
</html>