package kosta.mapda.repository.place;

import java.time.LocalDateTime;
import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import kosta.mapda.domain.map.PlacePhotoReview;

public interface PlacePhotoReviewRepository extends JpaRepository<PlacePhotoReview, Long>{
	@Query("select ppr from PlacePhotoReview ppr where ppr.place.placeNo=?1 order by ppr.pprRegdate")
	List<PlacePhotoReview> selectByPlaceNo(Long placeNo);
	
	@Query("select ppr from PlacePhotoReview ppr where ppr.place.placeNo=?1")
	List<PlacePhotoReview> selectStarScore(Long placeNo);
	
	@Query("select ppr from PlacePhotoReview ppr where ppr.place.placeNo=?1 and ppr.member.memId=?2")
	List<PlacePhotoReview> selectByPlaceNoMemId(Long placeNo, String memId);
	
	/**
	 * 마이페이지 - 나의 게시 포토리뷰 조회(마이포인트 메뉴에서 사용목적)
	 * */
	List<PlacePhotoReview> findBymember_memNo(Long memNo);

	@Query("select count(p) from PlacePhotoReview p where pprRegdate between ?1 and ?2")
	int getPhotoDateBetween(LocalDateTime startDatetime, LocalDateTime endDatetime);
}
