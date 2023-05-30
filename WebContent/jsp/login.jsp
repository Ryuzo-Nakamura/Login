<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="../header.html" %>

<h1>ログイン画面</h1>
<form action="../servlet/login" method="post">
	<p>ユーザーID <input type="text" name="id" value="${id}" required></p>
	<p>パスワード <input type="password" name="password" required>
	<input type="submit" value="ログイン">
	</p>
</form>
<p>${error}</p>
<p><a href="../jsp/register.jsp">会員登録が済んでない方はこちら</a></p>

<%@ include file="../footer.html" %>