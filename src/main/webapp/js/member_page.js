$('#member_info_update_btn').click(function(){
	var name = $('#name').val();
	var sms_certification = $('#sms_certification').val();
	
	if(name == null || name == ''){
		alert('이름을 입력해주세요.');
		return false;
	} else if(sms_certification == null || sms_certification == ''){
		alert('휴대폰 번호 인증을 해주세요.');
		return false;
	} else {
		$('#joinform').submit();
	}
});

$('#m_tel_btn').click(function(){
	var tel = $('#m_tel').val();
	var regPhone = /^01([0|1|6|7|8|9])-?([0-9]{3,4})-?([0-9]{4})$/;
	
	if (regPhone.test(tel) === true) {
		if(tel == null || tel == ''){
			alert('휴대폰 번호를 입력해주세요');    
		} else {
			$.ajax({
				url : 'send_m_sms',
				type : 'post',
				data : {
					tel : tel
				},
				success : function(data) {
					if ($.trim(data) == 0) {
						alert('인증번호 발송에 실패하였습니다');
					}
				},
				error : function() {
					alert('인증번호 발송에 실패하였습니다');
				}
			});
		}
    } else {
    	alert('휴대폰 번호를 입력해주세요.');
    }
});
	
$('#m_submit_btn').click(function(){
	var name = $('#m_name').val();
	var certification = $('#certification').val();
	
	if(name == null || name == ''){
		alert('이름을 입력해주세요.');
		return false;
	} else {
		$.ajax({
			url : 'send_m_sms_check',
			type : 'post',
			data : {
				certification : certification
			},
			success : function(data) {
				if ($.trim(data) == 0) {
					$('#m_form').submit();
				} else {
					alert('인증번호를 다시 입력하세요');
				}
			},
			error : function() {
				alert('인증번호 발송에 실패하였습니다');
			}
		});
	}
});

$('#member_pw_update_btn').click(function () {
	var current_password = $('#current_password').val();
	var member_pw = $('#member_pw').text();
	var member_pw_check = $('#member_pw_check').text();
	
	$.ajax({
		url : 'member_pw_check',
		type : 'post',
		data : {
			current_password : current_password
		},
		success : function(data) {
			if ($.trim(data) == 0) {
				alert('현재 비밀번호를 잘못 입력했습니다.');
			} else {
				if(member_pw != '사용가능'){
					alert("비밀번호를 다시 입력하세요.");
					return false;
				} else if(member_pw_check != '사용가능'){
					alert("비밀번호를 다시 입력하세요.");
					return false;
				} else {
					$('form').submit();
				}
			}
		},
		error : function() {
			alert('현재 비밀번호를 잘못 입력했습니다.');
		}
	});
});