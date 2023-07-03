<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="/resources/css/mypage_css.css">
</head>
<body>
<%@ include file="header.jsp"%>
<div class="container">
	<h1>Mypage</h1>
	
	<form action="" method="post" enctype="multipart/form-data">	
		<h1>${seniorDetail.name}님 만${2023 - fn:substring(seniorDetail.birthday, 0, 4)}세</h1>

		<label for="image">     
            <img class="profileimage" id="preview" src="${pageContext.request.contextPath}/image/profile/${seniorImg.fileName}" onerror="this.onerror=null;this.src='${pageContext.request.contextPath}/image/profile/noprofile1.png?v=1';">
        </label>
        <input type="file" name="file" id="image" style="display: none;" onchange="readURL(this)">
        <br>
        <input type="hidden" value="<%= session.getAttribute("userId") %>" name="id"><br>
		
		<div class="smallContainer">
		<p id="pw_p">비밀번호 <button type="button" onclick="location.href='/changePassword'">수정</button></p><br>
		<p id="pw_p">시니어 추가인증 <button type="button" onclick="location.href='/certification'" style=" width: 130px;">인증하러가기</button></p><br>
		<label>전화번호</label><br>
		<input type="text" name="phoneNumber" value="${seniorDetail.phoneNumber}" disabled><br>
		
		<label>주소</label><br>
		<input type="text" class="postcode input_h" name="postCode" placeholder="우편번호">
		<input type="button" id="pc_btn" onclick="sample6_execDaumPostcode(event)" value="우편번호 찾기"><br>
		<input type="text" id="address" class="input_h" name="address" placeholder="주소"><br>
		<input type="text" class="input_h" name="detailAddress" placeholder="상세주소"><br>
		<input type="text" class="input_h" name="extraAddress" placeholder="참고항목"><br>
		
		<label>이메일주소</label><br>
		<input type="email" class="input_h" name="email" value="${seniorDetail.email}"><br>

		<label>희망지역</label><br>
		<input type="text" class="input_h" name="area" value="${seniorDetail.area}"><br>

		<label>자기소개</label><br>
		<textarea cols="55" rows="10" name="info">${seniorDetail.info}</textarea><br>

		
		<p>희망스케줄</p>
		<div class="timeContainer">
			<span id="am">오전(09:00~12:00)</span>
			<span id="pm">오후(14:00~18:00)</span>
			<span id="mon">월요일</span><span id="tue">화요일</span><span id="wed">수요일</span>
			<span id="thur">목요일</span><span id="fri">금요일</span>
				
		<c:forEach var="item" items="${seniorEnableSchedule}">
	
			<c:set var="code" value="${item.scheduleCode}"/>
			<c:set var="status" value="${item.status}"/>
			<c:set var="workStatus" value="${item.workStatus}"/>
	
			<input type="hidden" name="scheduleCode" value="${item.scheduleCode}">
			<input type="hidden" name="status" value="${item.status}">
			<input type="hidden" name="workStatus" value="N"
			<c:if test="${fn:contains(workStatus, 'Y')}">disabled</c:if>>
			<input type="checkbox" onclick="toggle()" id="${item.scheduleCode}" class="workStatus" name="workStatus" value="Y" 
			<c:if test="${fn:contains(workStatus, 'Y')}">checked</c:if>
			<c:if test="${fn:contains(status, 'Y') && fn:contains(workStatus, 'N')}">disabled</c:if>>
			<label for="${item.scheduleCode}" class="sc_label"></label>
		</c:forEach>
		</div>
		<button type="reset" class="update_btn">되돌리기</button>
		<button type="submit" class="update_btn">수정하기</button>
		</div>
	</form>
</div>
	
	<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
	<script src="/resources/js/postcode_js.js"></script>
	<script>
		function toggle(){
			let checkboxes = document.querySelectorAll('input[type=checkbox]');
			
			for (var i=0; i<checkboxes.length; i++){
				checkboxes[i].addEventListener('change', function(event)
		        {
		            if (event.target.checked) {
		                event.target.previousElementSibling.disabled = true;
		                event.target.previousElementSibling.previousElementSibling.value = "Y";
		            }else{
		                event.target.previousElementSibling.disabled = false;		            	
		                event.target.previousElementSibling.previousElementSibling.value = "N";
		            }
		        });
		    }
		};
		
        let image = document.getElementById('image');
        let preview = document.getElementById('preview');

        function readURL(image) {
            if (image.files && image.files[0]) {
                var reader = new FileReader();
                reader.onload = function(e) {
                    preview.src = e.target.result;
                };
                reader.readAsDataURL(image.files[0]);
            } else {
                preview.src = "";
            }
        }
        
        // Open file selection dialog when the image is clicked
        preview.onclick = function() {
            image.value = null; // Reset the selected file
        };
    </script>
</body>
</html>