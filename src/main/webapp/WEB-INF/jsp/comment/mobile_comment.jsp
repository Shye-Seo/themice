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
	<script type="text/javascript">
		$(function () {
			$('#comment_back_area').click(function() {
				$('#back_area').css('display', 'flex');
				$('#mobile_comment').css('display', 'none');
			});
			
			$('#mobile_comment_submit').click(function() {
				var comment = $('#m_text_area').val();
				
				if(comment == '' || comment == null){
					alert("댓글을 입력해주세요.");
					return false;
				} else {
					$('#mobile_comments_insert').submit();
				}
			});
			
			$('#mobile_comment_btn').click(function () {
				var authority = sessionStorage.getItem("authority");
				if(authority == '' || authority == null){
					alert("로그인을 해주세요.");
				} else {
					$('#back_area').css('display', 'flex');
					$('#mobile_comment_btn').css('display', 'none');
					$('#mobile_comment').css('display', 'block');
				}
			});
			
			$('#comment_back_area').click(function () {
				$('#back_area').css('display', 'block');
				$('#mobile_comment_btn').css('display', 'block');
				$('#mobile_comment').css('display', 'none');
			})
		});
		
		function mobile_answer_open(num) {
			$('.mobile_display_' + num).css('display', 'block');
		}
		
		function mobile_answer_close(num) {
			$('.mobile_display_' + num).css('display', 'none');
		}
	</script>
	<div id="mobile_comment">
		<div id="comment_back_area">
			<img alt="" src="${root}/img/common/back_btn_white.svg" class="back_btn">
			<span>댓글</span>
		</div>
	
		<div class="comment_area">
			<c:forEach var="cl" items="${comment_list}" varStatus="st">
				<div class="comment_item">
					<div class="comment_item_1">
						<span class="id_area">${cl.user_id}</span>
						<img alt="" src="${root}/img/comment/option_btn.svg">
					</div>
					<div class="score_area">
						<c:forEach var="i" begin="0" end="${cl.score - 1}">
							<img src="${root}/img/comment/star_color_icon.svg">
						</c:forEach>
						<c:forEach var="i" begin="${cl.score}" end="4">
							<img src="${root}/img/comment/star_non_color_icon.svg">
						</c:forEach>
					</div>
					<p>${cl.comment}</p>
					<div class="comment_item_2">
						<input type="button" value="답글" onclick="mobile_answer_open(${cl.idx})">
						<span>${cl.date}</span>
					</div>
					
					<div class="answer_area mobile_display_${cl.idx}">
						<div id="answer_back_area" onclick="mobile_answer_close(${cl.idx})">
							<img alt="" src="${root}/img/common/back_btn_white.svg" class="answer_back_btn">
							<span>답글</span>
						</div>
						<div class="answer_item">
							<c:forEach var="al" items="${answer_list}" varStatus="st">
								<c:if test="${cl.idx == al.comments_idx}">
									<div class="answer_item_area">
										<div class="answer_item_1">
											<span>${al.user_id}</span>
											<span>${al.date}</span>
										</div>
									
										<div class="answer_item_2">
											<span>${al.comments}</span>
										</div>
									
										<div class="answer_item_3">
											<input type="button" value="삭제" onclick="answer_delete(${al.idx})">
										</div>
									</div>
								</c:if>
							</c:forEach>
						</div>
						
						<form action="mobile_answer">
							<input type="text" name="comments" placeholder="답글을 입력해주세요.">
							<input type="button" value="등록">
						</form>
					</div>
				</div>
			</c:forEach>
		</div>
		
		<form action="mobile_comments" method="post" id="mobile_comments_insert">
			<input type="text" placeholder="댓글을 입력해주세요." name="comment" id="m_text_area">
			<select name="score">
				<option>5점</option>
				<option>4점</option>
				<option>3점</option>
				<option>2점</option>
				<option>1점</option>
			</select>
			<input type="button" value="등록" id="mobile_comment_submit">
		</form>
	</div>
</body>
</html>