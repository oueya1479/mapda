package kosta.mapda.repository.place;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;

import kosta.mapda.domain.map.Place;

public interface PlaceRepository extends JpaRepository<Place, Long> {
	
	//List<PlaceReview> selectByPlaceNo(Long placeNo);
	
	/**
	 * 마이페이지 - 나의 게시 플레이스 조회 (마이포인트 메뉴에서 사용목적)
	 * */
	List<Place> findBymember_memNo(Long memNo);
}
