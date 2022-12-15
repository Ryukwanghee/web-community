<%@page import="com.community.dao.EmployeesDao"%>
<%@page import="com.community.vo.Employees"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" 
pageEncoding="UTF-8" trimDirectiveWhitespaces="true" %>
<%
	// 폼 입력값 가져오기
	int no = Integer.parseInt(request.getParameter("no"));
	String password = request.getParameter("password");
	String email = request.getParameter("email");
	String name = request.getParameter("name");
	String phone = request.getParameter("phone");
	int deptNo = Integer.parseInt(request.getParameter("deptNo"));
	int positionNo = Integer.parseInt(request.getParameter("positionNo"));

	// 조회된 값 저장
	Employees employees = new Employees();
	employees.setEmail(email);
	employees.setName(employees.getName());
	employees.setPassword(password);
	employees.setPhone(phone);
	employees.setNo(no);
	employees.setDeptNo(deptNo);
	employees.setPositionNo(positionNo);

		// 조회된 사용자정보를 테이블에 저장
	EmployeesDao employeesDao = EmployeesDao.getInstance();

		
		
		
	employeesDao.insertEmployees(employees);

	
	response.sendRedirect("../home.jsp");





%>
