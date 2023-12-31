<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>마이페이지</title>
<link rel="stylesheet" href="/resources/css/mypage_css.css">
</head>
<body>
<%@ include file="header.jsp"%>
<div class="container">
	<h1>Mypage</h1>
	
	<form action="" method="post" enctype="multipart/form-data">	
		<h1>${parentsDetail.name} 님</h1>
		
		<label for="image">     
            <img class="profileimage" id="preview" src="${pageContext.request.contextPath}/image/profile/${parentsImg.fileName}" onerror="this.onerror=null;this.src='/resources/image/no_profile.png'">
        </label>
        <input type="file" name="file" id="image" style="display: none;" onchange="readURL(this)" >
        <br>
        <input type="hidden" value="<%= session.getAttribute("userId") %>" name="id"><br>
		
		<div class="smallContainer">
		<p id="pw_p">비밀번호 <button type="button" onclick="location.href='/changePassword'">수정</button></p><br>
		
		<div style="background-color: white; border-radius: 10px; margin-bottom: 10px;">
		<label>전화번호</label><br>
		<input type="text" class="input_h" name="phoneNumber" value="${parentsDetail.phoneNumber}" style="font-size:1.2rem;" disabled><br>
		
		<label>주소</label><br>
		<input type="text" value="${parentsDetail.postCode}" class="postcode input_h" name="postCode" placeholder="우편번호" style="font-size:1.2rem; border-bottom: 1px solid lightgray;">
		<input type="button" id="pc_btn" onclick="sample6_execDaumPostcode(event)" value="우편번호 찾기" style="font-size:1.2rem;"><br>
		<input type="text" value="${parentsDetail.address}" id="address" class="input_h" name="address" placeholder="주소" style="font-size:1.2rem; border-bottom: 1px solid lightgray;"><br>
		<input type="text" value="${parentsDetail.detailAddress}"class="input_h" name="detailAddress" placeholder="상세주소" style="font-size:1.2rem; border-bottom: 1px solid lightgray;"><br>
		<input type="text"  value="${parentsDetail.extraAddress}"class="input_h" name="extraAddress" placeholder="참고항목" style="font-size:1.2rem; border-bottom: 1px solid lightgray;"><br>
		
		<label>이메일주소</label><br>
		<input type="email" class="input_h" name="email" value="${parentsDetail.email}" style="font-size:1.2rem; border-bottom: 1px solid lightgray;"><br>
		</div>
		
		<label>자녀소개</label><br>
		<p style="background-color: white; border-radius: 10px; margin-bottom: 10px; line-height: 52px; height: 52px;">${parentsDetail.CName}
		<c:if test="${parentsDetail.CGender eq 'F'}">
			<span>여아</span>
		</c:if>
		<c:if test="${parentsDetail.CGender eq 'M'}">
			<span>남아</span>
		</c:if>
		<span>${2023 - fn:substring(parentsDetail.birthyear, 0, 4)}세</span><br>
		<br>
		</p>	
		<textarea cols="46" rows="10" name="personality" style="font-family: 'omyu_pretty'; font-size:1.2rem;">${parentsDetail.personality}</textarea>
		
		<label>기타사항</label><br>
		<textarea cols="46" rows="10" name="etc" style="font-family: 'omyu_pretty'; font-size:1.2rem;">${parentsDetail.etc}</textarea>
	
		<button type="reset" class="update_btn">되돌리기</button>
		<button type="submit" class="update_btn">수정하기</button>
		</div>
	</form>
</div>
	
	<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
	<script src="/resources/js/postcode_js.js"></script>
	<script>
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