package kosta.mapda.service.service;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;

import kosta.mapda.domain.service.Coupon;

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
	Page<Coupon> selectBySerch(String couponName);
}
