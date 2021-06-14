package kosta.mapda.service.admin;

import java.util.List;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kosta.mapda.domain.member.InfluenceReq;
import kosta.mapda.domain.member.Member;
import kosta.mapda.domain.member.RPay;
import kosta.mapda.repository.admin.AdminMemberRepository;
import kosta.mapda.repository.admin.InfluenceReqRepositiry;
import kosta.mapda.repository.admin.RPayRepository;

@Service
@Transactional
public class AdminServiceImpl implements AdminService {
	
	@Autowired
	private AdminMemberRepository memberRepository;
	
	@Autowired
	private InfluenceReqRepositiry influenceReqRepository;
	
	@Autowired
	private RPayRepository rPayRepository;

	@Override
	public List<Member> getMember() {
		return memberRepository.findAll();
	}

	@Override
	public Member getOneMember(Long memNo) {
		return memberRepository.findById(memNo).orElse(null);
	}

	@Override
	public void updateMember(Member member) {
		memberRepository.save(member);
	}

	@Override
	public List<InfluenceReq> getInfluenceReq() {
		return influenceReqRepository.findAll();
	}
	
	@Override
	public List<Member> getInfluence() {
		return memberRepository.findAllByMemGrade("인플루언서");
	}

	@Override
	public List<RPay> getRegularReq() {
		return rPayRepository.findAll();
	}

	@Override
	public List<Member> getRegular() {
		return memberRepository.findAllByMemGrade("구독회원");
	}
}
