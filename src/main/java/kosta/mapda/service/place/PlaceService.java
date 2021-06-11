package kosta.mapda.service.place;

import java.util.List;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;

import kosta.mapda.domain.map.Place;
import kosta.mapda.domain.map.PlacePhoto;

public interface PlaceService {
	/**
	 * 		전체검색
	 * */
	List<Place> selectAll();
	
	/**
	 * 		전체 검색 - Page 처리
	 * */
	Page<Place> selectAll(Pageable pageable);
	
	/**
	 * 		등록
	 * */
	void insert(Place place);
	
	/**
	 * 		플레이스 번호 검색
	 * */
	Place selectBy(Long placeNo);
	
	/**
	 * 		수정하기
	 * */
	Place update(Place place);
	
	/**
	 * 		삭제하기
	 * */
	void delete(Long placeNo);
	
	/**
	 * 	 플레이스 사진 전체 검색
	 * */
	List<PlacePhoto> selectAllPlacePhoto(Long placeNo);
}
