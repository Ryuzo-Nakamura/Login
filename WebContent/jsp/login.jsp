<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="../header.html" %>

<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<h1>ログイン画面</h1>
<form action="../servlet/login" method="post">
	<p>ユーザーID <input type="text" name="id" value="<c:if test="${loginid != null}">${loginid}</c:if>" required></p>
	<p>パスワード <input type="password" name="password" required>
	<input type="submit" value="ログイン">
	</p>
</form>
<c:if test="${loginerror != null}"><p>${loginerror}</p></c:if>
<p><a href="../jsp/register.jsp">会員登録が済んでない方はこちら</a></p>

<%@ include file="../footer.html" %>