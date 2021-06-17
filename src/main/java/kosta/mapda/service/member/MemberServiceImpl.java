package kosta.mapda.service.member;

import javax.servlet.http.HttpServletRequest;
import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.web.servlet.ModelAndView;

import kosta.mapda.domain.member.Member;
import kosta.mapda.domain.member.MemberRole;
//import kosta.mapda.domain.member.MemberRole;
import kosta.mapda.repository.member.MemberRepository;

@Service
@Transactional
public class MemberServiceImpl implements MemberService {

	@Autowired
	private MemberRepository memRepository;

	
	
	/*
	 * 비밀번호 암호화를 위한 객체를 주입받는다
	 */
	@Autowired
	private PasswordEncoder passwordEncoder;

	@Override
	public Member findMemberById(String memId) {
		return memRepository.findMemberById(memId);
	}

	@Override
	public ModelAndView findMember(HttpServletRequest request) {
		// TODO Auto-generated method stub
		return null;
	}
	
	@Override
	public Member login(Member member) {
		return memRepository.login(member.getMemId(), member.getMemPw());
	}


	@Override
	public void updateMember(Member member) {
		memRepository.updateMember(member);
 
	}
	



	@Override
	public void registerMember(Member member) {
		// 비밀번호 암호화
		String encodedPassword = passwordEncoder.encode(member.getMemPw());
		member.setMemPw(encodedPassword);
		memRepository.save(member);

		// 권한등록
		/*
		 * AuthorityVO authority=new AuthorityVO(vo.getId(),"ROLE_MEMBER");
		 * memberDAO.registerRole(authority);
		 */
//		authoritiesDAO.insertAuthority(new AuthorityVO(vo.getId(), Constants.ROLE_MEMBER));
//		if (vo.getUserType().equals("1")) {
//			authoritiesDAO.insertAuthority(new AuthorityVO(vo.getId(), Constants.ROLE_ADMIN));
//		}
	}

	@Override
	public String idcheck(String memId) {
	 Member member = memRepository.findMemberById(memId);
		return (member == null) ? "ok" : "fail";
	}


	@Override
	public void updatePayStatus(Long memNo) {
	memRepository.updatePayStatus(memNo);

		
	}

	@Override
	public Member getMember(Long memNo) {
		return memRepository.findById(memNo).orElse(null);
	}

}
