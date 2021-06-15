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

//	@Query("update Coupon c set c.cpState=0 where c.cpNo=?1")
//	@Modifying
//	int stop(Long cpNo);
//	
//	
//	@Query("INSERT INTO Coupon c \r\n"
//			+ "(c.cpNo, MEM_NO, CPCA_NO, c.cpName, c.cpPlace, c.cpImgpath, c.cpPrice, c.cpDetail, c.cpUsingdetail, c.cpState)\r\n"
//			+ "VALUES(cp_no_seq.nextval, ?1, ?2, ?3, ?4, ?5, ?6, ?7, ?8, ?9)")
//	@Modifying
//	int insert(Coupon coupon);
	
	
}
