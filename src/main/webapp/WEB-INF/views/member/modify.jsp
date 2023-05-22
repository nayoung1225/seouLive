<%--
  Created by IntelliJ IDEA.
  User: nayoung
  Date: 2023/05/14
  Time: 4:15 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html lang="ko">
<head>
    <meta charset="utf-8">
    <title>비밀번호 변경</title>
</head>
<body>
<h1>비밀번호 변경</h1>
<form action="change-password" method="POST">
    <p><input type="password" name="current_password" placeholder="현재 비밀번호" required></p>
    <p><input type="password" name="new_password" placeholder="새 비밀번호" required></p>
    <p><input type="password" name="new_password_confirm" placeholder="새 비밀번호 확인" required></p>
    <p><input type="submit" value="비밀번호 변경"></p>
</form>
</body>
</html>
