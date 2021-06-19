package kosta.mapda.controller.admin;

import java.util.List;
import java.util.Map;

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

import kosta.mapda.domain.enterprise.EnterprisePost;
import kosta.mapda.domain.enterprise.EnterpriseReply;
import kosta.mapda.domain.map.Place;
import kosta.mapda.domain.map.PlacePhotoReview;
import kosta.mapda.domain.map.PlaceReview;
import kosta.mapda.domain.map.Theme;
import kosta.mapda.domain.member.InfluenceReq;
import kosta.mapda.domain.member.Member;
import kosta.mapda.domain.member.RPay;
import kosta.mapda.service.admin.AdminService;

@Controller
@RequestMapping("/admin")
public class AdminController {
	
	@Autowired
	private AdminService adminService;
	
	@RequestMapping("index")
	public void index() {
		Long memberCount = adminService.getMemberCount();
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
		List<RPay> regular = adminService.getRegularReq();
		List<Member> memberList = adminService.getRegular();
		model.addAttribute("title", "정기결제");
		model.addAttribute("content", "정기결제자 들의 목록과 신청을 관리합니다.");
		model.addAttribute("regular", regular);
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
}
