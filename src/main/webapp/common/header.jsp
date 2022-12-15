
<%@page import="com.community.vo.Employees"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%
    
    
    
    
    String menu = request.getParameter("menu");
  
    Employees employees = (Employees) session.getAttribute("loginedEmployees");
    %>
<nav class="navbar navbar-expand-sm bg-dark navbar-dark">
	<div class="container">
		<ul class="navbar-nav me-auto">
			<li class="nav-item"><a class="nav-link <%="home".equals(menu) ? "active bg-danger" : "" %>" href="/web-community/home.jsp">홈</a></li>
			<li class="nav-item"><a class="nav-link <%="board".equals(menu) ? "active bg-danger" : "" %>" href="/web-community/board/home.jsp">게시판</a></li>

<%@page import="com.community.dto.EmployeeDto"%>
<%@page import="com.community.vo.Employee"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%
 	EmployeeDto emp = (EmployeeDto) session.getAttribute("loginedUser");
 %>
<nav class="navbar navbar-expand-sm bg-dark navbar-dark">
	<div class="container">
		<ul class="navbar-nav me-auto">
			<li class="nav-item"><a class="nav-link " href="/web-community/home.jsp">홈</a></li>
			<li class="nav-item"><a class="nav-link " href="/web-community/board/home.jsp">게시판</a></li>
			<li class="nav-item"><a class="nav-link " href="/web-community/employees/home.jsp">내 정보 보기</a></li>
<% 
	if (emp != null && "관리자".equals(emp.getType())) {
%>

			<li class="nav-item dropdown">
				<a class="nav-link dropdown-toggle"  href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false">
					관리자
          		</a>
				<ul class="dropdown-menu">
					<li><a class="dropdown-item" href="/web-community/admin/depts.jsp">부서/직위 관리</a></li>
					<li><a class="dropdown-item" href="/web-community/admin/employees.jsp">직원관리</a></li>
					<li><hr class="dropdown-divider"></li>
					<li><a class="dropdown-item" href="/web-community/admin/boards.jsp">게시판관리</a></li>
					<li><a class="dropdown-item" href="/web-community/admin/posts.jsp">게시글관리</a></li>
				</ul>

				<%
					if (employees == null) {
				%>
			</li> 
		</ul>
		
		<ul class="navbar-nav">
			<li class="nav-item"><a class="nav-link " href="/web-community/employees/registerform.jsp">회원가입</a></li>
			<li class="nav-item"><a class="nav-link " href="/web-community/employees/loginform.jsp">로그인</a></li>
			<li class="nav-item"><a class="nav-link" href="/web-community/employees/logout.jsp">로그아웃</a></li>
		</ul>
	<%
					} else {
	%>
		<span class="navbar-text"><strong class="text-white"><%=employees.getName() %></strong> 님 환영합니다.</span>
		<ul class="navbar-nav">
			<li class="nav-item"><a class="nav-link" href="/web-community/employees/logout.jsp">로그아웃</a></li>
		</ul>
<%	

			</li>
<%
	}
%>
		</ul>
<%
	if (emp == null) {
%>
		<ul class="navbar-nav">
			<li class="nav-item"><a class="nav-link " href="/web-community/employees/loginform.jsp">로그인</a></li>
		</ul>
<%
	} else {
%>
		<span class="navbar-text"><strong class="text-white"><%=emp.getName() %></strong> 님 환영합니다.</span>
		<ul class="navbar-nav">
			<li class="nav-item"><a class="nav-link" href="/web-community/employees/logout.jsp">로그아웃</a></li>
		</ul>
<%

	}
%>
	</div>
</nav>