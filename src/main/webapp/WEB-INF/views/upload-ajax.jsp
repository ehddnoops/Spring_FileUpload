<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<style type="text/css">
.file-drop{
	width : 100%;
	height : 100px;
	border : 1px solid grey;
}
</style>
</head>
<body>
	<h1>Ajax를 이용한 파일 업로드</h1>
	<div class="file-drop"></div>
	<div class="upload-list"></div>
	
	<script type="text/javascript">
	$(document).ready(function(){
		// 파일을 끌어다 놓을떄 (drag & drop)
		// 브라우저가 파일을 자동으로 열어주는 기능을 막음
		$('.file-drop').on('dragenter dragover', function(event){
			//drop 이벤트의 기본 동작을 막음
			event.preventDefault();
		}); // end dragenter dragover()		
		
		$('.file-drop').on('drop', function(event){
			//drop 이벤트의 기본 동작을 막음
			event.preventDefault();
			console.log("drop 테스트");
			
			// Ajax를 이용해서 서버로 파일을 업로드
			// multipart/form-data 타입으로 파일을 업로드하는 객체
			var formData = new FormData();
			
			var files = event.originalEvent.dataTransfer.files;
			var i = 0;
			for(i = 0; i < files.length; i++){
				console.log(files[i]);
				//서버로 보낼 form-data 작성
				formData.append("files", files[i]);
			}
			
			$.ajax({
				type : 'post',
				url : '/ex05/upload-ajax',
				data : formData,
				processData : false,
				contentType : false,
				/*
					form의 enctype 속성을
					기본값인 "application/x-www-form-urlencoded"을 사ㅣ용하지 않고
					FormData()에 있는 "multipart/form-data"를 사용하기 위해
					contentType : false로 지정
					processData : false - 파라미터 방식의 데이터 전송을 사용하지 않음
				*/
				success : function(data) {
					console.log(data);
					var str = '';
					/* 아래 코드를 작성하여 이미지가 upload-ajax.jsp에
					   나오도록 구현하세요 */
//http://localhost:8080/ex05/display?fileName=/2021/04/23/s_d88944ec-eb8e-4d6d-ba77-77eb17f6f862_test.PNG
					str += "<img src='display?fileName=" + data + "'width='500' height='100'>";
					
					$('.upload-list').html(str);
				}
			});// end ajax()
			
		}); // end drop()
	});// end document()
		
	</script>
</body>
</html>











