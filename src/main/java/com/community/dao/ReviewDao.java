package com.community.dao;

import java.util.List;

import com.community.dto.ReviewDto;
import com.community.util.SqlMapper;
import com.community.vo.Review;

public class ReviewDao {

	private static ReviewDao instance = new ReviewDao();
	private ReviewDao() {}
	public static ReviewDao getInstance() {
		return instance;
	}
	
	public void insertReview(Review review) {
		SqlMapper.insert("reviews.insertReview", review);
	}
	
	@SuppressWarnings("unchecked")
	public List<ReviewDto> getReviewsByTempNo(int tempNo){
		return (List<ReviewDto>) SqlMapper.selectList("reviews.getReviewsByTempNo", tempNo);
	}
	
	public void updateReview(Review review) {
		SqlMapper.update("reviews.updateReview", review);
	}
}
