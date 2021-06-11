package kosta.mapda.service.place;

import java.util.List;

import kosta.mapda.domain.map.PlacePhotoReview;
import kosta.mapda.domain.map.PlacePhotoReviewPhoto;
import kosta.mapda.domain.map.PlaceReview;

public interface PlaceReviewService {
	
	/**
	 * 		등록하기
	 * */
	void insert(PlaceReview placeReview);
	
	/**
	 * 		삭제하기
	 * */
	void delete(Long id);
	
	/**
	 * 		플레이스 번호에 해당하는 댓글 가져오기
	 * */
	List<PlaceReview> selectAllPlaceReview(Long placeNo);
	
	/**
	 * 		플레이스 번호에 해당하는 포토리뷰 가져오기
	 * */
	List<PlacePhotoReview> selectAllPhotoReview(Long placeNo);
	
	/**
	 * 		포토리뷰에 해당하는 사진 가져오기
	 * */
	List<PlacePhotoReviewPhoto> selectAllPhotoReviewPhoto(Long pprNo);
	
	
}
