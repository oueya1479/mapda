package kosta.mapda.repository.place;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import kosta.mapda.domain.map.Place;

public interface PlaceRepository extends JpaRepository<Place, Long> {
	
	//List<PlaceReview> selectByPlaceNo(Long placeNo);
	
	/**
	 * 마이페이지 - 나의 게시 플레이스 조회 (마이포인트 메뉴에서 사용목적)
	 * */
	List<Place> findBymember_memNo(Long memNo);
	
	/**
	 * 		히든플레이스 찾기 ( 안쓸거같고)
	 * */
	@Query("select p from Place p join p.theme t where p.placeHidden=1 and p.theme.mapNo=?1")
	List<Place> selectByHiddenMapNo(Long mapNo);
	
	/**
	 * 		해당하는 Place(No) 가 HiddenPlace 냐??
	 * */
	@Query("select p from Place p where p.placeHidden=1")
	Place isHiddenPlace(Long placeNo);
	
	
	/*
select p.*
from map m
join place p
on m.map_no=p.map_no
where m.map_no=21 and p.place_hidden=1;
	*/
}
