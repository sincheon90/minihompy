<%@ page contentType="text/html; charset=utf-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">

<form name="photos">

	<center><img src="<c:url value='/img/bar.jpg'/>" width="420" height="6" border="0" alt=""></center>
	
	<c:forEach items="${photo}" var="photo">
		<table border="0" width="420" cellpadding="1" cellspacing="1" align="center">
			<tr>
				<td align="center"> 
					<font face="굴림" style="font-size:9pt;">
						펼쳐보기 | 작게보기 | 슬라이드
					</font>
				</td>
				<td align="right">
					<input type="submit" value="사진인화" onclick="javascript:alert('아직 서비스중이지 않습니다.')">
					<input type="button" value="사진올리기" onclick="javascript:location.replace('./write.html')"/>
					
				</td>
			</tr>
		</table>
		<center><img src="<c:url value='/img/bar.jpg'/>" width="420" height="6" border="0" alt=""></center>
	
	
		<!-- 사진 ----------------------------------------------------------------------------------------------- -->
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
					<!-- 사진 바꾸기 -->
					<a href="<c:url value='/img/${photo.photos_files_id}'/>" target="_blank"> <img src="<c:url value='/img/${photos.photos_files_id}'/>" width="400" height="300" border="0" alt=""></a>
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
									출처 : 네이버<br/>
									작성자 : 장인수<br/>
									작성일 : 2008.02.28 3:45<br/>
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
		<br/><br/><br/>
	</c:forEach>
	

	<!-- 방명록 아랫부분 글 검색 부분 ------------------------------------------------------------ -->
	<table align="center" border="0" cellpadding="1" cellspacing="1">
		<tr height="30">
			<td align="center" >
				<font face="굴림" style="font-size:9pt;">
					<a href="./r_pic_page2.html"><img src="../images/left_arr.gif" width="12" height="13" border="0" alt="이전 페이지로"></a>
					page <a href="./r_pic_page2.html">2</a> <a href="./r_pic_page1.html">1</a>
					<a href="./r_pic_page1.html"><img src="../images/right_arr.gif" width="12" height="13" border="0" alt="다음 페이지로"></a>
					</font>	
			</td>
		</tr>
		<tr>
			<td align="center">  
				<select name="find">
					<option value="find_name">이름으로 검색</option>
					<option value="find_name">내용으로 검색</option>
				</select>
				<input type="text" name="fils_words" size="15"/>
				<input type="submit" value="확인"/>
			</td>
		</tr>
	</table>
		<!-- ---------- ------------------------------------------------------------ -->
	<br/>




</form>

