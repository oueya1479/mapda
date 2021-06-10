package kosta.mapda.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import kosta.mapda.domain.service.MyCoupon;

public interface MyCouponRepository extends JpaRepository<MyCoupon, Long> {

}
