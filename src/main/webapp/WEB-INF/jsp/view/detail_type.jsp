<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<c:set var="root" value="${pageContext.request.contextPath}" />

<!-- Font Type -->
<c:if test="${content_list.font_type == 1}">
<style type="text/css">
@font-face {
	font-family: 'Cafe24Ohsquare';
	src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2001@1.1/Cafe24Ohsquare.woff') format('woff');
	font-weight: normal;
	font-style: normal;
}

#detail .contents {
	font-family: 'Cafe24Ohsquare';
}

#detail input {
	font-family: 'Cafe24Ohsquare';
}

#detail button {
	font-family: 'Cafe24Ohsquare';
}

#detail a {
	font-family: 'Cafe24Ohsquare';
}

</style>
</c:if>

<c:if test="${content_list.font_type == 2}">
<style type="text/css">
@font-face {
     font-family: 'S-CoreDream-3Light';
     src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_six@1.2/S-CoreDream-3Light.woff') format('woff');
     font-weight: normal;
     font-style: normal;
}

#detail {
	font-family: 'S-CoreDream-3Light';
}

#detail .contents {
	font-family: 'S-CoreDream-3Light';
}

#detail input {
	font-family: 'S-CoreDream-3Light';
}

#detail button {
	font-family: 'S-CoreDream-3Light';
}

#detail a {
	font-family: 'S-CoreDream-3Light';
}
</style>
</c:if>

<c:if test="${content_list.font_type == 3}">
<style type="text/css">
@font-face {
    font-family: 'Vitro_core';
    src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_20-10-21@1.0/Vitro_core.woff') format('woff');
    font-weight: normal;
    font-style: normal;
}

#detail {
	font-family: 'Vitro_core';
}

#detail .contents {
	font-family: 'Vitro_core';
}

#detail input {
	font-family: 'Vitro_core';
}

#detail button {
	font-family: 'Vitro_core';
}

#detail a {
	font-family: 'Vitro_core';
}
</style>
</c:if>

<c:if test="${content_list.font_type == 4}">
<style type="text/css">

@import url(//fonts.googleapis.com/earlyaccess/nanumgothic.css);

.nanumgothic * {
 font-family: 'Nanum Gothic', sans-serif;
}

#detail {
	font-family: 'Nanum Gothic';
}

#detail .contents {
	font-family: 'Nanum Gothic';
}

#detail input {
	font-family: 'Nanum Gothic';
}

#detail button {
	font-family: 'Nanum Gothic';
}

#detail a {
	font-family: 'Nanum Gothic';
}
</style>
</c:if>

<c:if test="${content_list.font_type == 5}">
<style type="text/css">

@import url(//fonts.googleapis.com/earlyaccess/nanumgothic.css);

@import url(//fonts.googleapis.com/earlyaccess/nanummyeongjo.css);

.nanummyeongjo * {
 font-family: 'Nanum Myeongjo', serif;
}

#detail {
	font-family: 'Nanum Myeongjo';
}

#detail .contents {
	font-family: 'Nanum Myeongjo';
}

#detail input {
	font-family: 'Nanum Myeongjo';
}

#detail button {
	font-family: 'Nanum Myeongjo';
}

#detail a {
	font-family: 'Nanum Myeongjo';
}
</style>
</c:if>

<c:if test="${content_list.font_type == 6}">
<style type="text/css">

@font-face {
    font-family: 'SF_HambakSnow';
    src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2106@1.1/SF_HambakSnow.woff') format('woff');
    font-weight: normal;
    font-style: normal;
}

#detail {
	font-family: 'SF_HambakSnow';
}

#detail .contents {
	font-family: 'SF_HambakSnow';
}

#detail input {
	font-family: 'SF_HambakSnow';
}

#detail button {
	font-family: 'SF_HambakSnow';
}

#detail a {
	font-family: 'SF_HambakSnow';
}
</style>
</c:if>