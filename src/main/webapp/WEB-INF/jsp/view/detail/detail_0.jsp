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
<link rel="stylesheet" href="${root}/css/detail/detail_0.css">
<link rel="stylesheet" href="${root}/css/view/style.css">
</head>
<body>
	<jsp:include page="/WEB-INF/jsp/header/header.jsp" />
	
	<jsp:include page="/WEB-INF/jsp/aside/quick.jsp" />
	<div class="header">
		<div class="title">
			<span>전시</span>
		</div>
		<div class="root">
			<img alt="" src="${root}/img/list/home_icon.svg">
			<span><img alt="" src="${root}/img/common/arrow_icon.svg"></span>
			<span>전시리스트</span>
			<span><img alt="" src="${root}/img/common/arrow_icon.svg"></span>
			<span>상세페이지</span>
		</div>
	</div>
	
	<a href="javascript:history.back();" id="back_area">
		<img alt="" src="${root}/img/common/back_btn.svg" class="back_btn">
		<span>${content_list.title}</span>
	</a>
		
	<section id="detail">
		<div class="title_area">
			<span>${content_list.title}</span>
		</div>

		<div class="contents_area">
			<div class="img_area">
				<img alt="" src="${root}/crawiling_img/${content_list.img_path}">
			</div>
			
			<div class="text_area">
				<div class="content_area">
					<div>
						<span>전시내용</span>
					</div>
					
					<div>
						<p>${content_list.content}</p>
					</div>
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
								<p>${content_list.start_day}~${content_list.end_day}</p>
							</div>
						</li>

						<li>
							<div class="left">
								<p>시간</p>
							</div>
							<div class="right">
								<p>${content_list.time}</p>
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
								<p>개최 장소</p>
							</div>
							<div class="right">
								<p>${content_list.address}${content_list.detail_address}</p>
							</div>
						</li>

						<li>
							<div class="left">
								<p>관람료</p>
							</div>
							<div class="right">
								<p>${content_list.price}</p>
							</div>
						</li>
					</ul>
				</div>
			</div>
		</div>
	</section>

	<jsp:include page="/WEB-INF/jsp/footer/footer.jsp" />
</body>
</html>