<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!-- login_form -->

<h3 align="center">로그인</h3><br><br>

<form action="user-login.do" method="post">
	아이디 <input type="text" name="id" required="required"><br><br>
	패스워드 <input type="password"  name="password" required="required"><br><br>
	<input type="submit" value="로그인"><br><br>
</form>
	<a href="user-registerNormalMemberForm.do">회원가입</a> &nbsp; &nbsp;
	<a href="#">비밀번호를 잊으셨나요?</a><br>
