package kosta.mapda.controller.admin;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import kosta.mapda.domain.member.Member;
import kosta.mapda.service.admin.AdminService;

@Controller
@RequestMapping("/admin")
public class AdminController {
	
	@Autowired
	private AdminService adminService;
	
	@RequestMapping("/member")
	public void member(Model model) {
		List<Member> memberList = adminService.getMember();
		model.addAttribute("memberList", memberList);
	}
	
	@RequestMapping("/influencer")
	public void influencer() {
		
	}
	
	@RequestMapping("/regular_payment")
	public void regularPayment() {
		
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
