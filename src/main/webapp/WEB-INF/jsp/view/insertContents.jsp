<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<c:set var="root" value="${pageContext.request.contextPath}" />
<title>THE MICE</title>
<link rel="icon" href="${root}/img/common/favicon.svg">
<link rel="stylesheet"
	href="${root}/css/view/insertContents/insertContents.css">
<link rel="stylesheet" href="${root}/css/view/style.css">
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<script type="text/javascript"
	src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
<script src="${root}/js/map.js"></script>
<script>	
	function SetCookie(strName, strValue, iSecond) {
		var strCookie = strName + "=" + encodeURIComponent(strValue);
		if (typeof iSecond === "number") {
			strCookie += "; max-age=" + iSecond;
		}
		document.cookie = strCookie;
	}

	var timer = setInterval(function() {
		autosave();
	}, 5000)

	function addData() {
		var title = document.getElementById("title").value;
		var start_day = document.getElementById("start_day").value;
		var end_day = document.getElementById("end_day").value;
		var start_time = document.getElementById("start_time").value;
		var end_time = document.getElementById("end_time").value;
		var exhbn_type = document.getElementById("exhbn_type").value;
		var roadAddress = document.getElementById("roadAddress").value;
		var detail_address = document.getElementById("detail_address").value;
		var content = document.getElementById("content").value;

		SetCookie('title', title, 600);
		SetCookie('start_day', start_day, 600);
		SetCookie('end_day', start_day, 600);
		SetCookie('start_time', start_time, 600);
		SetCookie('end_time', end_time, 600);
		SetCookie('exhbn_type', exhbn_type, 600);
		SetCookie('roadAddress', roadAddress, 600);
		SetCookie('detail_address', detail_address, 600);
		SetCookie('content', content, 600);
		clearInterval(timer);
	}

	function autosave() {
		var title = document.getElementById("title").value;
		var start_day = document.getElementById("start_day").value;
		var end_day = document.getElementById("end_day").value;
		var start_time = document.getElementById("start_time").value;
		var end_time = document.getElementById("end_time").value;
		var exhbn_type = document.getElementById("exhbn_type").value;
		var roadAddress = document.getElementById("roadAddress").value;
		var detail_address = document.getElementById("detail_address").value;
		var content = document.getElementById("content").value;

		SetCookie('title', title, 600);
		SetCookie('start_day', start_day, 600);
		SetCookie('end_day', start_day, 600);
		SetCookie('start_time', start_time, 600);
		SetCookie('end_time', end_time, 600);
		SetCookie('exhbn_type', exhbn_type, 600);
		SetCookie('roadAddress', roadAddress, 600);
		SetCookie('detail_address', detail_address, 600);
		SetCookie('content', content, 600);
	}

	function readCookie(name) {
		var nameEQ = name + "=";
		var ca = document.cookie.split(';');
		for (var i = 0; i < ca.length; i++) {
			var c = ca[i];
			while (c.charAt(0) == ' ')
				c = c.substring(1, c.length);
			if (c.indexOf(nameEQ) == 0)
				return c.substring(nameEQ.length, c.length);
		}
		return null;
	}

	window.onload = function ShowCookie() {
		var title = decodeURI(readCookie('title'));
		var start_day = decodeURI(readCookie('start_day'));
		var end_day = decodeURI(readCookie('end_day'));
		var start_time = readCookie('start_time');
		var end_time = readCookie('end_time');
		var exhbn_type = decodeURI(readCookie('exhbn_type'));
		var roadAddress = decodeURI(readCookie('roadAddress'));
		var detail_address = decodeURI(readCookie('detail_address'));
		var content = decodeURI(readCookie('content'));
		
		if (title == null || title == "null") {
			$('#title').val('');
			return;
		} else {
			document.getElementById('title').value = title;
		}
		if (start_day == null || start_day == "") {
			return;
		} else {
			document.getElementById('start_day').value = start_day;
		}
		if (end_day == null || end_day == "") {
			return;
		} else {
			document.getElementById('end_day').value = end_day;
		}
		if (start_time == null || start_time == "") {
			return;
		} else {
			document.getElementById('start_time').value = start_time;
		}
		if (end_time == null || end_time == "") {
			return;
		} else {
			document.getElementById('end_time').value = end_time;
		}
		if (exhbn_type == null || exhbn_type == "") {
			return;
		} else {
			document.getElementById('exhbn_type').value = exhbn_type;
		}
		if (roadAddress == null || roadAddress == "") {
			$('#roadAddress').val('');
			return;
		} else {
			document.getElementById('roadAddress').value = roadAddress;
		}
		if (detail_address == null || detail_address == "null") {
			$('#detail_address').val('');
			return;
		} else {
			document.getElementById('detail_address').value = detail_address;
		}
		if (content != null || content != "null") {
			return;
		} else {
			document.getElementById('content').value = content;
		}
	}
</script>
<style type="text/css">
input[type="time"]::-webkit-calendar-picker-indicator {
	background-image: url("${root}/img/insertcontents/input_arrow.svg");
	background-position-x: 95%;
	background-position-y: center;
	cursor: pointer;
}

input[type="date"]::-webkit-calendar-picker-indicator {
	background-image: url("${root}/img/insertcontents/input_arrow.svg");
	background-position-x: 95%;
	background-position-y: center;
	cursor: pointer;
}

select {
	background-image: url("${root}/img/insertcontents/input_arrow.svg");
	cursor: pointer;
	background-repeat: no-repeat;
	-webkit-appearance: none;
	-moz-appearance: none;
	appearance: none;
	background-position-x: 95%;
	background-position-y: center;
}

