<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.7.0/jquery.min.js"
	integrity="sha512-3gJwYpMe3QewGELv8k/BX9vcqhryRdzRMxVfq6ngyWXwo03GFEzjsUm8Q7RZcHPHksttq7/GFoxjCVUjkjvPdw=="
	crossorigin="anonymous" referrerpolicy="no-referrer"></script>
<style type="text/css">
.container {
	width: 100%;
	height: 100%;
}
</style>


</head>
<body>
	<h1>회원가입</h1>
	<div class="container">
		<form method="post" action="" name="userInfo">

			아이디<br>
			<!-- 로그인 중복확인 하면 아이디값이 인풋에 들어가도록 보완필요 -->
			<input type="text" class="id_input" id="id" name="id" maxlength="50" onkeydown="inputIdChk()">
			<button type="button" id="IdChkBtn" onclick="openIdChk()">중복확인</button>
			<input type="text" id="idDuplication" name="idDuplication" value="idUnCheck"> <br>

			비밀번호<br> <input type="password" id="password" name="password"	placeholder="비밀번호 입력"><br>
			비밀번호 확인<br> <input type="password" id="passwordCheck" name="passwordCheck" placeholder="비밀번호 확인"><br>

			이름<br> <input type="text" id="name" name="name" placeholder="이름"><br>
			생년월일<br> <input type="date" id="birthday" name="birthday"><br> 
			성별<br>
			남자<input type="radio" id="genderM" name="gender" value="M" checked>
			여자<input type="radio" id="genderF" name="gender" value="F"> <br>
			
			<%@ include file="sms_cf.jsp"%>
			
			주소<br><%@ include file="address.jsp"%>
			<br> 이메일<br> <input type="text" id="email" name="email"><br>

			<!-- 이전 페이지에서 부모 버튼 누르면 "PAR"입력, 시니어 누르면 "SNR" 입력됨. 확인 후 hidden할 것임. -->


				<input type="text" class="user_code" id="user_code" name="userCode"
					value="SNR">
				<input type="date" id="regDate" name="regDate">


			<!-- 부모 누르면 parForm 가져오고 시니어 누르면 snrForm 가져오기 -->

			<c:if test="${type == 'snr'}">
				<%@ include file="SnrForm.jsp"%>
			</c:if>
			<br> 약관
			<%@ include file="agreementBox.jsp"%>

			<input type="button" onclick="goMainPage()" value="취소"> <input
				type="button" onclick="checkValueAndSignUp()" value="가입"><br>

		</form>
	</div>



	<script>

	//회원가입 화면의 입력값들을 검사함.
	function checkValueAndSignUp(){
		
		var id = document.querySelector('#id').value;

		var idDuplication = document.querySelector('#idDuplication').value;
		var password = document.querySelector('#password').value;

		var passwordCheck = document.querySelector('#passwordCheck').value;
		var name = document.querySelector('#name').value;
		var birthday = document.querySelector('#birthday').value;

		
  	    var regPhone= /^01([0|1|6|7|8|9])?([0-9]{3,4})?([0-9]{4})$/;

		var phoneNum = document.querySelector('#phoneNum').value;
		var smsPass = document.querySelector('#smsPass').value;
		var postCode = document.querySelector('#postcode').value;
		var address = document.querySelector('#address').value;
		
/* 		var c_name = document.querySelector('#c_name').value;
		var birthYear = document.querySelector('#birthYear').value;
		var personality = document.querySelector('#personality').value; */
		
		
		var agree_code_01 =document.querySelector('#agree_code_01').checked;
		var agree_code_02 = document.querySelector('#agree_code_02').checked;
//		var agree_code_03 = document.querySelector('#agree_code_03');
		

		if(!id ){
			console.log("아이디 : " + id );
			
				alert("아이디를 입력하세요.");
				return false;
			}
		else if(idDuplication == "idUnCheck"){
				console.log("중복체크상태 : " + idDuplication );
				
				alert("아이디 중복체크를 해주세요.");
				return false;
			}
			
		else if(!password){
				console.log("비밀번호 : " + password );
				
				alert("비밀번호를 입력하세요.");
				return false;
			}
			
			// 비밀번호와 비밀번호 확인에 입력된 값이 동일한지 확인
			else if(password != passwordCheck || !passwordCheck){
				console.log("비밀번호 : " + password + "/ 비밀번호 확인 : " + passwordCheck );
				
				alert("비밀번호를 동일하게 입력하세요.");
				return false;
			}
			else if(!name){
				console.log("이름 : " + name );
				
				alert("이름을 입력하세요.");
				return false;
			}

			else if(!birthday ){
				console.log("생일언제냐 : " + birthday );
				
				alert("생년월일을 입력하세요.");
				return false;
			}
			else if(!phoneNum){
				console.log("휴대전화 번호 : " + phoneNum );
				
				alert("휴대전화 번호를 입력하세요.");
				return false;
			}
			else if (regPhone.test(phoneNum) != true) {
	     		 
	        	    alert("전화번호는 숫자만 입력 가능합니다.");
	  			return false;
	        	  } 
			else if( !smsPass || smsPass == 1){
				console.log("문자인증 : " + smsPass );
				
				alert("휴대전화를 인증하세요.");
				return false;
			}
			else if(!checkAuth){
				console.log("인증번호 대조 : " + checkAuth );
				
				alert("휴대전화를 인증하세요.");
				return false;
			}
			
			else if(!postCode){
				console.log("우편번호 : " + postCode );
				
				alert("우편번호를 입력하세요.")
				return false;
			}
			else if(!address){
				console.log("주소 : " + address );
				
				alert("주소를 입력하세요.")
				return false;
			}
////
			
			////
			else if(!agree_code_01 || !agree_code_02 ){
				console.log("1번약관 동의 : " + agree_code_01 + "/ 2번약관 동의 : " + agree_code_02 );
				
				alert("필수약관에 동의 후 가입가능합니다.")
				return false;
			}
			else {
// 		        document.userInfo.action = "/insertUserInfo";
				alert(postCode);
				alert("회원가입이 완료되었습니다. 로그인 페이지로 이동합니다.");
		        document.userInfo.submit();
		    }
	}
	// 취소 버튼 클릭시 첫화면으로 이동(메인페이지랑 생성하면 수정해서 연결하기)
	// function goMainPage() {
	// 	location.href = "메인페이지jsp";
	// }

	// 아이디 중복체크 화면open
	function openIdChk(){
		window.name = "parentForm";
		window.open("/IdCheckForm",
					"chkForm", "width=500, height=300, resizable = no, scrollbars = no");
	}

		// 아이디 입력창에 값 입력시 hidden에 idUnCheck를 세팅한다.
		// 이렇게 하는 이유는 중복체크 후 다시 아이디 창이 새로운 아이디를 입력했을 때
		// 다시 중복체크를 하도록 한다.
		function inputIdChk(){
			document.userInfo.idDuplication.value ="idUnCheck";
		}


		//취소버튼 누르면 메인페이지로 이동
		function goMainPage() {
			location.href = "/testMain";
		}

		
</script>



</body>
</html>