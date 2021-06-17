package kosta.mapda.service.service;


import java.util.List;

import javax.transaction.Transactional;

import org.springframework.stereotype.Service;

import kosta.mapda.domain.map.Place;
import kosta.mapda.domain.map.PlacePhotoReview;
import kosta.mapda.domain.map.Theme;
import kosta.mapda.domain.service.MyPoint;

public interface PointService {

	/**
	 * 내 누적 포인트 가져오기
	 */
	List<MyPoint>  selectMyPoint(Long memNo);
	
	/**
	 * 마이포인트 - 나의 테마지도 리스트 가져오기
	 * */
	List<Theme> selectMyThemeMyPoint(Long memNo);
	
	/**
	 * 마이포인트 - 나의 플레이스 리스트 가져오기
	 * */
	List<Place> selectMyPlaceMyPoint(Long memNo);
	
	/**
	 * 마이포인트 - 나의 포토리뷰 리스트 가져오기
	 * */
	List<PlacePhotoReview> selectMyPlacePhotoMyPoint(Long memNo);
}
