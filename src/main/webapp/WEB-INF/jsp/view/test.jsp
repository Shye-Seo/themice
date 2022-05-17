<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<c:set var="root" value="${pageContext.request.contextPath}" />
<title>THE MICE</title>
<link rel="icon" href="${root}/img/common/favicon.svg">
<script src="https://code.jquery.com/jquery-3.4.1.js"></script>
<style type="text/css">
</style>
</head>
<body>
	<form method="post" action="test">
		<div class="menu_category_1">
			<input type="text" name="menu_item" placeholder="제목을 입력해주세요.">
			<select name="sequence">
				<option value="0"></option>
				<option value="1">1</option>
				<option value="2">2</option>
				<option value="3">3</option>
				<option value="4">4</option>
				<option value="5">5</option>
				<option value="6">6</option>
			</select>
			
			<div class="close_area">
				<img alt="" src="${root}/img/insertcontents/menu_close.svg" onclick="menu_close(1)">
			</div>
		</div>
		
		<div class="menu_category_2">
			<input type="text" name="menu_item" placeholder="제목을 입력해주세요.">
			<select name="sequence">
				<option value="0"></option>
				<option value="1">1</option>
				<option value="2">2</option>
				<option value="3">3</option>
				<option value="4">4</option>
				<option value="5">5</option>
				<option value="6">6</option>
			</select>
			
			<div class="close_area">
				<img alt="" src="${root}/img/insertcontents/menu_close.svg" onclick="menu_close(2)">
			</div>
		</div>
		
		<div class="menu_category_3">
			<input type="text" name="menu_item" placeholder="제목을 입력해주세요.">
			<select name="sequence">
				<option value="0"></option>
				<option value="1">1</option>
				<option value="2">2</option>
				<option value="3">3</option>
				<option value="4">4</option>
				<option value="5">5</option>
				<option value="6">6</option>
			</select>
			
			<div class="close_area">
				<img alt="" src="${root}/img/insertcontents/menu_close.svg" onclick="menu_close(3)">
			</div>
		</div>
		
		<input type="submit" value="완료">
		
		<script type="text/javascript">
			function menu_close(num) {
				$('.menu_category_' + num).css('display', 'none');
				$('.menu_category_' + num + ' select').val('0').prop('selected', true);
			}
		</script>
	</form>
</body>
</html>