<%@page import="com.community.dao.TempDao"%>
<%@page import="com.community.vo.Temp"%>
<%@page import="com.community.dto.TempDto"%>
<%@page import="com.community.dao.ReviewDao"%>
<%@page import="com.community.vo.Review"%>
<%@page import="com.community.util.StringUtils"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%
	int tempNo = StringUtils.stringToInt(request.getParameter("tempNo"));
	int empNo = StringUtils.stringToInt(request.getParameter("empNo"));
	String content = request.getParameter("content");
	
	Review review = new Review();
	review.setEmpNo(empNo);
	review.setTempNo(tempNo);
	review.setContent(content);
	
	ReviewDao reviewDao = ReviewDao.getInstance();
	reviewDao.insertReview(review);
	
	TempDao tempDao = TempDao.getInstance();
	
	TempDto tempDto = tempDao.getTempByNo(tempNo);
	tempDto.setPostReviewCount(tempDto.getPostReviewCount() + 1);
	
	Temp temp = new Temp(tempNo, empNo);
	temp.setPostReadCount(tempDto.getPostReadCount());
	temp.setTitle(tempDto.getTitle());
	temp.setContent(tempDto.getContent());
	temp.setImportant(tempDto.getImportant());
	temp.setBoardNo(tempDto.getBoardNo());
	temp.setPostReviewCount(tempDto.getPostReviewCount());
	temp.setRecommendCount(tempDto.getRecommendCount());
	tempDao.updateTemp(temp);
	
	response.sendRedirect("detail.jsp?tempNo=" + tempNo);


%>