package kosta.mapda.service.admin;

import java.util.List;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;

import kosta.mapda.domain.map.Theme;
import kosta.mapda.domain.member.InfluenceReq;
import kosta.mapda.domain.member.Member;
import kosta.mapda.domain.member.RPay;

public interface AdminService {

	Page<Member> getMember(Pageable pageable);

	Member getOneMember(Long memNo);

	void updateMember(Member member);

	List<InfluenceReq> getInfluenceReq();

	List<Member> getInfluence();

	List<RPay> getRegularReq();

	List<Member> getRegular();

	Page<Theme> getTheme(Pageable pageable);

}
