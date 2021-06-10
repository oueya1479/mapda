package kosta.mapda.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;

import kosta.mapda.domain.service.Coupon;

public interface CouponRepository extends JpaRepository<Coupon, Long> {
	List<Coupon> findBycpNameContaining(String keyword);
}
