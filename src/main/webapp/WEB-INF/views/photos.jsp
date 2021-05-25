<%@ page contentType="text/html; charset=utf-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">

<form name="photos">
	<center><img src="<c:url value='/img/bar.jpg'/>" width="420" height="6" border="0" alt=""></center>
	
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
		
		<img src="<c:url value='/img/m3.gif'/>" width="83" height="29" border="0" alt="사진첩 메뉴" onclick="menu_click_pagereload('./photosContent')"><br/><br/>
		<!-- 사진 끝 ----------------------------------------------------------------------------------------------- -->
		<br/><br/><br/>

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

