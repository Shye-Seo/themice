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
<style type="text/css">
#notice .right-item{
	background-image: url("${root}/img/website2/notice_background_${background}.png");
}
</style>
</head>
<body>
   <div id="notice" class="menu-item">
		<div class="right-item">
			<div class="text-item-1">
				<span>company information</span>
			</div>
			
			<div class="line-item"></div>
			
			<div class="text-item-2">
				<span>${business.business_name}</span>
				<span>${business.tel}</span>
				<span>${business.address} ${business.detail_address}</span>
			</div>
			
			<div class="btn-item">
				<img alt="" src="${root}/img/website2/call_icon.svg">
				<img alt="" src="${root}/img/website2/mail_icon.svg">
			</div>
		</div>
		
		<div class="left-item">
			<div class="text-item">
				<span>${web_menu.notice_name}</span>
				<span>더 마이스에서 알려주는 공지사항을 만나보세요.</span>
			</div>
			
			<div class="content-item">
				<c:forEach var="list" items="${notice_list}" varStatus="st">
					<ul>
						<li>${list.create_day}</li>
						<li>${list.title}</li>
					</ul>
				</c:forEach>
				
				<a href="">자세히 보기</a>
			</div>
			
			<img alt="" src="${root}/img/website2/background_logo.svg" class="background_img">
		</div>
	</div>
</body>
</html>