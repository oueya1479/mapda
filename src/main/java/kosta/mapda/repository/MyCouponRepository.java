package kosta.mapda.repository;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;

import kosta.mapda.domain.member.Member;
import kosta.mapda.domain.service.MyCoupon;

public interface MyCouponRepository extends JpaRepository<MyCoupon, Long> {

	Page<MyCoupon> findBymember(Pageable pageable, Member member);
}
