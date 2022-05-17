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
<link rel="stylesheet" href="${root}/css/style.css">
</head>
<body>
	<jsp:include page="/WEB-INF/jsp/header/header.jsp" />

	<section id="detail">
		<div class="contents">
			
			<h2 class="title">${content.title}</h2>
			
			<h3>
				<img src="${root}/img/homeicon.png" class="home_img">> 전시 일정 >
				컨벤션
			</h3>
			
			<div class="img">
				<img src="${root}/img/detail.JPG">
			</div>
			
			<div class="content">
				<div class="content_info">
					<div class="content_left">
						<h3>전시내용</h3>
					</div>
					<div class="content_right">
						<p>${content.content}</p>
					</div>
				</div>
				
				<hr>
				
				<div class="content_info">
					<ul>
						<li>행사명 : ${content.title}</li>
						<li>개최 기간 : ${content.start_day} ~ ${content.end_day}</li>
						<li>관람 시간 : ${content.time}</li>
						<li>개최 장소 : ${content.address} ${content.detail_address}</li>
						<li>전화 : ${content.tel}</li>
						<li>관람료 : ${content.price}</li>
					</ul>
				</div>
				
				<div class="content_btn">
					<a href="#">구매</a> <a href="#">찜 하기</a>
				</div>
			</div>
			<div class="clear:bath;"></div>
		</div>

		<div id="comment">
			<div class="insert">
				<div class="top">
					<div class="id">
						<h3>test</h3>
						<div class="score">
							<div class="startRadio">
								<c:forEach var="i" begin="0" end="4">
									<img src="${root}/img/star-2.svg">
								</c:forEach>
							</div>
						</div>
					</div>
				</div>

				<div class="textarea">
					<input type="text" name="comment"
						placeholder="악플은 경고조치 없이 삭제되며 징계대상이 될 수 있습니다. (255자 이내)">
				</div>

				<div class="bottom">
					<div class="img_area"></div>

					<div class="comments_submit">
						<input type="button" value="사진첨부"> <input type="button"
							value="등록">
					</div>
				</div>
			</div>

			<div class="show_comment">
				<div class="comment">
					<div class="profile_img">
						<img src="${root}/img/non_human_img.jpg">
					</div>
					<div class="top">
						<h3>test**</h3>
						<c:forEach var="i" begin="0" end="3">
							<img src="${root}/img/star-2.svg">
						</c:forEach>
						<img src="${root}/img/star.svg">
					</div>
					<div class="comment_text">전시회는 전문화의 특색 발전도로를 개척하며, 산업의 승격과 업계
						혁신의 발전을 추진하는 것을 추구하며 바이어와 업체들 사이의 구매교류를 위해 마련한 전시회이다.</div>
					<div class="answer_input">
						<input type="button" value="답글 달기">
					</div>
					<hr>
				</div>
			</div>
		</div>
	</section>
	<jsp:include page="/WEB-INF/jsp/footer/footer.jsp" />
</body>
</html>