select::-ms-expand {
	display: none;
}
</style>
</head>
<body>
	<jsp:include page="/WEB-INF/jsp/aside/quick.jsp" />
	<jsp:include page="/WEB-INF/jsp/header/header.jsp" />
	<div class="header">
		<div class="title">
			<span>전시등록</span>
		</div>
	</div>
	<section>
		<div class="title_area">
			<span>기본정보</span>
		</div>
		<div class="essential_area">
			<span>*</span>
			<p>필수 입력사항</p>
		</div>
		<form method="post" action="insertContents" enctype="multipart/form-data" id="form_data">
			<div class="page_1">
				<div class="infomation_area">
					<div class="left">
						<span>*</span>
						<ul>
							<li>제목</li>
						</ul>
					</div>
					<div class="right">
						<input type="text" placeholder="20자 이내로 입력해주세요." name="title" id="title" class="input_1">
					</div>
				</div>

				<div class="infomation_area">
					<div class="left">
						<span>*</span>
						<ul>
							<li>기간</li>
						</ul>
					</div>
					<div class="right">
						<input type="date" name="start_day" id="start_day" class="input_2">
						<span>~</span>
						<input type="date" name="end_day" id="end_day" class="input_2" min="">
					</div>
				</div>

				<div class="infomation_area">
					<div class="left">
						<span>*</span>
						<ul>
							<li>시간</li>
						</ul>
					</div>
					<div class="right">
						<input type="time" name="start_time" id="start_time" class="input_2">
						<span>~</span>
						<input type="time" name="end_time" id="end_time" class="input_2">
					</div>
				</div>
				
				<div class="infomation_area">
					<div class="left">
						<span>*</span>
						<ul>
							<li>전화</li>
						</ul>
					</div>
					<div class="right">
						<input type="text" placeholder="하이픈(-)을 포함하여 적어주세요." name="tel" id="tel" class="input_1">
					</div>
				</div>
				
				<div class="infomation_area">
					<div class="left">
						<span>*</span>
						<ul>
							<li>팩스</li>
						</ul>
					</div>
					<div class="right">
						<input type="text" placeholder="하이픈(-)을 포함하여 적어주세요." name="fax" id="fax" class="input_1">
					</div>
				</div>

				<div class="infomation_area">
					<div class="left">
						<span>*</span>
						<ul>
							<li>관람료</li>
						</ul>
					</div>
					<div class="right_2">
						<div class="price_insert_area">
							<input id="price" type="text" placeholder="미 작성시 자동으로 무료로 전환됩니다."
							oninput="this.value = this.value.replace(/[^0-9.]/g, '').replace(/(\..*)\./g, '$1');">
							<select id="age_type" class="select" style="width:20%;">
								<option value="1">성인</option>
								<option value="2">중,고등학생</option>
								<option value="3">초등학생</option>
								<option value="4">아동</option>
							</select>
							<input type="button" onclick="Price_insert()" value="등록" class="price_btn">
						</div>
						<div class="key_item">
							<ul>
								<li><span class="price_item_1"></span> <img
									src="${root}/img/insertcontents/close.svg"
									class="price_img_item_1" onclick="Price_close(1)"><input
									type="hidden" name="price" id="price_1" value="null"></li>
								<li><span class="price_item_2"></span> <img
									src="${root}/img/insertcontents/close.svg"
									class="price_img_item_2" onclick="Price_close(2)"><input
									type="hidden" name="price" id="price_2" value="null"></li>
								<li><span class="price_item_3"></span> <img
									src="${root}/img/insertcontents/close.svg"
									class="price_img_item_3" onclick="Price_close(3)"><input
									type="hidden" name="price" id="price_3" value="null"></li>
								<li><span class="price_item_4"></span> <img
									src="${root}/img/insertcontents/close.svg"
									class="price_img_item_4" onclick="Price_close(4)"><input
									type="hidden" name="price" id="price_4" value="null"></li>
							</ul>
						</div>

						<script type="text/javascript">
							function Price_insert() {
								var age_type = $('#age_type').val();
								var age_type_text = $('#age_type option:checked').text();
								var value = $('#price').val();

								if(value != ""){
									for(var i = 1; i < 5; i++){
										
										if(i == age_type){
											$('.price_item_'+i).text(age_type_text + ' ' + value + '원');
											$('.price_img_item_'+i).show();
											$('#price').val('');
											$('#price_'+i).val(value);
											break;
										}
									}
								}
							}
							
							function Price_close(num) {
								$('.price_item_'+num).text('');
								$('.price_img_item_'+num).hide();
								$('#price_'+num).val('null');
							}
							
							
							$(function() {
								$('#price').on("keyup",function(key){
							        if(key.keyCode==13) {
							            var age_type = $('#age_type').val();
										var age_type_text = $('#age_type option:checked').text();
										var value = $('#price').val();
										
										if(value != ""){
											for(var i = 1; i < 5; i++){
												
												if(i == age_type){
													$('.price_item_'+i).text(age_type_text + ' ' + value + '원');
													$('.price_img_item_'+i).show();
													$('#price').val('');
													$('#price_'+i).val(value);
													break;
												}
											}
										}
							        }
							    });
							});
						</script>
					</div>
				</div>
				
				<div class="infomation_area">
					<div class="left">
						<span>*</span>
						<ul>
							<li>관람연령</li>
						</ul>
					</div>
					<div class="right">
						<select name="age" id="age" class="input_3" style="width: 45%;">
							<option value="전체관람가">전체관람가</option>
							<option value="12세 이상 관람가">12세 이상 관람가</option>
							<option value="15세 이상 관람가">15세 이상 관람가</option>
							<option value="청소년 관람불가">청소년 관람불가</option>
						</select>
					</div>
				</div>

				<div class="infomation_area">
					<div class="left">
						<span>*</span>
						<ul>
							<li>전시타입</li>
						</ul>
					</div>
					<div class="right">
						<select name="exhn_type" id="exhbn_type" class="input_3" style="width: 45%;">
							<option value="박람회">박람회</option>
							<option value="전시회">전시회</option>
							<option value="페어">페어</option>
							<option value="대제전">대제전</option>
							<option value="행사">행사</option>
						</select>
					</div>
				</div>

				<div class="infomation_area">
					<div class="left">
						<span>*</span>
						<ul>
							<li>전시장소</li>
						</ul>
					</div>
					<div class="right">
						<div id="offline">
							<input type="text" id="roadAddress" placeholder="도로명주소" class="input" name="address" onclick="sample4_execDaumPostcode()" readonly> 
							<input type="button" onclick="sample4_execDaumPostcode()" value="주소검색" class="post">
							<input type="text" id="detail_address" placeholder="상세주소" class="input" name="detail_address">
							<input type="hidden" id="postcode" placeholder="주소검색" class="input">
						</div>
						<div id="online">
							<input type="text" placeholder="홈페이지를 입력해주세요." class="input" name="web_address" id="web_address">
						</div>
						<div class="address_select_area">
							<select name="selectBox" id="selectBox" class="select" style="width: 100%;" class="input_select">
								<option value="offline">오프라인</option>
								<option value="online">온라인</option>
							</select>
						</div>
					</div>


					<script type="text/javascript">
							$('#selectBox').change(function() {
								var result = $('#selectBox option:selected').val();
								console.log(result);
								if (result == 'offline') {
									$('#offline').css('display', 'block');
									$('#online').css('display', 'none');
								} else {
									$('#offline').css('display', 'none');
									$('#online').css('display', 'block');
								}
							});
					</script>
				</div>

				<div class="infomation_area">
					<div class="left">
						<ul>
							<li>전시내용</li>
						</ul>
					</div>
					<div class="right">
						<input type="text" placeholder="50자 이내로 입력해주세요." name="content"
							id="content" class="input_4">
					</div>
				</div>

				<div class="infomation_area">
					<div class="left">
						<ul>
							<li>전시 검색어</li>
						</ul>
					</div>

					<div class="right_2">
						<div class="key_insert">
							<input id="keyword" type="text"
								placeholder="공백은 자동으로 붙여쓰기 하여 한 키워드로 등록됩니다."> <input
								type="button" onclick="Keyword_insert()" value="등록"
								class="key_word_input">
						</div>
						<div class="key_item">
							<ul>
								<li><span class="keyword_item_1">1</span> <img
									src="${root}/img/insertcontents/close.svg"
									class="keyword_img_item_1" onclick="Keyword_close(1)"><input
									type="hidden" name="key_word" id="key_word_1" value="null"></li>
								<li><span class="keyword_item_2">2</span> <img
									src="${root}/img/insertcontents/close.svg"
									class="keyword_img_item_2" onclick="Keyword_close(2)"><input
									type="hidden" name="key_word" id="key_word_2" value="null"></li>
								<li><span class="keyword_item_3">3</span> <img
									src="${root}/img/insertcontents/close.svg"
									class="keyword_img_item_3" onclick="Keyword_close(3)"><input
									type="hidden" name="key_word" id="key_word_3" value="null"></li>
								<li><span class="keyword_item_4">4</span> <img
									src="${root}/img/insertcontents/close.svg"
									class="keyword_img_item_4" onclick="Keyword_close(4)"><input
									type="hidden" name="key_word" id="key_word_4" value="null"></li>
							</ul>
						</div>

						<script type="text/javascript">
								function Keyword_insert() {
									var word = $('#keyword').val();
									for(var i = 1; i < 5; i++){
										var key_num = $('.keyword_item_' + i).text();
										if(i == key_num){
											$('.keyword_item_'+i).text(word);
											$('.keyword_img_item_'+i).show();
											$('#keyword').val('');
											$('#key_word_'+i).val(word);
											break;
										}
									}
								}
								
								function Keyword_close(num) {
									$('.keyword_item_'+num).text(num);
									$('.keyword_img_item_'+num).hide();
								}
								
								$(function() {
									$('#keyword').on("keyup",function(key){
								        if(key.keyCode==13) {
								        	var word = $('#keyword').val();
											for(var i = 1; i < 5; i++){
												var key_num = $('.keyword_item_' + i).text();
												if(i == key_num){
													$('.keyword_item_'+i).text(word);
													$('.keyword_img_item_'+i).show();
													$('#keyword').val('');
													$('#key_word_'+i).val(word);
													break;
												}
											}
								        }
								    });
								});
							</script>
					</div>
				</div>

				<div class="infomation_area">
					<div class="left">
						<span>*</span>
						<ul>
							<li>대표사진</li>
						</ul>
					</div>

					<div class="right_2">
						<div id="image_container"
							style="background-image: url('${root}/img/insertcontents/symbol_background.svg');">
							<label for="symbol_image" class="symbol_image_btn">첨부 파일</label>
						</div>
						<input type="file" id="symbol_image" accept="image/*"
							onchange="setThumbnail(event);" name="symbol_img" />
						<script>
							function setThumbnail(event) {
								var id = $(this).attr('id');
								var reader = new FileReader();
								reader.onload = function(event) {
									var img = document.createElement("img");
									img.setAttribute("src", event.target.result);
									document.querySelector("div#image_container").appendChild(img);
								};
								reader.readAsDataURL(event.target.files[0]);
							}
							
							$(function () {
								$('input[name=symbol_img]').off().on('change', function(){
									if (this.files && this.files[0]) {
										var fileForm = /(.*?)\.(jpg|jpeg|png|gif|bmp|pdf)$/;
										var imgFile = $(this).val();
										var maxSize = 5 * 1024 * 1024;
										var fileSize = this.files[0].size;
										
										if(!imgFile.match(fileForm)) {
									    	alert("이미지 파일만 업로드 가능합니다.");
									    	$(this).val('');
									        return false;
									    } else if(fileSize > maxSize){
											alert("이미지 크기는 5MB 이내로 등록 가능합니다.");
											$(this).val('');
											return false;
										}
									}
								});
							});
						</script>
					</div>
				</div>
			</div>

			<div class="page_2">
				<div class="infomation_area">
					<div class="left">
						<span>*</span>
						<ul>
							<li>전시 상세페이지</li>
						</ul>
					</div>
					<div class="right_3">
						<div class="color_category">
							<input type="radio" name="layout_type_" value="1" id="color_item_1">
							<label for="color_item_1">스타일 1</label>
							<input type="radio" name="layout_type_" value="2" id="color_item_2">
							<label for="color_item_2">스타일 2</label>
							<input type="radio" name="layout_type_" value="3" id="color_item_3">
							<label for="color_item_3">스타일 3</label>
							<input type="radio" name="layout_type_" value="4" id="color_item_4">
							<label for="color_item_4">스타일 4</label>
						</div>
						
						<script type="text/javascript">
						
							$('input[name=layout_type_]').change(function () {
								var layout_type = $(this).val();
								if(layout_type == '1'){
									$('.detail_page_1').css('display', 'block');
									$('.detail_page_2').css('display', 'none');
									$('.detail_page_3').css('display', 'none');
									$('.detail_page_4').css('display', 'none');
									$('#layout_type').val(1);
								} else if(layout_type == '2'){
									$('.detail_page_1').css('display', 'none');
									$('.detail_page_2').css('display', 'block');
									$('.detail_page_3').css('display', 'none');
									$('.detail_page_4').css('display', 'none');
									$('#layout_type').val(2);
								} else if(layout_type == '3'){
									$('.detail_page_1').css('display', 'none');
									$('.detail_page_2').css('display', 'none');
									$('.detail_page_3').css('display', 'block');
									$('.detail_page_4').css('display', 'none');
									$('#layout_type').val(3);
								} else if(layout_type == '4'){
									$('.detail_page_1').css('display', 'none');
									$('.detail_page_2').css('display', 'none');
									$('.detail_page_3').css('display', 'none');
									$('.detail_page_4').css('display', 'block');
									$('#layout_type').val(4);
								}
							});
						</script>

						<div class="detail_page_1 detail_page">
							<img src="${root}/img/insertcontents/detail_type/detail_page_1.png">
							<input multiple="multiple" type="file" name="file" accept="image/*" id="detail_img_1">
							<label for="detail_img_1" class="label_1">이미지 1</label>
							<input multiple="multiple" type="file" name="file" accept="image/*" id="detail_img_2">
							<label for="detail_img_2" class="label_2">이미지 2</label>
							<input multiple="multiple" type="file" name="file" accept="image/*" id="detail_img_3">
							<label for="detail_img_3" class="label_3">이미지 3</label>
							<input multiple="multiple" type="file" name="file" accept="image/*" id="detail_img_4">
							<label for="detail_img_4" class="label_4">이미지 4</label>
							<input multiple="multiple" type="file" name="file" accept="image/*" id="detail_img_5">
							<label for="detail_img_5" class="label_5">이미지 5</label>
							<label id="sub_title_btn">보조 제목</label>
							<span>보조 제목</span>
							<input type="text" name="sub_title" id="sub_title_1" style="display: block; width: 55%; font-size: 1rem; margin: 1% 0;">
							<input type="text" name="sub_title" id="sub_title_2" style="display: block; width: 55%; font-size: 1rem; margin: 1% 0;">
							<input type="text" name="sub_title" id="sub_title_3" style="display: block; width: 55%; font-size: 1rem; margin: 1% 0;">
						</div>

						<div class="detail_page_2 detail_page">
							<img src="${root}/img/insertcontents/detail_type/detail_page_2.png">
							<input multiple="multiple" type="file" name="file" accept="image/*" id="detail_img_1">
							<label for="detail_img_1" class="label_1">이미지 1</label>
							<input multiple="multiple" type="file" name="file" accept="image/*" id="detail_img_2">
							<label for="detail_img_2" class="label_2">이미지 2</label>
							<input multiple="multiple" type="file" name="file" accept="image/*" id="detail_img_3">
							<label for="detail_img_3" class="label_3">이미지 3</label>
							<input multiple="multiple" type="file" name="file" accept="image/*" id="detail_img_4">
							<label for="detail_img_4" class="label_4">이미지 4</label>
							<input multiple="multiple" type="file" name="file" accept="image/*" id="detail_img_5">
							<label for="detail_img_5" class="label_5">이미지 5</label>
							<input multiple="multiple" type="file" name="file" accept="image/*" id="detail_img_6">
							<label for="detail_img_6" class="label_6">이미지 6</label>
							
							<label id="sub_title_btn">보조 제목</label>
							<span>보조 제목</span>
							<input type="text" name="sub_title" id="sub_title_4" style="display: block; width: 55%; font-size: 1rem; margin: 1% 0;">
							<input type="text" name="sub_title" id="sub_title_5" style="display: block; width: 55%; font-size: 1rem; margin: 1% 0;">
							<input type="text" name="sub_title" id="sub_title_6" style="display: block; width: 55%; font-size: 1rem; margin: 1% 0;">
						</div>
						
						<div class="detail_page_3 detail_page">
							<img src="${root}/img/insertcontents/detail_type/detail_page_4.png">
							<input multiple="multiple" type="file" name="file" accept="image/*" id="detail_img_1">
							<label for="detail_img_1" class="label_1">이미지 1</label>
							<input multiple="multiple" type="file" name="file" accept="image/*" id="detail_img_2">
							<label for="detail_img_2" class="label_2">이미지 2</label>
							<input multiple="multiple" type="file" name="file" accept="image/*" id="detail_img_3">
							<label for="detail_img_3" class="label_3">이미지 3</label>
							<input multiple="multiple" type="file" name="file" accept="image/*" id="detail_img_4">
							<label for="detail_img_4" class="label_4">이미지 4</label>
							<input multiple="multiple" type="file" name="file" accept="image/*" id="detail_img_5">
							<label for="detail_img_5" class="label_5">이미지 5</label>
							<input multiple="multiple" type="file" name="file" accept="image/*" id="detail_img_6">
							<label for="detail_img_6" class="label_6">이미지 6</label>
							<input multiple="multiple" type="file" name="file" accept="image/*" id="detail_img_7">
							<label for="detail_img_7" class="label_7">이미지 7</label>
						</div>

						<div class="detail_page_4 detail_page">
							<img src="${root}/img/insertcontents/detail_type/detail_page_8.png">
							<input multiple="multiple" type="file" name="file" accept="image/*" id="detail_img_1">
							<label for="detail_img_1" class="label_1">이미지 1</label>
							<input multiple="multiple" type="file" name="file" accept="image/*" id="detail_img_2">
							<label for="detail_img_2" class="label_2">이미지 2</label>
							<input multiple="multiple" type="file" name="file" accept="image/*" id="detail_img_3">
							<label for="detail_img_3" class="label_3">이미지 3</label>
							<input multiple="multiple" type="file" name="file" accept="image/*" id="detail_img_4">
							<label for="detail_img_4" class="label_4">이미지 4</label>
							<input multiple="multiple" type="file" name="file" accept="image/*" id="detail_img_5">
							<label for="detail_img_5" class="label_5">이미지 5</label>
							
							<label id="sub_title_btn">보조 제목</label>
							<span>보조 제목</span>
							<input type="text" name="sub_title" id="sub_title_7" style="display: block; width: 55%; font-size: 1rem; margin: 1% 0;">
							<input type="text" name="sub_title" id="sub_title_8" style="display: block; width: 55%; font-size: 1rem; margin: 1% 0;">
							<input type="text" name="sub_title" id="sub_title_9" style="display: block; width: 55%; font-size: 1rem; margin: 1% 0;">
						</div>
					</div>
				</div>
				<input type="hidden" name="layout_type" value="" id="layout_type">
				<script type="text/javascript">
						$(function() {
							$('input[name=file]').off().on('change', function(){

								if (this.files && this.files[0]) {

									var fileForm = /(.*?)\.(jpg|jpeg|png|gif|bmp|pdf)$/;
									var imgFile = $(this).val();
									var maxSize = 5 * 1024 * 1024;
									var fileSize = this.files[0].size;
									
									if(!imgFile.match(fileForm)) {
								    	alert("이미지 파일만 업로드 가능합니다.");
								    	$(this).val('');
								        return false;
								    } else if(fileSize > maxSize){
										alert("이미지 크기는 5MB 이내로 등록 가능합니다.");
										$(this).val('');
										return false;
									} else {
										
										var page = $('#layout_type').val();
										
										for(var i = 1; i < 8; i++){
											var file = $('#detail_img_' + i).val();
											
											if(file == ''){
												$('.detail_page_' + page + ' .label_' + i).css('background-color', 'white');
												$('.detail_page_' + page + ' .label_' + i).css('color', '#333');
											} else {
												$('.detail_page_' + page + ' .label_' + i).css('background-color', '#EA933C');
												$('.detail_page_' + page + ' .label_' + i).css('color', 'white');
											}
										}
									}
								}
							});
						});
					</script>

				<div class="infomation_area">
					<div class="left">
						<ul>
							<li>폰트</li>
						</ul>
					</div>
					<div class="right">
						<select name="font_type" class="font_type">
							<option value="1">카페 아네모네</option>
							<option value="2">에스코어 드림</option>
							<option value="3">비트로 코어 OTF</option>
							<option value="4">나눔고딕</option>
							<option value="5">나눔명조 옛한글</option>
							<option value="6">Oriya MN</option>
						</select>
					</div>
				</div>

				<div class="infomation_area">
					<div class="left">
						<ul>
							<li>배경패턴</li>
						</ul>
					</div>
					<div class="right_4"style="justify-content: space-between;">
						<span class="pattern">
							<input type="radio" id="pattern_1" name="pattern" value="1">
							<label for="pattern_1"><img src="${root}/img/insertcontents/pattern/pattern_1.png"></label>
						</span> 
						
						<span class="pattern">
							<input type="radio" id="pattern_2" name="pattern" value="2">
							<label for="pattern_2"><img src="${root}/img/insertcontents/pattern/pattern_2.png"></label>
						</span>
						
						<span class="pattern">
							<input type="radio" id="pattern_3" name="pattern" value="3">
							<label for="pattern_3"><img src="${root}/img/insertcontents/pattern/pattern_3.png"></label>
						</span>
						
						<span class="pattern">
							<input type="radio" id="pattern_4" name="pattern" value="4">
							<label for="pattern_4"><img src="${root}/img/insertcontents/pattern/pattern_4.png"></label>
						</span>
						
						<span class="pattern">
							<input type="radio" id="pattern_5" name="pattern" value="5">
							<label for="pattern_5"><img src="${root}/img/insertcontents/pattern/pattern_5.png"></label>
						</span>
						
						<span class="pattern">
							<input type="radio" id="pattern_6" name="pattern" value="6">
							<label for="pattern_6"><img src="${root}/img/insertcontents/pattern/pattern_6.png"></label>
						</span>
						
						<span class="pattern">
							<input type="radio" id="pattern_7" name="pattern" value="7">
							<label for="pattern_7"><img src="${root}/img/insertcontents/pattern/pattern_7.png"></label>
						</span>
					</div>
				</div>

				<div class="infomation_area">
					<div class="left">
						<ul>
							<li>배경색상</li>
						</ul>
					</div>
					<div class="right_4">
						<input type="text" name="background_color" class="back_color">
						<input type="color" id="head" value="#FFFFFF"><label for="head" class="color_choice">색상	고르기</label>
						<input type="button" value="확인" onclick="check()" class="color_submiit">
					</div>
					<script>
						function check() {
							var color = $('#head').val();
							$('.back_color').val(color);
						}
					</script>
				</div>
			</div>

			<div class="page_3">
				<div class="infomation_area">
					<div class="left">
						<ul>
							<li>사이트</li>
						</ul>
					</div>
					<div class="right web_select_area">
