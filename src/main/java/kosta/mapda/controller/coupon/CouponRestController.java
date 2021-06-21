package kosta.mapda.controller.coupon;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import kosta.mapda.domain.member.Member;
import kosta.mapda.domain.service.Coupon;
import kosta.mapda.domain.service.MyPoint;
import kosta.mapda.domain.service.UsingHistory;
import kosta.mapda.repository.MyCouponRepository;
import kosta.mapda.repository.MyPointRepository;
import kosta.mapda.service.service.CouponService;
import kosta.mapda.service.service.PointService;

/**
 * 비동기화 통신용 controller
 */
@RestController
@RequestMapping("/couponAjax")
public class CouponRestController {

	@Autowired
	private CouponService couponservice;
	
	@Autowired
	private PointService pointService;
	
	@Autowired
	private MyCouponRepository myCouponRepository;
	
	@Autowired
	private MyPointRepository myPointRepository;
	
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
	public int couponIssue(String couponNoStr, HttpSession session) throws Exception{
		Long cpNo = Long.parseLong(couponNoStr);
		
		Member mem = (Member)SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		MyPoint mp = myPointRepository.findBymember_memNo(mem.getMemNo());
		Coupon coupon = couponservice.selectCoupon(cpNo);
		
		System.out.println(coupon.getCpPrice());
		System.out.println("//////");
		System.out.println(mp.getMyPoint());
		
		int resultCode = 1;
		try {//발급완료
			if(mp.getMyPoint() >= coupon.getCpPrice()) {
		
			UsingHistory uh = new UsingHistory();
			uh.setUhPay(coupon.getCpPrice());
			uh.setUhWhere(coupon.getCpName());
			uh.setMyPoint(mp);
			pointService.pointMinus(uh);
			
			pointService.updateMyPoint(mem.getMemNo(), -coupon.getCpPrice());
				
			couponservice.insertMyCoupon(coupon, mem.getMemNo(), session);
			resultCode = 1;
			}else {
				resultCode= -1;
			}
		}catch(Exception e){//발급실패
			System.out.println(e.getMessage());
			resultCode= -1;
		}
		return resultCode;
	}
	
}
