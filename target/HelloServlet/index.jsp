<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<html>
<body>
<h2>Xin chào!</h2>
<p>
	<% String user = (String) session.getAttribute("user"); %>
	<% if (user != null) { %>
		Bạn đang đăng nhập là: <strong><%= user %></strong>.
		<a href="<%= request.getContextPath() %>/profile">Vào trang cá nhân</a>
	<% } else { %>
		Bạn chưa đăng nhập. <a href="<%= request.getContextPath() %>/login">Đăng nhập</a>
	<% } %>
    
</p>
<hr/>
<p>
	Demo theo 2 cách:
	<ul>
		<li>Session: <a href="<%= request.getContextPath() %>/login">/login</a>, <a href="<%= request.getContextPath() %>/profile">/profile</a></li>
		<li>Cookie: <a href="<%= request.getContextPath() %>/login-cookie">/login-cookie</a>, <a href="<%= request.getContextPath() %>/profile-cookie">/profile-cookie</a></li>
	</ul>
</p>
</body>
</html>
