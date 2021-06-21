package kosta.mapda.controller.admin;

import java.io.File;
import java.io.IOException;
import java.util.List;

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
import kosta.mapda.domain.enterprise.EnterprisePost;
import kosta.mapda.domain.enterprise.EnterpriseReply;
import kosta.mapda.domain.map.Place;
import kosta.mapda.domain.map.PlacePhotoReview;
import kosta.mapda.domain.map.PlaceReview;
import kosta.mapda.domain.map.Theme;
import kosta.mapda.domain.member.InfluenceReq;
import kosta.mapda.domain.member.Member;
import kosta.mapda.domain.member.RPay;
import kosta.mapda.domain.service.Coupon;
import kosta.mapda.domain.service.CouponCategory;
import kosta.mapda.domain.service.MyCoupon;
import kosta.mapda.repository.enterprise.EnterpriseRepository;
import kosta.mapda.service.admin.AdminService;
import kosta.mapda.service.service.CouponService;

@Controller
@RequestMapping("/admin")
public class AdminController {
	
	@Autowired
	private AdminService adminService;
	
	@Autowired
	private CouponService service;
	
	@Autowired
	private EnterpriseRepository enterpriseRepository;
	
	@RequestMapping("index")
	public void index(Model model) {
		Long memberCount = adminService.getMemberCount();
		List<Integer> memberCountList = adminService.getMemberCountList();
		List<Integer> postCountList = adminService.getPostCountList();
		List<Integer> replyCountList = adminService.getReplyCountList();
		model.addAttribute("memberCountList", memberCountList);
		model.addAttribute("postCountList", postCountList);
		model.addAttribute("replyCountList", replyCountList);
		System.out.println(memberCountList);
	}
	
	@RequestMapping("/member")
	public void member(Model model, @RequestParam(defaultValue = "0") int nowPage, String contain, String content) {
		Pageable pageable = PageRequest.of(nowPage, 10, Direction.ASC, "memNo");
		Page<Member> memberList =  adminService.getMember(pageable);
		model.addAttribute("title", "회원 정보");
		model.addAttribute("content", "회원 정보를 탐색하고 수정할 수 있습니다.");
		model.addAttribute("memberList", memberList);
	}
	
	@RequestMapping("/member_modify/{memNo}")
	public String memberModify(Model model, @PathVariable Long memNo) {
		Member member = adminService.getOneMember(memNo);
		model.addAttribute("member", member);
		return "admin/member_modify";
	}
	
	@RequestMapping("/update_member")
	public String updateMember(Model model, Member member) {
		System.out.println(member.getMemRegdate());
		adminService.updateMember(member);
		model.addAttribute("where", "member");
		return "admin/exit";
	}
	
	@RequestMapping("/influence")
	public void influence(Model model) {
		List<InfluenceReq> influence = adminService.getInfluenceReq();
		List<Member> memberList = adminService.getInfluence();
		model.addAttribute("title", "인플루언서");
		model.addAttribute("content", "인플루언서들의 목록과 신청을 관리합니다.");
		model.addAttribute("influence", influence);
		model.addAttribute("memberList", memberList);
	}
	
	@RequestMapping("/regular_payment")
	public void regularPayment(Model model) {
		List<Member> memberList = adminService.getRegular();
		model.addAttribute("title", "정기결제");
		model.addAttribute("content", "정기결제자 들의 목록과 신청을 관리합니다.");
		model.addAttribute("memberList", memberList);
	}
	
	@RequestMapping("/theme_post")
	public void themePost(Model model, @RequestParam(defaultValue = "0") int nowPage, String contain, String content) {
		Pageable pageable = PageRequest.of(nowPage, 10, Direction.ASC, "mapNo");
		Page<Theme> themeList = adminService.getTheme(pageable);
		model.addAttribute("title", "테마 지도");
		model.addAttribute("content", "테마 지도 게시물에 관련한 페이지입니다.");
		model.addAttribute("themeList", themeList);
	}
	
