package kosta.mapda.service.member;

//import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
//import org.springframework.security.crypto.password.PasswordEncoder;

import org.springframework.stereotype.Service;

import kosta.mapda.domain.member.Member;
//import kosta.mapda.domain.member.MemberRole;
import kosta.mapda.repository.member.MemberRepository;

@Service
//@Transactional
public class MemberServiceImpl implements MemberService {

	@Autowired
	private MemberRepository memRepository;
	
//	@Autowired
//	private MemberRole memberRole;
//	
	/*
	 * 비밀번호 암호화를 위한 객체를 주입받는다 
	 */
//	@Autowired
//	private PasswordEncoder passwordEncoder;
//	
//	@Override
//	public Member findMemberById(String memId) {
//		return null;
//	}

	@Override
	public Member login(Member member) {
		return memRepository.login(member.getMemId(), member.getMemPw());
	}

//	@Override
//	public int getMemberCount() {
//		return 0;
//	}
//
//	@Override
//	public void updateMember(Member member) {
//
//	}
//
//	@Override
//	public void registerMember(Member member) {
////		 String encodedPassword = passwordEncoder.encode(member.getPassword());
////		 member.setPassword(encodedPassword);
////		 memRepository.registerMember(member);
//	}
//
//	@Override
//	public String idcheck(String memId) {
//		// TODO Auto-generated method stub
//		return null;
//	}

}
