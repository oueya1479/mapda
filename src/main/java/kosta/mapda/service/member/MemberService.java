package kosta.mapda.service.member;

import java.util.List;

import kosta.mapda.domain.member.Member;

public interface MemberService {

	Member findMemberById(String memId);

//	List<String> getAddressList();
//
//	List<Member> findMemberListByAddress(String address);

	Member login(Member member);

	int getMemberCount();

	void updateMember(Member member);

//	void registerMember(Member member);

	String idcheck(String memId);
	
//	List<AuthorityVO> selectAuthorityByUsername(String username);

	void start(Long memNo);

}
