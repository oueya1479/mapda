package kosta.mapda.controller.member;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import kosta.mapda.domain.member.Member;
import kosta.mapda.service.member.MemberService;

@Controller
@RequestMapping("/member")
public class MemberController {

	@Autowired
	private MemberService memService;

	// 회원정보수정시 비밀번호 암호화처리를 위한 객체를 주입받는다
	@Autowired
	private BCryptPasswordEncoder passwordEncoder;
	
	//새로 추가
	@RequestMapping("/index")
	public String index() {
		return "index";
	}

	// 회원가입 폼
	@RequestMapping("/registerForm")
	public String registerForm() {
		return "/member/registerForm";
	}

	// 회원 가입하기 :: redirect 방식
	@RequestMapping("/registerMember")
	public String insertMaember(Member member) {
		System.out.println("member:" + member);
		memService.registerMember(member);
		return "main/index";

	}
	
	// 로그인 폼
	@RequestMapping("/loginForm")
	public String loginForm() {
		return "/member/loginForm";
	}

	// 회원 검색 폼
	@RequestMapping("/findForm")
	public String findIdMember() {
		return "/member/findForm";
	}

	// 특정 회원 검색하기
	@RequestMapping("/findMember")
	public ModelAndView findMember(HttpServletRequest request) {
		String memId = request.getParameter("memId");
		Member member = memService.findMemberById(memId);
		return new ModelAndView("/member/findMember_result", "member", member);
	}

	// 아이디 중복확인
	@RequestMapping("/idcheckAjax")
	@ResponseBody
	public String idCheckAjax(HttpServletRequest request) {
		return memService.idcheck(request.getParameter("id"));
	}

	@RequestMapping("/updateForm")
	public String updateForm() {
		return "member/updateForm";
	}

	//회원정보 확인
	@RequestMapping("/memInfo")
	public ModelAndView memInfo(HttpServletRequest request) {
		Member pmember = (Member) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		Member member = memService.findMemberById(pmember.getMemId());
		
		return new ModelAndView ("member/memInfo", "member", member);
	}
	
	// 회원정보 수정하기
	@RequestMapping("/updateMemberAction")
	public ModelAndView updateMemberAction(HttpServletRequest request, Member member) {//수정하려는 정보
		System.out.println("1. Member  :: " + member);
		// 회원정보 수정위해 Spring Security 세션 회원정보를 반환받는다
		Member pmember = (Member) SecurityContextHolder.getContext().getAuthentication().getPrincipal();

		System.out.println("2. Spring Security 세션 수정 전 회원정보:" + pmember);

		// 변경할 비밀번호를 암호화한다
		String encodePassword = passwordEncoder.encode(member.getMemPw());//수정하려는 비번을 암호화하는과정
		
		member.setMemPw(encodePassword);
		memService.updateMember(member);

		System.out.println("**********************************************");
		// 수정한 회원정보로 Spring Security 세션 회원정보를 업데이트한다
		pmember.setMemPw(encodePassword);
		pmember.setMemAddr(member.getMemAddr());
		pmember.setMemAccount(member.getMemAccount());
		System.out.println("3. Spring Security 세션 수정 후 회원정보:" + pmember);

		return new ModelAndView("member/update_result");
	}
	

	@RequestMapping("/pay")
	public void pay() {

	}
	/*
	@RequestMapping("/start")
	public String start() {
		Long memNo = 2L;
		memService.start(memNo);
		return "main/index";
	}*/
}
