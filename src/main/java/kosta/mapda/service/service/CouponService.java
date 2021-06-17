package kosta.mapda.service.service;

import java.util.List;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.web.multipart.MultipartFile;

import kosta.mapda.domain.member.Member;
import kosta.mapda.domain.service.Coupon;
import kosta.mapda.domain.service.CouponCategory;
import kosta.mapda.domain.service.MyCoupon;

public interface CouponService {

	
	/**
	 * 쿠폰목록 가져오기
	 * */
	Page<Coupon> selectAll(Pageable pageable, String couponName, Long category);
	
	/**
	 * 쿠폰 상세보기
	 * */
	Coupon selectCoupon(Long couponNo);
	
	
	/**
	 * 관리자 전체 쿠폰 목록 보기
	 */
	Page<Coupon> viewAll(Pageable pageable);
	
	/**
	 * 쿠폰 검색해서 가져오기
	 * */
	Page<Coupon> selectByName(Pageable pageable, String couponName);
	
	/**
	 * 쿠폰 카테고리로 목록 가져오기
	 * */
	Page<Coupon> selectByCategory(Pageable pageable, Long category);
	
	/**
	 * 쿠폰 카테고리 목록 가져오기
	 * */
	List<CouponCategory> couponCategory();
	
//	/** 
//	 * 쿠폰 발급상태 변경하기
//	 */
	int stop(Long cpNo);
//	
	/**
	 * 마이페이지 - 마이쿠폰 가져오기
	 * */
	Page<MyCoupon> selectByMyCoupon(Pageable pageable, Long memNo);
//	/* 
//	 * 쿠폰 추가하기
//	 */
	void insertCoupon(Coupon coupon);
	/**
	 * 쿠폰 수정하기
	 */
	Coupon updateCoupon(Coupon coupon);
	
	/**
	 * 쿠폰 발급하기
	 * */
	 void insertMyCoupon(Coupon coupon, Long memNo);
	
	/*
	 * 쿠폰 카테고리 가져오기
	 */
	CouponCategory getCouponCategory(Long cpcaNo);
}
