<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:set var="root" value="${pageContext.request.contextPath}" />

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>THE MICE</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="icon" href="${root}/img/common/favicon.svg">
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;300;400;500;700;900&display=swap" rel="stylesheet">
<link rel="stylesheet" href="${root}/css/view/website2/notice_detail.css">
<script src="//code.jquery.com/jquery-1.11.3.min.js"></script>
</head>
<body>
<jsp:include page="header.jsp"/>
<script>
	var goBackBtn = document.getElementById('goBack')
	goBackBtn.addEventListener("click", function(){
		location.href = '${root}/website2/notice'
	})
</script>
<div class="notice_banner"><img src="${root}/img/website2/notice_banner.png"></div>
<div class="notice_detail_wrap">
	<div class="nd_inner_wrap">
		<div class="nd_title"><span>${notice_list.title}</span></div>
		<table class="nd_table">
			<tbody>
				<tr class="f_tr">
					<th>작성일</th>
					<td class="f_td">${notice_list.create_day}</td>
					<th>조회수</th>
					<td class="s_td">${notice_list.views}</td>
				</tr>
				<tr>
					<th>첨부파일</th>
					<td class="f_td">코로나공연일정.png</td>
				</tr>
			</tbody>
		</table>
		<div class="nd_content">
			${notice_list.contents}
		</div>
		<div class="nd_img"><img src="${root }/img/website2/notice_detail_sample.png"></div>
		<div class="nd_btn_function"><button class="nd_btn" onclick="location.href = 'web_notice_list?contents_idx=${contents_idx}'">목록</button></div>
	</div>
</div>
	
<jsp:include page="footer.jsp"/>
</body>
</html>