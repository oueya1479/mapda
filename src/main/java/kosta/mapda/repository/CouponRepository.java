package kosta.mapda.repository;

import java.util.List;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;

import kosta.mapda.domain.service.Coupon;
import kosta.mapda.domain.service.CouponCategory;

public interface CouponRepository extends JpaRepository<Coupon, Long> {
	Page<Coupon> findBycpNameContaining(Pageable pageable, String keyword);
	
	Page<Coupon> findBycouponCategory(Pageable pageable, CouponCategory cpcaNo);
	
//	Page<Coupon> findAllBycpNameContainingAndcouponCategory(Pageable pageable, String couponName, CouponCategory cpcaNo);

	
	
	
	
}
