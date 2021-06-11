package kosta.mapda.service.service;

import java.util.List;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;

import kosta.mapda.domain.service.Coupon;
import kosta.mapda.domain.service.CouponCategory;

public interface CouponService {

	
	/**
	 * 쿠폰목록 가져오기
	 * */
	Page<Coupon> selectAll(Pageable pageable);
	
	/**
	 * 쿠폰 상세보기
	 * */
	Coupon selectCoupon(Long couponNo);
	
	
	/**
	 * 쿠폰 검색해서 가져오기
	 * */
	Page<Coupon> selectByName(Pageable pageable, String couponName);
	/**
	 * 관리자 쿠폰 전체 조회하기
	 */
	Page<Coupon> viewAll(Pageable pageable);
	
	/**
	 * 쿠폰 카테고리로 목록 가져오기
	 * */
	Page<Coupon> selectByCategory(Pageable pageable, Long category);
	
	/**
	 * 쿠폰 카테고리 목록 가져오기
	 * */
	List<CouponCategory> couponCategory();
	
	/** 
	 * 쿠폰 발급상태 변경하기
	 */
	int stop(Long cpNo);
}
