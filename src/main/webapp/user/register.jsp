<%@page import="com.community.vo.User"%>
<%@page import="com.community.dao.UserDao"%>
<%@page import="org.apache.commons.codec.digest.DigestUtils"%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	// 회원가입 폼에서 register.jsp를 실행요청할 때 제출한 폼 입력값을 요청객체에서 조회한다.
	String id = request.getParameter("id");
	String password = request.getParameter("password");
	String name = request.getParameter("name");
	String email = request.getParameter("email");
	
	// 비밀번호 암호화하기
	String salt = id + email;
	String secretPassword = DigestUtils.sha256Hex(salt+password);
	
	// User객체를 생성해서 조회된 값을 저장한다.
	User user = new User();
	user.setId(id);
	user.setPassword(secretPassword);
	user.setName(name);
	user.setEmail(email);

	// UserDao 객체를 생성한다.
	UserDao userDao = new UserDao();
	
	// 아이디로 사용자정보를 조회한다. 사용자정보가 null이 아니면 form.jsp를 재요청하는 URL을 응답으로 보낸다.
	User savedUser = userDao.getUserById(id);
	if (savedUser != null) {
		response.sendRedirect("form.jsp?error=invalid");
		return;
	}
	
	// 이메일로 사용자정보를 조회한다. 사용자정보가 null이 아니면 form.jsp를 재요청하는 URL을 응답으로 보낸다.
	savedUser = userDao.getUserByEmail(email);
	if (savedUser != null) {
		response.sendRedirect("form.jsp?error=invalid");
		return;
	}	
	
	// insertUser(user)를 실행해서 사용자정보를 데이터베이스에 저장시킨다.
	userDao.insertUser(user);
	
	// 재요청 URL을 응답으로 보낸다.
	response.sendRedirect("completed.jsp");
	
%>