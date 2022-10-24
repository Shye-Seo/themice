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
</head>
<body>
	<div id="comment">
		<div class="insert">
			<c:if test="${not empty sessionScope.id}">
				<form action="comments" method="post" id="member_comment">
					<input type="hidden" name="contents_idx" value="${contents_idx}">
					<div class="insert_item_1">
						<div class="id">
							<span>${sessionScope.id}</span>
							<input type="text" name="comment" placeholder="악플은 경고조치 없이 삭제되며 징계대상이 될 수 있습니다." class="comment_text">
						</div>
						<div class="score">
							<input type="radio" id="score_item_1" value="1" name="score">
							<label for="score_item_1" class="label_item_1">
								<img alt="" src="${root}/img/comment/star_non_color_icon.svg">
							</label>
							
							<input type="radio" id="score_item_2" value="2" name="score">
							<label for="score_item_2" class="label_item_2">
								<img alt="" src="${root}/img/comment/star_non_color_icon.svg">
							</label>
							
							<input type="radio" id="score_item_3" value="3" name="score">
							<label for="score_item_3" class="label_item_3">
								<img alt="" src="${root}/img/comment/star_non_color_icon.svg">
							</label>
							
							<input type="radio" id="score_item_4" value="4" name="score">
							<label for="score_item_4" class="label_item_4">
								<img alt="" src="${root}/img/comment/star_non_color_icon.svg">
							</label>
							
							<input type="radio" id="score_item_5" value="5" name="score">
							<label for="score_item_5" class="label_item_5">
								<img alt="" src="${root}/img/comment/star_non_color_icon.svg">
							</label>
						</div>
						<script type="text/javascript">
							$("input[type=radio][name='score']").change(function(){
								var value = $(this).val();
								for(var i = 1; i < 6; i++){
									if(value >= i){
										$('.label_item_' + i + ' img').attr('src', '${root}/img/comment/star_color_icon.svg');
									} else {
										$('.label_item_' + i + ' img').attr('src', '${root}/img/comment/star_non_color_icon.svg');
									}
								}
							});
						</script>
					</div>
					
					<div class="submit_area">
						<input type="button" value="등록" id="comment_submit_btn">
					</div>
					
					<script type="text/javascript">
					$(function() {
						$('input[type="text"]').keydown(function() {
							  if (event.keyCode === 13) {
							    event.preventDefault();
							  };
							});
					});
					
						$('#comment_submit_btn').click(function () {
							var score = $('input[name=score]:checked').val();
							var comment = $('.comment_text').val();
							
							if(score == null){
								alert('평점을 입력해주세요.');
								return false;
							} else if(comment == null){
								alert('댓글을 입력해주세요.');
								return false;
							} else {
								$('#member_comment').submit();
							}
						});
					</script>
				</form>
			</c:if>
			
			<c:if test="${not empty sessionScope.business_id}">
				<form action="comments" method="post" id="business_comment">
					<input type="hidden" name="contents_idx" value="${contents_idx}">
					<div class="insert_item_1">
						<div class="id">
							<span>${sessionScope.id}</span>
							<input type="text" name="comment" placeholder="악플은 경고조치 없이 삭제되며 징계대상이 될 수 있습니다." class="comment_text">
						</div>
						<div class="score">
							<input type="radio" id="score_item_1" value="1" name="score">
							<label for="score_item_1" class="label_item_1">
								<img alt="" src="${root}/img/comment/star_non_color_icon.svg">
							</label>
							
							<input type="radio" id="score_item_2" value="2" name="score">
							<label for="score_item_2" class="label_item_2">
								<img alt="" src="${root}/img/comment/star_non_color_icon.svg">
							</label>
							
							<input type="radio" id="score_item_3" value="3" name="score">
							<label for="score_item_3" class="label_item_3">
								<img alt="" src="${root}/img/comment/star_non_color_icon.svg">
							</label>
							
							<input type="radio" id="score_item_4" value="4" name="score">
							<label for="score_item_4" class="label_item_4">
								<img alt="" src="${root}/img/comment/star_non_color_icon.svg">
							</label>
							
							<input type="radio" id="score_item_5" value="5" name="score">
							<label for="score_item_5" class="label_item_5">
								<img alt="" src="${root}/img/comment/star_non_color_icon.svg">
							</label>
						</div>
						
						<script type="text/javascript">
						
							$("input[type=radio][name='score']").change(function(){
								
								var value = $(this).val();

								for(var i = 1; i < 6; i++){
									if(value >= i){
										$('.label_item_' + i + ' img').attr('src', '${root}/img/comment/star_color_icon.svg');
									} else {
										$('.label_item_' + i + ' img').attr('src', '${root}/img/comment/star_non_color_icon.svg');
									}
								}
							});
						</script>
					</div>
					
