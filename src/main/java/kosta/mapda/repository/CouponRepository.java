package kosta.mapda.repository;

import java.util.List;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;

import kosta.mapda.domain.service.Coupon;

public interface CouponRepository extends JpaRepository<Coupon, Long> {
	Page<Coupon> findBycpNameContaining(Pageable pageable, String keyword);
	
	Page<Coupon> findByCouponCategory(Pageable pageable, Long cpcaNo);

//	Page<Coupon> findAllCoupon();
	
	@Query("update Coupon c set c.cpState=0 where c.cpNo=?1")
	@Modifying
	int stop(Long cpNo);
	
}
