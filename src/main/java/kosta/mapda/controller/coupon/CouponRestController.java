package kosta.mapda.controller.coupon;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import kosta.mapda.service.service.CouponService;

/**
 * 비동기화 통신용 controller
 */
@RestController
@RequestMapping("/coupon")
public class CouponRestController {

	@Autowired
	private CouponService couponservice;
	
	/**
	 * 해당 쿠폰번호에 해당하는 쿠폰 발급상태 변경하기
	 */
//	@RequestMapping(value = "/stop", produces = "text/html;charset=UTF-8")
//	public int stop(Long cpNo) {
//		int value = couponservice.stop(cpNo);
//		
//		return value;
//	}
}
