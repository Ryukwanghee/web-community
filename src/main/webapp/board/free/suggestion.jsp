<%@page import="java.util.List"%>
<%@page import="com.community.vo.Employee"%>
<%@page import="com.community.vo.Suggestion"%>
<%@page import="com.community.dao.SuggestionDao"%>
<%@page import="com.community.vo.Free"%>
<%@page import="com.community.dao.FreeDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%
	//직원정보 가져오기.
	Employee employee = (Employee)session.getAttribute("loginedEmployee");
	if(employee == null){
		response.sendRedirect("../../loginform.jsp?error=deny");
		return;
	}

	//게시글정보가져오기.
	int postNo =Integer.parseInt(request.getParameter("no"));
	FreeDao freeDao = FreeDao.getInstance();
	Free free = (Free) freeDao.getFreeByNo(postNo);
	
	
	//Suggestion객체에 있나 확인하기
	SuggestionDao suggestionDao = SuggestionDao.getInstance();
	List<Suggestion> suggestionList = suggestionDao.getSuggestionByPostNo(postNo);
	
	boolean isEmpNoExist = false;
	for(Suggestion suggestion : suggestionList){
		if(suggestion.getEmpNo() == employee.getNo()){
			isEmpNoExist = true;
			return;
		}
	}
	
	//해당하는 직원번호가 없으면 추천수를 늘리고, suggestion객체를 업데이트시킨다.
	if(isEmpNoExist == false){
		Suggestion suggestion = new Suggestion();
		suggestion.setEmpNo(employee.getNo());
		suggestion.setPostNo(postNo);
		
		free.setSuggestionCount(free.getSuggestionCount() + 1);
		//추천누를때 조회수도 같이 늘어나니까 하나 줄여주자
		free.setReadCount(free.getReadCount() - 1);
		
		//업데이트하기
		freeDao.updateFree(free);
		suggestionDao.insertSuggestion(suggestion);
	}
	 
	
	response.sendRedirect("detail.jsp?no="+postNo);
%>