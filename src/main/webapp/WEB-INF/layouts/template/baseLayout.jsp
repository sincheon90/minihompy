<%@ page contentType="text/html; charset=utf-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<htmL>
<head>
<title>미니홈피</title>
<meta name="Generator" content="EditPlus">
<meta name="Author" content="Jang, Insu">
<meta name="Keywords" content="">
<meta name="Description" content="">

<style type="text/css">
body {
	scrollbar-face-color: #FFFFFF;
	scrollbar-highlight-color: #DBDBDB;
	scrollbar-3dlight-color: #FFFFFF;
	scrollbar-shadow-color: #9C92FF;
	scrollbar-darkshadow-color: #FFFFFF;
	scrollbar-track-color: #FFFFFF;
	scrollbar-arrow-color: #9C92FF
}
</style>

</head>


<body bgcolor="#F3F3F3" topmargin="0" leftmargin="0">


	<!-- 미니 홈페이지 외각 테이블 -->
	<table border="0" align="left" valign="top" width="850" height="550"
		bgcolor="#003366" cellspacing="0" cellpadding="0">
		<tr>
			<td>&nbsp;&nbsp;&nbsp; 
				
				<table border="0" align="left" width="800" height="510"
					background="<c:url value='/img/bg_big.gif'/>">
					<tr>
						<td colspan="2" align="center"><br> <font face="굴림"><span
								style="font-size: 8pt;">today 9999 total 9999</span></font></td>
						<td height="40" align="center"><br> <font face="굴림"><span
								style="font-size: 13pt; font-weight: bold"> <font
									color="#4B9687">오정권님의 미니 홈피</font></span></font></td>
						<td></td>
					</tr>
					<tr>
						<td width="10"></td>

						<td width="178" height="450"
							background="<c:url value='/img/bg_left_rect.jpg'/>">
							<!-- 왼쪽 날개 부분 ----------------------------------------------------------- -->
							<center>
								<!-- <iframe frameborder="0" width="160" height="440" src="./left_intro.html" /> -->
								<tiles:insertAttribute name="leftIntro" />
							</center> <!-- 왼쪽 날개 부분 끝---------------------------------------------------------------------------- -->
						</td>

						<!-- 내용 ----------------------------------------------------------------------------->
						<td>
							<div style="overflow: auto; width: 480px; height: 450px;">
								<table border=0 width="480" height="450" background="">
									<tr>
										<td><tiles:insertAttribute name="content" /></td>
									</tr>
								</table>
							</div>
						</td>
						<!-- 내용 끝----------------------------------------------------------------------------->

						<!-- 오른쪽 메뉴 부분 ----------------------------------------------------------- -->
						<td><tiles:insertAttribute name="navigation" /> <br />
						<br />
						<br />
						<br />
						<br />
						<br />
						<br />
						<br /></td>
						<!-- 오른쪽 메뉴 부분 끝----------------------------------------------------------- -->
					</tr>

					<tr>
						<td></td>
					</tr>
				</table> <!-- ------------------------ -->
			</td>
		</tr>
	</table>
	<!-- ------------------------ -->



</body>


</html>