	@RequestMapping("/place_post")
	public void placePost(Model model, @RequestParam(defaultValue = "0") int nowPage, String contain, String content) {
		Pageable pageable = PageRequest.of(nowPage, 10, Direction.ASC, "placeNo");
		Page<Place> placeList = adminService.getPlace(pageable);
		model.addAttribute("title", "플레이스");
		model.addAttribute("content", "플레이스 게시물에 관련한 페이지입니다.");
		model.addAttribute("placeList", placeList);
	}
	
	@RequestMapping("/place_post_modify/{placeNo}")
	public String placeModify(Model model, @PathVariable Long placeNo) {
		Place place = adminService.getOnePlace(placeNo);
		model.addAttribute("place", place);
		return "admin/place_post_modify";
	}
	
	@RequestMapping("/update_place")
	public String updatePlace(Model model, Place place) {
		adminService.updatePlace(place);
		model.addAttribute("where", "place_post");
		return "admin/exit";
	}
	
	@RequestMapping("/enterprise_post")
	public void enterprisePost(Model model, @RequestParam(defaultValue = "0") int nowPage, String contain, String content) {
		Pageable pageable = PageRequest.of(nowPage, 10, Direction.ASC, "epNo");
		Page<EnterprisePost> enterprisePostList = adminService.getEnterprisePost(pageable);
		model.addAttribute("title", "엔터프라이즈");
		model.addAttribute("content", "엔터프라이즈 게시물에 관련한 페이지입니다.");
		model.addAttribute("enterprisePostList", enterprisePostList);
	}
	
	@RequestMapping("/nearby_post")
	public void nearbyPost() {
		
	}
	
	@RequestMapping("/place_reply")
	public void placeReply(Model model, @RequestParam(defaultValue = "0") int nowPage1, @RequestParam(defaultValue = "0") int nowPage2) {
		Pageable pageable1 = PageRequest.of(nowPage1, 10, Direction.ASC, "pprNo");
		Page<PlacePhotoReview> photoReviewList = adminService.getPhotoReview(pageable1);
		Pageable pageable2 = PageRequest.of(nowPage2, 10, Direction.ASC, "prNo");
		Page<PlaceReview> reviewList = adminService.getReview(pageable2);
		model.addAttribute("title", "플레이스");
		model.addAttribute("content", "플레이스 댓글에 관련한 페이지입니다.");
		model.addAttribute("photoReviewList", photoReviewList);
		model.addAttribute("reviewList", reviewList);
	}
	
	@RequestMapping("/enterprise_reply")
	public void enterpriseReply(Model model, @RequestParam(defaultValue = "0") int nowPage, String contain, String content) {
		Pageable pageable = PageRequest.of(nowPage, 10, Direction.ASC, "erNo");
		Page<EnterpriseReply> replyList = adminService.getEnterpriseReply(pageable);
		model.addAttribute("title", "엔터프라이즈");
		model.addAttribute("content", "엔터프라이즈 댓글에 관련한 페이지입니다.");
		model.addAttribute("replyList", replyList);
	}
	
	@RequestMapping("/neearby_reply")
	public void neearbyReply() {
		
	}
	
	@RequestMapping("/consulting")
	public void consulting() {
		
	}
	
	@RequestMapping("/report")
	public void report() {
		
	}
	
	@RequestMapping("/levelUp/{memNo}")
	public String levelUp(@PathVariable Long memNo) {
		adminService.levelUp(memNo);
		return "redirect:/admin/influence";
	}
	
	@RequestMapping("/levelDown/{memNo}")
	public String levelDown(@PathVariable Long memNo) {
		adminService.levelDown(memNo);
		return "redirect:/admin/influence";
	}
	
	@RequestMapping("/cancelRpay/{memNo}")
	public String cancelRpay(@PathVariable Long memNo) {
		adminService.cancelRpay(memNo);
		return "redirect:/admin/regular_payment";
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
	@RequestMapping("/viewCoupon")
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
		
		if(file.getSize()>0) {
			
			String path = session.getServletContext().getRealPath("/WEB-INF/static");
			
			String fileName = file.getOriginalFilename();
			coupon.setCpImgpath(path+"/"+fileName);
			
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
