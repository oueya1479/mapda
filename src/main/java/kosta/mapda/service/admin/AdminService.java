package kosta.mapda.service.admin;

import java.util.List;

import kosta.mapda.domain.member.InfluenceReq;
import kosta.mapda.domain.member.Member;
import kosta.mapda.domain.member.RPay;

public interface AdminService {

	List<Member> getMember();

	Member getOneMember(Long memNo);

	void updateMember(Member member);

	List<InfluenceReq> getInfluenceReq();

	List<Member> getInfluence();

	List<RPay> getRegularReq();

	List<Member> getRegular();

}
