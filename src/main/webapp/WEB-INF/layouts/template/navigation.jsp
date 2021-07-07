<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<style>
	.btn{width="83"; height="29"; cursor:pointer;}
</style>
<script language="javascript">
	function menu_click_pagereload(page){
		location.replace(page);
	}
</script>

<img src="<c:url value='/img/m1.gif'/>" class ="btn" alt="홈 메뉴" onclick="menu_click_pagereload('./')"><br/><br/>
<img src="<c:url value='/img/m2.gif'/>" class ="btn" alt="프로필 메뉴" onclick="menu_click_pagereload('./m2.html')"><br/><br/>
<img src="<c:url value='/img/m3.gif'/>" class ="btn" alt="사진첩 메뉴" onclick="menu_click_pagereload('./photos')"><br/><br/>
<img src="<c:url value='/img/m4.gif'/>" class ="btn" alt="방명록 메뉴" onclick="menu_click_pagereload('./m4.html')"><br/><br/>