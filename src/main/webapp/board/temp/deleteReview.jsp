<%@page import="com.community.dto.TempDto"%>
<%@page import="com.community.dao.TempDao"%>
<%@page import="com.community.vo.Temp"%>
<%@page import="com.community.vo.Review"%>
<%@page import="com.community.dao.ReviewDao"%>
<%@page import="com.community.dto.ReviewDto"%>
<%@page import="com.community.util.StringUtils"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@ include file= "../../common/logincheck.jsp" %>
<%
	int no = StringUtils.stringToInt(request.getParameter("reviewNo"));
	int tempNo = StringUtils.stringToInt(request.getParameter("tempNo"));
	
	ReviewDao reviewDao = ReviewDao.getInstance();
	Review review = reviewDao.getReviewByReviewNo(no);
	
	review.setDeleted("Y");
	
	reviewDao.updateReview(review);
	
	TempDao tempDao = TempDao.getInstance();
	TempDto tempDto = tempDao.getTempByNo(tempNo);
	
	Temp temp = new Temp(tempNo, loginUser.getNo());
	temp.setPostReadCount(tempDto.getPostReadCount());
	temp.setTitle(tempDto.getTitle());
	temp.setContent(tempDto.getContent());
	temp.setImportant(tempDto.getImportant());
	temp.setBoardNo(tempDto.getBoardNo());
	temp.setPostReviewCount(tempDto.getPostReviewCount() - 1);
	temp.setRecommendCount(tempDto.getRecommendCount());
	tempDao.updateTemp(temp);
	
	response.sendRedirect("detail.jsp?tempNo=" + tempNo);

%>