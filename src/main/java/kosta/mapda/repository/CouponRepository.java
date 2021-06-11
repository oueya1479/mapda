package kosta.mapda.repository;

import java.util.List;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;

import kosta.mapda.domain.service.Coupon;

public interface CouponRepository extends JpaRepository<Coupon, Long> {
	Page<Coupon> findBycpNameContaining(Pageable pageable, String keyword);
	

}
