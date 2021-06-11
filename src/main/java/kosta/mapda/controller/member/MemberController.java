package kosta.mapda.controller.member;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;


import kosta.mapda.domain.member.Member;

import kosta.mapda.service.member.MemberService;

@Controller
@RequestMapping("/member")
public class MemberController {
	
	@Autowired
	private MemberService memService;
	
	@RequestMapping("/registerForm")
	public void registerForm() {
		System.out.println("registerForm...................");
		
	}

	
	@RequestMapping("/pay")
	public void pay() {
		
	}
	
	@RequestMapping("/start")
	public String start(){
		Long memNo = 2L;
		memService.start(memNo);
		return "main/index";
	}
}
