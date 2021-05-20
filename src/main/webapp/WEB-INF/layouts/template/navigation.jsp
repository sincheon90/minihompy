<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>

<img src="<c:url value='/img/m1.gif'/>" width="83" height="29" border="0" alt="홈 메뉴" onclick="menu_click_pagereload('./m1.html')"><br/><br/>
<img src="<c:url value='/img/m2.gif'/>" width="83" height="29" border="0" alt="프로필 메뉴" onclick="menu_click_pagereload('./m2.html')"><br/><br/>
<img src="<c:url value='/img/m3.gif'/>" width="83" height="29" border="0" alt="사진첩 메뉴" onclick="menu_click_pagereload('./m3.html')"><br/><br/>
<img src="<c:url value='/img/m4.gif'/>" width="83" height="29" border="0" alt="방명록 메뉴" onclick="menu_click_pagereload('./m4.html')"><br/><br/>