package kosta.mapda.repository.place;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import kosta.mapda.domain.map.PlacePhotoReviewPhoto;

public interface PlacePhotoReviewPhotoRepository extends JpaRepository<PlacePhotoReviewPhoto, Long> {
	@Query("select pprp from PlacePhotoReviewPhoto pprp where pprp.ppr.pprNo=?1")
	List<PlacePhotoReviewPhoto> selectBypprNo(Long pprNo);
//	
//	@Query("SELECT pprp.ppr.place.placeNo, pprp.ppr.member.memNo, pprp.ppr.pprContent, pprp.ppr.pprRegdate, pprp.ppr.pprStar, pprp.pprpPath "
//			+ "FROM PlacePhotoReviewPhoto pprp "
//			+ "JOIN pprp.ppr.pprNo ppppNo "
//			+ "WHERE pprp.ppr.place.placeNo=?1")
//	List<PlacePhotoReviewPhoto> selectByPlaceNo(Long placeNo);
	
	/*
	select ppr.place_no, ppr.mem_no, ppr.ppr_content, ppr.ppr_regdate, ppr.ppr_star, pprp.pprp_path
	from place_photo_review_photo pprp
	join place_photo_review ppr
	on pprp.ppr_no=ppr.ppr_no
	where ppr.place_no=1;
	*/
}

