package kosta.mapda.repository.place;

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
	
}