<!-- 						<select class="web_type" name="website_type"> -->
<!-- 							<option value="1">A 타입</option> -->
<!-- 							<option value="2" disabled>B 타입</option> -->
<!-- 						</select> -->
						
						<div class="web_A_type">
							<img alt="" src="${root}/img/insertcontents/web_A_type_thumbnail.png">
							<img alt="" src="${root}/img/insertcontents/web_type_plus.svg" class="web_plus_btn">
						</div>
						
						<div class="web_B_type">
							<img alt="" src="${root}/img/insertcontents/web_B_type_thumbnail.png">
							<img alt="" src="${root}/img/insertcontents/web_type_plus.svg" class="web_plus_btn">
						</div>
						
						<div class="web_A_type_detail">
							<img alt="" src="${root}/img/insertcontents/web_A_type.png">
							<img alt="" src="${root}/img/insertcontents/web_close_btn.svg" class="web_close_btn">
						</div>
						
						<div class="web_B_type_detail">
							<img alt="" src="${root}/img/insertcontents/web_B_type.png">
							<img alt="" src="${root}/img/insertcontents/web_close_btn.svg" class="web_close_btn">
						</div>
						
						<script type="text/javascript">
							
							$(function () {
								$('.category_select option[value=4]').prop('disabled', false);
								$('.category_select option[value=6]').prop('disabled', true);
							});
							
