<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="../header.html" %>

<%@ page import="jp.co.aforce.beans.User" %>

<% User user = (User)session.getAttribute("user"); %>

<h1>ようこそ、<%=user.getName() %>さん！</h1>

<form action="../servlet/logout" method="post">
	<input type="submit" value="ログアウト">
</form>

<%@ include file="../footer.html" %>