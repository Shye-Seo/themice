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
<script src="http://code.jquery.com/jquery-latest.js"></script>
<script type="text/javascript">
   $(document).ready(function() {
       $("#input_file").bind('change', function() {
           selectFile(this.files);
       });
   });

   var fileIndex = 0;
   var totalFileSize = 0;
   var fileList = new Array();
   var fileSizeList = new Array();
   var uploadSize = 50;
   var maxUploadSize = 500;

   $(function() {
       fileDropDown();
   });

   function fileDropDown() {
       var dropZone = $("#dropZone");
       dropZone.on('dragenter', function(e) {
           e.stopPropagation();
           e.preventDefault();
           dropZone.css('background-color', '#E3F2FC');
       });
       dropZone.on('dragleave', function(e) {
           e.stopPropagation();
           e.preventDefault();
           dropZone.css('background-color', '#FFFFFF');
       });
       dropZone.on('dragover', function(e) {
           e.stopPropagation();
           e.preventDefault();
           // 드롭다운 영역 css
           dropZone.css('background-color', '#E3F2FC');
       });
       dropZone.on('drop', function(e) {
           e.preventDefault();
           dropZone.css('background-color', '#FFFFFF');

           var files = e.originalEvent.dataTransfer.files;
           if (files != null) {
               if (files.length < 1) {
                   console.log("폴더 업로드 불가");
                   return;
               } else {
                   selectFile(files)
               }
           } else {
               alert("ERROR");
           }
       });
   }

   function selectFile(fileObject) {
       var files = null;

       if (fileObject != null) {
           files = fileObject;
       } else {
           files = $('#multipaartFileList_' + fileIndex)[0].files;
       }

       if (files != null) {
           
           if (files != null && files.length > 0) {
               $("#fileDragDesc").hide(); 
               $("fileListTable").show();
           } else {
               $("#fileDragDesc").show(); 
               $("fileListTable").hide();
           }
           
           for (var i = 0; i < files.length; i++) {
               var fileName = files[i].name;
               var fileNameArr = fileName.split("\.");
               var ext = fileNameArr[fileNameArr.length - 1];
               
               var fileSize = files[i].size;
               console.log("fileSize="+fileSize);
               if (fileSize <= 0) {
                   console.log("0kb file return");
                   return;
               }
               
               var fileSizeKb = fileSize / 1024;
               var fileSizeMb = fileSizeKb / 1024;
               
               var fileSizeStr = "";
               if ((1024*1024) <= fileSize) {
                   console.log("fileSizeMb="+fileSizeMb.toFixed(2));
                   fileSizeStr = fileSizeMb.toFixed(2) + " Mb";
               } else if ((1024) <= fileSize) {
                   console.log("fileSizeKb="+parseInt(fileSizeKb));
                   fileSizeStr = parseInt(fileSizeKb) + " kb";
               } else {
                   console.log("fileSize="+parseInt(fileSize));
                   fileSizeStr = parseInt(fileSize) + " byte";
               }

               if ($.inArray(ext, [ 'png', 'jpg', 'PNG', 'JPG' ]) == -1) {
                   alert("등록이 불가능한 파일 입니다.("+fileName+")");
               } else if (fileSizeMb > uploadSize) {
                   alert("용량 초과\n업로드 가능 용량 : " + uploadSize + " MB");
                   break;
               } else {
                   totalFileSize += fileSizeMb;
                   fileList[fileIndex] = files[i];
                   fileSizeList[fileIndex] = fileSizeMb;
                   addFileList(fileIndex, fileName, fileSizeStr);
                   fileIndex++;
               }
           }
       } else {
           alert("ERROR");
       }
   }

   function addFileList(fIndex, fileName, fileSizeStr) {
       var html = "";
       html += "<tr id='fileTr_" + fIndex + "'>";
       html += "    <td id='dropZone' class='left' >";
       html += fileName + " (" + fileSizeStr +") "
               + "<input value='삭제' type='button' href='#' onclick='deleteFile(" + fIndex + "); return false;'>"
       html += "    </td>"
       html += "</tr>"
       $('#fileTableTbody').append(html);
   }

   function deleteFile(fIndex) {
       console.log("deleteFile.fIndex=" + fIndex);
       totalFileSize -= fileSizeList[fIndex];
       delete fileList[fIndex];
       delete fileSizeList[fIndex];
       $("#fileTr_" + fIndex).remove();
       
        console.log("totalFileSize="+totalFileSize);
        
        if (totalFileSize > 0) {
            $("#fileDragDesc").hide();
            $("fileListTable").show();
        } else {
            $("#fileDragDesc").show();
            $("fileListTable").hide();
        }
    }
</script>
</head>
<body>
	<div id="section">
		<jsp:include page="/WEB-INF/jsp/view/page_type_1/header.jsp" />
		
		<section id="gallery_insert">
			<div class="inner">
				<div class="title_area">
					<span>갤러리 등록</span>
				</div>
				
				<form name="uploadForm" id="uploadForm" enctype="multipart/form-data" method="post" action="gallery_update">
					<div class="infomation">
						<div class="left_area">
							<span>제목</span>
						</div>
						
						<div class="right_area">
							<input type="text" name="title" placeholder="제목을 입력해주세요.">
						</div>
					</div>
					<div class="infomation">
						<div class="left_area">
							<span>섬네일</span>
						</div>
						
						<div class="right_area">
							<input type="text" disabled id="thumbnail_name" placeholder="* 4:3 비율의 이미지가 사용 가능합니다.">
							<input type="file" id="thumbnail" name="thumbnail_file" accept="image/*">
							<label for="thumbnail"><img alt="" src="${root}/img/website/upload_icon.svg">내 PC</label>
							
							<script type="text/javascript">
								$(function () {
									$('input[name=thumbnail_file]').off().on('change', function(){
										var fileValue = $("#thumbnail").val().split("\\");
										var fileName = fileValue[fileValue.length-1];
										$('#thumbnail_name').val(fileName);
									});
								});
							</script>
						</div>
					</div>
					
					<div class="infomation">
						<div class="left_area">
							<span>이미지</span>
						</div>
						
						<div class="right_area">
							<div id="dropZone" class="drop_area">
								<div id="fileDragDesc">
									* png, jpg 사용가능합니다.<br>
									* 총 5MB용량 사용 가능합니다.<br>
									* 마우스로 이미지를 끌어오세요.<br>
								</div>
							
								<table id="fileListTable">
									<tbody id="fileTableTbody">
							
									</tbody>
								</table>
							</div>
		
							<div class="upload-btn-wrapper">
								<input type="file" id="input_file" multiple="multiple" name="img" accept="image/*"/>
								<label for="input_file"><img alt="" src="${root}/img/website/upload_icon.svg">내 PC</label>
							</div>
						</div>
					</div>
					
					<div class="infomation">
						<div class="left_area">
							<span>링크 첨부</span>
						</div>
						
						<div class="right_area">
							<input type="text" placeholder="원하는 영상의 링크를 추가해주세요." name="link_1">
							<input type="text" placeholder="원하는 영상의 링크를 추가해주세요." name="link_2">
							<input type="text" placeholder="원하는 영상의 링크를 추가해주세요." name="link_3">
						</div>
					</div>
					
					<div class="btn_area">
						<input type="submit" value="완료">
						<input type="reset" value="취소">
					</div>
					
					<input type="hidden" value="${contents_idx}" name="contents_idx">
					<input type="hidden" value="${gallery_idx}" name="gallery_idx">
				</form>
			</div>
			
			<jsp:include page="/WEB-INF/jsp/footer/footer.jsp" />
		</section>
	</div>
</body>
</html>