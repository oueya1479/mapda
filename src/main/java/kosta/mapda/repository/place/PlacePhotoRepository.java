package kosta.mapda.repository.place;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import kosta.mapda.domain.map.PlacePhoto;

public interface PlacePhotoRepository extends JpaRepository<PlacePhoto, Long> {
	@Query("select pp from PlacePhoto pp where pp.place.placeNo=?1")
	List<PlacePhoto> selectPlacePhotoByPlaceNo(Long placeNo);
}
