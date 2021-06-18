package kosta.mapda.service.place;

import java.util.List;

import kosta.mapda.domain.map.PlacePhotoReview;
import kosta.mapda.domain.map.PlacePhotoReviewPhoto;
import kosta.mapda.domain.map.PlaceReview;

public interface PlaceReviewService {
	
	/**
	 * 		reply 등록하기
	 * */
	void insert(PlaceReview placeReview);
	
	/**
	 * 		PhotoReview 등록하기
	 * */
	void prInsert(PlacePhotoReview placePhotoReview, List<PlacePhotoReviewPhoto> rrprList);
	
	/**
	 * 		reply 삭제하기
	 * */
	void delete(Long id);
	
	/**
	 * 		PhotoReview 삭제하기
	 * */
	void prDelete(Long id);
	
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
	
	/**
	 * 		포토리뷰 별점 가져오기
	 * */
	List<PlacePhotoReview> selectStarScore(Long placeNo);
	
	/**
	 * 		플레이스 번호에 해당하는 포토리뷰포토 가져오기
	 * */
//	List<PlacePhotoReviewPhoto> selectAllPhotoReviewPhotoPlaceNo(Long placeNo);
	
	/**
	 * 		플레이스 번호와 멤버 아이디에 해당하는 댓글 가져오기
	 * */
	List<PlaceReview> selectByPlaceNoMemId(Long placeNo, String memId);
	
	/**
	 * 		플레이스 번호와 멤버 아이디에 해당하는 포토리뷰 가져오기
	 * */
	List<PlacePhotoReview> selectByMemIdPlaceNo(Long placeNo, String memId);
	
	/**
	 * 		플레이스 리뷰 수정하기
	 * */
	PlaceReview prUpdate(PlaceReview placeReview);
	
	/**
	 * 		플레이스 포토리뷰 수정하기
	 * */
	PlacePhotoReview prrUpdate(PlacePhotoReview placePhotoReview);
	
	/**
	 * 		플레이스 포토리뷰 포토 사진 등록하기
	 * */
	void insertPprPhoto(List<PlacePhotoReviewPhoto> pprpList);
}
