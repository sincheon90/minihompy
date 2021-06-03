<%@ page isELIgnored="false" contentType = "text/html; charset=UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<html>
<head>
<title>사진글 게시</title>
</head>
<body>
<form:form method="POST" modelAttribute="newPhoto" onsubmit="return validateUnits(this)"
		class="form-horizontal" enctype="multipart/form-data">		
		<form:errors path="*" cssClass="alert alert-danger" element="div" />
		
		<fieldset>
			<legend>사진글 게시</legend>
			<span>${errorMsg}</span>
			
			<div class="form-group">
				<label class="control-label col-lg-2 col-lg-2" for="writer">
					작성자
				</label>
				<div class="col-lg-10">
					<form:input id="writer" path="writer" type="text" class="form:input-large" />
					<%-- <form:errors path="writer" cssClass="text-danger" /> --%>
				</div>
			</div>			
			<div class="form-group">
				<label class="control-label col-lg-2 col-lg-2" for="title">
					제목
				</label>
				<div class="col-lg-10">
					<form:input id="title" path="title" type="text"
						class="form:input-large" />
					<form:errors path="title" cssClass="text-danger" />
				</div>
			</div>			
			<div class="form-group">
				<label class="control-label col-lg-2" for="contents">
					내용
				</label>
				<div class="col-lg-10">
					<form:textarea id="contents" path="contents" rows="5" />
				</div>
			</div>			
			<div>
				<label class="control-label col-lg-2" for="photoImage">
					사진 파일
				</label>
				<div class="col-lg-10">
					<form:input id="photoImage" path="photoImage" type="file"	class="form:input-large" />
				</div>
			</div>
			
			<div class="form-group">			
				<div class="col-lg-offset-2 col-lg-10">
					<input type="submit" id="btnAdd" class="btn btn-primary"
						value="Add" />
				</div>
			</div>
		</fieldset>
	</form:form>
	
	<script type="text/javascript">
		function validateUnits(form) {
			if (!document.getElementById("unitsInStock").value) {
				document.getElementById("unitsInStock").value = "0";
			}
		}
	</script>
	
				<!-- input type="submit" value="확인"/>
			
			<input type="submit" value="사진인화" onclick="javascript:alert('아직 서비스중이지 않습니다.')">
			<input type="button" value="사진올리기" onclick="javascript:location.replace('./write.html')"/>
		
			<input type="text" name="commenti" size="50">
			<input type="button" name="comment_save" value="확인" onclick="comment_ok()">
		
			
		
			<select name="find">
				<option value="find_name">이름으로 검색</option>
				<option value="find_name">내용으로 검색</option>
			</select>
			
			<input type="text" name="fils_words" size="15"/>
			<input type="submit" value="확인"/>
		
			작성자 : <input type="text" name="writer" size="50">
			제목 : <input type="text" name="title" size="50">
			내용 : <input type="text" name="contents" size="50"> -->
	
					
</body>
</html>
	