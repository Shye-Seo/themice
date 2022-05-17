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
           //this.files[0].size gets the size of your file.
           //alert(this.files[0].size);
       });
   });
   
   // 파일 리스트 번호
   var fileIndex = 0;
   // 등록할 전체 파일 사이즈
   var totalFileSize = 0;
   // 파일 리스트
   var fileList = new Array();
   // 파일 사이즈 리스트
   var fileSizeList = new Array();
   // 등록 가능한 파일 사이즈 MB
   var uploadSize = 5;
   // 등록 가능한 총 파일 사이즈 MB
   var maxUploadSize = 500;
	
   $(function() {
       // 파일 드롭 다운
       fileDropDown();
   });

   // 파일 드롭 다운
   function fileDropDown() {
       var dropZone = $("#dropZone");
       //Drag기능 
       dropZone.on('dragenter', function(e) {
           e.stopPropagation();
           e.preventDefault();
           // 드롭다운 영역 css
           dropZone.css('background-color', '#E3F2FC');
       });
       dropZone.on('dragleave', function(e) {
           e.stopPropagation();
           e.preventDefault();
           // 드롭다운 영역 css
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
           // 드롭다운 영역 css
           dropZone.css('background-color', '#FFFFFF');

           var files = e.originalEvent.dataTransfer.files;
           if (files != null) {
               if (files.length < 1) {
                   /* alert("폴더 업로드 불가"); */
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

   // 파일 선택시
   function selectFile(fileObject) {
       var files = null;

       if (fileObject != null) {
           // 파일 Drag 이용하여 등록시
           files = fileObject;
       } else {
           // 직접 파일 등록시
           files = $('#multipaartFileList_' + fileIndex)[0].files;
       }

       // 다중파일 등록
       if (files != null) {
           
           if (files != null && files.length > 0) {
               $("#fileDragDesc").hide(); 
               $("fileListTable").show();
           } else {
               $("#fileDragDesc").show(); 
               $("fileListTable").hide();
           }
           
           for (var i = 0; i < files.length; i++) {
               // 파일 이름
               var fileName = files[i].name;
               var fileNameArr = fileName.split("\.");
               // 확장자
               var ext = fileNameArr[fileNameArr.length - 1];
               
               var fileSize = files[i].size; // 파일 사이즈(단위 :byte)
               console.log("fileSize="+fileSize);
               if (fileSize <= 0) {
                   console.log("0kb file return");
                   return;
               }
               
               var fileSizeKb = fileSize / 1024; // 파일 사이즈(단위 :kb)
               var fileSizeMb = fileSizeKb / 1024;    // 파일 사이즈(단위 :Mb)
               
               var fileSizeStr = "";
               if ((1024*1024) <= fileSize) {    // 파일 용량이 1메가 이상인 경우 
                   console.log("fileSizeMb="+fileSizeMb.toFixed(2));
                   fileSizeStr = fileSizeMb.toFixed(2) + " Mb";
               } else if ((1024) <= fileSize) {
                   console.log("fileSizeKb="+parseInt(fileSizeKb));
                   fileSizeStr = parseInt(fileSizeKb) + " kb";
               } else {
                   console.log("fileSize="+parseInt(fileSize));
                   fileSizeStr = parseInt(fileSize) + " byte";
               }
				
               /* if ($.inArray(ext, [ 'exe', 'bat', 'sh', 'java', 'jsp', 'html', 'js', 'css', 'xml' ]) >= 0) {
                   // 확장자 체크
                   alert("등록 불가 확장자");
                   break; */
               if ($.inArray(ext, ['png', 'jpg', 'PNG', 'JPG']) == -1) {
                   // 확장자 체크
                   /* alert("등록이 불가능한 파일 입니다.");
                   break; */
                   alert("등록이 불가능한 파일 입니다.("+fileName+")");
               } else if (fileSizeMb > uploadSize) {
                   // 파일 사이즈 체크
                   alert("용량 초과\n업로드 가능 용량 : " + uploadSize + " MB");
                   break;
               } else {
                   // 전체 파일 사이즈
                   totalFileSize += fileSizeMb;

                   // 파일 배열에 넣기
                   fileList[fileIndex] = files[i];

                   // 파일 사이즈 배열에 넣기
                   fileSizeList[fileIndex] = fileSizeMb;

                   // 업로드 파일 목록 생성
                   addFileList(fileIndex, fileName, fileSizeStr);

                   // 파일 번호 증가
                   fileIndex++;
               }
           }
       } else {
           alert("ERROR");
       }
   }

   // 업로드 파일 목록 생성
   function addFileList(fIndex, fileName, fileSizeStr) {
       /* if (fileSize.match("^0")) {
           alert("start 0");
       } */

       var html = "";
       html += "<tr id='fileTr_" + fIndex + "'>";
       html += "    <td id='dropZone' class='left' >";
       html += fileName + " (" + fileSizeStr +") " 
               //+ "<a href='#' onclick='deleteFile(" + fIndex + "); return false;' class='btn small bg_02'> 삭제</a>"
               + "<img src='${root}/img/website/close.svg' href='#' onclick='deleteFile(" + fIndex + "); return false;'"
       html += "    </td>"
       html += "</tr>"

       $('#fileTableTbody').append(html);
   }

   // 업로드 파일 삭제
   function deleteFile(fIndex) {
       console.log("deleteFile.fIndex=" + fIndex);
       // 전체 파일 사이즈 수정
       totalFileSize -= fileSizeList[fIndex];

       // 파일 배열에서 삭제
       delete fileList[fIndex];

       // 파일 사이즈 배열 삭제
       delete fileSizeList[fIndex];
		
       // 업로드 파일 테이블 목록에서 삭제
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

    // 파일 등록
    function uploadFile() {
        // 등록할 파일 리스트
        var uploadFileList = Object.keys(fileList);

        // 파일이 있는지 체크
        if (uploadFileList.length == 0) {
            // 파일등록 경고창
            alert("파일이 없습니다.");
            return;
        }

        // 용량을 500MB를 넘을 경우 업로드 불가
        if (totalFileSize > maxUploadSize) {
            // 파일 사이즈 초과 경고창
            alert("총 용량 초과\n총 업로드 가능 용량 : " + maxUploadSize + " MB");
            return;
        }

        if (confirm("등록 하시겠습니까?")) {
            // 등록할 파일 리스트를 formData로 데이터 입력
            var form = $('#uploadForm');
            var formData = new FormData(form);
            for (var i = 0; i < uploadFileList.length; i++) {
                formData.append('files', fileList[uploadFileList[i]]);
            }

            $.ajax({
                url : "업로드 경로",
                data : formData,
                type : 'POST',
                enctype : 'multipart/form-data',
                processData : false,
                contentType : false,
                dataType : 'json',
                cache : false,
                success : function(result) {
                    if (result.data.length > 0) {
                        alert("성공");
                        location.reload();
                    } else {
                        alert("실패");
                        location.reload();
                    }
                }
            });
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
				
				<form name="uploadForm" id="uploadForm" enctype="multipart/form-data" method="post" action="gallery_insert">
					<div class="infomation">
						<div class="left_area">
							<span>제목</span>
						</div>
						
						<div class="right_area">
							<input type="text" name="title" placeholder="제목을 입력해주세요." id="title">
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
						<input type="submit" value="완료" id="submit_btn">
						<input type="reset" value="취소">
						
						<script type="text/javascript">
							$('#submit_btn').click(function () {
								var title = $('#title').val();
								var thumbnail = $('#thumbnail').val();
								
								if(!title) {
									
								} else if (thumbnail) {
									
								} else {
									
								}
							});
						</script>
					</div>
					
					<input type="hidden" value="${contents_idx}" name="contents_idx">
				</form>
			</div>
			
			<jsp:include page="/WEB-INF/jsp/footer/footer.jsp" />
		</section>
	</div>
</body>
</html>