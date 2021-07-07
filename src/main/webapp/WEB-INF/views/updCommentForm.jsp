<%@ page isELIgnored="false" contentType = "text/html; charset=UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<html>
<head>
	<title>댓글 수정</title>
</head>
	<body>
		<form name="updCom" method="post" action="updComment">
			<table>
				<tr>
					<td>
						<input type="hidden" name="num" value="${num}" />
						<input type="text" name="comment" />
					</td>
				</tr>
				<tr>
					<td>
						<button type="submit"><font face="굴림" style="font-size:9pt;">수정</font></button>
					</td>
				</tr>
			</table>
		</form>
	</body>
</html>
	