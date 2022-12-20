<%@page import="com.community.dao.EmployeeDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file= "../common/logincheck.jsp" %>
<%--
	요청 방식
		POST
	요청 URL
		http://localhost/community/employee/password-change.jsp
	요청 파라미터
		prevPassword
		password
	요청 처리 내용
		로그인된 직원정보에서 직원번호를 가져온다.
		요청파라미터 값을 조회한다.
		직원정보를 조회해서 비밀번호를 비교하고, 직원의 비밀번호를 변경한다.
 --%>
<%
	// 요청 파라미터값을 조회한다.
	String prevPassword = request.getParameter("prevPassword");
	String password = request.getParameter("password");
	
	EmployeeDao employeeDao = EmployeeDao.getInstance();
	// 직원정보를 조회한다.
	Employee employee = employeeDao.getEmployeeByNo(loginUser.getNo());
	if (!employee.getPassword().equals(prevPassword)) {
		response.sendRedirect("passwordForm.jsp?error=fail");
		return;
	}
	// 새 비밀번호를 Employee객체에 저장하고, 테이블에 반영시킨다.
	employee.setPassword(password);
	employeeDao.updateEmployee(employee);
	
	response.sendRedirect("password-change-completed.jsp");
%>