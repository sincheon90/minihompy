<%@ page isELIgnored="false" contentType = "text/html; charset=euc-kr" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<form name="photosContent">
	<center><img src="<c:url value='/img/bar.jpg'/>" width="420" height="6" border="0" alt=""></center>
	
		<table border="0" width="420" cellpadding="1" cellspacing="1" align="center">
			<tr>
				<td align="center"> 
					<font face="����" style="font-size:9pt;">
						���ĺ��� | �۰Ժ��� | �����̵�
					</font>
				</td>
				<td align="right">
					<input type="submit" value="������ȭ" onclick="javascript:alert('���� ���������� �ʽ��ϴ�.')">
					<input type="button" value="�����ø���" onclick="javascript:void(window.open('./photos/add', '���� �ø���','width=300, height=400'))"/>
					
				</td>
			</tr>
		</table>
		<center><img src="<c:url value='/img/bar.jpg'/>" width="420" height="6" border="0" alt=""></center>
		
		<!-- ����1 ----------------------------------------------------------------------------------------------- -->
	<c:if test = "${photo1 ne null}">
		<center><img src="<c:url value='/img/bar.jpg'/>" width="420" height="6" border="0" alt=""></center>
		<table border="0" bgcolor="#EBEBEB" width="420" cellpadding="1" cellspacing="1" align="center">
			<tr>
				<td>
					<a name="n8"></a>
					<font face="����" style="font-size:9pt;"><b>${photo1.title}</b></font>
				</td>
			</tr>
		</table>
		<table border="0" align="center" width="420" cellpadding="1" cellspacing="1">
			<tr>
				<td width="100">  
					<font face="����" style="font-size:9pt;">${photo1.writer}</font>
				</td>
				<td align="right">  
					<font face="����" style="font-size:9pt;">��ũ�� : ${photo1.scrap_count}</font>
				</td>
			</tr>
			<tr>
				<td colspan="2" align="center">  
					����
					<c:forEach items="${photoFile1}" var="photoFile1" varStatus="status">
					<c:if test = "${photoFile1.num ne '0'}">
					<a href="<c:url value='/img/${photoFile1.num}.jpg'/>" target="_blank"> <img src="<c:url value='/img/${photoFile1.num}.jpg'/>" width="400" height="300" border="0" alt=""></a>
					${photoFile1.num}
					</c:if>
					</c:forEach>
					
				</td>
			</tr>
			<tr>
				<td colspan="2">  
					<font face="����" style="font-size:9pt;">
					<!-- ���� �ٲٱ� -->
						${photo1.contents}
					<!-- �׿� ���� ��� �ұ�? -->
					</font>
					<!----------  -->
				</td>
			</tr>
			<tr>
				<td colspan="2" align="center">  
					<!-- ����ø ��, �� �� ���� �κ�--------------------------------------------------- -->
					<img src="<c:url value='/img/bar.jpg'/>" width="420" height="6" border="0" alt="">
					<table border="0" width="400" align="center" cellpadding="0" cellspacing="0">
						<tr>
							<td> 
								<font face="����" style="font-size:9pt;">
									��ó : ���μ����� �̴�Ȩ��<br/>
									�ۼ��� : ${photo1.writer}<br/>
									�ۼ��� : ${photo1.regdate}<br/>
									�������� : ����<br/>
								</font>
							</td>
						</tr>
						<tr>
							<td align="right"> 
								<img src="<c:url value='/img/bar.jpg'/>" width="420" height="6" border="0" alt=""><br/>
								<font face="����" style="font-size:9pt;">
									<a onclick="javascript:alert('���� �߽��ϴ�.')">����</a> | 
									<a onclick="javascript:alert('�̵� �߽��ϴ�.')">�̵�</a> | 
									<a onclick="javascript:alert('���� �߽��ϴ�.')">����</a></font>
							</td>
						</tr>
						<tr>
							<!-- ��� �Է� -->
							<td align="center"> 
								<br/>
								<input type="text" name="comment" size="50">
								<input type="submit" name="comment_save" value="Ȯ��" onclick="comment_ok()">
							</td>					
							<!-- ��� ��� -->				
							<!-- if ����� ������ -->
						</tr>
						<tr>
							<td>
								<font face="����" style="font-size:9pt;">
								<!-- ��׶��� �� : ȸ��,
									����Ʈ�� ���̿� ���� ��浵 ���� �þ �� �ְ� -->
								���<br/>
								<c:forEach items="${photoComment1}" var="photoComment1" varStatus="status">
								<c:if test = "${photoComment1.num ne null && photoComment1.num ne '0'}">
								<font color="#000099">${photoComment1.writer} :</font> ${photoComment1.comment} <br/>
								</c:if>
								</c:forEach>
								</font>
							</td>
						</tr>
					</table>
					
					<!-- ---------------------------------------------------------------------------- -->
				</td>
			</tr>
		</table>
	</c:if>
		<!-- ����1 �� ----------------------------------------------------------------------------------------------- -->

 		<!-- ����2 ----------------------------------------------------------------------------------------------- -->
 	<c:if test = "${photo2 ne null}">
		<center><img src="<c:url value='/img/bar.jpg'/>" width="420" height="6" border="0" alt=""></center>
		<table border="0" bgcolor="#EBEBEB" width="420" cellpadding="1" cellspacing="1" align="center">
			<tr>
				<td>
					<a name="n8"></a>
					<font face="����" style="font-size:9pt;"><b>${photo2.title}</b></font>
				</td>
			</tr>
		</table>
		<table border="0" align="center" width="420" cellpadding="1" cellspacing="1">
			<tr>
				<td width="100">  
					<font face="����" style="font-size:9pt;">${photo2.writer}</font>
				</td>
				<td align="right">  
					<font face="����" style="font-size:9pt;">��ũ�� : ${photo2.scrap_count}</font>
				</td>
			</tr>
			<tr>
				<td colspan="2" align="center">  
					����
					<c:forEach items="${photoFile2}" var="photoFile2" varStatus="status">
					<c:if test = "${photoFile2.num ne null && photoFile2.num ne '0'}">
					<a href="<c:url value='/img/${photoFile2.num}.jpg'/>" target="_blank"> <img src="<c:url value='/img/${photoFile2.num}.jpg'/>" width="400" height="300" border="0" alt=""></a>
					${photoFile2.num}
					</c:if>
					</c:forEach>
				</td>
			</tr>
			<tr>
				<td colspan="2">  
					<font face="����" style="font-size:9pt;">
					<!-- ���� �ٲٱ� -->
						${photo2.contents}
					<!-- �׿� ���� ��� �ұ�? -->
					</font>
					<!----------  -->
				</td>
			</tr>
			<tr>
				<td colspan="2" align="center">  
					<!-- ����ø ��, �� �� ���� �κ�--------------------------------------------------- -->
					<img src="<c:url value='/img/bar.jpg'/>" width="420" height="6" border="0" alt="">
					<table border="0" width="400" align="center" cellpadding="0" cellspacing="0">
						<tr>
							<td> 
								<font face="����" style="font-size:9pt;">
									��ó : ���μ����� �̴�Ȩ��<br/>
									�ۼ��� : ${photo2.writer}<br/>
									�ۼ��� : ${photo2.regdate}<br/>
									�������� : ����<br/>
								</font>
							</td>
						</tr>
						<tr>
							<td align="right"> 
								<img src="<c:url value='/img/bar.jpg'/>" width="420" height="6" border="0" alt=""><br/>
								<font face="����" style="font-size:9pt;">
									<a onclick="javascript:alert('���� �߽��ϴ�.')">����</a> | 
									<a onclick="javascript:alert('�̵� �߽��ϴ�.')">�̵�</a> | 
									<a onclick="javascript:alert('���� �߽��ϴ�.')">����</a></font>
							</td>
						</tr>
						<tr>
							<!-- ��� �Է� -->
							<td align="center"> 
								<br/>
								<input type="text" name="comment" size="50">
								<input type="submit" name="comment_save" value="Ȯ��" onclick="comment_ok()">
							</td>					
							<!-- ��� ��� -->				
							<!-- if ����� ������ -->
						</tr>
						<tr>
							<td>
								<font face="����" style="font-size:9pt;">
									<c:forEach items="${photoComment2}" var="photoComment2" varStatus="status">
										<c:if test = "${photoComment2.num ne null && photoComment2.num ne '0'}">
											<font color="#000099">${photoComment2.writer} :</font> ${photoComment2.comment} <br/>
										</c:if>
									</c:forEach>
								</font>
							</td>
						</tr>
					</table>
					
					<!-- ---------------------------------------------------------------------------- -->
				</td>
			</tr>
		</table>
	</c:if>
		<!-- ����2 �� ----------------------------------------------------------------------------------------------- --> 
		
		<!-- ����3 ----------------------------------------------------------------------------------------------- -->
	 <c:if test = "${photo3 ne null}">
		<center><img src="<c:url value='/img/bar.jpg'/>" width="420" height="6" border="0" alt=""></center>
		<table border="0" bgcolor="#EBEBEB" width="420" cellpadding="1" cellspacing="1" align="center">
			<tr>
				<td>
					<a name="n8"></a>
					<font face="����" style="font-size:9pt;"><b>${photo3.title}</b></font>
				</td>
			</tr>
		</table>
		<table border="0" align="center" width="420" cellpadding="1" cellspacing="1">
			<tr>
				<td width="100">  
					<font face="����" style="font-size:9pt;">${photo3.writer}</font>
				</td>
				<td align="right">  
					<font face="����" style="font-size:9pt;">��ũ�� : ${photo3.scrap_count}</font>
				</td>
			</tr>
			<tr>
				<td colspan="2" align="center">  
					����
					<!-- ���� �ٲٱ� -->
					<c:forEach items="${photoFile3}" var="photoFile3" varStatus="status">
					<c:if test = "${photoFile3.num ne null && photoFile3.num ne '0'}">
					<a href="<c:url value='/img/${photoFile3.num}.jpg'/>" target="_blank"> <img src="<c:url value='/img/${photoFile3.num}.jpg'/>" width="400" height="300" border="0" alt=""></a>
					${photoFile3.num}
					</c:if>
					</c:forEach>
					<!-- --------- -->
				</td>
			</tr>
			<tr>
				<td colspan="2">  
					<font face="����" style="font-size:9pt;">
					<!-- ���� �ٲٱ� -->
						${photo3.contents}
					<!-- �׿� ���� ��� �ұ�? -->
					</font>
					<!----------  -->
				</td>
			</tr>
			<tr>
				<td colspan="2" align="center">  
					<!-- ����ø ��, �� �� ���� �κ�--------------------------------------------------- -->
					<img src="<c:url value='/img/bar.jpg'/>" width="420" height="6" border="0" alt="">
					<table border="0" width="400" align="center" cellpadding="0" cellspacing="0">
						<tr>
							<td> 
								<font face="����" style="font-size:9pt;">
									��ó : ���μ����� �̴�Ȩ��<br/>
									�ۼ��� : ${photo3.writer}<br/>
									�ۼ��� : ${photo3.regdate}<br/>
									�������� : ����<br/>
								</font>
							</td>
						</tr>
						<tr>
							<td align="right"> 
								<img src="<c:url value='/img/bar.jpg'/>" width="420" height="6" border="0" alt=""><br/>
								<font face="����" style="font-size:9pt;">
									<a onclick="javascript:alert('���� �߽��ϴ�.')">����</a> | 
									<a onclick="javascript:alert('�̵� �߽��ϴ�.')">�̵�</a> | 
									<a onclick="javascript:alert('���� �߽��ϴ�.')">����</a></font>
							</td>
						</tr>
						<tr>
							<!-- ��� �Է� -->
							<td align="center"> 
								<br/>
								<input type="text" name="comment" size="50">
								<input type="submit" name="comment_save" value="Ȯ��" onclick="comment_ok()">
							</td>
						</tr>
						<tr>
							<td>
								<font face="����" style="font-size:9pt;">
									<c:forEach items="${photoComment3}" var="photoComment3" varStatus="status">
										<c:if test = "${photoComment3.num ne null && photoComment3.num ne '0'}">
											<font color="#000099">${photoComment3.writer} :</font> ${photoComment3.comment} <br/>
										</c:if>
									</c:forEach>
								</font>
							</td>
						</tr>
					</table>
					
					<!-- ---------------------------------------------------------------------------- -->
				</td>
			</tr>
		</table>
	</c:if>
		<!-- ����3 �� ----------------------------------------------------------------------------------------------- --> 
		
		

	<!-- ���� �Ʒ��κ� �� �˻� �κ� ------------------------------------------------------------ -->
	<table align="center" border="0" cellpadding="1" cellspacing="1">
	
		<!-- ����¡ -------------------------------------------------->
		<tr>
			<td style="display: block; text-align: center;">
			<font face="����" style="font-size:9pt;">
			
				<c:if test="${paging.startPage != 1 }">
					<a href="/hompy/photos?page=${paging.startPage - 1 }">&lt;</a>
				</c:if>
				
				<c:forEach begin="${paging.startPage }" end="${paging.endPage }" var="p">
					<c:choose>
						<c:when test="${p == paging.nowPage }">
							<b>${p }</b>
						</c:when>
						<c:when test="${p != paging.nowPage }">
							<a href="/hompy/photos?page=${p }">${p }</a>
						</c:when>
					</c:choose>
				</c:forEach>
				
				<c:if test="${paging.endPage != paging.lastPage}">
					<a href="/hompy/photos?page=${paging.endPage+1 }">&gt;</a>
				</c:if>
			</font>	
			</td>
		</tr>
		
		<!-- ����¡ �� -------------------------------------------------->		
		
		<tr>
			<td align="center">  
				<select name="find">
					<option value="find_name">�̸����� �˻�</option>
					<option value="find_name">�������� �˻�</option>
				</select>
				<input type="text" name="fils_words" size="15"/>
				<input type="submit" value="Ȯ��"/>
			</td>
		</tr>
	</table>
	<!--  ���� �Ʒ��κ� �� �˻� �κ� �� ---------- ------------------------------------------------------------ -->
	<br/>


</form>