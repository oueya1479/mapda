package kosta.mapda.controller.coupon;

import java.util.List;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.swing.filechooser.FileSystemView;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort.Direction;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import kosta.mapda.domain.member.Member;
import kosta.mapda.domain.service.Coupon;
import kosta.mapda.domain.service.CouponCategory;
import kosta.mapda.domain.service.MyCoupon;
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
	public String couponList(HttpServletRequest request, Model model, @RequestParam(defaultValue = "0") int nowPage, 
			@RequestParam(required = false, defaultValue = "") String keyword,
			@RequestParam(required = false, defaultValue = "") Long cetegory)
			 {
	
		Pageable pageable = PageRequest.of(nowPage, 10, Direction.ASC, "cpNo");
		Page<Coupon> couponList; 
		
		/*if(keyword.isEmpty()==false || keyword!=null) {
			couponList = service.selectByName(pageable, keyword);
		}else if(cetegory!=null) {
			couponList = service.selectByCategory(pageable, cetegory);
		}else {
			couponList = service.selectAll(pageable);
		}*/
		
		couponList = service.selectAll(pageable,keyword,cetegory);
		
		/*
		 * int size = couponList.getContent().size(); for(int i = 0; i < size; i++) {
		 * if(couponList.getContent().get(i).getCouponCategory().getCpcaNo() == c)) {
		 * couponList.getContent().get(i) } }
		 */
		
		List<CouponCategory> categoryList = service.couponCategory();
		
		model.addAttribute("couponList", couponList);
		model.addAttribute("categoryList", categoryList);
		
		//
		HttpSession session = request.getSession();
		Member member = new Member();
		member.setMemNo(0L);
		member.setMemId("seo");
		member.setMemPw("1234");
		session.setAttribute("member", member);
		//
		
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
	
//	/**
//	 * 관리자 전체 쿠폰 조회
//	 */
	@RequestMapping("/admin")
	public String allcouponList(Model model, @RequestParam(defaultValue = "0") int nowPage) {
		
		Pageable pageable = PageRequest.of(nowPage, 10, Direction.ASC, "cpNo");
		Page<Coupon> couponList = service.viewAll(pageable);
		
		model.addAttribute("couponList", couponList);
		return "coupon/couponManage";
	}
	
	/**
	 * 
	 */
	@RequestMapping("/couponAdd")
	public String couponAdd() {
		
		return "coupon/couponAdd";
	}
	
	/**
	 * 관리자 전체 쿠폰 조회
	 */
//	@RequestMapping("/admin")
//	public String allcouponList(Model model, @PageableDefault(size = 10, sort = "id", direction = Sort.Direction.DESC) Pageable pageable ) {
//		
//		Page<Coupon> couponList = service.viewAll(pageable);
//		model.addAttribute("couponList", couponList);
//		return "coupon/couponManage";
//	}
	/**
	 * 관리자 쿠폰 등록
	 */
	@PostMapping("/insert")
	public String insertCoupon(@RequestParam("file") MultipartFile file, Coupon coupon) {
		
		String rootPath = FileSystemView.getFileSystemView().getHomeDirectory().toString();
		String basePath = rootPath + "/" + "single";
		
		String filePath = basePath + "/" + file.getOriginalFilename();
		
		service.insertCoupon(coupon);
		
		return "/coupon/couponAdd";
	}
	
	/**
	 * 마이페이지- 마이 쿠폰 조회
	 * */
	@RequestMapping("/myCoupon")
	public String myCoupon(Model model, @RequestParam(defaultValue = "0") int nowPage,
			HttpSession session ) {
		
		
		Pageable pageable = PageRequest.of(nowPage, 10, Direction.ASC, "mycpNo");
		
		Member m = (Member) session.getAttribute("member");
		
		Page<MyCoupon> myCouponList = service.selectByMyCoupon(pageable, m.getMemNo());
		
		model.addAttribute("myCouponList", myCouponList);
		
		return "coupon/myCoupon";
	}
		
	
	@ExceptionHandler(Exception.class)
	public String exception(Exception e) {
		
		e.printStackTrace();
		
		return"error";
	}
}