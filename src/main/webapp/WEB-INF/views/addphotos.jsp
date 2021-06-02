<%@ page isELIgnored="false" contentType = "text/html; charset=euc-kr" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">

	<form:form method="POST" modelAttribute="addPhotos" onsubmit="return validateUnits(this)"
		class="form-horizontal" enctype="multipart/form-data">		
		<form:errors path="*" cssClass="alert alert-danger" element="div" />
		
		<fieldset>
			<legend>������ �Խ�</legend>
			<span>${errorMsg}</span>
			
			<div class="form-group">
				<label class="control-label col-lg-2 col-lg-2" for="writer">
					�ۼ���
				</label>
				<div class="col-lg-10">
					<form:input id="writer" path="writer" type="text"
						class="form:input-large" />
					<form:errors path="writer" cssClass="text-danger" />
				</div>
			</div>			
			<div class="form-group">
				<label class="control-label col-lg-2 col-lg-2" for="title">
					����
				</label>
				<div class="col-lg-10">
					<form:input id="title" path="title" type="text"
						class="form:input-large" />
					<form:errors path="title" cssClass="text-danger" />
				</div>
			</div>			
			<div class="form-group">
				<label class="control-label col-lg-2" for="contents">
					����
				</label>
				<div class="col-lg-10">
					<form:textarea id="contents" path="contents" rows="5" />
				</div>
			</div>			
			<div>
				<label class="control-label col-lg-2" for="productManual">
					���� ����
				</label>
				<div class="col-lg-10">
					<form:input id="photoFile" path="photoFile" type="file"	class="form:input-large" />
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
	
				<<!-- input type="submit" value="Ȯ��"/>
			
			<input type="submit" value="������ȭ" onclick="javascript:alert('���� ���������� �ʽ��ϴ�.')">
			<input type="button" value="�����ø���" onclick="javascript:location.replace('./write.html')"/>
		
			<input type="text" name="commenti" size="50">
			<input type="button" name="comment_save" value="Ȯ��" onclick="comment_ok()">
		
			
		
			<select name="find">
				<option value="find_name">�̸����� �˻�</option>
				<option value="find_name">�������� �˻�</option>
			</select>
			
			<input type="text" name="fils_words" size="15"/>
			<input type="submit" value="Ȯ��"/>
		
			�ۼ��� : <input type="text" name="writer" size="50">
			���� : <input type="text" name="title" size="50">
			���� : <input type="text" name="contents" size="50"> -->
	
					