package kosta.mapda.controller.coupon;

import java.io.File;
import java.io.IOException;
import java.util.List;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort.Direction;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import kosta.mapda.domain.enterprise.Enterprise;
import kosta.mapda.domain.member.Member;
import kosta.mapda.domain.service.Coupon;
import kosta.mapda.domain.service.CouponCategory;
import kosta.mapda.domain.service.MyCoupon;
import kosta.mapda.domain.service.MyPoint;
import kosta.mapda.repository.enterprise.EnterpriseRepository;
import kosta.mapda.service.service.CouponService;
import kosta.mapda.service.service.PointService;

@Controller
@RequestMapping("/coupon")
public class CouponController {

	@Autowired
	private CouponService service;
	
	@Autowired
	private PointService pointService;
	
	@Autowired
	private EnterpriseRepository enterpriseRepository;
	
	/**
	 * 쿠폰 리스트를 가져오는 메소드
	 */
	@RequestMapping("/list")
	public String couponList(HttpServletRequest request, Model model, @RequestParam(defaultValue = "0") int nowPage, 
			@RequestParam(required = false, defaultValue = "") String keyword,
			@RequestParam(required = false, defaultValue = "") Long category) {
	
		Pageable pageable = PageRequest.of(nowPage, 10, Direction.ASC, "cpNo");
		Page<Coupon> couponList; 
		
		Member mem = (Member)SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		
		MyPoint myPoint = pointService.selectMyPoint(mem.getMemNo());
		
		/*if(keyword.isEmpty()==false || keyword!=null) {
			couponList = service.selectByName(pageable, keyword);
		}else if(cetegory!=null) {
			couponList = service.selectByCategory(pageable, cetegory);
		}else {
			couponList = service.selectAll(pageable);
		}*/
		
		couponList = service.selectAll(pageable,keyword,category);
		
		
		List<CouponCategory> categoryList = service.couponCategory();
		
		
		
		System.out.println("---------------");
		//System.out.println(couponList.getContent().);
		
		
		model.addAttribute("couponList", couponList);
		model.addAttribute("categoryList", categoryList);
		model.addAttribute("myPoint", myPoint);
	
		
		return "coupon/list";
	}
	
	
	/**
	 * 쿠폰 상세보기 메소드
	 * */
	@RequestMapping("/couponDetail/{cpNo}")
	public String couponDetail(@PathVariable Long cpNo, Model model) {
		
		Member mem = (Member)SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		MyPoint myPoint = pointService.selectMyPoint(mem.getMemNo());
		
		Coupon coupon = service.selectCoupon(cpNo);
		
		model.addAttribute("coupon", coupon);
		model.addAttribute("myPoint", myPoint);
		
		return "coupon/couponDetail";
	}
	
//	/**
//	 * 관리자 전체 쿠폰 조회
//	 */
	@RequestMapping("/admin")
	public String allcouponList(Model model, @RequestParam(defaultValue = "0") int nowPage,
			@RequestParam(required = false, defaultValue = "") String keyword,
			@RequestParam(required = false, defaultValue = "") Long category
			) {
		
		Pageable pageable = PageRequest.of(nowPage, 10, Direction.ASC, "cpNo");
		Page<Coupon> couponList = service.viewAll(pageable);
		
		couponList = service.selectAll(pageable,keyword,category);
		List<CouponCategory> categoryList = service.couponCategory();
		
		model.addAttribute("couponList", couponList);
		model.addAttribute("categoryList", categoryList);
		
		return "coupon/couponManage";
	}
	
	
	@RequestMapping("/insert")
	public String insert(Model model, Coupon coupon) {
		List<Enterprise> enterpriseList = enterpriseRepository.findAll();
		model.addAttribute("enterpriseList", enterpriseList);
		return "coupon/couponAdd";
	}
	
