package kosta.mapda.controller.coupon;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import kosta.mapda.domain.member.Member;
import kosta.mapda.domain.service.Coupon;
import kosta.mapda.repository.MyCouponRepository;
import kosta.mapda.service.service.CouponService;

/**
 * 비동기화 통신용 controller
 */
@RestController
@RequestMapping("/coupon")
public class CouponRestController {

	@Autowired
	private CouponService couponservice;
	
	@Autowired
	private MyCouponRepository myCouponRepository;
	
	/**
	 * 해당 쿠폰번호에 해당하는 쿠폰 발급상태 변경하기
	 */
//	@RequestMapping(value = "/stop", produces = "text/html;charset=UTF-8")
//	public int stop(Long cpNo) {
//		int value = couponservice.stop(cpNo);
//		
//		return value;
//	}
	
	/**
	 * 쿠폰 발급하기
	 * */
	@RequestMapping(value="/issue")
	public int couponIssue(String couponNoStr, String memNoStr) {
		Long cpNo = Long.parseLong(couponNoStr);
		Long memNo = Long.parseLong(memNoStr);
		int resultCode = 1;
		try {//발급완료
			Coupon coupon = couponservice.selectCoupon(cpNo);
			couponservice.insertMyCoupon(coupon, memNo);
			resultCode = 1;
		}catch(Exception e){//발급실패
			System.out.println(e.getMessage());
			resultCode= -1;
		}
		return resultCode;
	}
	
}
