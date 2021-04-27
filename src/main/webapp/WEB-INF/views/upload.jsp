<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>File Upload</title>
</head>
<body>
	<h1>파일 업로드 폼</h1>
	<h2>단일 파일 업로드</h2>
	<form action="upload" method="post" enctype="multipart/form-data">
		<input type="file" name="file"><br>
		<input type="submit" value="업로드">
	</form>
	<h2>다중 파일 업로드</h2>
	<form action="upload2" method="post" enctype="multipart/form-data">
		<input type="file" name="files" multiple="multiple"><br>
		<input type="submit" value="업로드">
	</form>
	
</body>
</html>