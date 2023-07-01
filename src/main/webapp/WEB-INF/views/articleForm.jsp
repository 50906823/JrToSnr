<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="path" value="${pageContext.request.contextPath}"></c:set>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>문의하기</title>
<%-- <script type="text/javascript" src="${path}/ckeditor/config.js" ></script>
<script type="text/javascript" src="${path}/ckeditor/ckeditor.js" ></script> --%>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.7.0/jquery.min.js" integrity="sha512-3gJwYpMe3QewGELv8k/BX9vcqhryRdzRMxVfq6ngyWXwo03GFEzjsUm8Q7RZcHPHksttq7/GFoxjCVUjkjvPdw==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
<script src="https://cdnjs.cloudflare.com/ajax/libs/sweetalert2/11.7.12/sweetalert2.all.js" integrity="sha512-7TfWz/1TEVLE2pG8KLC/suq4qgXocI+/sNKfX0yifGXBbSKPoA9wcQ2GDublV7SSCu90vnW1q7+TUXOYaCIshA==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
<script src="https://cdn.ckeditor.com/ckeditor5/38.1.0/classic/ckeditor.js"></script>
<style>
	#container {
		width: 100%;
		display: flex;
		justify-content: center;
	}
	.ck.ck-editor {
    	max-width: 100%;
	}
	.ck-editor__editable {
	    min-height: 300px;
	}
	.btnGroup {
		margin-top: 10px;
		text-align: center;
	}
	#id {
		border: 0 solid black;
	}
	
</style>
</head>
<body>
	<h1 style="text-align: center">문의하기</h1>
	<div id="container">
		<form action="" method="post" id="writeForm">
			<label for="id">작성자</label><br>
			<input type="text" id="id" name="id" value="${sessionScope.userId}" readonly="readonly"><br><br>
			
			<label for="title">제목</label><br>
			<input type="text" id="title" name="title" style="width: 100%" placeholder="제목을 입력하세요"><br><br>
			
			<label for="content">내용</label><br>
			<textarea id="content" name="content"></textarea>
			<div class="btnGroup">
				<input type="button" class="btn btn-secondary" value="취소" onclick="location.href='/boardList'">
<!-- 				<input type="submit" class="btn btn-success" value="완료"> -->
				<input type="button" id="complete" class="btn btn-success" value="완료">
			</div>
		</form>
	</div>
	<script>
		ClassicEditor
		    .create( document.querySelector( '#content' ))
		    .catch( error => {
		        console.error( error );
		    } );
	</script>
	<script>
		$('#complete').click(function() {
			let title = $('#title').val();
	        let content = ' ';
	        if (title.trim() === '') {
	        /* if (title.trim() === '' || content.trim() === '') { */
	        	Swal.fire({
	   			 title: '제목을 작성해주세요.',
	   			    text: '제목이 비어있습니다..',
	   			    icon: 'warning',
	   			    confirmButtonText: '확인',
	   			    });
	        } else {
	        	Swal.fire({
		   			 title: '문의글 작성완료',
		   			    text: '게시글 작성이 완료 되었습니다..',
		   			    icon: 'warning',
		   			    confirmButtonText: '확인',
		        	 }).then(result => {
					    	if(result.isConfirmed) {
					    		$('#writeForm').submit();
					    	}
					    });
	        }
		});
	</script>
</body>
</html>