package kosta.mapda.repository.place;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import kosta.mapda.domain.map.PlacePhotoReviewPhoto;

public interface PlacePhotoReviewPhotoRepository extends JpaRepository<PlacePhotoReviewPhoto, Long> {
	@Query("select pprp from PlacePhotoReviewPhoto pprp where pprp.ppr.pprNo=?1")
	List<PlacePhotoReviewPhoto> selectBypprNo(Long pprNo);
}
