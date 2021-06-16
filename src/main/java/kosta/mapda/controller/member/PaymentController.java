package kosta.mapda.controller.member;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import kosta.mapda.service.member.MemberService;

@Controller
@RequestMapping("/payment")
public class PaymentController {
	
	@Autowired
	private MemberService memberService;
	
	@RequestMapping("iamport")
	public void iamport() {
		
	}
	
	@RequestMapping("complete")
	public String complete(Long memNo) {
	memberService.updatePayStatus(memNo);
	return "/payment/complete";
	}
	
	
	
}
