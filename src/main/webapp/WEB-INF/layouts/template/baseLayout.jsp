<%@ page contentType="text/html; charset=utf-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<htmL>
 <head>
  <title> 미니홈피 </title>
  <meta name="Generator" content="EditPlus">
  <meta name="Author" content="Jang, Insu">
 <meta name="Keywords" content="">
 <meta name="Description" content="">
 
<style type="text/css">
body
{scrollbar-face-color: #FFFFFF;
 scrollbar-highlight-color: #DBDBDB;
 scrollbar-3dlight-color: #FFFFFF;
 scrollbar-shadow-color: #9C92FF;
 scrollbar-darkshadow-color: #FFFFFF;
 scrollbar-track-color: #FFFFFF;
 scrollbar-arrow-color: #9C92FF}
</style>

 </head>


<form name="main">

 <body bgcolor="#F3F3F3" topmargin="0" leftmargin="0">

 	<script language="javascript">
	<!--
		//---------------------------------------------------------------
		// 주소의 파라미터를 분석해서 스킨을 배경 그림을 바꾸도록함
		//---------------------------------------------------------------
		if (location.search)
		{
			// aa.html?name=value
			param_name = location.search.split("?")[1]
			param_value = param_name.split("=")[1]  // value
 			param_name = param_name.split("=")[0]   // name
			//document.write(param_name+'<br/>')
			//document.write(param_value)
		}		
		//---------------------------------------------------------------

		function menu_click_pagereload(htmlfile)
		{
			location.replace('./' + htmlfile + location.search)
		}
	//-->
	</script>
	
	<!-- 미니 홈페이지 외각 테이블 -->
	<table border="0" align="left" valign="top" width="850" height="550" bgcolor="#003366" cellspacing="0" cellpadding="0">
		<tr>
			<script language="javascript">
				<!--
					//---------------------------------------------------------------
					// 주소의 파라메터를 분석해서 스킨을 배경 그림을 바꾸도록함
					//---------------------------------------------------------------
					if (location.search)
					{
						// aa.html?name=value
						var param_name = location.search.split("?")[1]
						var param_value = param_name.split("=")[1]  // value
						var param_name = param_name.split("=")[0]   // name
						//document.write(param_name+'<br/>')
						//document.write(param_value)
					}		
					//---------------------------------------------------------------
					// 기본 배경
					
					
					// 파라메터 분석하여 그림 변경
					if (param_name == "skin")
					{
						if (param_value == "2") 
							document.write('<td background="./images/bg_kim2.jpg">')	
						else if (param_value == "3") 
							document.write('<td background="./images/bg_kim3.jpg">')
						else if (param_value == "4") 
							document.write('<td background="./images/bg_kim4.jpg">')
						else 
							document.write('<td background="./images/bg_kim1.jpg">')
					}
					else
					{
						document.write('<td background="./images/bg_kim1.jpg">')
					}
				//-->
				</script>


				<!-- 안쪽 테이블, 왼쪽 오른쪽 -->
				
				<!-- 시간 출력 ---------------------------------- -->
				<script language="javascript">
				<!--
					var now = new Date()
					document.write('<span style="font-size:9pt;font-weight:bold">&nbsp;&nbsp;&nbsp; 지금은.. ')
					document.write(now.getYear() + '년 ' + (now.getMonth()+1) + '월 ' +  now.getDate()+'일' + ' ' + now.getHours() + ':' + now.getMinutes())
					document.write('</span>')
				//-->
				</script>
				
				&nbsp;&nbsp;&nbsp;
				<!---배경 바꾸기 버튼, 페이지 리로드함-------------------------------------------- -->
				<input type="button" name="bt_skin1" value="스킨1" onclick="javascript:location.replace('./m1.html?skin=1')">
				<input type="button" name="bt_skin2" value="스킨2" onclick="javascript:location.replace('./m1.html?skin=2')">
				<input type="button" name="bt_skin3" value="스킨3" onclick="javascript:location.replace('./m1.html?skin=3')">
				<input type="button" name="bt_skin4" value="스킨4" onclick="javascript:location.replace('./m1.html?skin=4')">
				<!----------------------------------------------- -->
			
				<table border="0" align="left" width="800" height="510" background="<c:url value='/img/bg_big.gif'/>">
					<tr>
						<td colspan="2" align="center">
							<br>
							<font face="굴림"><span style="font-size:8pt;">today 9999  total 9999</span></font>
						</td>
						<td  height="40">
							<br>
							<font face="굴림"><span style="font-size:13pt;font-weight:bold"><center><font color="#4B9687">님의 미니 홈피</font></center></span></font>
						</td>
						<td></td>
					</tr>
					<tr>
						<td width="10"> </td>

						<td width="178" height="450" background="<c:url value='/img/bg_left_rect.jpg'/>">

							<!-- 왼쪽 내용 부분 ----------------------------------------------------------- -->
							<center>
								<!-- <iframe frameborder="0" width="160" height="440" src="./left_intro.html" /> -->
								<tiles:insertAttribute name="leftIntro" />
							</center>
							<!-- ---------------------------------------------------------------------------- -->

						</td>
						<td width="480" height="450" background="./images/bg_center_rect.jpg">
							<tiles:insertAttribute name="content" />
						</td>
						<!-- 오른쪽 메뉴 부분 ----------------------------------------------------------- -->
						<td>
							<tiles:insertAttribute name="navigation" />
							<br/><br/><br/><br/><br/><br/><br/><br/>
						</td>
						<!-- 오른쪽 메뉴 부분 끝----------------------------------------------------------- -->
					</tr>

					<tr>
						<td ></td>
					</tr>
				</table>
				<!-- ------------------------ -->
			</td>
		</tr>
	</table>
	<!-- ------------------------ -->



 </body>

 </form>

</html>