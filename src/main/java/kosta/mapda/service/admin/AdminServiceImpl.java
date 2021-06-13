package kosta.mapda.service.admin;

import java.util.List;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kosta.mapda.domain.member.Member;
import kosta.mapda.repository.admin.AdminMemberRepository;

@Service
@Transactional
public class AdminServiceImpl implements AdminService {
	
	@Autowired
	private AdminMemberRepository memberRepository;

	@Override
	public List<Member> getMember() {
		return memberRepository.findAll();
	}
}
