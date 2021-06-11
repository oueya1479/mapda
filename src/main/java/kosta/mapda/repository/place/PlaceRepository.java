package kosta.mapda.repository.place;

import org.springframework.data.jpa.repository.JpaRepository;

import kosta.mapda.domain.map.Place;

public interface PlaceRepository extends JpaRepository<Place, Long> {
	
	//List<PlaceReview> selectByPlaceNo(Long placeNo);
}
