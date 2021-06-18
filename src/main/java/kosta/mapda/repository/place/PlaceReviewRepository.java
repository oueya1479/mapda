package kosta.mapda.repository.place;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import kosta.mapda.domain.map.PlaceReview;
import kosta.mapda.domain.map.Theme;

public interface PlaceReviewRepository extends JpaRepository<PlaceReview, Long> {
	@Query("select pr from PlaceReview pr where pr.place.placeNo=?1 order by pr.prRegdate")
	List<PlaceReview> selectByPlaceNo(Long placeNo);
	
	@Query("select pr from PlaceReview pr where pr.place.placeNo=?1 and pr.member.memId=?2")
	List<PlaceReview> selectByPlaceNoMemId(Long placeNo, String memId);
	
	/**
	 * 최근 댓글 리스트_김성희
	 * */
	@Query("select pr from PlaceReview pr where pr.member.memNo=?1 order by pr.prRegdate desc")
	List<PlaceReview> selectByMemNoReviewOrderRegDesc(Long memNo);
}