

<%@page import="com.community.vo.Employees"%>
<%@page import="com.community.dao.EmployeesDao"%>
<%@page import="org.apache.commons.codec.digest.DigestUtils"%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	// 로그인 폼에서 login.jsp를 실행요청할 때 제출한 폼 입력값을 요청객체에서 조회한다.
	int no = Integer.parseInt(request.getParameter("no"));
	String password = request.getParameter("password");
	
	// 사용자 정보 조회를 위해서 UserDao객체를 생성한다.
	EmployeesDao employeesDao = EmployeesDao.getInstance();
	Employees employees = employeesDao.getUserByNo(no);
	
	// 아이디로 사용자 정보를 조회해서 사용자정보가 null이면 가입된 아이디가 아니므로 로그인화면을 재요청하는 URL을 응답으로 보낸다.
	Employees savedEmployees = employeesDao.getUserByNo(no);
	
	if (savedEmployees == null) {
		response.sendRedirect("loginform.jsp?iderror=fail");
		return;
	}
	
	//String salt = savedUser.getNo() + savedUser.getEmail();
	// String secretPassword = DigestUtils.sha256Hex(salt+password);
	
	// 조회된 사용자정보의 비밀번호와 입력한 비밀번호가 일치하지 않으면 로그인화면을 재요청하는 URL을 응답으로 보낸다.
	if (!savedEmployees.getPassword().equals(password)) {
		response.sendRedirect("loginform.jsp?error=fai!l");
		return;
	}
	
	
	// 사용자 인증이 완료된 경우, 세션객체에 사용자정보를 저장한다.
	// HttpSession의 setAttribute(String name, Object value) 메소드를 사용해서 세션객체에 사용자 정보를 저장한다.
	session.setAttribute("loginedEmployees", savedEmployees);
	
	// 재요청 URL을 응답으로 보낸다.

<%@page import="com.community.dto.EmployeeDto"%>
<%@page import="com.community.util.StringUtils"%>
<%@page import="com.community.vo.Employee"%>
<%@page import="com.community.dao.EmployeeDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String email = request.getParameter("email");
	String password = request.getParameter("password");
	
	EmployeeDao employeeDao = new EmployeeDao();
	
	EmployeeDto savedUser = employeeDao.getEmployeeByEmail(email);
	
	if (savedUser == null) {
		response.sendRedirect("loginform.jsp?error=fail");
		return;
	}
	
	if (!savedUser.getPassword().equals(password)){
		response.sendRedirect("loginform.jsp?error=fail");
		return;
	}
	
	session.setAttribute("loginedUser", savedUser);

	response.sendRedirect("../home.jsp");
%>