<%@ page contentType="text/html; charset=utf-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<form name="photosContent">	
		<!-- 사진 ----------------------------------------------------------------------------------------------- -->
		<%-- 역순으로 가장 최신 글
		 http://localhost:8080/hompy/photos?id=${photo.id}
		 http://localhost:8080/hompy/photos?id=${photo.id}-1
		 http://localhost:8080/hompy/photos?id=${photo.id}-2 --%>
		<center><img src="<c:url value='/img/bar.jpg'/>" width="420" height="6" border="0" alt=""></center>
		<table border="0" bgcolor="#EBEBEB" width="420" cellpadding="1" cellspacing="1" align="center">
			<tr>
				<td>
					<a name="n8"></a>
					<font face="굴림" style="font-size:9pt;"><b>${photo.title}</b></font>
				</td>
			</tr>
		</table>
		<table border="0" align="center" width="420" cellpadding="1" cellspacing="1">
			<tr>
				<td width="100">  
					<font face="굴림" style="font-size:9pt;">${photo.writer}</font>
				</td>
				<td align="right">  
					<font face="굴림" style="font-size:9pt;">스크랩 : ${photo.scrap_count}</font>
				</td>
			</tr>
			<tr>
				<td colspan="2" align="center">  
					사진
					<!-- 사진 바꾸기 -->
					<c:forEach items="${photoFile}" var="photoFile" varStatus="status">
					<a href="<c:url value='/img/${photoFile.num}.jpg'/>" target="_blank"> <img src="<c:url value='/img/${photoFile.num}.jpg'/>" width="400" height="300" border="0" alt=""></a>
					</c:forEach>
					<!-- --------- -->
				</td>
			</tr>
			<tr>
				<td colspan="2">  
					<font face="굴림" style="font-size:9pt;">
					<!-- 내용 바꾸기 -->
						${photo.contents}
					<!-- 네용 엔터 어떻게 할까? -->
					</font>
					<!----------  -->
				</td>
			</tr>
			<tr>
				<td colspan="2" align="center">  
					<!-- 사진첩 글, 글 밑 정보 부분--------------------------------------------------- -->
					<img src="<c:url value='/img/bar.jpg'/>" width="420" height="6" border="0" alt="">
					<table border="0" width="400" align="center" cellpadding="0" cellspacing="0">
						<tr>
							<td> 
								<font face="굴림" style="font-size:9pt;">
									출처 : 장인수님의 미니홈피<br/>
									작성자 : ${photo.writer}<br/>
									작성일 : ${photo.regdate}<br/>
									공개설정 : 공개<br/>
								</font>
							</td>
						</tr>
						<tr>
							<td align="right"> 
								<img src="<c:url value='/img/bar.jpg'/>" width="420" height="6" border="0" alt=""><br/>
								<font face="굴림" style="font-size:9pt;">
									<a onclick="javascript:alert('수정 했습니다.')">수정</a> | 
									<a onclick="javascript:alert('이동 했습니다.')">이동</a> | 
									<a onclick="javascript:alert('삭제 했습니다.')">삭제</a></font>
							</td>
						</tr>
						<tr>
							<td align="center"> 
								<br/>
								<input type="text" name="commenti" size="50"></textarea>
								<input type="button" name="comment_save" value="확인" onclick="comment_ok()">
							</td>
						</tr>
					</table>
					
					<!-- ---------------------------------------------------------------------------- -->
				</td>
			</tr>
		</table>
		<!-- 사진 끝 ----------------------------------------------------------------------------------------------- -->


</form>