package kosta.mapda.service.admin;

import java.time.LocalDate;
import java.time.LocalDateTime;
import java.time.LocalTime;
import java.util.ArrayList;
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
import kosta.mapda.repository.admin.ManagementRepository;
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
	private ManagementRepository managementRepository;
	
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
		return influenceReqRepository.getReq();
	}
	
	@Override
	public List<Member> getInfluence() {
		return memberRepository.findAllByMemGrade("Influencer");
	}

	@Override
	public List<RPay> getRegularReq() {
		return rPayRepository.findAll();
	}

	@Override
	public List<Member> getRegular() {
		return memberRepository.getRegular(1);
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

	@Override
	public Long getMemberCount() {
		return memberRepository.count();
	}

	@Override
	public List<Integer> getMemberCountList() {
		List<Integer> list = new ArrayList<Integer>();
		for(int i = 0; i < 8; i++) {
			LocalDateTime startDatetime = LocalDateTime.of(LocalDate.now().minusDays(i), LocalTime.of(0,0,0));
			LocalDateTime endDatetime = LocalDateTime.of(LocalDate.now().minusDays(i),  LocalTime.of(23,59,59));
			List<Member> mList = memberRepository.getDateBetween(startDatetime, endDatetime);
			list.add(mList.size());
		}
		return list;
	}
	
	@Override
	public List<Integer> getPostCountList() {
		List<Integer> list = new ArrayList<Integer>();
		for(int i = 0; i < 8; i++) {
			LocalDateTime startDatetime = LocalDateTime.of(LocalDate.now().minusDays(i), LocalTime.of(0,0,0));
			LocalDateTime endDatetime = LocalDateTime.of(LocalDate.now().minusDays(i),  LocalTime.of(23,59,59));
			int p = placeRepository.getPlaceDateBetween(startDatetime, endDatetime);
			int t = mapRepository.getThemeDateBetween(startDatetime, endDatetime);
			int e = enterprisePostRepository.getEnterpriseDateBetween(startDatetime, endDatetime);
			list.add(p + t + e);
		}
		return list;
	}
	
	@Override
	public List<Integer> getReplyCountList() {
		List<Integer> list = new ArrayList<Integer>();
		for(int i = 0; i < 8; i++) {
			LocalDateTime startDatetime = LocalDateTime.of(LocalDate.now().minusDays(i), LocalTime.of(0,0,0));
			LocalDateTime endDatetime = LocalDateTime.of(LocalDate.now().minusDays(i),  LocalTime.of(23,59,59));
			int p = reviewRepository.getReviewDateBetween(startDatetime, endDatetime);
			int pp = photoReviewRepository.getPhotoDateBetween(startDatetime, endDatetime);
			int e = enterpriseReplyRepository.getReplyDateBetween(startDatetime, endDatetime);
			list.add(p + pp + e);
		}
		return list;
	}

	@Override
	public void levelUp(Long memNo) {
		Member member = memberRepository.findById(memNo).orElse(null);
		memberRepository.levelUp(member.getMemNo());
		influenceReqRepository.setState(member.getMemNo());
	}

	@Override
	public void levelDown(Long memNo) {
		Member member = memberRepository.findById(memNo).orElse(null);
		memberRepository.levelDown(member.getMemNo());
		influenceReqRepository.deleteRecord(member.getMemNo());		
	}

	@Override
	public void cancelRpay(Long memNo) {
		Member member = memberRepository.findById(memNo).orElse(null);
		memberRepository.cancelRpay(memNo);
	}

	@Override
	public Place getOnePlace(Long placeNo) {
		return placeRepository.findById(placeNo).orElse(null);
	}

	@Override
	public void updatePlace(Place place) {
		Place dbPlace = placeRepository.findById(place.getPlaceNo()).orElse(null);
		place.setPlaceRegdate(dbPlace.getPlaceRegdate());
		place.setMember(dbPlace.getMember());
		place.setManagement(dbPlace.getManagement());
		place.setTheme(dbPlace.getTheme());
		placeRepository.save(place);
	}

	@Override
	public Long getPostCount() {
		return placeRepository.count() + enterprisePostRepository.count() + mapRepository.count();
	}

	@Override
	public Long getReplyCount() {
		return reviewRepository.count() + photoReviewRepository.count();
	}

}

