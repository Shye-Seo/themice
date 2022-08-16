function smsCheck(obj, root) {
	
	var tel = obj.tel.value;
	
	if (obj.tel.value == "") {
		alert("휴대폰 번호를 입력하세요.");
		obj.tel.focus();
		return false;
	} else {
		$.ajax({
			url : 'duplicate_member_tel',
			type : 'post',
			data : {
				tel : tel
			},
			success : function(data) {
				if ($.trim(data) == 0) {
					let url = root + "/sendSMS?tel=" + tel
					window.open(url, "", "width=400, height=200");
				} else {
					alert("사용중인 번호입니다.");
					return false;
				}
			},
			error : function() {
				alert("다시 입력하세요.");
			}
		});
	}
}

// [개인]마이페이지 회원수정할때 휴대폰 인증
function mypage_smsCheck(obj, root) {    
	
	var tel = obj.tel.value;
	
	if (obj.tel.value == "") {
		alert("휴대폰 번호를 입력하세요.");    
		obj.tel.focus();
		return false;
	} else {
		$.ajax({
			url : 'duplicate_member_tel',
			type : 'post',
			data : {
				tel : tel
			},
			success : function(data) {
				if ($.trim(data) != 0) {
					let url = root + "/sendSMS?tel=" + tel
					window.open(url, "", "width=400, height=200");
				} 
			},
			error : function() {
				alert("다시 입력하세요.");
			}
		});
	}
}
	
function business_smsCheck(obj, root) {
	
	var tel = obj.business_tel.value;
	
	if (obj.business_tel.value == "") {
		alert("휴대폰 번호를 입력하세요.");
		obj.business_tel.focus();
		return false;
	} else {
		$.ajax({
			url : 'duplicate_business_tel',
			type : 'post',
			data : {
				tel : tel
			},
			success : function(data) {
				if ($.trim(data) == 0) {
					let url = root + "/business_sendSMS?tel=" + tel
					window.open(url, "", "width=400, height=200");
				} else {
					alert("사용중인 번호 입니다.");
					return false;
				}
			},
			error : function() {
				alert("다시 입력하세요.");
			}
		});
	}
}

// [기업]마이페이지 회원수정할때 휴대폰 인증
function mypage_business_smsCheck(obj, root) {
	
	var tel = obj.business_tel.value;
	
	if (obj.business_tel.value == "") {
		alert("휴대폰 번호를 입력하세요.");
		obj.business_tel.focus();
		return false;
	} else {
		$.ajax({
			url : 'duplicate_business_tel',
			type : 'post',
			data : {
				tel : tel
			},
			success : function(data) {
				if ($.trim(data) != 0) {
					let url = root + "/business_sendSMS?tel=" + tel
					window.open(url, "", "width=400, height=200");
				} 
			},
			error : function() {
				alert("다시 입력하세요.");
			}
		});
	}
}
	
function setDisplay(){
	if($('input:radio[id=member_check]').is(':checked')){
	    $('#member').css('display', 'block');
	}else{
		$('#member').css('display', 'none');
	}
	
	if($('input:radio[id=business_check]').is(':checked')){
	    $('#business').css('display', 'block');
	}else{
		$('#business').css('display', 'none');
	}
}
	
function checkId() {
	var id = $('#id').val();
	$.ajax({
		url : 'idCheck',
		type : 'post',
		data : {
			id : id
		},
		success : function(data) {
			if ($.trim(data) == 0) {
				$('#member_id_check').html("사용가능");
				$('#member_id_check').css('color', 'blue');
			} else {
				$('#member_id_check').html("사용불가");
				$('#member_id_check').css('color', 'red');
			}
		},
		error : function() {
			alert("다시 입력하세요.");
		}
	});
};
	
