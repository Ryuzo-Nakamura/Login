<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="../header.html" %>

<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<h1>会員登録</h1>
<form action="../servlet/register" method="post">
	<p>氏名</p>
	<p><input type="text" name="name" placeholder="例：山田太郎" value="<c:if test="${name != null}">${name}</c:if>" requierd></p>
	<p>性別</p>
	<p><c:choose>
		<c:when test="${gender.equals(\"女\")}">
			<input type="radio" name="gender" value="男">男性 <input type="radio" name="gender" value="女" checked>女性
		</c:when>
		<c:otherwise>
			<input type="radio" name="gender" value="男" checked>男性 <input type="radio" name="gender" value="女">女性
		</c:otherwise>
	</c:choose></p>
	<%--
	<% if(request.getAttribute("gender") == null) {  %>
		<input type="radio" name="gender" value="男" checked>男性 <input type="radio" name="gender" value="女">女性
	<% } else { %>
		<% if(request.getAttribute("gender").toString().equals("男")) { %>
			<input type="radio" name="gender" value="男" checked>男性 <input type="radio" name="gender" value="女">女性
		<% } else{ %>
			<input type="radio" name="gender" value="男">男性 <input type="radio" name="gender" value="女" checked>女性
		<% } %>
	<% } %>
	--%>
	<p>生年月日</p>
	<p>
	<select name="year">
		<% for(int y = 2023 ; y >= 1900; y--){ %>
			<c:set var="y" value="<%=y %>"></c:set>
			<c:choose>
				<c:when test="${y == year}"><option value="<%=y %>" selected><%=y %></option></c:when>
				<c:otherwise><option value="<%=y %>"><%=y %></option></c:otherwise>
			</c:choose>
		<% } %>
	</select>
	<select name="month">
		<% for(int m = 1 ; m <= 12; m++){ %>
			<c:set var="m" value="<%=m %>"></c:set>
			<c:choose>
				<c:when test="${m == month}"><option value="<%=m %>" selected><%=m %></option></c:when>
				<c:otherwise><option value="<%=m %>"><%=m %></option></c:otherwise>
			</c:choose>
		<% } %>
	</select>
	<select name="day">
		<% for(int d = 1 ; d <= 31; d++){ %>
			<c:set var="d" value="<%=d %>"></c:set>
			<c:choose>
				<c:when test="${d == day}"><option value="<%=d %>" selected><%=d %></option></c:when>
				<c:otherwise><option value="<%=d %>"><%=d %></option></c:otherwise>
			</c:choose>
		<% } %>
	</select>
	</p>
	<p>メールアドレス</p>
	<p><input type="email" name="email" value="<c:if test="${email != null}">${email}</c:if>" required></p>
	<p>メールアドレス再入力</p>
	<p><input type="email" name="email2" value="<c:if test="${email2 != null}">${email2}</c:if>" required></p>
	<p>電話番号</p>
	<p><input type="tel" name="tel" pattern="\d{2,4}-\d{2,4}-\d{3,4}" placeholder="ハイフン必須" value="<c:if test="${tel != null}">${tel}</c:if>" maxlength="13" required></p>
	<p>ユーザーID</p>
	<p><input type="text" name="id" placeholder="半角英数字8文字以上14文字以下" value="<c:if test="${registerid != null}">${registerid}</c:if>" minlength="8" maxlength="14" required></p>
	<p>パスワード</p>
	<p><input type="password" name="password" placeholder="半角英数字8文字以上20文字以下" value="<c:if test="${password != null}">${password}</c:if>" minlength="8" maxlength="20" required></p>
	<p>パスワード再入力</p>
	<p><input type="password" name="password2" placeholder="半角英数字8文字以上20文字以下" value="<c:if test="${password2 != null}">${password2}</c:if>" minlength="8" maxlength="20" required></p>
	<c:if test="${registererror != null}"><p>${registererror}</p></c:if>
	<p><input type="submit" value="登録"></p>
</form>


<%@ include file="../footer.html" %>