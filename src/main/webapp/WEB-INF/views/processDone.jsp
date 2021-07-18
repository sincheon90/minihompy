<%@ page isELIgnored="false" contentType = "text/html; charset=UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<html>
<head>
<title>완료</title>
</head>
<body onload = "javascript:window.close(); opener.document.location.reload();">
		
		//팝업창에서 부모창으로 값 넘기기
		

		1-1. 일반적인 방법
		
		window.opener.document.getElementById("parentId").value = "부모창으로 전달할 값";
		
		 
		
		1-2. 일반적인 방법
		
		window.opener.폼네임.parentInputName.value = value;
		
		[출처] 【jQuery】팝업창 opener|작성자 너와나
		https://blog.naver.com/1004youandme/90190830348
		
</body>
</html>
	