// 							$("select option[value*='2']").prop('disabled',true);
							
							$(".web_type").change(function(){
								var val = $('.web_type').val();
								if(val == '2'){
									$(".menu_select_area option[value='6']").prop('disabled', false);
									$('.web_A_type').css('display', 'none');
									$('.web_B_type').css('display', 'block');
									$('.category_select option[value=4]').prop('disabled', true);
									$('.category_select option[value=6]').prop('disabled', false);
								} else {
									$(".menu_select_area option[value='6']").prop('disabled', true);
									$('.web_A_type').css('display', 'block');
									$('.web_B_type').css('display', 'none');
									$('.category_select option[value=4]').prop('disabled', false);
									$('.category_select option[value=6]').prop('disabled', true);
								}
							});
							
							$('.web_A_type').click(function () {
								$('.web_A_type_detail').css('display', 'block');
							});
							
							$('.web_B_type').click(function () {
								$('.web_B_type_detail').css('display', 'block');
							});
							
							$('.web_close_btn').click(function () {
								$('.web_A_type_detail').css('display', 'none');
								$('.web_B_type_detail').css('display', 'none');
							});
						</script>
					</div>
				</div>
				
				<div class="infomation_area">
					<div class="left">
						<span>*</span>
						<ul>
							<li>로고</li>
						</ul>
					</div>
					<div class="right">
						<span id="logo_name"></span>
						<input type="file" name="logo_name_" id="logo_img" accept="image/*">
						<label for="logo_img">이미지 첨부</label>
					</div>
				</div>
				
				<div class="infomation_area">
					<div class="left">
						<span>*</span>
						<ul>
							<li>메인 이미지</li>
						</ul>
					</div>
					<div class="right">
						<span id="web_main_name"></span>
						<input type="file" name="web_main_name_" id="web_main_img" accept="image/*">
						<label for="web_main_img">이미지 첨부</label>
					</div>
				</div>
				
				<div class="infomation_area">
					<div class="left">
						<span>*</span>
						<ul>
							<li>배너</li>
						</ul>
					</div>
					<div class="right">
						<span id="banner_name"></span>
						<input type="file" name="banner" id="banner_img" accept="image/*">
						<label for="banner_img">이미지 첨부</label>
					</div>
				</div>
				