	/**
	 * 관리자 쿠폰 등록
	 */
	@PostMapping("/insert/form")
//	@NotFound(action=NotFoundAction.IGNORE)
	public String insertCoupon(Coupon coupon, HttpServletRequest request, String entName, Long cpcaNo, HttpSession session) throws IOException {
		Enterprise enterprise = enterpriseRepository.findByEntName(entName);
		System.out.println(enterprise.getMemNo());
		enterprise.setMemNo(enterprise.getMemNo());
		coupon.setMember(enterprise);
		
		CouponCategory category = new CouponCategory();
		category.setCpcaNo(cpcaNo);
		coupon.setCouponCategory(category);
		
		MultipartFile file = coupon.getFile();
		
		ServletContext application = session.getServletContext();
		String path = application.getRealPath("/resources");
		
		if(file.getSize()>0) {
			
			String fileName = file.getOriginalFilename();
			coupon.setCpImgpath(fileName);
			file.transferTo(new File(path+"/"+fileName));
			
		} else {
			Coupon dbCoupon = service.selectCoupon(coupon.getCpNo());
			if(dbCoupon!=null) {
				String originPath = dbCoupon.getCpImgpath();
				coupon.setCpImgpath(originPath);
			}
				
		}
		
		service.insertCoupon(coupon);
//		try {
//			String baseDir = request.getSession().getServletContext().getRealPath("/WEB-INF/static");
//			String filePath = baseDir + "/" + file.getOriginalFilename();
//			file.transferTo(new File(filePath));
//			Authentication user = SecurityContextHolder.getContext().getAuthentication();
//			String memId = user.getName();
//			System.out.println(memId);
//			coupon.setCpImgpath(filePath);
//			
//			service.insertCoupon(coupon);
//			
//		} catch(IOException e) {
//			e.printStackTrace();
//		}
		
		return "redirect:/coupon/admin";
	}
	
	/**
	 * 마이페이지- 마이 쿠폰 조회
	 * */
	@RequestMapping("/myCoupon")
	public String myCoupon(Model model, @RequestParam(defaultValue = "0") int nowPage
			) {
		
		Member mem = (Member)SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		
		Pageable pageable = PageRequest.of(nowPage, 10, Direction.ASC, "mycpNo");
		
		
		
		System.out.println("*************");
		
		

		
		Page<MyCoupon> myCouponList = service.selectByMyCoupon(pageable, mem.getMemNo());
		System.out.println(myCouponList.getContent());
		
		model.addAttribute("myCouponList", myCouponList);
		
		return "coupon/myCoupon";
	}
	/**
	 *  관리자 쿠폰 상세보기
	 */
	@GetMapping("/couponAdminDetail")
	public String couponAdminDetail(@RequestParam("cpNo") Long cpNo, Model model) {
		
		Coupon coupon = service.selectCoupon(cpNo);
		
		model.addAttribute("coupon", coupon);
		
		return "coupon/couponAdminDetail";
	}
	
	/**
	 * 수정버튼 눌렀을 시 수정 form으로 가는 메소드
	 */
	@GetMapping("/updateForm")
	public String couponAdminUpdateForm(@RequestParam("cpNo") Long cpNo, Model model) {
		Coupon coupon = service.selectCoupon(cpNo);
		
		model.addAttribute("coupon", coupon);
		
		return "coupon/couponUpdateForm";
		
	}
	
	/**
	 * 수정 form insert 후 다시 목록으로 가는 메소드
	 */
	@RequestMapping("/updateCoupon/coupon={coupon}/cpNo={cpNo}")
	public String couponAdminUpdate(@RequestParam("file") MultipartFile file,
								    @PathVariable Coupon coupon,
								    @PathVariable String cpNo,
									Model model,
									HttpServletRequest request) {
//		CouponCategory newCouponCategory = coupon.getCouponCategory();
//		Long newCpca = newCouponCategory.getCpcaNo();
//		
//		CouponCategory dbCouponCategory = service.getCouponCategory(newCpca);
//		
//		coupon.setCouponCategory(dbCouponCategory);
		System.out.println(coupon.getMember().toString());
//		coupon.getCouponCategory();
		
		Long cpNoo = Long.parseLong(cpNo);
		coupon.setCpNo(cpNoo);
		
//		try {
//			
//			if(file !=null) {
//				String baseDir = request.getSession().getServletContext().getRealPath("/WEB-INF/static");
//				String filePath = baseDir + "/" + file.getOriginalFilename();
//				file.transferTo(new File(filePath));
//				coupon.setCpImgpath(filePath);
//				dbCoupon = service.updateCoupon(coupon);
//				
//			} else {
//				coupon.setCpImgpath("www.naver.com");
				service.updateCoupon(coupon);
//			}
			
//		} catch(IOException e) {
//			e.printStackTrace();
//		}
		
//		model.addAttribute("coupon", dbCoupon);	
		
		return "redirect:/coupon/admin";
	}
	
	
	@RequestMapping("/stop/cpNo={cpNo}")
	public String couponStop(Model model, @PathVariable Long cpNo) {
		
		
		service.stop(cpNo);
		
		return "redirect:/coupon/admin";
	}
	
	
}