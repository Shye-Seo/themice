<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:set var="root" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>THE MICE</title>
<link rel="icon" href="${root}/img/common/favicon.svg">
<link rel="stylesheet" href="${root}/css/view/notice/notice.css">
<link rel="stylesheet" href="${root}/css/view/notice/mobile_notice.css">
<link rel="stylesheet" href="${root}/css/view/style.css">
<meta name="viewport" content="width=device-width, initial-scale=1">
</head>
<body>
	<jsp:include page="/WEB-INF/jsp/aside/quick.jsp" />
	<jsp:include page="/WEB-INF/jsp/header/header.jsp" />
	
	<div class="header">
		<div class="title">
			<span>공지사항</span>
		</div>
	</div>
	
	<section id="notice_detail">
		<div class="inner">
			<div class="top"><span>공지</span></div>
			<div class="detail_title_area">
				<span>${vo.title}</span>
			</div>
		
			<div class="infomation_area">
					<table>
						<tr>
							<td><p>첨부파일</p></td>
							<td colspan="3">
								<c:if test="${vo.file_path != null}">
									<form action="download" method="post">
										<input type="submit" value="다운로드" id="img_download" style="display: none;">
										<label for="img_download" style="cursor: pointer; font-size: 0.9rem;">${vo.file_path}</label>
										<input type="hidden" name="filename" value="${vo.file_path}">
									</form>
								</c:if>
							</td>
							<td>|</td>
							<td><p>작성일</p></td>
							<td>${vo.create_day}</td>
							<td>|</td>
							<td><p>조회수</p></td>
							<td>${vo.views}</td>
						</tr>
					</table>
				</div>
				<div class="text_area">
					<p>${vo.contents}</p>
				</div>
			
				<div class="btn_area">
					<a href="notice_list">목록</a>
				</div>
			</div>
	</section>
	<jsp:include page="/WEB-INF/jsp/footer/footer.jsp" />
	
	
	<section id="mobile_notice_detail">
		
		<a href="javascript:history.back();" id="back_area">
			<img alt="" src="${root}/img/common/back_btn.svg" class="back_btn">
			<span>공지사항</span>
		</a>
		
		<div class="title_area">
			<span>${vo.title}</span>
			<span>${vo.create_day}&nbsp;|&nbsp;${vo.views}</span>
		</div>
		
		<div class="text_area">
			<p>
				${vo.contents}
			</p>
		</div>
		
		<div class="img_area">
			
		</div>
		</div>
	</section>
	
	<jsp:include page="/WEB-INF/jsp/footer/mobile_footer.jsp" />
</body>
</html>