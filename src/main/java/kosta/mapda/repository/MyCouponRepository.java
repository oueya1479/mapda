package kosta.mapda.repository;

import java.util.List;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import kosta.mapda.domain.member.Member;
import kosta.mapda.domain.service.MyCoupon;

public interface MyCouponRepository extends JpaRepository<MyCoupon, Long> {

	Page<MyCoupon> findBymember_memNo(Pageable pageable, Long memNo);
	
	//@Query("SELECT m FROM My_Coupon m WHERE m.member.memNo=11")
	//public List<MyCoupon> test();
	
}
