package kosta.mapda.service.service;

import java.util.List;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;

import kosta.mapda.domain.service.Coupon;
import kosta.mapda.repository.CouponRepository;

@Service
@Transactional
public class CouponServiceImpl implements CouponService {

	@Autowired
	private CouponRepository couponRepository;
	
	@Override
	public Page<Coupon> selectAll(Pageable pageable) {
		
		return couponRepository.findAll(pageable);
	}

	@Override
	public Coupon selectCoupon(Long couponNo) {
		
		return couponRepository.findById(couponNo).orElse(null);
	}

	@Override
	public Page<Coupon> selectByName(Pageable pageable, String couponName) {
		
		return couponRepository.findBycpNameContaining(pageable, couponName);
		
	}

	@Override
	public List<Coupon> viewAll() {
		List<Coupon> list =  couponRepository.findAll();
		for(Coupon cp : list) {
			int state = cp.getCpState();
			String strState;
			switch(state) {
//				case 0 : (String)state = cp.setCpState("발급중단"); break;
//				case 1 : cp.setCpState("발급가능"); break;
			}
			
		}
		return list;
	}
	
}
