<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Error</title>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/CSS/common.css">
</head>
<body>
	<div>
		<h1>エラー発生</h1>
			<p>前のページに戻ります。以下のボタンをクリックしてください。↓↓</p>
			<p>Go back to the previous page. Please click the button below. ↓↓</p>
			
		<a href="javascript:history.back()" class="btn">前のページに戻る</a>
        
        <a href="${pageContext.request.contextPath}/" class="btn">トップページへ戻る</a>
	</div>
</body>
</html>