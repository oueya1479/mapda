package kosta.mapda.service.service;


import kosta.mapda.domain.service.MyPoint;

public interface PointService {

	/**
	 * 내 누적 포인트 가져오기
	 */
	MyPoint selectMyPoint(Long memNo);
	
}