<!-- 				<div class="infomation_area"> -->
<!-- 					<div class="left"> -->
<!-- 						<span>*</span> -->
<!-- 						<ul> -->
<!-- 							<li>메</li> -->
<!-- 							<li>뉴</li> -->
<!-- 						</ul> -->
<!-- 					</div> -->
					
<!-- 					<div class="right"> -->
<!-- 						<select class="category_select"> -->
<!-- 							<option>메뉴를 선택해주세요.</option> -->
<!-- 							<option value="1">전시소개</option> -->
<!-- 							<option value="2">갤러리</option> -->
<!-- 							<option value="3">위치안내</option> -->
<!-- 							<option value="4">댓글달기</option> -->
<!-- 							<option value="5">환불규정</option> -->
<!-- 							<option value="6">미디어</option> -->
<!-- 						</select> -->
						
<%-- 						<img alt="" src="${root}/img/insertcontents/menu_plus.svg" class="menu_plus_btn"> --%>
						
<!-- 						<input type="hidden" value="0" id="category_select_cnt"> -->
						
<!-- 						<script type="text/javascript"> -->
<!-- // 							$('.menu_plus_btn').click(function () { -->
<!-- // 								var select = $('.category_select').val(); -->
<!-- // 								var cnt = $('#category_select_cnt').val(); -->
								
