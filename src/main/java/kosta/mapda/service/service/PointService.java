package kosta.mapda.service.service;


import java.util.List;

import javax.transaction.Transactional;

import org.springframework.stereotype.Service;

import kosta.mapda.domain.map.Place;
import kosta.mapda.domain.map.PlacePhotoReview;
import kosta.mapda.domain.map.Theme;
import kosta.mapda.domain.service.MyPoint;
import kosta.mapda.domain.service.SavingHistory;
import kosta.mapda.domain.service.UsingHistory;

public interface PointService {

	
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
	
	/**
	 * 마이포인트 - 포인트 적립
	 * */
	void pointPlus(SavingHistory savePoint);
	
	/**
	 * 포인트 적립과 사용에 따른 잔여포인트 합산
	 * */
	void pointSum(int savePoint, int usePoint, Long memNo);
	
	/**
	 * 마이포인트 - 포인트 사용
	 * */
	void pointMinus(UsingHistory usingPoint);
	
	/**
	 * 마이포인트 - 적립내역조회
	 * */
	List<SavingHistory> selectSavingHistory(Long memNo);
	
	/**
	 * 마이포인트 - 사용내역조회
	 * */
	List<UsingHistory> selectUsingHistory (Long memNo);
	
	/**
	 * 가입시 마이포인트 테이블 생성
	 * */
	void createMyPoint (Long memNo);
	
	/**
	 * 마이포인트의 포인트 조회하기
	 * */
	MyPoint selectMyPoint(Long memNo);
	
	/**
	 * 내포인트- 잔여포인트 업데이트
	 * */
	void updateMyPoint(Long memNo, int point);
	
	
}
