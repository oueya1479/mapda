package kosta.mapda.service.admin;

import java.util.List;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;

import kosta.mapda.domain.enterprise.Enterprise;
import kosta.mapda.domain.enterprise.EnterprisePost;
import kosta.mapda.domain.enterprise.EnterpriseReply;
import kosta.mapda.domain.map.Place;
import kosta.mapda.domain.map.PlacePhotoReview;
import kosta.mapda.domain.map.PlaceReview;
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

	Page<Place> getPlace(Pageable pageable);

	Page<EnterprisePost> getEnterprisePost(Pageable pageable);

	Page<PlacePhotoReview> getPhotoReview(Pageable pageable);

	Page<PlaceReview> getReview(Pageable pageable);

	Page<EnterpriseReply> getEnterpriseReply(Pageable pageable);

}
