package kosta.mapda.controller.coupon;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort.Direction;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import kosta.mapda.domain.service.Coupon;
import kosta.mapda.service.service.CouponService;

@Controller
@RequestMapping("/coupon")
public class CouponController {

	@Autowired
	private CouponService service;
	
	/**
	 * 쿠폰 리스트를 가져오는 메소드
	 */
	@RequestMapping("/list")
	public String couponList(Model model, @RequestParam(defaultValue = "0") int nowPage, 
			@RequestParam(required = false, defaultValue = "") String keyword) {
	
		Pageable pageable = PageRequest.of(nowPage, 10, Direction.ASC, "cpNo");
		Page<Coupon> couponList = service.selectAll(pageable);
		
		if(keyword.isEmpty()==false || keyword!=null) {
			couponList = service.selectByName(pageable, keyword);
		}
		
		
		model.addAttribute("couponList", couponList);
		return "coupon/list";
	}
	
	/**
	 * 쿠폰 상세보기 메소드
	 * */
	@RequestMapping("/couponDetail/{cpNo}")
	public ModelAndView couponDetail(@PathVariable Long cpNo) {
		
		Coupon coupon = service.selectCoupon(cpNo);
		ModelAndView mv = new ModelAndView("coupon/couponDetail", "coupon", coupon);
		return mv;
	}
	
	@RequestMapping("/admin")
	public String allcouponList(Model model) {
		
		model.addAttribute("couponList", service.viewAll());
		return "coupon/couponManage";
	}
	
}