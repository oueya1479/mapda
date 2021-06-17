package kosta.mapda.service.admin;

import java.util.List;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;

import kosta.mapda.domain.enterprise.EnterprisePost;
import kosta.mapda.domain.enterprise.EnterpriseReply;
import kosta.mapda.domain.map.Place;
import kosta.mapda.domain.map.PlacePhotoReview;
import kosta.mapda.domain.map.PlaceReview;
import kosta.mapda.domain.map.Theme;
import kosta.mapda.domain.member.InfluenceReq;
import kosta.mapda.domain.member.Member;
import kosta.mapda.domain.member.RPay;
import kosta.mapda.repository.admin.AdminMemberRepository;
import kosta.mapda.repository.admin.InfluenceReqRepositiry;
import kosta.mapda.repository.admin.RPayRepository;
import kosta.mapda.repository.enterprise.EnterprisePostRepository;
import kosta.mapda.repository.enterprise.EnterpriseReplyRepository;
import kosta.mapda.repository.place.PlacePhotoReviewRepository;
import kosta.mapda.repository.place.PlaceRepository;
import kosta.mapda.repository.place.PlaceReviewRepository;
import kosta.mapda.repository.young.MapRepository;

@Service
@Transactional
public class AdminServiceImpl implements AdminService {
	
	@Autowired
	private AdminMemberRepository memberRepository;
	
	@Autowired
	private InfluenceReqRepositiry influenceReqRepository;
	
	@Autowired
	private RPayRepository rPayRepository;
	
	@Autowired
	private MapRepository mapRepository;
	
	@Autowired
	private PlaceRepository placeRepository;
	
	@Autowired
	private EnterprisePostRepository enterprisePostRepository;
	
	@Autowired
	private PlacePhotoReviewRepository photoReviewRepository;
	
	@Autowired
	private PlaceReviewRepository reviewRepository;
	
	@Autowired
	private EnterpriseReplyRepository enterpriseReplyRepository;

	@Override
	public Page<Member> getMember(Pageable pageable) {
		return memberRepository.findAll(pageable);
	}

	@Override
	public Member getOneMember(Long memNo) {
		return memberRepository.findById(memNo).orElse(null);
	}

	@Override
	public void updateMember(Member member) {
		Member dbMember = memberRepository.findById(member.getMemNo()).orElse(null);
		member.setMemRegdate(dbMember.getMemRegdate());
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

	@Override
	public Page<Theme> getTheme(Pageable pageable) {
		return mapRepository.findAll(pageable);
	}

	@Override
	public Page<Place> getPlace(Pageable pageable) {
		return placeRepository.findAll(pageable);
	}

	@Override
	public Page<EnterprisePost> getEnterprisePost(Pageable pageable) {
		return enterprisePostRepository.findAll(pageable);
	}

	@Override
	public Page<PlacePhotoReview> getPhotoReview(Pageable pageable) {
		return photoReviewRepository.findAll(pageable);
	}

	@Override
	public Page<PlaceReview> getReview(Pageable pageable) {
		return reviewRepository.findAll(pageable);
	}

	@Override
	public Page<EnterpriseReply> getEnterpriseReply(Pageable pageable) {
		return enterpriseReplyRepository.findAll(pageable);
	}
}