<!-- 					<div class="insert_item_2"> -->
<!-- 						<input type="text" name="comment" placeholder="악플은 경고조치 없이 삭제되며 징계대상이 될 수 있습니다." class="comment_text"> -->
<!-- 					</div> -->
					
					<div class="submit_area">
						<input type="button" value="등록" id="comment_submit_btn">
					</div>
					
					<script type="text/javascript">
					$(function() {
						$(function() {
							$('input[type="text"]').keydown(function() {
								  if (event.keyCode === 13) {
								    event.preventDefault();
								  };
								});
						});
					});
					
						$('#comment_submit_btn').click(function () {
							debugger;
							var score = $('input[name=score]:checked').val();
							var comment = $('.comment_text').val();
							
							if(score == null){
								alert('평점을 입력해주세요.');
								return false;
							} else if(comment == null){
								alert('댓글을 입력해주세요.');
								return false;
							} else {
								$('#business_comment').submit();
							}
						});
					</script>
				</form>
			</c:if>
			
			<c:if test="${empty sessionScope.id && empty sessionScope.business_id}">
				<form>
					<span class="non_login">로그인 후 이용 가능합니다.</span>
				</form>
			</c:if>
		</div>

		<div class="show_comment">
			<c:forEach var="cl" items="${comment_list}" varStatus="st">
				<div class="comment_item comment_item_${cl.idx}">
					<div class="comment_item_1">
						<div class="id_area">
							<span>${cl.user_id}</span>
						</div>
						
						<div class="score_area">
							<c:if test="${cl.score != '0'}">
								<c:forEach var="i" begin="0" end="${cl.score -1}">
									<img src="${root}/img/comment/star_color_icon.svg">
								</c:forEach>
								<c:forEach var="i" begin="${cl.score}" end="4">
									<img src="${root}/img/comment/star_non_color_icon.svg">
								</c:forEach>
							</c:if>
						</div>
						
						<div class="text_area">
							<p>
								${cl.comment}
							</p>
						</div>
						
						<div class="answer_btn">
							<input id="button_${cl.idx}" type="button" value="답글 달기"
							onclick="onDisplay('${cl.idx}')">
							<img alt="" src="${root}/img/comment/comment_btn.svg">
	
							<script type="text/javascript">
								function onDisplay(num) {
									console.log(num);
									$("#display" + num).toggle();
								}
							</script>
						</div>
					</div>
					
					<div class="comment_item_2">
						<div class="btn_area" onclick="btn_click(${cl.idx})">
							<img alt="" src="${root}/img/comment/btn_icon.svg" class="comment_btn" onclick="btn_click(${cl.idx})">
							<div class="btn_item btn_item_${cl.idx}">
								<input type="button" value="수정" onclick="update_click(${cl.idx})">
								<input type="button" value="삭제" onclick="delete_click(${cl.idx})">
								<input type="button" value="신고" onclick="report_click(${cl.idx});">
							</div>
						</div>
						
						<div class="time_area">
							<span>${cl.date}</span>
						</div>
					</div>
				</div>
				
				<script type="text/javascript">
					function report_click(num) {
						$.ajax({
							url : 'comment_report',
							type : 'post',
							data : {
								idx : num
							},
							success : function(data) {
								if ($.trim(data) == 1) {
									alert('정상적으로 접수 되었습니다.');
								} else if($.trim(data) == 2){
									alert('이미 접수 되었습니다.');
								}
							},
							error : function() {
								alert('접수 오류');
							}
						});
					}
				
				
					function btn_click(num) {						
						$('.btn_item_' + num).css('display', 'flex');
						$('.comment_btn_' + num).css('display', 'none');
					}
					
					function update_click(num) {
						var idx = num;
						$.ajax({
							url : 'comment_check',
							type : 'post',
							data : {
								idx : num
							},
							success : function(data) {
								if ($.trim(data) == 0) {
									alert('권한이 없습니다.')
								} else {
									$('.update_' + num).css('display', 'block');
									$('.comment_item_' + num).css('display', 'none');
								}
							},
							error : function() {
								alert("로그인을 해주세요.");
							}
						});
					}
					
					function delete_click(num) {
						var idx = num;
						$.ajax({
							url : 'comment_check',
							type : 'post',
							data : {
								idx : num
							},
							success : function(data) {
								if ($.trim(data) == 0) {
									alert('권한이 없습니다.')
								} else {
									alert('댓글이 삭제되었습니다.')
									location.href = 'comment_delete?contents_idx=' + ${contents_idx} + '&comment_idx=' + num;
								}
							},
							error : function() {
								alert("로그인을 해주세요.");
							}
						});
					}
					
					$(function() {
						$('html').click(function(e) {
							if(!$(e.target).hasClass("comment_btn")) { 
								$('.btn_item').css('display', 'none');
								$('.comment_btn').css('display', 'unset');
							}
						});
					});
				</script>
				
				<form class="update update_${cl.idx}" method="post" action="comment_update">
					<input type="hidden" name="contents_idx" value="${contents_idx}">
					<input type="hidden" name="comment_idx" value="${cl.idx}">
					
					<div class="insert_item_1">
						<div class="id">
							<span>${sessionScope.business_id}</span>
						</div>
						<div class="score">
							<input type="radio" id="${cl.idx}_score_item_1" value="${cl.idx}" name="score_update">
							<label for="${cl.idx}_score_item_1" class="${cl.idx}_update_item_1">
								<img alt="" src="${root}/img/comment/star_non_color_icon.svg">
							</label>
							
							<input type="radio" id="${cl.idx}_score_item_2" value="${cl.idx}" name="score_update">
							<label for="${cl.idx}_score_item_2" class="${cl.idx}_update_item_2">
								<img alt="" src="${root}/img/comment/star_non_color_icon.svg">
							</label>
							
							<input type="radio" id="${cl.idx}_score_item_3" value="${cl.idx}" name="score_update">
							<label for="${cl.idx}_score_item_3" class="${cl.idx}_update_item_3">
								<img alt="" src="${root}/img/comment/star_non_color_icon.svg">
							</label>
							
							<input type="radio" id="${cl.idx}_score_item_4" value="${cl.idx}" name="score_update">
							<label for="${cl.idx}_score_item_4" class="${cl.idx}_update_item_4">
								<img alt="" src="${root}/img/comment/star_non_color_icon.svg">
							</label>
							
							<input type="radio" id="${cl.idx}_score_item_5" value="${cl.idx}" name="score_update">
							<label for="${cl.idx}_score_item_5" class="${cl.idx}_update_item_5">
								<img alt="" src="${root}/img/comment/star_non_color_icon.svg">
							</label>
							
							<input type="hidden" name="score" value="" class="update_score">
						</div>
						
						<script type="text/javascript">
							$("input[type=radio][name='score_update']").change(function(){
								var idx = $(this).val();
								var id = $(this).attr('id');
								var value = id.substr(id.length-1, 1);

								$('.update_score').val(value);
								
								for(var i = 1; i < 6; i++){
									if(value >= i){
										$('.' + idx + '_update_item_' + i + ' img').attr('src', '${root}/img/comment/star_color_icon.svg');
									} else {
										$('.' + idx + '_update_item_' + i + ' img').attr('src', '${root}/img/comment/star_non_color_icon.svg');
									}
								}
							});
						</script>
					</div>
					
					<div class="insert_item_2">
						<input type="text" name="comment" placeholder="수정할 내용을 입력하세요.">
					</div>
					
					<div class="upload_area">
						<div class="submit_area">
							<input type="submit" value="등록">
							<input type="reset" value="취소" onclick="cancel_click(${cl.idx})">
						</div>
						
						<script type="text/javascript">
							function cancel_click(num) {
								$('.update_' + num).css('display', 'none');
								$('.comment_item_' + num).css('display', 'flex');
							}
						</script>
					</div>
				</form>
				
				
				<div class="answer" id="display${cl.idx}" style="display: none;">
				
					<div class="insert_answer">
						<form action="answer" method="post">
							<c:if test="${not empty sessionScope.id}">
								<span>${sessionScope.id}</span>
							</c:if>
							
							<c:if test="${not empty sessionScope.business_id}">
								<span>${sessionScope.business_id}</span>
							</c:if>
							
							<c:if test="${empty sessionScope.id && empty sessionScope.business_id}">
								<span class="non_login">로그인을 해주세요.</span>
							</c:if>
							<input type="hidden" name="contents_idx" value="${contents_idx}">
							<input type="hidden" name="comments_idx" value="${cl.idx}">
							<input type="text" name="comments" class="text_area">
							<input type="submit" value="등록" class="answer_submit">
						</form>
					</div>
					
					<c:forEach var="al" items="${answer_list}" varStatus="st">
						<c:if test="${cl.idx == al.comments_idx}">
							<ul>
								<li>${al.user_id}</li>
								<li>${al.comments}</li>
								<li>${al.date}</li>
								<li><input type="button" value="삭제" onclick="answer_delete(${al.idx})"></li>
								<li><input type="button" value="신고" onclick="answer_report(${al.idx})"></li>
							</ul>
						</c:if>
					</c:forEach>
					
					<script type="text/javascript">
						function answer_report(num) {
							$.ajax({
								url : 'answer_report',
								type : 'post',
								data : {
									idx : num
								},
								success : function(data) {
									if ($.trim(data) == 1) {
										alert('정상적으로 접수 되었습니다.');
									} else if($.trim(data) == 2){
										alert('이미 접수 되었습니다.');
									}
								},
								error : function() {
									alert('로그인을 해주세요.');
								}
							});
						}
					
						function answer_delete(num) {
							$.ajax({
								url : 'answer_delete',
								type : 'post',
								data : {
									idx : num
								},
								success : function(data) {
									if ($.trim(data) == 0) {
										alert('권한이 없습니다.')
									} else {
										alert('댓글이 삭제되었습니다.')
										location.href = 'website?contents_idx=' + ${contents_idx};
									}
								},
								error : function() {
									alert("로그인을 해주세요.");
								}
							});
						};
					</script>
				</div>
			</c:forEach>
		</div>		

		<div class="paging">
			<c:if test="${paging.startPage != 1 }">
				<a href="website?nowPage=${paging.startPage - 1}&cntPerPage=${paging.cntPerPage}&contents_idx=${contents_idx}" class="paging_0">&lt;</a>
			</c:if>
			<c:forEach begin="${paging.startPage}" end="${paging.endPage}" var="p">
				<c:choose>
					<c:when test="${p == paging.nowPage}">
						<p>${p}</p>
					</c:when>
					<c:when test="${p != paging.nowPage}">
						<a href="website?nowPage=${p}&cntPerPage=${paging.cntPerPage}&contents_idx=${contents_idx}" class="paging_1">${p}</a>
					</c:when>
				</c:choose>
			</c:forEach>
			<c:if test="${paging.endPage != paging.lastPage}">
				<a href="website?nowPage=${paging.endPage+1}&cntPerPage=${paging.cntPerPage}&contents_idx=${contents_idx}" class="paging_2">&gt;</a>
			</c:if>
		</div>
	</div>
</body>
</html>