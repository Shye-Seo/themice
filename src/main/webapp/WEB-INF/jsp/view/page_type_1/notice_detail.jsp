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
<link rel="stylesheet" href="${root}/css/view/website/website_type_1.css">
</head>
<body>
	<div id="section">
		<jsp:include page="/WEB-INF/jsp/view/page_type_1/header.jsp" />
		
		<section id="web_notice">
			<div class="inner">
				<div class="detail_title_area">
					<span>${notice_list.title}</span>
				</div>
				
				<div class="infomation_area">
					<table border="1">
						<tr>
							<td>작성일</td>
							<td>${notice_list.create_day}</td>
							<td>조회수</td>
							<td>${notice_list.views}</td>
						</tr>
						<tr>
							<td>첨부파일</td>
							<td colspan="3">
								<c:if test="${notice_list.file_path != null}">
									<form action="download" method="post">
										<input type="submit" value="다운로드" id="img_download" style="display: none;">
										<label for="img_download" style="cursor: pointer; font-size: 0.9rem;">${notice_list.file_path}</label>
										<input type="hidden" name="filename" value="${notice_list.file_path}">
									</form>
								</c:if>
							</td>
						</tr>
					</table>
				</div>
				
				<div class="text_area">
					<p>${notice_list.contents}</p>
				</div>
				<input type="text" value="contents_idx=${contents_idx}  / idx=${notice_list.idx}">
				<div class="btn_area">
					<a href="web_notice_list?contents_idx=${contents_idx}">목록</a>
					<c:if test="${sessionScope.business_id == content_list.business_num}">
						<a href="notice_management_update?contents_idx=${contents_idx}&idx=${notice_list.idx}">수정</a>
					</c:if>
				</div>
			</div>
			
			<jsp:include page="/WEB-INF/jsp/footer/footer.jsp" />
			
		</section>
	</div>
</body>
</html>