<!-- // 								if(select != '') { -->
<!-- // 									$('.menu_category_' + select).css('display', 'flex'); -->
<!-- // 									$(".menu_category select option[value='" + cnt +"']").prop('disabled', false); -->
									
<!-- // 									cnt = Number(cnt) + 1; -->
<!-- // 									$('#category_select_cnt').val(cnt); -->
<!-- // 								} -->
<!-- // 							}); -->
<!-- 						</script> -->
<!-- 					</div> -->
				</div>
				
				<div class="menu_area">
					<div class="menu_category menu_category_1">
						<div class="left">
							<span>전시소개</span>
						</div>
						
						<div class="right">
							<div class="sequence_area">
								<input type="text" name="introduction_name" placeholder="제목을 입력해주세요.">
								<select name="introduction_seq">
									<option value="0"></option>
									<option value="1">1</option>
									<option value="2">2</option>
									<option value="3">3</option>
									<option value="4">4</option>
									<option value="5">5</option>
									<option value="6">6</option>
								</select>
							</div>
							
							<div class="close_area">
								<img alt="" src="${root}/img/insertcontents/menu_close.svg" onclick="menu_close(1)">
							</div>
						</div>
					</div>
					
					<div class="menu_category menu_category_2">
						<div class="left">
							<span>갤러리</span>
						</div>
						
						<div class="right">
							<div class="sequence_area">
								<input type="text" name="gallery_name" placeholder="제목을 입력해주세요.">
								<select name="gallery_seq">
									<option value="0"></option>
									<option value="1">1</option>
									<option value="2">2</option>
									<option value="3">3</option>
									<option value="4">4</option>
									<option value="5">5</option>
									<option value="6">6</option>
								</select>
							</div>
							
							<div class="close_area">
								<img alt="" src="${root}/img/insertcontents/menu_close.svg" onclick="menu_close(2)">
							</div>
						</div>
					</div>
					
					<div class="menu_category menu_category_3">
						<div class="left">
							<span>위치안내</span>
						</div>
						
						<div class="right">
							<div class="sequence_area">
								<input type="text" name="location_name" placeholder="제목을 입력해주세요.">
								<select name="location_seq">
									<option value="0"></option>
									<option value="1">1</option>
									<option value="2">2</option>
									<option value="3">3</option>
									<option value="4">4</option>
									<option value="5">5</option>
									<option value="6">6</option>
								</select>
							</div>
							
							<div class="close_area">
								<img alt="" src="${root}/img/insertcontents/menu_close.svg" onclick="menu_close(3)">
							</div>
						</div>
					</div>
					
					<div class="menu_category menu_category_4">
						<div class="left">
							<span>댓글달기</span>
						</div>
						
						<div class="right">
							<div class="sequence_area">
								<input type="text" name="comment_name" placeholder="제목을 입력해주세요.">
								<select name="comment_seq">
									<option value="0"></option>
									<option value="1">1</option>
									<option value="2">2</option>
									<option value="3">3</option>
									<option value="4">4</option>
									<option value="5">5</option>
									<option value="6">6</option>
								</select>
							</div>
							
							<div class="close_area">
								<img alt="" src="${root}/img/insertcontents/menu_close.svg" onclick="menu_close(4)">
							</div>
						</div>
					</div>
					
					<div class="menu_category menu_category_5">
						<div class="left">
							<span>환불규정</span>
						</div>
						
						<div class="right">
							<div class="sequence_area">
								<input type="text" name="refund_name" placeholder="제목을 입력해주세요.">
								<select name="refund_seq">
									<option value="0"></option>
									<option value="1">1</option>
									<option value="2">2</option>
									<option value="3">3</option>
									<option value="4">4</option>
									<option value="5">5</option>
									<option value="6">6</option>
								</select>
							</div>
							
							<div class="close_area">
								<img alt="" src="${root}/img/insertcontents/menu_close.svg" onclick="menu_close(5)">
							</div>
						</div>
					</div>
					
					<div class="menu_category menu_category_6">
						<div class="left">
							<span>미디어</span>
						</div>
						
						<div class="right">
							<div class="sequence_area">
								<input type="text" name="media_name" placeholder="제목을 입력해주세요.">
								<select name="media_seq">
									<option value="0"></option>
									<option value="1">1</option>
									<option value="2">2</option>
									<option value="3">3</option>
									<option value="4">4</option>
									<option value="5">5</option>
									<option value="6">6</option>
								</select>
							</div>
							
							<div class="close_area">
								<img alt="" src="${root}/img/insertcontents/menu_close.svg" onclick="menu_close(6)">
							</div>
						</div>
					</div>
					
					<div class="menu_category menu_category_7">
						<div class="left">
							<span>공지사항</span>
						</div>
						
						<div class="right">
							<div class="sequence_area">
								<input type="text" name="notice_name" placeholder="제목을 입력해주세요.">
								<select name="notice_seq">
									<option value="0"></option>
									<option value="1">1</option>
									<option value="2">2</option>
									<option value="3">3</option>
									<option value="4">4</option>
									<option value="5">5</option>
									<option value="6">6</option>
								</select>
							</div>
							
							<div class="close_area">
								<img alt="" src="${root}/img/insertcontents/menu_close.svg" onclick="menu_close(7)">
							</div>
						</div>
					</div>
					
					<script type="text/javascript">
						
						for(var i = 0; i < 7; i++) {
							$(".menu_category select option[value='" + i +"']").prop('disabled', true);
						}
						
						function menu_close(num) {
							$('.menu_category_' + num).css('display', 'none');
							$('.menu_category_' + num + ' select').val('0').prop('selected', true);
							
							var cnt = $('#category_select_cnt').val();
							
							if(cnt != '0') {
								cnt = Number(cnt) - 1;
								$(".menu_category select option[value='" + cnt +"']").prop('disabled', true);
								$('#category_select_cnt').val(cnt);
							}
						}
						
						$('.menu_area select').change(function () {
							$('.menu_area select option').prop('disabled', false);
							var select_1 = $('.menu_category_1 select option:selected').val();
							var select_2 = $('.menu_category_2 select option:selected').val();
							var select_3 = $('.menu_category_3 select option:selected').val();
							var select_4 = $('.menu_category_4 select option:selected').val();
							var select_5 = $('.menu_category_5 select option:selected').val();
							var select_6 = $('.menu_category_6 select option:selected').val();
							
							if(select_1 != '0') {
								$('.menu_area select option[value=' + select_1 + ']').prop('disabled', true);
							}
							if (select_2 != '0') {
								$('.menu_area select option[value=' + select_2 + ']').prop('disabled', true);
							}
							if (select_3 != '0') {
								$('.menu_area select option[value=' + select_3 + ']').prop('disabled', true);
							}
							if (select_4 != '0') {
								$('.menu_area select option[value=' + select_4 + ']').prop('disabled', true);
							}
							if (select_5 != '0') {
								$('.menu_area select option[value=' + select_5 + ']').prop('disabled', true);
							}
							if (select_6 != '0') {
								$('.menu_area select option[value=' + select_6 + ']').prop('disabled', true);
							}
						});
					</script>
				</div>
				
				<script type="text/javascript">
					$('input[name=logo_name_]').off().on('change', function(){
						if (this.files && this.files[0]) {
							
							var fileForm = /(.*?)\.(jpg|jpeg|png|gif|bmp|pdf)$/;
							var imgFile = $(this).val();
							var maxSize = 5 * 1024 * 1024;
							var fileSize = this.files[0].size;
							
							if(!imgFile.match(fileForm)) {
						    	alert("이미지 파일만 업로드 가능합니다.");
						    	$(this).val('');
						        return false;
						    } else if(fileSize > maxSize){
								alert("이미지 크기는 5MB 이내로 등록 가능합니다.");
								$(this).val('');
								return false;
							} else {
								var filename = $(this)[0].files[0].name;
								$('#logo_name').text(filename);
							}
						}
					});
					
					$('input[name=web_main_name_]').off().on('change', function(){
						if (this.files && this.files[0]) {
							
							var fileForm = /(.*?)\.(jpg|jpeg|png|gif|bmp|pdf)$/;
							var imgFile = $(this).val();
							var maxSize = 5 * 1024 * 1024;
							var fileSize = this.files[0].size;
							
							if(!imgFile.match(fileForm)) {
						    	alert("이미지 파일만 업로드 가능합니다.");
						    	$(this).val('');
						        return false;
						    } else if(fileSize > maxSize){
								alert("이미지 크기는 5MB 이내로 등록 가능합니다.");
								$(this).val('');
								return false;
							} else {
								var filename = $(this)[0].files[0].name;
								$('#web_main_name').text(filename);
							}
						}
					});
					
					$('input[name=banner]').off().on('change', function(){
						if (this.files && this.files[0]) {
							
							var fileForm = /(.*?)\.(jpg|jpeg|png|gif|bmp|pdf)$/;
							var imgFile = $(this).val();
							var maxSize = 5 * 1024 * 1024;
							var fileSize = this.files[0].size;
							
							if(!imgFile.match(fileForm)) {
						    	alert("이미지 파일만 업로드 가능합니다.");
						    	$(this).val('');
						        return false;
						    } else if(fileSize > maxSize){
								alert("이미지 크기는 5MB 이내로 등록 가능합니다.");
								$(this).val('');
								return false;
							} else {
								var filename = $(this)[0].files[0].name;
								$('#banner_name').text(filename);
							}
						}
					});
				</script>
			</div>
			
			<div class="navigation">
				
				<input type="hidden" value="1" id="page_number">
				
				<div class="temporary_storage_area">
					<input type="button" id="addbutton" value="임시저장" />
				</div>

				<div class="preview_area">
					<input type="button" value="미리보기" id="preview">
				</div>

				<div class="submit_area">
					<input type="button" value="등록" id="submit_btn">
				</div>

				<div class="next_btn">
					<input type="button" value="다음" id="Next_Page">
				</div>

				<div class="previous_page_area">
					<input type="button" value="이전" id="Previous_Page">
				</div>

				<div class="manual_btn">
					<input type="button" value="설명서 보기" id="manual_btn">
				</div>
				
				<input type="submit" style="display: none;">
			</div>
			
			<script type="text/javascript">
				$('input[type="text"]').keydown(function() {
				    if (event.keyCode === 13) {
				        event.preventDefault();
				    }
				});
			
				$('#Next_Page').click(function (){
					
					var page_number = $('#page_number').val();
// 					alert(page_number);
					
					if(page_number == '1') {
						$('.page_1').hide();
						$('.page_2').show();
						$('.top_title').attr('tabindex', -1);
						$('.top_title').focus();
						$('.previous_page_area').css('display', 'block');
						$('.title_area')[0].scrollIntoView();
						$('#page_number').val('2');
						
					} else if(page_number == '2') {
						$('.page_2').hide();
						$('.page_3').show();
						$('.page_3').attr('tabindex', -1).focus();
						$('.preview_area').css('display', 'block');
						$('.submit_area').css('display', 'block');
						$('.next_btn').css('display', 'none');
						$('.previous_page_area').css('display', 'block');
						$('.page_3')[0].scrollIntoView();
						$('#page_number').val('3');
					}
					
					if(page_number == '3') {
						$('.page_1').hide();
						$('.page_2').show();
						$('.top_title').attr('tabindex', -1);
						$('.top_title').focus();
						$('.previous_page_area').css('display', 'block');
						$('.title_area')[0].scrollIntoView();
						$('#page_number').val('2');
					}
					
					
				});
				
				$('#Previous_Page').click(function (){
					
					var page_number = $('#page_number').val();
					
					if(page_number == '2') {
						$('.page_1').show();
						$('.page_2').hide();
						$('.top_title').attr('tabindex', -1).focus(); 
						$('.submit_area').css('display', 'none');
						$('.next_btn').css('display', 'block');
						$('.previous_page_area').css('display', 'none');
						$('.title_area')[0].scrollIntoView();
						$('#page_number').val('1');
					} else if(page_number == '3') {
						$('.page_2').show();
						$('.page_3').hide();
						$('.top_title').attr('tabindex', -1).focus();
						$('.preview_area').css('display', 'none');
						$('.submit_area').css('display', 'none');
						$('.next_btn').css('display', 'block');
						$('.title_area')[0].scrollIntoView();
						$('#page_number').val('2');
					}
				});
				
				$('#manual_btn').click(function (){
					//var url = "/Home/manual?mini=Y";
					var url = "/manual?mini=Y"; 
					window.open(url, "", "width=1800, height=900");
				});
				
				$('#preview').click(function (){
					$.ajax({
						type: 'POST',
						url: 'Preview_check',
				        success: function (data) {
				        	if($.trim(data) == 1){
				        		//var url = "/Home/Preview?temporary=Y";
				        		var url = "/Preview?temporary=Y";
								window.open(url,'','height=' + screen.height + ',width=' + screen.width + 'fullscreen=yes');
				        	} else {
				        		alert('임시저장을 해주세요.');
				        	}
				        },          
				        error: function () {
				            alert("임시저장을 해주세요.");
				         }
					});
				});
				
				$('#addbutton').click(function (){
					
					var form = $('#form_data')[0];
					var data = new FormData(form);
	
					$.ajax({
						type: 'POST',
						enctype: 'multipart/form-data',
						url: 'temporary',
						data: data,
						processData: false,
						contentType: false,
						cache: false,
						timeout: 3000,       
				        success: function (data) {
				        	if($.trim(data) == 1){
				        		alert("임시저장 완료");
				        	} else {
				        		alert("====================================>"+error);
				        	}
				        },          
				        error: function () {
				            alert("====================================>"+error);
				         }
					});  
				});
				
				$(function () {
					$('#submit_btn').click(function () {
						var title = $('#title').val();
						var start_time = $('#start_time').val();
						var end_time = $('#end_time').val();
						var roadAddress = $('#roadAddress').val();
						var detail_address = $('#detail_address').val();
						var type_select = $('input:radio[name="type_select"]:checked').val();
						//var type_select = $('input:radio[name="layout_type_"]:checked').val();
						
						var img_1 = $('#detail_img_1').val();
						var img_2 = $('#detail_img_2').val();
						var img_3 = $('#detail_img_3').val();
						var img_4 = $('#detail_img_4').val();
						var img_5 = $('#detail_img_5').val();
						var img_6 = $('#detail_img_6').val();
						var img_7 = $('#detail_img_7').val();
						var img_8 = $('#detail_img_8').val();
						
						var media_text = $('#media_text').val();
						
						var sub_title_1 = $('#sub_title_1').val();
						var sub_title_2 = $('#sub_title_2').val();
						var sub_title_3 = $('#sub_title_3').val();
						var sub_title_4 = $('#sub_title_4').val();
						var sub_title_5 = $('#sub_title_5').val();
						var sub_title_6 = $('#sub_title_6').val();
						var sub_title_7 = $('#sub_title_7').val();
						var sub_title_8 = $('#sub_title_8').val();
						var sub_title_9 = $('#sub_title_9').val();
						
						
						
						if(!title){
							alert('제목을 입력해주세요.');
							$('.page_1').show();
							$('.page_2').hide();
							$('.page_3').hide();
							$('.top_title').attr('tabindex', -1);
							$('.top_title').focus();
							$('.preview_area').css('display', 'none');
							$('.submit_area').css('display', 'none');
							$('.next_btn').css('display', 'block');
							$('.previous_page_area').css('display', 'none');
							$('#title').focus();
							return false;
						} else if (!start_time || !end_time){
							alert('시간을 입력해주세요.');
							$('.page_1').show();
							$('.page_2').hide();
							$('.page_3').hide();
							$('.top_title').attr('tabindex', -1);
							$('.top_title').focus();
							$('.preview_area').css('display', 'none');
							$('.submit_area').css('display', 'none');
							$('.next_btn').css('display', 'block');
							$('.previous_page_area').css('display', 'none');
							$('#start_time').focus();
							return false;
						} else if (!roadAddress && !web_address){
							alert('장소를 입력해주세요.');
							$('.page_1').show();
							$('.page_2').hide();
							$('.page_3').hide();
							$('.top_title').attr('tabindex', -1);
							$('.top_title').focus();
							$('.preview_area').css('display', 'none');
							$('.submit_area').css('display', 'none');
							$('.next_btn').css('display', 'block');
							$('.previous_page_area').css('display', 'none');
							$('#roadAddress').focus();
							return false;
						} else if (type_select == 1){
							if(!img_1 || !img_2 || !img_3 || !img_4 || !img_5){
								alert('이미지를 첨부하세요.');
								return false;
							} else if(!sub_title_1 || !sub_title_2 || !sub_title_3){
								alert('보조 제목을 입력하세요.');
								return false;
							}
						} else if (type_select == 2){
							if(!img_1 || !img_2 || !img_3 || !img_4 || !img_5 || !img_6){
								alert('이미지를 첨부하세요.');
								return false;
							} else if(!sub_title_4 || !sub_title_5 || !sub_title_6){
								alert('보조 제목을 입력하세요.');
								return false;
							}
						} else if (type_select == 3){
							if(!img_1 || !img_2 || !img_3 || !img_4 || !img_5 || !img_6 || !img_7){
								alert('이미지를 첨부하세요.');
								return false;
							}
						} else if (type_select == 4){
							if(!img_1 || !img_2 || !img_3 || !img_4 || !img_5){
								alert('이미지를 첨부하세요.');
								return false;
							} else if(!sub_title_7 || !sub_title_8 || !sub_title_9){
								alert('보조 제목을 입력하세요.');
								return false;
							}
						} else {
							$('form').submit();
						}
					});
				});
			</script>
		</form>
	</section>
	<jsp:include page="/WEB-INF/jsp/footer/footer.jsp" />
</body>
</html>