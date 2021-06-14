package kosta.mapda.service.member;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;

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
	public Member login(Member member) {
		return memRepository.login(member.getMemId(), member.getMemPw());
	}

	@Override
	public int getMemberCount() {
		return 0;
//		return member.getMemberCount();
	}

	@Override
	public void updateMember(Member member) {

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
//		int count = memRepository.idcheck(memId);
		int count = 0;
		return (count == 0) ? "ok" : "fail";
	}

//	@Override
//	public List<MemberRole> selectAuthorityByUsername(String memName) {
//
//		return MemRoleReopository.selectAuthorityByUserName(username);
//	}


	@Override
	public void start(Long memNo) {
		memRepository.start(memNo);
	}
}
