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
	<div id="gallery" class="menu-item">
		<div class="left-item">
			<span>Gallery</span>
			<span>더 마이스의 다양한 갤러리를 만나보세요.</span>
		</div>
		
		<div class="right-item">
			<div class="content-item">
				<div class="img-item">
					<c:forEach var="list" items="${gallery_img_list}" varStatus="st">
						<img src="${root}/gallery_path/${list.img_path}">
					</c:forEach>
				</div>
			</div>
			
			<div class="btn-item">
				<img alt="" src="${root}/img/website2/left_btn.svg" class="left_btn">
				<img alt="" src="${root}/img/website2/right_btn.svg" class="right_btn">
			</div>
			
			<input type="hidden" id="slider_cnt" value="0">
			
			<script type="text/javascript">
				$('.left_btn').click(function () {
					var cnt = $('#slider_cnt').val();
					
					if(cnt != '0'){
						cnt = Number(cnt) - 1;
						$('.img-item').css('transform', 'translateX(calc(-' + cnt + '00%/4))');
						$('#slider_cnt').val(cnt);
					}
				});
				
				$('.right_btn').click(function () {
					var cnt = $('#slider_cnt').val();
					var max = $('.img-item img').length;
					
					if(cnt < Number(max) - 1){
						cnt = Number(cnt) + 1;
						$('.img-item').css('transform', 'translateX(calc(-' + Number(cnt) * 4 + '00%/4))');
						$('#slider_cnt').val(cnt);
					}
				});
			</script>
		</div>
	</div>
</body>
</html>