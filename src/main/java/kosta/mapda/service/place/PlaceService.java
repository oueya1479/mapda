package kosta.mapda.service.place;

import java.util.List;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;

import kosta.mapda.domain.map.Place;
import kosta.mapda.domain.map.PlacePhoto;
import kosta.mapda.domain.map.PlaceStorage;

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
	void insert(Place place, List<PlacePhoto> ppList);
	
	/**
	 * 		플레이스 번호 검색
	 * */
	Place selectBy(Long placeNo);
	
	/**
	 * 		수정하기
	 * */
	Place update(Place place, List<PlacePhoto> ppList);
	
	/**
	 * 		삭제하기
	 * */
	void delete(Long placeNo);
	
	/**
	 * 	 플레이스 사진 전체 검색
	 * */
	List<PlacePhoto> selectAllPlacePhoto(Long placeNo);
	
	/**
	 * 		플레이스 사진 등록하기
	 * */
//	void insertPlacePhoto(List<PlacePhoto> photoList);
	
	/**
	 * 		히든 플레이스 가져오기
	 * */
	List<Place> selectByHidden(Long mapNo);

	/**
	 * 		인플루 언서인지 확인하기
	 * */
	boolean findMemberMemNo(Long memNo);
	
	/**
	 * 		로그인한 멤버의 PlaceStorage 목록 받아오기
	 * */
	List<PlaceStorage> selectByMemPlace(Long memNo);
	
	/**
	 * 		PlaceStorage page 처리
	 * */
	Page<PlaceStorage> selectAllPagePS(Long memNo, Pageable pageable);
	
	/**
	 * 		PlaceStorage delete
	 * */
	void psDelete(Long psNo);
	
	/**
	 * 		좋아요 체크
	 * */
	PlaceStorage likeCheck(Long placeNo, Long memNo);
	
	/**
	 * 		좋아요 insert
	 * */
	void insertPlaceStorage(Long placeNo, Long memNo);
	
	/**
	 * 		좋아요 delete
	 * */
	void deletePlaceStorage(Long placeNo, Long memNo);
	
}
