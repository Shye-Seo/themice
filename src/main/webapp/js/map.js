function sample4_execDaumPostcode() {
	new daum.Postcode({
		oncomplete : function(data) {
			var roadAddr = data.roadAddress;
			document.getElementById('postcode').value = data.zonecode;
			document.getElementById("roadAddress").value = roadAddr;
		}
	}).open();
}


function sample4_execDaumPostcode_1() {
	new daum.Postcode({
		oncomplete : function(data) {
			var roadAddr = data.roadAddress;
			document.getElementById('postcode_1').value = data.zonecode;
			document.getElementById("roadAddress_1").value = roadAddr;
			
		}
	}).open();
}