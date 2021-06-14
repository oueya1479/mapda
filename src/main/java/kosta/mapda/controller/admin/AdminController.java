package kosta.mapda.controller.admin;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import kosta.mapda.domain.member.InfluenceReq;
import kosta.mapda.domain.member.Member;
import kosta.mapda.domain.member.RPay;
import kosta.mapda.service.admin.AdminService;

@Controller
@RequestMapping("/admin")
public class AdminController {
	
	@Autowired
	private AdminService adminService;
	
	@RequestMapping("/member")
	public void member(Model model) {
		List<Member> memberList = adminService.getMember();
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
	public String memb(Model model, Member member) {
		System.out.println(member.getMemRegdate());
		adminService.updateMember(member);
		model.addAttribute("title", "회원 정보 수정");
		model.addAttribute("content", "회원 정보를 수정합니다.");
		model.addAttribute("member", member);
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
	public void themePost() {
		
	}
	
	@RequestMapping("/place_post")
	public void placePost() {
		
	}
	
	@RequestMapping("/enterprise_post")
	public void enterprisePost() {
		
	}
	
	@RequestMapping("/nearby_post")
	public void nearbyPost() {
		
	}
	
	@RequestMapping("/theme_reply")
	public void themeReply() {
		
	}
	
	@RequestMapping("/place_reply")
	public void placeReply() {
		
	}
	
	@RequestMapping("/enterprise_reply")
	public void enterpriseReply() {
		
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
