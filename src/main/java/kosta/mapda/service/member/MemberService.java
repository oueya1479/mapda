package kosta.mapda.service.member;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.web.servlet.ModelAndView;

import kosta.mapda.domain.member.Member;

public interface MemberService {

	Member findMemberById(String memId);
	
	ModelAndView findMember(HttpServletRequest request);
	
//	List<String> getAddressList();
//
//	List<Member> findMemberListByAddress(String address);

	Member login(Member member);

//	int getMemberCount();

	void updateMember(Member member);

	void registerMember(Member member);

	String idcheck(String memId);
	
//	List<AuthorityVO> selectAuthorityByUsername(String username);

	
	
/**
 *  정기결제 - memPayStatus
 */
	void updatePayStatus(Long memNo);

Member getMember(Long memNo); 

}
