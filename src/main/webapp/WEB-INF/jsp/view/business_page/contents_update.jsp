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

<style type="text/css">
input[type="time"]::-webkit-calendar-picker-indicator {
	background-image: url("${root}/img/insertcontents/time.svg");
	cursor: pointer;
}

input[type="date"]::-webkit-calendar-picker-indicator {
	background-image: url("${root}/img/insertcontents/input_arrow.svg");
	background-position: center;
	cursor: pointer;
}

select {
	background-image: url(/Home/img/insertcontents/input_arrow.svg);
	cursor: pointer;
	background-repeat: no-repeat;
	-webkit-appearance: none;
	-moz-appearance: none;
	appearance: none;
	background-position-x: 95%;
	background-position-y: center;
}

selsect::-ms-expand {
	display: none;
}
</style>
</head>
<body>
	<jsp:include page="/WEB-INF/jsp/header/header.jsp" />
	<div class="header">
		<div class="title">
			<span>마이페이지</span>
		</div>
		<div class="root">
			<img alt="" src="${root}/img/list/home_icon.svg">
			<span><img alt="" src="${root}/img/common/arrow_icon.svg"></span>
			<span>기업회원</span>
			<span><img alt="" src="${root}/img/common/arrow_icon.svg"></span>
			<span>전시 업데이트</span>
		</div>
	</div>
	<section>
		<div class="title_area">
			<span>전시장 등록</span>
		</div>
		<div class="essential_area">
			<span>*</span>
			<p>필수 입력사항</p>
		</div>
		<form method="post" action="insertContents"
			enctype="multipart/form-data" id="form_data">
			<div class="page_1">
				<div class="infomation_area">
					<div class="left">
						<span>*</span>
						<ul>
							<li>제</li>
							<li>목</li>
						</ul>
					</div>
					<div class="right">
						<input type="text" placeholder="20자 이내로 입력해주세요." name="title"
							id="title" class="input_1">
					</div>
				</div>

				<div class="infomation_area">
					<div class="left">
						<span>*</span>
						<ul>
							<li>기</li>
							<li>간</li>
						</ul>
					</div>
					<div class="right">

						<input type="date" name="start_day" id="start_day" class="input_2">

						<span style="margin: 0 2.7%; color: #333;">~</span> <input
							type="date" name="end_day" id="end_day" class="input_2" min="">

					</div>
					<script type="text/javascript">
							
							$(function() {
								var today = getTodayType();
								$('#start_day').val(today);
								$('#end_day').val(today);
							});
							
							function getTodayType(){
								var date = new Date();
								return date.getFullYear() + "-" + ("0"+(date.getMonth()+1)).slice(-2) + "-" + ("0"+date.getDate()).slice(-2);
							}
							
					</script>
				</div>

				<div class="infomation_area">
					<div class="left">
						<span>*</span>
						<ul>
							<li>시</li>
							<li>간</li>
						</ul>
					</div>
					<div class="right">
						<input type="time" name="time" id="time" class="input_3">
					</div>
					<script type="text/javascript">
							$(function () {
								var time = new Date().toISOString().slice(11, 16);
								$('#time').val(time);
							});
					</script>
				</div>

				<div class="infomation_area">
					<div class="left">
						<span>*</span>
						<ul>
							<li>관</li>
							<li>람</li>
							<li>료</li>
						</ul>
					</div>
					<div class="right_2">
						<div class="price_insert_area">
							<input id="price" type="text" placeholder="미 작성시 자동으로 무료로 전환됩니다."
							oninput="this.value = this.value.replace(/[^0-9.]/g, '').replace(/(\..*)\./g, '$1');">
							<select id="age_type" class="select">
								<option value="1">성인</option>
								<option value="2">중,고등학생</option>
								<option value="3">초등학생</option>
								<option value="4">아동</option>
							</select> <input type="button" onclick="Pirce_insert()" value="등록"
								class="price_btn">
						</div>
						<div class="key_item">
							<ul>
								<li><span class="price_item_1">1</span> <img
									src="${root}/img/insertcontents/close.svg"
									class="price_img_item_1" onclick="Price_close(1)"><input
									type="hidden" name="price" id="price_1" value="null"></li>
								<li><span class="price_item_2">2</span> <img
									src="${root}/img/insertcontents/close.svg"
									class="price_img_item_2" onclick="Price_close(2)"><input
									type="hidden" name="price" id="price_2" value="null"></li>
								<li><span class="price_item_3">3</span> <img
									src="${root}/img/insertcontents/close.svg"
									class="price_img_item_3" onclick="Price_close(3)"><input
									type="hidden" name="price" id="price_3" value="null"></li>
								<li><span class="price_item_4">4</span> <img
									src="${root}/img/insertcontents/close.svg"
									class="price_img_item_4" onclick="Price_close(4)"><input
									type="hidden" name="price" id="price_4" value="null"></li>
							</ul>
						</div>

						<script type="text/javascript">
								function Pirce_insert() {
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
									$('.price_item_'+num).text(num);
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
							<li>전</li>
							<li>시</li>
							<li>타</li>
							<li>입</li>
						</ul>
					</div>
					<div class="right">
						<select name="exhn_type" id="exhbn_type" class="input_3">
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
							<li>전</li>
							<li>시</li>
							<li>장</li>
							<li>소</li>
						</ul>
					</div>
					<div class="right">
						<div id="offline">
							<input type="text" id="roadAddress" placeholder="도로명주소"
								class="input" name="address" readonly> <input type="button"
								onclick="sample4_execDaumPostcode()" value="주소검색" class="post">
							<input type="text" id="detail_address" placeholder="상세주소"
								class="input" name="detail_address"> <input
								type="hidden" id="postcode" placeholder="주소검색" class="input">
						</div>
						<div id="online">
							<input type="text" placeholder="홈페이지를 입력해주세요."
								class="web_address" name="web_address">
						</div>
						<div class="address_select_area">
							<select name="selectBox" id="selectBox" class="select">
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
							<li>전</li>
							<li>시</li>
							<li>내</li>
							<li>용</li>
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
							<li>전</li>
							<li>시</li>
							<li>검</li>
							<li>색</li>
							<li>어</li>
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
						<ul>
							<li>대</li>
							<li>표</li>
							<li>사</li>
							<li>진</li>
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
											alert("첨부파일 사이즈는 5MB 이내로 등록 가능합니다.");
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
							<li>전</li>
							<li>시</li>
							<li>컬</li>
							<li>러</li>
						</ul>
					</div>
					<div class="right_3">
						<div class="color_category">
							<div class="type">
								<div class="color">
									<input type="button" class="color"
										style="background-color: #EA933C;">
								</div>
								<div class="btn">
									<button type="button" value="1" onclick="detail_show(1)"
										class="left_btn">1</button>
									<button type="button" value="2" onclick="detail_show(2)"
										class="right_btn">2</button>
								</div>
							</div>

							<div class="type">
								<div class="color">
									<input type="button" class="color"
										style="background-color: #6C129B;">
								</div>
								<div class="btn">
									<button type="button" value="3" onclick="detail_show(3)"
										class="left_btn">3</button>
									<button type="button" value="4" onclick="detail_show(4)"
										class="right_btn">4</button>
								</div>
							</div>

							<div class="type">
								<div class="color">
									<input type="button" class="color"
										style="background-color: #15913B;">
								</div>
								<div class="btn">
									<button type="button" value="5" onclick="detail_show(5)"
										class="left_btn">5</button>
									<button type="button" value="6" onclick="detail_show(6)"
										class="right_btn">6</button>
								</div>
							</div>

							<div class="type">
								<div class="color">
									<input type="button" class="color"
										style="background-color: #F7DD13;">
								</div>
								<div class="btn">
									<button type="button" value="7" onclick="detail_show(7)"
										class="left_btn">7</button>
									<button type="button" value="8" onclick="detail_show(8)"
										class="right_btn">8</button>
								</div>
							</div>
						</div>

						<div class="detail_page_1 detail_page">
							<img
								src="${root}/img/insertcontents/detail_type/detail_page_1.png">
							<input multiple="multiple" type="file" name="file"
								accept="image/*" id="detail_img_1"><label
								for="detail_img_1" class="label_1">이미지 1</label> <input
								multiple="multiple" type="file" name="file" accept="image/*"
								id="detail_img_2"><label for="detail_img_2"
								class="label_2">이미지 2</label> <input multiple="multiple"
								type="file" name="file" accept="image/*" id="detail_img_3"><label
								for="detail_img_3" class="label_3">이미지 3</label> <input
								multiple="multiple" type="file" name="file" accept="image/*"
								id="detail_img_4"><label for="detail_img_4"
								class="label_4">이미지 4</label> <input multiple="multiple"
								type="file" name="file" accept="image/*" id="detail_img_5"><label
								for="detail_img_5" class="label_5">이미지 5</label>
						</div>

						<div class="detail_page_2 detail_page">
							<img
								src="${root}/img/insertcontents/detail_type/detail_page_2.png">
							<input multiple="multiple" type="file" name="file"
								accept="image/*" id="detail_img_1"><label
								for="detail_img_1" class="label_1">이미지 1</label> <input
								multiple="multiple" type="file" name="file" accept="image/*"
								id="detail_img_2"><label for="detail_img_2"
								class="label_2">이미지 2</label> <input multiple="multiple"
								type="file" name="file" accept="image/*" id="detail_img_3"><label
								for="detail_img_3" class="label_3">이미지 3</label> <input
								multiple="multiple" type="file" name="file" accept="image/*"
								id="detail_img_4"><label for="detail_img_4"
								class="label_4">이미지 4</label> <input multiple="multiple"
								type="file" name="file" accept="image/*" id="detail_img_5"><label
								for="detail_img_5" class="label_5">이미지 5</label> <input
								multiple="multiple" type="file" name="file" accept="image/*"
								id="detail_img_6"><label for="detail_img_6"
								class="label_6">이미지 6</label>
						</div>

						<div class="detail_page_3 detail_page">
							<img
								src="${root}/img/insertcontents/detail_type/detail_page_3.png">
							<input multiple="multiple" type="file" name="file"
								accept="image/*" id="detail_img_1"><label
								for="detail_img_1" class="label_1">이미지 1</label> <input
								multiple="multiple" type="file" name="file" accept="image/*"
								id="detail_img_2"><label for="detail_img_2"
								class="label_2">이미지 2</label> <input multiple="multiple"
								type="file" name="file" accept="image/*" id="detail_img_3"><label
								for="detail_img_3" class="label_3">이미지 3</label><input
								multiple="multiple" type="file" name="file" accept="image/*"
								id="detail_img_4"><label for="detail_img_4"
								class="label_4">이미지 4</label> <input multiple="multiple"
								type="file" name="file" accept="image/*" id="detail_img_5"><label
								for="detail_img_5" class="label_5">이미지 5</label> <input
								multiple="multiple" type="file" name="file" accept="image/*"
								id="detail_img_6"><label for="detail_img_6"
								class="label_6">이미지 6</label><input multiple="multiple"
								type="file" name="file" accept="image/*" id="detail_img_7"><label
								for="detail_img_7" class="label_7">이미지 7</label> <input
								multiple="multiple" type="file" name="file" accept="image/*"
								id="detail_img_8"><label for="detail_img_8"
								class="label_8">이미지 8</label>
						</div>

						<div class="detail_page_4 detail_page">
							<img
								src="${root}/img/insertcontents/detail_type/detail_page_4.png">
							<input multiple="multiple" type="file" name="file"
								accept="image/*" id="detail_img_1"><label
								for="detail_img_1" class="label_1">이미지 1</label> <input
								multiple="multiple" type="file" name="file" accept="image/*"
								id="detail_img_2"><label for="detail_img_2"
								class="label_2">이미지 2</label> <input multiple="multiple"
								type="file" name="file" accept="image/*" id="detail_img_3"><label
								for="detail_img_3" class="label_3">이미지 3</label> <input
								multiple="multiple" type="file" name="file" accept="image/*"
								id="detail_img_4"><label for="detail_img_4"
								class="label_4">이미지 4</label><input multiple="multiple"
								type="file" name="file" accept="image/*" id="detail_img_5"><label
								for="detail_img_5" class="label_5">이미지 5</label> <input
								multiple="multiple" type="file" name="file" accept="image/*"
								id="detail_img_6"><label for="detail_img_6"
								class="label_6">이미지 6</label><input multiple="multiple"
								type="file" name="file" accept="image/*" id="detail_img_7"><label
								for="detail_img_7" class="label_7">이미지 7</label>
						</div>

						<div class="detail_page_5 detail_page">
							<img
								src="${root}/img/insertcontents/detail_type/detail_page_5.png">
							<input multiple="multiple" type="file" name="file"
								accept="image/*" id="detail_img_1"><label
								for="detail_img_1" class="label_1">이미지 1</label> <input
								multiple="multiple" type="file" name="file" accept="image/*"
								id="detail_img_2"><label for="detail_img_2"
								class="label_2">이미지 2</label> <input multiple="multiple"
								type="file" name="file" accept="image/*" id="detail_img_3"><label
								for="detail_img_3" class="label_3">이미지 3</label> <input
								multiple="multiple" type="file" name="file" accept="image/*"
								id="detail_img_4"><label for="detail_img_4"
								class="label_4">이미지 4</label> <input multiple="multiple"
								type="file" name="file" accept="image/*" id="detail_img_5"><label
								for="detail_img_5" class="label_5">이미지 5</label> <input
								multiple="multiple" type="file" name="file" accept="image/*"
								id="detail_img_6"><label for="detail_img_6"
								class="label_6">이미지 6</label><input multiple="multiple"
								type="file" name="file" accept="image/*" id="detail_img_7"><label
								for="detail_img_7" class="label_7">이미지 7</label> <input
								multiple="multiple" type="file" name="file" accept="image/*"
								id="detail_img_8"><label for="detail_img_8"
								class="label_8">이미지 8</label>
						</div>

						<div class="detail_page_6 detail_page">
							<img
								src="${root}/img/insertcontents/detail_type/detail_page_6.png">
							<input multiple="multiple" type="file" name="file"
								accept="image/*" id="detail_img_1"><label
								for="detail_img_1" class="label_1">이미지 1</label> <input
								multiple="multiple" type="file" name="file" accept="image/*"
								id="detail_img_2"><label for="detail_img_2"
								class="label_2">이미지 2</label> <input multiple="multiple"
								type="file" name="file" accept="image/*" id="detail_img_3"><label
								for="detail_img_3" class="label_3">이미지 3</label> <input
								multiple="multiple" type="file" name="file" accept="image/*"
								id="detail_img_4"><label for="detail_img_4"
								class="label_4">이미지 4</label>
						</div>

						<div class="detail_page_7 detail_page">
							<img
								src="${root}/img/insertcontents/detail_type/detail_page_7.png">
							<input multiple="multiple" type="file" name="file"
								accept="image/*" id="detail_img_1"><label
								for="detail_img_1" class="label_1">영상 1</label> <input
								multiple="multiple" type="file" name="file" accept="image/*"
								id="detail_img_2"><label for="detail_img_2"
								class="label_2">이미지 1</label> <input multiple="multiple"
								type="file" name="file" accept="image/*" id="detail_img_3"><label
								for="detail_img_3" class="label_3">이미지 2</label>
						</div>

						<div class="detail_page_8 detail_page">
							<img
								src="${root}/img/insertcontents/detail_type/detail_page_8.png">
							<input multiple="multiple" type="file" name="file"
								accept="image/*" id="detail_img_1"><label
								for="detail_img_1" class="label_1">이미지 1</label> <input
								multiple="multiple" type="file" name="file" accept="image/*"
								id="detail_img_2"><label for="detail_img_2"
								class="label_2">이미지 2</label> <input multiple="multiple"
								type="file" name="file" accept="image/*" id="detail_img_3"><label
								for="detail_img_3" class="label_3">이미지 3</label> <input
								multiple="multiple" type="file" name="file" accept="image/*"
								id="detail_img_4"><label for="detail_img_4"
								class="label_4">이미지 4</label> <input multiple="multiple"
								type="file" name="file" accept="image/*" id="detail_img_5"><label
								for="detail_img_5" class="label_5">이미지 5</label>
						</div>
					</div>
				</div>
				<input type="hidden" name="layout_type" value="" id="layout_type">
				<script type="text/javascript">
						function detail_show(num) {
							for(var i = 1; i < 9; i++){
								if(num == i){
									$('.detail_page_'+i).show();
									$('#layout_type').val(i);
								} else {
									$('.detail_page_'+i).hide();
								}
							}
						}
						
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
										alert("첨부파일 사이즈는 5MB 이내로 등록 가능합니다.");
										$(this).val('');
										return false;
									} else {
										
										var page = $('#layout_type').val();
										
										for(var i = 1; i < 7; i++){
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
							<li>폰</li>
							<li>트</li>
						</ul>
					</div>
					<div class="right">
						<select name="font_type" class="font_type">
							<option value="1">카페 아네모네</option>
							<option value="2">에스코어 드림</option>
							<option value="3">비트로 코어 OTF</option>
							<option value="4">나눔고딛</option>
							<option value="5">나눔명조 옛한글</option>
							<option value="6">Oriya MN</option>
						</select>
					</div>
				</div>

				<div class="infomation_area">
					<div class="left">
						<ul>
							<li>배</li>
							<li>경</li>
							<li>패</li>
							<li>턴</li>
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
							<li>배</li>
							<li>경</li>
							<li>색</li>
							<li>상</li>
						</ul>
					</div>
					<div class="right_4">
						<input type="text" name="background_color" class="back_color">
						<input type="color" id="head"
							value="#FFFFFF"> <label for="head" class="color_choice">색상
							고르기</label><input type="button" value="확인" onclick="check()"
							class="color_submiit">
					</div>

					<script>
							function check() {
								var color = $('#head').val();
								$('.back_color').val(color);
							}
						</script>
				</div>

				<div class="infomation_area">
					<div class="left">
						<span>*</span>
						<ul>
							<li>보</li>
							<li>안</li>
							<li>절</li>
							<li>차</li>
						</ul>
					</div>

					<div id="new_img" class="right">
						<div class="captcha_img_area">
							<img src="${root}/captcha" id="imgCaptcha"
								style="cursor: pointer">
						</div>
						<div class="captcha_contents_area">
							<div class="captcha_text_area">
								<p>
									THE MICE는 프로그램을 이용한<br>자동개설을 방지하기 위해 보안절차를 거치고 있습니다.<br>왼쪽
									이미지를 보이는 대로 입력해주세요.
								</p>
							</div>
							<div class="captcha_input_area">
								<input type="text" name="captcha" class="captcha_text_area">
							</div>
							<div class="captcha_btn_area">
								<input type="button" value="새로고침" onclick="Captcha()"
									class="captcha_sub_area">
								<div></div>
								<input type="button" id="btn-read" value="음성으로 듣기"
									onclick="Captcha_speak()" class="captcha_sub_area">
							</div>
							<script type="text/javascript">
									function Captcha() {
										$("#imgCaptcha").attr("src", "${root}/captcha");
									}
									function Captcha_speak() {
										$.ajax({
											url:'Captcha_spek',
											type:'POST',
											success:function(data){
												const data_sub = data.split('');
												for(const i in data_sub){
													function speak(text, opt_prop) {
											            if (typeof SpeechSynthesisUtterance === "undefined" || typeof window.speechSynthesis === "undefined") {
											                alert("이 브라우저는 음성 합성을 지원하지 않습니다.")
											                return
											            } 
											            const prop = opt_prop || {}
											            const speechMsg = new SpeechSynthesisUtterance()
											            speechMsg.rate = prop.rate || 1 // 속도: 0.1 ~ 10      
											            speechMsg.pitch = prop.pitch || 1 // 음높이: 0 ~ 2
											            speechMsg.lang = prop.lang || "ko-KR"
											            speechMsg.text = text;      
											            // SpeechSynthesisUtterance에 저장된 내용을 바탕으로 음성합성 실행
											            window.speechSynthesis.speak(speechMsg)
											        }
											        const text = data_sub[i];
											        const btnRead = document.getElementById("btn-read");
													speak(text, {
													    rate: 1,
													    pitch: 1.5,
													    lang: "ko-KR"
													})
												}  
											},error:function(){
												
											}
										});
									}
								</script>
						</div>
					</div>
				</div>
			</div>

			<div class="navigation">
				<div class="preview_area">
					<input type="button" value="미리보기" id="preview">
				</div>

				<div class="submit_area">
					<input type="submit" value="등록">
				</div>

				<div class="next_btn">
					<input type="button" value="다음" id="Next_Page">
				</div>

				<div class="previous_page_area">
					<input type="button" value="이전" id="Previous_Page">
				</div>

				<div class="manual_btn">
					<input type="button" value="설명서 보기" id="manual">
				</div>
			</div>

			<script type="text/javascript">
				$('input[type="text"]').keydown(function() {
				    if (event.keyCode === 13) {
				        event.preventDefault();
				    }
				});
			
				$('#Next_Page').click(function (){
					$('.page_1').hide();
					$('.page_2').show();
					$('.top_title').attr('tabindex', -1);
					$('.top_title').focus();
					$('.preview_area').css('display', 'block');
					$('.submit_area').css('display', 'block');
					$('.next_btn').css('display', 'none');
					$('.previous_page_area').css('display', 'block');
					$('.title_area')[0].scrollIntoView();
				});
				
				$('#Previous_Page').click(function (){
					$('.page_1').show();
					$('.page_2').hide();
					$('.top_title').attr('tabindex', -1);
					$('.top_title').focus();
					$('.preview_area').css('display', 'none');
					$('.submit_area').css('display', 'none');
					$('.next_btn').css('display', 'block');
					$('.previous_page_area').css('display', 'none');
					$('.title_area')[0].scrollIntoView();
				});
				
				$('#manual').click(function (){
					var url = "/Home/manual?mini=Y";
					window.open(url, "", "width=1800, height=900");
				});
				
				$('#preview').click(function (){
					
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
				        		$.ajax({
									type: 'POST',
									url: 'Preview_check',
							        success: function (data) {
							        	if($.trim(data) == 1){
							        		var url = "/Home/Preview?temporary=Y";
											window.open(url,'','height=' + screen.height + ',width=' + screen.width + 'fullscreen=yes');
							        	} else {
							        		alert('임시저장을 해주세요.');
							        	}
							        },          
							        error: function () {
							            alert("미리보기 오류");
							         }
								});
				        	} else {
				        		alert("미리보기 오류");
				        	}
				        },          
				        error: function () {
				        	alert("미리보기 오류");
				         }
					});
				});
			</script>
		</form>
	</section>
	<jsp:include page="/WEB-INF/jsp/footer/footer.jsp" />
</body>
</html>