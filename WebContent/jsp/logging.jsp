<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="../header.html" %>

<%@ page import="jp.co.aforce.beans.User" %>

<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<h1>ようこそ、<c:if test="${user.getName() != null}">${user.getName()}</c:if>さん！</h1>

<form action="../servlet/logout" method="post">
	<input type="submit" value="ログアウト">
</form>

<%@ include file="../footer.html" %>