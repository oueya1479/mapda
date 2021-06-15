package kosta.mapda.service.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;

import kosta.mapda.domain.member.Member;
import kosta.mapda.domain.service.MyPoint;
import kosta.mapda.repository.MyPointRepository;
import kosta.mapda.repository.member.MemberRepository;

public class PointServiceImpl implements PointService {

	@Autowired
	private MemberRepository memberRepository;
	
	@Autowired
	private MyPointRepository myPointRepository;
	
	@Override
	public MyPoint selectMyPoint(Long memNo) {
		
		Member member = memberRepository.findById(memNo).orElse(null);
				
		return null;//myPointRepository.findbymember(member);
	}

}
