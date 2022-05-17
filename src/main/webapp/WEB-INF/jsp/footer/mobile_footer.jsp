<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<c:set var="root" value="${pageContext.request.contextPath}" />
<script type="text/javascript" src="http://code.jquery.com/jquery-1.12.4.min.js"></script>
<meta name="viewport" content="width=device-width, initial-scale=1">
<style type="text/css">
#mobile_fix_footer{
	position: fixed;
    bottom: 0;
    background-color: white;
    width: 100%;
    height: 55px;
    display: none;
    justify-content: space-evenly;
    border-top: solid;
    border-width: 1px;
    border-color: #e7e7e7;
    font-size: 10px;
    align-items: flex-end;
    z-index: 2000;
}

#mobile_fix_footer .footer_area{
	display: flex;
    flex-direction: row;
    align-items: center;
    width: 100%;
    height: 100%;
}

#mobile_fix_footer .footer_area a{
	width: 20%;
	display: flex;
    flex-direction: column;
    align-items: center;
    color: #333333;
}

#mobile_fix_footer .footer_area span{
	width: 20%;
	display: flex;
    flex-direction: column;
    align-items: center;
}

#mobile_fix_footer .footer_area .center{
	width: 60px;
}

#mobile_fix_footer .footer_area img{
	width: 20px;
	margin-bottom: 5px;
}

#mobile_fix_footer .footer_navi{
	position: fixed;
    display: flex;
    flex-direction: column;
    width: 100%;
    text-align: center;
    font-size: 16px;
    background: #EA933C;
    border-top-left-radius: 15px;
    border-top-right-radius: 15px;
    transition: 1s;
    transform: translateY(100%);
    padding-top: 3%;
    padding-bottom: 3%;
    box-sizing: border-box;
}

#mobile_fix_footer .footer_navi a{
	width: 30%;
    height: 35px;
    color: white;
    background: #ff1f1f14;
    border-radius: 50px;
    margin: 1.2% auto;
    display: flex;
    align-items: center;
    justify-content: center;
}

#mobile_fix_footer .footer_navi img{
	width: 36px;
    margin: 2% auto;
}

.footer_background{
	display: none;
	background-color: black;
    position: fixed;
    height: 100%;
    width: 100%;
    top: 0;
    z-index: 1500;
    opacity: 0.6;
}

@media screen and (max-width: 721px) {
	#mobile_fix_footer{
		display: flex;
	}
}
</style>
</head>
<body>
	<div class="footer_background">
	</div>
	<footer id="mobile_fix_footer">
		<div class="footer_area">
			<a href="main">
				<img alt="" src="${root}/img/footer/home_icon.svg">
				홈
			</a>
			
			<a href="member_payment">
				<img alt="" src="${root}/img/footer/heart_icon.svg">
				결제현황
			</a>
			
			<span>
				<img alt="" src="${root}/img/footer/ticket_icon.svg" class="center">
			</span>
			
			<span id="footer_nav_open_btn">
				<img alt="" src="${root}/img/footer/category_icon.svg">
				메뉴
			</span>
			
			<a href="login_check">
				<img alt="" src="${root}/img/footer/mypage_icon.svg">
				마이페이지
			</a>
		</div>
		
		<div class="footer_navi">
			<a href="list?exhn_type=전체">전체</a>
			<a href="list?exhn_type=박람회">박람회</a>
			<a href="list?exhn_type=전시회">전시회</a>
			<a href="list?exhn_type=페어">페어</a>
			<a href="list?exhn_type=대제전">대제전</a>
			<a href="list?exhn_type=행사">행사</a>
			<img alt="" src="${root}/img/footer/close_btn.svg" class="footer_close">
		</div>
	</footer>
	
	<script type="text/javascript">
		$(function () {
			$('#footer_nav_open_btn').click(function(){
				$('#mobile_nav').css('right', '0');
			});
			
			$('.center').click(function () {
				$('.footer_navi').css('transform', 'translateY(0)');
				$('.footer_background').css('display', 'block');
			});
			
			$('.footer_close').click(function () {
				$('.footer_navi').css('transform', 'translateY(100%)');
				$('.footer_background').css('display', 'none');
			});
		});
	</script>
</body>
</html>