$('.member_pw').focusout(function (){
	var pw = $('.member_pw').val();
	var num = pw.search(/[0-9]/g);
	var eng = pw.search(/[a-z]/ig);
	var spe = pw.search(/[`~!@@#$%^&*|₩₩₩'₩";:₩/?]/gi);

	if(pw.length < 10 || pw.length > 16){
		$('#member_pw').text('사용불가');
		$('#member_pw').css('color', 'red');
	} else if(pw.search(/\s/) != -1){
		$('#member_pw').text('사용불가');
		$('#member_pw').css('color', 'red');
	} else if( (num < 0 && eng < 0) || (eng < 0 && spe < 0) || (spe < 0 && num < 0) ){
		$('#member_pw').text('사용불가');
		$('#member_pw').css('color', 'red');
	}else {
		$('#member_pw').text('사용가능');
		$('#member_pw').css('color', 'blue');
	 }
});
	
$('.member_pw_check').focusout(function() {
	var pwd1 = $('.member_pw').val();
	var pwd2 = $('.member_pw_check').val();

	if (pwd1 != '' && pwd2 == '') {
		null;
	} else if (pwd1 != "" || pwd2 != "") {
		if (pwd1 == pwd2) {
			$('#member_pw_check').text('사용가능');
			$('#member_pw_check').css('color', 'blue');
		} else {
			$('#member_pw_check').text('사용불가');
			$('#member_pw_check').css('color', 'red');
		}
	}
});
	
$("select[name=sel_email]").on("change",function() {
	var $addr = $(this).closest(".form").find("input[name=email_add]");
	if ($(this).val() == "etc") {
		$addr.val('');
		$addr.prop("readonly", false);
	} else {
		$addr.val($(this).val());
		$addr.prop("readonly", true);
	}
});
	
$('#email_add').focusout(function (){
	var email = $('#email').val() + '@' + $('#email_add').val();	
	$.ajax({
		url : 'duplicate_member_email',
		type : 'post',
		data : {
			email : email
		},
		success : function(data) {
			if ($.trim(data) == 0) {
				$('#email_check').val('true');
			} else {
				$('#email_check').val('false');
			}
		},
		error : function() {
			alert("사용중인 이메일입니다.");
		}
	});
});
	
$('#sms_certification').change(function(){
	$("#tel").prop('readonly', true);
});
	
$('#member_submit_btn').click(function () {
	var member_id_check = $('#member_id_check').text();
	var member_pw = $('#member_pw').text();
	var member_pw_check = $('#member_pw_check').text();
	var member_name = $('#member_name').val();
	var sms_certification = $('#sms_certification').val();
	var email_check =$('#email_check').val();
	
	if(member_id_check != '사용가능'){
		alert("아이디를 다시 입력하세요.");
		return false;
	} else if(member_pw != '사용가능'){
		alert("비밀번호를 다시 입력하세요.");
		return false;
	} else if(member_pw_check != '사용가능'){
		alert("비밀번호를 다시 입력하세요.");
		return false;
	} else if(!member_name){
		alert("이름을 입력해주세요.");
		return false;
	} else if(sms_certification != '인증완료'){
		alert("휴대폰 번호를 인증해주세요.");
		return false;
	} else if(email_check == 'false'){
		alert("등록된 메일입니다.");
		return false;
	} else {
		$('#joinform').submit();
	}
});

$('.business_num').focusout(function (){
	
	var business_num = $('.business_num').val();
	
	$.ajax({
		url : 'business_num_check',
		type : 'post',
		data : {
			business_num : business_num
		},
		success : function(data) {
			if ($.trim(data) == 0) {
				var numberMap = business_num.replace(/-/gi, '').split('').map(function (d){
					return parseInt(d, 10);
				});
			
				if(numberMap.length == 10){
					var keyArr = [1, 3, 7, 1, 3, 7, 1, 3, 5];
					var chk = 0;
					
					keyArr.forEach(function(d, i){
						chk += d * numberMap[i];
					});
					
					chk += parseInt((keyArr[8] * numberMap[8])/ 10, 10);
					console.log(chk);
					$('#business_num_check').text('사용가능');
					$("#business_num_check").css('color','blue');
					return Math.floor(numberMap[9]) === ( (10 - (chk % 10) ) % 10);
				}
				$('#business_num_check').text('사용불가');
				$("#business_num_check").css('color','red');
				return false;
			} else {
				alert("등록된 사업자 번호입니다.");
			}
		},
		error : function() {
			alert("다시 입력하세요.");
		}
	});
});
	
$('.business_pw').focusout(function (){
	var pw = $(".business_pw").val();
	var num = pw.search(/[0-9]/g);
	var eng = pw.search(/[a-z]/ig);
	var spe = pw.search(/[`~!@@#$%^&*|₩₩₩'₩";:₩/?]/gi);
	
	if(pw.length < 10 || pw.length > 16){
		$('#business_pw').text('사용불가');
		$('#business_pw').css('color', 'red');
	} else if(pw.search(/\s/) != -1){
		$('#business_pw').text('사용불가');
		$('#business_pw').css('color', 'red');
	} else if( (num < 0 && eng < 0) || (eng < 0 && spe < 0) || (spe < 0 && num < 0) ){
		$('#business_pw').text('사용불가');
		$('#business_pw').css('color', 'red');
	}else {
		$('#business_pw').text('사용가능');
		$('#business_pw').css('color', 'blue');
	}
});


$('.business_pw_check').focusout(function() {
	var pwd1 = $(".business_pw").val();
	var pwd2 = $(".business_pw_check").val();
	
	if (pwd1 != '' && pwd2 == '') {
		null;
	} else if (pwd1 != "" || pwd2 != "") {
		if (pwd1 == pwd2) {
			$('#business_pw_check').text('비밀번호가 일치합니다.');
			$('#business_pw_check').css('color', 'blue');
		} else {
			$('#business_pw_check').text('비밀번호가 일치하지 않습니다.');
			$('#business_pw_check').css('color', 'red');
		}
	}
});

$("select[name=business_email]").on("change",function() {
	var $addr = $(this).closest(".form").find("input[name=business_email]");
	if ($(this).val() == "etc") {
		$addr.val('');
		$addr.prop("readonly", false);
	} else {
		$addr.val($(this).val());
		$addr.prop("readonly", true);
	}
});

$('.mail_item_2').focusout(function (){
	var email = $('.mail_item_1').val() + '@' + $('.mail_item_2').val();	
	$.ajax({
		url : 'duplicate_business_email',
		type : 'post',
		data : {
			email : email
		},
		success : function(data) {
			if ($.trim(data) == 0) {
				$('#business_email_check').val('true');
			} else {
				$('#business_email_check').val('false');
			}
		},
		error : function() {
			alert("다시 입력하세요.");
		}
	});
});

$('#business_sms_certification').change(function(){
	$("#business_tel").prop('readonly', true);
});

$('#business_submit_btn').click(function () {
	var business_num = $('#business_num_check').text();
	var business_file_upload = $('#business_file_upload').val();
	var business_pw = $('#business_pw').text();
	var business_pw_check = $('#business_pw_check').text();
	var business_email_check = $('#business_email_check').val();
	var business_sms_certification = $('#business_sms_certification').val();
	
	if(business_num != '사용가능'){
		alert('사업자등록 번호를 확인해주세요.');
		$('.business_num').focus();
		return false;
	} else if(!business_file_upload) {
		alert('사업자등록증을 첨부해주세요.');
		$('.business_file_upload').focus();
		return false;
	} else if(business_pw != '사용가능') {
		alert('비밀번호를 확인해주세요11.');
		$('#business_pw').focus();
		return false;
	} else if(business_pw_check != '비밀번호가 일치합니다.') {
		alert('비밀번호를 확인해주세요22.');
		$('#business_pw_check').focus();
		return false;
	} else if(business_email_check == 'false') {
		alert('이미 사용중인 이메일 입니다.');
		$('.mail_item_1').focus();
		return false;
	} else if(business_sms_certification != '인증완료') {
		alert('휴대폰 번호를 인증해주세요.');
		$('#business_tel').focus();
		return false;
	} else {
		$('#businessform').submit();
	}
});