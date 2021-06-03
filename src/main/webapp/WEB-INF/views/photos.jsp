<%@ page isELIgnored="false" contentType = "text/html; charset=euc-kr" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<form name="photosContent">
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
					<input type="button" value="사진올리기" onclick="javascript:void(window.open('./photos/add', '사진 올리기','width=300, height=400'))"/>
					
				</td>
			</tr>
		</table>
		<center><img src="<c:url value='/img/bar.jpg'/>" width="420" height="6" border="0" alt=""></center>
		
		<!-- 사진1 ----------------------------------------------------------------------------------------------- -->
	<c:if test = "${photo1 ne null}">
		<center><img src="<c:url value='/img/bar.jpg'/>" width="420" height="6" border="0" alt=""></center>
		<table border="0" bgcolor="#EBEBEB" width="420" cellpadding="1" cellspacing="1" align="center">
			<tr>
				<td>
					<a name="n8"></a>
					<font face="굴림" style="font-size:9pt;"><b>${photo1.title}</b></font>
				</td>
			</tr>
		</table>
		<table border="0" align="center" width="420" cellpadding="1" cellspacing="1">
			<tr>
				<td width="100">  
					<font face="굴림" style="font-size:9pt;">${photo1.writer}</font>
				</td>
				<td align="right">  
					<font face="굴림" style="font-size:9pt;">스크랩 : ${photo1.scrap_count}</font>
				</td>
			</tr>
			<tr>
				<td colspan="2" align="center">  
					사진
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
					<font face="굴림" style="font-size:9pt;">
					<!-- 내용 바꾸기 -->
						${photo1.contents}
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
									작성자 : ${photo1.writer}<br/>
									작성일 : ${photo1.regdate}<br/>
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
							<!-- 댓글 입력 -->
							<td align="center"> 
								<br/>
								<input type="text" name="comment" size="50">
								<input type="submit" name="comment_save" value="확인" onclick="comment_ok()">
							</td>					
							<!-- 댓글 목록 -->				
							<!-- if 댓글이 있으면 -->
						</tr>
						<tr>
							<td>
								<font face="굴림" style="font-size:9pt;">
								<!-- 백그라운드 색 : 회색,
									리스트의 길이에 따라 배경도 같이 늘어날 수 있게 -->
								댓글<br/>
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
		<!-- 사진1 끝 ----------------------------------------------------------------------------------------------- -->

 		<!-- 사진2 ----------------------------------------------------------------------------------------------- -->
 	<c:if test = "${photo2 ne null}">
		<center><img src="<c:url value='/img/bar.jpg'/>" width="420" height="6" border="0" alt=""></center>
		<table border="0" bgcolor="#EBEBEB" width="420" cellpadding="1" cellspacing="1" align="center">
			<tr>
				<td>
					<a name="n8"></a>
					<font face="굴림" style="font-size:9pt;"><b>${photo2.title}</b></font>
				</td>
			</tr>
		</table>
		<table border="0" align="center" width="420" cellpadding="1" cellspacing="1">
			<tr>
				<td width="100">  
					<font face="굴림" style="font-size:9pt;">${photo2.writer}</font>
				</td>
				<td align="right">  
					<font face="굴림" style="font-size:9pt;">스크랩 : ${photo2.scrap_count}</font>
				</td>
			</tr>
			<tr>
				<td colspan="2" align="center">  
					사진
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
					<font face="굴림" style="font-size:9pt;">
					<!-- 내용 바꾸기 -->
						${photo2.contents}
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
									작성자 : ${photo2.writer}<br/>
									작성일 : ${photo2.regdate}<br/>
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
							<!-- 댓글 입력 -->
							<td align="center"> 
								<br/>
								<input type="text" name="comment" size="50">
								<input type="submit" name="comment_save" value="확인" onclick="comment_ok()">
							</td>					
							<!-- 댓글 목록 -->				
							<!-- if 댓글이 있으면 -->
						</tr>
						<tr>
							<td>
								<font face="굴림" style="font-size:9pt;">
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
		<!-- 사진2 끝 ----------------------------------------------------------------------------------------------- --> 
		
		<!-- 사진3 ----------------------------------------------------------------------------------------------- -->
	 <c:if test = "${photo3 ne null}">
		<center><img src="<c:url value='/img/bar.jpg'/>" width="420" height="6" border="0" alt=""></center>
		<table border="0" bgcolor="#EBEBEB" width="420" cellpadding="1" cellspacing="1" align="center">
			<tr>
				<td>
					<a name="n8"></a>
					<font face="굴림" style="font-size:9pt;"><b>${photo3.title}</b></font>
				</td>
			</tr>
		</table>
		<table border="0" align="center" width="420" cellpadding="1" cellspacing="1">
			<tr>
				<td width="100">  
					<font face="굴림" style="font-size:9pt;">${photo3.writer}</font>
				</td>
				<td align="right">  
					<font face="굴림" style="font-size:9pt;">스크랩 : ${photo3.scrap_count}</font>
				</td>
			</tr>
			<tr>
				<td colspan="2" align="center">  
					사진
					<!-- 사진 바꾸기 -->
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
					<font face="굴림" style="font-size:9pt;">
					<!-- 내용 바꾸기 -->
						${photo3.contents}
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
									작성자 : ${photo3.writer}<br/>
									작성일 : ${photo3.regdate}<br/>
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
							<!-- 댓글 입력 -->
							<td align="center"> 
								<br/>
								<input type="text" name="comment" size="50">
								<input type="submit" name="comment_save" value="확인" onclick="comment_ok()">
							</td>
						</tr>
						<tr>
							<td>
								<font face="굴림" style="font-size:9pt;">
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
		<!-- 사진3 끝 ----------------------------------------------------------------------------------------------- --> 
		
		

	<!-- 방명록 아랫부분 글 검색 부분 ------------------------------------------------------------ -->
	<table align="center" border="0" cellpadding="1" cellspacing="1">
	
		<!-- 페이징 -------------------------------------------------->
		<tr>
			<td style="display: block; text-align: center;">
			<font face="굴림" style="font-size:9pt;">
			
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
		
		<!-- 페이징 끝 -------------------------------------------------->		
		
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
	<!--  방명록 아랫부분 글 검색 부분 끝 ---------- ------------------------------------------------------------ -->
	<br/>


</form>