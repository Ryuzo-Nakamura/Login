<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="../header.html" %>

<h1>会員登録</h1>
<form action="../servlet/register" method="post">
	<p>氏名</p>
	<p><input type="text" name="name" placeholder="例：山田太郎" value="${name}" requierd></p>
	<p>性別</p>
	<p>
	<% if(request.getAttribute("gender") == null) {  %>
		<input type="radio" name="gender" value="男" checked>男性 <input type="radio" name="gender" value="女">女性
	<% } else { %>
		<% if(request.getAttribute("gender").toString().equals("男")) { %>
			<input type="radio" name="gender" value="男" checked>男性 <input type="radio" name="gender" value="女">女性
		<% } else{ %>
			<input type="radio" name="gender" value="男">男性 <input type="radio" name="gender" value="女" checked>女性
		<% } %>
	<% } %>
	</p>
	<p>生年月日</p>
	<p>
	<select name="year">
		<% if(request.getAttribute("year") == null) { %>
			<% for(int y = 2023 ; y >= 1900; y--){ %>
				<option value="<%=y %>"><%=y %></option>
			<% } %>
		<% } else {%>
			<% for(int y = 2023 ; y >= 1900; y--){ %>
				<% if(y == (Integer)request.getAttribute("year")) { %>
					<option value="<%=y %>" selected><%=y %></option>
				<% } else { %>
					<option value="<%=y %>"><%=y %></option>
				<% } %>
			<% } %>
		<% } %>
	</select>
	<select name="month">
		<% if(request.getAttribute("month") == null) { %>
			<% for(int m = 1 ; m <= 12; m++){ %>
				<option value="<%=m %>"><%=m %></option>
			<% } %>
		<% } else { %>
			<% for(int m = 1 ; m <= 12; m++){ %>
				<% if(m == (Integer)request.getAttribute("month")) { %>
					<option value="<%=m %>" selected><%=m %></option>
				<% } else { %>
					<option value="<%=m %>"><%=m %></option>
				<% } %>
			<% } %>
		<% } %>
	</select>
	<select name="day">
		<% if(request.getAttribute("day") == null) { %>
			<% for(int d = 1 ; d <= 31; d++){ %>
				<option value="<%=d %>"><%=d %></option>
			<% } %>
		<% } else { %>
			<% for(int d = 1 ; d <= 12; d++){ %>
				<% if(d == (Integer)request.getAttribute("day")) { %>
					<option value="<%=d %>" selected><%=d %></option>
				<% } else { %>
					<option value="<%=d %>"><%=d %></option>
				<% } %>
			<% } %>
		<% } %>
	</select>
	</p>
	<p>メールアドレス</p>
	<p><input type="email" name="email" value="${email}" required></p>
	<p>メールアドレス再入力</p>
	<p><input type="email" name="email2" value="${email2}" required></p>
	<p>電話番号</p>
	<p><input type="tel" name="tel" pattern="\d{2,4}-\d{2,4}-\d{3,4}" placeholder="ハイフン必須" value="${tel}" maxlength="13" required></p>
	<p>ユーザーID</p>
	<p><input type="text" name="id" placeholder="半角英数字8文字以上14文字以下" value="${id}" minlength="8" maxlength="14" required></p>
	<p>パスワード</p>
	<p><input type="password" name="password" placeholder="半角英数字8文字以上20文字以下" value="${password}" minlength="8" maxlength="20" required></p>
	<p>パスワード再入力</p>
	<p><input type="password" name="password2" placeholder="半角英数字8文字以上20文字以下" value="${password2}" minlength="8" maxlength="20" required></p>
	<p><input type="submit" value="登録"></p>
</form>
<p>${error}</p>

<%@ include file="../footer.html" %>